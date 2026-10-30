Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367675;
	b=DdXNM8G15doqFH9ti80b2Wa/OU85Ly9pMJuUNCP3pg3F5B8Kt4fOw0SHYyDaXX8v1dkN
	 8pHXwQzAmb9fyO/1SchWF6vAnLIaWC/oMkZOsyjNyxRg8MELGpumP5ogkM8KHqNbs6Q+d
	 WvkAr6Dx+0vEsF0tIDeIFzNJgP1f8N+xCWtUgOZeZgIn5E+HD+h9iUgBSy0tq9QwXeWhx
	 EZpDjYmeQZqcWIo68kMEcHH78OnrwxcToBOCD9kdz6clGFJpnWNVg7tgbf8ioei3qxF1R
	 BB9BO1F7q3RYG5upQHBjRmkz+JNnyFv0vG4bnLyM+89ewUcqSLE1tQzZBvSjzmiL10g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367675;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:X-DetectorID-Processed:Content-Type;
	bh=AD4sVIqS4ra3m12i8ofJIzcMcLcN6oelcBaeTw0Dmyk=;
	b=cS70FxWYwCe4sFRHHIVPSuUr+6jpO2niSnNol0wJwG7G+ZMOYa7W3bBoQnh8r51DkFHX
	 gEIQIyAlSDEThvYrhP/+9w6Ht091Y4i6WjdBRAJfIF52YhrhGyjLI1C2ixg9FoK1az3L+
	 SGkm/p+sCaDTWR8EoXYWIZqbycQgHAWjxm21/RZgFKDySpZE9XrLvfSQpXvO27ZXkbHrn
	 u72DhHf3RZmNYqot+ybCMX0tQdaajfso7qmgiozNL87ezDJzmczs7Ivt8o8lJzEToYOfL
	 KaIbNxNaAxYIcY4CxUwA5Q22AuNR4qmeWuQoph1W5hippvIW8jHZ3vRwxpjMPdgWCgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OXCEslB2;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C851606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C851606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OXCEslB2
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so426058a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367674; x=1793972474;
        h=content-type:to:subject:message-id:date:from:mime-version
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AD4sVIqS4ra3m12i8ofJIzcMcLcN6oelcBaeTw0Dmyk=;
        b=prTDbLeu/n3T9XHcFw4zfIlYq3NgISgr9VurKgG01Ps/QbOPzyZsT3CWIZFa6FdJjg
         xN2NqPdxmkq1+nvc+/P0tY5zxcytDLbC+eyWl60T5cVo9+5j3hMAb8OToaJ8ABVOGEca
         yRx7AdfyvvaIsZICdyMlmq9TZY7ZbdoX9p6yM7y41am26Sc8+7ShelnKRGOe9/8dY+aS
         cqX+WL4Q/Jl0Xme2mel3/8b4mwQjDbC4M26aSOa/L5c7iB3g/RZutVS5YfhW8alzBpl8
         QDZALxRN8PjR0fsecClAIT0o+ooBaYXKkoQNSHKFe79st4CWE5gB1+Mww93atL/lYSRN
         6ehQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO5EjUaLJTjTpiwQbQNsXIedOk4e9l+RIABfmcaZqoWlWlPxQH5Bi4KY07kC1gVkTcUBKWq7UdHPlq2Hg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9VUSuekclbKVTFoUo4mcreY53pTzMFu6wgKtD1bOY7S4Of4ey
	RZFZZoSbJXyUGFX7fBwsSQ+Se7x0HM3Xx5GgKGzUKD2uUqP8/XMsC65OdFIJb34cBKSKhBeBohD
	xmtZImOkKPRKepLsQ7cSIhs57VmKUkBgXJd+L/7h7Z2vBIuckiQOSgxcWrF+igPKx+WZoFfeeHe
	ScmA9xiyhPrSAQDXyIkFQQMILv7xMcGFQ8SPYcl+ErZ0Qzcdmij24t1kjxXcTrY+ZAiiuDNj80g
	BaK4My1aL/GXw==
