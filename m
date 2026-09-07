Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6AB43F4A1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770183; cv=none; b=b5dDnbwTC2Fpv098hSnSWUaWwylwZe6Aaj+n88zDHK4hdxz6C0aqTgQYfYBZD8cWhPqKc7P4L1+ptHvQWumEdHpXKQvLCoJjtqi/qqY+prioZonxfsJ0t4k4AcSuRhZ43xREWGz5muRP5FI/6bgfBQx2NHNdL0EKSwoX0M00DL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770183; c=relaxed/simple;
	bh=EpBUO/pktu1LI8wvjTUn06mzyNUlC5RiWOtI6lhLAN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdEdgqCsGpwr9nfnW8IiRg3A9yye633FFVuGijWcaWPGZRyicX76lTxja99MM878eICmNowHBMqOLKBO+XbyelvRaLpHQvx1P4+/j8Zto3sBJyttLfyc4bEj/xGNjB/unHmmjmvz6wliiYrx13mPXw76Gnj5vgWzRhnsktJ+p0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4/mycc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJK+SZB1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a4/mycc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJK+SZB1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NNCk333056
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=; b=a4/mycc7VI8LHTRW
	PvnoRVwH/wOGERBA1yQa40Q/RMmfXKda5WqR2myYw3gu9wdSrE69ojWYoF2JQo8K
	THtCUfpQQMxPifvZATjjGLQEwolM66QXDJToEVZD40jAdV/vopAfkhXMpulOLjR6
	44MYbNdVqeW2ZjYF7uMqbC4oanrz+7EW/lYbrssJOUJNTeacBKALNDvX9UGvM/6x
	m6jD8W6N3HtMVfBhdVVAQOvDo0MhmbcQ5huG18ziEn8OV1yGUjthJqFJDFDo7yEF
	kt5AaByK2nJKBo7tOy6Pp8iXjU4hA+CLiq0PfLh/d/XxxcOwY2VSmVGQ0qG3XDfE
	sKhhIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua8e75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:36:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52e4919be6aso5260681cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770178; x=1789374978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=;
        b=PJK+SZB1wd4Q2tCQVle1fQVf4ID+feyIU/SfAuNfpZ1GH28mYDVvD8IMW+XI0Lunx1
         10no1k+G/1ieS1+VxFYwoWgPULo/V++sP83j+2tT7VMuIoH1tkn9R8haAejrDGr44Shr
         Ry5cUizHrYYcN43CU7nkoDAKJgfaqsXPQvtjTxk2FMv2C1/5R8zp4hvHMrs5uJxsVO5L
         6wEYJtaGLYUj/DuGV4wkpQD0gIDZFi7ytLyiOL6eWKsRYn3VhAyz1mee1lcOOCDGnCYK
         UsImCxy7GyRt4CYy7d0J5XNJFrImjpfNXvIPt1STXqn0rJ1BdlS6bSQYPw2bJKReXS3D
         S43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770178; x=1789374978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32WO/Xjsl8YBeCXk6vwKWTCZYT8FK+KYc95D1qtSyg4=;
        b=I/nh1296tjlWunEwU40dcMrKvWSMwObz5x3FF44o209SZ4VCENOtO3Ge/wTk5yjrch
         kvUkBiHRU0zsYAI4mJSVNMQxzCp1huRTAGNhm88190hysDwHCIJtjLXT6ZNh+eezMpIR
         jx1TPc7R0oXjfrVFNVdeZiydbiwficTwGs1zTungPzaV5EPlrtg7+UzcIJaY5coNdGkT
         PN9h6JOrRlBpDC17ugtjwM+t10U9qEKQF3Iix7QrHJ8hhp3jsbrzUuVbR9G4bDZe2NL+
         UTdYx4wyhXvPsA74IzuvHM3RJYqVn5KtxBjT2w2fDK0Q28BVGuuIbhfm3xOa64V8G0h1
         YYbA==
X-Forwarded-Encrypted: i=1; AKwUvBzZLtnSFYfJRwxqnwc9Ccbn1GAna4h4QSRJc/ofZIAgJXS/p2qfoVjA6xXFEafBOxJH7bedWRiLQVYV4f4=@vger.kernel.org
X-Gm-Message-State: AFuF++mPfGnc/344RTNZTlc9QiB5MKq0mQ2Zz0U5ZZMu4YecOXGVLGV3
	aj+n0YSN0XP8+FzOPdSGuhSvQD97n1zptPHOkcxp+Zgw3aY76GwI7NnXdXrQFzybXgUDDEmPKEC
	LO5VIvNjuddFoYRVGorFpm7yn1GVf+hWdV7oB9X8DmEMUStK4v+Z7n+LVAvGGNEUJVjU=
