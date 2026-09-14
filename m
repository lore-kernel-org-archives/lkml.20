Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B546C84F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395221; cv=none; b=bGhEJyrciDzYpQ7nCFRvO2hoOrqwJuDIZjTSttm5A1+WNaTGrzG4XOvC9KdduU1UasItVPnfmN5b095iLRLKqtbrNvLsbCYmbbGKlmhSVvQYokY+HD5nLZM32dwQWOOE9+z1eojehs6KSUOGTKJJPoi1Vzwp/7K0rZz0Mxm+rDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395221; c=relaxed/simple;
	bh=Ja150srwy3mFRrkC5Saxj8416lNXSM0AjqAqBZ8T0iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgQY1PZ1/NHei5wl8OLfgLM0UP65I4JSyRqnA4X8JRxEO/EvSkXjGr+IyAjHs634aVoP5zUQpDuG8vu27Nc9t34aeSKSxhfDaS5p/8rXUjP9HZDtV5ghznQL1WyAllDnCeu+m+AzAzwiETs8YCT6EOHe+Qh+jZenodLuz96YMv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIyhfN9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqKG4PGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIyhfN9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqKG4PGv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Xwp674511
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rYzXu3B4dIp7MCCvaiH/6Vgp
	CIXGA5CKASATJDp6n9s=; b=lIyhfN9IMenvjTlpFjdiWkSY8LDTOgpJB4h+0Fqz
	O6um7sqLwO5lmDY+i4jBPIopxm7MrJl+k26OodzhP2K4sIJ4rmcFCuJEaqEN3JHe
	10efQZErtlvnoGbZrrTHXN9D/tY8bPLk2Bjisi/w7xsEAihle8mYkjbIAEyAfEFO
	0Fqs0rhwbtsdiXewMxuk0y41kRgyWMcDmsO5Mj2vvk9L7Pu9Tmp+xwYw1AgAcMEH
	5Ch3/6vTUtVjPILetgLy+U4Ai+XrFVpygpDtEYE2BS+NYeZBs6LYGQZ/npuSNUv6
	jhzek16eOyFIyDBOyayvpUzfx6lHO01eMRL8KmZDS8IEPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs930f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:13:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so865853285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395217; x=1790000017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYzXu3B4dIp7MCCvaiH/6VgpCIXGA5CKASATJDp6n9s=;
        b=HqKG4PGvKuijcIMDC9wib6fZ+xdEIczUVEBKW5I5HKgJBnvrE/lIprnbXdmJmarKNL
         hjx+4FH+1zR1pPPbhcrdYU9Owmi4CIfip2l6GdT6mnw3uoxCLPn/KkEucGXy5Yi9XzkH
         heddmfWmhJ9Iu2h2McAKA7FjVwjRLliRTUcfLDcpHI1mwYIGA+VkiGViXz5p6iT6/KcP
         UikP6qKtCqep6m1yGTO5yk79BPmkryRV0lcvlMFQ7aZO01otnOLGG1x74INmoYlnAnqF
         /XUFSAXgK+dCp8A4TowEoBKJ/Chtm8Bhcnd2ePmW/QE9nbw8xl/10NrnRFa/pGBEqiVq
         wUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395217; x=1790000017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYzXu3B4dIp7MCCvaiH/6VgpCIXGA5CKASATJDp6n9s=;
        b=Gvgr/dwZx2yur6Mk3OQZ9KLyeHJM7i9CAf8ek2m7Ywdd70UVwZR8O1Y0XUQEvZUmHZ
         XLdrbNnMd8NpmiTzLoTyhJcRWkz4taDKFfR52XzOxnFK2RLsl+H02mLpL/8QrYa/6uoe
         RRgtC9u9sy5VH5kpwt8XqthDKypfH3UGU9nfkkTp6LryIuLi2GIS/J1rYM0iX+KkzBRU
         2PPx7eelT5gvxR9S+V5ZQjO4sSamRYGlaikTBRcmmmy0rT66CFGEwxuNwBFogRLbS5OV
         7XfihvtfV1CYQ/Z68hmXHdpSLn/iHzjrTkGn4maMv6p6BSuSnqhloRkWl4FOi1oRouSL
         L3Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwkafon+vaibAgAPSdLPib40r90/jtOCGN73O+ZgvkP7DReVHOhVpQIZ2iu4GukeYyCdzg77SfrEmvCJrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mggVrEv7Njdh/I15LNkWjuOLrdNWJy5pmt8iWickDtsFTYIGgO
	0+dPRjzc3i2NlnOmJKDBqAblLWVjcGop+ZRjfuw3hFsrZKhiM/w9iSQ4WetcpXwTArrU79maqkn
	r73GGNpABtE5Jg+BeBVus2MJVBNxowC5sU92B01i/pUmTblFQFS61dxLtptR+mgnVfYM=
