Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C10370ADF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284363; cv=none; b=IM2xXZLZ7/regCejNw6Y8AO4HPN6soYBpikIYJzW4kxY7zex7g6EvuBlhmYvdrhYPe7aM8aBKlxV0AWvxvRqfOAEemHc1Cl+/py8yROtWKmHJlGSRTHBAh6jMhaBMk6CwQjfOOEN8ZLqoiNZ1N+buijNhjJgrQA3q3oBfHb/EDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284363; c=relaxed/simple;
	bh=OSrVOb6xHaeGjfxT6S+M5U1d4uaQudS/a+YMg8TaeUU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gyxfkzF5TTjc9m5bqVb1+HXII/hlL1e9DtOPNkbrv86xNZ2glksI//gt1Z0Ca7TH5iOmdCiGFScx/H/mn8eAx08k+jGo9dFWq48N0fuE6YTb5pvic+M3/Xs/pGU0mShWlYQeRnQXeDDt+y1eYiF3fqmaKPTbydxkShw3J3NZvqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1hDTm0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mi3j6+jd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1hDTm0Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mi3j6+jd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARHxA590744
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 10:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U9Vi2SQFTero6+Fo3XoTyS
	iig5/4/965SWVCeFLIx6A=; b=i1hDTm0ZQaNUxKxbkSOz4UxR5kCtUlRHmN1zAZ
	BwC6JvNzGCKom4z5+sofIsd/vpKzgsU2It2wGzV18TJ8tYgZEZz5zU0KGrcKOtWK
	TZ9m4/b5tDRr5EZdRvPuyAdGljn/rGHESHCWd0oF6SdmarTMLPb9Duiv9sf486bQ
	675B/NhVBhwHMR4nRnnnuHj/J7lV1Io9EHTDRfkm/bU7AjpGxtvG947JSRZvQBA9
	EcYti0gzZ992NKu6t3eVjbyZDGMSccidxZ1zAU7qJpQgXQ2qQpCRbfAGP7bdJGc3
	04P9tdtMnlKIBdqwUzZMba4qa0/kAzQAt0VnupEZQyl5tcSg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3k8b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:59:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a85a221b7bso1085508a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791284360; x=1791889160; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U9Vi2SQFTero6+Fo3XoTySiig5/4/965SWVCeFLIx6A=;
        b=Mi3j6+jd1QXgicwHm92oZ64zKqT5g2wVB5735+pp7hKbrmWd71iulWTt+Z510nSBXd
         SiQNLpyA+a3YFHjgFTeHJBZLEIIJBUClxVNFA+jsz8KjOWtZIMFbge3AFX/LbUaT8eOx
         92X85jGSC9w+H7L06tfzpJ07l78r2pnYf/P+dOtKRMcXiJh7BWZrVJr43k69HBC/HYsx
         gCnFeJUoW0ftV4wo25NdniaCrMMOA3taYglKH5yKfAjyCOUBVfAiqcBZmVxwQZlpZvde
         Z1Spdxj3ChiV3+Q2jIE+GfiZkMHq73iGO7basJ3y43m1CJwPbj+YmmSLikOmY6O+Hc88
         m+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284360; x=1791889160;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U9Vi2SQFTero6+Fo3XoTySiig5/4/965SWVCeFLIx6A=;
        b=JOl50JYC5P6nihsTwFS5BxtSDVYTo+YsZJMeCOebfPuWsRh8vdwukb27MuZde3NS2E
         NwlK8e6d7l3EZBFZ9HnP9XdLsC42DuB0iIYxEe+zZFXiJE/if3XdA20GUt85jGySqWV5
         8ZyFvWIWoX2A4cc7jqcfahL6TcgsxLgyPKoVcoVgmAr4UJ8jkEnrLi4JFUM2LxzNKf30
         0I0SUa1b+/ni5zy6oILHGMVXOJgA3lxv+mZB5RoS5QANQnLptRluqfTWips/lxBScbUZ
         A/Fp+hRYawZPLrvCcsQ3+TcQCL6oh74xG9o+up5ojjHnRg3+IifKFU6J4/TQk8RgfKlm
         VAKw==
X-Forwarded-Encrypted: i=1; AKwUvBwcZk49EvN6BcmKPCv4DIlof8ToQ5fZIhNATqSy6c2L/bka1COD0rIYzWsReyVeiapUs4b8AM/QJmaeNIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKooN5m9A83//69zbNJvPJH7jBFRwC7C7SmCy8Vmo26lTKWFShR
	oQ5XSB3xfnVBRyVI8N8exZHSfNTt58LPAiJhP9rvp7fMx4o0iJ3G99RlgT3aL34GsGHhRn0g7YX
	G3vqubfNqUL0+EcKB2BwX6vYedjqJbSB3IEwEMpej3q6IOfclmGdrAlgCucgUKd02xMM=
