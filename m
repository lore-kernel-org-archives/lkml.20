Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220357;
	b=jPLXbJ9uw+lM2z7uOIE2wJkY50rk/YroGXfFpwiTLfqzjgfBPgwjgtS+px4UZ2ORFjnP
	 LG/SVNCGVOsZODY6uWLsoplneoBDbFXQ9lb7rm9BRd1hTRgBh+CGZnJeyaH3OIiz3hPGp
	 ffD9eBy8fRyJKLsMGeOPmkROwDWaThplk/8+asizQrwDe6tPR+BX+GThcg2/Uo1OICEdg
	 PQdfyv8/zFY5GUeCki/q2zIArrJrV71rZRBzqem7J7EXN7zplivOkl0h29LZbIZs7HuaA
	 KrByAhf0JZ70z6Mls+WqP6o03A06E2ebPcpO1OcHYXIP2aT7g45+ofeSHENcsiBZsQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=;
	b=CYF8O+z31BCU89JoHG91dSSC4qUnATHPev+a1pPhy3ohzbEjoRULVkVXab0AVWT7klVp
	 2uH6rY7Z5u/Wvwks35C4P8dpeT6LZyyCFwkRnfpBfZHIGGGYH2BPCpy2xVMJFYfVQFl8v
	 EzIJeV6nghcl03yitrc60aoWPmOq8LO9rOzCxOPAo9JyOdtW4OlLjblF9LuAUa85pOOwa
	 gbznedvMQpvzXRywr1wt/jXgXyuK9mEzWC5QLt8kkMVJ4CdITckl5sjJADMT1F3R5cRaS
	 dnuD9kwXIkS9uxOddpXfxdnNw5/Ydjm/JQQWXSIXy+fQ9ir++sRGHMozweUnclJ6K0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx5URFdN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MLBUDz7/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBEB606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DBEB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cx5URFdN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MLBUDz7/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPhwP400515
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=; b=Cx5URFdN2cNg87ly
	4km/gBAr1vP3quNlgWTQUPHqp2DGyuTrdh0UZgUkt5DIzUaMfRxl6IhNHdmXgJz2
	/ONVKUl2soONKkTL5RHtlwVtqpyqgjfTITcZz3wJPLUS5/PpGUq7nq4+TrKg0p9q
	gawfFjdx5BXN69YzmZC+vKWk+tu4ip2Th7eE61AM1yWZj6XBZLaEUsTwIdSuwATU
	2C4pbO4wkG4ngEpdKdYo93Mtf87/H6L63Mcvvj+Tj+qFHxByQV5an0NMn+73J2t5
	yfqimq4AqZ8KpgdZijXWcUEzy3zqZNwaHOR88K9oyaYm9zG93wxH4JAUnNQmfsQF
	f+SPYw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnhwkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:45:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so3252014eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793220356; x=1793825156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=;
        b=MLBUDz7/Pmfc+g+B8cJgfY8zWPI+XTENqaffLdASkjakYxFd1inwaCa11NsKdOk8YW
         1ATH13bu0D1o9/Sd9TzD3kZBqHKqjOufTDovfppAnid0ujMMTR9EIHOKZUz7C3EIb/bE
         bMHe6oO5eefsG/oP7JCgoTJGQ5GSbKTtAJpEnhS+9Ykc9YLLCpVJoU+CGr3Obu0Upvjy
         0xD1vuZC7vPjYfdi1SrGEZ5nwmyJLPLEGOzsEv2Xj/kJ5AZsFA0yZHuP8T6niHgUBBMn
         2/Qm3H/gP9jbDKU3Vh8rxO+7Jt3QepMVFBR4un4fLRaF3BCEtnaVHr8CtlFY3r4gnKiw
         PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220356; x=1793825156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EP6xULgbpkKbbLO4g2dHiDHxnCrHcDloPLKgANcrRB8=;
        b=juMaVTkrHZsCMC5CkjH0PDV+YHWKLyWCjO1XOcunKe3POQF5/oO3fbMkZQj4XoT0JA
         /66c5oHfsG3LqyrbBdDfA10/KuM0RIep1shJIc+gYbsVYndp2/N+xX/8Z0+ddtlAi6rp
         71QJze/NPLjsfepJA2HiPMapUGZUqu9j2EGQV+WBVjLFuKDEaLLe6o2/J4CjxeRcj8Kv
         ln671vQr5MSwu5Ivn22EHz7/7bc1X6YjReaq3bp8EdhgvHVLshbNdYYjJY3nvWvQgLAt
         NoBSQkbxJXYtxcHERnweSkArZIhmrJT94Svn93tDeXBWKbTp2ZLebitxXwNBadIyPVLQ
         DfjA==
X-Forwarded-Encrypted: i=1; AKwUvBzAqhhMAPmlQGXarMZuIy1mXkxqmL6jb+7F21cpkXyUiaGXnXwb6HEJhD60vhztfCFG3Mml7JakXFbMdJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWIeG/C4ZVhoe4vi5/5hKribbGROAIcdDgKequi/5kTeadyEAV
	NFbjVqosjhSL03kDSzfoMT2lbC8nhYQSnW4dXg+PH7yQVKWU6DllWCB0O23dsopzE38P/T5zP9C
	3ou8R3fHQn+rp+Hi0AeDzpmnf3r3cGQduyL17UzV0YujKbXikef6UqGO6PUbki4uFlbg=
