Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116198;
	b=h2S4TuAjEJGSYgw6uzeGnUalIYZBSmy+MEkIqxW37sEYsdncoyyGBrrB5JOMhATsaJCg
	 GMZwfRluxsoTvaGylDJwSqm6JXKDOZe3NEiaaIFCG9VJs5U89zK9LkydEtXnK98pi9jx4
	 zGlElfQzGoLR3f4cS+wchPpGohkfWgpoAWIDR4PaI55W6H8EGhmKoFCEvmvOxkijHPZt0
	 kd6VG2hl8VTsjG0HlSMD5L9CGx3JVyTNiveyUE//yN47xJ6fzNtmsAKIbY/ehptxSGhrm
	 Iohi7Gt+fphlKmxuJumwNZp0F4qXBxPxEkxqIMJXWdJdwJGYiobMs7c858VMf8VuANQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vMJhlpSMWK3+HIJ++d06DQtbz1b9MhuB921he62vO+U=;
	b=axynn4qBf9GSlxVqb7751KF/x4XFqBD3kp3dTyeK7sfZgMzESC1MXZ2c2G8YJP6y3xAt
	 NlRnhO7CMQYaboty6PYXP27CfQWoy6ZcAWQnXRYTJ7Hw4sYQR+q4DjUSm1OBmsauyijf6
	 A8p3lcUn285POE5g6SiO6oLLV3658xNqMjB8GpUqMkU6BrepYifQOIBE4wnIgwnWvSc23
	 IDw07A+k6t7WdNkpz5o7ZivMvurggvLcXn+BUZnCEhhEmZNWONZOkc1lr5OF2FEWKy6r/
	 LUchZxRTBeMb419K4M5WYhuoKDq+tzthjMWGmvqY3vTr9idTQPObvVuGmYNLgG/B+jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=piCrpRbs;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942F606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D942F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=piCrpRbs
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso2496220f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116196; x=1793720996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMJhlpSMWK3+HIJ++d06DQtbz1b9MhuB921he62vO+U=;
        b=piCrpRbs7+jHCF6Cge4xVgL0NXaHfOjc305H8Q7mncuu7VVJEiCLj5qXI6XFcVc3R4
         rYjKNr8Wqmwh9OtwvCD4c3qIS3fRMyUOTn9J7j82Khwpu27hG5V/iu+ARjqjVzOzssFS
         lgyh9HkQhCeKsCXTaH6K63ZrTHK3qnAmUotE+ZDEYzfa1MlFcdmcl8KSC7gaU5hIEy3d
         3xSj1l208n7ITdlkO70MnmB2NejUT0LMbd2EImDaP9lwZpLR5SfK5Asd6gZ/abL4bAy+
         Zb4esjEUdZ3Texded7eZdMgVHPiikwBIqa9l6+b2oA1kfmB5NNpaOdK1UPQRCpWvGBZT
         CLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116196; x=1793720996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMJhlpSMWK3+HIJ++d06DQtbz1b9MhuB921he62vO+U=;
        b=fUvHmNtjJGuOS8pzecxpTTu0K08cn/y+viIfvUTIBkVHmJzHvJQ0uZ186pQtD0fFLz
         BQteuh68ZXzMYfDYB+qru2wtB2oZhF7s+kVxoItG7yM6FzIITyKyOU6OqiRMf+mL8Jfi
         rzPSmJATxf2jufBfMuozY2v34/xDdEXBfHP1tjIe7UlnlVvLNMmstO0vsWcnnBCs5ODl
         gaZkNZySSTs2oYneyeEOsURQgtnFBHeVKhYBFfp4gV5yD28hq1PovZTGbRNkoQZSWze8
         QDKIRApPMKb0LIqEfor9RdMv9RIPBf/u+DtsXznZ5YiwyRgXHZWwGtGLrzJt0vKLeC/i
         Jy1g==
X-Forwarded-Encrypted: i=1; AKwUvBxw6n4MoCHnQdnxmUTszR7QigNsS4onz6tnVaahe0mzSIsqzX3SeqOf7kyTqevkM1dfB9jMeQvuobUMuiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIM1up17/P9kEJB5q5fLXtTCVEWxGz3zTPCMprVKoBB1BJSKS9+
	S3hnyfmsYo+24zrTOGTQXrgwebKBV2MJ3em5OlWJzGuD0tF4Va6SIYpM
