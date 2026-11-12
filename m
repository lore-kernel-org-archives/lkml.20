Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511848;
	b=aMdrYBzRlq2KZT6Dy2rHRYhjZ0yahrbSWyTCzNZirkbHYK5onKExzD9nFHGTpmydpNhu
	 1dXEmECcjporzDxg46wA+kTqyOZjksqBS3cp5Q1bQiN3I3x9OH+RdkrHxuQWNysQ8VuPf
	 Ih5ZFlAHcZFLG8Cs4MAhIs8ih95fW2LWsEpCtXAbo5LEwb0tNtd0FWUuL5ozBP/Bkj01+
	 3l+y2MRLxZVw+gs5LkKVrkPKA4YX0z8OzealD6LS2bZ5pQsnfVBiSZ2fRtpSwS8nM/wW2
	 vmkYdgqcPtgzqzafBXg3yqUxnz8I2taqx6rCMU++dFkq571A3Pr87iygzbZF2kIV+iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511848;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:X-DetectorID-Processed:Content-Type;
	bh=qVVJxXr/B3tNVV8mQVpWFooHN9KtudtBOMBjZk8v2wY=;
	b=4geb6cgLC9EFYTGNcl2E6zZf9RSZWMvYqiXtd6mt2sCZMnrU/k53RvsJHpuOdkFhmVWQ
	 BBxbuTtPMhKlRNW2rcyZ7VAD2/xFJYxhcZNmS7yqnD3pPezbZG3VXclTU+dTHSVs4V5ax
	 EVogU+He0sohr+HyourDD+THbJDj4hpfKEjAml4hg9onz3YVO8bohwfKQOzK+YrC7Kjmu
	 NECpRGzUbTIt0rhND69yBW3z9yXqfioRvrBV/gpZJr7KUmhUYn6O12/AnXbH66p5ck34E
	 fLv+bbCHWgqAQdJbvXRRi/VnQQn7D+omibAqCUg9PISWOQWU6PIzf0AoYMahRDkhYBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="XI8G/3bN";
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C8B606A339
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C8B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XI8G/3bN
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93efc0452b5so7667985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511846; x=1795116646;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVVJxXr/B3tNVV8mQVpWFooHN9KtudtBOMBjZk8v2wY=;
        b=ZAnCzx2TEEKchTZoHYbZbiZW5VQNK9OoYAp0BqyDbjyAOUwrkbLhCWjLwzDY68Ikac
         WVYTnVxlousYFiUZ91NCsQ3qAQcCVnPn21/aLpL2dNTkwQbFq7U8aqDMzxTQvZdzjySN
         RcBmJT0DqKR5mORs6KvykEMaFJfDoVdcKFTTxEALJKDTuBHCq+nezh41EDiw5xVIv4Bt
         y8CBrLfRpxOGG1w8vlxiLH6WSNQyKrnMVknfFJin0nJDa1vUaS89CQtBLXpwEBOe8ztZ
         lIDXM3uaa/2VVg4iTfI8VwnM9eDNqGDdaQ2P9xE5ZGoZOJ+rK+YNCIBbdzR8H8Bzmnu0
         vZOQ==
X-Forwarded-Encrypted: i=1; AL+hErG8TVFEQgMJTeekn7AGksNCCaCYAUqUUTt7UtPrNZV09STs2ufkhrO3a3OShFTsr0I/HuIi8wlJYEQWzn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fX83c3eT+q8coyRlk9lw97d2usEbJEVJ19EhMF12sYnrwFe6I
	dSbOcyYKsH9TofRG3vbRytP6nP5jzx9JBHG3s39WzTfOGhM8h8+GERSK+WWOgPbxkovEFft/bJ3
	k5nbkE+51nuG85k6QBemkk+h7z3gVvGHQKDCkdRPjBwWgCp1IihwuVLZCbUDPcZoVyO4vWm0AI7
	RK+t5n58Yd9ChpuWVUb35+cWiCjkg9QYey0wVWay29Jh8ITFamD9tQ8cmCv0kRuqju8wl1iLk9x
	1xBXn2EOCuXbQ==
