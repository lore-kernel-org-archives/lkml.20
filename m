Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E444A416
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919230; cv=none; b=XQMFuIxswI5tk9GLa3zWLnwFoYXj5SfJHOb6riXgxjpBq0/VIOS5q4jAOmIVvGC/4LA3X7gudL6j3R9RnLvl0C+m8i9fLR7dJrQMscszwbYBx+3i3P+Jtfct6y8YwU8ArnC/HSLI4/uGYgP30jqmQMW+WMsY/XrdOasqJySkpAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919230; c=relaxed/simple;
	bh=8bbaMqf1c7ruRGitXeSZN33UNs+ZfrWvXWxrlMS6lNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwRgar53h7E1wVOpxgBUQRFlyFWrIhW/CniArbFvJg4QM3WL0ZTwvhK5o/yNStSD6eeMS+xmfSphHiauE6LyH9CW3L+UAyfavvMMX+w6m+mTHDexdKkaGddeyc05B56WDMuDrmFSEQVL6HWFOE4gN8cNii6zIv91cL70d80uOm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXFBwlSI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRdcaeIk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXFBwlSI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRdcaeIk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7duG2744831
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LRg38io7U4Jw1Yasplk5QAWX4aC1cV4jh0oOs6XnaY=; b=cXFBwlSIayvExOJw
	UdQy3cW8O/5MVj01nytPH2LeafLa8oAmIwrBdNnLsr+4BminP+NQf0Ugas6V4VeT
	AHLN0JOw5r2yORGQBa9k0C08yW8VFf/FPDstyKSMpNcEs9NniQ0/zq1m05zhvmNp
	XtxgA0gWpo94bfxwI7Cu9uFyM5gkGaQz2clfcDgJabZVKRoCXyaIqOn59aBpEi4L
	p8VoPjtnE0hyUbTpho4ncVQ8qOgSF8frJd73sw7x6yA9vXR8rCuWh9s1yaHNd1Ol
	tfj9s+l+hTNDDnZgKlmK0/zTXgphi4aGLkBD95gJde/AID6kpSgAIV5OgBvELjQF
	rfU5wA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxsqdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:13:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso22376385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787919219; x=1788524019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LRg38io7U4Jw1Yasplk5QAWX4aC1cV4jh0oOs6XnaY=;
        b=FRdcaeIkUtjkFFtBZ7/K4IcIRnENQHc9iRih1G9bR4mI/x7eeiJG2DyaZw5y1ED+ar
         aVBwj5Jqz3X3xTY/MIad+192VkI8ijK6kZ8VtvPfYDTQq/5e01j7lK73PyLKRKYHQ+us
         OqB/i4d8mIGfNGAzWro/YhotkJ9z+6w+CIDtI+uoddXOFb5N/qlowbC/RKbtkKb76GXo
         +auvfT7FQf5JG1svMgyyrohjE76A131OfUT+D2sU1WfkLk9HouGeuW5dpEgYEgm6HWML
         1g6vKpBONn19XifSRLNuln7+N5kCQYBPbMhqUbmmXUi4h5FhPy6dvAF+ofmp+pXZYGaq
         XaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919219; x=1788524019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LRg38io7U4Jw1Yasplk5QAWX4aC1cV4jh0oOs6XnaY=;
        b=nRuVBk/ex5zsuSJwdxs5r5Tp6PUyqf0tE9vCKXFDMUlu+vlhNX6fD3IAVQqZH+BvQr
         VLANLArvRN1xX9dw4fwfMsCtoHm3hYEyMfaxINI+nAvT2mXZa+mAV7ZSDburAhXp2ysq
         E7ucJ9kUXH/LwnelA5U1QnGCGgOL55awlUJkRQOhBu+Lut4aydpPfvDIbeNIM98mHv7f
         0Ju3GLYVfMvC+I4tSZ7NMiep78pZro9x5u0QKgQ4uYyuaPusis+rnpCS29cGWbbV9tLv
         9Kf459ur5/MQDbU4zabMKbAtJLUEP1qp/6Xs7sjDjNGNVLuzu9j4aYO+abE6V0BlBghq
         lgWg==