X-Gm-Gg: AYBFou3qpmnJH/ogAKq24DNx7FYQ08OqvrKMKzsNApC3wIN9Sqf2oP04W0nXkVqxXbp
	0+rEUUiPourQJqr3yQSwE02VGYNtHma1y9L9vc1wiHb9JADLHG/jj+8Shkhw1sW13q31RpplEyU
	QIQ/RhUuwK6qM3QkWgDMNGkjrzdNFzEuMMM+1S3QlNjPh7qwcNyjIVO97Pasaw6fwga2L95QiQE
	/5WfXgbA0YvQD5eNNVUEPYMT9qumt/dEVjB+iqbT3JuBkYW5LMK90DYNQzzGgKoXRT5FljLIEA/
	ggPCq9v7OCMpu82Hpyh6lPLp93w8gRJLV3qBXpLTev7X5NYscZfR10nqK97b+8oK8sWSm7fVd5N
	whx5ds7InrqXbiiE=
X-Received: by 2002:a05:620a:4544:b0:939:b053:ce44 with SMTP id af79cd13be357-93a1870be85mr692053185a.22.1789395214031;
        Mon, 14 Sep 2026 07:13:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4544:b0:939:b053:ce44 with SMTP id af79cd13be357-93a1870be85mr691991485a.22.1789395208751;
        Mon, 14 Sep 2026 07:13:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d23b945sm1815295e9.1.2026.09.14.07.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:13:27 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:13:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: avalon.vargas.centeno@est.una.ac.cr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
Message-ID: <fx4mot22jw2wzvd6nhzjejfjip76bpru77uj3ag7v2n6zedk6o@hze6gos4ez7j>
References: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-dell7441-touchscreen-v1-1-d79540ca5e81@est.una.ac.cr>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX7ovLc0FytBeU
 485EkLBySxQnLba1DsVdKzgQkBcF6uQIwEAGaAADUr7VclfK7irDE/HW/2UnZ6xEmzIZ6VMKpOD
 pCW8VoPFq7uSDlT4s3svAbgWjsawEFo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX1Vi8CRCEPgdo
 LPwMa+hmmV+TDmZ/gFuh+h5DtDiZharfisr3/tCn5scfH8/Wn1WH9FV1F97CWt8q9EDLhitrZvr
 3YM1fukjIOxKF1eFe3SRp5kOstUXcXt9p2Hi+AHOLM21VXpv7wW3OlMa8DGJMhG9KOQjVyTKsY5
 RvXcOG4RbQMzpXf7kH6G/NPZsvhvwJCrXmEtgVeT5GYba5ArJcI09/jzSZhEof2/R2HrflFEH3G
 oV7ggTpZmJ5OVVb+SFfexYBg3M03wWhafIRxoQYICT/agU5ki2OgSDl0xRi+0J1PAxvWZA1WKWX
 4xDfNTO8WKi75vQWnWG2bG9QTQHboUD1ZhKRtHZNGw1yMpZccvM6cH4Yw/1XY8HM4TAdmFyxRoZ
 Dz7msV0BsCxBCcy6kxzBjTwUMvf8aB9UbT96vprBxE3hcjK09PxJG5dWCkwc8pq2bODUpLlKNhq
 4utJewat5nAf7Jo6frw==
X-Proofpoint-GUID: gJha7P4dJzF5IPH6cZ8u_QBUSYRc0uac
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa80112 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=BXSMCdXCMYupIW_o_JgA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gJha7P4dJzF5IPH6cZ8u_QBUSYRc0uac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140203

On 26-09-14 07:30:47, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch. 


> Touch input and suspend/resume
> have been verified on the affected Inspiron using Linux 7.2.4 with
> the equivalent device-tree overlay.

Drop this last part, as it is irrelevant in this specific case.
