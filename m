Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698922;
	b=hrboLrBJVy8zDSU7LqcLnNTQwMM8KWKPhwIpEiGEmZQJiGoCpqjWZxIWy0zfPHvQcOWB
	 4hxpqph08Exw761k7YrVpGYK2pHDELHAE51etab3JsP+YCCRyxpMhh/5564mJ4lpRxG/U
	 Iz0EcQfrBLs2jYPM4/WLnxcANdeRzOWwToinGHAvXcZxyVmHJTCU1+U7SPoDMoANLTDzT
	 LFdZKayWdu7KZ8D2CiM0ss4OSeXPeCUxj0CyJmBaXQMjrPLZ7sd1uOTy8a6YTauPlePzi
	 4hS6afiFLLvEkxeRA+0L6Fhnyl0PFefe1xZGnT344xGOqaV1egS/OQljr4AfJ07VtlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
	b=QSl/+Ot505bW91IjpkGpbrJ+UnXta7aayEnklSd83KXuV3gnZwdvC5DZsvuCOtk1ZgxN
	 /GAzaFUl/x2xpUZg3dfcOmzQQFpusqMYFp+s9tE867sDfmU+Hu20yj71hSJ2E1LTvAS9x
	 fSpINuB/C2Q5+UU6XueFxDP9R+/rj5aEdizQczKiIo85wQ440yN4MxE6nZOPpqH+LLqW8
	 ZGiDMR+xp0rfFWuDjrFluSXomBWhtGcTAOKsEhh0uFjhe38zx5mppq38NGUSrBCB0YYjw
	 +IWuR4wXJNYjpVjTSB0rZA7jc6fhicab9TSwAwh8WFHbKqJycWlPyVhh4UJYZTPWsNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XXlGzFaV;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D30606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D30606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XXlGzFaV
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so86677e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698920; x=1793303720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
        b=XXlGzFaVyYoP9OdV2Trb4gGb/5VHk3kGNDwHOuyx8hbNCvPaz03c45DX19OEfH05FO
         cno4yykPUZ6r1Lqx1OeU3hVe38Q2sCPNnE5AVeh8SQWSY6IqMlOOaEdERbK7tOZTGCrx
         y+/tbDobOSeSgPsUsTpEL7Bqmb80LfRHMGVxbyHP7tcwfjcwBsh+7grXSTEZRLLBElx0
         VT/qAZNkaZl80MT96PdYpo8s14sJJcpwlYgK5VUHqQXPUh4nH25tehH+JhSPgyUDh8p8
         l/ftTF0sIV8jp0WR7VFy6m1qDPn4RHL3wApfsTUNcBvjZQbNx1UjBEDVaH6deYtJh9Yi
         A5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698920; x=1793303720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
        b=GjF0c1v0JjnPZeAt4Z0HqA+zbmL7HeYNsuwQmupv4QhJs/W2XyYOVGipK2yVi/7XWD
         MJzV/eoFaCwHYsHeBnIFDlcG0jsffzHQOaAp7PfvRZrFQMx2vkP1Hn+/ZYb9tjrdjRfc
         LQs22R6NpX3qT3QGyuG5I5N7Ty6H07HGmWnIkGRP+RWzDl3KO8OqE1KgQhFlDi+Acdul
         1TW5z3LKP2XxM8Ysy8sAcNPfcXvKKHpA9krFfWqNnGBc9QPVMERWF83/eAEv/ULg+lS9
         24n1+cOVIOmuxkHH01hUnHnHPhESBz11LfduJ8Qjp7RE/m2VrRNacquBo8dfGvHh2su3
         Dghw==
X-Forwarded-Encrypted: i=1; AKwUvByDWOHK/MEVt153gONSFgJktFqLb9A6OKuVKy5XbdVVtiOiWqcx2ohat5+XIF6zwN985URCFGT3dyvPiuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLulyLH0PchDEC4iu1AvnZqLEc/7+ayrZbxVCZX2FUP+vPTwvps
	00uojE6R2WRHqkEvHhQoDQAtr0Mofnd1/xeJA5SCV7Vw2kkCJiSc5vZn
X-Gm-Gg: AYBFou1bUJODdg9VPs5XkG49c2ZWYHbXGv8tZR/aChT7UmIRRabOajHhyWaispkmp4i
	DMJchJxiC313KBHTHY+O7X+B8lbv2cB+bZJn783H52ut99sFcHWC+47SHjymC6Cdggmt6zU0Tmr
	4pKEV/2KitW2uGZE0Jm45b6HiHiOpdi/e1fyaqWBuQPos5oL3fK3hns98syckXYoorRwuSGriHB
	uL3mkxV4UqglVXv1WPxtx6kiKxJcnrCLaCy2N3DOawW7Cel52IwuCotqE22ZiKz8eYDnhSTFMJ5
	iUIDGbee9XRB4RpayUqymv1JynvbyNJ4aHbfv/IPvdXNBB9RaERH71WzBbQp5BgXxL3RrJUP4EI
	xrdjb8Lo+TJXMN5oqdmE3R1t4Gl+TTtz9mwPZIf3Xxm4pX4wgWzLuiJCdsAEvMUMcY3+DsbWyG6
	b2ujoBsl1G4VJfngfMhTYprMJ88Z8GVDXlDxTDetPUA1A/720sAOTW7hRbCKOUeJt/iKO1I7ErE
	aE48LNSh0pqNirQ0VgIpIMTFEGrzukMxyS+cJbFwzfHPDlENCIVynZndKFhCIoMM8EJL1Fj26Ab
	xWaLoJNnFoYZxfaLJg==
X-Received: by 2002:a05:6512:a83:b0:5bf:af5a:cf26 with SMTP id 2adb3069b0e04-5bfb06cbcbfmr4297e87.2.1792698919896;
        Thu, 22 Oct 2026 12:55:19 -0700 (PDT)
Received: from ik5070.localdomain (82-131-69-225.ip.elisa.ee. [82.131.69.225])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5bfb027d0a2sm30503e87.36.2026.10.22.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:55:18 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Thu, 22 Oct 2026 22:54:26 +0300
Message-ID: <20261022195447.2007440-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022211952.7293f8b6@posteo.net>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog> <20261022190203.1998156-1-indrek.kruusa@gmail.com> <20261022211952.7293f8b6@posteo.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Wilken,

I observed something like a 4.5x slowdown - around 12 us per take/free on
the C906: the loop with the lock runs at ~14.7 us/iteration, the same loop
without it at ~3.3 us.

So yes, the effect is material.

Greetings,
Indrek
