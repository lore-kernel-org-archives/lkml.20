Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588347;
	b=uf5+R2GaxekZrRbXhDrpB0j856NTNDkj5wi8JgEzM5EekbjxA6syxKy8kZM+ggdUZAQ8
	 5s1bGFephCdMTe95AWnXguiBf40shUWspb6cK1dKBFByMLb+uw85HwShzAdHw/GzpJ1HO
	 KZHOD0qB5XBmuHJkX6cEoNbDE755xt27bP2/Gey9p7auEi5oXBllQBcEjSCDLD67QQsDZ
	 lKojGl0iq2isubYn9OvDwF4P0sAJ2fWTT2mNobXNnTfc0R0MHRDsfZgwiOPtZFp3FQ1ez
	 OcScrY5NXwNJsVG+E5zNfvVBr4ePHshBN/Eej9AbtlncHWoq12NCpzNBKIPhfRSiaOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R+/O0E+zf0N3c+NrcyoG+TI06SvcltBVHoSInsjKEsQ=;
	b=wL9nCZpVpUO4g/pKTz8orwp4GjY3DQ1a0Sy7JGzklJkzlVnl3OIi6ktlTtdJV7UeKdCp
	 meld5uLuEy/NRrP5yN8KhIkqXhlNuihDJibDq4Uz3QROFsWwP7kTx1feqSiWvgGKqlFCt
	 lVxMWIkYeCJlPilKQpWZMU3rPfSZpO3RHSo42h/46QpCJQ7nTQukL6CPegMcvVFDSHhHx
	 PBirxBzgrzCfGQtsAvmGLouwxK/1WNsjYomCeHN1MFYII/bh7zCLZE/BOJDPeaQK1TBOQ
	 XgufwD6Oeu8XS3hdai9NWpOIpd1YQkVDYKGwbF9Qy0a3Gwym/lElK5OvJVVtrQCzuKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fL9qG4Jk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxbgW8KA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09F8606E217
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A09F8606E217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fL9qG4Jk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PxbgW8KA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRTv1533300
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+/O0E+zf0N3c+NrcyoG+TI06SvcltBVHoSInsjKEsQ=; b=fL9qG4Jkr8RPUfio
	N+z7F8EnCeEt08B0Zh7Y4KoC4VKB4QPoFBUgOCJPTol4YUpoPecwvrGZh8VGSbUR
	sQK6kuJPouCGP4VizTc4TLXR0OPFu2CfzvGOClI3Gkblxsq9Om3KSqLqJ/cor5P7
	8BIQxW5j5Pzjc+mmwTMTQghBtwO+rcreiCzEVA5rrdx6Abh6xe90538tSYG6jrBy
	YG6xicaTOytooeOy//L+mVo+V9o5fx2d9YqUAkl84ddEPL8QvEaeF8PwNCxbLnl/
	fHWfFK13clU7RMaOdbVg6rN+Us2pmoXcI/E+YP6SBFu0isIBnBU4FGCdXaTOFwp0
	zvnNyw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaa9rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:45:45 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so952145c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794588345; x=1795193145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+/O0E+zf0N3c+NrcyoG+TI06SvcltBVHoSInsjKEsQ=;
        b=PxbgW8KAe8rlvuLPNgY0MYidPJTXDKpOEuLjCqO1VkKmr/h2eYKYFlcNCWW7QhJcrU
         kwKDtH9E9pscokn0S3xjtFQWQpyrvyuQntFSe3STpCsPkZ+9MfJdzFZuJrqt5XqIj6Xg
         d+NHmkOxoBB4O1XjjyvAQEfKUIHnrKWlByQshPHVQ3bifO+A1tHhAtlAS8XKPycIBNng
         Qsdr7zWn642hZ5VeItiVyqO1s4CW5yhUZJN4VUzU6Qqc1GO3uLt6I7Zm7kGIwZDtE/oY
         5p9+FU5Vg3GHIuKhxSy95EUn/oW3aNvMQg1zmN9ItzA9tBEW3NMupv/EVyTlFRzKHX+l
         AfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588345; x=1795193145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+/O0E+zf0N3c+NrcyoG+TI06SvcltBVHoSInsjKEsQ=;
        b=sPPjnZLK9J3VFBdv3/C8phHTmu3HivUbyH10BB2ntaIKpnCZLk/86qOjNSSlTDk2Sh
         iH2eAg2/ozAmD4tdqkXe4Ryb2RQ/X0DN2iWj6jGLhiJNWDFhVOQBSNpyb1nPXqM9eCdp
         FX6taiFcOWo8/DLBLCz0iEAu5FjMpHytdEUz+fmUD0Voa31tsusd5X3qDHP8hCVuiCq6
         ikCfu6in/PB+wkUM5UiNb3oiWgMSJqB8UvYByIL2mXOPDP6yyDS00IfmredBUn/SzpQh
         ySJhZ6E2r5sJ2gmZ34htegF1ir4dfJhdx/sECzcomh2mf3g9oi7CL+adK4g0qUJati9y
         1zuQ==
