Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423900;
	b=0Lo7PacNUHLRedOvtUGsvqCc2yM9fjH5C7KeNfZ4BVlystmCOTb5TQ1IIhbtVr8Ao68O
	 i58IdMWuGcEcP8VrNIA+Qjbe/HNbkr+Htfok6U81IbFAuCKJ1jzsHqQtwujsNGLAb1DXA
	 v+3v59axm7QahtzUSCgEpWJsV6bTQugP5B026fuWa1PHPk8nzH5LZTjdEJIsmojosEfPB
	 A0YvuSlkyLibqJelFYH8n4D/xfSKPKTEXXabSwrMAzvi0NOI6f1vjlDbF3qehSHmmHT4d
	 ZHrxaZMVCM0GeMRe8EJ2kOBa0ujmHuL5vL2D+twlq/I0kK8SABILsERYareyKdkUxtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423900;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:X-DetectorID-Processed:Content-Type;
	bh=dIHSGJwO4MaD0BEGMvAK1k36oh9GDUMSkMyBc8UO4AQ=;
	b=mJ5GPkrhSV+w9Eowc2IAzZyr3fJGE6HOf8MAahV3wMcD2C4oVpYOkCGYc8StznxgVwdJ
	 iC9KsgcOjTG4kfEPmrUEceBMpGRyA50uBFdCG0cmfAw6jnmVmQMPuBgRT7jJ9Od33IEc4
	 34TY3Bwu42Vt0vG8MNXkZ0Lnk/ZPfp22ffif4un38mxTjIVG9xS6DU8R8VR43bFFGNirG
	 99YaIaFqzPcO/VFaFDMXXE1OwTntYKiCZPeIxcSnMWIzIYMQnKIw3JUrTrYIlSu1Ij4Gv
	 5JjqB0p/WEQl0xsi3TBxTluXBtTzymdL/7yTU9DblnY3R+BGfDPvLorJhI6acNowLQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UgmqvjTq;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1461606A899
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1461606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UgmqvjTq
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb9f760337so81089a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423898; x=1795028698;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dIHSGJwO4MaD0BEGMvAK1k36oh9GDUMSkMyBc8UO4AQ=;
        b=VMEsl7HMzttMxZCRXvyszAa2cyQWl2c3RBMmGAfow6z7Q9pfnUZHNIt5EhAghaofqf
         tCudz2wiM3TAD/Zu3tuSQjEOC/qLtmVknXbSGkpwj3fJYCrArnNXYy/qjkzzExFvyqms
         +7oozqtUn8N/RDneT0rl+hAowQnV0AyndV6K6Lp+sJzYsjR1HecrpQvAMp81hSxMHAwb
         ruyUQMIqHK8rXHdDSxoAzF9K+J2qAXdGWuoa/4nbnGYCUIhK0WOabpTaNEg2wEATI9s7
         Q+XInZI0xtgXKsNk/NXIfAO2HnJf3h7cHkIxKfSvENG357HSF8fkVyvn5tul+Qop8tFp
         rPQw==
X-Forwarded-Encrypted: i=1; AL+hErGW4hAk+6H0a3wVttDGLMHVFdNGKQNqkbvigJtwJ3Y3YTMi56BIct+/2BWXqWMgvu02l0+CG0gOC9ucpxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eZ77HYvNdeuYrPLoUjhQKZ3S5PhsYVd3Tsl0a4SXNUqT3IRyq
	fOQ1XeE+pgrxKj2yjPN8+ZtONIqpCcUJbeoaPX/2cD2ZX7nOdxqaSa/QaVNBkgeV0touyrfcFs8
	U2f7coVgCPsRnaCL3D0BXIY4kGR2VqEAgp1dKvB5Q8HDuJwnIWraYGJ/vasNoicHw47KHA+bL/D
	xAoROEHSCmp9bL9bGbqJ+vJcmCO4EAeapGPlizmylLVd115GFyoPL4A5WgrjuxIYzZWIzjjytTV
	Er9gj7hT3CwWw==
