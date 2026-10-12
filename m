Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F080E49DBA7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818943; cv=none; b=KugjQQd+sPqDyCy1iKh4YmolfWPyKsqjmz1IjnBGS5r2ZBTvCCFZFbQd8DuLEKKx7UqkJKbkxPQNJVxOIGOlz2WHfX/I7d1mCwRXgMNATQmQ+lPn49B4Rcb0tUMwdhXxeyrPZ/ForZj9Ur89qqjrjMrN28/VlJFnKJYmNe/icuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818943; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBKPO/S3r3icTOzR4C6opG5rfskmxO7Tah0pRzy9W+aAut+IQy0UmWJkxnbKRWrOkJS+dO4wW8HnniQNPRr8eZ9d2PvzHboV2srVVSZbBruAvIBpGl6ngHSpvSLNJZlpT505YO1EwGMV1bP4LD80upvVFxTHOMnnAYlDnVlZZQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7gnpfso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CHJNLE4A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7gnpfso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CHJNLE4A"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Gwv3292450
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=I7gnpfsounh98sJk
	ZJC/TgMndEWIIGyQnHeGOtejAb/tJ5yKFfpnvPU6AfFl3+X2dq5H21dZN4i08ZyJ
	oLksA8aWD7fDs/m1J9QHF6aec2MjxKkgUmh/MSCEvjSzsbxsGX6bABotvxJgKKc8
	FlREN4Fs8iVpymyutJ5dDkbfVzlNVBM8FJiOqS2VHjNwrATZK0C6AU+WaoMn5k+/
	K6Pr9qjQGX0kBu/4AT9AEAu8sp7i/lV4akjSNzrhAtFGq61OJDHsHrwrAyNkigjE
	KxU2thNi608FG1uk4snALPEf1SIgDLU+7MD3tdQvAYluuwHrEPsOd1cE/nJkytWo
	y0Ih/Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j296-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:29:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf97f74492so44639137.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818935; x=1792423735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=CHJNLE4AN2nMR57Aod0G4OZjx/DRpc6tL6J2BTNjE+1F7bHZvlA/UZ6agETK+2+M2C
         g+Qj7erbFzQSbU2Cw9auUfdAuU9+YM3AHqSLnG9wVBMyae/Ay8rJxBtlP88PDdNUnYdz
         eEp7Ev4i29e4fayA7pU/JbtRGUeOiLK8pKArctFaTdjnMT/PiS3oxAl0CyiFgXIKEpKb
         z9Dktr/2mDIo8HJsO9pgz5l5PO2q14KRxaTr9WeKFO2qNJOsMOKeITMBmHLeHyzlhJfq
         6dMppDEjgd1kJNOR44gUifc5Euyngq+lNnBgcEXjOD5SJs0bpLsFZPBeLr844SSu1sc7
         YUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818935; x=1792423735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=Ag1/0zcxgJ7IoHYrUR7box9czY9hjl6hjqkcnD8y9GLuAp+I6dOYHSlAgeMHQ7o6uF
         J72M5s83+sF+69sVMQU8iwBzGPsFuOKQYhuXpGF8uzVUvqJALgXX5HrNJ10vOX1PVSJO
         APeEKMJAOuu7S95HKemTd6gQ2GNOlIq9IYHBMpXxIo1yhV2vZKyV1U+975rnckdSs3YE
         t+MfJU/zYdvUTP3ApcyeNPhgNxZaIUrqWLlIl7q6FA1iD0Du0m63xO5FGoel11jaQ4ko
         h+U/xw3ESDYtayggkEP2J+kRiLR4OTBhmqhsE4kzm2jmvkoREd0o3vDoBxZa/BcK0p2s
         63Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxK2t0yhUPEauVZQyLk1QaYalPQTStim6E5YrWQSC/t+izZwi19KW4aQrlC/zeeGk7+CsyQ0DGHZ/JAyGw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2N8gs43Yct9SctBW+RctWvc743ApzccsCXiIbkHlgRGjwXF0d
	hOqsxHWEtj13FV52KvzQAcYqN0ijnylaJZ8hWbC1FvSmf1LP5EVbv9qVUkdiBOBQH0ua5tijQ4m
	9HuMQTkdJPKLTer8lRMLRsCbRkLlxsYb21ps4J1Qwe9Ut9m3Y/k6xuUQh+9pZt5ZaD+lqv0w2yV
	c=
