Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837246;
	b=YM7NluFTG+Jc29ik+v2dNCRZYWdpXgS1FDCrdOgeM2grhoW4ffRQ/8Z2i9MoEGH2aSd+
	 aO/9e1ko12wlZwX7jeIf2Mh12tCt7SxUU7/9aClQHA3ri6jLArIy0dwZVD95e27qC0Cip
	 tXSfHV7VN2sgDuBD39yRbx9Vv6skaa4kxRCvse6ILcFkpdoE7HIaPcll6f4S0wxj8TatE
	 oWIPAKonlKnGBtzA3LJc1J3jWfWeIZRA4g4zKiaNg54o2xq4km5qdbG0vvWytWi/DxzTk
	 UnQmqnLEXrpzKSmBVWdPK3bUXVw7dLJJN98ac687W1nM6auqMvaM8lSM0Rauk7UtqbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XCpW/b5tui0bRd/i8QmB/FeEdN2UMNiMD2TH2Q2ymh4=;
	b=vWn/bJZLbhmvGvI/V+2O7To7Ce0kVVRKJGhlnehp1rwJeY7yW8Id0pKvMiHDsm8oUmLV
	 xjDAGdUiqANQ/urdMh3195cs+YIpiamNF4WnATenYINwEgyBxEehb9d44SGfZzWDVxnH3
	 ZLTJpnjc77E+i1i9S5vC+P0PotuxJISCw5bbNysS7km8W3ofF4o+Qrpf5DQIiX+GXnt33
	 RIFVX8QdqxL5NEL6cDyCoAml6ZvBgVGFTIP+9pSM4ToYX3GaHb7vfaOUaCYcyd6ur9U9h
	 D4tsV6YdIx3MzkTRMitBeK+EdaMOo9TWztr46gu+0Kpdh/o1Z3i4QKTDFvSr5B8cZJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=edera.dev;
	spf=pass smtp.mailfrom=edera.dev;
	dkim=pass header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=Jvz9B1Wr;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3332B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3332B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=edera.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edera.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=Jvz9B1Wr
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5361e313e63so11897541cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1793837245; x=1794442045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XCpW/b5tui0bRd/i8QmB/FeEdN2UMNiMD2TH2Q2ymh4=;
        b=Jvz9B1WrNCd74seYnmXSXblm4Ee36YvUbNHZvsH6qd2A9SvOal2xN7I6Scdy6y9cEJ
         1y7R3wkB6kjPGbUENXcyQBO5QqhrkJPwzAXYv6fHgwgGw1Y9RKSlU4TQhuMU/cgWliVA
         VV0fNo+sghLC6IHgT0di+Kg//tFnOyEb7GxD9Nz2XicUZ3z6P5nMpR2dh+RdLaeNFwGZ
         SneD9LySFYLddhLoeE3O5esX3OykKMblMUKVt8YDujQ5B3czyECqq+SM/12xIgZzUbLB
         eg0sI+2SPtpvQeyyTWJz8iFbnEgAsmFA2gcbX0GB9BYwv8extF6WMBfsJqHm6oA+6svN
         N+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837245; x=1794442045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCpW/b5tui0bRd/i8QmB/FeEdN2UMNiMD2TH2Q2ymh4=;
        b=yqcwGTQrdjDt/zJRflRChWkzo9sv4X9gVRefDtYP+0siMlM6Df+FcUqcQeXVbzCYyg
         J5ZvpzQnqF4+++J14UYp+JjqX24zpolizegw07bk5uweWuqIu2OH9OC/lRzrfKrQTUSK
         ePU5esES74IfkSbH+h3r6tkLUkZ8ZoHDc761AMOP/2hMclTNzLOU1QEv55BRA5g/ywLR
         aeb/Jrx7JIx+munnAx09GvUE/7GPevQwiX9Ah6OVvQOI27fd0pJw/N+yByQHZgs1pUE+
         AZOppFAJ/BueQvCEpgF8msHrTXrJCjouG2Z3JgGPAbrSGcEZ4ElrU67lOrQkQlaNP5+d
         qZ7g==
X-Forwarded-Encrypted: i=1; AKwUvBzi8Ig1ARkEMINlJk/gzKgKfke/xsKOahW8MePicYdVm4gcb6CkmReAtRbHiinvZjH6j26cEoaKywq//Nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U+PmqwaEmNYY8Jdcf2I2A9+qKl186XJSAaGC38y9jpvKjxTtn
	VfYKCB1TowMO1xgd3N91fj7S0kOYmk2nCoZrKqS1g/Uex4NDVArWzZov16Sr7Gkm6SDBoBSNfqm
	6m+Qqh17t9Q==
