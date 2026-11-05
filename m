Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884595;
	b=LJjeD0BQQmfb/oWBXxKqGBWb96Bb66cO0oZVGSv2c686LgvQjYLJ4qcdpfodLvbF1vPs
	 1CqOMtDY5Pp4DTTPQx4ZsdGFopB8TMHpoB0CmTy/aUKAC2HHkDYJt773/uhBpQ57FrfrU
	 FV3NE04fbXa5+VCALUjaZ4Vhltrm+qwneBeB/7qWnrVRAkgo8kSMyYol687iUEbHTvBhM
	 uoKnrFt6JrmZFfO+MmRDAmRxC1cjK/oDWT4B56CRwLSH6nZFSJPeceEtO6oW6D2Ba3DAz
	 PI5J128KR7dFXP2lNXefckE4jaWe93u+y8O38b0H+XD00N3aVheUdLao99cSkjL3dtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6mxWBwIYL2Hy5NVtOCWPPkiruMQvPSnA3ve7z9sZrNE=;
	b=FBS7N7AdQlGJUuIvP4kB8Hj/1SMxw+2KVUXRkCJrHyBVS1bexIfYmy9ab0JZByQ4s7OM
	 yYxXVUQ96S3Ba7WW8IE81VxbnjAFOWZVloZc8RLKIy/urJ+cfvAoJPgcxeJmkYjcK7Rj3
	 Rj99zh7G738DiDO9FTp5Xuo5J9AqxtExTWME5OziFj2NZVQy1iuU4TAfvL48JEASV7A1s
	 4wt+0YR+JUkC/eP4xaCYmF2Zl1jJgxlBLiCxhZDpLz8wAQwSj4SPylFIsQpl7Bv0pclAH
	 WBbk5uakkGFiNdvPB84o2QrisNc2UfbIZBwg7If1t2BPQWkB0RX4lNJCdwU0LbJS2YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jrlFr/Le";
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB57606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB57606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrlFr/Le
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so16712351fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793884593; x=1794489393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mxWBwIYL2Hy5NVtOCWPPkiruMQvPSnA3ve7z9sZrNE=;
        b=jrlFr/Leg3DRlXDUvgLbN+j+d3+SRiGujKLzOvLaj1hoZrD9uT2CJZ+BETquXeXRdJ
         i/zEkUO5ztSznEUt0iNhxDN8cjyqo9baFfLd/uE0NoMI/qQyaosN9P+frVQZ43EUXT5W
         lk+GRuBk93dOam+HYSe5QLN/XTStYt8CeOXEufsEYlsVrw/D+3g/Tyk51mZvtZ13ZpGy
         sbCdQAZepwTrVohzGmOVqpCJ4ssWgX0+LBc8tjIfc9RtzKnNVQ3iUzjHvZ/soW/W1O9n
         ifB1xReLjgjHaDRdqEeccGY0e+UTbuF5klDozRUh12DC5vfm0MVchW55bMpRtDCgqU9h
         Q5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884593; x=1794489393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mxWBwIYL2Hy5NVtOCWPPkiruMQvPSnA3ve7z9sZrNE=;
        b=uJJzOs9DXzdQijeAPGTjdZqILpk1jF2Q191JFXhAKN1CfgRNQa1KdduCXxrhzjn70j
         RBv5V4RPufGhyEQ5oUjKs+RgIwxyeQGLbhcfyav3HyphobOClFgX3ZRbEauORQ9s7R/s
         uvrBrtk7Qv5DiHj/7WPAQwgu64TnLfJZPg7pNSQjMRLPjihxGy+SBdg+WPwCuLRRWySr
         i0K5P0bJxuYh+4acBFOABtMuud/RxP+S0QbVa+RqUW9dYKkKX/cnpZEiTjjVz69LgKQH
         lb7vYBrcR58WDhksZVkX4p06GnmLc9ZNi5MO4rBio5VIlLO1u0TbI/tLTPZi5zKuHeHs
         tlTw==
