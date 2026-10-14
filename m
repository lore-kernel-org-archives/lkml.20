Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251034DD6DB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980933; cv=none; b=sPiGFvU5Ogq/BsXW4Ungg5nqvdE+CpC5JwyRAKeeLUm5iHy+rSP2tGyNon1lHijWMiA81lKddHP26UaC86YzjoN+uZZxDJ77nso0xKj3y8cir9/F/VCUBv2+7lyMaNa0PwW6BahvjlUNQp8WhNuNfJEXG/Bpg8nnAe6eWZwjJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980933; c=relaxed/simple;
	bh=cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8Px4QjFkfa/S0WqdMu6/AJh6Ze+n8gIE/e5cQAVcyor4EC+ml/M0MvwO2zV78MAI3hSJUf9NxXB0aqtsYCnUSbrSRfO4w+qkja7UCz4UT1nZhQgR/aro0BZh0zuRJPR9IesksNt2+F9aoQ++znl8m3x4jJU5Ve9cPwxooJUJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBp5+gY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+V+VGp4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBp5+gY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+V+VGp4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAR2UJ466227
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=; b=hBp5+gY4ZSoNEJW2
	Ns0QHOcdMVFplW4A5yixPzmbT83GllJrMMhv1XYzDfDPxMwsIMpqvctjetopl7rg
	VTsyuhyeft8a120DfR9qYSNEvKxkDacKZnbcF8XELZ/Saf37AIWp41Q5SOnu8pzc
	/YSWf1MFEUMKq5nYOq1XW9qzPzFm7QgvMMVKz/4T/CkVj8Rt1W4n2hNW2jL7MUz/
	sF3+lS3IKgi+UXdn+D8FOU3U8vBwtz4+yOulOxXJrjb8nY4XQMbB0psGZy2EvPRA
	QOXdqPUdJL/EJTjP+arhDXnt1kKX55EYegrnW2MUIabMyHFS+hdkJu2oJkaeCSHP
	IIXDAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cre1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:28:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso59269785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791980930; x=1792585730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=;
        b=d+V+VGp40l7PmkXrCeQdSp9jHHv4JdaK0nsSF4l0X8/nyQIkz/pVDSo8iFPv+OcMK1
         11lT/TjYPCkgAfO2mv1cxKDj0+04RCKvuBdB5yBNaG+ovWtbppH8dhr/w7y3reRifLkj
         u8uFa7kiO8OD/0gzwT89373Vr4/WKjTkVWEGIqdKlHNZGgTvVGmzT7rw7P1D5dPPGaI8
         kN6EtUyq2xCaLwYmyCt+FKZLZj7ZOMAo62S7Y+qxkkWgKanPdK+JUT1OP32OeApNO2SA
         7+oYw7x0yzroKFIqhYNhIPLEWK0b7XXmrktfFP26/JeTqnU4dk2GuETMyjrfIBitMS4t
         cCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980930; x=1792585730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=;
        b=jCgFm0LtRXCclnIpMROSK+LZGlPNVw3Yz7o7Ytz2q+hRCPfeFUYi3QLHeqywaFknZH
         tvGHHsL7/oE1bITM6j9GYbK+R7XJE3fkOMj57Q30jsI0pj8mDMilwwVolTjTVCW7G2Fv
         ihxrIXLXztUHE3v6CHEb6Azf3zWks8r9QfOs+mLzLVBFk0kjoRao/jpHZUtKr8/0TUnX
         5iNBGbBbSnOuFsKP7y8QJmIn8dOctievFQu1nx0k4r6qVmalVtDXDn9KOElsI7gdO9Ii
         Pj1Vp1VMIzmRvj7ZgDc+Ww3yMN+WamnGroR8XpMV+estQJ76RR59GbzTBJZoYpjnm/Bk
         DLfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzY5PubTtScsEMjobgHTCWKrej42Gvdyc42/dRW8XZkh0QVHcF9M5VpcLF2NS235X6xQ1/47ew3kEqA48=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+9qbKoabSJIRpk6rSXLY72XTzsB5HRTiUqV0nvt+QNhL1SvHe
	uJUkhum/tpLTN9I4bxKuh2gkjnY2eY5a/mwnBRxpVOH6f11hTreZvCWUQk1VF6xxSUPtxaJpVNv
	7B79oFtNSO+28agzNsTek52n6tlu9Nl9Kego0JPZYzi3i+dOzR44N0D6/ChprHQbrZA8=
