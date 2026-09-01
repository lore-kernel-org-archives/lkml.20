Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8907F49E5D3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290326; cv=none; b=C4slw6zy8bmNU7IPc2w2B1F3VX4D3cdmyrDCzU5j96ZR8RdG5lhB2PNpIRh8xTVX029ikB/E4HyhROWZD8roocWSnSMqV3FPSpP5rVrxNzPnQWwIpqQQ+cckGdY86fF6V/uEu6yC2k5xhonn3D+164EmSZUr0uw00EVNNVFZzPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290326; c=relaxed/simple;
	bh=ct3wjDm9DioxEoU5z5Oc8L7zod1x2daMyErzOnMcehk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5kn6oPO4/FgJEPgtj4jpJlR75DV/e8AuKKEUQwBBShjqjesR67+sSlcKb3nek+r1wRJnftoZl2rEkpQd8VtZeLOIchU8XOUujqKzwZU1jICWvjkU3E9RNH5951gCDn8p6qlgyjVVCUV6XiCex6M7PyXIXuQ70BG693UWUGsWdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DRqJ4cJq; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DRqJ4cJq"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-398a5aad413so186648a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290325; x=1788895125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8eXtyQc0pvhajUfFg9n3BqpX27RWj/RmfivJgYatSZg=;
        b=h43W/iDJPAoLE/gCa9XFUo2KST9DBTgSmp4kacNwXJ8uy48tLdPDXZOxql9mAEca03
         +JpCyqT2XBW3YtTinD7HBhVDY0uv7vJxrL96+eDxfaNha2ty8XQ13zKOUfzxT4j5WhjI
         VoVbLLjTL8l4RJxeA2Bi6WUnGNisUC4TcNyzeM9S9hs4zJ68nbgU2pyH6DEtwdXWEfSG
         pCk5cMEZ0GasRO8w/XLayOT11gTTpHOMHPadzoSbD7Py/VkjMVtMwA2OX+8SYGL9+vw6
         24TVVvVZbZLUdCF5yNRGaxJ2ohAlZBU9mY+mSzwaD/KbFNtBa41mYBIj//8H4WFjniXv
         JfGg==
X-Forwarded-Encrypted: i=1; AKwUvBxi1I/MrdXAH76ZaQSKJ8J6TBEHkKeYSOOh1pt5ZBNV6XEaeBrtoHqfsrY2eMYOKxBuELZRjINs/amsIsM=@vger.kernel.org
X-Gm-Message-State: AFuF++l1BU/7/XKMvB3vGayZ9+csRvwkJF0FocwJ6/oj+ac1QbhetJ7m
	/YNrqcuJDkLZSZGLRnObNpYdmBQPqdcsV8gf35bcs21SMejP+ENuUzjYptPoLzJ7zyH6daorcYf
	OZoOLX60eEcPLW39Z4QiAOE/PjAHQzJs3Bgpz6el23slvsk6gRqTifBFBnMfsEa35caR3jFEmUZ
	4eUlxgxb8CIkn42BYR6c1eRHxKHc70lpeYstDYCkanIIkhSZGtVK5XGTbJzQEiT9IqASt8yLwaB
	0hR+fpcGP8AZsRp27MhqcfKAA==
X-Gm-Gg: AYBFou1tRgL5Opus4F74AnLpwTG8rum8ZRF9atkYcql60v+HaMiC2QtxMG9mJz7Qktt
	xnpagYKhFL4Gj56A3oo64+J54gbSnGZYgXdRkc+WfySBuJaYPjXpSeSqduvdvcs7yslPWYEv90g
	2eAtaEc8eqLtHLHpF/zVDBwrAR8YstzgttK1f2Ne4GTCzgw1TjjIb2ScyuC1rF7vRaWGhJTCBz/
	SFemqi0UQPATV3gUYJccTWszB6xDB/zxbWEgftbiWvw4JegI9ckXQmKN+slXk+Wxr2IDVyCBnj+
	DUSLmD4JddrJ+lzmOHKgAhZ6rQwzAKiDt7F75OeChSjY8lQFw7luu65ztLko0B5WzDDtkrxddQh
	PdLmK5BAU/CLbCkGBW5NqeJQ2nx1Q8r8nU/nx0C8FqDI8J5PrPpW/0AoUPxiSdNliL6kbsgcrhT
	6NuumWUeZlUO0lvPjZipLx9CbrWF2/BnNb9iABhWP4BA==
