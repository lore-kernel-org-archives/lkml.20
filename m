Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242214;
	b=qoYr5UzBJF8LMAEyn7cxp4X/XJ6s4Ke2lzBsFe2lq/NOevLpVLmFlpvtZcjVPIUwM+RJ
	 LfVgofVn+Fcs17TgMJe7S9E37R7GVmwVECefOrxFo25nNJD3AzTDWO3sgVX/rRnNX/rwR
	 Y2qIbxYZAtGgC93xCVGSQrnDW26ZzOyUEi4vHCrNP3z+xOlvYuj0YWkiF5oHZNYAbWxh7
	 qcjjbWkDie+SXSEpDKRNEAP9zmtANGCdNv2Eis1BGB/8p3Y50qAJdtL0XNWT83PcvUtdq
	 higEBpn3Byk/d9Qc/pFFml9dSJmoaPxjWGoSfsoUWSI6pIihcABYfZCZFRQxXQp3ZDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+i1MwDM3O2yhOtvhcZrVhI/0oNqRtv4EvJtbPIkjNXA=;
	b=bpurGAaf8t9RWjOztqrmoq4KS+ZLfScJdMO5vw0y5ONLIzY8SvZBzgSMRe1O+4/7d7oO
	 vLSQ06FLowSPvt7AAVg7EqKWz46xgk3sLG2R3qEIg6EeKqEC/1eZUlOigKHh1u4QmxBCo
	 +PNjYzhQLm9r/7JOdVrfay+TJSXkD+tuZy7JujmdrHDSNoMvbyB9r6E+5YjLP8tqbahG5
	 HpqS5oXATQDscrog/0KM6QxeBIlAPqj3aUg0RyW3rWMFNVbcXQWmBs638xWiUGXxEUoYk
	 j4o+/4vCExhIZVcmBOdq7Mcfbt8bUiOzyxoqO+NkMDt18YF5AoScuMSou8kxus95UHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoIzAwNj;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7BB60A6F4B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B7BB60A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoIzAwNj
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5495d549924so11214561cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242213; x=1794847013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+i1MwDM3O2yhOtvhcZrVhI/0oNqRtv4EvJtbPIkjNXA=;
        b=FoIzAwNjbA8Th3jeM5HQIAMdkEjsi4l+IETeNlmZjX0H7yKQ5UlCYjP9aZSanbN02b
         lSkEqTWyIYFpn0odRR3V16lY9j89BjQ1AkCfhWHi/LAf3EaSESFbTSSvYAv0ryOgqnQ6
         rDlVBClRe8MPuwinpJsXvREiBYqPqZPdc2lyRKLXurFxL+IHtNH+tuiRkstSTvAl9ytJ
         fdDeQs7Cl02lXbISyjiHKTZVDtmsxY4r/HJqjJo0y8w6MTFioKF+mAU+RQFwXUSrnst+
         +EwqDtnuRq4NrECFuA9uxXzYFg/cjXfgzDylF09QI6/azYaH/5nVVeUpz1xOgEZnTGBb
         GGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242213; x=1794847013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i1MwDM3O2yhOtvhcZrVhI/0oNqRtv4EvJtbPIkjNXA=;
        b=AFwHnSnUzB94cPwOE+Xlks6kDiAuZaEo5A+QsmB15NsMuNMHB0tOrO794SRgaV5KWo
         GsjDCCRGa6gIM2dOh7wXhVsJcYdO7jZlrXXSjrWmAUjmLmDksZEpuh9gzzjPRYzISqqC
         R0ESvDM3cvctycuuDhiy3hFUDuu3PJZBkRy3a4TO2WI4sZCRepDpnXCIc5fl9OR3xzCV
         txuxChDxOnhkCTqmF59dUW83VSmEyOjrU6GNsRaxR8GXWQQYcim6MiCH0mCLzC/6boNa
         vvU/eDXLbbGLRaj2e4FBh0zVQSvP1RwFiaBKYMvWAwP8vrC9tT9mLxJ2oEt5I2qRERUX
         Cn+g==
X-Forwarded-Encrypted: i=1; AL+hErGq1nXJvBPOD6sXeVptxgclmJ+mAaBgQKNnJ5bIzzyQo4SY+uzvKL1+SXgFoYgvp34riOt4uD+Q27Fwsh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Xmau2bnUCbD9DtDy3IVQJ5a8TrpuwsIZupB6Z98/MLBiXRz2
	x7jbCddeCbWE02W2ywZRIvhFS0VA63rSfMP0SaVyYYZneL1SeOrfW81p
