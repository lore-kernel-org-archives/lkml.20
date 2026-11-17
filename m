Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917209;
	b=oFcA9utnh5LVuCNufDINO9fHjsD9tFrlMMWfqxZP9OXAfGn8LI2YnirtsFjE3nXY9dCI
	 8Fb+ZJTRFHMyO0hBLkW4734OmdyfZC1Jb5p4EKUMcnuaIWoQRRM3fRUvOHkbSivz2tt9w
	 +ITDlO7Lt8BOA0lYw1AtF2pFUBtW1BS69Q5TVmXpWSF8cDXEdC5sIYM0tzZYKXY5K1bZo
	 l4VHwbNOPI/LM8ftIXK5xDfhzZnsmkxZ7YZGGJZ1+iEr4biAgFdz0lq77ayJ0ERoU13MM
	 oTX6PJ8eKT2yRh6dHD+uy9xQSQc+puVuiMRZWUg1ySXmDPELfMTQqLDco7yuHfZV27g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=Bne9TlcWx9lJkegSeA2PEiF33AOi34cRImm9wek+4bg=;
	b=mCbjuN2jytuEtfIRURgy7JEVlHWN7PGIijjJL6zrQYVckGTkgzeicmPod4sq7+tvzbZ6
	 /zMtmMLYDQXE7rNqSJNumpYTUJ5mAB253ZCGBaftGhFzDPBDjYVXYxRCMUnO6dCKnonIQ
	 W/bfNkmcRocEFbt62DctqOtHRtEsFLhfhvvQqq5ge0C1wcZSUGuiZRMvkfWiUeJYvzRKF
	 TIx6Fr9l6M98NlKycJCyzGSkhZ53dFTPs1rTUTYKvrj7kTRkyHcLqi8ju6D9rjitEcANx
	 EbBKuEczvZKLlYea9AL+S9hy4mAOGd8FJie+ZWRnb87PgUjo1nmeoYygfT1pN4BomcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PoQwf41z;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E345606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E345606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=PoQwf41z
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0V1g4013187
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:06:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=Bne9TlcWx9lJkegSeA2PEiF33AOi34cRImm9w
	ek+4bg=; b=PoQwf41zrUq3frjRBEqRzaFXs/5Hi65V7Osk1p5yuhkak0G7lYEd0
	Zg83nC65gjlukrrI42+RgoM0v+WsEXhEnkukInT7+D8ju31cjjhJPEAGr9DVYbA+
	UCFpIui7NNbOAgwaOtuZGPo8j4+sBw5RymyqkqJlYBBFIKm8CiwVM+UNfdMsE+x0
	bijjtr0hNgsuMoMVMaW18HNYtdU9Q1dgtsfqp/g65JrpSfapwCKXIYfu/zJ5lWLE
	xQALLon9EKBCsNe92IKdElwd1uF0B/OdIsZBeJQVX0XhQvKX/PwuwRyCAGzVH14X
	hdQ3ZAETQuNTUNGE3c4wb3KarsWlFq7Iw==
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hy95pduj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:06:47 -0800 (PST)
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e2734c4d8so471492f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917206; x=1795522006;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbyiXdx+10NL01ReJBrbufipXpKDZVNSkw5joPNn8Ok=;
        b=0SOdomMXiIkC1W+rqlfRxEAyEH0j4Zlyz7SyDKORXn8sIPGarC2oxLoNxGVVfS8KH+
         tSYem3ymxEElTQDXUOAZGNDLsd9T37GsBnLy4zxbW/OMLRbOOMjh87Th27oVm0v4wiig
         F0gxBGHRBfxUa5BtH9WLqTHp4HH5eJ40I+lDNtF3zWU9kjk3t4Y7N3tF5rMlnEheQMt1
         iKuImTrMWqycfXukC1nf4lk35fAVpo1xRsHtAQo6B2NIYllgH9kY2extie8Zle/UElVO
         Tr7ZB9jFUP+8cfhSOn+dAp3CoJzSA6je3EqyN++CKSWM7JLitsv4Oj1m2bd8xfmXi7nQ
         KpQw==
X-Forwarded-Encrypted: i=1; AL+hErFZVxuY6W3IslZIBY1NE01cMa77JWqIlaRrBEL0Jstj+21URy2OhsW96eiz8s0hevOubDaxYp4c5Zvn7xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zVe16m8y/TL8UI4ized1p2/T2iRx6n+mbOXpH/4bp3QVz7lxJ
	tMg8dO0s+ci7+rcMydtHwvVgPD5Pp01m3Tm9nNEklSje1zL3XGZY3WZGGdRyrhDi/GxQZNU+BMN
	VXopHJWfrk4EAJqyEkyyV5bUxNbxnr1Rf6pJAp02u3Ra5TRHGo1KJXsP07ly+pOe3
X-Gm-Gg: AYBFou1ED6pJPCO235v9R1CQx6DKKvy4IfATuPy6HYx8XuYUCvSKBVrMwEgA8KcWy4r
	VW9X9NUiy8BDAWjfY2k6s1hEH37sASuhUMosTiIbkFfpdBmlS2AjcMZhh1/uJgWP83ccjWoxtoG
	8Tu3jsUgqOgIAJMPxCI2Vv2hDOVWFAz275rAw3J0p5wLNJnmtTURiMPUS/+vfFemAT+HE6jjOTN
	fqcJMVjNVXLuzXG+un8TiTIFR/UH0ZjXTb7VdweBRO/alc6JM3BHVIVrHE3kYf/AybP/QRAyn1V
	3PfLdijh7gI+5hQL78zkdBdQq3U8svPgzM/BOs/a1r32iN+UBeF7l3CW3lgpByM1Edg+CCP4B3Z
	nENdXUCFgxpGJnX2vKsXWsGDml+2oSDNXTPzMI9LAXRw/cAF/rQegVSLi9JyyTOCfTDN26NXXhj
	hYeVlFjEVAp19i
