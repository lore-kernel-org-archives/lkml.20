Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA238D3F4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022636; cv=none; b=cQsQTs2Xqqgkeht7BavcawENt4TTv6L4PYZTIupVYCfwLNTj50/Ss7f6ZLNkmaY83nyhuJBMO1KoG2hMleUe6bmwhwCv7DhvRfNa7AVJ5A2qB99XjzxOPENSymXegR/fEFxixmLJGAUH1l3I/uUQ52bT6gFTNWohbdr+sP8gdkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022636; c=relaxed/simple;
	bh=Zivd6gSoAOCwGy45OtKp3BjY9cF07bK/qsFOsRTNLww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCQlPD3upReGUB78+tw5/swB29Jh15mIJ2A4s4B3OKYnI6w1rGifbWr37pIA4OTA0SGWtEmuVz431Ix8JjMBevIFA/9HclTmykGs7/vBjfWz7s2U2r1yUzfTrWxllxwIldN4pEWA9FlB5GHscDCoSqrUencwK91dCD/ryy8dCc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACGFonFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/0Zv+kr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACGFonFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/0Zv+kr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5HL562974623
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwJFrJ+jnQZB4v4JTITVBb6cPnXSqYDA0xswKuE2WOo=; b=ACGFonFlxqI/UPdG
	2wZz7bmj3uu0wlLTO2g6YQ6moQFZNDur89BThmT1Ja9PwtSPVi1079I8Lk2l29eo
	Nc0iDg5IyChwcwSZiqbCB3pvn6I9ZG2hQYdoh6pfsKZ3O9GQw/lHMmeiPobmnT0r
	9oREWQSMIEk5AWGsVKNk7jmdq4yTSOTFEOXTDVIj8l210931AHbIOyFrtDtucKM/
	++3p6xUUpgOK2xRZ0ET3ztNsewao3ZWdsSF+uYaarbvbp+ZpkLKj8NbXGjn7wiKt
	eBDS7clCFCIlJP4T7XJDCzGYfNVusUcbTI0eW4shwVLsxmPCEAepbhGMtYh2Eg7+
	U/4gRw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2f2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:43:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a880e91f0so9634b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789022633; x=1789627433; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qwJFrJ+jnQZB4v4JTITVBb6cPnXSqYDA0xswKuE2WOo=;
        b=F/0Zv+krJALh2zdouek2Q2Jwk4cAOG57iMOYlaOb9nMj7wTOBG/tYQOZ7aJ3AXXxXL
         /QnxCDwbKwpgi7CY9hHeKl6fFvQYQbSdksW+KfgqEy7Pmd1rSiT/iBiVm4v3bkrbfcfA
         Lih/fKZi/LCGhsoCR/eaUatjuPx0NzLb+ZBsvKTHSYX/FdGs3CyCIPZRYeQbgRgp4Jm1
         UhlUFumJjUnBUp1GLTQtr708E2uvR9/mBQO3BE+45qTSCtAdCAOd3vpNFSHW1g7FDjze
         Tkm5d1v8peQGzukGfzhk4yJS6f36HI/XoLpQ5Fv2NA5sBjdzjjf4VCzkjU3gm9TbulT8
         9YIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022633; x=1789627433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qwJFrJ+jnQZB4v4JTITVBb6cPnXSqYDA0xswKuE2WOo=;
        b=fDECXx4ydJ/nEDC4c4WexuDZG8nMlExJAsypGENg/AxpMSCFeBjT97r1tcjLKEAagp
         VkrH/jz+gtOgnNiLX5egB28crLzh0JGp2HMPZZ+z8c8jUebgbf8zQWmU4ah3mC5QnosQ
         ATEovWBUxPDNtP8XswfKNK6qKeB4Csd04eV7F2UUev3eA229//rD7AULdYoLwnDVz7gH
         cLR4LDDNa3nuTz5b6/sdrxAvaxnvjZf2IQRW31P3eVxH2hW9FTWVKaQLkYgptW9N9of4
         zs3JGg+UPamZo7PM4GbiEqV281Voc8wIOZQCMt7mEjut8kLoaT8Bc4fdDV9cnOCnYLPg
         iJog==
X-Forwarded-Encrypted: i=1; AKwUvBzIXUTMdiCLw1FLiog2G3s0OxXXJZLzeB4nHXbVUcTt5OwOJ9LFyZATzyGtdi6QdUEkLSB5DqMTXhV89mg=@vger.kernel.org
X-Gm-Message-State: AFuF++no3ZpWTDuo/i7MXRkDd8/3K8sl0h3UE5QF/d7SC7mvcXr1IN56
	Wu02PjFXrFvsU44X1x/4qhdyMmM/jH7kKCrI1GMJoJh99uUI2tRduUJP8xCD8Ym+DDzAFEFDXiL
	E3FdQtYqce1XywuURuIBsprZ2ZtFcObvMu7PBaDDhLlP6beiq2RWiLH4UNLAbNY/SKzo=
