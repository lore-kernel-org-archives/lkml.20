Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757759;
	b=l7bZSSjt3m0Eo5au0hmHXAEGkrCfQSnsrh1T0H/kzUNatclhLPD078aqCtbO8WojOAjI
	 JG+J4n3ha5tRFeGW1/WCQg/LZo3N9jYfNlkDXMmzcnxVVoS23ZcGbiISVXSC72skjX/Sd
	 rFFaoLWPM5c3w82J1n7e81RbQTfARC1/LJUJ30b8KO70yn6jG17cb1efMi8qB1DBnzzmb
	 M7VSTSkwpS5XfO6OKA3SxD64OMO5mNrDIzgoxdSQWWI3q3hJCAiDxNk10icepRZts4Ase
	 9QL6SIen23Bap1sYyp6RfgnqgEv8MYjj7a1pZZh8Ytg8aBMHnko0WQzrJRron6h5uoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=32vAGZ/a1y3hLPzftJbPpOIZU7el/7vO9DaLkQmD4nw=;
	b=ng0ddJXb1THa/+IL60DtNjAMXp4PVzmw7DpbHOD5mmruaYEO6oxio0rRreCMbX8Nd9/H
	 xoKFLuNaKtDl3Z+FA5tZyMkOHwLaWCu+nIeYel2Ve3EzT3h8pwjR9vvI9YRnxTUhNnhFL
	 MaiJ5kS3p7CIEvyBOHYvRyrP3Eqkv9MVWVo3iqk6IJto2vlKvAurgyFZNVE/1g2d6wYEK
	 WTA0FqppRGObK0xlo6MxsDPn57Plfxu6bFWlu33tkdENkGnZlfHXJuclr2GghzwQYZJWI
	 r5PG0AuEAbYuD4QEyyVV9EXdn9htcRZ3ZEUuXt96fmEuV2Mwd/8pP+QeO1f6m/hgDBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DBCtrizy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D/tNRtDn";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04C7606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04C7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DBCtrizy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D/tNRtDn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RFtM1248580
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 02:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32vAGZ/a1y3hLPzftJbPpOIZU7el/7vO9DaLkQmD4nw=; b=DBCtrizyk7dRQcIa
	g/gOru9rbw3+nT+/G6I9DUmyBcS5kkTXOh/Fzir4LPv1ihThiAHTPM2i3kQUYxo5
	OZi/Mx1M7ZkJANh+CvNJIDVSeUO6T7wwpkUMphEPntHSoypOiiIZUKBbzJ4ql4L8
	X5DjOkGbPv4oHZT3TMFuVDpFO54AUsHA4pU+gqnFOVsRTr5W97yyoGRWuhcVf7rf
	ZAPTmpVPykmHBSCecHL+TIEj5Kom0olIVs0CBpZd7+XhJEryUxlIV+KxfA0IYEra
	7u0UFZe4Arrg6q6OE30A50zewiIYdX8P3uJL9PQYSU4NkxUGYleCdS2BRvTuKggB
	DiMGCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuv90sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:02:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so280036a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793757757; x=1794362557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=32vAGZ/a1y3hLPzftJbPpOIZU7el/7vO9DaLkQmD4nw=;
        b=D/tNRtDnvxNRwuVXe6dKiEpc6QU/8tSRx74n/CdKuWH+VAnnH/l5QSeq7w10fKumCH
         zuSvZLRwofqh5GihDnHoe03QFg6g73rdVoUs6VGx4tCahVp+y5U+Px2nWZ+K6YZpooOX
         0Yk53kLnpGdG4m1U+eBwblmUo5FPc64wJUVN6tsQB7eUySBBRymKZ7pWJbz9BAmy23LK
         pS4yrbPMLiPqjmZ46Xen485xUCqpEIEKKX9dyKxQqly6UpQYG9JSlFkhrRoouMzBRvgm
         ubvLe3UaW2ZQ73LCxUX3eZ4oAIVkO56gzWWdekz6e/GxdAHSOdGoOcM7bkDY6CZ81iW3
         mhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793757757; x=1794362557;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32vAGZ/a1y3hLPzftJbPpOIZU7el/7vO9DaLkQmD4nw=;
        b=P/GGWFrJWDtEgFAEDktLOkFJT2p3F5l+xjmq/+uJKDOZvkLA9J9S5kPHy6lrrDd91v
         kw5yUWHFhGbIdMIEvJwGNLf3XtebTwW4UUTLX4JSc2rIr7rZ2j7qoQ2uKwzY4Y2fRkvn
         wl+zVTphh+wIITI4Umpj+7balQ8re9rXp+Vu9lUZ/uSJeTlCofGm2AtBjesOvnkTbY21
         0qMPGe1GwgVj8uCehncXzKG6eNJt4ioBIxSAzagaKsGN8rjqSwnSQDZx/mUGg/mz0zeG
         djenqU/9S47AUV+KhfjpnZLRb7C58r9vpBAEpa6fTW5fJfqDBBI9f2g2At6qjPy7ZRu+
         jkSA==
