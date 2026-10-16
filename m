Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D88C481234
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166108; cv=none; b=Wyxdy7RkEWLVCAsvLYyyqSRXj2tWflwn13scxJtJ1UZSbDtpsPsgbq0IzitZMsHkeA7eEcS6MtksK99aYVOSphY//ZdH4YZrZ2xR9V9/2OgJ/9b/TQHfIaFw4i9tnBrQWsJroDu0Tz2eVhc2uRKr2s1JafR6m5xpzfyzh+t8lrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166108; c=relaxed/simple;
	bh=1aZ1Hbx0leHFN1nuRH3mHqgwJWSeWWZ5qKC0j/9xtH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VpDQbDMfTg/gUIEDFojXmk5L9TNrb1AbH3UzbJnWfU7LsgXg094KGBWMq49XpltRAsnRuAKw6VvhyjAxIxjzxMkoEdo9rpMLPDWRxr+KHIQ8g6eucVKDrhJgzpWoWmFv5zhTs41TIRjKMUufH9e+kfuI59Zqjy6Dmm/DCsnscfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=tD12J7Yk; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="tD12J7Yk"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-884062f3296so44137b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792166106; x=1792770906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nMO90+ihrPi/+vHsOKHFmp1mDYdajMoYewWX5BF1cA=;
        b=tD12J7Yk/r4meH8cGhlvVVP2jtM2ApCsIbHEyZBYlB0RvMyK0VOFzFs58KlPL6yCjY
         PCjn/ce2oHCjYhSS6zEmlcVG2EIDKCXdVaPKsFY7zlZMYnQjDaUmFxu9M8uIt3O8TpjX
         haAoL0tWthESh3I6cGyCoLwS38FZrJe1E/wIl/5/EDqxxtuI4HPQEZz/NHJ6kp7y0Y6l
         KGj9AW9pKLQsZEpns9hIfQJqBtXEkK+cqcZ2u1QNZPZRrtmo69yMcsML5a1ea40iQ93M
         k0RtuqmVSuU+Ptp87fLuyMwY5wNd8oCUFUt9aL/77PPm4CJulF6hpsvZxZuIjyTsfWc1
         cGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166106; x=1792770906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+nMO90+ihrPi/+vHsOKHFmp1mDYdajMoYewWX5BF1cA=;
        b=mwpcAc54Ew2NS+lC4upFO9hyWXBsIPZD85m9zh5cKcc7uriiUEgRXVoT4icluCJNAx
         YpXDGnALwYP9YCq/WwfaTFMobMOLA6nCC6XOJOYbG/5m8CascvWZj/eiW0o2GBRgPruc
         EfdRcpNeoMbUxjcdDA6dKFWVj/2e76sszhdPCbR/nNI4MI/51A6ys4Evy0oqqBIn6qD5
         9Lupur8CbM0tPcwsonfGprOK1DSzm7Apue2+GJf9j4nJCT00hCvppQCyl9S663IWewP9
         KQn7Qst34uR3zc/UQhigsY6GkhuWZu3IgaOvQ7d8VKZBkoTd3+Y3ZYyvcW1LvHPg9mgT
         dmQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlBPlO1gUQU24ymkUNpPlhUwCHwVXEUuqlie2wVgciiJ7jMAy2Qj1XgZ2llm7emy/nzhxHyg0x/qh/k1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEPv+/sdkNiUd/0FbTWUcVYXN3uGv41aLVzntb+lOVVkSbX8+6
	V+t97uDvYaYOsX5VCHebY3PbtR4dtokuCBnEjRXuy5V5WqDN5wLsO8YqkSryELQFRgItyEf7Ook
	BSwZ3
X-Gm-Gg: AYBFou190ta/AxzP26zi3kjLV1fXVgzzpAF245QjwYVfbTsHWA/B2HGU1EnD10J7vzY
	7s/gBcOOO9wKFM8CwHzDDcU/N1qbypN6iFW6IhuoSeGk29ii/5WNSSOWs8yxTRGo6nLlEI9eMOo
	lKtXu1CjXUCtZuhvXg1Aa/KEIkBREI/Oa+Tb1LkPgN+IPkt/5mqcq0KmzTTK5qelkeW++ymNRfy
	iosuw51Dorhwdn7Xeya/ajorgB4qLHaN6CnxhebmGp58rRsXT+MX4Ee4Z3WsYdze4CS5bgHpnlP
	cuqI9WLWQ/J1F5vWn9c9HU6fijcFoBs9/iUSWGdFlO15rkO81dWOihHOR85XD27KsbJTucUFnd3
	8ljty029/zFyVcLLqIATb9JFzOEI3Qvra6tjXwt1tnYWRiWkYdoOiqgEprs93sNw93K2o1IBQVN
	f94o/bMWKfITuCrz7zKQAnguy3q7F8hsTQOBqvtbStZ09jRoPUUrIEeYEP9xzPqDi5MRpbrs3kE
	OIVs+BfNRwwvNajFWm6Nw==
