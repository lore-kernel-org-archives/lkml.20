Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36673955CA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138619; cv=none; b=Yj1XzUlb1XtiMiYCA+3XVuJ/OaPn7zUwyzjrv0h5kQecI5LUAbF4o3ZeHul1aKGmSO/htoEzIMzSpBF7ryl8kaJQWc6jGO+ee76UGq1KJS3DMjGo3EKJ4DUhp+guTdIwbwoI/2b2AWKu/9rfmd47nDFSVQHNvNbU8ODFOCTMROk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138619; c=relaxed/simple;
	bh=rEFv1yXtT0l27dkhJF61/peVD51uvhGCz/3wrwDus/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HL0syI9Pd1k+qjMl9hIti073MT0ysf/w7dWMQ66dImOJcLwMJpR9fHj2FG3zMRyw/+H6d826uWj655iSJPsJed6sI4cNiqFF5zO0humfR+4w272QpIE0x+izPy+YwI6VoUo7bkoDl2Jt5z3bvLQyMLZa4hI9Fnw+GU5vJUZIL9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=a70x3OzL; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="a70x3OzL"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2dd77036290so2007155ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790138617; x=1790743417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YrgldB6OiBT4+MYzkChTH98v39DkFaWzobArAF2i+iM=;
        b=E0eapJdXr3YB20oFiU0Ok78n1fQjx7iYzzOAd79HvGBP5EbAqAQ4VUGLIxC6P87bQa
         il3MScJMINjW6Ih05/g9qhZ6ix8ppgDZUW/bssd3w2wKQ3c/yWKxckVoc2pL8jblFfXd
         4IpN0XPJQJ0YcDFY0mPG0yVG1uXUw8faf6y7tW7XmvW/sflJOn0r7ADAWjc4LK1OXw9a
         qcvbvZ7q9R/XrX9zVi9bOFhE/ss2mtQfJnfxdeQYnA09B0kkTlXCd24h6zGXP/L4O0Mq
         C/gBQ3ushnGMnJPCIB13q14dA2J83e2kdZa5P+7FJCIEp2SRzNAQ6VYHkJGKvLXVDryp
         GwOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwz88cIeK7o0ueFhLKEuovsrWjY7H5oLKacvBSNY9ApMQMYWrwJKDzKITkFbg12JA3rxS8t0q0IgWUyxzE=@vger.kernel.org
X-Gm-Message-State: AFuF++ndkkltRtXA8QEaIGOaPH0l5gR72cK4ed2oO5CEcJhi5z18kP9k
	FMwE4JXzy1t99hfdzZkH+o2ngZSBcLPrS+tai3GA/0ss+IGkd431BZXRl4x6XiCWFMw9VqGn0Ol
	6gPErEnZXewCIZYFTgp62Qpqw18oFc+Ng0RhP3XQihpyXupFGOVjrh9J7IX+OrYSfw5Wt4XB5kO
	HKbCR1aK+s2uWemBi1dmxaHg0te+RLa7Sw5tWTI443RhgRg8REVR0Od7WjP7aHnco1a3ekf4KBb
	LXK2G/vV4ZuMtq643s=
X-Gm-Gg: AYBFou2wdrDGxYoGG5foUAB13uMkWYhXOfAwTG/3KZ786QX4Gxy6pq1bm5kAKPt9Ws4
	83n7eUl1EjVoXBywVOhL/HDs1aicWu1ePjy8NtJ85jjdeeF9zPrbrg/rHFbnIQmoihoih4xbsJY
	tYZKzDESHVY2DlQCxzzb+b3jR2PEUNaX6qKtTjjbbBVF3O9pdSjSRU1b3QKM0jOvU/TBshu+4/T
	cyQNAw/0Assy11G49+Fz4T5Nn8KSOXnHAO1ksM9iLiNLip37Fw0kjT0MT53k5Y2YuxDXjuw3QaA
	BDZ0RWEynTadWNcUs5h9qNxvAx5ulFe/obidhdqyWgxbIzep2H/+O+W1L8G1FR9XcFKaWr3LsPF
	wXO/F8yKT2ZlGRJr8wChWHvG+LfKPsJXQSDMpO3zLwYslvR186rq6C23YyoHJN7+JHhEhLnkyol
	rpuzj9F3VSJbSZijMoRH0sLGaEThWQD3pjBZe8sB9w7RMc4A==
X-Received: by 2002:a17:902:ef02:b0:2d8:d4d3:3fbd with SMTP id d9443c01a7336-2df69d34ae2mr14440145ad.17.1790138616823;
        Tue, 22 Sep 2026 21:43:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2df6a61ccb2sm883335ad.54.2026.09.22.21.43.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2026 21:43:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c29386c5fd0so51018366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790138614; x=1790743414; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrgldB6OiBT4+MYzkChTH98v39DkFaWzobArAF2i+iM=;
        b=a70x3OzLYUynivrJGeveyiFq94jqZFdezzW4fF/Lw85KYvMlcrKdLItXDe328saoVt
         ZWMG7N6j7gAmvfHdGJ9XlA/kScVQ6QwMU7uuqjq7+AQPfDFYSzJ/beLA1SgGunDbPeZs
         UIggXaFFrygF1Ffx4f/JE+kYuNqQ3xdHJMS9k=
X-Forwarded-Encrypted: i=1; AKwUvBwT273lJHchztAeHTrBTl0LxSUQ60iNyGttRXHJBI0OT/xp0uHC+WVaqMdDoJUP/dE6FOO2cW+Kw8D8EUE=@vger.kernel.org
X-Received: by 2002:a17:907:6089:b0:c2a:50a7:d052 with SMTP id a640c23a62f3a-c2aadcf4aadmr116525666b.7.1790138614700;
        Tue, 22 Sep 2026 21:43:34 -0700 (PDT)
