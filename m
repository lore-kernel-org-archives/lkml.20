Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5A4457D5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770346; cv=none; b=pnJnnLJPZjS9xMQi4BXRqdl2dVtt6nyBixheYN70v4J2zEDBX6XzBWrYKz2HS8rtS6SAaEA12ulWL/7Tb4jBMjlRarxsg9RoagQO0JBX9uxFIimUzD6rvf8k4l8V6CQYgNMK+eLV3J82XNkTZAEGEliw1gcc6o8Dh6izd8ge0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770346; c=relaxed/simple;
	bh=SgJFlYqFLtSEHRQNmFsUWB5y/FyJ4pAiDeXpdH/kUXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5/2uQT7omzpWACv0S7EZ+QE8NE4k4CUxaArntIgqMk7IajnobdpfqXwo3RVR34l/Oaw3ty+ZAczalqM5LtAN3ZS7zvJi7r7CppxK7SqPKPNCQgGXTlQBDK6pRio4sFX2VKqgXz63I16tGIjy4s5ZwCMM8arr0omDYsopXORpWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oN4O6z5V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqZ0qIH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oN4O6z5V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqZ0qIH8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777XmY2724143
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qX8jDekrM3WxU6LpzeLGTKk0UWwp2DSi7W/uiO1IAbU=; b=oN4O6z5V/8tT7dxu
	+mwAxCNkfLNTvovqsNszyQRLrDucv25FpbPsth9UNQcKCwExmgHz/RlznKBOEyMI
	OqSiUitIJ75CN7ConOP3QcSld9uNGAZa4ygX5O9BWK1K+8wogqXCIMGbmRla7pHq
	4fXq6gH3uKjbknvjeTyGgP0OmvxeZrQLknzFDcToabb0EUahbbd9MfoOOLamVxIJ
	EwSo1Mh9HKdTuH/i1Wax5kBprZKK6bgqGSLF7iJDCJMxDfOavpwo7Lo6Wt1RbdNp
	2yqBoeG3UZyx9flMMZJ/Z2HeeF2C9HiwrmCSNS9EtbPun/PcxkrCuLqUQXLhjJlX
	PmyeYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxksrs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:39:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so623245985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770343; x=1789375143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qX8jDekrM3WxU6LpzeLGTKk0UWwp2DSi7W/uiO1IAbU=;
        b=fqZ0qIH8+S2PT8YP1AuolUKBqtGfEhyHZ1o+9rc2jvKk6ZQoRzQkLQoVy0UKWV6ngr
         vaJ+uLbemubC9oyhzi1hTydsQ9eOpogeJjJIc00/Zf/Ii+igQX9W58OFn/BYJmnEmPae
         7ydPyIcbHYwyeboAuByOHxDll9XxFUgGtymhUv+AwvJnnWKsKYn0i0ani/3sw9CordFS
         smW4gIWDCppur+6PtQ/ryw/hZDZSCjtqhezxdHJU0P+D6Se6/YqB4lP+/5b8oTrBgCV5
         DZa80IGlJ764gsf4KheqGcaUvVmunIaZMvSWZAuY0GCo0dfubTwSPUlLOIg4IpLnM5I8
         +Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770343; x=1789375143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX8jDekrM3WxU6LpzeLGTKk0UWwp2DSi7W/uiO1IAbU=;
        b=CAxaG9dAqq9wIxqyPBYSUmmhb1lZu5ZuHllUJi78/E1lpk1skozLNA/FXfUjNsfGDE
         U9HVkryai3g+MLm3Yh0JqYv9WeROo2eBry6t1IguUZhL3dvqe8QT0C1ZLuGDJdF1BuS2
         b8EHQSZ+WvG8yagjB1W75kBmNLNDApfOT7EPsxbWLb2wh96JFY00DAjVX3be7JRY6ANU
         6c3TgIsKos4LMbMaz1R0Cu5jYYiCwic1tY/LH/POO4NqHpiZtH9L6brNw98rTmUGkijS
         DJj4nGxwPQrlO98mFZGuR5dGYYJm6DumwF4wkg2RXeWJFbkchMqiNrpdbMv/EemwHWF4
         u8SA==
