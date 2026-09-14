Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47B134BA5B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384169; cv=none; b=Xs1O5BOGH+8RNuEZbcQ6Ecoz9JbQMa8hy0iAS2Qrwjys+dd2Vacgv2oYTpWX305dltRv6wQhMLqY/rbHBZzAVuaoYBmd/k/Nf11LlK4m603G66XSlcZMwcWr3BOVhJS7j0qYpHiucGMkENe+36WEIXEBBOT1nPL+fANYAsEXZkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384169; c=relaxed/simple;
	bh=sE0zgNlM0y6pYWyLk97sioy0+Ar99YdHBGm2Onc1q7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I7Q8h6MCLfrKXvUpEFtRld/MY5B8iZ+yYVq/BzrskauSnkLJG/Pgkjejf1edzO2gPTQk8LNGhDKoG1/pQyigod5TgLjdfBs73T60FdtI/IjwPDmu2hsBkRWrVbT4HlM2xq8kbC6AMJguCsWf76XnJ9gBfatUF3PIMYNJJQF41UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ne9vbVCA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ne9vbVCA"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1550809a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789384167; x=1789988967; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CRpE5XBx7HNGGyDVumeAL+DWruwYyiVpmYjdguinMZM=;
        b=Ne9vbVCAGx5s4ANBTfZl3VTBLDC6viSB2HyqeyNUBgzv2rOafV16bI3M418HQL4AZN
         vsXOATjkV4chZnxCovvq5FYOmGJzSgPpm/dyThLecNmkKMYoqOQEdXrFh9G1VIJdZnnZ
         oRUAqm0PIub/h3921lWaZa0Tc7T6dVT9yebe15RDluy6dGKgRbU1IPVfGKbOTqs1ukh9
         rytq2n1VCsagDOtMDb9cIPt73SabVSje27wMT5FCBxBVTZ5TDV7nJBONnOp5rMffYN+L
         FSezlNW+XFzAGArjZvL3RNvf3ntCxa+84K6mFBERBPTtFf+FK55gRwzz/Dc5lDir8Kxn
         sDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384167; x=1789988967;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CRpE5XBx7HNGGyDVumeAL+DWruwYyiVpmYjdguinMZM=;
        b=edalLSCAHC5a20kW6TE9RrT+bJtMI/MRC+38eW2UkdxDNp15IFxra080CJFdZVuDSe
         yNMpaIlPIkqqGFagW7h73nHeiVtPW5CkAOi/evJiQhJzG6oN2ppIOOucqAsxv7lIP2U1
         UCvcgceweaucFX99KXQtFHwV3XvOe6F+G38/JYrt4l3f2d4e8SxVUgCN8L9bT4HQL262
         m6v9CSxqHWuaus6kw75Ivhu9XGgMFjVxGSMXa0trzwFnDpOUBdLgpYpn+WyCc2iXxffg
         Q/AxROmpM9Bo/ImkzhCbSwphFqewDykaSXVDPVt4CVULKsv2JM6AWBDWdFWuZ9ZYOSGR
         wwOg==
X-Forwarded-Encrypted: i=1; AKwUvBw0Ru0sZwbBcMHBzI4Ck2gOUFQols/m5YNNdx5Sgo2oD0tkzn4/3Wq0ij/9c6NcUC/FOgEd9v1OzxV6zV0=@vger.kernel.org
X-Gm-Message-State: AFuF++mbRlT2akNp3763BiT8zc+1YEE26pCytL6ytxTwTvZyyNfCn+ob
	bFgcmA7L9rsuYjIn37jI3FH+B0ZKqI2d1T+oUa/KtLctazgY+iXPzmfU
X-Gm-Gg: AYBFou1hQr7zbU7LXC5dbRthLGuFzZfSV/nWCihiOyCZ4MNJ821yH8kpR875HDEBgWl
	Vu9MHJlh/rQ/Mp8mCwewXnBuqiQ4r6Otyxn3x20FNZs53bu6qQTYK9Td9/ppdbuNEP8BwUIdNI8
	t9+tTDko+ygNo6iw91Dp+ZkQV04anYG7acBXYpgGOzk6e59nUtsGrlto8VnM7eFR1yqJyE++7cY
	uJw0puuLX5CclgrN2ePKDezOs9yLU8h5YzMKWLYywOD+APowTPhyQ//u9Lp1Dv8xSXF7T7ksXKz
	Rs00fYCoNsLYN0yzZBcREWPurKHCBr0Ymtj3C/sH6P5kHy2AM+sbplf8hsdQ/j1BQP0U8wuFCdY
	w9Knkyie+qqhAgymghCr73DXPnxOotOzLjMw12J5Z2Ofy1tkHQ79oH2xY2fnzZ8YgI5CO8eaSIh
	indC7T22ysx+Cdi9R9nVaf8vo8q47TdjzAG4zBvMQP2IZQUCPBlv128fTcu6Ll+tiEVhmrrK35S
	c+5DW91opqhPjCpcv06SUxrsd2acPGb61+MbX4ASECmQnt2bCY+jKCY8qdDNkDpJ1f4
X-Received: by 2002:a17:90b:3f8d:b0:399:e97:8d5a with SMTP id 98e67ed59e1d1-39dec145056mr4629476a91.25.1789384167074;
        Mon, 14 Sep 2026 04:09:27 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95752809sm20313018a91.13.2026.09.14.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:09:26 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 14 Sep 2026 19:09:13 +0800
Subject: [PATCH] usb: musb: mpfs: fix phy unregister in remove()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpfs-v1-1-0bb5b6c2e67c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3dyCtGJdAwuzJPMUI6M0i1RTJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAGq2KD1oAAAA
X-Change-ID: 20260914-mpfs-086b7d22f8e5
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, Bin Liu <b-liu@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789384158; l=1043;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=sE0zgNlM0y6pYWyLk97sioy0+Ar99YdHBGm2Onc1q7U=;
 b=dFW+7gHeBm2AIegMt/TyQI2ujV3ViEUxyFCCwY3IPPOOcqEfdTblaOh6qblg4rZa+MpI2jtNg
 XvLpyYBm+pDAINfYA4TfE0SGjMBNN0bv2nbZdzhrHIb6pQPxkzt4toK
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

mpfs_remove() passed the glue platform device instead of the
registered generic PHY to usb_phy_generic_unregister(). This
unregistered the glue device from within its own remove
callback and leaked glue->phy.

Pass glue->phy instead.

Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/musb/mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 587127abd30a..6cc2909b8ae3 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -357,7 +357,7 @@ static void mpfs_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(glue->clk);
 	platform_device_unregister(glue->musb);
-	usb_phy_generic_unregister(pdev);
+	usb_phy_generic_unregister(glue->phy);
 }
 
 #ifdef CONFIG_OF

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-mpfs-086b7d22f8e5

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

