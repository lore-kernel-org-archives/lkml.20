Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6134DCC8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223511; cv=none; b=CUbUY5F1pGmCcIWPbSyBeergrtE5wj83Z8c1bUU15IbtpTtTBclUcraDdbF+3OXKSg4VEIkkSyqYI6RH6Ia0GXvlHPcoHyhnr9xOOv1xL4sZMjuuORhyq7elofkb6nDbUPzvpnujQkB4JITdtX3f5xmy/ekBksQMIyRQLBYpEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223511; c=relaxed/simple;
	bh=qHMFji78Ocg67uejMZ81g47IcXL3ZOPxBEoWccpYQR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9qc0wER4lIBogpMN1LyzN5MM99hVU/eWtR2C8NVkISkVnWGlx2yRo3vhJXuwL4zeKhqawhfGe5OVlmSUZf+VFJrZuIrGv5VI+wvioh9vn5FUP767ySTkVfAtWBD2eFzUpa/XpVj4KdNf3eV76OjCnNFMqjOTzmcfjXqZ1HXg6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eb/sRiUU; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eb/sRiUU"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so392613a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788223510; x=1788828310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKXSBhKYoEtk+yCHra5GgQofkEOX3jSZ2Etm/YE2eS4=;
        b=Eb/sRiUUk6fFiExNtIp0d/qBI73efPWeCvNiRr2xVHZylrIcG95bYQvCwkqUzVYLC3
         ubRSLt1p/tXAgvU0RCBLDYWGYzAN7bAKkBR4lyv2KBVDa+MFYO5HImCK2eQIVHSSsshE
         Imox/q24qQ03Fx+p5N3W6HMMFZUMS06BZ71vaBcRaj22TVxBsyAjZrl7w2xRMIKkC1Uk
         qDr0v8O07oQRfGnF0qijZ1CqaaKFdPFjK8FDaJk6ikdzmYIKRerSAIZcXkxHj75aCxVD
         hGVXdTlW1+/Zq2XaSoFo+ZyYsh10+GAIRxk70Q1Ry7piQv7Kd7ANmuNh6vzIOkzNlIfI
         d2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788223510; x=1788828310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKXSBhKYoEtk+yCHra5GgQofkEOX3jSZ2Etm/YE2eS4=;
        b=nyiQRtY+VkGF3e2gYzalDzWQZtfjo8VCzMajq3S/AZz75cWiDRHGUa5GgR3lgzNaRC
         kc1WHsmYoEkgzBXETlEvq4Cq3cuNvC8ry9arrhfuUzN7IGCgEOYOlBE4uY1Dn68yTJgI
         TyJcJsUOR3Ew+svLc3HoQkhjMsjbWy8gahrojj1P2ZV6w4HsnBZvpEXQSSWU7yeXwJu6
         1oy+xYKheCuxkDRPURJ+Z9VfEYFowiIIpf0lhM3DWJBVG5zTp8wzd5NuKX8YD4YkKhfQ
         Rjh3YvoE7uxZnRyPCEkUH/xZ4vvMZpG5qj4zj+KuPWybt0VnJ5gWf+UVYWQwY6kRIKuJ
         8pFw==
X-Gm-Message-State: AFuF++n5Wivnu+rql9AIU5KKpnjo6/fDVX0yXQ0yBDxuPWTZfRMyNsMH
	/mOGjIWFc6sJORx+mR/RZINwMOR1sEV+b+EmTLRNCLJF0gwz/m22Cb85h9Bz/g==
X-Gm-Gg: AYBFou3LHIgwybRzEiZ/USYNORMEc07XMPfZ27VeGWtxIWTdPqWG9bmV4oYVeHlB/nF
	vwxEPHUddRVw16aMFPF1kPOMSaKj4VtlR0C7q13vsBbX1K35r3QMxOMdHsN1R7RyK4loyjPxAh+
	WZib5WICDBuCYwxU/3JHJqggCZcGx1ycMftZzrk/65hLOxbyCxsHVzy6lzMMdRoEuXWSDij5yNh
	CkICl4Gqo8NONjtdXfb0HrpYT9DpnnvijzWKcbwpc7+Qn8sETCnF+D29QPWINoae1HOfYSU37mS
	i7YNGq+jaVu+FJwLjffdVrtIP6cZH1wZmS+A+alZYKHYcc83CCh0iV9WIsHw0wlu5zI9E+jfeZb
	Fe5lOn4YQ9mTq8U0LpkPqqXEzAEIkTHWrvgowoBb5E7AH3GMZE2bCEM/ggO2A0qkIEEkElnQX5m
	tSEXOJ/eT7S3P1TKSR7OqklTKjf3DIRi+ZioKSX19CUWoMrYkI5/TDvNCtPYHdqcw252ORKOUD9
	gxUqmceat+G7NM+Jd0njSAtiP9JnysZWlOl9zLYaoUPnFXlU5ACWR5HjqBAVxpSxDZ0LsZ1aJg6
	M/HjstAEHOjMtm0TbM2ma13sBi0wSig41eIWUQ==
X-Received: by 2002:a17:90b:164b:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-396d0c79e8amr43912189a91.0.1788223509339;
        Mon, 31 Aug 2026 17:45:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2309637sm6591463a91.0.2026.08.31.17.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 17:45:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH] mailbox: bcm-pdc: pass pdc_state to irq handler
Date: Mon, 31 Aug 2026 17:45:07 -0700
Message-ID: <20260901004507.50655-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The irq handler takes a struct device pointer and calls
dev_get_drvdata() to recover the driver data.  Pass the driver
data directly as the devm_request_irq() argument instead, dropping
the cast and the dev_get_drvdata() call.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mailbox/bcm-pdc-mailbox.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/bcm-pdc-mailbox.c b/drivers/mailbox/bcm-pdc-mailbox.c
index 6fcc4002ad4f..1983cc95645c 100644
--- a/drivers/mailbox/bcm-pdc-mailbox.c
+++ b/drivers/mailbox/bcm-pdc-mailbox.c
@@ -935,8 +935,7 @@ static int pdc_rx_list_sg_add(struct pdc_state *pdcs, struct scatterlist *sg)
  */
 static irqreturn_t pdc_irq_handler(int irq, void *data)
 {
-	struct device *dev = (struct device *)data;
-	struct pdc_state *pdcs = dev_get_drvdata(dev);
+	struct pdc_state *pdcs = data;
 	u32 intstatus = ioread32(pdcs->pdc_reg_vbase + PDC_INTSTATUS_OFFSET);
 
 	if (unlikely(intstatus == 0))
@@ -1402,7 +1401,7 @@ static int pdc_interrupts_init(struct pdc_state *pdcs)
 		dev_name(dev), pdcs->pdc_irq, pdcs);
 
 	err = devm_request_irq(dev, pdcs->pdc_irq, pdc_irq_handler, 0,
-			       dev_name(dev), dev);
+			       dev_name(dev), pdcs);
 	if (err)
 		return err;
 	return PDC_SUCCESS;
-- 
2.55.0

