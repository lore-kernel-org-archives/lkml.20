Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A412B43DED7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871425; cv=none; b=AccBO/xuKkpuIGEQBCjUt4M5f2gUpsJe+/9SbokCbuayCWL3sFVADWRMhCdj4vbZn0mO5Kax7+go9bzsOUWdY1Eohu0MssB+QyqB/VFc5UK+j0Km8KJF6j+JxG7VWfzPy/bdqFmuJS4G+2Ylj6RRxBSsvYLlxjoEeTzfyhjyReo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871425; c=relaxed/simple;
	bh=ST5r54UHJnhDEXHm5b1W8hh9SkIJlT2UAfsUgpx/bEk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H8kBj89eHjVKUTPK1qM3PN7aZhMJZuJw1v88KB63M1JCnRvkRNkm8OZFo4wcmDtgNSQ0Gvy4kEv/pXoQ+hnl7s74WlQIXyTt7yXpqBvBpMRw3gqvU3pJc2AvXN33pVDD0pmQ+A1Y7NYp3U4lf5hJ7gIsO6PLSyeFqTc4u78mTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZCUK/NQ8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZCUK/NQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790871422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MW8MPgKyBUwlU006GqDV1tXcu8P/+XogLXDfUsva8HM=;
	b=ZCUK/NQ8PIUXyXGkb9yVn400J4WWUgnCfdfsyR/cj+9L5V9SY2MzzO3lJ7jn7tEdvwPbJ1
	Qx7kmTD/AwEOlBQXMavCmNKS4rpIJpDm9CineAg4NNjDKx+XNE9QIL0YiuObwwRMXF9xzw
	7tZ0TfeveGlhx4Xs9lW4vMGd66iCCqs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-295-C-qZb455NMeHH9N7MDpFPg-1; Thu,
 01 Oct 2026 12:16:59 -0400
X-MC-Unique: C-qZb455NMeHH9N7MDpFPg-1
X-Mimecast-MFC-AGG-ID: C-qZb455NMeHH9N7MDpFPg_1790871417
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C42B719772C1;
	Thu,  1 Oct 2026 16:16:56 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D2961956089;
	Thu,  1 Oct 2026 16:16:53 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v3 0/2] firmware: qcom: scm locking improvements
Date: Thu, 01 Oct 2026 18:16:47 +0200
Message-Id: <20261001-port-scm-patches-v3-0-17520fa3c541@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NyQrCMBSF4VcpWRvJ0HRa+R7iIsOtyaJNSUJQS
 t/dtCAouvwP3O+uKEJwENFQrShAdtH5uQQ/VUhbOd8BO1MaMcIa0jGCFx8SjnrCi0zaQsRqFJ0
 UkirRACpnS4DRPQ7yeittXUw+PI8Pme7rG6t/sUwxwdSMpul5W9eEXQIYK9NZ+wntWmYfAqd/B
 FYEJZUQvYC2VfxL2LbtBSc+gy3zAAAA
X-Change-ID: 20260820-port-scm-patches-bf58a5a1b56e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, Ninad Naik <quic_ninanaik@quicinc.com>, 
 Murali Nalajala <quic_mnalajal@quicinc.com>, 
 Venkatakrishnaiah Pari <quic_vpari@quicinc.com>, 
 Jian Shu <quic_jianshu@quicinc.com>, 
 Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790871413; l=2480;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=ST5r54UHJnhDEXHm5b1W8hh9SkIJlT2UAfsUgpx/bEk=;
 b=FvJuH7B4oGN09Rr+5qKZfT4a63rFmtuhACUmbGNrNIJAR960tw2W7LGpXSDBPx5IGag9TjprB
 a9gY4756APWBI9sED9/1PyufjCmAH30lw2xbAsVKzw/6wOtOH80K0XE
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The qcom_scm driver serializes Secure Channel Manager calls
to Qualcomm firmware. This series ports two related fixes from
Qualcomm's kernel trees [1][2] adapted for the current upstream
driver.

Series summary:

 Patch 1: Replace SCM global mutex with a counting semaphore.
 Patch 2: Allow SCM waitqueue completions to freeze and be killed
 cleanly on suspend and shutdown.

Adaptations:

- Size the semaphore from scm->wq_cnt (already queried via
  WAITQ_GET_INFO during probe) rather than adding call_ctx_cnt
  and extending skip_mutex helper
- Do not port skip_mutex unlock/relock around WAITQ_SLEEP; that
  path does not exist in master
- Initialize the semaphore before publishing __scm
- Drop TASK_KILLABLE: returning early on a fatal signal skips the
  QCOM_SCM_WAITQ_RESUME SMC, leaking the TrustZone execution context

Tested on Qualcomm's SA8775P Ride V3, kernel 7.2:
- qcom_scm probes successfully
- qcomtee platform device registered
- SMC calls complete without error

[1] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/raw/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/scm_adci/0008-PENDING-firmware-qcom-scm-Introduce-new-locking-mech.patch
[2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/commit/9319960e593c88e6d88bfaf0f6ed3e1235926ea3

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Changes in v3:
- Drop TASK_KILLABLE from patch 2 (raised by Sashiko)
- Rebase to v7.3-rc5 kernel
- Link to v2: https://lore.kernel.org/r/20260831-port-scm-patches-v2-0-bab5595e77b3@redhat.com

Changes in v2:
- Improved issue explanation in commit bodies
  and added Fixes: tags
- Treat 0 wq_cnt responses as invalid
- Forward wait_for_completion_state() return value
- Link to v1: https://lore.kernel.org/r/20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com

---
Ninad Naik (1):
      firmware: qcom: scm: Introduce new locking mechanism for SCM driver

Yuvaraj Ranganathan (1):
      firmware: qcom: scm: Allow the SMC request to freeze

 drivers/firmware/qcom/qcom_scm-legacy.c |  8 ++------
 drivers/firmware/qcom/qcom_scm-smc.c    |  7 ++-----
 drivers/firmware/qcom/qcom_scm.c        | 10 ++++++----
 drivers/firmware/qcom/qcom_scm.h        |  3 +++
 4 files changed, 13 insertions(+), 15 deletions(-)
---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20260820-port-scm-patches-bf58a5a1b56e

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

