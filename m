Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC623E8331
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140730; cv=none; b=BfXUvOlqySLUycmDIwAZBcH2b/6AdypuFXQWI4/xrQ28I5ZVl64OJkevUuc/Y2iIxQ6OON8gUDD9HSvFdmatetA3Oml5zejeDBGkEu+i6maraBcla20v+c5oKZ2jx3+Z5DwYNvc+x4CMjSKwtoJxl+fyc8Pu9HSHsSqn9h0Doi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140730; c=relaxed/simple;
	bh=c5Q6iKkDmFbV+2yyd1vXV0ZOV3wkIrlOQ8jFE8fc7Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W7pX9mes6Bv904FI2WjzVNIPF6Qf77HIIwwJmK5coE6TO3/GGjRCA1+DsgwTTFlgjGnsRwj1uFBQ+Gvd/6AhxROn2NbuKQNhPpu7IyUW+PV4kRvIep67FxNmNcKL3Ub+wlRXWRm4M//YQepFjDYJS0U5czLgTpTZj84WuD+zoaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaFyT/yG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0h0b3Cb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaFyT/yG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0h0b3Cb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lHKV1797629
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2C4dYBo+gF6G9Tper5KVUXePqoWOYmzOlJ0
	YU5mfgok=; b=EaFyT/yGKCS/4GwIonOQN14ZfsbCda+ksf+blv1A4mJ6E1w18gq
	my9eilg3ddNJv9dC/tTzyDBnAAKaYs5McYqR80ZvcgbV6AVKKe+N/fAM0DI3HD63
	SWbL7etDPm297YR7+G1JXhd2ctt5DeG7wrZEtLLhItgh5IWfxljNpwgOV4e9Ghft
	Xxhvkg3CNhg6SM+0xNB94bnccLrhM/Pn5mU5LLkmVi7HSW8gMcBIcytz/cjNcJQe
	RIereKivikupJ7yHIAsS3S2CEZsh+XEXwjF7rZaiMWdhRmbQAUI47T8KCb1VK76O
	EB/JE3n4tcyHQLfybt00zNb5POjLr9rrmWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a89sv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:52:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so462961385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140727; x=1792745527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2C4dYBo+gF6G9Tper5KVUXePqoWOYmzOlJ0YU5mfgok=;
        b=b0h0b3CbkDdkTcixVJuoANwkPEgxu5D3EwGSYmaDLPZj6d/4tt3hNUea1rzbLOEZDj
         aS/ByCvkmrHusPorEGY+BK/48PPw49eXU9qsau0rWuZ4J6ybcyorYcNvRHBkMfU8DRv+
         ffWQde/qgP4ZdIE6feaPZv/P2MOh6zPOzi07Vlc1WTrdXxQMGFMI6QOHbkcSaw9VXPHk
         Mm11SupZWjvBMgkmD5+8lE+G5AzniAeThuSuv/vbCaCB5x3WSi52Cj/XC8EavigIpjyP
         m+tik4O8rM+5N7fO6gM+2TEHm34mCsKke8TAlwYLZ+ngaykTX8OiEWYUC6Udht2vkjQP
         aWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140727; x=1792745527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2C4dYBo+gF6G9Tper5KVUXePqoWOYmzOlJ0YU5mfgok=;
        b=0+LrdAJjO5EiIzeUNUOcOfnIHY7lQpXTFAEO/lTtpSq4UEvPS0+WX+I4nEtCPgB91O
         WmAWljkc9lkdIjQg4TN1oT/6WiTauAieq7LXKP1bPogCcmK4h3uN6A5p6g1htiSq0WOT
         q0mdrP7J8ZOxax454kYcHVApKf7Om9isIO9/a/Eb5MYGyNPI+O0Mk480eRxuLWrmm9Zx
         /wjFh+wzVxX4Py93ufEQCRg6CygRChh6efbPszwdtIUq0E5p4KMmZHIHrMeyupx+1y/p
         ZPTUCxlVy/PDQYOoqhDFkQOL+dsJOQUm7npePJbrdGB4PwNf4j0LZ+uIXbrrKzfJ9prj
         773A==
X-Forwarded-Encrypted: i=1; AKwUvBzuD71DW+ZF6d/dLnKXZ6vbbLcm/dGZHjzBJo7ImMMSOUrw7sl/lni6DUGYpPsnECOtVrOy07FhdPpXqRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMDnHrFwxOtKYiO6t0ndd3RERDvr/VovhP4QUvOKvZGg+91orX
	CoNkBf6NpxSXEICqGQyXc5iUNQnt4+cUk1mOHKd/h/WzcpDCFcTD6I8yjinSRmGHKFaWNR/78WD
	Pf+kSKCnNHN38AD/WwxPJyhQ0uWHay6hUh60fdSpTEw0SdhmIA5CVM/6fkg/TqCn/KOA=