X-Gm-Gg: AYBFou3xRmJ9IrfS0hHRfk9/Wv679AABegPTyNDMIj1Qo/R6xUsO0RKLYptq3do/p4r
	M96Tf5TLt3U+P0w89h1Wu/2G4hdk9Rc43BViQ14uRlPWC+btfg8zBXsDTUEKyzlg+93MkKX348i
	e4SMn8n+k7o+kQfMSFbN+y1BWUdI6Ej588/97UxVtRx2r04sq/2A/RO7yjIIiK/A/TqOkPmnz3M
	AYQoowfRjoNL9JizRQNkjPgGGhHqeSwziKPW7iVEpLuuQj72KezAPV7vEB9dOI9nTvT7dFRGfXW
	En8000esiq1zx84LXkpTWwZ7kMvvAb8a7Ixcp1QjVT22CnCyQw9Xy0ESia6dIG2ojyrCa2lxkyC
	HrAbV2mI09x2cDh8eS2Gn6yHcekn4K3t56zuEYLwgNwEF0yQ424BRWBoSUMcJbGsxKtxCPbDgXc
	wXXT8D+W0HDs9VUpR9Xs7rwlOZ1BDb6w==
X-Received: by 2002:a17:90b:17cb:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3b197c93f45mr248591a91.15.1794423898149;
        Wed, 11 Nov 2026 11:04:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181fa190fsm1173926a91.2.2026.11.11.11.04.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:04:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b346e49674so2655557b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794423897; x=1795028697; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dIHSGJwO4MaD0BEGMvAK1k36oh9GDUMSkMyBc8UO4AQ=;
        b=UgmqvjTq8vSWpY0goNgqdZyxsnS47YTJjdNHyxCrSf3mVqMlAOgzU297ZhDgnTyv4G
         34OJOKt8hFD/RoZzUeU7zmGQDbBzJmVo2is3c94efk9SrQD1wDltKAHQ3GNgbRB+eZYP
         2OpxaM3FH95mX6uve3yF50DFMbMKneM0DNUdU=
X-Forwarded-Encrypted: i=1; AL+hErG2E5NLLBLuSYv/HIaIP5HwLYdttV595jo4mAu37cdrfbx41Ty13ayyVWLswUuKfpbwyt03nLdGhm5ovGY=@vger.kernel.org
X-Received: by 2002:a05:690e:1381:b0:677:d05a:4800 with SMTP id 956f58d0204a3-67c78cc3ed7mr210944d50.25.1794423896972;
        Wed, 11 Nov 2026 11:04:56 -0800 (PST)
X-Received: by 2002:a05:690e:1381:b0:677:d05a:4800 with SMTP id
 956f58d0204a3-67c78cc3ed7mr210932d50.25.1794423896573; Wed, 11 Nov 2026
 11:04:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Paul Ely <paul.ely@broadcom.com>
Date: Wed, 11 Nov 2026 14:04:44 -0500
X-Gm-Features: AclHuK_wLjUNY8t4gTVp9WORphVKxWRH6HPk9989tr1CeHDoOEDmDz7ghQ_MU4o
Message-ID: <CAEQnVQmsGhWwnpQW2KFRBbzu1x6nAz28SsQAGbgPJeButRWcug@mail.gmail.com>
Subject: Re: [PATCH v4] scsi: lpfc: Fix race conditions in ELS retry handling
To: Kyle Mahlkuch <kmahlkuc@linux.ibm.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mkp@kernel.org
Cc: msmurthy@linux.ibm.com, Hannes Reinecke <hare@suse.de>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f96c19066004de7e"

--000000000000f96c19066004de7e
Content-Type: text/plain; charset="UTF-8"

From: Kyle Mahlkuch <kmahlkuc@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
Paul Ely <paul.ely@broadcom.com>
Cc: msmurthy@linux.ibm.com, mkp@kernel.org, Hannes Reinecke <hare@suse.de>
Subject: [PATCH v4] scsi: lpfc: Fix race conditions in ELS retry handling
Date: Wed, 11 Nov 2026 11:47:41 -0600 [thread overview]
Message-ID: <dcea48dd-f76c-4bb0-9275-c12ef9bd78a2@linux.ibm.com> (raw)

This patch addresses a race condition in the lpfc driver's ELS retry
event handling that can lead to a use-after-free in the
lpfc_cancel_retry_delay_tmo(), where the NLP_DELAY_TMO flag is cleared
before acquiring the lock to check if the retry event is queued. This
creates a window where the timer can be rescheduled and fire, causing
both the cancel path and the worker thread to release the same reference,
resulting in a double-put and use-after-free.

