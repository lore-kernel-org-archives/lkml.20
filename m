Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9FB443318
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147514; cv=none; b=AgnWKfHSDT/lsmS7MEOuxMoxp7ZZQzhyI5PtWxhIJD9t0PWr23loi7GnsG8QaYnbPm6Qo+Tu4i023Jk6YakaPe+PlORui/FXKck/w+nEFmo05BLAWeTAqZgqF23Qd52HoD4TbysDpXGKf9T62439D9Qj3N5uvy7etL847lkde8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147514; c=relaxed/simple;
	bh=PL3Y/OGVIddkHfghNwrPveSkZti8Tg9sJA/T7YXXSGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GzWL9gyFKj7izGAx50Zi1fLhpiIEODzmWDhKgKEZ2X/VHrpdVshuQF3wPYITVdm9TT1kZNfwxQwsJ+P1TPic8+9Q3Uo7e/NSd0rbHIpM2izk9QvGxeQ3AQlq/hJIiyIVFFoPf0q0dj1z1NzSQmZHqLofBPy3ZfQ802Zqly7ypH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gULjHIjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLEFWGa8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gULjHIjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLEFWGa8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79dWt3022295
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cW+ibqBFuMIVxBlmmWUKocuRJOhtUmCAZ5zWJ8R1vY=; b=gULjHIjzzVanapEA
	nnbR/7uLhnJLtpd3LOmhEyGHuqNIBEEVwb8LnWDJVpLDQDAX47oT4kucSVqSks2c
	R0x/tA8YXVg92nBfAWmJeI0Ee4oq7oEQHVrQlaSkH49cCwCo8YsTtM8EcWGgwCu1
	d17Hh2F89zjLx+cK2pH67vmhD9lI9TSlxl17nUVSPlLjMUgbsvcu5au3M1SHaDg8
	f0AWFdO5NqWt4ROEqQlZmCmWDGaTfHa2ZVyDf47rZtMNjvx02cYsWUwK4GfGHOxi
	VNVcN05UtU2JGDY45qFpvx0+fHuMydAfdqt1+ttI712/TjVw7LQNLnUXsXGpb1vf
	+M/1gQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8632u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:11:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0050a554so136413885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790147510; x=1790752310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0cW+ibqBFuMIVxBlmmWUKocuRJOhtUmCAZ5zWJ8R1vY=;
        b=cLEFWGa8Xy2VTTwYJazENciS0EZT08OB3U/Sj8QxKtpnlKJPNws6GKdQ/2nrBBnuOV
         xOGjKd9QqUR2+HkZIrcJECnwsIw9S9+2NgQMLDCY1/NHH5cXqltAAxG9JwjqbR8iV1i0
         YLsEaruXpEZqNAwAN8tc8Y1Dg5oju6Ky0Iv+bCXJEQ+OXDfhWxwjgGBCTgyPY8SbH4/y
         8KGhiCghvDY+Ig2stD7Xen3gjrz5NaIfCgp6jTwSy6Dt1jAq0SKpNTYVc1n4uG+L3gKH
         TBkVn5PmU31VJA48sJuR2RZoV6rM87eDhOah+vKBU0T9OGoenRhtyau3qYxj++Y+i7np
         RavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790147510; x=1790752310;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cW+ibqBFuMIVxBlmmWUKocuRJOhtUmCAZ5zWJ8R1vY=;
        b=22e8vhTgDO84rVIQPo2hVldq3rXdAjz9hYnCAYBfvZdPs1eYBXx+QjNjSy9SV/9DCx
         zoU3sYyNm2CHVK6mJWCKfjDqiVQyRSeuawsGjJeprJbDmHN9OQI/uZL+6udO0w5VPk8g
         fvpPF1gJyUjO89bb5MMVKrEdVFQAVApjsmusx5mjDA0AR8fJZMl72FDSxCMuAVIZYhCM
         IX1/DTsLr+ARzGFqegTDS/FmlKNws5IWXDqH1fOZNaFonbcbbt2MYW9C2raiKxiGHFsI
         9VDXnV1DKm+l5EXZj6IB2is0YFbQLPsicTz6NHt6T+uGNpOl37X/Oh0x77hHtzcNtrT8
         bgGA==
X-Forwarded-Encrypted: i=1; AKwUvBwOyFvBMi/S6LdcOIAgOWN9nsT8nulm2M5hJyi6CJW5G5MQCqUHDQYoWdi8T4mxP0lHn2Ly/b6/IDpIyw0=@vger.kernel.org
X-Gm-Message-State: AFuF++mzW5pQOYpn/GflQfyk9vpcCpI/qQiXrZkBY1QON2WNLlMpjrhR
	QypBFOFmmTTJ7e60sYbXAPdOPRn8+rmaLpE8zenY7VATF1StBZyp75G4IBQPXKyDeGHSu/EbAjv
	0P4Ll2q2rs4Y3YYuArYTWtAinZM8QeOQe3uG/DqC94QGMW6aBpBfROCjc8n3HzzTLdNM=
