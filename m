Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793268019;
	b=i8ui8CRQtj069875I118HDXSvz9uje2RKe/q/GEnh65Hek4L39p6/yRE4L/EJruOaOQU
	 HXAD4JQxqIhoziiuOO9E/JyB3t2scNLBd+zaC7QT9M9M/Qdno3kiW1Rz38KUvKUwTYjgB
	 Swav1p/DefCLDrwC/BaQBf5GySlEvQWGZNjlgFZqzdWzRV3MVHwAVewG+BNQPCpwhp7OS
	 O0aLHsIH3Z00gc4yyKIW02kGuC9DSaaOsC0A4WOQ+vADLVfM9hoWdSOM9zwzZD6LSTp3q
	 c4q888g/MyCKLDHx+3mVZDn/pVOd/SkfslysHcTBDuK8m3xrmG+WM/byzYQ+VzCk89A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+KsF8vc4ULWHMDhPgj0bLTj8antp0LHTyec0w+asTec=;
	b=KgXnQPih8IpdGjhLPgXEHXmTsiHb+tTtfunUiocdfbY1GLBYDzp8EHEeYe2CpYu5x5n/
	 OeFdGe0/Oj6F08N74pP5stcUs1kqmOFpgCi1xSD4hr6qzYSZdtD0yA5C0DOqyKbiyVXZJ
	 zctIHW/P6g2vI6/Vpv5NmZuAX6wM3ea6chIe1f2WMgLPOgdac4CqFiPJe4kZmiGhULb5G
	 bPyUKOU0df4WI0jUQxtuLYoaPCPX8cX4jTA2qYeBuTTkvAGggr8WSDrxzaxRUp6KpMTmB
	 JxLRG/uWydTomk9lZ+zP534m673pNtazngJA6Yjb+tIG/d1nNYsRYZGvBXne2T5IXKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ARIrWMoY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359EC60A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 359EC60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ARIrWMoY
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35829219da8so711402eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268018; cv=none;
        d=google.com; s=arc-20260327;
        b=oEbvZQPnXDP1amgvY3cwlsFWz88pokFTgsUT5XdceuT3+mF+AJ1r7RsQWji1j2ld24
         VCJQNwQBpU62AYdDPZEF2GQPTLHRNt8AxKNCRpvAgsAQRLUek5aT+NOyDYmlEOeQtfgF
         Tc/LlS4kFO1NwioO8gavfWXcasJoSV7IItkfYxGX+16FOuTbznC+FwAZiglMMhVW4698
         l7PnOFfz+kg7C4BneuYqAW+TD7ovciNYmsqwRwI6pdg345Aw3QB9/NGcUv9AUOFgh87X
         QS5tgRstzjyu8WBmLtz+VNA3gpMOcq6sYnsyAVLPNJg1+4dmKRTHPrXlfW38lTBAVuav
         mHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+KsF8vc4ULWHMDhPgj0bLTj8antp0LHTyec0w+asTec=;
        fh=rmRkJRcbao+VzTzrqvgz0G4WmHY8EkBtHCrAbL8vEXo=;
        b=aa6pDqQCkrNmM1jGm7PeOsiX9TWBME8WBn1expb/I2fdaI1RC3c1k8Bk9VvJnIoX/J
         kmRzmJumkxIpIXUBmKCLgEYQU1lOEReW9bYEYRonNR/J7dO/OFjRGPVgltXhlgqHtsK/
         YFtyr5sK3bnthWdd2ypW6U8xJUFiqsBGnTwKG7gJR97ljZMYENiqk4NcBmeXaEHrlM2h
         WQzi2ZZZgWjxaJCpdBeFG8FT5cApX+OxpURRv04/m/QdcGbrB6Vyd8FZIlR0QLZqWwRw
         KEd7JA2Mc97Ad2TO0rVon03nx03wm7Ba0pA+xsQBM8P5wIJ2iE3Jf+wcvECx+sdWnoJM
         aWWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268018; x=1793872818; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KsF8vc4ULWHMDhPgj0bLTj8antp0LHTyec0w+asTec=;
        b=ARIrWMoYuq4mUlEtGnJEbH3JHWCFIB5kUS5V8EFCUAGJviCGuN2oyTz3r202vPu/Ei
         5ex3nTKudegs0B0S9Oiwf7IC4nQzuVuSgZIfJJtZL/B1xz6LgTdnMHiGFOFAap9ett4l
         rG94afJIjwx5oKli87BbJLnVLu6YA/y2uTjF7TGlTArcLB4+KQbwL6mcL0yEf+ebpNJ/
         oI4JSlyw5lYiiFSJBWhK4uWv9YAKqpr3Xb0pY4JBqFPVtu/cIfOd7i5uoVr4IYRjz20O
         Q+oO15QAmaGvb+H7YTL2BDoScdSLeW7jbtzo4vOKv5SC48Z9nAWErtEum8qbsVBhbfBY
         c+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268018; x=1793872818;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+KsF8vc4ULWHMDhPgj0bLTj8antp0LHTyec0w+asTec=;
        b=fqkpMNTbyNubTdKOSqT5ueFZuJnh/Ne/XXgCYEjK7qALgOPEE264/TShQUrkbm+jP0
         DgdKpFup3DuEN32WF85as4iy3vVQcN+jUoeTOd9NjfzmGvGlA/r9hE0OO7DvT6xDHP9S
         QyOeQL1Ad1y2NfsiAqunM+N/OzagMxtgYI1Gy8OP52H1BKv1phwOUV1rvPRUe8MKl7rY
         xqDbnlOmjQQn4B9+AyY3WCSsYTf/lhpT6wAjOkORU5HMqbY5qjZ5Lfc8MCQzLWVMmXpO
         3IoZahIeeJCSkSPF23yvcfvy759pImn8iKobq3HW+sZ5be1xl7Sa8UoyNbtKiwFOSONE
         Czuw==
