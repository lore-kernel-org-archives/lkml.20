Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011608;
	b=zyhRa9QF4r5zHmV5c+82Q5oN1MMzAudd7DBs7L7y2wzVvoCHHDl2rG4nI8tly+va0Bd+
	 Wa/oKo3AqDYZJ8mhZD8z+sE/eCVygfVCzNC4DmBOrkEqIDvrmO6OCDXx0t8dRwRdtEtzI
	 nGnX18jjbXs8OoHge85tl9q/p3IPrJSjjZ98gCw0aT/ElBLmaui7OeAwpGufLNutbLU9H
	 MD6FrenZoqpdrQTw7w2DDOe2ZWcKUHSxKuxMvgY+Chzw0Dg7jbdCDTVhhMG9eBRzdgb4W
	 4gdBy7iIYV7Z7YYt5OZtU/GDECNiR0KtWH+yf7k5AYBvrwALJhSWXHscXC9TOPqn9UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011608;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=E3RVJFr6ZUPogzBkgGP2loWx7cvpSKnyKS/nkizj98k=;
	b=EfMilh+E6VwgYZUsRu0pWieVxpDApS+oHlHAFCS/zrrpSN/KcEfHRc8x9HPO++U169Zx
	 st2pGAGlFN6KsuFQG1TOEyK3mn8Jd+wnbMK7Nf5gwzJO12D7+GTaZCcTTVsxqZiRBSBQe
	 IjI53GKwrLvgMIpGHMyyoqQ6UozL5jvnW1rTZi7L84jgtp7T7Fppl+mprqG/vRp+ZXVlM
	 HSKH0Cm/GMmJCc1cyjQoZn/bxuEIL+RUrBFyQpIOfLErmsP12dg3j3WzpWpofhViK1uGR
	 o07v+NYc84jFa66ssBdQ1UqTf3kSsos1FzXS+xsGgkAnloySM6owT3+dg7A1WeKusEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O5K6U3Yk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=soOtYlgZ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19DF606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E19DF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O5K6U3Yk;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=soOtYlgZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E3RVJFr6ZUPogzBkgGP2loWx7cvpSKnyKS/nkizj98k=;
	b=O5K6U3YknfjGidM7jM6CHGgT3dvTMBRHP6se8UGqSFmiQKX2DUTEy/D5wlgYRBuskFtNwA
	SL6gezn2grCqBe8flVY7sBI9QRYtnrGiHzVeXUr9Avma7grPsVUqeIb+RxcFzTxrTboqr0
	HvwApzw+Ya0nI9vjs/d3Gorya68KuGM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-phepRbWSOZaNKXYZYJOFhQ-1; Fri, 06 Nov 2026 19:33:25 -0500
X-MC-Unique: phepRbWSOZaNKXYZYJOFhQ-1
X-Mimecast-MFC-AGG-ID: phepRbWSOZaNKXYZYJOFhQ_1794011605
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso224293985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011605; x=1794616405; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E3RVJFr6ZUPogzBkgGP2loWx7cvpSKnyKS/nkizj98k=;
        b=soOtYlgZ+5sIaQiZeYLk5mhJZFYPziogcL7Ik04PnfQmHozSM2TGjFlvlhFpKZbgHn
         bke9lCZlhF1bBfg4x5Bx4DruKpoZSZQFc2zWFrq9JFHYilEPXZkYoCZuJ8fOtat7wnQb
         hunowa171VMwmV08tx2kWgRt13Wl+TJ+16kiEBudTSHXie1yvRnHTMeepREtSd9+bcB0
         1Tw/A9mtJHdGKO/v+uJ1F//ATEwE9cbeEGH2YlEku9T4T3MbmQtW4NHvgxv1QMCrZs1P
         bVGkZR3p53HEUzDfUCDcij5Qm2bdb61coFnvFVypn2mJ/ogw+HsnCZHWb0SwqtrUWREI
         uA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011605; x=1794616405;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3RVJFr6ZUPogzBkgGP2loWx7cvpSKnyKS/nkizj98k=;
        b=vpS266et+isGi3ueIAiLFxPqmPO5K7tmUe1WmuBdBz42LVY3BVPdnzXHetiUDO91i9
         gIxS8PcreDSj+hoXCr68U6I22NBoJzjlknZxQ+2/upS4CHsmKFE5KCcqP6UnzNpBDgft
         qlZ8Z+u829GNEX1ee/u5AnxeQ0LK0JycbRD9O1gFFIMuS+qeNskcw7+PAiFqhVxREzD0
         uEW9+NMdZY6Ac4Pa6QVfCeDbJefoaawxaQWuRcEeGNH5Z0J3ibY4eARole99dIzwI7Rv
         cyMU3Pe7KvB2NTkQB2nRYldoNP2HXXNjNZaRTnxKPYOsBrFYMNB/PPwZuGK7UhU1oY1N
         0ndw==