X-Gm-Gg: AYBFou1wKMnNovhUucO66+jrygfLodpLWkJHSIU+ywT6sL5nUVppHp4dRvRXwO7P3X4
	n8HtwogkHqpL7tH/DZWGxtF9t9uHW2TcgQJNiUOfyp3Jh14wi9y2OJ/OxDuphWbtd6HrL3slbGX
	b4CNP0uba9hlFuqZk9f/oAglS2/XgWTPY183tI3GJj3qvzUGEz7yT0cQo+yMIGKGZfl9tkAObK6
	TZs/KuIGVUWQcAeuV9RzHuVRG8VaDN3kt1AxYhOeIKLJUGDsgHS8+7h9yfdS8XAviITDS4udfdo
	8X7FoCRjrI7ysGxKLwlPzeBnHtl4DcdwUhICgOcrC2G5aVz8Kx5Qe49uaZc3YwL0etyVg2pdX/+
	TLBo2U0eRq5JHvUKCAe+vsPy8KfYb1Xw7J9998g==
X-Received: by 2002:a05:620a:649a:b0:93b:d79e:18f7 with SMTP id af79cd13be357-93c2521b50fmr271386885a.58.1790147510346;
        Wed, 23 Sep 2026 00:11:50 -0700 (PDT)
X-Received: by 2002:a05:620a:649a:b0:93b:d79e:18f7 with SMTP id af79cd13be357-93c2521b50fmr271385385a.58.1790147510004;
        Wed, 23 Sep 2026 00:11:50 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868266822sm5199633f8f.5.2026.09.23.00.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:11:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3] gpio: cdev: fix kernel stack leak to user-space in error path
Date: Wed, 23 Sep 2026 09:11:46 +0200
Message-ID: <179014750449.4502.8575996857218879087.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922-gpio-cdev-stack-leak-fixes-v3-1-7a0c7a4299d5@oss.qualcomm.com>
References: <20260922-gpio-cdev-stack-leak-fixes-v3-1-7a0c7a4299d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1VxNiPQTky3dwf3zX466-ZveqJ-rhmQZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyOCBTYWx0ZWRfX4d6h+/uSFP8C
 hfi1LvN01DwgOOfdcgm5LLEnF3o8crqc0uEduDgxWMCYRrre+1l/GvNtbtqD1WlOgE8h5U9Y4H+
 CUZD/oB26upQY1zAKrxnet/Y1iDSUYc=
X-Proofpoint-ORIG-GUID: 1VxNiPQTky3dwf3zX466-ZveqJ-rhmQZ
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab37bb7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oykLyDCHHkduaGUpGZMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyOCBTYWx0ZWRfX8TFxzUCSAh17
 Z8F9w/VCcLJ/3Mex+XFgu3RnzRURscq+gyAqARjvyjiNTcUa/D6bWzTIb20RAfc0U3Hf8yo/wRK
 Oupzwa9DailNIbJtJ4BNWUveZV6zmieMejax68TtLxOSLyC3/RN1R4bQ1aNck8wpRjsmOUoE5pd
 EFXrurhW/h2SFNjul4hcwxYdspNFT6E5XmP+Z7NbXHsQcrmzL1oMOgyrYWdNltQngLb9wOpKsJM
 fnJphxJUS/JnRVAH4Qm9NVqg0ivGmkmYdwDoiiLh4biL33ObK/4uIUml6totzbS4vja6ItuEJvg
 0LoLr0ZnD6P9/V36dE9vKGQcSyBXT7n3HhVNUbGA7UCtPdZlWjXH9bllTZL2hXwhy3PVrdAow/z
 f7yvJo8P9U80XpLj0tXQ0XU9c0QlSpL8QLF8ZAm53mSiyu4Lr5ACWzj0SEkEU1YlneNJXqTNXs0
 W2GEII24WXrQlZtfnyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230028


On Tue, 22 Sep 2026 10:52:28 +0200, Bartosz Golaszewski wrote:
> If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
> return immediately before zeroing the info struct we'll end up passing
> to the user-space later in lineinfo_get_v1(). This may leak the kernel
> stack contents. Make gpio_desc_to_lineinfo() return int so that the
> -ENODEV returned on failure to acquire the guard can be propagated to
> the callers.
> 
> [...]

Applied, thanks!

[1/1] gpio: cdev: fix kernel stack leak to user-space in error path
      https://git.kernel.org/brgl/c/1feb5d39b05afd902ed9fc902ec5b15be03a4bdb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
