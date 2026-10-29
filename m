Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291066;
	b=BTeXlHkATqVQ890WO0gMeldTf1nSvgRUVNdVfkDw18/2Lue1ZlRmcQ+2/R/dCICKNFGv
	 XwfuhxL4f1P7pOAUN3/12Eoxk/1onCLeNLpvO5ER0teN7hlj6Gxy0p2XBhTGM2J4/dRoT
	 pN2admmxl0QLtjhMALhlDDkdO9tJTrUjlrR5+lGzdwFVB77f3LhztnOsfTITGWgtUMuSp
	 T8xLa14SUVUmm5AMxYFURGBI3dN7m1cz4yN0AggiW8SwDxlPY6+P+hSvZUFM68LtsoFNq
	 LXSkOYh1yZVMOIHHQw0HmnJKnjHdw7gnaPOgPZE/6vUUxmPZFKraPHjkj/eSCOpuJVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oNt+k5hd6gK3JHgbJpiRSUaj/zK/QDMMxaVigJ+IVv8=;
	b=nXSszI6UZFKQi4x8vi8o1kvmQOlAm4Ff8JdHr0r1cN4BMXJ+hLOCqhZ7Wisw/Swa/YGf
	 7MFme4jrv4QqyZyYgH79qNLP5CIYSp+cDQ1Qtr0jbZ7TIizJavgutIbGy1WZcSLql1AjA
	 VNSXULZpba6xn/Nzpmb1M49y7beS891O6IQlcNIrtomhyDLvvjf4P0QcV3HWZBG28N3/T
	 usxwDjTW8zacUfT2dt8wrCwoa2IYwk1leDkjtvge95cEH1axcvwap+RMuVjOOvmr3j7J2
	 R1x9GZ310gZjwPxpQYT3KUsZt4WgYpjg3Nnqs+URh+0GYGip9cNyz2mRfOFLoRKYQSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGgcrtXQ;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D0F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D0F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGgcrtXQ
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dee593f18so1598138f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793291064; x=1793895864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNt+k5hd6gK3JHgbJpiRSUaj/zK/QDMMxaVigJ+IVv8=;
        b=EGgcrtXQdOXQe8Wg0+y8mCFeBHdwKIWFWLS/tzXhFxzxnqxJrzHwwWiZtPoBhrGyJ5
         MJMiCdAOXmfo0PFLF8Gw6XXBHnFLiZx1RPVgWgOIayKgr5ex+ji6RJACXHIRA2UMfkUp
         K94IctlgigFoTiFGSgNvWkZJwURBoPJ8ZOAXPv7ziW7TPFNd0rY8zBP8/sFl6i6HaLu9
         TGAUU8LJZhRX+gcJnKV2J+GUnwrH/f8+XehiIAOGPRgYE/VmO2/uvWCsMyyDFz5kHlf/
         kwp16+H7ZDGxYyLza2o5TJWPDlOpw3LGog5MqLTr0MGnczBNMJQ1jAlV2E+vyAkVSNmj
         avbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291064; x=1793895864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNt+k5hd6gK3JHgbJpiRSUaj/zK/QDMMxaVigJ+IVv8=;
        b=BmljdK4OS6yBbzqBrf1Ej6l/2QAQiHqq3Mey85MaEWFcWAU8D/ZeNQaK8xyofBtwIv
         9OewRc9khUTcjlYXKaeSu6TiS2g1wjNVQYw7+myHVPISeOEFtBRRjDqdDUs+Zeo4keku
         LBFXTIrbohC3eHc/T3qoozBfr7HtefmZTWoKRqJyg9/syUumjwtBYlK09jUpdg43B1z7
         CiUTDkrNTwR2drV1DFW6EwJacAuTF2rmBavZyfDl3upRDriEZ+a678b7S8vlbG7IWOPy
         Oy2Z1LqL6HUUOcF8Swen1xx6711U3AdEbrvJRBfHch0cmwfCdfrccK1oxOtsQL7a+/dv
         QWTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkhi0yac6tlduf1s/CQk2LhPsKjwwPw+MXRqcRxv0uAcbPm8qmRXf/WbySLXuzejX/1OIIpLt3tHGrnmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQAK6m0LPcDKx9DXgma5KcL2XRbTRPUGsCaqa8eB0IncvO6ifr
	pH+udNCeNnHR56pbfY+RukU1MkqXNU2NAys9wZ6bxgX1Vmye2VgdRcE=