X-Gm-Gg: AYBFou2q+1t97+0PjCGnATBgqyLNsphBTArvB46nHAFGkXSpL21Zb1yPLJKdA7vmgML
	5DxeS5qP60GszG1gNdAd2AXA7LP0RIa0lVDowEK2DBWCLnctXslcIvfi/VDlmz4YOaC5XOz1ZzT
	gj8I427+cgzsWQG06ReGtw1Qh1m75OlUWedhgVv1pTzQIBd4stwzbhA2j5HnHamiJDilhnBe7xd
	MQ8WKaBYe9KyaKktISN2luKsoSmox0kazbpnOJajuSjcOIyyw0jwelS1e7SeGC2RG2cAAj+xy5Z
	eY4G9jSY+SbwnefsWpSCKFdKrj2u3ZLFQqVVVdRU0J4bZoojuDpMpOrXrzFJM78y9b2+8E+v41N
	bilNjivOtAYWhZX7OnROKnQ==
X-Received: by 2002:a05:622a:3ca:b0:52d:8270:8e36 with SMTP id d75a77b69052e-53064793ba6mr120480011cf.5.1788770177997;
        Mon, 07 Sep 2026 01:36:17 -0700 (PDT)
X-Received: by 2002:a05:622a:3ca:b0:52d:8270:8e36 with SMTP id d75a77b69052e-53064793ba6mr120479771cf.5.1788770177667;
        Mon, 07 Sep 2026 01:36:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3d88sm3973687a12.15.2026.09.07.01.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:36:16 -0700 (PDT)
Message-ID: <b84cb955-2ee4-4865-9bb6-3fec074f451a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:36:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] soc: qcom: Add modemsmem for Google phones
To: david@ixit.cz, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Petr Vorel <petr.vorel@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
 <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ra1xx9OC-pM58PijfmUWUtbH4VkMmv8t
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e7783 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=SIia9Xva6E6vu_7LpCQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ra1xx9OC-pM58PijfmUWUtbH4VkMmv8t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXyqzFBFQv/cia
 xt2zBpRlqPmIYAZqwk8H21Cs81CIjWkGbWhKGTMMj/So0Qadtn21PsA/s8kjr9asFs3aLvbbFfu
 MqaPJilUPpjgZ1seEmxtvxtChVunCUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXzrpoTolXbjuh
 NcRBIM3Of7JliTsdHVWgAloUzLXGuLpRsd7Nol3uUUgxyaT32VHGP8anRJVYNx/Iw/AX6IEeBlr
 4rlzLb3UzWorf4INsEzPHi4lYOmX1DfBMwG/TN5uUbRd899OKH+2uk2f7yWtjxh4g11qOhnrSWb
 BhAy/QFd263M7Seaibabsp9Ef5frd5JUviMq/fzyZEgorT+TmQcilGF1WiWhguUjuMamFZ9rKrq
 PWx/WpmGR4e/G+6qPwEUJxNBHugO1uBR3rgxN/qJn5PQ4VXQq7bU+KAY5OcMqqQ5J60Oe6iils5
 XjSDDaXVoilD5a2BaJIx+haspLG86oshih8t5nbHpX4oVljVf59IICkjm6aEORQ5T9bQ48uamD6
 ZOz+zpSrrNyjpVmGAQmNRoVuY4aruOa5Ii/jTP8lpdUzclo+Y6sC0sfoDJ2Qj5dAaC0ddlf86kj
 qwxZrNtC/6BcAqMeGaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070093

On 9/6/26 2:41 AM, David Heidelberg via B4 Relay wrote:
> From: Richard Acayan <mailingradian@gmail.com>
> 
> Modems on Google Pixel devices require extra information about the
> SoC to be passed through a vendor-controlled Shared Memory (SMEM)
> channel. This driver provides this information.

[...]

> +	ret = of_property_read_u32(dev->of_node, "qcom,smem-id", &smem_id);

Is it ever not 134?

FWIW you may find this useful:

134 - SMEM_ID_VENDOR0
135 - SMEM_ID_VENDOR1
136 - SMEM_ID_VENDOR2

which you may find in various downstream kernel used for various
purposes

Konrad
