Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2F43B6370
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493688; cv=none; b=bsqU7b1Unu/JF9BqBpX0USMISaMDf/SSbleKq6vo5bLXB7I76sDNin/30f7FAFP0yvQ3bqVrQnLRG9V/dTAjNm3BMGFDmkBgl+2rRdrdsO4n8wYHVHluVoD6usEwzpOdfPlp34M3UI0J+waj2IvAoxamRQEmKu4CZ6jRa29f5IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493688; c=relaxed/simple;
	bh=hUtzIF+IkTYCOcwgzaK9WBcWIZ9fDmCDt1PiePul6OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcDD8tfChLfEURnEtsKsa0QT8vQborTcOLgkkiFI1DCRvAkhVojwmLDaR6gn5IQownIg7Yx6aOunPkZEu0MNmbuYbW/AMxyRFJ0AbV7Rph6caWUJUw5FEhxyXealruCP8RPcQcaXZwHYDTSk7/LjoJ6sUxmF3392V7DMnx9jxqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QaJfo9i7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQYSkXHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QaJfo9i7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQYSkXHj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L01uQ2976559
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 21:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	366Pu8skYlXsy06X6yxAYEU8GUfGajlaG6xyecmuF1E=; b=QaJfo9i7kzxLPDFp
	jU3cmbBeXuxwHZEeSWWFLLzY3FATHPTkAbDL6YDW/Io20OHVLicLpIiKo3liOlbr
	fwhcf5hJyQbR8roKoVliQZIq4SrRXRZg8pvCNFqIkyipBiS/sYlKW3UwTNcNNeTA
	b4IKzKJBJNJhpAijUvrTFFWbJ3uNQBd3j5frWKuaZRlE5jJDebNupFQNepUkdzBi
	OrwA7UpInSCkEaZvkH09v0bKDPjX5i11F+Jqs2nJQTpRbV273FI9QzbN3AWhkCeg
	VzhvfUuginrR+Z7b7Sa9e15qpCSCEvGQMicosyMxxniR+XPOUobHA3gd7z3ZnTIb
	46h1hA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu0n28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:08:06 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so6430323c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493685; x=1792098485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=366Pu8skYlXsy06X6yxAYEU8GUfGajlaG6xyecmuF1E=;
        b=aQYSkXHjvoOvnf6hI/9x13F/K6/wnZnpTgOEGZocnsdDaCLx1DPZApSUJQl3Qrmcs4
         zl9AVXoYFyz0NVvhxqMXGCotZ2GwbrphiP6IsImJVkOVy3A73fkWqT84s7Bzf7a216Hx
         uJyxZ2JiAD0ROYCU+cUY6DO1odcNXx/kspiWMZrbs+LqxwGo1x4r21qceOQ1C81Cl+bQ
         htkQJAJpzXEvLFuNeRbx1uO7HkeYPlxvCHvCW6ezLQYyS6AlGf9rljatJP8tql95obwX
         fJm7mwjbHTVg2RGXM0gB0QUpI7P6UgtE/UIm4I5s6nd4JZKTOV56JkyStaL6WbN52A+I
         aAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493685; x=1792098485;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=366Pu8skYlXsy06X6yxAYEU8GUfGajlaG6xyecmuF1E=;
        b=CrgSHbP0bumUHoL4w5rI1UtqUwwtcCMPzFQCrkBN/FLrsS8ELGpbKKXt+q/VvYxsc6
         pLaAXDrIs7ouuswvZ9L0T7hzLh+x4SP8RuHRKweaQAcnG0NzqGvZcyqwFjsmLN8dzwbJ
         naUHljSuIzOMV0zE4BVIZCKclRm5iK00ZxfbR/FuaxdO8k5JxX55pyuUwhKfShv8D8RL
         FNT0i9yVTxAUsfv7b8B6jW5g4DMKwS5zd+F3eTPbCD85sgJrVPvXGmE8U3ap8lrsnhhS
         qGmTJhnTKRWAelxZUS7V7PMZlCobRibt9e5FstJYD7jaNVPh2158aF8iXaFkPjYKzLtH
         hfpA==
X-Forwarded-Encrypted: i=1; AKwUvBy3tjz7to+470tWF4PuY/Al6QMN4Tn2PMjJBy6wfoZwy7yAxXQO/fHiHHEXOqLVDyhr6u1ynjYp/OA267U=@vger.kernel.org
X-Gm-Message-State: AFuF++nGoJoAgjGcPh/5ZYE9TrIgCRdoJu/b2txFpZbL5PX67CzSta9W
	86Sz3SMEXOc2okljysZ/pArPsg0JaZLwGKFN0xZPjPqM0dVLINsTRZk+F6xq7QBDkzF9zeEXxcw
	7wn5K9yZdOvtdOI34IxyQSEx2Oz/iNu/Of2BQmmsS1bcflpnetuTPI+siR28u5AtKkJM=
