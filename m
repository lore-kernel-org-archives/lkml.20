Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140305;
	b=jE9nqKwbDTunVkEQSA8ptm6srgcR8EkO/iu77BiB043XJ5jX3hi54OK32V/HUR4dWooR
	 D6hNFCtiXoafYscjYCIzA5mtBDadQ6HTzI4KNNAcELUqTQcSDwmi1LhI19WUUv4uOjbuk
	 ZkP6sILUVFtH30kWg74DGuXd6pMGd8APQDwLPMCctV7LHXdLeNm4rooTsx+M970eGcrqu
	 hLfMGKT3IJWarUAPZNAhPWGUCUSWvlBjviCIKT59y4LEf2hJrVNn8J98RedhYRyA7lghY
	 mB2p3dfP7mSqQ3yjfO9j/fHXTpBRqRi/UsUqe/qMYy9kn7zuh0Eg3QDz8TTFKn7UuYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=GmMf6/Yc2+e4ZlwlsDHIJgahWCehJGXamjw2nPYFOeI=;
	b=PTzbmwkzRIv9PoKAFWKKbFTzCLzO5E6aQw3XSGgVzMX+Jl+vdJ1NFe7ZEjSy//7yuqQ7
	 Ecz0LnofswuDYENGrKSG9Vcav/3RJHZBFVPxPOYUCOnrqg9oQ/0G2+qurwuxSGXX9nLT0
	 CXA5eAkCSHyDG4/53bEZJm1cvV3mAOFyZWNNg/JqCLMIgW+XsYLgbjdak+qieNafKVEKt
	 FRu5SmYlOsoWl8KbOPB9YrUEqlgi5LTnLgeozGdPfycmOmO0UDt25TJi7WEW7Hslypl85
	 KBSgmru7FmUeo6IkpKioS89ncAXQtfZLw3Q1qutwRSREzLI2Xz0+Lj4or8UEUlXrLEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNm2mCSe;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B76606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B76606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNm2mCSe
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ab3d3c5761so3127437b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140304; x=1793745104; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmMf6/Yc2+e4ZlwlsDHIJgahWCehJGXamjw2nPYFOeI=;
        b=uNm2mCSe4q6EpSWBcSOHH4IobOx4p81JTeStHZkF3/LT1CpiouCaQVYIBXFsbgeHKD
         +QYq9SSrfmOs4/k8RE8/Xfw8EPVfMlQwg4Nu/TTHpyfai8EINAJUe7l03eGfuUUnJIX2
         dvp1r5UTgO808mnBHqgeOo5THMH8XNJA8EhujDx7ZMZ3FQfa/jkC3qdzdbg7TEeZGWQH
         WM8klvlyJXO5Gj3fNTcGMRtx1wHSbf6Xbq8mMic981G5SL3rv5eVK2dJAURLrn5QrPBX
         TRW2Mx1Pz9IZK7m0BrZENTsyZGeQFq+4yQhblQqGrgNcbjz0Ey/qcHsqvOM1I9BULVIf
         e8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140304; x=1793745104;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmMf6/Yc2+e4ZlwlsDHIJgahWCehJGXamjw2nPYFOeI=;
        b=D8ZOmXxQhBdJefbZHLLfZuGX3bKFPlS0v4Wpacs+bOA3JGqNCYNZNyQBH9MyKVYaAC
         dN+oOqFHDZ6VjFvwxUWaU3etr8EGS1sIda5eEVJy244weVtXkyQ5mImqSOud4gu7USUq
         YBistSPaTe5SoBSZWdawnj/T7eqMJjHmob81fgy5ZB5T6hGZQhU8X/RSbUDYqMxnUPKb
         1abkR5CCVQ/aZX5jI/zaFMHPniREZ/HSccRh39r57JHe11Gg//7/QlnJxysz4cvwJ8Uz
         TM61YWoa4aFFZBf0Rt4jsGRSDmfkntld966BWmt7aEgybqpLP3NlYvJPQDQHK9mNeoy0
         xssQ==
X-Forwarded-Encrypted: i=1; AKwUvBylUQUUJSVMlXp/rZInFwjjZTstjJvvq2PkH8uLZpnN+h0IcUJ7TpBhiDM+OuKDyn5m6mZ5dB9ZXU6H0Lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiUKdnnuF7meFdVa22lo5QAOS2/P/V/VMnAOM2TOsFP/XmRmNt
	Q4iXrVXVIXBnsDxDUyLgninToio22+iJrvrIFnO+y64/DLPGtkAoh4sn
X-Gm-Gg: AYBFou0U88rs+/O7l+lC6mtWb0qHsHzUqYEHCH472gbMjTvFRvyUDw0jrePE1ZPYtZT
	qBrv77DfzBQKt7YY8aLPEjWisjhABPVjSip/rnFdix9E3kctbyiMmKXjcjEUxcnvw//54fw6s9w
	S7HBaBpQWQrVAATzhSkStF9X08S5Ia4Fqm+B7PwsVfTYIIXnvBXCzxQv+pSQfWSY30czB9t71aL
	uKhjVTMy3yFwNmwjTYEbZU7eQ0CpLJ/XH9FWZm/27HhMx9D11q9xMXuID4dXIYcAw4FejjxrYK/
	Vz9xSorA0nIrlUngKIDdSLDPwSSqn6lEVQMe0SSyG7EfsGlBEMGUGmkONyT3QlHPbuTseIi9XXM
	RgeT8ewp9mgvUYd7aH+1kEAWVTSWL55CX2ddk1MIJyuH5mzUi99RDxu0Cqh7Z1DtHsV/U9eldya
	qLvBp7ofZRlDvTo4E70kogfN0qAG80OgKvOd1xTAXccEbWmGdjP+gFpPpShpYdPwvSWNxexcvdD
	OF3iuubfvVIqAXUDxvXnM9bIWha5SdGcyxLetbZQds5g/mzo2vJIvRQslQPENHP+6nL7V1aI0rn
	fKFdOu+Y3w==
X-Received: by 2002:a05:690c:e3cc:b0:8b0:a587:9447 with SMTP id 00721157ae682-8b1b5cb50c8mr3976187b3.38.1793140303920;
        Tue, 27 Oct 2026 15:31:43 -0700 (PDT)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.72.116])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e61d044sm19252777b3.39.2026.10.27.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:31:43 -0700 (PDT)
Date: Tue, 27 Oct 2026 18:31:40 -0400
From: Daniel West <daniel.west.dev@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Add newlines to sysfs output
Message-ID: <auEmTBqbAPvMLRcg@daniel-HP-Stream-Laptop-14>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 6376e59cb4d0fa2d57ff7f4fb2ce6cdb8bb1d03a Mon Sep 17 00:00:00 2001
From: Daniel West <daniel.west.dev@gmail.com>
Date: Tue, 27 Oct 2026 15:53:19 -0400
Subject: [PATCH] staging: greybus: Add newlines to sysfs output

Add terminating newlines to the sysfs_emit attributes in the Greybus audio manager per warnings from checkpatch.

WARNING: return sysfs_emit(...) formats should include a terminating newline

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
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
2.51.0

