Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398356;
	b=q4fg+zTWz84aHv97Otk+jR97KiNP3shOsw235oY3doz/m58ISIHfYaRabFG8mrFcahR5
	 fEp5bSdSQF7XZlPYaPOIIxR2uFoKtzHcC4/MDdnw4dhVFz7j2D62FQX2GIHlLZjXmDqZy
	 sUHYC85kl55VRYyu/lZfbXcvUuz3Emo3gHq70R/bUDTCRQCS7+Cmpu3LbGOpOCzwy0zEu
	 WVMKZ/dnUwz1SklVGIVYM4VILxmsTVOBibblplulUVqRxWhnIzx9+v5DG0vr6wnqPI7pq
	 BuNWz10VhWhl3/6iirWiSCN/nPLWsWZsPzlu37BJmnSBtTMIUxHLrSstlAGefONzXDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jxktCGBv+V3up5CY+FTdp8kWijHXM0fZDe1PzaZ3SIc=;
	b=CdBztFsBaKxpqwA3bGfFciIJv5xPkKbwIAtlkTPrP5lSzjN+E32lqbABScyRYaQYYxlX
	 0ox2/kDg51GZ9VK3/y33dkyEGkDm+M+RElFt0wPe1k/kzqvOnusPpBXLdaPmEYChsSW8/
	 9PAk4RO2L3AiMoU8ygPvAHQBJN2yLDjNQnVwyKlksWRgfzSgPK8xXyhvT2AJC8GPQqF/c
	 qHI3WDCEey0rNNNPL9/1armwduXOlQIMUddFWAktA/PVn1GQ0TW0CChJnx8a3JPq2Uuz5
	 2gi2CO/l2C/22MQQETYKN3ScQLzC4Aee9zjm3nLylnj1DBhsYi8yI2k9cmf03gb7sSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FGoov2HK;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0081060A2605
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0081060A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FGoov2HK
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5i8BO285027;
	Wed, 11 Nov 2026 11:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jxktCG
	Bv+V3up5CY+FTdp8kWijHXM0fZDe1PzaZ3SIc=; b=FGoov2HKeChADTZqnp4Ceh
	HIgIfh09/t3IQrUqRusNnd3SX3weONdLfm1gB9RxADvCe2lJR29+IaPUCMbFfR6E
	LFqVERIlVY3IilSHwmIQsatP8MUkYjKRTHaKvb9ozYM2osT3OHjKaVLG4nEMeqB+
	Drk8INoi64uc6AoX4+KCfjl2cAOVvu6F6hC8P4keSjAYfTxIQ7sGB7NYNpKRwiKv
	b6fxOL2q2EfqbjuKxto1u2MNjjdVFta6D/afYj2XlvySpLDhURVKUNZNtMF3ARoX
	Tcq+aol3+oSsflEjniWKvkRa8VdHu008TuajyZf2q5EwIoEoBqRmL814DXaeFXFQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsuq71ywt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:58:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAP3Ox2859525;
	Wed, 11 Nov 2026 11:58:34 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hv309ma9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:58:34 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ABBwXN326280498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Nov 2026 11:58:33 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9570B58059;
	Wed, 11 Nov 2026 11:58:33 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58F4D58055;
	Wed, 11 Nov 2026 11:58:30 +0000 (GMT)
Received: from [9.43.120.194] (unknown [9.43.120.194])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Nov 2026 11:58:30 +0000 (GMT)
Message-ID: <371108c3-0314-4015-9ca4-d96a11f1e597@linux.ibm.com>
Date: Wed, 11 Nov 2026 17:28:28 +0530
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
Subject: Re: [PATCH] powerpc32/modules: Reserve a PLT entry for
 ftrace_regs_caller