X-Received: by 2002:a05:600c:8909:b0:4bb:7ad9:301f with SMTP id 5b1f17b1804b1-4bb7ad95f8cmr16122785e9.2.1794917205756;
        Tue, 17 Nov 2026 04:06:45 -0800 (PST)
X-Received: by 2002:a05:600c:8909:b0:4bb:7ad9:301f with SMTP id 5b1f17b1804b1-4bb7ad95f8cmr16122395e9.2.1794917205299;
        Tue, 17 Nov 2026 04:06:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:3f7b:7276:a343:d339? ([2a01:e0a:e17:9700:3f7b:7276:a343:d339])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783862d6sm56905345e9.2.2026.11.17.04.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:06:44 -0800 (PST)
Message-ID: <e29f42de-64df-4c38-888c-64d7c89a81da@meta.com>
Date: Tue, 17 Nov 2026 13:06:42 +0100
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
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
Subject: Re: [PATCH 2/2] io_uring/net: Add bundle support for multishot
 recvmsg
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116111744.702159-1-cleger@meta.com>
 <20261116111744.702159-3-cleger@meta.com>
 <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
Content-Language: en-US
In-Reply-To: <19c6db06-d63a-4dc8-9b0d-11fba039b714@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NyBTYWx0ZWRfX5loJlZdamAWU
 ua7raOPetUj3RVYgy4ZZlMcthAqTRyxGKRVasRvwGYQd72U7zivXP+MkETmAMUgnVNh7Fz77pSt
 0acQhHYiQ4FZSWSfkS04ZJDGuRgnkr2VSl1cZD7zBG9ePUq5/VVN1KNURnNnehQV5UnPhnr4WGp
 YHdwJnz2Yl1AscpN7uukv2NeCETsrSq9GGKg3SO6ccSgIo4fCXKrisWLBLiAQ4MnW4W4ZKVAp8h
 dGlwVCwFQWYKBKwCxEJzk2AVL5mY0eEWlWguCbfNN6P1Kjio8X4QTAdzxYaMv4FgQe2OoN4OndS
 hgZFhpBj1AqFwBsNek0o4Hz3JQN13hwoWgT11HMwQPTOpJ6PXf5XY9Zpq6RS0Z9k76vFbn4lbrZ
 mxgFzW/R+nPlyGSiKXSHRHYPkNWgL7E+Oc7hIlIvjhqFSPSBHLWRIc+SQ2AB18kHdvsOrarL31L
 VftfMCUM4V/hZakhcvQ==
X-Proofpoint-GUID: gkWPLT-RxsXMrlrckHReDhs_ILxISA8g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NyBTYWx0ZWRfXxlvQ1cK4Iy9A
 fBcuMDz8MqJVW0wBhXkav84qdZs+nH4ykzMrD/EBrAcvJYA+dgnNg7ddGOUzKgW86yWFkLa3vr6
 BnsVb1VRhtA5c4ho0OCJR6DmQD1WpRs=
X-Authority-Analysis: v=2.4 cv=Yuea1IYX c=1 sm=1 tr=0 ts=6afc4357 cx=c_pps
 a=pX1sPZUoWPGeQgUnKQNIgA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22 a=6KMpyRCIwqAuzVE73isA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XGGHjNwGSpTZ5T66x7Ix:22
X-Proofpoint-ORIG-GUID: gkWPLT-RxsXMrlrckHReDhs_ILxISA8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01

On 11/17/26 03:45, Jens Axboe wrote:
> >=20
> On 11/16/26 4:17 AM, Cl=C3=A9ment L=C3=A9ger wrote:
>> IORING_RECVSEND_BUNDLE was disabled for IORING_OP_RECVMSG because the
>> envelope and control-message sizing was not implemented. Enable
>> bundled multishot recvmsg by reserving its metadata in the first buffer
>> and accounting for payload spread across the selected buffer run.
>=20
> Patch 1 is fine (though both need rebasing against for-7.5/io_uring),
> but a few notes on this one:
>=20

Hi Jens,

Thanks for the review.

> 1) This changes behavior for UDP, which has no inq as per a comment
>     in here as well, now it asks for MAX_RW_LEN.

Agreed, technically, it doesn't change the existing behavior for plain=20
recv but differ for the new recvmsg + bundles support. I'll try to match=20
what's done for plain recv with max_len =3D=3D 0 and use mshot_len with bun=
dles.

> 2) Why not support incremental buffer rings?

I deliberately left it since it required more wiring/modifications. I=20
can add it in the next version though.

>=20
> And the usual, do you have a liburing test and man page updates as
> well?

Yes indeed, I have liburing tests, just didn't to send them right away.=20
I'm missing the man page update though. I'll add it for V2

>=20
> A minor note is that the commenting is a bit excessive... I'd prune
> that for v2.

I'd usually remove them but they mostly seemed useful to me. I'll prune=20
that.

Thanks,

Cl=C3=A9ment


