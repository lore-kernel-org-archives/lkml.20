Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D124D496D5C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993746; cv=none; b=cqaF2qxtNvTKqsB0FFBbDldu4xVRgm3ow4eKW4JQa4iNJcJiCaGHtPhGl2rcyDiBuAf6r/UUU7YELv/c6gUr+R/SrNg6Hz9NDwHIzZ1uDd0HhjHnoT88ry5yGcfZE95S4dxD7nWCFWEyl+13Dzg8kJQpTskQtiH30PyVseWWzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993746; c=relaxed/simple;
	bh=OjmJ8SXu8xMfqjFBYQkETIoPpmfq9H6Ub7Xx9JvwWQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFqoD6tCU5oO++uZEAPvnq5VnDnZ8KpaS41O70jjn2K6iTBZH8+luL8GT3+Fn0U+jvhkYJpDccdhPC1LWIoRN67bYazd8mJGCCeQbsri8I0Xgr5Sbg630qMC/FP1qvCt1E9M2El2PBvF9iD8JXRgbEKOvSVd3G/k1t46hw7jgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9GGWidx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfiAlAqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9GGWidx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfiAlAqa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4jvc1129584
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uc+TNfqvfLkCqO0IUPurd5yf0xD9kPfhoXSWPe2gtbA=; b=K9GGWidx9dPwSV95
	GM4i9d34ZGYg8rtiqBH4HBPDcdi7/GJ16cDvfNJTMi5zHncH3PKLuVd+7oNFIFZh
	p4y8Cj9gnLZCVKT/bdRRt8AW3EZtzaUPTiv+AhqEOVyyF8qPSxVCG1iXhe9hQ5N3
	CIvoVg6oVyUtt+ZguhFMGXy/sX7oMuK1KhZ8WBwEjxkOOoseSdHserh7JdOwAXsR
	R3lXOZgj/TgM35D+Yc4ejgi0ELzy//hncX/vKORQaZRVxduKVGv2Aw8gg8W8fyHn
	5WXhyTRhCzJl9dtt14Z1GYOxoJne8RfJvFUwDsMA4TBJFy5Ra+CAliRA830s0fs6
	1IKPzg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg9wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:29:00 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82f9e26ebso98481e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993740; x=1790598540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uc+TNfqvfLkCqO0IUPurd5yf0xD9kPfhoXSWPe2gtbA=;
        b=XfiAlAqajyi0ioEPDenx0FkdVcbqc3HirrZJCdj1xokpdmbLhwoYQqgmxWzB2ueRw5
         4aqzD2Q3KKO11BEUBr6W1x1XHjtuUMO+cwB0GNqeW04LsRWgFmWrBC7PJFaylAfFpCTq
         3ujHkQ/DnluKIv6ZcyYHEsKSuldS+ncDY+0yOIfAmPtId8yuJCRl3fa/r/bG86M9MOqa
         jVwWjvk88izm/GqoQc4MsaZlmjrAXdZbgIDr0AAi1ZW3QleKaZRCiteqfbiInOJ5hMUo
         Tb29dOGPAkViJPK6PV0OKYxOB5Slz2bsu/Q/1syWPKFhIDOw2ZaJpgH+2AGKl/CyUqd4
         weFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993740; x=1790598540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uc+TNfqvfLkCqO0IUPurd5yf0xD9kPfhoXSWPe2gtbA=;
        b=nm7jfF+3OVE7EmN9C5BovbtT4NHU9eUb4hWOwoi0G68uVtRsl6Ti7zZbhqQiB2ih84
         mY3L4bItbICeYYDM+EQT4DGDxob80aeuVp6XAV3OCWQ6YBd24Yk/UePHBr8RkbbxW3Qf
         SKAN5k/rytnfmnJtheqAUOCiWnDh1AG9Ko8RrZaAygF+8dN+LCnM9F/Ms1aaNoDtWu80
         epj2xY/7UubtdIkYa+ZxEoN57wLIllrKInGU8XBXHXYv0TBNjBZXEt9hDs3KJmWj66t4
         YCiSri/ap6C5OR4sZ/LrRl10rS1By0xaJQd8CDB3iijAq4PWeG5verlcF0WetGXKGVwr
         BHGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPZP2ekJXc8AE0Yz/Xlnp2XiIw8mW+66IHN+zGazbag/pvg5/tTFvrCqAbzu6ImWEG8h7vHqnOZVYg1Eo=@vger.kernel.org
