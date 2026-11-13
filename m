Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555174;
	b=a48SgnzsFZbgexD13SXMHh9fjngkPYvPCtQeJZOrN2kSDtONjLlWpTAdug3EKnaUpDJn
	 /QX1YTp7M8xnfjkYxgqS01UT9gJfNlTkaz7lHWooyIpkHPdV7W+CcixCsMgtBeU7WOIAT
	 6LMiCOfrRjt9+g2eBky5tmeKbq/foYqPrNIAYqA5uY3fq3GM03Uhpry8VQeP2+tGIrS0k
	 inkfZ7SONLxQVT2FsII9Ik2b/WLu1tckSrtf4jrQYq5x8VSTt8G6H10B9LjE7GMGLFlcB
	 gJCvezkIvSQfhqshcm27rPoJwbSiYMQw0ouG6FB/T9hc3Ty/++1CfaljPysqgSaP1lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jqp8TYr/BxJeYtd0GqFzJoVixzfcdiw2tIdD5ztXl7A=;
	b=c8/1kFeQNZFnK3/+V9jWP5hyQ78AGraXEU8QsE6a5BDLaPQAA4ZD6EzdgL/myavu9wwu
	 jXCBQHkJnAICIhhxr3PMG0o/JOLh9AxLAmhqTG9IAvfFuN4e1Dd5lVqveI80+oWehngnW
	 dYpX7+MFeASbDY/UpMBY1lsuHmmwdFDlg+qtIRMtEhN6jeCN4RdCYgRgxg8UxrWS0nXcH
	 yRvzC0y4OYxqDrrL/E+2IigDDyZ6lPLQe5mkbTc14vceJ72zPQNtOnSowDVmJhFp50xI9
	 2ZhsajUkhuGXCAVyOW+VeG689XPzVuz0jcYIA0K2f3hQi+TElf8f6J41j+Xw67la8Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jW6XVipS;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F3606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446F3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jW6XVipS
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4918c2d727fso238402f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555172; x=1795159972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jqp8TYr/BxJeYtd0GqFzJoVixzfcdiw2tIdD5ztXl7A=;
        b=jW6XVipSXdMdRTxsiijSiJOltYY8enXMvCw0kLuEMKivD0O8Eam/rZsLu0qkRJmhMg
         0gm77RI+ElgZgUSELzgGh6YYiZ3ekKa2Iuz3V9mzgQLTdzQ1er3kL+6npgfNMjUA3EOg
         q7joZ8ii/JliPk8lGo3/CjkyjggwOpCH4MX048SSOnyj86C1TSRdGoOrVD4Tlp4TnR0C
         nk7RjKDlnoCNZ8RN6LQKArv/horCrm2ZUhYVx8bFJKBCXmPCN1Ww1MgVtmpE+P7Q1q4Q
         Rl+9xxVIEV5+xtc/WqOERzJsW1vxDTEHKmBw8t9dSspbCvVQHudFSzvWptu2E6uzTvLN
         gxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555172; x=1795159972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jqp8TYr/BxJeYtd0GqFzJoVixzfcdiw2tIdD5ztXl7A=;
        b=qfKTTp4upejuYFQ5MIo6InGBTjsGt/mnE998xS4Z7zX2dyo7PdDJFdE5L5H5xFjnW6
         ORsKBjZUVgCpYLQNwf6EBMeNUy4aIFvmbtMaljANmTRe/YZK0EUdQQkWQ+UQBL5sZ6e7
         QEurMl1K8o/0HwsfQ+Tyqyl0Yve25aqIf3ftB7VuYeDnxCBqLNpLiyuh5Oo/Jvv79shA
         jpk1yUL6Nx5QQCkTvlpEhDTbg6JAVHYEujbdcEIGzWWNSaR5Xmjs+si6EzYHOn39y30L
         EgpYhPWj9EKSrYjIo+E8TDalwOSevyXK7gJZpwoBQxhaIQo3++JNdPOwg7FcPzoU1bLr
         tNDg==
X-Forwarded-Encrypted: i=1; AL+hErF/xQwK2310ZEaKSOAWY4pz8jWyOYgWPt3hJkJMw/F0e0CvRXzWMJacyb09YRFWecH+lmCv39iCiG2DKFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mQqS8bVKKBJf43EGSmGntXCz45d7+EmEfnC1uawffHbIsT3iS
	AQbnmSGUr+a5zYpqOT8wjnZqoS7Mksyw+AwW+I7Ri3Mh5fxMXt0ExBqt
X-Gm-Gg: AYBFou3kUCIEygPyeim9EKCm19mhT722hAkmGncZptFeiV3XhggOKYszwJuUf2BX0d4
	1hjQqsnVrLpgxoMuXIqXVhFR+4AQvvVJNWMXJhauNERxp8kqJ1pzY1sSywzgiglAUeeVIJUy9sI
	lyUUX7rjj8JKGSnjrS2tP/1kQyIAc04K32umKVQPaPxvg+an5IwK44VORGNMZ5zStWEeFc0tpKU
	e8iIKSiuSVyRkI6QszBoZ4qqXOOmpH6nyZnjU0SiI+BeFnUY6SgrV8WBwkIi+Ep0PEwRzbIySCN
	aGrcEe+LsWw56HLHD7PynVGm3nCCa3LmZ/iJrvHCjsoPxcIq2vlQVM+tg+pfmMqewRLP3C1VFAz
	M3A51rdiTb7UMbG3/nhmna0e9XC+76XzHNW1PBnWiDS1AEEJ09v7cBhJQQHTy41wReIeS7RhozM
	UVQvfG9kCik5yyWvIz4ru6oBwAT0oP1KNC+U2HH/LXDA+pFzbz3gdxD9sxr7tYcupFWwU8TcCGu
	753UKHHaMdKVj9t5vdISregzpR8fbpzTmiJVQA4iFA01iU0UxqqDb8IstY/80kLdZUqR4pqv4Vq
	+fopvXEa1lkNTG3S8fZfMUsbR3O0Qh4A22g=
X-Received: by 2002:a05:6000:240b:b0:490:39ba:4359 with SMTP id ffacd0b85a97d-49c714a2db3mr3596058f8f.23.1794555172357;
        Thu, 12 Nov 2026 23:32:52 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm3799903f8f.8.2026.11.12.23.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:32:51 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] i2c: imx: two fixes for a DMA write that is not acknowledged
Date: Fri, 13 Nov 2026 08:32:48 +0100
Message-ID: <20261113073250.1037215-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A write of DMA_THRESHOLD bytes or more to an address that does not
answer leaves the interrupt status behind, so that the next DMA read
returns 0xff for every byte without an error (patch 1), and it blocks
for DMA_TIMEOUT before it fails with -ETIMEDOUT instead of -ENXIO
(patch 2). Patch 2 needs patch 1.

Tested on a Colibri VF50 (i2c0 at 100 kHz, DMA) with v6.12.117, where
the touched code is the same; on this base compile tested only (W=1,
sparse). 200 rounds of failed write, 32 byte read and acknowledged
18 byte write: 200 times ENXIO at once, no wrong read, every write
acknowledged.

Mehmet Fide (2):
  i2c: imx: do not carry the interrupt status over to the next transfer
  i2c: imx: return -ENXIO at once when a DMA write is not acknowledged

 drivers/i2c/busses/i2c-imx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)


base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

