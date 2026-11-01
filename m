Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571356;
	b=yfL++LmXWMKt2JajIiz1su0A9qzz0IAk3L42MtDLL6vyv6vM9yxfn3LGovG94I95EKL4
	 1hTVsFPl7b41s075Bw/a/W9pIio8eRafPRnzrUaWWqPhWokkg/vFt0Tx4Sm6bRiCds5Tg
	 4vxNPIFLcl98yCBY6Ps8NXZuLz2h23cf1z7XJojlX5QrEIX4vcmu6scuq1ufGf7acxMLA
	 fZwF/A1DZ/DhPcBf+eSvXeto6uCZQMuzvQs5pxJgaPYVKKLatAr3uBvWoXE8u6y09pyyV
	 fT9U4WXsLlexgFPzVTe9kocogK9uFMEJHRsLBahlZ2qgFa/viUqJZ8YaWSgxUXgYCmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571356;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=koqrDmmt4O2BTAa9AgtZ7rW5JtPwtmhVY/Dn2gUanrA=;
	b=E161awcm/bunmz3F0priLRbfBX30HoM4+C/WRlvlzn1dseVJq0xA9yq5cUR93eGKJbLH
	 IgXLOgF1lnBBOlyA3CmYI1BzUFBCPb397F1GONjfbyn/1T3zAeKE7wQg7mT5QOaMQeVXk
	 ePpgI4jw3IHwlzLqH5RBbMDnBTnhG/w8QKk8CdQZNVX3PiUf9J7IKybkbxgdefV4cd/vg
	 yrZlA9gHXNRZHzyVY2qNdSt80JahKdssTSn61GH1TQHOCeODCpUutHPgOeMPVCttBrPpG
	 0QAfEchRSoIQPmgJ2PbL2/VaS4K6vNqK0Mr3Wsl1B4E7JtkmFYN/CAe6FUp23W5JJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=v8151im3;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF345606A337;
	Sun,  1 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF345606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=v8151im3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=koqrDmmt4O2BTAa9AgtZ7rW5JtPwtmhVY/Dn2gUanrA=; b=v8151im32iqLSPZW/19OcA/UAT
	kSapPEGiX/dUFAcVl9Tl+QnqsQDTPswcXwKBojtYS2LOPUQRf6zZ03XdqugWd/XWOScXLRWQ9godl
	SaeO2YQ7i/8D7EqbaW18wEXN2ZJDRDGgU0uOoxUkv/Nfl8UvgUwqEajpLsvd6t2b2v0NdR/pSQGWU
	NPvpmRCRpkmkiAncvX/Yjb55ZLpR2XXkYrLtb0DB/WKR9yLm25uGDyQjdCgCV+TE8SV+d7y8bytxQ
	hOGkUP/O7O37rZjLlJYqR4Z1lqnI/rRcOqf2ysWEGpfNAxpSPhCa67g+M0lrRMP3G6AyoM/3AXKDi
	6+sP7pbw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add vdd_log and vdd_center to Kobol Helios64
Date: Sun,  1 Nov 2026 23:15:25 +0100
Message-ID: <179357131387.4107717.12481039737139265735.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-helios64-vdd-log-center-v1-1-4cafd110e0e5@iav.lv>
References: <20261021-helios64-vdd-log-center-v1-1-4cafd110e0e5@iav.lv>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 21 Oct 2026 02:02:29 +0000, Igor Velkov wrote:
> The Helios64 feeds VDD_LOG from a PWM regulator driven by PWM2 and
> VDD_CENTER from DCDC_REG1 of the RK808, but the device tree describes
> neither of them.
> 
> Describe both. The vdd_log range comes from the schematic (sheet 8):
> 0.83 V with 3.0 V on LOG_DVS_PWM and 1.4 V with 0 V, so the PWM is
> inverted. vdd_center gets the same limits as vdd_cpu_l.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add vdd_log and vdd_center to Kobol Helios64
      commit: 5397d554ac76f10737eb7b87c48c8c4bb26d2017

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