Moved capture ndlp and clear evt_arg1 under hbalock while dequeuing
LPFC_EVT_ELS_RETRY in lpfc_work_list_done().

Signed-off-by: Kyle Mahlkuch <kmahlkuc@linux.ibm.com>
---
Changes since v3:
- More whitespace cleanup. (Paul Ely)

Changes since v2:
- Capture ndlp and clear evt_arg1 under hbalock while dequeuing
  LPFC_EVT_ELS_RETRY in lpfc_work_list_done(). A requeue by
  lpfc_els_retry_delay() could cause a NULL dereference in the worker.
  (AI review)
- Whitespace and line-wrapping cleanup.

Link: https://lore.kernel.org/lkml/29073ebc-b616-475b-bc05-384da09fbb54@linux.ibm.com/T/#u

Changes since v1:
- Leave test_and_clear_bit op and timer_delete_sync at the beginning of
  lpfc_cancel_retry_delay_tmo() outside of lock. (Paul Ely)

Link: https://lore.kernel.org/lkml/1c8a764c-fce1-4ce1-b797-47ac328cf3f2@linux.ibm.com/T/#u
---
 drivers/scsi/lpfc/lpfc_els.c     | 29 +++++++++++++++++++++++------
 drivers/scsi/lpfc/lpfc_hbadisc.c | 11 ++++++++++-
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index 6f6394a0047c..98d1824aefe1 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -4477,18 +4477,35 @@ lpfc_issue_els_edc(struct lpfc_vport *vport,
uint8_t retry)
 void
 lpfc_cancel_retry_delay_tmo(struct lpfc_vport *vport, struct
lpfc_nodelist *nlp)
 {
- struct lpfc_work_evt *evtp;
+ struct lpfc_hba *phba = vport->phba;
+ struct lpfc_work_evt *evtp = &nlp->els_retry_evt;
+ struct lpfc_nodelist *arg_ndlp = NULL;
+ unsigned long flags;

  if (!test_and_clear_bit(NLP_DELAY_TMO, &nlp->nlp_flag))
  return;
  timer_delete_sync(&nlp->nlp_delayfunc);
  nlp->nlp_last_elscmd = 0;
- if (!list_empty(&nlp->els_retry_evt.evt_listp)) {
- list_del_init(&nlp->els_retry_evt.evt_listp);
- /* Decrement nlp reference count held for the delayed retry */
- evtp = &nlp->els_retry_evt;
- lpfc_nlp_put((struct lpfc_nodelist *)evtp->evt_arg1);
+
+ /*
+ * If retry event is queued, remove it under lock and consume
+ * its payload to prevent double-put. The event holds a reference
+ * to the nodelist that must be released exactly once.
+ */
+ spin_lock_irqsave(&phba->hbalock, flags);
+ if (!list_empty(&evtp->evt_listp)) {
+ list_del_init(&evtp->evt_listp);
+ /* Take local copy and clear to prevent reuse */
+ arg_ndlp = (struct lpfc_nodelist *)evtp->evt_arg1;
+ evtp->evt_arg1 = NULL;
+ smp_wmb(); /* Ensure NULL visible before unlock */
  }
+ spin_unlock_irqrestore(&phba->hbalock, flags);
+
+ /* Drop the event-held reference outside the lock */
+ if (arg_ndlp)
+ lpfc_nlp_put(arg_ndlp);
+
  if (test_and_clear_bit(NLP_NPR_2B_DISC, &nlp->nlp_flag)) {
  if (vport->num_disc_nodes) {
  if (vport->port_state < LPFC_VPORT_READY) {
diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadisc.c
index 4c673dffa671..75457f19d4ea 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -840,12 +840,21 @@ lpfc_work_list_done(struct lpfc_hba *phba)
  while (!list_empty(&phba->work_list)) {
  list_remove_head((&phba->work_list), evtp, typeof(*evtp),
  evt_listp);
+ /*
+ * The ELS retry event can be requeued by lpfc_els_retry_delay()
+ * as soon as hbalock is dropped. Consume the payload within the
+ * hbalock to prevent reuse or double-put.
+ */
+ if (evtp->evt == LPFC_EVT_ELS_RETRY) {
+ ndlp = (struct lpfc_nodelist *)(evtp->evt_arg1);
+ evtp->evt_arg1 = NULL;
+ }
  spin_unlock_irq(&phba->hbalock);
  hba_pci_err = test_bit(HBA_PCI_ERR, &phba->bit_flags);
  free_evt = 1;
  switch (evtp->evt) {
  case LPFC_EVT_ELS_RETRY:
- ndlp = (struct lpfc_nodelist *) (evtp->evt_arg1);
+ /* ndlp was already captured under hbalock */
  if (!hba_pci_err) {
  lpfc_els_retry_delay_handler(ndlp);
  free_evt = 0; /* evt is part of ndlp */

Thanks Kyle - looks good

Reviewed-by: Paul Ely <pely@broadcom.com>

--000000000000f96c19066004de7e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
iId6lRoDnFAsEvnaOMvg29iSc9gZaFsMAV8NLrmVgatBLqETEHgQ4n1BrE2+pRoymE80Zf+Qe5W6
GF5zYMjxe2smznZoexz/BISo+5QDZaKZKtmoZ3ApyLjKz1G5Q2hUhmZWHvMu/eGSXP59UaUUmelW
ZlVs3E0h345YpaGuBNlquYm35nQ3ehYjm2jqaIh7F7K0+eF5TPjcMLpqnpak12xIx6BCxmFi8Oqu
Gb9+KrrAD+KPgqzjyZZxdVcCAwEAAaOCAdkwggHVMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8E
AjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxz
aWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDov
L29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EM
AQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3Js
Lmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIAYDVR0RBBkwF4EVcGF1bC5l
bHlAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroP
ry1QLdugI4UYsKCSMB0GA1UdDgQWBBTc34vK15RY7h33segpWeDeAloTGDANBgkqhkiG9w0BAQsF
AAOCAgEAb0hABkNonbsXXPrDOwB9B9lRtVhdRszakaT0zWubTTtHAV/XTebY1b4caUC2iX9AJvr0
XTJrFAiLtJ6eeP6yQOjD+rBprWauwPUzydJWEftECpX/lbPgZLBSHx22euCSnIm8HNj8o0bMi+Ii
plCW6kU56G1krQY0jrqDJCFgH4Wmp1TrKi36iVTIXyYLDtPOcSXe9hLmeUlQuL4nAoB8EsI45w4a
5Wi/xS7vGQLXzXAQ2SY6Yuseqhh+QcXvzeb0uVB54edC4HFrVX9DtFzHXoyB9s0C29MZm2zpFPNS
DgwnsmTsvpPuLELuuaJvIKnSHHR9FKrmQZbmz/i6KyBt0enmjNk7I7vAKQa8IqZxSrjvR6tYExiq
BP9ZuiXJnuqoPujFE7kphkUjmK76yv8904eZNflTvcEDpthD1boifOzT78iQ3fbuytR8LKx7tzGV
Ga9+dcLBcR/eP85Vmc9NW1frtO3dRd26+DHs1lXX96Em5AAlvBgDw8b1GfyEvfimBkxTIWxR3mBB
jAMkNKrfvV7NxS9AfcFu4fvxuBJc+t2FN1zBc8VyVyn9ZBeJ2DYS9uQ2x00QPXMHqVlAT5fBanmS
n1fgcSTdHEy1fzVZIAtM1XMIWy03bJKNBwUebgxHKHSUCZ7VSMHE4jyERMCqkvTxU6h4JJ7YzRrU
jhXYo8oxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgx9OiWw8dVRSIkn
L+YwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIIWT9huXa0u2S4Ryr8l85ZCmP+wh
7+HMb97vQ31jTC2+MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2
MTExMTE5MDQ1N1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBALOkze+CtrMf6SN2XezRYozl9ds+bczJFV2sLArr6USVynovH4a+3I2sBd8xwJke
Iz97HfrsPskllDv7pz2sPBTlHpmU01i8hBQyDLXgzShVAUbSiLewqbUEuMG6wVTm4GWf4P5LzDcm
gMZHDCM7MQKkKYSZOdnoZnxp7IixfL4Jdz7Uj4jbWQNo8YdpkEjiTpWsoSP5TjUuZRG9xdJutJYM
xcC0mxQ2o7ANrPIfnVhzyJLK57fGicKH6m5LwQNQGdZLuPrCk/p5LoqKU2BJsZ24ilQMM78O7LHG
65rYKWz6uduhs88+lUkRLKYjYa09gMYPq9f9T9Wx37I/HUQkVT4=
--000000000000f96c19066004de7e--