X-Received: by 2002:a17:907:6089:b0:c2a:50a7:d052 with SMTP id
 a640c23a62f3a-c2aadcf4aadmr116524266b.7.1790138614308; Tue, 22 Sep 2026
 21:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922182405.1290749-1-joe@dama.to> <20260922182405.1290749-4-joe@dama.to>
In-Reply-To: <20260922182405.1290749-4-joe@dama.to>
From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 22 Sep 2026 21:43:22 -0700
X-Gm-Features: AclHuK_gcPxWFd3L3JTd-aUIXKWM67WrRRs-EPt8QZFFf6Z5d1yaDeExiLMftnM
Message-ID: <CACKFLi=TK27=UkWsS3_OOsB+DmZY+o=Q1gQS65+RJjqVDJwPcQ@mail.gmail.com>
Subject: Re: [RFC net v2 3/3] bnxt_en: stop DMA before releasing rings the
 firmware did not free
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Prashant Sreedharan <prashant@broadcom.com>, horms@kernel.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003e4013065c1f2097"

--0000000000003e4013065c1f2097
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 11:24=E2=80=AFAM Joe Damato <joe@dama.to> wrote:

> @@ -7798,6 +7802,17 @@ static void bnxt_hwrm_ring_free(struct bnxt *bp, b=
ool close_path)
>                         bp->grp_info[i].cp_fw_ring_id =3D INVALID_HW_RING=
_ID;
>                 }
>         }
> +
> +       if (!stuck)
> +               return;
> +
> +       /* FW never acknowledged freeing these rings, so it may still be
> +        * DMAing to them. Stop the device before handing memory back.
> +        */
> +       netdev_err(bp->dev,
> +                  "Firmware did not free %d ring(s); disabling DMA befor=
e releasing ring memory. A firmware reset is required.\n",
> +                  stuck);
> +       pci_disable_device(bp->pdev);

I think it may be better to return error and let the caller decide
what actions to take.  For example, bnxt_hwrm_resource_free() might
decide to finish all the remaining steps to free all the FW resources
before taking any actions.  Disabling DMA now will prevent us from
sending any remaining messages to the FW to complete the shutdown.

--0000000000003e4013065c1f2097
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
DPVtLUtep/P3evQuAtTQRaKedjamBcUpJ7qUhBuv/Z07LlLIlB/vfNSPWe1V+njTezc8m3VfvNEC
qEpXasPSfDgfcuUhcPR+7++oUDaTt9iqGFOjwiURxx08pL6ogSuiT41O4Xu7msabnUE6RY0O0xR5
5UGwbpC1QSmnBq7TAy8oQg/nNw4vowEh3S2lmjdHCOdR270Ygd7jet8WQKa5ia4ZK4QdkS8+5uLt
rMMRyM3QurndiZZJBipjPvEWJR/+jod8867f3n0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUJbO/Fi7RhZHYmATVQf6NlAH2
qUcwDQYJKoZIhvcNAQELBQADggIBABcLQEF8mPE9o6GHJd52vmHFsKsf8vRmdMEouFxrW+GhXXzg
2/AqqhXeeFZki82D6/5VAPkeVcgDeGZ43Bv89GHnjh/Vv0iCUGHgClZezpWdKCAXkn698xoh1+Wx
K/c/SHMqGWfBSVm1ygKAWkmzJLF/rd4vUE0pjvZVBpNSVkjXgc80dTZcs7OvoFnt14UgvjuYe+Ia
H/ux6819kbi0Tmmj5LwSZW8GXw3zcPmAyEYc0ZDCZk9QckL5yPzMlTAsy0Q+NMVpJ8onLj/mHgTk
Ev8zt1OUE8MlXZj2+wgVY+az2T8rGmqRU2iOzRlJnc86qVwuwjL9AA9v4R13Yt8zYyA7jL0NiBNP
WaOSajKBB5Z/4ZVtcvOMILD1+G+CVZX7GUWERT9NRXw/SyIEMU59lFbuvy4zxe3+RbOleCgp3pze
q8HE2p9rkOJT3MkCNLxe+ij4RytIvPQXACsZeLdfTDUnjeXCDDJ9KugVhuqMelAZc4NissPz8FOn
2NK++r5/QamlFqYRhsFxSBIvhkh2Q/hD3/zy4j17Yf/FUje5uyg03FblSBOk2WYpRpXEuCpyn5pb
bYVIzfhQJgwGfO+L8BAeZIFjO1QL3s/zzn+RBlTl4wdDzh8L9eS+QEDhMcSsqb4fFRDbsoVuRjpx
R5MunSUzk4GcmmM19m7oHhPGeKwIMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAgFZdi
RGTdsh+tHgP+3VuoDo96NLO+9FWNfoeqUt808zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjA5MjMwNDQzMzRaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAZj3jL9J94h326nIEjYir/rpSX7Rq5vczSCx9wcOzU
ADzNFA4v38T9mkB8XE2cYiHcy9mslrPnXn/nDGt0Dy0rvdu9YhX48Ys2JXA1sJpwBQvOe2uwmA9n
AXkrwRd3oBRjzsmvS+12C51XsejJUlGv7DeiBCGvHWZZ5m2Lrg9J1dgb5LkTF4DGhY0xEoE7Ugcj
NLb+js8t8d/RehVYhz1AZi8M3xC4LBkBrE7dT18rP+d/PVFdg7ziYt+swtoBCV2LvOIhBaifQoxq
SA0UqfSiAjZlfZE7sTMli797UYTZYAL/vBzn5b1O5hELnVSExu7Ag2Z86dwg9seHVujrVrIL
--0000000000003e4013065c1f2097--
