Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E23F9278
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227596; cv=none; b=R8UrK6AeTBSS0+dfrj5goQmxBCDII7tXiypUFN+lDt2V1XjtPMX10eHrRq/g/jrR1dV78+v6GB6EFGyGDVaW/nvlMzUuHKxerjKbEaMSze5fLZzFDk7WFfqFHmONd5BZNQfFiFppSVA/PYnBdz1+J7OrToBUck8K0YpAQnW3iro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227596; c=relaxed/simple;
	bh=gC3rAUisz4qhWwbHtv3xSR51wQUzfyVCKvBE7uMLvlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLN/b4SA5iMK0Jit3SMoh32meLMcuM3Tes8kU1r6ZytMFlLkGgybd0iUObuAeJYdjV/3hfHdi3IcsV1T2FPM/0X1k574o+3/RqQHjJ6rMVOaqL0aH52NyokrAPyhfWbKN0BmSrd9cgfzP0kwl+WgkcmM7+3kL5Cyc3MgaOD7H5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oa5Zy7+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrFLl+90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oa5Zy7+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrFLl+90"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810p0gL1487674
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 01:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=; b=oa5Zy7+VBd8W9e3S
	gR4t8pLDJ26qZWgtWUoJQg4p9U0ZxzeUpd+dZGjpWArYLnnuqgHjRSkTMqWHNvI7
	J0c9DoKgEBPAE+R0RtAjzg1TvnPCcpRpRyMmPi/evGR6oL23QEaRPao1NOzFK3E7
	aRI9eOLT5WA+I3TA1lAk3g0Ax8MfC71/8iZLxXxVc1UfSH9iU6Le5Wb3iESe6D4I
	sAQ4Goj4MeNNOycA7wCTY+Od4sXDqwKIs779dNlxIVvuf3mays58IFN6VxyzEYbZ
	jrPnb9i5+FhZKF9ZfSStCaVTjD/Hp8El5d037lv1gBewJuTDLpaEARVRjA6ETy/8
	9fyYDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfch9f7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:52:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so4818535ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788227561; x=1788832361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=;
        b=IrFLl+90lR0YpmjPQrSIj5ffa27WZ+qIwWTq3UiwtRnqvawG7XmxcH+Tf+NC1+AxbD
         7/dh3d59GY4D4VzLXaV5rP2o7lQ8yjfvy1uaBcLrcuwZOrqV4IKejumbw/UoXOFKkyMs
         vTpOkUh9lJbGc3A+jY5i8PbOluhLPPePxrLGMRs8KPKKOdluQsNhNMlCLsbEojjktBKh
         Svd7DfX9UpBazEG5xtkC4m6NoTS/uX/rzOehK9h1pRGEYMa/3d46DALlNK0cP2uMArES
         VsmjlAOjDu5Mt+qdWe3zzlFKFDI6nFucB8a8eOwysscATy11z5CKiczQDw2uHrPLDUHY
         ln5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788227561; x=1788832361;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLB8BcqtseItV55bGvx+qIYw26TP76TQUsHtl0K/n/g=;
        b=RmWk36fg3zNbmtcUbELcjMlF0ctdWqEsggNene5QNjepWqQzk7XHPx8p8dEJnBoqoQ
         WaD35lF25gSsOyRA93jD8oKzvVkWfWGoRnFAL2ikTdRo1045O/DisCZKnSr6NwDLfDzp
         DDTdDHBcAa41G/+fFEh2Y4/Y19Qyl6jN9QrFt2ZJt3ckQEUYhbFyPmGmdDqutMy67HWU
         Jg0q8n5rjDgQPsJ900cCM6dM5ize4mZPr+oxQeJJ7xTtecWgsBIBjp3i7rTWIxmJwm6x
         PjnZYxVJo9F8HBJ3PyLzC8vyOkkzAtbLveiE+BnS4VPdNVMSUToQLRg7q+PW/F7apGhb
         8lYQ==