X-Gm-Gg: AYBFou3JRGPK7UxvsmslwZ1e8fwnO07QblhRqTu/T2De95JRIfQmEB5jMw6i8/X7ZEk
	Tg4Y5I+AwVmgvl7pWn83OZoZ9lnISx0dF1Pq6UioRNn01dDgPtJopCeHL9E3FLoJS8qscMuQA/v
	N8Q5WQHI5n6pS6UnTeLWo0lIofz7dDjaL4/aVMxXwCkIWtmnb6t9H9KM6Ohpq4YPNzyQ7q/YCm8
	yIRFUqYvtZikLLijA/iS4mXHoUv2AD9mclFAmk4urQJUUIZvVfwmNqVfteuzJ4DBeDGZSGVb6WO
	2wTjKoWXmCGvBg2cb5OfWSdfxKHga6jvyKNGyZARZ8Tm8o77MB5bk1R4bTpfGFuOWhoZEkGhG1H
	kUUdHlDK54yZuq9SSeRJDbLGHKBd9jNMYuX04eTSRhC0=
X-Received: by 2002:a05:6a20:72a0:b0:3d3:aec2:4dcc with SMTP id adf61e73a8af0-3dacbf28ae3mr8197976637.24.1789022633270;
        Wed, 09 Sep 2026 23:43:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a0:b0:3d3:aec2:4dcc with SMTP id adf61e73a8af0-3dacbf28ae3mr8197918637.24.1789022632708;
        Wed, 09 Sep 2026 23:43:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm77752519eec.15.2026.09.09.23.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:43:52 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:43:45 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
Message-ID: <aqJRob8DsjOeEiPJ@QCOM-aGQu4IUr3Y>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-1-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909-nord-v3-1-b0a82721c547@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bMqDs/+Z c=1 sm=1 tr=0 ts=6aa251a9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Tb11Ti1d2fZyuSkRe-0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: mUU4IvbRCNHREPH432jKrv1OQM2oPWqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MCBTYWx0ZWRfX7vmN4yqOWi+y
 5rbNKc/59gtsUG3+xk5MZKmY2nxzqv2jqqCAQvDXClLfnVF8Mn+4npTvDnVnH32+o6MoUkQlDQb
 i3tl+tz9azS/qdDWWFkHR4fURURjbDu6vTOhzXBk0bSDZL0v8wUuS5+3lbBAPSqUjIlWRhjLglf
 mNoOABfQGLtbzWlWDhqYDY0vOiY9bzPxQeOKq4g484/LFSgITPzlfMtx/hcgmSfPfMk4N8kXHgp
 THHG8weDSCJne0XPR0OTlAiGL0I6jWN8i7H9FJjd2xtWDou9BiRxFRPi42gTY8h84eH5toX8V9m
 qdOIuI4KWhCfaBY/c+NgtoyKS9EkuHcGpf9bJsFi/4ClIWc99F0AVDXR5cl602Z7y6lBTiX9TcA
 H5ipZSfZtqpusZOUcqkEeBX/LoxxsB9Lxj27x0ww6vFPsylPquoym5VbJgtREyenpToQc0Zjn6J
 xcn95cwhTaRUwTxa0cA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MCBTYWx0ZWRfX7SthWE5QkxuT
 LsuXWA+wchBNcQL9amkNu8eiXRVWWKApaK2+cjUR5en7u+T9bTN7LhK4OhryGL8VeYr2+Q+Dk+H
 1pqwsD7+rChoonAJYoWZUxtSnEFYc1M=
X-Proofpoint-ORIG-GUID: mUU4IvbRCNHREPH432jKrv1OQM2oPWqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100070

On Wed, Sep 09, 2026 at 05:18:16PM +0530, Krishna Chaitanya Chundru wrote:
> Document the PCIe PHY found on the Qualcomm Nord platform.
> 
> Nord has a Gen5-capable QMP PCIe PHY that can operate in multiple
> lane configurations using four PHY segments (A/B/C/D). The active
> topology is selected by firmware through a TCSR configuration
> register and may be configured as x16, x8+x8, x8+x4+x4, or
> x8+x4+x2+x2.
> 
> The binding describes the register regions, clocks, resets, power
> domains, regulators, PHY provider interface, clock provider interface,
> and the qcom,link-mode property used by the driver to discover the
> active lane configuration programmed by firmware.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 272 +++++++++++++++++++++
>  1 file changed, 272 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> new file mode 100644
> index 000000000000..624ad7e7d13e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> @@ -0,0 +1,272 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Nord QMP Quadfurcated PCIe multiple link-mode PHY
> +
> +maintainers:
> +  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> +
> +description: |

Can we drop "|" like below?

@@ -9,7 +9,7 @@ title: Qualcomm Nord QMP Quadfurcated PCIe multiple link-mode PHY
 maintainers:
   - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

-description: |
+description:
   The Qualcomm Nord PCIe PHY is a Gen5-capable QMP PCIe PHY composed
   of four PHY ports (A/B/C/D). The ports can be combined to support
   multiple lane topologies, including x16, x8+x8, x8+x4+x4 and
@@ -101,7 +101,7 @@ properties:
   vdda-pll-d-supply: true

   qcom,link-mode:
-    description: |
+    description:
       Reference to the TCSR syscon and the offset of the
       TCSR_PCIE_LINK_CONFIG_MODE register.
         0 (QMP_PCIE_NORD_MODE_X16)        — all ports ganged as x16
@@ -129,8 +129,8 @@ properties:

   "#phy-cells":
     const: 1
-    description: |
-      Selects the PHY instance by index:
+    description:
+      Selects the PHY instance by index.
         0 — port A (up to Gen5 x8; anchor in x16 mode)
         1 — port B (up to Gen5 x4)
         2 — port C (up to Gen5 x2)

Shawn
