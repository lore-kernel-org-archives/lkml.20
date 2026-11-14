Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644354;
	b=VhpplmIyUKVbBCZmqSfLgQqND0yrvdbuvNplgtZdcYvnQQblHxKzQRJHQns45TJD6VS8
	 he7qx2DfEqtxw2yy6kf+26geuGgRfjCnxEdVqqpkm9f7yw2W9kQqsPNNzJskLYj+itP45
	 daVy+Sf8ooYC2hiHA3YQcx/TZCTypcfEvraQpAg1J/OBerNio1i7YSucrEKKBk2QShvXT
	 BsHj9Iymfh0F+KvJkggcxRnEq1GMBE8UQ5Dnw3tV2vkSvraj4/F3/Aq6pxQhLg0wOTDnJ
	 WWUA2muY8qN//QFis6tSftKtLDQjL32uQ0tNHW77FNJCBzXxi8NaltVlSIVouq4KgXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pyx07GG+cQ7r4tHVzwwWnT6ylPidCzpSMdub9ploOvw=;
	b=WT3f28MNey3UWqnp99ZmY80MZ0EDvmHRRmZMo+90kSGOpnSY72iK5mNjDOIh09XV7FBq
	 Id9ZFBKyhllcX/0DKd/GmU54zFhHpkOSTcczyAzp98ZB6EUqXm5D+nnq0eYv3Wu730vII
	 EZgSYifn+SqdpCe/fB6O/Dbxq4K9DskTQ7Si6qEM+0XaN00RfC7evRvcA+3k1bZndLQ6a
	 Quox/F9q4c+y5DJ6CsVt5If/zH/i6Zqfco2Qn6ieYib8XN4dzWQZ0Zfw19vj1D+Gsq50j
	 fyMcJ8Dn4xVdbKMoRD3NyEj1m6/RqO3ku5x2M9Lv2fObMHjrwTwJpQAPq4g7VKErs7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aSrq/QuJ";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58C606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D58C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aSrq/QuJ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36ecc11bd26so225900eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644354; x=1795249154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pyx07GG+cQ7r4tHVzwwWnT6ylPidCzpSMdub9ploOvw=;
        b=aSrq/QuJ4Cupok7CN67Na0nW7sMjYue8p431hqYgT0HK11ejjJ4f5VH06C57XJmqFS
         wgyCW3GLkthJFxM0pjzRWR2EevJMOcIu4GlLNLOPvC0M4NcXUBoUQ0OAkjUD1Zsy7AI+
         P5OHmLOu32LXdmNgSU3WXDHv9rsv+pdk5UTeQuBkkVm/aHzjyMuQlN8BGEbqYOXPVNsR
         86fGOQ62s8fDmzE256a2/DonL69m15pJ0ggww4TbYpod+h57UGT4cPU2YjN+j36GYhHd
         V6AKOzmoYONuaUywHzmcxE220kLbyWKGFimE3yOeC6ToJPLDXWSOWH140FojDc3Xl190
         UjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644354; x=1795249154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pyx07GG+cQ7r4tHVzwwWnT6ylPidCzpSMdub9ploOvw=;
        b=SzAStkZH2b6L1PqYFoEH5yJkYx/w+NYlcsS/5Gqaeq/ZwU+PUd+Pj9YwetTFEYkCp9
         TUDJvf6LIVcbRlS/lhrTrnrqdKqkMc7rMWaEk838wYyH+zIHPhPo1cYzK7SxIpzpd/DI
         iu93RznHAfy14wi8D8rh0o2uEF6NIasKYkFvFf5z6IEN7xe4OtYsxs+axBCUWQaA/ecP
         7Y5KKry8jT/epdQPN7wZJhcI5oCKm30i1IS29oY9Dd0vAGsPHIWulA9moqBzEdnIsTOX
         2KDjmbdVnBbHPXj5zmMWdsf+kpMq3rUOb+o5VTNAg1ZrPMFwOtlrHA2lY+EuJFDP1qdj
         R84A==