X-Forwarded-Encrypted: i=1; AKwUvByVbfjuh1OG7NJTdwbfJkpyJs9+Y6A1BC6468WJu9ivn1hMXYGsLGhZtekbS8DzKKoC+do3BQlBLH3i8+c=@vger.kernel.org
X-Gm-Message-State: AFuF++kh2OsDY/7vgPYSA7LWOHPgItHRn05Sju8qad38g3DximdaCaqQ
	lnlbql+wSWqheQz7L8RemovVSr0LD/z14NvclnG5cAV1i04My1rDzc9AT8xjRYv5ALe8ev6ujPB
	1WbQhXSEJRj01k4E34t8o19aHlxvTgrjOuAy77xSm2HIo3LyfxIZTXQ+3Enkvg0l+ark=
X-Gm-Gg: AYBFou2Heb86h5uqNw+tZ94UI3vsAiIf9of9TRl3DyUxzpx+e/uxq1VcuLGY3auZWMP
	YrnnMAWEtkwpJVwk3ExvN4iFB7TrWjzsc+7B+0NsjmLe/jtkomF/AjzadrzFY1BEC+8YG687ESP
	7kleM3lpYM7CNyXE4V4L1HWeFWKun0/qOxdyYwsWHKvMZQfnTs8q9P2Laq2j+ju+hQPI0ptREOa
	9vqn2hYVUAFuxnQ5nxSa0GtFeaPz193mZlES6unNK78s0VhlCD/EtS9J5fB5RR2V94yhO0G1abB
	B0NkTjNeKk/mrgaRNKqru/Su6xm52CdXNRLWnYmoncNRe8/tFJj/jZE7yFlq5FLW5ozuPqx4Rvj
	kZCwFo5EsaKMeD1aupctoe/PaNTZW6L3w/COWxfihw9X1pNZMrd0/45GPFEf4pj5XiQc/nHzV
X-Received: by 2002:a17:903:37d0:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d9526d3436mr20524545ad.3.1788227561305;
        Mon, 31 Aug 2026 18:52:41 -0700 (PDT)
X-Received: by 2002:a17:903:37d0:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d9526d3436mr20524255ad.3.1788227560883;
        Mon, 31 Aug 2026 18:52:40 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598bfa51sm42590745ad.78.2026.08.31.18.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 18:52:40 -0700 (PDT)
Message-ID: <5d6fab0d-e31d-4a81-a592-30ee1c6f295b@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 09:52:36 +0800
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
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LYqwxLS1o-M2Y5WI9zW9jH-cf8tNZxJk
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a962fea cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=erCTOyO-HGHO-QmL5V4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: LYqwxLS1o-M2Y5WI9zW9jH-cf8tNZxJk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfX7DzqIRRu0EIc
 Qklj1XO0t/c6vV8XHQKmC6oguad0KPKa+nlbdj3Uvl1b6reHy4lt/KTlpaLo/zxvdic1lo911tH
 QOCvGWPoPkKRBNIPUVWvJSMHObmZ0Jw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfX39LWUouae8z7
 kSqF2dG32a58kkl6pD0N5xE9pK+o+1A5x9ozXOWWtgUGaesKZo2c/dJNvVeOxBGhI9XpRfOoe5w
 dnB6XPeaZ8s0t/OaF8MEfe+9a48rrBMtucehouKP5tTcKrkUOAWbgmfGXhy0mSw+c1kF541y6+S
 F9MhstKSWxqq/el3YjkRXcNLHnBqn13KJqNWbROWV4bnFoa0Xs/s5yEGdWCTVhD4YAuvcci+Ntk
 ZzMSBtdvMWsxACEXbZ5F2J8wfvNArG1beP+zIIfhVDEEnYXIF4U0v2B1KfT7elhMh4ml/QPMFQm
 2YE5+AXBFjQnXfKXdDY0wB66TcOTurqHC68qk5T9XnUKlJFBkOrwxgBPnrV4VeIgsbNMIs/Myf/
 KxLonkERN/7b5TDojEsWgj+JilCcGHtKxNhKUCZMEEmm4Ya22MfPKzd027y1mLSfcP/HIPhF2Vd
 N3m9Anykyt9xZ+39wvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010014



On 6/30/2026 9:30 PM, Andrew LaMarche wrote:
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
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