X-Gm-Gg: AYBFou0K9hzbzx1PWjS3Lawlvp36WAGALU8OWm4wT2Oh+iKjMhtUeb9lwxUdZyRxmv0
	5TtdZhj8DRjwuYgyMz2WGiCuOnDtG7EK6MrYywEVMLo3HzGIFmoDueWMFeZgaRPXHBuOLcvDhxv
	T9ZOjhXgbJcQ3X7Kn+Y9Ri/3z9orLYXEmi7JhriM2P2NPKY/oAy8I/sYUf7TnNYT9DayGiSrzoU
	LbQV5yHJvD0/TGVxguzOsrdHpoMy9R2mo7wut/ZvATslsx+CO1LkKo1OvGtiCtt7sCjx728+2ow
	8tMlxJil/Vnfo+Sg5/Km2O3m956bUbK1z+XTBilKkq9YuoLfr3hQhGdHZZeqFsdEaUXP3KK+VT9
	ZK0ehiYCUJwJ7oaaDg642IMkEC2lya25T7I/FxIx1u/R5oSZhd6E8QtPiRDrA5p8MCDC86XVhvr
	h6SH0orCCdA7l0rbwJW5QgTTEQdu/XRg==
X-Received: by 2002:a17:90b:2f0f:b0:3a7:9ec3:ea0e with SMTP id 98e67ed59e1d1-3ae8974a292mr1453714a91.22.1793367674199;
        Fri, 30 Oct 2026 06:41:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e6efe86sm4155363a91.1.2026.10.30.06.41.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:41:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67906c453b8so1510700d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793367673; x=1793972473; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AD4sVIqS4ra3m12i8ofJIzcMcLcN6oelcBaeTw0Dmyk=;
        b=OXCEslB2MCRTBWWGcYU61gjjJI8tUJSzJnRxCEyoaaic0hF6sVDrBzBW4n7LgIQiCL
         +iPlRjImbLBUduuBIQ+Y+zz/ubC4jgRBrWhNwbZtVohbQp4Mtz94UfQIA5bp3bpzQ+4n
         DO0msG0pDNFs3T+V+iTp9928qpwjBTPHslaQ0=
X-Forwarded-Encrypted: i=1; AKwUvByGhLabsK7folxheQabgJnSNMiDOlNg4xieDhNvITdHKlcaO0TYxKa6FDwq5/Y4RQNCfGK6JXtTp2+i8XE=@vger.kernel.org
X-Received: by 2002:a53:b703:0:b0:679:ac65:4894 with SMTP id 956f58d0204a3-67a8d39a752mr3239371d50.13.1793367672846;
        Fri, 30 Oct 2026 06:41:12 -0700 (PDT)
X-Received: by 2002:a53:b703:0:b0:679:ac65:4894 with SMTP id
 956f58d0204a3-67a8d39a752mr3239366d50.13.1793367672405; Fri, 30 Oct 2026
 06:41:12 -0700 (PDT)
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
Date: Fri, 30 Oct 2026 09:41:01 -0400
X-Gm-Features: AclHuK8kH1OuIkN_q5ZdT75tTegSRvmQGQPnwjHlNJ5kfbAVHTA6GSylbbGiccQ
Message-ID: <CAEQnVQ=J4JqS5s58zJ1DQjDMVWDkObfXMcKLS+E_oDQY=rjqCw@mail.gmail.com>
Subject: [PATCH v2] scsi: lpfc: Fix race conditions in ELS retry
To: Kyle Mahlkuch <kmahlkuc@linux.ibm.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>, msmurthy@linux.ibm.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001d5069065f0ef3e6"

--0000000000001d5069065f0ef3e6
Content-Type: text/plain; charset="UTF-8"

From: Kyle Mahlkuch <kmahlkuc@linux.ibm.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
Paul Ely <paul.ely@broadcom.com>
Cc: hare@suse.de, msmurthy@linux.ibm.com
Subject: [PATCH v2] scsi: lpfc: Fix race conditions in ELS retry
Date: Thu, 29 Oct 2026 13:50:45 -0500 [thread overview]
Message-ID: <29073ebc-b616-475b-bc05-384da09fbb54@linux.ibm.com> (raw)

This patch addresses a race condition in the lpfc driver's ELS retry
event handling that can lead to a use-after-free in the
lpfc_cancel_retry_delay_tmo(), where the NLP_DELAY_TMO flag is cleared
before acquiring the lock to check if the retry event is queued. This
creates a window where the timer can be rescheduled and fire, causing
both the cancel path and the worker thread to release the same
reference, resulting in a double-put and use-after-free.

