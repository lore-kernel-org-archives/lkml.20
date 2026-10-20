Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481640;
	b=cW20A1bM9U1dVHF7lJgRVCsVHXTRS0gs9dNMWKfqoVYzbu+lTFVx3xfPgNyEX3Mn3uyx
	 96gtrMrNF8vpB2vzt8OhBkXAaRRKzBGmw8GG3LaddRiaLGkLliJLLJCosze/wLtU0/xLv
	 vxH/ftFw0xVsmSxoT09JCKbjXZyOhXdBjxteeqwNQYf0yc3yiPRdNBSJtD8+sBMS/gyDT
	 TFKGxWUX1fMG+7GxpH4B0dcOXSgrCzoIKeSiVMT/ENMYIUHOpdxBl66s+uhJhF/bMEvTp
	 iy5WpAEIcMWZdPSysS7F+KyQ80Q6O8RnCseUYssliD1pi2+swo/emKQ2V2ev+FEPWOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
	b=3PK1zJ4Fl2jc450wwQ04A3sTahJBvfdI4auU7J1vVeU8UOq7ndeLC2VXv2nXRy8x7ZWB
	 mWfFK4s5LVCWPEn/BLkC63yvo7tDiDgQR1Ocll50xzT3mTHoeGpVUZx8yGmN4ZB1PN3z7
	 DY6ZOjpYwyuD8qRtuJwQPhzOQmRDGnftXV5ogXWmM0KT/zWif204OoN8dDh9V4585GCoQ
	 ttElzpMRetvwPKFjGvGDOX+/PuwNwwA0VhSL/qO1INXcPoLMVR2gGo0jwlCAuAmhPFEWr
	 OUN+LElAYvADXfhSxgmQDGr3ampurq35IU4lCv5RyIMoasal+xS28cFIRuRo+ny+9Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jxe8ahch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LF4XLKkC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79880606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79880606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jxe8ahch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LF4XLKkC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t3Af1253890
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=; b=Jxe8ahchk1wjRBJc
	s4o4UFhlDXJ0jw+NqXMrnEh1GWL0YaAMDQR4nmF8AFWbthX5JqJhb9RBoawKuzR7
	RA1hK3KqMQ0MySBNY9jS2cYOeLw383XT5U3HMmGmXTG5tmoOW8qURACbpH5MK+Be
	1DliUpgwv+GwIvPWHxNQ6gfRrpa2qml4v5U6TPSI5MaTcYfHtF/EWaLoV35PU18C
	zeJH5oWNEZ9f3RXXxRBQr7JwAKvbJ2yr+TNli3HzGMoQoM7xqZUf+rXQvK+lnb85
	0cWqYTSvEztmg1yA3ILUPgvO6Mr5r4O0fekBS3NQpMsPxtDXiFesRHaClSLhjm/f
	VqKgsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9d7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:33:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so60525285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481639; x=1793086439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
        b=LF4XLKkCdrVRhD0guZOYI47HA+WoZyqSC6ndjD9E2ZOV/MX9ucFFKKbFuQMYCqIVjn
         JDf394IkiEfxVu7W7zGmvzbjxPNvN1y6jHcNjJ1Dexmfnol7whEK+chCrxPRcBqYh+DK
         CeacZaKMJXPTK2tO6ZheNMzuooxq40OMewHtM04C2N1Kp9xe0Er1sGM3DOYDR+k9rwqn
         kjlzT1/t8gfY8sG7SBk2U9PWjMC/Gmc/2GVxIICICi+M4JJo3k8ZcNa0+cIURGhM4cWM
         WJe3/BFbBPqPNvaibip6JgkNaLUGu5ymPemkQdyetCYm7Fpfzn14o9DxsHUE8jyOAqPc
         vmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481639; x=1793086439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWzrZZFQhSyO/FR7rQo4rKuqvNnZWfQyCXRPSU+R25I=;
        b=JOGVHcP0qe6q6aD7eiXEMsrcasb19DzKn6GZ3URIfsXdaN6+1AdG8OOyxrl3SEjQ6g
         m7tpCmUKkY6/AcItSapXdb8gg4AEApofzGBudks/zzee8MVJkgVJPa8BlfzhnsurhXYc
         ZBWydu0qqd2S6avrX9QPwTnPde6V7FfxIOnoBzpr+Y5ILC+3xL2cz64EM6oC9julm3dM
         lq4pyl4jCSbvVqtuEXneDCIBs33+JiaS2QH03M6/gEmPOHF9aQq3bUXYYkCGGIqbmJn7
         r1D32ukD9Au0AwPtCLh9bfVvw419e0PuVraNDc+7TBxHefjRfzr4ULGLIwz5eTvodNCA
         wwLA==
