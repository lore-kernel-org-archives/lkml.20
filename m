Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C03275B03
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265949; cv=none; b=iQiVRnoc8WXkUdWZ5iyUg1u+UL8Lc5zi6S8vvTa235Zr4oktaxYyrIMnG+LcaAw9+YEP8IGVUnR64BfIThubzVz0jSfB0BYxjhvOntlKn+ueBWnxnDhOSvjjmt0PnoIdOS/juQUN3YELlAsTzu+WdzM+LbVSt4WcQnk8/uoGR5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265949; c=relaxed/simple;
	bh=L/1GqbI6CVNHTOL+k5Bs8hxag5TXOK8IKP5ljcwCiiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hR/kDgYMzr8UFtROD2LzOlMN6Uqi+pXBVlJojB9tj9A8e0te7PPChrIp0Z5n666wBHfuZQojPiukRqR12cnX0hbihx0WD5ybrAnofK+F9uxhjlYvbnNRXpsIJsQCPEgm+bFaCdsBgG5UhhyEHYkNayZYiWrDN0rFSZDcFOOmjqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irf9zcoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/brrIno; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irf9zcoS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/brrIno"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdpq1713065
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 12:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=; b=irf9zcoSmiDPinKB
	60PluqS2vnI1lsOxUmCHBUVLANxeE5+APsUjKskvpzQEekTcbKXSncLl5oeu6M6Z
	vAUA86FCM7dOMEBoReY9kKpEK07FFOS9ELKOwDbBgObeS8uQWFee8prHRvR96N2m
	r2dLGBV/COzhVJFapfVPAIVKdhNuHx370XD5bS+vCH7kRp5BH9aJRn5jagnWc7Nd
	fQ6TyVfbbJxYaEqT2FfALq2dprYxZa1YM9yhy3EOu8EbRCs7RN3xvoYgy2e3j4yL
	Vgx0oTVGXkMC8gQ/Az8NcwaclewhP83CJv6iIryVS9AxRVTAdbD4wlrK7YDGpENL
	gt98Sw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxaggf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:32:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so4208356a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788265946; x=1788870746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=;
        b=c/brrInoJKxkzbClhPcfhxsegHuy6BKKg3M4YsW2ASz0Q9qfmuWdDkjbpV0dV8E4jo
         c9OxMrcH+ENj+4NR2bwiwEr7DAKOIFWKk2yND9QrO2SBsOV8RQtyDj3bJFXWYZZ7eozA
         t2K4blrQ5sC/ACE6OAqHe8NrZUf06v/gT6pkZWlNK0TFXnvSj9HZY7UTl0Rz/dch5ZBA
         tHlVbZLLU7e4PKbCcVZIu/6xwCiB590VjAnTWexgMSFoOrjF6FxHUoXBe2KPs5gZsERM
         urb85LynfiT9z0r20tPEKDAjUqDhvSIaLuoPfYPLKVuySSRaQ8vuiSipzZSAqwk6KLwJ
         0mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265946; x=1788870746;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UicsQCF2CHWzuvo39HPg9O428ToJvHotIHdRWV/p2dg=;
        b=A+p3PCHpgeE7quQ8A8q3YXvacksp13kjyWCCf0mMfnSlUyhfCBvlzb7FWqhz17r0G6
         SeC3r9S3pjwHHtVGu55o9tKAX7pvdg8ObaKl05ZFWDrSld8il7UZkxV07rCbyPKi37o0
         KNzcr8SZjBfLQSGbafWdgdLRd4esfWIpEW1oBYFHaelTZtw1pUvtE6vUXbU9k5Xnikkm
         febaq8XAmIb9SHeo0chxxuMsGVVs/BRsYUlHqNYmfRMYlnxJqo/1xDByHNR0w9CBxae7
         quOnUC/1fjqLQ+xnGSuBFDve8i7T4Jw9l0w/bDsVK717Zky0YkD7di9lBm8c8xC9TLeL
         IFaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3HJl2zIyJnCSffKOKNOlAeQ9HAcGEAzUGY+pMFFUmTX/Dy6NtOE37dMv7v/Qb1J7IXbWSVAVwkXU9i+k=@vger.kernel.org
