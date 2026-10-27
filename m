Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097884;
	b=Nftgr/Y4t9/XxH8GgE0XReVlgnBv49px95i09Zbw5zeErPgfbPM7YDcYXXKydWG+n04M
	 HV1GF1ma19WuNZSr9jxwW3QeznPhhJMMnQaYabSEVqatTI9aE4BgBXPdiV1hHpXMTSSAC
	 g0ArKrsXe/3AN9a9UuuYwsWOaWFPyoRaLc69LfxMwea9dLLp8RMor+3ZvOxE2tJ+hYOzA
	 zwiAYRv+dVXbv5Jfd6AbPIygzat/UG++Hn53stwB90OYFPGiFL6tQR4bEY26SQNectF6h
	 ijZ/kz/NvxxqBgzCwuMDIT6b5APzB5GfTYk5od18UOvApTE1gf78y7xMXtNROGSga0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8S+4Ca6+ZW0dJ/5s+MHcKgmRM457g71lb2YWMXhZ5MA=;
	b=zYLGcCIkIvFx4vvLoDn8tXkvjvNHat6ziLopSSmgpAemEasDskMfa90nGlOIMwdDV90k
	 k0l+t1L8Z1i0VbYB62qLI4DuUiKblAjIFUW4BQAwWKSlAehY7Gd1uwRg+1QhnYuA6Jyx3
	 Ubk4YkK87p5x0zBfFU/iE62nZnBhBjk9dTdXzhK8IyIZmr+7r9w7AuF3vr9DQR6Cw13kJ
	 y9b3bn1lkS62HbKUcZlm3/OWj6piTFO1wARVtnoOzZDE+XN7oP5TkIG0bcVVcfFbEagoT
	 WVimbrNRanrDyxw2SYtOVm98CvBC4Ok8jQXdgzAbaEpJlxtFlzQIRkjIJ1/HqNcU4fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jj75lsKv;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB2D60A2608
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB2D60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jj75lsKv
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so6130557eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793097883; x=1793702683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8S+4Ca6+ZW0dJ/5s+MHcKgmRM457g71lb2YWMXhZ5MA=;
        b=jj75lsKvrp/82SYp8I910Zvhw1BiUzMi4/aySvDv7UKE5qE6p72n12Q2bCCt5lwfei
         kEi7ttXSmxq+BXiEbdPnEVEv6PtZwORshp7mFbBIIBg+DN8O4PvlyJrJN0kidjqAYqZG
         vVXycfaUYl2K5V08lvSSYkSf6ldSJ6TVBnnWcAylJO2ouSCpj96/v+7Eb57sLdQpEXzb
         QyRrBI0PeU2YxBElYp3BXy1sc5SvY6IbB6chH68mfcjMimJOrlUhg9MIpm2r9d1nY3jG
         Y1PNk5AEfxkJOdesREog/pc4d2fjTZhk6VZF59zTXPM1qyt/x+p4R7e8AUfThF2AlGsn
         S3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097883; x=1793702683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S+4Ca6+ZW0dJ/5s+MHcKgmRM457g71lb2YWMXhZ5MA=;
        b=Ny1qY8LKg7dzIRT7BvcX+9pYk9V592pkEu2Mf3Xua5ft4IWHlODB89ekVni3/NDCbY
         EKn9lvHbHz8IgTe8KWqt2ET3SWgiH0ch9MMLlzy7C4DUx9R7zymu0I1lAPIdoaae8sUj
         VqEElOXlPGdMmlFBnbQBUrkci5QwPrSNZrEU0YuwIUqpFmeHInL1nmBTit7LpWHeFvLn
         8sYJsO0VXTGe6ZNbXddJIL3lZno0zYVxV/P46nworwa2AZ0iNDQeOgr70fBCU30epjBh
         yXGBP4ixH30ScN4aaUbJBf2DgfFjO6w9VWQm6zNmC6JE5HwzsMAc23eGRHmxa6hv6SKo
         301g==
X-Forwarded-Encrypted: i=1; AKwUvBzKryFxwzOsP1yvOWIlf0hAXT9JmGHii3vcbXb7sN4LOWoSfAEjB4nSlzKpX1M1rfru8egE4nSBS+t4wLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvsc7wtlkYkkUzoGVrG5HDtZtiP7vPPi4wZXFSB5PcRU5bzMAK
	HtUKJwGr1ecWoIJzwQrJ1Uyrv23Fr1QaehbTP2TDPMg1rvIQsx32UiFG
