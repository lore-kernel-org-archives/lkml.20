Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687289;
	b=grLxenj7WwT7GYPHsZ7su2Dmkc0L5fK2DJolz93EXuq6BoV+DVbOeZUcyLzYx1jI0RfZ
	 d2hY7FS6RaY3wrsXvToLC+yeUBTs+g5iKM/EVYNni71MHI8cgZoiWDmc42xaJ+3jpsQ1d
	 kMXAS+OWHT1/fjvJ16uSqJGOc5eUp+dTIrrzwnwibfYbZWG6TVUWve/F7KgSKHHmzWaki
	 Xv8KvX7yOD0yX3SFyc1WXliUGRs9R347V8ldRoQcdxPlyxRo1r5NarxyJzbR2i+Du/Tb5
	 d/WhTPtMYXFLMPnnp7LUzQwy32lWmMmsy1PVWudDIme4NJkYHKzmNs66cS6uucOx2TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=iFbLP8rEml3d1ZY+239sLeSasqkGxTGMtsL3D+TgbaY=;
	b=wischaUea2vTdxFLoZS/0CUaQjJ+oFEB3sKvVjGswuhSUtO3N3ZQbROKXPqZhDHltZO9
	 Z/8Z68P+mZsurtAy41hktQwBUlL8R7vKKKq8lPW9zaWvqtbB9bVmsj6L5b0bbc1EtoKoE
	 d6GO6hEC5c32g4zRYGCq+JAH8798qCTnTRSx2alaG7i9BnQIqVA6yIGZPpoqupRgAdX33
	 35/OFg23Qr9erRDUcXndON3WzFbGqjUN9Dge6aBID+RAK/Dox+kyc2L2bHuYhetdRd0eA
	 +u89fDkAJUXPfx2DcMlVNb15lk/b+6DtL6xcLyfFVSUslKyTF/cshLB9hTg6I/yynHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPi0gZOw;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C1D606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C1D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPi0gZOw
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a18fc7a38so7198172eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793687288; x=1794292088; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iFbLP8rEml3d1ZY+239sLeSasqkGxTGMtsL3D+TgbaY=;
        b=vPi0gZOwAeTjvFBYIA/YnMPJeKjOqoiR4T7PNBAxhdntPkx2Oz2WDIkbOHvn97gziP
         v5d+tK9Td/WJf2OrFFVCcWXTQTK8f1hOkbCSiSdzHPOqW3pOTMsXFkJNAB4L/BTyyB2g
         XlQ81Fjx3HuFuJlPuVxFo/+6evEVVXpftXR4dU4ZYv/i1+mLnrrvahu19pTcG2mf0/bt
         mlOt+b5D6tfA4arB4zylFcSUBEh/k1vPnSyC8lCTxqJjMvOth8k1DF+DdCO3kL7Kkt0b
         oJ496ksEBiCU/EpSdJxbch9osWnTJxhYKW4+XJDi0ca7+GISVAuxk1VXV9FSqXKfCkkU
         52Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687288; x=1794292088;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iFbLP8rEml3d1ZY+239sLeSasqkGxTGMtsL3D+TgbaY=;
        b=z9MqN7/NOiNVtNHo/RQC1TgojR4lfsKkFY6bKlZLznVOjk0NYhSzqQmgIe0m0FYpfM
         6iPwK3T/meNlqq0R9tQ8OrbHRifGo9cddgcqFt+Zi9DTHXVThIS+pBBS+gfIRvhJA4Tu
         OAD8LkFUmnkZtBDYhtwKilcDEmxO/I+W5Ztw3O6dbBrDDHshx8+vYsbsqrOfvwMcSOvO
         +EAQvckeFIqcjkOokP7kv533Sv1wzSmUnteoNnI+LIfnXKgqJcQSawchmPfVUO6A3eJE
         HypSfdjmzS+DAWpqXb9/pLNnQpCkLRBCRQdOdZhGDYXJKfBUEYELPJymVQtAsiretOPp
         RWLQ==
X-Forwarded-Encrypted: i=1; AKwUvBweDkEBOS3Un8/9CHcfwxRXq/Qm3G+GzExUhK/pezyjmUdwaHXqdMEpM0X+WadBuL2wu4dpsMZJu+Fwq7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wdjORJZtuSIAntnCkkwdZEPNfvK0HvoRpcd/dATBvFfeeclSx
	T6nDOnhBe2dK/fKeQ7Gsirt6x3d7EpYFFKjyMg97pGY9d1oNQwoghIkS