X-Gm-Gg: AYBFou2vCMdDO6dZQmrRKkg1ccjzbKxW8GwQgJH68js1aiUtRa86q0Y6MN3XV1rnay+
	YwXMTn1AabCGo5NK8gZnCaDYiNUBfgHlGIj9TQnrY/xW8ximlm6RAuNu0yzaO6+1WvEDyUVGPj+
	/PmhDIm6cRRuCWXmcBgekJ1rerPywEzlTbM2hfEgJEmWaNBdGFhAPxsqBHPVVbTq6hlw6wYAFtr
	8arY5CN9CmjviA87JMLnHBeH+01p5pktL5Bo4Rgf3+bEx+KEzLKTbErftbOAlgG/E8nqco7hWHW
	K1X0qm3DR88BVzUCYOVM6pD3uUHiedQTeGeDT1mJ62v2UeO2jwxcVHk7n+nzBVEv9Zz2IaYQ3IO
	qVIfd34EVQCtNTEbDdItYGPvRbaOVpNgl6sVaBAxh6MPxgxw1wXujBuseDDYfYDsdgrNBztEuQE
	WFwh+bgUKna+ycurqdHRKGat8o+syZLQ==
X-Received: by 2002:a05:620a:6848:b0:93e:c12c:fbd7 with SMTP id af79cd13be357-9494bcdb738mr58338385a.83.1794511845793;
        Thu, 12 Nov 2026 11:30:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9494c7b4f07sm2893785a.12.2026.11.12.11.30.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:30:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b3ad09ad82so3157627b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794511845; x=1795116645; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVVJxXr/B3tNVV8mQVpWFooHN9KtudtBOMBjZk8v2wY=;
        b=XI8G/3bNHOeZJEtz8/7mkFhKKZ3G8Dty96hmg13KsgCpk40htkx1a2D11VG6jDmTVe
         W9dJNX5JxH2CzSQGJaVBHrF1KYUe8MwKFRx2ue1zpgJLuyXxiddiEs6T0ZC5pAyqD5ZY
         wfkv3TGDoxaC5L82v/XbsItcUDv3Z/G+1xep8=
X-Forwarded-Encrypted: i=1; AL+hErGrGWP5hZFxjs7UuzZ1NucaNbx/fx739vw4CVTRdfKT7iHzSt06iqgnablkMcYKGWfPCSswf0hUfiy283s=@vger.kernel.org
X-Received: by 2002:a05:690c:386:b0:8b1:e7c:cdcb with SMTP id 00721157ae682-8b4aa2f2467mr4209537b3.23.1794511844899;
        Thu, 12 Nov 2026 11:30:44 -0800 (PST)
X-Received: by 2002:a05:690c:386:b0:8b1:e7c:cdcb with SMTP id
 00721157ae682-8b4aa2f2467mr4209227b3.23.1794511844342; Thu, 12 Nov 2026
 11:30:44 -0800 (PST)
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
Date: Thu, 12 Nov 2026 14:30:32 -0500
X-Gm-Features: AclHuK8qvtsUhRGpoxEHjjcJatUVeYSKkeBy25Xempb1AiARlIxRQbZr56iRC0U
Message-ID: <CAEQnVQ=01UU=J9fsdzjwT1N7376GxtknJtE1Xb11eCeOA=dn3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] scsi: lpfc: Test FC_UNLOADING in load_flag
To: yangxiuwei@kylinos.cn, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mkp@kernel.org
Cc: Nigel Kirkland <nigel.kirkland@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000016579606601959e9"

--00000000000016579606601959e9
Content-Type: text/plain; charset="UTF-8"

From: Yang Xiuwei <yangxiuwei@kylinos.cn>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
"Martin K . Petersen" <mkp@kernel.org>
Cc: Justin Tee <justin.tee@broadcom.com>,
Paul Ely <paul.ely@broadcom.com>,
linux-scsi@vger.kernel.org
Subject: [PATCH 1/2] scsi: lpfc: Test FC_UNLOADING in load_flag
Date: Thu, 12 Nov 2026 15:59:18 +0800 [thread overview]
Message-ID: <20261112075919.1247605-2-yangxiuwei@kylinos.cn> (raw)
In-Reply-To: <20261112075919.1247605-1-yangxiuwei@kylinos.cn>

lpfc_check_unload_and_clr_rscn() tests FC_UNLOADING in vport->fc_flag.
That bit is FC_PT2PT_PLOGI. FC_UNLOADING is set only in
vport->load_flag.

Pass the vport and test load_flag.

