Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853271;
	b=kEabb9PBSNb978m2Z428C93gpURHry4BrxnqobD/MEgP5OcqUg2xpIA43p4HLUGjP8fb
	 JFGiC1gMRciSnu5hB0c5WEiNJM3euPfpmirXVWLvOs87IvT0gOPiRRGDaJKBs5o8U7Bss
	 8or0rNx+HgieaIMDkcsLFlGBMmAwNLmwN72T+ElZm/NQ9q9UM5/R2/ozDW/HRwYWaqmun
	 VDBaaMrjgTXKY8ox6ROOWEPcMs/hD3T//st7NAORVCCUMa6jy05sCmtvgawKUQLiycBey
	 fiy0TcLsyYEEZH8cjE6ayrL5zgtemyNW+BUlTDXIuuzWh4odpkvZqvVib3dK8dHM5sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WPqbI4E7aPhF78xzJBa631u/COojzZ+RvMgbm6UKZ2I=;
	b=EbS6M3oqZlQN5eyD6Kr6kAO8h3jQdxUm9MdBiLPTRdvHl+9Hvijjn9e8R/eAX08pwg3E
	 s3YNNrMc8/1N2eXHOGCKnIDDB1AnqKUq0UpP8m/DEUSLI4wX0OwEY0FmYKkfmJtg/WFQu
	 QrCZMj7N7OCqUo+SbGAyezIU9Rlw4DhXAjZhZgda1LN/xCq0dSUPUHwtkIp4NlWP7hNth
	 9cfV0Smg+odaIl3ZmB/vM5iLZyYF2fSFAL1hiaz7G1lHf54rqjLK0QKcOwuOHuWiT2Hy3
	 LiPPyoHvjiCAgNLlm+dR71kdpcIEqp1Oig2rx2nyXPps4zDGhwRcHT3p3UY8i7u+pYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PbHWy/OO";
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C7A606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C7A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbHWy/OO
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9995ce866so36703595ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853270; x=1795458070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WPqbI4E7aPhF78xzJBa631u/COojzZ+RvMgbm6UKZ2I=;
        b=PbHWy/OO/p6lbs9pGg3i2CMxwEbrtuKliGLYdedBT6TXPPbt31Hgd/M6eFVsm2cldq
         h/4UZo4BITMQgH9DqV475AKu2iBD4n5ShUSaey4NSQy1MBq6O9ic96YTyTn1naEhZ3Q/
         CHS3RIQLxlzHcMGTdN5QRK1+ct/dvIuqAIJcQImStiZ2WNSLAF0ThwL7iCbiywDeptYg
         rDUzR60dRlDSBJk3QmV87gRKa//yp4ipS6/WIzFogO1wVoWwDpPqUvQlqhOEdP6tOI4J
         FVNihNhKN5WkszEhxRgVRTq3i/gIDCjWjzwu9ue0EyPPGAnGaxngVKAQa4xAAf0tkueb
         +GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853270; x=1795458070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WPqbI4E7aPhF78xzJBa631u/COojzZ+RvMgbm6UKZ2I=;
        b=Ap9ZJ2OYifwB1K+TvSEOIOvCenozPVa+29UwiyTf0BnAEAizkSYr7+VE/AjqtYzHTi
         Wd8EmSdX+TZTgu1OOojbBkxWqw4Yyb/UHrNkhjBRf3IjqGD4bVANheTG4beixbRZawE1
         zT089eN/BSPT0ud7lDef8eU79kTEq19iI0zdYWmPc0u4MeX48eRVn9yRhZ9c9iDnJdNu
         D8LH6Xqfpk66FwGf9dN7yNu2AOmr++KGhU9HZqGIb+riFkf9iQkosI/yumoCthAkff4I
         KP3JAcFT1f6TFLwgPSo0hxf1bp94mKr/fHuR4jeYnckcdIUW49ubbMUou/heeDHie4fW
         ByWQ==
X-Forwarded-Encrypted: i=1; AL+hErHH//c31vnDeNZ5WBAeXnMkGsomOg+LwYmux75elT0ChiWQB0OdsO00hV778G6gYHlxWCwf6jfkMIYB9ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PiMo1nLx7F4UoX9bMnWXGsuXU54ewXylLWpNSiVo0GhkcgExv
	RN4TfUtl9WCn5BkYdELsDXVL7jkGRicovA84eLiBw7qQbKNBXNH4PXCG
X-Gm-Gg: AZFdTZeR0YyzdcYwAI8YknOeWTdze33Ff+RNz+9Gf8piMPQpc3twpEJ1S9x/dWfzhDG
	HjWr+ogdNLge4I80Urkmh0eVjzwBTA7w7kwVwkJB1vOARvUqUjthImZepJmKkovZKlRxeohZtlV
	VS+izC3WErsGyawQ7fOp+OOVystYhf2tt8S5zFKlf7J168W/8To9clfgY/cR2WDs75E4CWRk4ij
	YEWNTopPsnoRRDwJDkt0nLmCS5fJfKHnOBlVH/cYjK7lQSeaEINRkC5sUfC5FiRj2f62b+zqjmL
	L0IbpCaIoFbYJW5yZGlkqb712peBK+jmny8hRuyjihwXUDlXOZ5dqwm7CxLO745xVuDD1/No4Ot
	wuAt6BByl3CBgqwJOl7prOu0jwOkYiWrN5kWZDkmoPk+zzPvLlF0jVKmG4nfV9VxB7yEGPt7f/i
	Enh1T7CqU+2oYm0kkFTRs29tzHwivl+iFBBc5VlQXQVpvg0nGfFDpo9VN5dxC31FGuiBSWMZqlL
	13EybNcscKTNN14vPwcnS72v6feOqsatDoH1atSNZ/n4eQE0zXNSz9i7qnczIKBPp5o1oc0DOoU
	E+FPYm8lXvWEPYH8JQ5IZpFbMyAdcU3C3EtxBiaOOg2pPZy/cG7k8pRZ01SnELf6an5ZWvPsGxs
	rTAaMjrYN26QsniZXG/9eLdUgKynak4QIkiDEXqTiMQ5/d+6WWJWYmvP24g==
X-Received: by 2002:a17:903:41c4:b0:2ed:cab:e977 with SMTP id d9443c01a7336-2ee0da966e7mr123690405ad.12.1794853270245;
        Mon, 16 Nov 2026 10:21:10 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a161a3sm2885265ad.18.2026.11.16.10.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:21:09 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next 3/3] ptp: ocp: add WiWi Time Card production image support
Date: Mon, 16 Nov 2026 10:21:06 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179456532138.2199510.9610534349392524646@kernel.org>
References: <20261111041904.48916-4-ahmadexp@gmail.com> <179456532138.2199510.9610534349392524646@kernel.org>
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

WiWi shares the peripheral layout, not the PCI transport, with the legacy
Celestica entry. Only the WiWi match uses these offsets, vector mapping
and gate.

I have not verified whether this FPGA replays a masked event. Instead, the
proposed change refuses requests to arm a timestamp, PPS or generator
until probe reads back the open gate. A request made too early gets
-EAGAIN and can be retried. Disable remains available for cleanup. There
is no speculative acknowledgement after opening the gate. The mock-MMIO
test covers early refusal and a successful retry; it is not an MSI-X
delivery test.

v3:
https://lore.kernel.org/r/20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com
