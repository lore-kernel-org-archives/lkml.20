Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C516C3C09F5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994175; cv=none; b=G4DemJqlD9/hzd4HdL+LeyDzo4ekgPAOckSQa2LZmWD0TEG6w8cpOGvMfdDzbDnBuZYmWzzqM/bTDkWiXjpbtOTWTrAkTqR4iyyweGwzpUbEb+TZb1UmuEcvz/3fvr0T8e3MwB8PWQFg63o96AQg5krCw2OEetZVDMqhtMexrCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994175; c=relaxed/simple;
	bh=Q8tNA+Ne53BbQbai86auz3nmCKdXWW4PmWnHJ8YV9OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SD0X/LXIgdS7A5vfwpXulqjtuAsNXRe9uV8SFXWenXjXjy1s6is9ZEwpkG8MNp/Z1UtG63OMqGMmEaHSyBln8AOhz4GowD6Mt1iWHwcdxzenu7AO46w0UFdwpWvvBttey5bgs5F0mi4b+as7kzZuuvMkoISmpKuCWYtXD8S+YoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlU7nzRD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KO3pAnWu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlU7nzRD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KO3pAnWu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4iAs1129525
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBdHXbwhj7x/KyZpkT+o8a5XuFk7ieS359+BRQZhQcU=; b=AlU7nzRDBpSSuNix
	eb0wQsDhnrHeBvnGbnQoHxGgITZOsjx29VgEXZtQK4n9DhTCoHVCYVlLm4ljUmiB
	S6Vn2NMHZTfu4LWeu8f5Qw3o34ThbnEY1JRzndM1cqRtxj4kY0cg8C8bfwQO4qMB
	VnVeuOrc5HxMDmcrk1lVds5r4hML/B0fug/5+8nO8hUm50MKRBMKpY0tnNBcQHcR
	lLx3QhrWVXOqgtCsw8STV+Zd8A7TTGa5nSMOqWQc1rsLeKMd3mrktcWGIMRiRN3q
	/ZYbAstFIi9pY8KwBPl98ijK5c3DBbGC1G6VxC3Yb6qIfyzB9+Ae77SkBIRCTi6v
	ezt6CA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csgant-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:36:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso90474e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994167; x=1790598967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBdHXbwhj7x/KyZpkT+o8a5XuFk7ieS359+BRQZhQcU=;
        b=KO3pAnWuTqbZNUz53RWjz0LKQxvHvJbc5Jpgd8/BIsvHh/tq5IaeW37N8q98nP2MP5
         R+qswjEV3uUvxMtsq3ysehU8vx+hLrT5twoXKGB2FpdPe4BFUpkj3qlU3gI84P3PtpUw
         muQBRJ0dyTPGbSpZ7rTYxbP20zS/wzuSLT2hsna9z4LpvYljnrAZ1TmZZwzTWIu6cPAA
         ziFFn+jfJ/4gb2XXw16m76adkC6uaJgXQmIHc2wq0KNehCF5b1bBgVIcjtTuRzSA2xLc
         kSxHovt1vdluuWIjzBGt43VcbePzSSnNgDWSmuBtSQ6T9n1+LolX0QBE2VLVnuoAvfo7
         ovKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994167; x=1790598967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBdHXbwhj7x/KyZpkT+o8a5XuFk7ieS359+BRQZhQcU=;
        b=dhqOgL9nfpWTLZONoddOSLJrrCS5LcBAfcy7qFmrDtlQe5zauYCS1crNL9P271QcOM
         hGzsf9gRS2nTXBHvV9vEuR6tKHpEDK8vkdN4Ad16PJ9TEOCy1rczgb5oiq56+R0OEMaq
         y3/ZaXYZYgE0BxEZqYt2Z4VJGpcxLDhnNVJf9VRNdA4o0dwKMrKNPOJqPoaNchlP7tWn
         3AdJx11aBADqUdJW/G8PlLAFRVACp6Xrqnq4YePMbgNtNwHDpzSbGlzhC4Ff9Qd5CsXy
         QiIxqlTOSKLQdQSOKjftITsdfX2YmNAc1R3eqlZbqXiCuIX3WOS1IUpJjnd1OfS+SXIF
         Nj7g==
X-Forwarded-Encrypted: i=1; AKwUvBz/R4J6bNUZa+jzBE070Bb9n07TCsFNWfMUcHvmrI2Qz/nQzReqddUFHNSJT/nnwpYalY6BxmhWXOZu0F8=@vger.kernel.org
X-Gm-Message-State: AFuF++lXz6446Ql5t2sHrF0Ohc4zMVn/N0PaiE+K/4h17WTKl8BnjIPt
	S2FE/Ick93HfYbsyNHS3WLSn5/AAu0ZOq3/JgiZH9eWXSDCmlQEK3Sb34ZDRGqT5xoVErZLERxC
	6SNuUw9/QZF0DD1rc3cJ+7LbA/xd7SRLMnDe3zCivOQedU0Xv7V+whvpygdyFmAEHdok=
