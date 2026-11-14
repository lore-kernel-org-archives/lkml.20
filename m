Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665944;
	b=ZwjCDlv50kGYq1s/5pZMJ6SCLCwKS3a3Cccfr7+hRaHhVd+ZbdPwc8OzdzGx+/wGDU57
	 TeOvv+d0SSB5oVr/pUoGb6zef9mRXlUDeg5yLQnmUpnzfTyNNDsWh5H+HZ5+mbDOARsFP
	 yDffgfAZvTBQRQY3q3NEzDBzV7XJ3bpdik6T74u49yOCpka9T4sucaCxFB6bd6yEhCI9v
	 rN8LF9iXuABr3IaiPUE7i7H+fdzIGW/obN8nQKwYOYphprmPMNoG1NTUvBoUuctqqc6gm
	 Tb2wEIwpU6AjNdRHyPJ+OPwsHAfDWo84u4EVCLisnIVjiZv7Qj1jsXZkM+c1MMQrpcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=994O5G9ZxUQ8jqNBdTBnXMOuXg5Iwc5e9f/ldhdma60=;
	b=Ma9QkSunyHtuXXnSwTYZ7EUPHWK2/1OGHJF2zgj97wru7axj3O5yv8A49HKikJPFo+YO
	 Fle2tn8hCvPQRBKMjWMcE6RWrwovL5/CzDqn5rJM4zSePz8dCOusLQ+LIU4AiyKnf8Emm
	 vmdJwukLQ8t3BsTeYknFBEe++v1Uvh3ePltP8YXBK33dDN5Kki0OqcN7KC9GuI4vhYhc1
	 TaNKVfOBV9RRZxuAHXU99eQs8qH9vdoyjdGz9NusMaFHmPM+D6tIT5pyUk7FXUvl1nWKk
	 BNl05VGJe+UjiEaiW+bFsoVx3At73GWg3GGuXg9s2ZgH+v5tFj6bhjl9Rw7z4NZGxJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/UIVKlY";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C845A606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C845A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/UIVKlY
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3719e3cb82bso228724eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794665943; x=1795270743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=994O5G9ZxUQ8jqNBdTBnXMOuXg5Iwc5e9f/ldhdma60=;
        b=U/UIVKlYNtUJHaFeYSNk1Squ9DtUOMUNBXdocSmtTNj3Rh8h2BTlPE023tj183unzW
         6rk73stKj5FvDnaZsppNJ9tBZS7Gx8wAgNd0R7kTSE4yXgLBYi/4V8IZP1vINPyc0Ixk
         byUHLZUWhxbwe5kOoRV6Hh0Jon41ww9LO97285jbq0ZSNshA8tYyd7HNDyi1spBFf5x7
         c5XrIarqjsLqUU8nU7V5Xz26PL1+5FrLzjRD55NgdkwW3IgFGkVc8DTedWn9Vx66GYr8
         F96fSBLB9mekI/6Q7p6I3gzZCo/VgzyqGat0jF4onF4ELPVN2nuzwIn6YaNE9g+05VcD
         GiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794665943; x=1795270743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=994O5G9ZxUQ8jqNBdTBnXMOuXg5Iwc5e9f/ldhdma60=;
        b=J6Rt3+ok+0Jwbiho53hlwjLTBUfHyldchWf+2jBmuq1m7LSD6iOrSZ5NuwrXvxYwDr
         PzsdsSwcB2LElnmP0v+Z84dV+/5mB7LuqXgnUaT7dEPPEN/LxikG7+VKH8N5jqLw1Pap
         VAdyPuV8TjoJ5nbO0mz4ol/X5+az5o8nKW6Bz46oSRXFT+XuTb7OucNMr+T8O4UoEUGM
         a5b1H64yIfxCNvQ981JjGZgaGx9tciYCC1w/vovE7R3DxgS+zarrxfh+fEChrbeulEIP
         43Q/8vLnngrp1C2WsLXc+jczGkBOYeytFMBm8OW83pYX5+IxZgCan6YnBsI+k72oC4FU
         pr8g==
