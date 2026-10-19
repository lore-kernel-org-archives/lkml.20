Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC5848C8DC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416225; cv=none; b=HJ/oquc13nAhO1vtpep5ULcdM+uNs+ozwxNJXE+92lU/OdNgRyc0fbYJbPPR3/Hq9KZBx2KclN4SgXiNmzzcyenx9IGCZXyUc3s9x4IwAzNFTtRFEbN1QetDFGXyNkdIg7KDrSNVxIKZ8WYyynrrl3Z15RITMiF1d2nxGaTJrv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416225; c=relaxed/simple;
	bh=q9+lXsDfVro2dRtb/qn4cukihNKvxfORcaUyBp778Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K4y8Gd0Drb1XSwQFFDqtSYjjszOrWSzwepDN22u2Jbc+hDv8g8M/gScHhnJSO8ILDMH1xYL6lzmChQasfuwtkN6uwUQcbqWiJEc/CODD4mRhKiS1Pj3uNPMsSbptkza6S+9pP/x+iPmAHH+b7yUx7BcfPoVlI+QKMB2GmJwJkdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWUMyhg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gG/M7uoU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWUMyhg9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gG/M7uoU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P2PT3306589
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hblxjZ9KBP0XKSNbf5MNxLLDFs4xig3vgWNCXG8XHg=; b=cWUMyhg91cLKb5Fo
	STmTeq3iSmi5B1Wlt4PFdpEKCKXgAT8Sddinsz1Wtes3oYW994NV6Qr46w3bNnzi
	/BMVTNfNDJEMkHUNHVFH/TD0FlNV7tnDJpBhvl1WjvIkK03ZI5o9v4poNPfq1hnH
	FKpfhIMua3oBt/69e2rELIp6DNSFBBloizOqiBZvAu0Nyl0SLf1Rm1pSioKpr5SK
	CQgIuyRU62cJMnoMQlUw7U6VGha64wiKRVAMA+FUuszOZyfeEkgSZCcE1+dH/wfl
	iWG/5/QXSqWfsf1nLav42dk8gx99TpiQX7cuy4a+/0X2Zh7WbuIVEwEKFZuGJm/g
	4xaexA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47h9p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:23:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso19366085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792416222; x=1793021022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hblxjZ9KBP0XKSNbf5MNxLLDFs4xig3vgWNCXG8XHg=;
        b=gG/M7uoUhRyX5O4JdWVpmtDZ32VbUFvuFpY/n88ZbvpCcuh3grmFJe9nB1dfHGxjde
         0pBNIzzUNmnWxcS7ODo6spf0sWXZg2cFezxSu9QVzwbx+hkabeIBppSRXWlEfsqoLrzg
         t9nqEpCSpCC7Vf6CXcgGkWjhcwaVUTvbDMcX1pAG//gnY4AMcjUKdxdAoyMQeUi0D5mr
         0hYYMqnd2vDPzsbXtlhXYziysUfEl0qnXi19wCWhG71JowIB1vtmpWRgtoAgX9hKTso2
         9urEWs4AiJ33LPzJWoXwM1GeLXUBq2CIIw+okm/a3D8GyOIpxvSEfSx66QJeQXvtlb+1
         7kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416222; x=1793021022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hblxjZ9KBP0XKSNbf5MNxLLDFs4xig3vgWNCXG8XHg=;
        b=A3G5vglOxvi7fMnj8yfBNy5JN9mWOuWpePzVUP0xfvnofgs10TN9Ae9oD8E6KXf81r
         uTA/Xz66ib4/QBbIlDmDeDK/MaqkXpyemcSk7FpR1dbU98L1FUUwlpAA6PkLYiwnKcT4
         HPrdXTBW3ZlH+rBYHmDQFiYWCQsXWvfr5HAm23p3kX3Qw5mB1vxjHM/xxYdbmIFiKKFc
         ghamg5oOJV89bdN/yy5js2ePM6R4/Oz7Smzj+CbgmnX2CSGKcSZEXTCE2pFx2rOwtRwu
         FMvcAu1ATq2qEjEUJy3wvsnwwz1JOuwXMDTMaBQX8Zs5pAqKOC9Y7ULkXlQxeHkRbwXx
         ZYbQ==
X-Forwarded-Encrypted: i=1; AKwUvByfwEBSQTTtkRDkYZTzwOKcxYPHP31ND4EUE/P4i+ed6BcSz69Jcgteu95I5v+JZMr0wYZVKCjVbGbfblM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKZ8SwTyPjCdCevW7kVNcKjVgecA7G2J0JnJP7QzvD29AOZv15
	LheGN50d75SkniAZ9DpaYcXzspOJFhfTsR0EUTYO2cOMox5m170nEwkUBPfBQutVJoyJN0B4jhl
	Ug6Q/mynqmp7XTSrRq5YitDGRcjq7EPVFGPC9B+crxmLNRjG/ICXzSCbrWIYblRkzwho=