X-Gm-Gg: AYBFou0QjFDZzASvYbZol819lazawTWNNJj/1ubiW38ji49Ht8BZbC/xINVI64G5/Ad
	64RUdFcSdFW0IKNkWjo3Ly/pedUiStRpEd9m8Dkv4VFdPDnm/4v5Wmt+4lvQCSXpk3//puGKZhT
	HmpWGi2V+BZNCVIF75AmPe3skmIflPXcL5A1bV7CgSS1G/fH6VicKLDA82fP0Xpyj246NBLm/UA
	hEqqgVvMwYnQvFK4kP0nnWc47AfWOx5IdtCtEy1Uc363vObf2ZDFS3R3olXNGOlVPsU/2bnyKlQ
	QUNzbcwdMkNJcVv4qA7N0Xfe89pSIa1uUgpsE8wu+Vo7tr4cKcbjNLnfQuJ20vNuISbI2S0m3AK
	Sk3eFWQeHGx8GWCQICsuc9MfKpV3MzNHfZnCUuitoX9fiijWWCxqlPchhEIJj3Ke4XQ/h9A+d4i
	yHxC9XnfGD5ZSjD610xosTZxoNwX+be8AbTiMyuRbeYOzuCUz8TEA+s0CJMyd5CXDwMGXtcFoY3
	9ibDp8scCynXqs9knl/R9ij1qKJsC6Y8iFzvkEXIQ2m3gqQafbNJG6jtYC7U6OPH/VQYmPjHd5l
	VZiaHkYfmkzLH/Uthw==
X-Received: by 2002:a05:622a:5505:b0:535:a5fb:6446 with SMTP id d75a77b69052e-552a604f9ffmr71709701cf.64.1794242213378;
        Mon, 09 Nov 2026 08:36:53 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eced95d91sm45729516d6.9.2026.11.09.08.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:36:52 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	open-iscsi@googlegroups.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] scsi: iscsi: Remove the endpoint ID only once when device_register() fails
Date: Mon,  9 Nov 2026 11:36:49 -0500
Message-ID: <20261109163649.1092897-1-lcy8047@gmail.com>
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

When device_register() fails, iscsi_create_endpoint() removes the
endpoint ID from iscsi_ep_idr, drops iscsi_ep_idr_mutex and then calls
put_device(). put_device() runs iscsi_endpoint_release(), which removes
the same ID again. If another endpoint gets that ID in between, its
entry is removed and iscsi_lookup_endpoint() no longer finds it. The
next endpoint then gets the same ID and fails to register:

[    6.689361] sysfs: cannot create duplicate filename '/devices/virtual/iscsi_endpoint/ep-1'

Leave the removal to iscsi_endpoint_release().

Fixes: f014165faa7b ("scsi: iscsi: Fix possible memory leak when device_register() failed")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing. Sashiko AI review
also pointed it out as a pre-existing issue.
https://lore.kernel.org/all/20260617204203.91A3B1F000E9@smtp.kernel.org/

Reproduced in QEMU (x86_64) with CONFIG_DEBUG_KOBJECT_RELEASE, which
delays iscsi_endpoint_release() by 1-4 seconds, and a test module. The
module makes device_register() fail with fail-nth (an allocation in
device_add()), creates a second endpoint and looks it up after the
delayed release. Without this patch, the second endpoint gets the same
ID 1 and is not found, and a third endpoint fails with the error above.
With it, the second endpoint gets ID 2 and is found, and the third gets
ID 1 after the release.

 drivers/scsi/scsi_transport_iscsi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/scsi_transport_iscsi.c b/drivers/scsi/scsi_transport_iscsi.c
index b094af7c997e..6e38fbfd5a9d 100644
--- a/drivers/scsi/scsi_transport_iscsi.c
+++ b/drivers/scsi/scsi_transport_iscsi.c
@@ -246,9 +246,6 @@ iscsi_create_endpoint(int dd_size)
 	return NULL;
 
 put_dev:
-	mutex_lock(&iscsi_ep_idr_mutex);
-	idr_remove(&iscsi_ep_idr, id);
-	mutex_unlock(&iscsi_ep_idr_mutex);
 	put_device(&ep->dev);
 	return NULL;
 free_ep:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

