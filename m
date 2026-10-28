Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207487;
	b=WqSwFvaWiyGHC+T3P9MSdwInqRLZ/wyAzD30QGc+r8ZrgTI/xbj3rIsGcjcAxeUSkWW0
	 L3OEogbhY+ak8NLmP84X0Aamvz8L+2Wd5YshJ8vJLadgiTzMBJ0O58Z5kJa9zICz0d0M9
	 2DBl0ZUEkjVniEgjXl1VIKMElGehg52jTPc0lu51zHEjJEsLCyzcQo6JRoZ/WTJbSQ/D3
	 e8HApneuRM2Cj+plCDmI4c+mrp4quWke/11cTqq/nauDbNvd1c3SwLZNrAiWIlrAMn74Z
	 feIFKiKEXZ6XBCZVGLGXiWaLcVUt2J2fNTfzM6MyraR2ppAYhwUSkhdIfSNzQ+zy3tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OBAS8LSYWCRFarKET5k50Emev7tmcCz5Lq+Z90k9nVI=;
	b=xQnZk1kfyGEMMuyJ7Ew0W53HIcZ0PA1jz1Mb5jOxlRmMQqB50Qr2u218zNgOaw/30tq/
	 sVWuqw5EsrrG8KEuBz21o+JNizBqtfAPIYKXWNyVYHeb0fBXsEgiA0OylEtBJE3PHtlsh
	 Rnu2bNx8uc/MIWMaWG3s08M4T23CC6c5A78Qc4WMm1c6UiUCKXbxq+zxMAMZ1eWbTLQ3u
	 5SHg71f1krbWMXXn/ybh6+mEDH38sNsNFg1vx+8Alfg69cR6S/MSW/95PtEJnKoAI+rWg
	 Sg/x35zK535wy2XKHrzRs3YVHUA/scyqyhBQr0H6SerUK+sRNzC0HrzwH/XrpEGbmew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmkcO1JN;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA38606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmkcO1JN
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1101197f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207485; x=1793812285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBAS8LSYWCRFarKET5k50Emev7tmcCz5Lq+Z90k9nVI=;
        b=mmkcO1JNN7XK0kk9rUyfJsIkeuA6S9rPXoVmVjclVsR9+UUP5tIwhTnb6+dYlT3iNS
         HizHtW1P57YqRbzyHS+4jFtxAzrAzJmkO+Tux3Eisaqp9+wmbaoIZpBq4qlNuxWbDPYF
         h2rw/+3GO5gg9tiBP7bjGjLjs/T4iwXCF8jkmKe7NH32VuqdcUmjge5gWefB1I4VG6Xh
         s6/qoPGgLvmhNWebT9rpgWGHuEQG3qwYL0NLT9tAmsRUWhgz9lHaZL6rbSYN3FWu1MY9
         RkDw/LyR+NC2RPS7+/DvGlJvxsqJ8nlKo53bX6doJUETJqp+6YZG/vxYzORAt2KaoHA2
         5k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207485; x=1793812285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBAS8LSYWCRFarKET5k50Emev7tmcCz5Lq+Z90k9nVI=;
        b=FKT3wWlcxp7LGWpDN2t3U+64IQhmn8ZPREXpeKoTFa3dkq3uQWcCG13m1coa890d8H
         siB8I78y3VgPubRMq3G5eLM92u52Mg2cB3gI1jroFAGsTub39Fa90Uk4i65w6xyMjlUK
         +n0FCXKe4WzrvgCoVbwXA3SwNvSq6A8C0BeZtf5ru7GdzVlJfV1Wt8oDf3Ca09FxZ5Zu
         xfM7vqNOTduIdGtb7Y0PxhmoFjEiatELQiADbt/DNgJCkfzZI/QANN0My7hUwSKxIInP
         MsPe5TS3iRWTtlt1wWere/pZD9cOG9YXk93sesHl35tp2ZsHmAXNi5neB0H3UDe/CcNe
         o8Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxR9dYuJuz2OZJfFwc9L1WeqxcJsrYPK7+J1tD7sb9Nsetg1Or8lAXkqxBuOuKt8TpYjyvbMICZvISG1e4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6z41RY3xe2wma+BKv8z1fbRDtguGSGYay2xk80VB9ACH0DlzL
	UjXj8tLU8qr9RHDuJ1gx1nr9QJ4Ai3b63b4LkkKxaByMtoVNOCGQIDq4
