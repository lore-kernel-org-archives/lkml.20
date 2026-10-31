Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437124;
	b=Z/51k71EXN2drPhOlIOzp8NoDaxAkN3En88u9gSpkBE5PrzNL3OPabDQDcZuVCqInBq6
	 YTIMgIOWrCGeMUJEoBocK2IHper0F5Bqsjg3gldBdBzvJ+z4ODUky/oFKa1WagRaYd3xj
	 7nT9cGJPxeqA4e1tJPx3kpDn3+LAoKO8TbyI6DKnS55TrY/Sg0aLxVBTvgh7LQDILpv5K
	 AoNmWJCuXSLgxzviTqP/MVjK/H7x7AN0Esjf6Qyub2DcEnzg6flLw180HafFnKLPV8Q44
	 VRJSrTC3d5KmB8qov0RosH66m6b/T2TlzK7NiATJ/5pFcjN3cye5noKS+czQWTmnB2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tz/unDvmUIAP361qcoBIRc2mzL7WeB7bGyJhoQbUhsQ=;
	b=bTqN+LHYnuaIyhvgy8KIEQkk69gX0vzSazXiuZUPiURP9ft3uvWO3ih24bhADI8XCbWJ
	 H5uwaFgH0556gWJsGVsCuhOltqWY7FOkfx05jbFgnphGG1ajB6gZNOEkghU8Ie7G5Eq92
	 9VqanX+IYma+DqcfOlNICPqqTRFjRb2wYTtw0G02EQyL3PyD8LbgZuEQHxJgp9e6+nchI
	 daMluWiBAm3sn8c5R53b6diy+adWtd7dDfMsBGwg4kDb8J4k75rEF1IlmSfQZ2OmjwtQJ
	 qLnZKbQrDaY+TyHuHReI+0BhTvLV9hRJQqhQmgn32qOUcALjBhtIdn8gPYSzALdw4mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hw404mTc;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69031606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69031606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hw404mTc
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso946462a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793437124; x=1794041924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz/unDvmUIAP361qcoBIRc2mzL7WeB7bGyJhoQbUhsQ=;
        b=Hw404mTc2MmmCOgLt/LfvHS23csGEPGuUGOCRsxPSp31bTOk7WeC4cudoS3MhaT1kR
         nsXDgxdfbZzL2vC+owWkx8HgcQqHitwbxVA1/EhOGWYTH5JNDo8/WqcqNFrY04IrQXqG
         +wa7eAwZXSOlt+N4cs4aNsnlUna0ouSvrcWUbW2njhnrQH4dyp/IRM13nKHZva21vR0H
         zYYgpsSEBwsSKF2q3df7JiZ3b3T7oBMtQNgpXTElLpIR6TGZYtfhRdtDAYw7bNQLic2C
         PyiAsXMypruVLFCum+pZA8rg3gJJbDsGqoSR0d0s0h4ExrLktaxdTtq3dyC4OALI4ZRt
         kvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437124; x=1794041924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tz/unDvmUIAP361qcoBIRc2mzL7WeB7bGyJhoQbUhsQ=;
        b=TCAIjoiN4FYnz26pRRKtUbCAmgQbfP9goWdPofGz60s7d26bQIDKzTZDbh34jFdOGu
         YP6vIo06tMA+XmQMlbmhYIEGjAv14YINBKuTu0Ui2E8byzUdHBo9N3XHz3xkh/5aNL+0
         iG7CK/dnFBk3WJk2tK7C+WBZ6H9cDZvAOptEVyOlPFLkQ7m1RmefYvIcqA36XozJVS+a
         GVMGtwg7pLxkjUwpuhjzL4mUMPaB6eIburTeJzKwJRGETsQdIq19sTisVGSAyTliz9YV
         HijpIaIb6uTmpIECy/SAO5ql5IIwOXhRQvAP2ZjqYpQw022O3Uzhk4y/sY6/JhRW7Y19
         VblQ==