X-Forwarded-Encrypted: i=1; AL+hErG8qMPGr/QTgR1xTYwv1K9UZ1r9Vgw3cxTZMWdZQ7vLbjZ576/9Z91hmxivWlzVPFibI1a0oL/e5W3VgPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BsMEV3cl03Bk963OW4/Hdx1OvjQ6i/Iia7eQNb1Acq/10h4sZ
	m5caWikCDVDfARho5QAcvPjbESSUKF2ihpfQ4Zp5YX1YLS9By63VAWN0
X-Gm-Gg: AYBFou1d90Q2DOXEv30zjCRVA5p5RUmG+l7iQGRn5pZeti0iK2G2Zds0S3VStNOOnZu
	NYXpxPObksxE6CNWAVag+Q3iYAFYQJZF2v5SiqQvlaNrIcM8VQ5NyX5foSSE1bJuWQdkKuTVwFE
	FnNI6qAIVsnUEDKkLIWIp4orKs9uS3MlSWlrHIfUnomZ3hlwIZTyYKTSwR+6xXq2hxDgPnH/scW
	G0Xc6B6nUc+kkzIbm1t269Z0uY/9RM0xCkhg0EraINrJir0J2ngo2OnIsfFuBckUqPFtutBg9TZ
	QtzI4expJD1+6CpbelVrmKOnhZ1C0PkgFVBIxTevEo86wuDwl4wRByYvJDOgRaGtL4vp3orsREp
	g+jHsSKZBB7mn5/QGTRzhexu8bLGcRSyEHUy57z0Q0aUmiUE02dTQbw74EcAUQPa8uf8r/F7WXO
	HwuMVf6x6OFu+lweWNCCDI+kIijGR1xQtWZnuU2jwOtdyjekcAhLXQAg9c88gEgKMCEnr+fOE+A
	jbU/gF2r2hJaL2qlV9/iQm8jVjLi520dhQr0N+O1FHp7vb8XvOCvOh99RfvZOiaeKUdwHwtSXKw
	5BpSAZLUrRTlagkMBAhFSXBvHcdyMEMMbVSndb2iZ41GeCnefdggKYX2LEcTuydEX0Ew7WrQwVU
	vE4s=
X-Received: by 2002:a05:7022:158e:b0:183:d275:cf76 with SMTP id a92af1059eb24-1b5030dcb27mr9272048c88.2.1794665942684;
        Sat, 14 Nov 2026 06:19:02 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm14745032c88.13.2026.11.14.06.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:19:02 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
Date: Sat, 14 Nov 2026 23:18:48 +0900
Message-ID: <20261114141851.134290-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fix what happens to VM_BIND jobs, queues and entities when the
file or a VM_BIND queue is closed while jobs are still pending.

Patch 1 makes a VM_BIND job that the scheduler kills before it runs
apply its queued unmaps before it drops the references that keep the
unmapped pages alive, release its BO pins, and mark the VM unusable,
as the VM no longer matches its pgtables. Patch 2 destroys the VM_BIND
entity when its queue is closed, instead of on the final put, which can
come after the VM's scheduler has been torn down. Patch 3 puts the
queue last when a job is freed, as the queue may hold the last
reference to the VM.

Changes in v3:
- Patch 1: only apply the queued ops of a job that the scheduler frees
  after killing it, once its dependencies and the previous job of its
  entity are done. The error path of msm_ioctl_vm_bind() frees the job
  right away, so v2 could apply its unmaps too early and out of order
  (Sashiko). That path is left as it is in mainline, and the title now
  says which jobs the patch is about.
- Patch 3: rebased on patch 1, title adjusted.

Changes in v2:
- New patch 1, for an issue that Sashiko reported on v1 patch 1, which
  that patch makes easier to hit.
- Patch 2: changelog refers to patch 1.

v2: https://lore.kernel.org/r/20261114081902.1669-1-arpe1618@gmail.com
v1: https://lore.kernel.org/r/20261114062541.2001-1-arpe1618@gmail.com

Jiwoo Kim (3):
  drm/msm: Release the pins and ops of a killed VM_BIND job
  drm/msm: Destroy the VM_BIND entity when its queue is closed
  drm/msm: Put the VM_BIND queue last when freeing a VM_BIND job

 drivers/gpu/drm/msm/msm_gem_vma.c     | 99 +++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_gpu.h         |  6 ++
 drivers/gpu/drm/msm/msm_submitqueue.c | 50 ++++++++++----
 3 files changed, 128 insertions(+), 27 deletions(-)


base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.43.0

