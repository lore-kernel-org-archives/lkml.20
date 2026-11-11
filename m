Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408590;
	b=f5uaB/Gym2EGcQlkb+vC6hdxltt2eagzXOvvLes9Ldm2yfQc5g6uG7kpQDeKGa4seSsZ
	 RmvGbSXW9DYR8Yv0Vl86iTrx53HcwKUum8PXXol8HgWxqjsOlUOuzyt0RnOUJkdJRUGgu
	 Ykum7U6C3TbTk4oLIzRzA3kbEYRPru3elwpZLV80dgGQCpVMFtm66RH1Y80nTZxtylnLQ
	 7nfW8hE55JLS3aB9d/QRBGvzuax2+5ToMPaXB0RxvWF52BOBPmD2forFQwa9V+MCsTD8U
	 +mxS8xLwXYlysogzEkX0vZTY0t/EjibBjhAlPFb2Cv4/J2DuLtXrO5DWKILxNMfNZkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408590;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:X-DetectorID-Processed:Content-Type;
	bh=Uo/glTcWxTu8IZvGaKXTUX3s/26XRTyZzbkTK0svdWc=;
	b=wmOyU3BDJqjLkgsTAvew+fKjASc/OwgK6kaudqXZOEFF9+81RAX5LY6H/oCgYb67OYHi
	 AoFa6dQBPjH71YavvNI2mr4qJ2eUssDT3eb302CS0js/tCy/vRMQS5sH8uWNy8T/mO16l
	 UYeYXQ/sUzmfjOTck82EHZ4onxrbGiA+jK1dg8Spmtzt6FXGblqkjoeMkcVCM0LiGqZpn
	 K8W8KjcVZ2Cz96b696naaYbwnucMjXYk3qkmKwHmSIbmyZ1e6GdYlwuueD7Sw1OxegYTy
	 qOX8SutIOOTdZcgjWtVMueZ6MOE3zwt5pzWpzdyjCsBCh+S5odVltXr4faCwjDZA1+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FQ35gKp5;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844E0606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 844E0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FQ35gKp5
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso19601025ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408590; x=1795013390;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uo/glTcWxTu8IZvGaKXTUX3s/26XRTyZzbkTK0svdWc=;
        b=EowTdz7R3Ms1ZGpVd564BMpbAHW/eNttcQZuCT/HqB3KvaMj228ekojSw9i2eOcdO/
         PB1WrM2xmCldvZ5OyuaTdcyp0nxmkaeY/0/J+N7umyNpVN8usXMBJbYwXo9TSdsqiwEQ
         +hezEOnGafPQkPZ3c/t3BhIbngUxk7ETReTsL5ZKay1ZJlDrRmLRu0SIsHfJF8DdpQzq
         flGIv8j1XVSKn16IZED6d/wFuNQyXK4OT0zj9hSSGN7lTsPFjk6NzQgY4jyRL559ZfH6
         kiWSQBcfKgkM+URUlf9dFuPvDCycoEo4cUnwopDtKekM20mjBS0xfKH9eJNMrRc687V9
         mY7w==
X-Forwarded-Encrypted: i=1; AL+hErGzV6lKuysO2dAb0zbLqB0P1LNNIQueV0MinDB6Yc9ipf+LtMcxaVaLH+ZbBPcCVXo9r276QLJwcGBnoDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ElflR2wLOdTPZdjFp0LDNMi86u+pi4774a5zyCbIy6vjYHtTY
	v9wW9FJpFJe/qMJExodfzGTatJJ87yqWHPYunzyTSejwKaoVc/mjigbgv1lslJkbw4GbgcOTbwm
	llW/r5b3LO+BjvB93SLidLpDdvh0vWbrflMeSCTokKBBrrvqPQg/FnMK9XSeufUofMLcr8zw7bj
	NdmU2X/1r2gECdMkWj1qBVVj2WliB6cooVEO5Eb4KKTO/T0x8SjFesLTJjf4BwdSTGEeRW1ePVc
	xniokQgKmLzJQ==
X-Gm-Gg: AYBFou0Mifw7zDW4QYSu1lDtYdoAaaY3TzYFmmT3ixt8GAvDgcD/Z3XNZkIj9oiFVK3
	Ir+N6zmKq9rHI/cFNhHRdZxTB1GVjwY4NN2AkVJRpxsTuDiKA2NeiW+zosQvwZDSNVxVS8Ah7AE
	XUHLfxdV+xLeTG+9XkECJ80RXo1NLr10CsKQ07RuHC1vO4EbzwdEAXjwelCE4DYkDzFr6byAA3t
	g5YjgzhTyUswBrxsOxohVPnf4hxjlNbTVdp4tS3kUe4KGvyOgw+A1fVkPqD9wnBozuzxBpaoaH3
	uW6Wr/a/2EgIu3FiRzSuoeGU62eAq2nrQaPNhsKbEW4rsGjCP4mga5pN6Ym3wBhJmJbND4s/KIi
	A7JAb5h2hzbpAZGXKNpXTSiDs6DM4sAJDzm8qDJeaFPL36KvXjKw/HbR80fhL0fe1xMlImILH16
	MypURQUqd/Xs5kDJWvnb4+XfMwR2tscA==
