Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859780;
	b=QzNPXPkEUgKl5VgTwJfY/vQScSPplcsDnwe0NUTnugJa+tWV0C1lCscgxKN2fs3YG4Su
	 E+VlGxiZ9kBi3Su9COP0As0OSHl5/c3MJZ2Dykhn43ykMUXUcyTAmlv+TjiTJDF6Q6DBD
	 SsI9k9lxuIhnjia+Li+0D9syupQ74zcEsBT/kL6FP1nx2k0llWdc+tx46VeaeKXyfK3CF
	 E2Bc441M8OQ7fnXwY/dHuoVF+cmQ3/azrrvvxrCNgQsqtlOmQeE6Vvor7756GE+RQea3a
	 PTfpQYqFbvzd6w7kuu3i2PgV8a74rNKE1YpN6evByNpPfWzGc1Ep5e8oBfaav/MVhlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wWKgu+mFgtlwrDE3M/qikiFkywyfILm386oFvXBqykM=;
	b=TuIKZlpH+al9mUn4z1I/0jzAbDGXr6RufByuDP/rMpzU7Ephp4dnrzuschreE/SquZ6t
	 Y044sL8F67eQx5FK4PrZ8nHQq0ewjF4aJR+qrPAz3rR0X7ezM7e1VI9R5tkl9dMmP/P5H
	 kNmQBmfXIAdvb/E0v4jppyND1YxGO3Jb0jahsCmVlUYyEKLNTFzVSwH8Mu3mgOfEbjSV1
	 HFa9zgzzohWQ9HUBEIE8/aZZ8iuQGlOvOujlRCvY5Q3gGGRST8eTs85dEJFls8a9ujyb8
	 ltinRvRWaXK41S6wQ2XUeUodNv4g0IGWE8XWWTNAnJZ7TPkTb7HF8SuyjyAOLDxttSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vI5o/umH";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3695606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3695606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vI5o/umH
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so4399787c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859779; x=1795464579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWKgu+mFgtlwrDE3M/qikiFkywyfILm386oFvXBqykM=;
        b=vI5o/umH5Q4SNsvz7EoLsCg5rfgEIiTgcisAYDX2M+rHXRIOyYWUw84Cz7020VYJbA
         e0GWk+Znh3Rgot5o/ByIoUqRM8XULzybHE8aF9R8aP1UzGHds2HNlph0X+fy8yn8wmo3
         HWkGrRM5vmMWN1/RdZw4/pm1jSoIHdyW9FnKJa1fLkHrY2NjSRr35/aa8E5ZLqyCEgMS
         PUpsyenaCMxWnnZG2ebtlp+7FazM8ylbg5xF4NdFnp7Zh1ffYsWvNh0xpeRZKg5rXzWC
         qkDs9mtekGlB5TL3htqNsDIb7RfaD2X/YZJCvXB3JzxdlpV+2gRsoGpBOA43V9kwAzzb
         xq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859779; x=1795464579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWKgu+mFgtlwrDE3M/qikiFkywyfILm386oFvXBqykM=;
        b=M5uTKJLFJXC1+5/49k1/8QLn+CM89qS/PciDlRquFOd4LJO2ysaDnRPBTL3jdk7V19
         70hJdcccEXWTuHmY9X2w8w0ds2XXFqXdDR4RubVnOliD8Inu0VZxHr/nhYEhJqJUoik7
         8e4tuUmcxMRLpvjteATy/iwICYtQuFTi5w3tPaThoiDNJZN3S2n38Vbwj7K+Eml79/gG
         Hd1ad7gsmJmUr6WiVJ+lEqYdC9pccaRJRjYxx4fF1VV0gc+dnOiE3D5pRsu8shG3POrq
         VasB9LGs/CNpoiJUHl6FrHT6xqsLqubguByBnJNMxl40SBzGL25OWzzXShUHCIhUPNql
         vc4w==
X-Forwarded-Encrypted: i=1; AL+hErHZT/jHdcdQVk1pCIYpuNoNfMQUXJKPWuMiYhmsK9vH4zV8aSxfnCVviQtGEDI/qfOGrDdmidjOYZWRL9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z94llhubNT2/zPgkkqqNo/ZbKaE5ZeiX2HwP4B4vfwyt4jTh8jv
	SvDjCVczfc/ypJgV30P+j+1fa54FoX38FsyoODy0Te6ette1W+9cdrpb
X-Gm-Gg: AZFdTZeiAbyz2x3gKVL0R9z2gOZFTqzQL/U0HSMpzRDN0h06iRPr6ZceFU/E5+H9gWA
	6dDOvxyS+q+Hiwc47DOHZsq1Bs6tk1T0HhAGYQBgXBxzxu27FITI8NfhE5pnA0NtW2jT0nY4j1M
	LaNTvQ+WyyWeWvwY0ySFA9AOZ6ZK2vCRhQYzHcozInR38yiZM6MPkT82s/ruLMYnAxSePQA06Sv
	j3D6RQHw1KviNOE/cNu4y/aBjwdq7noHI8ZxiZJSVKMbvNsGUl+AuEoQju+tE1sAjGP+xb/ZOAE
	xuKNwamdotL2PaV+P3TenDbdpQrxeJ81BxC2P4MAqohBgoTQP6W0Y8VXTiLrcJFJkXXDQzp+ieP
	xUld4RBfv7xnVOMtJQ6SO8gkCHkPyVKX5fKAr2CsPiziItVe9BxF63igRcudgyuF2KzQVlL4vEy
	gPwVkTzVfsbMMqbGA8MCQbZBGbQjoXwBigX9CDBsMxl5JZ5rIqFyCzOjM50/g/KIi/DkONYalKX
	UBbfA13FnWPveDoLWpj6IkfHopYBZBq29W22TQ1Y60klhhPVWyiOHSq4uGRlGUCw0z8VdaZe1N8
	XgDVy0Vs1DTrDJkL9YPIlqmIjGQW5S5FL0Cwk799EPIWmoYC5zgcbSFG+eONiPvrwGBNs32VciH
	F1xqFkRGBDet6bpfj
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr13071358eec.25.1794859778068;
        Mon, 16 Nov 2026 12:09:38 -0800 (PST)
Received: from hp-OMEN-Laptop-15-en0xxx.tailcef561.ts.net ([122.172.81.184])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm66737021eec.21.2026.11.16.12.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:09:37 -0800 (PST)
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
Subject: [PATCH] PCI: fu740: Disable pcie_aux clock if reset deassert fails
Date: Tue, 17 Nov 2026 01:39:12 +0530
Message-Id: <20261116200912.156500-1-jayarajdmit@gmail.com>
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

fu740_pcie_host_init() enables the pcie_aux clock and then returns
without disabling it if reset_control_deassert() fails, leaving the
clock enabled on the error path.

Disable the clock before returning the error.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 00ec69a09164..2355243da793 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -260,6 +260,7 @@ static int fu740_pcie_host_init(struct dw_pcie_rp *pp)
 	ret = reset_control_deassert(afp->rst);
 	if (ret) {
 		dev_err(dev, "unable to deassert pcie_power_up_rst_n\n");
+		clk_disable_unprepare(afp->pcie_aux);
 		return ret;
 	}
 
-- 
2.34.1

