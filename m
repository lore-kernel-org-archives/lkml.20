Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625557;
	b=mL9rC5MIKjEeSZLogTOthfcukLJwC19UAKkCDcYmRH5kUUW56jl9gSPkqrr16jXuEGV/
	 t5+TnJKnrBPgo4rPSmVOLmt8WmTL02wMR1Z9Q4tzWRTkTlR5s9qTUgLL4AWpQYwg9MBKC
	 prjkBbV7anS9BsEUSsru8DxEPkIINNKUdRDlr67NAaUY4T4Dc3alMbCetW4yJ/jDXACRw
	 5VwMUhc6BED3+knvdkK/Dun3qexpIH2oVrGYZOeueKBURr4QvTZnEpdd2CHe73b6yUwBP
	 Kwm/thxMvAZbJMtopH8+Or/nJ+SHMaouFJwM3tkLf+me/LWJkJAAmxwW3e3kcihDI6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c5aNvHozYviAhxVs1kBeJuiLRQl1AQb1/qe7EnXaxK4=;
	b=EECOxoqP+oZSyRF0R0hTIjXZ9h/o0G2Yl6anOsfBNWHEsV4sXuN6ed6bPiQu0duDkmNI
	 ET+lJ2ThkYov2MuzuWu0CXatrwx1FMvdZ4ai7R0WPpEuJLTJ/Vn9ano/ZshbW2JLXoQ5b
	 uXqtkfmaAz4mIQqIBxBpKlmn0U1xUZxuKw9b89DvEpyd4lf3VbvtmwLMZXem1XTherNSk
	 4aCCx6uOeMMsQCtrCM3Al8mpY/IuXQbDMUpFqGiVq4EYGKeUiTm2cSSF0zTD2YT5f22mB
	 cNBXD3/Jj3zRCgu0QXKxcd8cKFQFyIjU2B1PIG1fxBgMImVQWGzaYrMSAYfyzoE6McA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eBzwtWRH;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B805606A33D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B805606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eBzwtWRH
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so1828125c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625556; x=1795230356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5aNvHozYviAhxVs1kBeJuiLRQl1AQb1/qe7EnXaxK4=;
        b=eBzwtWRHJd9+LatnJ7X/Hj3VCv2GywVpIjnP5vXohBfq/G72n5tDwCV5V0EavhYPCn
         F9DcnW0flmi7R080S1KJamXYFHWYuIESGUgU5S/PmAGjUBmLMLY7XD/96QPQOzsGok0J
         4zXQSKIfX8MrdMmteLsGXKp8ss48HgumRvEMhVnvIHNfFJ+2flak5N/oTku7igISLoBF
         J36yjmS5VbjljjsZ8YCre14ojzoER+91rUwJJgKFcJ6EserpzVQWcqhIL+wy1fMIgJNe
         bgI1l3bSTqrpE0XsVFBirVHl91fOoOMagMHedXhY1LnWxcOKYTT22TOzG+egw6lxt7t8
         8bPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625556; x=1795230356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5aNvHozYviAhxVs1kBeJuiLRQl1AQb1/qe7EnXaxK4=;
        b=1JZB7fuV67hDjQku/I5ZDGF5Y32hgZS0ZyO855M+3p5R2+9vVfqpJ3kxHKQEzL6nlq
         ZmOmfdsK3mNKWp6zGxklJLSVASOItwFc5N8hZbjiEikxDNlCkmrlxKkAwNn6/KfIsBRj
         TQEMTz50bRO+nNVBWFPz4wpmgTn8UEjlflJq8OHmn6FniEDGNHVn91ajhKEvdTtX4Ojo
         rGPbdeFtaZFjM890bLZNtN0D+lV7nlKu2ov9ctmNuu4Re4ZrXYTPb5IKX3SQ+qwBzkP2
         tD5S7FY8dS6/nV6x+M3p5sVjje24Refac6ZFqDZ3z8TGSQRopjseIXAzxrMzr4PeIK2Q
         UZwA==
X-Forwarded-Encrypted: i=1; AL+hErHI4z966Sq9UIk1FPDlM11alucw4cfBzCwZTb/J5mMOdLadcej67b5vyNHZcp6Sa+SrZZzTfJyKqxZTUPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K/16OK3mjCMXs/PqUJknJ5uK8jru7x5WvltpWR/cRATsrVtmI
	6zgvNek+7nCNtv1j10/GBYGYpRUllRxPvTgYPURmklzv6TysVec19iN4tBiUmIZKmp9mYen7rnm
	LEGjs
