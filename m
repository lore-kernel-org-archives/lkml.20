Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296213;
	b=Xt+pyXlw5vNnCIENonZGkHJc7jqCCBTUvKfwx2g7cJQqG5dRTPEhkN5c1qtdD9Zb7DOU
	 wKaZd7frztWMey+VUO0jQHEmPi2yyCrn/YTS3jB2rpnn6/I6vvkNFfzjMqxxeGZeH6Ohb
	 y3r0kozI8LVOwNNfAMQGOdECs8GyMDB2dkrAb6dPg8G2w/kGCykEEm1X88RDldA9mUkSy
	 68rDE3/0th3juJp8g+nk8Y0Hdl2e3ESopOK1ZpxaZmH73gaKmyAeAbqjDjURkP6McNLwJ
	 s2PtxYI2udzzR64G9oh1j/rh7CJ7CHgabzJ25afOL4wJKizCdYmNWJE836sT/qvbu8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=;
	b=EXQqzrICkfr8Hq1gwRI07Y5A5BQ45/p94b6gVr01ZGpzb+d2xHfbGQwI/anoMkUMy5Ov
	 UUk19iOeaI8eDBxKnIp1GVZdFwSx474bEFqU50D8QmTBQ2yBguufgm0grzn+IbIeeFF1B
	 6DgX5eqnoHcni3GGlML3Ab8y/urDkxm0KvzVx6C1C1LUiYGFwBUuOJtCrawKjHFdQku0q
	 cYHPojVGMdXDCeC2oghbIro7cwAy/+Hkj+hQQyPGCjArRdRzbJovqG77jLj9paUKME18g
	 OqjVPVaE/uZa6BYzSDj4gUS9dnLsIfYkylgWWoAGohkWqs/wG6efjBO2YXVNliIJ0Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FTtGxwdV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SmEt+mM/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A031860A382F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A031860A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FTtGxwdV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SmEt+mM/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA6gUiB2287187
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=; b=FTtGxwdVYRKzndWV
	ivYp2VHwpiFmPViWn7ItXR5S5Nt3jLSy2sEjkEMjl1vRsRtqZIqKaE/m3+dpxVwy
	27QEjgIWEfF48khmdESc1YM2ZknevxHJM+zfnPB9tIBn5nNpZmEOXzl82533Do3O
	vxKGQo4PchCW6SOmmjQMd8Pf4Hno2MrX3NCbuTX6fvnm2l1UG7irQOusOLpegI5u
	RoGsjsytHBuI6wKDtCwkEAp7dFXjedQyujjo4/gM13GibpWiNiw/BTGWIEfAnnIN
	RtvnWxbzrQ6aZkagjpLyjnTk6O03ZG+dFtNM/I3k2M4CPNAIp+Kfkglr0REDuIZp
	mxIvAQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux8486qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:36:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3ae327c55so1056994c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794296210; x=1794901010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=;
        b=SmEt+mM/UwLRgP6euabyoTCDX1yOE3yt9wU9BB0fqRuyoa4NCh/ELTx/tCcVa0WggP
         /5twMXsBhzui81bf6pljvdpMOiUmxp4hJWN0oJ6UyG9gNIol7y3tG3LNUOlHPhEkCeKz
         kA4olruq/4EB8CgkOJDPvqd2DySyO8b2AfQy5/vzymIGU+3ZdV73duSxNsFOXpfT1CyC
         nnuJ+JaKMEBv087OiZUD7nPCe5Km9QbZbpPQtSYK0OIfA/plFRw5Jmv2b0RngrI00XiL
         FRRiHjcs4sepFlxcbMpHq1GlV16QfGSLl0Ktmsp15iRqI08du55Yi9vcnea31KtxGae5
         Wy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296210; x=1794901010;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUqN75cKWzgabTOF6ENl/PYaMqYf/ZoDoIbx/U7DSRs=;
        b=LZ5lIETWer/Cg3ClSEDoti8CFomdk00lWobCBBqF3h9BkljUQ1PPbCetRBQ2AlX1Ez
         y7/XdF1wbTid2PLOIrTAUk/MENU2geh1CTf/I45KsXAQ/hR1o9K7pWR8z8btRMCrjZpK
         PDsSQkYFzp+cLzBs9L7X1sEaJenks/M1NhM35E60J3aJmIRporQVFPKchzz3JwhhOGX9
         HkaqUK+ODkLGzLs61WGfFWkU98xdqcUFyQoMSYpX4t0WpSzItR3WqLkm/D+DTLdL5nDb
         tm3FSFUZO93sf8ROAQvwm1n7ra4uxMXNe+0JWSHuqjU2GRgQCyvD2jbIhuWcLCcbMgV1
         bsCQ==
X-Forwarded-Encrypted: i=1; AL+hErHTV55oUDzEj+dBMd8vrfUiqSYLx4sDp3oY6uHb8fJw/2d7oAG7sd2QoWctH3hVB1aJcVqBu+0TF/EOqqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+loGbz4kLtd21CHflLH0f5uzXOi7tG7dr5EOuoYuh2WEFiOSK+
	65A+eSxu/F6PuChTob3QFzyobD/hpUREhhcbEU7k0zGhk7nuECUHDr9TO/A7p+YI7UyQHqdrvie
	G4I6VIHmWEdHV8rxFant4H6m4mgqVM3EeacbRsK1kbY3OMvUPR0tc1EosoTlFB/mXQNY=
