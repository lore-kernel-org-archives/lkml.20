Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91515471266
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278242; cv=none; b=IYG/Y4+Krym+HpfCc0oPg3ks7eyaL9CsYs3k4K0AYSELip+NpAm1YuTQGLkpJjWsmcVUKdskPlYzxGIIcO5FKKcow2HoZ4OZf7JchsmDf+8Bj/F3JjL4RqigWOsjoETbduPlKh7v2gmR2SF/9slxa7liI0KmPvq0NDgbQ9U/dB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278242; c=relaxed/simple;
	bh=mI+0OCmjkN8IPzMXzsKrgMBigNKPLjrQDoxW6AICHxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PB6AfDwDrf2Qwz5SBcPG+qBF1+KMt2qtg6LXV3P+HY6r3J9FXiQR6mDbtoAq8Ma5BhsAQjmKOoBbnvUg93WhT+2uBiDP7uDqBzFUpSz0ohK6tQOE3U4Nf5Y1+S2dRUl2RTdi4JXWwI+B4//L8JyIjRSi0r8dFmx6xnTyikVheKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyYgO54B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3z966p2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyYgO54B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3z966p2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8W0R2746429
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/OQCwLQW/6OFj9hLgRG5zobTrne+fl2iMm+qRPhRWc=; b=YyYgO54BuDL/0Tfn
	tH1YRwC1B6H3WYDkK1f5L1UDkYhlPijHEtr9bJ59EmTVT9hVimetw9nrcQgFuoL7
	wcVcFuhOIWnEXxCBW3nHVyBKnTHV/0HOpAWIc/MD24k6kYrjUQdpWYlzG3I/NKfG
	E6hWmVGm9xHbaGRLrZdypNuFvvHImUpzcCk1h+SkQF5SYzpC5zEMb++AFC3+tEHL
	p8Psntsu9KuEJkC6QbyRlnaT3Os1LHgnsbKgQXgRRlpmEd37n19vLEUuI8FRvv+Z
	ggF05gcfeNnpxAZXxQosTYSZ8tuvnUFB9CWtAlG2Tgkxb7+TCq5zmLnCjKMeMOVO
	0u04ow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm1jp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:57:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e7db8d191so340676d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278238; x=1788883038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x/OQCwLQW/6OFj9hLgRG5zobTrne+fl2iMm+qRPhRWc=;
        b=g3z966p2x5SiZPERWDgDDOAOQpE8A320wtu1Mc6NG6EdM5vOozsi3RPczaoJMHZtUS
         YZjQ7bP96kPscTdn6jzjeBW+juImT6385vLSrIJ2a039KYLAfvS97OWZWsZ8Sb+1j+C2
         icxFD3UUnGXh7uL8mVpkTl56n9Cl54kLj4gsi1XQsSDSSJQvuAdi26e8gDvv9NDlwlTa
         BrZV0dM0/lmibCyMSJ4PxscBA4EXWKEa9YFDSG65rf5x2uzhtUbp2yts2oScGme76FuG
         +Ge+qIdI8RmvAvhGYBZZ0uoGG1J6XOFXDEgIPCsoplsJ4GyMOtan3d5mAkjj3yENTVmQ
         D0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278238; x=1788883038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/OQCwLQW/6OFj9hLgRG5zobTrne+fl2iMm+qRPhRWc=;
        b=SBD/WuBoaWwhoXh60ZmLSX39y6nT+V2zH3v4o1DiO6dEp4750H4xcNbr/8tIj5Ed0A
         5Auxlb4VtjR5XXmR/KrUPLNHc+QkD2Pq1Jyp1VYFmuLQJIA/tqwmUfNspFAr6GvCO81i
         dSyFYs96+seEwX2wuvJjqp9kRWxCCJuKuxBHfQNUeMIRCR23Y3m96iwkz1Gt2Eb2kBBc
         SKvJNcUhbqfZloc3mYYxOn+ZYvGwYDGYvjEUwXUCBBC+mlOlClg2ONwKd1DQ7qaHfUkl
         WOKY4vmrFkYN+64B1og7nWuzpMakTelOVfCvBwi1CB4U5C2b5IuSZxGLpCxwTUUJgxw/
         9R5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoEbu/j1JQA3ATRtJJS0KQeFKPndnva+Ify5pS9VkQt0cYR1Ab7qVwwGqHbSII+fCw9XGCR4MDdS4RHDWg=@vger.kernel.org
