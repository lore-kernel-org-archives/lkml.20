Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807221;
	b=GrsbxewG3B/aD3AGUw6wAgPzs+ob2zIu0AVw67mV7VrhrelOW8W++fqaAciG3yGSDye2
	 8woBKHhTMg09+L88LdnUheQxfpkk33gUBXEsLuh2Ae5LcrDi5rUA029sr122BTBQHR5Nc
	 v+i/PLUsf5kWl4ZdomODWjpaveMHQjW5rNR4dlEy3LXIvvRzk+T8yuM2fbtFQHXiDfBxp
	 1rDfHmBt0h2RbMNYi9Ya8s9Gi1bAoIlSk8/EwUuFQAdwhf4j3FJ28mrQhcSRXCxJQ2jZn
	 4Wn86G0ZrEhwkhkIcQ4B7rx2Cq44PtA4R9jW9cWr4D2UX8nfWNrgUtQsEC2z6lWy/cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wNNaGmO3TjxJeE3rr/zcwrts5NAGa4JXX7iwP1R00A8=;
	b=GIMf/5ruswgruCDEjb7laAGNoop1mJd8lGpx8viiWZS+6lZzyzpiheCqZN+xmLrvojra
	 srLNANv8ZyENJhMYMlunAJj6nVAQiP+EirvBsnqr9IyW8DY7b+Q4706amUHQHGtbnU8U7
	 g4tQXCqS20SDtXWjb1tfvTr6KzZSV5PNUNTsNUDXhCrU43+P88INs/cWKGbL4B+tr24DE
	 uvA3X1n0Rg4Jte1UdwXn8PlxSc7YOkMi6nh+8hTxDs3RVUSBwI1Q7NHnq5i29mjNEMS3w
	 MTxuDyL9yWwaeO7et7GE6st12ewxueHMSojMLukobYqZHkIeZuhKnRVJ4EiI+Zhwyaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwCSiAHe;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319F606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2319F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwCSiAHe
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so421079a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807220; x=1794412020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNNaGmO3TjxJeE3rr/zcwrts5NAGa4JXX7iwP1R00A8=;
        b=LwCSiAHeyM+W78Fz+17XE30MXkcm64I5GNo+cbCztRz/GcdsQX8EG4XFWzyWJV8MdR
         caip6JTvYWPmxLtEzXYwskhIEG4Zb5Z+ZPCQ1XKuY8+nRvCswgKxzRvBUiHpe2VVGulE
         H2LfuG/O8Bjq8cvOfuzcmqG1QnQKjjXD03DG8sfooDfAfvgZExpp9iVR6KsPwWoA9HuB
         ZFc/vC8+AD3e7LKTVe8xFgobeMRak1ciP+Omgc4F4KAKQSQQuPvya6NM/AgKZmXX8I00
         QCZXpSUYWifuf6q55VUDvshVkbtJm1SHl8qX3dYRzRZ3OJBZgk+DpmIGZ8KEtbCTIHFV
         Z/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807220; x=1794412020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNNaGmO3TjxJeE3rr/zcwrts5NAGa4JXX7iwP1R00A8=;
        b=z31otCaGXt+FSQCQSdUxfwjMxFtLlqyoEBBAB+38pzG/saSXTixvwNSmG5+CWilxv5
         dwYAy8pCi/VwCd0LD+tE4DiZviajLC5PWXIN12NH/fBILJGMFOM+TI/e2Ym4mjGk5uIP
         P1lTj5KG0GdIS8h7h3TYKqD8jtSRF32iSV+Z82x17hLERSa4TdkI9dp0OoZwFP7dfo1A
         Q3oY9STzihqWlt4IFD7LibTQUyQUrITlynd9r/+6Sh0v6icUYP/CsPYHsQR7CF2aHN2+
         ugzEHXDR77sW1g43HjWHtFDbFmSQe4nGPzxb/L+1m4KMYyxlLgAO0XGUEQuZREAt3Q6J
         y7tg==
