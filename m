Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1B649A3A1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380064; cv=none; b=d+1D8fEu2r5/5iutVHabRl9qt3VP7rtmPej3RpgvV1XhD+lDBkknKwZEc+BRYc0+fPc7DvB3R4sfDGJb6E3LZ57n2zLHoDPQY+0zqcGrRCaxUzag+tXkxiezzbzA99mI8l+RTz57aHTTMNoV+LeSsfTCk+fkO9Yf9C1UxqF/MIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380064; c=relaxed/simple;
	bh=J+Ry4cwzeCUVHqt0PFF643jrxb991egaVN/95KRrhGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgr1U4HVSud6E0MAtiSvJRAY5GItjI8EJSidmP5sfumnOnzmVhHqViRWbijXt6XZjq+kFNs93ckTCymo3jf9gYNjGCNkCZYMtwnSLibmfbrrjQXLG6OKbgl5T2FY/J2EBhcXcMwSc0G1pjDsEeSr0h4sMWlOTueKJlOUi/hxmqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRIIwtD6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfYB6Ui0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRIIwtD6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfYB6Ui0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697DJg134057325
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 13:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lF50zyxySUMbpLVqNm3u6N8Uxl/mwFSB/O+gwZMjDSI=; b=VRIIwtD6+oDhGMUf
	sNIZltXXA1EXTqKxH8xFZvfvxYKGZ2aWM9C/Z6/6JDWyjTw8aQYARM5cFrCm58lB
	xVAweVG1Dvwu8bQ40WenwtoLru9chgdhOL5jU5XuKp6mIUXhe1BP21Uu/IA4Z74g
	bLTsJPQ0EU9JN3UtHF6CX33GoCZSNR34LaEPdU6MmXKo5+XYABLLYOCeP4aHlKuR
	UYFGj0LL5PmwezFwy198Lc+Ybei4asqtX9Z3460ebjlkgqRnxoSUC35KfkChS9mD
	va7NjMteIBMgnRP+EhX5WHoqYfm+ByAac41wjyQCh1FHrk9tQms3O8AI8A7/XVS2
	yLiPFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5pv701qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:34:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso868085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791380051; x=1791984851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lF50zyxySUMbpLVqNm3u6N8Uxl/mwFSB/O+gwZMjDSI=;
        b=dfYB6Ui0VlWqaqSQqYtb103zA+K3YPFEUHwN7XAVeA70q+P6iD5xezu3Y+hsb0U4tE
         3KbSPI365Ka11jnGWzE+SNr1vEVPvYa4K+47CA+X/uFreRthUgabru+ei6S4kAZvIipS
         tG42+NWSC84Vm93kcmAqtgTm+hkfVR9KUlBgvV0ujXFRNuEngmiMk/wW+Jt0SJzSsS83
         89eznDPUEbD38UVkS3hbEyLO8d6MroiR79j49l49EGZcPphdNjrgRLHh04LepTgD9oXj
         XjUtNMdJFsh0ihpJFpkcIb3omb6kfkw2nWiOfMjEQ/d2dDK6KBFWkNonDkhvuHZDvMvq
         r2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380051; x=1791984851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lF50zyxySUMbpLVqNm3u6N8Uxl/mwFSB/O+gwZMjDSI=;
        b=OjBzFhCkX7FWc6mXrBAXgwfh7uxjT5zTXqj3uSnaSZOGv/wZc4jAhccwX/SCgj8Q6W
         CdbUrGvvv0gLz8lvkZliiegIStt/4abzfXqfM3XCxbGQD4If/POy4fgJIrhlBnKgoNzu
         YjbUQkfEaLBFiK6m5mAD6wHtjl6NN4pE2DFB+5kA9Iv5QJvphryGEGKf2iRTUkpcJPHA
         x/1xLIkHvTeT70BACe/ed+tgVw2m2r1ffpYFWhaJgesBBnJ9ei1Fa0mLmAGQrbQBgfRK
         m3LDbsvd7ZwQtq0Gb5Hq17SQgtchIOk03mwrwtzKP8fV7bxm50PN7LGE4P81LLoBKilM
         wVrA==
X-Forwarded-Encrypted: i=1; AKwUvBwAiuf5VuNmy3v+FtLV3LhppmO+CSFohZHMPfniZ9q8A6AtU4grFPtY/EFxpGrNjiQwDXgBr4pmD+zzgVY=@vger.kernel.org
X-Gm-Message-State: AFuF++kYEoB2SKOc/RJiURjKNna4tJrJ2vF+jCXlEEKORHalDwOkUeIg
	+sx9mjKeEqFOgZEr3TirmSTR0QfiHdg0wFY8eGe+xc6rBODw1915CZVsvK4KhsCtCDgefbB8F0E
	ULCq19Q7sDQqVHl/sLhaxh9wUMjJPkg+7o8RYCH8Xlsq4RP0MZZU/leo+cxBhJliOP+w=
