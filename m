Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6481E476CFE;
	Fri, 11 Sep 2026 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130356; cv=none; b=avEenxGEU6NCp0x21Isl0x7da7qImM5sYNAf3pgkogGpCKLDBSoE5JMy+JV9IGpiKNRx8sQjgb1mx0bsuY5+wxoSEQNiK+MK70xYrGBes7pSwiAZJRLDGVm8I8NkO8tNXRpNz06zOyFPYHqmrNSVeyRZwZludfb8IQg7EYsuKek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130356; c=relaxed/simple;
	bh=421bqo3Zz+edTk7XRyQ9NRm2fUkqs9POzrFkYzd5Zi8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OLhXGsaL13VkXpFylxsbAq70WS4EBCjqdrbVInJfmgmjgwiA4XkVz76G/tkX5UOQdXbftJZ2IgxRe9q2igOcQDvlXqmZ7EipYnc49r+v0r1WYfF77bKyCyZWfuNwUzFSxW1QC4CKXhWMuy5UxnGyvtj259iaZ2cw1m+Gd0KTsQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiuBKHrd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiuBKHrd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBEE1F000FF;
	Fri, 11 Sep 2026 12:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789130345;
	bh=2imA1bYF1kAmjEc2GRQkHWBwCc3ifJ+pBFnGthYt64g=;
	h=From:Subject:Date:To:Cc;
	b=KiuBKHrdByWCccEpc5ZHwn5LiiAWPY3fDNjD6CL9OmY60b3fYxdd7sBuG7/RMhOr2
	 TVP2Q1POuaChlkGidarqZkjiAIV+ArvnG8jdPHS6fiZhvUIU60zB0zoh/aKa7QrceR
	 T2151h/n4TddhdOHJPWT/TO/7Yn6WYt3cAk0I33INcYuWg89jn8RzMAYOrVquAlEyX
	 XFSWENtKh6/DNkj0y2Gv3V5i8nKQ4wmAirn+t+MjnFfxztKb29KSmqBVOzqdtSGFcI
	 FyFLOquJpS6dN9ZBSp6s1PPNrO+YoQFJBFOj/46MJB+EDtHvOj/Y1A3qYd0QoBdAK7
	 Hml1L+ifvocKw==
From: Sumit Garg <sumit.garg@kernel.org>
Subject: [PATCH 0/3] media: qcom: Skip SCM secure memory protection with
 OP-TEE PAS backend
Date: Fri, 11 Sep 2026 18:08:54 +0530
Message-Id: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBG4avErBtQiciuEi3E/mo2KRoShHdPW
 n6L917KSIJMc/dSQpEs4WrQfUf+dNcBlq2ZjDKjslpzkQ2BQ7wBji5z0exHa+yEaVDeUQtjwi7
 PP13WWj8+E7A/ZAAAAA==
X-Change-ID: 20260911-video-optee-pas-v1-c69298e840ca
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
X-Mailer: b4 0.14.3

The Qualcomm peripheral authentication service (PAS) can be serviced by
either the SCM (TrustZone) backend or, on OP-TEE based platforms, by the
OP-TEE backend. qcom_scm_mem_protect_video_var() is only implemented by
the SCM backend; with OP-TEE the TEE itself owns secure memory
protection and does not service this call. Issuing it unconditionally on
an OP-TEE backend fails firmware bring-up for the venus and iris video
codecs.

To let consumers make this distinction, patch 1 exposes the name of the
active PAS backend via a new qcom_pas_get_backend() helper and adds
QCOM_PAS_BACKEND_SCM/QCOM_PAS_BACKEND_TEE identifiers for them to match
against.

Patches 2 and 3 use this helper in the iris and venus drivers to skip
the SCM-only qcom_scm_mem_protect_video_var() call when a non-SCM
backend (e.g. OP-TEE) is active, leaving the SCM path unchanged.

No functional change is intended for the SCM backend.

Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
Jorge Ramirez-Ortiz (2):
      firmware: qcom: pas: Expose the active PAS backend name
      media: iris: Skip SCM call for non-SCM PAS backend

Sumit Garg (1):
      media: venus: Skip SCM call for non-SCM PAS backend

 drivers/firmware/qcom/qcom_pas.c                 |  8 ++++++++
 drivers/firmware/qcom/qcom_pas_tee.c             |  2 +-
 drivers/firmware/qcom/qcom_scm.c                 |  2 +-
 drivers/media/platform/qcom/iris/iris_firmware.c | 11 +++++++++++
 drivers/media/platform/qcom/venus/firmware.c     | 10 ++++++++++
 include/linux/firmware/qcom/qcom_pas.h           |  5 +++++
 6 files changed, 36 insertions(+), 2 deletions(-)
---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260911-video-optee-pas-v1-c69298e840ca

Best regards,
-- 
Sumit Garg <sumit.garg@kernel.org>