X-Forwarded-Encrypted: i=1; AKwUvBxXSw5VY8aMSbvd7Xibqy+SpaFHkzEpgU9rpA98riY9YgfAEWAWzBZlabvn8YfzaYRcvEwA/yvncjuFWR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uq7Nm2ULLqVNSZ6lIOetgOSeEtljzRftbjAhKtzKrv/YdclWc
	ATsA8BVjnjlUokLqUp8geELY36fUtjRGzUjlqvbIUAr1FuT+Z3kVG1IsDCZC0E6YInC6pMmwDNa
	RQPI61ErmjCdyPx34hfwqtF8BBxzkm1nblw358DQFQH2Wht64XW1WAUeOKS64Tv/Orw==
X-Gm-Gg: AYBFou1Fo1EhcaP7MvNa2JrmZCWX4HVFwSXG4GEneoSpypWZeeV+lmCG98agGJ1tx3N
	rnJHLss0skwfvD7BWjeNeC8QCxwp4zw7yFczBu+QkMu0nusxzUSj955tql7FPwGtHVMVRcA36SK
	NkniCSr1fVGXZbEOxLXi0/owxL4FzgJeviiIWyrhn2AvN49+5v+tsJfFzXUpa5yfuuZOjHbpnah
	1iCZLtD/kaGSNTWwcdRPIqlU/oLYuYggb0WT1ZbC1mnC2N7i/hzx7ay9bsGpbNcw7VqKivuA6TC
	w+QpPPe10i89VB/J4TX0vWnwHewuGzTyd0UL35JgGMEgdHhYaMerMXJWdOAEEC20xQ67MP3I386
	eqOtUyeUa+9ay9zGhtJBg6avQ9OE5Jw9uAntZcAy6uVvM8HOJtk5QtLaawX59yT5LO1MRr9pLoN
	qgHm7K2Iy7pVvfvFl6
X-Received: by 2002:a05:620a:4541:b0:943:e135:525e with SMTP id af79cd13be357-945f35df6aemr679392785a.64.1794011605063;
        Fri, 06 Nov 2026 16:33:25 -0800 (PST)
X-Received: by 2002:a05:620a:4541:b0:943:e135:525e with SMTP id af79cd13be357-945f35df6aemr679386985a.64.1794011604452;
        Fri, 06 Nov 2026 16:33:24 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5d9sm32684126d6.10.2026.11.06.16.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:33:23 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] spi: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:33:07 -0500
Message-Id: <20261106-spi-subsys-v1-0-a51a08f21cf2@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4as0s9akLRpxFbEoBmNB00GIuLti+
 SXv/RcwBkKGUlwQcCemZY7QiYB2dPOAkrpoMMpYrZWV7Eny1vDJMjU6t64rVKZSiAcfsKfji1X
 177icsF3fAtz3A0/01BtuAAAA
X-Change-ID: 20261106-spi-subsys-32156ad80403
To: Mark Brown <broonie@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=714; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=cIQXJAsIsjkJ34lMdb75pVRHd+pc+H4nZCxj/MzmMlk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFZ5qcOWcvczJwniSi3iPR8yiM3Uf8q/N3WDFesZar
 f6+qaNiRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM5acHIsEUhtY+b/+OxZQKx
 76O+fbW+puK/avkau+k3A869usQrpMXwV36KfIX6uqAZTJHyU7sMI3qvfH511WPVr/fKLn4r6nn
 9+AE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      spi: omap-uwire: convert to subsys_platform_driver()
      spi: pxa2xx: convert to subsys_platform_driver()

 drivers/spi/spi-omap-uwire.c      | 14 +-------------
 drivers/spi/spi-pxa2xx-platform.c | 14 ++------------
 2 files changed, 3 insertions(+), 25 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-spi-subsys-32156ad80403

Best regards,
--  
Brian Masney <bmasney@redhat.com>

