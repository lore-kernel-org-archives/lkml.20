Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0F24519BF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980111; cv=none; b=gLbOdSJb9RE7L2S6qWqWnvhMDYvd0GRLqCQRmjmRGVoO3TonJBZ8/zjkGfVBodB67v0Ja2+9jQd/SJAc3hHUPgM6TyZiBZkULkuq5UQ5LhNHORbT6aThO9cCnyzs/QrlAi8y/fUNjMmrcUHk8dujouAc3jwrErcANucMNU8J5eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980111; c=relaxed/simple;
	bh=V3z8Q6QM1+WIqVVJT9vQ/tq1lzesanx0RdBKGHqMMbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TPhWa2Ox+NtiFbd4PVecfY3ud6Uw4yvsziT92b5paBiE1/dDdAIHrdFnNZJ0+lWVnXO8eJig4LlWJkz0CUt4vjkpbn92EIqcA72+MbVTklW8c3asOYBc3KNvouIzqLPDS8PfBFT6hMYAxWjlebz8lHXB6kAUy6eGXFIRUBP21MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKTI3DfR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8DNAB4J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKTI3DfR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8DNAB4J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79uwv467178
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6ShR4rnHoHnEXINqW+ybyNwN+9yX7I48PaAhsMmBM8=; b=MKTI3DfRTnrbkXS8
	DC5LyWbpVjMR5pijpL59QVo1Kqh7nRIYxJweXPtHjPuKhTDIaMAzbFaYArH2TFLa
	J8GYEuhR1D50eDS5Mklrb15lNiwQ6L9r4k9BdAQzitu28bkt5gljVYPAmwlgDVrU
	4Eg/+ud/CRkJ8Cvsf+CebnPOe11QvSJ6wpq4Z8g3Kapuvef3/ZAyAovRc6MAyJT2
	OUerinnA0a/K4C7yno4dhkjiyEfRer9RfxsB0SbaE7wVfxUQvfIdfP8y/J3hqpcd
	g+NUbbO5a3f2e3xOUT5sQA+20E/Howt0PD0+Bng8u7udBRDYq7KddElxqvZ4JZaB
	DwVYtg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b9qfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:41:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so412547385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789980108; x=1790584908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k6ShR4rnHoHnEXINqW+ybyNwN+9yX7I48PaAhsMmBM8=;
        b=T8DNAB4Jg09GmlzlRGtRkXiSTKr9DGNs3mO2MOuVkrIYrQQK8Ckp2WNKOAuOE5zpbC
         gTU020IflzjxDVRKT6bdzQZPaCn6S9Z5B9f9eYs2cCenLOWNIMoY5RJc95hDbttIGWO3
         0LrSWa7ztUv9WDeZuk1Y+MO6LnsMBja/iMwdOa9kNKYIMDD7k+ruv+671aEJqQIbLg8c
         xlHdGEIvi5INS8Edh2cpzSvKMr58Gx+RDkN0OvTuwxXBbuNQbz8G8uFNhJxdxiiDJSsb
         MyeGiUtIB6k66jZENQSREeymLSawQvS97zYthJ+UnPnlZZ5zR+6iE0lvTRK8ZOktmoDK
         dpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980108; x=1790584908;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6ShR4rnHoHnEXINqW+ybyNwN+9yX7I48PaAhsMmBM8=;
        b=PbImHEb/94O9S9csyBtbpW9x/CSITrQnF7v8j1AXoW3eQ8H8wMKqUdmJlhH+5NLT28
         3kygVPLE3ZjY0A1bbWkYqAWNfkOngQGosfcN/kYnoF9AXCgm9UC5fJoFOCmrnyJw2A4F
         xFiQqJnsw2u2jm4G1fhhgRH55LZN4ToZxv7w/3xZ3IUtO0ZMvneX4lSDILQTQ17Racv3
         MoqJpeHTmVrV1yKxc/zVwB1VY5yiXkUkGLegm51wSQbDtmeLC/OwWsxUjHLOj03yhum5
         g2B9eiW/dznh4KR/VnUWsKzFd7KD0HfU3oGuOdskUMgmdIJgo5J/PJk6RotWnGqk4bXp
         nxVA==
