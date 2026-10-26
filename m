Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020199;
	b=Kvruj5O/aMsV896EFHV0n7egjNZOiv9y5iAdmKzqjB3eXfP5+AHOQxBv42GmZre2mJAs
	 Y7gRnnSLDN71GpZTSiMY7968JM1CkBYa98qgJIwUaj/a825yrrqKSEQ++sm2ZivV4Vm19
	 bvFSU92E2ZcVo2Fc6gObAH8k1siU5YgmFvUJCS7WrR6Xz8Wq/1VF7ASOb+FxSld1oGnMS
	 IjvtslSE0r5XVTQNOW/t0K1TXr7Ef/JI2A13F1kC/XQWH669FVf6u8CSYQW9wJcsrKeS1
	 yfuaxH/NACFlZIaa20zyxQ61LGQnrag+GWkauH1xAEk5XkoC7q551MVL37l4kAJtqyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
	b=NiuCJZ7NJfFRcFyny0PfiZAOPaFs2GlCql0nNLau8E1M8Aeeg051asz5IhZJzUG7yfIE
	 4GUohtW637uFrGFhj6HobSAMVkqsLkl+hpyTKH6CF/Dvibqc54iQnvOCCbbILKGOPjI7U
	 lhGywENs+LT0IXJrLJK1A1aP0ve/qCiRf2EvTk51bzTR5DE08631Se6FJsvwtqLhfp+uZ
	 4XKSlA6Dsn85ADxvWxTsDWP4B3AUlSY6Bv+JpfQ34SwDvK3wVL95uPfBNq8agZiKT57/F
	 CUw+14YtRLqXcEjxlNbadnauphQhm8Gv8W0h9bt0J1/KkJ8A1cGR04LKsKug5jqqmmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=murfKBxV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqwvHt3j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285B606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C285B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=murfKBxV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqwvHt3j
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtNS43050893
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=; b=murfKBxV5uzBPNCR
	T54ppeH1fTQLM3q/mBgRjDF8P1SH6AV3rdnDYWH0i3t5OJ4iY28DaWIC0mFxcNi8
	vIUm3Xi8GEy6U1GLXNSYwCfDdsmcWOf6r1tGAwS23/MyH3LgIKQu5bGDcqsukvzm
	O7zJfhIsDdGbP4w/2nm8TOW7PClBA2eXKAlD0ygEM72cSir51B2owyLYK/gLmcKi
	u6IH4uc9plP5f6e8X9gbHpgVL1tsneix2Ae5+YHmzmJ+mX7+S3bAiTlHjc9FXxkM
	AWf6368sFLrAjH9BrUG3rB16k7h5ia7hPV9HOkOGcv0zD3ajUxcGqMBsHOfQHH9U
	uRiOhQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdda8tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:09:57 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-7052c0a5836so3522145eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020197; x=1793624997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
        b=eqwvHt3j0UtIVaY/HHDorO/6I4+QBu5n0DLjHVO7ly+Ki2zHoCCNGLxvgZdziQ09z6
         vm2z9CDrXtEulbdwtEJixHAwJC7oXwvL55xrim1jTGPdIHFSPulbpn+K5iAoufCVOlCK
         jSRqgaln7PJeXMH49QmsKAl3BdyhnlOd8F/IaF2ZBmvf8/TJUkxDOVaQ5nAQ1ILNzY5D
         mjsmVyrW9QUUH3IKRqSfAgKmorRDDtpegXIROO7zfUIeuF93MxcfmswtiLSl69dOT2XL
         jTtWPi46/Xf/nXCQverR9jhV5z495EpnbJK3DctrERI0uJ2kvgRk5oBmbUvPIiuEed0f
         8kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020197; x=1793624997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7yxWtPMUXi7IWlyGxpU0TZfSphuR8DxMIcDIMKDNB8=;
        b=mYErPj2sTmkIOzg+YW0Tr0rP40Ksi2imlATlffwz5tbS74zyBQR6R0GJVIb9aJC1XS
         rjq+4cshvpdtTBN6sMksTf2zy5tU4N/hNiZE+c3W+3mF1Asda6Sc0+xlkIaVdDxBgOqq
         WCVP4lIeCmPgtiBmlDZTkYauA1RnToq83O7tZtweQzc0YJ0SI/4XfBQdQFb1k4tgBm9x
         Ccqk/CIvRquIk6tTh05PQVO2I07GF88b+LZ42beq4aUmJzNt5M2bujNpN8rexgtTHZoC
         14kk2Q24dFp327IFfPgEHM2IRDbUAAfGYobhV9nh9AdVQe4vQW9xajkX2YSmx6K0PH6h
         h/cw==
X-Forwarded-Encrypted: i=1; AKwUvBxD62EAM8KD8Fx5O9cGPCD8U7+KaoEIcxeQA2q9RjdYsmjzdWylZNwdf9IsXnxK73ez4QVErmXLpikYsCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZJ6otN28e16gXtNjpMmhDDCXpNdPBbwDJI7F/cRnyBnz2c5d7
	P4FWQHH5s9wuSS37DUoHJNBr4tWGZb3i38oTaRXBOH7EjYAjd5jW3jJYWav4FFDsfjrrWBJF2dg
	oBGczavngBcAXruT43Paa4XuM+goxIRjNbU0voJPJpMjbhW/O5f3ZqM36E/xBXUwXJuo=