X-Gm-Gg: AYBFou1xA9YzXRLKv7kJyOVvNMyCXvKtLx1ADBs05wMggNFYJ6ZNdTBig2OPp8KbYXx
	mOrQrYz074U84/R1yoQOC68qNukNSFpQtv7P5SrppjC9Fny/ZD3dU+sGhJ1if9K3sRD0cjg+QB7
	RyNms/jGSPO9YDYNa0gDYQJIKj+OY5AM4EqeMKkOD9JCYT7yopmihsITbAzrP2/np3KRuRnE3zH
	dxw7K/ZuDYaot2cwreJapesT/Q8ECb8Y/FeSt2ohWZO42RJsR423foQwya1w1AaTzjz6HSYcKiO
	e52SF5k23yyZz0OgNwBay/a3LDJQqTHWUMlfDLhtt1Pde+9XOnA8pc04If++menkMQHv5fT+KVC
	e75fCsL1mxhRME0XAv7aTUbewuEtmO80UA2wFcQcysf/gudwU/MUuDyMY4JOlnnDnudfx9/4SQD
	8CEjDVTKIdnbopnM4S3ATA4q/+0BD32xrue2cRGN0i79KmTBNDmINrpE3l9myB07wD1OU0V4/8C
	j787fWj8npl89Zf0aUDYv3i/+ZM2UJdTz3Pw2V8BedJiX0wY4juxbFfTBrXf/k37JiBK/R4
X-Received: by 2002:a05:600c:3e8c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a35acab6cdmr176493125e9.28.1793116196133;
        Tue, 27 Oct 2026 08:49:56 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:5434:54a3:4661:4f45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm286673925e9.11.2026.10.27.08.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:49:55 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Jon Mason <jdmason@kudzu.us>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Koichiro Den <den@valinux.co.jp>,
	Frank Li <Frank.Li@nxp.com>,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] NTB: epf: propagate memory window command errors
Date: Tue, 27 Oct 2026 17:49:53 +0200
Message-ID: <20261027154952.250683-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ntb_epf_mw_set_trans() and ntb_epf_mw_clear_trans() discard the result
of ntb_epf_send_command() and return success even when the endpoint
reports a command failure or fails to respond. This prevents NTB
clients from detecting a failed memory window operation.

Return the command status from both callbacks. Preserve the existing
teardown error diagnostic.

Fixes: 812ce2f8d14e ("NTB: Add support for EPF PCI Non-Transparent Bridge")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/ntb/hw/epf/ntb_hw_epf.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
index c47607d4f8a7f..dd10c30bdbec4 100644
--- a/drivers/ntb/hw/epf/ntb_hw_epf.c
+++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
@@ -498,18 +498,16 @@ static int ntb_epf_mw_set_trans(struct ntb_dev *ntb, int pidx, int idx,
 	writel(upper_32_bits(addr), ndev->ctrl_reg + NTB_EPF_UPPER_ADDR);
 	writel(lower_32_bits(size), ndev->ctrl_reg + NTB_EPF_LOWER_SIZE);
 	writel(upper_32_bits(size), ndev->ctrl_reg + NTB_EPF_UPPER_SIZE);
-	ntb_epf_send_command(ndev, CMD_CONFIGURE_MW, idx);
-
-	return 0;
+	return ntb_epf_send_command(ndev, CMD_CONFIGURE_MW, idx);
 }
 
 static int ntb_epf_mw_clear_trans(struct ntb_dev *ntb, int pidx, int idx)
 {
 	struct ntb_epf_dev *ndev = ntb_ndev(ntb);
 	struct device *dev = ndev->dev;
-	int ret = 0;
+	int ret;
 
-	ntb_epf_send_command(ndev, CMD_TEARDOWN_MW, idx);
+	ret = ntb_epf_send_command(ndev, CMD_TEARDOWN_MW, idx);
 	if (ret)
 		dev_err(dev, "Failed to teardown memory window\n");
 

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0

