Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695608;
	b=tijNO+aIk7lNOzYBr9vEonxFjZuthy8yBrgAs/2xUq7qWLrfwvNIfpRtKBV80LAP139M
	 Q4d+rT8SzLq+tFzTsfHUSooAB+jnd3A4ae0vC2aCHBNH2R0fCYr0d20vvUqtb7figQ2mp
	 /YE0T6bL1ECDecq3Dm5OrgLgJc44LcxYHy7ANbF9cgQA3dNhN99v7Cr4KUeUoCPRhq8M+
	 gPzeWADthdCONjBkOL/TOy/speICzVBaTMB2iakwOjv+iofHovAhsI9wV/xC0vi+ZIxqP
	 IOyXNN9yzm3Cxe0dDgJ3e+cdtbe9T0FuDi9+fhvs8ouu6WRP/46Ii6p3xYxg9uROGBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZwpN3MWkuJgEw/5lVf5YS3s9N6pKk0wMcXzClzDmDeU=;
	b=hNyDs+KypHTOxz6F4oJnZOuBswcgU7TnPCsfO6IltFLSKbw8pGlCJ4QbVBC3Yg6g1Nwy
	 ZV9p8Gz8s427bLNUqazhFFThXIM6yDxEKQcfuvvsXG46QFI3xjOdv+bLnpHJXe4g9J6g7
	 CF3RI7o0f3v/R3Lu7tmXmBV5WunsjaGKn5AgLxn2b11SDJqJ3YcaNBBmhcqjn8F+wQ2jX
	 ZugOXDsybdR3MuvSxaiqj+1nKYlvrdMaPGkaiXa/E7x/n7vuqeQCjnevpzr4RRjM5Tx0P
	 epQCsAMNBCVDwetGKrFtNOhshVW6UzPB2ORTUXfyNj7ZKVnMjO3/de5IQc60NX8shpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmrLDn5D;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6D606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A6D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tmrLDn5D
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso2375236a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695607; x=1794300407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwpN3MWkuJgEw/5lVf5YS3s9N6pKk0wMcXzClzDmDeU=;
        b=tmrLDn5DgdsgbIctBbIJsfK7Y2GKRlv04AVwZzWIVHmW5P1vliiZbYj/pkdJrN9YIc
         FU/twe4HI1RPmiFs78bzbQvbHNGn4JP883Uin26ttA7z/MK9FrCJtnMHZoxCXCZ9JX5E
         RNG+2684vScWrtFCOyVwj1z2d+Oa/Id82LBP/Pt0j2ljK5xQvFgbHb400AdmWWD4Z9rp
         N0PKe2T7nuxxynUiNBu43cDnwf6QSKRZttd9S8yAWslmyq8teVJpoEBZDTmFWYzFmmLw
         Whkr/0rTzrgEJkVBjWrvJn1lNvef03prOlIqd0tE5CwkMAgKIuPjbHcVKduRu78M/rJQ
         fLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695607; x=1794300407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwpN3MWkuJgEw/5lVf5YS3s9N6pKk0wMcXzClzDmDeU=;
        b=n72R2fnIQCd1DIaXBf2YwN/0mN0/muiouHX764mwjT185yrUtw/fWxqu/Vd2tRIyuX
         1aEsQuePwUIRdVHhyDUscWf+lp3nAdAzv73Ccrm/CFgEv6mnsCt7Co4QOYEMeWTHW9yd
         cVbWKjM3JsUU2w0IgeMBvyUG8gebk9LJcpfKYEVdLDT2n3XYkopOKooCQ3eu0MdLs+KB
         8Fbc4l8BS52/q2DFYFzy9c+Td/of5tB9vKWCBAOikedHPcwHIfIQ5km8AiPbtu5KJBUD
         Jti6vkSiVbVNZO98vhmWm4ZD8TAupfyXsTyL1SdG54KiyuY/eY0/uhySE1T1g4uCSJvv
         n/UA==
X-Forwarded-Encrypted: i=1; AKwUvBwoDB23JJ5+ewgg4L8BoDgP3HGHaGU/nllX3vS6wiilrIVs+t47I9StDVFdGJFYRyQltOmP1P7UKJdftuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DBBsxAPiFy4S6PekWP785DFnHefxK8PbKYMAZLtivIHUcGI4H
	R7bggaSxWqEaPR+Fam0u2vTEMjPXDyC0cIc/tbz0Ppe6LX5zqi9qMWay
X-Gm-Gg: AYBFou250+9jgKr86eEKbm/baEkCgWaTyGYXaBnVKJKxFvrX+TeEaB0/kl4cv5cxgOn
	d92RcuyvMqWYpX8iss+k9Z/kL1OquN0bLz57yaBCjqcJLS9SXuGNPB+esk0XtTn2z+koJFAU4p+
	FnODdxORoxhi3C+raslm0BwYI3KOZpv6cb4tW6sjSui1Fwcg6oRnzSwcf6rxu2yFieeU8jsVqFY
	CFSVvkkk9PRJw4GE3zhgamfxvz4EfisI2Ajt2L3RpgpfXTLhgaAHJzqizHDJHSlvG740cfa5JBY
	PtCRmUWiXqGLhLof2Kx/QqAQOkrSceqJFJMb73f+Cm1f1oRzDn4iWvFTyMgHQlHC1nhwixMA0dv
	eXKbYrN9cLhUsB8phVosG8qs613UQDqHAe0xD8qulMU5vsp3b8jED8UJcozdWQ6kB+tAJ3qJ2ld
	6EFuAeNyKA33bkOncr+3nWVISOxLMtq+U77ZQiB919hY21iJo5DR2EmxJ1qOCRCpvvoxCfIbN+m
	4RBHYnTF0SaaZetedsJ3KBDFrf0FJB1VgEUL+5E3D9QnDndv+Is3QoSgkcqYohoIzGF9wg2TwNo
	zy4uD4Qd31O4sQ438w1ZpiqUuDX4kZ823DggAMkyhJQzPB4ei+v7vepsCRJSnS9ekceJJA==
X-Received: by 2002:a05:6a21:1bc1:b0:3e1:8a96:7bbb with SMTP id adf61e73a8af0-3e928a24501mr11343003637.51.1793695607116;
        Tue, 03 Nov 2026 00:46:47 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364a8910sm901853a12.23.2026.11.03.00.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:46:46 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2 1/2] dmaengine: loongson1: reject zero-length sg requests in prep_slave_sg
Date: Tue,  3 Nov 2026 16:46:37 +0800
Message-Id: <20261103084638.1190232-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

dmaengine_prep_slave_sg() forwards an sg_len of 0 to the driver
unmodified. ls1x_dma_prep_slave_sg() does not reject it, and
ls1x_dma_prep_lli() then builds no LLIs (the for_each_sg() loop body
never executes) yet still returns success, producing a descriptor with
an empty lli_list that is queued as a valid transfer.

Reject sg_len == 0 requests early; a zero-length transfer is meaningless
anyway.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.com
v2: split the two independent fixes into separate patches as requested
by Frank Li; no code change.

 drivers/dma/loongson/loongson1-apb-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd2..e7eb40584 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -302,6 +302,9 @@ ls1x_dma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	dev_dbg(chan2dev(dchan), "sg_len=%u flags=0x%lx dir=%s\n",
 		sg_len, flags, dmaengine_get_direction_text(dir));
 
+	if (!sg_len)
+		return NULL;
+
 	desc = ls1x_dma_alloc_desc();
 	if (!desc)
 		return NULL;
-- 
2.30.2
