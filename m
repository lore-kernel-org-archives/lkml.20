Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54C4CC26A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769083; cv=none; b=heBirNfQ2fcC7VmfTOSSvnCP35rfOSXWrZ8L6ATfmm1rtY02BCqvK639hBjqLIc3yZyl3TUfyCuoRSwelyi0uidmweQJWFTLaqXhDxrs5U6dAeccru3hFV51+WG+983axaOeC2SzAWpgHVBr77d4briFbAoyD7owRsPneErZlF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769083; c=relaxed/simple;
	bh=I8/hLFvp+4rY4bmtJJoZKXtd5wuy/MyydoTfZLg4T+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q+/VT1dY+thPj1EhI6KbaA1/7Gt5L+/vfVs1GSIKa1OD0Yvuu+aA5mAt6i88EiNBSEMWY11OtT4k5NxItZWcY2zq7JkZVuhMASkzJS4u012JRKEMZkWYaw5nBV2NnNW2zmka5f850BC91giriKMxO5xIHv4UelBSsIBS4m38uRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8lqNkvu; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8lqNkvu"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a01ba12198so2453025e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790769081; x=1791373881; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8/hLFvp+4rY4bmtJJoZKXtd5wuy/MyydoTfZLg4T+w=;
        b=L8lqNkvupMWKfSOke9lO3AHzhBUFGtHkS687drvE+pwtGiCvEDMwd/m+cgJMitGM0A
         Y+JhYBLBXMbcoVWgFF0uCaOhqoY8FjkOPWtYe/FD2IgmQG1EMA5oj36u+6ET5/KJBuXg
         tzJ31/OEUwd3tIKXxkIYhRivbrwWkBgIqDq4a1NsDN8FhtVSdc2Y96SFCdX73NVfWeiF
         i89TNrCiOJf3vMkv+gG2QgiwRa3n5NszHq+ZNyvSsO57doJ5V+ayARAMU67WkexeLrlt
         diWoa5ZFRVF88LrcDH5LsdOlTMupmiyem2ip6BxxezpBQ3RzA960QHeusf1nzZgk261Y
         HbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769081; x=1791373881;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8/hLFvp+4rY4bmtJJoZKXtd5wuy/MyydoTfZLg4T+w=;
        b=ZVN1Sqn/z4PQ6h/+s0AWsv0bW/wNsy1MBO2R0ST6IJM2TWxeqKxEqGyYkBWgQXIbFX
         kaxIajvlW3E6Fi/T6IxF1tABo13tgs4TW2vkRCDm6twm57Kjc2ZvBPcvATplrj+eAaBf
         n3uYir51Xmx3WRQGYS4V+T8WOWtW5UlTnX7VtA1K5v4z3uZ96IY6cNUhaSyfUB7YKLuS
         IANs2NRi+Vy36EoqPhjem5q9IVuO5W39ay6TngdpoMIlpBBA96XEtV2XOwMkSH6io9Me
         zIXMJ27fxGoONCCcbBVfDzsOq3llis8yGt5pO0vnOq150pvSSNLl7oPgnCSbC12yBI5M
         ETtQ==
X-Forwarded-Encrypted: i=1; AKwUvBys1ofNLfy4OXOSSoj0rkk7SC3OXbgzXGP2xvwmpW9SgXlLbWd8+jZaicn0l3UAmTLqzKP0Cb+ATTmcJy8=@vger.kernel.org
X-Gm-Message-State: AFuF++nbhwDqdvF2cYF5diINToLKJ6o8gabQ1Q2KKE1b0xbAvbT5iq2L
	IC3Wm9Wcs6O2j1mol51OM40wqmOEbK6j1xiOFbN6etCGI8OTXCXX0OVR/QxWcm2HKfHF0FkYF7k
	/emm3Nt7+o+9Dzg==
X-Received: from wmpr18.prod.google.com ([2002:a05:600c:3212:b0:49e:6583:68ec])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82c4:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-4a01b188e38mr21977855e9.4.1790769079600;
 Wed, 30 Sep 2026 04:51:19 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:50:41 +0000
In-Reply-To: <arwGoJF3PMV7llAK@gpd4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929161730.185271-1-jpiecuch@google.com> <20260929161730.185271-2-jpiecuch@google.com>
 <arwGoJF3PMV7llAK@gpd4>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930115044.337291-3-jpiecuch@google.com>
Subject: Re: [PATCH 1/3] selftests/sched_ext: Add a test for ops.dequeue() on
 remote local DSQ moves
From: Kuba Piecuch <jpiecuch@google.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2026 at 08:42:40PM +0200, Andrea Righi wrote:
> We can probably fold the this into PATCH 3.

Yes, Tejun asked for the same. In v2, the test and its Makefile entry are
a single patch that comes after the fix.

Thanks,
Kuba
