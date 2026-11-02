Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600086;
	b=kQl6zpn/riXplMOoz1iWHlZRZV1YBdShHIOs+FPQI1t64euIYstsWXUgioos2f3MTExG
	 t7iP9ou3R+jhbKMo1rgbpulAPoS99TWWObaXdWiGBWFiTm6383Hvrp11AwRbWeURz4D3U
	 td7Kl/6LirlxjfebrOqKqizScaCqTlJofl9XK/K7Fe0uwWi1nZSjg4tQ5YKIudGDRsLIA
	 puzmp7COE9ZOzqIqdfa5s+Ilor2BZA2mXLmoL09fkVc94I4WKViKH0ObEZlMxcG3pdb0+
	 45vnE60LNe10nsPMFata3Sf7OK081WRWe3b1LRC7M9coE7ZEEfO2oU70O+/wR0wI4uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yvkaHxUFeoQ+jmjBqSWlq1SPU8ga5OsgviDcj2uQ4Lk=;
	b=yyMwMpnopNQn8ubIiK8AlWy4326lp15Ytz05YNV3Zs1pgq3amZGd7tGUlCDKQ+L4m1Rs
	 u0dtSNRFvA0rlojgLDVZhNzXnzIxXg32xye7KuOnWQ2mncfL4JAamiij05gAdlDrZ8qbg
	 7hDvD4sC4ymlth9P3NAs6IRkvu2meGpMSDAaJbO/vtbpS+LxZWTwAGTfC3dQI1RrHBV0o
	 tNAw3r765/XUtVR1yaORCEcfRLKkgByp7ciuiXoqkDKPcmZitJ9likYCrJXJ3qZSVi1Kq
	 emoDDn2pN5YASiS+08HFWAhJUwr+nhOKA8kEikm9jC07x9kzFmol3Y5K2DA8ZhaFN5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7gpgW6a;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6287606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6287606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w7gpgW6a
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so4701307c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793600085; x=1794204885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvkaHxUFeoQ+jmjBqSWlq1SPU8ga5OsgviDcj2uQ4Lk=;
        b=w7gpgW6aDjr0IWm8WsjcOalX038yrk9bud8zBeL6aTBgKEqXgdp6YvGWT5LMUlYWvB
         5P74Vm/HyhjRD3zhlL/BlaB0hh4jUzBxXPUXuobvGEqomfed2coQ5rZp4a/QfBlASOcA
         mYL4SY+sz1dUS9vCl6ogkGVwaqlENd+85sc0lgBtVu5FuczK2JoIChurmMQnKaNElOfk
         iJpKX21UzZ9bwAynctwkTjBEpZeQNthSzciIz6kRQA2wMIN0FBrD5lfqG+uj0+iBI54r
         egaEc3tsdUbB7gZp6ABysvAh/AaB16wIw1YoUisPHu6sjhDaemjyMAg8C41y/o+gY6Gs
         3ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600085; x=1794204885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvkaHxUFeoQ+jmjBqSWlq1SPU8ga5OsgviDcj2uQ4Lk=;
        b=TnqiYccWFQ54h/8OrLKo7jZoj0oPXHQPofN7SIDEyF3xT2+SKdk2oBRAThm9VT2iF0
         QdGqOJHDlxAMMFJCfUfeGeHqQdsEWTPSQia5GxB4JIpkqFtU5LvCoBqEKVeXljO4sEJG
         ObZddOkdz1+tu0lso6Y6mhmc5dZVxdy9W8N0oFYGDGQJ9V93ZVZO+6FIhp4GOyRKRaU8
         SlkGsiiuuONef5F/bLMdMSKjsv6bLihOQIuiu/0kQkYxxWAYVqW3j7NOCC9DoANUzYGw
         2sYm70tVC2E9TM/GKBydodc6B+EBlKoqFyHoyNvjVOI/ES+KTLgkUoGmpdwsw6eNQu3w
         8eSg==
X-Forwarded-Encrypted: i=1; AKwUvBxX7LUqMyr7Wkyy5cpUnB/yWeQIwS7O41jQbN6jUgH4Yj5SBiN7KlOinGFxx9IBovVwjJTSv/q/cyLpow0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK42g5dSfoewc78TFSDHxIl7Ujkpa/UnefrD4WByUMqjdAjT+mO
	7GcY4L2vzuRV+aydPzrVRspO2j5n16fwZhliqGCjx+t3yXm1Hwsn9lBv
X-Gm-Gg: AYBFou2uqCSc9gfWeZYii9PAoAcmZI2O1F1wZyRIP468kvKIfXd4vZCXt7M14BDwUuX
	0XWvUgg0kFJpWZ6o31ck371oYIFi6zPFjdPOl/L9slu6ZFq9lkTwNTjZ2aHNZI+e2v9sjNztBTq
	VxVMPgQxMJCcZm2jUDPuVuHp985cxRQETQVNWVHJHpUx0GrHCRwE9bgtoV+uRw8ixv5aIlFqxqY
	lMEbmzhJPVzvlGVZHm77hVrNlSj/pLtsSQRk2ET+dPGZCcEoB9rChm2myahjvJZzk7lSRPWN7LZ
	AK0mc+hazduGYH71NyUiDfl7/jTMHphe8ZwYWaU5TDUxi9pMwIHyhoeyXVgohNSxQ+1gsmXhYYy
	L1L3+N7jHlJLeFS9US4EBynVlZujpuz+ed3c/6FGvZimgWighNI1a9jFapsKfxjGxzlmSYx9co0
	g9aFC+2EQgrWG/DPMC8IO4Jh55W6RyctR99wFt0Fs2hMmzTkaN0SKZENLV1sxFwo52svDqegto2
	XnQHDD/X1Ary0cyTgih3/Bj+qUwCoMf/AohtexWu/QkY30GGsINJlRNbHmb3Q+Bmxw5gTq0eGWR
	EvuW7eQAtqVPAWJ7JyhatUI01g==
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr11878942c88.39.1793600084805;
        Sun, 01 Nov 2026 22:14:44 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm30288043c88.14.2026.11.01.22.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:14:44 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 01:14:36 -0500
Subject: [PATCH 1/2] nvme: remove namespaces in parallel
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
Message-Id: <20261102-bug-nvme-remove-ns-async-v1-1-61780fee111c@gmail.com>
References: <20261102-bug-nvme-remove-ns-async-v1-0-61780fee111c@gmail.com>
In-Reply-To: <20261102-bug-nvme-remove-ns-async-v1-0-61780fee111c@gmail.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>, 
 Nilay Shroff <nilay@linux.ibm.com>, 
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
for all of them before returning.

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
 

-- 
2.43.0