X-Forwarded-Encrypted: i=1; AKwUvBxTIMB+w4dw8agt8lowACA9tbRiEGrG15qMZ3l9VP5uomE4+Ya1y8gVPMjlASTOD7rV19s/BsJWOiQIq3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1GwGqdTxrfc6vuYT6ibYtRo59VoiYm5o0S8CX6MA9R6UlXc9k
	RSgHlhHtDDt3EFymrG2qK2XrOeNyqVfpjU5uo5r+m0GIrv3X/zi4tfyWfFL8+CKyeSWoYCzidRp
	Ic4Ency1GJ8HL1VcUDrJs4XOwljzwGlWj1b1UyPvSnh4137a/dwYHJlkdqIB3EuOTS2o=
X-Gm-Gg: AYBFou2BmfYmHoauP4/08YbSH2bzkjln5FgChQ3FEVKeIBL3GiqbrnQilef7aY33gib
	0BMnK2875qEJ92Dp7le0dw0K/Adl5WCS4YBorWLDpwtd7DzHqcmSzQt03Uh0GRt/aSGz7iFflRn
	HdbRpRJsWbAHuYp6uQc0Qd4O03NRySfo3ExUN+pqe750CeqKpUVRPzBYtc4YouiQGEtr0ecHQmy
	N/XWiRr5ecHpQ+Q4eTDs+IQWjppNtxg36lLdZm13lJGi1B6XVaJl86Iy4uIc0OB0nMD/3NtuhK3
	K7+sZo3Rf1MY7R479K8dMjxd+RAa+ijylN8TN1ev0dsHuemY98teCQn1/PUMerQuWLwaQlFzqhA
	FnXexyVwfr+L7ZyPfIihuoA==
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr179572461cf.2.1792481638728;
        Tue, 20 Oct 2026 00:33:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:52e:3991:84c8 with SMTP id d75a77b69052e-53645d643e9mr179572261cf.2.1792481638228;
        Tue, 20 Oct 2026 00:33:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceadesm461490166b.20.2026.10.20.00.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:33:57 -0700 (PDT)
Message-ID: <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:33:53 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ia4GCftK7WYnKOTnIUEYJovsQTfpEgnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX2hbbCqcT01VA
 bXd0tvLm78azWP1QCb1Mj4YE/vKEioTiqFyQNp2e3R/nybBuLhL+e+ssdaCcXFr5m3WMfeu0SK/
 GoDOvl4f9DwTTCAHWcSQPq7n7zkL3RoW3RAnl6mlpdwMwPh9oWsz3K698hUfs6HR33xvWKpvyzh
 ktBgL0gvpZG9DqoMyGOD7wgzGM/VvXn9e6JKRDV4ZLGcwoos83c0eki6zxEQZpG6WJMxemFz8EG
 igAIadvVJvH3D/hg38ULeS5qt/44M1D+MhqUjx2uP24GvD54jd3TFlf7avZ9VDIA6cZ0wwzEAxJ
 Gn/VxHkySMf8i8gDhHolyMHiXFYX+vWhp81KqokmlZWXo5kdMVNIlJL2xx5D2Gz7t2jnqaco/yl
 GYCNvpz0q5/N/RDCAlIfZjRGzXTGn1n52oO8zBhRSlUHODFLLyOnTb84fcszQ6Qw+yRMOyny6Fo
 BLKVVIkeu85eRydEKoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX75VRjqSyIJ39
 Ws6rrOUP5VBQGqa60sZ5HbliLBf1EdqE+5ohym5/hYgjXxhKDuwY0SI74SyEKR7TqWE3VrOSDNf
 cDuWReTCQswW1grLaMDrR8YfUmqzxSk=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad71967 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=nd-lUt6iTfUX6z0NebQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Ia4GCftK7WYnKOTnIUEYJovsQTfpEgnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200029

On 10/13/26 12:17 PM, Luca Weiss wrote:
> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>> From: Jasper Korten <jja2000@gmail.com>

[...]

>> Drop the output-low, the consumers already take care of the state
> 
> For both enable and pwm?

Yeah

Konrad
