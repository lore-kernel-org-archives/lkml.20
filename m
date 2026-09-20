Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C43296BBC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929036; cv=none; b=CN0FuKjJ2KqIg57UBirlXHcHHM3KGXDymU/kdGKM4gO3BSxkaByEzbZ0/GQn8MA5IKCqOIK5Zyc24EVZRGoLsAiwL++/THw+BrzcbLoiwRyERtxva9YzJcUDMffPOrq6Q+DQBVaT0Sdut17cOY+6VMVQ39GjT3/e6/UILNlpcF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929036; c=relaxed/simple;
	bh=AcE9zrysBOb+NlUMMSohIv2aatVf8yMIkkVyal8cEMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hk63RQpEGrb0sEDsl4kOgm3Idyf1Sz/+eIgcDmwD7mL4yIZ30MQD4LjTj+ipp/8z8JlvjplsPQrnuhywKf4fEqrBd94Z1leHcl0y/t9SFH30fxAOP1V88r8jlnItoZY4qVoisuK65QvdFnqmdc29BXC91CimP9fcgyTcgxwRnd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=TT/+BJp5; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="TT/+BJp5"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86212a185dcso2712412b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929026; x=1790533826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHWLxN1z9UCBkM9IJvLJg4YXBPTZaz9qxxb7LJ22R7c=;
        b=TT/+BJp5iCrkIpRb5h1f64X9WK1XCbc1xfYzXRR8gy+tBQvL+iwWxqPZZ7EFasyDto
         GpuPgCl+TYrJRJSR0GCp56o9LwC4vrb0KEzSLqx/nYZmZBMNtmgPGKBHWKOhPwogtEJW
         IhUZbQWHSMOKbjM04cUPktoJSZ+vvxzAndg46ZAwHwMGWvfryGgPJPtvoyiI6l3Ipvne
         bWX4KYf0dy2FL601+WvUG9lbYK6DPXvREQ6H3uJ6flxNYXsQkzSNYST6OfeTjwkhOiLb
         s9ZFSi3PY/JRfNgqYVxNdHYGkK6LvJNa8y1tsPXuHYQ0+UiAsrOYRADyJz8Jjrm/BiDF
         Fkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929026; x=1790533826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHWLxN1z9UCBkM9IJvLJg4YXBPTZaz9qxxb7LJ22R7c=;
        b=V3TqaNc4LLjhcpMQU3hVKvcW+kFbilhG+D3noG4tIGGCTYQfFZwKZ66POEBZd47E2v
         HHjzxt76smFLWp0wegZwGpKm0YogS0lOBCEQzmPt1wPqaZzfZN/aMnVsyFEtqXLJU7f4
         SSb/M2FIdn0IC/MN8fryBukdKb0nTsYJFJ4kkqKRi8gdNJwoFYYwRcXrLVyP/nNFbFlC
         wSOvHJZcmZp+wyhCPfkhoLzuwdiGqnJK7P5q4FtaFqjqGMLgnsCLdKgsEAM1FNDpuJRj
         /Qu9jy33mICMuPzPjietpozzVTG8Q1RpLOdDvcfa8bGmqKC1pQ7LmZcB8+6yxQIO75S0
         0uzw==
X-Forwarded-Encrypted: i=1; AKwUvByYgZb+IaqUsXeYcqdx60kIttAVFROLx6dyUXh8JhKUcu4o1C8bWRKg23fnMYoH5m3PWrBt2NKlvfnbiEs=@vger.kernel.org
X-Gm-Message-State: AFuF++l8U1R/p31JMY/f87e0u93a0xqwopZdyVNyUdN1OMKY8Ein5TXK
	ueQmSCcrx7X4G9O9YJR9qKB1Wy+QrojjLAOS88M5+hQwQG4Wy58vtJqexNONgjImC8A=
X-Gm-Gg: AYBFou1SBlVeZ9u8JeKrZWEE1xwTPHYNXeLmzK09Vy2yL7xDQX6XkjZP1WDoYuuHMFq
	YlRsWGLil3wNAoPTQZXqG4JzOYowkfHOspPnLx2kza8ArUAOt2uB1nJItFeuIJQ8wNHI92n+ZTV
	ANWRk6k9FYivQKUSaQaM/9xixuG7sAqzmjSwBGUNM+R8OlJx/pZ9Z5eoQpV5pPOYBTQIFr6/iKc
	GzMbeZ0mo5Fo7jqRfWGxQMykZ8fQPErIMwNdlgXVTq2+rW3ZbUxSYHKoDXxnK8DBR4jyQ/3LA2n
	+zRLoFw6hNHO4wammL5i9PYolfoVDyzHCU8PoI/3o3RNB7OccTqC7pTErcBM5O8UbnCkCCBraK7
	yRSb9qASPBn1rIkUbFx3RtQaHX028cN3aMUKDQ6Tgar/LmZPDtfdH/NDfSQCSNq9ay8FfPTTgl2
	4PA7zgDPj+Og2+MBRBWq+HaTFSbCyxuKj9m3Za2cPuKFEBLlZbV3gkXMT9
X-Received: by 2002:a05:6a21:7795:b0:3dd:a00a:1713 with SMTP id adf61e73a8af0-3dda00a3046mr6833488637.46.1789929025982;
        Sun, 20 Sep 2026 11:30:25 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:25 -0700 (PDT)
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
Subject: [PATCH v6 07/18] nvme: Introduce FENCING and FENCED controller states
Date: Sun, 20 Sep 2026 11:28:05 -0700
Message-ID: <20260920182936.2317916-8-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920182936.2317916-1-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
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

