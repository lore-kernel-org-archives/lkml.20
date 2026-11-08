Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794147774;
	b=ypXH37CfnntT2e+Svii+AAJCt9t6Jk7rMpkOSZHMrCfz4K0CqdxwjiVWUmAjCDXNHOQ7
	 iSJs7VFmXwbYi1oKFKMCpGJD1NOQDAmld2yzE31ihoWGQeR+gXt6xGkkpq7f06wgkFihF
	 Wg6aQ73gCmta8DPgs+GTa5ejaterEdpXSUdN2PoZOLaMTxhMS9VTv7zvaH2JpHkrTRbSM
	 2vw6Uv9gpFyDavv56B57+0If8VGQP5PU7GsXh6BXTaWGlc/qYCunQS0oyH1s6b0UrpQji
	 MfLY+6TfaltsGzCrnOWx8a7vUn6+/7/D/v3nkEPrDwqo4ryWbVl0czBgjKnfGXempiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794147774;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=;
	b=oKRvgALBA8Lbiz76O1WNUqYvtJNUqwEVRWgux8aH8JMHunkVrjWn3FJIAtgGCSrd+rhg
	 EdbJqAAaxyVcJkQPtcGEMzfwX75Kg7amHkj5/2FHBXr2CHnk1aS1ymuH3tq9ekoKMsD7A
	 9AqnUsnQO35Aj+LjdI2W81g/HB0pitCwf9gsXgEYHocosfriyz1IR4IYZipTEHfzrszYf
	 VVasQ3rgjaMDjgfJepoykI4eWMiVVAw1PBkJX7Cljk9mMKBfptRmbVniNz5nFVrWpQfBM
	 xhYaLdDUNIKh+w+jNVMUueCKf98GVRnUuLdsPJMO+W62BA47GNFzmsIxcIlb3IocNAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=g77xhHKi;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=S1JiRCX5;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501A4606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 501A4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=g77xhHKi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=S1JiRCX5
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BA5C61400128
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:22:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 08 Nov 2026 09:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794147772;
	 x=1794234172; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=
	g77xhHKiwGUpPp1bAq1Bt83pcZ/Jis0P5OCRhrdwiIgXa5PX7UgyxVFlvy2p7oG3
	TNA6XxQlX809+unZUcLVQucJJXM2v6CPA5LX4rEvE4fA6kaar7XCUlSa+G4DNsJK
	g7lGoPqJbf6Fgk+kCwSKkN+Ye1R+c9agfzxRuG9bkuws2OVmuyMuycg0QvrDAWuQ
	pICkgYMdeBBV1BdsGurhMBS6LLsBIcwd3eUlH+IWC7nU+XkQP2sVRM8GyECJabpl
	C7gs6gYT3SxtYYILNXLnF0YdjxHC7450QJZMqQAn8KisHAaX2SyDJcso/IBhPrxL
	awczdOyRop8uWNOV+X7zag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794147772; x=
	1794234172; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=S
	1JiRCX5tY492f+3KvqZTvRcUjN0u8uSL9qTEO/eYdxQUDhVacHwACGFDRg1q9WpD
	CtpuBYDNN8dDl+07cN4seVcojM/t2Me1DtHnPGdAuCKWacNyr7NspoapzNblZMuq
	c61i2280C/pLQp2h+kDHFAIvqxa79DSywxKzrrd5Oi8rWlulz4mjhycg9Xw+5s2c
	XkC2cjEdDvzO3BWrYBWLK6awX4nI0fE7pWjMjkbIGl/droSkWBpGmImlE75vcT8y
	HyE4fOM+H9X/qrz+/c4SkxN49L3O0tRBs1SMcXKYu6T9f9VQinxhK4/P1y/zXynO
	yx1EGq52g6dlB4n/GDMFA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794147772; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:UPwA+EAnwA8PboLWs16JfaCj86sKNTKOzwxnbPaNe8Ad+UZ
	6HKBnXD/XmX8roSI3yix9fkSGkH3nCGiFHij4kAyJEezpmM3swHeICJyBI1i7MsG
	cvGUujD30a3Cre1Ven/vEhM3F1czOmuhBHLhsa4fS1VZGgL9lbKEHl5xUMALJ9uD
	G/e32RviCiX19De4vUu8gNCwouSNuXijZVvQL0UWBOeOwAqgbFX4xdhMeVqB8wl3
	GB+gtQ8yD2a75QPKKteUiwKKyhzlH+2GWih5B8byA+zr/GuyS6/rHEtuLrcvK/E/
	stDg5NmvAl/kNvCiWzHf3X29J25dnx413WjIp5w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ONM+wdC2mc2GHio0FXqthaw8hL3ScbvB1IVRgFrqR4U=:4YuJB7yJn3hvOe+uv0QUJ7U19Zk9FgiQxUYecbj5q5o=;