X-Gm-Gg: AYBFou3BM5ePUWYEKaZ5hbJ54PyPUGvFlwBNqo0SwAx8UXNJJhQcAXElHLxj7HiHmjH
	Kko/rqlYdTQR3NaT2CQ0XwfZPA/0g4+H8nK7zOBlx9gfKLa4gq94SEy1TaUqod73RwrW38qbtOZ
	GFmPU9erNUcivqGKFvWBKEeuwoGlzyXlhQSsgSK9MvG/4LtFQ2eMsTc3yahTYw/+ws8DWLO5Nx3
	Jr82pSed8hcSFh9S7UPrUjlECR4uzJsXkG0Ar4SeDFF0/xbI4Y4tlumsBwuaGMaJrjHxxyt4bZE
	zZB+BLyPNxBXVVHSs2VhXE2t7p5QoEhuoEdKCzvtoT7JY+CIJ2V1qGo2MmVZuJs35c9+g2X8UQ2
	+yBP9wo+ZLHzGSMa30+sjRrWsqTw+gAD5/eVECK0O3xMTSnJjO4aRYgKePXwkg+cVnfxen/XYyS
	K/0cgv0BKhmiPrRN02+k2nkg5FAquBwwmyNGVZX0gq1LkE5EpNXJZj/WgQsL/+tcdLKQI7qeCjV
	57SXPANENp4U9lN08yP4QE4IgJ1z6V7JVV+mk4RR0xoQPWbnL8uA6SmlHLp/ruCXpp2pOrn589T
	Yrt0HU1mX5Xp1E2PwWaPL+bbn2QVTU8k6Blc6nTcDqcQ3Lst1EO37Qrmq7+zCL0lJSBsoekqkDi
	KTC5zyUpU
X-Received: by 2002:a05:622a:1f90:b0:535:80b:9911 with SMTP id d75a77b69052e-542b658d18amr268931571cf.24.1793837244780;
        Wed, 04 Nov 2026 16:07:24 -0800 (PST)
Received: from localhost.localdomain ([2600:4040:2e7a:3100:d9e8:a7bf:8c30:7336])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfdfb5fsm32786346d6.16.2026.11.04.16.07.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:07:24 -0800 (PST)
From: Kavitha Daula <kavi@edera.dev>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Kavitha Daula <kavi@edera.dev>
Subject: [PATCH] xen/grant-table: annotate on-stack work in gnttab_unmap_refs_sync()
Date: Wed,  4 Nov 2026 19:07:16 -0500
Message-ID: <20261105000716.83314-1-kavi@edera.dev>
X-Mailer: git-send-email 2.50.1
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

Both callers of gnttab_unmap_refs_sync(), free_persistent_gnts() and
xen_blkbk_unmap_purged_grants() in blkback, keep their struct
gntab_unmap_queue_data on the stack. gnttab_unmap_refs_async() sets up
the delayed work inside it with INIT_DELAYED_WORK(), so with
CONFIG_DEBUG_OBJECTS_WORK and CONFIG_DEBUG_OBJECTS_TIMERS every
persistent grant teardown warns twice, once for the work and once for
its timer:

  [  104.366085] ODEBUG: object ffffc9004020fad8 is on stack ffffc9004020c000, but NOT annotated.
  [  104.371551] WARNING: CPU: 1 PID: 48 at lib/debugobjects.c:672 lookup_object_or_alloc.part.0+0x12b/0x1f0
  Call Trace:
   <TASK>
   __debug_object_init+0xfe/0x1a0
   debug_object_init+0x38/0x50
   __init_work+0x28/0x30
   gnttab_unmap_refs_async+0x18/0xa0
   gnttab_unmap_refs_sync+0x61/0x90
   free_persistent_gnts+0x179/0x280
   xen_blkbk_free_caches+0x16/0x30
   xen_blkif_disconnect+0xfa/0x2d0
   frontend_changed+0x90/0x680
   xenbus_otherend_changed+0x80/0xb0
   frontend_changed+0x14/0x20
   xenwatch_thread+0x96/0x1a0
   kthread+0x11d/0x250
   ret_from_fork+0x29f/0x2d0
   ret_from_fork_asm+0x1a/0x30
   </TASK>

gnttab_unmap_refs_sync() waits for the unmap to complete before it
returns, so the work never outlives the caller's frame. Initialise it
with INIT_DELAYED_WORK_ONSTACK() when the item is on the stack and
destroy it before returning. The function is exported, so an item that
is not on the stack keeps INIT_DELAYED_WORK().

Fixes: b44166cd46e2 ("xen/grant: introduce func gnttab_unmap_refs_sync()")
Signed-off-by: Kavitha Daula <kavi@edera.dev>
---
 drivers/xen/grant-table.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index f75b5cc..5a85908 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -38,6 +38,7 @@
 #include <linux/sched.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/sched/task_stack.h>
 #include <linux/vmalloc.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
@@ -1360,12 +1361,21 @@ static void unmap_refs_callback(int result,
 int gnttab_unmap_refs_sync(struct gntab_unmap_queue_data *item)
 {
 	struct unmap_refs_callback_data data;
+	bool on_stack = object_is_on_stack(item);
 
 	init_completion(&data.completion);
 	item->data = &data;
 	item->done = &unmap_refs_callback;
-	gnttab_unmap_refs_async(item);
+	/* blkback keeps @item, and so its retry work, on the stack. */
+	if (on_stack)
+		INIT_DELAYED_WORK_ONSTACK(&item->gnttab_work, gnttab_unmap_work);
+	else
+		INIT_DELAYED_WORK(&item->gnttab_work, gnttab_unmap_work);
+	item->age = 0;
+	__gnttab_unmap_refs_async(item);
 	wait_for_completion(&data.completion);
+	if (on_stack)
+		destroy_delayed_work_on_stack(&item->gnttab_work);
 
 	return data.result;
 }
-- 
2.50.1 (Apple Git-155)

