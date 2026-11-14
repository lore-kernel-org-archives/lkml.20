Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627511;
	b=3PKfev8N5D4QDa475EtXHKcoUIIZKvU2HlPMi3rkRIgAlJ/PwpivncOK/QaTxGW9/GYh
	 E4GuJr25kSdx2adKFXiXFcrV431udUFlFV+Y/7eiPT9V+tiRIzYByXLBHbXjlNHcOm2PX
	 9/AanYuNzr49srr3tgPiAjB+y/0iXTxlTQMafWGU4QKtJpbom7K0TYD5fYpfLP2Sb4hlU
	 nRasnrV03O5wZ7B/giPmyNKVitSMCeBgyjDxDv9jWTVhDtqDmZYlP4OpV1ojongG4hWNk
	 fF0OtpL9YasuLT6iWlPYH4EX8RirgRQEjkgWzuJXFKnk70BQj1Z+kq2pYXeP7kxkrYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RMKShAqwQ8QmOnYWmrOpdePr1A2OrFNasBeIi1/KCB8=;
	b=Njgk2zNkJOhZ/Zat3siz/Lss2cN0IIhj9rUPzsHxi+I6My95Nb1GLyD2K8+84MtOiV7Q
	 /0W0INb/yy+qALnur/sMetkBTB3m6TnXB2AA8SKERt4h3MKDe4+dqZbViSBB+c6AcreVD
	 ujygMZty9r2zpuLcyH/HlIuQI/yh0QgtnxgDhgmzCkbyAHZv5TtyH950a+YiQdfvH36mw
	 08CRVkP54mx2YOMeoQ6NzbRMO48PR4zmpcDjsWB6waBSP5s36FWJAYDro9XnSAj1Rn6wd
	 1fpsNBW6vqn6l+u3+tR2V2QNBW5nEKSMP30fbsqY44JJHt4aWfMythFWjqHLFv4P+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aXS2FxWR;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC317606A8A4
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC317606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aXS2FxWR
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so870686a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794627510; x=1795232310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMKShAqwQ8QmOnYWmrOpdePr1A2OrFNasBeIi1/KCB8=;
        b=aXS2FxWRXIHSwmbrmL55zAAKauX3ScgylHJ0IJpWAl6gQMpBqUXWe1DRpc3WYofGiB
         pZg8ShFxsCsJl2fLoH5NCUgnJZbI2WqRpSHIgWnf5pJnAzsD2l2It/A4LpvaWxBHeGPB
         bGwXmYP1Eis4LJiD3xmXATmJXHEp+suo/7IFXNeChwSKbpYLayY0huMf0oxjZ8wnQ9zU
         025HdC7wcStOhukc2E3ICNT1SJiA6c7Ga8Eu50bEHdQc+LYicDVOKIZj1VrjuwzeSj/e
         w8cgXy4WMgn1v65tkoS5GeNxu1g/Ed9nBr29hdQIP16P0AF+E/oX4vX75MjQnWHOkRmt
         l31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627510; x=1795232310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMKShAqwQ8QmOnYWmrOpdePr1A2OrFNasBeIi1/KCB8=;
        b=jX8uiEezIPftJFPA4bVwq5cG7YHaw5vVjkgNKOqXvTj4wzZOoyb2915AeMBxiqkbaC
         tDDtuBOV9xFkk+kEIcEoUMnOoQGpnlW2KtgTpTMWncg7Nj6iLjP9DwaY7h2O7oOXIg1w
         IuGDzD5mZvylxWfx7gDVeqYPr5Ae7gB3AQFjfSGl32lMEzl/sCPLNICUzuhVlkGGGOzf
         KZ3Y8nOtdOIzmh30iRjpwiu35Bn+PSs4MBhKcXavy52GTxo6UFN1nLLxEWZ7IZeetTCl
         GTQfFliHJ+r/pnhMUR/DDITwEirBMg3gNNdtSQOFpVdXZ2vIUqhUGKddPQQwbo+ZMwgs
         LYJA==
X-Forwarded-Encrypted: i=1; AL+hErGW2oYIb2f8VBc0yQV7dMGp6tVqVKKZhnvFYcDAILVJsFA08PzZSGnYZmowuFpc0rS/5MK/AGhMhf8ErkI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZVdFkubOGNpRJF9eeixA3I1eQXpellPjV2AynZgMb4AvG9/7/
	mgFbeoWwTW8TW3h9x2MjTmtsG+aRUmdRS1zBKGsBbN/eT3rO0XzEi7TLCzwX52hXBMYD16wTIYQ
	CfAC2zi+Q8g==
