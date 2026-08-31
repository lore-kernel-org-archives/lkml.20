Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEBC3B47FF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165112; cv=none; b=Jwbpvg3LF4LvT0rEMwWTJoqdpK9DVhk4UW5A6LvNouiq3+URm9x4M3HSpHPUTNc0LoJavNzCqBxPR6y+hWVeVKJlEQwLmpXKntweDAcVtAVrwQKfpLmcRMHOzD4AoewQj9iWxD+SGjIj4BeK4O+hCFutuZcgqFtYxYLUV3IvLCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165112; c=relaxed/simple;
	bh=kuGr28k+G/FBXFkLTlJ5L7Pu7zIWGrw6d8n1l/enY2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tymO8X/zXknVXpFzh596v4AFdpIWQ3HhvZvZVW9SbrZc1wpBdj846bi4Baf9Y3woo89wr883Ka70mV6vNKa1gPFE2ilYuCCjX+GpRN2UEbyFzRqQdaC4ZjTCGidQLJlX78Wrwyp4rf32Vx8uKyRr3osn1bSDcV6E4nIPddDC2l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OX5oOxDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aX+xu8nn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX5oOxDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aX+xu8nn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V808IF3086068
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2QCQEBDofLGKNXUpm45l2aUm
	lkaV4PGy5uUSHzM9U1A=; b=OX5oOxDj4FcmW6h8vw8rNItai69Cg5+CeKG+/ufj
	yC5ij9l1jIdzBh1xHDVJvaxR4kDFQrKdXPH4IeNHvSPmZV1FtvIVVnm14eTtn/8H
	QbiAQN43faoQsghjYGkd/g6KpP9btqmAy4PdpBvwpWkxv2YM6cs1CfE3bqTiNJAC
	cIZFTaO1XtniBegkqhZEkwvYz4o5ZZIRuhjlct4tyDlSwtOG1zQ8wBj6T+lkQlAK
	pc0ZYs3jYCW/E8wTMaBC81Yhe13PV8u3j8/RudnHXr+pWsWG84DGBN5Tfs88dmbJ
	XHqCPJuaF0QIdYLbfZGlj76NqpN23XIf2U1mDkmAss7erw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwdgqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:31:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93917f4ccb4so340998285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165109; x=1788769909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QCQEBDofLGKNXUpm45l2aUmlkaV4PGy5uUSHzM9U1A=;
        b=aX+xu8nn0Qwyj1yGT1mxbfPexwS3tbudhQcXbTjkNKDqKHzTxmshToI3SqUJXcmXKp
         Q9LUmXO4OG1zdHoyoc6LqMsY1+xGvuenrFkzYLHkmqLkLgFAAeIRPGOH+W5s6VVNTbMi
         m85+N9q5/CphGVOftzlKFGoZSZywVqCzCUZiQisvzZBWlbuu2ND9j/fAHcyP1jKO1jrK
         yCevIwVzLFt4+1w7+6cIXbNIu4qUKIyf7tYkCSrsgu/AbTJPhM26kbIkH8TUk5XRh4We
         QjeiXzk5Aw+gcuT0ZXV+Xml5dYy6jXYsDkjbBfJkq+zGGxB1QVq73sXj7VI8arEfcnWI
         blWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165109; x=1788769909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QCQEBDofLGKNXUpm45l2aUmlkaV4PGy5uUSHzM9U1A=;
        b=nWCzZFkAIrgIYBHDDdyP2kMgjyGWUGG2/72sSdgoAnn3w2kDgsV+k82FSk0rIn0hin
         u8SuKua5divSzgeGT0CcHNqTZM6kzAg6veqrCKGegzdroHp3VLIQNQKoBa/Mp9etsfIN
         0nENKASG3+jHwu9o2biZY0aXC2G59S5/IRw6kjAVQNMEkZyBrDCIZ/hh9tlvFabD181J
         qZbdFskVjNTuwEKV4buitDRLNe9AcovM83jibQ424uprfBwMbPL1YFAHtxl99ndXeQIH
         L7jy6q5bNCBfkAYwrFqhr2S9MOsfTfNlWMM9nu+mlNb/536sc8Wqmj0ZuQheaUMwG1vV
         DV4g==