X-Forwarded-Encrypted: i=1; AL+hErFYn9AG0HoClJhwNtr3YqrdNA8lXrMWWnvds4PUuJzwlTcWsPNfY1rFwda1J/cuk9zIFFjoFmwljeOa3XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2KLCLL+XqvESf4PqNYY4F0w/Awv6SvtSYcAcBM7ul7rhv3GKi
	AxLGrXYN6kWMX9vrJKznCYi6Pl4os5JuJZqDeLpAe6wcXZ+JHU/4ET1r
X-Gm-Gg: AYBFou0AmD1TyIOn191vrst9+77OJtVfwj3KzyYnleUYe84N2IAA8t+z/Xd3/yUZBIl
	/s15LPtKwBJpID4MnTw28y3JTNlSqcM4RMGD3cqw8ULgyekTw7JUTm0uTzvdv9TyL7OXpI/BOLb
	DZ/QpC8+TDMvdUE+xrXFLhwW8BkvJ+GuGIAB1Iulc8UCHfGaChifdkB9xhpLiIT2WCt1+5hQ0hz
	iLMqDyrZxBmK1RLpoCZm04+GJ31ngiwwBNZ7xNkBCp4DsEQsIlTX7a0Nbn6swYc+Ih6rbwFVECh
	xIZFKkNeZYNBiHtqPgBMxYZqJCev+zPnPrNwi8L+2dr7OWr9Pq9ndSWQo+lnC78Al8y8V07XtIa
	wsG3uD+Y5D+9WgNT9xCFv/ADt3Ei9S+WRgM6OI3+RJL/jTxCRz6k/jARJru1lRGOYyS5puTHKqJ
	Eh1Bx8JsTJcIRC6e/ImRA8SzejJ/ktooBOAiZuUjQaxBffuGJmI/Op1wQUYvu51ssqSfbyQmYXF
	pp7BsP/o9Z/BkGoSI4VTTrNCAplfdEF5R+BJriIjEkQk7/LTK5AnGSLp3icLbmlrVeUf8cYxaGo
	zDR3gbOe798PgmmLR0EFrCys6nj5ugjyrjt2u7DuHjtIiRhGFSlKuxNHDuBOclxdGnLpQUWPiRS
	J4TRWYYfNk+5j7VwXy8rBYCk7
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr8926328eec.1.1794644353569;
        Sat, 14 Nov 2026 00:19:13 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm14008333eec.3.2026.11.14.00.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:19:13 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Antonino Maniscalco <antomani103@gmail.com>,
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
Subject: [PATCH v2 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
Date: Sat, 14 Nov 2026 17:18:59 +0900
Message-ID: <20261114081902.1669-1-arpe1618@gmail.com>
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

Patch 1 makes a VM_BIND job that is freed without having run apply its
queued unmaps before it drops the references that keep the unmapped
pages alive, release its BO pins, and mark the VM unusable, as the VM
no longer matches its pgtables. Patch 2 destroys the VM_BIND entity
when its queue is closed, instead of on the final put, which can come
after the VM's scheduler has been torn down. Patch 3 puts the queue
last in msm_vma_job_free(), as the queue may hold the last reference to
the VM.

Changes in v2:
- New patch 1, for an issue that Sashiko reported on v1 patch 1, which
  that patch makes easier to hit.
- Patch 2: changelog refers to patch 1.

v1: https://lore.kernel.org/r/20261114062541.2001-1-arpe1618@gmail.com

Jiwoo Kim (3):
  drm/msm: Release the pins and ops of a VM_BIND job that never ran
  drm/msm: Destroy the VM_BIND entity when its queue is closed
  drm/msm: Put the VM_BIND queue last in msm_vma_job_free()

 drivers/gpu/drm/msm/msm_gem_vma.c     | 77 +++++++++++++++++++++------
 drivers/gpu/drm/msm/msm_gpu.h         |  6 +++
 drivers/gpu/drm/msm/msm_submitqueue.c | 50 ++++++++++++-----
 3 files changed, 102 insertions(+), 31 deletions(-)


base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.43.0