X-Gm-Gg: AYBFou0Z5wR3FfznBuREeUw9YVkldntlFqVJMDkjjEmNp5JIjQ4loC/pK1ydMsQDXJl
	n/tdrF+s+j/G4aenKycOzw7Rrf8an15+ui+vNu26CtbrrmnYNpQpBQKYMgh5bYebpLTWLLL1fp9
	55nRH8Ghaum5csfgrRNKxo/F0dWe+zRoaa5WLhrvDbRSZljoqirFtM+r+jJFgTWP0U7CIqSL48t
	5InHUNMM16iEU4lCt5/Bp11HLntsp6ywp24xJ9WnDTt5ryQ5a1mFxPBBF/OJyC2o0CW9Tg9oUNx
	uD3LBcIaBDuTk/miL8kNf67zk7fDMIMzzgRPwMouSI0h1W5BV0sUVK9PJcCGL8B8BZtr8AJA6di
	ZcOrO5dVVKs5bKMKNcTiE8A==
X-Received: by 2002:a05:6122:11b1:b0:5ca:7731:d36f with SMTP id 71dfb90a1353d-5e91f5bfdadmr1754785e0c.5.1791818935059;
        Mon, 12 Oct 2026 08:28:55 -0700 (PDT)
X-Received: by 2002:a05:6122:11b1:b0:5ca:7731:d36f with SMTP id 71dfb90a1353d-5e91f5bfdadmr1754778e0c.5.1791818934681;
        Mon, 12 Oct 2026 08:28:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd329fsm5201571a12.15.2026.10.12.08.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:53 -0700 (PDT)
Message-ID: <7ce1326a-a451-4247-9696-90e4ca89c141@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/38] arm: dts: qcom: msm8226: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <6ebfdff7e773e8084f156dcb34d4d5007cca72a5.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ebfdff7e773e8084f156dcb34d4d5007cca72a5.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXz/O0CmCtAPBn
 hEUfd0F2gNyAKcSK7g/fcNQsgMOlGGt1iGbrpaCeJEf4SkjBti0wN3zB3MvmhSBIsJq2f3ARX1/
 cjqmWjXKDdJS0uPTydC7wivgQpHQWSLWhzIsvd8QbvH88DpLY2nwoXQ/0CJnf6qfF71T604o0yl
 qlY/mPyxBWHXOLJgg8KGvfFzVza3tIRk4dJ769fbsIjEO6LJ4MkyutE3pCHA4nJ+9GedykslA+M
 rcC1R5GL+UZ6+30wN0JRirB55nHJp0+CyJhr9ysxd5AESVPOt7s93AMfGAjtBcKxlClAdroAV3r
 j9/XLdB4a4VwYvZeOARa+D06Kv9RG9DkjajZfp8cKZp2b/i4t21gIkh6GC8iWg0lwgfOAbt0cm3
 MEE8fuPVC41sFHQ81muApCEWQ6H8H/yDjuVXOQNYQ8NzGy+ddSjvVM5XSz+4XxtfnjG3Y80Hd0p
 boRj0efAoFIdU4eJEKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX4FWTHRPJb/6x
 JeddlSW3eNzy/NBh4Ksu0sg/mU+qG+cwRmR76iUAVvn0UcaLoLCcjnBatOoRAEiF3jLdlGcmw0d
 /ekRC98oLdwtnnRf22XSI2mWTRo0CT8=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfcbd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=-aSRE8QhW-JAV6biHavz:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 28kUCpGc1GlDvii1gBFNK4OvUnqVkUWS
X-Proofpoint-GUID: 28kUCpGc1GlDvii1gBFNK4OvUnqVkUWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
