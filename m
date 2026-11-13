Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591564;
	b=opQ6sTHop2swCj1DOQYTr1EaazdSNsBw8LvncyNktzr+Xpr/04JwSk+eQ6ACq+TH3V3u
	 kfyKqPv5VIhklxt6jdmZqCNcVT7/J5IbY1PPwj6hSJ9Dv5zBAnKYDIEXItwI7lJgB4JdI
	 lyXO6U4xNkBSFlk2rBpxYgrnST+wkz1UQYJMBI336a+IZdo7UaJKJE0ZsWal0Sbf9GuOh
	 dEaagq+wlKtVTLPExQMa+/lZ9y9+vPduOzNdYmTRMNnRkwYf5ZKE0IGhhbCUxeRaXGTIB
	 nYvieiV+6l/el8Lz+CkQifei/qNibJYZoJSZKg83w13mEoMoVfTV/McvsZ06UBaUx6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591564;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DgYC/Shj+AnWGDzWfubZGcb4ncX/t5B6/82xucLJWBo=;
	b=V/ZnYTQymdKIODPc70vLrhGWdNvHyRGI1xrUAd/P/dQVr0MtyBPW5wYMAnWOqSkGlbnr
	 dbOycFLCwI6SYFwNAsV8H8zwzPfg3aBp94LT68k2/LfmOHriXiMdsgr/LiMyE/jmHPI3e
	 C+hfsGGbIO6dmLfnXRQqPi0EmCHpXwV2k6QJ7N9ISuaEk6Tizv/x0dayRiwkvUbLX2pTY
	 sj4qvovQYkclDVfUlzvZ2loRlEn1BRgojxRnSMYw8R6YNP/8DNpTSbBxzhvlPD0Cud709
	 7KW1AztvCmHNq2+p85E+mN6U4H11gK+hYgrcVCTdP9Jiw6+V1xOe/iLruDKn+cPMI+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C073yJYy;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A995F606D4AE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A995F606D4AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C073yJYy
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFiFKT3453491;
	Fri, 13 Nov 2026 17:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DgYC/S
	hj+AnWGDzWfubZGcb4ncX/t5B6/82xucLJWBo=; b=C073yJYyGrqEQLUD1T0R9Y
	v4Hsr7PJX9rPQR7ZF5x0GTyfUtMuGYtS4aGroYHRRA1xSmLRVQAFAUZqsFtDasqX
	q+TVpGGxtpSWvoo5oXgZ6/XSINQVkAW7dDq/xmzzp/Pz2/Bk36JNBY+34v6yRmFw
	Gr+fMG34nB31JgQBmIKnEXZzQE6opoBT2AeeoL56K+Q7nX+6sUNnGFSgQCZ6TByi
	sNwV6sS5B+hnNfXSDO0L6BlA86HrlA7Sx3xxPlTADogbOStUXPMivdYRRteQ3PX0
	Qd69ZlV3NWr+8ARYZwb6Q+h9itxlge4bA0ltsh0YGiXrBWSy5gYyyud1xnwjvpuQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsumvbk70-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 17:38:47 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFZ9qx2591951;
	Fri, 13 Nov 2026 17:38:47 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hwc0tdb4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 17:38:47 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ADHcCMC18743816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Nov 2026 17:38:12 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7419D58056;
	Fri, 13 Nov 2026 17:38:12 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73BD558052;
	Fri, 13 Nov 2026 17:38:08 +0000 (GMT)
Received: from [9.39.19.12] (unknown [9.39.19.12])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Nov 2026 17:38:08 +0000 (GMT)
Message-ID: <1044b867-fa18-4654-baf7-dd1e3a5562ef@linux.ibm.com>
Date: Fri, 13 Nov 2026 23:08:06 +0530
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
Subject: Re: [PATCH 1/8] powerpc/perf: mpc7450: Event 0x30d does not use the
 threshold
To: Matt Turner <mattst88@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com>
 <20261109-ppc32-perf-v1-1-a6e8a55b3b48@gmail.com>