X-Forwarded-Encrypted: i=1; AKwUvBy31je2D0wnuLkXJPSxhFUWz860t6R0Vi0Yi7IywvsBJBZjhmnY4TOox1SWTExFO7X1IpxVYeR01qn0gZ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7NsVn/EZVTrPe08CnXLGEEo7v4/DSlgV8nrxSx2hvoWc7/p/m
	i1bgASC74yGUK2dMIotDvKrmCCdsAtcCCj91X+GuROhYHzpLR7LnkD+Q
X-Gm-Gg: AYBFou0VfymztUgwruk50whD/NJirVH7oqqHInuC8wqWFyNm4WZh64u54OGVxwTzRrf
	hlb4Tj9QqQj0dmcFohUE+R1tOMYj1zWwT9xMJqGsN9Y+RO+BZVGFS4qzOU2OvugYBKOwWtq1p0/
	bMlGpHuBu2rhFdC8LatHWihtq9N4Xdp4LN9FSksEcVQMrgMUAbpWtoCQMzF8m+IBCdy1Owq1oXP
	tyk63jgYvgjXrFREdtXhfypP0uyOP0TySkR7xiCYeby8djEb4pmb1j5WBjUM2gb0r1J3LLfMWhB
	sTKF9X/VB1a1Ir1N1eNJr/1tzBgzJzoB7BwPulKStVxgEJuAZ3x7xakrHAAS0z6Z3AqbLCdiOG7
	609FL0ZEgRK+IaeVMZvwE2UPQaO8pSuP70X2ZVGqDz9DngRbVutlEDr4w/TNz9KD/MvXHMmNd+q
	1aQE22cJyo9vieJe54tF9hJ2xcCJIr0nEa2gykibfB7a2B4cs8QxO0A3IfNSy1M/KnVufhgfy++
	LozzfiqZhRGibpk3pzzHPXkwU2WbG3r8JRoe+gFhcJSlphRMBgmvX/IuXj/EEVUeb8i3OMX8kGr
	m/LZ0Svo1Eg7jyUv0P4h5RLZMKAN8aGkxUvwkT3YzzlVQ2KUyQdgCiagPR+F6WO91LZxRC3y0Ns
	tt63FH5y057UAGhrS5uj98IPmyDsfm6P/KBug+miD2hvIVQpHgvSDKvoTAxBsAklZTs7aVggX2k
	q52mgUK+OXZGmqOPL9l3oy2Q5s
X-Received: by 2002:a17:90b:4c85:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3ae89574db4mr3528996a91.1.1793437123597;
        Sat, 31 Oct 2026 01:58:43 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84580a0esm6880513a91.8.2026.10.31.01.58.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 01:58:42 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sim: fix the configfs lockup racing with mkdir/rmdir
Date: Sat, 31 Oct 2026 18:49:43 +1000
Message-ID: <20261031084943.23107-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMRc=MfuDQ9=bPYsxeEiRaLzC0Q+hVxjTov_JEGv_hsARM3U7g@mail.gmail.com>
References: <20261026060049.60599-1-yuz08559@gmail.com> <20261027085653.90471-1-yuz08559@gmail.com> <CAMRc=MfuDQ9=bPYsxeEiRaLzC0Q+hVxjTov_JEGv_hsARM3U7g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 28, 2026 at 03:07:55AM -0700, Bartosz Golaszewski wrote:
> Is this in any way linked to your other patch[1] for gpio-sim? If so, and if
> this one is in response to sashiko reviews, please indicate it by keeping the
> series versioning, even if you changed the approach, otherwise, I can't know
> if the other one should be dropped or not?

Yes, v2 replaces [1], please drop it. Sashiko was right that v1 still
raced with mkdir/rmdir (it depended on the entries after dropping
dev->lock), so I redid the fix and changed the subject, but forgot to
put a changelog under the ---. Sorry about that.

> Maybe:
> 		num += list_count_nodes(&bank->line_list)

Done in v3, with the full history under the ---.

Thanks,
Yu