X-Forwarded-Encrypted: i=1; AL+hErF3sEGBdEzct7RKbSoH/ILjcKmbNZ2pYmU7E7yfbtSpoz1TSLfyIzjOy0LPWicZHQ1tqmyFEEfTIcAI4Tc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iA3wWp9uF5CJy/XzT9pVtGjZpvAddHHHHh0KTy9fOJU7jPy5V
	R4U+6ZsAbfd82PMo3BCMT2rOL5JZgf8ikM246fs2IcHwz61JypPHffRQ9LkZCAbefL5dYPq4bn/
	ffgHOWK+GL03UcISkNWUi2+DaMDZ/V9cIc6qr4wACPC3GEQO80kle36JfbBSftOckfYTK5JOd5g
	==
X-Gm-Gg: AYBFou37PIWLPy9a8X0eVyvGANjlkSlmVaIyG2wjUa2c4syN6Q/DpAwYa4g/W86SxD8
	gBI9ksOPCFhlMmu08ObXiCDBioei52Sl1gmZusp9fXGxjVHCzGy2KeGYsruV1JeU+HKB4i48zyB
	k1kOHTUNRPO7allZaRvAT7EGbaF4ThPf6+c8fuDflUkFsRp4Ho9yCe7pjmNHZuUjSYYO8brL2v5
	mazbIbJfFHlosx2IziHm/LpEVoPoAOcpqKq5zkW4dCmo+r6JhE62Pjq51N+nx/p9ldq7t4US6Si
	ASNQR3y2eQkBYdQ5cVXRNlA6yNzA2DKlxL01BWmM6fHOtmmjCG/wwTTf/fOScH2MI4ZBssAkgQR
	LxhYtm+iwIXgFBCByGN1F3jy1oRkn+q6mGLPeLV5nKIqfo8NNW/AqwVlSENcRmPKTKbPcbaxEUM
	PwsUs8oOaKJY6R+iSI1x/Ms7lbhxqAmJdOEQLG8cz9fiACQvkx1SwYB2wECi6DDGYCsg==
X-Received: by 2002:a05:7022:92a:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b5030e9a6emr4116464c88.11.1794588345189;
        Fri, 13 Nov 2026 08:45:45 -0800 (PST)
X-Received: by 2002:a05:7022:92a:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b5030e9a6emr4116424c88.11.1794588344528;
        Fri, 13 Nov 2026 08:45:44 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm8556045c88.14.2026.11.13.08.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:45:44 -0800 (PST)
