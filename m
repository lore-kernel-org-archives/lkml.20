Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A39351AFEE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683515; cv=none; b=ixLATu2nmyeCn5DkZw5AmIrxLYa69hNsX4pTlwsKJupQop/bqZOui5lO0FWjC3MjYSwVcWktVZON4pQ2lRvo/KGnCXE4xej33Vl5LS+p1fsrUsVHGDCEM5hIFZvXLKK3kGkxFOLz0mAdeWB3iDFQK9njl/Juli9EXibvO1Tz5XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683515; c=relaxed/simple;
	bh=KntYN4ndTQH5l1/HIOS4Adw7wO7ACguA5tW5kFwgFNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n4zTWxLjJmYNz0Bqupd7jFrU4b1CSIaqcHYxPE+98u4MzKpu9R0nZ6hkD3PQJn/DNiRSaDxZXwR57mVcyUU3/ZVfgXuPMYulcFzrsKcX6AgqgaXsQ9UCdPBKg+1GWCwSgV59U4balJyyxFS/ezOtegx2b6e6LgxIfRq6FVj7sRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvgghnYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvgghnYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF9B1F000FF;
	Tue, 29 Sep 2026 12:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790683513;
	bh=THtsNkRJ/NcaM6w0GNjl2FsrvI5svm9cNWayyGscPx0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EvgghnYz0X51gt45Hi1yZzimOwh78YhqDesY27d0CmS3jp1aTGD5Iw8QLOdLCIMrd
	 7AzK8WAuvM8W/lIqL7jmZpFUm2QSSKhPqc4sgTq/2zsSEXbz/36wmSfWdHc5J2VAwy
	 y+VBEG7msBM2yIFUCezCF7rf+dzrhyfJDc3BJU25fcz5E37goTBlrF0pAGws1cydRY
	 x85fZqqLbNGZ6rYOe4tx3Piv0+Kjq7fcE5peIXhTdpgMMcmsAdgD7j1/uWNDDGR7H8
	 zc9IGIZrDtpBWxQdj41XuNtz5ygBa7MgvcwM5rLT/wMT/ncut2TxU2P43FiFEL1MYT
	 fm1sjjWAHNBhA==
From: Thomas Gleixner <tglx@kernel.org>
To: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
Subject: Re: [PATCH] timekeeping: publish suspend_timing_needed with release
 semantics
In-Reply-To: <20260921-mb-timekeeping-v1-1-282f1f4121ed@vt.edu>
References: <20260921-mb-timekeeping-v1-1-282f1f4121ed@vt.edu>
Date: Tue, 29 Sep 2026 14:05:07 +0200
Message-ID: <87tsn8i7po.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Sep 21 2026 at 21:23, Jaidev Shastri via wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
>
> timekeeping_suspend() sets suspend_timing_needed with a plain store
> after it has read the persistent clock. timekeeping_rtc_skipresume()
> reads it with a plain load on behalf of the RTC class during resume.

> Set it with smp_store_release() and read it with smp_load_acquire().
>
> Found with MBCheck, a static herd7-based memory consistency checker.

And what exactly is this release/acquire solving?

1) timekeeping_suspend()
        suspend_timing_needed = true
   ...

2) system suspends

3) system resumes

4) timekeeping_resume()
        if (inject_sleeptime)
            suspend_timing_needed = false

5) system continues to resume

6) timekeeping_rtc_skipresume()

The store in #1 is completely uninteresting because suspend/resume is a big
pile of memory barriers so there is _ZERO_ chance that #6 cannot observe
the store in #1.

The more interesting case would be the conditional store in #4 which in
a pretty far fetched theory could lead to the case that
timekeeping_rtc_skipresume() would not observe it.

But if you actually look at the sequence which is between #4 and #6 this
theory becomes a myth.

Please analyze your tool findings properly before blindly claiming that
the tool actually found something problematic.

Thanks,

        tglx
