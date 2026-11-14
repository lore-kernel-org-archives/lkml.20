Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627519;
	b=pOvxiIEHnbO8N9s1DksBOzUUlFGyBqDLtlpO+s5lr0rW/tIO0Fzpy+eqz7E4eJrTDFqs
	 Ir3Xuu6meXxhlAU6I50vDVY4wjkXVU1XQRU7Oha+YKquotCsbioq2UldZdHNUga3E7LSk
	 bDLl8AnPRApj/M8jebRz7pYCinCeXIggq85LXkRzI7lAFKNWLObGnPiC7zau99aRVY226
	 OW+5iYSKRksUDI/0lUbNhJyC0rjgN8l/HE1b3jck1tim6fG6ukLVCyWunsuI/wZ/ggF28
	 f7Ufqxfg8Vv2YKD9PSEOgujzY1EPBpsu140/yZI7jfQNp15M35lTAqcBtHa1L/XPXFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8ZrBMx2p46ztA81BaQoTlOSOcAkVM5aJlSZl64zAlIw=;
	b=FgC7Uf+MXrTwilgUl+a9iZXCo3AJUOcIeSGmk+GNqu8bLHZ/2/1rNXiGrrbOL4huj9++
	 XTihgP5F9gzBNDMNXFTLgN41kwV+FYtVr5DneisItdPsoA3KZxXcX5NxnuzLyiK6mTVa1
	 G78EIwz4ihhW9uQ1f+rMpKyHhTeYOhQOonGgjYn34LC6hY2q4fFE6DtESoEO+6MIhOhFl
	 7Nyw4UudnXUtMNUCpRHOj7iBGWUevJ67aDXKOSAwMZrdO+lSL86sEXA3i3Bk22i2aYGwv
	 IAnXnbyQC6jK29/pte7ISr3konwLZpgfYATMbNt7oDvK60FFOW9TVpOgV00c4UUTzaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mnWSqeFz;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF27606A894
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF27606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mnWSqeFz
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1817559a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794627518; x=1795232318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZrBMx2p46ztA81BaQoTlOSOcAkVM5aJlSZl64zAlIw=;
        b=mnWSqeFztL32vQilgOCnYjSde+DRUCNeW3taaZdjkJ9qYDI8azdkYW3bi2vzXFD5n5
         pA4vS+b7OAYfko9pHPIh8+JWSL4azZ5a3IkLvJvm0PRYMDSG70NJ90ML3xBQxDpBnwPT
         w5tD8I48+/kKU26RUx68dEnxAb86qp16wuF/nPaCgwE3OorylUtpEZ/QzDJCUY/Jlbu/
         0KAf9IqestjRGcjr2ttY8AHejFeGLC9UiRURGbNegn4/VHMGs1tc6aeVl8zvcKWf7FVc
         /1E5PclUS07MDltdrbQ9/Zqx8uc7VkBeFgbRqGAVcYQeFk+8IKbh4zvj3jIXru6b+eGS
         6BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627518; x=1795232318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ZrBMx2p46ztA81BaQoTlOSOcAkVM5aJlSZl64zAlIw=;
        b=lIQit5Cb7oOojlGNWR8z4RNvytps7ql3ycrvtIhCChdI8rPz9PSiRIqt2CJ/JMqODt
         f7SWHbO/S4qQxbN3caNUGK5f/CV2U3MUJ4UH95h5w+Fo19A+kiwKrRcYciG+vBFLLMm8
         P47wRk9tUB51uRpQLW6Thg+1SZ73p42t3OI6ScsrQaoxA1QAAC8kZueQxIGcethY3xa4
         pyqJYCJZR+BNbHdDs+SCOm7JHWdGHqwAO8zGvm5TYkZmdv7m5mhRAR8kAHXyeXtYjDs8
         UY86AWfkihNx15O/I50GhrqKmj9CR8hJAXPug21aePRXMd5I6hY0pwfuH2vCPJzeH3n2
         vdvQ==
