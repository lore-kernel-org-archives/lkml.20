Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672893559C9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982081; cv=none; b=G39NaDI5NmtFCJo3iLRZjJ3gyQGRc28hVdqZG6oi+oYOJN04ufCmWhz55Kh4nfNjWWTe264ZG5IGxjMDL9oaDiDil32HbwA3gcnUH7r9oNUjCC2Ra/OBaWGdexEZytHawKCP/ywVKij5X2xPPJUncTETBSG85h5gUjB3rMQimDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982081; c=relaxed/simple;
	bh=StpBKYXiF70ZVwwZRabcR00ad6ecbmwXV8xPpWHL4aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5/Shn1i5sYv+Xni2zloZuiNrL/+OWu4n1czLha4nj8n/OyCO37h+F4DTti5oACnYK+oopYdp897Eg8pZfJXb/lRFa3WlRfdBnmLRY3AN39QXAifsRvH5qTugylAWspej1n9LkDEfJqeW8HufNayzM0HsFxmL8OX0LCvdiTfXbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4KLDfDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdYV1zkK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4KLDfDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdYV1zkK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79xfB607135
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xo9mLOJxXk39j262pHvfRN+qFVuAlK5ekUKavXq4SFQ=; b=M4KLDfDAps85j2C6
	LKJhhXOw7xNehq1o9OC8W1LGSDa010tFXeX5/IFyNS2oDZev2izY1C4dmQgwxCJr
	R3aqh37YDcE9gfLrajdJwXcjUnLBMQDeimcjQE7NKzfeHB/rzeS8JhFgFaCOwlIr
	aQ70Nuys7yUeLoIOMrObEeGYII2KjRWgObxHj1h/lHiQrSygZltoiX8ft6q34jtt
	CqIaVtMsHTujW/r+hoxEK4uqXqfJeo4KhsRGKZogLe38hMpnraGdzRFDJrjW+vT1
	FtY7xipxEv49VBy7yjvuYqHF/285UsdD8QfathYFU5XR1GJpw2UFgfTt+YWc5e3n
	3z81/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtu1ehh82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:14:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc51591102fso4095365a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982078; x=1790586878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xo9mLOJxXk39j262pHvfRN+qFVuAlK5ekUKavXq4SFQ=;
        b=PdYV1zkK0HmuVZ9uGKSz4LOnkveMm7gDDrornqryD385NwFeaknzrLRhMpLn4zyc3d
         gddxwt7qsTMOjjErdg+yTF9hWjp5M0JgJsEfiNc6JukDdmbLgeaEkMiDAXxiDC9Kqs8w
         6VIR38PDRFzewtd+7vg/igmoQP2Wf+mDa0hHr0rrFIy6FLgPzH1F9OzKQyUZd2LQRI13
         TFkk7BSpjkv/rs9R8wFg93gcYdEB/9YKIo4OL6UcLVFJwYWIQ1XkYhOC0K3FqG7BWrUk
         tLfK9Kxw0xHhilLnc2nQURanin8CNerHrYDsrXS7/Gx+FW0+QFq2lNrYp5rigPRLw0rn
         0tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982078; x=1790586878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xo9mLOJxXk39j262pHvfRN+qFVuAlK5ekUKavXq4SFQ=;
        b=xR5LoayDl5POI95IbwtXjxBViWja7kNwlc/UPfhZoBGNLWxjlnlvcVNewttOyJY7nX
         JHNEbYHlxN3zQzS17uSsJxa3O8BS5deDH73cT8gvrSlDbtYC61LV7aP+inamhpNr94Z4
         eO+E9ckpwOTlvph1OK5FGK+IsFp2Gt0MqrY9x06JT7/BGSZjCmz05ikLCSDaR/ZY7aNm
         cufgMbaDguQ/zWxKWmezjRM3aWx3cp6cMjgR2fSjmqf9QzXRKSgUL/RZ0RmqhUDirqd/
         1nFY5uvnV10JSUBTr6stHE7ntNLAFls2t5CfvHsgA7Ab+Dw7HLm0y3O5J6Kw/pX+0cDp
         zsmA==
X-Forwarded-Encrypted: i=1; AKwUvByVI7M49ZuNJT5/IVUYeEfn6i08u6l6jaGGzgpfXTXnXRHbGNAPXPEFPrmn4BwUVMSuDhw4myPvXStg/zw=@vger.kernel.org
X-Gm-Message-State: AFuF++kFA7ZMolkW24+flElSFFttSenKWlwCIhh0PyHR1WerQx8duH+c
	pRpfSq8RQ6KO23Qa7FS4x0n9mklzZhBWT3q7efcKN+t7oK/jKgoKy0QDaR4rFNfaxFjkx2S9uK2
	+Yx9SK7kyBaFs2cQntBKch5Szx2sB9wVkisRMezicpRuZSUkrFmBj2/jH2uRKOrPxwzA=
X-Gm-Gg: AYBFou1a5zI1DNuXRbIJ0pu4ER5Uig2tlWpcDTXU2Epw0K/VNkwP95Jzha+QG0eWmXC
	vcykOjNe+xnV7DB5yNey+v+KkhkBnUziICigtA91mkUDQaadC5AjVw38KzgynM9e5KOPFydZ3dP
	h/kXzirn/naI/WHFePR3Xn/4X+SqzAUJMB8AWLqpL20HCg6ifCZFcHUY3OJmpipfWVGCuWweNU7
	qLjFrlupoyIczwz5lyMMJHvShrA9LBfRbIAS6QGhkEsuvpPJ7hpaNaUZ6Kp+TFJFs+/JuHi2dCa
	UD9VpN8rKFU+cNE2ElR6usCAW+gv/jIvXBgpDwk7r7GQxv2PCslqH/0JnDQ0WnjbH/gwOHF1zmh
	gAQUY7nZpIfM1JFZ2tm4i9f+Dfu2VbdhIXnJRN3FlQj1y
