Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338978;
	b=WolMPAq2IsTtjteytu+TMhJwMqio9ElkX4dlguRaFlmQd2reouCTw6wQCY7i7xgp2Ma3
	 SxbwuE3T0zMOO5y3J7hkJfqZGn+3AWBQqa1+7+kIgiRZYNg/S4CwzackeO7m/6hU3Bzsy
	 CGeMCxpXHcHogCDeeCQswwHyvFMjvH05WyESGrIW1+MNu64jnjqiVZLpQ+zjVczrS7+Bv
	 ClPV2xdogjALaDyEphUZ6pe86HPp4MtTiuAdLUuIUhgkG6/XZyf379+WV3VvO70ZTj4LB
	 S/CPeVBF2GzlkRHIBss03+Y+fO64DTyLCZFOMts0bkPmA+DR/3JOy3mICx9FnQLkt/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338978;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=RAC6JQJCvS54oOJykrUTSgfiXXi+BgAXNdMy05c+CrY=;
	b=B2g6yJ9qJfS/WP5P4v150prHbfv7n5QFgeTpFAAEyuAUIsg2ASROIwdJXmuGWqp8zytU
	 MgQ1m5T7OKT66YBZg+gpB4uS+rLnbHnCK1qZb/iFiBhvKRH7RWmq13GmBMSZEZO3N9aO3
	 F/DTTKdcT4dBpA5S6xGln0SYZ0BHO9KvGJZJBGDhdwACAyc/NF1tdyk0VTLwtsw1BonS/
	 dBZ0GZJdJ4XaMfgoGh5Cb15g+cd135kGofnogikKHWl8ngUEQ1s7dCfE7I4bPPrCTJOde
	 cbv25ncHi0MdbkuAXJdDFyR2on4SVsH8R7XBlafTnKmUDsWlIPfT6T8Ko5dNWWIm5TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KwN+28gT;
	arc=none smtp.remote-ip=209.85.210.225
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E63606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E63606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KwN+28gT
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-89f639ba307so98176b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338978; x=1793943778;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAC6JQJCvS54oOJykrUTSgfiXXi+BgAXNdMy05c+CrY=;
        b=lG2nnpHaRZUjXj7XNsysDAiW4k8LhnUak6mBYiT1NnxeqrVCtWlxLougQZ6QWFzbW0
         SaBDgo4Y3RfbDcVA6fNvTfm0ZSkD6ycxudiIqcbf0yGmxlnAKgA8FqbG/C3A3CWz4rXk
         G79WancZowjOUsaDo63Kmu6JFkKzsAzRjHGQ9skcI393bVEzjHwRJgDxxBeaICVd+2hb
         iOwPLiRvtEW5nsilgBvcAtTMMQcJnFiMOOjlPi6sIL7rnXoG0TjDX3CCEJfmTVskh8ed
         UpeRxjop2M/MThaeeFmflsc1jEZJl7tp1/Pc3+MzJahhaT2LygRFUpJf0mS6B9Nlpc5x
         6xEQ==
X-Forwarded-Encrypted: i=1; AKwUvByWsu5HZl0VOUQ1rwsTB6LN0NZ8EWD2ObUMKFgZbOh84d9FxT+Cya3av8ZI8EslPOdRBBGmJbasliOCiuA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyNs5TliB/hKO7bty43vovwMEDMN0UXDjkPOtxySLv7lX0Lvh0
	TDrTsflDnM2siShm1LKz/W/ENwZsbJI5N34LnfTiKviZBavOb7+cMY/4KsETmgz4vNq2twAUGN9
	v86YyeEQtcN1MoHPguKOHXx6+0XHbNiaqv+IVKnhNvEBfXduBThVkZE5q3KMNipWQAxzm1Qc3/8
	429lsza/AnOzKEeHZn0xRvX7bXWvoeaN5KF4XQ+3I+m9zfafKPlPwI3mD7jFSowlpmtRDNfIgE5
	s2H4YwgmUj+y6CylFs=
X-Gm-Gg: AYBFou04lGc/l655z9/xcG1F04XIiLEaZx+oxli2y1i2gqKAH71AyCHZeXueLpU4dHW
	y+lpftVarCAjQQGTFIw+O6Ddd62vFV/0Eug7S66W+V2Wfqg63VxzfsbRWXTaHPn+qd7IrsNf7sI
	DwEg75vqUFLz8Poi1R3KGyzu2aMqkAbTcPijA1yXc4AG+JBZddJmk0mP8wK9/Ad70ApZ1XaENru
	dAoTe10pvP74VLXJceM76qhJNkjlH48elIcKLJPOaTYB87c6EVvKaZTlcgNVgeBTZ2pbjj5wNEW
	KiVOhSEetA5zKFpVVcADFHJBCCa9r+2zS8lPycBqoMHSj6GHLyqlOGjL0F25U7RIkUzlBlw3/hB
	tBK8TjRUYcTmOTTfHqz/SpRoCOmL7K2EOqXV2DQQv9gebjA1b4rMEbJ+bm3ljEz3V1Vb4H0Ex0e
	JtP2zF235K/Ihr3D80R0pcRByBfA5De/l+LZs=
