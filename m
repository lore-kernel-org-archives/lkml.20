Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798487;
	b=O3vZA7XRfJOLxb6O0EoZjLSt5mtYv4koA8HyLRx46e1YbaIOkXbnPm/gRI4e1eyxmQEn
	 MAdy6O/imAGLqd3PjJ6OmO/yR8MY5cg1uRCTW1g5VXGAhXHotLVQza3Oh5Esf9tTdTorM
	 /CkH80pAJCfO+ls2oeOISKlo9lIaUCquJzX1fNWDGwDGx/GgPN8evi9xmacIBbXqnyf0l
	 X/abhu0kssbyKjQtYDoeSSydsATorANqL5wIZWFHeuVnWY8S09DyHyNI4WaoGFGC8nfuI
	 U+4AQT7jyk8khSrEAbLI1SqPAu5KgQ4QpPehPGlUSW3AI6uaMP5bA78MXVVikUebiAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qo4pe7avcSY5Cv2vjrKx5CQZiGftqTo4ZYX8oBfFgQU=;
	b=sLTfHrjQgFOm6608QChAh2ljnuuwJfdIoTBc8+XJsu2rMcNTMs1umtzeJs2eYxRVf4gb
	 M+cjlUE6V6ZMmbIzMMX7M3PyS2U7nk0jrcgaZneygWKgIdEVuqKOeYEHWNjZ1hUVKj0eU
	 6vL8XEsA+LBEPHwiz8K1AdeDs9v20eFByVq26bAkRsmSZUkAmXw7YRigR2jxykY1yBrAe
	 jkqaGTP6q5Hs2hjsOsOBwF7oBvR2ee41d9lrWfEipHS5GtIhSrVD5ipysbd5d33WxG455
	 bRwihymnRiaKsFrbeKQytNALIrEfl6H8w545ecbvaRYf7yTn2DdcQ7p/P/9lZBzesaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7mhROGi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2uw9ryP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF2606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89EF2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R7mhROGi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2uw9ryP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZvgr1700409
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 13:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qo4pe7avcSY5Cv2vjrKx5CQZ
	iGftqTo4ZYX8oBfFgQU=; b=R7mhROGiOL6p2MqnlO1Hg6L2M8Ht89mafYPL2Dkl
	f+4hp8rWPFWVDcirAgkzqrJPWVjrvLM6nnIikWuY777x9dd6IIYEBJgy1K7VJleO
	rNalgb6jwpFkReVE4yMSy+rY6KA3qZx9JgkCMbVhi9UrVmZKkAovaapNOu1AGAtW
	SpljDoCPzw5evg7bTF74EO40pgdEUgYfxaC0LJ/kVLt40xX/8D74TcrT0erKhUGc
	Gbj6d3T2lGwZYOKziqXQnsNpJ4L1afRkHtmfNRvFZpO/sRjjabBfBIvbbWu0V19B
	z0tTJKIWZLbAPwiSU9DMdHMnsQDIdnUCfu3M+L4LJY7sdA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pygf1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:21:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc0418036bso131286137.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793798485; x=1794403285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qo4pe7avcSY5Cv2vjrKx5CQZiGftqTo4ZYX8oBfFgQU=;
        b=O2uw9ryPc4xEeCfO8TPlgEId+43tfNPkoi3xfTVO1jPXwiSMP4CZqaJCffIvh518CX
         kVsTzF23ih4qLJohAsPk7rRwza9MvScQPMPSHW1NZbb/9JKG595tk5N2NejFvkef1G3o
         ahybGlUN+X2t7lwwZV2SLazu4zBgppP6N/JHwEpnGTxrNZgNqoN0icGzmlAkHAplGbRx
         ASd/EXHLDfMIAYNEL1ilZ6mMrxxdNBg1T6+bjyp5T5cMg0P09XyssdXuswTZcX58jg2C
         n8PKruAWUYz7qRRRpasRcGneb9pld9FeCWjs2OPogwwKXdD8nhVGV67iEY7HoX5a1ckO
         Qlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798485; x=1794403285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo4pe7avcSY5Cv2vjrKx5CQZiGftqTo4ZYX8oBfFgQU=;
        b=xjFZbg30ZbJ2Vha+t9arIdzKC7is31Cmj5lu4eElOet/dhQ5643To1cBHJMN8aSMRs
         nerMSTGugyQM2qJcRP3pjD14gFBOo/KXdBx85sfyXSOm0ASoxJKXKXIbkXtv7wQxzFsr
         LFBYSMD2/jwjmKIHu6i9f9iTSYU8U+eAJr90ZU6RCU8Bjo5jA0O9y26cZbMA2eHlETEy
         qTGqSQWed/qGW3LL4K7PPzL4wXQHoy1Ek+2jovzZpDWDOrOdap1fX1v9IkXeZLRJLc1k
         B4trv4Q/HmuAqXTi9ELeP3V6BfSkD0PkPb75xyGnpW2Pr0bGRpf0EMKm9G4Sh/qo+dgF
         sTHg==
