Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399959;
	b=vvSx0DRmR+n9C9mI9uCl/ow+hmOh+lCV/gonAvKw2L+8E/XCMqu3LavQl7GyiXK0YRhV
	 IJXJ4iaqqYtTTjA2+UXXl56y+l5gA14/e95dA7aUId8eTjGOuzkqDzV4oVt2Exm6kw93l
	 01Oasi//Ah+5McB57W8MTLSvJWoVfSg/u/xKXMNTfGSVx+21FP5P6ijl6nM193CeuRaxr
	 JImdUSHsKVXaahEnEhi8YTZfqWv2qb2Hzk3AWyD2sZT+UA+8qjuhkivwVvAIJIJUr1Ml2
	 Zi8jhM3+lNOJmvPfySLrNkPNfuDMGR7lF7GsLdoj4J5NwpxZCnpsAU1woVgaARlSosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v6qCUK/k525EVdn9LPhwOUX31G8ImRO+TNKVLJQDtUk=;
	b=1/K/mwebgJVkB1QEB/nap6X6HKg9sMGLG34S7ueJvLaqylx1snRrv3AdBsOTOABCLWpR
	 0bcEhLalm4Oxj1bByqycqN/GQmsoEhr/v49z/TAm5suUkc3Y1gnQVc7ugbsINdon6ZJo6
	 F6niO+JYrGU8LB8jclixtazrIj9RI+svkexLbaMdgoPJmLakhcuApB0fbKmMg9DPwOAyy
	 SWGIjsq8SnfeblZ7l6YcQoSMp4NPK5MRZSX3W3AGZoMsFTmSKRKOHYNJIlNiaLfia13aI
	 v6ZnQFQrLmkb+MkI/nJlAFFGGw7tl6uOimGiyyiDFYLoqMNiZo9HIugB4IJdC0luywQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6tEMsDu;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E5E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6tEMsDu
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b3a332105bso13777187b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399958; x=1795004758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6qCUK/k525EVdn9LPhwOUX31G8ImRO+TNKVLJQDtUk=;
        b=D6tEMsDuL9H5dXd+RgjPO6GsrzA3eIu2X2p/sFcDTjAt0vwEKSYO6ZpmKbp7v3oTiL
         vrCjDO9NP21mOoDBXj4o0n3fzntBGY4iM48Qq9hO79swc3d/HE/wBDvM0wJRvtnxHasp
         VVLLLa1oB3sgUi8YQMrqYMmcB4/1KOcJqWURMp8fZQn/dmQ+5beJeAfi87sS5gsFeHXN
         Rg7gbKjhdZsi0gmOE5RYFRCLhGgeV+HHzvPI8tZJuQJaXs6KxViFfINLHkL0FFjNOJ6o
         hKsrm7fdyZhYlwM00c+53fVDA90P+Eg2ZwJWa2UfqCZU1WYA3P9CEptoe33rC/sIxf63
         Cx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399958; x=1795004758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v6qCUK/k525EVdn9LPhwOUX31G8ImRO+TNKVLJQDtUk=;
        b=qXL85jXVMmDpk0hCs6JSgLWo1AphEDMs6OOraavyWlOZfpB0mqeMIUQHNFXxKHQIjt
         5UcKURtHNvjA/GmaTW20dI58tTIPgknpqL8tmI1huDej0/G3bpOwBfUrOvt7lGmHDnHs
         MZ3/fGs+NSPcfkOb1qHnnRs8Sc0z0vUg7vM7JHkABXImUO7klM/NcOUAk6CTAxzT8r3i
         uogxDBG9+z2W/HNsbZuagUx4MTuRDlVe1844x9/hf9iy8LiMZbyEbCBp/xCcr58jec8c
         Xwu7XNEGkO2MaYf79BIn3ZgcH+eiacKBsRbbkiIg9yfW4dGWx2N5N41hjRHvkd5xElK6
         a6mA==
