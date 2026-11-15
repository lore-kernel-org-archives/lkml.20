Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745333;
	b=bV3/wYmm85XB+nRCwppylE5TXCeBnaV54P4Xlh7Lhd48jfHErapM9TmuTU6SIrauADMx
	 8x7LX8MHPO8pCUhXkK7v5r8FkntUl/pdciCrujeP5PNPb3pdab7qUcNhLB3JsMUtUfbmI
	 m4g9NHwQN5lxuRixERhewLRumHhycYUCHGSQIQvMH06K++pvMlQxp+3mf0tSrt40GnfBB
	 5dj6df1V6lZbR+vkluAyvpYgmWX6tRlMsH7R5oC2ggpCMtGKLIDqs+Ta6CzS0YAH1r5P3
	 mQ7Jz6djYcBUVriIV2Pdqyy5XolA8DEGiX32DQIHcoO9z3Tjj+7RbBKF/SV2llZvDUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HnFrEsl8I7npZVMdzE8Y8MJP9QyyadjfnIuRiUPsFnw=;
	b=1bVtNv25hFbD0Mbgj/XrhYIjk1TZ4CpZPpBHEjqGeJDm7hYg9glfarjqMrfZcCklDUgB
	 y1FLd0ipOU0TehR8Dzzg7579P7JkBkIg5KU7qDtUWzSg1a07psyvef+dedr7pUcxNwUh7
	 gtev5PGvOJ6shze8phkl+sPSqpE3rk2+zT7y8RusdM0p6fToSl1P5SOuDhkfnJv74RvG6
	 2FkHS5sq7l2y1aM1c0q/YoKTDe90/biJbuftQoJZg85agcI/n0PZBcYQVs0NBn3heWSA9
	 0ydScOk0vZwg9ALe8LJsY/hpt/BrpLXyajitQyDefLeDx1IrkAu5Pl+j5xO23JnRf9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iW22mhOB;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B68606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B68606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iW22mhOB
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b2f59de176so3192303b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794745332; x=1795350132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnFrEsl8I7npZVMdzE8Y8MJP9QyyadjfnIuRiUPsFnw=;
        b=iW22mhOB1htbmDe7VHCu11P3SYPwXMUt7FjcF48Sx1v9lHT7g5ZcuRFd9hUQukg8d1
         Iab5zTb0ifBwJIFJfYK9GDsNZtiCuFi+netAH7vRESQUSksfUJph0v/oxNzC5sg4seRE
         MTBESnXp+3ofRCJ1kTK0kqhgP9NgE8B2WvlIGnKrCMQ+57ei1bDY0dHqpOpESvdi3YgB
         iKPfzLafoWo7EsVpwc1VFzqDDycusImnbWrHq522qeOo79Vnvcor88brUi1DZ4BHABFa
         aAoKCaRw+u/j235bElEOMQZu3ZwM+JNv/UoXqyu+F9lrO8KsyGlOv7E4akpU5q0bM3eR
         mmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745332; x=1795350132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnFrEsl8I7npZVMdzE8Y8MJP9QyyadjfnIuRiUPsFnw=;
        b=xupKT+qsUbNB/az1biifDv/c6y/hGoi90wVW/ZVmhTwIR5PvhPKbTJVnHeEu0MWQaH
         DZupnKc2H56zid+BJZ/mH09V6Urjm5C3VmjDNGcZaXLSrsWT6D5n1CsLPGtbpuCG97yT
         3iGWtGPNxwBkbY3rvBSaQ2ydZeVKVx9058ycf5E+5/bNxdtbo1xLlUgHU7CZty9WHfiE
         e1Pi60I85xH99ZvVe3t6zUr1qH6vqb+RMR6M7Vz1VLYu03oaGWtSzfItFFHCVVZ2Ac3r
         ye4GpfyulO8N7BHvUKd9wqBFZioHvbmxX4ePyS1hlq2+wgbIZbpvcV0VrIOyv7I+Lkzn
         laWQ==
X-Forwarded-Encrypted: i=1; AL+hErHhIL/berM8Z0XYWScT4WprsAnfcjLzfBsOm7aqTCP16Yei2DijKSvGqdJ/tvDpvShUGR6cdYnh9SG7XvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mXeZlwLLW16LtvJL80skWJzBHB+nzKkNxqIQqTl3fSqLtSuAV
	o+gmcSSu6hCKkh0lKjUaTEqigy9GVbv2Bp0TvQUvm2H8xI8ZyhoJEczknYp3i0/ipLQ=