X-Gm-Gg: AYBFou36W3Nzl7U9oejB5XYHAyFS5Zs54k77jtiXmlw+eTqX0ncpwnTMTN1txd4UE/+
	16OD2BlKb0JZFXH5s8y6H1zX72T6tYl5+CggFA07KFx4DUkypxhLKZwntedv3J2WnPJwyx7Gva0
	dHYGMOxJgR/GqmiwrMQOU4znKUebYqQi64csdgOJQtRIHdb35oU54sBfAUsurjwszj2SLKwG74s
	ay16jAg4EvdL8yOzjhjK//5ppOic7htWAVVv+BTNmXIDLTVBC69/JlfMQshRZh8t6G23bEbZp1e
	EFpLVEKDyOo7yFbq7hR8ok4Bb9SrN+Pah8uhGi9rZYpR3nvNQuuHYmwOa/PSwSEX6gXS7YC3/cm
	TYYGv0BhB6S2kXF56i3sOTA==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr2881092185a.4.1791980930276;
        Wed, 14 Oct 2026 05:28:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr2881084285a.4.1791980929180;
        Wed, 14 Oct 2026 05:28:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm694052766b.11.2026.10.14.05.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:28:48 -0700 (PDT)
Message-ID: <d77bac91-1018-49f4-8128-27a69f754aaf@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:28:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL
 wakeup
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261014121910.1509541-4-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014121910.1509541-4-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfXy3bKO3WX/0+0
 gW+Q3V7VwmFgJRGqmj+U1OOM7Oc+dINqeLz9u338VQ6zT++VabNICfU0v1Myntp72jzgbXp3oer
 x5i+M2KZTrjauTIVyAtAK3Olf7VSFq4=
X-Proofpoint-GUID: EBDxuFCG-KGV-I5WjqpktUGT61_unrBc
X-Proofpoint-ORIG-GUID: EBDxuFCG-KGV-I5WjqpktUGT61_unrBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfX8A38ZOz0vE77
 oEyxYksiWl/NA39RfwdnG3/sEH1wGpD7d75lbUN31h4tI8FOI3q6wPM5tKwShrW9yyOfyGnOk36
 j9C1bmzBAshIrGWuJ5dY5M4mVWyeBhLR/aPUsnTHb7J1v7bD+KV9AYu4cuGtBE8+MZnzUz/9bgt
 BuK32mCXDTVnAY3LfjG+uSi7GFxbQE0FOapgUVO+Hsh91qpRWc+YXFTQaHCo9uDFSiV/CfK+D4J
 bVMRoiWPsCalUFzfhI4zaUqipZSd3cpW2Nl1DQb6HpujbcqELHJy5c2yAtyufd+z0VTHNPEu93f
 RFvrLoJ6p9+e4BoHO0Qw6zdRUTOI+A6NGoXUocOvMndwsav84LT692PUyXVgpy1KXlk3+d1sOkR
 rOk76Mt+Km2JCVD7Yp07ZL8KHcCw5YZrH40ZExYfeXcwxJNn1nzC9RXZ7HXG475wlJ4OG+bg6ml
 l1xV/0HBikh2GY5W+vw==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf7583 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=swowMNEn3sr08J82c5oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140049

On 10/14/26 2:19 PM, Linghui Wu wrote:
> Configure the WCN power sequencer SW_CTRL signal as a named wake IRQ and
> mark it as a wakeup source. The CQM SOM DTSI is shared by the CQM and CQS
> EVKs, while the IQS EVK uses the IQS SOM DTSI.

You already have a reference to that pin. You can do something like
gpiod_to_irq()

Konrad
