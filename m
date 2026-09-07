Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41257411F9E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765373; cv=none; b=MrrCQlFrgdyZpbsgrMu1ULoa6aOQg61TBFLz6eAQ6rm1cA4feuH0uP9kpMd4BD8VijlEe0hSBO3R/in2lOIv6qqpaINlw5me9znWwZXC1qx6sn3JuEEKaFrL6yyXG8my11v6W+yw7S4bx2NfPvGGFetYINC1w4KnQZNvL8WQOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765373; c=relaxed/simple;
	bh=3rf8WCArGfJnJ5YqNTKjZyWh5tuPcbn/lII/ch9ILbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DNy4bQ5sOqTbxUosozCbAfpuJmPrJ1+LJcvB7x3B6F5CgQXpDFRR59Yuhb8aCXCFAqWTw5jbgjQ1ddSWpqkbv14ZtJP2t+mwKFSUxXBmuxIdkT+ziFFyDDeHg/GQBRuUfAJH8EZokR4OqVWX2PEffcubnrKZPCTrLYSxKGqpBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJLM6lgX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJLM6lgX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484374f54d0so1846958f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788765366; x=1789370166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tGILImqdihdoegOmNJ3w6PKKrtUiUtdllHhJypF5GI=;
        b=PJLM6lgXe9wL8rq2pc8DTOJX6V/kdSbB8x4egwj9tZW8gl/ONtWezTthbTy5i80Mn9
         gHtExd7rh2DpRZBQ96weWDxLeI1im8p+h7MOAF5dctbuk6C6Ykb3QWX9GTq7pBL8AE+C
         UArvKGtf/kILDF5uKKPchjj5X/Jr/a6j+3ndFp07U42n7R1H4repwoFgPVVzpShaVRif
         WNjcPiAjsTbovRA2YJRJqNnSrvUKdOMTRMHAs++XbN3Tiyz730JpHH63Yxw5SumXHQnK
         QrG7u5BI/4I3CQJJHqQPOK/j2WnVKmpwpBqP36WqRAp0mJwjlK60P3C/IrnhBFx7GHTB
         Tzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765366; x=1789370166;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1tGILImqdihdoegOmNJ3w6PKKrtUiUtdllHhJypF5GI=;
        b=shtz+ixPMVrONA/21LjY/tkp9cuy6fUjqLV66F+UyUKE2YEZfxA35dJMiCD+0d8V7H
         +Db8D3reka1tPiP0hqcxp+8WXN4r5IhSQ+oDekt8ejIR2XHFu5ckKO1Wd/WPYkLPjTmm
         BJVxVY9waV6p/Frg1O3ugiekQPS+I/Mclboe90Ny1+oB/fJn8V7dIAxqZ0Sglbj650bp
         apIYib3Uqc98gQlgsMBcpMqZnMT/61HGudkKQWSdd3G+U1Ai2m3mdsc56jhE6rmPe89g
         tnwpRSnK4U7DWVDEMV6sIUZoMMF2rMiCFAUATmw7F0CiDuqgJ8BQ5LtEXUCnK7jN26Ex
         d3rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfme+fvw6yEHQFafcQ746EDdxh3HuLSxPp5wkUviE0wM0FJvHyFabDeNdOf+2gtgR7MK+op1U5d9DnaKs=@vger.kernel.org
X-Gm-Message-State: AFuF++lr2LaUsc4JCsGe4JeOJOYSltD4me9U7rGRHLLdO7Z/d3HqGNmd
	L/DPjjxtR51qIXlJvlbkaT71tiHNKhnfG8PBoRN8JqZo0Gzsg4p9kuH7
X-Gm-Gg: AYBFou296YEd9Dg6bq6MkGvhr1QHnMLuWzKFlpo8d4OdWfSKWw9ibnev7LmZak9BlJb
	3T5LQ769UVN59H/Ra/nnVsT/YJ+fksic8cEKIGxthGNnwXtI/D4LIgRuSF0GdQ0dF4Do4j+qWLh
	n/BvqhXXNGFkGnFQbLXF+ebix3czLOWXJRnBU+xmsyXMjCIAa/+bfNS1If6pwjITlXqHDc/OI9r
	msESN/V3ib5stnxWytNyi907p6cLWS4h/BC0K7lwv2QFrkOyF3HIhgjxHqKGUoIECR9F6y218aA
	n08eRsgAr56VA7f3GOAHxYdWeu4KrkmkDcMmd4rnrbfutKrubV9qA07T8+ynUtckfXjUaSCFYL9
	OEgd+d57ihcbiGU9ImzXodse7jsPhunR+G/LorHwDUavrCVvY0172fhjea/WWLMaYXoO5VCXvOB
	+ekD13WfYo0B7a067taXYBpoAVAKSD/FRprcgdOEqyTwJ9Uy2LhNS1O7LWckRAIAM+qt+znGUf7
	qsOz4M2HCXlBSk7dtAiwWD+iuG+S6dPiUiU4aY=
X-Received: by 2002:a5d:59c9:0:b0:485:8420:26d with SMTP id ffacd0b85a97d-48587057223mr41470378f8f.8.1788765365778;
        Mon, 07 Sep 2026 00:16:05 -0700 (PDT)
Received: from nixos.tail6917ec.ts.net ([95.15.165.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm25175989f8f.3.2026.09.07.00.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:16:05 -0700 (PDT)
From: tuxdevv <denizgozen61@gmail.com>
To: linux-staging@lists.linux.dev
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Deniz=20G=C3=B6zen?= <denizgozen61@gmail.com>
Subject: [PATCH] staging: greybus: fix missing newline in sysfs_emit() format strings
Date: Mon,  7 Sep 2026 10:15:25 +0300
Message-ID: <20260907071525.43505-1-denizgozen61@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Deniz Gözen <denizgozen61@gmail.com>

The show functions for the audio module's name, vid, pid, intf_id,
ip_devices and op_devices sysfs attributes pass format strings to
sysfs_emit() without a trailing newline. Per sysfs conventions each
attribute should return content terminated by '\n', and checkpatch.pl
flags all six calls as missing the terminator.

Add the missing '\n' to each format string.

Signed-off-by: Deniz Gözen <denizgozen61@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2..5737f2a32 100644
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
2.55.0

