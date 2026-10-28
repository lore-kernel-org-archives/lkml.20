Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191935;
	b=UJRiqUmVve2XaRVwlvXQd+Qy1s6XSpSgYEsrphQhjBXwc3MIcRZEFm7qLsjXLCybHpNs
	 2+XW1mBgv66hBACqvlTRTZdWBmlBukexxhoFMQhNqHZOFfENXTC2xN4D6cIf0f1LhfFYp
	 3agHqFuREecbL5UV5E9BZFbQwlBATx9V63Mli0IV5LIb6LKDxtN58h2y3CIw6jl3NtOFb
	 5pkRnMcNJWxYwdchWJ/jGX0ILiWNuV5rOIXAQxRqPeLDr7oTqsoimV11Mcw9ezTnS8N1V
	 AenC297y276SkrrJZpHbTdfzoXtMl7xF0XgkT/Zdln8zkZScNwNho+avNowEuqGqEXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=jif9CDAVAYhJXkuCpp/HgAnuYrVFMmNUw2aPhFOa0WA=;
	b=C1dNUDVTX080UO74tVKQwbCa3tP3GEKVB1Mw8N7ftsol8i0fJxdM+Auur3P4tP0pQTO5
	 qtW6shq5c8jfvvRBfVU2kFfsUZ1IsbKErx5jRJ09qCTebcNzbrf+Whmqnx+Kfamk/zwT0
	 /sjBorgwrvKPtymdXasP27Sq23isfTKxUhn8N9ZfCDqYo/C4FKc78OQx1b2b9ovPu8lEs
	 5GpLbx6bDmEbO/v88Q5c1n4HapE0MEvfc7wu6hCeZGvO6lkdGeLyv+ByJJAoet/Cti0qT
	 ykKTlxaS97qNA0x5JfkDWXBhBqOAY5kedrQ4nOUPv/htOHYDTr09dZHJrTJnP5FfpIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKnwUVbT;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A48606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A48606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKnwUVbT
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so675281b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191935; x=1793796735; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jif9CDAVAYhJXkuCpp/HgAnuYrVFMmNUw2aPhFOa0WA=;
        b=ZKnwUVbTIEGSp3YRgh3c5uKjT02PZpb8VjznUtGAmlyaZaegMduYT+jTcMWxiWUnpW
         ZA4rCNqIZLDv97TYXn/nyqIe67U8TFasmoaaub/5wikT/0QXhdo4aLEzUifNj26SgGbI
         +3Uxb9Whc4EmPZomkH3zEcCJg2MKSC0fTCHCk9M3E08VZbjjLcDUcD5sgejKUoU/xOaE
         QF8lP4uGpqnkxU/4i6A2h64zncOHnLPFid4GRNhKvGOeIJSs6vQA07i7fj6axZfAjsL0
         6HRACEo1ufoTcN5ln4SxVcuwkCZQKfSYlqmaYRLZtS5/rUE2O7sGCqyLiGTAhdTBxZT5
         5Dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191935; x=1793796735;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jif9CDAVAYhJXkuCpp/HgAnuYrVFMmNUw2aPhFOa0WA=;
        b=V6CLJBGboMG0xbew20clc5WlUqyctn8V1P2JeVJtLi0cbBgNgO03CWK5pEL49bXuH0
         D4PrEUAhBSgYLB/Kgwbi7yVXQFUuNEIcxSXJOZBJLQrfdhUwiF2PBek/pGRv1a+UXCH9
         REJi/f9AOc4elevUS7g55UI5xNR5LYiOcfNU0Z3y78b4/cq+8xYM10c4QFKkDPY5H9L4
         zyxtcEM56WwCpHqsixESzDxbK+ZsBKckdeti6pMVnmeORXYEGaUdE0ctcOHtvhJZKFvH
         xy40FzOO9rw0nHp8LsAOOvSz2r/bI3vq7fx2ADsMWV8SbJ6QXUYPfqpcSZxO2WejdcxE
         sCmw==
X-Forwarded-Encrypted: i=1; AKwUvBzi0Y8sJ+lN7LHKTZIdOs0Mcn55ECy5hO/xCaA8CSdABlAGfzPcgQgJbXOXJDwSRh+XzG6lkLHBpFdK87w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx/olfJUHGyNF7nhozSpDZk9Aetwc7EaNiKlz41Xh6avjGAbna
	dma6SyUZPCT5KV8impqcNsneljiZwtXveomDl0gM/UXzoNi6BqflisOa
X-Gm-Gg: AYBFou1yqKg57N+qekAj2sQ+PfJBecIA24O8IAFjLlJIHaCH/qoyzkx2YF9dlIwV89+
	nDKnEPJ2dkdv210Uq+xVTXO3NIhG9X91wPeTTP5Bw9p6GhCas1Vy9n/CRXyC/3AtrasNjZMDo8F
	sBykT1fulraxPHWVlKbkFa5FzPWwaswR4R8F+q4WaK5Qk+er4FNT33Mste4p2GSPjiJFNrmmppN
	t5vN7L0xiucQeP8ulYYQTGQVPb8yV3t4VMxjGV2zdRe129XkwsZQePJIGVMIv84CBvb6jvsH0lu
	2TRG8xKRAinogIjG7qOBReaJOSSbqHW4rXNYZqUXvGUx6/11N991SJiHJsKZJXFORYi1FiyTGL8
	1zNJzdt6nVbYhpHovNtkraNRHEGuNpPd7DtxrkDe9Q6rUCUq+zYsOwgCEVJIN0hk1yftAqz+d5x
	+QlFi6kDBajYFNc/UED+SzaQENR41ykbmXKzMlh4quqTCzBLP8O/LsUw+I2VpHeA/jVSGnwV5B8
	srmWJiK+sIAFdGHf9/+/Z1+Nxy8GtWhA3ETxBQdpSxu9VJkFdp0SpY44g==
X-Received: by 2002:a05:6a00:3a0e:b0:881:fa65:d507 with SMTP id d2e1a72fcca58-8a6e6a17a2fmr1919876b3a.22.1793191934270;
        Wed, 28 Oct 2026 05:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([240e:46c:8910:7739:c024:4f7e:9059:99de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6e634ae83sm751438b3a.20.2026.10.28.05.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:52:13 -0700 (PDT)
Message-ID: <6ae1effd.d3aa34e6.c46b1.441f@mx.google.com>
Date: Wed, 28 Oct 2026 05:52:13 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
 Martin K . Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Marco Scardovi <scardracs@disroot.org>
Subject: Re: (subset) [RFC v10 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB
 LED driver for ROG NVMe enclosures
In-Reply-To: <179319085271.3664457.8130606663267466619.b4-ty@b4>
References: <20261015140051.1159817-1-nbg2974@gmail.com>
 <20261015140051.1159817-2-nbg2974@gmail.com>
 <179319085271.3664457.8130606663267466619.b4-ty@b4>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks, Lee. Your reviews along the way made the driver much
better, and I'm glad to see it land.

Liang
