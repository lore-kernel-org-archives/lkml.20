Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326305;
	b=DNP84Qa7RAFi2mqKRkWwotj7A3aWS5vs6aduzGejQ65aDyBrIA1Fr+jdAt1LUATfqyx/
	 UZj9aFrbtmeXkRbmTHtRCWsPTNe4e18549DUqCymB58dqxVd9Dn2znVv2/D2FnySEv3CR
	 1eZhCpadwqPmNQ+LimfJ0qeNnw7M5nFVOgg9+16RlkitMXS14qtG6RQnhX22ODxrSKO/e
	 5eeVWpxO6l4hTQsXBVP906I7rmEub4pxFChw0HFS46vjgBXnFZnQoG6JWWwKx7PKG1iv8
	 ql9mOlw8cTnOjiU+TJdOb/aYn0mG2op1aMlI983l1jTmVnOGAnAX8+HpEufgaae4w4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OJ+UbYof1H6RaTL5sRkRgBhaKvjzbtyBbRi1EGwIN5U=;
	b=yxDutkDyckNxeSPBOkviwBIY8C9OV5TH88sl+KjrcvbMYFK9/iLVOOBEWdIuus5PSvcw
	 kp4d36gYAi/28Op+NnPp+izaBZMtxt0d5UMTWQ5lt6ukD4aNx/zXROw3cRSka0o4zTxYS
	 owqRBa4Fzj0eDmMcPundqvbu6XFd3vYwnjoR4g3fICcbFU3oZHo7agpZ+nELkldCCxDaJ
	 33/GZGWweGa1URZOb580Nsw258jyXd+FlTijnz3tXxqaZokbhE/EqOpXdPH91UDDYFhag
	 D/ceawzWjC/VtqxlOpc5kG/XgKTSpa1LpuE05XzIMIW1Ecl7ITWuHiS9uGal/jKZPTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUI3EhHC;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DEE606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DEE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jUI3EhHC
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so164591a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793326305; x=1793931105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJ+UbYof1H6RaTL5sRkRgBhaKvjzbtyBbRi1EGwIN5U=;
        b=jUI3EhHCyXCKfszFAgmsTKG23Yu+9vFLneaFkY9SQB6cT3aAQEoojo4uWQK79nnIow
         8xBR8KyJqgXQc1V2nO/WH9ZfYYx1eSAQEV4yTwUf7YwDR8EPOPBKG3XZl0IphtvEI95+
         48a5/QcdhrnB69gi2AVJ5aQYk2PGo0UfP6J3IXcGDeP+0g3ysWqzRv2wsBGNoyFF6WQl
         lSYRhsjAHrG0gPaDs+G82aJ1MVbSmbQLnza3paK/dAQAbH6vbCWRmp83eYECBCMLLbq6
         mxvejJVfICV7KKyHitPliWKqWtl2ozexhgJwVqA7PxxJ5ytT/9Dhglfz6bhJsLovtTS6
         yc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326305; x=1793931105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJ+UbYof1H6RaTL5sRkRgBhaKvjzbtyBbRi1EGwIN5U=;
        b=loMUYht9WTK6SAHODPArStDDosuhDUZMKoSsr0mekpbsIeu/Vav3yLRd0meRxAmLb/
         4NTkgeBgrVNuraer3P3yjCjuopNgVxqRLAun3uKlfGEy9gpxHfgxf+NdDR84agIg8JUK
         kymTxhBVrulFQSFLdpIexoAmS+xqQx9gTyO2kLlTRN6FhK6KOGQTOtbKz5krVvpqF1cO
         to6JxnWtbvHxDVzGPNIVREQJdukliAwECUUN24beYQT0JnO63ytmjiDPyzkUGpzGLH/k
         DH9TaMdyocts/XMiYPKeQWvCt4RdTed+PUbxzMrF5pu+UUAH7OuY8j39EDx1XBBoRG7S
         8Vng==
X-Forwarded-Encrypted: i=1; AKwUvBw4vCXGP7RhRzOVdPt3GVAy+vrUTx3+q1nAr17xdwzeA07RKJJju3qjYGUk45kdEWTiZG7eqxKUUYdGP8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcNlAPL5cdnn0V2eNWrsKwhrU3jO7fFEe0tdw4uxWI9p476vPn
	npwJ0r7HYJ0IvxO5BcmyB99Vdd7EpIAHPfq1oa3vY5fJV37PjU85tOgu
X-Gm-Gg: AYBFou2LgfSpPWsE6zbF/zj/LZmjkJv9BBaxCmDgbbEzPB8evqacy0oa+hTzRuvHkpS
	XxmgwB43X6rHzfKQrBMAqhSbGGHy2lbvpgvOc/ObrSNCaMbGs8UY3X37f/QGQox6hM/ffQlYAAb
	YQqmQEgH8ZjjPX3UKtCiewgW9b129G949UtwLKxqWhhUJCh5qughLEjcXWMTpmHkaf9lAJHnEld
	I+vvT/X0P5gq4Hw7hSJDIAPifmbUOhCxpid9/ohX6u7Ms3CtFFRu8CSBPIzPSZ3Zgh32/7A+5jp
	12X0es7EDx5Q9QRW9tXrY90cFgnV4diu5hriz+u5SvhzML5sXn3BsxTQuNBdZ6421Ty4fW2Txr9
	Z00wDnJN0GYHtBhYIwy8jQMekXHwdJiXpk7VmNeSCuaRqxAOj4NLegZ8v+kToXg3DrpVIAALaZw
	wI+EIiEKNBDaEavF0aLgoDqGOx7BM0PrjRDU8PC/eiYTXt2h9zmdUmQUgq9rG9e1+wg9ihYAMMB
	IjHsJyrLpoWJKyrHfep+FZWisr+tWaIvMnv0AcSIEKgBpp/fS+b0G8Ve+fEuqMC8Ix+h1aM+f9m
	P+J/I3qO3VIsmZerrdROonf7n1sOpvnfx/97brsr
X-Received: by 2002:a17:90b:180d:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3ae8985edbfmr647922a91.66.1793326304829;
        Thu, 29 Oct 2026 19:11:44 -0700 (PDT)
Received: from LYF-imac ([120.235.89.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98afe3sm6164303a91.12.2026.10.29.19.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:11:44 -0700 (PDT)
From: fausten <yunfeng.li.nb@gmail.com>
To: zack.rusin@broadcom.com
Cc: fausten <yunfeng.li.nb@gmail.com>,
	maaz.mombasawala@broadcom.com,
	ian.forbes@broadcom.com,
	tomas@slax.org,
	dri-devel@lists.freedesktop.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/vmwgfx: fix cursor validation and buffer lifetimes
Date: Fri, 30 Oct 2026 10:10:46 +0800
Message-ID: <20261030021115.35069-1-yunfeng.li.nb@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261027211729.646988-1-zack.rusin@broadcom.com>
References: <20261027211729.646988-1-zack.rusin@broadcom.com>
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

Hi Zack,

Tested the whole series on top of 7.3.

  Host:  VMware Fusion 26.0.1 on macOS 26.7.1 (x86_64)
  Guest: Kylin Linux Advanced Server V10, 3D acceleration disabled
         (GB-only cursor path, SVGA_REG_CURSOR_MAX_DIMENSION reads 0)

Before the series every cursor update was rejected with -EINVAL;
with it applied the cursor works normally again. No regressions
noticed in basic desktop use.

Tested-by: fausten <yunfeng.li.nb@gmail.com>
