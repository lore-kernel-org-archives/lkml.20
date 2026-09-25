Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F5A1C862D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331581; cv=none; b=BDXnUImnjU3Lv1qCzksWdUqDxl8670ggnGVAJFMmXxsBYQYVYIpR8jINdGaIsp+jR18r+GRZWucejhqe0kuN4T2k3kBWThnOJGRbHzRLUAg9KkAJSgvlYsoDnXxdrY5ijRB+UGac6rTpl3oD3r62jQ1CpesMYEEfLFxPSbep5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331581; c=relaxed/simple;
	bh=kuiriOcwrhUBkH+cFmNQEkfBDUUYBrctQFAqrwLNkHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tXcodSVh0ZZ6EErtnf5TmSsH2rJc8eI8ZmmFGmV+IpFB1vsUvbKx2kUTnxk3Ai0HL2XJ8Agy6zbGeiJ4GKgXs71X8WMFUYoWW8xjYYBfuxxvMH7j9yqIY8ybvAodeyrycNoV6iqjZDNjaRMLQ9d5kRGGHWIFj0HywegU1dIGbMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjm9Cc0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMP+L0xW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjm9Cc0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMP+L0xW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YpQf208828
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJosBlRsssotpYc76/kVdKbiIQG2FpE3LuJTADYjC68=; b=hjm9Cc0kwqVAAJaN
	byxMTIXx8CjId+Th/N6Jj8le7ClwnLsiFbz4PvDp5UJbOz6toe+q40WkShgffNwA
	GEPgdVK2lisIxS+alfZm3xb57By8QmZpxIild5HuWVc9pEVxncz2e4ZFkIFbXpBs
	gzDjZClF7t0IKXHTaHZxizpVW+IhgPzGUw/8UHNxt5q6aB5W9tP+dnTQyoO1O5V5
	2pnhR2NH9FHnHi5z4C/E6XFmFwOEiDbMG3YuIRWk6WJ+TqYYPOVoDhAmWmYerzpm
	K0GcMFGuKDbUIWKGla75UTYOV1IbPXpaCsS/0TXYkrELP0exuc8sZsjVFCSiavYH
	EoYcJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898u2nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:19:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939fc317691so20319485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331577; x=1790936377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJosBlRsssotpYc76/kVdKbiIQG2FpE3LuJTADYjC68=;
        b=GMP+L0xW1+U3dWs/2A+u+9GeO3Oa9YRR5YqjGaO17naTbyXuJUeagqoYhdXNlII2yr
         Pv4TwykFrvwYJIixPyghWWx3R33Q34Omo03zkyD3swtLOwPlU033TdHo7QBc/yapv840
         utlObM6+2VlU7pPTuvB1kM7QgCPAM2GFE6IvHVEQtA9kzdkX+myTVe/I0SdCmNZRG6YL
         dNOpUiNxUiBPgEXSy3g5mS5X8Rvt51pdxVgYKHY6nr7ckaFZg/rtIgfqEIZBxuJIMrqW
         +fy8p9rtY2VsAyt0oFQ3fIXQtQDBK3JjpyjUUOb5f/F7C9qSJ3+cchRdezKZqGW0xu3x
         E8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331577; x=1790936377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJosBlRsssotpYc76/kVdKbiIQG2FpE3LuJTADYjC68=;
        b=kzGHM3JEWie1rsVR28WLLTNm0a3euDHI1Gpf88HBXVUg/W5kbiB3Zkbp7uNn2/xka5
         wMmt1DxrM37YHpVBT1M0uXWRo9Ukp6IrtSzc2rmCVQ5Tf6XMqqs+/IMDDulq2QRAInvQ
         6sc5jcmN5BqpWgALVgTJoGTYijaWcaLstLk5gpqrxhhyeA5pcUkuMTl40GJrqpXiLYyz
         dx3zKCYF+EVlq+hekH0nVBb+c/OflEKTP28h0PdGrpLhkXrK7wod68X7/e2ubqTMxMMD
         O1yTztV9kpotBp6Q5np3DlDpObKfCH5QxdT5F6s2wvE7D4EcHd5FKLPvDWwAgE+sZ+LM
         20Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxboq+IcVJ/ImbRVz/CSX/Rti2WwweceiKP+2NOYBIAJOxAs9PPO7gVnyT+9ruyVx43zPHSqgIQ4WAkWBk=@vger.kernel.org
