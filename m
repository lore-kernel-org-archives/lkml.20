Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0EA4B9237
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329784; cv=none; b=t4u0iyKD7lSkUtIlCm0N/BFKMpjHEnYx5wLQTXK/0iMY0yMowzzSu+ZxkbdE+KGD2rFxXAfjPjNK1zBWfRC4RgYmkYE+8/WQDsokGu1YYxpRs/X2xgf+kMmgo7a1h6D/pGibubjQmw7ZK1uWtY+CmYubpYkKB1onDQx4mdfbbe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329784; c=relaxed/simple;
	bh=N2JeCWLFfoU+fSPfPomIYnFMAghodOlr4AC/9OfNW88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpZDgZrsIr2080mr5UWngY+zmDFAy+9WyDtb1PsCp31IDWGlbI0xQ923cIdIxq6nKZFCwRNSgfvjB6XEF/ytyMdbnEUNZm+W2SNgbihWvpOg5BeF0Ttc4QzRJWzIeGr192BeOQHnFJli1aVjdfxk+sqU2UzR57B2WlsqgY86vP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=it8S1AxA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="it8S1AxA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so12878415e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792329781; x=1792934581; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEOyoCt2AD7D1bry5/d2H2T1Ku2G2ZXxRyhNNZRqt9A=;
        b=it8S1AxA1z2dCvYQtcAJ/asxXvZepd29mbCl7mubTxwq9W9yjkjxUf4M3luu8aPatM
         kLl2PwiPXDPxdcfAdyjdFK1YY7/dL0XZ6EnC6XGFZ7OdUVva2g6oCp4TxNAFMZSWpeIr
         kYbwrcIuPp7sHsAQQzuS4YRGcXpTP6Z9UgEUEsh4AaCAMvBHjPjb4CqiRJWEjhw8jxEw
         pZ/D+HA9z9eDChc5m8Vb1VxpKgMpEHZSNO6UgyTehDXMAX6kYR4oJMKFqLp3v/Rcpw8f
         Hi6CK0l/bmkGqzKFyfjOcgdC5mxrPLSTcQQF1y6w1tUujReiP+ioIJtgw7FYzQskLL8d
         8sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792329781; x=1792934581;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEOyoCt2AD7D1bry5/d2H2T1Ku2G2ZXxRyhNNZRqt9A=;
        b=U9JwGooCFokKD/K0E8TxhR2ST6pgJ2FY6QQeV7t+BJmg4p9aD++QzIOX6NQMP2YG6H
         lJUvVTTBfSWF1UsQxK/O+dXoJeONqtUCWmgGaxMm5iCv92pcelmH0G3+jyFwGgDW81HB
         PmQMDOyb09DgNjD9xA4ZFZmVP6AnXRj/oeu6VHOUBi9SrqyffDtuuvHrRx1QDXj8PoLZ
         4HqkGkyQNf0CL1FRvHfnqjc0Ej4ZgObATXu12xrA6R30W0rvUENcOZvfDn4fI8VhR0r1
         sO9fmZRTZvcYy0tgt15fkAic5AdxHiLwIvg+5QIum45Y/CbPJq9pAgSvg+SkD+fmCIeX
         tAXg==
X-Forwarded-Encrypted: i=1; AKwUvBwDIlhcKZBOfDcv6D3t6kaMcK7rzaqfAGfyhsldKsOTUO/R5/e0sCFhbViu2EP0EbGqOaRZwviCxApqw2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUb3AHIUepSF7lnRxx7bxZzpjwSUiDCsPFoyx2bhkyA7QWFe2+
	HVzIjcH9wfqEaEYLYUQ4ruLMXDzwOEXIpKbUtUr2dVIXfrO2ed6XJQTs
X-Gm-Gg: AYBFou25V1M/TyqvOd+MyuqijCEZ7XxX6OcH4B+qSUJBENjSClokSkciTnNLXcbyEsp
	VX3NlVrEEmBfERGCPOSvBRjlFmQpRYL6fclpVFudpTVVZBc63g8D34XWafi2Jx6QtyLflfhUMbc
	bCDRhKeCtdGWpITzmWZuyN43upAcYTxK3rFm19+KIkkeghxh1c6oO+Wck3hcctruS6CzxxkspbY
	RFXQfbmTe9juRcRGHoaHAkNlY0mqLGh6f+3vI8lkJGjODJYUNCwHuHsOp9rfKG6ZA7JQovAOb8n
	NRagmlb93//0b79RprnQrN7+LKFMcZQmn9hYvsRiDND5/AqW1Us7r0dHlgQZ3DnTTVp62FggiD5
	g8RSKgzT4T9DKyIQ6M/flFe4TsAUkEh84hwosV1r2nAwdaZxpqeRuVQy8aJ+hGTp36PhoW1g3Z7
	P1BXfwQvHEyL/dE9XSbatCIFXm/9KIm4VVvITGJCWOuFey2qcal6Y5Qp7lFIink0ve
X-Received: by 2002:a05:600c:1909:b0:4a1:dbdd:d56b with SMTP id 5b1f17b1804b1-4a1dbddd68emr85495375e9.19.1792329781242;
        Sun, 18 Oct 2026 06:23:01 -0700 (PDT)
Received: from ubuntu ([2c0f:f5c0:570:10ef:ebdb:1ad:9af2:42a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ccc15aa1sm195044575e9.14.2026.10.18.06.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:23:00 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:22:49 +0100
From: Comfort Oyewole <coyewole7@gmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: comedi: comedi_fops: fix alignment to match open
 parenthesis
Message-ID: <atTIKehBxn93Lcix@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix the alignment issue in order to adhere to kernel coding style

Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
---
 drivers/comedi/comedi_fops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index c09bbe04be6c..efa6dc6d40a6 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -2648,7 +2648,9 @@ static __poll_t comedi_poll(struct file *file, poll_table *wait)
 }
 
 static unsigned int comedi_buf_copy_to_user(struct comedi_subdevice *s,
-	void __user *dest, unsigned int src_offset, unsigned int n)
+					    void __user *dest,
+					    unsigned int src_offset,
+					    unsigned int n)
 {
 	struct comedi_buf_map *bm = s->async->buf_map;
 	struct comedi_buf_page *buf_page_list = bm->page_list;
-- 
2.53.0

