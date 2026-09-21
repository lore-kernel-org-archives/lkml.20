Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FEC430CEC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988800; cv=none; b=BMBuTq8dpFR+oYQ2zlZaS6O8wxIaz+xssbc/FBLolurSsPwWLwDldbVwKvqE5fLwg0vivZ0UjHVz9F7+xK50U6PslFgX11DDC9uV7ceAyYOh89LIYdxHSTn9B58nH1R312nIun8CnKOcgDU6DH0loH5Ek9rjHFz32hSagEobCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988800; c=relaxed/simple;
	bh=APDQF13y/S2iTJC8bsCnwlXoIXm7Osc7h1xGKtGf/V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNOUPE3gl2SSMFzuumFzD9z3ommyJq8AEjODMnyzWBW0DCkSHETq8U2kpbEEzKvPCq90NMLzqFn00VYLoFTEC4WmcLXkFyWMDzhcgErhFc+brpPHjtWZGAL+pCIxB8H28w1rty70dfC6PUHR7ekPzWQIL/WBdcCvANO5FMjTHCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8W0TYh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alIogjgH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8W0TYh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alIogjgH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeLnv1219039
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVGPjxP3QgcDv0E9g1JTcpUHcMxO88kzyAGTghYjz1g=; b=m8W0TYh/d0uyebaF
	/H4rugJm9UHLtaks3QckssiAtyDNBN4VuiPevXR9Djr6KzlTqNqN94dM756RqGU2
	NScRNU1R8rw6V6EHlfnol+na3tTdTl+izaV+EApchomVaHSztCRB2Gr/yfhGRdnX
	Iz1Bxp3qr3rMUteI4SEwqtGKT37Qq1B4D4Fs+UTQiElzZQ3vjCBQAZXj5XYxb/3G
	bkbPenBi2YQVunoAyv1n8iI4d+obL17oNt7c5GmCUW68PrvRGh0SxpJtsQVzKsjI
	Qa7UIn7jbSnyIy5kiKVrb9zhBs1CubhRxIdm9WvcSkTT/EP958vHElgSm5C8lIy5
	1aH33A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0118wvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:06:33 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c84b0a43efso101257e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988792; x=1790593592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVGPjxP3QgcDv0E9g1JTcpUHcMxO88kzyAGTghYjz1g=;
        b=alIogjgHTnDYsZU3X4O9nwBJ/dcD/mfTtZsWrYULgjIsTsd6y2XdOAywFhYu1Q43rH
         Ut4D/Xf2Uz7JJPv47oribEwHjtxtSOpi61ulaPFU8S/rWZLIUUWzMnRnCxy+2UlTu9tx
         5Dnx3xEgcoxysDuQL4ewOQrY+I8aXbx3yhbZRe5IeyRX6M7fbaDjcpmT5WnZmuvNZWce
         B2rMPo5AI7szT2fiB3/62MCQftpEjMdBedvjt+epF4IEwmVhy48mI0jFIiJ+B/dellcN
         030Uj6eSPwlnzM3rg50KwlronZggMmFNus1K6OyrQoZJ7PoE0VjPRErcmMK3L/Y2uG6E
         NgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988792; x=1790593592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVGPjxP3QgcDv0E9g1JTcpUHcMxO88kzyAGTghYjz1g=;
        b=zjpNuCWwBieV6p6yjtSesjqQkILvZUspbxVFlTxiWy0nYZWxduWw2ri4onPIELTNPt
         HckFWE6MCfhHva4gcnNl7xvSrTpA5nm99B2lT4JTS8T4YpkTxtJHLf0xLYDZ4lxoIXGA
         52AielBHESJpHNyXgM5a8v29t5afAabF1QZY87jDw59w6cRAo5p0e1tz/YOhWtfWIvqc
         ZbQHQaPVA4TBHUajBmNbaPJC43pfwTcqGw5vIYwwADdAQioFhOs1rM6nwb0Ie9HSZVZ3
         CKpOTYzbVCO8LPoVbgJbCeaaPqTVUs0CwO4wkK5RRxl7ZOdn+c2h49ChNOSmH8u30qA9
         mx/g==
X-Forwarded-Encrypted: i=1; AKwUvBwAYz9I11c4+lotdHmEXXJ1FClL3SVKt0qwygHAep5Ut5dTRVmxjjz60etFAL/FAUZQTYSiMpmU+r9a8VU=@vger.kernel.org
X-Gm-Message-State: AFuF++l9AqSJil5d1ReV5YevyFDrVF6T26fBMBMZM8yHRvplxaOXSd+S
	xxJK3MLKCFGebzo1eUCYCsuFpQngE82Uko1Isp1DVUnomi9dhw0WvILbkkzR5u6Hb7wg1dkFcoR
	OOdTrhqseUUa2RN3ArvH/g1tqLqwLmkKdBTGzkg/eo+GGRY1eRMxN3Kdokpn4QpOzCVo=