X-Gm-Message-State: AFuF++nRKj5Xv7wC810qRkRbToPUiP+2SSKZZ8Hn6axwLHJ/fovKkGUq
	ZL6DedOMuHsNngPjsPct2TU3VZ5i2VNfoyM5JrYxdo10DqujkOdFpbTDTL76QeornNSAQ28f37q
	5OAb5Eveut6QuIRu3VyI69EILMJfI3DR6Yp/6lX0CGa4WwU+/m1mo2aiFIsq0ouoAnnI=
X-Gm-Gg: AR+sD11SYLfF6Dgiz89EZG5W8p2vuGh1IcbHf9wkffZQ8Stom7Pu6tX3/8tzeMVtG76
	ApGilfAG/z9quEVo7o4H8OOkHDbLMxALPN6z+yR6D7LAIRy46Ba6rBlS+SOBS6VISPd7tTJeONy
	TpW+cl6b0M/08nkpU/3SvYdQVcSZZVErzNh7MGSTCAgDrwGjgQFdJtvewxIN0YCcjRuplBqd5Kr
	GPp4fz7oDl7gHjTbJegS9rI7DrAPDJF5P7emDKp7RJQ1qrpcKzv+bVTUtdJUWhSwjFBw1EAyiGw
	xfk7MsSa6rhoQXel6hh/L5DGAAMAuQeVL9YjrCO2F7q1XTsnpDb+pP1Q03QYz3BJBh1S3OmNXSY
	50ZGEjqOBHG+6NRY3iAp4vzpV1w==
X-Received: by 2002:a05:620a:4009:b0:939:4b31:4669 with SMTP id af79cd13be357-9394b314723mr951628585a.29.1788278238027;
        Tue, 01 Sep 2026 08:57:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:939:4b31:4669 with SMTP id af79cd13be357-9394b314723mr951619585a.29.1788278237413;
        Tue, 01 Sep 2026 08:57:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6eafesm5366057f8f.24.2026.09.01.08.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:57:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Daniel Drake <dan@reactivated.net>,
        Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found
Date: Tue,  1 Sep 2026 17:57:13 +0200
Message-ID: <178827822449.38953.11000538311935272937.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260815-gpiolib-of-hog-flag-leak-v1-1-6126aac5f6f3@nexthop.ai>
References: <20260815-gpiolib-of-hog-flag-leak-v1-1-6126aac5f6f3@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VH-T2kZjFuzXKZSBcnEofU-1Tbd-v-N0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX8Yf2RBK97RJA
 euK4gsVD4ZZvKGeulblSuQqHqdWpuQEk/X4YfEPH7CRC9Ya6IlIjywujeE5bLoW1VXPynfJ9rQX
 lMlObnmQO3gmRVabZ2tqS1Op+1jYBrA=
X-Proofpoint-GUID: VH-T2kZjFuzXKZSBcnEofU-1Tbd-v-N0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX8F29BnFJ3e6Q
 w34L6HfCf4eP3VQjIpN8lnhkgteEvuqmdta/NX2BaQ2vDMZLFJAxW1l4g0H/27lNPYBW7DNKZcj
 CsKZlxeNcrjQu1HO/FUvMjipQNJSwn5J7iGzUwfTh1cBglvquih5+7wBy58ezIuk3vNSI8/rorF
 eoUws8VoHHZ4TjPtmUkQ2tuqPU4LFMTSNymmEkMlpw7/o3eUra6G5Nu2oOUEYsMPmZkQvwm1bac
 xyyVvpB7/Rz1DM5/Jhli0tQt6JNJCoARv198rcNNG62fhTjvsV4KgcPVjqj0YrV3ipoctJKiw9t
 mWsk5gxF6jp60cj7zWM214eVSa2CNPUoUfsYiEA2jhy8qPNGOQ4y5w+j82Ds3jrmjk/CG7leHoR
 ol9LgNwlLDGBdPsYusKktUXYspMVUQ==
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96f5de cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fwK54NpjPF0WMB8fScoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609010141


On Sat, 15 Aug 2026 13:44:19 -0700, Abdurrahman Hussain wrote:
> When a gpio-hog node is attached by a device-tree overlay before its
> parent GPIO chip has been registered, of_gpio_notify() sets
> OF_POPULATED on the node via of_node_test_and_set_flag() and only then
> discovers that there is no gpio_device for the parent, returning
> NOTIFY_DONE without clearing the flag.
> 
> Since gpiochip_hog_lines() skips any hog child whose of_node carries
> OF_POPULATED, the leaked flag makes the hog silently ignored when the
> chip is registered later. Applying an overlay containing both a GPIO
> controller node and its hog children - and populating devices only
> after the overlay apply completes - hits this on every boot; the hog
> is only applied if the chip driver is unbound (which clears the flag
> in the remove path) and rebound.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found
      https://git.kernel.org/brgl/c/1f1d0812f6a8ab8e6f709c599f137c99646512cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
