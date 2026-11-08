Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128983;
	b=jsZY23vQzKDv1MIdOzZ+faeX/oILZtb+FuhTt36J65vmRl58ATeZO3fhK/jZAQPZ38pH
	 38K5dDffE9LG0gGwRkI9YzjztFSN+psi9S4CIUh0zO5yct4QeRW0jQMP73r0xtdafzYWf
	 Z4Lu8CF7wUeIbEyZbk39D/HsNdrUKncg1Ngw0BDMnrLH9ecJAtu7RsYrhtdMurt8hJBfl
	 sG0lPstiMHDpYQkjzmm8krllAwa+PCK2iL1krtBflMy5rXCprhtnlUR3FIggOG05w6vFo
	 5vFKy5n+m5eDazoa/yzzEPC5w5MAb/xRXACcinEXkQ8EOU7l8MpioBSnc9l+DBBZbqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=AvXoHRu6S6SbuQgZI6hSA7a4Wc6TkeCIX8/asHsPK8/KUK1PZIevz2cTi+CvJ1MqdZmv
	 K2sawmNmgTCxflsauFb7GO5JcOyc+tWQ5wvurDCpsbjegkghCVy78dLHHL1qekO/hqZhC
	 6yg4FHOAWDNwaGnaB2AQ53WKyT/jxuS4FksscnwlnEYlQnESzC5mK60T9kuQQG5jluXQj
	 dDk5/FxEfg8mJKQhGmSXsRysDsIeFLDZTF7as3kICc0NHpMGMiwYdcSSEulka5YB2UTxn
	 iqTr8LO41JO2mUrLaAJLD5R1/95YAK85Erd/kFcs/VYzOm94YQLGQd2W6M1Y0eGKskA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FafqC6Zc;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58250606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58250606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FafqC6Zc
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e795af1d4so39882eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794128982; x=1794733782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=FafqC6ZctJCGMqrFCgytWOB2XTSjS2PSJrOGAtvyeB9QwIltvYXb2IvVOabhBTmN/V
         n5sh5YSpWZLzBJczayPp/8qMEoc4orIoOFcWHVNBG9tU5KJUeqsHMITiJgzWNV7BkTRn
         MKZdPyDFcey5KuVxg98Quod/wHgcvWHHon6xcv4p0WFiojUoHlkV6BPnN9srt6GXmd4L
         YphzYWyrHBSSwJfdKUNjslngo0CJVPBTE8a/4F1eWoFCTNnRsFqGBudWwprLgAaKIK6B
         rRbqDVqb0h6g8ZoVB0Uzt8DD1YGESTKuWV6plNUlgK96zQFPBAr9I8nzXPDo3QzV2eQH
         AyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794128982; x=1794733782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=ngjPsyiKl+zp7ncPhXEizBMnYjBfWnKaaldcrmlYl8w4XuOVwlOP2sjYQEgHK8lFFJ
         QQFCk9YcUyoKxO0FmpQwVSCcl/lTYshQi1mEjZ2cz0IJW/5A609/b75cf16knPOL6oAM
         ++gCpRGJxhP/EVqSBYvt0LgP7Hylt55Id+QVTHzVGIO3XjrKeTkeiZbhI+veT2L8Tq7g
         0LBa1d5cAuaaJ4uWoFI42npkxbHN3wwfFd/z0l34hO1g7VJFW35ZxZ1YuPQsN3URigPI
         KJ1r/G39K5aLaqrD2XCdwzt7u6ZNVqDhgLrX3wszjg81t4twxDREneTz52Xw0JmPA4j9
         6jqw==
X-Forwarded-Encrypted: i=1; AL+hErHBPPcOn6lHEk/bSaTzmyPGLcM/1A4pGV/FTpasK4qN2FPbB/fHCwMhOzZeQFuUhjv7chNg44YmKLeE1nI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+86hJJJ3DRYPpPRW3eedEAzsbHCcUbG1j/F8W7YaTMI3AzfPoW
	t+T51tZEsLI1aQ86OolaWrPt4/Uq0m3rM6odFUY9aKybSGa0ypp0pbRY
X-Gm-Gg: AYBFou1w8RalgdhqWSxUWMf8vv3h5f4qca59nqop2QBEzb/hvRZyC12iDXWTHCTmH3C
	bT0+CfmQMyGFbbzOndREXys8Bl7lNVPYiz6T+oRVglxkMWnxPVcEZJ9LrxJXiSGUXvVpoZ/KTFT
	mvCqrxbNIRECt8H3P186fiSkiG/ZkYB+GtaeiJ2a3pd8bA/YM89RuMD1OUcv52haxsaVa0H0hlW
	WaZSo1BLcy/P+a2WNYfxfyl1lGO8U6Y9YxrkLBMYqgbuAOrD1VtXaLsWHMAswZ/lUwJpt2o5vpN
	yZDMPasCrS8C/3u/NFpF2UAKTZl0F0SkeRZ8be0qoXpZ49EE7sSffHc/E9sxSbs6EH6Mpx8MIFX
	Y6LcXAfiZgl3Tllfyc+/dJ4ieUW8bN/8PaBQJ4e5LyZRsrn1eT8d9JMmWb5rAJmuRku6VthVvTG
	+Y3sQxYIwJdhObbz2uOjA2cGMuVwV8A88RQyKFOvtmmCtSFpbLLNkrtGbPPhbVOlcyzqIB/2kCs
	2cCZKJneZzyYMfYSV3pqbaLV/9x7k/ptD5atcTGzCr9A/0LtjEN1pSya2/ppoEmkDdRwd7Dn4Mz
	2hO+a3WuLkwaikUs+Lrf7dpyM5v7IXcickoIxlQMJfrxCeoAzE8=
X-Received: by 2002:a05:693c:881c:20b0:36c:a2cb:6ad0 with SMTP id 5a478bee46e88-370f620bf5cmr5775018eec.8.1794128982350;
        Sun, 08 Nov 2026 01:09:42 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561852csm3725259eec.9.2026.11.08.01.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:09:41 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: mani@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	sergio.paracuellos@gmail.com,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] PCI: mt7621: Fix reset control leak on PHY initialization failure
Date: Sun,  8 Nov 2026 09:09:04 +0000
Message-ID: <20261108090904.2409-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179407116392.87368.9250979022176600686.b4-ty@b4>
References: <179407116392.87368.9250979022176600686.b4-ty@b4>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