X-Gm-Gg: AYBFou3LgGfUBC+0fYeDLH1TkMNHAllp8WBYpkIAEWtqmPbrpGsRvRwSmoSdYQ8X0gg
	/O7H1tW+VijNcn5k07kC0jBHHTV6wzJTsBtuHG80CSRZARuJSs1uBhdL2gbqdYznup4VRb6GhRI
	Qch8Q6D8V5z0t16FbCvsPW/+WGxUyfR6NAZ1BEsnxWEMeWp9+fb7wNb8bXe5VO/DbR25mFgi+fO
	aIPoFQbyxNmZcn87+1ihRN7gpqZ3K3hf0q6v+ygy5iqU6RAwjWeNMoz4w+PVLSohOcyQXHL0u21
	XYbGbagFm+AcBMAaEczn8kEfvKYX72j9aJAjXBe8wkK8X4aDVCaakcxZAYFUC8Sfkwlu50xncyq
	IhbsoR2p9JVICso0wCkQrTg==
X-Received: by 2002:a05:6122:35c1:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c9bc3b53e6mr3524535e0c.2.1789988792527;
        Mon, 21 Sep 2026 04:06:32 -0700 (PDT)
X-Received: by 2002:a05:6122:35c1:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c9bc3b53e6mr3524484e0c.2.1789988792144;
        Mon, 21 Sep 2026 04:06:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e1b7e1sm3810951a12.26.2026.09.21.04.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:06:31 -0700 (PDT)
Message-ID: <8204dd54-d282-4303-85fb-d5408cc0b4b2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:06:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] backlight: qcom-wled: Fix NULL pointer dereference
 in wled_remove()
To: david@ixit.cz, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Marco Mattiolo <marco.mattiolo@hotmail.it>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>,
        stable@vger.kernel.org
References: <20260921-qcom-wled-backlight-v4-0-bab8c7ef73cb@ixit.cz>
 <20260921-qcom-wled-backlight-v4-1-bab8c7ef73cb@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-qcom-wled-backlight-v4-1-bab8c7ef73cb@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zh5Hr8tC2ZKQMsEtI1I_OLZrbNJyLhTI
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab10fb9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z8QxmeLbveigHahU524A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2MCBTYWx0ZWRfXx4hdE723vFtG
 vk1CNMTsober7WRdGFgrAJiTe9NrTxRcUrkmZXOgyACfEjm61rjgw/K5NbDugwr5oa8iNoXDMAx
 8k72dNt9tj4lLs9GbahOWPNO1I1bkDQdDlaZKIpF/3JgiX8nRv0gf+bPf4lPdUoChs5aBnv+ing
 yZA7UnXGl3XSZy6a8Sns5hmCz5BkBCJDPCIQqWnVnqMlLmgPgFKKg3nyveZaFf9ktAHHIk27vt8
 Ti8cARtJy2lZufe4ccE8YEHMfU0UEnzD7ZUACAvLh4l3a37pfan1Ckr5QIRpikAU4lEgGqzLu7D
 UVVvEcSrG+y3VoFfC79AxQtZ4CKs0eTHEr33leCi+JzRpthr9GHCWptzuncS/3HrKX8C1VX8tuO
 qe0EHjf/m72oBF15z/ZMwhK3rM450a/LiLVZTZD01SPuFChFBl2vk4HH/+S5RYcftMVOpDuyeOs
 Yr4rjlTEqIq/wgG2Kgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2MCBTYWx0ZWRfXy1e8xBtpVxGo
 vj22tqbkuCx0S4HjIvOK4U2W9IChUr0U2ygmPjlUppPA5KoxIbm1wdQ5Q41z/IfA2qme6km0N4v
 eqgehVZNcozcEblEMU7zpligcUUT11Y=
X-Proofpoint-ORIG-GUID: zh5Hr8tC2ZKQMsEtI1I_OLZrbNJyLhTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210160

On 9/21/26 12:46 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> wled_probe() doesn't set the driver data for the platform device.
> As a result, platform_get_drvdata() in wled_remove() will return NULL,
> and the first dereference of it crashes on unbind.
> 
> Set the platform device driver data in wled_probe().
> 
> Cc: stable@vger.kernel.org
> Fixes: feeab87b3072 ("backlight: qcom-wled: Add support for short circuit handling")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