X-Gm-Gg: AYBFou2EPirkSAOsLLTLFblCUByxaUKo9HU/bl39OP335NDM2YQy9rIZqNwP+zcmwH1
	gsQQXFy8WGFF+wRegTGFKWYwHiF1ZU/Yj3ECoo4trJMH+GEoYNKgzCfGINXSo5lif70S+Vuer6U
	Zyj5wkuzkxMpHkJpr++3GcD3FaRBSi3cAuU35D6OpY2AIpKpofhiA4guDkAyTo5N8OqXy/nuZMP
	9qxfwyLb2+TXwnqaw6ggArVX8QztKOOD45OVZ5v3RXDhPVHBlUp1TOJEj00j/BHeEKJ5seqDRcs
	xwgFPlluq5JMcCgsX3yqkwQ/Q/1Udbwli03L6I/s9KICQdn3qDBfd7CLvZeBfCsz0QeKzWKJsGw
	7R0euYcAvpWblyg5et+GwMgPmX5q6wFXegesoVUz7kxTVnrNNa1V8A3I0vhsg343Vxnubdd3CPL
	aF89EUCSWVDXsByS5HdLeEYbV7EhNyjEQ=
X-Received: by 2002:a05:701b:240f:b0:16b:fdbf:4a9c with SMTP id a92af1059eb24-1a6cd7799damr3970910c88.23.1793220355804;
        Wed, 28 Oct 2026 13:45:55 -0700 (PDT)
X-Received: by 2002:a05:701b:240f:b0:16b:fdbf:4a9c with SMTP id a92af1059eb24-1a6cd7799damr3970883c88.23.1793220354960;
        Wed, 28 Oct 2026 13:45:54 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f7fb28csm10326914c88.18.2026.10.28.13.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:45:54 -0700 (PDT)
Message-ID: <1cb79561-39bd-481c-88d5-a05135f5dee7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:45:53 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom-mipi-csi2: Add support for single
 power-domain SoCs
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <ZW6-XDf5dgEFD66QI7ZA8WIK_alWTQD2RWolsXjlSql7pO5IUj9PM1T95LMfBd2Y3zKxRhDXXde1R4asZWzgKw==@protonmail.internalid>
 <20261028052047.2738893-1-anusha.nandi@oss.qualcomm.com>
 <58599b61-a56b-4d6b-b09f-03d813a64c1c@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <58599b61-a56b-4d6b-b09f-03d813a64c1c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YvsySaGddUoce_3NpmTMrY2ogSt6PfGO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX1jQ+wcPZ9hZT
 8nN2ZXa4mUtq0OuraLhQ+RxM9hEXMx/EOlgT9L3R0QUiwkbejttzMGQ0oqRRmEoV3DaxBU2vKu+
 Zz7P3Va3+29P7cpbIG89Ie1b3CcMLc31PwTVo9e3jyieH4tA7IgowlIPMOo2R2B86LOB5GPX4mG
 I/c57d4BqYt1Hak+lxU4pXHbmycc7Snkgcm9Ii6rbHlf8kUGeEBUCZGyY+MfT20psT31RouAqzV
 ziRymcwMn6Cki3PvAhu0cAKj8UPMZHbPesWe2OuSGTM0T5RFZsbkNjp46eGCbTyCkgADlK6eFny
 f70IxIRFJZiqQiAdScohF4xJOV8eaj+CWp0ogVNvOQ5Wn0po/A5IXrBJNTVU4FeWEid5Qnzkxc0
 Jj1RApFiN/Zko8NeJ84NMc9uOxG/zXcY4HTU6xCT5GTQ+pzDQHTvSU1dLiRyOytVqvwTyufRoAJ
 ZVYWenMaQIPdAApMGlg==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae25f04 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=GEq5pLaLegoqB_85s88A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: YvsySaGddUoce_3NpmTMrY2ogSt6PfGO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4MiBTYWx0ZWRfX93pgz0XVJmH7
 rWKNHcK36NpgtYEJJVE7Uo62qD9CTln0FX7DiacYH23RTuonRw+8LIRhqXw5VQWAjgEumS1TnOI
 UNYzXi1hPdTI39LIxB1c157nh2EwHCk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280082

Good catch, yes. I'd dropped the NULL-list check for the
multi-genpd case too, when it should only have been loosened for the
single-genpd case this patch actually touches. Applied.

Regards,
Anusha

On 10/28/2026 2:58 AM, Bryan O'Donoghue wrote:
> On 28/10/2026 05:20, Anusha Arun Nandi wrote:
>> -    if (ret < 0 || csi2phy->pd_list == NULL) {
>> -        if (ret == 0)
>> -            ret = -ENODEV;
>> +    if (ret < 0)
>>           return dev_err_probe(dev, ret, "Failed to attach power-
>> domain list\n");
>> -    }
> 
> Shouldn't this be
> 
> if (ret < 0 || ( csi2phy->soc_cfg->num_genpds > 1 && csi2phy->pd_list ==
> NULL) {
> 
> i.e. you are dropping the NULL check for the case of multiple power-
> domains.
> 
> ---
> bod