X-Gm-Gg: AYBFou3lD3hUK6Tj27Ar3tSQAujYXGjOW/uLAC38oqb4eHCVSzgDnFx4U2EP46V+D5x
	qzCoBfCxFnpKQyQAhV67jy4O78HAhk01J/ly7K4wZTsoTqXsU2yhTwTQGAFz4Ua8uqnJh4ayxIU
	rxo49KFSY2mgRNXPYSoPI5Eh0Aov6+WNsV2t1CeB5HEjC3g48MghW+ut2zKFtonl1NBYSmFNOaq
	RWabnSp3Z/CeD9mmKfjEjJIhJEGEfzpZnKF6Gh6S3ZK8mggSm+61IFCk1VuLoBlsUXsfJjDH/mn
	gHad8M8Wjf2xCHqQ93z997n7I/koCw5qxvCU06Pt3f/IUkzxYH1bx8LjHmJTVh9YS+F/3Dxcj77
	HLzyu4H1kLqjKvJBl4iKBDk0s4pNJexw9EjO/URHGY7ERTAIigU9rAPhmPrgKRC4vYkrw7TbW5p
	kKeFiPy6Ab4QYGHkcFfagInPqsEi/FbUKcGzjeS6D4rvomxoOkvCsRMlSuM/qb1BfcgsoZA9lsr
	O0vs2R88g3Md+Hiz/jEYL3eKc0w7ePcUX0ToWG7wutBTIxoieGGm7HvMoBrzTVqes+bWxyMDP+t
	omVBE1nWA0NKkVJ3qoNuO8Vn1lp86wheO6OBkX75+FWp1THMwmosBemUs9PKkV1AA3uA/GHdr+2
	J3yqO8kU/ulmQN3WFVLtzmUu4rHpyLG/rqEAl58ta4Sdyjw==
X-Received: by 2002:a05:600d:8492:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4a9672f7853mr41963935e9.21.1793207485112;
        Wed, 28 Oct 2026 10:11:25 -0700 (PDT)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm4897195e9.8.2026.10.28.10.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:11:24 -0700 (PDT)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com
Cc: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com,
	bhelgaas@google.com,
	robh@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iav@iav.lv
Subject: Re: [PATCH v3] PCI: rockchip: Don't lengthen PERST# when power is already valid
Date: Wed, 28 Oct 2026 17:11:22 +0000
Message-ID: <20261028171122.3422629-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <95aeecc0-2794-4cc6-a635-5c042afc1405@rock-chips.com>
References: <20261028005603.2399220-1-ehbello@gmail.com> <cf541723-eb4c-4ba6-92c5-33baafc20e7c@rock-chips.com> <20261028015923.2436122-1-ehbello@gmail.com> <95aeecc0-2794-4cc6-a635-5c042afc1405@rock-chips.com>
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

On Wed, 28 Oct 2026 02:21:14 +0000, Shawn Lin wrote:

> Was it possible to add a DT property for configurable delay? I came
> across several EPs need quite a longer wait time, so add it in the
> vendor tree for dwc-based IP[1]. That could be applied here to slove
> your cases and others', and might avoid regression.
>
> [1]
> https://github.com/rockchip-linux/kernel/blob/develop-6.12/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L865

Thanks -- that is a better shape than mine, and I will do it.

I will mirror the vendor driver: rockchip,perst-inactive-ms for the pulse, and
rockchip,s2r-perst-inactive-ms for the resume path, since the two paths want
different values here as well.

One thing I would rather ask than guess: should the default stay at
PCIE_T_PVPERL_MS, with affected boards setting the property, or should the
default be the spec minimum, with the property there for endpoints that need
longer?

What makes me ask is where T_PVPERL is measured from. It runs from power
stable to PERST# inactive, so on a board whose slot rails are regulator-
always-on it is already satisfied seconds before the driver touches the
GPIO, and the 100 ms then only widens the pulse. The one pulse-width floor
the spec gives is T_PERST, 100 us.

On my board that difference decides whether the JMB585 answers config reads at
all: 0 of 5 boots with a 100 ms pulse, 5 of 5 with a short one, with the
power-settling time held constant across both.

Keeping the current default is the safer change and I am happy to do that. I
would just rather we did it knowingly, instead of carrying a number that was
only ever right for boards which power the slot at the moment they assert
PERST#.

Secondary question: do you want the vendor-prefixed names, or would the DT
binding maintainers prefer something generic, given the timing comes from the
CEM spec rather than from Rockchip?
