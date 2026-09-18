Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5843B9DA2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789697069; cv=none; b=Gut/FnjBxZGZ8zqcGcaFSqpnkRHLPD8hnL5P2ssW/+/R+vVGpDqwD3rsAgvsp7rF+QcMFI7dm3ibKtjVb1ZE5IGWAUZLURnnq1BOkNXhBhDvFR0jJTrnVnwwlYPw7kKUltXSj1R7+dk7GpggDXIgWfvZ1SBxGE7XfvWut6OCfyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789697069; c=relaxed/simple;
	bh=GqEmDjbmlD43nKcKkz3682LJMrGqtTA7m5Mhi4U8TjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbRvNEdHTB63OUCojv6zP5v0gI3qPEZiEYgJUIC0yYOhjqKaaSMx6nZIdXoLQSK+TO5/IXjoEpCUZQoCgR8c5tmlAdn8ZfoNCp7yBNiMNDQSSnFTygQxmWZbAa7jzRNNfKnDomPvW7dFGin5dQ12FecNx7+SnXnkpeTv8UYnjiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQI9n4X8; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQI9n4X8"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so259423b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789697061; x=1790301861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8IHVPQTh4E48RsfYHS1AOxQ6DrEMP7aqWgbccraUDI=;
        b=DQI9n4X8v9uHILIdBUDpz7OpGvJXBhMGCjM/mESEz1FeDQvp+nySIgdM5uS3LCgjvu
         8bvZumz4fBHcd0MjRZX/nOV2kUFLBWB8BIhOGQv1HLzhVvEO2NRpTRBCp6wB6XRGCRzu
         dHN1k1Kh4w/YTpc5iExFUuFn9KqOUkYFX9Mt/T4ARATwICip7sYunMN1sqx6fR5oPfo2
         C/2CFBgThuGRuPfjEAVYiMgEubZNnArsRxp4B+xE9IyonJqUkXPsmxVHmEUxEH8DOVhB
         Wk2QB56tiWgQRvnlIq7YILvmrThyPVv3YsX9zMo7C6oiC/ivwBpxGAdKHC3L7NZaNO9x
         DWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789697061; x=1790301861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8IHVPQTh4E48RsfYHS1AOxQ6DrEMP7aqWgbccraUDI=;
        b=EZedQpT5DiprLnCAVukDG69F9J03J/eOTH7BZKo8vo2fr1sSHQLbt/gJuN1jnI0kgp
         QTYJbunNjbtyZqPfx7+3ILP2t7vCc1ToY4wyIdMj3CKJMs1vvJbmL7XEyMtDs4eaXQrD
         z8aeo8Zl1sg1DNODkZeS7g0Q20ZbKCHFZrAMxsYEHAHF6YcsDXBO65I/9ZoMPplsX1Zm
         JTW9A+0lv2jr/fr+o31liQ3pnyeTZI9JwffK39ocycTgm8T2GQxOr4OB49EFaQ8/so+M
         7m82M16Pm6oWRg0kcHm1CWITIFs/Ag3885k3ztVvPP6fcEhpU1nwy/dfkjh7kwj9Vlj1
         gpwg==
X-Forwarded-Encrypted: i=1; AKwUvBycjtmbg++qbeU82F7Y/gYxXHdDs0jrgpzF4X06z5Rkob2c6sHnFNMqCajtEpSpwOC3VTw9ymeFq7/l3YQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nuEa45INI92d0V4drctED82cgZ6ufGr031oKkefxOuwjnOvH7S
	P6oR0JL92KxtYpxL1nyxMGhuhSX6bqEOpdyH/+zqWq/xJUiEc3+EuTHH
X-Gm-Gg: AYBFou21LryobPBh51UE8/OpMHs6LCsAB/3cRSy0od/WpXjeugDrmcV9Jct0GhnKV9e
	o3WiXpP//3PRKqkKraLGqz1OBJux1guy7QGgqYTdQqvPR16QBANJVzdAKdtQMvpjPB/o2gjtFI2
	Bikb9Jcmwga6CclHrrXPMfKVXy40O1suILjlNaRR/mD0hV92sYUGmrXj6UMwUruqaSQUEB5HN69
	YJvTuAaSqzJe+zrk95R03aUdMVNee6dIVR0HbqXl7BZG+VlUceh6rFsBWThxwwIxvn6Q1jZkqHw
	MbCBtB4Yfgx341YwQBKmkT5ie0SJwdujZBVSCyrwTVpadm57OXgr2Idcl1XuGtMPscDYCImtHlY
	q9ght87vO1+/8C80u3RlppCRYOhCO87zjo8H88jNWNgDOLrMhlMPmbGXYRpH6kHBFW9waGlr/F6
	Hu1R30t2GCiLmF2TQJfAlH7GTZwu6t4ZrDZwzIy+w4M7wH7sH0bzm74Y5ltDO7GehiyCcuU/FvC
	AnLkAYX026FVkkkPl+JqYS5eYVZ8TNjdrJLWwo=