X-Gm-Gg: AYBFou3pwC/B5tQ5CVnI7VmWtiQKV6aqRYoNNBG7q46+rKpCW92YnS/bz/pVSqNuaJD
	SXaPFWJlrGzvdpj7Sfyp+25fYPMlfL0Oc8ac657r+IArkfic0mFlFwxXFp18ClU7TKwDj9KJwyC
	mOZS7cMzX+Thp6IvBrl0xezuI6sCWJBUUI+OnIu8ucm8zh93JWeAuEz9Uj6kNMIfC+tQpq4A4Mq
	gX5D2tVxPquoalbdVliLjW6swCreHxWWPZFpexaCA9nPIlOm0QxAmYMGqwBDDR7pxGqdN7p1kkh
	0Y0jONtl+Iu98ae6b07W6vX3elaB0mNinEXoVH1nmBDob2AVrJ2ug/BeJWgTuJYtb/zawVVzX6S
	i3C9vQ/EltlKQoAsR2QF9rzwSH18ChOa4w7ZEhzbdP2CwRtoxoACcWy5v1Q==
X-Received: by 2002:a05:7023:905:b0:166:847c:f162 with SMTP id a92af1059eb24-166847cf1c7mr3573656c88.45.1791493685021;
        Thu, 08 Oct 2026 14:08:05 -0700 (PDT)
X-Received: by 2002:a05:7023:905:b0:166:847c:f162 with SMTP id a92af1059eb24-166847cf1c7mr3573630c88.45.1791493684361;
        Thu, 08 Oct 2026 14:08:04 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1698de65af7sm926202c88.0.2026.10.08.14.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 14:08:02 -0700 (PDT)
Message-ID: <30531489-8d31-4972-a3ea-8a59b154fd71@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:08:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Make RXDMA buffer ring size
 configurable per memory profile
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261007-mpp_ws-v1-0-739b1fb87d24@oss.qualcomm.com>
 <20261007-mpp_ws-v1-1-739b1fb87d24@oss.qualcomm.com>
 <cf9dbfc5-5787-4a69-ad04-153afdec1cb4@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cf9dbfc5-5787-4a69-ad04-153afdec1cb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX4Ivm/AP/S23U
 2rLsTlRf20VEelgNuGNTrFV9vsFgfH30BJO0L+l84S32uSzqA4HK/nSvE8aE/R/SMF++lAxZWUL
 PwmkVWtjxKX30HHNh6wQCV8JceyavUiOMSH1UV9kwwz0qH/zTq4WVAT4u6LkupX+rxPQjAyuKJu
 P2hAHHSyv+ToZeVNWDIZzNGrpNiiT9Lx+7D0T8xvesolwv3+uuuJTcCSXr5By4BeaKGkJOv68w4
 8ELHzpeznXD5GLxEiPNTEixMiye8BY9sPxPlUqutC2HQzQhtprWdmwIh2/UAL+iqEAetLm/Q2Uh
 Ew3xocGsvH8lP5tOcgw/UHuF6OGVSmhco3ayO6nQKLcltY04w1xsG2D/kZTkNLdQx2eL35+0z47
 vo1cB+q5ZnIdmqIj0g0d2a/83U7+BZvUxryF+GPCVaq6Dy1mpzB47OS1372d8CfIx5NcQ5LfHGj
 h1kLR6JmJECo0sbACmA==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac80636 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LHOLFAxaTfbGgc5nesYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: id8N_CrS1CiN-4YJdFDoowQBbdX7Iu_n
X-Proofpoint-ORIG-GUID: id8N_CrS1CiN-4YJdFDoowQBbdX7Iu_n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX0lKN5PxzwP8b
 lsYd/CExkAmJxAnJVzJIk+CkqfxMzB1elJesCz1hjsnqisk24d3+sQy3SyAY/2fGKN/+tLM+8/J
 Bksw1Bg0mjoGVKjsTKn7WjuhU8dPfM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080084

On 10/8/2026 9:23 AM, Rameshkumar Sundaram wrote:
> On 10/7/2026 2:53 PM, Aaradhana Sahu wrote:
>> Currently, the RXDMA buffer ring size is hardcoded to 4096 and shared
>> across all memory profiles. This prevents individual profiles from tuning
>> the ring size based on their memory and performance requirements.
>>
>> Add the RXDMA buffer ring size to the memory profile configuration and
>> implement ath12k_dp_rxdma_buf_ring_size() static inline function to
>> access the configured value. This allows different memory profiles to
>> select an appropriate ring size based on available system resources.
>>
>> The function follows the pattern established in the previous patch for
> 
> Previous patch? Did you forget to add a reference?
> 
> Or maybe we can just say:
> "The function follows the existing pattern of DP ring size helpers, 
> taking struct ..."
> 
> TBH, I'd prefer to drop this paragraph entirely since it's already 
> apparent from the code.

Concur, I'll drop this paragraph when I pull into 'pending'

> 
> 
>> other DP profile parameters, taking struct ath12k_dp_profile_params
>> pointer as argument.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
