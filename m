Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732125;
	b=2gDiJYtAmAtkpCqEAWQaCDm52LYv5NoIwRx/HHhaOd8va66oWtCq5fKhS95BgU2A8pnY
	 anHBc4oJDP41qOfhNsm/fLGOSTYPD37KEnMrP1mmba8t37J1Dl7BsYZ+xkriKGabjZSpi
	 00JPpYKl74h8AJEncBtLsUFrtPdpS+qsW+oPuS25D5lCZ0eQ6PBspVrviNVw9/lcPgB5F
	 5LTBy49Q2kQxNW50N9z+2tPFzlC6IqlhzKGcK0mLfY+G588W0vOGDS4O/wHelpZoyNBwU
	 k5c7JinYIrvkYYzbCHaBGqRmvzHGKhquQA2P5gNiTaVR/ncvBq2vjUx/r+dCUZjuCPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=laaIitkwtRfz/Rs2RC4H6OGZqHzByif505hVOcpyuGs=;
	b=KqDrKdunwrtFQQB6L7WdDNiA2jtNvkB4v9kuYKSk30YqXCy2JvOMSZ8/K+NCgtF/yv6N
	 0IdQPt4BoZuNysRB57wJr9XLmz0EP8F3pg7ngtDg1yrjkQaErrHleKZer3L2d2ug49JKC
	 oMt3bNZnbmuYBYOygzwm9MuJp0BhCL9ZyghN0mdfWCUKNckahMLcwBOo3T33UZkXoopFI
	 M+XLoLfDYAFdDWCgwGiZWYq8N8BaCu17pJoFUBuJ+0wJ+Xq0+nxnQCg/istnuXrqmVGah
	 q4vcWgn6LlSWKmaF2ZTtZVHpe4VC+oaHaJUpfIv8P891rktxw2HOE6NFpEX3Hwr3m5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tkdbF0z4;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06099606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06099606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tkdbF0z4
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0f59a5fdaso42374137b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732124; x=1794336924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=laaIitkwtRfz/Rs2RC4H6OGZqHzByif505hVOcpyuGs=;
        b=tkdbF0z4yZRft389WuN/ZrjOIuPjxAA9Ugq9HfjOgx4SmV3kmI+0ffJv3VFnc1nLZc
         VKTaE+c2sgiJ9f6myskdGVQhcmvy2HvtyiA2EvYOZ1no19s4vdg5vMx+aSB2WTPefTho
         7UWiwz3Yl9xe0DEG8xG6yBQjf7AqIT878JCdFVQSppfAxRLn3OglXfeykQLFrUx5SrpR
         33FmvT2PDbmQECyw5w/4uIKABDEKSXWTlEo+tsblMVqWxNKmu0jNN10K27q6DfW/YpV4
         umEZnXeBV9HCT0lEmCItrcfTr5DGq9phvLog7+BERbaRauigtS/dN9ZWTWsPlodlANVf
         Ga2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732124; x=1794336924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laaIitkwtRfz/Rs2RC4H6OGZqHzByif505hVOcpyuGs=;
        b=xzHHPneArjTkbrngCxHJL0U/qzBMqfc12ovoPuUslNPX1EkkPXoPUCOh8L60Vdep9O
         4evrKnc+C9WYgPS3go4hVhDIlokpn65da9FUXZ4u62pN9Y6ILLFQt/X9BKfzNVdlD6sh
         OWDfhf6QKJY3HfMGbWYbjS2XR3lSZqytxUCX692FVG1q9kna3/KjNsAvOxEnOaqaJuRT
         z/pRXrjfUhrCqcVoPI6RFGP8uc8xeeXgUqhJOfafjc6mT5yKA+ph6bUrKj+L89ME+/e3
         zjIqwljKtJcnuOAVmH0L/GcPPdJeFBLS6wHJ8tK3gn3VZ2Ms2l+qDXxgTM2wgZCF+cA0
         kd0Q==
X-Forwarded-Encrypted: i=1; AKwUvBztWuYTmjO3LJJzcw6dUCvORBh8UdfkakGXskBjRjfE4SAtOuZ3b6um+rOlD2WI25CL1lPj5DhiZSO0xyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+oyB2eOJaCxpdFiE0kUCWHXmpaJdYPNoTCp57PUDeZ5K8NqYQ
	H0Vkfx0gmUyagWPHDtD2V3H4u01dY6sM3SfUUFfH3+Moi5zI98cMxnfYZNTJtaq4
X-Gm-Gg: AYBFou3TncuTGDupYAndmpwe2uKqmZi7rNws7v3MWvWxWSjfSmurSwRaMpphFKUrJjJ
	lco6eD72yHZeV7lwn99GSwbDLxQAbtOtmtgt7H+BGE+pN5AA40CrobFS70q+VE9OuxkonPLpbdT
	prrh6acXNPAl/lv9O1jgTe9djX6HeTipni0E6uFHAAxNhzKmN6fZWoTzRipRRaOZwPlKxGkUnbd
	Z8CPat7iaC8hS9Uinkc1WENp2P3OVb05RDVwZlifFqpJCH1cldp43kqcEQ2lZrzf/s0HJ5FqH+2
	U6umsjnPJhno/A7ySXZF1GX4nHTDEliLQGE1Px9NYLYmVcRFM9hv6E1ZcS7WN2JxfpFHG6+7kTh
	PlccFZZ2miW5wOcJm0rvL9cQvJIOaGmLz0Yei5mCuAWUq0NsjQxu+Gdkp66CaZcizjC7xvns3Tc
	/NdFZ5di7P9ZHxt2ueHYUo6/GVl9R2sT5fAjvrziCE7LL5tRo90AOqisCMu7WohH+1JpMV0tDci
	5jiJNU+NXARMEgNM5ikD7e11ngULoNc9bh1VECxrnU/CsCOPq78NzuOqLpYde8bteKyuEX8nUeU
	vnQQ05+0q78WLVqVvBtmJjS2iF/LBDrfz5zVJpXCot+du1fo2b38kCI2ntZHVeCJVSzYpgmaBQ=
	=
X-Received: by 2002:a05:690c:f82:b0:8b2:edac:7a63 with SMTP id 00721157ae682-8b2edac7b42mr47668977b3.58.1793732124079;
        Tue, 03 Nov 2026 10:55:24 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b0aasm2880387b3.17.2026.11.03.10.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:55:21 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH 0/2] usb: misc: usb251xb: add DT battery charging configuration
Date: Tue,  3 Nov 2026 15:55:12 -0300
Message-ID: <20261103185514.72144-1-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Add a Device Tree property to configure battery charging on selected downstream
ports of Microchip USB251x hubs.

The first patch documents the battery-charging-enable property and adds an
example enabling charging on ports 1 and 2. The second parses the port list and
sets the corresponding hub configuration bits. Charging remains disabled on
all ports when the property is omitted.

Jhon Wilker Rodrigues Aquino (2):
  dt-bindings: usb: microchip,usb251xb: add battery-charging-enable
    property
  usb: misc: usb251xb: configure battery charging from DT

 Documentation/devicetree/bindings/usb/usb251xb.yaml | 7 +++++++
 drivers/usb/misc/usb251xb.c                         | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

--
2.43.0

