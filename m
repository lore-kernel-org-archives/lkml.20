Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70BD4C14E6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405663; cv=none; b=AtQvd/IHMlDFL+8AMTrrCNxVpeonV131lyseiVHWZua0LAJBKn4NVSwkAPNs99gj9ADBAUCSjpZoF2hBL52PUJivq2lMTH3e+6cB2f1UC3aAGOv3NevXQ3rZVhmozs58DY+4+2lJ4p45OkFeTE9//F8GZMFt/neoGNkfp3dCgQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405663; c=relaxed/simple;
	bh=fhdMRmOk4Q6FOwCHCXU6v3fO96yNYmwgmXjvfyYXrGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbQKyUTV7FY/YEecTsXUZUofYkpRT3xClcJeUP+ZsmkKZKGujdRFMYuwyzO10DQdZyaqhlTz58AcPvnWqDVWTeQubbTpXyDQbNAo/vjJBoEs1iDXE1Q/TDpOw6zslsWSQAUqiRBsHg7WZQ0bPUhda0rVgyLt2HJKh3rz2mcS1bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfHqYT8R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDcVDwx8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfHqYT8R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDcVDwx8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Oq4Z3305496
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7cX5WoMt08v+q3mmaPF9DY7v
	vrmsgub8TleiLCh5ftA=; b=AfHqYT8R0RbwSHX1yidcBjunQJuRUfbT/KQDJV5X
	X+Pv8XgQJEihxsrxjXDBvFOnP009A5YDXGWrxV/clpuT2dBokIXhElpcLdKO+gOC
	DVsoq98KZ5QMYHc54H1GJTVXyL/FnP9m+22jSuJ4g2+Lw3jH4NYVfMGScgXSHPxY
	UuOH50v6LbEjvKdPDJoB+5VCO69HqUAIUcaYYQWFUVKJ3gekd8lP09WmWjg40rVj
	CcgKeg4WFrcJg5y+uavLgR+ViUKvkzdmKUae/Bz7c1NNEN+qzOJLexfVlFFjWHMM
	yCvEdVw7bnq5Ak0ERyOQs32FM6f253jB53SGH42tIpsJuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47gm3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:27:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso202145285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405660; x=1793010460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7cX5WoMt08v+q3mmaPF9DY7vvrmsgub8TleiLCh5ftA=;
        b=KDcVDwx8ep3rtxrFhgfkzo0tSWHuXUOOnO8GfazoOn5paXLMVehOSdItj8WX94U34L
         PH+E5D2QyzAGrO9fTAdMlmdSBV7oIGxt9hE8GQi9jywsKlcynnGyRn6udON0IejOZPmd
         fu1IGDPG6kCX7gaIwBGXPmmFCuyXkPolQrFo66rzjFwErJDjPRDRP+Aob+OJWJiFng25
         l7cRXMCF/S6WyOBU6E7ZVMQc9Q7yGmvdrf+ksXl4sWBL43Jw224zpOIpunuPAcfDbI+n
         SWxaRvy545V51Nc++7XrB7UXmqjiDJ1QrWI5a2+7CUSuu9F3EGxTBb0wNw3QmNNH1PKs
         CUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405660; x=1793010460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cX5WoMt08v+q3mmaPF9DY7vvrmsgub8TleiLCh5ftA=;
        b=muSq2/u5DFyPIqkcPGwkV8rZPnPed/mrbpRZn6SMVSzC+GZczwv46ytwcepApyOMWf
         GT0SH5EkuvBjHUAJ1Uke3XeoeVM4QSRH9/fHD7aESmtDcaG1Ln3BfCnHpj8T+qiOKmNV
         4x5vH5F+O2gJ+Sl//+iAKSRhsPap23kvJxIwvEsl13T66A++CoVPYngnAYHTOpAdmhpc
         ULqnBaTwO7nDcWV8Fa1RWaIYdT21lJ5TcCwiIhJzzoXhpmHq9q8S8V5x9JQ5qrS5M2ic
         +rXkOXboKv1YVg0ozDQdhCUhKLl5LRrDQknSR8Y4cbxybi9xy0DY/XqjLTPOMiNxTE70
         3J1w==