X-Gm-Gg: AYBFou0mch/GcLCioVEPoClk4AC98Qmk/NeOekpgbJT81d5cIRHQGGqrneIlAqeMxjk
	1ChcpimQBI6hhd22hzdav0IeeHXjifRKjBYM0h35TaZbJQY4PrHdGxAjjnfjTIWX4j5joI/yV3L
	Kg/PSZzLRCoHekJEDk/JEwZl/jTa3qN9o4MAAC0RVk4l5OKAjVN5IU5WegBbSWViyoYzleS13SV
	eOZUpHaXjEIzE7OgWLFN38v0T82WmvGdVVp2mUAESfjuxPlhzlXERNSjsqHlugEHh20Db6s5N+O
	laGUr/Y2GiagHJp9oIJJ9Atjq9XzSbt103ilXbSLYBC+1KvjG0NPeIMdaGmVXyyU4Htut4Zt36p
	BO6PFB1bRkMvOcgDo0ec9To5qFzOJG6dAIcHAdVCeAC46bK6sJapyh2EWhdY2lEHPGSgORJTIbY
	yRH/kxJrKKi4n237ETDwv184SoCqeI/XyDEoE6YKJeEaKQeQ+K7FCSZF8Kjfa9MzNaLV41hfrv/
	4cxhdzccy28WTB+LoPsXlNhO/raPMG7URLrg2CeL9fY7RpG0jFpDKipwXla9UdqCn2TzFvb1+An
	8/Tdjk7Yu5yB8XyVJh/Crg9HYHB2G70rDvNaKi0WNja3q8GcsCo2
X-Received: by 2002:a05:7022:f116:b0:1b3:ad88:b9c5 with SMTP id a92af1059eb24-1b503100521mr3871981c88.24.1794625556198;
        Fri, 13 Nov 2026 19:05:56 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:55 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 07/17] nvme: Introduce FENCING and FENCED controller states
Date: Fri, 13 Nov 2026 19:04:21 -0800
Message-ID: <20261114030454.2836543-8-mkhalfella@purestorage.com>
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

Introduce two new controller states, FENCING and FENCED, and the state
machine transitions needed to support them. Transports will move a LIVE
controller into these states when an error is encountered; this patch
only adds the states themselves.

FENCING is entered from LIVE. While in FENCING the queues remain alive
but new requests are not allowed to be sent, and the controller cannot
be reset, since a reset cancels inflight IOs that must be held until
either CCR succeeds or time-based recovery completes. A new request
issued to a controller in FENCING or FENCED is failed with a host path
error, so a multipath request is retried on another path.

FENCED is a short-lived state entered from FENCING once fencing is
over. It is the only state from which RESETTING is reachable, so a
manual reset cannot take effect while the controller is in FENCING.

Deletion is allowed from both states. Callers of nvme_delete_ctrl()
assume deleting a live controller cannot fail, and they cannot wait for
the fence either. RDMA device removal and the TCP/RDMA module exit
paths hold the transport's controller list mutex, which ->free_ctrl
needs when the fence drops the last reference on another controller.
Instead the transport's ->stop_ctrl flushes the fencing works, so the
delete path waits the fence out without holding any lock.

A controller deleted while fencing does not keep the fence's hold on
its inflight requests. Once the state leaves FENCING they complete as
in any other delete and may be retried on another path before the
fence would have ended. This is a known limitation, to be addressed
separately.

Update nvme_available_path() to treat a controller in FENCING/FENCED
as an available path, both states are non-terminal, add the state
names to the sysfs state attribute and document them in
Documentation/ABI/stable/sysfs-nvme.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 Documentation/ABI/stable/sysfs-nvme |  5 +++--
 drivers/nvme/host/core.c            | 29 +++++++++++++++++++++++++++--
 drivers/nvme/host/multipath.c       |  2 ++
 drivers/nvme/host/nvme.h            |  4 ++++
 drivers/nvme/host/sysfs.c           |  2 ++
 5 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
index e3395e5730bb..df883d644fb4 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -156,8 +156,9 @@ KernelVersion:	4.11
 Contact:	Sagi Grimberg <sagi@grimberg.me>
 Description:
 		Shows the current state of the controller. Possible values:
