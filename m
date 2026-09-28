Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56124F472D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613989; cv=none; b=p9moEzVmxpfrYFtfXXlC3y3c7YA8rOiYuTjwR2QhtjxEn90IsE2mrRBH4Z9AE5qz2MrhBAISry8ev8SeehmHG0BWF7UaktqVw1CylSrAofO01fvSMw7TEbuFtV05FzZZ3JiNRpT7F6fSPOBcNn5g4DrFDzYReX8+loNtC7rWVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613989; c=relaxed/simple;
	bh=wUgGtA7dLjx1lOGU2OV5DEmUzecs4ta1J+YCw2zPXZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImAjAy7cTJELA3b8WFEjt4JGzXFxBk7Ahl+uX/2jeWx3rGWzE1WnJUVtjH3vOeLztdsyBskwp1S+quqBpDftVD/wyooTb8A3+idrxkKarmtHBxAM3/T5UR2pzSs9V/XBU2yoaBiXYhljjiQCGvvMEbYIIFu4+z4W+pTU2J6FwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyIv0RSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrVhws4G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyIv0RSA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrVhws4G"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdu3G1016603
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y1uRUm4Mo5eB3KKuXU2hZKYR
	+aEDg87giYh07OUbqjo=; b=JyIv0RSAPLr6JQptCu9MOX7mPKUUSPI8mN96f/tg
	9sVCgrtVux9OCIUV/f2bpcJ6U87A4u+fDbb8DZNLgvMDgO5XEL2wIHsc3fLGLuar
	sOaBdiwDR2U7BYa61O/1VdrQp9qnxE0z4h1eILm+5TS7hUADMTiNMGviqv1Qepl7
	qHw5d4Du4OuowVJLsbvmcbial2hNGfDJvnmeYK4QsOB7fZ4XSQA7DpsWXwFQvdde
	NgGLAjnryUjOvYDcEcD+Lhh6vaHbN8KxreRTAGdy3bCc2fsSyVnQEdLD7wd+5Jya
	FOW1xkFa3oLP0F0IRiToCdUVlr0NH4O1dbW79KLE+jmKjg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq36fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:46:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a04805f8f1so2830699137.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613984; x=1791218784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1uRUm4Mo5eB3KKuXU2hZKYR+aEDg87giYh07OUbqjo=;
        b=TrVhws4GT2rEfArYpnD33ljhKx15TkEEX5ugdes495AYhOQnRPtQ6Rev6tM9XjNVRU
         Fvn9uGgB7TYsHFLdguUYBnAVkK7FL5oz7EQHHmRd6OX3NvRqLZwe1LqpKGFImDB8wE/S
         oixrSe5oamQWKmwzelYOLZhZXim4Y6upEKjzinfS+J7CVuK/eb80sLLtlzsKaV2pJxUy
         RbcV7ORN2uBE7Uu+9tptAaOmRiwQpreGM8PDMcuHPwr+E8fkz0kt8PCGlFbOgWKbMJA+
         b/Q19z1RrtLU9JQVDW7uj+v6OoQcfjle3rGOIO1ap+bf2Rwt8yyrrtqDoh5Fo/pKNIjU
         q1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613984; x=1791218784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1uRUm4Mo5eB3KKuXU2hZKYR+aEDg87giYh07OUbqjo=;
        b=b8eDZomniLz6XuuCfxdIm3WgSFOmCYx3zpVdrmG5RnpZzNNLpUkq16rIkVFf/8mJWG
         pPVgbQJZszkwcLz2tpSQ9JPLEdWvW/1tHnrHkfQiKq0EC+RihB0O4b0ZQSFIpIVSTOcq
         JElBBhLeYzLQmjZMsVMLSpIyIIJdpL7VWUpE6x0pJ/17oNiJtHq0PSNQ+d3tQ1A7PXM5
         TsfgnxjKMmVsomj/gpUrcMgfbuZPe14XZ4CMrPFvjImI0FVJ8aMrnNUBrd4O89DD0R2z
         puZ2lzQI16uJcZWk9fSzJch1Y9vAtIPx+oxrvPu5A8xcKf4flVpemfjGSlvzgXwTHGSU
         OpBg==
X-Forwarded-Encrypted: i=1; AKwUvBwb1Z+um/5GkJdrN4Lk2INxr5rAiiVfgx/MLslMKilJ3jsqEHPcne2rvnSP8tYIgDD+4p9iW3lt8ZhZOxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlNuoV9ZX65k1fLJEBN6zWxtJcaqayd9eyduxTdDXtog2oqiub
	FT3nvKaFlRyCSE/Eq0dthCyE6TyJDC+YQ0q5MQgmKmaL5OyRIjtglfKJ16kY6gdKqKuYRCtn44K
	1WIpyytgoMDtz7v8XayRLZLFhLev9pOENJApxpxxT1m2PM/ozRaEn+za2zjfK24bdtTM=
