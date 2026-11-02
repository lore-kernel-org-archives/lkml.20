Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623739;
	b=qjWIJsIcdsoeejOB+lQlPpS7kg3BhH5zmhkerQXLVmIeM/8tOc6l2Fc0PTOZ5FSC1RQb
	 eJznSeM+ncqiPAs+TTzGpHHAVo0vfdiRazDkdi4fxL6qALaCnPr5XY1kvdtfrS7/BHAxg
	 Y7MhSubHzEMhmaf1jaRW4Hjd7nNtVXEVXVJdUZGeGQ7TOR+ixlJagcqSGV/zqBFsn1oCd
	 XQajinEA5FzYkZPXUBPAlXsruwq4kJXsVwozhW8MAi03R237xpNJz/eUfrM3Z+yd0233o
	 xUST9sxDpSRpQ9lSVTYq2CRFC9oKA97eYa2zXJllIWg4ftK9J69fjvGnuHy/+th4nYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FHXKwfyjhX6mVoz3qAoilKz+1ex0M8UbC4u4Bj+pau0=;
	b=Yb1VUzG/K6Tm2GRgqtAtFbUAAfhn3HZFqnM+m9h5jjMcgbmSXq26IKYJE178qtGIlK4b
	 RZanMITkIDKhl7cFw65dRUJ+M6iR0oiBfMDMWuvlc5Fg/gqj2tUhCmXweRe9lc754tP8Y
	 eeUlC8wXzHUXqRX9zkbqPPkietElPqbwjHpKMIcYaTN3GQlYYDOJy+q6s3C8ArnFg2PhL
	 akBez2cq4A/ziUXAoECasouu3bFfPdKD8Bng3+TYNWM8phh+IOWeoT7wo92qBPfwMuCQ0
	 i5MQB5E2GheW7G9q7r8l10KfXSZkiKhToYAGl2cOu3OqddTqmEJ5RBexTlOjUF9xHDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=auizdsJy;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C0060A2600
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C0060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=auizdsJy
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1375504f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623737; x=1794228537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHXKwfyjhX6mVoz3qAoilKz+1ex0M8UbC4u4Bj+pau0=;
        b=auizdsJy9Ldf+7S8Yco2jp5IjDhkadRv9VqvTUgnZK2styt4f3erznGi6atB80o6pq
         xYX3KBYX8QfSqNbTKsowMMz3NRmyRZkmMNrkUXoMHOwYW0Z3K/Bc2sD1CWJiCQn8ts9J
         LWNzH8c/uhoMk74cWwNyp+Rfl4Wm5FSuF+KBhf3vJnGYcapv/xET46KEwc4Lbu/t97EB
         GK+G5/66dwGRCmvCRuYVM5hfmJciH+GYllsIMV7EO4XMcc+WVFMcUhBKbK6GCZJpIX9C
         uZUsglGN6vZrjHCgQvUQklmLOB5ogtTHHRpg4NMXbmHxPQAdmoJ+BwRIIvaBgbUZR10P
         16vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623737; x=1794228537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHXKwfyjhX6mVoz3qAoilKz+1ex0M8UbC4u4Bj+pau0=;
        b=m/P9arAs7O6A0MgjEBTj3lLvMVr1zo5df9U/y8MMbti5QisSqWxh2jVqxR//WuYfRT
         JjNpWPkoQhmFf2wkPog+1CStqqsO4CFp6VZ8j5sa4XVyjlrv5NXwXWMBLOv8fh/KWcmt
         GaHd0s+z0vtwXnLQ4l9pA+Y6BJCAJQqZaTEzkHu5YkPtQ09aEeVEdmudgxg3JgZqkaNf
         aMsc268xY8TxeAaJ/bBMaIwYcA+g/Ro8cJcfE3iGn96st8CuOHN2Qdjh/kU1ob6BWKRZ
         NOcI+b89KfKYtx8Vla+O9X8iApBGwXrKQgLCIQvDpZ8TCuKuefCA3yM/JqaNQ7UAXRd+
         pqhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBibvNwqVLMcBNenBzKM05v152mk/ZWrRMc39GhP2YT5nPFxmivnuxmsABDEUltOHH2Pvee/QFYmTYxt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1Tm/G0/ISp0RqEg0nlln3fYdnFnF78R1BSHHFd/FHo0xhrUtQ
	OX5ugIai6RzieiwDJRJ8olVlWAVJen/5PkKmdSvnqH8QsNi42BGOhZs=
