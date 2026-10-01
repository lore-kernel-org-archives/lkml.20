Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA8D516154
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858617; cv=none; b=A0WK/3kEz3rY/W1rHnA1cEt7HMmw08z9wxXnwoktdNb+39Jh6oNZqY3xaCz26yPxL0sCXP/CMJpp2NeTyDIosbEJLImfwV3KMj+AGTexEogVkxkUILItwWK8ezCidaSFt8iV1ZDHabc2KCmAeSqmconLCQ/7VADnWt6JgQozrlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858617; c=relaxed/simple;
	bh=hgzVgbEXYAzSMccatg/97jlA6K+7oGBVssxvgLXE/68=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type; b=mI5SOwQGZLBvmNGwcOJHmmZckh0spqkARdyzE5zCkBgOS+CCJkogPM+lmCCSw8BxGtczp2klEWgvznsnuEmsukMIUSR5ngBW0Yx69riETvrCc2eifz7+Gu0KMhmBRaJsYJjVO6pfgThcNlVN2+VrxVTw9/Ta2sW76qsWMf9pUjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmWFvNkz; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmWFvNkz"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so31426215ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790858615; x=1791463415; darn=vger.kernel.org;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tvu2hRA4oyTYZwQUazHXBts8ApL9ik7R8u4heAAFKmg=;
        b=OmWFvNkzBKMGmS4GYQyl0IFFUIKcLc54hkP6heoBdEs3MHkVrJJDDfy6cLhF4tg0fK
         5540hztN5ObLWwQAAgbpsW09GwCBz9q8Gn8E+pqMsGYX9IY/WH9Otx6nnCEIqhGscL4q
         05yxdj+I/fVyjNq866fhU/9hC+z4zhmVYbgsgVfBSQEPkcvBXbjPoYpbWoGEv+sg0/we
         R7KtDr0c5OFXMmbOkdEJkb8dC4ebLAhCubUOLb/xhoIwpd5WpxtqJhCv/CEQWGox4Ekz
         pkbz51dhsdKlpvAeQS8CqPWubr7pGThaDa59KG7BSmwlG0mEvq5Digzu39R/vwwno3JM
         WYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858615; x=1791463415;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tvu2hRA4oyTYZwQUazHXBts8ApL9ik7R8u4heAAFKmg=;
        b=XOyha+2Oo4A8m2bUAct8aARFfiYA+2IlcTvIGQoHh6fCYs+rAJTv3bWoGUYoffSvsd
         972bOK+egodOtdU+k3TGhfXhz6HQlFNMC1l0hDbRg9h/Mnqqg3Ao9V5VwGka6/oGK/vR
         tXrApy77QMEYpMJQ1HMkumurtuIUIhcNeB8dd6OHMeZfW2gQfCfBTsUT6XYKLMr2Qnd2
         TqZxzMSWsgCu/FQZRIC2zaWU6CFjBlLu8T9Bd9GkBVxWk39izk3k6BF7iv/xZfulLLzQ
         cJgA3zFRByLNFX9DAG5pYtcVM4WkKIw0M+JZi1LR22QvKbsjdAGQPoblIqYYxJJI8Chb
         PVmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhPLB/krYDRnxJ6VfiLsamksj+tcelcfYfc8q+yLgasjvur3K54kxsza6cbdxBSPyuLrOOox1c9z9s2CU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIE6ziE2oJNP0vNGdGT0vxZ+kn5GmA/2H5QDdSKVIyP7RooBYR/
	2W8wxXw0ysa4JmsOdmkWOEshniyOptp2M9lE2cuOjJw2K7DHgYNe0fQ2
X-Gm-Gg: AYBFou2RswdisHrn3slK6xHmxL1pmZIpMhBxhjJG7a/Ue2XBoS8jTpMRNkktoLzYiF4
	N46I0ugyvr3wgnCT617lbbPuarGjCsFpGM5oGYCRcgNjOeBwQqjqKTtTTDbmqhUULJFN0fL9GFQ
	Gq+GddExVUwh6HDlQDaBEBz+lBmYW24JyyhhVRyV0w00I67E4GMO01EzfLiKSHDx26CeoBJYLka
	tK9ux417ctCoR5VWAU/a08zss8g0GSi2NxQ97ohodS1E4KeVwqVEtLzUxs65RV8VGJo3c6YSpXM
	7LAMMY02Cc/Lzl5124G7HHBiG5YAsn3U3fN/16LaiaAnckRFVCkvebun8SQDSxGXiKAfmvR2bLy
	d3xz2f1t0rF44xxP1/oHurE/3YWGY4lswbIVMR1PGk26C+P14SmKwa6UYEAgbe6TenL3KVLOlb4
	M8wVqodGC0+K3lVcnivkjyGkApg4BiMOUk07ejV6ItqZkvREhtn2E/ISbdFgWKlgcbXrUgfcgxQ
	vsqRA==
X-Received: by 2002:a17:902:c411:b0:2dd:ad74:6d16 with SMTP id d9443c01a7336-2e2e4a2c6c0mr33995985ad.28.1790858615041;
        Thu, 01 Oct 2026 05:43:35 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40e0:105d:d3e7:fb70:9cf0:37:32ba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30099923dsm9899375ad.26.2026.10.01.05.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:43:28 -0700 (PDT)
Message-ID: <6abe5570.5b65f4c6.2632fe.6f95@mx.google.com>
Date: Thu, 01 Oct 2026 05:43:28 -0700 (PDT)
From: Ronit Gupta <ronitgupta138@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: audio_manager_module: Add missing newlines to sysfs_emit() formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
User-Agent: git-send-email/hermes-agent

According to Documentation/filesystems/sysfs.rst, sysfs attribute values
should terminate with a single newline character.

Add missing trailing '\n' characters to the format strings of all
sysfs_emit() calls in gb_audio_module_*_show() attribute callbacks.

Signed-off-by: Ronit Gupta <ronitgupta138@gmail.com>
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
2.43.0

