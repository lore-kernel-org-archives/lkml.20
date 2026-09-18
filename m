Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B3051DAF6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755430; cv=none; b=Dy6ysucnQcIQlXC3aN3eMXTbaMGbr8l0NbQbSR7lbWMeg4wYpCO485I8vp5kNtW5e6WPkFzaCj4Ijx0Hd2a3hGGLM8/D2OWURIolXSEvybF1U467AvC7w2cugJFQmHwN8XpOt6qZD1eXfZHtm50v3mWG8EDs22B9hvevkMN0gGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755430; c=relaxed/simple;
	bh=AcE9zrysBOb+NlUMMSohIv2aatVf8yMIkkVyal8cEMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILezj8fUYn78tSnzqJYwCu91XQyBWPXD2ud1a/J+yV5OL/giOn6vby5m7iJhiYhc91kiwZID4oBfonxTjQIELmH4R1XXTVpIzjX1D8bJmtOt0pzExFvGoX4AtA8RLgnsA+tGDZXA7dfemkTtXyPHFw2Q6yaC07dITUtMJULW4nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WXsA8Qbq; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WXsA8Qbq"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so913344a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755428; x=1790360228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHWLxN1z9UCBkM9IJvLJg4YXBPTZaz9qxxb7LJ22R7c=;
        b=WXsA8QbqFVvas52YEURIudSqRMSYScJbKLCvprBpiOF7lMpwv6vQeetoWoF/2/uYOf
         Fex/7aopHkgPh8sXCBh3ozaHJdP4QDdT/XHl+otU/mlecKrysPUjtkmGYxbYYhGHcLOp
         kof1CnhOU37mC9510KzYBIoM+u3BC4qML1xEpThAOPaGogMf64V2lN2jER/lYqcfJKGI
         ZBHgaZCPWKKP0dP+gjvJq0Mha6ONaxKmoZn6oTBRU335DG9Ukvmt8updhh/PDQOu1+1a
         ow4iT+koj9Qq2rsJzPZAI67Io66N67YowDnIvosTN9rJIHdLjgtw9ahqgfGM0nHpK4xv
         Lxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755428; x=1790360228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHWLxN1z9UCBkM9IJvLJg4YXBPTZaz9qxxb7LJ22R7c=;
        b=m5fwAq97usJcIDUu/Aq79ynf9uq1Lgl5qghO/L6wVDpywl/lfCwJYQa+FYWYfG7wK7
         D3j4/7ktRwJImRXLcCPebiS3sg9M/IEZdj6rtO75yh7OdaukQp9oFQL7uiF192H4Gc6e
         U7pFjKQsh8+exKujAB/XaZVt8r2yNUp1OcMM42aXe0PiXNw96Azt13V2RHrIIS4bAzGj
         M2mlz07O18pYGote2rawGOGv8v4V5eBullxPR0BfQCB1I46j4XRJ+wVyjzu9KZh7cdvZ
         d2Qfs4oarVXN1HVPjL0ElJ1381k5Xqo3uI+N9bdP5YQ9r6sc3JU4UhuDeAatJhkmQIlF
         o5Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzTD1WPYLtkKt/soNwQ4maG6IyMTI30KrfksMDeikyLTlbkpen9UIXGPgyyqMwHX9N1cfVEIqWP23bLkiA=@vger.kernel.org
X-Gm-Message-State: AFuF++l+YAKsGi50c9MmxCMGlnzGbZYdlbTOearREl1FtYSxnprhTKtz
	thfMjEUT1humHKOXx8+M3iTwlfcV0KS2goncnr5pV5yQuB9Ot84l3gtcp3NIDCMqwXg=
X-Gm-Gg: AYBFou2i116/mZLehN1GJZBO2JwT9K8P/YW63YO+XAVEABDsljy2x0b9zqgXt/M+S5u
	+LY5TzvA/B70uo+QQCFfrqp3bZ84PzeYv+niwM0coU3pCRyz25+Ns7wiHQ71MNlIo9G/SkJW9e1
	c89eTGvlshFYVkSfGeRQWdmpyluVa2DI51wNXjedVAMnjEf7CNmybW3YmxfAyPUO6uaZvm07IIp
	PVd8EhwGLt/jG3B18ZGqpJ68itNAMBfZ7v5kUMQ/U10UlAPeDCd7S6lFyK0fLaAUj+HJFfI8hcp
	BlMmdke9vTLloEbQpjXKwu7tZbbH8yIe8paIVlCUpybYylEzg3S+8DmNIHst98mSFI2y+Csw4np
	IdzHjAYIomyIYeofSYle4CIrA3xuyI2vyW+1yF+1ShlJWPKOQjUgs1fFr8bhCI4HVRcfPssYIlz
	dF2I5aWqgGCoulZombidTV5/zwOJTOBGqoRgb/ofx/5ENfcz6E5n5c/MNBcdmqK3Ru0vBuvdg8D
	ThQikVz8xRzx9eYJ64yAw==