X-Forwarded-Encrypted: i=1; AKwUvByOWfhcCi97p+LmUIY3ajl5RDhH6oLb4hVKFnzXLVO4at4d8pt7fGrEkn9X47YO15es6UOydBt1lSmELYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9o/AKayb4RcTj6D5DKsA/Gz+lKW06OzF+hDJexl95bs0yqp/1X
	lC1YLcXR4deq8FYll8/CMQHxHdgdvZYcm6+g9ZEDZLKLJl5/1o7vjSXDMEPboW+X
X-Gm-Gg: AYBFou2rP42RqcWqtkeeminA8voOvNb5rLTfJnNznyeQV4zPLZiSOJ3iEa32jCzCgCA
	JhlfC/tw1yMmWySl70sa37cUvvGTS8BPyccb4RvLy3rk7u8/dpDzULGQhZFOAfzt3cI4Had+HPO
	f5oUATbE1C1Tq0M9HpP166kGnKMx87CC/I3P9Kd8DCoXjHj0ru1nc2Jdyr+0gIOUr/iuawNWZQ2
	7yFGrLbu5/BvUpjc4ZLvJu4F4/gC8uESKyjYXKYFsgmR+Oy3ff9U1XUIaaOnUObd0dFu3HTuhcn
	alLgyNbHhfsnD/9myeMTE6Jg3fS8+i6LaI5WpqPjJC5jdz5drMPPEGG78tbo1Q83rHS0z9YrLb+
	vrDEcFKbzqk26XSBuhfoGFPBtISSU2XjYMIJry2fgZbQ1NzptCh7y7dz57ZBEr7SpG85KJE9opu
	2K88BposG5EvFRyrC2TGGJKHJ1nc9YKAwrzNK5OugAf1rm6TZhpayp4udUClly1rz2xCj6UTuwW
	MBTnmbi+d1vL++buKb3x0CCT3QCXhafnox7FnpN0cOl7xoRA1/WGAsJo+C9QZ6UxxbibyqWl+sB
	svZTOBgbVAfeLH+UTuPTKwTinP4m8ZItRI9Dmb+/Jbqh
X-Received: by 2002:a05:651c:150a:b0:3ab:4458:ba24 with SMTP id 38308e7fff4ca-3acb7b44b89mr54522391fa.21.1793884592626;
        Thu, 05 Nov 2026 05:16:32 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc37e536sm11313651fa.3.2026.11.05.05.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:16:32 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH] dmaengine: axi-dmac: fix incorrect segment size calculation
Date: Thu,  5 Nov 2026 16:15:47 +0300
Message-ID: <20261105131547.305510-1-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.47.3
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

When chan->max_length has a value of 0xffffffff (which is a possible IP
configuration), DIV_ROUND_UP returns 0, resulting in incorrect number of
segments calculation. Fix this by using DIV_ROUND_UP_ULL division
function.

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/dma/dma-axi-dmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 02acde918117..0a308630e542 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -707,7 +707,7 @@ static struct axi_dmac_sg *axi_dmac_fill_linear_sg(struct axi_dmac_chan *chan,
 	unsigned int len;
 
 	/* Split into multiple equally sized segments if necessary */
-	num_segments = DIV_ROUND_UP(period_len, chan->max_length);
+	num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
 	segment_size = DIV_ROUND_UP(period_len, num_segments);
 	/* Take care of alignment */
 	segment_size = ((segment_size - 1) | chan->length_align_mask) + 1;
@@ -753,7 +753,7 @@ axi_dmac_prep_peripheral_dma_vec(struct dma_chan *c, const struct dma_vec *vecs,
 		return NULL;
 
 	for (i = 0; i < nb; i++)
-		num_sgs += DIV_ROUND_UP(vecs[i].len, chan->max_length);
+		num_sgs += DIV_ROUND_UP_ULL(vecs[i].len, chan->max_length);
 
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
 	if (!desc)
@@ -840,7 +840,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep_dma_cyclic(
 		return NULL;
 
 	num_periods = buf_len / period_len;
-	num_segments = DIV_ROUND_UP(period_len, chan->max_length);
+	num_segments = DIV_ROUND_UP_ULL(period_len, chan->max_length);
 	num_sgs = num_periods * num_segments;
 
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
-- 
2.47.3