X-Gm-Message-State: AFuF++n17Dem7KMXZIFxnFvXz7ps7pHCfIV+5QPZaNtsz8lKEJvHuzSN
	c+JEAxktk8EqK6d7he6AMS6feMu/eVjxf+Vl+UGeZXfP51/BSKUThmEVgxIM+errEUsM1agfPMD
	GSfHsA5K6peiYXWWiZsHTQu+1arUV65VVB7DdDu22Wu4hLiXDcLaBDLdexzXIQT5PWes=
X-Gm-Gg: AYBFou0cKDwCnY0KbvltgJIlp+onyeE12jXMIHY/psHZXnM8OWDdPzocCIBvhRljTu5
	VYTCoekDo4b7mIqfXQr7tnkX5+pyd5daCmjswOqfRem6vRMez3gw1Pn9sTkBorsEsJtmtyVU8We
	JWo2VZgO36Lo7/2zi21nInam+lnRrtIX5zXeXxRDhVKKCtvox5vVeY2jGDogesSaOa/6eUWQmgs
	2GogYr4u3jPa+WtoMKzHsVh9tGLI5VEUMpAX4xTwznlVOXA0dq2AC1pOWvrQoX3oEOsY9KI9x2K
	1fVaT7ijiEVGANixaVsfzCeI9B/DVwY3gdv3A06feEMJFA8xzoptCFwCEPIYi0cPJclqhC/Tcbx
	fDHRStUYe+w45sqYQ/gmdy7CbZozkeNF5PA6MtEQt1MQN
X-Received: by 2002:a17:90b:4e88:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39907b17a4dmr12472461a91.6.1788265946430;
        Tue, 01 Sep 2026 05:32:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39907b17a4dmr12472352a91.6.1788265945902;
        Tue, 01 Sep 2026 05:32:25 -0700 (PDT)
Received: from [192.168.11.105] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d18eaasm39622866c88.1.2026.09.01.05.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:32:25 -0700 (PDT)
Message-ID: <0fc0b82d-69c6-453d-bdf5-c51a9237035a@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:02:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rF0ssEKlXnZv6eVuC6QGSYfu0ThD2Kgv
X-Proofpoint-ORIG-GUID: rF0ssEKlXnZv6eVuC6QGSYfu0ThD2Kgv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX6w6LlS14dXjp
 yMwivrXC8XU5UmxZjo3gP70IuVP5jgpmG46+S7+9pwDD8qEhyjFskU8BvvW/BjOLAk3go3ZPSn3
 ywz/vQO5dfnVyIZFhEkEqZiq0XvXJBI=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96c5db cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=erCTOyO-HGHO-QmL5V4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX3ni1B28aaPNv
 HkJbx5JP4nDUGryKtHl+aYtYX4TV68Mh8sYrnCswDmJE3m7URXDvsDe4iFEIlYbr1itbR6gHOEQ
 p/MH5AcPpvBHZs/5ZeFXyP0ZuUXTKoqKNgJxavseB8BUPGMuEQXHYVqsTTs3oxSlhJnL28lktHn
 xjuwhQ1M06yC2MEAB4um3K79Cz2Ch30rTfcHN2lKXYDnhfS8gib01e3Bbf5R2+TUQLrMmNl7NQZ
 zsNM1sUUUoRGFE0Jmi2Usc2xRLvkmWCE1c6B5cVhxBHxa1+3HJBwuKR6190izGi10uEDwtc/2GZ
 zwlDmOFFkV8c+xaZ3L4+l6CoGN5HczN6pVEkEd+e6qV23sFrns/v2H5v0Pk0u+ieMNKd+UYDjDO
 4pT6PTMn/BYNvRorslozYznFTMWD+Pcmz9Jkh9D4z7nr7uerEziyhX3XI1PrcK9qBF0uPrmV+RU
 nrfxhcoMfCkCntt0x5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010111

On 6/30/2026 7:00 PM, Andrew LaMarche wrote:
> ath10k and ath11k support reading calibration variants from the device
> tree to locate the correct Board Description File (BDF). The ath12k-wsi
> binding already describes using qcom,calibration-variant but it is not
> implemented in the driver.
> 
> Many ath12k designs expose all the radios under a single phy, each of
> which typically require a separate BDF. Without this, the radios may not
> come up or will not be calibrated correctly.
> 
> Fix this by parsing the device tree for the generation-agnostic
> qcom,calibration-variant. This allows the driver to properly select,
> read and apply the correct BDF.
> 
> Signed-off-by: Andrew LaMarche <andrewjlamarche@gmail.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