X-Forwarded-Encrypted: i=1; AHgh+Rqd14zgrs5dqe0gc1k7d7/5Uc0B27/UCpKZDWDSMMsMCL403Ed8WLDGZv5/12E3c41gOiKfa5MosGv3qtM=@vger.kernel.org
X-Gm-Message-State: AFuF++lK7nASbf4dIvg4WU3eKSZQnv+gLtUl8qkigsPSLcd5OxIwGUxK
	h7PiJrrCeMxUxvRr0AQe0cR0UQ5xtWMQVDsr+z/Wja7Wr8M/W7chbAOnWwoVkBdiSruKGhSUEpg
	XlBhhXEv4OOFCLjgeo8+2teAOI/hi2v2/uQmw/z4veJeelMjuq2S49l2cGr8bU/HRDqw=
X-Gm-Gg: AR+sD113xtbAZSP9LAc714c/X2d9ZJOPYO7/mxXNDapCn2FwMzphWGLk4w52mQiuWQi
	smlwsoBNgzoxWoGY26r0BNgP3s0Om/0XPfv0zqRcoccQZ/0AUSDTDZ6zb6zbbs7CMXEaD3ki8iw
	4U3PJvLLHNTwA0dem0rLjPNSK6GJqNjM3XFIXTtzcZcp+oJMZ7imEJrAEOWjKal2ThsMlzkjlmk
	Oxbwx5CfZEfgoj7tuBsHRE3zeYiVdI3kGcPEo+N1hGjmgXwltLg4dU25XdDe7uGdxPqH4Tf24fR
	a+HsfvmFTibEXvVlXPv+Y0BoDRxsdnvRcya0MoFvGYA4qvuFLHmEvj5WqChpUPNPqGrhJFfChUq
	8VA5GFSMatLrxT18ZhBiM7xA=
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr47073731cf.3.1787919219203;
        Fri, 28 Aug 2026 05:13:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr47068881cf.3.1787919214003;
        Fri, 28 Aug 2026 05:13:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c52211sm501354a12.22.2026.08.28.05.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:13:33 -0700 (PDT)
Message-ID: <c35dccce-999b-4a17-a761-57357e8978e7@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:13:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Rework DP PHY runtime
 configuration
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfX2u6SZ65yUW/b
 UfdfOXHIbLeVdeo4rm63cOZD97UrV2ELpP9SxqaiJQ6mlNJaAWEvRP311wicev8EV3h7MdZTEo7
 57VyGk1CL3uflghkctu92Z6+0hHckfIzi+1hJgPIiWlcflTPCcNwjJvh9S6icunhslHmRAOSIFS
 OTD2+DRvzPqVnOANm/RzjptaXvrwjrqjNsO7NEfR6U8JNG0BCiDn+KpPDI+Zpouln0J5EZ5b8BX
 z4kBbQCFqCufsnLVNa02CFNKVHbniREOyzskfc/sEf0cwaXorxBLoyEco0N1TRrM+D+DUzjEhFO
 wSUof8r2FJy5ZpJEEQNp083lCbI8is8jC5OvgdNasuIySYtQcSt9Vwl3apjgCOoCQxTnzwQMRvv
 QQZibIqKR2W4iu8oAHnVG+Hi3lJ8J6skBuu4rFWUc3USpbRMvBDsM9RcMDiY/xyG+lHHENzJ7TM
 d4b7W7uiQKNNB08qCLw==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a917b73 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZTvNLpm-z4kpgeIlWLoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfX/sTP53ZYvjB+
 an8neN3UCsJXMMCCxRlNdPsPNROlGCybxwy/vHOWJ2NJfMUQ91u/R90E/0PvmI6VUNulYmTcSFl
 Hen08A/7DCg+8xtoo7VBI1IQnOHkZvo=
X-Proofpoint-ORIG-GUID: jG_jMcMgobvQ48ztNf9fRu8mObQWHOJH
X-Proofpoint-GUID: jG_jMcMgobvQ48ztNf9fRu8mObQWHOJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280105

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

[...]

> +static int qmp_combo_configure_dp_phy_common(struct qmp_combo *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	u32 status;
> +	int ret;
> +
> +	if (!cfg->dp_aux_cfg2) {
> +		dev_err(qmp->dev, "DP AUX CFG2 value not configured\n");
> +		return -EINVAL;
> +	}
> +
> +	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);

This should be 0x2f on Glymur

Konrad
