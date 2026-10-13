Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4373F4DDA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886912; cv=pass; b=DbpYaglKKOSVZXYhfWfFaKVmb9hgPY1EblKPVRPGa9zamFZPxUX3D5wARcshvBt+GU9BzdqaBmIrfjjin526wZLw6/0y/ggCtX9jgPpybro1C9NYphZ6PD70EFDu6GKIoqg0fTnjPDAy+lyaq1oUdvtpWm0KYnqE8RFgppKp3l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886912; c=relaxed/simple;
	bh=kw30L9v26HRhBA7ngRHFl25NBDemgZ3UJ42WGs6r17k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjPSjCqXug2JdXpD460cBoz28xXS6kqtyh71ge4JdAnyYo3+NlQwYNvc2l95kXVPPSAXChuBxkYHapkCCc8a8UOQHvK9NbdAUQPCJOKl3BLVl65Akl2owTmbVKcte8qopMfjE7qUpkH3s4rCNGgIFh5kmmAQzIDotWZy+H6m0d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMb/PDFr; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMb/PDFr"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso1851230e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791886909; cv=none;
        d=google.com; s=arc-20260327;
        b=IHl7OjQIIMj0fBLT76HGcVCwdRP/EB6kBJ9lreDpTFNneqCoH5KUN9/iy8dqEiZu/G
         1p/rcS6TiW9u8VVyAtMCXVPZFao+2EPgsX8w488s0O/fLTH2h2rrwhaYH+y5PK40osEA
         BsKBphct33Ctrw8v8wWALgrOmVi8S5eKBt8bFMfGSKe+rBKwKbbP2v6yxex6gu7knF7M
         0/loGFhn3LFx92aFdnxJuaNEsRc6SNbBRwrEUAnkhBZ6A0vBaNTXhbxDo6GhOZo7HAno
         CKI1Mx7MQnYwbt6fEzA66C38JwVgTBmEMbD8Ul2wAy8spwZeGhhO9D/RMNBUWQ/KbZu6
         TAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kw30L9v26HRhBA7ngRHFl25NBDemgZ3UJ42WGs6r17k=;
        fh=9BM+tQ66d9qxCE450TgoTWX89gDu3xCoO6Prl4gfCOo=;
        b=JNSk/fLKtfZizboOi10fdNKb8z769XhJMN5fUnVB8rmvbGdDWinOO+fKCB4iQmOrHn
         ntqS+G/VoiPvzhD/y58j4a+CySyM0IhpRhocCQhxUKxXGg48EEA64wx4Zu9/MVLsUST6
         YRRNd2ub9cO7yoR6SLF626qEIcaiGR31gpSaK5oIBDMQszud1n2xufYWtlbI6c09/hTp
         yQA/omZaGRKYjfZU9GiHgQpeD0P/ZLPtvPLnQsXJE/QTw+H/lJX/hbGLtVRuCrld5867
         PRKfCIviVHDxFfVAztw8+SLdE2mT+avSa7pkNXw75AyHQLXMFq1/7v6WbSZmkrNRb+EH
         /Rmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886909; x=1792491709; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kw30L9v26HRhBA7ngRHFl25NBDemgZ3UJ42WGs6r17k=;
        b=GMb/PDFrWoHJRy9pBHdTZo0/lj8Cg472bjve20axVR+DmIqGmLXL/J5FQr2lH0o+sk
         5nydQS0hHGSFh2Fixw7CV3fCrG9ZVkJGzEqLYfvS/LIdZ8DGZrSMGnRB3V0e5dQrb0tj
         GnKR8QJs/8IJhdGLSXgNcOPq/1dAUtyr/t//GhSGYxA62aGyTxtptqRuQaQizH6AhrAr
         kjX3vMYK3hx2QiF0x8qlGFTRSmXLHANPyVFQfkxR1QLP1iU/z1cZMX6f53hd6grXJFm4
         q7Pm2e2riBVfBSIWE8dgwbwNViO+K3MY2IsiG7XqfI2KUVZgdArq5OMNNUp5FmvsI6ky
         nUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886909; x=1792491709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kw30L9v26HRhBA7ngRHFl25NBDemgZ3UJ42WGs6r17k=;
        b=rSitaFiRII5HOleOCV8yH9BaZbHi0RljTZJ3vHO4S+cLrNAnLc4CJ+tz0MhFy4/uY/
         A2nsycibaGNrR90i5Pen7xJ/idxRPCGVEwIQVncpIDpgsfFr7aJ1ixtuJQy8zv8MLH4f
         oXGMhVIOS/M7BFMKDvk2bTrK1OsTNeKP7h0FFG9OgyrLZi6HlDZN1V7kA4zlqZZRV7MM
         rf1y3iQL/PuoqMnAT2a85RKXRhwyCXICRtL4W0YL53mP/j+p5cmLLWZNi1FcwvDpLccP
         FrSYB05owtuzYmnTBmGPzE+6EG7YSvVxHJBKWDQ26LB5CieqnsfABJGRjiFbwJ1PwlkH
         E69g==
X-Forwarded-Encrypted: i=1; AKwUvBzMBa3KnyST1ydHnehNb3Z+IzRPyOQc7D72yr38wZ5plwpjfnWNQHl9C3s/LS31lFvC9VhQbeqElhu/POg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI554v6CQv89HDV6dFlDpIaLE2419luMuep+WX05uBjsU9f5Klf
	DFvVVhAyd1HjuZb803tx8M6fz5RQ2AzTP74NUBrEll1hrt8nDX7LcpHbPioD1nPjPiO7V/DZ4UH
	eFgK81hGbD23X+lqlxNKeRyB5CequEcE=
X-Gm-Gg: AYBFou1lhTgVOWhdVY6KIUferOdYHOJpntqwQBA8sgbRQo0nlkYwBBR+ARE5xoJHGO8
	EjprzPr0FwLsHqEZsnEn67LCyBQUIJTsNKT+/Jrwn7+GYzCSHNiQD4uXB9fjQkCkKXO0pSOiQuR
	3GICxbaJ0Jq3YtKk46dwH6GX9b7VIySQEwNubomSw9w4bSZ90hV4Bc/CEiarSia4oxiHlEBc4C0
	C4QWi5JHAclLpuuD+LVTTEpYRuIHxxP7JjKeUNhU2nZjqSdXJ/zrH94eHp0jzlk06FMfYlBTNfP
	uuChc4jMQx46/UT9v/XLHswmh0yhAcn7Ckg07f4E1/vUah42DYUOGAEtHW0e9CgJy+6ApK4qmsN
	5wETVmr7ZeGk=
X-Received: by 2002:a05:6512:1302:b0:5b7:593c:244a with SMTP id
 2adb3069b0e04-5bcde6cb1b4mr4214429e87.44.1791886909214; Tue, 13 Oct 2026
 03:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012011707.3378-2-sigefriedhyy@gmail.com> <179185709784.434549.17899680533305071231@kernel.org>
In-Reply-To: <179185709784.434549.17899680533305071231@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 13 Oct 2026 19:21:38 +0900
X-Gm-Features: AclHuK9g3jw3wKxZcfUo-DjkbmbxBzgQ-U86o5Pm5ByOHON1wyGjQ9qc2fnRD5A
Message-ID: <CA+7S2v+LjXscrjWYE6kTu0uBR8co7G4xqXaHq30Za32rbg5FDg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/6] netlink: specs: rt-addr: fix the type of target-netnsid
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Should this have a Fixes: tag?

Already discussed in previous thread.