X-Forwarded-Encrypted: i=1; AL+hErHFoW1Z7am9da8E4pseM9hddLRVoDQ/+nVeGBV+jfi/xCjDJolCsfEzxEPiax2unWrxZoYKAkDs0uPtWDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ojg6ci+InlFRum1byDhcQEFsiH7ecdIVkDCluRoyxXeL8Awvc
	MPbptKDSyqIHlqaGxL3xGFsCE0aCpJuW/Q2BO5Yv/RbCDmpwDdrMWxTnGIXqrh3GjfU=
X-Gm-Gg: AYBFou0j8XOvNYWdnhCXXQD42KOZ9PMR8iwXA5OIG4yxHsAEvINzBABRF9zzzsXfBrj
	pgON29iUfNrDrBYr7FtSJ4K+K02ihDEU6UE14J7hclRoI4Y//qJtLWig9BlTHOaLGQLq8OYtBnr
	VXOUyCpglDOpdn2r1YO6vEsNTImtm47seFoP231/byCadIrO+0k93M8EMgKdnJYsRQF8DdWIT9d
	0eUYhgRpRBq6cvK3IT6/qMfYaLjoOY5g4BtHEvl0B5kJ/Fo3yWsvIX7XeLtMLGNtmajAScBQjcY
	OAfFJwGJYQuxkwaM770gThnvI3oTU6HQG4Nz94Y+c072qhN/xgMw+oQhrqvzEvNQTzd3DZezEsn
	r/Kl0LEHrS0GG8R5ziGJUcYckI57POx9FVoRwaCier6KB8a/PFIEPM16SIqnCRweVNxU0r0xTOj
	rnESfU5zqa60wHHz0eQk4o2dD6B4JokQZHpTewFXb8lSUOkd1tEssm5yKHEaLnXs4YChHhGsRbC
	GkixNP7TWjVyJN38k4wCEcWVluOfrLkjrq6k+yq6B1hk8eCvnXY9VBssyP8Lf+zNTlh1Ed8d/AL
	MlpkL8AN01K64O6TaSgqY0s8YxkXFTkUIce9cv6EWkfGxZznxy0dFrpNdUKMptND/4p6dKYtkDX
	sbVawW7AKeDxAtNRwykoO6IXhg6gC6AdYH3l35Q==
X-Received: by 2002:a17:90b:4e8c:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3b1b0ba3320mr4120173a91.31.1794627518086;
        Fri, 13 Nov 2026 19:38:38 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm3412380a91.4.2026.11.13.19.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:38:37 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	thenzl@redhat.com,
	erich@areca.com.tw,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v4 4/4] scsi: arcmsr: serialise the type B completion ring
Date: Sat, 14 Nov 2026 12:38:10 +0900
Message-ID: <20261114033810.549787-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114033810.549787-1-yhlee@isslab.korea.ac.kr>
References: <20261114033810.549787-1-yhlee@isslab.korea.ac.kr>
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

Type B keeps its completion ring in shared memory and consumes it from
arcmsr_hbaB_postqueue_isr(), from arcmsr_hbaB_polling_ccbdone() by way of
arcmsr_abort(), and from arcmsr_done4abort_postqueue().  None takes
acb->doneq_lock, and all three read reg->doneq_index and
reg->done_qbuffer[] with no other synchronisation, so two can fetch the
same entry.  arcmsr_abort() masks the outbound interrupts first, but that
only stops the next one; a handler already running on another CPU keeps
going and nothing waits for it.  The interrupt side clears the slot and
advances the index only after arcmsr_drain_donequeue() has run, so a
polling loop inside that window reads the same index and the same entry,
and the startdone test both consult is a plain read: both can reach
arcmsr_ccb_complete(), which means two scsi_dma_unmap() calls, two
scsi_done() calls and the command on ccb_free_list twice.  It needs no
misbehaving adapter, only a command timing out as it is completed.

A harness that plants one entry and runs the two consumers over it, on a
KASAN and lockdep kernel, has both take it in 5 of 5 runs and none in 5
runs with this patch.  I have no arcmsr hardware.

Take acb->doneq_lock in all three, as types D, E and F already do:
across the drain in the interrupt handler and in the reset sweep, and
across the index-and-entry step only in the polling loop, which must not
hold it while it completes a command.  Types A and C read completions
from a hardware queue port where each read pops a different entry, so
they are left alone.

