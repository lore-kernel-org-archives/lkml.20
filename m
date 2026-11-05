Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892369;
	b=gVH8Zche30KKaGRb7ZmeUpW4sXt3Jq4rKkhiyJ+FvaqTUGk3A3r3Gg3jL4YuYQPR3c0u
	 MpqqNexad+kVLzDADT0Vg5MIJ/OMKfM6kV5IxGbPizg5YXdL57/q9NykmwlgEDqt2dt37
	 3TTdcrIXGsfzmWQU+BX4gYEF7ekizonaOLyh4UsfvjDOd5gKfevC/HCNLYuY2S+d6mW4I
	 0hs8W7YcUAmY0+MWxK1mEdYprPkyh9Kx1qmCN22yZUhBPjcy7C3Inpl8KQCXwa1cdLZxT
	 ZQ6CYhbcJRuC5BriCv9RbrSqDL9WmnUxAHJ+2Wh5Tr76Tq8mxT9yBlDK0JiHTLnd3DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=o+noQtRrvCKww67q7qzZKfdfT00Jg550BlEFzFIvgS8=;
	b=W+O4k5IlO/Os+D8C08/Y5bpr+tpYOLN8+VRrz5wrYTjOC8aIR7C2ubkSV9CNx420RDDU
	 EXQA8UdYssyD16+NDo2jLJl6Ykco2fqKKwKShH+WD3XrOv+GPEqQEA6ZCmgsJFiRTaLGQ
	 113IUrbmTKaFHdCrSwyNKNIdKUIjbYdslvaV5u340kxMgUIuMBg+1mERHLUJtukGcdbCG
	 wYPECpSXfsi5OM5mQAXXjfPYxV1eHnvZxnB2FyDbHfoX32f8OPQSlkHQ+hJyNnkUE7LO4
	 +3W/bo/7zdWkXN2jAVUEtcz0urHrgwiuuL2BSRHox/HJZAcqN5UDNlUz9TnfmoYWzfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=p8Y65g9G;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD63E606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD63E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=p8Y65g9G
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91e7af9a67fso14258896d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892368; x=1794497168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+noQtRrvCKww67q7qzZKfdfT00Jg550BlEFzFIvgS8=;
        b=p8Y65g9G3ePwpsRpJ9ItMi12wjo0mf7uZTfKe3r4pZ9WQzZT/C4ffUFA6efeTBifhK
         apzefm0UxESeOfQuHsd0HS9AQjSwyGV+AgWM0j8DNaMWh4YjgST+hBGo3pZihU+0alVk
         uk7KAjsyEcV2tPMAGOxsK4v9AzaewVZijMQSHOMofPC5M1I6pyHwg3IxOvYZ16WI4hfg
         ulXDsTW8uIrDD4gLYiUF9/VdnMZ9JTbHZkxOb1tqSStyjUEGUwd5VQTa0t5v5zLCHolF
         tA9OgB5QejYaF2yXSvdOS9thF2Y20M3ASKchSzVXMdSc9+IoPQzY1wWwUAJtezmMdQho
         ypSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892368; x=1794497168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+noQtRrvCKww67q7qzZKfdfT00Jg550BlEFzFIvgS8=;
        b=u7y8swmzItncSVJ7OAlcat2FjDAwfE76WNz2gAsbR4+2npuw91en8f1rmwaFcWXPvE
         tNY7DpCaH9MZRPA0AvlJ8Ml3PbP2P11QuV7hsiXVnfC92R4V1FAhk32LWqd3GuWU0geX
         KgT1XP4o28W2ACZCTmDdSRFplxcrfyAxTITJX1Oe0BTaF3M/p3hRnkwRTz0vEaevYIRQ
         uOqxuSJdcy38VAk9PGP7KoJBx2lpYuCvWlEnWdi5np3erOl14nplqxjEr0xBgZ8Noz6F
         p0BFXjy70wFxz8vPxzHzhFnGFO6CXEYflKItN067IDt67CGh8aSHOOHdngbM4qD7Dcqd
         HpYg==