X-Gm-Gg: AYBFou2zM2IKHrvRIzaAw7y+7RmS/AZwhv/e2v0GvMF0X15C2PsL/NUXEuy11jRYxou
	J6QL36ZX73A7ppHx4sZ/Sjc4MV/YziNLEQagPY3q2Bb9R0uiFEIUrnYv8kskxtywNoPHdfY18K8
	WlM+ehimscqEas7wYIVnXQlO/tlIh8rzLX1vVvyCES9xTeaEHISjle0OgIKKezR6uGyN/D/xSFJ
	JViCcgjWAAt4ReQPkckjM15Okcx9nQbfxgtZFXAythqVKml+dNGMXVy80TqgwTZVuiQXelR/uva
	qZvDPbNPOppxFHF/Ot5dGv/5mP8VUeZgTTWNMcxzR11IhH5Ndpoec6q02rGWgf+3+DZ+FwNUxoB
	uyT8SIY7XHeAjObzRBRdEObOendU36HYOmUj/Eg==
X-Received: by 2002:a17:90b:4b0b:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3a872ae6919mr923691a91.3.1791284360514;
        Tue, 06 Oct 2026 03:59:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0b:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3a872ae6919mr923676a91.3.1791284360076;
        Tue, 06 Oct 2026 03:59:20 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e592a83sm2182343a12.31.2026.10.06.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:59:19 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Subject: [PATCH v2 0/2] mailbox: Remove redundant
 mbox_controller_unregister() on probe failure
Date: Tue, 06 Oct 2026 16:29:12 +0530
Message-Id: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDUxGoC/42OWw6CMBBFt0L6bcm0PFS+3IchpI8RaoBqSwmGs
 HcLbsCfSc7kzpm7Eo/OoCdVshKHs/HGjhH4KSGqE2OL1OjIhAMvGUBJZU4HaZdG2yB7bMLosDV
 +Qtc8zEJzrgsozjoTuiDR8XIY14f/Xv/YB/lENe3SPdHFY+s+R4GZ7bl/f82MAr0CY0pwuOisv
 Fnv03cQvbLDkMZB6m3bvpHMIwHjAAAA
X-Change-ID: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791284356; l=1227;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=OSrVOb6xHaeGjfxT6S+M5U1d4uaQudS/a+YMg8TaeUU=;
 b=9vJoMr0EglLAktZ6G5qan3Qwxhtf5lU+elvFCxVjhecT2tsP2NnllLlpdSo2vkgT3o+pAQdoG
 UswvvuNHwPiCfvRTolGz6tQOG/c4wt4vya9/plOKkT6cmrPfng+n2X3
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: yUxsxTqol7IURcDWhCP-TJll4EFjkoLF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MyBTYWx0ZWRfXxogwacoKxt/g
 v3kG6kQERYevNzDI0vip1R+rxKtbA0VpLhWBH3n63kX/HH+7u8Uzefpd8cgxEomXmOlvaUX+kwT
 UDpdSwm5tNhLuGdAEUeRgDW4gwHkRHI=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4d489 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=ONVsfYN4t8-gLpPBeRQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MyBTYWx0ZWRfXx6Nc7Yj1U3IZ
 z8nHNW8Ml8hUMJY9T5LXBbDOXSaplRsJNcVVt2qowvjacnnFX4kJHD7evE3YwIXnbecwwCZja0M
 q/nssHsVp2PonAkj+vfshtkDnM5OxTCTH3NSaZj8p9qVLrLXbHr9OVL4P8kVTMguFlj/kdbEY+s
 Tyl3QvPkAxYJvR8fJK4BD8d9re8Htz6Zo0KLsN0HInxJu5OiUky0zipXsTfPQQngYJffuDr2MMN
 iKgIboAuvBbrl016jf1uLnliED/ZUyA8g20zE4FJ6tSqE8Uyvgv2DykNkwsg85rNQtm3ti2vPt8
 f6nSP8QlEazHXh2B4jzneaUpHMplG1Zvp5nKv7tcq91wE2hXduLkS6SQQcLSGvWGtW1ZElrrNmi
 YTN7FQNCWJgnJvDs8me28H25WTjSEwoopCBTxQ7wlrCXruqo2PQ0IsZ8XR6qwi/JfMT/piT8t6A
 ab+J9IHdJlQIoARJbpQ==
X-Proofpoint-GUID: yUxsxTqol7IURcDWhCP-TJll4EFjkoLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060043

Changes in v2:
- Remove now-empty err_req_irq: label in qcom-ipcc.c (patch 1/2)
- Restore original alignment of devm_request_threaded_irq() arguments
  in arm_mhu_db.c (patch 2/2)

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
Changes in v2:
- Link to v1: https://patch.msgid.link/20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com

To: Manivannan Sadhasivam <mani@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
To: Huang Yiwei <quic_hyiwei@quicinc.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Anup Vishwakarma (2):
      mailbox: qcom-ipcc: Remove redundant mbox_controller_unregister() on probe failure
      mailbox: arm_mhu_db: Remove redundant mbox_controller_unregister() on probe failure

 drivers/mailbox/arm_mhu_db.c | 4 +---
 drivers/mailbox/qcom-ipcc.c  | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

