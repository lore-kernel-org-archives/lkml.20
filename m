Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF8F4D956D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772095; cv=none; b=IraXaGrl/uLX6z3a4SdG463GkTTiNgvemi6VOEtGLCJrreEjPZuxkcQeDcRSmitSC+ZRZPlWVmCAxwQh4xpnrtY9rkkX2BnsJKWeOamtoQmRM2wRvBHNzu0ed0d4la72f+vYU2GWBTcXGo6i9vjlZ/miSXSrrJexTUpz0dGSmig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772095; c=relaxed/simple;
	bh=cWdf3kvIYBFYH3vLZU4lHNkaMIGr5G642iUfSPcH/E4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IKaq1KxGZ9bWExwwTtgMRSkD2PFX8EPuJp9YM08a8GhSn58VHCe5Lf19w2v6l3vR0G+DfipCjylb2WHOrWASX0OliqJpB6XFIgQAXMdNzvQBHSx1nNL+QWhyhupT/ZPhl8YEjjwuiGsdSBscnfm8Ejtur5nA5ZeBtw5hfKlDBkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBj5/Xlp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBj5/Xlp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1834F1F000FF;
	Wed, 30 Sep 2026 12:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790772082;
	bh=Hju/Ee916x+UwhXiqOqSZuTLOwRA+eft5aqne35lVm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SBj5/XlpNNZDHTtW1nEgW0usxVyf2NFRHAobJ+ztkT23nQrhTkNBdfBDMf6ElW9af
	 tsEbQcNM7FBi/Myg/6m+IHsDOpgq9HUQuXQeoUmc3tBYs9Y988iu71rUJocFo0vFEP
	 YsFhtxjOjCSVq3v3f82y4JtVjZ8/Jf8tYOiXPSfRA5Nkyb6XmLy5VhSqiCFf/wtWp0
	 quOmbEL6OJrBDgiovUm7fDCKRbRPl6eof1V1TDA+cklH3QIgKbwQ8/l8hAxfM6n5X4
	 1BieiV/3xiMyXV/0QwH4mVFz/ghTlhlTmZbrlaqmKJmp6vp81nLJFA7CBw92wS028r
	 HsJiNqqMNSugw==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, thomas.weissschuh@linutronix.de
Cc: luto@kernel.org, vincenzo.frascino@arm.com,
 david.laight.linux@gmail.com, linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com
Subject: Re: [PATCH v5 0/4] vdso: Keep the CLOCK_AUX base at full precision
In-Reply-To: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
References: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
Date: Wed, 30 Sep 2026 14:41:12 +0200
Message-ID: <874if6j4if.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 16 2026 at 10:32, Zhan Xusheng wrote:
> Testing on x86-64: checkpatch --strict, gcc W=1 and make LLVM=1 are all
> clean.  Built and booted with kernel/configs/x86_debug.config plus
> panic_on_warn=1; no warning fired and the log holds no lockdep or
> debug-object complaint.  A guest with an aux clock enabled saw no vDSO
> reading ahead of a later ktime_get_aux() in 100000 samples at each of
> offset 0, +5.123456789 and a negative offs_aux.
>
> The generated code in vsyscall.o, vdso64 and vdso32 is byte-identical to
> v4, so the reflowed lines changed nothing.

I've removed the series from tip timers/vdso due to the build fails
which were reported by 0-day.

Please address them and repost an updated series.

Thanks,

        tgl
