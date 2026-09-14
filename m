Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145B443312
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388621; cv=none; b=sIZnZYBPvkAV3fSgJZlELa0A3U0Kr+1JKzsr6epdOX66qFDetMWo+4v2yo55O53HxdNz/23GhnSc00WLJpXef7hovd+7YAb8crC0MhzJa7lExScNWq29Q7LKz8oi2cKJ7pxaVhBOIS/7PZt2QdJT0wGqoNu5zgCNuwObOyNZJN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388621; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOul0ZKMJR80JP9A+X3AOT/ZLgLjnoV3O20fez/dokVx94R3PbIdQFL/YqsS+smkYie7EIf6BNNH1K0Ww++bB4Y9HSuChuEu8SsB+JdQTTkuHpUZxipI0CPVsgCBQhUYPc/Bg4EnZMuMJubn9kbDYE9ca9Ehxdq0gcDMVL7XExk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWiZ+hpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOFoK5c/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWiZ+hpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOFoK5c/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNC9n431594
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=EWiZ+hpR34JIqbYp
	IpJZ3212ago+FCdTmeAIMLtmarySHiY+xBoGwciDgfDvdL6PJ0zsRL49ULlpNh05
	kJsCXPgK+UaW4Xo4nz/Tv58Vjkh5cBPhpUPeG5IPsGqcn1ZpZbm0hPYl8/s18Dbm
	O7z6wBDI/oZiOrEOovBVbcNKLS4P6RynzFJNWCWACZDNmlI7Hvz7IfNkKEtWKqlX
	Z3+1firrB0op/RC69+B/cRYdLWpaVR8uj+XXIrOacuPhVbspftd1qomGR0xgBLM9
	XyUlMJzoOWQSXQsV3ssIZACvqe7o8UH+rx2JTgzba0UcUSMJDDbSO641hIsdJ3+Q
	mm2Uww==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg01b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc3dee8aeso29349241.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388618; x=1789993418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=HOFoK5c/q84IkBSYU3UWyoF8T59RDXHSAp0whQszo3LSoNi6Mr0i0XHrkesmBPQxM/
         uusO7SO3nmZZi5rPnCyWaShcQLq7uv6TbQ1UyzqC6TvwNiDsS1E0CkxJCvjFJLG6a6+o
         FxRJSjHX6uqJnmihpVcJuC3baT+VqyusjAj1f0CVQ/MLZkIEfnaReJxKvy3/T5VnLYIa
         R/+IlFwnuoMgPi4ez+7U9OC/GElASyNznlZp0jvV0A25ivllepCrgVjuvcMZxXi/H9ej
         hRD5iUQlLOdu3E0fNg3eHTv9F+fLT+lDwS/fIMjfpiwyorBegskzEme58nr0UY+vmzPQ
         WtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388618; x=1789993418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=VEWPGDC5VlPNBwAbr43UR2I0lxTH0QkLRIgNnTfhZ0cvMIpghFh1lCe65r3tcj9EAC
         oFcRiQKsSaWSuzrxc5FR0Oi1rYdm/orw1m5YCjuAM5x5atxerUIUdh/gCVRiyfWfFdxt
         g44CpI67ulsUWA9g04W+zCj5lom21aMHVHYE7/EtT8r0Ni1XvHdZOFEgH6YjHhshYteU
         rADmBw0DITPKlPl/9fQCvpG2eRMNYU6lvAW/AslY7tHKDPG7LHA87IeUlvDs2OPftFL7
         rSSZ4sUDhv90uS8+gmGIr+gWUAKXKZkZdxJG0zUzwNrDx1HEvMx19ccWAu+R0UxwCE2e
         lrig==
X-Forwarded-Encrypted: i=1; AKwUvBwcWvjLFLWn1wAcWu/O5PiZU/It3LpkKI6ElHGCGoCePcXivnKyzSO//WRbRt5KLRIZ40CmEb9y1FNW/Ik=@vger.kernel.org
X-Gm-Message-State: AFuF++kXW1JF7Pf92QZZyaqCaFJQUQxlXHyw9Fi57YmvFPPBiue8KQym
	bgBUdd6nnFeD+VgBYBDlMPGDnnMjenHUDr1xT7nbGHhvDztzzAZdhQlxyS8n9Clxh9hqj2Sjgw/
	9IvWu5Sqouv5AG3LWg8FRkdUzxotKO61HajlpH4kiAREta6pyi9Z5bSluoNkVePYcTsQ=
X-Gm-Gg: AYBFou3Oz8FA6DbUAIPbLC95bJubs/XBMpKS420vTfcX68RjWRykGac9fBDUEXEP5CQ
	Qr7uWBMiH5X1i3ma4yQM9v6980inT20kyK02/HBRcRQ7BmAtwrYpFODDdfdnsAhPtekoOz8m5jq
	xM+FVVmf4msM8UI4aa5r02jkWgoSYSPiy9DsMVo4wskr8IMEhb4jm+GjxUGrwpN8kaXN3HSr69U
	EmSyXORR6Qk45M/v2xeWgS/5ZL7CyiCfkWpWky67lCrcWlrA/paBU+qploNGkShiC/E21eM5bH4
	6NQYMuMHcLc4B+8Sf6KBZhXEZoGVszVOROBSwB/uGs//mr5Y/XCGxEcRAVqbvzTFl4Dolk5QgQM
	jAFkdpbwBqthMhcCmGye6uw==
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283593137.0.1789388618372;
        Mon, 14 Sep 2026 05:23:38 -0700 (PDT)
X-Received: by 2002:a67:e3af:0:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-79b622033dbmr283591137.0.1789388617945;
        Mon, 14 Sep 2026 05:23:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm22882931fa.34.2026.09.14.05.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:23:37 -0700 (PDT)
Message-ID: <059601f1-d248-4251-9373-8126c2403470@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:23:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/31] arm64: dts: qcom: sc8180x: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-7-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7e74a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfX9BkUczalzVn2
 usgObg/xp5y5ylTtwkfyJxXZ4Am1gpKqNTrhxPmDClgDVEQJPlxFqCCqyR5kcjHCE2xdVQsQFxi
 TfIAs2yKRSgLo+BK4U7TMeNqlS45OtR7fp8hEqN5Cq/YyjnYU5mTQSkA2GPTaJT2aTqon9fM9Zr
 lPu1WpXNlowBC/25rHyycibBxY1zAuGdEm2TZ08KA6Hl1eedBt7RNQgL+2odD43onlPmlD2Eqp6
 m8bZYRRO8LjTgE/iE0RDeAlzPocSJRtGfhEXhRr6lA98sPiSOQGJCdcYVtLEQczVPgsN1SBXUSP
 9DP9+cbGrhWeF4nQ0tZF5m+1MiHx7tE3EaNmFDTsxrJGRVaCzGtWtaD7u7p1DhqUVyNPO/CIGdZ
 YTCKwk2FTae8itsT9Zh4dbdjoqmn8ajHgjRJciFGVvIdkD/7HkcFGtg+yOsjFbNGJ3agpcRXLgq
 1jkmpBg6SZpE88z9OXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfX8/ZcwTbuiNhl
 1iarmiTPbfQ9lRkXatLAii7VzH9uex31+8+coEjqHRnX2QhvN4yMNltPw18Oj0SUvpmok5yeyHv
 z0tRpy52n8ErCC/cJffnb4476JhQwEc=
X-Proofpoint-ORIG-GUID: SS4Ch7pj-HGHwC8G3g4qVnQHfmBK5CI-
X-Proofpoint-GUID: SS4Ch7pj-HGHwC8G3g4qVnQHfmBK5CI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140175

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
