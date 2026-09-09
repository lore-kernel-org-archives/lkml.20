Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A12357D08
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935361; cv=none; b=SJMopE1v02ej0M58YzVrn0sHwldBXQXCY1owKFcJeUY0a8Vx4PQ3mNVBrAlVle14wmY6sStvUfE8Opt7ibdJvFsZkyZa9XZto6qpjVO+8lKfwfYfCeSff81BY7W3Yx2vbfJH61ZwkSykJmoggPSWTirrAEp8+8dgEx97QgEZMpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935361; c=relaxed/simple;
	bh=GApF9KA7a7An3y3e0JIVJ0bz/r94i/L+WtuY8JrvS10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vt6SV1WYl/dvkyevY+Tx24fcX0oki6q5adqJsc7WmVZRbF+jSGV7D/dtBbug6zalyzCs1U9EFSjuCDxpNGm6cna7LnonZBuWGOinndd9rj/XOh8sO3LSh07BXoJJvb/2620ExEC2CfuQX5CS3uOUU5o7vSYAsjFZisIoYDeYFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNkndGI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjUCDJ6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNkndGI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjUCDJ6M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896BL4v1274463
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UuVzlSB31qLhxRy93vlak5xk
	hcEfOZHHWWOiuFWT7KI=; b=LNkndGI+F2sVu3y5Jk29Y6qr8RzZHDbUDldUWiet
	jDNwQBuB1w53SE5u7S6smxLJvGwsbmuQizXPBfXnrHsCJMLMzvmSs1Z8V5d+Ex2q
	QYYjDQps+IxT4+nUEawE6bDduSv+xQrhJF5ccgaQ84bjKaz786cGcUOYA8y1YED8
	InVhv7bYQnLFb4v36zcGVO9EOLrmPRUZ1z8XCGHuFrToVlGpcg4tpUnRhJA75NbV
	G4Tpge1Axdb1PhY5KFtXcJYoUi6Zbgw1uVVAdnxYAOj9yB8+lQiDzlJ/5SN0oqou
	8IOwNIEBYCNoYFRKYzTR2OlIEAiBOXaFQfyLtkEWEP+A6Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw2m8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:29:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso8044178a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935356; x=1789540156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UuVzlSB31qLhxRy93vlak5xkhcEfOZHHWWOiuFWT7KI=;
        b=JjUCDJ6MYGkhy1Z8JVs0iQooCFNn2aF1q0DperjyXqjqsAPVTMLcxjUeHu/JgoDNdT
         anwYZyL2ihKPi8om9wqpCN/2pqwG3risJy5OkrjSFgL0VPp1wBhE/WSac99yu30iA+F1
         qbmM+FwNu0xiHewN0ZurQnqHb6LLrjuMnkBgfb3zK/XG19XfT898FYrNy5fuvcqZPxAy
         Z/OJ4PO4fOfW6yvDqn0dWXVZBjUW2bk2L5PDP0q5PdgqO7YPk07YmW+t0adhK79fQnR0
         ZzCPkSkNkLhuR3ghdpvo17epyHCfDYeXr+WaRemahCgvjwQbtCE5P1e/QhFFDvQDEAlc
         Cw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935356; x=1789540156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuVzlSB31qLhxRy93vlak5xkhcEfOZHHWWOiuFWT7KI=;
        b=WXbzabyQ49nSoYdIvbhl7+fIch7wHsSRloKNIWpQPlz/nQu+jETwsL4xWjruC9MLKa
         2jSlpyLLmPZCevQhpZaDLfM83tkJYcRrjQ8ikuJmNeCB7r1I0Fi8NC3qACxh1DLe/Gqs
         bgG3XtzsWde1Zl6ePyfd3K8FS7pRHj3sd0pJ6waD0CkOXkkgTboc7B4BVksBAFK/w2pa
         ZpPS8fQT22aqK4u6YiaBRU6lkOlym+unCcspTQ7OdaRp/cE6x8NV4Sr8i8+v4Lu/HGmp
         i92cUyYqyM0Uia6uTUCl3zgCc8HbVj2e1c4rxw8uqWqpEACrqFoGrgnkRc2qgrMhdJk8
         P13A==