X-Gm-Gg: AYBFou2BorfpVVIQEXbI70va8xQwv4dmMQ/ftLhPyqz8hqv+PVSlKyvmRU2nDOxJZnt
	z00cRhwGiM8oqDY8lLhBzaxhiG6Hu+LlR8AN0nt8Kd0BHrjypYLjBGm1wikGlbuDtQ98C/33itQ
	Whjo0yTf5JzVz05DuvTsarvw3Vjt6VLg6ytf/UoFvpjnIsgkZc6wsFcOhKDqUcaANMynrKR58c7
	dxS9PcxfCkC5a14NLFfnmHqLEWPMZuEA3WgU/n2DjdfOg0amGuHY/FYjEzb+OH4tKfRvLW47hkq
	Wb/RX1xomyeHhrfFeVwR2t0eyOUvZO8mzWBAIHmhm9d8izslzGfhxV5NO0acl3kukAiFTbloqYt
	cfqmy4ZopzYAseRdbjptAwNbsqiMY8EM4ymtFXhHt6GUmaLZX4jOa8U1adAnF//FgLU2xvQ5BkT
	KpOmJfyjuN7HxM2jbSToxqE38K17Mqmgb8aoyiM32YdKnGJI2D3KBiygINPlJGL2bPLD9SdeG4C
	wUXX/tEPFjI0Cwz+MtMfSrSELfMGNbl5HZHFIEwv67b19W1gZ0p+BcUdEq1XimLA6Io3ree0gRj
	0RPiTBYueG30E6N11SYlnn0Mv9DLhhtOe3wkUrjX71drFw==
X-Received: by 2002:a05:693c:42c6:b0:369:d793:328d with SMTP id 5a478bee46e88-36a4242f5cemr20252427eec.31.1793687287991;
        Mon, 02 Nov 2026 22:28:07 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm40577000eec.12.2026.11.02.22.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:28:07 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Tue, 03 Nov 2026 01:28:02 -0500
Subject: [PATCH v2] nvme: remove namespaces in parallel
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
Message-Id: <20261103-bug-nvme-remove-ns-async-v2-1-44e43766e44a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPF+6WoC/42NQQ6CMBBFr0Jm7ZhOF2BceQ/DYiwDTGJb02IjI
 dzdyglcvpf89zfIklQyXJsNkhTNGkMFe2rAzRwmQR0qgzW2JTIWH+8JQ/GCSXwsgiEj5zU4dML
 MJAO33EGdv5KM+jnS977yrHmJaT2eCv3sH9FCaLCl7mJGESJyt8mzPs8ueuj3ff8CijixCMAAA
 AA=
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, Hannes Reinecke <hare@kernel.org>, 
 Ming Lei <tom.leiming@gmail.com>, Nilay Shroff <nilay@linux.ibm.com>, 
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
 Stuart Hayes <stuart.w.hayes@gmail.com>, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

nvme_remove_namespaces() removes the namespaces of a controller one
after another. Each removal waits for RCU grace periods in
del_gendisk() for the namespace and for its multipath head, about
20 ms in all.

Deleting a controller, such as disconnecting from a fabrics target,
thus takes time proportional to its namespace count, over a second for
64 namespaces. Scanning had the same problem until commit 4e893ca81170
("nvme_core: scan namespaces asynchronously") made it add namespaces
in parallel.

Remove the namespaces through an async domain the same way, and wait
for all of them before returning. Each removal still waits about
20 ms, but the waits now overlap: a grace period is system-wide, so
removals that wait at the same time are released by the same grace
periods instead of each needing its own.

Disconnect time from a target on the same host, over tcp to 127.0.0.1
and over nvme-loop, with 4 I/O queues, median of 3 runs on each of two
boots per kernel:

  namespaces  transport  before              after
           8  tcp         170 /  171 ms        85 /   91 ms
          32  tcp         628 /  628 ms       294 /  293 ms
          64  tcp        1201 / 1308 ms       533 /  550 ms
          64  loop       1988 / 1913 ms      1283 / 1200 ms

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Explain why removing the namespaces in parallel saves time
- Drop patch 2 until the elevator switch locking change settles:
  https://lore.kernel.org/r/20261031044141.5569-1-laveeshb@laveeshbansal.com

v1: https://lore.kernel.org/r/20261102-bug-nvme-remove-ns-async-v1-0-61780fee111c@gmail.com
---
 drivers/nvme/host/core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index a7a4d09644c13..18948c2ba218d 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4716,6 +4716,11 @@ static void nvme_scan_work(struct work_struct *work)
 #endif
 }
 
+static void nvme_ns_remove_async(void *data, async_cookie_t cookie)
+{
+	nvme_ns_remove(data);
+}
+
 /*
  * This function iterates the namespace list unlocked to allow recovery from
  * controller failure. It is up to the caller to ensure the namespace list is
@@ -4725,6 +4730,7 @@ void nvme_remove_namespaces(struct nvme_ctrl *ctrl)
 {
 	struct nvme_ns *ns, *next;
 	LIST_HEAD(ns_list);
+	ASYNC_DOMAIN(domain);
 
 	/*
 	 * make sure to requeue I/O to all namespaces as these
@@ -4759,8 +4765,13 @@ void nvme_remove_namespaces(struct nvme_ctrl *ctrl)
 	mutex_unlock(&ctrl->namespaces_lock);
 	synchronize_srcu(&ctrl->srcu);
 
+	/*
+	 * Remove the namespaces in parallel, as each removal waits for several
+	 * RCU grace periods.
+	 */
 	list_for_each_entry_safe(ns, next, &ns_list, list)
-		nvme_ns_remove(ns);
+		async_schedule_domain(nvme_ns_remove_async, ns, &domain);
+	async_synchronize_full_domain(&domain);
 }
 EXPORT_SYMBOL_GPL(nvme_remove_namespaces);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-bug-nvme-remove-ns-async-ceaaa1eda6a7

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