X-Forwarded-Encrypted: i=1; AKwUvBwsVqpMQ3KwFwqOlXiJsulSEL9f2Fx1zWlfIY+j+SwCVGviiacNlxsfc64Y0v4U/kOxfGSBV0nn6eVEMqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4CObyw/zhXSjAdWOl5biFBuod0PSXQHY9+MWBA7AhoxX5GSaF
	A6iDpXqUEaMCm3iXFU6HvJqlEL8zdEz+8bVpb2Vrt51GgeU0qN6iE9E0108AMbN43Hg6D/O/RF6
	mkOzHQgBnsNuNt28/YTpux9sfhMPsXUBoMuJSjvAkHAJDBWvRvDjdDgKR4O7WcpQTwLk=
X-Gm-Gg: AYBFou0qy/jp2CJMOO2Ww+eVA0v8mdUCfOpOm8FLisCKpvSc5h1lEaLUebnQYAuS++L
	MrVTzQcGOhokrscIEZk7+4fm9nA2nKShvs2g7DyuYyDDjCjqahXFepEP7/BNLu4tf/6+j4rYkn/
	/n4TUGyu0fGK9H6HYufhq4D2creeIFQ9/Xq0weeGxiqBpwH9e49V2zXSoqvNNeN8jr9JE8nSMfS
	EUcqzEKKzEysJ/gSLNN0AJJKI0QLjJ6lyaIHrOhaoWWHinCvXdTzCCIt9pDKG1OOobEMdft9YEc
	s8pBkSSiVx3G43zT7aOgnHhF+hn/DLreH7ZfMxQ0b9i6va/bGStVqkB4FiLr2/SN3KwimF/UAPc
	sH/zYQXW+T44Fj2Bz
X-Received: by 2002:a05:620a:3728:b0:93e:64ac:5dfd with SMTP id af79cd13be357-93f17d67698mr1695359885a.3.1792405659805;
        Mon, 19 Oct 2026 03:27:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:64ac:5dfd with SMTP id af79cd13be357-93f17d67698mr1695356485a.3.1792405659211;
        Mon, 19 Oct 2026 03:27:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm31633563f8f.16.2026.10.19.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:38 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:27:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set
 snps,resume-hs-terminations for USB controller
Message-ID: <p6fhbv52asrjghn2fopil22yvg2obg6tjn3nhbytyoav2nv6tw@a3yxwkwvp7vq>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bLBI7F7U-rT9weGK_gpKkZf4EnP_eZ9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXyYdIuw729hL6
 auJIFZwMr+S+3Sm7jR8sbBHWacQZIcjI9zhULtaAdWuCM1pCEPJ5ndzDUp2ZHrHqNJT2iELgbPv
 LO2r4C3oskPUnwQntXqA0lViYS9wmegZ+FA79O3/bSGPmYLFwS2ibCdwois0wY2f/271Sqvg4k+
 GX3HyM2E9V5tJr6K7r5i4ZXz2ACM4mAg6aBEdZceHSFtk3hvbvqaRDVBpQdT/JycnDBgdBaS465
 xANiLe6WKqSH11hL7IegBfrUE9Uu+ChBjm2j+2UnBhjYacD5I2Zr+i/I3tTn8Wg2f5KXWxUfwzp
 rk0rRA/OLMaqW4XRkPvnZOmjnn2yhZHP2zi2JKspj/OgECGqkDWeHOx/tqAOzWwqGgMbnmOZvYS
 hzykVOWcmhKBoZN6+KfXXuY2SXLgK+tczc9cWdiPY1l4Bhu36mn6RWfsyRu0665GK5DTlJggHH2
 70iRHYaQZr8O+BEiGuA==
X-Proofpoint-GUID: bLBI7F7U-rT9weGK_gpKkZf4EnP_eZ9X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX0tqU5Kf7mKqT
 75l1u8k3RE3hsZ2rEyRCN0KhIBGsqrELoVVSDZS8e7zcXIusjElZw9GnvuxJQk5l9qnWp8pDu+T
 yf2sv0XbbCkRcb17N7U0EIplHvSZyV8=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad5f09c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VlLPvfKzbJ7SQR9nEpMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 26-10-18 19:15:46, Peter Chen wrote:
> The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Kaanapali USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