X-Forwarded-Encrypted: i=1; AHgh+RrX0w2WHvjU6rO39vN6coiAnfUrWh4Liwc4o3O0Iw571VtWfjwPK+Gv5Z2tmSXGpWgHqhwGauhHW4ySA1E=@vger.kernel.org
X-Gm-Message-State: AFuF++lkrt6KK2Fvg0AgPlSSMcHELnk5Ll3IOjty5viKHQiC1qIV7QWf
	E8breW4IVf82sCS8u+e2kcfxu0XB5CvSmFq4oCv0mOIRRoXsrcqK6NP3MYmDEWVIkMv4vfuGDHJ
	ysX4p5/eiPH4M/dBh8NhD3dTRnB9vj3Jv5zUMZIU3fwqED1lWAoxVpL33wdavwpJDO8A=
X-Gm-Gg: AR+sD10r7iupnPH5pJq7oX+pPhYlrScjMUSAFJvWOpiJLbcI3pPEyMkzfPjZFJzzI7h
	TNVrHm5olcFUkkeamsc7DMeWKxIQaENgiOM1Fs2yLGtj9j7vk9VBwCffRvbWNaPS8IjsX9kIzo8
	NOqtlLVN0nm3TIzShS/Go712rm0p+DGI72UlYtSyLpXvdpbbEDjXyC/iqpEfsOmGoJVNn8HnZsm
	ZJbESZvKxiAftQ0laMOA5dCd8TPctoG616VVapzjcZNS4OfWQFq5WyV8qGun4LjzBVT3QxcgZP4
	bfwGb+7hOcSd52tYMeR6dINPk5ixqt5Rl9pRx/Tt6urhB+e8hmBa1ABeH6K8xc26I2cdnjO+Qpm
	n81YZuQ6ebM0R
X-Received: by 2002:a05:620a:1d9e:b0:936:78c8:e286 with SMTP id af79cd13be357-93913909f14mr2166952785a.25.1788165108872;
        Mon, 31 Aug 2026 01:31:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1d9e:b0:936:78c8:e286 with SMTP id af79cd13be357-93913909f14mr2166921885a.25.1788165103674;
        Mon, 31 Aug 2026 01:31:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9617179asm123518505e9.2.2026.08.31.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:31:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:31:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Message-ID: <svh7vbt5wzojs7xv6on2sfrdvutkigsptskvrjg3h5u3s7hqqj@orqs2wfmyzhh>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
X-Proofpoint-GUID: -kQ0NlH0hdyycFlC43dpYtG-MnK2IBgC
X-Proofpoint-ORIG-GUID: -kQ0NlH0hdyycFlC43dpYtG-MnK2IBgC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfXxi6tDwN+98s5
 ohG5YWrXJvlnemBTPkIDbcWPWfo2J1vaFBaoIc0TlKxqHN81ByYsTNxpNhpTJvYw2WdhnxEBPgL
 JFBXgS/DXFezm95GA/ICiy2kROWcRYU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX5BkvU6hXDEi9
 BTsgsP/KQwkAVAfD4Eh+cjS7wg2hhqomjj6olIWSWFOyQHh4fjos012qE1BXF5cQFfuEyM0ak5S
 tlB6mVY7vKc1humAG9CgbtgCl6aNa75Gin3W1B3rEeqj4AkWuB+zTFS8xv2GfL1j/Ly3V//EfGf
 dFCPiOLc3VJkvWVfFn6FGI3DVQNdzMTUpTud/m64qCvDALbTkdQ58eXdX6MmTbFbkHsnUXomTcB
 no68rphC31fyUkpsJFBBZ2PW0zApW29ZhyUnAbZTmVQzPHWDZi1NrYgb+N/6qD9998f32kxhmIk
 UTKcoThCuMNUNY7vkm3VGVldovjxTBqu1vIIP0bJCtCdmUdlnDr2G2JpfghT+ptTgKE1HscBaPh
 bm0xg0wdbG3slG0W2sG02ywCnJZ92gUnAYF3W2PQx9T2urMPeTht6V9tlOSNiTk4Ed3re6arQD8
 152/n13E8UAMFMGHlzQ==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a953bf5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FBXW8Om8NeiFsvgFa2AA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 26-08-30 21:02:04, Bjorn Andersson wrote:
> All Hamoa-based devices uses PMIC5 Gen3 ADC connected to thermistors for
> measuring temperature across the system.
> 
> Enable the Gen3 ADC, and it's associated ADC_TM auxiliary, drivers to
> enable these use cases.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