X-Forwarded-Encrypted: i=1; AKwUvByGvTh6vT1/9oCoSK31Hg8CEu1JIru2AkXGkUVS3EumDie1UFhiy4ArGDyGJjQSFrU6AGNCYVY22bKHoGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nEP/bO0+YLntlt6TVa8DVvy1cpjgzMQSVwHy473CVRki5HcAn
	cdI362jxTccb0UUEUM02d/YGP8usyU6UC/BnvLHErB3yWXtnpE/mUlCaSIfHuxJ2VQKeFO6F+1F
	WJp0wt9xu0limB3ATnvRmerEWQt41BnAMc9jCVD2hMhiqKrkAtWX+kyZlDGOknIz0L7I=
X-Gm-Gg: AYBFou0YkLNpI6NVJGGw7znSu+0PridMKiefy4/q0hQ4iBoarLHnTtYfa/GqKP5ujls
	WuG5irwhc5lDyvg5xdoVZhoDlGSKA/lQU7L87h1KRy/ml1dP5xGxp1iXX/fhw3j+rvXEMxono/0
	ZtR/FIgXJ6J5ud9BzwBeA88lzae+l7wbMrQvOdJklUB8Pp4tYmx2ORc84bVj8Mxe6cbG73S3XXO
	WRrHLok55nMS36fYp0kYJfnmUPH77rllkCyhWz7FUEb34y/2N/BuO8IQNowp5DRF7jUJhU2DHdl
	ltuRX/PsyldlZaqH6gP5oLGHglshkIaG9J/Xsm3o8z0aQGnkWZBOG21hGSkmaKJgp6DkCS2b2xQ
	kwz1GYVIn0G+BvpWk7XeMlAvFxXFGxINTUNy3+IEohnnfQP+Et1Dz6+tkd0mz9M9NNbc/NtFNoY
	e4aJwgnUFxbLOtJO5kGKkXyYgyCTwgDrdlW2Biu25Ot6mC
X-Received: by 2002:a17:90a:8398:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b0998422c1mr266157a91.11.1793757757199;
        Tue, 03 Nov 2026 18:02:37 -0800 (PST)
X-Received: by 2002:a17:90a:8398:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b0998422c1mr266144a91.11.1793757756626;
        Tue, 03 Nov 2026 18:02:36 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm6947487a91.15.2026.11.03.18.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:02:36 -0800 (PST)
Message-ID: <7d07b4b7-42f2-4367-b3f2-aa2ce5258747@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:02:32 +0800
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
Subject: Re: [PATCH ath-next 2/2] wifi: ath12k: refactor m3 and aux_uc
 firmware memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
 <20261103-m3_and_aux_ucode-v1-2-e14f13fdfa41@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261103-m3_and_aux_ucode-v1-2-e14f13fdfa41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aea923e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=j5APcU90v0LWm_mwTeIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: rTVnL6snDzqupdYWIRhZhnRbbMs1X3FE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNyBTYWx0ZWRfXw7fkpi1i9v4i
 HIlLXvoDDLG4N9d1ob9LFZKEqaUXIDYhOeD5zDeTk+RxDuzqY7sCnbiUyo4AKyBJ8XlE1TBawJk
 x6epGFe0PLTHiMkEpqwG4OmcUl4tg0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNyBTYWx0ZWRfX9Wpz6SKAAOTj
 CLzkSbX1J4qLSXzZ0Zp2DMwKy8Nkm2KH7FYUQlu6lCFPv5VX/aba8w3Un29CXc9ljPKexm94cqX
 D7tvTNOYDNllB02n3x7/LQ5/RlY/wWW2z1H1UmhiMp/Ofi4D6BFmYVgYBmbqxSBLo2wcd4p7DYu
 x9hqaiqkSTuAsjIY0bBD4JSzoRjhVhcCIblXIiYOcZFXxXbtP1ILyO+0JYkWB8zhvT9E+lEZndv
 h6K6YeboUtkxWCWrrZ2Lx0C35gloWdSok24/rIaXivt7TdTSvIsp9GhuFUPnMIAmUaa97lQuuOU
 YzdBZG4TuF53wAi7gcM91xMLb2vpXykC3Z6KvQ1y8CwOk8nPGoMyuifDuGX53ko0GO9swEKB53g
 KMa+V4Z8VjiVx+TuDs/n16n16ccPx3N6Lon085EDPwDGaB+eCuw7xHizcD88Hq7/+eAcd4rx//k
 CvgGCMXPzcOdaKtfh7g==
X-Proofpoint-GUID: rTVnL6snDzqupdYWIRhZhnRbbMs1X3FE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040007



On 11/4/2026 1:26 AM, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() implement identical
> logic for freeing a DMA-coherent firmware memory region and for
> loading firmware into it (reuse existing buffer if large enough,
> otherwise free and reallocate, falling back to a standalone firmware
> file when no embedded data is present).
> 
> Factor the common logic into ath12k_qmi_free_mem_region() and
> ath12k_qmi_fw_mem_load(), and have the m3 and aux_uc wrappers call
> into them with the appropriate struct ath12k_fw_mem_region and
> firmware file name. The shared free helper also clears paddr, which
> the previous per-region implementations missed.

I don't see that paddr is cleared in ath12k_qmi_free_mem_region()
