Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F140DFD7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375102; cv=none; b=PfjwIDVofFgcYyPuWuWBK1YaUP5Idwgkjnu4jGop1U7nPa4ScZ8qJKQ2zUbgVdCmBeBVKiUU/btZiBrQOVdhyK4C6q59vzUqYDFAhgto5sPb67aSR0CXmLNK2zE3Wc2l9YdYXiyg6E3FU06Y4fqBS/oCCTTPqDNHlAV3Vl+kRP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375102; c=relaxed/simple;
	bh=gHKHSOLSzp3WyOusQFfkD5ITajAvimdGQIbANCYNGQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdEIEZqvWPBvGTvfIbFTfyBlWE/Y9+b8TUJC5WDR3ny/PwUIXMYhYOBYLWnCZpFLn0X6CFvoTuxYiXc/F1nad2HdeGvO6jiTRkHrtE/7slGrApEih4T7zJTlbUtJHbVXejchiWiPsxG9OvkjLV8LTMfKUFvZMdjgXOSx5cdU9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+Vl5ae/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gi9OszNh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+Vl5ae/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gi9OszNh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ivhD3739607
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSoOIOvtikrIT/ETbxvsBkHTAv2xbQod1Y0j2PHnyM8=; b=V+Vl5ae/XfXG1uxI
	GSoAD8q1+fyk9uGG9BQWaCJnAs1MFZdd40SKwbTSsK6D49aBU7YEl7idCB79Nqtc
	Waj0A+wlp8fCzdiKsJPQevRijL4OOFS87MuF8jzvxSrqC74Q6xF7xC3POZ3AmvI3
	5dEq0zaQTng82S4+rCyI/AdjQFfaT6A1fGIDCJtOmPlmI6Cp0kSSrqe63WHGnFn2
	m82Cj244OANgRelnNPHe0tyA3u6SfcFY0V9llSj72R3enK/tWYUeVgSPtumcM8kT
	2qW2YHsZkoJNrJIaDFoxvPsHjkxBaFMYfmrLn1cUImNyjkfORnYPmrCqDlSyiDsU
	J24MpA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dds5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:38:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9105cf082f7so61335816d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375093; x=1789979893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSoOIOvtikrIT/ETbxvsBkHTAv2xbQod1Y0j2PHnyM8=;
        b=Gi9OszNhpqSoOXwdX203sybTt461XS5kmAhbk5g2aDWzs3+4VzYsQ9nKUb4TAC3yY9
         DMYKE/ilVj4GDEr0hpr8GLGDxTqVxbPMxGdasWh4/SxwGCFDMP9y1B2CaN4gp54J6yFK
         QFls75WRf6IajxT3c9fgn9BghWaFEsHoUitRmCO/95zMl3r8PCbFYTZ+6fSptr1oc+LO
         5NvxXwRYIFqpnztlWHxjSIFR4h/t24W/X2c5FNf2M346Cg/du6OdY38EHWf/RX8L6x9w
         FSCkl888mLGqgw6BQUcc8vZOrb0bl3uXLIAfhkANjYW6pK0LLiKVfN8ulpqDOL19lY9G
         dGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375093; x=1789979893;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSoOIOvtikrIT/ETbxvsBkHTAv2xbQod1Y0j2PHnyM8=;
        b=U53KK31ypuZVYYzlk68q2i0zK8ByT6KO0+LeDUVA60sotJJSZHieHcKyAavaMOMEXI
         RE00K2KqCdc1krL4PZidemOGXTLhEHTOMeCIUjS4MR9iiSfwTIWR48dYFPcdL8iBVoeb
         ICLtqVOw2eGgGJTI3qOXHHj7165yyOs4L7uqdrsVBpPv1Tn4GTbMfyCd8hoOGpalgfFB
         u8hc/+7BCWsnx+Uf/6abZsy9Nmz0rvxGyBKpE53qGGZu8jZYvIRhdVDa1Cl+ocxTIiVI
         gSfnut9EOYxdk5MYQ3yBP84FhmTO5qYPKXZ5yDERcq+Dxb4CN6JeLT0cIsSBwf5SIeVg
         sQ8g==
