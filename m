Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578892;
	b=smCKafQQTAdLnRLuWI3gobNwyb4N422los1/OPMrd37p5H8JJB6nncLlgZ6/gozkg5je
	 mzTZ0eN3mreekeOdQ+sBBwrZxxUXRxrSQfcW4T30PF35TKQev16QTOh153HdY/5IustC+
	 sht3a+ezs8hsxcuAlr76/bUbRDZF0Ki10+SR663efSh26SUMgUxoAbpRY9vcNV079NwmY
	 GVpK2qzwUw/J1Gxr42CLTmgmoX2RXDnpGGzE2Avv6O7kPTAmq5UUIcL0y9Keyx9HCNPaa
	 8RJCtcRWlJvPaQcav6u/l6DE5hTWqpaams1wYVMtuqRp2BW9iLgZBdgBLEQ2TYkb9xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=;
	b=1MwB3IjxxGmRWk+lsYWOlzrfxnG92JTJl/k/DVvmEM/GRpnshW8r1n5UZtVEmWAeBdmq
	 ZJ6mbDwFV98HzMooWJi43TAJyrAQLnQA+QpAHdobSoSH/cTfCoFtiH7eaKtbgV4/57bAK
	 edoycXtsnbZN4yvi8K8as7ub+Fw0j7U6esKJoy7Yz5B0pMPlkOTPn8eYJUQ5u8X9aD2qb
	 nifTnxbwcx33klbAHxTBvVK2RLiECYyR7p5SpWPWj+tThwCAMCkyMAWgjtTYiGF2igLMf
	 DsSZeskqKCzoHRBf+/392MKTIeoMdFx9rcZK4+mFclPbu8QqAd0gzfrI9ep6GfE8+ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eX/FNpXU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TS+kvIc1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693F9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eX/FNpXU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TS+kvIc1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5eAY1356945
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=; b=eX/FNpXUfuenY2Ci
	2H6fPOnzL1G/ukqW3h41RL3Ppdv4fb/9Y9WyXizK1AuN/zqBzTh14wDgkVXuI+lH
	C7az/ySApzI5KVb3AKzf1KrYgTD+diCfzchyFvE4QTTW31uprRaftSsaSW2UgmVb
	7CXftigCpNTHEpVR0eToUgCXUmobcqPXsFacTsCmcEU+hy1YfzPIDVzRD/r0Va90
	fbnNrfEKJAxvoAMQKD7r4M0rhBD8q87yUrkcrw0FhYh5ZiMf9UNrYiUVw/YCtKUT
	oeI8Ky9E9SiURn3/f9E5rEiENz7J7IAGRjYKCSwdazYdSMPlbDORQjAEYF53dbC2
	84mRZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ufdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:34:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so18790785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578890; x=1793183690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=;
        b=TS+kvIc1YxETwAdzrHZZl8hdfVSnxLkFDqGajuvIAe4j6/xMbPyPJI5QkPenpAyjI6
         l9CcPmJtfglG683Lu8jZg84Pc/W25dKJT2E2Jv+ct3cwaIYqCVnU1zVIQHOBWqlPKEgr
         fTaBbo3oF9HvSsWaqH2Wofzei93riVGYLo1CzNsdJFbT0+5APc3jQe8h0hpBcEKTwWEp
         Q5jL5HKhk3zq6kxEObmwqCMaDg4SrMV5VeEFgq8QtaLV7EPg1ZCot8novBZ+ZNNMyxta
         W5HKqjKdsrfTw01/zDvjibNEv/dzYR+n2azzkJQDI7VWlCXsmpc2R+vqcaRoj5sJ49SD
         dhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578890; x=1793183690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRV6xyghtvclnyTeVw1ch2ppma1cwDC0cp387OCS+mk=;
        b=13Ip6gLZvUoJvUPwEm4wQEZMyFWc6yobnVJKpNlwOGNAkAKHypSbdMFrCnnQykSnDA
         xUSgult0NHv+sEKb776R/5/KBzyaWuik0EXT9rgkVZuOgAh0QtxS4t0gBrItuGaWLC+C
         nCdPx9qWunp/Sc9oM7qIuTQxloQwJlm5PVVjceKk6P5agyGCBHsxIxYATMGT33scNfjm
         fNJ36pCgr2C8tC8Himp623pz3p0VUFDBMBKu3zAYRXH7wLHM6izvwQrlhpvNWJDvWXGe
         0jZKfHrs3risEwbuvnsi/a2gRJFamKGPFQtqJ4zyxteWsrUpqEWWS8dhJ+0kdnzJM8XR
         r1SA==