X-Forwarded-Encrypted: i=1; AL+hErH0XigHK1tQorMqQwcI8iMesSGalrlU3YNJIlm1H8Ng/zdm9B9NPw1GIGvYGA1n1FDONbQFNTjF1NC3uSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n3E16dHrRC0SWa0Ae8z2jmKVCpwwad0VCgHsLzwJriNHmzpIb
	ooPNsrxUTuVMUE9wK9qlI6/ulj408VbdLCprKRTAEA0NlC4htCeQTqaa
X-Gm-Gg: AYBFou3PlRN9JgD2oFcxpH/XoxksU1Jxz5NVdVzbRb2DsEB2fSxXZ7VgojbRow98OP+
	Yu8H8c3BTzTDjGVsJ+QCfKHAXObTBQnWB8SG7JG8stISuXv2yVMj4XrthMwly7mo7lZp2at4PaY
	Ku/hEEcENiJyk5iBKY/SSLl/Fs6jEdhFqXKQ/Uo33JzJnY0x/nmH1+Iq3XpUGnfYx57r+616eP7
	rTQ2+tgZ1XQ5Ti49y4zSy5b7DEowZbaJMvdtiML+0DhRn2hBIh3+mk/wXl2J9wUYyzB3il779vW
	/kE2f89EIJ47RTUPTmX+XQIQ2xMb2YWxmjoWQt6WyYXbqU7RCREsJChDuduuH68bxwJHvnhtgsE
	pi4x7fPIUqrjx+N3s/eWi9iCvW5Y+jVkJyU4BT1gdhz/tcs+asavhlebYGAx7VKEn2uaNsohdKd
	q+ynGt9SciSKrykLQQ6baHE7TA9/ebPHfQCu7cHlCte2YJ6T1XYC+bBh0Pgczb1VoX049k/r+xf
	0VJK539Q1CtD/c8kOIAcSxiBcW7CN8Dh+X71Wkj5yeOk7BrQXNEtMKwYZeEP22ekBcuj3/Pejdx
	ijo41JNzikQl8jbNlQwRyHXY+siDaO7NhDoeQ9GSy3yPZJYSVj5EJHxIfl0C4KU+zmiAhUOeyCd
	JQ+X8n1O0
X-Received: by 2002:a05:690c:ec3:b0:88b:6ad8:48cc with SMTP id 00721157ae682-8b3a757869bmr21103107b3.16.1794399958528;
        Wed, 11 Nov 2026 04:25:58 -0800 (PST)
Received: from fedora ([187.120.157.132])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39340e374sm42996037b3.28.2026.11.11.04.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:25:58 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: timo.joannin@gmail.com
Cc: axboe@kernel.dk,
	bvanassche@acm.org,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com,
	trintaeoitogc@gmail.com
Subject: Re: [PATCH] nbd: fix circular lock dependency
Date: Wed, 11 Nov 2026 09:25:45 -0300
Message-ID: <20261111122545.225934-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261111112921.306969-1-timo.joannin@gmail.com>
References: <20261111112921.306969-1-timo.joannin@gmail.com>
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

Timo Joannin <timo.joannin@gmail.com> wrote:
> > Moving nbd_get_socket() makes this patch much larger than necessary,
> > which makes reviewing and backporting it harder. Adding a single
> > nbd_reclassify_socket(sock) call in nbd_genl_reconnect_sock_cb() right
> > after the nbd_get_socket() call is sufficient. 
> 
> Hi Guilherme and Bart,
> 
> Thanks for working on this! I'm currently fixing a possible deadlock
> in wg_ratelimiter_uninit 
> (Reported-by: syzbot+72fceb8393e04ce876d9@syzkaller.appspotmail.com)
> involving cpu_hotplug_lock and slab_mutex.
> 
> My one syzbot test failed because of this lockdep
> false positive that this patch addresses. I applied Bart's suggested 1-line
> fix locally, and will see if it resolves the false positive.
> I will be submitting my cpu_hotplug_lock fix separately.
> I am looking forward to see your v2!
> 
Cool, thanks
