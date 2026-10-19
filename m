Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433819;
	b=ESLSQKQOW3OUEtjzDl4uuLBbxmWfObh/UT79v0lcNBPokgKpaW07Wwf6WSgC1vHU8Q99
	 kRpUgx1zASEIWE8g17dBy81K9NfjyDNiqDk9C5RfrcvXSKJYvcS29kC6j7FKAYMdPnKmt
	 y2hjukqG5RrMowaXMEn2e3vszCKlljY07jqWKXf573WY56Sy8ptvMC+3VhlL/EUlRv3Ti
	 QKqVM8oHJ+C5DG9kDcGwJzBd9sbGDb02YlJOxAWlX2og8NV3WAMaML3e8hrIyhnPklFdX
	 WUYWRn2C12cZ4ueWKesjdrNY6PHzHsU8/dWFV0tNPJi28/OH01YK30yPcXNSBtz+9xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ME3cN6VotEvPOysbvIMmDJdPx2UppASZcvsxt09CPAs=;
	b=2S9gU2X4vCezV0JJZvKYDZXwSoI2Ji62vIdajS+J1CKgXeRXEAF3LR20nfok2wbOOANH
	 lCDurbwyJeWHvJK3n8rej5eXRWrQWr1uS8Lm4vAPiybnrhKLfUlu/f80BO8qjYEUqk+Vo
	 fhBv5GBRD34WPjUfxT+lxXXTqqjPNxCTlBD/TiPmv0G2wTZyrLj+t5YcTVZQKeUSoVv/E
	 J8rl29yOGqaWB9E8l34bK5LqXZPJ8qcYKr+6WtkfwqLCu/dRxlrM47S3J55TF2OlD5iBJ
	 aDlEgcoh8awULuWtKJwVvoQfu68Zk9hle/MnQBqb7bsyCsxsuvAUuVXpfHd7vFTU5Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=axJNuqcB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKA4jN6E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10391606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10391606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=axJNuqcB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKA4jN6E
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JI7qYO3952300
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ME3cN6VotEvPOysbvIMmDJdPx2UppASZcvsxt09CPAs=; b=axJNuqcBJaHuVjYQ
	E2h2efGauM/+beb5rqtHhYdH2yfr4LDBETXMtNNTpsMcVxu/zV05WGsZErrGlF2K
	NBqWn4pGclrsQMKQT01KPyg2s68U4YtSd1vuXPf+6DGhimC9elShCu9c9uVj9229
	EqdIyf7P0mrR/shsMGcnyBRoWwOigvjtNRtqzesSIyu8b5KIQQ3qkVI83ScRwGg4
	MPQQ3D5/PraMeXaZxgKr8btYTr59ASH+gNhYPOZIAKqiHsj0TUvs7DAoFTrl+aWh
	NfLf97PMAoG84chGn+yYASVlJ/nMX+WXb+8FbDTtE+cRVje7e8ByDlHd/ssalKut
	LKhjwg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdr78019b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:16:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso6232678eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792433817; x=1793038617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ME3cN6VotEvPOysbvIMmDJdPx2UppASZcvsxt09CPAs=;
        b=gKA4jN6EJNVtIogRpKum9XVekD/YYQ49C56OGNYX38VEbAWu2ennj+hRumPbXwC18a
         DPxwNMxRFHH0z2rcmY/51rIHYb8XxsnSQSPaMpMzJ6/jkvO9jlV3T/nCiJ2kF35gDJ8y
         LdmUyIpvD87FV7gYmdTghWaXVxZKjugURJ0OUUFueIndKwjCyomXISOGX/b9qbadnEyV
         XBl/uhnttKv+jD4DYAFwOnKIgdsIlIuNGSrY9rOLTyexwqOCEj7+wY4BMBHKxdwMqdoZ
         vitJlTzyBnO49RriKP+HGMxLkjsgUAWQYtI6sfug+U3UlyBLaGbmGDnP7RN7sy98lECv
         nMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433817; x=1793038617;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ME3cN6VotEvPOysbvIMmDJdPx2UppASZcvsxt09CPAs=;
        b=ZZ0mkN7KrHDRByNKw88g/urpE7SxexZ0FAQdALPDIqpVoVh/dsHCLV2IXMINqimNFw
         vAfDGghY18NzB9vSuDS9jMrvA3lcE9SYQ8Sgtg/g43/PuwudpneKvYb39bLEROE3Qh6G
         AL6aYJuM5f6rxQMCr/C7J5XofbWuMQ24cbddRrixHvpnODYA8KUTC7fpL6Daq6LDP+yn
         PqtGHplY8/MNaKYLxWdBWaMDkPZRVtnFt9/6HuW1R0KmgNWzcdtL1U3Ps21bVu+Zpa6X
         vXTJ//YrA9JEZk6Fng0weg/z7cyiDt7Iclhg+tgF/k/wLXAg2pPo1DQxo+cWA/bTi8JY
         FMvQ==