X-Gm-Gg: AYBFou1j7B4ugYOXncpHMjCJZhrToRJtsyr2ipJ+fNrpQKhBbFuaZ6DQoQwcoxttVsM
	SjhlbDMsPXMkF7rUZCUlBol/ZPDm/8LDW61C4PmxzR/wxm4cHz/90ekX+b4c/FH/ukz0/X1cMdU
	btZI5OPT0aNlVOU4Wfe333Wua4KYaAblpfh362ZWfAUuI0mAEo98RhtUmcvOAO5sRcGdtb4prXv
	SjhyKVc3zolwT3SBNSbkg1PNuh3PBhgxI4ZgDeK5KfMuPH55poKsIap7xRiZFoSdpjnx4pXt3N9
	WksRItd1PbUwf5Kz3UVVsWpIlphknGQfdip0o6DlKAiFgJv4DThrms8KT2SPKcs0uS9lVhsS6Yy
	eCOBgjJlPjjwUDqTaVL6H8KznaBa0e8f45sTRO5iRzt0UrhYQ///Mj3ddWrRysldORxfc7ilASx
	9yQVcKKv7AVM2B4sfnquiRgv06z/bH2jDk5o3AYaMqmuZjLnmxG1hPkDBD2Xban29JhvMMrU8/7
	Xl3mEyw+qJL8aSAH2qx7EGgcPjO55bCjkLMWGERrJDmx0DtExRzupi7Wy2oZTRmWAd9XCaH0KPt
	7X5vOZneDvm6KaZcUz90fWcbroEAiGXSds1pkmxDTWGLhtUIoJ0tGIT8qseNLOYsvfjYFOKk7G0
	iRyY+mrUYBRsnsgizeivOCtrrxhgW4PGKXMpt9g==
X-Received: by 2002:a17:90b:4ad0:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3b1b0b52e13mr4690294a91.38.1794627509809;
        Fri, 13 Nov 2026 19:38:29 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm3412380a91.4.2026.11.13.19.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:38:29 -0800 (PST)
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
Subject: [PATCH v4 2/4] scsi: arcmsr: check the completion index the adapter reports
Date: Sat, 14 Nov 2026 12:38:08 +0900
Message-ID: <20261114033810.549787-3-yhlee@isslab.korea.ac.kr>
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

On adapter types E and F the adapter reports a completed command by
writing its slot number into the completion queue, and the driver turns
that number straight into an array subscript:

	cmdSMID = acb->pCompletionQ[doneq_index].cmdSMID;
	ccb = acb->pccb_pool[cmdSMID];

cmdSMID is a uint16_t taken from DMA memory the adapter writes, so it
can be anything up to 65535.  Nothing compares the two.

arcmsr_drain_donequeue() cannot stand in for the missing check: it
starts by reading pCCB->acb and pCCB->startdone, so by the time it can
notice anything the bad pointer has already been loaded and
dereferenced.  arcmsr_hbaF_postqueue_isr() rejects the single value
0xffff because that is its queue-empty sentinel, which leaves
1024..65534 accepted.

Reject an index the driver never handed out, in the two interrupt
handlers and in the polling path.

Bound against acb->maxFreeCCB rather than ARCMSR_MAX_FREECCB_NUM.  The
array has ARCMSR_MAX_FREECCB_NUM entries but arcmsr_alloc_ccb_pool()
only fills [0, maxFreeCCB), and shrinks maxFreeCCB further if the pool
has to stop early at a 4GB boundary, so everything from maxFreeCCB up is
a NULL pointer.  Comparing against the array size would let those
indices through to be dereferenced.

Also clamp maxFreeCCB to the array in arcmsr_get_firmware_spec().  It is
derived from the host_can_queue module parameter and gets 64 added to it
when it is below ARCMSR_MAX_FREECCB_NUM, so with can_queue in
[961, 1023] it ends up above the array it indexes -- which the pool loop
itself then walks past.  With the clamp in place, maxFreeCCB is both the
populated range and a valid bound.

In the interrupt handlers, release the entry and step the queue index
before continuing, the same way the accepted path does.  Stopping at the
bad entry instead would leave the consumer index behind the producer,
so the adapter would re-raise the interrupt on an entry the driver has
already refused and the completions queued behind it would never be
reaped.

