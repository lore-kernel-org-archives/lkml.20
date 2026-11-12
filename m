Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483797;
	b=HktlYNjjiRefdD+u09ZmoyM6hA9t6mwINFFKguhROlCLlQRXsworYGAwoM+W0hLJ8jjS
	 QRulIb5i2kiIoBYHhTZPmcoTUTwTkAgm1PrWYpyOZjzyNU7PNXuz1ly62uziptAyY1tUU
	 cN94td0rtzXLVgE9cRPD4fMnBQhpHIg35aHffvU12Y1E5vr105Fz3uWMCMkCUGlQSDGlT
	 pHFgBay421lJStu4Mn10iNmfWVmUH6Iz0hW6MdN08oTNf0axazfMLQTr80qCw4Kn0Um8d
	 44bfrlncn8vAVsx9AbGoXbsmsVNxV9H8btOddUIRiDvTk8fEpnRTBYFU4vGrcjzPMTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/UsmZJteRaFetcrcRELxgEEeGkrhNoxIFJFDkJKP6UA=;
	b=GEgEeMK8kdUvbkomDZU4guw7xKhlZB0irWfd8HovH1Fk3xMVsmm6CeDLGkXhkbltRrpO
	 Pd2pSZNoSRU6gUc41u80Ru0U1KzCaDUkerORDtF+jWnLuJmPQlP1I4Ltb7vY/dEU9lA1L
	 TxwW3jMG45Xm6Ve1aw6vBro2bTMU7Fqy0Tw+kQHsQ1AUOwfGWQPmxnQO4h8YkeBZnZbDq
	 Y1kAN0qRlbyeEiX0hdwimKRP2xBLUCp2NigfgeWl4YODLAgWl/aHdm/kNqGGxKNaGftQ6
	 162rAawR5B7dOU3qeNE1uZXZ4Qr7t8DfxbRIZ3hUWnpbFtRKOgcnZ+2OcPrGZtI0aLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jMyJkN6c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dlNsDC7e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE46C606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE46C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jMyJkN6c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dlNsDC7e
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iwpH126141
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UsmZJteRaFetcrcRELxgEEeGkrhNoxIFJFDkJKP6UA=; b=jMyJkN6cn3Pey+t6
	4FJSf4pRce+aHImgnkYtusCwP5HDljsirOVP2QTdMrAV6kBAr7289H+ZHBoKdeOw
	9IWJZJJX/jOgqMN0zxnghXIn7ThYL2KLzrumuYKMLIPhEPlVW2HDS8u/Ao9M7zj9
	zrNIOGksuyAkbXeMV3mRZK9RS8YQEcRsnb59S9hhkZBhOoyaCHqJps38hV7qG/J3
	Xe0tX2YXi7UH3Cq9zjlNgVKQMzG+DERrpC6OVP6dqGgR6AaNYZ6S4DQuO2Z7Nnq1
	eKTroqerpmhAOp2aF3PGjbHQPNv4WxucwcLMG1jZyIt/5SI/oJ/pHcvdMri8hA3T
	4qeRqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a08u6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:43:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so2074705a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794483795; x=1795088595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UsmZJteRaFetcrcRELxgEEeGkrhNoxIFJFDkJKP6UA=;
        b=dlNsDC7efncryoB6kjy/7n+VYE/nkSwEwEj1uVqyFzjCB5/N7xOeOS2SOsotpnsmDs
         /zBKWzphEipaPiGEnIWVzkPXo+k6TR+iTJTXyct9EynZ954r/O5tKIkYlLXOlckIhDip
         mTihcpmqA/j8CmzG6aFa3IxqmQW+P6hwwURZKdpt+fRvg4ullNRNV5dmkq1TwSrX58oS
         qEm2sDrdgYS5pD0l3sLul99Lgp0i/jLys5hcOtpu8saC4qtWbaW7ozwhAI3dtPfRWQA6
         YlktiKdzCiFpAyygV0I/FDVdYtuq/+7XoV9MppP69D80tNZyf069PhumW3fwG6SmZD0u
         wK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483795; x=1795088595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UsmZJteRaFetcrcRELxgEEeGkrhNoxIFJFDkJKP6UA=;
        b=B01Y9pB97l3rBoMEDcEbzm4dhGwmbLpxQr+PkdaXg//1JEkKiJj2CJVdgyTSV0BrEw
         Klw6aMBWjl7UOqd1440PDtrxAkW25jWcqBJRiLrO5PI9hzuqpR9j81gc5sJFQzG1vW5d
         aNxw4QlqrZN/vAIVwp4pHCvy+bb7SxXSfvUCdQiDxkReVs5IH+YdUxSiPFOr7xw3dUhp
         poaLtfhm9FIr8Jo9p3n+WDzZ0HE0+zOX5Ys/tEbtg163ZN20ZJF/D7maudP+SzCtEhg9
         410H3WlYnPqDXk3+YMVhjrWVNvR0v+OswN4aE7XiII5V9dHujDtyRvHgn6T4g5Xfv78f
         57xQ==