X-Gm-Message-State: AFuF++kUtXS0oeQFea+v3yq0mJDPXtfteUayxxhG/KzzH1rdIFoSbGLX
	PQrEZjGWrLr4QiYcby9zvtaltJq6WBvBcu7ketaPf28qK1WYDWpWRgpLiDXYp4L0aD/VqeIrVLf
	U5dYGAV2hBfXiI+e9/kr+JOfTGRx3QTW4pL4X+ni74SKrROXzREqoo78GLxOXLCRZTHg=
X-Gm-Gg: AYBFou3CexZ26+ypOVcE9YgszCbrBkYEb0x5tz45JaX7trdYa41MDtIeWcZWhVTAnrD
	ipilRSojjg/jo0oBUZxDEOk/sLltOC3yWAfUSG0PZIT/0kuT5Kh4/ry6LFl0bGh/XfgYnfAnjj3
	A07L1cG5wfHF0/3BJEvTPdz4B0vrDPCpFv9ZRem3i4GmSd1OpkKkw+Pyh5pCbym2OAu9BZKKMwi
	D/oEaxSBMKAoxdxzJ+F66gX6bxLwQ/pn47QjaLCnB3BF7RzfxBzI6H4tg59pbtkr+Y/eO+GJ8IG
	auEXbfAovduvvEuRvsu2RqTpBbQIMbbVBVFB/PqSdvT23lo9A+nTpiRseQoav0RoRqs4QodLKHQ
	m6xhbV02yllzShEuRvk3AUg==
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr340523385a.3.1790331576893;
        Fri, 25 Sep 2026 03:19:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr340520085a.3.1790331576328;
        Fri, 25 Sep 2026 03:19:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:35 -0700 (PDT)
Message-ID: <d7db3b98-a44a-4e63-8ca7-c9fbfac70f28@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: hawi: Enable SoCCP by default
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
 <20260925101309.3826038-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925101309.3826038-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX5rkT1daQ5py7
 AfXfbRf8t1PBWNDrTKeZ+2LJXpNb+9TwFkCpw6tne/begrHWaKOkYVr193HfeZ4FuZYZ+NAU2dD
 O6SykX4/h6EpkPZ5FZTJ9HuJf2eLmjw+dz9nCq2veNkIbarPArk0d7ThYyk4f2UZiVnZ3x/8MLE
 +lkBpv7sVqJ9qjFMDqQmvmbKSL+NOaGtq/gUZDv5e+5h62G45kRFalCBoIpakKToH7iDlDARjKY
 ydNULvK07T7NZywxKm95h3tnXNtf2gLu9uBskjf5b69WQpFtEDu+7oOfpAeQHZt/iIJbcxrb5DN
 sACBvt1uhHMZQpQM4H+mZqwC4NCSpYXVirw8D1T7K78FfNfDfYqX1gplz8V951Ie1AP1uAB/vXI
 GeVZJKby7BFa0aEAxRfANKdfSytR6Kb9CI5TUqbB6znecr0Jy99McH46EhJk866ekqZd9lQzvtg
 QAQXS4QvKqvkVoDJo4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX969GcRScsIYO
 V5Ia+rDlTTWv/F1kOqKXgb715iYNlbVkimGxw1Vr6xgEJbeVC8tnhJbIsah7Esf9Fcp2WYryYrv
 U8Ph6YF/W0M0dxYHGbBLXO9KPm+pdK4=
X-Proofpoint-GUID: lD3vTYqhYlDQpGn0WQHX--X0zm9OHIPg
X-Proofpoint-ORIG-GUID: lD3vTYqhYlDQpGn0WQHX--X0zm9OHIPg
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab64ab9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Efl7ekKAViBeap_CtEcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250041

On 9/25/26 12:13 PM, Mukesh Ojha wrote:
> SoCCP remoteproc is marked disabled in the hawi dtsi and enabled in
> hawi-mtp.dts, but that is not the right approach, as it should be enabled
> by default. For Hawi, like a few other targets such as Kaanapali and
> Glymur, SoCCP boots up in early stages of the boot chain before the OS
> takes over. So, it is default on.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
