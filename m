Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625555;
	b=phjQB1KXgFgkXtQYrTkeLwtq1/NhcIa+DzsZgVzlyg80f14vd2Bp37I0HK1jfGXSlF7y
	 /mv1skXxV5IRUsyb6JYqj44zNnbgEjRvJCIvMO9f/cDIorHx+NRoDV1QQMsKHfu+3zBcF
	 5h/7JcF4D/8uNb8+8T79rKRuIWRK7q0GRtboR/L8IscDy1sVuvKLzqLKFCtyZBcCcmVbm
	 j+9v2SwdMJOMdn7rObh4q9Q8xpe9zlVnxKa2S9CxCm2fPM2qfzJmOTL+LMRyZoBTCscP2
	 Kri5Wesb8gR++BWyCjmrNoxLfCMqgpM7ZrgbX5ctq7I27jCfxkCwA0/yp7pDpEwGjgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FZbPC0myHrV6ZtRIopwi7g6RfQPq7qu2TTBmXWHuWPM=;
	b=cTMRPze1EeV8BbY4+dARhj7FK2lZ1nZ32ofdiENs5elYOW4s8yoUOhfDVVYqsFMrOaOg
	 ClcynFZzUj/4C2sIpaPritwhbi4EsmD6XKktxeFhUS7Sa5zCHBZez9gDdf5tOUUH5eZgY
	 GvoD5ITMN9Vx3NVs13IGy+1bCkGiDB2KOnNPyBU1x6/qC6tqR+2NQwtV/2M0M9rR5Mp2t
	 OdJBhlT7NNdd0EgHGDY9NdUPK2YIePwdzTtMaDkxyU05n1XRBwgEM/k+G0P4VGmAKKJcy
	 kMiuzyzfrf5KvJ8KyRU8lUuxk3EupwTa5FkLIxxz/oQEkymp/lAdQMX7oqAvuNKVVNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=VxuknK2q;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F6860A261E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3F6860A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=VxuknK2q
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso1079091c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625554; x=1795230354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZbPC0myHrV6ZtRIopwi7g6RfQPq7qu2TTBmXWHuWPM=;
        b=VxuknK2qZHD/iLUQ+yrKpfke0waHt5yDici/46FhXA+BEkUTF/pbwduPH272gq7PoC
         R1Vu66Fn1xIf+cYFhUKiQzO3KNeRi6i4KNpgLvdBrGnK4CRvXHQ3XmcgZwD/Yy4FWBi/
         4mt3J1NzY+td4u68fpjlKrFvnwmLTaIWqhnrJ3xCXj4NArX0DiwvNcL5KEzomKNd6CE2
         r65/Q1Ag56q1IlDehQpzZILozGsXJnsahtHncAwObvD4djOeyl758KGtVS6BXG7fWHjl
         5Ml5sPqsGu0vNMFK2vBxy2pr8mgTUCNYCycyRvGJ8lTazJ9MxHu3feWGxr4FnJLl1dDi
         UQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625554; x=1795230354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZbPC0myHrV6ZtRIopwi7g6RfQPq7qu2TTBmXWHuWPM=;
        b=Cne96bfTysFqQ/Rp0HODy76h9BLuyhsGPekMiaRsaIgfxMdWIx7AJt94aM4C8U6UwQ
         Fnxvy5KGGzutwZ+cHI4HjXgLd3Ibk+2Y3rvJdn7XBWLD01tgv9drRwxEedZh2mTJgcL/
         /gwTgKdx09wGQlFeETFU840o0Ut01Gni/YFW0IyHun7GDB7HH3NHaJ/LCkFxySDgUe64
         vYYpoGvFyPm5BwQVdCYPQAh2AZcD9lYH7zTzh2+NzDQYDAQPd9kbTDen1QnVSkdFZJzV
         svgJRCTEmse774RJ9t5ywT/qP6DQx32vX16XRj97HlIf9l7ZxyoC5avAsOHXqgqUZgkl
         42dQ==
X-Forwarded-Encrypted: i=1; AL+hErH1HxuNy1ymh4DJ9KWJoOwtSiibJ+XELuqO86uvgoJSyYATbUq2i9V2/lX7ilkw0TeSZEssAy7K8dYYN7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+1e9WKJU85re0HfQJ2Cwwqn8tZ8rUJ1BAYSisvmcuy0o2j4oh
	SIa2snkN8SUJVhSwB2uo/Xge4NIQXzCyqwixg2+MjRnVnA97B7OA21tLWp1p7rBEGjA=