X-Received: by 2002:a17:90b:4a46:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3ae8953617fmr1069107a91.3.1793338977591;
        Thu, 29 Oct 2026 22:42:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85f87a56sm545794a91.1.2026.10.29.22.42.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 22:42:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c414c206673so32370366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793338976; x=1793943776; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAC6JQJCvS54oOJykrUTSgfiXXi+BgAXNdMy05c+CrY=;
        b=KwN+28gTG514LxnQOOD67X/7v5/8+wISY3i+Z2cxrYi/nOIIdpPwLlu6P7k6x/MCUh
         U+HQB2EMt/nYxTbLD8e4VHthI/1gVcHXionQ9C+SXObskcqCadJEGBPFl1qNuWA7uLLk
         MP0CD6kaqKt0V+OV1Mt4s4bOXETSsx6l4oCIo=
X-Forwarded-Encrypted: i=1; AKwUvBwxjG/WxHH2bXjzfgut6RrW60iDrfFWFtGUuiOLWqnjFkWeYyh0RoAeTy2XPqU2AcNc8eIADKxacn2yReg=@vger.kernel.org
X-Received: by 2002:a17:907:160f:b0:c42:102f:15db with SMTP id a640c23a62f3a-c4ca7ab0b1bmr106187066b.34.1793338975770;
        Thu, 29 Oct 2026 22:42:55 -0700 (PDT)
X-Received: by 2002:a17:907:160f:b0:c42:102f:15db with SMTP id
 a640c23a62f3a-c4ca7ab0b1bmr106185066b.34.1793338975403; Thu, 29 Oct 2026
 22:42:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028114933.256298-1-vlad.wing@gmail.com>
In-Reply-To: <20261028114933.256298-1-vlad.wing@gmail.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Thu, 29 Oct 2026 22:42:44 -0700
X-Gm-Features: AclHuK81_LVIBMucGkIYit4kOb4vb-RR70QdPr6ipg8M-3SdS3pKpoYCK2aUlUE
Message-ID: <CACKFLimoOJx8OepUD8=jrHCTFnTqwWTzXUCp9hfVhc15GRoBkg@mail.gmail.com>
Subject: Re: [PATCH net v2] bnxt_en: Don't keep MSI-X vectors added before FW
 reserves them
To: Vlad Poenaru <vlad.wing@gmail.com>
Cc: netdev@vger.kernel.org, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, Jinqian Yang <yangjinqian1@huawei.com>, 
	Andrew Preece <apreece@meta.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a10a2c065f084468"

--000000000000a10a2c065f084468
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:49=E2=80=AFAM Vlad Poenaru <vlad.wing@gmail.com> =
wrote:
>
> When dynamic MSI-X is supported, bnxt_check_rings() grows the MSI-X
> vectors with bnxt_change_msix() once FW says the new rings would fit,
> and keeps them.  FW only reserves the extra IRQs later, when
> bnxt_reserve_rings() calls __bnxt_reserve_rings().  The MSI-X table
> entries beyond the function's reserved IRQs are not backed until then:
> the MSI message written when the new vectors are activated is lost, and
> the entries read back as zero.  After FW reserves them they are live but
> still zero, so the NQ rings bound to them signal address 0 and every
> completion on those rings is lost.  The next ring change (for example
> ethtool -G) then times out freeing each of those rings and the TX
> watchdog fires:
>
>   bnxt_en 0002:01:00.0 eth0: Resp cmpl intr err msg: 0x51
>   bnxt_en 0002:01:00.0 eth0: hwrm_ring_free type 1 failed. rc:fffffff0 er=
r:0
>   ...
>   bnxt_en 0002:01:00.0 eth0: NETDEV WATCHDOG: CPU: 17: transmit queue 18 =
timed out 5716 ms

Thanks for the patch.  I'm discussing this issue with our FW team and
will provide a response tomorrow.

--000000000000a10a2c065f084468
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAotcJ9
uIxJTHaBHOaCGFCHFFGIhZhCYtLvsj+vb7IlAzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjEwMzAwNTQyNTZaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAOWTD0MfVSWFv9NG1OdgW/Qol+0oMOWaCziQGIganc
f54E/vHkilyFhyGXe1NQtMHDEAP8Uazb3o6M4KzJ/0Tids/LggqGb28KN/9Lu29EetlesnbmtJEH
4YUiTxnLMxFUvbS3BabBlJfoV/QAe8yqpJ8y2fhvJ5w76F3jaNYjE6WIj9ZJ5E5To1gtk1UraQdq
5WynsenpY57oQH0cS3CPbog07ZQEojMllEdvbIhXJUrDio1i7XkMj7yK2+Rc6wngGrq7rH5iTWAf
eZIqluoo3sOIpbs6bKqBOd2NzS/kjwOHG4Ut7AsWnnpPQLs59AMcxJ8dlO9TX+QvA1sNCnVF
--000000000000a10a2c065f084468--