X-Gm-Gg: AYBFou0CtYLlQ3zaKWRiCngchisURugEeiuJwgg13jEQhl3+ZmfXSfTBrgyzY7m0S0Y
	5Qj/Yxx/8SP/xmR+nm17YQ6WOIkdB07DZStW+vlK7R0q+UH3p/S9V79YSdORdWNbAWBXXVuQyoy
	mGH4kUNTcUIAbH6wsyLKr/ESsPqtvGxEtoFjW0hkH3OJg765dSNT2VvyYb2UsT06rcg13+J7asA
	TXM5Okmb3uXIT0NrK9T+8QIBZegpKKw/Z6Zm/fAIt0mRQzYEKDFs16oqNkb88EChMoEOIS1WnS2
	3AvoQJQEVJG8CNb3l70EgF8FFPQyGLvy89hkQeTK56a301mYCEUtRpiP83FQ4IJEmEBMddBxxJq
	GD3LlMsh18IHSQuH+GmL8wvW5Eiy+MNotQou4idue4SR4p0sbLRqilRbyGovrTAXhKVyaYZ31eW
	UtqtHUEUUC/gM6vpfZNW/qn++DfV+oBlXaY3U5GzzsrmLWMXP61hYqYzU2iwQAxe4/eUUmB0Cou
	P3vmZdfEdzlBTrTFmwMdL062RoPGGTG9WR1JLpN7fDKsI1Wrs6/0e0sobuaFmZAFsLBTsFeCGYp
	ACnG/9sjyyk3se4HBx8LvVODXTSrkSu9Yc3tVQ86Tp1FR7l0DtZ/OIgZ5WdMw6ZG/3BqCZCLmd1
	4lSRbpzcdPTs3s4kpWaManAgnxhxcVS5z5MZONQ==
X-Received: by 2002:a05:6a21:3d8c:b0:3e2:1160:6d20 with SMTP id adf61e73a8af0-3f7a4fc682amr5931006637.3.1794745332023;
        Sun, 15 Nov 2026 04:22:12 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:35d0:694a:1071:9bae])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdded58a9b9sm1220520a12.12.2026.11.15.04.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:22:11 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] scsi: mvumi: quarantine a timed-out internal command's buffers
Date: Sun, 15 Nov 2026 21:21:52 +0900
Message-ID: <20261115122153.1446810-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115122153.1446810-1-yhlee@isslab.korea.ac.kr>
References: <20261115122153.1446810-1-yhlee@isslab.korea.ac.kr>
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

mvumi_issue_blocked_cmd() waits 45 seconds for an internal command and,
if it has not completed, tidies up its own bookkeeping and returns 0, the
same value as success.  It writes nothing to the controller, so there is
no abort; the SCSI error handler is not involved either, because an
internal command has scmd == NULL.

The callers - mvumi_flush_cache(), mvumi_inquiry() and mvumi_get_event()
- cannot tell, and each goes on to mvumi_delete_internal_cmd(), which
frees the command frame and the data buffer.  The controller still has
both addresses: the frame as the source of a dynamic list entry on an
adapter with HS_CAPABILITY_SUPPORT_DYN_SRC, and the data buffer as the
target of the data-in transfer the frame's SGL describes.  One that
answers late writes into memory handed back to the page allocator.

Put both buffers on mhba->res_list instead.  The address and length are
taken where mvumi_delete_internal_cmd() takes them today, so nothing new
is trusted; mvumi_release_mem_resource() frees the list at unload, which
the preceding patch makes run after pci_disable_device().  The mark
cannot come from cmd_status, which is assigned from ob_frame->req_status
and can be left at REQ_STATUS_PENDING (0x80) by the controller.  The cost
is the frame and data buffer of each timed-out command, held until unload.

Not handing the buffers back means not reusing them either.
mvumi_probe_devices() creates one internal command and lends it to
mvumi_inquiry() for every target id, and mvumi_inquiry() only frees a
command it allocated itself, so after a timeout the next id is asked with
that same frame and data buffer, zeroed and filled in again while the
controller may still be writing to them.  Stop the loop there.  Its only
caller, mvumi_rescan_bus(), already treats -1 as "not this round" and
comes back on the next event, and once the controller has gone quiet for
45 seconds the remaining ids would cost 45 seconds each.  That also
leaves no caller that submits a second command on a struct mvumi_cmd
which has already timed out: mvumi_flush_cache() and mvumi_get_event()
create and delete one per use.

The found == -1 exit, where a wwid turns up on a second id, returned
without the mvumi_delete_internal_cmd() the normal exit does, so it also
leaked the command it was holding.  Give the function one exit.

Checked with a KUnit model, a fake controller that answers inline or
stays quiet, and no mvumi hardware.  Writing to the buffers after a
timeout, standing in for the controller, gets a KASAN use-after-free in
5 of 5 runs without this patch and none in 5 with it.  With one target id
left unanswered, the probe loop submitted 2 further commands on that
command's buffers in 5 of 5 runs and none in 5.  On the duplicate-wwid
exit the command was still allocated in 5 of 5 runs and in none of 5.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 58 ++++++++++++++++++++++++++++++++++++++------
 drivers/scsi/mvumi.h |  1 +
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 8d22d370d8608f..48652640afc188 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -177,6 +177,29 @@ static void mvumi_release_mem_resource(struct mvumi_hba *mhba)
 	mhba->fw_flag &= ~MVUMI_FW_ALLOC;
 }
 
