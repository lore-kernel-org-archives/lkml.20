Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867394;
	b=5hQXoszvpCPNz02VGcbcQQvarXxjNoUl3DfhTWZWvh46rtioNWCXVioImfGpY3zkdjLS
	 BQyAJCMX7jHGQm4B1pVwXQ8n1maa5LBxuRFOGAoNX6RPJRwR+2C8HMsyNYeU/wUu9e5vk
	 rQqRwwtkSa3glMNaxGIMC5gQF+cmRXONIt4+L3G/iae707C4iaHXnHBbs1skaC7h4HV8H
	 1qXtXYpM3e7zNcnVvHU6O7QChaKiqg2V/mk5lcFASTxDRX6QExVQ4f3DU0hK9a0bwi93j
	 X3SKU1yHug8i5SuplJMjs8ubYKhvLFHwHDC4PEaCd5YoF1UiiYHo4RnfSCi2CAoFi/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867394;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=;
	b=zc+6VIFbfUa4HMamWFP2AI+eJQfGQgyepE+p2lJk6yHebriMuQsgAbFGaCE6puNAo8K1
	 kj8WwXQF5rtlftRWD/rN6HdRTMS/PDr5grbq4zeGbmcvn7AUctHyC+h8R7W1ZTc2ibl0C
	 q4f9l7OfwdZS4O6Lt26POdidaEz4TB1pBu5C7EtkPwaGz1cMVkYIhzLEXXNV7UYRHVfzg
	 rH4HEbDX3/C2S1cs4lyFxAidgND/QUyxE3SZk9hsDBNOEMp2duzAiM/iwLzocSb+AeXSL
	 SYtsTUeM8ATjFXXP3S7erZxf3/uf1TJmMA7YBzbie8VhmJ6u4Nh3VupNY4JGxNUTqPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4L8Q8px;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5vfObo0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CE4606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81CE4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4L8Q8px;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5vfObo0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56V3L22588361
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=; b=p4L8Q8pxyOPFZ+ir
	eqN/r/lNwi3swCV84aPKoqPV0iwM7IJSMMyMI8OCd1Wld/OS+BWIk6eRpz32L0hM
	1ciTqMhj3+L1LXWzOnLj6al7CGulHEnTjXJbVYkCLalyHo4VZUlsXCeifVkT8ADF
	2n0M+X2qHHnRYeNjLiBQRyWeFbZrJFPm3eKk5UJempKtHsL1VxYryR5EtFhz2bYN
	714qVSBbfHMmzzjUKAIeWSjzLChnw0JUODUcpk1m+nvPPMBrJuBAN2/o/tTPhUBQ
	w5W35zJeX+/hP5kQePdIlHv61UhWercsx9Iw4jUdgJAAArFq6XAOCBFXUy/u1M4s
	QOB+3g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89sugvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:29:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bfa915da7cso427323137.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867393; x=1794472193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=;
        b=R5vfObo0KF6yQfI7hbUgxpPjvH0euLzImtFk9AXBcZCv9C33dkogjgVFV/G3JiOQhf
         kPR7wCvtfq5pWBkRG0HdIRstLXXfh/dWni450ECVgTKSkUBYFyiZ3nuU8iDh6Ew2sMPN
         jNirDBwSXkatd7acwoqnigfStp4ltlX7Zn91xsW42Av1/au8NTY4RHIQCUndq5xyyn1I
         5NaBjKKIBSR8HkqqGQVx8sZPgycpIaNzGD1TSkym1WuzPWaYEpyd8iSZeldOxxaNKsrb
         T7r/SiVBXsHWUVYph3WfuI6TH0fIQNFydfAURJ8qpH1VNbw7DFZj+LDa99DanopD89N8
         vgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867393; x=1794472193;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=;
        b=rcE9iEDuJvFAbyBdUWLuerCru7wkVo8pI7t5QHZfWkKd19OcXihzEYDUssfAJdBUUb
         4fS1LgmweThuZ8z1jqfbtC6eKtHoQSdSH+ZWBMCmtZQUDcTNsmwoxWrAlo1knM7uUsvI
         to8TECVEU5AelhA7IcBwCdzSUg8DsL4wZkahlvQ23P3XLbT5J34KSGkKSGQnjHpUd6bl
         3Ng2UfWY828sFjHzpsJ/5hPssntBVy8SmH6YjySpZm0BUfMegXRLwak7Klb42fwEhZ5e
         eTAmtzGAPbbncMhwCiYbdMbTEVkQ32rjVORhSv7U/OWUbiusyfPPKx0RHnvCSeC7Y+tY
         9wNg==