X-Gm-Gg: AYBFou3WlO/Lma2rp3tBepvquMz7oqsSs3szgsm3OWiZIvledb56G8QvCHwa88RnYu5
	aqwsUGt34b7xieM6ZNGl6iF/G8t4qANzKiN4mpTM7UCqKzcKg91JAGA3A6n8BcwxlIOAOtuv8ny
	Uv+WzkNmPef+etuFqSTjyTaZWeIVZWzoa3IJjFAKBb0tb5BfX4BcFfRr4NxE8qIF7zJo+Uc6qqH
	chyt/FiHCDD7qKtNWkmsVGkZbjh4PxQw9TURNv8/AnlDwxndahwHOgpuKoWic5bLX1d/JQPzf1T
	7kvaH6h3EgoX/tQvg4wd5hlvAc8YIYU/oJbz/01SoNepY4j0aR9a57p9wAQQFsskBS9BodO8wCO
	xUvqR9LSUGlA6xRGCdZEBizXN13k=
X-Received: by 2002:a05:620a:260a:b0:93c:be5f:b807 with SMTP id af79cd13be357-93ebd224f84mr3659462285a.13.1792140727070;
        Fri, 16 Oct 2026 01:52:07 -0700 (PDT)
X-Received: by 2002:a05:620a:260a:b0:93c:be5f:b807 with SMTP id af79cd13be357-93ebd224f84mr3659459785a.13.1792140726638;
        Fri, 16 Oct 2026 01:52:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5957sm3667762f8f.9.2026.10.16.01.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:52:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.3
Date: Fri, 16 Oct 2026 10:52:02 +0200
Message-ID: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX6tqFA0rUDnS1
 3zdKFDaLd0aufiHz/YHy3oSAxYP2+dir4IEMzC0Xigsnv3MVbxIvQfPd/Nikhs2l3smMS7mYhzY
 cIJJg+WRyxNgXPytxUaveHMb/pTvlfc=
X-Proofpoint-ORIG-GUID: kkuo0wOmRW8Rpj7daFdDqKI2wzSayLkr
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1e5b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EllheS9fpYLeMF_EZvcA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXwcloKR75Jgl2
 Gczat5JGMOWHVzaj+FuQWlaz5MaYfBymxsJA1xtbLbRHdKFgtW5HE55YEdIFIhaRis+tGA+rhZJ
 vQR0nvd5i9ffi3+ShlL4o7pYIpZrD22R1sjLEiuTDaZ0qTxazhNZjI31WNX7HhDZrkETB/axSb0
 HZ5POjCqraSZjdEjRpuq2JtfXqOTgkSUwOBhshK8SFl5IeDufoxgrq/4qDKBDDb9ohsTdc2gNKo
 WYgRFJGUHG8DvCwuTy5Y+8vfaCiq0WnfjtllZk+M0ICay6LLZnDE1O762fH4erBPr5Sj8EzBl3S
 Z4uY/dIDyf4Qg0SSGKZM8wgqdAnWYukAAsSYeymJM7LYXj4CAt0F9ARrvP0ay0wNW5yz57+prUA
 mYWlRiKLHxuNJggWqOdDTMJ1xaSmEvHAyQ7g3pzpuRcymWK74U6vzS7dY/MCF8Ks5zxH/wKxVb9
 Vn25z7JTOPB5ZrVqVzQ==
X-Proofpoint-GUID: kkuo0wOmRW8Rpj7daFdDqKI2wzSayLkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

Linus,

Please pull one final fix for Qualcomm pinctrl drivers for this cycle.

Thanks,
Bartosz

The following changes since commit 709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a:

  pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12 (2026-10-06 10:05:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.3

for you to fetch changes up to 1df7f369075d7e8f7794981995a5103f1963bab7:

  pinctrl: qcom: kaanapali: add the I2C strong pull-up bit (2026-10-10 14:56:32 +0200)

----------------------------------------------------------------
Qualcomm pinctrl fixes for v7.3

- add the I2C strong pull-up bit in pinctrl-kaanapali

----------------------------------------------------------------
Joonhoe Kim (1):
      pinctrl: qcom: kaanapali: add the I2C strong pull-up bit

 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)