X-Gm-Gg: AYBFou0F3jgqLnulcVYXpX1Fon9HAWnHFBxtsT0kWWcsH8AqWrNL8fBEPAN8MmRzglg
	zDAR6LXj9tfsNr9A2yR1mm/hCPGyKJBcVoaMiHYhm5LZwdTVrxDaLcKYhgn88uY9/xttaxra8fG
	ffQwJBtK/2Oay7H6/0XotG2YbnTH9DVGXqbcLRlCXNafIZPIqcLgXjG8CQEBuMpi1TSpEU4As7y
	VvZN73010bYYP0IXWtjQseWkQ0mfanAr85O+19HzdfMw2T7Npov3x8l0vAHtkqumqzrx26wwZZl
	5ikHE5iWLpvcxz56UQlVK4kb1dsqeZp3udB+ETKkK5IrRm+ozk4IX7n8YIAfgR/dtS0KRGo5H5C
	sZyLjGSzd+BmbpT87uvEiw8L+GmoAEaZixSvb1wO1DI6dvuxSq7cjMvQpM3+jVX2rMNpU84vQbO
	c2zhjS/72Pwitm0H3voPFkzPBy869SMAuY2//7+AqSNT2UNpXgPJQlOpY1TDMM8c9TuzI0EEXHt
	P+/fqpqrPr61Hqg1xcFaMtz504bNciq2/WgJcBrMwIsWqGdeG5+EmjA6qwD+JdOmywxgJ8zyg==
X-Received: by 2002:a05:6000:22c8:b0:48e:4831:ae20 with SMTP id ffacd0b85a97d-48e6e305b92mr23429203f8f.37.1793623737454;
        Mon, 02 Nov 2026 04:48:57 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm18719736f8f.15.2026.11.02.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:48:56 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/3] wifi: nxpwifi: validate HE capability TLV length in firmware response
Date: Mon,  2 Nov 2026 12:48:52 +0000
Message-ID: <20261102124854.325979-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102124854.325979-1-tristmd@gmail.com>
References: <20261102124854.325979-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

nxpwifi_ret_11ax_cfg() parses TLV data from firmware without checking
that each TLV's declared length fits within the remaining buffer. A
firmware response with an oversized TLV length causes reads past the
response buffer.

Add a bounds check that the TLV header plus its declared length does
not exceed the remaining data before processing the TLV contents.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/nxp/nxpwifi/11ax.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/11ax.c b/drivers/net/wireless/nxp/nxpwifi/11ax.c
index dc1e747383eca..1006b4a84de73 100644
--- a/drivers/net/wireless/nxp/nxpwifi/11ax.c
+++ b/drivers/net/wireless/nxp/nxpwifi/11ax.c
@@ -215,6 +215,9 @@ int nxpwifi_ret_11ax_cfg(struct nxpwifi_private *priv,
 		tlv_type = le16_to_cpu(header->type);
 		tlv_len = le16_to_cpu(header->len);
 
+		if (sizeof(*header) + tlv_len > left_len)
+			break;
+
 		if (tlv_type == TLV_TYPE_EXTENSION_ID) {
 			ext_id = *((u8 *)header + sizeof(*header) + 1);
 			if (ext_id == WLAN_EID_EXT_HE_CAPABILITY) {
-- 
2.47.3

