Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302276;
	b=ZjKJPidujg8zLKrDIYOUd7aWcLcU4F8N2R5E55sLy/7IRTZ//DYjYLztjFW83zgE6KT4
	 9B5Cka+5LtZo4ZdE//IcnXDCCy5ix9wuk9hvMqCcZ1A0qIsXz4rRm8uz+iR94XDA3CCAE
	 ISEhMF950Jj+pJ/AynnlioOPJmrtZ3qjUh71Te1VgGgVSJYJaxlpcjAKM1NfndjwuDxUC
	 Q0CkdC7IJcT+VLmhJliDhoCobT8UZ8Rgw8cUGvu4Wzlm23H8qT2FPBLeZ48GY/GyYLnzp
	 H5o6rVev2tHAhFsOk30WA7vZrvfoQz+5ntFtXKg8pxcUEFUulYmO1CjIypfjV/vKNbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R9Lda//rck6/AmcSNg1JTbogjOzB20ak4vlHDRi4RyY=;
	b=TI21efZlMQKhh5xKAOwGDTOxZ7XfqQdDwui0SvtsEpaPqI8H1x4J4oLPnTNwU6usOskz
	 /buPBUfz06+u0ZTC3bzq7fDwNCbDXZFrvUtcTfGgAFajkedaYv4X9EPI+IvBzUGVA58y/
	 xtCERxSMewZ0KtoPHcvawqppo0cvnGTNomJ8OWudaiW6uOkCDYSQZvm0LbHlvG31AjIHK
	 F1Zog+1od3H17TOYFLPB28IBfpu4e46oGbMXDTKbSFWRhaVUdHvcHDWmLAxd8hKjN3srG
	 Scz7K4ZnMUseEFqsXsSyk6IJaaTLEuuG1YPevVRHtfhguTAv1o0YOzQ/6aCmdysfROw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jlryqgtw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oym50KAI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214466070B21
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 214466070B21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jlryqgtw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oym50KAI
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lBAD3402975
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9Lda//rck6/AmcSNg1JTbogjOzB20ak4vlHDRi4RyY=; b=JlryqgtwdVv51kWK
	DE64SC9Chu8745Wkx4DntTxnT1QrDFIcMAbHANQDuItMW9YHFzzbqB23JiNtR/ui
	ZQgN2nVM20POUjcrFgm50hsOTgGiQQGZWC8Fu9n7Kf0xNkE0W8eI9vPxX7AZkNwP
	luGv2JASjQiCg94atfZH5/HJL8PH4+YzHIc/H/IHeaWMxklPQxfDxSO1RrbocaX3
	z7+WDFCokvgaxO2kW/fXbdWzTo9h2gZ4q0VJZOhmKJmMHxBULFAT7gYRRSHylu/r
	oNvGy3kZ/4ujC61JtNxac4Wohi3b4EgjvJ7SdYcsgLO+mei+jkei4EXCruDKV0/l
	9RYVZQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx841ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:17:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ea864ee9cso50789726d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302274; x=1794907074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R9Lda//rck6/AmcSNg1JTbogjOzB20ak4vlHDRi4RyY=;
        b=Oym50KAILC4JIMXZn8yz758Lj2P86XVtWzjk3Tzns6/SEE+yichkVyoe4KyO9/vvW5
         d37g8e71D+ClUrylQC7PsgdmXnJbxu771U6OMGNGN5aHwCE3Cxpuox/0Nl3cWCr7BdgS
         o3HXCP/gdElraqp2GUANboqtZleDSIsqYgfneWa5Gz7435V5RyjLGkps3DK+z7wMm+cg
         1yoONNLQqeCxDENjMr5TDyu3p9Ch/Fjes+vrYF8728+DJR2bcYpWbgh/F9b7Gi5RrREI
         z8Dk3216PRv4L5Iuf4MKDBKapYtyMmYi10xQ1jdhgUZm7++BeHhh0IPIvBKWGrztlKki
         Q2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302274; x=1794907074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9Lda//rck6/AmcSNg1JTbogjOzB20ak4vlHDRi4RyY=;
        b=NkZeKQete6wsK4NsMByA50zL45Moo3Aql5amEIoVtoMMHbzrvAqIwWZMHxlKSWAS5S
         aSY6u7Q1IHPixsnKbgZ33vS/aQZmFnTans9jEUiIOyBjFmDJQaHJkJ2dRIdIwBb6CNjX
         e1dFv3oRRpy+4zpQAxvKe7vMYV89yH843CEVc/oEHfKt2DwRPEP4E2fdjnH+rcT1UKAI
         zOVYBA7Bl8AVafkqJ4s18vsFfGSdRB6p1Y2E25iG8dpumw5ZhafQ8D7aPStyqCVfYhfo
         83dQhj1OhesuilTi/2/5qhVaa6waznxD7MB4EItDatcmJG+t8EpDT2JYQrAdN8MPwYsf
         wWKw==
