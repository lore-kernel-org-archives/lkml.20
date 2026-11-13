Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596124;
	b=GjFN9n0YZOqQ51XBbm6sb8Ytv4xssLZx2FyKwsQ+1HFsN7x+OsoX/BP2kDgCmIVJJj8d
	 qzNZTHRxMRPJOebIN+zZp1Ffal0uqgpdN78JLl6g9755Vbpq0C6yZispKBlZ09b7uZIHT
	 FCoG0eIJEsTdpTXKVTBS7F2NYxYH30B3XfZpZpOTukcmLoooA7/FSraxmWb/EeIMzFGFq
	 /NxuyRKbpAsOk3llZYyJc4WQ0HUZPuLI8xfxFBXksSH7smvfuFQrod7knKMVW1hXyGDq3
	 v8PeS8O6NxoVjGm9ET7NOqajIhRaYaHOYVWPispeqbu+rNNvVa7otgRMF4HXv0N4kTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
	b=w+3GLrn1C2irf4UtP+yy00szrOWfohogVsyWiIPyNzNY8gYWCuK1eOIqNSjl5PCyuJKb
	 XbAALpuAWhwjWv/jZ0CVpy8wUOIXzxjRjKXSUZhrnybq2A7Fb0TGIBdRmEuSdJv2v6end
	 pB4N9r+boQD52RfPLkgmnQRzpr+II3nImZpVS0T235v+CGw3aN0risHQD3AZx3KQhsIPK
	 NqjoOGnnq3t9lGRz9VP7712M7/In4ZNFA5/VplYgFPkQURjDy8c/15vDn1AI+fv+vgPvp
	 86YkdzBexn0QRjRKaSFCBib5O0xmAP7bhEABfbYWxlktirIkcSHkmsh8+INSu9p+J0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+cBIRvS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWTyaMqm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B366F606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B366F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+cBIRvS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CWTyaMqm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRSXc3296060
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=; b=C+cBIRvSaqDUF3L4
	ReZv7t9bjfGKXoNLE7GVOKof3PhMZfKpDZeV5rcihTts1ZwGaWvLCUHIzGZOEmFs
	b18YgMlyzdJ7pCrMscmqer9313Kg1RozSqdaLJ4Qj0e7BmyJ+TZSBWh/TORi/YFI
	UjtGakuvm4GWxp7aUBMZIWroIb2atPMmpAIzyWbN2P769tGzfUZSKaF1i+pnLsLl
	IQmt79HNWULC4yGXZB4eWSupvNBufWY4DmmvhwpLdeYV4kkDPodUwEbbhiNGZdp/
	9Lr8SWUm1Uxe8MntKszFWGjiuLv0NdiaEdhFjz4Ugr02lDL3KxEhHJNTBxIVSgfQ
	VFpGTA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6tpyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:55:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-378722fd4a3so1504484eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596122; x=1795200922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
        b=CWTyaMqmzK0bVdjoRMo46ftLqI+XZLEPfZwKW7d1q7oedE+ctWPGP0BPXeYdv7FYnI
         u9ehNOOnJJ+7LicB8EYgL7xtJP3Pu4UUyZOyQ82NyFZX2oXne+3CQIiR5AcQLw+7gny9
         BfS0qxz4AEEayISpyFeydg9p3+krj8x0xUy6xeYi/hKjdj3SoNbPisTYpgRoOaE0Eckk
         bbSM+tC1JCxvCpkiW23NbWPrFZrRWB/wlIEWPb0PBxUHYg589zKbtzEK8vYRfogJD7wu
         OZUPjuNQqdYFcrxwvh5Cz7RqnzcBqbuiD1MhcaAFg2AviPNKtyFjLwdwRT2fUDDZiMg5
         Q0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596122; x=1795200922;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
        b=ReVdimdJH/oj9jSekHont57raPbBFBgiCyRV/IOY1fYcT8rHchpuOQI/x1d+FGR27P
         MA+NxJfxRRybFZ+am7Zy3C3SHxzfXuxvNjcBCqSa+s8+s4pF62iTmgr/hzE3llC8jhQa
         J2JIfCGtNagclXXTUAucLZUBOk0bbSxHPQd8wF4bDM/R3qwQaIbsPuqSO4OVKskidEHY
         glsQ1shNAIdarL/SHZssl/Wt0dAUY0N0r0dKsst16r3kYWtjKumQRBp+KzFYj5zu2G4W
         mBQgT7T+Gy+GGG6CgYbpGoCD2OO5Ly5m36rTRQ6q96LYigUf4IrHma6HiN9DrWA9TWit
         W3FQ==
X-Forwarded-Encrypted: i=1; AL+hErF1jWH1g+WBKqksOTcLOR/sXEMNAqowi/l/q/XMfwWQZecnhz+Idad0lsFy5YcJAUmBpmOU9wTKzuBI+1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PSjtTP+5wvRCPGcmB02kl6+P7LGs6t9e1JQfOOeY37hTg2LCS
	kbtzpEV1rr64kjNG+WD4wbQ+LHezpbEIebfl1GhGlvs/O60PFmYataWX1r4yTmp36pUjZLrA7Ie
	0WFt+Lr9cHgUiPl4sGWs+gJu1OA37OM42S9ovJVXFSc3wCVSZtzzTOOhRApyX9yHXmn0=
