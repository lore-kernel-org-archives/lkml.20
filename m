Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481423;
	b=M+FaqyQkpSo2MzjxSbTBUTiLiDfMITev5rCpSlatGm+eKZ64QXfGR6H8IuhMy0Vk/2bW
	 BqjjvFqW3RA+PhzjR9Y15cwVNoAVk+gNAE3Sv+M/nt3hyzKQIgG/uV/voJ+0h7msEOHtx
	 Xxhjh8cj7vpAAdNdCgs4vGkT6mOoJAIGsImW1vwbYyT1DaKEs6bhbeOTt0MKRPgCTRLC6
	 z9tJm4J/HverWaoDZ5QYUq7T7vOFy2dlttwGA5M34xQOMFoGIvRZWyN0ZF9U2+XE1floU
	 kNmHxST7+R49OCkBNFAQesslrLoUFw3R73pnit0d8MIfo1bWmJQWjGhN/drIItDf+pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5tXRrlu6pVIT1vr+YhxUcVgo6aTbfODu2mQd8Xde0q8=;
	b=fA0p2YyZP6ZddV2nyKhjtQKqUxr9iNTsJY9vtBTEvOn8ipyP4R4XW5Rf0bNuRG64w6e/
	 ecpp6juClcPSciLmAWTtj1jwj7Ktq9s/xl/5iCNaehYiVtAO/2mqewFxiNKYMpqt9Yzns
	 vTKguiiT/PVul1DV7bC3ToXHKCmSXFMZOoszYXIzi53ei/qnHGHT/Nn/o8diY1z5b7VsG
	 2djLY3BjIhETG4olEbgxH8dc0UAqadQ+fG/jntPj7Z+xdpwXIdOfKbj4QEM9EDlOMcTue
	 Z6DsGLjoZE/AcTsLajUp5J47poNLmf9aobqgOtZkzX/DhKYqJWvt4pMWx5A3mgFI++w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xb5+MZMU;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B648606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B648606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xb5+MZMU
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e0d1da913so321485f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792481422; x=1793086222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tXRrlu6pVIT1vr+YhxUcVgo6aTbfODu2mQd8Xde0q8=;
        b=Xb5+MZMUDvQCaCZuh9EZ4ZzyQco/Zspi9lD22QhWEte1S5PDxeukLjC9KIi0HEvQKy
         6Sm9GOBmq7J51BwM4vWqnGSYKfpnJBEk8XM2ZlKHOUAdfJlOqr+gEI64dDEu9NXM/qWA
         cADorGr8FaZnClXEgvRzfs5qDEjqaLAURGiBtCZ3lZonwccV8/3soVLsR7QMc1QRf5ON
         eT/Ws+oxEpzU5ssn31xsAwyTH0Ef0vvi9hjXQogflHJng0XPGcIQmfZR5KiDzq0BKqOW
         sBsP1BilsC9NDx9OLXlzFmye6gWr23ytGoW/NLK0CoSH+fPdSImtDBNFfB7rVDXe6LFE
         Q1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481422; x=1793086222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tXRrlu6pVIT1vr+YhxUcVgo6aTbfODu2mQd8Xde0q8=;
        b=25Blj3cp9HGAURYyWHcZAev2DyOF1le7aeJQ/PeggLH0xeETaDa3UQKu2AiLt/3AUO
         E7buywk1hm07EdnGPuLraLIty/3l3HwpAKVeYygpFHus3nw8esTI++Ir2q5VU7tBd9Vh
         Z4BYTaybLYM/ujq2tgI75zUju6U1cor1HT1b42kDS7Nfg0JxXvcwwwZ6nbcZrKnQZ63E
         YEPExE9LP/uFrGH9BtbE1tTIrhAosvhqg2LTtjsxS+SuzquVBOdsGIOhm8qJW6QhczUY
         o/T7y0qwhdbYAXSaBpKDF+RPTl016uh/2Xpd1ftqsChO1n11JIumudb+ZmhelW/cBp1E
         OvUA==