X-Forwarded-Encrypted: i=1; AKwUvBzaMUt9wKqOS1nDPOLQ4GcSrMAMczRq/m+NA7I52Vc/Kau6MdxVTBds/iwiESFxm2I7jP77d/mEo+uGYqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wJP2TIc/BFmI0+P/2INvqT2fOwPCuidLqx9HsJTMyatxps5UP
	jaqu1mxIWptaEJlZkzIiKoM4AlwYFEjsO2v4sgql2SI05XG5ybMFXfGLBSZ/9A==
X-Gm-Gg: AYBFou3r/a4glEkvGokjaLto18ZdMs9pbEcQpdFeqck3cqNkBKZYz/HwQq02fpxR+n5
	nT9sWYz93OjHn5KArhZNjorbh1a31/z7tE1RdU8C3bik9mw4EX8T+lNG9JuOza/oMc1PZXE7QjO
	K0JycadBN0N0xo72WdfyS/UsxmfjqLpLa8E6Cw8LkwWsx6T0VDCLZvl/YExKKbaxdq5LWTWL6jR
	lCOaG2xemd8awBXicuYsSuzNVJQKp79Al4eERPHad/14+r55Fw6UTLw3DpUH/HPzKVGgmButIEj
	U1u54p973Jx4G7kFWSELXzOOXK2CnuUNDNKw/w3wOKtz/kemZAoBEUPs54SNP8e9Vmmqdj1uGgn
	9o4b5FgWk4vtkmGmpmUiKIoLgONRChHqxEhrPx1q9QJsySZzmh+9BjMoPQTYiwGozWQ1gZ6vI+k
	9r9B2P4lpVX+Wk7C/T7NrrhBj/XyXR8HOuuIUIY1mqYDdZPd+m0GRKWiTqSuu2y3/vCEGiASkz+
	ZXOd8v7P+fbjuH5GRrTgM9ZCerv8PSR4Ec2VIWGcWaVlFQjnqpbSb7FDElj5+Yl6B6Z2pm2mcUn
	OmNZFuBx3f0nwsCXabiJqHDAxRUGYJwTis5yLB5S5IXD+UfZ+C3w
X-Received: by 2002:a05:6a21:7e01:b0:3e2:8c23:5d35 with SMTP id adf61e73a8af0-3e9283fe807mr10344582637.0.1793807220363;
        Wed, 04 Nov 2026 07:47:00 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm1372632a12.20.2026.11.04.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:46:58 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dmaengine: pl08x: Use the channel count from the device tree
Date: Wed,  4 Nov 2026 23:45:39 +0800
Message-ID: <20261104154542.3131916-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104154542.3131916-1-mmyangfl@gmail.com>
References: <20261104154542.3131916-1-mmyangfl@gmail.com>
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

The Hi3798MV100 DMAC is a plain PL080 except for the channel count: 4
instead of 8. The part ID does not say, and the driver takes the count
from the matched vendor_data entry. dma-common.yaml already defines
dma-channels for a controller node. Honor it.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/dma/amba-pl08x.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 33ad6c42cd7f..9bcb4a3cd5a0 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -2698,6 +2698,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	struct device_node *np = adev->dev.of_node;
 	struct reset_control *rst;
 	u32 tsfr_size;
+	u32 channels;
 	int ret = 0;
 	int i;
 
@@ -2759,6 +2760,16 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		vd->dualmaster = !!(val & BIT(9));
 	}
 
+	/* Read the channel number from the node if specified */
+	if (!of_property_read_u32(np, "dma-channels", &channels) && channels) {
+		if (channels > vd->channels)
+			dev_warn(&adev->dev,
+				 "using %u channels, instead of %u from the node\n",
+				 vd->channels, channels);
+		else
+			vd->channels = channels;
+	}
+
 	/* Initialize memcpy engine */
 	dma_cap_set(DMA_MEMCPY, pl08x->memcpy.cap_mask);
 	pl08x->memcpy.dev = &adev->dev;
-- 
2.53.0