-		"new", "live", "resetting", "connecting", "deleting",
-		"deleting (no IO)", "dead".
+		"new", "live", "fencing", "fenced", "resetting", "connecting",
+		"deleting", "deleting (no IO)", "dead". "fencing" and "fenced"
+		were added in 7.5.
 
 What:		/sys/class/nvme/nvmeX/numa_node
 Date:		November 2018
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 38b27d8db011..4be3ce2e72a7 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -596,10 +596,29 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
 			break;
 		}
 		break;
+	case NVME_CTRL_FENCING:
+		switch (old_state) {
+		case NVME_CTRL_LIVE:
+			changed = true;
+			fallthrough;
+		default:
+			break;
+		}
+		break;
+	case NVME_CTRL_FENCED:
+		switch (old_state) {
+		case NVME_CTRL_FENCING:
+			changed = true;
+			fallthrough;
+		default:
+			break;
+		}
+		break;
 	case NVME_CTRL_RESETTING:
 		switch (old_state) {
 		case NVME_CTRL_NEW:
 		case NVME_CTRL_LIVE:
+		case NVME_CTRL_FENCED:
 			changed = true;
 			atomic_long_inc(&ctrl->nr_reset);
 			fallthrough;
@@ -622,6 +641,8 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
 		case NVME_CTRL_LIVE:
 		case NVME_CTRL_RESETTING:
 		case NVME_CTRL_CONNECTING:
+		case NVME_CTRL_FENCING:
+		case NVME_CTRL_FENCED:
 			changed = true;
 			fallthrough;
 		default:
@@ -786,6 +807,8 @@ blk_status_t nvme_fail_nonready_command(struct nvme_ctrl *ctrl,
 
 	if (state != NVME_CTRL_DELETING_NOIO &&
 	    state != NVME_CTRL_DELETING &&
+	    state != NVME_CTRL_FENCING &&
+	    state != NVME_CTRL_FENCED &&
 	    state != NVME_CTRL_DEAD &&
 	    !test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ctrl->flags) &&
 	    !blk_noretry_request(rq) && !(rq->cmd_flags & REQ_NVME_MPATH))
@@ -828,10 +851,12 @@ bool __nvme_check_ready(struct nvme_ctrl *ctrl, struct request *rq,
 			     req->cmd->fabrics.fctype == nvme_fabrics_type_auth_receive))
 				return true;
 			break;
-		default:
-			break;
+		case NVME_CTRL_FENCING:
+		case NVME_CTRL_FENCED:
 		case NVME_CTRL_DEAD:
 			return false;
+		default:
+			break;
 		}
 	}
 
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index ae8059366b57..a987e2413acb 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -538,6 +538,8 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 				continue;
 			return true;
 		case NVME_CTRL_RESETTING:
+		case NVME_CTRL_FENCING:
+		case NVME_CTRL_FENCED:
 			return true;
 		case NVME_CTRL_CONNECTING:
 			if (!fail_on_ctrl_loss)
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 0c87072c5265..cb9fca419935 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -320,6 +320,8 @@ static inline u16 nvme_req_qid(struct request *req)
 enum nvme_ctrl_state {
 	NVME_CTRL_NEW,
 	NVME_CTRL_LIVE,
+	NVME_CTRL_FENCING,
+	NVME_CTRL_FENCED,
 	NVME_CTRL_RESETTING,
 	NVME_CTRL_CONNECTING,
 	NVME_CTRL_DELETING,
@@ -875,6 +877,8 @@ static inline bool nvme_state_terminal(struct nvme_ctrl *ctrl)
 	switch (nvme_ctrl_state(ctrl)) {
 	case NVME_CTRL_NEW:
 	case NVME_CTRL_LIVE:
+	case NVME_CTRL_FENCING:
+	case NVME_CTRL_FENCED:
 	case NVME_CTRL_RESETTING:
 	case NVME_CTRL_CONNECTING:
 		return false;
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 5b549a0513c6..ec4ca1669253 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -546,6 +546,8 @@ static ssize_t nvme_sysfs_show_state(struct device *dev,
 	static const char *const state_name[] = {
 		[NVME_CTRL_NEW]		= "new",
 		[NVME_CTRL_LIVE]	= "live",
+		[NVME_CTRL_FENCING]	= "fencing",
+		[NVME_CTRL_FENCED]	= "fenced",
 		[NVME_CTRL_RESETTING]	= "resetting",
 		[NVME_CTRL_CONNECTING]	= "connecting",
 		[NVME_CTRL_DELETING]	= "deleting",
-- 
2.56.0