+/* The controller may still DMA here; free it once the device is disabled. */
+static void mvumi_quarantine_buf(struct mvumi_hba *mhba, void *virt_addr,
+				 dma_addr_t bus_addr, unsigned int size)
+{
+	struct mvumi_res *res = kzalloc_obj(*res);
+	unsigned long flags;
+
+	if (!res) {
+		dev_err(&mhba->pdev->dev,
+			"leaking %u bytes the controller may still write to\n",
+			size);
+		return;
+	}
+	res->type = RESOURCE_UNCACHED_MEMORY;
+	res->virt_addr = virt_addr;
+	res->bus_addr = bus_addr;
+	res->size = size;
+	INIT_LIST_HEAD(&res->entry);
+	spin_lock_irqsave(&mhba->shost->host_lock, flags);
+	list_add_tail(&res->entry, &mhba->res_list);
+	spin_unlock_irqrestore(&mhba->shost->host_lock, flags);
+}
+
 /**
  * mvumi_make_sgl -	Prepares  SGL
  * @mhba:		Adapter soft state
@@ -298,11 +321,19 @@ static void mvumi_delete_internal_cmd(struct mvumi_hba *mhba,
 			phy_addr = (dma_addr_t) m_sg->baseaddr_l |
 				(dma_addr_t) ((m_sg->baseaddr_h << 16) << 16);
 
-			dma_free_coherent(&mhba->pdev->dev, size, cmd->data_buf,
-								phy_addr);
+			if (cmd->timed_out)
+				mvumi_quarantine_buf(mhba, cmd->data_buf,
+						     phy_addr, size);
+			else
+				dma_free_coherent(&mhba->pdev->dev, size,
+						  cmd->data_buf, phy_addr);
 		}
-		dma_free_coherent(&mhba->pdev->dev, mhba->ib_max_size,
-				cmd->frame, cmd->frame_phys);
+		if (cmd->timed_out)
+			mvumi_quarantine_buf(mhba, cmd->frame, cmd->frame_phys,
+					     mhba->ib_max_size);
+		else
+			dma_free_coherent(&mhba->pdev->dev, mhba->ib_max_size,
+					  cmd->frame, cmd->frame_phys);
 		kfree(cmd);
 	}
 }
@@ -734,6 +765,7 @@ static int mvumi_issue_blocked_cmd(struct mvumi_hba *mhba,
 	if (atomic_read(&cmd->sync_cmd)) {
 		spin_lock_irqsave(&mhba->shost->host_lock, flags);
 		atomic_dec(&cmd->sync_cmd);
+		cmd->timed_out = 1;
 		if (mhba->tag_cmd[cmd->frame->tag]) {
 			mhba->tag_cmd[cmd->frame->tag] = NULL;
 			dev_warn(&mhba->pdev->dev, "TIMEOUT:release tag [%d]\n",
@@ -1552,6 +1584,7 @@ static int mvumi_probe_devices(struct mvumi_hba *mhba)
 	struct mvumi_device *mv_dev = NULL;
 	struct mvumi_cmd *cmd = NULL;
 	int found = 0;
+	int ret;
 
 	cmd = mvumi_create_internal_cmd(mhba, 64);
 	if (!cmd)
@@ -1564,6 +1597,11 @@ static int mvumi_probe_devices(struct mvumi_hba *mhba)
 
 	for (id = 0; id < maxid; id++) {
 		wwid = mvumi_inquiry(mhba, id, cmd);
+		/* the controller still owns this command's buffers */
+		if (cmd->timed_out) {
+			ret = -1;
+			goto out;
+		}
 		if (!wwid) {
 			/* device no response, remove it */
 			mvumi_remove_devices(mhba, id);
@@ -1588,17 +1626,21 @@ static int mvumi_probe_devices(struct mvumi_hba *mhba)
 				dev_dbg(&mhba->pdev->dev,
 					"probe a new device(0:%d:0)"
 					" wwid(%llx)\n", id, mv_dev->wwid);
-			} else if (found == -1)
-				return -1;
-			else
+			} else if (found == -1) {
+				ret = -1;
+				goto out;
+			} else {
 				continue;
+			}
 		}
 	}
+	ret = 0;
 
+out:
 	if (cmd)
 		mvumi_delete_internal_cmd(mhba, cmd);
 
-	return 0;
+	return ret;
 }
 
 static int mvumi_rescan_bus(void *data)
diff --git a/drivers/scsi/mvumi.h b/drivers/scsi/mvumi.h
index 1306a4abf19ad2..e248dfc1dd1bb7 100644
--- a/drivers/scsi/mvumi.h
+++ b/drivers/scsi/mvumi.h
@@ -252,6 +252,7 @@ struct mvumi_cmd {
 	void *data_buf;
 	unsigned short request_id;
 	unsigned char cmd_status;
+	unsigned char timed_out;
 };
 
 struct mvumi_cmd_priv {
-- 
2.43.0