X-Forwarded-Encrypted: i=1; AKwUvBydXyC46Rh3+TvA0pPiZwtY2mG6KmJsA4qzLjZJS2GYesUFharIQ6LiQn9++iKRUoNL8n61GwjTYiJv/Og=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HSETV/0Q1QhQVOYGWacMaK92MVpMjmERUowErhk/8Fl/Znqnj
	YLvWH5PnaCgtJRy1ZFgF9kC39/ZLi/l4Oazcq+ndmICmRSuQdwd172Rf+vn8wbJ8WvlQIJXFwZR
	lwzeuF+inEVKW70ijMRUgF65P02BeqgrXgZzrUz5GsSH7dcVhBvwzYTSqg9vpKJ0pYRA=
X-Gm-Gg: AYBFou26a/pXKlHPaZLQxe/9z/RZl2z/L/iCN29evgy67CAcVMNC/Sm4CPvlemg+A4J
	Qv/HhLTwLfagf4LaEv26SF0zvsZMgjZMPXU8uGx6dFPrD6U3DuHVQFd80S31Id0jpzzIFlExhfn
	QNb/nfsLyDmiFKSFktDEPKRMCIQ8pLKUoTpLgc0vJSIfK5l9fE8vzliubro6ARQ+vJzxnvqcUck
	psp392k2gj/MmC8GchEiY428Z0AQEPtV95YcmeuDhuDLoQ8agE2WOCw5+Wer3xqD8QtQcAQaSe7
	Q5jrwWlMLsGiafX6M8QI1WxpYsdwyexyngyrRx0Ph6oL0sT+UlbbDk426G10z01UMCZnJMsIcrc
	644JY4vpxQA20eqddUUgw6wMjDwfHDH2zvCNXm9u2j+wX/9APm4+/9/bk6bc84Ps1WRVkwEFcrw
	==
X-Received: by 2002:a05:6102:a181:10b0:7d2:8735:49f6 with SMTP id ada2fe7eead31-7d287354e7cmr708764137.42.1793867392614;
        Thu, 05 Nov 2026 00:29:52 -0800 (PST)
X-Received: by 2002:a05:6102:a181:10b0:7d2:8735:49f6 with SMTP id ada2fe7eead31-7d287354e7cmr708746137.42.1793867392116;
        Thu, 05 Nov 2026 00:29:52 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8ef85sm9375427f8f.27.2026.11.05.00.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:29:51 -0800 (PST)
Message-ID: <5de385e0-1ed7-470f-a172-bc7c8762e0f0@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:29:48 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8994-octagon: Fix side touch
 interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
 <31d38c50-665c-4f1d-b191-55ce5d38660d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <31d38c50-665c-4f1d-b191-55ce5d38660d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2n-6lQIakcNrqhJ4h--2d_7rOHDrhK-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfXyedWDHRqbFNF
 /zoXjo0B8swuY+qcAVMrOC35TgvcnuYUOAr6Uznzve8+VbUuMlxXL+Duy+2rdo2NfSAyxFRPQ+h
 G7p4BILdtB7zZ0JPEgEHvMYT+4B7/iTwBw4IUb61SpccCVW7rid5ZLyE+cBNhJQR8ztxtcVUbUF
 v+cQYRntutxdxXdf5Q8aKWHHLQffcnwprYCUW2pRpQeGfsdzc0u3cQ4noFnrSigq7l0a+rt0G93
 Xek446YmKeTH+RvIhY1wmIu71ka2Ptqd5JhcW1jFmkA08nq3kdYnUeSz/hYRr9N1XZoGTXX65ag
 0xgZo95V325+LlvkmuGeKpM1Yh7eMrXuspENIoYY6Ke2F6iTGjpu4R4lZJx/NrH0o3Nn4nYHlIn
 iJ3ONOJ8eV+CV4UsgL9Yf6/KKsIO2Oxf+UumNy//LXqRzlDOG7w2iUiQc9iD1BD7kqv6+RvfV3W
 csq2iuy4cgpwD7SNgbg==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aec3e81 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1eH2j9bIuW7Q0crD8LEA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 2n-6lQIakcNrqhJ4h--2d_7rOHDrhK-H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfXzNzJSM/rDzu5
 G3ziwIwxZl2CnSWRz3vmdvypVbK/0xfGhhul2ElMN/PpyBKMgDpw2qdbGsij5Pvj1ortIEsuTeJ
 lmGkBDcRz3JFrq79Z3htIodWp2QVtAQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050033

On 05/11/2026 09:07, Konrad Dybcio wrote:
> On 11/4/26 8:17 PM, Krzysztof Kozlowski wrote:
>> Interrupts property takes a number, not a phandle.  Passing the TLMM
>> phandle made most likely the interrupt as broken, which could affect
>> touch operation.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/bug/linux-759fcb27-d081-4ec4-9683-6667b54fa3dc
>> Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> fwiw
> 
> https://lore.kernel.org/linux-arm-msm/20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com/

This solves the problem :)

Best regards,
Krzysztof