X-Forwarded-Encrypted: i=1; AL+hErHj8THti/AHbjw5QnXUW6i69nPY/K2ph4bK+5PPK/GKgAyiqE308DXhay+7yqw6Ohj8NARwXuJ6tqsyenc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pb/OuQxFgC0hDGsVdIMLG+XIxYiW4mD+oZNassunzwY/NULEp
	qb0vAFmNMn61Q2eKhWo7gtel+Z2iyzoNZ+WPJ46FZ5/4ZWUWWl6OqZfu7qjIfkUzFcKW5sZ472n
	fE3db6IfH1h7L+cR6GzwRj1Dl8ye+LISbmegxOqWxcFSzLLJ4uJOrq1DRNf75SnNGcTQ=
X-Gm-Gg: AYBFou3YgPFXLIWoNRazhzOg7ocIuoAdJN9f0au1aWy4KfUUUZQqZWz5M86cDlcrj1Q
	+jfpuKFs+dABJBw6VvCeICwsO+yJt+aoAzC3hy+CSE3RzNeVHVt1AWavHZHSIQRXKhmWdEAr0ix
	WVIk8eO4dz1r/UfcIHp0Bg0JsfmJEhwbx/+q4LcOvdltEAk9U8WIvHWa4HRe4GtPKrUP6v7gFiA
	KTYh3ft5F658RVI7SuSwpRsdU29RrcSdxuz4yG/DwgxzE+EiSLl6Zcvi2HuenwFgZhdN/SOVQVL
	uVOZg2euONC4HsA29S2xVrBsf9ZErRyV8GBF7JnsBKJDClI0eopXClO3dKzwzwFfJ1k44MOJl8P
	ap+b7J4NzW1LXXpCmmsgoVU8sI5DDrxKmekXTxdCtcmDACuxuctRt7VZj1SNFuYKrgvJqm77x2o
	Jl1+k=
X-Received: by 2002:a17:90b:3c06:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b182df2f25mr4726542a91.1.1794483794714;
        Thu, 12 Nov 2026 03:43:14 -0800 (PST)
X-Received: by 2002:a17:90b:3c06:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b182df2f25mr4726519a91.1.1794483794297;
        Thu, 12 Nov 2026 03:43:14 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b2cdsm4350657a91.16.2026.11.12.03.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:43:13 -0800 (PST)
Message-ID: <d60b437e-b1df-4a9d-be3a-a53c2a369f84@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:13:07 +0530
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
Subject: Re: [PATCH 0/3] ICE: Enable runtime PM support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
 <CAPx+jO_ywfJUAGs6Zo8yJyTpqui=qN-T9qqWN2hKCyeegAeF=A@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <CAPx+jO_ywfJUAGs6Zo8yJyTpqui=qN-T9qqWN2hKCyeegAeF=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: O7gD8BOS7qhKFAr4qNDi-H91kuOF8L1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NiBTYWx0ZWRfX8DrHzu/pzMuw
 Wkb863HhgW120zMkV7LGHyNU9f2x2g5Dc1xTvBv1yo99txHuy+BD3JV8t2qEjzg0WG2VXkxOVEh
 MJ+5DSJQsgP5TwItUWs+8wtnlhYoWmamoI3yGw5f3Zl6bep4dfiBl7wEZTwmmTXugbCJ5OlKDUT
 UpZduD6wbgGHDDLNFGDEuWMetkNKCSN/94rcPWtURsUknkL78J5TKMxDepVb8n6Gb5E6uNkSk92
 YKTf+4lNHQV5Bt3gOUZwrcPoCJ2YQEOmr7a8TIGlpigy1qutCA/vodme010xDNJD9OxiAxZJkMe
 9BaoP+RzKDojZJ8XoT/f2Dajf7dLV9X9r4oQ/IxZdjFY7+9oD9OVn6b8a9xrlTY2YvlZCZk8f59
 tcD1WlWLO2afLS0pbI2FMDooBSL693EZUoNoU4hHs27A2vaGieseZ01eH8RjqRbli194lx6s/75
 qqXKsQEdqhoLTmQcyiA==
X-Proofpoint-ORIG-GUID: O7gD8BOS7qhKFAr4qNDi-H91kuOF8L1o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NiBTYWx0ZWRfX0OQDtErKB3Mz
 yfwNYKNSRLSzWgpjbTPSTImA2S5EJjqdTKCKVbz8tTKBvllnR+tOClBG5q6j7KodMjFHCLtGwdS
 mIodGxojim2sciEMVysfY8FC8UWhrBI=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5a653 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=wrTd7Yo2M8a-6LQTD2sA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120046

>> Merge strategy:
>> Patch 1/3 and 2/3 are storage driver fixes and should be available
>> before patch 3/3 lands otherwise will result in bootup crash.
> 
> Then it's perhaps better to send patch1 and patch2 first to get them
> landed as fixes and for stable kernels, then when that is done, please
> resubmit patch3 separately.

Sure, storage fixes are currently not tagged to stable versions in
current series. Let me add tag in v2 and drop patch 3/3 from this series
currently.

-- 
Regards
Kuldeep