X-Gm-Gg: AYBFou2+i9c2n+sSM+vjz3vkdmKorY+m1ZIYG4P1p8Xas6YR49wKy9mbWOOjew5/nWS
	d7alPK+wd/eJKPx09i483oLsNdPn6y18/Wzc5jTtPF2NxsHi1+PVqGNecAejrQgIvAnhAJsi8HV
	ukdjJO91mQrAullU6hV4VWk+WzeawKAJ399SD8ECxhTfCcMJCf/jJ2X3ZER/m3BuzX0Is80wRJa
	gAYlT03HeWUYsyRZTB2vDb6RInN/kQ6f9lm2KHVMXqmu8RVj9YkdDWYutOvA0mDKpSdjg/7A6Cn
	sdWJbSugckbn2iDwfzh9bk/27XQiNlG/46uDSygNxTrn7l2+d/kVb3d2j/qamG4AshCM61O0JVd
	3w6EdI7ZqzLu1m7MFzJ1tReQ9UKB+4fCluLFWQefncyRuVIU5dYqObKnnhgY0iMwJbJ4/xS4tBd
	u3YhuS+z5qDkYlqVin
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr3191967eec.25.1794596121581;
        Fri, 13 Nov 2026 10:55:21 -0800 (PST)
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr3191946eec.25.1794596120993;
        Fri, 13 Nov 2026 10:55:20 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm17585787eec.20.2026.11.13.10.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:55:20 -0800 (PST)
Message-ID: <03e7af46-7fcd-445e-9210-395bbb8b5410@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:25:16 +0530
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
Subject: Re: [PATCH v2 0/2] wifi: ath: simplify copying a peer's PPE
 thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX0bQSWazaW7cd
 6xEzxsfNJJO9bFa4/X7tr1z3qgGCuLeQhe1bIV0OtLZI7Au5EaDsLKdcXYrtG7g4CukGHwwxjIC
 CWmje9TfO9++zqBKjmdfrFhAT+CaPQ82GGgRsGQNIXHC1twMEPy6cd5XKBXR6tutPcCyWyBaHFQ
 PBYSoOWlwB0PH7yNVzoFL72txXuQaRcBT6QAEBDuua5Ce5MKhwkbLcTrGcjmtpGPeS5I1GTOZxp
 gI8V7e18tsLDqRrL24s2LmYD1KRZK9GRysvZu+1Q6ZGu4m1iHaktWfyhtzOZrAhlZZ98+E4DdTA
 U4bjKosgzvC0mlqsIXYhKwRHgnrPRBWwCceKfvh0BAKSzYze1lHOKqeDyRXP78yqif9JQEM1CX+
 V1ewatQTW6XXeLX9eFbbRuWkesjRpt6IJz4EYP2npttchs4y6mGWAeoI1zBpDgDzlB6N7KvBm6a
 IjGJKRzi0xwAjUifPsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX9+/2CPGMR30E
 CEx+SUWHftRVigpwPb9C4mpuW1hHQr99gHPE8Ik0wOMH0Eaxy0HAH+mpzSOCukzRr1rWg8DxyRA
 8tdTKB/2CdbETjfQtCbVJhi+CutKHf8=
X-Proofpoint-GUID: 3yTiCuidzqiMVZ8CkTIr6h7Qe4LDFq16
X-Proofpoint-ORIG-GUID: 3yTiCuidzqiMVZ8CkTIr6h7Qe4LDFq16
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af75d1a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=_siAQXIdv8hbVOeHdhMA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

On 11/10/2026 8:07 PM, Christopher Griffin via B4 Relay wrote:
> Rameshkumar suggested this while reviewing the PPE threshold bit-order
> fix [1]: the loop that copies a peer's PPE thresholds into the WMI
> layout shifts each bit in from the top, where it can put it in place.
> ath11k and ath12k carry the same loop, so one patch each. No functional
> change; the patches don't depend on the bit-order series.
> 
> Compile tested only (W=1, both drivers). A userspace copy of the old
> and the new loop gives the same output for every 6-bit value in every
> RU slot.
> 
> The patches, this letter and that test were written with Claude, an AI
> coding assistant.
> 
> [1] https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/
> 
> ---
> Changes in v2:
> - Dropped the paragraph about the equivalence test from both changelogs
>    (Rameshkumar).
> - Kept the one-line note on AI use in the changelogs:
>    Documentation/process/generated-content.rst asks for it in changelogs
>    and cover letters.
> - Rebased on ath-next.
> - Link to v1: https://patch.msgid.link/20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com
> 
> ---
> Christopher Griffin (2):
>        wifi: ath11k: simplify copying a peer's PPE thresholds
>        wifi: ath12k: simplify copying a peer's PPE thresholds
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   drivers/net/wireless/ath/ath12k/mac.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> ---
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
> change-id: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
