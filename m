Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086B94B4882
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637969; cv=none; b=O5s0hX9boUexDk3p5HJ/ES28Ik+xkqlFJH3x7YjDfjvMDbiGZZj5g8wfBBvJag3y4+TaRizXi5/dBGEwgiGw8o8LvvFv1OddGMuPNSc9AfBbVTKfw/KV2MpQLC8iVhnIgKk1xxMEQilPGLyLXYJ1+OECq8tOGpvf64LxVOqOhYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637969; c=relaxed/simple;
	bh=M7qWS8Mntg4zY/biFBjW4FSPXQVglxG+o4C8vOJhFKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CLjPQ7Nq6GmQiBJ5T9W0XnQzmoPHNozah4jsWfPuZ2ioae0WJvBxTL3EGAs3nGVMwoyyQYy8R3tG5SJru+T6ujChRvgnN/1Q3SWTn6mR3gApd6UjswNz0EAZkePrMBpjhSrfDiUR7IsoTP4H8NJVGkskUNonRfFx3lUoYvdja8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5UDbCPf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jhqEeRwg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5UDbCPf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jhqEeRwg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZVLe2410426
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NHIFuCRNhNqful9hjhihdvKZtcjIXWTKtV0
	IPQv2lJ4=; b=E5UDbCPf07H3iXiFyYH2Lue5AM5u6wO5qXwzGh/AC54RpaYu3j1
	JhylSkXeEJuRbO9oIqqjSvThf+UJNzHsq2ixgKJ1YWzWCxzX+34XP8v2uIqrSKQG
	nbnWRmhthARS8dbayX68DiMxX+4tfP5TvmrZs327JQUaVk+twaWHJp36e3NlW2zl
	UO8FLJxfAF1tLzOSigrOOqVOBJc8Tr853gPClVCgbjHWL/pZbUsoWCGb9HqHJkXC
	y4FIK3afAXsJBjUQLQ87vDbAQFZpra/XhxLuVzGEZbrF+Y6ihd2Ye4qx+q1E4xH6
	YJ8tnIPemJEENXOstejnbuwaijJLTNmXdvA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6g36a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:39:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e98e74535so11474546d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789637949; x=1790242749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHIFuCRNhNqful9hjhihdvKZtcjIXWTKtV0IPQv2lJ4=;
        b=jhqEeRwgk8+m8FevveCFAf/HG+iI6OfZ1IgL/f5q7VINZUPpRfcQ/cFP9gPKkHfEpf
         bP2GRzARYf8ioktV21ZNrxNh/Oux5pwlESwgn0o84c1+E8IK0S//VHWB56yP7ZrYST9y
         hAFbSdvqmzgCSGqcoVDTY1vRTVh3ixkoHY2FFMy4BMep90AVmTGhmYVBIWqi0yAQhYYy
         zzzC+pOUPeapY8+45YPMDmCsMMW4vGWUyLHjYh66yBr8hfIzdNd3p/HpL9+Ei8HiQhS4
         4G7RYyTlP5wHBlXCXD5fnfL6KBGbgF8THRwi78pioWN3tpV3apaqTHjMYinu0luncPCy
         icYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637949; x=1790242749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHIFuCRNhNqful9hjhihdvKZtcjIXWTKtV0IPQv2lJ4=;
        b=GQe7TF82IwYAfFjo0Zgkn/CLEvfjTMoLZuI5GQ1Mw8EzSL52Ru1ujHYKlFoPbpeKtK
         JE7URTU9YzTPJE95O+FWeWoO/pRbFXsICpQGj20HTYlU6Buv83JFBGbokx9Q7T+9kpSH
         YQ+lxWh6I2bABzc0Q3oXNUSanaXngG8Sk1h0YW+mnucibbPTV5blgESFadrZ/B/O+MgK
         yDatSb4qXse1oZYoRc1q9ca55NVn1NAem5C9XoGFwHlfxR210DAiwbPm7a14j5GT92JD
         u7ZWVGXtypP9tGxFF/Skz7ZWZJJmVMwp3tubWPYgjkV5VYpMBkpzg3GHA7IBu0HG8Qdx
         tGtw==
X-Forwarded-Encrypted: i=1; AKwUvBwOkiyEdqWqmXTFmS9WfcicGdgni73KB3JslDx5gAt9xNG5orvCxI4GLw55/vysbe7NP+CMh+k2h4mR1gw=@vger.kernel.org
X-Gm-Message-State: AFuF++lGRZykbHh/rHttwvW104qTpor1t+o50poLzmeZYt7xmoKP+o30
	QI6xEHArnka4K3JMAh46NFk5OzlQOx7OvqPQkSQc8mc5uZHAvds4+CnVxqdwuCl8LWUkKSF21mP
	J9FLF5mkD+l6DGcqWMPNWhwbcE4O+ppXM5dc7DCo+5vd8+Dpl23tFobovBqcwqbSScOA=