X-Received: by 2002:a05:6a20:a11d:b0:3d0:ba81:79b9 with SMTP id adf61e73a8af0-3dd8c41fd70mr1660945637.12.1789697061119;
        Thu, 17 Sep 2026 19:04:21 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79ca:7a54:4576:24ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2890b915sm136049eec.30.2026.09.17.19.04.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 19:04:20 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Christophe Ricard <christophe.ricard@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] nfc: nci: do not process unexpected or invalid CORE_CONN_CREATE_RSP
Date: Fri, 18 Sep 2026 10:04:11 +0800
Message-ID: <20260918020412.82878-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

Hello,

This patch addresses several issues in the NCI core logical connection
handling where an unsolicited or malformed CORE_CONN_CREATE_RSP packet
can corrupt connection tracking, shadow the static RF connection, and
cause TX queue stalls or hung waiters.

Problem Overview:
=================
In the NCI core stack, logical connections can be created by sending
NCI_OP_CORE_CONN_CREATE_CMD to the NFCC, which answers with
NCI_OP_CORE_CONN_CREATE_RSP. nci_core_conn_create_rsp_packet() parses
this response and adds a new struct nci_conn_info to ndev->conn_info_list.

However, nci_core_conn_create_rsp_packet() had several vulnerabilities:
1. No Pending Command Check:
   It did not check whether a connection creation command was actually
   pending. An unsolicited or delayed CORE_CONN_CREATE_RSP packet
   unconditionally allocated and inserted a connection into
   ndev->conn_info_list, and called nci_req_complete(ndev, status),
   prematurely completing whatever unrelated request was in-flight.
2. Connection ID Collision & Shadowing:
   Dynamic logical connections allocated by the NFCC must not use
   NCI_STATIC_RF_CONN_ID (0x00) or collide with existing connections.
   Furthermore, nci_core_conn_create_rsp_packet() used list_add() to
   prepend the new connection to ndev->conn_info_list. Because
   connection lookups (e.g. in nci_tx_work() and
   nci_data_exchange_complete()) use first-match semantics, prepending
   allowed an injected connection with conn_id = 0 to shadow
   ndev->rf_conn_info. This caused:
   - Cross-connection credit accounting in nci_tx_work().
   - TX queue stall when credits == 0 (frame wedged without timer).
   - Dropped RX completion (cb == NULL on the rogue connection, hanging
     the real waiter registered by nci_transceive()).
3. Missing Length Validation:
   The handler accessed payload fields without checking whether
   skb->len >= sizeof(struct nci_core_conn_create_rsp), risking
   out-of-bounds reads.
4. Spurious HCI conn_info Assignment:
   ndev->hci_dev->conn_info was updated whenever cur_params.id matched
   hci_dev->nfcee_id. Because both default to 0, non-NFCEE connections
   (such as loopback) erroneously updated ndev->hci_dev->conn_info.

Solution:
=========
- Add an NCI_CONN_CREATE_PENDING flag in enum nci_flag to track
  in-flight connection creation commands, and reject unsolicited or
  delayed responses.
- Validate packet length before reading payload fields.
- Reject responses that allocate NCI_STATIC_RF_CONN_ID or duplicate
  existing connection IDs.
- Append new connections with list_add_tail() instead of list_add().
- Restrict ndev->hci_dev->conn_info assignment to NFCEE destination
  types.

Non-overlap with adjacent fixes:
================================
This issue does not overlap with the adjacent upstream fixes in this
area: Lin Ma's commit 1b1499a817c9 ("nfc: nci: fix the UAF of
rf_conn_info object") addresses a use-after-free in the conn_close
path, and Yun Zhou's commit d56575a2595e ("nfc: nci: fix use of
uninitialized memory in CORE_INIT_RSP parsing") addresses a different
packet. The problem fixed here is the list_add() head-insertion
combined with first-match lookup semantics (core.c:43-54), which lets
a forged connection shadow the real one.

Testing:
========
Verified with QEMU arm64 empirical test harness. Unsolicited
CORE_CONN_CREATE_RSP frames were rejected with a rate-limited warning;
conn_count remained 1, and the static RF connection was not shadowed.
Verified with module compilation and checkpatch.pl (0 errors, 0 warnings).

Thanks,
Yuchao Zhang

Yuchao Zhang (1):
  nfc: nci: do not process unexpected or invalid CORE_CONN_CREATE_RSP

 include/net/nfc/nci_core.h |  1 +
 net/nfc/nci/core.c         |  2 ++
 net/nfc/nci/rsp.c          | 37 ++++++++++++++++++++++++++++++-------
 3 files changed, 33 insertions(+), 7 deletions(-)

-- 
2.53.0