X-Gm-Gg: AYBFou0YXZmHupzKsQ1GMqcjnOlFEtEoytZEOpngMsvAV3H0Hc0gEgg/r5XhEIO2gCT
	H5udQUrjSFjSGTfsQIPkgTOsF9QIYBP0bB8rkvTD+4lIYJohJO3yXVhv95fqyk+05JtaBY0asxD
	+EREZWwLxc7Ff4YzTM2BIGarCRiUjKu68/7XhlqxIoDtd4tIhOGwRZ/SNJQMIzBeDjH8WpwWWq6
	qLkNsAX/NwqvotoN4oRet1g1koOlZBh3BxuhHd20N8UrCktPgfBmtzroZVw8IoZP++ijUCoN8LP
	KIe4jMe+nxrYUxxKiJQ3kbbtPLnEKH6iTxFnQ8HlZVG3a1eIaWvDHxu6B4gv+P95Spp70mlBlh5
	LbHU+rhthkCDziZM=
X-Received: by 2002:a05:6102:2c0d:b0:7b4:2acd:fb9a with SMTP id ada2fe7eead31-7b42ace0b41mr1518660137.25.1790613984282;
        Mon, 28 Sep 2026 09:46:24 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0d:b0:7b4:2acd:fb9a with SMTP id ada2fe7eead31-7b42ace0b41mr1518400137.25.1790613968218;
        Mon, 28 Sep 2026 09:46:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea071sm4017915e9.9.2026.09.28.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:46:07 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:46:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Enable IRIS video codec
Message-ID: <s6fxuj3ipfz6nl2hm2pdcpgaj5fxx2rpurxtdfy7fo2srwqe2i@smx3fy6ukxzx>
References: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
X-Proofpoint-ORIG-GUID: H4gKGoMXtGW-581F9aMpMAGehoJfpTgt
X-Proofpoint-GUID: H4gKGoMXtGW-581F9aMpMAGehoJfpTgt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfXxLNn0J1slZH8
 Gys7l9WhHtJRLWla3nSIpt0NvwfHs29e+K5w9ISdKfvjfkvXKOET/xWBVxmme+PnYNOocemLNTH
 zLwxyDYYFjYQSNiBrqXNg5X3NtAAMug=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba99e1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gHjZUIugi9cSBFQiOBsA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX8vPfwIDwgdSk
 HFlwrrIKzXIyBMyeqd1HopZy+AZOPruyNXWHEt5Mf4tYgEbJQs3BiC3wYEZotF10CEWZvjhwVgR
 Wql/U1sV7CBcluzfnzTmtYzt4h5nWtuf43MEzG78OSshaW9aHamvhuhYq4zyK6nEZt9GIARcqWF
 SXaULuzY2/dDKl7h1qtvFb5k/3I8CWiLIlKiMAZhXor4H94dlHv0X47y95FTwnSZN7t7C6f0T0f
 sHgqpNNJu705pkrJD57Mu0wb7YRfhkOtY43stPGgtLHMrCusxBBesL15r7iJ/fljHh9SQDaAoeR
 fWdtu4vtEm25ExajMzlssNjMYpPIoAKbKwK5YlWb7uYpJ6kyU4Dhek6gvDzDWm9x7GHuSzuePht
 11P3qD9iqCG1zQe5TdBnjv/DhFCnphfYbsNPbuEGkMXYqiQmumBQ46GjnKSHONeyW1nxlhLy6Da
 mU3K4ugB237XGGkU0uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

On 26-09-25 21:51:03, Dale Whinham wrote:
> Enable the video codec and point it at the Denali firmware.
> 
> With the firmware in place video0 and video1 appear:
> 
> $ v4l2-ctl -d /dev/video0 --info --list-formats-out
>       Driver name      : iris_driver
>       Card type        : Iris Decoder
>       Bus info         : plat:aa00000.video-codec:dec
>       [0]: 'H264' (H.264, compressed, dyn-resolution)
>       [1]: 'HEVC' (HEVC, compressed, dyn-resolution)
>       [2]: 'VP90' (VP9, compressed, dyn-resolution)
>       [3]: 'AV01' (AV1 OBU Stream, compressed, dyn-resolution)
> 
> $ v4l2-ctl -d /dev/video1 --info --list-formats
>       Driver name      : iris_driver
>       Card type        : Iris Encoder
>       Bus info         : plat:aa00000.video-codec:enc
>       [0]: 'H264' (H.264, compressed, enc-cap-frame-interval)
>       [1]: 'HEVC' (HEVC, compressed, enc-cap-frame-interval)
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