X-Gm-Gg: AYBFou1F9DPVVtP1CjvLYxftgeRDqxzLQ/FctrUMt+OVEaqLDaHQ7qKm9YYBKkGjvwf
	8FSaZ8+cYD6hOkPO0qKFq5YqYGUqUR9qORdtMmKIEd5jK0NSiagACIQydMphEo76dPP4+OKjc3J
	VCGEoXU8DpSYDx43GPsrax5LGiu7xR0Yr0I7haKsifr6NLPInrdLyxMsmhuDPiH3twRg9sGWwXX
	/VxdcPZhzAUlhpIQGXlTs2dYOMvx/n6UoldTZgLcK2WYYTnRovg+KMemOfSqCrVplUAinVjLVxW
	yw3nYF1zAo3GdTAHPT8kyw16921vU2OJO3tH6EXi1MPao/2IWtw1kPryFk+saJkceSOYQQGogLN
	1uk6NI3e/BuBrwIEoJd4Hg3yTzAo=
X-Received: by 2002:a05:620a:4804:b0:939:57ca:7e06 with SMTP id af79cd13be357-93bb76bb33fmr841369085a.9.1789637949569;
        Thu, 17 Sep 2026 02:39:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:939:57ca:7e06 with SMTP id af79cd13be357-93bb76bb33fmr841367085a.9.1789637949191;
        Thu, 17 Sep 2026 02:39:09 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847eab65sm85288425e9.2.2026.09.17.02.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:39:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] power sequencing fixes for v7.3-rc4
Date: Thu, 17 Sep 2026 11:39:04 +0200
Message-ID: <20260917093904.6692-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QlDIqrM0zzea5SApMm1mjkqqpvcGMM2f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMSBTYWx0ZWRfXwt/3p+oQ7Lhl
 aLnJr34tiGz885uF0E1ujOTkrqo/qJaot7TEha3N462gw4Ci/tcZkEa2VAXRHzIOrYvd0VIGoQ+
 VjjiAYHgAJKh9a/qwo8L0mi6g+61BMEU7Ibx4iuZf0FTEBJVKVPDZzc1T6/BQtifQOtKmpprVGz
 7iLKT1q4WG16rL7cW2oaozov7v1MkKEyfTw4z5Uj3vG24s10IwRVPPrpKoRGhEoHfrV3yS3DW08
 yOjckbp9WU86IlXJt3LejJPfkOWDSsf1EP+5kTjd5/+X3LqXtjW+CvFKjrMeLJb33EKiwXQWaWW
 VRGXm0U6wMxuTH58it7EGO0Iz2xAq6IOOGl2gHWKXeKtWqHwlOjECQXGsYEbO1tPq5gtYiuptcQ
 qxo/UEFIKi/5Dxl8aJsij6iGZ//21v8hZcg9Qr4tJr+fsJlgA9WcRu45F7yfH87YzqzJCR9wKvG
 ZwBfrmxNTPXeFMvARvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMSBTYWx0ZWRfX66FXregZSlIb
 grRY/g0oeokUIvavA9LdiXU1gZZCHzeGj0ymu6G4CXfle5o45GQriPx+eoyOnABdOn9noa8b9jr
 q9sQNubsdL86dv2CVvtf7tElT+sGla0=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabb543 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=9XGRkNYMzx4ocYpevGIA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: QlDIqrM0zzea5SApMm1mjkqqpvcGMM2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170131

Linus,

Please pull the following set of power sequencing fixes for the next RC.

Thanks,
Bartosz

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pwrseq-fixes-for-v7.3-rc4

for you to fetch changes up to 242da4318d97380741516b595af3920207b2f0f1:

  power: sequencing: fix NULL-pointer dereference in pwrseq_device_register() (2026-09-14 09:26:30 +0200)

----------------------------------------------------------------
power sequencing fixes for v7.3-rc4

- fix kconfig issue in pwrseq-thread-gpu
- fix error path logic in pwrseq_unit_enable()
- fix two NULL-pointer dereference bugs in power sequencing core

----------------------------------------------------------------
Bartosz Golaszewski (3):
      power: sequencing: don't call .post_enable() if pwrseq_unit_enable() failed
      power: sequencing: fix NULL-pointer dereference in pwrseq_unit_new()
      power: sequencing: fix NULL-pointer dereference in pwrseq_device_register()

Biju Das (1):
      power: sequencing: Fix build issue with COMPILE_TEST

 drivers/power/sequencing/Kconfig |  3 ++-
 drivers/power/sequencing/core.c  | 11 +++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)