X-Gm-Gg: AYBFou2tKmbzfldJibJ/KXPHkz2j8NT7gFXpsBUrKNN0GxuURlYwJtKce+d4YGLP87T
	X5rfpjPH8yljeSl2w38S4wIkRAVlioUzhgR5vH3Crlosn6okRr6+kuainx3mjOhh0ODyvJLvxsH
	OGu1Uk0Yt+mCa95/dJVd1/0lP9h5YGyNTUsqjW9GSAH3gTyEeYuQUQzWUt047zsh3KFNcIt9JGi
	x5OH2NHhrS2ak7h+RflrtwoBVN/nCA2KwlBw8HSEm6qeXIqR+iEzRWkcTY+uIRJynbxMJGjGRR6
	DmDze1IYfvgrJ5rAXY+oA+QYe6cv6W3uvFpUnjvKIu/J6fVWh8YFjAm3gK/VJQbSz1CPQzVmvYT
	+hK8HX7wFfLspXTNIIKAhojWRklWiKfqAd3udIPQxvJnRWg3WQC7+q28WTEEnPrziuVmCZL0T58
	zJjUY68xUw/bK3TQ==
X-Received: by 2002:a05:7022:170a:b0:190:716:4822 with SMTP id a92af1059eb24-1b3b603aeedmr2309293c88.8.1794296210353;
        Mon, 09 Nov 2026 23:36:50 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:190:716:4822 with SMTP id a92af1059eb24-1b3b603aeedmr2309269c88.8.1794296209582;
        Mon, 09 Nov 2026 23:36:49 -0800 (PST)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm4591558c88.0.2026.11.09.23.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:36:49 -0800 (PST)
Message-ID: <d1d6138a-f8b1-45f7-8761-4647a3ddc004@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:06:44 +0530
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
Subject: Re: [PATCH ath-next v3 0/2] wifi: ath12k: accept what newer QCN9274
 firmware requests at boot
To: Goran Sustek <gsustek@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nazar Mokrynskyi <nazar@mokrynskyi.com>
References: <20261110002121.90167-1-gsustek@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110002121.90167-1-gsustek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMCBTYWx0ZWRfX0yQH3Q6Srj+O
 doTF91jnIUvc3iX+uhit0Uw//wQN9dzO9djRtnYsCYNLjJYUNDRDH2oHIcOzGOZHs8b1fdWgKB3
 p/8AeQKy2MKkk621bTkeHea1J+ylZCdY22RLYa0zYHfBabOk1jCOJdoijG0kR8YpQlQcN5HyFei
 9dp+UvrR7YjyVt8vyZ23AF51yACXW7FIlZkUzSK22rcHAeXZxMYDZvAeKDmRKCuKg4S96OluIis
 3+nZUKrrkvSKM5cD0ARWkYlUeW5BCWMzNpY16LI1IEV7Bk0xedTQ2vOeXUkMfANaKuN57SbAOxd
 DGTzHBQaAmhwssW5FNLqRkENYza68TgdFUax5RzSqf0wvEX2qZVN7pq7DPF6aDAHWfv6RNwRj2X
 K4xlmUkYThihSwnf+fKs0rNJgjXIjUIKiKICLO1OxlPgjxeBv6tvjkijYgYK4VRS06LLJV2ghid
 s00IO0V+q6F+QCd66YA==
X-Proofpoint-GUID: 3h7DWvooQyszQrNi0Y6vUzdtK3tIibpo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMCBTYWx0ZWRfX1rybFqZieOc5
 JKv0cAy4QZyH4+3xHe+p3iqvkhY+97f2g8TZz/PBV672GG5U/8dncm4QCgMENQdBSAZk9ytMEcF
 Z2FScOyHZ406KwMhjUIoB9vYc9ZSMmU=
X-Proofpoint-ORIG-GUID: 3h7DWvooQyszQrNi0Y6vUzdtK3tIibpo
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af2c993 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=IZxZDk6eNelpyKfexPcA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100030

On 11/10/2026 5:51 AM, Goran Sustek wrote:
> QCN9274 firmware WLAN.WBE.1.6-01243 requests two things at boot that
> ath12k does not implement: a target memory segment of type 0xa (AFC)
> and direct buffer rings for module IDs 2 and 3. Neither is needed for
> operation. Today the first gets a wrong answer and the second aborts
> the parse of the service ready ext event.
> 
> Patch 1 answers every unsupported memory type with size 0. Patch 2
> skips unknown ring module IDs instead of failing the parse. Both keep
> a warning, so the gap between firmware and driver stays visible.
> 
> v3:
> - 1/2: clear the size in the default case, no AFC case; keep the
>    warning; describe only the response change (Rameshkumar Sundaram).
> - 2/2: warn for a skipped entry instead of a debug message.
> - Rebased on ath-next.
> 
> v2:
> - 1/2: do not allocate the region, answer with size 0 (Rameshkumar
>    Sundaram); former 3/3 dropped.
> - 2/2: commit message and comment reworded.
> 
> v2: https://lore.kernel.org/r/20261102200235.48973-1-gsustek@gmail.com
> v1: https://lore.kernel.org/r/20261030220836.14164-1-gsustek@gmail.com
> 
> Goran Sustek (2):
>    wifi: ath12k: report size 0 for unsupported target memory types
>    wifi: ath12k: skip unknown direct buffer ring module IDs
> 
>   drivers/net/wireless/ath/ath12k/qmi.c |  1 +
>   drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
>   2 files changed, 29 insertions(+), 15 deletions(-)
> 
> 
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