X-Gm-Message-State: AFq9FYI0UVLUz6ccSPgknrpyHFfWz3fiDFKbB8QTk599V19E2rKfe9jX
	qtCtRVwYA9g/gAESe77a1jND/bRVHR3nkXZll/go4Z66nX7vzP+z9asmXcVryspIfNe2e+fqxaV
	S2cdlKHAI9+BPSbM8Wx9ANFpPalY5e7wxXGGfZ928GclTZhfXg/KQwNhkVKHAwVlI718=
X-Gm-Gg: AYBFou1ZIM6UdOG3FscagVvbnEYJSudxwqXLoiIg3TcoiYb44G/uGwvzelJ2asui5/c
	tcW0SpfrR0eu8Nj10B7l5wluza1thpTyPwOOQLuCQRDLAF/OeHWjadH11H6Wg3lnXgfzSvYxVdf
	O7GkNLAnd1vkUS14hJs0zY5s4XeBZQmUaAzAsOKyLCj0j1Uv/qWrPv3lZv8Cvw1RK7/1+dOc/YC
	fkIbOD7j/eDBR8bH+UuYWkNfbE9zbaGyNT9P57ZGqOvQ4A5QzBdlkiO2nrkKvBdt0xPW1PrF0+r
	C0WOeb5qYIePVAhXqfU9PRHYc9N8zTZuL6RfC0Z2sCvKRYyvOyvEdok+BXCKhB7UVvAiBf8hWUS
	5Gpbupv6sTE27mCRIrWITp0eqg0B5jdEOWo/ehI9DFQ==
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id 5a478bee46e88-361a2e3d3abmr11081718eec.39.1792433816859;
        Mon, 19 Oct 2026 11:16:56 -0700 (PDT)
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id 5a478bee46e88-361a2e3d3abmr11081665eec.39.1792433816173;
        Mon, 19 Oct 2026 11:16:56 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm32477142eec.29.2026.10.19.11.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:16:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:16:48 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark
 Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov
 <bp@alien8.de>,
        Hanjun Guo <guohanjun@huawei.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        Maciej
 Wieczor-Retman <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M.
 De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao
 <leitao@debian.org>, Dan Williams <djbw@kernel.org>,
        Terry Bowman
 <terry.bowman@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 2/6] cper: add Memory Error Section 2 structures
Message-ID: <20261019111648.00006fe3@oss.qualcomm.com>
In-Reply-To: <20261019145643.1877246-3-pierre.gondois@arm.com>
References: <20261019145643.1877246-1-pierre.gondois@arm.com>
	<20261019145643.1877246-3-pierre.gondois@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3MiBTYWx0ZWRfX8PDqlbaFYkrv
 GLTNEXHRYZ0i+5hb9Plm4lO3HOjzgcpfXBAEs+63NFa4/1tDq1lDfOrTHBElIcwctoLAbCWPDgc
 RVXHrmsqZoeO9FVot3oj5c8JOQhqTANGr5/Xw20H1LJZWuatBcr+lIWUMODimETOkh6YpTLNb36
 XYVyi6lV73zrikXPr4JqFBMQFEv2v4SxJ7W+WatQl2axjHJoos+5mgPkyfq4xGLHytZGawbGTiZ
 0fJTXrUzonOGGmEdwhRRfJbISvAyE0dZf+lCyE3a0a4dJMi/QcnYp39rXAj2yV3rXQM+sUPM3Aj
 yUkkpDtG/5DsGGLdt1WVZdYn/PErv78KkVQIu3HY7RyMEOtELkzYFL7M/eCMtAm1TjNTMX9lh7w
 7x82GQtdcWT1M1cQFE8Rd9n3jec7xQXWKmbIn65sP1uCF0j/3Z+D9zKiw/81K58RkYV6GKT/sGV
 lFFvJcnszowEw1bO7Sw==
X-Proofpoint-GUID: lP6XgSEaUpCEsNc21_YKrLfS7tjkJTSc
X-Authority-Analysis: v=2.4 cv=LKnz05W9 c=1 sm=1 tr=0 ts=6ad65e99 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=D-Xi6Kjd_1bfK2TynAAA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3MiBTYWx0ZWRfX66lrTRbxZsA2
 xeQWQ5OS9QXuOk1QfjPOgSE+FPP7CF3WC1RvSF59ybkasAWnfmVjlnu2pI2ZcRVd5qGdaCNuCPl
 7CjoRwNpOdRY04aJUo7ITfKxwXPj03Q=
X-Proofpoint-ORIG-GUID: lP6XgSEaUpCEsNc21_YKrLfS7tjkJTSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190072

On Mon, 19 Oct 2026 16:56:09 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Add CPER Memory Error Section 2 definitions to the CPER headers.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Checked against spec and the couple of commented names
that differ make sense to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