X-Gm-Gg: AYBFou3bpj1jfmvy6Djxo97vYbKgYdbvcq2iVlfclHCr222CRl2ux2oz00varwS6Jwn
	6Th1SDp81oWec+NIK7AX1fRk4FdLxI63r9s8GtrqB5oYSYJszeCyvIEvtzAZoAOXXWrqkqAdk24
	51BxTksgCH5bZjIwpzoGKVw1pWVec7DaiGBha1MI9J6LYGy8jMPmfN/9dCDrjq4fgxesNvl7zRf
	W26pd3d3qiQfN7UDNridz2c0EMifZt3tNARqJ3VpNXi6s6RHD58o8++KY8L5ETWjh2i1VU486D2
	cQqrGWQSuamXMlpQ+U3YyH4g44b8u95xhFuE0HEYAPUaUVKSIJ/2ujotWc78wP4qGcVVU3t5dXB
	Bpfaw5oZQf8xJtQJ2PQS9rb2Qt6kaFaNm/PgGyrh6qgCHZCoarhaPg027+ADYKqpgTLYE+8+0Ai
	r4mtZ7RuyX/OKQlgzMQcwQwGUPmvMk6DniqRffX+cl6/qgcyyrGL3grTNmnZYgxJZEv+TburewB
	F6L4p1th4mWBiDo0c9nnC8rHxOcpjHbcCm5bzIh0E3vJLwvXU93tjQf6FU8hcp2BOPAI3K4SHSI
	zZp57hY0V1eQjZ35ZdGEUU1rW3dsWzeSz2VtFLAXyXutJISjEo93
X-Received: by 2002:a05:701b:418f:20b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b50319d4f5mr4230698c88.40.1794625553607;
        Fri, 13 Nov 2026 19:05:53 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:53 -0800 (PST)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Daniel Wagner <dwagner@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH v7 05/17] nvmet: Send an AEN on CCR completion
Date: Fri, 13 Nov 2026 19:04:19 -0800
Message-ID: <20261114030454.2836543-6-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114030454.2836543-1-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
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

When an impacted controller that is the target of pending CCRs is torn
down, send an AEN to each source controller that issued a CCR against
it. The notification points to the CCR log page that the source
controller can read to check which CCR operation completed.

Split nvmet_add_async_event() into a locked helper so the AEN can be
queued while ctrl->lock is already held.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Daniel Wagner <dwagner@suse.de>
Reviewed-by: Randy Jennings <randyj@purestorage.com>
---
 drivers/nvme/target/admin-cmd.c |  1 +
 drivers/nvme/target/core.c      | 27 ++++++++++++++++++++++++---
 drivers/nvme/target/nvmet.h     |  3 ++-
 include/linux/nvme.h            |  3 +++
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 25c320752d2a..e13ffd17669b 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -649,6 +649,7 @@ static void nvmet_execute_get_log_page_ccr(struct nvmet_req *req)
 	/* Cleanup completed CCRs if requested */
 	if (req->cmd->get_log_page.lsp & 0x1)
 		nvmet_ctrl_cleanup_ccrs(ctrl, false);
+	nvmet_clear_aen_bit(req, NVME_AEN_BIT_CCR_COMPLETE);
 	mutex_unlock(&ctrl->lock);
 
 	log->ne = cpu_to_le16(index);
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 86018e0fb158..12ab522ea5a1 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -205,11 +205,13 @@ static void nvmet_async_event_work(struct work_struct *work)
 	nvmet_async_events_process(ctrl);
 }
 