X-Forwarded-Encrypted: i=1; AKwUvBzrp4mqI8SNZGJLPjV9py646rP5kVpg3fUKjrLfZK8OW/F0891WFVxbY+mnfzHlZrbbA/qff7MDYqcdd94=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoXGWHhdu5fm0asx4ypJFnOQPhUYicIzfCiTSa1MEgFr/0cV/Y
	LCnsTZvqgpjlefBB2KHLxOry4DdpvZhV85Tu18jUPJTwtbNCYF9vxXyhbzEbwWHshJe6ZRIq9/b
	rBX8zAXYJYvVyG7KPtpbEE5h9QfkBZebxgnVUlLAntIVohFIsxAgDpbbbAvJGzuA21AM=
X-Gm-Gg: AYBFou2onco+xLYvlE98jpz30GrJAaRTkdKNqUJd3gkuXq16FYWrD7lqGenG6t9316n
	+gSqZL9xpir2LemxRldRestefFShlRmz5Z7ZZgkZTEEgt2EzKKm5NyrvRyFUeE/SBMkjR+aB1Fb
	Gg6ht7CR/f3GORxkBwMnRKJddvIUsG1lDxQrfdOgXDzUWHaUEkOX6rRFZhNVtOyBqmSmcv6FQ2N
	kBW4BcRrosLasFf0qbQGMT0t1FE07Y0YyhW035iEymzuEeV90yCqXbBCF1jXlsrV70FhmbQEZFS
	7aKreHsNDNPpPyxIit9dl54cBWpGnkMvDcjsLHao8BiWEsMdEizbDsAzGbI/TGHoscnQClnYNcW
	ncAGVTsMs2e8Fa19AhVNIKg==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr378213585a.3.1792578889834;
        Wed, 21 Oct 2026 03:34:49 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr378209685a.3.1792578889412;
        Wed, 21 Oct 2026 03:34:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fa80d7sm62589866b.32.2026.10.21.03.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:34:48 -0700 (PDT)
Message-ID: <be89838e-0eaf-4b6e-b77e-7cb89a2351f9@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:34:46 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: sm7325: Remove duplicate motorola-dubai
 dts
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261018211638.1137923-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018211638.1137923-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CRqVs1yNYKudCiMo-9x7Qk_2QujNI__A
X-Proofpoint-GUID: CRqVs1yNYKudCiMo-9x7Qk_2QujNI__A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX7fMdznO+UIfb
 ZF0+7XZ+SKVY3W8yKf6LbvUultJ6lw8wMn6QZP76cg2ZvqOq9YS4xLURLYxr9bI662bp2F2Dnk8
 Jk6tR6fbB9YAkiHLe0v7vpzwzaSaOTs=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8954a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jfzu7Z7b5MERT2nfZJwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXxp4Uw6xDweJC
 DkpsucD5UGTXqM6/xzLMnrnyciiNFOD9tboDCHPbya34aGgEKuQiWpIywnLG8vMFe0YTNsxVcwe
 ceAJ14gltpimZPTPpnXgWYjioyj4PSrk6jLbmWIw+HpnNVPpoYEgF6SJhk/P4KPIXNWySshR6yD
 XALTqFczlFYwWR/TRA7zokiYrrD9e+6YFpb2HjovXDur0vE0WxUQMC2FkviDOXftGB7UdFpcaje
 tV45AM8kqJ+KFyavzaT18BLYQE9z0uM9L52RQzX4fqafXJX97L7qXcK08Oq64UcX3yv+iN9x2dB
 W2BIxpY4S55qhQT22NviluiXacvZ9hxgIHNTdbKxz+gEHNnvuFg5S5cAc9n2PEjOL3nQf4vFdrV
 Gf1vVjtiy2l+sRyVqEMs+NgeHT8K1qF2jFtgTVuizCYgW8rPwcfhdZOH3vny5eihWDnIhOxtT0i
 XcVUeJGMoYXyjhYs9/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210042

On 10/18/26 11:16 PM, Val Packett wrote:
> Both v2 and v3 of the patch series landed, so the non-split dts is
> present alongside the common dtsi + split per display panel dts.
> Remove the redundant non-split dts.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