X-Gm-Gg: AYBFou1SXz1lMZo77p02YWsI7cmjU+nRxCpVNqbC9aCLXxFYkTzK/FShYl8q5iTTjae
	4gU6GxrRz9P8HkmJqdZk00EzeZERwleXLV4kEkEYIfkeL7yrai6gfjS+EGwVPnNOcq6CWbhSnbV
	3zE4TVYz1gTGH8PMacWR1I/jGSW7OFuZr64g2GhUVhzUfRY9I07w+qRTuLA6xdb4H2voZYEpjNF
	z5JCL8Vm0riAb3GsrYj8r3+AYnztTGjltVIQzdaMCeC7js267ECAOL2Y2GpPbJY5hCIEaTsWS9n
	DN/k5OFfN4YNNafAqD2fSoisG9M/UXQkW3u8LgYl4GhVyQ/nERGe0US9boHgPna42VqFoxNLvGI
	B2pQpV1j0n+zzuYfBUprwfQ==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr1507860585a.3.1792416221973;
        Mon, 19 Oct 2026 06:23:41 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr1507838685a.3.1792416220282;
        Mon, 19 Oct 2026 06:23:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceeafsm370255866b.17.2026.10.19.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:23:39 -0700 (PDT)
Message-ID: <1cd852f1-ce14-4559-8215-2c3ca7bfda1e@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:23:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/adreno: Add Adreno 620
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
 <20261016-adreno-a620-v1-4-4a7ed6210d7d@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-adreno-a620-v1-4-4a7ed6210d7d@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gp49NVkOvjW5P4UXcDe5-7A2xgCX7t5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfX3WJyQW3AryHb
 kjjELsgj2xMxGA+HrH0LJuOJoRkafwyY/7L0BlpM6qmXhaLdOk9jXcWT5cIN1a5khrcr/8uTf7I
 TxEyfL0bziKPTWKYU2U9FQbH48Va5xybvRADldWVZmt5JtYDtlh48vJ6lSufImADTMZFGfUnTsj
 xR7EyK9iG+yXSHqR+KhUDopaNedBR98JzbT+Fogve7SxTP5x3scKutiPdxlY3tQOX1mCwbtqqO8
 NH21E9eVr68zEr2h9DecziO3VLLAEBj++hAmys34gJdrucSOsnrqCIXdpRaGBf7hytnrrRFAFr2
 QW8BeesdsyOCDL0prNe2IL5DKF10pMmmcMu7I27UAdvj+YHZ1e39RtlQMF1XqadkwWKf/HCdABZ
 U4SC3F92VGvIC9qoZPzrvLp+qGUQWTlIRdtimX8Cp8lVxvhbMAw9f99Gp43djQvyv99aHZJkYTu
 qBjiavoJaiLloPlDRww==
X-Proofpoint-GUID: gp49NVkOvjW5P4UXcDe5-7A2xgCX7t5i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfX5Q7XERvX/pG8
 fegXBH6uZioQ8TR4M9lixRs6U0Erfv6nUa5j/praa77Q2SFch8cMJUE4gAJNOcqp2zA3u4QmITZ
 wZ2+l+8nk7I9f1/dOIXXKg6IJDWIPks=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad619df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ODsmY_3wxSbvKopP8XUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190053

On 10/16/26 2:53 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add the catalog entry for the Adreno 620 (chip id 0x06020000) found in
> the Snapdragon 765/765G/768G (SM7250). It is an A650 derivative and
> uses its SQE and GMU firmware and protect table, together with the A620
> zap shader.
> 
> The speed-bin fuse values map to the OPP bins as in the downstream
> "lito" devicetree: fuse 0 is the default bin and fuse 132 and 115 are
> the two alternate ones.
> 
> Tested on a OnePlus Nord (SM7250) with Vulkan.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

The protect maps differ a little, GPT says this:

- Downstream entry: {0x1c800, 0x1e7ff, NORDWR}.
- Mainline: NORDWR(0x1a800, 0x1fff) ends at 0x1c7ff. The next mainline entry is NORDWR(0x1f400, 0x443). So nothing covers 0x1c800–0x1e7ff.
- Registers there (from generated/a6xx_gmu.xml.h):
- GMU_NMI_CONTROL_STATUS (0x1cbf0)
- GMU_BOOT_SLUMBER_OPTION (0x1cbf8)
- GMU_GX_VOTE_IDX (0x1cbf9), GMU_MX_VOTE_IDX (0x1cbfa)
- GMU_DCVS_ACK_OPTION (0x1cbfc), GMU_DCVS_PERF_SETTING (0x1cbfd), GMU_DCVS_BW_SETTING (0x1cbfe), GMU_DCVS_RETURN (0x1cbff)
- GMU_CORE_FW_VERSION (0x1d3f8)

and it turns out that a650 should naturally reserve those too..

so please just add a

+	A6XX_PROTECT_NORDWR(0x1c800, 0x1fff),

in a separate commit there

Konrad
