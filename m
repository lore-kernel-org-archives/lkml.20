Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773893;
	b=x3td6tuLB3sRmZegr5GmD7bs44ZIxol6/pj7u1tSPGhg+eoqVcKr18UPvRfXMAz5Clpj
	 gnGhWoI+kkBFEG8s8Koxkb3KC46h0ldDM3ANOLapl7FYxl9vKXDfQSRW9Wf70OlnSGy6y
	 D/ePvOaMnCtfL0v/ZnFHN7hZyhGmy9EEndiNAQTvCILQV2VcGBKlEyw9K0ozpRN9T0eZp
	 wdvWDgDtMxi89tt25WlKoFfobp8ftdLh/TezNO6iKYGeHDGVgDOTMhMN/cZcVS7cRKizk
	 ZSPcFtKpf/ZYP0VXsSjRAdfWavfT1pZn90X4HqZVkWhU7EEkAMUBXzFo+tdx/unIgKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=f6L55/RbaJ3smpt9qLKGW/waSSFGUX0+URTLDC9PQCw=;
	b=QhQVbVKfy1N/FuGhCPlst/bVZ08MCbzu5s4fWrOq2DbKI/rcRL41Y3br4V+gs3NK3InD
	 BQRqFWbCjZ1xPsvmoBDxuhgJtUDMQm7nBIltJnMBMXPCDAv5XGxKOHAzEjHv+zbnAd/PR
	 QpFjRRk9LohUSSSYOKurtE9crzA54/NfqS0YtdSzfbU31I0QaivpbK4RS6/6MTAemTa1p
	 sUUvfBmO5tw83zPox6fLKJkB6auBOOXNm1EVmQUMhHdJUYw7SpXkhsEptjyPB5DD+od5b
	 FwZTz3X4bArvfjz1F7Kn7OWApekEPCw8a+3du0/gR6Q+5Ncob8kr3TYAYTuXcQW+xtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYL1VtZ2;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7C3606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7C3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYL1VtZ2
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b244fb7fffso566812c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773893; x=1794378693; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f6L55/RbaJ3smpt9qLKGW/waSSFGUX0+URTLDC9PQCw=;
        b=GYL1VtZ2V0hBldYCRsaZhHLZ0HPb7eAwAArQeRE1tu1TgLG6Qfq4splnmuNSskKwEQ
         FeDRcbQprDCENgAVO0Bgpqm0pnTWH73F8lfn+PnNiT9me0h+7c766xFp4xRtF2WTPMXT
         9k4DSseKLrBy62xYtwWONUeSXx+QGJo2paKxdqn5caKR/nV46TrN9y0zCjoLVLgMeALk
         z/fTBscw+/q1XxWC153FmdeYl93a2wokPVE7sdDPeNLuPcq3N4YunnX/YVWJ4dYcsTUz
         GmIS1pYJJ0uy7/hyfg3NZEo5JAdyIJo3eaqHxx0/AH+hgbksNLlC+Q5yYozhhBpgc4uL
         CPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773893; x=1794378693;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f6L55/RbaJ3smpt9qLKGW/waSSFGUX0+URTLDC9PQCw=;
        b=v3yscWScsQ4A5yVklNKCL73hy+A925k7RjVbCsAek65eEfzo19CWkeZ2fbQeqvzYoD
         MGlqMltN+kq2nLZM5y6iHatXlpL3MdaRCROuxKphXebmZ196E5Wy0uAo6o+KoXl+UGXk
         SMbNG0MMgVYlezyH4YlM5tjPHJT+aWB2F6ML5uuclSCIStY5Y5d7TO3uVsxhtJ5Mo8b7
         Q9DFBwMn3SCH1Os1nsXMP1zzGRqiaAk7oxd7wtqtd6GQ0ec/O14m5Ojex5svHzam6YEd
         PWwOpG31L6lGuXF2aQpCy4E2xtHXrcN8qF+qXtUC/LRNc71HTazZzRvGDFUC6pY3PNyD
         j3oA==
X-Forwarded-Encrypted: i=1; AKwUvBwcoLuWilf5HPDdv1T9bcFj0efgJOvWxc2X5gu94dvwJCCoM0JeFqRWAKhKO2MgxBDtZOCfTacqb6d2asA=@vger.kernel.org
X-Gm-Message-State: APuU4Z91Upy7WRF/pgMrcEFOqzXGCuOQmljxJt9ib9ancrx2w98Uu+Mr
	GV/Qsd64gGPxQjWRXF1mbvjo++yRuUlZjnPn4g+VTfrEXsXr+b85t2IkHpDOl4S+ohu5bA==
