Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536409;
	b=gSk3pwUpmeGqInCd4Hh0XV9UqOmkWZFDAC0Mm6nKc12BZbt2Zk/i3nBXp1QSEmFcXclV
	 BYkm4/N0u6vSxpnkw/U7+ndVXD9mk2a8/9LDEAQiHcKcoWUsuTC4EJn1+DGqTUyX2XxHU
	 ASiqDlHlGxtNioAIkfjTCTf6mxV/RB1laMAlq51RYN5TYBkiYmPTdd6piIAs/u3DY2GO0
	 kR4FD38W6EwpmHWvchgsMURXaGfQGJoc+SJIYDqIoYBG/LyoM/xeu7nyFlK/IMeBbs0pw
	 +JXCAaCjMKsxJ1WmV+m5z6NM44EtThjcSxhWz08JQIH6qX+a6E02YogetgjJar3IU4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g7DYkFmnYLBZzg/Tke3+5rre+MI+fJIUNeaYE/plxG0=;
	b=2dp/eLzbfOpMd9g5+TvfC6NQk221HEZ+zyQtk+VBlvjhOLtKscbS3s+DD+u8Zk7i8XTJ
	 SyHoYK9CCF9ZpUV8bm4cSMensZnHPGG0Z7WilHnYocp4eqN9Q2lJwFrQVxPLcuwrk1lg6
	 qpaeIIozRi7DBaCi7eWZoY1CVDmMjA6XlYaDJ3hVFDqZ3f2JAg06nnlzBOc1wp9PAvEOW
	 L4AsmIkZP77xuHKw7NvFTnY/vPwJr4nFecb5VZNVpy1BDHrJVIgGA84E7fnDGHrzmvoyE
	 JjeM9+tAoEUveajm0kiYxR1T6gs4wlyDdyi8N5VVzK8tN6A/oAgvWblHqE3pARDkkog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=msj6cVaP;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D34606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D34606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=msj6cVaP
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f2b8cf037so9368785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536407; x=1793141207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7DYkFmnYLBZzg/Tke3+5rre+MI+fJIUNeaYE/plxG0=;
        b=msj6cVaPhol8uStwU+5oJrv56lIYgD7FtBi0s9zGgRAn2c9m5/uZjwR0RZuFNY+ios
         3ZbGMo44ynIWbe2yqcSioTFBIEX0ZW1Yy45sj4bO0I/Ve3HQNxWK/IOlsoFkFcD7Kc7+
         z+G0JPV1xdIFXywZQYESwZFGkh+GtAsaBIvuDO4Q9tll61D8qWQDDmOulC+ho2SOUNdx
         4vsLtArJkAOv8/8WJ0AKV9bqGGRmHQPoGCZVv6bxgod+XF5qRNwiRnxkKRtQu6HIF9cn
         EVhBgNCQvfMIp7FACJO7wlELPjiljJH02clZ/ZudJEP8zZ2lCHmkRHT4eEufrqIFmVT2
         Axxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536407; x=1793141207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7DYkFmnYLBZzg/Tke3+5rre+MI+fJIUNeaYE/plxG0=;
        b=zWfj8il+jvmQCuV0moJPAeIY4khQRYejEviGTb0/21H3zyKYQ8qbbf/9XPQ4cS0Pf4
         QJ/a/Vyt7a0gb9A+5q6tFf2k3acbhWjCrauoof1wQse66BavDF57wQbsorntwEQvb47X
         dI6tKYBV8wwr11pH55P0ZHWN1CeQcvC0ieyktb5t7t5/bSElEddpmNL09W2wsnQoPkLL
         VRfRcFw4RaUxXgX5/wyk2yCudklt5kS5McUWafbI+6L/0gNaMeAiGvKkogda/yRAP013
         eLWDzmdxpJkDlhNNFZk2ebAClfyvX08EOl1Ay6rKEhqQ0Tpd3/aBoNCbheR1PUYIP60e
         PiUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTfgKaod9RLjydBRR81XmcPMIXCH589etWzE6WHl3thYCyKuTp/U8uKsgFuKVgFRAQlhLeppsSEsPqNeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh0cf8YN0XRsS18Nas5SqPUyDDVRTlGKAp6JmgvlUqKSKYGseV
	zrdhEQkyypD7qrSZIYf+oilGrm3FQCKhTut9SfwEEPCDcFbmGqWRPv/o
X-Gm-Gg: AYBFou3tO6/5U5Zm+Q2Q541NlEOZJH5r/WGYrjuQT+KVsQYIi4iA3UibANj4YkhLGPC
	hfSMrhN/7RBOPqA0cHdl6mChudEC7404KREdH07WYsYPHeGKmk3lT83k4WKPBe2X+UwXitTkeR2
	/RZe5uXUMUYHDnBDwFZHSEjyYg18iDi33uTEWp1B3Y68hiyRESvpMPE6tIZrQau1b7ynSr8xFN0
	+kFusdGNpIHuEGcx8JCXQo1+3jvnlrUAjyCAd2CLsABgdYtnyan/7ntqK84R1IHcfg2S0ZbIgLr
	P+96x3BVd/5C51XiADrYBW3Lay8JSRhDN+Q9lBhwNwKIzJDRGieIAoam7k9G6ovvG+thF1+Hmom
	F0TfzisknpbfLyuzhL7m+uCBwuj0Fg+lNXUPgR8NV41acfo3NiXbs0s6NNPt2685128153sR0RR
	J20rw7p04f6YnJKAS0u200FcSPaBLg5sB5wVbHOGMoRmr6K0Nv9EoajqxwDoHjqTENEpi3Xtjf9
	yMrgpfmmpC1KasNIrUi3dkuvT3L06gJJKLT9nsdRKSvmbgYyyiCLA10ZHwB9g==
X-Received: by 2002:a05:620a:29c6:b0:93e:4e1e:aafc with SMTP id af79cd13be357-93f57f2324cmr133047985a.36.1792536407681;
        Tue, 20 Oct 2026 15:46:47 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e005b7sm95533785a.30.2026.10.20.15.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:46:47 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH 0/2] wifi: ath9k: fix WMI command response handling
Date: Wed, 21 Oct 2026 00:46:44 +0200
Message-ID: <20261020224644.3858280-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020152412.95560-1-mike.michalo@gmail.com>
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

Hi Michail,

On 2026-10-20, Michail Andreas Michalopoulos wrote:
> I don't have access to an ath9k_htc device, so this was not tested on
> hardware. Mehmet, if you could give it a try on your AR9271 that would
> be much appreciated.

Tested on an AR9271 with firmware 1.4 as an AP, on 6.12.113 with the
revert of 93ce8ea70451.

The AP comes up and works; the empty responses the firmware sends for
most commands complete as before. A test build that delivered responses
twice had every duplicate dropped, and with tx_seq_id started just below
the wrap, 0 was never sent. hostapd restarts, module reloads, USB
unbind/bind and a 30 minute soak with traffic ran without a WMI timeout
or a kernel warning.

Tested-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Thanks,
Mehmet
