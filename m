Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862191;
	b=A2m3i2mA/y5BhW8fDGiPSXovDXwGAhgZXjrqLGL62kzIiCyJaOlwEsznuzZd7IPRZWTm
	 jaudUsAf7a0BczSHlUq0jKa18AfLe5t2rfqJA/i812EeouDfkaOtI5L60EUCLAKscJm6g
	 vWTspFviLG+UzO0SHCokNTMcZ1qFmRGj+ym8r4PwZ+hIfkm1fkkwnVHbckfDa37WLbc/x
	 3tYNiHjsNv5134AJvNnbQthVyefjcU2dkFnAcS/J465Rh4f8cSADPQ1MzgrWrfmAsO859
	 cYQ85BJyo0Ry6zP66KBBkInS+71EZioFs+uJULLO/mgn0MaAtoezkBZwCdnoGSj4p0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iuEt++c/hh8n+6PRCKFVagfSRp6hOAJBlPen/z85MFY=;
	b=h12DxKHig6+shqTagRLLzGcm3GpB+yugBiKbAc++JKAl/uLmwWQ5o2GySVI1uJ6PM2e1
	 VSyUMwkS9jaeq5uunTAyh2aLPj+O+jjAWyWDELI09OgHfuZavL0vf6TPyP+nkrDEjm2aX
	 NSlz/Z1sCtF66689DSwVEapeponla2Llbp0Nvrtwchxg+KW53sSBy6T3KHDSlSG5dPz1i
	 SIgdOdeu8om9gAIGY2Wj36uOFipXQKqBPt4X94nmMRmgkxYAjI7rLfjJvkxwnp9tPoQ+X
	 XBKbM563NeUkHHuWck6C22k2QhDesD8XiLkgwG/iBFLTwA1AIWYxGTUkKiE0wnf+BMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPtBHnYS;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4EE606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB4EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPtBHnYS
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4944abeso1311750c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862190; x=1795466990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iuEt++c/hh8n+6PRCKFVagfSRp6hOAJBlPen/z85MFY=;
        b=YPtBHnYSuugUYdqNM4KEYh0qU+k9Wb5l+wT4VLqWZ+Pt7TPkmDl0bYJLRJ841uzfYg
         /25dFJjIbSxQQCp9SUDmx+LeMNwpMSTnpDExjhtg4IxlsBqD5Qf4h+/CE4E1rbq7/42T
         mmzBbtDMzJWc3PKYgNh+EZtl8W1wskf8vw2OW+xWQyhPS0QycyT7iO0nSHxTnkx8Stz/
         o2UPVJwHrDIdIrcBPkQIXc3qWmIjcmY1Cydv/X8RwPgbbfgXerDN3xFA59yNJSsECC+8
         JDEiUKY5zVbQURHtDLGpBY9gQMAbZDRJpN0UtiO70e4utj+DfVTpzW4MpUy2Zox7occb
         BeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862190; x=1795466990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iuEt++c/hh8n+6PRCKFVagfSRp6hOAJBlPen/z85MFY=;
        b=SgH+n1EtTDH6l9qsZQEahpIhI1V1Y/Ord8N+rgTsvZmz1iWy0VdpjygK6d0SIk4zlj
         xKzBnHcsLEY66M/FXaUJVoLQGBVyQhoCxiwcNvn8q2RYaoKgziyurhd1VfxbDUudWKj4
         sh94AGjaPy4zMnFHIOZWffQyhKbSnaZluGeOA2K+KoZqYzrkSh7dkHSeXl/6yj0NSXMj
         HCtNCgZwm+W0uN7lTU5hHOhoRGge+PVTfK382I7irHnqthKC6un5isKgKgenywW0YkGd
         NOXpmrca4OCLjGMNr5zQho5UTWTKn4a41KS2i9o5UXgPPFcsPoSqOgw52I0o5acDpDmh
         vorQ==
X-Forwarded-Encrypted: i=1; AL+hErFJ0p6rxXtjQT8igFCdznAlA6ZZ2fggzSdvlz2xpAjNsZMtDNn3eUN4KBqQBVy1rBTTu7j8/9taWSW1jPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NMEAE1mxLZ3OG5gGl815wb+roNQaiKf+OAi9OUDSubyflzvUW
	RbsXG2iyKPcX3K32+tN5bXZ/Sph3x9XBa+GvEeEljJFzUMjmgES3EsVP
X-Gm-Gg: AYBFou1lfjhKW/GmdMxFv7/Jcx7UjEd4bZM4ioLTJT6zTZ8gJLXykukyvyZztjkI/CF
	Wk9LBxrs2Hc56oPsbKuVNcLyOCrM6W5fT1jCBPhrPh36uvrF3ssYLyiZFLopgmFoZL1lXc0btQr
	CtLGp5j+emamZ/VIJI/MYAk62HTlbXp9stqc0Ad5hlOu2Z27m/UtfvGyKb0x3JCyxCgFrLSXFj+
	Xp1UMveiHTdcX7C3naKxSTfc2gEZMaVfOFnmT/2Sfo96tQJtJ/pdAeqBq1kpq2fF+dXR/lIV5EA
	4VaOYMqaQy7tE4FrufWncD9DyBQOSdR7Mk/bUkWeAJZKAhkKESIhb1LdZHXY/samjvJ5uA0vf5C
	SSUlI1It4HINuqNrJxitoZlyXms5hEqUJaCqInwr5oDvIJtDlNop22UO+BUvRbhBOn5o5I4FPmg
	hUpIV6nSmEakjNSr5PgBj5vrhtloNeoDbOzGrkCmfUA6kkZmYPmsQG5lyNfylonW+sAjHrV+pDR
	t3w3HS2JfOJkiI22oBSAQcobwKQtvi2NFXZ5AuibMHKM2/tC97Dh4l6qoPaZ+8iVqbafTrCEzr9
	hhQYb2vyt9kOE1jWUvWygHlfCTuT4ob7hdZ4+b0vcTbm05igBUfO0396Bf/jXF76FTATl4Q=
X-Received: by 2002:a05:7022:b886:b0:1b3:b67e:9fcf with SMTP id a92af1059eb24-1b5030f29damr10878006c88.17.1794862189687;
        Mon, 16 Nov 2026 12:49:49 -0800 (PST)
Received: from hp-OMEN-Laptop-15-en0xxx.tailcef561.ts.net ([122.172.81.184])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm38153829eec.9.2026.11.16.12.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:49:49 -0800 (PST)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH] PCI: fu740: Check return value of clk_prepare_enable()
Date: Tue, 17 Nov 2026 02:19:22 +0530
Message-Id: <20261116204922.159384-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
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

fu740_pcie_host_init() ignores the return value of the second
clk_prepare_enable() call on pcie_aux, so a failure to enable the
clock is silently ignored and the controller is programmed anyway.

Check the return value and propagate the error.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 00ec69a09164..b2eded23b52c 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -270,7 +270,11 @@ static int fu740_pcie_host_init(struct dw_pcie_rp *pp)
 	/* Clear hold_phy_rst */
 	writel_relaxed(0x0, afp->mgmt_base + PCIEX8MGMT_APP_HOLD_PHY_RST);
 	/* Enable pcieauxclk */
-	clk_prepare_enable(afp->pcie_aux);
+	ret = clk_prepare_enable(afp->pcie_aux);
+	if (ret) {
+		dev_err(dev, "unable to re-enable pcie_aux clock\n");
+		return ret;
+	}
 	/* Set RC mode */
 	writel_relaxed(0x4, afp->mgmt_base + PCIEX8MGMT_DEVICE_TYPE);
 
-- 
2.34.1