X-Forwarded-Encrypted: i=1; AL+hErEV9rCmEu1oG3Dl8tg5XEA4s0eiFIqwxbXLHGKLmwHI8BeFll3xgvzP3a53Xfxu4sRQhWMZyzixAFB0mno=@vger.kernel.org
X-Gm-Message-State: APuU4Z90vAHZXYoQv0R7zmLXPvy4tTGFak2nJD2qHfc2zghAeULUz//0
	8bIJ4x0TULA24awM8gcooHfLJy+KQxpCbgOuUKT6uI215BqVL5oTuUYSI3uR9eUvELuzZc9sX6w
	MmAeMZw4o3wZHoB0hCQ4DDxmgteoFqGRI18+SpnWysvqWfTEqWZYm/Uaw/Fl8g02zO3ncwTIrm8
	w=
X-Gm-Gg: AYBFou1CbF+3sIlxQyia14jwJxayF6xBEROHYolUHADMqPA/RwCCX06uqfoW3RWjM7z
	IXdJmgYFaRMLopOz9IIyldoEYxETfsTETZbx6+bUpV/Zf9U/OUEAcMvvsX76ThjeTW+W2ByFolM
	OlTOKbYLJORKpSFsG/TDOjon5Ofeu4PJo5yvGazG7UJtUA6CNyUbgz8gN3q+bHVmDmQxqnWlNoU
	tX5jRa4Sep89esVuRSWuoQ+gnJ4WF2W+kZDqO63Iz8Xo71NXC7SiPBoK5TGTjqusrQ/KjudOC/J
	XVJZ+I2IUtqI7tGOvhq53T6GVLsMxS7P3kbEUK4yvWcP4t/+UeUWgW+kxvnORMp9D0Rn2LDJXw6
	7cO0EMit+3NTT7XTENyulpqgNWi7E8xO5BePIo2x3bj6drpq5JA4wU41U3F2whl5qgphVNsN1tV
	48zFKjkpR3ifK9ndFvQRp1FxnmiEvlAi3b66U1JHAan+vZ7o6+6a1tfjhXyOD8WQ==
X-Received: by 2002:a05:620a:640d:b0:93e:7834:3940 with SMTP id af79cd13be357-9479f31ba9emr287110285a.18.1794302274334;
        Tue, 10 Nov 2026 01:17:54 -0800 (PST)
X-Received: by 2002:a05:620a:640d:b0:93e:7834:3940 with SMTP id af79cd13be357-9479f31ba9emr287108385a.18.1794302273938;
        Tue, 10 Nov 2026 01:17:53 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm3840315f8f.44.2026.11.10.01.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:17:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] power: sequencing: core: add a note on descriptor serialization
Date: Tue, 10 Nov 2026 10:17:51 +0100
Message-ID: <179430226873.6222.11263289504342915586.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-pwrseq-core-desc-kerneldoc-v2-1-653e6b2749f1@oss.qualcomm.com>
References: <20261109-pwrseq-core-desc-kerneldoc-v2-1-653e6b2749f1@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2e143 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7jyIIPOaxoYB-dx8Qf4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Xv4XsFqr9N9NJLYPSfAUJrFv7NJGyHjV
X-Proofpoint-ORIG-GUID: Xv4XsFqr9N9NJLYPSfAUJrFv7NJGyHjV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX5BZTyw5350si
 mXHhHnACKQKg8QM7AVwU+NZV+QWKc+88c2ZfBRjE/CEUttBL2aap1ka07VyyuZ2PvQs2rmvYyqk
 vUiBfOQktBeXYC0te2SDZoAvr8kys98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfXzAkfD1gt3uHc
 HcyexrYb/ZvuJ48HOaw7vpY6s4MGiJT2IoDyZHQ0CdnTyFoT/V1sMuQNPh8Xr2eTyaETsQwPlu6
 NbP1KIEsadOsriG1UKRPLZz/h1vfckBfv33/+qJ40Gy+tzlsOR0bIdRxenDEiDRMtNGeUTXFVCQ
 ICTzXlEOgA13K79wuBE7GRnY4MMuDaGe98DrTOvQT/M8h4jzkN3Fwe9zpW+VzH0+c5tGqB7rsHl
 vfk/WXbFnxNM4DMGbDtssiJS2S/ZGF/qYACB8notTT2/0EpjfYjjFciUBDvfe28n0g5ryLq1M8D
 2d5vdwHk7Jzc9aEwM/bJERSPw+ucgJn1VCjotT8hnen/wd9DDAkacuB2tSAecs1rwW9qEPu2wNF
 qk1EnWBQn6tnnMW+5MgpQ4IE74SOYiSojF6uyfyEZ8XIzjA2HR0i5SzAr9bqacRXA1IFZS71Thv
 Ls866jPddHDX0EH0J8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100036


On Mon, 09 Nov 2026 16:19:00 +0100, Bartosz Golaszewski wrote:
> Sashiko reported a race in pwrseq_enable/disable() which is a false
> positive. The descriptor structures are not synchronized by power
> sequencing core. Instead: the user that requested a descriptor is
> responsible for serializing access to it. Add a note to the kerneldoc.
> 
> 

Applied, thanks!

[1/1] power: sequencing: core: add a note on descriptor serialization
      https://git.kernel.org/brgl/c/af805a1d3d3740b25ba4558d6273cbf65752c19f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
