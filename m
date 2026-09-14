Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3083AFB0E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370863; cv=none; b=rtnyfnmBzm0bLiV4mdW/MGUzBqY+6pYpIFZ6zsuaNUvXmLiED1xZt4Zton+zZ1CBpw53wd80zzPRcmLpRxgRo9/sxRBJGrE0o8E7ZFbPeaGUPaVaHmHA4MDxWK2sfjleCDnJwqVWhqe3qTShFO8mzLFBjjhMvn6I17y+62fdczg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370863; c=relaxed/simple;
	bh=V5Dlx1nlvt++uL2ub5ha29Rk/aGXPojGG+uLSQB441c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAzlyuwOqQLjM7wHdjnBZ6+OOu5MkXfbM3qF/UaYdud2E42EPNeO2rYFLaLNDecn906DiiOsS3MNAFFE7FldZ2pQeDRmWshMN2bhzc9jtKzbiuN9NXXGeCMkV/Jggbq3L4Nnch5uHuDNJHdxHzcCTJOUYVaLaWhYe6Z285/03eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njmSBss9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgJOhatc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njmSBss9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgJOhatc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jUG03740843
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJ4Oc7j95+LQNFUW/xFLEiJEnd5Yfp4R31ZWpZ38Oqw=; b=njmSBss9mQdpN8+5
	uFR8BoGPPJxVz/hd409Mbtm/+ncp2PTlmt5CyIB5N55s5titvKiYI2X1c88/zOSH
	LevU8IQq0CKeN1IxVA/w+Fo2HA48n11Ejc5ZTHwF4wnAeYyyHjMxPJaAdFJm1ghK
	dpHKpaJeDSAXfUGKSqU1hBRrA07kJ7RZJQBskyx+PNMs7XCh4Nv/LXJVQCXCpL9w
	9zLOozG2pWUJQPg4QsjWlTcQ5+UMwpdyS403purz2E6/jJx6/B9oUrzEnuykkva2
	IUobcpcpZkVLgaE8FpypgAvxzFyokoktiJDDPclrLapQQI4gUxDt0mr/Pu45bBgQ
	HOWN0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddgvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:27:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0312937eso177435185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370833; x=1789975633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fJ4Oc7j95+LQNFUW/xFLEiJEnd5Yfp4R31ZWpZ38Oqw=;
        b=YgJOhatc+0J8kLGz5GJe0gDOxDy5uuX5Nr043EQTbV6NQ4h/Mqyw25sIbwBkBSUFlY
         m10NLncUjU2cKW/WqdN9J76rNzceUnZPww4QzaXHBu3u7+QV/PwsO9icqBnyn0E/Mh99
         DgzZKxEZVGXmyADV0haCSsu/aMjTN4kaYh7X6V8FuMJtGHXGCDFXU2F97hZEtOHtUhsC
         dKHvxia+MkB9QCDt6yqQU0vQU82sFMB4oWfBymSPGn7cR12OgeORr6NdLr+/tF1N30D/
         khTpoRlxvVem8sJGOXnRGxTy9ziVlu8l1p4PDIy6QwpInjM25W/81Q4K/JxhNnqOrkS9
         hzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370833; x=1789975633;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJ4Oc7j95+LQNFUW/xFLEiJEnd5Yfp4R31ZWpZ38Oqw=;
        b=Ubs/PIX8jRfjcyQ7i+KrY/BvC1RloGXSUSpJT1ZeNuRrbOeki+q5qzyrbrS6HXkaDd
         kUCgJvW/fGWN+uxrXONYGYYonsFS1Gp6HNfBYebJM5/x2aI+0oxOWP3zUMidoWkBkab3
         BG2Y0RLN1LnthdQ7osts1XXAf0b2Czrr/GtvKbK+6VGGXt1DCEHMx82gS4CSsf6PE4jC
         aovXbMMsg3+fywLbfi1D8+bqwnM1LUQf6+BqN1zUTY+yhEuI50SnnfuYF+n2w/CkCnTc
         DCoECiMVDEVc0q+Ut3aNAS4cqRnR17nBt1UtChSLtTwCdQsEDUiUt1q/OZFehXnlmt6D
         C63Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOYKKExWIwA9NrXlSHpuXIcPZQpBYQ3kB2/yQgHXFMyRcNqX782OBLFi1hOTD8i7qu4+IHXEjT2LDBfrI=@vger.kernel.org
X-Gm-Message-State: AFuF++lwmWOirYhJtPurql5XpEDLqBd9SZcmrT8ea7c5d/nPRnTGbrlS
	uAlQfbmOxTqy4l17i9QGpftV85TChLWdkQn01axcwf8uGj8vYnVDjBdGh4yrElVxUYvlKjNpgea
	5/uwYSKVfaBFEg5mqqhL44azTSfgGfPEZkktsWZtFpDXCVCdL5osOsUYrvIAkMZIOf9k=