X-Received: by 2002:a17:90a:e7d0:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3b182ec1cfemr2575869a91.21.1794408589581;
        Wed, 11 Nov 2026 06:49:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b182deb0easm878784a91.3.2026.11.11.06.49.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:49:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67c2c2c4e0eso4061107d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794408588; x=1795013388; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uo/glTcWxTu8IZvGaKXTUX3s/26XRTyZzbkTK0svdWc=;
        b=FQ35gKp5YlLdel+19zS0f5nP0iXsZpjMuLltAA3gGqjKaEVGwWNVBLFitzO1l+QhAu
         jMT/w9TtcOvjVG342ds5T0sqO+0FmdXtaAeZZeKuX448cMPYxoX4vVz9RRbehdaKTXtm
         8drS7zufNo8hSwg2nuWsrii2ywZ/XffsSh6eo=
X-Forwarded-Encrypted: i=1; AL+hErFbUrVap2o27IjkRLq5Ttx8m1VH6KR9uAMQcvHI02t6rgEfZLsCcS2KjkFPsnxbML+zZ3mo1NOwP3k7pu8=@vger.kernel.org
X-Received: by 2002:a05:690e:4803:b0:679:9971:e859 with SMTP id 956f58d0204a3-67c67f771b4mr1109171d50.50.1794408588192;
        Wed, 11 Nov 2026 06:49:48 -0800 (PST)
X-Received: by 2002:a05:690e:4803:b0:679:9971:e859 with SMTP id
 956f58d0204a3-67c67f771b4mr1109161d50.50.1794408587777; Wed, 11 Nov 2026
 06:49:47 -0800 (PST)
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
Date: Wed, 11 Nov 2026 09:49:35 -0500
X-Gm-Features: AclHuK8aT4loQ4gE6XyUczqV8eRFxYLJ9yRejRstRCDc9t3n5AOPuCZuj2X5ySM
Message-ID: <CAEQnVQ=uT+zMiF_mPD6j2g6qrpUL1Eufw=QNabJFEOz_wwLVRg@mail.gmail.com>
Subject: [PATCH v3] scsi: lpfc: Fix race conditions in ELS retry handling
To: Kyle Mahlkuch <kmahlkuc@linux.ibm.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: msmurthy@linux.ibm.com, mkp@kernel.org, Hannes Reinecke <hare@suse.de>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008041930660014e08"

--0000000000008041930660014e08
Content-Type: text/plain; charset="UTF-8"

From: Kyle Mahlkuch <kmahlkuc@linux.ibm.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, mkp@kernel.org
Cc: Paul Ely <paul.ely@broadcom.com>, msmurthy@linux.ibm.com, hare@suse.de
Subject: [PATCH v3] scsi: lpfc: Fix race conditions in ELS retry handling
Date: Tue, 10 Nov 2026 14:16:38 -0600 [thread overview]
Message-ID: <e893d431-79ef-4fae-bca4-38903fc8f49d@linux.ibm.com> (raw)

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
Changes since v2:
- Capture ndlp and clear evt_arg1 under hbalock while dequeuing
   LPFC_EVT_ELS_RETRY in lpfc_work_list_done(). A requeue by
   lpfc_els_retry_delay() could cause a NULL dereference in the worker.
   (AI review)
- Whitespace and line-wrapping cleanup.

Hello Kyle, the patch would not apply.  There is an extra space here
in lpfc_els.c:

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
  <=====  here
  if (!test_and_clear_bit(NLP_DELAY_TMO, &nlp->nlp_flag))
  return;

lpfc_hbadisc.c also has a white-space issue as well.
--ignore-whitespace allows the hunk.  I looked quickly but didn't see
it.

The patch still looks good -

Paul


Paul

--0000000000008041930660014e08
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
L+YwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIPXy7urNe8lHUCEgcdzJ+Lnb0HK3
9Sr78e7INL6+igfEMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2
MTExMTE0NDk0OFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAL/12k3REvakv3ClMBXwCrXk2zG/CQRETbcnS/iv9/jEkvI7S9tD2dD4oUBQiVAT
fKM9bepZti+U7wJEYTLca4dEqlz2UWhFIaQDss0WUvVKdwZF2f/MCxt/FMLlTzkhTy7eI6NQyoEw
Xi34LarEEHcNmJS3PCAb6vl7Aa1jK3cba6pRElhRvSyS3DjRZY7OhqOAKT6UFU5Lg+2/SZuGwGf6
AS6gmaVLiJjEtThJ+Xr19L4WYxBxptM3jQU3H5i7FZ9Tek4ZQQ5YG1aO3AN0ny/Ya0wjU8MWeUDZ
V/2gZQlWjyIr9fr4i7NK+j8pZsp5Cf3SVq1t0IW5C6a8GVHlEj8=
--0000000000008041930660014e08--
