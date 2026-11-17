Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922975;
	b=t8VqrR56sreEgd+2y4n81lohWVDapf0FoeWalaR227BoVcmUrURg9l1w/vzteI1f3XBX
	 XtnuI9N4jyivismAnVwcWo6IbTWbOQGz+NFfgUGKUePjn2DCN2t551CW6KYw1Gbb8RtU5
	 mWoq2nHUbv5r0rtzajDSsogvhCKJlGLzyHveEU8ZhrDxmEe2VMdWtGcIc7n9TemHmV5Jf
	 dN0isX9KinmISz0wEkk+QtM9JZGcPQpX7dQzbDn5SJvGJNllHt0cG+iZTkhUUoD6sH5//
	 WaihutAXXGypIopdTQisJUAKcArvqu8z+ZftgsUpdrYxQTRdd8+6fcReyA4zA3W3zrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=98hf7o6sENIjZ2nnw+8+XzBee5U0w+/7HJKNygujKZk=;
	b=RCJBc6bmpVBGoD95DGgA0ZJHCnBiaiEMs6VWYInCkh98Rcxr3hFHFP41K+7jfn7xxnyN
	 T+aFAmJwGAxskALIuzLtJBMdYTQ7gcP0V964Cat1iJRvHhXDWcnbBE2AwguV62OJ6ddLa
	 z1CFzE01VM1TT/j1Bksve/DrUN/UtYOWlZik6bX5EQB4ApqWKP48W/Gu+VUWVuLz43MXS
	 r36O+nk2TlEyn6i1+MbnK0zBpUJTTnwrTvzill5H1E4X3faFkflh1VamSL5bdVTaauyxi
	 I8ZlKznXU6FX1cpKQxTOhc0sdoyTrt1G1AW87UvUD0aWU9ZPxxhjMKhEUzGhX590qCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e5kO7d3v;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE66606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE66606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e5kO7d3v
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so2010713b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794922974; x=1795527774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98hf7o6sENIjZ2nnw+8+XzBee5U0w+/7HJKNygujKZk=;
        b=e5kO7d3vpCeGftURu9rgvuJyw8LNCn4mHE6VUG7r4vEd1uEAmksglQw/3GIvSIvpgK
         VDY6Ojv72n3WCDwr7soa3CDlbDaStpZsnrzvXm/SCGwIc8Ghrdgs4eATXrZsEj/cLRZA
         SohGs5Cv1ZxG0PUVib9N8WV23Cd9dPDmDuuI2IYqIrJ1QvLsGfoSQ4ne8f26ckB6AXzN
         X+2hRCFMb7pKCzQN4KZ9GYa7DbXprG2K2tkOsvH8tRO2kBlYW47zX0NnKOxx6NG1kAEA
         1B7/DkJ7dBlgsND5ejQo7qDecB0g+iO+LEBGBCOmV5RNY7OCRwUtstN8cqRTAb22nwXz
         jOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922974; x=1795527774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=98hf7o6sENIjZ2nnw+8+XzBee5U0w+/7HJKNygujKZk=;
        b=u0ClXg7yx5vbOEdcTdJT4GuzzJnUtct/EF6waslTzxLiUh5gz5z+qij64d449ayvH/
         Pw6lv2cXFFVC5j8Zs7qc5MWbSxa9dyKrDpIIDw+rj28aKFacyt338oMUoegJGygWsibu
         w5WBV+ksO5oVm3GYnc6AEYEjojDV2zZ/AxMM9WdBaO1TqdyAQ1tDBki8WesUNm8iQO5X
         7+H5EAATjmABjvr3TpnLRx3+lLTh35u06EqB0C0ExPSwUsdJVMxnaOgpbu1xnWZfyBKi
         64m3k1zeI11MMxSYZCU8yg041iMuyhX7KGCuX0CjA1nOMv0iV6k4OsUf67WGxlvxtUQ7
         pd7A==
X-Forwarded-Encrypted: i=1; AL+hErHK1ttXNqPuj6RglBRbGL0E1upbgqfW2ku/8CIh2Z202pdh9KVSayigVrlOIlQ56ZTlabSNGEhWq+jLFJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9beL36b5d2ZVWuTL6C11fVU6Pz907xSZKdsxcPLJQDnwSYlBy3
	63/kAtuUvoK2Hu+B2d0Ked4XptqsFayLfsfDHDJM21SFB7tdBQzkmLs/76v2U5eIZ8s=
X-Gm-Gg: AYBFou23xbnfcrIELQGopfEUA8Afj4XkT6VnRYKaqSCM6jT3Y+bHVlj3+20bItHZwe2
	R+aTu9OSqbLBnVwi9iXWk/Oy/edLf/HqMbRtAAgXFcB8GSHtuuoF/lnvHxQY3aNOpdoX/DmShGY
	qppL8OPjzP4HQeVIs3wGutbhM76Qo9BtMdXvLvAc6ifGy9SASKBINTKhDlq3QXuuKx5deF36wiC
	cSj+vwrKhgJKKqUr28FoWiLeaGnEW/IHEN3Z5jUOqVFqlFdW2Xj/OhyJEkLxFfm2SivUv9JK4kw
	UysQ3PYu5DuuOwVTT9STE6SHVO/Mq8EReTsUlg6CmmMF011YsbKuYckylBRa9FHqn9iVvQJZZ6N
	qPwFLewraxeYzikqA+DdwdgLvDvhjbwITYJ7v3cX4eZfdGNxZJ2WuOhtbymAJ+aRoutAsT30+BL
	uep9J16aEwYRl0tD9FbAH7vbgz8A5KG3XQNibcDpvAuFsCZNIK02GQZcJf4r9f3LXswNFQhThHf
	8TPRVo92Rj0UQgpJ1weQH/npjDqmCw3LQWBxXmmA/ap8hajncaodxyS2f+eE2DTh1yCXpcEfz3J
	DjIMxQzi0XFuGkJA/8ysn0albnssj7CozLSOXhHKVlap2TnaQlJG8nsMOw3lPGmnxAPVz3dxv1w
	SKdKNG2IpOWWlM3G34ckbK67Lsjd9pP+HSvkrfA==
