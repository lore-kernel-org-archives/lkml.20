Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785885;
	b=tFL4y8fPPxs/HwulP9nxOfnpJb+HdsEdlQjl+WiStM9RYOUtZElStGagT7vrtMzNN2g0
	 4DjoxGHSVo3+DpS/ih+MwPpZMMckCuRpsNheLYUHsxgyBUoZhA09V4nGAqHJHbIh4yQll
	 IBSVWbGm2kY59EXUVfnroApYpAaZxrLVYM4lDoyWCxYPDrkxmylpgvyZS01roYmiRXeof
	 P8cHVFsNfvke2psYn2zMk1Abu+YEQcsdGjJ3u4brb4PRc1gvRmdx0x6IYVLna/hc2swq+
	 MbUfLPVYYo8AI45XXhI/s6weTk2iQCI0tEDcNl2skTm6PH1GIk45aQCSa4ZGxAvlJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=GSGmQRmMcvmuTPAQVq01e7diuVSeXlw1FQweBrM5GfI=;
	b=OY29QWyKyNxiKN51X1QIbjd8y5glHIbIdve5fG7ii+f4SHqQ+HTBFJQd7CYUhbb6b6OA
	 LMS8ktimncU32E9DEPaSRxI5hTMOtFx5vJ3HI7BdzW5GD3s6l1Vv9/8ykqr+lZZ0MTDAo
	 9xWhlhKWSQDG9av6XneUa7Q3q6M8Ov/zieaLa4+i04xa/lnCyedFozDzgUvPMRyvim7ON
	 z58sk+saClQg5JwRS5z5C3itjwTXZQbsltl2odr7LJAHx5q8LzGC7jaVG7zwPpaD/Vzvl
	 9HWj5myfFmGG02RDicTQxuMR6F389VJnuxdmaBl456AkepOyYK77WlrSilJhcCWW9Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXBex1nq;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284F9606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 284F9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXBex1nq
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so864449eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785884; x=1794390684; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSGmQRmMcvmuTPAQVq01e7diuVSeXlw1FQweBrM5GfI=;
        b=xXBex1nq68/olOTXus9m2wLHndeYSyZlIqBSKrY+Y17Rq+YGumLX0W3IUz5YAgtkbX
         NkNyIdOaZAKM+uZDo9vmYlV1v0sBADEz0dXlHr/liFARn5u5sgfQFmDB0yLkkkhXFbC+
         pK6Dm6+b/ovV1UZ6oTNUlVvv7EpDdsQWMJJIli9FXF5cWlkCs/J4dqsHApa651taTWwP
         /gfEsNgOclN7BAaiMkXWl39Q5+SCKIWkBWyM1qdyhL55UK89KxW/41r5QgEj1X/U8JYe
         kSpsviA51IigHf4qfQrxxRqKSjt9GH6h8ioL46S44vFWfNoNBsxsaU6nVaUp/2c9JdLQ
         dcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785884; x=1794390684;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GSGmQRmMcvmuTPAQVq01e7diuVSeXlw1FQweBrM5GfI=;
        b=CgRBtdd18m9rXp64TD4LBIRAeg6q8fVn9YVpAY5ON2+G0cCa6Q1uA89vECCprLi3aG
         8fzljGTXSvsEa8e8//3MEKt/oBNT+qSBsvonBAzhssrEvCExQ4byKUWGHG5Cy4k6GZxq
         qICihCa6JuP7D1PUj/Fd/fYXkb8mA9rrtm7gAWOtR/Sr6KOcUiOxOcDTBL2ydgofeqg6
         l8FT5e0H2OlqbGbyg3q9fPkTxZBGXHRow5HgukDLOd9JB0siNbXOE1AZrd2obLRK/IPg
         ZkTMJFarBC2uftMdE4uCxpaqti8gIDrcHRtk9eUk6UaMtbtqPRJ9oImzm7GPI5YcjSeQ
         G6OA==
X-Forwarded-Encrypted: i=1; AKwUvBwlce20x5uTAsY4IXtD6WVT7mWQbJGqIN9R8Oh+cnivbU1CcYdbTalQ+FZifHlsQcumt6JmMDTSku+21jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lJ+7NOl1XTUbv6XN45Xct2h+w+gXcVtAmyQWIobt3E6htHROF
	Ffe6AsTMAGBIQ4J8+ST5sd98OSFbpfo0aL8V8nmv8cvnLHL+KcZXana4gu7ZvXyfItXSQulQ