To: Bradley Morgan <bradley.morgan@linux.dev>, ritesh.list@gmail.com
Cc: brads@mainlining.org, chleroy@kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        sshegde@linux.ibm.com
References: <80D9FEB3-9FB3-4878-BC66-74C13761CC9A@linux.dev>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <80D9FEB3-9FB3-4878-BC66-74C13761CC9A@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfX3qV1DL2OHVag
 Zqlb9DqDPD0lGP/BWR/tRUCm1seYIO+NPpoII8OF5335q/E6h3wUlm80jRDw68/v5R6cde18T67
 ZsJtEI4R8nyRAXnVIySWxAoBNSgt0Yw=
X-Authority-Analysis: v=2.4 cv=HbCB3SE8 c=1 sm=1 tr=0 ts=6af4586b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=pGLkceISAAAA:8
 a=OuZLqq7tAAAA:8 a=VwQbUJbxAAAA:8 a=FkolyUzucbp6SESKabkA:9 a=QEXdDO2ut3YA:10
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: 6jB0qBBVKKLf_LWT1BYIJF81JuJJB3kG
X-Proofpoint-GUID: ecDCVwa_RUsimFmT9_CUwxKBP-_SYvyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NiBTYWx0ZWRfXxt2F+2/kQ+tU
 1VJJg2l/Orp7U/RosHTb45Y5vmws0yiv/AdkCvVvMQua0exK+OUI/Yf7RbL+PbPmEuLKuvzduuU
 ujZ1NqxQZjsx4JDnWTUvHPkU2dMvYTxDc23MY8Xqyto1E9m13dnyAvGDIMzTLqQ8q6vYqGGh1Kd
 r7qEnWJ5sODIa00PzVaKBuqKEv3YS+bQX7/dj1IvydYqcMop+6gI7ZWXIcXt5XHUqJ5kBQEhpvE
 btNhvzhkHLgCTrXqK8MjNL5LAaAzPISRDr+tfys6Jhu3nsGKZ0QtKdJaZmsDy6Ft5Ye8myX7qFV
 FcwCWvgcccqescpi+fSW7dsU6r33FJKXznmWeOr6sFK2tZI283aRyySvu89z9H3wyBO4UnfcCJc
 sXIPLRzMsVl0zWzBg1M0AgvaKKWZZGaHcRrHyee+hLFcFzVI4xfoyNEzS71ce0/QeMvr72qnn14
 /fL7jkKV2fw2aAXhsmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110046


On 11/11/26 12:58 PM, Bradley Morgan wrote:
> On 11 November 2026 03:48:41 GMT, Ritesh Harjani <ritesh.list@gmail.com>
> wrote:
>> Bradley Morgan <brads@mainlining.org> writes:
>>
>>> Commit 7dfbfb87c243 ("powerpc/ftrace: Activate
>>> HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32") made count_relocs()
>>> undercount the PLT entries the loader
>>> consumes: module_finalize_ftrace() now creates two trampolines
>>> (mod->arch.tramp for ftrace_caller() and mod->arch.tramp_regs for
>>> ftrace_regs_caller()), while count_relocs() reserves only one entry
>>> for ftrace.
>>>
>>> So the core .plt ends up one ppc_plt_entry (16 bytes) short. The
>>> walk in do_plt_call() scans for a free slot with
>>> "while (entry->jump[0])" and has no bound check, so once the last
>>> reserved slot is used up, the walk steps past the end of the section
>>> and patch_instruction() writes the 4-instruction trampoline into
>>> whatever module memory follows the .plt.
>>>
>>> Count the second entry, mirroring what module_64.c does for the same
>>> pair of stubs.
>>>
>>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>>> ---
>>>   arch/powerpc/kernel/module_32.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>> Do we also need fixes and stable tag here?
>>
>> Fixes: 7dfbfb87c243 ("powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32")
>> Cc: stable@vger.kernel.org
> Hmm.. could the merger add that? If anyone merges.. :(
planned to be part of my fixes PR and will add it.
Thanks for the fix.

Maddy
>>
>> -ritesh
>>
> --- Thanks!
