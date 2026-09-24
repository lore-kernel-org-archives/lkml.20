Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE30247AF4D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255469; cv=none; b=tAse3mo4qQf4cmdZVF5ITEAamQA6oUswC0YUMts65Wthzs8p/r5xXHgurnvHOsOkuO4j1IG7LwskiktTYXKXZaZRYbo+SQfoiCs3r7kdCAeAfsRCq7Rz8NDOqS9Y2W+M8EYitTCbVDN+A6OHwqUSg3o72EVD4ZzjNO5rm84P03M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255469; c=relaxed/simple;
	bh=RpE473KszzH17HYgMUb8LduON/1ifwDjCRqC7DttZcc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HjT5rdzu3VPpmCUlKBJ65FZU9PDcfvX96ZCGk5whqNlqqehsRfuWymGUfC5ce1K4JnRWyH11G1DmxXk0DBwgv3u3myJqIbcWlHtofnR0/Z47FXV6FpmJjJjLkjhhrs0806vq66HPqKD7+vfKQCnnRawgjvbiNRArd4XXJ0DcUJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TiDYRlCp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TiDYRlCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790255466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wGd/N7e0wZbIXsO++vGg001i2u9cJCsA0SFI/XMX5f0=;
	b=TiDYRlCpbft74gOW8YqeLcvJ0FIHLt6hKscVfmilk8C3SHpSbyaYEp1Bl+sBkng5CQRnX4
	sZ+E/HP4nJODiRx3LwsIHfqReIgO3oeteKVP6KTqjlG8ovUxcp0U6+NrUzCRWpvMcc6slg
	/5qBTWHq923/Eovx4bFJciK+zpU/rfo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-49qdQ0b-PkGh4ytzlUmRVA-1; Thu,
 24 Sep 2026 09:11:04 -0400
X-MC-Unique: 49qdQ0b-PkGh4ytzlUmRVA-1
X-Mimecast-MFC-AGG-ID: 49qdQ0b-PkGh4ytzlUmRVA_1790255463
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCEDB195DE22;
	Thu, 24 Sep 2026 13:11:02 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B7E68180049F;
	Thu, 24 Sep 2026 13:11:00 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v3 0/4] Add automotive SMEM hardening for Qualcomm
 platforms
Date: Thu, 24 Sep 2026 15:10:34 +0200
Message-Id: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WMQQ7CIBQFr9KwFgMUBFx5D+OiwK9l0dIAIZqmd
 5c2JtblvLyZBSWIHhK6NguKUHzyYarQnhpkh256AvauMmKEXYiiGs8hZpxGGLEUVFkpreZUoPq
 fI/T+tbfuj8qDTznE954udFu/FUYOlUIxwY7qjoteqNb0twhu6PLZhhFtmcJ+qib8qLKqGsO1d
 K61XJk/dV3XD4BM57TeAAAA
X-Change-ID: 20260819-port-smem-7518c77c9415
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, 
 Sarannya S <quic_sarannya@oss.qualcomm.com>, 
 Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>, 
 Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>, 
 Tony Truong <quic_truong@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790255460; l=2638;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=RpE473KszzH17HYgMUb8LduON/1ifwDjCRqC7DttZcc=;
 b=bE5ZoPo5xrvZVwx3zLVrDc64TpTQw4dYhpM8zpMny0FF5UtmrF/JLu9UmZUktgsoIWricpLNZ
 t2szL1VjO6AA3ZrL2e19dGU1SUIebQGC11VZbpS4wHsixTDQaNP35Gm
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The Qualcomm SMEM driver manages shared memory partitions used for
inter-processor communication on Qualcomm SoCs, including the
automotive SA8775P platform. Vendor trees carry additional validation
and partition-enumeration logic that is not yet present in master.

Patch 1 adds IN_PARTITION_RANGE() for pointer+size checks against a region.

Patch 2 adds bounds checks when walking private uncached and cached
entry lists.

Patch 3 validates item payload size and pointer once a matching entry is
found.

Patch 4 skips multi-remote-host partitions during enumeration. SMEM
now supports partitions involving more than one remote host, but the
driver does not implement that case yet.

The first three patches split the original vendor boundary-check change
so each class of condition can be reviewed on its own. All four are
based on public vendor patches from Qualcomm [1][2]. Adapted for
master. In particular:

 - Dropped the xarray partition rework, which is already present in
   master (79602b750b96c, "soc: qcom: smem: Switch partitions to
   xarray")

Built on master (Linux 7.3-rc4), and tested (prior to rebase, with
Linux 7.2.0-rc6+) on Qualcomm SA8775P Ride V3 board. SMEM platform device
binds and initializes successfully.

[1] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/3e521f2641c8f01f00fd74a088206942ce23d6d4
[2] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/842dd28b0276b3824a607e067b3c20e266bcf230

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Changes in v3:
- Rebased to v7.3-rc4
- Split the overflow/boundary patch into helper, list-walk, and payload
  validation patches
- Fixed qcom_smem_get_private() while loop condition
- Fixed indentations
- Link to v2: https://lore.kernel.org/r/20260904-port-smem-v2-0-bb497dd3c48b@redhat.com

Changes in v2:
- Update patch 1 authorship to Sarannya
- Update all emails from @quicinc.com to @oss.qualcomm.com
- Make smem.c copyright yearless
- Link to v1: https://lore.kernel.org/r/20260820-port-smem-v1-0-d19a45f583bf@redhat.com

---
Sarannya S (3):
      soc: qcom: smem: add IN_PARTITION_RANGE helper
      soc: qcom: smem: validate private entry list walks
      soc: qcom: smem: validate private item payloads

Tony Truong (1):
      soc: qcom: smem: ignore multi remote host partitions

 drivers/soc/qcom/smem.c | 107 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 76 insertions(+), 31 deletions(-)
---
base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
change-id: 20260819-port-smem-7518c77c9415

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