X-Gm-Gg: AYBFou2YFVpZ5tLPdNC/5WG+Q5/Sz6Edi9zyK8GPWsuAoicOyQixU/cFy79/slvnKM+
	j9ugx9tvcfl4GsP9HPyhmkcrEi5kDXIZhDt/q0ja7SGX0X2zxC3nvbCV9yoF6iRnRgy/ajo7vfu
	DCNf0CMnShbzRG6NiB07KkWrLIsY7SBvc0eMwoAY97WFzL0566J6+RLBOo5q/bObhWByEFbDKMy
	IEFaFezPbnyxEXGKKfwhNAX67QwlDDwR207sv6nVE7DwdifVSRm65J8xtQsia8Qsw0Q9VtaVBZa
	soWRj3hvjk2Dqxzi0zAfMPGuOeVAw1kPYZ54T6Xuvxgb6BcwHpuGill3TXRiFVe+VJAauCV3fUd
	R3k5oRn2h4Yr1iW478raWuBuWqW/6T9se1bBfJ+Z/vVc7va0l5LQE3bdZoLuMLgS48+/nTCkjrX
	kWN/ve+70uxMDn7Iw+RF2/iDsMCPjR/B9mxrHRms28Y2jZtv3VMptTs0gPAHdVij85Do5IkNq8n
	J/H1QN0OOzPTvBN5XyPC35M0utOhoxGFgELrWsz39HfSKG8RnN1p1KkBTzu+SIs/q8G9/nzmp1X
	RJTtB9MCSY66mC+gqPmMYiH9
X-Received: by 2002:a05:701b:4193:10b0:15a:4155:3d9d with SMTP id a92af1059eb24-1ac5da76f61mr23283133c88.31.1793773892649;
        Tue, 03 Nov 2026 22:31:32 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c69c3fsm4558998c88.20.2026.11.03.22.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:31:32 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Wed, 04 Nov 2026 01:31:28 -0500
Subject: [PATCH v2] nvmet: drop the extra RCU grace period in
 nvmet_ns_disable()
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
Message-Id: <20261104-bug-nvmet-ns-disable-rcu-v2-1-b158a59318ad@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD/R6moC/3WNQQ6CMBBFr0Jm7RjaIkZX3sOwKGUKk0AhLTQa0
 rtbSVy6fC/57+8QyDMFuBc7eIoceHYZ5KkAM2jXE3KXGWQpayFKie3Wo4sTregCdhx0OxJ6s6E
 qqe0sVaKyFvJ88WT5daSfTeaBwzr79/EUxdf+oup/NAoUaO1Vm0st1U2qRz9pHs9mnqBJKX0A4
 uuLycAAAAA=
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

nvmet_ns_disable() kills the namespace's percpu ref, waits in
synchronize_rcu() for anyone looking the namespace up under
rcu_read_lock(), and then waits for the ref to drop to zero.

Killing a percpu ref that is still in percpu mode, as the namespace
ref always is until then, switches it to atomic mode from an RCU
callback, so the ref can't drop to zero before a grace period has
passed since the kill. synchronize_rcu() thus adds a second grace
period in a row, about 4 ms here, and disabling the namespaces of a
subsystem one by one takes about 9 ms each.

Drop synchronize_rcu() and rely on the wait for the ref to cover the
RCU readers as well.

Disabling 64 namespaces through configfs, median of 3 runs on each of
two boots per kernel:

  host connected  before          after
  none            588 / 590 ms    409 / 409 ms
  nvme-tcp        617 / 619 ms    542 / 511 ms

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Note in the comment that this relies on the ref staying in percpu
  mode until the kill

v1: https://lore.kernel.org/r/20261103-bug-nvmet-ns-disable-rcu-v1-1-ff7ac5623923@gmail.com
---
 drivers/nvme/target/core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index a8171b88035c5..50486fc3cde8b 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -669,13 +669,15 @@ void nvmet_ns_disable(struct nvmet_ns *ns)
 	/*
 	 * Now that we removed the namespaces from the lookup list, we
 	 * can kill the per_cpu ref and wait for any remaining references
-	 * to be dropped, as well as a RCU grace period for anyone only
-	 * using the namespace under rcu_read_lock().  Note that we can't
-	 * use call_rcu here as we need to ensure the namespaces have
-	 * been fully destroyed before unloading the module.
+	 * to be dropped.  Rely on that wait for anyone only using the
+	 * namespace under rcu_read_lock() too: the ref can't drop to zero
+	 * before an RCU grace period has passed since the kill.  This only
+	 * holds as long as nothing switches the ref to atomic mode before
+	 * the kill; bring back synchronize_rcu() here if that changes.
+	 * Note that we can't use call_rcu here as we need to ensure the
+	 * namespaces have been fully destroyed before unloading the module.
 	 */
 	percpu_ref_kill(&ns->ref);
-	synchronize_rcu();
 	wait_for_completion(&ns->disable_done);
 	percpu_ref_exit(&ns->ref);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-bug-nvmet-ns-disable-rcu-30ebdfe414ff

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