X-Forwarded-Encrypted: i=1; AKwUvBxwDmZKYghES0mJMiGeg0/6wJX8VBdyQ3xp5lsezULlXmoXUboZVIu5HED0xEnYCZz9BfemD80je6jTkbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIftSpTGpvy9Etw4Zz7r2/A9SCDXMDglUlgWgIeoDK+KkYgjWbD
	KXd6SrFfI7ZjiDyfOSMAfLABsluUc0ytXmwYRfALWyVNzhhIR2cR2ceOOzYsEsnLNqweiWN376x
	BVtG77tZB8oTl3HywIgRXbs6bwsQZA4Y=
X-Gm-Gg: AYBFou2+B5MtYYqCTkQmeDx6sOXkXnHEBEU9RYtdCzickdJqsZfieHY+ZKHTi8eyR/a
	c4AocGr6eQwXMP+rCUGYntuBOs/58oTiAdpC1zQSmxycp4d+OeVW2qUfCRwhbkhB4QMvWZOV8mB
	FwKOyrDh6fdEt+LrhJlcbFFD6t3W4EmyhEjqA9eb0mzphE0u/syTmzN/R0yCyl0BEcA/Uo0nj4v
	SbqStMkkfdpAjUwpaz2iyyQyCAAQTFVlHZTFf4R257tyVnyHd9BPB3axHxopuhS4NifgejRDuwA
	zrAAKZIYBsfT2yg4654Aw4hrXDw0q2XmLpuo+xKWJD9Znc0faUTbs5/RBuK/KrZcDByZ6zU/yWS
	9TuuwYbngVwyzXbJeN39notawF6HgBGyI52M+onCVT/Baz2HmvxA1T2lG9pVspP/vxw1uSspurD
	GRR81Eozi566oVaeD98B12O8CIbB9hzY4Nz9vrzEMZAKfF1w==
X-Received: by 2002:a05:7300:d58a:b0:35a:3b98:b428 with SMTP id
 5a478bee46e88-36a2ff7d91fmr3444661eec.12.1793268018117; Thu, 29 Oct 2026
 03:00:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-btrfs-zoned-active-zone-leak-v1-0-777dd01ff914@gmail.com>
In-Reply-To: <20261029-btrfs-zoned-active-zone-leak-v1-0-777dd01ff914@gmail.com>
From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair@gmail.com>
Date: Thu, 29 Oct 2026 15:00:05 +0500
X-Gm-Features: AclHuK83BlPPV7_H23TeJ2xs5ky4kyB8aLO0AL_l-vZHvRN09V9scQgST6v9LKo
Message-ID: <CAEmTpZHvmyPWMFztcG4MT4jszwjXYuwogJKrJgvx2vxESjhnKg@mail.gmail.com>
Subject: Re: [PATCH 0/2] btrfs: zoned: fix silent data loss from leaked active
 zone reservation
To: socketpair@gmail.com
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Naohiro Aota <naohiro.aota@wdc.com>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johannes Thumshirn <johannes.thumshirn@wdc.com>
Content-Type: text/plain; charset="UTF-8"

Adding Johannes, as this overlaps with his recent zoned work.

A few notes on how this series relates to what is in btrfs for-next and
on the list:

- The series is based on master, but it applies cleanly to btrfs
  for-next as of today (c393445c12fc), only with line offsets.

- 0be761ecf1a9 ("btrfs: zoned: only change active zone counter on
  successful (de)activation") in for-next does not cover the leak fixed
  by patch 1: the block group removed by relocation gets its active bit
  cleared by the zone reset in btrfs_relocate_chunk_finish(), but
  reserved_active_zones is only given back in call_zone_finish(), which
  never runs for it.

- Patch 2 makes btrfs_zone_finish_one_bg() the normal path again when
  buffered writeback runs out of active zones with a negative
  reservation (cow_file_range() -> btrfs_reserve_extent() ->
  find_free_extent() -> btrfs_zone_finish_one_bg()). That is the path
  of the deadlock fixed by "btrfs: zoned: don't wait for ordered extents
  in do_zone_finish()" (30c6d31da683 in for-next), so for stable patch 2
  should go together with that one.

- Patch 1 and "[PATCH v6 21/25] btrfs: zoned: reuse block groups emptied
  by reclaim as relocation target" both change
  btrfs_relocate_chunk_finish(). The conflict is trivial, and the two
  fit together: btrfs_zoned_can_reuse_bg() requires the block group not
  to be active, which patch 1 makes sure of, so the
  btrfs_zone_finish_relocated() call has to stay before the reuse check.

I can resend the series on top of for-next, or on top of the generic/747
series, if that makes it easier to take.

Thanks,
Mark
