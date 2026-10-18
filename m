Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD01392C2E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792356729; cv=none; b=Hvgj5II22W2RhUDSsQJfdXfrEtgvGWCDQZPIm3en/KEEtNalI40diuOmF7e8lH7/B4Mutb7ghbKRBeh2IcMzEg3f4Ywmux0e2HJJSqNDsAIkfi7SAFe5UtzhnHcBxt63xKc6RTMoyPxGzVZXCyF9JYJWqZbWyjHYVH31ZUTeVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792356729; c=relaxed/simple;
	bh=wMHBvDevb1HH83ISn4ILYpsOlM3EIIsW4bpsFjH6lrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ep6/LZpN81ZuThtd+k556E+gXM8tkJx7uQ8MCWMFudmnQ5/Vi6UWyUuiz/Q5df+j/jgK9MaAsU77/umIPA/c0zTmBQ/qj10VpHqidzpgFf4LIkgRAMzsS1bO4dMdmJ+ulm/ItF/ZS15RUPmU8rd44Es6XUbAPbclhzZLUzQp+jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFTLadVH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFTLadVH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso5277045e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792356726; x=1792961526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ms4tyV1sL6nNdfngDRnkwbO5sD+oKmpI75kMudnVvyk=;
        b=hFTLadVHMCnwXenpidFM+pmbJumzuIap7cS2jE2kHGuwZpRR4VTXYAJaqr4U0yCZAd
         1PQiuE6dVcJtyLQxefoQbiS/cCIoasSAitsEmx/GqI5JQqozDjkjBMp5KeG5iJyLhhCJ
         H7rtWa0yLfPEK2H9EXmsS82KKrV4MFwXDvOCdrkRiHHFnrqZzIB+quQC0k5tnc6+Bwgt
         I5ogEuL4eU9QHtj9THgV+QZdtpyavme2adPOpYfI5yNh76egL7K4Lqw3PmbFQe3yV/0I
         Uq9M5CHn2jSWzwVU/qPeNyPIXHfqcgctQ7g+DhdYOZtb3tBZ0YrZ0l6GoROzhd2dyPYd
         7YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792356726; x=1792961526;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ms4tyV1sL6nNdfngDRnkwbO5sD+oKmpI75kMudnVvyk=;
        b=rDcgfQaMawNisFf71aMGoUByBjmbkQnzx4gFK5l7ah2cdzdOhFLMfLoFHdGGKNw7Tu
         sq7f732Ja6mSZXWfC55BVkGtPhFrUR0y242gOuK20Hy9EvvSAyNAfxgIIsIjwPKoNHq/
         +VxlcE53XnxJQ74CBIiKPCW2Kg3WZat96MG+pPecMMcsXbLTNZRjIWGvMujHFOm3/UhZ
         GggWPNSozPsogvii9K2rXN2oeo6hTcWlMYRu8U+30lcTZgBrci0Ui+CvTo7PzOHN5yF3
         okVTFML1TTx7ts1J0floJbEC6m10+/eVJQtwCow8M6eeNeVaMK13Eqa2yAZc7ZHBAw4V
         NBqA==
X-Forwarded-Encrypted: i=1; AKwUvBy0ORZ+Yx/qZ3hTZV+HP6p9x0Bz/R0AVq7hvWX2MnHAx45J32uTSvrI+a0WLwzikYpEK2q1Hi1GYkAj4fM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq+2NjgErp5dDcMA/qYpaU1NpKXonFo5J6OL2WVmr77Xxj8Qo1
	ZA/UNENsqVEdL9Nwh2YpNuUvOGMDz5r9NJ+aKRJ9xjf4mRP8umMMzfGr
X-Gm-Gg: AYBFou0yBpVb2GPZCl/wJUfcVupWxWDYR1J+fqpLBGAev/8vG19kDXgF8oBAPUkAPvd
	FvmPIZ9QE0IF3XB0EW50bACrIQHkQGUiibQMOWPv6IMEKUwqEGpZkjp47aZ2niSMB1cPXgcRUIj
	Lgf6Ot/qE77dLbx+rcf/+GpvEj8K/y+b6AKpDmnGy/CXcbsuhCM+28/kzFikIlm9ahzb6VyYubn
	fdu30t9oHBuFl5cVxnRyK+cdwBFClNkIWkX7C06DP14E7BYD886JMqhZsMZcbx1UggEwZd5FPCo
	8qqhwUHV3XGGFRBFcGo1iUHeYdBKvdj7KOSFQswehkta2ieHPUwkxPp72HZI3mGMMd8yoZhi+4X
	KL1vtwaYUFtWMoSo/jDphyfu2neeyHNwJH38AzMurwaD+8qsRQMt7+o6SivIZrf0+yA4KcuQsrb
	7GbqD6Pn8UU3fK3MaLiqJQncG7ySCVmhgzrVSrMeAWjj7iCe8f/8qZft/NVyzeDOXB6eqo6d2lz
	w==
X-Received: by 2002:a05:600c:3b11:b0:4a1:9661:14b7 with SMTP id 5b1f17b1804b1-4a1d761202cmr112714575e9.32.1792356726210;
        Sun, 18 Oct 2026 13:52:06 -0700 (PDT)
Received: from CachyOS ([176.88.124.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d28b698asm223954145e9.11.2026.10.18.13.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:52:05 -0700 (PDT)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
To: linux@roeck-us.net,
	mtosatti@redhat.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	xzhangjr@gmail.com,
	=?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <ycistak@gmail.com>
Subject: Re: [PATCH] hwmon: (coretemp) Fix handling of isolated SMT siblings
Date: Sun, 18 Oct 2026 23:51:33 +0300
Message-ID: <20261018205140.34668-1-ycistak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016-codex-coretemp-housekeeping-v1-1-96618c5676b2@gmail.com>
References: <20261016-codex-coretemp-housekeeping-v1-1-96618c5676b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tested this on an Intel Core i7-14700F (hybrid, 8 P-cores with SMT
and 12 E-cores) running 7.2.9-2-cachyos, booted with nohz_full=2.
cpu2 and cpu3 are SMT siblings with core_id 4, i.e. temp6.

Without the patch, temp6 is missing: the hwmon device has 20 labels
instead of 21 (the package plus 20 cores).

With the patch applied to the hwmon-next version of coretemp.c and
loaded as a module:

  - temp6_label is "Core 4" and temp6_input reads 31000.
  - Offlining cpu3 removes temp6 instead of moving it to the isolated
    cpu2. Onlining cpu3 brings temp6 back.

This reply was drafted with the help of an LLM; the tests were run by
me on the machine above.

Tested-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>