X-Forwarded-Encrypted: i=1; AKwUvByCbzFpI7YLbEEZ0/FCMacYz0GMVSYooVOF+7ff7rywY7OnmXmZuEVmnRUwRyXfjoBn6qJVv95ZZw7TjTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ldrNIQ/qTScjXRiIi4nS5jXoWDL75K0VorQH9qB14RzqvaCTX6
	1GMwC5+JstDWSaMuAj3ytUkpmU4l0Wniya6Pn5WbS4X8Iz9ZGPbX3Zr7VwgMVyWx73bb7A1DZFG
	N3eyRG9d/wOECH0PJ1ouFBMSV796wEnKZFSRsc2YKskH875W6kCBv+/aRK7JX7oKRMIE=
X-Gm-Gg: AYBFou09g63x563OOnLY6NktUFRQ70nBmctjJiFql3ZTVRP72rDcZAAzgQXSAuWg5U6
	K4S4G7dMxpPqN2hrDdrMeFVRfSMfdR640VUO+VeIembYAKFW4G/2TDkmkjQvAs0i9r8QV0ObLdr
	/9lgwpFYtblGWOU5GZSju686do41gJJSzE0ATdi9kqtKqd1PCPkzPJ9cHJ6coETjs12zozxmkEi
	WBgAf7EZaJwyCTExvXaS52uJjT429bnZdpQeNT/Dpw2GnFTWtdoDrE9enU3bFF91o39Itqvv3Tx
	M9VfptqpsCdhgUdzYUkM1blQDTRAu0wbVkV7FcUAzQ88I20a6hwhMRY9Gobd3JrK6eKmDI+C1/u
	ROw7mxKnKENQJuHW1cW2CEA+usw==
X-Received: by 2002:a05:620a:8808:b0:939:13bf:e861 with SMTP id af79cd13be357-93bf56efb11mr869351985a.40.1789980107625;
        Mon, 21 Sep 2026 01:41:47 -0700 (PDT)
X-Received: by 2002:a05:620a:8808:b0:939:13bf:e861 with SMTP id af79cd13be357-93bf56efb11mr869349785a.40.1789980107158;
        Mon, 21 Sep 2026 01:41:47 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456325esm21220967f8f.15.2026.09.21.01.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:41:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: (subset) [PATCH v2 0/4] power: sequencing: add kunit test cases
Date: Mon, 21 Sep 2026 10:41:41 +0200
Message-ID: <178998009681.23332.10018072172593243626.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909-pwrseq-kunit-v2-0-ef496afc89d2@oss.qualcomm.com>
References: <20260909-pwrseq-kunit-v2-0-ef496afc89d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNCBTYWx0ZWRfXx1+AqJNMxIks
 /7YsiDPgEJyE8onaK38uvHTU3jF45l9N8kzasO297GN67rkRHSSx64z8FKHZiRWNpiLP9Igiw7B
 cdv+W99hWh0TAz6V6vdT0+nxHirG0V7v6Nv3RAQWNgA2U2TVAofidfwvflC8E2POKO03ewimvNY
 ZLQfDPT2oIaN4LBbU2SjqdBF5YHRQ/QhhP8uBrgRwEb1O8/EeRe49ZP8R6hWYMER8Dr9QZ8ZKLi
 35Ka9ItPIiP3306DyqrNiJxPeDW2JsUPWYCeq/UIjv1RS+MSLRZKj6RXxlHujVvjGcV821AzmZ3
 nldJWZfac2gdfMKHayQ1DrOVuQqBzg4yj4IbQ1lkmlbrFV4+Esv8dQycx3mPp8rFSFDzZdP1FAY
 ABoPkKl0NjLhwKM86+c0/B0ld4bP7Kxt99sh7idSv2tFqq5dY+Gqj+4JYwgWEvMD3F3ve3evgIq
 T9TJYHC/0XTRy8+IJ4w==
X-Proofpoint-GUID: IK-2dDKQnRHoQM8-7BvtnZBujOkm4ucW
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0edcc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6CFNrt-8cbJvt-LAfKoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IK-2dDKQnRHoQM8-7BvtnZBujOkm4ucW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNCBTYWx0ZWRfX/1G+by71DbYP
 ys2HbZ8kvwoL+zjqKUSZf4su3vm9S50Itlq1bKCZTLVPwwRrAib5hG2p7UOLKErfprq6QM+rgHx
 Vb84UmTrHZUJPdvGg3q7daLeqD4HTWE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210124


On Wed, 09 Sep 2026 14:37:06 +0200, Bartosz Golaszewski wrote:
> Add a set of kunit test cases for the power sequencing subsystem. Also
> fix issues noticed when writing the tests.
> 
> 

Applied, thanks!

[4/4] power: sequencing: add kunit test cases
      https://git.kernel.org/brgl/c/c42e50314a7629ada42a605666b18e22867a6b44

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
