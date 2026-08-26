Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103C741A914
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747221; cv=none; b=LpbWgtLb6TmNvopMe9ZIgpL9BW3u6HlNBQOeuYRiEpJRX3MtP71FDo0cdLXS8MeCtIH9geSiGzG3ZY8cSm3GFumD08/AIEH1OrIADvkY5fVq2N6VXyVTpawmRCNi+wCsISjnXu0KW84/cFf97DN3n5V375f/DG2nUElXr9nAWZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747221; c=relaxed/simple;
	bh=1MDFVuoGl059CUc4qf0HqBrjyjkGeqwS/LSg6shLZck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoArjy9hv/mIPE9++w+HEuUITN+O8UD3zhG7dW4eSjRBt7kbZ6G7l3dgAS91T11nWGWxwiGuVq5HYDxkPNJLpdDH6jHVdRAeN6BVMAH63mtmGRCkJGO5b/iSD6Teck/TLCz5bOwSZCA580SyCgbtW6+QHhTrNpJVrYgtj6vwvjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHS1elnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRAvSWgI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHS1elnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRAvSWgI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBk5E3983102
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WpuSsF+qjR5vcWTagIzpVvuR
	00Uh4AEpqmV8mJyWczU=; b=lHS1elnKzDMwjd6bSyagZYAkqP2OxMDG3Vlk/39n
	BVt7zzS3ohLHja6q3nPZUkzN33SmxMFlmAhQq+zGDMyuLCOf03xJ9tu+XZbrRcRs
	keuDW7+LTaFZ8ZXplRitKsn9/cBO7iXGfHs53Dbm2VZ1y2TqyY2CQOHRwKDe99w7
	4SyPkcSMv8Fm+11k1acz77O5RzyKv6e42VQ28w2/V0reU+IDqtw/SDP6X8Ps7G2x
	v9QTMKqeKcGwibk/0uLvqrJVO/oRk/b4tYTth2Rm8EZP1YxxoeWbuPVFozq+AfLo
	yehNUjrr8uOD2dcdsc5r556cTFtoyPyiBUu+blOuQDkQng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqrnj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:26:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so338246a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787747218; x=1788352018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WpuSsF+qjR5vcWTagIzpVvuR00Uh4AEpqmV8mJyWczU=;
        b=TRAvSWgItp8nAYJhMUM/QhSWI4Luxyq8ol0RLlmrKwG8XwWIlBEtTegMkgZpKlSmx1
         gby1m/LqQdvMIDyERmm8BsIbE9909hO9DE66TAdOmCz0uzElpf/RCr9BHrLhBhm646ZO
         HEeJrGVnLdIOJOzzYQ1quVpqun6HRlJamg1O1xvWGlOhi4+yLI+2daWlI9VGEdmhY2ra
         RefHgu8HBvt+zQNBIud4pxoYaSNEP+S/phS2Ez57zChHAjkoBOiyx9uTEwlb7aZwGCVk
         uj+MXamVnVyRaaIlvS4P5UV9CRr5oCmq17Njc5BmkJWIz4tvb1J3cFI+u1vI3orWhZJQ
         bhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747218; x=1788352018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpuSsF+qjR5vcWTagIzpVvuR00Uh4AEpqmV8mJyWczU=;
        b=UKyG5VabwqW8HZR8wYSasXOoJoOKfCyh4kLMQzTzfYVTbxJ/n7d8JHXzu8dOHreyMa
         qsKt3fpRJVwxrc0eDHB72SxzLXoeASFu98keqx+kcXv/c4xpQk9oktJNKf39osYqM7Fh
         tXgEFqc1Dnn1DMNz37HgzsvhSqrD/9UWE7wLQ63IBIwIx60NfK9MtQwtVJFuDnwj180D
         0JawuNONz/UHpDNasZvYelqAiyQ6Q8uvMks9G15uvjUhoYWPWmFXFidZM2yplBt8elQZ
         Ku94MeT3YJ7nZqHboY5ymgiCB+NStg8Tbfs6gCppvJ5HWDU20GHQHuc/S4qVO99SWKg+
         TR5g==
X-Gm-Message-State: AFuF++lPUQ4GIR5m7Rt2BVnihXBAObb72O+aY/M2nS01OvSnEhqXz+Rw
	1lRqgjznxJRMVVXsM2NTVKVlRS1qBgPbMDSr2XtaAgjV2W3dCyUa9EtlWGca7K8sqtG0Q5DuLPl
	5DLpxK2PaqiuAzvpsNFuIF+5AjZOoYX66TjpzYghaNa7pLE0my8KNogtuVy7KG24DZVE=