X-Forwarded-Encrypted: i=1; AKwUvBzTRUQ86AmdVpLI0Z+aafZJrNAteFesUVzLMn0U80p3UlBD3VdsmhXpmbwpZFXUPjjXMkQQuQ4hLhvL8hk=@vger.kernel.org
X-Gm-Message-State: APuU4Z++ORUHWUhAYMtXeYzGop+IgAQNB78/SMtbJp6jFmE0Qg+4SV3S
	OBedViq4P7zFs6U+P2zxVEJj+HryAVE7ED2gu+8EbKat5S3BuiMd3leb0svbW+xODqcgu/DlxOF
	JG8rkEh6q5vFKk6QF7LMfoXMNMrv5j0oW2rsdKWwpHcIZyhwmEBmrzRTyuekk8b1mOjjeLn4pWZ
	A=
X-Gm-Gg: AYBFou07jSd0+AoRdsW1Z/GdZzVkhKLJva+b3PwVqLdRLyUKiMw23Qw5Gcw6WyZEz15
	TG+pmxhb0hXSUOQfaVQZdLAx+43uMIFHMptjv4ZZrrHcVaWx1IM4X3iWX0AJ3d/kPlLuB2l86cc
	LrpaPb/wTU1PRtDnpMcOxO1uEoIXUt6AgO7ygAyv+oY8p6Yd7O5xeOiDZVpjR978xzoRqEgWuZ6
	e455IBcaoqyjHpstwJvRa9WGXfFBbNnCAINYbzq+DNLUxGXc4nmu9iQpxaMB0GN1J7sZfMATZFq
	w5QKN9pds7eY7u5/5ilvZaf1lY4Rg5vNJMhXDpnmFUnICFlurdzFWe4TfVtEL6thXqB6ksDAmnd
	3UeiYZKr2yDMZuz+lLH0CC6mKvJwx9TIiG1IMX4008e8ibCkkXKJub35/dDoo/k0=
X-Received: by 2002:a05:6102:149c:b0:7cc:9d83:c670 with SMTP id ada2fe7eead31-7d0727380dcmr4847991137.25.1793798484416;
        Wed, 04 Nov 2026 05:21:24 -0800 (PST)
X-Received: by 2002:a05:6102:149c:b0:7cc:9d83:c670 with SMTP id ada2fe7eead31-7d0727380dcmr4847970137.25.1793798483608;
        Wed, 04 Nov 2026 05:21:23 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d2bbsm4151228f8f.33.2026.11.04.05.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:21:22 -0800 (PST)
Date: Wed, 4 Nov 2026 15:21:21 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] soc: qcom: apr: Narrow critical section in error
 path of gpr_alloc_port()
Message-ID: <f5iivuswaihysan45izwqpzgnrvxjdvf3qqq7ihw6bcht2xzcu@6fxt4h7hg2b4>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261103145635.309032-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103145635.309032-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb3155 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hx4PSVFuWk2BDCO8aWAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfXwxSPclvHbEEI
 J4osTcgWbqIHd8Uj5TtZT3UDP0LFnuTKgRA95s2QNkgga4qPYT2Duz8gt/06mj5JZkWP2tOkb/b
 11iEV7uKKfMTf2z7rOMIm5oLn2V7lF8axSCzM6+1RBpCZCl1zgyiYSfCznImj9X+iZcHsYMkUF1
 KLLaHK9tOC8GbSXlvHyUhePk4fmbgspChvcBaADFoRR5CMQGKjXqPiNgy3Yh3AG2qdOHWgOes6n
 R4XAispyiVksffzwcJGFq4LWgd1gwIydJEQ1VdARBUlKLl7pIGx5ZMR+M6NRgw3ZHPUkeF0uXS+
 ox8q1/HjiPNEoAoJZFMpLM7+i2E1CF+ZaWfOz8PjySrMlIC3J/4SEOPndiUmyjKDAnQgmURRFxt
 AZa6vt6nZMFI7DyvBnveYvMkDmCshn8pK7642bMPDZALamchT7hgUb94Q/YntFDTRs+RACoKgHQ
 ve73GfENLIqNZrBUnjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX7iRsPna8ROyp
 DLVPvuiPiYWSDGrTOwEB72Yp4U7T27x7czg123ukFs7LpLjBHIHQkyVlFBmyRIaNR3zF4JRNzki
 8VOayktxFaCKfQTPL0Y3Vyc4EkJs+XY=
X-Proofpoint-ORIG-GUID: QPbURhJx4VYkVN_4QC5WHh9d96FYsynn
X-Proofpoint-GUID: QPbURhJx4VYkVN_4QC5WHh9d96FYsynn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040053

On 26-11-03 15:56:38, Krzysztof Kozlowski wrote:
> Error path of gpr_alloc_port() can unlocok the spinlock earlier, before
> printing error message and freeing the local memory, because the
> allocated memory is not published outside of this context.  Shorter
> critical section makes system more responsive, although gain won't be
> likely because it is only an error path.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