Content-Language: en-US
From: Tanushree Shah <tshah@linux.ibm.com>
In-Reply-To: <20261109-ppc32-perf-v1-1-a6e8a55b3b48@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2OSBTYWx0ZWRfX1WjqdzGMhl+d
 dsLjorh3n9jYyPPd8+qGbreHjQlHg/ne6hVo0OK5mH72CNAOQnC8E5LgYYwwbxE+AQiepOMhGqD
 8lEkSCzy8iqpHlWD3yCZk3RZz414XYE=
X-Authority-Analysis: v=2.4 cv=GISdgeNK c=1 sm=1 tr=0 ts=6af74b27 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=hDsOEGxpxML-9HYuKHQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zRp01WlEldbXA00EmhnGquY-fwOzkQXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2OSBTYWx0ZWRfX9g79SpQM13CW
 dPW2fnRetwPCTplQan3x2yw2hnKUfy7D/8joJG750/1W8eMc4+xjixEjrOoAQa6dqFJmKkGWPd1
 8qea7FeO7lX5y163+fF5+RnDIgAvghT5TXA5bNoHqFURM22ZMmbN6I6sIoOn6GM+/IYkurZqiPI
 bEy3rl/ohZ6Teocy0EGEGwX9wYV0xpwloem/4Ud3toF6FVJf5P5dWppuKS8epgtbRODOk9brcKd
 CuAez2MljpKib0UnVxkXRTnVaA2wedOPi2Rd7RjoqhbtKgWAXU6YaZ8XgdPQjwLuwTVDm42vkOr
 SrTb7hDB+qmmlsKGBmyuHtoO1m8vVdbJFNKpLZQlLIN6I7/pZtyt0XhztIKBLKywWAHiozrS5Cp
 UJqwaceDfdHQGksCXDI9aIFSM8ZAQQwGB0PLyZcsm4YsypX/Ot3GxVcLzu6CbOxIg7l9CcZv4Ax
 aJaMX+au8BFMWiudnYA==
X-Proofpoint-ORIG-GUID: 6OtaJej2DiWzj4lLA2YIq5wssIsFOIqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130069


On 11/10/26 7:17 AM, Matt Turner wrote:
> mpc7450_threshold_use() reports event 0x30d (PMC3 select 13, FPR issue
> queue entries) as using MMCR0[THRESHOLD], and the comment above it marks
> the event with a question mark.  The manual (MPC7450UM Rev. 5, Table
> 11-11) says the event counts the valid FPR issue queue entries each
> cycle, with no threshold.  PMC3 select 12, the GPR rename buffer event
> next to it, is the one that uses the threshold.
>
> The only effect is that r30d cannot be counted together with a threshold
> event that uses a different threshold.  Drop it from the list.
>
> Fixes: 7325927e5a20 ("perf_counter: powerpc: Add processor back-end for MPC7450 family")
> Signed-off-by: Matt Turner <mattst88@gmail.com>
Hi Matt,

I checked Table 11-11 in the manual: PMC3 select 13 (0x30d) counts valid
FPR issue queue entries every cycle and has no threshold. On PMC3 only
select 12 (0x30c) and select 17 (0x311) use MMCR0[THRESHOLD]. That
matches with the code change.

Reviewed-by: Tanushree Shah <tshah@linux.ibm.com>


Thanks
Tanushree Shah
> ---
>   arch/powerpc/perf/mpc7450-pmu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
> index db451b9aac35..564f6dac3a00 100644
> --- a/arch/powerpc/perf/mpc7450-pmu.c
> +++ b/arch/powerpc/perf/mpc7450-pmu.c
> @@ -65,7 +65,6 @@ static int mpc7450_classify_event(u32 event)
>    *	12b	Y	PM_LD_MISS_EXCEED_L1_CYC
>    *	220	N	PM_CQ_EXCEED_CYC
>    *	30c	N	PM_GPR_RB_EXCEED_CYC
> - *	30d	?	PM_FPR_IQ_EXCEED_CYC ?
>    *	311	Y	PM_ITLB_SEARCH_EXCEED
>    *	410	N	PM_GPR_IQ_EXCEED_CYC
>    */
> @@ -92,7 +91,7 @@ static int mpc7450_threshold_use(u32 event)
>   			return 1;
>   		break;
>   	case 3:
> -		if (sel == 0xc || sel == 0xd)
> +		if (sel == 0xc)
>   			return 1;
>   		if (sel == 0x11)
>   			return 2;
>