X-Forwarded-Encrypted: i=1; AKwUvBz4W4mhJ1Wujo8zf/z1ZvR7+sOforA6FDBJDLvnGlPFEdILH+tfQDMT0QkK2S5AfuzU7l2EqdpsYqCm0N4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+ulsWiTAQAwQb2LpSv18OXwtr/T85G+cyI7xiVvET2Ykuu8j/
	7RWbnbzvHOACDFzIDxcXFxhRSQEZC4fvDlS9kqxabib/ELHjBaZsX9nPbRxlGpPYyLazCsssS1f
	nykTYeJGJXw==
X-Gm-Gg: AYBFou0YgeSzPndqhXnNpvB+mG3JErIOlvGXFdbmk4MVRkRxPrGhIdi+A3sDGqm7oms
	M0iIWDrMyG562GyqjgSjG/OZjXGI4/UI+/wSKgbETVRvGeBof1ueMMUUPQLZeDre7297Lm+TzOG
	UnB9KMg6XblqtNFziRO+uxbMS6rQLKv0oRqA+lhdO0pPy0cxi5obTLsdwtbB50XW50Ry3Ws9APK
	Dmwgf9yp2BRNQ/bfjGLgc9EoMqkoy8+PIM73gkzI1EiB+FxEyE+yqTmgEL82W0UPvDWZAtPe65Z
	2yUSpaZlTsA8tk1NqCCoGuiMxrnvV1jy9aBVfcYlZPmXgeSYwHjRiEEF8YQZuzUO0hu06cpvzjH
	TrQdkuW0GKrMRLkCHk5vcugGb7ht9Fi7sLZjXQu8n0rYQHAzZn/yAPnugfvoNlgSRuGRfUVb685
	NsNy7dxX60VZ1uLYBoWZXFAvL0RuQZKBM7YnGlyTr7TbcszRBGnJYPQslkb5f0FxhL4rvcUeQ52
	6h2UBdJTP9v65YDovm01v4A7T2+nEBCyqToIZcUPnCYYOXQcrS2KIoGY5XLNG8jVidP6T4AW5bR
	6RLCkTAljiF04lXBjnkLcvmEwzIMZJ0C6XC5oAyYf2pwW6r0NDRIn92nDIYQDHvX3myE
X-Received: by 2002:a05:6214:5297:b0:91e:8a0b:c2ca with SMTP id 6a1803df08f44-91e8a0bc5admr72370686d6.58.1793892367804;
        Thu, 05 Nov 2026 07:26:07 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e950f53bfsm25613906d6.7.2026.11.05.07.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:26:07 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:02 +0000
Subject: [PATCH RFC v3 70/90] seccomp: let a listener put no file into a
 cell
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-70-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=1771;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=7eYOaRThtkUA9ByOJCuqUt94IjXJ0cwUOU3B59qhTG4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGv4KofqSrDYzxX7g0fxfHvjCeZyl0RgoeVNlZX90aawfIOm1cwAUhPdL+E+4AylW1MAn0wa3w6
 RjcWWiYb0bA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Seccomp filters are inherited by tasks that are spawned into a cell. That
is intentional. The listener of a filter that uses SECCOMP_RET_USER_NOTIF
stays outside of the cell, with the spawner or with whoever confined the
spawner.

SECCOMP_IOCTL_NOTIF_ADDFD lets the listener install any file that it holds
into the task that is waiting for an answer. But once a task of a cell has
started, no file should cross the boundary. The files that
pidfd_configure() refuses to place, such as a cellfd, a namespace file or
an io_uring of the host, could be installed this way a moment later.

Fail the ioctl with EPERM if the task is in a different cell than the
caller. The listener can still answer the system calls of the task.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/seccomp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 3eecba5ccdef..b8ade37dfcae 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -17,6 +17,7 @@
 
 #include <linux/refcount.h>
 #include <linux/audit.h>
+#include <linux/cell.h>
 #include <linux/compat.h>
 #include <linux/coredump.h>
 #include <linux/kmemleak.h>
@@ -1764,6 +1765,17 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
 		goto out_unlock;
 	}
 
+	/*
+	 * Filters are inherited by what is spawned into a cell, and the
+	 * listener stays behind. No file crosses the boundary of a cell.
+	 */
+	scoped_guard(rcu) {
+		if (!cell_same(current_cred(), __task_cred(knotif->task)))
+			ret = -EPERM;
+	}
+	if (ret)
+		goto out_unlock;
+
 	/*
 	 * We do not want to allow for FD injection to occur before the
 	 * notification has been picked up by a userspace handler, or after

-- 
2.55.0

