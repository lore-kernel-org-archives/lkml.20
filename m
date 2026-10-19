Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428417;
	b=cnCPx+aP4XedxzuNcy30kKuWdaV881EkdnCwfMOp/AypOQA5ebUd4sjJS0paHA7iRASu
	 bu0LfU2uoj7V/m32wrCaaEw51JF8A1DEb8W7ZNkYaKcWgnMtdK73LRmhyoUSgcATz05ds
	 pI8fe9u0UR9BoylaL/6BfStEYgYxfDRgkXXrmUqhk17r/0GhmD2h7fFhsytGdLsWOR6ye
	 y5mgacgrl4jaXRpcM3kdPy5znxiNAhKiYP/tBtnz3Lhp3+U1BVSx6g/LRtsPvdw1GHX19
	 PhL1yS241xqifODnWWVrVERrWwfDMUOItLlVd9u/BMpy4QrMtdGe0QZqXs8diwEs7fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428417;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=;
	b=lk5E1eMt0xYQlp+mLELkx5hYqkN1UJPRm9GnVcRwmZikXTA6WER+bEuhABCAWPPQWtGv
	 PhSg8wBbdC1BoGd21XgUFrXP3sUdrwZjZRgguePMKXFNaDY2ro8XNq/thf9HyJTAEnasP
	 2AExw/zIYkzUMyqw0W3caqURTMMW/t2iJwLu5UIDs0+8fgJz0HjsjwNBTPpmAXPfjU7Cg
	 +1kgoV40rVMqaEfMC8AvlqaDp6S6PCZn+wiNbEdX2v8pkpr/sMW4+wl2gq3Jh6skaD0cA
	 2DqeUmUl7//9BhkjZ6aRizXvb3s8Xm/g9SRgHEHL0vORGvggJRo4TAkUfybMqk6JdRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nfWXGEn2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CHWP5igC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346A606A324
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2346A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nfWXGEn2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CHWP5igC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFPIBV2589975
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=; b=nfWXGEn2NkcNVPpA
	Sapb6Al6dKB6XBK/E7Wc91YrpmFkKXGO6OidMfRTzWW0xmPq3nrdhsKdgyrlEsjt
	8XcTKHuYqy5FHI3vermFeKBj0SCDdpxGyQbasIr7oeeuabDeBVVV7RD/6czWALvA
	kea82WILN2a96XvK3mCrgJye36wgVWic902BlxvJcPZOarHUuvx/CuWWPgEJLo7O
	btWw1tscYss9RtGlfejcDaNkkW7/wKHMh39LBXHtXHK+JVB5mTNBS79sAtAdGuy9
	Lk3Vxq6IqiLAjOPZ/TAyuQ0uS320TXv7b089hyCVGfmYfbkdChj6UqF6gC28olhq
	D4fEEw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n290a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so2388562eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428415; x=1793033215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=;
        b=CHWP5igCF7r4OrOW+phaamMMD9Q4SRSkPVOC3zejvfcZsAf3Z8a7fZfdR6d9brP91N
         SnlQgoROSbr+qgBm4UtMRwL12uRNiD7FXbADf5ZLSvnLP77/9OSHiAJpwYFrbWlfP6xi
         tsmAU7B8HEbg07sh1ThrAGHyPHV145j+jLeEieYJM4HG2/jCauQWn6U4PJJB7c/tJBr9
         pglUzCDL5cwpCHxOMf2C/whtlBUJlEwe//10xXmejVyycYCwdX+sMqfDaAw2psOatgAR
         wrd9/ZVnZtiqRTZigNGyE1xhmyCi2OKbU2lbpi9fp2YCXE1PgQx0yW3VL6fkbAxdgMnw
         najA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428415; x=1793033215;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=;
        b=NOkYw8ATfW8EvMe6Iv05tZI09WPxOZfJp8RWMZ4A6lFFk9vr6pwC89HWe6DlFSTQJb
         1c5GjQHk3CLn42ugLGNeXB8ycobX/OSIvtwkT+MvyRHVTv9WWCFM8Er6w7MrN+7kjkMM
         aAqxkkcE0PPXfUnfnXrvbk5A5+OW07JVRuuSMAUXiaFNpxavlM1zF3TUV17ADi4JlNec
         p18BIt5/MbAfpQlrz2OP4Yn8ol0sg2j9RUiUQkerBLlthPjvsHcjQYUvqlZwpnH4EHP1
         NDkuO+/tEM7xYOwalyz0ruD4kwrogoJPgzvBP8IgZuFIadoHB1bR93nlNF5ZAzTP2ryS
         J38A==
X-Forwarded-Encrypted: i=1; AKwUvByBhSQWdIKCNnHxx5SSWcaa8PgvpZvKWHOzTv2nHiOg68bSj/BPammTPrXjWOqSe4+tlraE6IcBnTqEsXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3IEb9Efa+a4r79YATNj/pytXpYtKV42oUIJbSIKvaAqTFSqCh
	dxl4wSOi7TfuggAa+6RRPrzSDTEq1lJD3cdX7cUyqLyVQoukzSpK+U2my+RaCKLiLd/B4okWLvG
	qmH1qOPSiXaNPCoVpGY6x+lVlMXFWGNtuP56XIAjVI7+RiUxWSKbuTHUJ0SHOXjO5N+c=