X-Forwarded-Encrypted: i=1; AKwUvBwp3CQhItH9zr0HZdypR3cyry8rsZi/wxk5D+ybn7KdD1Uywr0Ur/V2ycCpPzD+wKDjxRGdCaOx/WiGDXo=@vger.kernel.org
X-Gm-Message-State: AFuF++kpS0jJ1QRhK6YAJMsIiUoxJ2bULqbkKkqbPzNr56TioKoTLFuj
	bYh2tlYJ3I64VYE3W7+8lD8sjlBD4TQMDmzew0DZO5uKpMnGNVLaEDgA5oyaH1H9SsjX4lMxsXD
	qoZwjGSMa/iYCNcxsvtlU2F/XMoKHRy53vMOvg9G+aNEukIiJLwDEDKipTOG4389Ay1o=
X-Gm-Gg: AYBFou2/2IWc7HyOIgETt0kO2eC60ptcomHxB0I8b/Sftp1pGs+SZXvEps0GiMylo6I
	ep3P4qgqL+2lPsDG0RElOCtrjsh6G25xknzM58ROr8kT4PkZpYFEUjWnJZ0kRx3Tbrp6EEGtJPl
	FHYqsbBCp4DwDsdrvSZwru/sEn7FukdRmebhSZnzP4vUXeIcRFR1fgTV//Tcpd94vYmVUQia5v3
	HDoMnLwoiveNM6k35MYmZJqSkbHCUm0R3CDVvdhSRZacP2NpUxQMOxV0W+RbA5+L5TfH1EhkbD6
	KvSTBk1NkN2LxFJrjEKQa9JiLQpxNCxCA7yzgTGQ2Rl3xg0p+T12OZRHTabZeYw5o22IVJb5ZCu
	i+B1bW7FJboC8dlWGagJXq3/LbJI=
X-Received: by 2002:a05:6a20:9630:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3da39ee18ecmr51556885637.9.1788935355840;
        Tue, 08 Sep 2026 23:29:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:9630:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3da39ee18ecmr51556828637.9.1788935355402;
        Tue, 08 Sep 2026 23:29:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm47823081eec.7.2026.09.08.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:29:14 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:59:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260909062907.f43ahkic5bnv6qja@hu-mojha-hyd.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EagF28behjS4BT7b9V8ohweSKKvHVVXX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX/PxZ0yvEel0z
 BbV424jkh+eJdR3elwF+E8DBm2S00CBTci7Tw4nIdVdb7HsidvYHI8l/6csdtb8LFp4b6ygSEak
 X3hnOIyCOrsYTrOfbLnPbu3Z+RsTJuY=
X-Proofpoint-GUID: EagF28behjS4BT7b9V8ohweSKKvHVVXX
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa0fcbc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=K9csx1bNu7bmPCVkKm4A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX7Hg3zM6XaDyw
 TG1C0cyFMgDmRpN43EIaPW02AbIV6cXTKI1Cd3vTWskceLm8rgnyjeL5fERLKxmERqSsOi/LuXa
 pSMfqm5WsF80rx47p3dxBuW+83s1DkQzdbprqe6ve2kx+c8N/p9poHRIeHceE2flwm6yShAZVLk
 IAkFuzJShDMwrU5PBqhZeFlP6/ISXhcLnM5e5EURJ98O0CluuQk+oG8Jo74jJikXcBXjDJPUSeJ
 Zk9/F/s+TZnoPc2pibRDr1TFKirIkRKHF70tcFiZWUxPBXpHwV2X9fpXR+j0AyMo3iF1jxpSSej
 m4KzLi18f6e5htOMjrQgbjWHkQ2eXveth50RvWAnfTkTisjAUgWmtIR9jMavB09NXenXqe1JZRQ
 9VXq5LnHYBmNZjSmZaGL0ttEWCaY3URdBW5ehTP0WfuHrNgCrgVv9uPnmKIUV0WQbqslNiFglfW
 MRtchz2G1nFKKuVR+bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090071

On Fri, May 15, 2026 at 02:11:05PM +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #3: Switch to built-in for everything, with explanation in
>   commit msg.
> - Tags
> - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> 
> Similarly to clocks and pinctrl, interconnects should not be a user
> visible choice.

Is there a conclusion on this series? As I was depending on this series for
Hawi interconnect config enablement.

-- 
-Mukesh Ojha