X-Forwarded-Encrypted: i=1; AKwUvBwzyVQYNoxbxCx2LweYj5hQxPTXd/OYqZ79hcAwsYXwc3zPXCYIyJQeeBDTO2j54Dxg/sqAMPHq0CVZ+Sk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3uUoQElbAljgR+X8NJzmtM9z9DaLrKLEkEVNr1ivcMlTCDA9w
	2mkiCaFSL/dtmJVQWXdg3Lsr+IXevKYEfCjLSFATH0V22MmJiRLWSjkT
X-Gm-Gg: AYBFou3GJ1Teh2V/TQENB/4gBFJ/ar85kDdKeURfkdgTZsArBxT1IALB1vDA9g/xotj
	E8g+cSyAdh8wo4wrxMVqYZ894R7dr1sDFzj4xsREiPl46pORSO/aLBYgtLl956nU/XVZonWNd+j
	1ff5lJ42WQtAc3OeR8k5IrWIw1NC5CNpPxn9JiSCTnu+XkVZf2bJlGd42VrXGvV3CBa7dTatcWA
	wXpntlKYRSrbhy2xlXqVuhbRoEwRvXdp1ycXOEnDvIcrgxdL7C0CfbcyXPXhSADjmtFhvsjZO7p
	v7eK5ShBEVkcw7kRI9Iz4Pzknjixcc4BQEfngNspn26N613PP9RxtmsSiqFQ+8BSqkLtP0SA/AS
	OBy9axkeR8qQEcUupSBfSPxwVDdpHQbPPsVI+rXPkE4zj6ppDZBb3b7J1urLUIeFzausO682z0n
	QRmJosjjjGjSPuqg8Y8QSm/6YDpmALC69BPpVg+ONGkkrTjCJIiGu8Os67HjXp8JUMH3zD2+xg+
	H9xTaEm3Jzt6AY4RxFgAUA=
X-Received: by 2002:a05:6000:617:b0:48d:f160:efad with SMTP id ffacd0b85a97d-48e1e9f12c3mr3046877f8f.30.1792481421580;
        Tue, 20 Oct 2026 00:30:21 -0700 (PDT)
Received: from kali ([102.209.31.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d75sm4747712f8f.25.2026.10.20.00.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:30:21 -0700 (PDT)
From: Bashirah Lawal <bashirahlawal017@gmail.com>
To: outreachy@lists.linux.dev
Cc: Bashirah Lawal <bashirahlawal017@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt7601u: remove unused ee_read tracepoint
Date: Tue, 20 Oct 2026 03:29:46 -0400
Message-ID: <20261020072947.124586-1-bashirahlawal017@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The ee_read trace event was added with the driver in commit
c869f77d6abb ("add mt7601u driver"), but no call to
trace_ee_read() has ever existed in the tree. Building with
UT=1 reports the tracepoint as unused.

Each unused trace event wastes several KB of kernel memory.
Remove it to avoid that waste.

Signed-off-by: Bashirah Lawal <bashirahlawal017@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/trace.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/trace.h b/drivers/net/wireless/mediatek/mt7601u/trace.h
index 07696b672161..208ab8b0117a 100644
--- a/drivers/net/wireless/mediatek/mt7601u/trace.h
+++ b/drivers/net/wireless/mediatek/mt7601u/trace.h
@@ -123,21 +123,6 @@ TRACE_EVENT(mt_vend_req,
 		  !!__entry->buf, __entry->buflen)
 );
 
-TRACE_EVENT(ee_read,
-	TP_PROTO(struct mt7601u_dev *dev, int offset, u16 val),
-	TP_ARGS(dev, offset, val),
-	TP_STRUCT__entry(
-		DEV_ENTRY
-		__field(int, o) __field(u16, v)
-	),
-	TP_fast_assign(
-		DEV_ASSIGN;
-		__entry->o = offset;
-		__entry->v = val;
-	),
-	TP_printk(DEV_PR_FMT "%04x=%04x", DEV_PR_ARG, __entry->o, __entry->v)
-);
-
 DECLARE_EVENT_CLASS(dev_rf_reg_evt,
 	TP_PROTO(struct mt7601u_dev *dev, u8 bank, u8 reg, u8 val),
 	TP_ARGS(dev, bank, reg, val),
-- 
2.53.0

