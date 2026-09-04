Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110A44CA773
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535144; cv=none; b=bPyZV2RLRdXqOF8U73T1N+gtUbIWMqQiiH3miPd4QyVl92VNaCebMwfaWpOfgdaaw4Epxr1bt055MG6dAMexrPNUMS8QVsCDpo8lpK9OzSRd8QSc0dgHwP7YU7daUnfKjL4GMryaO2DQwLsv2XVaHZtgn/f8juNyj72hWB++twM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535144; c=relaxed/simple;
	bh=M56rSLJGvaOXD4jhTd2P8Kl7lC/ZDGHt0GhIAa+6uNE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=APwiq1Z9ByxUKymNzPVrilVqr7YOY4ElS0qL4US5IELVlUl5B21s+s8afggmA6wYf6rSMC7tVJ+I41XtuxI0m8rgK3sEP1CMHIxQ+SWJZMNKWAXJRxMeRlgHvVqXej0655wZabNBTP2o3ymrDfbWYGvSmtIS9bodtkjN9IU7DtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Badj+oSy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Badj+oSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788535142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wimpPQPc2l+rFv+WyXy4r7ufkipxJCeYkKOmyYXKdOc=;
	b=Badj+oSybVEa0uGuzcAHcz6l8tyNHBKYmMYhkcxqTJBj681CPVJTAYPpAtbCmRh23nlMHr
	kiHjcXV00Qrd9E9sPnRqoT8QVDNWIN0Ky86aafkeGDVixbHv13sS5RN4Pg0TZNFV/bXMQM
	5SnRtYnd9bEfQt9VjCbqoRYUHwUsgcs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-SIAK51tANpyujlKRgMVKaA-1; Fri,
 04 Sep 2026 11:18:57 -0400
X-MC-Unique: SIAK51tANpyujlKRgMVKaA-1
X-Mimecast-MFC-AGG-ID: SIAK51tANpyujlKRgMVKaA_1788535135
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8EC3C1855175;
	Fri,  4 Sep 2026 15:18:55 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 747BD18005AD;
	Fri,  4 Sep 2026 15:18:53 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v2 0/2] Add automotive SMEM hardening for Qualcomm
 platforms
Date: Fri, 04 Sep 2026 17:18:46 +0200
Message-Id: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03MQQ6CMBCF4auQWVvTqVQKK+9hWGAZZBalZEqIh
 nB3K3Hh8n95+TZIJEwJmmIDoZUTxymHORXgx256kuI+NxhtrtphreYoi0qBgqosOl9Vvi7RQv7
 PQgO/Duve5h45LVHeB73id/0pRv8pKyqteqy70g7WXR7DTagfu+XsY4B23/cPOVe7BaMAAAA=
X-Change-ID: 20260819-port-smem-7518c77c9415
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <quic_sarannya@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
 Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>, 
 Tony Truong <quic_truong@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788535133; l=1957;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=M56rSLJGvaOXD4jhTd2P8Kl7lC/ZDGHt0GhIAa+6uNE=;
 b=AjZiqyFLQ+U2qnbLm1yfowflVoIYJIiDL2YtMJlLcRtfyOd5dkm7YvypVzMVmMisY18//lvlJ
 RVfeZaQb1FuAERXm6C8HmrnuFOJPI32k38yScSbsgb8lT8OmlMY4tyt
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The Qualcomm SMEM driver manages shared memory partitions used for
inter-processor communication on Qualcomm SoCs, including the
automotive SA8775P platform. Vendor trees carry additional validation
and partition-enumeration logic that is not yet present in master.

Patch 1 adds boundary checks when walking private SMEM partition
entries, ensuring traversal does not read past the end of a partition.

Patch 2 skips multi-remote-host partitions during enumeration. SMEM
now supports partitions involving more than one remote host, but the
driver does not implement that case yet.

Both patches are based on public vendor patches from Qualcomm [1][2].
Adapted for master. In particular:

 - Dropped the xarray partition rework, which is already present in
   master (79602b750b96c, "soc: qcom: smem: Switch partitions to
   xarray")

Built on master (Linux 7.2.0-rc6+), and tested on Qualcomm SA8775P
Ride V3 board. SMEM platform device binds and initializes successfully.

[1] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/3e521f2641c8f01f00fd74a088206942ce23d6d4
[2] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/842dd28b0276b3824a607e067b3c20e266bcf230

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Changes in v2:
- Update patch 1 authorship to Sarannya
- Update all emails from @quicinc.com to @oss.qualcomm.com
- Make smem.c copyright yearless
- Link to v1: https://lore.kernel.org/r/20260820-port-smem-v1-0-d19a45f583bf@redhat.com

---
Sarannya S (1):
      soc: qcom: smem: add boundary checks for partitions

Tony Truong (1):
      soc: qcom: smem: ignore multi remote host partitions

 drivers/soc/qcom/smem.c | 111 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 33 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260819-port-smem-7518c77c9415

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

