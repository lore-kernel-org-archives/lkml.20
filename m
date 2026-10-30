Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351296;
	b=upf1PdsDi18azScwatJxkrterlDvUFj+9D41lz2e9HPpX9zTlI9xusLpdty1hMQShMME
	 NhP0DZswjCduXVIUiuWn1Ox12bVx4raRwvqMS0w0oKlr7evfzZ88/kixb2inJLYk6mXgQ
	 mXNdNQZcHTz0aQYTiww808Bo1D1L1gBE3HIsxtXoJn/V+7EhkSNXRRCQpgxvfg7bO7Rta
	 hkgiXdbsEzbvbu0eXl7xsJ7EboMLeFHErWw0yJBnNpOlZI5TcYO7NSDbdrubfwOGwK80G
	 8O4l3YL2OwsmeNC7+z47hbVuTVVf3HHmN2h/UqNDOSfa3lraFCVq5DzGqGXrDqR8WpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=;
	b=Hq3fWJl2BhyO2PCGFzW69HbxaRIcQggkcj3DOn6ftHqmIqym+RUIURMGDw1/8AgDbODK
	 04pSzBfcZtUKFF06pwgkJx4nORttOCPpIaI5H02zwYOKN+BvIGx9asuPm/vDWj1pccMnD
	 4E3RfZdfnx4KNNR753eJyPdm3DGxSzeEaWzWty0ew7rh8eKvEij3PalYqMfyxNLM8erf5
	 hcyVA280OTiD3BLQHx+ETKwTcIXf7GeBqxtzis9H8kDZKYChcinYJ0FbmiPBRyR2lQQRR
	 AdXRxBMU7XLyrwlGdemzs2+t75emJG+c8y6z/lvbUiQevP/MNRP7eB1vN3RwqUlKgPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrxmNSFp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aJd6il8e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrxmNSFp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aJd6il8e
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9oE2374148
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=; b=NrxmNSFp/6jYfrCQ
	W0SKdq0iENifrZ2kakeGMvw1r30bn2bhEUUQwcaZi2jMaXyRSn2KEeBlWXiMzxjg
	CMBUhqWeBJ7gWH4j57WlubsDcFq+euiYsN83xvZtB5sfGl2ybVJ97dTI4b6jz17k
	da8FVh3pzXFrhHJetTbyhyJS35azfqh+f6zDSnZEncEDEqZAn2vEmgz0PIMLDruB
	kKNaA9zygzwnNHXBm0A5EUVxACQUGDOCfxCjVfqUmpPgYFUFsLxGVKbSdoJ+wOnY
	cuwurmhTmVRUKG/+dcf/OF/kEdXmRSFxZZoBAv72JcBVCxd45lRF8JsxhA7ManHb
	Absefw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj4xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:08:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so108611185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793351294; x=1793956094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=;
        b=aJd6il8e6NzT11JJtFCQWc20+yhRPE8TcTdJsdVw9st9l0ek1hSCJt44f4j4vpoNcg
         U4u5ua+4PSXh62m9j7d7i9NRLP2DomR0mzlDaCfeMGu7SXNXqmKv88LDMvhBPFOs/wQP
         Vwue2g0M5gNfcuRWxANpYKYEpyTuqPo2V/NSia6CZ9w3cIratQDkR3jdPbbIl4i898vF
         d1nOqN8kSGj0GZ5o8HcRdE0LcE1fpbQ8BZW0d+Un0dz/uENw3fYFztrCvaBxVoEjGkQx
         JAjxhufc5tswuYAGNulyStMzhUkp1hin2KcnFjLZnQ9MUO/8bgl0EBTindkNXyJhUyg1
         HedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351294; x=1793956094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=;
        b=IQPTwLZvBPs0DgyUtUDMUg1KNxzFayvb6ACHwETArcJo7CTAp4E1OBWZEtUmrLL1J8
         2VHfmTV4kempUb33ncnSYW8rzIx1qwvHW2y78L088OmH7zfyG8zXgGNgABXeDzRC1kWf
         OaT/l1m07EW7SjZSPTLngkcRhBEvzvOJ/dBCwaIqvdTvlrEoe7O4WYMvaEYY8sZR/865
         Eo3+ZcwxqYyZh4P9inOD4VXdi2Tp2rQLZUDZaTnPTCNsjQ9Nbv17DOJCrpGenqS1Gydp
         VTQqKUV5WzohLucvAsIRSxbLhzi0F6j12pR3BJ9r78xIXj77dwD3XhEPSxz/hax9PHaf
         ea/w==
X-Forwarded-Encrypted: i=1; AKwUvBy5pdT30WYSwAiNdO/5lRtdGGnUJ2Po/bWykW59ED8yTAKbJ8/ZP/ZImrik2k8NQZzEu9pS6vGvPR9thuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO8KIm5VX7LMwD1HvMzMzUgGCy/NlEm681l0SU19xVSFPXHctl
	SzC9WyTxrSsUAGXVRGQ7P/thwrTC375o/+zPELeFUjBNmZ/km42vdTnzmtiylfslp/IaxDwuVYp
	+gNUxpMfi1A03i48IBH12ww+fYXpITzIHQdvRIfNdIwaJv3bJWvGYsD+O8o4Kd36s1b0=