Fixes: bf81e9cd1767 ("scsi: lpfc: Clear deferred RSCN processing flag
when driver is unloading")
Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>
---
 drivers/scsi/lpfc/lpfc_nportdisc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_nportdisc.c
b/drivers/scsi/lpfc/lpfc_nportdisc.c
index fb8844c69491..7d53d3c88aa7 100644
--- a/drivers/scsi/lpfc/lpfc_nportdisc.c
+++ b/drivers/scsi/lpfc/lpfc_nportdisc.c
@@ -49,14 +49,14 @@

 /* Called to clear RSCN discovery flags when driver is unloading. */
 static bool
-lpfc_check_unload_and_clr_rscn(unsigned long *fc_flag)
+lpfc_check_unload_and_clr_rscn(struct lpfc_vport *vport)
 {
  /* If unloading, then clear the FC_RSCN_DEFERRED flag */
- if (test_bit(FC_UNLOADING, fc_flag)) {
- clear_bit(FC_RSCN_DEFERRED, fc_flag);
+ if (test_bit(FC_UNLOADING, &vport->load_flag)) {
+ clear_bit(FC_RSCN_DEFERRED, &vport->fc_flag);
  return false;
  }
- return test_bit(FC_RSCN_DEFERRED, fc_flag);
+ return test_bit(FC_RSCN_DEFERRED, &vport->fc_flag);
 }

 /* Called to verify a rcv'ed ADISC was intended for us. */
@@ -1619,7 +1619,7 @@ lpfc_device_recov_plogi_issue(struct lpfc_vport *vport,
  struct lpfc_hba  *phba = vport->phba;

  /* Don't do anything that disrupts the RSCN unless lpfc is unloading. */
- if (lpfc_check_unload_and_clr_rscn(&vport->fc_flag))
+ if (lpfc_check_unload_and_clr_rscn(vport))
  return ndlp->nlp_state;

  /* software abort outstanding PLOGI */
@@ -1794,7 +1794,7 @@ lpfc_device_recov_adisc_issue(struct lpfc_vport *vport,
  struct lpfc_hba  *phba = vport->phba;

  /* Don't do anything that disrupts the RSCN unless lpfc is unloading. */
- if (lpfc_check_unload_and_clr_rscn(&vport->fc_flag))
+ if (lpfc_check_unload_and_clr_rscn(vport))
  return ndlp->nlp_state;

  /* software abort outstanding ADISC */
@@ -2055,7 +2055,7 @@ lpfc_device_recov_reglogin_issue(struct lpfc_vport *vport,
  uint32_t evt)
 {
  /* Don't do anything that disrupts the RSCN unless lpfc is unloading. */
- if (lpfc_check_unload_and_clr_rscn(&vport->fc_flag))
+ if (lpfc_check_unload_and_clr_rscn(vport))
  return ndlp->nlp_state;

  ndlp->nlp_prev_state = NLP_STE_REG_LOGIN_ISSUE;
@@ -2366,7 +2366,7 @@ lpfc_device_recov_prli_issue(struct lpfc_vport *vport,
  struct lpfc_hba  *phba = vport->phba;

  /* Don't do anything that disrupts the RSCN unless lpfc is unloading. */
- if (lpfc_check_unload_and_clr_rscn(&vport->fc_flag))
+ if (lpfc_check_unload_and_clr_rscn(vport))
  return ndlp->nlp_state;

  /* software abort outstanding PRLI */
@@ -2902,7 +2902,7 @@ lpfc_device_recov_npr_node(struct lpfc_vport
*vport, struct lpfc_nodelist *ndlp,
    void *arg, uint32_t evt)
 {
  /* Don't do anything that disrupts the RSCN unless lpfc is unloading. */
- if (lpfc_check_unload_and_clr_rscn(&vport->fc_flag))
+ if (lpfc_check_unload_and_clr_rscn(vport))
  return ndlp->nlp_state;

  lpfc_cancel_retry_delay_tmo(vport, ndlp);

Yang - Broadcom has already fixed these issues and is preparing a
follow up push.  We were delayed pushing it because of our learning
curve with Sashiko.

Thanks
Paul

--00000000000016579606601959e9
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
L+YwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIFz6KKDT65WPo4Cq5NID4BlWd6x+
px5jgE+2pB4Aozy/MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2
MTExMjE5MzA0NVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAMaKN/gdTyM7bCK8n6RkM8SH1+tY81BJHHSZFvs3p104sqOoJjTozvbFypwHwLHd
W2hBAncjDKBKpttzb01wdCmDR1Offheqp1GygMp3yAVHgCX4aLoOZh4hgsaHS/zQi4gV9BYETJ/U
dH+dJ5DTMFfMHTJPU/GMA781CiC+NrJfcbV9al71rRGWHK4Otlurjc3gU++04A6dfIJW1GVkxX1Z
ul1diUWmLnqcTZy8fJp5g6GTNXaToIEqzTcR6nQ4PCGq98TKP+z3p/kDgYaat3Z6QkUcCtGQhOOf
eKxdVE/0X/mSX5zTtG6T+qLr0dTXi7cYhXQUgTVtyxMIDRCSjPQ=
--00000000000016579606601959e9--