X-Received: by 2002:a05:6a21:2d46:b0:3e0:e242:5ff with SMTP id adf61e73a8af0-3e16bec70c6mr18933541637.56.1792166106456;
        Fri, 16 Oct 2026 08:55:06 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:5e7a:332f:f584:a3d8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65ab63cadsm983076a12.4.2026.10.16.08.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:55:06 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v5 3/3] scsi: bfa: bound the RSCN event list by the received frame length
Date: Sat, 17 Oct 2026 00:54:41 +0900
Message-ID: <20261016155441.1607196-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016155441.1607196-1-yhlee@isslab.korea.ac.kr>
References: <20261016155441.1607196-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bfa_fcs_lport_scn_process_rscn() is given the length of the frame it has
to parse and never looks at it. The number of events it walks comes only
from the payload length the peer put in the frame:

	num_entries =
		(be16_to_cpu(rscn->payldlen) -
		 sizeof(u32)) / sizeof(rscn->event[0]);

	for (i = 0; i < num_entries; i++) {
		rscn_pid = rscn->event[i].portid;

payldlen is a 16-bit field, so num_entries can be 16382 while the frame
sits in an unsolicited frame buffer that holds 569 events after the
fchs_s and the RSCN header. The loop reads up to 63 kB past the frame it
was handed, and the duplicate scan nested inside it is quadratic in
num_entries, so one frame can also take the receive path through more
than a hundred million iterations.

The length that bounds this is already here. bfa_fcs_uf_recv() takes it
from the completion with bfa_uf_get_frmlen() and it reaches this function
through bfa_fcs_fabric_uf_recv() and bfa_fcs_lport_uf_recv(). Work out
how many events the received frame can hold and take the smaller of that
and what the payload claims. A frame whose payload fits is parsed exactly
as before; one that claims more is parsed only as far as it goes, which
also caps the duplicate scan.

Reject a payload length below the four-byte RSCN header it is measured
from as well, instead of subtracting past it.

The same shape is in lpfc_els.c, where lpfc_els_rcv_rscn() and
lpfc_rscn_payload_check() walk the payload length without comparing it to
the frame either.

The read is caught by KASAN under a KUnit fault-injection harness; I have
no Brocade hardware, so the frame and its oversized payload length are
injected, with the arithmetic and the loop bounds modelled against an
unsolicited frame buffer:

  BUG: KASAN: slab-out-of-bounds in bfa_fcs_lport_scn_process_rscn+0x1156/0x1750
  Read of size 4 at addr 0000000062270900 by task kunit_try_catch/19

  Call Trace:
   [<60935866>] ? bfa_fcs_lport_scn_process_rscn+0x1156/0x1750
   [<603b5d8b>] ? kasan_report+0x11b/0x160

  The buggy address belongs to the object at 0000000062270000
   which belongs to the cache kmalloc-4k of size 4096
  The buggy address is located 0 bytes to the right of
   allocated 2304-byte region [0000000062270000, 0000000062270900)

Fixes: 7725ccfda597 ("[SCSI] bfa: Brocade BFA FC SCSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/bfa/bfa_fcs_lport.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/bfa/bfa_fcs_lport.c b/drivers/scsi/bfa/bfa_fcs_lport.c
index 8c9d423129c07..49bcb76c118b6 100644
--- a/drivers/scsi/bfa/bfa_fcs_lport.c
+++ b/drivers/scsi/bfa/bfa_fcs_lport.c
@@ -5533,17 +5533,28 @@ bfa_fcs_lport_scn_process_rscn(struct bfa_fcs_lport_s *port,
 			struct fchs_s *fchs, u32 len)
 {
 	struct fc_rscn_pl_s *rscn = (struct fc_rscn_pl_s *) (fchs + 1);
-	int             num_entries;
+	int             num_entries = 0, max_entries = 0;
 	u32        rscn_pid;
 	bfa_boolean_t   nsquery = BFA_FALSE, found;
 	int             i = 0, j;
+	u32             pl_off = sizeof(struct fchs_s) + sizeof(*rscn);
+	u16             payldlen = be16_to_cpu(rscn->payldlen);
 
-	num_entries =
-		(be16_to_cpu(rscn->payldlen) -
-		 sizeof(u32)) / sizeof(rscn->event[0]);
+	/* payldlen spans a four-byte header and the event list */
+	if (payldlen >= sizeof(u32))
+		num_entries = (payldlen - sizeof(u32)) / sizeof(rscn->event[0]);
 
 	bfa_trc(port->fcs, num_entries);
 
+	/* the event list cannot run past the frame that was received */
+	if (len > pl_off)
+		max_entries = (len - pl_off) / sizeof(rscn->event[0]);
+
+	if (num_entries > max_entries)
+		num_entries = max_entries;
+
+	bfa_trc(port->fcs, max_entries);
+
 	port->stats.num_rscn++;
 
 	bfa_fcs_lport_scn_send_ls_acc(port, fchs);
-- 
2.43.0

