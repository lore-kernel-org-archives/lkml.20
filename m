Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563459;
	b=ISawzu5mE9briX23qL+pzWD9j9/IHvnA8g6Mlu8VcEPdgLnnEBC7gdBxE7zQ/H8SiqTr
	 rGmSVZztE2X0+OLXa5j7Fo0unhbFK1uG7NXcLdONcr4s/xH/bVeK+8vkPLVdjXiZXvMsW
	 YuuHsiVId2OWVp09LgxFec4wOMLiK3eg0S+ZacvjNyTGwn5TADbWFhcjlGT3RjqGO9wMm
	 tH1CtmOS75QJoVP4WKk6ob4QFgQdtfX7ZuGY7veMkNcnSidN3I+6v3A7HUJyOLQZHgYyH
	 I780DZLu1SRPW3YJglu3zkfNizOZUtNiqOrDfeAlvoYqCUbbIv0FIx3JM4hm7fiTkXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D6XUWb0GjEEWdU6R5sZ+fFb8cLsQeyN87HkVdMPgxsA=;
	b=EISADojVF/vN2utw8nsrohUaP2VlscLJpF1IYd+o8ty34bxbWrjJHBSIx/mGEFdKiV/T
	 U+QTXzFGbhikJ1XkAWv8In4LKcs5MrPsOFaIXWoP5NhKLYYBFkKfblBRFbq4usVziiz1b
	 tzKc/bsglPROjFomdIHqrWJKjOcnBzNULiATeKMhgUTcf6LwRcoV38/zBRg/9tYKcuzeb
	 lRakkM2xJC+SqjI0yj37QiHSbLmESo4h+I4C557klMlQSxQ+DNaCi5O0CoR54E4Zt6IRE
	 LoueHlDEksg5D796q+lzNyF625SgzPrEeSfycYN6+IdQstWBo3MWQGBOKLgLzFW/bIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WxZ3Rjm5;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E34606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E34606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WxZ3Rjm5
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so253688f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792563456; x=1793168256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6XUWb0GjEEWdU6R5sZ+fFb8cLsQeyN87HkVdMPgxsA=;
        b=WxZ3Rjm5RUkWN83CbketVLkNBPVsdvWlFk+CwaCBibZzVBsgUPTduWqewuQbOArKtz
         9vE6VCziyX0+lo8lF83RuZNlelYea6lTsdzv8SWeLNGqs3MkfzRQMqkCgFRrbCBsdtxP
         bzpn+MxtJ7FR7LnzGa0p5E5fvzzOvF4M/f78cyxXuQkpyn8+Zhzc2auAeSjQPBTTUFJw
         DSFg8Hjqyx9ZPLhLzOgjxzTjbrqmlW2SrDBbsBSlNGbAUfkeq+c02ZFXkTPhsEYpBM3I
         nmehw2sTs7Uc2xNX8CwRWXw5l+FZ5jLB0AQdQKp4YwW49s3UAUs2xsZTdUIm+RbgMEza
         +rJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563456; x=1793168256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6XUWb0GjEEWdU6R5sZ+fFb8cLsQeyN87HkVdMPgxsA=;
        b=Z3IwuhetfooOyUlqMCBUs7Itd37Z2WJjWnBc1YVdhBQVe0G66rj/ELTc+ngCmjC7vP
         djo6xz1/LgKAmEcV5b6UmaxX9KRGbJxDu1Q8PvwM08Pmcu/IdJqVUiQT4FAkI9lUt+tq
         moVDnMWbC5noECSTbt5M0pf27Am2MyOjujBsaGiPYZBVs/cYuYWVOQJontnl+UpNjIgX
         fIKJ99CS6oxHf6ofZbGdRwudscLcLiGsgXyZfNmexYnOorUrjmAl2u0mikvsLkAcgkrt
         r2kMoEgAsko3kbGbRJWpSOf6CIpuhhwNuiSy05+D4nkcSxpGd92rCsIm4hm1ENH1kYyn
         5vEA==