X-Received: by 2002:a05:6a20:2729:b0:3f8:d7eb:1ac5 with SMTP id adf61e73a8af0-3f8d7eb1c6fmr6375341637.55.1794922974209;
        Tue, 17 Nov 2026 05:42:54 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:73df:c7da:8e76:82c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8024sm5040714b3a.11.2026.11.17.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:42:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zilin@seu.edu.cn
Subject: [PATCH v3 2/3] scsi: mvumi: quarantine a timed-out internal command's buffers
Date: Tue, 17 Nov 2026 22:42:26 +0900
Message-ID: <20261117134227.2077013-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117134227.2077013-1-yhlee@isslab.korea.ac.kr>
References: <20261117134227.2077013-1-yhlee@isslab.korea.ac.kr>
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

mvumi_issue_blocked_cmd() gives up on an internal command after 45
seconds and returns 0, as on success, without aborting it on the
controller.  The callers then free the command frame and data buffer in
mvumi_delete_internal_cmd(), although the controller still holds both
addresses and can write into them when it answers late.

Put both buffers on mhba->res_list instead, so that they are freed at
unload, after the preceding patch has stopped bus-mastering.  The cost
is one or two buffers per timed-out command until unload.

mvumi_probe_devices() uses one command for every target id, so after a
timeout the next inquiry would hand the same buffers back to the
controller.  Stop the loop there and return -1; mvumi_rescan_bus()
retries on the next event.  Both -1 exits now share one exit, which also
frees the command the duplicate-wwid exit leaked (posted on its own by
Zilin Guan [1]) and the mhba_dev_list entries that mvumi_rescan_bus()
drains only on success.

Checked with a KUnit model, without mvumi hardware: a late write to the
buffers gives a KASAN use-after-free in 5 of 5 runs without this patch
and in none of 5 with it.  The reuse after a timeout, the leaked command
and the stranded list entries go from 5 of 5 to none of 5 as well.

[1] https://lore.kernel.org/all/20251113150934.758067-1-zilin@seu.edu.cn/

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 80 ++++++++++++++++++++++++++++++++++++--------
 drivers/scsi/mvumi.h |  1 +
 2 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 8d22d370d8608f..fe3f63a1088dc1 100644
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
@@ -1458,6 +1490,18 @@ static u64 mvumi_inquiry(struct mvumi_hba *mhba,
 	return wwid;
 }
 
+static void mvumi_free_dev_list(struct mvumi_hba *mhba, struct list_head *head)
+{
+	struct mvumi_device *mv_dev, *dev_next;
+
+	list_for_each_entry_safe(mv_dev, dev_next, head, list) {
+		list_del_init(&mv_dev->list);
+		dev_dbg(&mhba->pdev->dev, "release device(0:%d:0) wwid(%llx)\n",
+			mv_dev->id, mv_dev->wwid);
+		kfree(mv_dev);
+	}
+}
+
 static void mvumi_detach_devices(struct mvumi_hba *mhba)
 {
 	struct mvumi_device *mv_dev = NULL , *dev_next;
@@ -1474,12 +1518,7 @@ static void mvumi_detach_devices(struct mvumi_hba *mhba)
 			mv_dev->id, mv_dev->wwid);
 		kfree(mv_dev);
 	}
-	list_for_each_entry_safe(mv_dev, dev_next, &mhba->mhba_dev_list, list) {
-		list_del_init(&mv_dev->list);
-		dev_dbg(&mhba->pdev->dev, "release device(0:%d:0) wwid(%llx)\n",
-			mv_dev->id, mv_dev->wwid);
-		kfree(mv_dev);
-	}
+	mvumi_free_dev_list(mhba, &mhba->mhba_dev_list);
 
 	/* detach virtual device */
 	if (mhba->pdev->device == PCI_DEVICE_ID_MARVELL_MV9580)
@@ -1552,6 +1591,7 @@ static int mvumi_probe_devices(struct mvumi_hba *mhba)
 	struct mvumi_device *mv_dev = NULL;
 	struct mvumi_cmd *cmd = NULL;
 	int found = 0;
+	int ret;
 
 	cmd = mvumi_create_internal_cmd(mhba, 64);
 	if (!cmd)
@@ -1564,6 +1604,11 @@ static int mvumi_probe_devices(struct mvumi_hba *mhba)
 
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
@@ -1588,17 +1633,24 @@ static int mvumi_probe_devices(struct mvumi_hba *mhba)
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
+	/* mvumi_rescan_bus() only drains this list when we return 0 */
+	if (ret)
+		mvumi_free_dev_list(mhba, &mhba->mhba_dev_list);
 
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