X-Gm-Gg: AYBFou2byRO/eR1GWo0YmMuvvlIl8VzrETZhXuPwZYpuVGBVu+9aD+1/jHmFE7ANZ5k
	70q6XAGtgDzAYSbn05NqIyzW9cz462xmsprXcfBqaLxyJQmVPsnOFQbLWS9L61ZbGi2fWGEfZyT
	AtYcuFNSDCfGZBhJpHqveDM+qxLPHaUHtj3uXCiyymzPcn+waViHgvxYAMhQXwe04WIEYkeqJz6
	kpXclvzv/ZWU1+WnhiFpFblHXN+OYPjyAJkFTcGL/QqU2EMxPKwHxkrJYay23Apc/sZH1OzEmWL
	Q+Viy0r/sC/pYfeetjj94DiXS6BwYB4ecGtaHyJfGbQa64XsDKHWxYp426L859AIcBCxvtN/vpf
	f3eX1qds+n2uexhLf5LtbMvTB5rI=
X-Received: by 2002:a05:620a:6892:b0:93a:1c96:67e4 with SMTP id af79cd13be357-93a297e5d16mr166231185a.5.1789370833139;
        Mon, 14 Sep 2026 00:27:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6892:b0:93a:1c96:67e4 with SMTP id af79cd13be357-93a297e5d16mr166229085a.5.1789370832658;
        Mon, 14 Sep 2026 00:27:12 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:e83a:fc27:4d39:43d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm24585661f8f.31.2026.09.14.00.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:27:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: (subset) [PATCH v2 0/4] power: sequencing: add kunit test cases
Date: Mon, 14 Sep 2026 09:27:09 +0200
Message-ID: <178937080432.4599.13347166604445263760.b4-ty@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNCBTYWx0ZWRfX02K6+CO0SUvf
 dj2f7eyZs6efkUkq7SSz+c8eU8tqs5PORSnxhNvLwS48JUIez9NU4x/a9YTs0StRBCD5zU9jnAr
 8tbkaqEsGaH993Rm17USNiHUmAII7XrGCO/1IIGQ7h97r7dtyb/6Nzx+mg/CJUch9kjA1GZRve/
 qNakzGv8vkpzvaJvpc1R9Tt1I7FQ4LBZFh3YnnqV3o6ZnyTsARo/xGhDdPgjSrlyTIevIVSyiuI
 02F3LW1B9s5Y5XwMaEQ9dlFUKO44/ywtOC3qhdcFRj8QqWb7Af34Kv4QQItw9JWR0B4398SiOND
 Y/3wMxXcjnXfhs28jmhou6zpb7QUm2HOIGWjKvFHlhLWci+Yw0r1Cu41rQel6iVebjjSRl1mDwe
 as7jAhE+kPeUJczzat9ms4MfpFZZMKWmCqK4RPEFdmRWnCrwnXDW7CdKkj78LERtzrpArQABxv6
 r+SVrMYYuzLBIGEofcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNCBTYWx0ZWRfX+QuYWdYo/H0x
 C9IpxGGkDm8YN+h8id76Wc1Dwga6RpgEFJta7GEB9B0+5OIm7Qwy2q8gTchk/wMoy/WDRe/vkSC
 cTM7pYfRad0b26LXXJQFRt4JXcipZV4=
X-Proofpoint-GUID: K5Zn2TFBrUONQgO6hv47A1Cvo0Mmez2H
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a1eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6CFNrt-8cbJvt-LAfKoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: K5Zn2TFBrUONQgO6hv47A1Cvo0Mmez2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140104


On Wed, 09 Sep 2026 14:37:06 +0200, Bartosz Golaszewski wrote:
> Add a set of kunit test cases for the power sequencing subsystem. Also
> fix issues noticed when writing the tests.
> 
> 

I'm queueing these for fixes, kunit tests will be queued separately for v7.4.

[1/4] power: sequencing: don't call .post_enable() if pwrseq_unit_enable() failed
      https://git.kernel.org/brgl/c/5f90f85eae4e9d2e9628b2019870994ba830b533
[2/4] power: sequencing: fix NULL-pointer dereference in pwrseq_unit_new()
      https://git.kernel.org/brgl/c/115b303e8e093d964089ec6f3c40d984d77b33d0
[3/4] power: sequencing: fix NULL-pointer dereference in pwrseq_device_register()
      https://git.kernel.org/brgl/c/242da4318d97380741516b595af3920207b2f0f1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