X-Gm-Gg: AYBFou0X7orRtYtYAw4kBFu1Kdc6a6RzwLIgyZ8yMrEzdpsRWY3mLNOrAqTdu/EDcBf
	sTHeLjAaRDBWcFsbhcKOhv6cmtmv6RyCBdh33hBm3P0v9mrUJCP5C7+nfyZdvzgHO54zgVBxoqZ
	xfFH/zH+BniWhQYye2t/H8KJ6f2FRuunw4UU74IvOVm2Kqw1otpENKT7hb7rhJGlOafTF0Tig5e
	EVrBgar/8wo4nrxoIaEnC9G9w9s8L0FIGgVhRiolWlBpFmXBmP0Ku9v901ZOJ/0j7DEDvs/F9yA
	Ux4+CMZaotEmTc4Yl9cVcQRRguXQKdf8n11UbzZZhqTrajAx8kWndxCrTKGCW/o2e9r8ov5kMG0
	T2hbHPVHEdf2dX7z+g0li9j90ALjkNPSkwE40rJiLPtpsDzjbko4Ml38GTOVByP8GFfo00QK3dn
	SV1/hcqyes61Dj/UmIdvSjpitgSqoPkcKGu72uYWqv0jJs9oonqROEnwrpyoCeASD+38daO9T46
	dYwQCaEUDQT1DKt5Dx3HA4AnSeEwrXT/v5rQ1yw7R6HKYpRLhG4qrO4w8aHlNqFkijwm+Og9g==
X-Received: by 2002:a05:6000:603:b0:48e:389:d2d5 with SMTP id ffacd0b85a97d-48e5d5b4a5emr14665720f8f.51.1793291064450;
        Thu, 29 Oct 2026 09:24:24 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6dfaa4ccsm135494f8f.39.2026.10.29.09.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:24:21 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	"John W . Linville" <linville@tuxdriver.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 net] nfc: llcp: use disable_work_sync and timer_shutdown_sync in local_cleanup
Date: Thu, 29 Oct 2026 16:24:19 +0000
Message-ID: <20261029162419.2420980-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

local_cleanup() tears down timers and work items before
local_release_work() frees the nfc_llcp_local structure.  The current
code has two ordering problems:

1) timer_delete_sync() does not prevent timer callbacks from re-arming
   the timer via mod_timer().  nfc_llcp_tx_work() unconditionally
   re-arms link_timer, and nfc_llcp_sdreq_timeout_work() conditionally
   re-arms sdreq_timer.  A work callback that runs during
   cancel_work_sync() and calls mod_timer() causes the timer to fire
   after the structure is freed.

2) cancel_work_sync() does not prevent work items from being
   re-queued.  nfc_llcp_rx_work() queues tx_work via
   schedule_work(), and the timer callbacks queue their associated
   work items.  Since tx_work is cancelled before rx_work, a
   running rx_work instance can re-queue tx_work after its
   cancel_work_sync() has returned.  The re-queued tx_work then
   runs on the freed structure.

Switch the timers to timer_shutdown_sync() which rejects subsequent
mod_timer() calls.  Switch the work items to disable_work_sync()
which rejects subsequent schedule_work() calls.

Reorder the teardown sequence so that both timers are shut down
first (their callbacks queue work items), rx_work is disabled
before tx_work (rx_work queues tx_work), and data structures are
freed only after all asynchronous callbacks are quiesced.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
v2:
  - Switch work items from cancel_work_sync() to disable_work_sync()
    to prevent re-queuing after cancellation, as identified by the
    automated review and confirmed by Simon Horman
  - Reorder teardown: shut down both timers first (their callbacks
    queue work items), then disable rx_work before tx_work (rx_work
    queues tx_work), then disable remaining work items
  - Move data structure cleanup (skb_queue_purge, kfree_skb) after
    all asynchronous callbacks are quiesced
 net/nfc/llcp_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf817007cf2..984e7088288f0 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -173,15 +173,15 @@ static struct nfc_llcp_local *nfc_llcp_local_get(struct nfc_llcp_local *local)
 static void local_cleanup(struct nfc_llcp_local *local)
 {
 	nfc_llcp_socket_release(local, false, ENXIO);
-	timer_delete_sync(&local->link_timer);
+	timer_shutdown_sync(&local->link_timer);
+	timer_shutdown_sync(&local->sdreq_timer);
+	disable_work_sync(&local->rx_work);
+	disable_work_sync(&local->tx_work);
+	disable_work_sync(&local->timeout_work);
+	disable_work_sync(&local->sdreq_timeout_work);
 	skb_queue_purge(&local->tx_queue);
-	cancel_work_sync(&local->tx_work);
-	cancel_work_sync(&local->rx_work);
-	cancel_work_sync(&local->timeout_work);
 	kfree_skb(local->rx_pending);
 	local->rx_pending = NULL;
-	timer_delete_sync(&local->sdreq_timer);
-	cancel_work_sync(&local->sdreq_timeout_work);
 	nfc_llcp_free_sdp_tlv_list(&local->pending_sdreqs);
 }
 
-- 
2.47.3