X-Gm-Gg: AYBFou2USmTBhcWVuJDQnHX7HsNSditIDgHclaCh961Akvi4JFf3diPZjpNVxna061E
	c1fDXigp7sqnoifpqhu/jp9wukQiZFfoZ64ImijuVfuTeZDV6FCIOmlyil4eAowWZCBSCwR/P5U
	N7FSBoQW1tYx6kWw9JUv4Cu8DNAfaQVFE4+Egns7PbetGUmJewxOEwpI+yvkVue1hF1L7XZw5KA
	4TTAPqegRSwaOWRbaozwup2ExDtFSdcu8Z/MwSDQ1gvjIDW7GZXLfTO8mbjfvE90MPDR57ublqh
	j28Kd9ZfJt+p5eyG3zQigHBqvT2CZmRku6D3UtPNZEF/q4gfW+bohi6opJEQPAGFbEG0K5tN5ce
	eXn/+jflQEr4LGH+qYky4ZiEpMS41/smD3labWKHHf4zlUPoVqAppfz3V16ke5o+NzZ5RMVsdwk
	JufZK94Wj306d9LrvJAfBQpsxE07IOFxOaqlm4k3y7AnRQ4cNPeQYPsRkcpugGLZp/CIU4fxfQc
	+FAqj9KVrzAYqKzhj+Kzn3XhzHLznzj8fwcYY+MNi9ne0nV+4qHaVW0SNsV0q2ufu1OjAS52EmH
	K+btrEnD
X-Received: by 2002:a05:7301:1828:b0:369:f9c4:1fda with SMTP id 5a478bee46e88-369f9c42405mr10913555eec.27.1793097883083;
        Tue, 27 Oct 2026 03:44:43 -0700 (PDT)
Received: from Zoro.lan ([2409:4090:2022:b00e:72eb:d31b:8aa6:1b54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm31955745eec.4.2026.10.27.03.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:44:42 -0700 (PDT)
From: Vishal Satle <vishalsatleit24@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vishal Satle <vishalsatleit24@gmail.com>
Subject: [PATCH] mtd: virt_concat: Fix device_node reference leaks in mtd_virt_concat_create_item()
Date: Tue, 27 Oct 2026 16:13:45 +0530
Message-ID: <20261027104345.172612-1-vishalsatleit24@gmail.com>
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

In mtd_virt_concat_create_item(), several device_node reference count leaks
and lifecycle bugs exist:

1. of_parse_phandle() returns a device_node with its refcount incremented.
   The validation loop calls mtd_is_part_concat() directly on the returned
   pointer without releasing it, leaking the node reference on every
   iteration and on early return.

2. item->nodes[0] is assigned directly from parts without acquiring a
   reference via of_node_get(). However, mtd_virt_concat_destroy_items()
   and mtd_virt_concat_destroy() call of_node_put() on all item->nodes,
   and mtd_virt_concat_node_create() drops its own reference on parts in
   the next iteration of of_find_node_with_property(), leading to an
   underflow / premature release of parts.

3. If kzalloc_flex() fails for concat, the error path frees item without
   releasing the acquired references in item->nodes[0..count-1].

Fix these issues by releasing next after mtd_is_part_concat() in the
validation loop, taking a reference with of_node_get() when assigning
item->nodes[0], and releasing all acquired node references if concat
allocation fails.

Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>
---
 drivers/mtd/mtd_virt_concat.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 40b300021..6abc88251 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -163,7 +163,11 @@ static int mtd_virt_concat_create_item(struct device_node *parts,
 	int i;
 
 	for (i = 0; i < (count - 1); i++) {
-		if (mtd_is_part_concat(of_parse_phandle(parts, CONCAT_PROP, i)))
+		struct device_node *next = of_parse_phandle(parts, CONCAT_PROP, i);
+		bool is_concat = mtd_is_part_concat(next);
+
+		of_node_put(next);
+		if (is_concat)
 			return 0;
 	}
 
@@ -178,13 +182,15 @@ static int mtd_virt_concat_create_item(struct device_node *parts,
 	 * is defined is the first device in the list of concat
 	 * devices.
 	 */
-	item->nodes[0] = parts;
+	item->nodes[0] = of_node_get(parts);
 
 	for (i = 1; i < count; i++)
 		item->nodes[i] = of_parse_phandle(parts, CONCAT_PROP, (i - 1));
 
 	concat = kzalloc_flex(*concat, subdev, count);
 	if (!concat) {
+		for (i = 0; i < count; i++)
+			of_node_put(item->nodes[i]);
 		kfree(item);
 		return -ENOMEM;
 	}
-- 
2.53.0

