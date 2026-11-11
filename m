Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408695;
	b=i/fdI7vWqlYTcHV1fL7K0eEUbW9GMKrGZFsz54z08m/pkJBE4VIP3xefKhvyzARpEZMU
	 j8pLlAGR1YhPm4gcmbBRZoOd+6inHjZPOtloeXFNlBpPrMH9wpxaEebnbTkvovMDS2oi3
	 OGsuFj7gQ0wVd55fws/zh8+Vb17KBt/Xs6JA6eHIbGe8IzBmH6Jx5yPCxjbMjwpYOIJnI
	 0k8/bHqIOIEalMWDUSxHTlPXKwOAfSU350AOz68eoVDqFyR1pWkNGcEWE1l/V5U/Dr3QK
	 2ODVTD/hDVwR+1NWgXryrEOInvocWvzoSgwntUv/TLN7L7dWaPmY0yKGRsC5vXjasLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408695;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:X-DetectorID-Processed:Content-Type;
	bh=ud+1qfaaTnJOSu6TyqrvIZbFDykWmn3TYVRnDWi5fkA=;
	b=ffaLuAf7B70JyoSY81/9mfDbR2+SgeYBdaB0iTu41HxuzSMpctSmzcVfiG+G2UPEoMbl
	 a0QjCv5fLkdrcCBObzsZtqgQyU8oFWJY1Tkai1Et6vaIKdP3vmZwQz284AMI8N6XG/WS2
	 7/dwOaafF9vnxbvLA6a+gu/RjtayXL+EYVvO4ku5DL+s2wT/LfRUqFBbc9DJeJoQcMXVq
	 UqKc0zHq63t0IqcsLS+zIrRTSK8RCnjZ3CJAhIvzAP81E68k8d+3mo5qz+7z5hy/MvPLp
	 5A/fsDb/4l6d28y6NCirwfmgNQ6hip+jg4hWAFdwIXBcd2J6NH1oI3CaZdUlOLxKC7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G9OXEfso;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537CC606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 537CC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G9OXEfso
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1650706a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408695; x=1795013495;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud+1qfaaTnJOSu6TyqrvIZbFDykWmn3TYVRnDWi5fkA=;
        b=uzmx6zwnSRYDWFhiv1g6p2Mw9lEQxi1Udt+T2XPqB424diofG8hV28UdfMBBEYAJRo
         zXLjiP/25OuT+mKZqZLVZ18uzHPNH7ZLHNOFyinvRVSEKOqdsXcNh+Vqgi8llF1+2G7K
         9yLO0PtduO7eM6NfEEkz7h/siEROPbKWRi2Ndl2ZUtNwubwwYGqnSsb1c30nePZ2ZLss
         JmMjJhWf94JU6l3OowKAYz0cdHOCl30SFWtBvTG9p0Bsb06fTesXbeEYhX3/pqmgF5kk
         uQVl5Lmv75/E4jNZfloNBrgJE+/96eR4Uc4TnIyebCOau4/iNaIoh8iKbJhXh8ZVrnqt
         WQxg==
X-Forwarded-Encrypted: i=1; AL+hErHu29pHisnCio3TFEKwFI+Wm80oU7++a9PcoBPu5elNbQviGH8Gr/d5q10yw9T+R84qoRLVPJE6zbA/lyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b757gjp5nEWpVYZ5DySBiIqVZPqkIYH2XdSOSvfOrtedG0Y0b
	m6c079+sD+AIFrEn9gvg5bXh1XCLCBGhTtTwiL+ibhV6JmxycLWqYs5bCYvdP6jSi20rZpL+vFP
	SqtUiB4EWEbJeWrVMCWLPrzSLoCcdIQR6u8dK3XuEesFohnSQZilQvw1zm560HzepqO0g9Ml6ul
	YcfWyMyOxveJHN4cr/U9roVm294q3gKKCkbYX7IiXl2GudjVp2XuirP7t1nhkYV2MvNiYZ5P63Z
	k0Pq8T3V0kmew==
