Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F1B44F566
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791046961; cv=none; b=AyJv8/ZxosF3dnz8jNsrgrcZjeopm5PwxE0bPuUB0PmUH5rW7+I9jp2+30OdFYwxtiG/pcQmqgbUT1PH2nnDPRbaDJeNkZkWPdP0/y8hbYMcPoYZJb+2dCHsrNqTPY4681sflzbIMmB4jMzMYkUtjEHuPx79dewfPAKghn/S53Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791046961; c=relaxed/simple;
	bh=kLoV5W1FHSMCnQXJR94hBtpM1Iv97CLc5Gk+9EMFE3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ptz+nD+iDPrKwv5fJmPlboQ8196Y4eHvMFJ6CVL8i1GCVoEla9yU+7cnz6mDx6WUf03IIUg6Eu69cs7pkDZykNsNVUbI3tXC6vZsgbpi+qaqN3zZNLRPb0dnjzDCuIkZoXr6Rcazs6KhOWt+01DXyPIKCufXM48PTqJ6S5hG1tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=oDxinKuH; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="oDxinKuH"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 817013F1C7
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791046950;
	bh=kLoV5W1FHSMCnQXJR94hBtpM1Iv97CLc5Gk+9EMFE3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type;
	b=oDxinKuHjSwh31QA9ULq54Z0Ka3ICwf6Mm+tdVnkM2VCtxgbrTphDAaxTtj3bHKvh
	 78EgtWchmjblnTJmdW79O/x1M9TQ3JIbaHQH0vWmn4/rs8QPf19aJqM0y9HWHeLCFG
	 FCxDNLRmZFMyy+WcJMGl5Ex528DbAArYEXbX3TTAp3GuTRH6jQq6zlPomY8wFBKo7/
	 m4YNaGXO93hcs2fw4DtuZLeuPeCbAsYYUjAc/ILCXgnb+kGlkBOluIna7w2H+I3rEp
	 QVWSEhhGFiXJlsUZtU3ot3pjM0eWFL6rsAS6/vbSbqYTbXVwUhBtpBqdh+tCO8VYTM
	 ciIqkrOECxtRbx2ylA9aQfiM24gdlrdjS9YkmVOAO7h1GwHTPEssGD1TLBCTL7OVJR
	 YO9R1Fm08M3lNhY78i/ajFG3yAv+q7OyG1222rlbJ9XBa8I7LnSgZyWsf6KlHeAZVX
	 MiL5VN7es0oakI1vvnA3RKdzjCjC/Q7VS96sAMqomj6RUzs+SCWUYT1gbmr3cQj/Rp
	 OpgmeZOeIThCglW9H9qOTtacdLCct0I1HwkSFwB3e05sJ8EG0j3pq6LpKQRMGJwC5W
	 5oRfiii9TvMy47pN5PsZqMLXpOIGnQFRJyVdMlBdVsUSKqnQ5uIL2o+kC/slooAlKF
	 Qa/d0vr/A+83MXyjwjwRYyrM=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49febef74e3so6559135e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791046950; x=1791651750;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLoV5W1FHSMCnQXJR94hBtpM1Iv97CLc5Gk+9EMFE3c=;
        b=OYek+g7ri5FO7/f9tQrKvNyuQDqXQIcxove7dsbVCLkB+gnPQNyXYSjN+BWnk7t0bf
         IKVJp8tS/txWEAX4xh7UkAx70K7ueqcrL+tXC7JTam+ESfJm3fbxyjhG780LY6bJRP2J
         KDmCae0fr/j57DM9L6e3LRZKlgML6T5Jj3pKHulVM09gMvZJZLOl1ibZO+A2dafIMUIz
         Jq4DITHvbuP2kq//x+5uyVQ48fNnMPN5xMlFSQxW+eKJ+y6vvsmrw6Su/nxlaGcZDq+t
         D5NRgGuh8/ssLWCSyglg6ACv8XCx0X+yiV/yCLnECYHR7Ek/sVxlNwY9RsNPeL5mERhL
         ynfA==