X-Forwarded-Encrypted: i=1; AKwUvByr+5TErD0WmRTxsFqg5EcFvNaPEj1dw7wjNp8VVsLnDvOWG3j/w3Vy0mf0SK+4s8xBhBEgnIG+bp9MZro=@vger.kernel.org
X-Gm-Message-State: AFuF++m7KVFvWfUv+hAMjbGPrDA/vCamf5WzXo9oE0hOWDHh54x/oFKT
	xDjSLDYQxOyeXs3aFLJGSURtbBrIw3c8ciOixKR/QkWgO3l4so2CmVKqrUB69pLPHoW3Kmvg9dG
	ZXAQ6N830DWrWzVX0NbKWj9WLGrURVcYOpW5m3PyyJmKjvRf+pcTtnY6/JY1P0XfAbNE=
X-Gm-Gg: AYBFou3t4zYeg4Ul4BSdmGdJiymbHBY9FAubWrpoOAiI7I0VM6rHabtQGGlTKOQdDLB
	gZk3Pfou3qtk3NsLl2F8d3kDoOfqO5PfDiY9eOvBVFYplBvur3U5F00eK78H5ilnkR2tMpfsvhy
	q1FEcDAWw/HANOc2H9LLNDeznp1+vXdrk4SEYYHq2XoGGV9MTxxo4SwZSYFpfDfYrdNCtzjYxA2
	3doJM8xtY1UuSEw3TUFVAROlQ1xRo8thpfuu6vCWm4a8yleAwDyjWJfu22avGfRKxa4k3YWo+yM
	qXufSiTfsHwOluY4DrwfWL+ek57OqNUtj2hyB4XdYHgl0IHwEAGxndNrloGTSfkziYNCD/TmD4r
	tnM/2gK8gOtcvNUbw6knjaie8sds=
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr205659085a.31.1789375092937;
        Mon, 14 Sep 2026 01:38:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1b93:b0:939:cb1a:2c5a with SMTP id af79cd13be357-93a299f539emr205655685a.31.1789375092381;
        Mon, 14 Sep 2026 01:38:12 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:e83a:fc27:4d39:43d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb359f38sm23425466f8f.30.2026.09.14.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:38:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Michael Zavertkin <misha.zavertkin@mail.ru>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] gpio: realtek-otto: add pinctrl support
Date: Mon, 14 Sep 2026 10:38:08 +0200
Message-ID: <178937508534.32495.18371049241365585630.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787830440.git.misha.zavertkin@mail.ru>
References: <cover.1787830440.git.misha.zavertkin@mail.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX3jyAM3KTTkof
 kgeRW5ZBBXzuKir1u1bYRz1nrWLLkfsMsm9nHcF8CKwOuz0Hg0ug2PFh1r9nQW9NbVVV3STAiA4
 oDUFcTQ2agaA5MFyyDGz4tsK6Zwsp2E45DCtpBE/CHQ9AgpWiYA3+evnE8brBndrMCdQYMcn6js
 eEo0Rri7CDog4QB1yizE8tx89WbXthbc2mwFupe7lLUHWvPnsY4NW1affkriAdSqT4YLxRS5T4P
 Z41sEcAkB/j6RxL1pgeWHDxCnUMC6yJGXX8pQgk5uy0DyquLHsRZzuvu8Mmj3fJk62JvMSjS9qe
 7+74o41jImabDDLCK8EZIcPziIbD44jYbG6zpqh005vXDFglcSvKS2ElfMYhSzclY9ZgDPY9cBR
 aNgIMe0NTuh3gC525X6X3keqo/tG8edC+9zy4Id6yq3N2QzN8+sizy8wAq27qLtTHP2IemSyk67
 +/Pm5SmHDRMp/r5Vsdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX4G205P47QbB0
 7xwKx3N2rwVoCVKD6hi+8RquPZy3nuV9GvP2P48A02iOGvGQy4VCq3yjcZ3shLJUJ107My8oU5d
 4p9RpejjV0mHQHMiRakfFldfTPl5zt4=
X-Proofpoint-GUID: 0rkoaz_F1s8Bfh4oI9XZdOAs5IMmquRo
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7b27a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zBn-OFdvgJRZKxyvXKsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 0rkoaz_F1s8Bfh4oI9XZdOAs5IMmquRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121


On Thu, 27 Aug 2026 21:29:29 +0700, Michael Zavertkin wrote:
> This series adds pinctrl support for RTL9607C and referes it
> in documentation.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
      https://git.kernel.org/brgl/c/3f860d25f7be981d78c1b85a8d4fafcd914d4df9
[2/2] gpio: realtek-otto: add pinctrl support
      https://git.kernel.org/brgl/c/7257c35db0fdb4fb02d857a8197a16afa84d92c0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
