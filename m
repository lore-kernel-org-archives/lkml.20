Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC983A3E68
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165372; cv=none; b=GcyPbemEAWyQrEf6jV2EcLyr7OdhtWrbLsHrQEe7FNCViT9sSDl6QKdF1wnAsZ4KBKe0S/3b1a7bCBfwQsguxvxpJncCDc3msXnaLo4mMR7xOf9VGUT5do7tpsFFKN9KNqKBgRuuvDIZA0zqKj65VTEgdpnapTbF46kRuWYaPuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165372; c=relaxed/simple;
	bh=u0jVi31Jf3Z6nQa/VGyiyLrvdlvNeYox25V377sQJrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kadmui4Zv12fxRpFrtOcZXHYD7i5cgZgAlrpiHovuL4HBG9/Im28DcF83jGBQcB+Q7Pwgm3ntysWTetvynQzdnmTgkXzWEFx8I9aiH+481Jw4DzY9HSLcgFHCUFcYS/XULw2IFlChOVGyR+GXESWEhqb3qBVrZRRUdzOF4YJSEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRmBlSyN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEqmKMow; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRmBlSyN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEqmKMow"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xFuw2332428
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hX0sPWJ8taN18ULMtXvSdCNi
	0vfVrMuk2Gdm1eKY9xo=; b=CRmBlSyNwjRxBAEnzkVTIkUkTe+ubuLr2Nj2Zq9T
	tNLk6Ts6DZHw2ObZu6DUAskjmgU50n4WHhW9PZokT/XxHr2td5QyvLAKTwG1WgRW
	SRVMW6t8msXabBTeNsHL1Q5GcjOkMbULunig3Y8hbUic6ZJMAB6UTHf/wDazQIov
	DhrSPsSNuPfIm5iv0BfsBIzQtYFYJdDkm5/fCY1b8ZhU9BRkC1qrdmYZKtAUbQvH
	0pmvog5KFEUNCk0ek3+Y7cCnM0nbP7ddnla4w2gl9DulcaM1lSMz2qfUYr3wEM8s
	N4rND+AKDH47uQWKYu++JhOVOq9xSQqyzgmQIUyqfYiKNA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq859xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:36:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so537054785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165364; x=1788770164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hX0sPWJ8taN18ULMtXvSdCNi0vfVrMuk2Gdm1eKY9xo=;
        b=kEqmKMowyN4FAWytBa0YhHA3bYR3/vbPgfBc9rP1k8RPbe/qXu6Irv7HkjWxYBtdwi
         ZyUuDLcPUUlfOlYkxPkdKtK9+6G/NZcrzIMNznlf2r8oqDYry8hsp1fbDaW96oM5++BY
         PGB8ZF5Gs/9sFENDL9GKvgL495NwKFjPP2KFPIfqlgWU+ASBNUkuoRvPpS1BcQE70oNS
         952kqI80149B3gjH42XL9Tw9Ey8g5en4q2whJAvJeZ3IkiPkAK0m1CwatHW8kqNtzfCV
         AFJRS59TYatiFvbbvWp2ZcuxYH/koBE8Wzr03Qg370wa4dwr0EY2jsAcMAPc5GfsCB3v
         1Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165364; x=1788770164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hX0sPWJ8taN18ULMtXvSdCNi0vfVrMuk2Gdm1eKY9xo=;
        b=NEOEAISfjKUnlmOEJW/OJ2vYqODbP2QECtOrFHVJuNslZTFLXznSGY90aB9fGou3Bv
         qiIL8C4/HCkW3j+0DoPcC19rlM/qQ23RhVJYBC6BbM3tFrB3jLyScCBz+KAy/KUu1orB
         MNR4lTXPJCbhHjojPVjGPRUglNAv21IznhD/3INVJz5o7FFfQdOW2TuGC8TDcy1Xdwin
         DXS/nJJu6mw92Aymjn1oXvco2tsXLuwaiFK7GDJdMlXwNnEMcdN4mtAmjXNi8aJc6mxm
         vc1CG19fWQ0GY6oQ6ROddGcXoGygXDGiPlAZFlZklHgwtrrUc4KCa+WoKkMy28xFJEio
         21Bg==