Fixes: 1a4f550a09f8 ("[SCSI] arcmsr: 1.20.00.15: add SATA RAID plus other fixes")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
This touches the two lines patch 3 touches.

 drivers/scsi/arcmsr/arcmsr_hba.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index d13bd0febb81ac..9b2a7053f1823f 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -1552,8 +1552,11 @@ static void arcmsr_done4abort_postqueue(struct AdapterControlBlock *acb)
 
 	case ACB_ADAPTER_TYPE_B: {
 		struct MessageUnit_B *reg = acb->pmuB;
+		unsigned long flags;
+
 		/*clear all outbound posted Q*/
 		writel(ARCMSR_DOORBELL_INT_CLEAR_PATTERN, reg->iop2drv_doorbell); /* clear doorbell interrupt */
+		spin_lock_irqsave(&acb->doneq_lock, flags);
 		for (i = 0; i < ARCMSR_MAX_HBB_POSTQUEUE; i++) {
 			flag_ccb = reg->done_qbuffer[i];
 			if (flag_ccb != 0) {
@@ -1570,6 +1573,7 @@ static void arcmsr_done4abort_postqueue(struct AdapterControlBlock *acb)
 		}
 		reg->doneq_index = 0;
 		reg->postq_index = 0;
+		spin_unlock_irqrestore(&acb->doneq_lock, flags);
 		}
 		break;
 	case ACB_ADAPTER_TYPE_C: {
@@ -2566,8 +2570,9 @@ static void arcmsr_hbaB_postqueue_isr(struct AdapterControlBlock *acb)
 	struct ARCMSR_CDB *pARCMSR_CDB;
 	struct CommandControlBlock *pCCB;
 	bool error;
-	unsigned long cdb_phy_addr;
+	unsigned long cdb_phy_addr, flags;
 
+	spin_lock_irqsave(&acb->doneq_lock, flags);
 	index = reg->doneq_index % ARCMSR_MAX_HBB_POSTQUEUE;
 	while ((flag_ccb = reg->done_qbuffer[index]) != 0) {
 		cdb_phy_addr = (flag_ccb << 5) & 0xffffffff;
@@ -2582,6 +2587,7 @@ static void arcmsr_hbaB_postqueue_isr(struct AdapterControlBlock *acb)
 		index %= ARCMSR_MAX_HBB_POSTQUEUE;
 		reg->doneq_index = index;
 	}
+	spin_unlock_irqrestore(&acb->doneq_lock, flags);
 }
 
 static void arcmsr_hbaC_postqueue_isr(struct AdapterControlBlock *acb)
@@ -3664,16 +3670,18 @@ static int arcmsr_hbaB_polling_ccbdone(struct AdapterControlBlock *acb,
 	uint32_t flag_ccb, poll_ccb_done = 0, poll_count = 0;
 	int index, rtn;
 	bool error;
-	unsigned long ccb_cdb_phy;
+	unsigned long ccb_cdb_phy, flags;
 
 polling_hbb_ccb_retry:
 	poll_count++;
 	/* clear doorbell interrupt */
 	writel(ARCMSR_DOORBELL_INT_CLEAR_PATTERN, reg->iop2drv_doorbell);
 	while(1){
+		spin_lock_irqsave(&acb->doneq_lock, flags);
 		index = reg->doneq_index % ARCMSR_MAX_HBB_POSTQUEUE;
 		flag_ccb = reg->done_qbuffer[index];
 		if (flag_ccb == 0) {
+			spin_unlock_irqrestore(&acb->doneq_lock, flags);
 			if (poll_ccb_done){
 				rtn = SUCCESS;
 				break;
@@ -3691,6 +3699,7 @@ static int arcmsr_hbaB_polling_ccbdone(struct AdapterControlBlock *acb,
 		/*if last index number set it to 0 */
 		index %= ARCMSR_MAX_HBB_POSTQUEUE;
 		reg->doneq_index = index;
+		spin_unlock_irqrestore(&acb->doneq_lock, flags);
 		/* check if command done with no error*/
 		ccb_cdb_phy = (flag_ccb << 5) & 0xffffffff;
 		if (acb->cdb_phyadd_hipart)
-- 
2.43.0