Measured with a KASAN build and a crafted completion queue.  struct
AdapterControlBlock is 17504 bytes with pccb_pool at offset 496, so a
reported slot of 60000 reads 480496 bytes in, past the end of the
controller block entirely:

  BUG: KASAN: use-after-free in arcmsr_hbaE_postqueue_isr+0x242/0x2d0 [arcmsr]
  Read of size 8 at addr ffff88800bf354f0 by task init/1

and the pointer it picked up then faults in arcmsr_drain_donequeue:

  RIP: 0010:arcmsr_drain_donequeue+0x27/0x360 [arcmsr]
  Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

A slot inside the array but above maxFreeCCB, such as 200 with the
default maxFreeCCB of 192, loads a NULL entry and faults in the same
place:

  Oops: general protection fault, probably for non-canonical address
  0xdffffc0000000003: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:arcmsr_drain_donequeue+0x27/0x360 [arcmsr]

Both are refused with the check in place, a queue holding a rejected
entry followed by a good one drains to the producer index and the good
completion is reaped, and valid slot numbers are accepted unchanged.

Fixes: 235090241c55 ("scsi: arcmsr: Add code for ACB_ADAPTER_TYPE_E")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/arcmsr/arcmsr_hba.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 255f1d898079f6..e635b76daae9a0 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -2677,6 +2677,14 @@ static void arcmsr_hbaE_postqueue_isr(struct AdapterControlBlock *acb)
 	pmu = acb->pmuE;
 	while ((readl(&pmu->reply_post_producer_index) & 0xFFFF) != doneq_index) {
 		cmdSMID = acb->pCompletionQ[doneq_index].cmdSMID;
+		if (cmdSMID >= acb->maxFreeCCB) {
+			pr_err_ratelimited("arcmsr%d: bad cmdSMID %u from iop\n",
+					   acb->host->host_no, cmdSMID);
+			doneq_index++;
+			if (doneq_index >= acb->completionQ_entry)
+				doneq_index = 0;
+			continue;
+		}
 		ccb = acb->pccb_pool[cmdSMID];
 		error = (acb->pCompletionQ[doneq_index].cmdFlag
 			& ARCMSR_CCBREPLY_FLAG_ERROR_MODE1) ? true : false;
@@ -2706,6 +2714,15 @@ static void arcmsr_hbaF_postqueue_isr(struct AdapterControlBlock *acb)
 		cmdSMID = acb->pCompletionQ[doneq_index].cmdSMID;
 		if (cmdSMID == 0xffff)
 			break;
+		if (cmdSMID >= acb->maxFreeCCB) {
+			pr_err_ratelimited("arcmsr%d: bad cmdSMID %u from iop\n",
+					   acb->host->host_no, cmdSMID);
+			acb->pCompletionQ[doneq_index].cmdSMID = 0xffff;
+			doneq_index++;
+			if (doneq_index >= acb->completionQ_entry)
+				doneq_index = 0;
+			continue;
+		}
 		ccb = acb->pccb_pool[cmdSMID];
 		error = (acb->pCompletionQ[doneq_index].cmdFlag &
 			ARCMSR_CCBREPLY_FLAG_ERROR_MODE1) ? true : false;
@@ -3572,6 +3589,8 @@ static bool arcmsr_get_firmware_spec(struct AdapterControlBlock *acb)
 	acb->maxFreeCCB = acb->host->can_queue;
 	if (acb->maxFreeCCB < ARCMSR_MAX_FREECCB_NUM)
 		acb->maxFreeCCB += 64;
+	if (acb->maxFreeCCB > ARCMSR_MAX_FREECCB_NUM)
+		acb->maxFreeCCB = ARCMSR_MAX_FREECCB_NUM;
 	return rtn;
 }
 
@@ -3880,6 +3899,11 @@ static int arcmsr_hbaE_polling_ccbdone(struct AdapterControlBlock *acb,
 			doneq_index = 0;
 		acb->doneq_index = doneq_index;
 		spin_unlock_irqrestore(&acb->doneq_lock, flags);
+		if (cmdSMID >= acb->maxFreeCCB) {
+			pr_err_ratelimited("arcmsr%d: bad cmdSMID %u from iop\n",
+					   acb->host->host_no, cmdSMID);
+			continue;
+		}
 		pCCB = acb->pccb_pool[cmdSMID];
 		poll_ccb_done |= (pCCB == poll_ccb) ? 1 : 0;
 		/* check if command done with no error*/
-- 
2.43.0