X-Received: by 2002:a05:6a20:7f8a:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3dd8c3fd41cmr16576699637.4.1789982078296;
        Mon, 21 Sep 2026 02:14:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f8a:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3dd8c3fd41cmr16576663637.4.1789982077898;
        Mon, 21 Sep 2026 02:14:37 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c342b3c67sm18923840eec.10.2026.09.21.02.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:14:37 -0700 (PDT)
Message-ID: <321460f8-f24a-4e91-be17-50f1639f8e76@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:44:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] PCI: qcom: Move PHY init and add PHY reset call to
 align with HPG
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
 <20260915-align_pcie_init_sequence_0916-v1-1-0b2195836f30@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260915-align_pcie_init_sequence_0916-v1-1-0b2195836f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX2EoOG1bka5ve
 FKDjJqAeaMmk5QZFL1tG53qr3Zn4QpBXJZD9mqduslK/17ZZFF9QNXfCEtFDtpz3R76cEKOKeKJ
 Q09aKe24xGWqpvVPQQWPo0EjaAlUFJw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX+lQXRCCq8OjQ
 A8UYVdNqz0zQF1SwVV7zPhaBV2L479dmTc9mqe+hFXoUzq2WSA7hYymeGLVKzlb2DRz7i5IDcBn
 FHK7PAyDXFrcg7M90OLL/QmQRayKNWE+cnkLbNOchuHfCE7emMqxbJ2ATigW564JILtXrgpdHZ0
 UGTE6b/HZFaCPB4qI9QoVQOjlGgrshZdX/6URnuoabw86Q+fC/a8gBGv71t68mofQBylA/J+qxm
 OdlCrLW0MZVRNfLC1zUxamfZdb2m84KQK3kx8WCU1u95hSNDZVYflDkoAVIWKQc54a/QT/HwD8M
 /CfTMpr51kB48nHJaWsOfnLG/I8jOEpr8836ONd5lc78TNimf8e6Bv49+7SuYn6ur9f0wQUmnHv
 n/Fdxo3k+wpNyHe0q68EcKixLv7BG3GU/zgcKdYakET+nptsuCGhTiIcJcwhnj2skFG1dgm8kr2
 /8/sJXneMFTln8QaIvA==
X-Proofpoint-ORIG-GUID: Sm_slSdeL8kM9Xka8nWktz4Qk8rlxQBs
X-Proofpoint-GUID: Sm_slSdeL8kM9Xka8nWktz4Qk8rlxQBs
X-Authority-Analysis: v=2.4 cv=A6r5rKWG c=1 sm=1 tr=0 ts=6ab0f57e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WcHuybdFNItx7B-R-rUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210131


On 9/16/2026 11:34 AM, Qiang Yu wrote:
> HPG requires the controller/PHY GDSCs powered up and all controller/PHY
> clocks enabled first, then the controller's reset and the PHY's reset
> toggled together as a group, PARF_DEVICE_TYPE set right after, and the
> rest of the PARF/DBI config left until the PHY is ready.
>
> Make use of phy_init() and phy_reset(), and change the call flow to:
>
>    qcom_pcie_host_init():
>      phy_init()             (PHY GDSCs/regulators/clocks up)
>      qcom_pcie_ops::init:
>        enable controller clocks
>        assert controller reset
>        phy_reset()           (toggle the PHY's own reset)
>        deassert controller reset
>        write PARF_DEVICE_TYPE
>      phy_power_on()
>      qcom_pcie_ops::post_init  (rest of the PHY/PARF/DBI setup)
>
> phy_init() moves into qcom_pcie_host_init() and phy_exit() into
> qcom_pcie_host_deinit(), right before and right after they call
> qcom_pcie_ops::init/qcom_pcie_ops::deinit.
>
> Apply this to qcom_pcie_init_2_7_0()/_2_9_0()/_2_3_2()/_2_3_3().
> qcom_pcie_init_2_3_3() was enabling clocks after the reset deassert; move
> that ahead of the reset assert to match the same ordering. Also add or
> move the PARF_DEVICE_TYPE write to right after the reset group in each of
> those four functions.
>
> For most platforms phy_init()/phy_exit()/phy_reset() are no-ops against
> their phy_ops, so moving the calls around has no effect yet; the PHY's
> clocks/reset actually start being driven this way once a later PHY driver
> change implements phy_ops::init/phy_ops::exit/phy_ops::reset.
> phy-qcom-pcie2.c does implement phy_init()/phy_exit(), but moving the call
> site into qcom_pcie_host_init()/qcom_pcie_host_deinit() keeps them at the
> same point relative to that platform's own clock/reset programming, so its
> init sequence doesn't change either.
>
> Signed-off-by: Qiang Yu<qiang.yu@oss.qualcomm.com>
> ---
>   drivers/pci/controller/dwc/pcie-qcom.c | 165 +++++++++++++++++++++++++--------
>   1 file changed, 126 insertions(+), 39 deletions(-)

Verified the PCIe enumeration in IPQ9574 and IPQ5424 and it works fine. So,

Tested-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com> #IPQ9574-RDP433, IPQ5424-RDP466

