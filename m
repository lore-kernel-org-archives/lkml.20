Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792626015;
	b=c3NlBPLqj/DkufdDGIl/Ov8BBlASNO6wlHCHyRb9dHFTHynG8v2lio3iZjUHebL7BEKX
	 9PSJfdpxHieg/0rjVGbbY1A20jvTZ6DwbiPtRkMvuktvmZ0KijDStRePA5tspH/jckD1J
	 PGCPcb7045K2kiZUpATukuh2gmrw8Cg8Zi/GnUIjuFeBzOigOgxryXiML8G92tqeUSfHY
	 t8+u4m/tJw7rhlQ33oQ3EJOwkl4B5FEmHZgbGcRo3/z1fnDRGwqdaBB/eMpQZ/7XRYgNK
	 yvBaSWz8Pv1LamVKaGgdyTQp9WrdWfWIZVm1fMhfIZfTRSeyd3wNUMi2Zd7KR9TrDKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792626015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1C2y4om8UpFxtjwdgCkugcPQMS+rCYwcCuBwVT+Sbvo=;
	b=lECMjpOBiOS3bsOajtW94zT2+rT2PYZfh76jI+2PCfdxQEZfvYRJUcH04XrPjSwJg/5V
	 pDYEpxFEP97pTISab8wFHgW5/xWhHE/CChM59cTtCBkchml1w8MpyCweZVPzlCKrXENUG
	 +g58uhDcdWXaL7bwOBogm8uRXnzLXkrrj37frgK//IKD9SiVwCh8/q9y8nFSeaU4f6KDt
	 9nqFZj7D0PTniuxQ3lZUv2y7Ss9JkhEf7XjVjmsYs1mkCrC0FdTd3fuLOEwEyM5Ock4zD
	 Ozorgd5ayllxdSg79BgWlEurtzSFWOmy9KQtJmZb5OZvGNt8YMJG1spX2/6Wx57C9Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bwQL+7Nc;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01678606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01678606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bwQL+7Nc
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so257429f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792626013; x=1793230813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1C2y4om8UpFxtjwdgCkugcPQMS+rCYwcCuBwVT+Sbvo=;
        b=bwQL+7NcAwspAL3MettFPUNkaIxkgq70Yl5pKxvRrh2KGKU9BawJfXWKxVTUhgfLm6
         h+XXlw80PWGxiNRlyQvbsJN+NWfDom0lIJHEmQQm91jcHCf1D/EmQ5ULXRgqcIwj1sII
         XUTQbfc0D9WI6s4MOzCTiVebcJ7jIHvR1bRl50fkrKuZAcHHe/6wZYThB2INQI4K+B8f
         1MBPt1lb6y+v05TAMbBUsqgtIXEBoWkqkuvvVhMgfVxyXScqWL3CRWhOcdJiCyTwY12k
         qYCA2b6PIFua308XXu+hFbLJLqbcox2EaKP3hvMZ1F25W3/2Gx/vrNACERYQSJRh4Lcf
         xftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792626013; x=1793230813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C2y4om8UpFxtjwdgCkugcPQMS+rCYwcCuBwVT+Sbvo=;
        b=dFoig/WO1kyeqGsXjGD87/ifZR77x0e4YcK8aaI9nxHosDh/gJSuNdGIyVWLgo2rlm
         A2aDOtsx+Fm0EtIWP3GuaVAsWga31BVwi26FlvK76DfLVJtDFtIqZ2ArTyDLV6Natf9Y
         Zw9kGG9Uh0q6EDsDCvL4AOjlAYXjYEMe3s3ojEBChPhHuPkJOoN1R4z7tZ0aVXbhXcLR
         ++jcGOAlOk0m32X3TZKvBj4aUSseM90LmPlVnYHMl0DA75bpPg/DDe8qHbausjcsk/0O
         /FV1KuA1TXzE2WgzvOz5GZOngsKgNo/YulvYdxJyb3dE6J9w9+nHPTpIfXSYPl5MRaR9
         quUA==
X-Forwarded-Encrypted: i=1; AKwUvByFUT6uAQ9xd2GJ3nDrl06CZgFO3Xj/0AuvP0hKPaUF2yx24YUGgddG6fvvQjBsYYtt8USOo6lRuPLTNDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmaM2USbV7RCA4NXF24UFc+vqp3gcO8myRv9CIa/JZvozeJQ8D
	f7lU9fAm1uRh+7dUBSvxXuGP8Y7vCN9rLjxNxZFc6t+CxWvGS3467Ri1XPEiv9X1
X-Gm-Gg: AYBFou2b9oW19A4rKvcyPoZJsTXWSOaKlhU0PyF/kqP4f5Z5Md313vDby4XlMWZEgVt
	65viXwCxDcqWsUGAocAeirdXgN0eq/B8HTcIPmG9K7rRZa1jSE/v1zQYVCnUZ5WXR/MNdaqLmsQ
	b9wW3QV+ug73IOCaE9oTIectoijmjHbKsaVQFuzw6pj2nn2Xgh8ycg6x7EIUoC8xZFEzy2aSsXz
	XeNefnqXqbCKsToGAbEwvibH077zHRdLLwFcUd2cd984DuhNzcCc398QKmlHkE9nNvFgGplM/yx
	CZtkbsbwe65hE/A18tevbw66gknzUocc9v8l/9mEo1dpSG/BzcwrZiBmQcN01ibAhhvgc/lCxvU
	ejTFobw2ZzHFn/n5oKmA/RAx9rY16Sw6lqzhqoPCeGIKNQNk6Ltfa7TNHTrEF9eOZh4xlpjGwj5
	yUy+kITmQi/Mib6ZSkln3uuChFKNZUOoEdxjyDzzF7wp2SSJCKLUz8ofj50PYHUmNHYpfkNm9os
	DUhsQvup3eMVk5zH+2D41ncN3slZj8xeWj7k6bTJjHu/j2UM3jetJiFf/nAiPD4eMaKJpRTsQt1
	wO5Ptw4=
X-Received: by 2002:a05:6000:2f8a:b0:48d:f160:efad with SMTP id ffacd0b85a97d-48e2d27f5ffmr1860341f8f.30.1792626013218;
        Wed, 21 Oct 2026 16:40:13 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([197.52.179.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e2esm8167370f8f.30.2026.10.21.16.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:40:12 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager_module: add newline to sysfs output
Date: Thu, 22 Oct 2026 02:38:42 +0300
Message-ID: <20261021233845.15295-1-obabitemitope765@gmail.com>
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

sysfs attribute output is expected to end with a newline. The show
functions in this file return values without a trailing newline,
which checkpatch reports as a warning.

Add the missing "\n" to the sysfs_emit() format strings of the
name, vid, pid, intf_id, ip_devices and op_devices attributes.

Compile-tested only.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
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