X-Gm-Gg: AYBFou0a86K8PhUNwMG+FsbhgeZG8z4y7h1Of5e3L/0jo4qootVBgz6Om7VYvuIO8y8
	mxnC2prMV6MojtIUogrQSXObt5dACeLh2qIFPKtXQvi5DS2z4T2wH5GvAFcQfNjKeZ+LfOYlkFF
	JlU89vJCCY7ktEKMUhpzC9PXag5GK/f33+o5JaAoMdqcZ+eSrnsXvEG41zShVht86bS59v1ggvS
	AnJDn7+7Kvj9PKlBhd7aiOPuxljP99KYgWXGXRoyw01wJL157EI0ZqF7mnjfV/62A5G+c78b2fU
	rNGyTgKjEdPXLVUNN+JywNSJSZhwnw+J/b4Hx64SmjGfnyiTnP2VVuwiiHwfYcLREH4ap3/7T6a
	SnTs+hVu7IcI9+mn2lm19He7dnBHv9ApNVraS9Am5fBAi
X-Received: by 2002:a05:620a:4808:b0:939:fe55:402a with SMTP id af79cd13be357-93e860dc342mr1130814485a.31.1791380050647;
        Wed, 07 Oct 2026 06:34:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:939:fe55:402a with SMTP id af79cd13be357-93e860dc342mr1130806585a.31.1791380049939;
        Wed, 07 Oct 2026 06:34:09 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f486b6fsm52614375e9.1.2026.10.07.06.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 06:34:08 -0700 (PDT)
Message-ID: <6e73ffc6-41ee-4ea0-a9e3-3286d6c72cb8@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:34:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] tools/thermal/tmon: Fix string truncation warning in
 optarg copy
To: Florian Fainelli <florian.fainelli@broadcom.com>,
        linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jacob Pan
 <jacob.jun.pan@linux.intel.com>,
        "open list:THERMAL"
 <linux-pm@vger.kernel.org>
References: <20260929201951.408456-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260929201951.408456-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MiBTYWx0ZWRfX5+LSlNWGOgiF
 MadhxXh9pW5i6dJfAFisb58wDqGFjEF7uh8LhHfhM2+1tHohAE/+txsHKV4uLVMva2+KRmb5VRm
 puspCAQKAP3I1bA5VQ77qx6IkcGvICY=
X-Authority-Analysis: v=2.4 cv=J4I/fwnS c=1 sm=1 tr=0 ts=6ac64a53 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Q-fNiiVtAAAA:8 a=s7NgktmowLUAvCqQ5TwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: E0g4iiPuzQpEmLGhy0Cs8JtvVJdj7V_R
X-Proofpoint-GUID: E0g4iiPuzQpEmLGhy0Cs8JtvVJdj7V_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MiBTYWx0ZWRfX/rAzSJYyJhdn
 XMCBbkb9YTrgzricXuycVtRyMy3JLeZGJwkaSXAasOSIWrewTN2CpLCtlaH89pGKyk3wZxpi6hG
 EQwUdj4JhhCNbG3WOjCOkLLbDB/9DnLZ3y9haVC4s+mNA9cS8A+0WPJh1OQkOxg8MLJXqKGUcU2
 KCKcPaxN+p2FEvXAiBwGDqZP0VYYfgY1h3mUC25YnqEGZt1qQOBq9BAEuLcYGYm3hngyJCbA0bW
 fbIGk+oa2rxql4x52fZgcCFwX+9E4dCNUDZwMeDOqeAo8FhB+IpEKT9eN63kI4L7UdbQ6d4Ljhz
 y37VAZGxfOVqbuDkCOyTGNsbljAKCdCl4lPkZQ0wT7+zpxv3e0dh6aSbaAk/gTsvCNn+bTJfWwV
 7PmMUaVuoIOhD0zhJB4y6+3Eg8T3CJdcBLyl5AQqtrbNj/1+D3vbKvy4zENvkkKIYD+JkIJumgF
 bnzwVaBarD6m+s9kuyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070052

On 9/29/26 22:19, Florian Fainelli wrote:
> GCC warns about possible string truncation with -Wstringop-truncation:
> 
>    tmon.c: In function ‘main’:
>    tmon.c:233:25: warning: ‘__builtin_strncpy’ specified bound 20 equals
> destination size [-Wstringop-truncation]
>      233 |                         strncpy(ctrl_cdev, optarg,
> 	CDEV_NAME_SIZE);
>          |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Replace strncpy() with snprintf() to guarantee NUL-termination and
> silence the compiler warning.
> 
> Fixes: 94f69966faf8 ("tools/thermal: Introduce tmon, a tool for thermal subsystem")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
Applied, thanks