X-Forwarded-Encrypted: i=1; AKwUvBwv+oSEf4X36r9gKBK6Gypdn67K89biU7C7/cTbjRIxMoHVlQCHUe9UfVeXEsgtvo4iGAspwp1rcCON0xQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEl3evX4gbG51pyJm2P8YsCNNOssnvQg8e84prO9GiNVLfC80F
	nB/RBeffS/UKNi3G4czGuHEDaSspZRCTTMhzEWZ1Khjmjc83UIruu29q
X-Gm-Gg: AYBFou0DhX41s5wUzbtcFpoaQ4M4eTIPwOJKgzkhNfKP2VOWVjWVnbhFfP3Pza6qorD
	OOw2QyFbU3ict+C4DTlCh2rab8dM2Lb8vj1sGXeetOcZJZAcJfIPPaSyNFHF4Gh6JxhR7y31jSb
	nDfXepX4bJhVE7hAT0Kozr+uMopYGVqJPvvV4saI2ILnPZj/OIx3Y+1SoYKq8+vBIA9ACvk5Rel
	S8ATg/ov5q9nEcNyivaVTq1+OLiGFN2Ttu2KhdzyCJq/taAdLXbHX80alCmWhMmntqinjlnyYpV
	4hcQV9gchAmShAOPnd6Ra5+ZtazpjKpo8UVR/qo5jAdvWpSrbODIiuVK88ipVIZvOU5fq93EHvf
	tvBx/B0dmKbTTycrq/shhjt0NYBsn2TfgaHQoEbV5ulFey3gq74yWzh1O9COo0TD76s6s4YfwAM
	UNV0pJVVVyfxBNaTTLhDtIXVXg9R3jgENFfWe9hLgwmZ2SxCuAL7isE/OgMGxvgzynw3/1vW+xw
	BKHsqIBHH7bkzQy+rjvBgzbINT2EB5uW/p3txt2ROvR9pvXR4LyOlZpZOXUBw==
X-Received: by 2002:a05:6000:2086:b0:48e:b62:d133 with SMTP id ffacd0b85a97d-48e2642cf54mr1849014f8f.5.1792563456309;
        Tue, 20 Oct 2026 23:17:36 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm3663876f8f.42.2026.10.20.23.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:17:35 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Krystian Kaniewski <krystianmkaniewski@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	aichao@kylinos.cn,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot@lists.linux.dev,
	Neill Kapron <nkapron@google.com>,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] usb: gadget: u_serial: pin ports while TTYs are installed
Date: Wed, 21 Oct 2026 08:17:34 +0200
Message-ID: <20261021061734.3972101-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6941beb7-8cae-4cc5-ba07-e1c8a8753fe1@mail.kernel.org>
References: 
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

Hi Krystian,

I sent a narrower fix for the same problem [1]. This patch also covers
the two holes Sashiko found in mine, so I will withdraw it.

Tested in QEMU with dummy_hcd on usb-next with KASAN and lockdep, and on
a Colibri VF50 on 7.2-rc1, with delays injected into gs_open() and
gs_close(). Without the patch, freeing the line during a close gives a
use-after-free, and a close after a failed open a NULL deref. With it
there are no reports, also over 40 add/remove cycles against
concurrent opens.

Tested-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Two notes:

1. Since Johan's 8df07fe93573 ("tty: fix saved termios reset race"),
   registration no longer frees the saved termios for u_serial, so that
   reason in the commit message is out of date. Publishing the port
   after registration is still right.

2. The NULL checks in gs_open() and gs_close() cannot trigger, since
   gs_install() fails first. The gs_close() one is what Brian Ellis' v4
   [2] adds, and this patch makes that one unnecessary.

[1] https://lore.kernel.org/linux-usb/20261019085855.3259716-1-mehmet.fide@gmail.com/
[2] https://lore.kernel.org/linux-usb/20261013-u_serial-gs-close-null-v4-1-9ea038501994@gotenna.com/

Thanks,
Mehmet