X-Gm-Gg: AR+sD13U8PEQqfghn+r9DLDmp+KqG+o30WGMfSAvDy3STH1w2x7wdd+smUaj/aXJuj0
	mUNgqdFsG93DM4QGakFTIyBZb7D3picf56BQ3NKiVXLCY4H3vfc4qTsADsUIEQuDZzcWSi936b7
	YCqn34A7jo3EJtuPpvX4hHIUF0g9BJbHxpXka7S9qHUiG2tiILHXK14xrF9v8KQflI6WjaRFHAa
	1VkUJAJciMztnSYOCIQcIRdXBIUR55Atrq8+N28UC40ZR7mam0myrH2hqjF6SZfnBqujmlz3Gww
	lC85W0wqg5c9L248rKnq5jQTOAnaPB8c8Z3qBQOqy6ji5qhyzAXHaioUPQkzVsgMGttaG+qIo+n
	m2euplKV5Ie58rIVUpSPzxz/C0Q==
X-Received: by 2002:a17:90b:48c5:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3966d13efc0mr14238746a91.2.1787747218517;
        Wed, 26 Aug 2026 05:26:58 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3966d13efc0mr14238598a91.2.1787747218036;
        Wed, 26 Aug 2026 05:26:58 -0700 (PDT)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm7947807a91.0.2026.08.26.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:26:57 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:56:53 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH] arm64: defconfig: Enable ADC5 Gen3 driver
Message-ID: <ao7bjeytR+du7EuV@hu-raryan-hyd.qualcomm.com>
References: <20260807-arm64-defconfig-adc5-gen3-v1-1-507521835ec2@oss.qualcomm.com>
 <4ad905fa-ed09-4b0e-b647-5f4656181beb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad905fa-ed09-4b0e-b647-5f4656181beb@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwNCBTYWx0ZWRfX4wSa20puoiO9
 zVNwM3v7dgLw/Qzxo+idSmPR/5ybFW+pRpnXiDJ/t8Xl1u52X4w2HUh/heKhs8v0IW9v37WP250
 8W6yHO6DKoqYpbRomYSb3nhUwl14moc=
X-Proofpoint-ORIG-GUID: iDkACzECOWwRMoaBQ0UlB4RmVd-yfU8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwNCBTYWx0ZWRfX4bBsXnds0vV7
 EiL3onpWXXarZmwzcvXI6JkYLtqWqf+OvRHp82/cfZBlQx/ySo8xjlkFka3tOXuJH8TI/ABGo6j
 4oes6+j9BvBIeKJ2d0FIhkMRrC/6nTGojwZs9AyGBLA1xF4mEEro7twtamw9g8vHJoFwpXqJCRv
 UWBUqnYu2KLcn6faIIMKORg5vZgN6g11LaeNCrMMYDfNf3nKA0hGv8UOViOFyUnSCqOjrNsF9mD
 bir7fMwI8OjehkfARgLUw3UO6VU9+UmfbqX0YKddvtE5EgW0Q0irFveMYeOhrHAFjPBmb0ow+U8
 9HNR0n8DeBUuX7nTITGbbAbZhZrHO1roZ5Uk2cjvVuQBqyUPkbfFw1uoDeSf6Dj6uu/prI4logE
 5PWm9+IjwMWDC2rZ/9ik+uN/r0eRvyKQFRAPDnoY37/9wDsQSDta1ee/oEbsr3++1MHs+jJ0xHl
 +t8f7b0jTWrflM6ux2g==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8edb93 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=5OfYf1Wwl8OWDfP5KIQA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: iDkACzECOWwRMoaBQ0UlB4RmVd-yfU8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260104

On Mon, Aug 10, 2026 at 12:52:12PM +0200, Krzysztof Kozlowski wrote:
> On 07/08/2026 13:58, Raj Aryan wrote:
> > The Qualcomm SOCs device tree i.e. lemans, monaco, describe ADC5 Gen3
> 
> SoCs
>
Ack. Will fix it.

> > channels for the PMM8654au PMICs and connects the PMIC temperature
> > alarm nodes to their DIE_TEMP ADC channels. However, the ADC5 Gen3
> > driver is not enabled in arm64 defconfig.
> > 
> > Without the driver, the ADC providers do not register and the PMIC
> > temperature alarm devices cannot obtain their ADC channels. As a
> > result, the corresponding thermal zones are not registered.
> > 
> > Enable CONFIG_QCOM_SPMI_ADC5_GEN3 as a module to support the ADC nodes
> > and ADC-backed PMIC thermal monitoring on the Lemans platform.
> 
> What is Lemans platform? Look at other commits - you describe here boards.
>
ACK. I will mention all the boards in the updated commit.

> Best regards,
> Krzysztof

Thank you & Regards
Raj Aryan