Message-ID: <f1d28ac0-b0f4-49b6-adc7-0785ba88282e@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 22:15:41 +0530
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
Subject: Re: [PATCH wireless-next v4 05/21] wifi: nl80211: define interfaces
 for SMD BSS Transition context transfer
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-5-62e39487f51a@oss.qualcomm.com>
 <554491de8880420965217a37a7748d48622f1187.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <554491de8880420965217a37a7748d48622f1187.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vd3Xn3Keajy0JEsM9O9onYxmfwcZGE-h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NiBTYWx0ZWRfXwliQg+RMheC2
 lEsef0c/55qIUJun1J8ipAqGi0dzI1WZCfVwCdoNh3eo55oZ14wS7wuTa77wQV5XeF4VbR//iH8
 XsWvQ3HBkVeqiZZeuRoSefL9JPLzyDE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NiBTYWx0ZWRfX4wpTMSkJyt1D
 nlgMMrJ7uDamoVRUok/2jqeXnA+0Lob2+t271/5RdN1qdgr/LOjl0iYZJoFGwcBok2jcuuviALk
 dSZg134HoeYCl+LnnCVzjg6by9ly202dTW9EAtl2cuaAKfns1+NUQnmVjdh9L6vQaiDqHrnDQAv
 I5lOT3dnguScMg7Znypy3Lxe+76zVI1VsBM64mYsb3dQNVrai4SPpCp4fCV+bU41kmhmbsKbq4H
 aI7JBjofWIFfaB3xaQmVATFT2xBhnZ3/aiblz0Av9btaK4zwJHgpQ30nGZaDwR+IA+gvwDkijPH
 5AAN8zbieI4m4GUu1ZvKXQtJSiumsqQz5w6b0O7QyV0SCujgpJZXUayO35FJtHlWTHia6Henfq8
 3A9kXg0y0z3R8+hY5JFfgshgsYsdcUBAipzJ8QGfbyNwPmLScwryK93KFmcq+O33VErbw0ZKzai
 mkKWOOu+XT3Yh5gdNeg==
X-Proofpoint-ORIG-GUID: Vd3Xn3Keajy0JEsM9O9onYxmfwcZGE-h
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af73eb9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=u-lSwiENm7VDL5mirAsA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130066



On 11/11/2026 12:15 am, Johannes Berg wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>
>> +/**
>> + * enum nl80211_smd_ctx_type - SMD Request Type values
> 
> This is more "ST request type" or something.
> 
> You're conflating "SMD" with "SMD transition" throughout, and the "BSS"
> in the subject isn't really supposed to be there
> 

I will change it to SMD Transition (and ST) and remove "BSS".

>> + * Used with %NL80211_ATTR_SMD_CTX_TYPE.
>> + *
>> + * @NL80211_SMD_CTX_TYPE_PREP: SMD BSS Transition (ST) Preparation.
> 
> (as here)
> 
>> + * @NL80211_SMD_CTX_TYPE_EXEC: ST Execution.
>> + * @NUM_SMD_CTX_TYPES: internal.
>> + * @NL80211_SMD_CTX_TYPE_MAX: Max type of ST context.
>> + */
>> +enum nl80211_smd_ctx_type {
>> +	NL80211_SMD_CTX_TYPE_PREP,
>> +	NL80211_SMD_CTX_TYPE_EXEC,
>> +
>> +	NUM_SMD_CTX_TYPES,
>> +	NL80211_SMD_CTX_TYPE_MAX = NUM_SMD_CTX_TYPES - 1,
>> +};
>> +
>> +/**
>> + * enum nl80211_smd_ctx_ba_param - SMD Block Ack Context attributes
>> + *
>> + * @__NL80211_SMD_CTX_BA_ATTR_INVALID: Invalid attribute.
>> + * @NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE: Required (u16) BA buffer size.
>> + * @NL80211_SMD_CTX_BA_ATTR_POLICY: Required (u8) BA policy.
>> + * @NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT: Flag attribute to indicate
>> + *	AMSDU support.
>> + * @NL80211_SMD_CTX_BA_ATTR_TIMEOUT: Required (u16) Block Ack timeout.
>> + * @NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG: Flag attribute to indicate
>> + *	fragmentation support.
>> + * @NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL: Required (u8) HE fragmentation
>> + *	level.
>> + * @NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE: Required (u16) extended buffer size.
> 
> Same here as in the other patch - splitting the buffer size into two
> variables or attributes seems ridiculous.
> 

Sure.

>> + * @NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP: Optional (u8) TIDs included.
> 
> That doesn't really make sense, it just introduces a place where things
> can drift - the per TID nested values below already implicitly say which
> TIDs are valid.
> 

Ouch! Yes, it is not needed in the nl interface. It was originally added for
GET_SMD_CTX but that does not need it anymore too. I will clean this up.

>> +/**
>> + * enum nl80211_smd_ctx_ul - SMD Dynamic Context - UL direction
> 
> Right now I don't see a lot of value in splitting UL/DL attributes when
> they're basically mostly the same - we can probably unify that into one
> space and maybe have a few that are one direction or the other only?
> 

Sure, Johannes. I will combine these two into one namespace with separate
labels for those that differ in type.

> johannes