X-Gm-Gg: AYBFou3NpZ8pZhTOJ57COoiF7RWI6M/SOPlLB3ML5fsaCTQeV4BFjal9S0HksGzxqxJ
	7UNR1xXWHfV5niojT/lPHitLSloIe2BmF8Qmh/BpKq4N6euQohgnX59e2/xXhTnZVptFgJZq+XF
	+NviMLi6dlUIdTe2qF3UtjzQlrO5b2C4jD1Tj2BsS0IwZ1Y+7lzobiNEoONFvDIDV1k3oCJnI/Q
	f9rp3iHVISs8KtB3QzbzD6H0kwwhndk4o9jCTt9+GmKk0zdjMRdBETFOdquNANKW1kqdBYCB7r8
	mqUbIaP7o8ET+Y0BtP0lzE2NOEiVxSsP2x+pwIFzI81/KroIi+9czVAELlTjHmVTe2CJpFk2Efj
	GbqKaIGhjJkBtw22a3ljfDC6duRHLjeRyLLSzXFTRogTObItidqlTu+rplA==
X-Received: by 2002:a05:701b:220e:b0:159:d448:dd1c with SMTP id a92af1059eb24-1825a67565cmr13293194c88.19.1792428414344;
        Mon, 19 Oct 2026 09:46:54 -0700 (PDT)
X-Received: by 2002:a05:701b:220e:b0:159:d448:dd1c with SMTP id a92af1059eb24-1825a67565cmr13293157c88.19.1792428413560;
        Mon, 19 Oct 2026 09:46:53 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm29699093c88.15.2026.10.19.09.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:46:52 -0700 (PDT)
Message-ID: <e98854af-f5a8-4c8b-98ad-9af673384f57@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:46:51 -0700
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
Subject: Re: [PATCH 0/4] wifi: ath11k/ath12k: validate firmware array lengths
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        kbuild test robot <lkp@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
References: <20261019100506.1915181-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261019100506.1915181-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX/u1J07/X6jLg
 hShLo5Ii4GsLekXXqwr1+Xtb+P0GCFXUekgp94o6l0p0acArdCtWxxcmx3V3HgSsPOMpVfuJvPd
 i+X1GuS7JKy8pYzXlaPqsKvYLWZH19A=
X-Proofpoint-ORIG-GUID: lmqDUyMMkCwI2KLO0nnu3HjiZOSKaJLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX0YYRfqvm/5/E
 JBSgYohUDDyty2q73PjzfZ7fKRivl/9s7A/XNMgc9AxqQ9T8LkqivBvWDiZiYpQD6/VSq1y+58Y
 kj30Jkt3MD+jtCWiDCbHVB1ZoRcSfv1lnHn9F56jq2LumXw4MdjRylVxtEjAq/hwEqG2a/ek1Dh
 btOH3vPOwQiVt9rkT3w3dggQNsQheWY3cFEMYoLpCKFMINcgmdTQqbSRirfPCtixtC8NTcrR2Fj
 zrhzxviQNYmrc0746KYdTleWQWJiM5KCNo1nXGjHf2NNTDvE/1UiJpXR+NtyOb5BY5eIGQQQ+3Z
 sSzDEq/jr0AjfyXl5iDgRthSPJscAFj2RsrTwicnT4BJRaqrB6nn1tSSgEuTYQZmhS/2TjX0w5s
 9Kt+wKfyz6xyNnuXtzeZtVdCD3kwC54MofsUXGWzdqzh1arbs0KbDN7PfzE3qQAx2mCMFmk9Q5o
 ITogFDSf/rtb1+sOvWg==
X-Proofpoint-GUID: lmqDUyMMkCwI2KLO0nnu3HjiZOSKaJLH
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad6497f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=SGwW7hRdeZfZbUOxcl4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190066

On 10/19/2026 3:05 AM, Jiale Yao wrote:
> ath11k and ath12k consume two firmware-provided arrays without fully
> validating their lengths. The service-ready-ext parser accepts fewer
> extended regulatory capability entries than the separately reported PHY
> count, while the ready-event parser trusts the reported extra MAC address
> count without checking the fixed-structure array length.
> 
> Malformed firmware data can therefore make both drivers read beyond the
> corresponding TLV arrays. Add matching validation to each driver before
> the arrays are indexed.
> 
> The four patches are independent and each addresses one parsing path in
> one driver.
> 
> Jiale Yao (4):
>   wifi: ath11k: validate extended regulatory capability count
>   wifi: ath12k: validate extended regulatory capability count
>   wifi: ath11k: validate ready event MAC address array length
>   wifi: ath12k: validate ready event MAC address array length
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 10 ++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.c | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 

(dropping obsolete codeaurora and quicinc addresses)

You seem to have sent two separate series. Which is the correct one to review?

And more importantly, where are the Tested-on: tags which indicate you
actually tested these changes on real hardware? There have been numerous LLM
inspired code changes lately, and some of them have caused regressions, so you
must test your changes on real hardware to be considered.

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/submittingpatches.html#tested-on-tag
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag

/jeff