X-Gm-Gg: AYBFou3/+jZEa1r+/34D/2YqiAI7ODIj4BLNHSguIXkPZxWVUtSTe3LswZdg42tf9c7
	DBbySjYbZJ5RJsYgKek+AqWURO1O3J3ufGsS6g5I03knBd3qPXryJYprH7GRqJmjl76QBgJVkjz
	7HLhePXBxpncftv2rEbeLK+aHCh9zzpiFYahB6p1lS9Q99oN9182ImrNb1pZf/nOOLIJmrgaAPl
	enADRTPujfHiNxdiyu50L0hfpiKCoBy3MCfDritX21uXMfDaiAa1fQ0fKTNmez9WBH/pQ5OAKZv
	M8WB4La6RtLTB9MOxvwuDOx3tq6TVgzyk4m6+B8hWd8GONyuAsI/wtj4gMEIVnFlbXrcQQhcwLA
	cHbm3mdSsBRJ1IjFIL0vrog==
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3310893e0c.3.1789994166570;
        Mon, 21 Sep 2026 05:36:06 -0700 (PDT)
X-Received: by 2002:ac5:cdb2:0:b0:5c6:2128:7cf8 with SMTP id 71dfb90a1353d-5c9b8b8280amr3310850e0c.3.1789994166135;
        Mon, 21 Sep 2026 05:36:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c7943e8csm1941019e87.30.2026.09.21.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:36:05 -0700 (PDT)
Message-ID: <6495b9d1-fbf1-4ab2-bbb7-2ea20e82a1e2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
 <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfX1mXWQsIbf84u
 XE6pz/qVxLtG7SO42m34aJ1+YMACYAY7qYOrTCOIkwax7j/MCGeZyVo57yFZXYvf1Js31eqyQZH
 zsh1N+PwZlHYZlCr7bkEoJIwPncKlj0=
X-Proofpoint-GUID: sdDAzgkLtL7qBtmVjoA_C5KzqccPIbKv
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab124b7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XKJJLf0VuBcF_oTi_k8A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MiBTYWx0ZWRfX4D7/jH7MCbmI
 mcvAj7vGtGZIXjfNXMPBVj62225krYo2x1Bsqa6jRwAzcbLXUVGG0x7ZwS0gjSk6CXHCzP/KdGy
 Z3wVqUTcGB/607ANcdXCz9hGsFnUHAqdmTH+V7pMqVSUVC/Z502seQV5eiF8GLciUE3hS9ZObu7
 gImGgQfo0m1PYWJs9d2NPy0Jm5+VwXo6oxzJQ/2J54OSxmc43aapqfzKG/EZkvCF1c69EDcOOQ1
 bcgRb7bqptgwo1CjaDU1nDXZ2aiqlrcFYpVIu8oDOna8XKj0/APyCtFz+Qq4R5cE7hmwh7EexPC
 j3q+PNQsiDsNNtZnEVLUAuAazlemaLMpbXPg746Y8fETd8t0WPPSiSZKrW+5lXfomWWO6rRBVuY
 Ffb/alIYlZq7n9ccUnDt/EYvDBL8k+BHFGCOwHIfC4tgZuk3BxTyNiTF284JqvEg2N+SrZqcB86
 ichF3LnzPCS9WeDwSgw==
X-Proofpoint-ORIG-GUID: sdDAzgkLtL7qBtmVjoA_C5KzqccPIbKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210182

On 8/31/26 5:01 AM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> +	of_property_read_string(controller_node, "dr_mode", &dr_mode);
> +
> +	/* No role switch needed for fixed role controllers */
> +	if (!strcmp(dr_mode, "host")) {
> +		path->curr_role = USB_ROLE_HOST;
> +		of_node_put(controller_node);
> +		return 0;
> +	}
> +
> +	if (!strcmp(dr_mode, "peripheral")) {
> +		path->curr_role = USB_ROLE_DEVICE;
> +		of_node_put(controller_node);
> +		return 0;
> +	}

I was thinking.. wouldn't that also get rid of the virtual detach
functionality on fixed-role controllers?

dwc3 currently only registers a role_switch if it's in OTG mode,
but other drivers (such as dwc2) do it unconditionally - see

https://lore.kernel.org/linux-usb/8fabc049-7fdf-498a-a3ef-6f2570d510c8@oss.qualcomm.com/T/#u

if that's the reason, we can change the dwc3 driver to match
since the maintainer there expressed he wouldn't mind

Konrad