X-ME-Sender: <xms:vIXwan_1KhIzNOuJKcz2qUmMWo0Iotl_maUZ0B8WJnjkCMe9btZCiQ>
    <xme:vIXwalE4CSo6V4bHtD897kjqIyJxNMMQTh8sq4BQoCX6YKIjFPRM2Fwlf9qyUcwKJ
    fVPDgIYEO9G8LkYqTqEN2oCXI_jKIYZSItw9RUtOOPxfZNTNpWKuQxv>
X-ME-Received: <xmr:vIXwauR_6PKSOhYnD6mgXm4dpNbVmxSlaYufiVqO_8fdRZ3exY8XNfOSo-pFE2LWIcD7BB5tbCEayk_sJFqnVFrRHTDUdH2VU58>
X-ME-Proxy-Cause: dmFkZTGAYn/JwI0NEHfb7CIV0+JF4g1gQSai3gkcHhm/2QbriRgW/y5c2skXuQufRnEs4B
    Zliq3AjZY4mmGjBkelBsYyJVBEkqVwHh5ON65q1orasDnTAQVYfc8yCFL3HjBq9Cjw2vet
    DuKRRPH+34k7V7hOnH2lkf+HFY6hXu/s4B2JQov+1sPyV3JDoiBigbmQ9m9rCMyZgrJc1j
    0952wIsVkerVEgKSSz0oxOnpfKFk+0tXBqCoLojENDwRF143YOTStk4ujykJBNzByTM+1x
    d/u6jgutlWOuyk5bFqmopUjAfGRljp7tv8RdgJJOkBWLlx8FcpR+ErFd+ogIPl7x8SPTgY
    idH6qRdNkfNKC6KWuFjtq7Lp6kBuBAsUw45kl/jSWoW6yOms1wkRzHH6UIL1I3ZT5CEeAS
    YSJnGrP+B1cgHkEUZADi4kX20wHML59eTSElfkNfmQykZivFT3WI6UInUROn2vHrDRtpac
    m0YiSy4PRDvHzZBC2DmOE2DN3jhu1ESNNdTOU5+Qbo7XOzTHb4IGBk2m1tpkBYy2Csm8kZ
    J8V0X95zOKwa2UxFdKN7MT2cBt6KtHgLgTpuejk8L/3kFpstvF+U+F+absRFADeA2b5JSk
    fuYduKCHjU8lI08OvR6g1UfNjpmizzYkswBd3yZELuL6hdPDh8ruL2x2U5QA
X-ME-Proxy: <xmx:vIXwarsCDPK1J6OGyi3DiYf_d_Mioe0_-DBSdgHeIZAvOitlr51HGA>
    <xmx:vIXwajA1m52ioj7VLugpb-TzlM652I1iQ1ZQB6fEfG4N_-CBbFEDvA>
    <xmx:vIXwagcjAkpMGyaUAND5swdA65Nj_gM_5aSE4o1o6CfqKSK6EERl5w>
    <xmx:vIXwajqGxHwxvW-NFWe0Qv62tSnfuv7jfgoJ3Idw5_wY7UrZu4UllQ>
    <xmx:vIXwah84xXQv-VFC14xVYKNgzP0GpHu6Akwg5yoYBv2pj9ok6u5ACY1n>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 09:22:51 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sun, 08 Nov 2026 15:22:35 +0100
Subject: [PATCH v2 1/7] arm64: dts: apple: t8122: Keep ps_apcie_phy_sw
 always-on
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-apple-m3-pcie-v2-1-0e5ffec71da4@jannau.net>
References: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
In-Reply-To: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=j@jannau.net;
 h=from:subject:message-id; bh=4YuJB7yJn3hvOe+uv0QUJ7U19Zk9FgiQxUYecbj5q5o=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqwPrVumWWs/zn+Tfz0yLkUh4cLu5dwRdy+Fu800f3ZZz
 THzWIBux0QWBjEuBksxRZYk7ZcdDKtrFGNqH4TBzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUszxgZtghvkHDIOvROQOL1veqUc4e3NvgW7VzVbSm16pGm+OXzLxgZdjxbV/b
 PVkL5n4b6Ed6IW7NMRGwmCNfyTTb6V7XcIMacBwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The APCIE_PHY_SW power state is in Apple's device tree a child of the
virtual storage and general purpose PCIe power-states. MacOS however
keeps it always powered on. Mirror this behaviour like the M2 Pro/Max
device trees already do in t602x-pgmr.dtsi.

Fixes: c65ab4905e58 ("arm64: dts: apple: Initial t8122 (M3) device trees")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
index 3f8be74b5ea8..3206787dd208 100644
--- a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
@@ -899,7 +899,7 @@ ps_apcie_phy_sw: power-controller@4a0 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "apcie_phy_sw";
-		power-domains = <&ps_apcie_st>, <&ps_apcie_gp>;
+		apple,always-on; /* macOS does not turn this off */
 	};
 
 	ps_atc0_cio_pcie: power-controller@4a8 {

-- 
2.56.0

