Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A5649D59F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673559; cv=none; b=WWRjk1FooW+mxm0aGTg+NKSzNr706G7sniSWeVXHEa4WdqaoKlbkfYCltO5QC8npZ75LWrybR+rV9CIoXq9vrQ8TsSQRL2QKq2KJdIfkJYJ7PwAwQF1UnyyYRrQYQRjH4D+SU7k1cUWCqlI6g4s63D4r8JTUO6j3k9A3Mmrh7qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673559; c=relaxed/simple;
	bh=dxz7X2YslyPVLFGx1Z9BqzaXyVo5elNRV+qSk35CBXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJuPN9sejVjFNcCqeRxtvidw7eYVUxbvDyxRe8bwbpIYjq2oyfu/FUZhXX33DyaxZq/LObT0r0lBswD2rHg/7L8jLdmvBtzuiaEtXsngDpowxGSrQFP8cvk4PYh2BUU5dboLeu8GkDFA2ra4s5NIekDpoaDRFF35YqIr199eIYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZajC4C1q; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZajC4C1q"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so93632a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673557; x=1790278357;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScFcpKYtQSXOpIIRkHNS0z5iw2ymv3c03v3s6eduxno=;
        b=Di/wwWDeEk5A7Q1SpLLYl8HUYBnucraXyBhly+YJS3cUwV/mFEk6QdCMJuNxY9OvOd
         IuP6KbcFG8OoGC9Tj6zFco79E5CuVKBzQErQDcftErrIpZUg/kblXwRlICOD75jYJ3v/
         fqgiqa2r9QQXZSPmAKdUMBobdBVa1uQvL4MmXffSaSWbCyeVAGcR9Z33cGuA/CIsW7kT
         3nuETToWPsbRj681EOVjFaWie+oiJ/tGiRj39XVXvexauLBZmGH0y9ZyRMZAgxMPBCpF
         1fV6PdS63i9AQwBoffCEMbNhgNjKb+G1um88C6bJTKRaWtqibDaT/3MYTFRjxgnU5vqL
         mvRw==
X-Forwarded-Encrypted: i=1; AKwUvBygpKbzD8ipeW42Q8ia/DKmQA70gHDVJgE1qly/wrKEBG8vB3eGtjN8qmRI7q93T8Kwz7lSwn5DeUyAvG4=@vger.kernel.org
X-Gm-Message-State: AFuF++mssjgRdFbxQXZxZbcSGA6qAsWJnKytgSYPoetIqQCRBfJlJgim
	OrBNLy4LcDDVLowWcrEpGdGaVZXV+69aAeMfXX1AEGbZM7sCDbx43gExWA5m6wGbPtiNhKSkkEl
	fngqKhKJKl3HBsWSERN239cBeywx+9+QcP7Kio4btETJ8WF7nTY2V8ql4+k9zWkizNp+PR0ZtsG
	gYrX6LWSH3ORxRJvgmoUSIR/KYH1d9b+c4kJAFu7jTiuTR8/m88nHyp224DADIYyjWTF+9XzFDK
	wVPb1zoHEOmig==
X-Gm-Gg: AYBFou3efd2/2Xtqyly7v/3WTDOJR+aZAfcjOkJoHkzuEdSyK/IIqqm2cnwbQdcedE5
	csmEnpcSNku/qozC6KhZ7d0u2DwJB1wRXukJc/dF8uY9/xsn6o5ha32evX5h/HjLuL65iy2WE01
	FJnXuIGsCXbBSNb2PlY7JHUdledEXa++FIJKy+5Y/3ZS4Q/0YPm4UWhEO73PjKbC4a3UsMtYbl3
	pu2IEBY+MdBgvRvtKt+NCPNxR4gXiQlhxXafNnvmUGQ9hQybJODVryp6vWfm/vVd6SSx/b5rtg8
	/bg0ezaf9OQ0Pb8/oQ6FRgRpwneDP0Hy73ctwJUC/dDIjDYnVr2xBpk2ze7ewzQwdTDPOPARKdy
	qvb256IxEVT9cpjmUSllj9CzDo/cj4QCp7XDqfQULhJ1d8rgclPXe4NC/ncGCEC0A+7g3TQE2BV
	e+XAXeIS9LnlvhOA4BRLckI5aP1I8xpz/V
X-Received: by 2002:a05:6a20:1609:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3dd8c399f37mr72459637.14.1789673556797;
        Thu, 17 Sep 2026 12:32:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc50ad211b1sm3003616a12.9.2026.09.17.12.32.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 12:32:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66f78d2f2a0so48642d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789673555; x=1790278355; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScFcpKYtQSXOpIIRkHNS0z5iw2ymv3c03v3s6eduxno=;
        b=ZajC4C1quHV51oUpfBK5Zo3J2BeuB6JT247Ly4ibjLDg55lGZ5MlXAEzpix17VBgyp
         stCXnD/C08GqRA67MMFNyeY7Yt6tEir7TQfOJA0EHUQLE3POJ3CIasBpJoaHqjFE9cd9
         M8BBnRjbVDO24tQ79F25/bmoxHarF5ril7hyo=
