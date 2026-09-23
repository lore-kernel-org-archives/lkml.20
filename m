Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221346C847
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161692; cv=none; b=F4SeNEmp8OEmHCEI0LH297ESjz7DBKUeOUv/Apg989vNKs4/uAfIFAFqk8af9La910MhEK+EKmzLQ95ev5Jw4DTdPeElxnlIK0683nh5JT+yk4g9Pu4vgAbur8KkqYSF+IWPWDdkilIVWzZI15gkfAJAC7tAl+gYkMU5y5P2/C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161692; c=relaxed/simple;
	bh=aNpgniYnxQlNL672usor40GA1ROVwhv/hX+i7Cjh61Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=our2bjTe3CAknzRo/y9qGCKEIRvAzj8x9Ueb86g8sMIEpLN3zTrVijYc8iPQ1byGgyVmuQ8dewAu2RJzla0QSf8DAkfb5Gh27lTCAq0SSYST3taftfyVF8NObzlOtOq1wThyt/u/foLgWmYs2z8RyC4h9mcO5vkwgXr3Hw7KXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSHw/GHX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyrBczzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSHw/GHX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyrBczzK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2YU92236604
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQe8h5Fz3oGi4SySlQkRPltrsSbsEydraSKFBHs6ix8=; b=jSHw/GHX+7qiVa5u
	iVT40o5K3QNgEYlwEdP3+cc8K+sASk68b7YPP/o4e6MPUaPDN5IGzEYEyGeBDiG2
	NsOPCamSnD4Cr4AaCfZ9ryXB4JD8zmhdJOeN5BuuU1phCLlwJUogyiCcD/AdHPeH
	Ova2kwYXGTQabBBjGIdtVUMpH6SozKunsEYslOdO8l8Ul0FVEu1giD6KMd6MOPFI
	ZhpRSU8zWEnqzcbFca3gz9/p6s4N1wf1w181DjtTCXr1k+jJPjNnVLk8YMNDz3y0
	T2caOHu2IwlCwV8WUX3ivV6PspWV9Hi2G1pgeK5Sxgvf4MpdF8YDK1sCMZtE7FLx
	o8F0bQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7gfjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:08:08 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14388794dcfso866829c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161688; x=1790766488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQe8h5Fz3oGi4SySlQkRPltrsSbsEydraSKFBHs6ix8=;
        b=MyrBczzK5v98yOh76bPSdKC2T1QdbRVJvo+T6waguDWYBp6q0gceddoR+siQvBPh9w
         NG90hiRjvz5uFvDkpkKk2pAbsA5dsRLiTmrZkJcKv2OJMwbhDHL01k14xUez380LiTjE
         Fg3cuwqi4LnaDGcHVRfkIqh5KjZjKgFRAMeF5R3g8n1X1fOuz4llUodc5mBrVUe9tE3B
         PbyCZHPfwc84tQoWK6MrzJxzhrqxx4VuRty21wE6tlD5XawHpbUOCcesZ4k9qp+4ZLHz
         kZhlydHCQ5kWM+aSCmdohsxZrFs4kGbw/76La4FKsaNwCE5wjXoHdO8OjYEY+avUIxBE
         Tukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161688; x=1790766488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQe8h5Fz3oGi4SySlQkRPltrsSbsEydraSKFBHs6ix8=;
        b=qtiXmdg2NwoY7+NBR7WNLkDwyZnb77ENCpdpxlDtAy5QNGsaHMIyWx7qpgHqZrD+7V
         nek3GtrLi4MgcfXBi3WlZS+tzE50LOY9HyI2s6qCl8zOWlRriI53Ldcbg7Q5VI1dgyiJ
         LL0xdRxN4I7xBqVzejr07qdhyy828c81EoomrGP6Vq2KQhViKSZM/ALURoPGFesPGWDF
         rHsSc9Tx+5o+H+qbNh1Ok6XuWYy57Od0xRA9QyyHCfdNyDXqXXAW4XFb9I5fmgaQK+Ev
         OnQJ4g4w7vZgqyJlAUVVftXdLJpyIBN8MkoqCyW2VDQETvBXilPSxAAtDSgvyoNqIpV5
         T8Kw==