X-Forwarded-Encrypted: i=1; AKwUvBwf7vRlOQNszh3AhzcFO4kIrSs5xVW9mXMBayJKWwfR+QR6yZ0Xnmf6YmNw/lSNGV27SAGfaH7qO0MokHc=@vger.kernel.org
X-Gm-Message-State: AFuF++lK2addp9fgrEU6VoDPFyMkPm6mh99Zaeprf/66Fla8IcCMMBHJ
	pW2yFVqlKbycmidY8JsqavCI1ij/RK1CCBMU90iBwBVzPs0LH/HCXKBReOjMsUcZ63u2e0EPyoo
	gqpteSuQ8Av69CBtqX+eUtbIWBB9qE6mOpC76LUTtf0o++wCCRuzRMlfJzMrNEVhP3duXKNYM59
	mHMXeGyg==
X-Gm-Gg: AYBFou1bbiGTZiKQkllEGVYKORbyjloN/y/rqeHvWAKadsnup3fBAD0lstQXsLL23yE
	SdiAcI//GNz64HMK9dNaMUsH97UtLNSsuhbc5Pa47tJB9F9hV76VsZwfoVY92LQmUp82JUrK5Pm
	SZ2OZFxJVf9/d5trV2Hd8Kwv2ulnN0r3/44YTvCEajcgbum9ySTUVG7XL0TyIF4ZYbP/M2txBG9
	i9xf0I62UiDKbThbh/MneBH7bLIeH43Re+EY8pC17Iw0mb2TQQ8Ubz3cIkLdqBwN6ktysQ0yd4I
	Hlgn34vu33ykyo8Vx9Yx8rICxYstTscqFWfPTuVX0vfsihcC5R+J0Q5g0/XjMediuz4iu57zc7I
	po56Lrnw=
X-Received: by 2002:a05:600c:3e19:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a027534b98mr106170515e9.3.1791046950083;
        Sat, 03 Oct 2026 10:02:30 -0700 (PDT)
X-Received: by 2002:a05:600c:3e19:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-4a027534b98mr106170055e9.3.1791046949625;
        Sat, 03 Oct 2026 10:02:29 -0700 (PDT)
Received: from px13 ([2a06:5902:822:4600:184c:5422:d333:cf3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02752aeb3sm192763715e9.0.2026.10.03.10.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:02:29 -0700 (PDT)
Date: Sat, 3 Oct 2026 18:02:27 +0100
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jason Miu <jasonmiu@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-mm@kvack.org
Subject: [BUG] KHO handover hangs when memmap reserves PMEM
Message-ID: <asE0R_f2r2TL-3Sy@px13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I am reporting a regression in KHO handover.

In the most recent Ubuntu 26.10 beta mini-ISO releases (2026-09-18 onwards),
the first kernel reserves RAM for the downloaded ISO with a memmap directive
such as memmap=<size>!4G, then kexecs a second kernel. On affected kernels, the
first kernel reaches "kexec_core: Starting new kernel", but the second kernel
produces no further output and QEMU spins at 100% CPU. On unaffected kernels,
the second kernel starts and finds /dev/pmem0 with the expected "Persistent
Memory (legacy)" range in /proc/iomem.

A source bisect identified 3f2ad90060f6 ("kho: adopt radix tree for preserved
memory tracking") as the first bad commit; reverting it at the bisected
revision restored the handover. The regression appears related to KHO metadata
being accessed after the receiving kernel's memmap directive changes how the
metadata's physical range is mapped.

#regzbot introduced: 3f2ad90060f6

I have an AI-generated candidate fix that changes 22 files. I have not attached
or published it: although the AI did extensive verification on both x64 and
arm64, I cannot review or explain the complete change, so I am not submitting
it as a fix. If one of you thinks an unreviewed candidate would be useful for
further analysis, please let me know.