X-Forwarded-Encrypted: i=1; AHgh+RqiybuJaOJ350Q/jPkXIo5rKLoNFq2nq9nE1c98v9z57AHa9OIokdqEReod+Pqsrb4vDTjfwKASfaQDpzM=@vger.kernel.org
X-Gm-Message-State: AFuF++mjVqzdKpzVTh4W/gQr5UBk1OjmN5qqsOvqXu/kcMS31nd1Y3A2
	fYod3oC9IEHK5cyKRsBfnpx9+nbAKDENURctotLC34JIha7S+3+xAqMUbV3C7m/HCba+OwXReFj
	Pzgo9lJJMdpc4AYV7JsZ5V0kVeYB8VeGdq5qvsJEOR3BaYCkwxLLbvAoppRwvapittHc=
X-Gm-Gg: AR+sD10NDiG8OWb02yceHNwUPeEVnfGZ6RPSbPUeb261OpcNUgDlSGI++cLiwxZEklZ
	vJ5UPjugWIYCg0gZj7dju33GXjNlVB2lJZDzIQlfpge6YDT1C4OHKyz8TSst4GP8k7/UKHTgKjH
	upCSUwjceoLil0YXqEufHnnkkHJEXJ4b8Q/ebiadwbMMQF1jhVNoq8DDfZHzfK/t4btDwWTmgJq
	NO60pWzlkXrQPQ8DAdm3iYRcbKurRRalfPse5O0pxcyTYQuTNf1pBqpC84jaBQoqTNs4SHGfPQI
	p8UzQKqJLvG0rzTrIMBJKqs1kmoIKjKAcEBCAYnI8CCb3BG+90qSvgjV35AlQSI9NDaPmtSes0u
	mYyqLkokYbR5rRQ==
X-Received: by 2002:a05:620a:2b81:b0:938:ac3e:79b0 with SMTP id af79cd13be357-939427e8ddcmr130107885a.9.1788165364003;
        Mon, 31 Aug 2026 01:36:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2b81:b0:938:ac3e:79b0 with SMTP id af79cd13be357-939427e8ddcmr130103985a.9.1788165363429;
        Mon, 31 Aug 2026 01:36:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b468009f8sm364540055e9.0.2026.08.31.01.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:36:02 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:36:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Message-ID: <azzutogwdednkjmlcpzml77nlfs6x6jvygk25ppz53rqvvj5r2@al4at77cwy7t>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v2-1-7a05c995ff2e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-dt-v2-1-7a05c995ff2e@linaro.org>
X-Proofpoint-GUID: gGnifSqDFC8YCOMx4hXwie7_4XcPyCRN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX78Ab+pMtRc/N
 ntLxGLAuYi0uHSSqKMcnraRthpKsGFY82nhsewGzovtDGryIAL3fR5x6yinQanL/ixnG48GLAsB
 24djjZAhRrwUQMj6Y14+pnZh4AlWurk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX/Q6dM4HtzopX
 j9Zp8mzxYw/esHatluFr156+4fMsvKJxzGzxWDmeCQyEeOGG+u0nNV9mXsgAqPZSX42XP5CWI1i
 c+LnUYgfYciUfDkaQCrkpJ2QTP8i7tvRp6KRYS6bsVm1vzuPL34dRtbOpiH/clarPo0zW4pRQv7
 Gevb20HD4k0moTTMIqv4DsVFNGMkjhJrHTZbElxC9tlmEB1B8Yri8CTMBAHPgzNpmq+3qPRE9wI
 X1KKcK5op9+5jeJENHpY429fx3B8OZKOte6E8d0VH32n4A3imqqOwpEX+14i0NcmAIMGWbJMbkr
 13UTtLX8Y7MHJsLb04sHhny2dHib6Q7v2TU6W1AyEkpvwR0lmFQDnde4XrbW9RQf5P2VMTDy0CA
 m4dR+YsfzAGP42LOtNUaF0KrdPRZzz3y7RyjKfx9lK1BDQ4NaYEm+hD+UB7QVg2hHmYW+/vzBDM
 ZFQ06hUuPZSLiDV7Crw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a953cf5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=H3vZ0M6YDjZHjQ5XKsQA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gGnifSqDFC8YCOMx4hXwie7_4XcPyCRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310072

On 26-08-31 10:29:37, Neil Armstrong wrote:
> Switch to the ayaneo,pocket-s2-sndcard since the hardware connection
> of the WSA speakers on the WSA2 port only makes it is incompatible
> with the default SM8650 generic sound card.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