X-Forwarded-Encrypted: i=1; AKwUvByyBvvh0PwldM85IJf/6ZHNJZZ379SFwWZLFdB+xxURwIl6Cud0hp+PGv1IFdOUiNU73CXwErePQKG9gp0=@vger.kernel.org
X-Gm-Message-State: AFuF++neYofcXDj2mTFKHCenklVMte70UbudBvg2C7hT1vvVMGWOJZMI
	2Os7FolU77Oh+aDBmYCq5HhJVcu3mGJTLrqRNSQT+yXZ+oYBfi9G74DtyAW9Ig+t2hopkKEDv+Z
	HLvBoSwpKPJ9Gu4gHR4rQz+Yg5d46DNJ3aMVI1XHTvpo7t3NnPNG7DgYg+X8g/ofhc4vca7JBO5
	Q=
X-Gm-Gg: AYBFou0VFA74l+PCtQRgJT8iNmDBWLsUJ2UWUiTLwp7dwbrt3F3sQ1FfCuEciFgyVmv
	34TCvNtEzco8UMlqhHApmW536RvipDXKP3bdzjQwBVdZM+Lm0i09r9jxI1Iav2TL9Oww/ikWto6
	8jURF08uy9Yjn1w3UtSQclebUDeb6MWGdBZAQP8vqAEcZHuUhWTYUlYyuVcdLk8QQ0oRElKWevU
	XQFrzzqtUQd7jAGYQaJVxqe+FCXgbZz02CvAx1tFccq/YcMA67eR63QIJVvNrjATxMVAgx0qwy8
	E+DHUGGZyGXc+5+ule6oNZ6e+I3v5HPZzqvDVjQSskR9bLPFn0InSTQGHN5llV25pDVcwQ3Hzda
	A7D4qMsegaK7SonPxeFAkYjn7JBo=
X-Received: by 2002:a05:7022:282:20b0:143:707a:8958 with SMTP id a92af1059eb24-144f9176299mr2849956c88.33.1790161687950;
        Wed, 23 Sep 2026 04:08:07 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:143:707a:8958 with SMTP id a92af1059eb24-144f9176299mr2849904c88.33.1790161687339;
        Wed, 23 Sep 2026 04:08:07 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm13917357eec.18.2026.09.23.04.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:08:06 -0700 (PDT)
Message-ID: <18917c5b-a6a6-4b4d-9a1d-452b53add385@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:38:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
 <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
 <arJytCJZZnIX835Q@sirena.co.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <arJytCJZZnIX835Q@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NngEsiOyJ37h0Xi6UD-L5eZiXXI_pCHD
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3b318 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7yqfin2zcifDTxxPRisA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX20Q4mKDxOpnJ
 Y51znnzyLNvNVUu3ko4hqouG3mB5U5tGa6qfaY0bF32pla6k1H9UjkLI7v3NC7MYRP7gLMkNfF/
 MU8I9G5ijJ09Prlb7oXgvlsCGlLTFTXuHBP1PkKjl2ygI/mCJWc8jUBgGjCRWsNW6m1SqDwDBRO
 M9B32FN77zE95gRNqjLGGI+r/B03R/Q3Oic8XeI/+hl5pVGAfmpvCEM+PPHlN8dn9ntCn5o+LFA
 HUVM4tnioIRtfrVh4X8tcVAgCkERl9MHjJQchelHonxYBJzlrK7aqXs4/xE7Hnd8HR0q66oHdax
 kPQ87t/GxOYuCZLOYoc6qdWmglXdFVttejuZiM48U56GoYbMNAIhvf9NUDgizk4ZQZGHfFRaCkb
 RSgCKkmQInT8SwK9Odlz2IJzwqcTTAjXlDlczrYzdLLIaSEMYI+KqrUBYeH6vcVY38ffRlXgkra
 QobRsCA7sCgTsqo4xdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXyHR3P4gjMNp1
 DuT7SFEVMroPgaBBmpkdJOY0ExPEN0Uxgtl8qpO7F9bRCOgH/4ORdhVlmxKTQxoBgODZn4wUmcW
 eL53VQ7M04gUIVSECuYLZzFYSwuURyQ=
X-Proofpoint-GUID: NngEsiOyJ37h0Xi6UD-L5eZiXXI_pCHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044



On 9/22/2026 5:51 PM, Mark Brown wrote:
> On Tue, Sep 22, 2026 at 12:38:11AM +0530, Ajay Kumar Nandam wrote:
>> On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
>> context and cannot use the SMMU. PCM buffers must live in reserved-memory
>> carveouts that are SCM-assigned to the appropriate VMIDs.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

  Thanks Mark, I will fix the binding patch subject in v6 to match the
  ASoC subsystem style

Thanks
Ajay kumar Nandam