X-Gm-Gg: AYBFou0ySp/4aUb86dHwBu/5/t72IYAE5FxnQnOm/i963e3kZR+I2KWAutJ1yPwwB0N
	THhziEAgZ42mG1oVW8wsQ7mKiWxMfUU1O1FnsGt+D42VbeI+wJa0BtNC5rEboJukiM2CJ2avivA
	AdQug4JXBGyGBULX9ITV3cg0Tv9IMh30jQVQHhb+pCj1aeXtMMLq7/lAECDjyeRbKC462q4H88Y
	3jCHVxIfLmk28RyOsSQk2WEUC5EFmWeUTuSdgBgkK34gabVn2F6ba0CQKHLcvQ6UNDKNYUm7Rhf
	rjSDNMj+deiVUg0LwWXChdfSPmfwH83Hf6yAzt/jAcir6fXTAJwi+UpC8s4jSViQfqHtiOKprZS
	QpmgmU00cAju20CG5Jg3GqLxFbrOrEUMKOzNBQdfZWMII+7U2KNKi7dbVlyVNTIr0BvovRb6sIU
	GadILD+VugTJ5NxnqE5UPgnWhikeY/4CeafatgY9LhaB63hrkA0FeFEyaFptrOqym6XCqbIKDqv
	l0FH5Gk8mA9LKbAqxXv865VAJ+GQmsMw+RHB17RvqsKFDKxjEjOfD6azCK+ak90EDsk1riKzQZF
	Swwjq+GIsIk473knALltrhsJLn1jQmeWGa5Voay8fDHRego34AKldz0+gsAS9pQXPIk=
X-Received: by 2002:a05:7301:6193:10b0:369:a162:af96 with SMTP id 5a478bee46e88-36a4238974bmr23603741eec.17.1793785884084;
        Wed, 04 Nov 2026 01:51:24 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d3580sm6308351eec.10.2026.11.04.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:51:23 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:51:10 +0800
Subject: [PATCH] nvme: stop asynchronous event work before ANA teardown
Message-ID: <179378587000.73780.18152328009023418065@gmail.com>
To: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me
Cc: jthumshirn@suse.de, mkp@kernel.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

nvme_mpath_stop() cancels ana_work, but the asynchronous event worker
can enqueue ANA processing again while controller teardown is in
progress. An ANA work item can therefore survive the final
controller release and access freed memory.

Cancel async_event_work during controller uninitialization, after the
controller has stopped accepting new events, and cancel ana_work
again before releasing its ANA resources. Draining only ana_work is
not sufficient while the event worker can requeue it.

The race was reproduced with the in-tree NVMe loop target and
scheduling injection. Cancelling ANA work alone left reports; draining
the event source and the ANA work together removed the reported
use-after-free under the same test conditions.

Fixes: 0d0b660f214dc ("nvme: add ANA support")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/nvme/host/core.c      | 9 +++++++++
 drivers/nvme/host/multipath.c | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index a7a4d09644c13..017aae1189de1 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -5182,6 +5182,15 @@ EXPORT_SYMBOL_GPL(nvme_start_ctrl);
 void nvme_uninit_ctrl(struct nvme_ctrl *ctrl)
 {
 	nvme_stop_keep_alive(ctrl);
+
+	/*
+	 * Stop the async event worker before the final put: it processes
+	 * ANA change events by re-queueing ctrl->ana_work, which is
+	 * embedded in ctrl and cancelled in nvme_free_ctrl(); a worker
+	 * running past that point would re-queue it onto freed memory.
+	 */
+	cancel_work_sync(&ctrl->async_event_work);
+
 	nvme_hwmon_exit(ctrl);
 	nvme_fault_inject_fini(&ctrl->fault_inject);
 	dev_pm_qos_hide_latency_tolerance(ctrl->device);
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 9e0a0fd77c56e..44bd1a1ad5940 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -1610,6 +1610,13 @@ int nvme_mpath_init_identify(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
 
 void nvme_mpath_uninit(struct nvme_ctrl *ctrl)
 {
+	/*
+	 * nvme_mpath_stop() already cancelled ana_work, but an ANA async
+	 * event completing after nvme_stop_ctrl() can have re-queued it.
+	 * It is embedded in ctrl, which is freed after uninit.
+	 */
+	cancel_work_sync(&ctrl->ana_work);
+
 	kvfree(ctrl->ana_log_buf);
 	ctrl->ana_log_buf = NULL;
 	ctrl->ana_log_size = 0;
-- 
2.34.1

