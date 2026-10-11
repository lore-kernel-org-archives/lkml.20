Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC12374A0B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791711955; cv=none; b=Uw7g4DXVmoDFswetJRrNXI52f0HIBoLhOghTpxLgDt2Uad6c8kP+6yv5rt0kyO1DewbH1lZPaRGlWTKD/CvHTJqMoDMdU6r1y86A4Yk7PdgCwmYcVKdGT1JX3fIPtcJm323n+hk8ymBInrnS/wwhryCoEW3QP197uNq1tOMKpaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791711955; c=relaxed/simple;
	bh=5mmZhR/1CGYCcEvQ2dg1eKpC1CBZRcve2O2Akd7oIKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SWs/7B0CgWHw9guJukIntlX0pJA4feXgyyIRBKmhYiDDpFUjnODHz7eYBGRRmuiBleBn1kGkj7VtwON3Jv7GuUW5/Jlcze0RdmS22X02fhT6/rE50bfnIEbifEb2AFMUFS7DlXeKhFC6fBG/q3IQFdFhwNHIh0naZNfO/S3NWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O74gu06h; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O74gu06h"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e836252e1dso8055505ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791711954; x=1792316754; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AvGhTKKdbU1GWyQfWY5VlojnPZ4MgvqmXbvuxJbcqHg=;
        b=O74gu06hmmgmwkawjp/AmttXzVUeEYbTm96xuAyqot9cNjK1O2LkBN3f2ItUU/Ka6Z
         iMvBtQC60CkKnSYsnoeHb3SBPTIoKq1qJDDveGvh5CkT2vFrERqDPT6qH5CSiQ7uMb0U
         T60mBYO02oM4lLRp67xteXObajyVqGF3UlqOF+GHR/UWHTWz+cVDatpX0sX+QlzEIrEC
         Wkk5Od8dKSRayRnKXfYaYvd230Y79pPEqCMYKoGh4GPeHZggi8wJgWCN9tZujKrtWj7L
         NS3kmqZYn0FJLRKSfvqBulKIEF19QnaYjxTeWOPQMtDO9v1ECqJJ92o94/jL7+UZqNFz
         Ddxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791711954; x=1792316754;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AvGhTKKdbU1GWyQfWY5VlojnPZ4MgvqmXbvuxJbcqHg=;
        b=wHTlsmuoO13k8wt3ZnG6CdcbihKDD7gLQD1LTzLH2OBzwIu2jm3w0QXKPMulFtO6+m
         RHaIZsmvnat6RM+dX+T0XUAHpp3cytYk3vfi5HHhLNzmhuaj7GrgK/ckTvoOsXmzghrN
         cjmslQNoTngY/Dc3MkkrVDWk3ty3/VymOux7o2yR7bIOcre8sMEfyvaEBjz8s2Ig7BDz
         7KMEC/ddhIQMznkwwhfSzxBcjnmTWmiPsK4h56Mw49Uq8ambg5WjJfDcuQLrPLKKEQYc
         Ad9mCx2y4PSz5guXYAj+vswYyUqKFVKy3xolpcODXmDCRSBCh7ttpcMHfVvdw0m+qszB
         zcbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwdPMuPsQ3NHistWvmo9uFmlpkh2QdbRICU1B7KJwyh4W7cIGCdKuELtrrcghsjZ0vB90c7NIWxiy1KPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTaKo2djqjw5Axme7q0slLHxaSoldh4JYQR6EyUO+oy4Dp2Qcg
	0oCNsMfkaCw+zz8j86BD4jDKWBJMTEGDPN7Nuhd8r/cJCg7xstyXrixB
X-Gm-Gg: AYBFou1TwC81n80+EBwRfsRT16eJuVwwxnR5noeqnpQANDxH/Hm4kV3sN8zrbO9t39o
	6M8PTMntU+eM42PiiUeBPiBgqrfWJ0KxhWlH9uYcD1rJu7bWGyHcrCyDBmVIxU+7PKoK+cFVvP5
	SRYmaFVmgMQt6rTc4HmSSMpR6W05gKgDAinSAanQATsEOkS3uh4j6AnAehJ7P/5hHU6sDD9iWGG
	kYU0dFpVbEFPDOyzd+ZtXBC08DLgeE0n2K+4KHy+Zrt1wQ0AVOh2uaYG+lr/olOFFIEl3WeTBFl
	qY7FMdHGdYrD4sKjRbtSEjfPcPwt7gTUY4FyMp4TT95w1dneGHenvhUkx7pbQGEcJqB8Bsv0quL
	7reZ0LhDueHiOLj5FNZaoB6gIcqskBW38HloN2js8lC8RYpYkVONVRPi+QunOkElMDGIfxcOY4n
	uXrBNAQraNhHOTiX9UBizFfemvU2zMjbiC23gABOhuM8Y40L1lQ5ajGTPE80x0E7peKp4=
X-Received: by 2002:a17:902:ea05:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2e842abf8a8mr58037495ad.31.1791711953944;
        Sun, 11 Oct 2026 02:45:53 -0700 (PDT)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422ba80asm31067695ad.63.2026.10.11.02.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:45:53 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH v2 0/2] drm/imagination: Switch the GPUVM to immediate mode
Date: Sun, 11 Oct 2026 18:45:31 +0900
Message-Id: <20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALtay2oC/32Oyw6CMBBFf8V07ShtVNCV/2FY9DGFMRZIC42G8
 O+2ELfu5kzuPbkzC+gJA7vtZuYxUqC+SyD2O6Zb2TUIZBIzUYgLLziHIXpohik6IOfQkBwRbIm
 yQqMFlpal5uDR0nu1PuqNw6SeqMesygklA4LystNtfhnvwFHQx98BWz8lWwpj7z/rwMiz8f+Wy
 KGAsxLXyliNJ1vdGyfpddC9Y/WyLF9T+9QI8gAAAA==
X-Change-ID: 20261011-pvr-gpuvm-immediate-f7ea8edc2e7f
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Frank Binns <frank.binns@imgtec.com>, imagination@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

Switch the GPUVM to immediate mode, as a prerequisite for asynchronous
VM_BIND. A revised VM_BIND series will follow separately; v1 [1] is
linked only for context.

The switch also fixes an issue Sashiko reported on [1]: the GPUVA lists
of other objects are updated without holding their reservations [2].

Based on drm-misc-fixes (depends on 196d4d10c1b3).

Tested on BeagleY-AI with lockdep, KASAN and failslab enabled:
- All IGT imagination tests pass, including pvr_vm_map [3].
- The fail-nth reproducer in patch 1 no longer warns.

[1] https://lore.kernel.org/r/20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com
[2] https://sashiko.dev/#/patchset/20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com?part=1
[3] https://lore.kernel.org/igt-dev/20260930125057.1837788-1-gye976@gmail.com/

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Changes in v2:
- Patch 1: drain the vm_bo that fini() deferred when map_init() fails.
  (Sashiko)
- Link to v1: https://patch.msgid.link/20261011-pvr-gpuvm-immediate-v1-0-5b298dfce4f8@gmail.com

---
Gyeyoung Baek (2):
      drm/imagination: Switch the GPUVM to immediate mode
      drm/imagination: Stop locking reservations around map and unmap

 drivers/gpu/drm/imagination/pvr_vm.c | 82 +++++++++++++-----------------------
 1 file changed, 30 insertions(+), 52 deletions(-)
---
base-commit: 6ccf996a0dec1852dab94ad865f27b4904750e12
change-id: 20261011-pvr-gpuvm-immediate-f7ea8edc2e7f

Best regards,
--  
Gyeyoung Baek <gye976@gmail.com>