-void nvmet_add_async_event(struct nvmet_ctrl *ctrl, u8 event_type,
+static void nvmet_add_async_event_locked(struct nvmet_ctrl *ctrl, u8 event_type,
 		u8 event_info, u8 log_page)
 {
 	struct nvmet_async_event *aen;
 
+	lockdep_assert_held(&ctrl->lock);
+
 	aen = kmalloc_obj(*aen);
 	if (!aen)
 		return;
@@ -218,13 +220,19 @@ void nvmet_add_async_event(struct nvmet_ctrl *ctrl, u8 event_type,
 	aen->event_info = event_info;
 	aen->log_page = log_page;
 
-	mutex_lock(&ctrl->lock);
 	list_add_tail(&aen->entry, &ctrl->async_events);
-	mutex_unlock(&ctrl->lock);
 
 	queue_work(nvmet_aen_wq, &ctrl->async_event_work);
 }
 
+void nvmet_add_async_event(struct nvmet_ctrl *ctrl, u8 event_type,
+		u8 event_info, u8 log_page)
+{
+	mutex_lock(&ctrl->lock);
+	nvmet_add_async_event_locked(ctrl, event_type, event_info, log_page);
+	mutex_unlock(&ctrl->lock);
+}
+
 static void nvmet_add_to_changed_ns_log(struct nvmet_ctrl *ctrl, __le32 nsid)
 {
 	u32 i;
@@ -1843,6 +1851,18 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 }
 EXPORT_SYMBOL_GPL(nvmet_alloc_ctrl);
 
+static void nvmet_ctrl_notify_ccr(struct nvmet_ctrl *ctrl)
+{
+	lockdep_assert_held(&ctrl->lock);
+
+	if (nvmet_aen_bit_disabled(ctrl, NVME_AEN_BIT_CCR_COMPLETE))
+		return;
+
+	nvmet_add_async_event_locked(ctrl, NVME_AER_NOTICE,
+				     NVME_AER_NOTICE_CCR_COMPLETED,
+				     NVME_LOG_CCR);
+}
+
 static void nvmet_ctrl_complete_pending_ccr(struct nvmet_ctrl *ctrl)
 {
 	struct nvmet_subsys *subsys = ctrl->subsys;
@@ -1866,6 +1886,7 @@ static void nvmet_ctrl_complete_pending_ccr(struct nvmet_ctrl *ctrl)
 		list_for_each_entry(ccr, &sctrl->ccr_list, entry) {
 			if (ccr->ctrl == ctrl) {
 				ccr->ctrl = NULL;
+				nvmet_ctrl_notify_ccr(sctrl);
 				break;
 			}
 		}
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index 5b8d87454772..2cdfa1165292 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -45,7 +45,8 @@
  * Supported optional AENs:
  */
 #define NVMET_AEN_CFG_OPTIONAL \
-	(NVME_AEN_CFG_NS_ATTR | NVME_AEN_CFG_ANA_CHANGE)
+	(NVME_AEN_CFG_NS_ATTR | NVME_AEN_CFG_ANA_CHANGE | \
+	 NVME_AEN_CFG_CCR_COMPLETE)
 #define NVMET_DISC_AEN_CFG_OPTIONAL \
 	(NVME_AEN_CFG_DISC_CHANGE)
 
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 98961f80b173..96b71aaad630 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -871,12 +871,14 @@ enum {
 	NVME_AER_NOTICE_FW_ACT_STARTING = 0x01,
 	NVME_AER_NOTICE_ANA		= 0x03,
 	NVME_AER_NOTICE_DISC_CHANGED	= 0xf0,
+	NVME_AER_NOTICE_CCR_COMPLETED	= 0xf4,
 };
 
 enum {
 	NVME_AEN_BIT_NS_ATTR		= 8,
 	NVME_AEN_BIT_FW_ACT		= 9,
 	NVME_AEN_BIT_ANA_CHANGE		= 11,
+	NVME_AEN_BIT_CCR_COMPLETE	= 20,
 	NVME_AEN_BIT_DISC_CHANGE	= 31,
 };
 
@@ -884,6 +886,7 @@ enum {
 	NVME_AEN_CFG_NS_ATTR		= 1 << NVME_AEN_BIT_NS_ATTR,
 	NVME_AEN_CFG_FW_ACT		= 1 << NVME_AEN_BIT_FW_ACT,
 	NVME_AEN_CFG_ANA_CHANGE		= 1 << NVME_AEN_BIT_ANA_CHANGE,
+	NVME_AEN_CFG_CCR_COMPLETE	= 1 << NVME_AEN_BIT_CCR_COMPLETE,
 	NVME_AEN_CFG_DISC_CHANGE	= 1 << NVME_AEN_BIT_DISC_CHANGE,
 };
 
-- 
2.56.0