X-Gm-Gg: AYBFou0wrURmA85sf2iyHKeX9evQOjIklTwivYxIXBDpVcSABQjS2Xg90bCMWjq4YWL
	snmn0aIvfUbHd4LljdwM4B5UVHaOrCyk5gjgfZvDrS8mIfVPeGEW2gkYwJeL2OfSnRO7ahAz2wD
	Y9WFoVrpbvMzuClevK0XXusVd1d5mD2HsHvNcA6Qfer9heer0yEyYmWh1bwlz6yJ8M147/aj3a5
	MClE/tqwEBXsLxvrrLxPcYboM3A6pWTMdErFXCMyDKxXhCmNQMOAU7fSizMpPk+P+h9L0Xswjo0
	TWeuApHH80U8QMEPusMPKNoP6ro2YqAWw/5Ne9V8+koq5BKMLnejWZWR8iT+26SZ3frYayINJBs
	U6V5pOOGyuh09SBVB6IANAUetmag/lZBCdK1PfvgTx56J+gPpcR7f4igwcYwFaEXYwpzaSot9o7
	InE4Ks2iwKoyMYV9C4tZ5ic7UhVlc=
X-Received: by 2002:a05:6820:61d:b0:70c:f411:409a with SMTP id 006d021491bc7-70cf411484bmr1858261eaf.60.1793020196911;
        Mon, 26 Oct 2026 06:09:56 -0700 (PDT)
X-Received: by 2002:a05:6820:61d:b0:70c:f411:409a with SMTP id 006d021491bc7-70cf411484bmr1858226eaf.60.1793020196412;
        Mon, 26 Oct 2026 06:09:56 -0700 (PDT)
Received: from [10.190.200.105] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e163a5dsm6838618eaf.8.2026.10.26.06.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:09:55 -0700 (PDT)
Message-ID: <0cace778-b68f-49a9-b52d-dc632bf3a0ea@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:39:45 +0530
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
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
 <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
 <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
 <5cfc6414-735d-4df3-868d-c8c3c4a98e30@oss.qualcomm.com>
 <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <5478c0da-e28b-4ea5-9b7a-f7aef2c7f437@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a4l4WXHcYZPI4vIz7gTvGVS80RGBSqb2
X-Proofpoint-GUID: a4l4WXHcYZPI4vIz7gTvGVS80RGBSqb2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX+a0WRj+TlQBc
 EH+tQ1ia4DFqarNC9Sry6XN3LSk2VZ62bkriYk0LamWs75Qqvhr+eVcGc2uk47de60G9LbjCvEK
 h9qnVXWzvhfqHMtUL/AYuaCwgFkcDxpAyDUP7b3b4/kbp1clYJNSu89LpGs1QWacdVkDydOjVB5
 uOrgVBgoaRa+ZeXBJgIpMCzXrSHpnCDIGoA/qJFSC+Fn6EOWIzynrjZ1C044cNQ2guA4fSpWr86
 ygD+TfkRV3QdZSCI8G+bkS6A3uEtiBfzIFA5+4l4xctOsNea1P0y9w9/YwYcZ8RWLFIOHXX6qp8
 DpPw7GQaBfYj2xtPRn3o74AT2yIMQBaAHsyqlPLOY+n8jNi9DtIYbg4TKWnwPt5CMWBAB4dcixn
 Pv3RMPUSoEv4XDEsNwAlqmJ9593YqS9ECJXvd+oMoX0z3f8kUO0Ub+foVv37ciq+6hnUs6RLeO3
 WzxSqRNwKlwuglmiwNQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf5125 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=orzTaoVzejLQ65uNlDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX1NDeIHw0ocC4
 KEhrIqWLwUC2Qh8fyy4QMlQ3W5YykYpn3+8vOUxVAw6dC37ce3XIFq6B/okm1JawyG3I8miqisr
 oJ68qpxBaz2T6DD2Cy1LAieZgRDkNoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052



On 10/19/2026 4:02 PM, Konrad Dybcio wrote:
> On 10/19/26 12:31 PM, Konrad Dybcio wrote:
>> On 10/16/26 11:26 AM, Sibi Sankar wrote:
>>>
>>>
>>> On 15/10/2026 19:02, Konrad Dybcio wrote:
>>>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>>>> Hi Konrad,
>>>>>
>>>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>>>
>>>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>>>> ---
> 
> [...]
> 
>>> microsoft,surface-laptop-8-lcd13
>>> microsoft,surface-laptop-8-lcd13p8
>>> microsoft,surface-laptop-8-lcd15
> 
> (FWIW I don't think there's a non-LCD option)
> 

ACK, I’ll drop the lcd suffix and use microsoft,surface-laptop-8-13p8
instead.

Thanks,
Gopikrishna