X-Forwarded-Encrypted: i=1; AKwUvBwimQfkPIiB6tcjqYFtEDSd9SvRGLvENOgSwaXv8FBpSp7E89FVUfd7uAhkIe1mH1pXByHQcdT7UyJSQDQ=@vger.kernel.org
X-Received: by 2002:a05:690e:d47:b0:66e:7afd:dfda with SMTP id 956f58d0204a3-6717fcb92c7mr47625d50.26.1789673555307;
        Thu, 17 Sep 2026 12:32:35 -0700 (PDT)
X-Received: by 2002:a05:690e:d47:b0:66e:7afd:dfda with SMTP id
 956f58d0204a3-6717fcb92c7mr47617d50.26.1789673554937; Thu, 17 Sep 2026
 12:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917144330.2157527-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917144330.2157527-1-vulab@iscas.ac.cn>
From: Paul Ely <paul.ely@broadcom.com>
Date: Thu, 17 Sep 2026 15:32:21 -0400
X-Gm-Features: AcwNN1XgKY-hAK2Dfd1I0vZMP_8Kc1TPJhC3Z6Mh8I-pqeatS3vk40rdoktMsvs
Message-ID: <CAEQnVQ=4BOue0djLgtBG6fukuqjvcBknL9EXnSs6R0eYd4jybw@mail.gmail.com>
Subject: Re: [PATCH] scsi: lpfc: Fix use-after-free in lpfc_els_rsp_rls_acc()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: James.Bottomley@hansenpartnership.com, James.Bottomley@suse.de, 
	alex.iannicelli@emulex.com, james.smart@emulex.com, justin.tee@broadcom.com, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, stable@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008ca2b5065bb2d843"

--0000000000008ca2b5065bb2d843
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The ndlp has an initial reference when first allocated and the
lpfc_nlp_put moved is for the outstanding LNK mailbox.  Unless there
is a driver bug with premature puts on the ndlp, this bug can't really
happen.
I would like to test this change before Acking it.

Thanks.


On Thu, Sep 17, 2026 at 10:44=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> w=
rote:
>
> lpfc_els_rsp_rls_acc() drops the ndlp reference held for the
> MBX_READ_LNK_STAT mailbox command before it logs the ACC response and
> before it takes the reference that keeps the node alive while the
> response is being sent.  If that was the last reference, ndlp is freed
> and the log message and lpfc_nlp_get() below touch released memory.
>
> Take the reference for the ACC iocb before dropping the mailbox one.
>
> Fixes: 12265f68ae92 ("[SCSI] lpfc 8.3.18: Add support of received ELS com=
mands")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/scsi/lpfc/lpfc_els.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
> index 4e3fe89283e4..bdf8fe3e77a5 100644
> --- a/drivers/scsi/lpfc/lpfc_els.c
> +++ b/drivers/scsi/lpfc/lpfc_els.c
> @@ -8782,11 +8782,9 @@ lpfc_els_rsp_rls_acc(struct lpfc_hba *phba, LPFC_M=
BOXQ_t *pmb)
>                                      lpfc_max_els_tries, ndlp,
>                                      ndlp->nlp_DID, ELS_CMD_ACC);
>
> -       /* Decrement the ndlp reference count from previous mbox command =
*/
> -       lpfc_nlp_put(ndlp);
> -
>         if (!elsiocb) {
>                 mempool_free(pmb, phba->mbox_mem_pool);
> +               lpfc_nlp_put(ndlp);
>                 return;
>         }
>
> @@ -8824,6 +8822,10 @@ lpfc_els_rsp_rls_acc(struct lpfc_hba *phba, LPFC_M=
BOXQ_t *pmb)
>         elsiocb->cmd_cmpl =3D lpfc_cmpl_els_rsp;
>         phba->fc_stat.elsXmitACC++;
>         elsiocb->ndlp =3D lpfc_nlp_get(ndlp);
> +
> +       /* Decrement the ndlp reference count from previous mbox command =
*/
> +       lpfc_nlp_put(ndlp);
> +
>         if (!elsiocb->ndlp) {
>                 lpfc_els_free_iocb(phba, elsiocb);
>                 return;
> --
> 2.34.1
>

--0000000000008ca2b5065bb2d843
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
L+YwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIGqY2y0BQPfxjFelQTfTTs0jgW/0
MpPdwGmhyn9qFhCzMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2
MDkxNzE5MzIzNVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAL5bCyW8EYY+cDAzLA9bi/UE8wI5t6pp2oNhJ30zCr6lMPJAlKV4H0tDTt0HS3I/
KLB62rWRxl++KuT0HoqH4rEje7kMkp1oOSltywtUnWCXjENVzt3MrU8qrkqbdhzD0gWNEpgl4npe
hN8cMO+mYrCd1JWLAmPX9RnucqkYq7Rjy4Sxucg3M8oFSyt22Hi6UwBVFvjZGwtoc4zvmQFzvw2e
wX6Acn+0qgaP9YF/F9Rqf9zADUaKZWrg1o2WXjEEIlPVL8INDYqwtOWmLGJaGObopEGdbyduwx32
3YeAeaLWUg7xkfV3Fz4sFZ1CFY+s7/0pGUJvzmRkDWz8qqw4LP8=
--0000000000008ca2b5065bb2d843--