X-Gm-Gg: AYBFou3CZk+vrxmT1uttrZwgXK/g7WErJZM5b/0jYpEDpeKMqX/IjUs+0iI5gsxhnDp
	VH46gPr5t7MyvHjCDFn2DTGWkhfEvkrAUviyuwBHAfzFjAXaWNE/EyvOW0wzAEpNBDZaML1rbPe
	UZ4LUb1TM8nPYcUhE65jjXEG5opq5/P9cmAS/tsbMhyvasKIe1gjC07gb5FyWbxOuJ8N/P+mxwG
	5Bemegizw9BDTQ3SFgPdSMdrVKVyylrCNOnzWSuN3ZViFfDn4T8Fu0xEeYBs0BGZketk7jmQ3Fj
	CMJ3hrdZO4TyMbIeg41EgUcspCTyT1SoNqnAUvKLWn/QaDQM5nR0dkLP+25O/fYeaQNmI/6pbEO
	OwpLwjKl6U0YznFYyQZdiZ0M0lMJ2mKJAI0yOEmoE1Z95O3+QTUcueqGV475tDz9t9IzLQ/6JER
	YyV1WGVx0OvffDgxHwrznQNr3QyKYvOg==
X-Received: by 2002:a17:90b:1e51:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b182edad1fmr2716668a91.30.1794408694466;
        Wed, 11 Nov 2026 06:51:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17e20ed39sm2083504a91.6.2026.11.11.06.51.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:51:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6798fd97f3aso4730583d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794408693; x=1795013493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ud+1qfaaTnJOSu6TyqrvIZbFDykWmn3TYVRnDWi5fkA=;
        b=G9OXEfso1hZtpZoW0EJt8tlAKP6FBIi/S9h3WxjpGumVe3872L2HtvmcQvgcxm38RJ
         07eR1Sh24Tkpwvq+v+LEdQMEoWndZXJt/2N9V/O5J4HFWbI8fDrNIUDf9q9WeuSyJsb1
         PebRo4THEiqkfCU3/fHUaT68SSHLCKGqnk7xI=
X-Forwarded-Encrypted: i=1; AL+hErE1rUbeIK4XUXOb+9D5nrBebFHHIzx/zydc21Adivj1VnXgGCfN9VV/kEmmLsi0YKAYFL9dgMZbDUbyc9A=@vger.kernel.org
X-Received: by 2002:a05:690e:168a:b0:67c:23f2:4268 with SMTP id 956f58d0204a3-67c67cb854bmr1577854d50.6.1794408693336;
        Wed, 11 Nov 2026 06:51:33 -0800 (PST)
X-Received: by 2002:a05:690e:168a:b0:67c:23f2:4268 with SMTP id
 956f58d0204a3-67c67cb854bmr1577833d50.6.1794408692777; Wed, 11 Nov 2026
 06:51:32 -0800 (PST)
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
Date: Wed, 11 Nov 2026 09:51:20 -0500
X-Gm-Features: AclHuK_2CeXt17pu4tJ2sHVmkSNP3NDfUmnW0LP089HHhFyvlCDMbuELNG9hejs
Message-ID: <CAEQnVQkjgdXPvdSQ2vKhKDuDPTs-x+XgF+LWMXRk2VkPj23gvw@mail.gmail.com>
Subject: Re: [PATCH v3] scsi: lpfc: Fix race conditions in ELS retry handling
To: Kyle Mahlkuch <kmahlkuc@linux.ibm.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mkp@kernel.org
Cc: msmurthy@linux.ibm.com, Hannes Reinecke <hare@suse.de>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c4f1ba066001547e"

--000000000000c4f1ba066001547e
Content-Type: text/plain; charset="UTF-8"

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

--000000000000c4f1ba066001547e
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
L+YwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIMfSNlkU73vYfICh0YfyeazEMgm6
YOWFW/gXCyiRNtrUMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2
MTExMTE0NTEzM1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAMWgvlObVn77ysqxS3kSndEir+QRfC5N5Hv+qnEg1dclrdG32lOWEXXEmAQtdaNx
Jkqg+4FYlkzR0Yh42TvAWL6O5UrbaGX45+WOyMeSSmto6nZ9MGrxG4NAlcsMYs3fLWBO5s4/UT5s
4TQ6j0Gf+j8cTmE8w6zFw43JtAwy+X8vIplCIJIOIWgyIrYltai7zM68eiTS1/ClvHW5vejlwgH9
ezNaTP5ZsgpSIX8VLowHwnEuQiGOYZSBiWm/iY75yt6ezp6O06IRJ5BANRGAUOWaPeSa563DUiF6
jbP8umEKeEfuFdLqPy2ynaLdfxy0ThVpfKdLwHDJ0jt4EkOZkXE=
--000000000000c4f1ba066001547e--