X-Gm-Message-State: AFuF++nc3YwjrTXmhQ0qVJ4wWthQBb+xM0uroKB07w5rV5rIssKLpPyJ
	yfeqJBz5rjna+DLIc7fHoSbXB5R/1KebtwEMctEgCv0MGTd5P7Be9aba0b46oZSoJTFVEhilsJI
	dxucnydy94JcepTkXlfn5fIwDw9nVkT2aTxhfNySoWZFabXLthu5ZZLqKsmblHS53Yyo=
X-Gm-Gg: AYBFou3li6LJro5Ew+6Fe/paAOjxTy3II6Bq3bHAZNznNHa/vqi/U5Miq/nO4KtSTYF
	LlJwqCy54oUqkABwCfbaV2uyXgdSQVd3j1Nn/KmGKEt7ifkttHM4ctEgM9f5GOo0i6cMBuKXDNJ
	1CcXeBOpbPhGK1/FqTMkq98uBDt8KPZarudg33u8gmVqoViFgIQFxxXrcNeOMulx5v7+wIL9iCk
	w89OPGbVsbAHa+tBK1u+A6CU0NUNpCAmrYQXdCqlcZ0QainnTgwyatD4uM1kIgRZKxXMy/TuBZx
	IZo0vDGIvymfVdgUAEgLANTT7gGQoHfxMv6qjDRmmUfd64zY/9KbyZoXB6zb5w4Rp3zsP/NeRSK
	S7F2RQhC4SipVHq3Zqib0nA==
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3283573e0c.3.1789993739763;
        Mon, 21 Sep 2026 05:28:59 -0700 (PDT)
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3283541e0c.3.1789993739322;
        Mon, 21 Sep 2026 05:28:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8cb41984asm1317676e87.81.2026.09.21.05.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:28:58 -0700 (PDT)
Message-ID: <ec3e108c-72cd-4451-a0c0-0be14592e504@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:28:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] rpmsg: qcom_smd: reject interrupted channel waits
To: Slavin Liu <bolin.liu@seu.edu.cn>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911060920.94363-1-bolin.liu@seu.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911060920.94363-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfX/XOcVcGXO72H
 6ZbHvQgQQvYRbSANRPAgGEp22yBsaGjVkgAK0hp8FMmzxhpx4p5E6ALleU++kaq459UtcgreMYH
 Kc1MNHJVlWxzrMnpNWdMOkYLSfr4ys8=
X-Proofpoint-GUID: Xlmmb_WSVI2k_TgtRjRygHwfPA-OR8FU
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1230c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=s7OMwfEDKQn-nhOmWicA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfX7GaMzwuGdgId
 9zyTKyApMM4YhgJXIJb2eMezk/bd4IeDBuq3gZcfepfDknB4vtXfRZuwqaaVNo+0OzOwjWFlDMp
 xNQmgDCbEIDPdBFoYfb4T6IwM1G33e6DnNEB9fT5vTNpObdvvHvpZOPo21X6mY9bdkrYrVS4kH2
 s1DVka+SVfbTp5+fncEn++gV0S/NYvZBPwYMPdl0Kb9o5PNpnbM1tEPAOCfLL+BWR//ChzLlm6u
 ZtSJd68eJQtxvli8etp/WD3JJitlZ3C4y0OKHP0TEhtVlyxXQdyank+KFYsSE9StUWaDjXtf1sN
 ZhZb9J4EPeqJjeT/uXEBYzZ06EUCBWLgjmWYQEd8aFcLlbIEc9icJ0XrErl1nMnVrnIpEbLEOWH
 CCS96kza8/w15Hex2yLbnn7KlY6jita9+cySsYSmtAJ1qDFfb0U5ww/ACSzQ7Jz6EfYXylQKhq5
 4yrl7o8BQrPUwnm94Nw==
X-Proofpoint-ORIG-GUID: Xlmmb_WSVI2k_TgtRjRygHwfPA-OR8FU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210180

On 9/11/26 8:09 AM, Slavin Liu wrote:
> qcom_smd_create_ept() waits for a channel using
> wait_event_interruptible_timeout(). If a signal interrupts the wait
> before the named channel appears, the wait returns -ERESTARTSYS and
> channel is still NULL. The current zero-only test treats the negative
> return as success and then dereferences channel->state.
> 
> Require a positive wait result before using the channel. Return NULL for
> interruption as for a timeout, following the endpoint creation API's
> existing failure convention. No endpoint or channel resources have been
> acquired at this point, and the successful wait path is unchanged.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