X-Received: by 2002:a17:90b:4c0b:b0:39e:6c68:c77f with SMTP id 98e67ed59e1d1-39e6c68ca6bmr654464a91.53.1789755427466;
        Fri, 18 Sep 2026 11:17:07 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:06 -0700 (PDT)
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
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 07/18] nvme: Introduce FENCING and FENCED controller states
Date: Fri, 18 Sep 2026 11:14:07 -0700
Message-ID: <20260918181614.3947933-8-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918181614.3947933-1-mkhalfella@purestorage.com>
References: <20260918181614.3947933-1-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce two new controller states, FENCING and FENCED, and the state
machine transitions needed to support them. Transports will move a LIVE
controller into these states when an error is encountered; this patch
only adds the states themselves.

FENCING is entered from LIVE. While in FENCING the queues remain alive
but new requests are not allowed to be sent, and the controller can be
neither reset nor deleted (there is no transition from FENCING to
RESETTING, DELETING or DELETING_NOIO). This is intentional because
resetting or deleting the controller cancels inflight IOs, which should
be held until either CCR succeeds or time-based recovery completes.

FENCED is a short-lived state entered from FENCING before a reset. It is
the only state from which RESETTING is reachable, so it exists to
prevent a manual reset from taking effect while the controller is still
in FENCING.

Update nvme_available_path() to treat a controller in FENCING/FENCED
as an available path, both states are non-terminal states, and finally
add the state names to be exposed via the sysfs state attribute.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Randy Jennings <randyj@purestorage.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/core.c      | 27 +++++++++++++++++++++++++--
 drivers/nvme/host/multipath.c |  2 ++
 drivers/nvme/host/nvme.h      |  4 ++++
 drivers/nvme/host/sysfs.c     |  2 ++
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index ae7c04b77a3e..e4e18fb72159 100644
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
@@ -786,6 +805,8 @@ blk_status_t nvme_fail_nonready_command(struct nvme_ctrl *ctrl,
 
 	if (state != NVME_CTRL_DELETING_NOIO &&
 	    state != NVME_CTRL_DELETING &&
+	    state != NVME_CTRL_FENCING &&
+	    state != NVME_CTRL_FENCED &&
 	    state != NVME_CTRL_DEAD &&
 	    !test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ctrl->flags) &&
 	    !blk_noretry_request(rq) && !(rq->cmd_flags & REQ_NVME_MPATH))
@@ -828,10 +849,12 @@ bool __nvme_check_ready(struct nvme_ctrl *ctrl, struct request *rq,
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
index 75dbb58286a3..023d09f3c8ba 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -512,6 +512,8 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 		case NVME_CTRL_LIVE:
 		case NVME_CTRL_RESETTING:
 		case NVME_CTRL_CONNECTING:
+		case NVME_CTRL_FENCING:
+		case NVME_CTRL_FENCED:
 			return true;
 		default:
 			break;
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index cb9d7f45188f..84ea3f2728bd 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -312,6 +312,8 @@ static inline u16 nvme_req_qid(struct request *req)
 enum nvme_ctrl_state {
 	NVME_CTRL_NEW,
 	NVME_CTRL_LIVE,
+	NVME_CTRL_FENCING,
+	NVME_CTRL_FENCED,
 	NVME_CTRL_RESETTING,
 	NVME_CTRL_CONNECTING,
 	NVME_CTRL_DELETING,
@@ -865,6 +867,8 @@ static inline bool nvme_state_terminal(struct nvme_ctrl *ctrl)
 	switch (nvme_ctrl_state(ctrl)) {
 	case NVME_CTRL_NEW:
 	case NVME_CTRL_LIVE:
+	case NVME_CTRL_FENCING:
+	case NVME_CTRL_FENCED:
 	case NVME_CTRL_RESETTING:
 	case NVME_CTRL_CONNECTING:
 		return false;
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index b60f5b66a1d1..3a12b07149d2 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -542,6 +542,8 @@ static ssize_t nvme_sysfs_show_state(struct device *dev,
 	static const char *const state_name[] = {
 		[NVME_CTRL_NEW]		= "new",
 		[NVME_CTRL_LIVE]	= "live",
+		[NVME_CTRL_FENCING]	= "fencing",
+		[NVME_CTRL_FENCED]	= "fenced",
 		[NVME_CTRL_RESETTING]	= "resetting",
 		[NVME_CTRL_CONNECTING]	= "connecting",
 		[NVME_CTRL_DELETING]	= "deleting",
-- 
2.55.0

