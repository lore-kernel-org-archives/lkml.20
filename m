Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFA245FFAC;
	Mon,  7 Sep 2026 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777796; cv=pass; b=YhVz5YTCclQhddDzZ0lkjn4aPYuVlSBkS6BG0oNBFlFyrwcNx9+3h7KvD8sLHbbsfNbljuNQje2QrNpduG6fqO2fmzBgOvY8nYAR/KFzMSDRFXIsrh/hCkzkRurspYyemhxHKZ/5YkwftMbSlvagTSwTonbGq9HxL2VlGTXx+4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777796; c=relaxed/simple;
	bh=2glHjjxNmJeIh9Hn9ZI2FIst7DDpFpc0n76t9JBu6Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEU+3mACaVSOeJz0oBl4H+un/8A7pTF4ssxUnTDKsWXvSXsnRT1cHgr33pyndgXML6fLd94vHp3RN6rxaVlTk3JPWZRNGj5jfDptvoGws9yyqZ5d6ZAtPmVmjLBEp6KzGfP1iofYvurxEcVE1EfAsfRDdrHzpUoXPRKiuOafGHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=WUg4s5D5; arc=pass smtp.client-ip=165.173.180.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="WUg4s5D5"
ARC-Seal: i=1; a=rsa-sha256; t=1788777771; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c+ZlO0SpKY1NVAbCIVQIzfEWoPScxP28ZPi+T2jEhEj8Srh0sDmW8ApeK65voMLWBdteaXmVNB7es8U01HejvdbeGhjxFK1IpTPRi8hkqI+eAhCzcVDW8f2y2+ikusP3GbTwR+rWOjXgYKMFAwaU0R4bW2Jk2DhRERPcmJyDnxk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788777771; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gyw7lKF4Mm7V/x1A8ErrqACafyHF9HcBrt4kEjhvQQo=; 
	b=J3fzJNkM3c7HKa1XIIYI87UiICIgouAPWeiphf+veEN9ttxuOJE0SWxLv4YvHJ8G84l4RzFZ4lTwpjSw5P0S1WuC404wi7G+qzp4vKFdbXBWr3fR//jLxTJc0NX+PQYpYeFW4ipkONRBNpJhtYU/2c9uZX4KpjYYyFIZ/UF6oAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788777770;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gyw7lKF4Mm7V/x1A8ErrqACafyHF9HcBrt4kEjhvQQo=;
	b=WUg4s5D5ZwgLZXc88xZOzh43BvUfRAihCXqCVRPxyFuigN/8au2estbO4wxr1ttL
	KC2u27i43hRwBDI5MekEKwxshXqtOBupuyqpB2Ow3kW2G101Sa7EjWT90f2KtrcxYd0
	xxCO+kL2avUBJck2JvDvCfOl3yP+shwl+415S7iA=
Received: by mx.zohomail.com with SMTPS id 1788777767905650.7635072531486;
	Mon, 7 Sep 2026 03:42:47 -0700 (PDT)
Message-ID: <0fda1cf1-8df7-4e50-be6d-dc17ca3591cf@collabora.com>
Date: Mon, 7 Sep 2026 12:42:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add MIPI CSI-2 receiver support for RK3576
To: Amin Gattout <amin.gattout@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Amin,

On 8/26/26 14:33, Amin Gattout wrote:
> This series adds the device tree binding and the SoC nodes for the
> MIPI CSI-2 receiver units of the Rockchip RK3576. The receiver is the
> same Synopsys DesignWare IP as in the RK3568 and the register map is
> identical, so the existing driver is used unchanged via a fallback
> compatible.
> 
> Only the two receivers fed by the Innosilicon D-PHYs in full mode
> (MIPI1 and MIPI3) are added; see patch 2 for the details.
> 
> This series depends on the RK3576 CSI D-PHY series [1], which provides
> the csi_dphy0/csi_dphy1 nodes referenced here.
> 
> [1] https://lore.kernel.org/r/20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com

Thanks for your work, LGTM!

Just one thing: It would be great if you could describe your test setup
a bit (HW components, test case, ...).

> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

For this series:

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
> Amin Gattout (2):
>       media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3576 compatible
>       arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576
> 
>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  1 +
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 52 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> ---
> base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
> change-id: 20260825-csi-2-rcv-dts-7712bd834de6
> prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v1
> prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
> prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
> prerequisite-patch-id: aca697161c21e19fe3a7f62f208da0f6c3b666e1
> prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
> 
> Best regards,
> --  
> Amin Gattout <amin.gattout@gmail.com>
> 