X-Received: by 2002:a17:90b:1f87:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-396d0a6589dmr56764501a91.0.1788290324787;
        Tue, 01 Sep 2026 12:18:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3990d49cc83sm1271264a91.6.2026.09.01.12.18.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 12:18:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfca8558d2so1658355ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788290323; x=1788895123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eXtyQc0pvhajUfFg9n3BqpX27RWj/RmfivJgYatSZg=;
        b=DRqJ4cJqjknGFxeE6TL7igw/LDuPQfLUyHzNNAV9jPM6AZMBw797Q3oAXw8j4b8MU3
         ZUjb+BvzOd/TAAwfIK3zRTbR/A4VDo4MwfkkY7G9UEs0AMycHino4hHklYHkX23NhWU2
         R1+HL+q2tuBZnbK0zl1TZlvdsWz7Ft03PC+fI=
X-Forwarded-Encrypted: i=1; AKwUvByLfUbHPRiGM47TriTW6suLgXobWMUMl4vdC2p8/IOtlFOw+gLKxYasHc6ntofsz1YqCnx5wcFBjYOza/o=@vger.kernel.org
X-Received: by 2002:a17:902:f68c:b0:2d8:d4cd:dc8f with SMTP id d9443c01a7336-2d8d4cddf3dmr351189065ad.18.1788290322856;
        Tue, 01 Sep 2026 12:18:42 -0700 (PDT)
X-Received: by 2002:a17:902:f68c:b0:2d8:d4cd:dc8f with SMTP id d9443c01a7336-2d8d4cddf3dmr351188305ad.18.1788290322387;
        Tue, 01 Sep 2026 12:18:42 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm186440eec.18.2026.09.01.12.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:18:41 -0700 (PDT)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>
Subject: [PATCH net-next 7/7] bnge: Process async events while administratively down
Date: Wed,  2 Sep 2026 00:47:28 +0530
Message-ID: <20260901191728.643212-8-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901191728.643212-1-bhargava.marreddy@broadcom.com>
References: <20260901191728.643212-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Restructure bnge_sp_task() to skip only periodic stats via goto when the
interface is down, allowing it to fall through to async event handling.
Previously, clearing BNGE_STATE_OPEN caused an early return that dropped all
async events while down.

Additionally, add a netif_running() early return to bnge_report_link() to avoid
updating carrier state or printing link messages while closed, while still
updating bd->link_info safely in the background.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_link.c   | 3 +++
 drivers/net/ethernet/broadcom/bnge/bnge_netdev.c | 7 +++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_link.c b/drivers/net/ethernet/broadcom/bnge/bnge_link.c
index 3b0dfcf27376..31e2ede2e537 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_link.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_link.c
@@ -402,6 +402,9 @@ static char *bnge_report_fec(struct bnge_link_info *link_info)
 
 void bnge_report_link(struct bnge_dev *bd)
 {
+	if (!netif_running(bd->netdev))
+		return;
+
 	if (BNGE_LINK_IS_UP(bd)) {
 		const char *signal = "";
 		const char *flow_ctrl;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index d11c404acd4e..49e27cbc6394 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -394,10 +394,8 @@ static void bnge_sp_task(struct work_struct *work)
 	struct bnge_dev *bd = bn->bd;
 
 	netdev_lock(bn->netdev);
-	if (!test_bit(BNGE_STATE_OPEN, &bd->state)) {
-		netdev_unlock(bn->netdev);
-		return;
-	}
+	if (!test_bit(BNGE_STATE_OPEN, &bd->state))
+		goto async_evt;
 
 	if (test_and_clear_bit(BNGE_PERIODIC_STATS_SP_EVENT, &bn->sp_event)) {
 		bnge_hwrm_port_qstats(bd, 0);
@@ -405,6 +403,7 @@ static void bnge_sp_task(struct work_struct *work)
 		bnge_accumulate_all_stats(bd);
 	}
 
+async_evt:
 	if (test_and_clear_bit(BNGE_UPDATE_PHY_SP_EVENT, &bn->sp_event)) {
 		int rc;
 
-- 
2.47.3

