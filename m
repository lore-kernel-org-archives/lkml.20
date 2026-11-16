Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837050;
	b=VJeVC6LTl996gjnmgMLMcNH3r7B5OyzWQOPWm9e6IwAEfsvRBUrYNrFa7d9UalNWdKqL
	 o3WbksatopfHnMLGXoQaeBxxG85945yc5jRgb5o7JPXlhw3pfW0a9npCXbGZtNi62ZHiW
	 sd7J383MqHDqSnNMNFhwVIu9WGXm/W8GGpcjI0o8Sar5xhlcXQa6ZsOBK/Xxq7+hc87Je
	 nsL3e7NBLNpgpfY/vB2xBjDMgNwVHncumbC6J/XIWrX7+CbDyxLVhrpztphQMQflF/L/z
	 +iIWEK9vb3Yk22PyxognP7gtJLo1Os6AiqCDfK9UQTqOKQjmS96UT5l5iCZprkazBUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OfHQHM3R+bJudBxYYvhr0hB1WtSESOcSRLIVPlqiZOs=;
	b=B+an2lO6ZOtPh5AHqcjOsqf93wuvPWLVpa5OF4nVc+gZSK1kVEWiVzqGtVyZB7C3uOoO
	 gq2bxcDHyvWIhUWR6GvS7klIiN+k3sHDfOxos0YVJN1MZstnjUBZI8pl3PXBdPHv76pSX
	 izpMbt4wi9byatcmeLcZl8z09uraiCYr0/wUX1dtHywKB0rUTU5GnAna7SMwFZsKmH5PP
	 lOCPXrDU60roNY+SyIVWODCwWqwLj2DydsKEbSg5db+8pYmvXlbLF8IMG35Tvo/4dCcF0
	 J1x9YpHIPxW3aAE31MPxjKja0UGm4JWTzDWLUgJXPYqg86FJYoKTsQvdZ2Q6rtR+rPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBF+4URO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8243D606A89A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8243D606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBF+4URO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28687435e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794837049; x=1795441849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfHQHM3R+bJudBxYYvhr0hB1WtSESOcSRLIVPlqiZOs=;
        b=SBF+4UROMOUEWTue8WdlvuLI4sdVC24pYGuePfawZCeckwbe10Zs25hmSgoLcmjmWV
         fsf1P3RG5a9gydngTRd/PZ1fa5sYiUVR6SIAhHxjVJdlrQCwFMLyg9MPZLuNJLK7iIMD
         DeWTz3Nu/SegJ4Ar66nKt2JFG6+Jbmyackm5qcLK9om7fJXT21X53YYMcIGCjbaGZNKs
         xIpf1GbjjBGeaPDOQFrVQEgLWg/ke85kDJSjMKhR08cQKmLxXSKLAS5O6Fkk/3K2dLS4
         EmnMwWCpW6KloDHc6S8mtURRIBSjxSg8BjH4U7H2kRug9y4y+/5M3ogdTs5ckW0oHZKm
         voeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837049; x=1795441849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfHQHM3R+bJudBxYYvhr0hB1WtSESOcSRLIVPlqiZOs=;
        b=joXLMCs29506yEWmZeYublzRMLPMer9+xsIu3OYPBp9aUd18BwQVPgowsj919ZilMu
         cnEX2FlkbE4xtTyiESXx5BR2auGcJ1wvRENIWgVrwUvohAFyNIgxrDPKr1dTLh79MrAJ
         cmyU03CPT1WTxWmbqfFkmby1Zkmw9n1ABGpPkjjiT8xDu7vwKnl6HqEV6u3HObD5csS4
         hJZr0e57mBIoVKIaQjkwFEpgsvJHQlO2RFyH9KFMJliaSkBdEmrjxSVrbQJd3m19x6Wb
         bOEFmJhgtjzp5MH8DrORY3eMKHkZMFGcDpaNE064sRnG1d/7Pi6BpBZJLQ+oe0QcSgZh
         htZg==
X-Forwarded-Encrypted: i=1; AL+hErGWPqWtdF4XpBcOS74GGlnJ/UPR/v24jUYdpf/xZmZnhwGfyGX5yFNoXxX0vzXVKSoyUU3EUHoTWEX9UTc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ckS/Fl1g6Hhp+/9OU+WoowDMkF+f9q+XIawf8GskGDgAJ7gfN
	j39lrgnp9iB0F3fIJsI5ED/ar5gaRP7mz/HgfOI0WELQrJVyjpX8pLhd
X-Gm-Gg: AYBFou1G5mxAyv4kKZ3RG8jPSeOBVoQa7mRJpFRF2Aimpkt8D3pMCcWaTi5XzsLmov+
	iodZjx50vjR9a1NEd06oHpDKcY57E9uHpyck2Tn7+lSVRt+xoKUbC0qtCOwcruIJM2Nb6u8pPi6
	zGe3hbo++kzIHnHU9w6uhF2aQE3z2XeIrFFRiI+4vGccD4jRJv0BtjFtCVgAD6Xs1isod0tGHGR
	WRVzgAe/gucLeCKUxyaMqFtpp8UYTmgTzA4QuhUVpOO9LV94TF0nxQPGdxtGQXSlDv1xa9Xikdp
	BI7BnKM7DVNynFR2IF1nw984Gs2ZvjSEoEPgcUEXzGTPYVDhHTXcNHFhAIdI/YBlzol3Km3NSwF
	To80P+CbcyhqQvAQaMIdB3c0yHNe4bTiWn5WdJzLDWhVAa0vb0je4kP8lCbPQP2EJmBEzHRSBA0
	SZSzgoF5Y+IVCuutVh9314PGWwHgiOsJucUxehKhr4RszWRgLEGpfuRfQDadA0kEJvSnmLZmR2m
	t6zIkEF/1ghtFtmheIRZKk6btfGDETL+mOWLEJ2fFOLEYE9tlaM8yePUQtQYLKGPNSW8i0ug33C
	t74MTRE+e1jxqEGoc5POW6o2yxXbfm/D6E9QG9dF0H/s161OI/B1owhY
X-Received: by 2002:a05:600c:1d0e:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4bb55abaef4mr221596805e9.24.1794837048913;
        Mon, 16 Nov 2026 05:50:48 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6fb45a32sm69904235e9.1.2026.11.16.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:50:48 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] i2c: imx: do not acknowledge the last byte of a block read of one byte
Date: Mon, 16 Nov 2026 14:50:47 +0100
Message-ID: <20261116135047.1379330-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116124430.1358948-1-mehmet.fide@gmail.com>
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

Sashiko is right: with PEC this NACKs the data byte. v2 will test
i2c_imx->msg->len == 2 instead.

Mehmet