X-Gm-Gg: AYBFou0aMhiHUuB7egS0L8pkJpoac1xib5ejEkZZ4YLSO3wcFlYE0mQht/SpdW/G8lu
	F8Ps65q8RStbagcXmexoa6xhY+1oiMU5pyxyOw7WFibB0AtLqPQpSiO+OCxG0NR67I4MlAdQa1u
	QeT/Sk1BC2TnkgESJ3dlIWo6airEUFYfzTjWPIyEhAlH5xi+MTVUqh0y7uA7XuzlXDoRSeK2PnR
	ENeTtYQSIT2F2PkDBGkn0tjvbo2ww95FVT3N01Hr8NM1DCpiD3yao3W0a+967QpLY/XQgC/aR+6
	j0H4ZkqLk+ewJ0Me55+eZalk8rQJFsyorCV69J/qVhO+Bj4tLUVGQ3tZLv6QQL/K9bFuuqSbr3I
	yZw4oFun9fzOywQP4n9xerL7pHV9fkcInA0IIh++TWr4Zi3jerB3UmIoZmZOvp0o7DFXnEyKEdC
	6kkT1EPW4w0jWMDn7mL53iCxHDPWvX0Thzl68=
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id af79cd13be357-944216b818bmr277395685a.46.1793351294001;
        Fri, 30 Oct 2026 02:08:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id af79cd13be357-944216b818bmr277392185a.46.1793351293464;
        Fri, 30 Oct 2026 02:08:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7fbe:151a:486d:a2cc? ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm1958499f8f.25.2026.10.30.02.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:08:12 -0700 (PDT)
Message-ID: <62826ebf-d5cb-4a94-942f-76afa97b3e09@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:08:12 +0100
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
Subject: Re: [PATCH v4 0/6] powercap: Add generic hierarchy support and
 convert DTPM
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae45e7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=h4SK1RYChiWzJ0aczLUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 94CVaqe1nF8gKDj6Bq1Z6HCO1Q6CLV2x
X-Proofpoint-GUID: 94CVaqe1nF8gKDj6Bq1Z6HCO1Q6CLV2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNiBTYWx0ZWRfX5pL/CLRHqM4j
 KRDihtUeaswGOKqSluf8KS3vQ0u9WQLPODsLMWiuDUhx3IICuunhrik9kMBnqkNeih62tCzXMRH
 tVUwpGDQai/MpPqfKwsugvAiUt6BZmpY5D2Y4nI7WoE9Ulfi5KwO7x3gpTSpHXO3qk2aMJo4/RG
 aPbMtt0oNLm1p69Y/VF14N7fywl+n/m3tCxx/+i+fsP0VYvsrJwIQWWafItqPAq6GxRMYoBcq+i
 tCpVQ3uz1FvAJdsVZeCVvgd0TIqCACaLhTCAsOJNr7s14NchFHaA8L3Eh6PpgvQjMaGZKlzLD9K
 HCDZWVT9S0E+VV5PPbypxwV6vsmIL3Ivr7ktEtCSLmacSvsmzCKP1aVXLVmr2Rq5y0VdssVrYxr
 NdbuxdjTE7Wf5nOZkh86TbMTl/e0Em9Ft9GcGGtlwOtiqDe0Kdf4k3Gc9Nn/bbp6FOMFFbR1vt4
 sYsmRJsiD59VihC4fzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNiBTYWx0ZWRfX3RrpeeZjmHuy
 Fub71JLRhAon/iZ6OahT9zhzuRo++LwPLocvcyVFc8KPsrSwGz5IvT1BoXXtIniXR/UAZra6lZ8
 /zAwL/g2NjgGZ8lSbrH+1pMTxSqmPsg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300036


Hi,

On 10/29/26 17:56, Daniel Lezcano wrote:

[ ... ]

> Changes in v4 (since v3):
> - Rebase on v7.3.
> - Address the selftest issues reported by Sashiko:
>    - Add a kselftest config fragment requesting CONFIG_POWERCAP,
>      CONFIG_MODULES and CONFIG_MODULE_UNLOAD, guard the module build with
>      CONFIG_POWERCAP, and skip building when prerequisites or Module.symvers
>      are missing instead of failing at modpost.
>    - Resolve the kernel output directory and pass absolute O=,
>      KBUILD_OUTPUT and module-output paths to Kbuild so cleanup works when
>      a relative O= is inherited from the parent selftest make invocation.
>    - Keep the statically initialized mutex in permanent module data so its
>      lockdep key does not point into freed module init memory. Retain a
>      separate init-only description for the hierarchy duplication test.
>    - Return KSFT_SKIP when powercap sysfs support or the test module is
>      unavailable, while retaining failures for actual module-load errors.


Just a heads up to say the series passed sashiko

Thanks

   -- Daniel

