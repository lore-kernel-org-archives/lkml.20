Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279460;
	b=lIGDrGSBg/4zY5OSqOwNSnk7GC5ANaNH10+h3D8X4lm3nVHudP/ORF8DG2sURM1Paf/d
	 2bNyrL85I+QTNTK5LOoAbbdocu9V/+dCxdOcT7qJ7SgjxEK3mIfh4hW48aMp8LKJUfpRk
	 9i1HhNlgNhsMagyliy8+a6/gbdm1jnq80QOhYRjjHjnI7GfHQj57/1I9zIGkh83gVM1Ta
	 js1Zrau2md48LSZj10gfykHkarSASsn0tORt1nx5rFzhgrgHovNpqdnxpwO4dDvaY0zZb
	 xshH89YaP21YOevzekA/s7MUHAe7ZoQd5BDi+Do5uLuoqstgz6nUvTRnwiMWUDEqYVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iop087FFjXWDSpJh+IBQzbRhDiBtg08vWO4Z3TycLbY=;
	b=xOadiYp/nKwzEM/U6MJETektUJv7u0eIF+bQZ2btlQubxE+Y9rPHLgyKLO2zdApYdtMF
	 258SvASKAj7scLO65KaRhDCKJc1LCVFrLge6VAby9virNOUnc6lCf9TnixCYgL1DfknKF
	 M+5dgZy8rBE7JbbqN9aVayKh/WilKScxJxa6uVa7oKenrpfgO6TXpeJltAA3bo2BTmYNf
	 McNEsUVpRAwJp9+WhdpneID1REq2u4jbj5DqXI6a+39atQa0V8c0ZrKWOx0NXONK6tTna
	 +foyz233m+pwQasG2nn+8WTa0z5D0uQouP2ga+8rOrk64yp147Loh2HLee5g/nLLV5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWDWRkH0;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03930606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03930606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NWDWRkH0
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so3119260c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279459; x=1793884259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iop087FFjXWDSpJh+IBQzbRhDiBtg08vWO4Z3TycLbY=;
        b=NWDWRkH0HW6hakUMoF6M1i8MT5vj++Az7EvTQKb6Jb3QG6nnCe+Scwevic8JYigQ/w
         PgIi9u3+SgGmp05YZsfuFG+iG4b6XWruiN/SmceSgk9ATYVfosbCRrdUPNWRW0bSLZ0O
         /+kR+UW2PPRbulwMDCymqDR1OiglDiv0SIlqEwmzRAGtzdwVXYGsc3EQPX4Q6SMQjicX
         lO18runGwJpySM23jH24iRNXG+Erl6O7mYh5aLeIYoaclC8xSr2uXuHLEOr4nLo5/xBg
         Lml1bo/SSPWBkq60zGRae1/aa+Mym8T1UH8tXT1jGGmtn4cU9bSxUiFz3Jt0zxx19Jy/
         PFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279459; x=1793884259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iop087FFjXWDSpJh+IBQzbRhDiBtg08vWO4Z3TycLbY=;
        b=JkaHB44bxyV6LeHMGW1v/mOucwQCoKJRyvqKDqtPQAFZXQI4pCm0C6nLq09/FdwQt4
         6zUws2DhPTHUDl64tW4rV6OUUcY0B0kRTZdJ9om4Xq4yP84Y+YGrWWaMZaFNfg0z0ejr
         j3ynFw/YuJ0vMQApn8L97KO+IqRzvFGOdof9L6wl112RCmCLliEnTH2who6jqewnB6w1
         7resH9EhUMm69J9T7zFIVYTLdNZ1WAuGG63j1rgnuwMhNYmY+QHfAaVMr8RbMYq773VM
         0lAaD0sIkv8wXo3KZIx+Xmhv/0vOaiyy6P3ivMDovr5bs50gXmOuQ5TDMEH0IMFgxBO6
         Ur8A==
X-Forwarded-Encrypted: i=1; AKwUvBxJxloAu9ACBN2UUCInFzzSD+n1BvoW3cU7Ux1hgepiRWfM9vAzG1SuF6OvpxjPjcf+OdG6GBIF1wjiSLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuhvPvyjoXgY5kPtg1jQ7ooXynbkJT9TUjVS12Gd3aVzQjtH98
	sR6GqSLHxSP56V49bquatSICCi0dlGHJX9iOJZix/qjISo79y9akw8AW
X-Gm-Gg: AYBFou3solbB+amCX7F4f1aDJ7MGNdATkMmTlJSMdMum60NfA/XLYvGRvXVh2uFgmWw
	qQB9Ktkm8l6c31041u0bvoxSc8gD0qmibkfn61sPxGg2Xk8pzB3C1oLFu1i9klNexDSQXDfi7CJ
	0U1EkhQYtEiLFizgbOvxFkRBo1jlAPygeaaIl1moXIQOibgKH3zQycSO5nBx8c3jzAgyBvuDN8j
	WsQl58svcTvWx0GJxdppf4OZp5JwinBMlpLLsG3wo4PBR40SOQRfUbe/9+zRqe+KCw5CmUDocZm
	xr7TSqG1RBMa0gEaXCRgP+4kEzlUQWgLYhAscdy6ar0GvK/K9VZYmqL3eeCLFvlJeADWWlB0oN9
	UC30YaIexXsCYI67CqXQgNsWrQ+57A/3itqX1CWlRlOqRSN2TEJfKnHZKNdaYlyLMMZLzPHfFKz
	KLC7Sa6xAgyQx5yvFS5gPuknNPlYFQlVA+rCMJdDbeZueaAPT2dn1+2opZcIUsXH25zh25rBox8
	8utoqpWO/tkWnJlKFFUrnr4Cs4vjT9oSFy1YBxe0wN8lmdnBDmIZrQ+1Sm9cZWC3e0ZopzDjKan
	D/Efrq/St7EonGXMabIltjOcTwK9B2xAQ3/bYAn+PHZyI9/DtOk=
X-Received: by 2002:a05:7022:ed01:b0:141:5281:8a41 with SMTP id a92af1059eb24-1a6ce01cfb4mr7112570c88.9.1793279458889;
        Thu, 29 Oct 2026 06:10:58 -0700 (PDT)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm22072457c88.21.2026.10.29.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:10:58 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: linux-pci@vger.kernel.org
Cc: jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: exynos: Handle PHY initialization errors
Date: Thu, 29 Oct 2026 13:10:06 +0000
Message-ID: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Check the return values of phy_init() and phy_power_on() to
avoid continuing PCIe host initialization when PHY setup fails.

If phy_power_on() fails, call phy_exit() to release the PHY
resources initialized by phy_init() before returning the error.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index e3c05ade381b..5ad07c0be8e5 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -225,13 +225,21 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
+	int ret;
 
 	pp->bridge->ops = &exynos_pci_ops;
 
 	exynos_pcie_assert_core_reset(ep);
 
-	phy_init(ep->phy);
-	phy_power_on(ep->phy);
+	ret = phy_init(ep->phy);
+	if (ret)
+		return ret;
+
+	ret = phy_power_on(ep->phy);
+	if (ret) {
+		phy_exit(ep->phy);
+		return ret;
+	}
 
 	exynos_pcie_deassert_core_reset(ep);
 	exynos_pcie_enable_irq_pulse(ep);
-- 
2.55.0

