Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195740;
	b=sGcJC/1D9CNd1MRJoHMDd3LOze8g5JFpAvkjo3U0W4Ry8N1dOrsalhjcrgHBnaCHs0u/
	 nBbeHvM5ejb5+gFudn3GWYq5YmHVhFaYz/YvLlNfLG6/LYDQ0jIzm5sfRkWFnY/J4v0ii
	 ymTvbKWvfXCCWgRTAspoRYjbz4Vk7x6fvc/xctIKcNes4t1fKdPUyEXPwkJtnmZOoBw1R
	 9HdzVZ3aUgFFwqspcqdCt0ItHs8Xv1lw7t+buI73TTJEJGrh2sPPMd8TV46OAp2ZjpDpm
	 9PdBDucpFgK3Nd5tp9n8ZiguEg+rmbJPibXKzzCRUeDjXRMhAyFTMG+xVrNSZBM9Xwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VDRRIAOPMvAyme5rrZYSdHK5HezA3cmZQYqbZeADUVQ=;
	b=yv9VVVwmnedSbf/FsMrYF7Ixjm5I8cQx7ZK2yOcrMLvEr0CbJfj4LLNqwQXuGNOtvzly
	 PGX7eux/KIHFZ3JaD2ZuAMXv9YGqnRIHcuJHSkpbaMWXgo6DxO2OKLiemxkV0OcQK9x/2
	 MW0If6+U9lFlKdpIMfUx1mJQUmoP/PBj+wVdp+NvpvtxqZ7uW7nQzGL3+mRtlELmLXWST
	 TFRKpSIn2Z+1TQ7m/be8nmJ63rd2HZgylBuBdd7+B8n0A/rLBtDOzZ/Z2dygtl4/cCwf7
	 ZaXPdP26q1irLoIuXLgqHb+00KgPK1injm7Hs8nK9KULlTTM2IK4+nDBfzCCkGco5RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yszIgQoS;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C401606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C401606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yszIgQoS
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb681de50eso111007a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794195739; x=1794800539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDRRIAOPMvAyme5rrZYSdHK5HezA3cmZQYqbZeADUVQ=;
        b=yszIgQoSKL+H5oRArtokXgQeoBrU/95Lbo/2O7+zLdEicZKVq20yNYRADZFMecrId8
         vTxHaJ+ZV/MSfBSC/G+zCTqLRfm6c5V681lB01kNnyIwbhvNfXUFSmhqCq8EM6ZhvCtu
         atK3AkpBEDeobx0pLTBlxJDaDzmia+epu5npasNdrwXTwaULAImp1zRiM8qZ88tpyziI
         MTzEO9QQYHqrk1bKsngqKhgnOASVFDn3gc12nFNiDR7h7dBz5Tef9Los/dTXDCHhayRT
         oEYDqU94DrrXey1E1/0nUB66RFjYMMcKqXu66hXCdsWbLl59I3uuzIOV7jCj24AUPz5b
         k9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794195739; x=1794800539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDRRIAOPMvAyme5rrZYSdHK5HezA3cmZQYqbZeADUVQ=;
        b=csM7quNd6hRMfCQ7F7nVJOLgFwOF57LZ5pv29/WzJl2GmiOmmw5y7GBtcM+gxOSsfj
         QGE6Em6CsPaX1Vi87ycVH4QxYSddTW2lJ0Kl1W0zdGpsQ7PRn2XpQkL2LzqKWhUKLvXj
         3m/QeWdiWY1vKjBd/OCrSf9nPZoXLUnatNt4ZFTUxEGnCLECU4CkKCIFnvOMcvCrOhBv
         6LrSsYMAYL9KsziqEaZFx5U22hg5ENA4uPL7DlNenXmdOhUVl/RdW6ibQVV+u8QHmx84
         McF3tjIo8CGvPlfnU+mupPy0Q24j6ygAEt+JY6AvjseK4q3yhXtM4hpzBcurku30qEzb
         ripw==
X-Forwarded-Encrypted: i=1; AL+hErEyuYA3ltvxmZRIyIkpbvAqa1NX4VGVuvSXrOWqwhTw7z1fw6VvERCTboyXYQHgNLEEElL2xNdsRQAvHuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AYHgYlUOvyxLe4aYUeUYM3iZURU+ycSAtiWAw6mHyQGMgFgL/
	lexq6pYSg8rRqHUDhAbQiYSRsxNTxdMqWxoj71lexYpkENTz33r5VLX7
X-Gm-Gg: AYBFou1EublVjXRoCF5bmzhbI/w9cxAdboWVLa8s0sFAAUPItuY+GcLOfDr2AO4FlNK
	WQkTryEjzmxxJ30pAW4NvB+jY5j4ZZ9hLMsu1mpK7yKDclpQfg+wbviyKW2S7nlLCzTAIQqKXj9
	24SfPXjN8FWmBwGdjA5Xo06PI5NS90jyM5+miTevo4PR2iZIX8nnSWJ5lMXQP43wNorQKhkJzmA
	7aDiesn6XtoSygGT62l2YYi1bIvudHD1AWOVerziS1KuzdozUIc/jxnTIHCSzsc/ucnAlGLrG4I
	oc5m1YD+v0RI8tLfFOVH/vuvwjNwpkqX8Dfs3J0RAPuTd7qj1VojZXmJGR9o7m7HxK8qHrX3DJf
	Kym1OYhwU9AXEIQPp/5MBxAwmaBpUjDlB308895EJ/3EyQPtMyLj21y2BtswLWqiOfUzflqhW/3
	o/bSwTplH7o7IqJ+mkKMiC2QKzhkZ9sLMcAOElGFkGhSHtvWELKpe69/61dSPKlsNj0lPiAqMYr
	Nd6iYDEaLT6uHG+Yq4RHB7hc7ObEnpizVcJdb6e9nveGlqc+YSdayzXe6ZeHxxkneOaxDWPvIxS
	lGT9PMTxjRu37ax//fnfDympBHr4iR9IEI9fypOIng9s5lfhEFEutNDQZ5DVWvARvj9HuA==
X-Received: by 2002:a17:90b:4b83:b0:3b0:a3eb:759b with SMTP id 98e67ed59e1d1-3b12d3300famr2937645a91.23.1794195738942;
        Sun, 08 Nov 2026 19:42:18 -0800 (PST)
Received: from lenoq.localdomain ([49.43.114.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b103435561sm5174399a91.3.2026.11.08.19.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:42:18 -0800 (PST)
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Priyanshu Singh <singhpriyanshu9838@gmail.com>
Subject: [PATCH] staging: greybus: add missing newline in sysfs_emit
Date: Mon,  9 Nov 2026 03:41:26 +0000
Message-ID: <20261109034126.402391-1-singhpriyanshu9838@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add  newline '\n' to sysfs_emit() format strings to
resolve checkpatch.pl warnings.

Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..5737f2a32f5a 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.53.0