X-Forwarded-Encrypted: i=1; AKwUvBx4YnBrBGAUyg/yU3LMHw+cL4fjD/F2XzEOSYdoAVwoJwuNb2hRvL5qP0PhxCjaalNEcaSCwSBTn3XnV5U=@vger.kernel.org
X-Gm-Message-State: AFuF++k2kZ9UAbduqs447N5pTsNO2cLYUC13f0NK2YJlWH3Un/WDdUj1
	lDxPd1uWqJdHPm2fHwcz3648YYuqRpyMNqJgK3+3AsXsOzlIn9hdTdVvvCtPYHkkuappODvVTyK
	xLCa/Kz82GO3jAyxB4VB45h+ELr/mwZCOr60mXyGW7zq7o9mn24mWo971XbRM/HPPBGo=
X-Gm-Gg: AYBFou3VvxSS4JszBxEBNOHaPPIUpMKEZjvFA7TQp8mWMVGNcm+8Lq+O9r/gZ/mKzZV
	jET9V9hHMlpnAxUfvV+MBibU3jnXGyKUJK+taERBnT9bSS1jWTgPvkI5vdo79T6SKoghyJ1kZVK
	EW06RYxDdwd5guBq+yyvCGG8O9XQEOogVO8567Yr9xaXcyXUIJ2hJvUB2VZXbJUWN3l9lKD/AqU
	egj2GTKik6juwAUShFVkUVcJA6GZ1VnkpX1LzE3wdsHRFY/IZhV3fdXOClDsLDJ9Rm+PhkItGX7
	vwWTiwUPsAykJpciJdG4b9v1I7rLi+0xWSRAZ/bqNdNt8/sfrW/yVo4CQqjwDwFHIfrpFX8BDcP
	d+w8oj22JGYcNymyrGsEZXtLtZg==
X-Received: by 2002:a05:620a:5ef1:b0:939:7c8:78b1 with SMTP id af79cd13be357-93980444d88mr1910100185a.24.1788770343030;
        Mon, 07 Sep 2026 01:39:03 -0700 (PDT)
X-Received: by 2002:a05:620a:5ef1:b0:939:7c8:78b1 with SMTP id af79cd13be357-93980444d88mr1910096685a.24.1788770342438;
        Mon, 07 Sep 2026 01:39:02 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm290051765e9.6.2026.09.07.01.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:39:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Hemanth Selam <hemanth.selam@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tools/gpio: fix typo "amount of times" in comment
Date: Mon,  7 Sep 2026 10:38:59 +0200
Message-ID: <178877033557.8617.11772358021957395311.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904105915.4327-1-hemanth.selam@gmail.com>
References: <20260904105915.4327-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX9cPhgFu5qxqj
 OfY6xsCcah/b9h7JXaSAk4nzzhnxBNOSI+u/xJ/+a3FGjesylrHpGSaXQzZOEC+6R9mrWXpWgHd
 0cfDaDB6nOjvFKAoSvM7jWAfZ9UfBgvO0j2Jx0k2x7w3rRuu6xk1r4Jmt1hrkBBki6q/NHGv+hN
 E0yWLMHYV6RWsIC+UkNxaTMv9FYctnXW1dlsHD9Uoy14yCYU9VVosPUxJt2PfZMWPxUA4OCaPIo
 Ynn6+h12oIHxo98LRjUyeKF1JVUyHm0iI5UwibGtYXmjAJUzra+WIZBOoE4xUYVRWpHjSXE0OnV
 9zTbwfoaChXrr1bKXMoCzxLu1DM93Z2zVYUYfNPA8pO0FOiCZq/JEhFb5BRB640Idccbu2fhjD0
 3K2Q/5Ac1KOlCEHt7uSX3rqiNzJwe45Q91vyRaMECI0VRw/cDONm8FHumG6O9bN5n8EDV4/zo9s
 81T9M3L4tN4kyUNypkw==
X-Proofpoint-GUID: D1VuOmzKMq0IlrIozVC5r_YACnsoogcT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX1puNOj4qW/ZV
 KxaHbKD7hXCDM18Ds5FPlRyxPcOpyNCkE6FbZc+5fHdLbTdNzZQXj7yXCe0Qi58d10MRaVQ0BVs
 2uJuME2rnnXAimeGs6MazJOc3ndQdIk=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e7827 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ATh8l1-nZCtOYqJaFDcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: D1VuOmzKMq0IlrIozVC5r_YACnsoogcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093


On Fri, 04 Sep 2026 16:29:14 +0530, Hemanth Selam wrote:
> Correct "amount of times" to "number of times", reported by
> scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
> Only touches comments, no code changes.
> 
> 

Applied, thanks!

[1/1] tools/gpio: fix typo "amount of times" in comment
      https://git.kernel.org/brgl/c/6f2e63ef82062a5254f43e0d499053f1e1b19f8b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