Signed-off-by: Kyle Mahlkuch <kmahlkuc@linux.ibm.com>
Signed-off-by: Paul Ely <paul.ely@broadcom.com>
Tested-by: Maram Srimannarayana Murthy <msmurthy@linux.ibm.com>
---
  drivers/scsi/lpfc/lpfc_els.c     | 32 +++++++++++++++++++++++++-------
  drivers/scsi/lpfc/lpfc_hbadisc.c |  5 +++++
  2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index 6f6394a0047c..ffd61ac46646 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -4477,18 +4477,36 @@ lpfc_issue_els_edc(struct lpfc_vport *vport,
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
+

  if (!test_and_clear_bit(NLP_DELAY_TMO, &nlp->nlp_flag))
  return;
  timer_delete_sync(&nlp->nlp_delayfunc);
  nlp->nlp_last_elscmd = 0;
- if (!list_empty(&nlp->els_retry_evt.evt_listp)) {
- list_del_init(&nlp->els_retry_evt.evt_listp);
- /* Decrement nlp reference count held for the delayed retry */
- evtp = &nlp->els_retry_evt;
- lpfc_nlp_put((struct lpfc_nodelist *)evtp->evt_arg1);
- }
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
+ }
+ spin_unlock_irqrestore(&phba->hbalock, flags);
+
+ /* Drop the event-held reference outside the lock */
+ if (arg_ndlp)
+ lpfc_nlp_put(arg_ndlp);
+
  if (test_and_clear_bit(NLP_NPR_2B_DISC, &nlp->nlp_flag)) {
  if (vport->num_disc_nodes) {
  if (vport->port_state < LPFC_VPORT_READY) {
diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c
b/drivers/scsi/lpfc/lpfc_hbadisc.c
index 4c673dffa671..3eb142cf4455 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -846,6 +846,11 @@ lpfc_work_list_done(struct lpfc_hba *phba)
  switch (evtp->evt) {
  case LPFC_EVT_ELS_RETRY:
  ndlp = (struct lpfc_nodelist *) (evtp->evt_arg1);
+ /*
+ * Consume the payload to prevent reuse or double-put.
+ * evt_arg1 was populated when event was queued.
+ */
+ evtp->evt_arg1 = NULL;
  if (!hba_pci_err) {
  lpfc_els_retry_delay_handler(ndlp);
  free_evt = 0; /* evt is part of ndlp */
-- 

Reviewed-by: Paul Ely <paul.ely@broadcom.com>

Looks good Kyle - thanks!

Paul Ely

--0000000000001d5069065f0ef3e6
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVSQYJKoZIhvcNAQcCoIIVOjCCFTYCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghK2MIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGfzCCBGeg
AwIBAgIMfTolsPHVUUiJJy/mMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDExMTEyOFoXDTI3MDYyMTExMTEyOFowgcsxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEMMAoGA1UEBBMDRWx5MQ0wCwYDVQQqEwRQYXVsMRYwFAYDVQQKEw1CUk9BRENPTSBJTkMu
MR4wHAYDVQQDDBVwYXVsLmVseUBicm9hZGNvbS5jb20xJDAiBgkqhkiG9w0BCQEWFXBhdWwuZWx5
QGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMfcjiJ6tilnI1V0
GBy6osGJOj3vRX34o+H31v+vPgMxV3tUjGzdt4sakA15iteBXpSxdOZZVpHKGYMtKEDRDyNIBEnq
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
L+YwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEICt++bV5enU0xjJu1uSfFinEYdi+
1Wt82yLN1GNW26pfMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2
MTAzMDEzNDExM1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBALurbscXU0fVKWk71BHbuwHYn/ubIrQl8nDzcTXx59fD3NYxkBVJmaV7tN2hffcE
FTkBCyAT6ZSG/8hAbycM3LhmtGSKA6x2IKNWR+T8gOD+3LczaeP1iAfEidmfROnQMUiDXcDp8b3m
R9AsZ9mUnSORFH5l0b7i6Ke8YW6Lez30flO8zOqi0AGWKkAHOH6gLYzfKqwLUucJZOLSSpVXmYCT
JSX9ZPqa1CAkN+prvOR3AQCcTyY0KyaAbU4BjQEI2BEayX4cWrFOuAMHg136eGkX0vWPZiP/P8v8
6oYsMPRTDprnpUlRPLBtynwB/o3LjSMM9Wx7TX9t403cf5efQdU=
--0000000000001d5069065f0ef3e6--
