Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251803;
	b=rbX2AfPD68AijfrG/cubKDfqeub0YFYzN4+CbE9+LQ++ZYa4f8Cz2pbNuHt0nqMyUGC1
	 Z3/oMgS8ATQDb1eVk9QxYv/1El1Jt4qgi2Tt+XlIarG5mnbDYpkzzj+GGxFwlWrlBH9xL
	 4L9a0OkSDNea9hd2y3R+niWibniQCkgjLScdFozYqDTHg8OVgi5rLUGxG3ftnSus530yi
	 802KHPRMsriiLgobpJiP2lNt6Ra35riaeDgo7ppsUp5MpWp8wyFiiijkxfiv0uGH0qBcU
	 ybE3zHy9E0HYkMYCqu/unAAMukuo2Bu7uoYRCKp+nh7vxuS26r/ks3lDTe6wWKoKbfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251803;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=wiybFfTYl5VMYIHjcvTA3nN62R8sK5NoOzaLMokyrfQ=;
	b=xcRmQyvtnvc/ZZ4oqrJ0FPxcUIanYzjNer5H6FFNAspJCGpyIwEhRYcUveo34Kmhfv0j
	 R5Gl9mzmpHhgQQIU0luK7oxss/YitUElNNLfsv/Q0ojDLqb33IznmQbtFgK20j1FU7YFl
	 YMRRk+8WUodMGV/kzRyGmkgLWCQrWe2hXLo4Hwhv3AppR5M7t4EBuQuBCl4VxU2wWsQzF
	 TXB4fY4S+nqpB9xls2/Cn0oXjtWLX4dIKaR0KbKhiiWhL4Ly6Ny9fUKcmX1amoALoj1i4
	 21A6UeW+1nrqM7CVFWUzWRcgSxXyytanKdqUyBtU02+bUBlyBUbpE6f+lh3b3pj8Ubg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZJnYio1P;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338FF60A2604
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 338FF60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZJnYio1P
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-ccca948203aso588535a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251802; x=1794856602;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wiybFfTYl5VMYIHjcvTA3nN62R8sK5NoOzaLMokyrfQ=;
        b=yjvBWmGRjwqb7w9m6sWnJs3tGhMiy+GgCssjGMf+HeFWnO/IsESDRQfT0tnDr4WmOB
         X8X/ggisocdO0rUSVlZyvLQmq0ODBdItt2O9w9l9KwhH4YwOR+XbprfAOC4rfV5hRgZV
         4OIBZ+YYNhUXYjujaGd6VwTiZFTPowPWB3f/VYn9VQFvUey0yDYW3jZqb8yNFczEinu7
         vE+GTAfTvG9cTuqkNQfSxshcwAdPmbqVsc6qxbwYXvv35jlC95aLbXyb/U2L5gRzRzqI
         1hFxBWMXy0WCnSTgbkBSLId9ilpaehEp9vHbMrTY8dYTG8PRHnxWDmIKBJTJVHvr/kW1
         o0Kg==
X-Forwarded-Encrypted: i=1; AL+hErHsM8R0ITGjpYbhLCSW4cZRuyYay4eZqhUj9uq1Q4M8C7Ohq/DVTG9+RfdTQTRmOcEL5zvQdo8cdOYLywA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9apHjYz2VLbxXgMwFKA6fp0gOV2CI/7OaocBzFzBo/5N7CaChw
	Hlr9YWCwdPtSjyB5mhTG4VN3Mm6dS9+4aIj9U025KjNJwlH1KaBuTe3xI8vO9HqbIHw2hqnlkFm
	UdaTkkTG7vNqPf8QQn9BFmY9x3w+3DZTsvpYncpCphD6wL4i6LzzuKEe57BGn1TPUQ0YbZO0Y/S
	YHmUKEXBTIYKGWEKB9trL4fvk1seARuZp7syDveYhH3PjCADHlsUjTXYFKmgyOIm6JHtpf4yoei
	OB6jsqvBTpYKMjyLlU=
X-Gm-Gg: AYBFou0PN4FQ4H/yu2DfvD4ARClO+fNFIp7JObOQ+Ja0y4Pex28W7ErPBh9Esv95v3L
	+jANrSANyWbTIAr16RaPdDJz8zo4N0LI6bEpFcrMjpBXzYTnoIIeZ0C01TOowPkXcbb1gJq0gd+
	tzALIxZ0JNP+ZHSrdss628aNniru6PabM1z85SNH5hqgmQU3UgdpBApTEfonGf5z3f4OgTE4hNv
	jtsqjNSjzWlCQeC/Ix7eERMRVYLQxGUDEb+ii+8fBZv6CA8TCfHZH37QK1aMFAV6E+CVnN4XIKa
	iA49iZiD/zRQh/SzZue54CZ0D56xVvR0XR803lJIw10kTiatMLrfy7lzAaMNXVokyfWYg4jLfNC
	KgHSgv2Mf6VM1+o3prGqcTnDGyZVfL1w+GNNq7PZez8BKGiR2nCshCvAi24UzTNLXEwDgtKNl15
	QzPc7+/wYgLlT1Mkig0hl3aNuemWho5hCgUQg=
X-Received: by 2002:a17:90a:ec8c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b166d273ddmr444902a91.52.1794251802402;
        Mon, 09 Nov 2026 11:16:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1678cedb8sm255714a91.3.2026.11.09.11.16.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:16:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c504991a35eso8633366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794251800; x=1794856600; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wiybFfTYl5VMYIHjcvTA3nN62R8sK5NoOzaLMokyrfQ=;
        b=ZJnYio1P4354d59CSqaTTT+bs1NNggsUWGMOptbJdBxXJwAYHh6Atvd32Y3KPv35JV
         Lzzif+7Gfc+J/vVWS/t3vRGintbXUkxjNiAx3TH+RBjg16YdSHyYv81gzzvaOJu9gYsW
         L3Hb7YDlQJzAXukDzNLV2FUUKPJcppgKFGCNI=
X-Forwarded-Encrypted: i=1; AL+hErHHEHfcRRMniEu1ai0nC8t5NCazGA8vjtHymVlCEsHueCzP89zecUU7RPmO0SJ3ZJA34dAusO8RYHh2en0=@vger.kernel.org
X-Received: by 2002:a17:906:fb91:b0:c2e:2baa:a642 with SMTP id a640c23a62f3a-c50495990demr17486966b.30.1794251800220;
        Mon, 09 Nov 2026 11:16:40 -0800 (PST)
X-Received: by 2002:a17:906:fb91:b0:c2e:2baa:a642 with SMTP id
 a640c23a62f3a-c50495990demr17485966b.30.1794251799745; Mon, 09 Nov 2026
 11:16:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108222942.1233295-1-bcochrane@google.com>
In-Reply-To: <20261108222942.1233295-1-bcochrane@google.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Mon, 9 Nov 2026 11:16:28 -0800
X-Gm-Features: AclHuK9F4oHp-3lINBrOFrQNC4YdvTSTxqVCJNhImGxebjQGBiNGxus0RCZRHhE
Message-ID: <CACKFLi=ezg_i8fEhncGmT4wqhJSy2S7dkkWDDkohHAL6GnzXvg@mail.gmail.com>
Subject: Re: [PATCH net v4] bnxt_en: Take RTNL before netif_close() when
 aborting FW reset
To: Bryan Cochrane <bcochrane@google.com>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Joe Damato <joe@dama.to>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000035dd53065fdccd56"

--00000000000035dd53065fdccd56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:29=E2=80=AFPM Bryan Cochrane <bcochrane@google.com=
> wrote:
> v4:
>  - Return to the synchronous close in bnxt_fw_reset() from v2, using
>    netdev_unlock() + bnxt_rtnl_lock_sp() as suggested by Michael Chan,
>    and guard BNXT_STATE_IN_SP_TASK in bnxt_[rtnl_]lock_sp() and
>    bnxt_[rtnl_]unlock_sp() with current_work() =3D=3D &bp->sp_task. Defer=
ring
>    the close to bnxt_fw_reset_task() in v3 still hung when entered via
>    bnxt_fw_recover(), raced with bnxt_hwrm_if_change() clearing
>    fw_reset_state, and marked the reporter SEVERITY_FATAL (reported by
>    the netdev Sashiko review).

v4 looks good to me.  Thanks.
Reviewed-by: Michael Chan <michael.chan@broadcom.com>

--00000000000035dd53065fdccd56
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCBcEoZ0
n7QhTxiU5yxiCKG5x2JTeuuIGO3iZdD5i9uq3DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMDkxOTE2NDBaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCcsjgDdIQd0Rv6CxrA8CVPshL/F8VF/QNNe7C2t6bk
lIiFLdBq3nhmB1XCA0Fq0xQgK3gj1Juk5cF5TFbhjvbIJpVmR7uaYcZGKb1pRH9EF7H8agsw5bc7
QLG1+sCc0Xzn/9+8kcu05kwuJujKDkFGV6dpvJ4IHGXDYaf+UxBNR3RKnyviMiPIVEi1Bdhae1aD
ls6VHP5u6iDQZR+ZzL/v3l7AlvPfpZmsxAU6CE7+ycaj+xsoY0y8ubCkyUYXSvSyu8e/zIO37wzh
DGf6N899JvKf4oCL2Ble/ZqAAenAY6ylnXeo8ydakt+acReVAK2o0QpKvjxB+U6yDTSBIg1w
--00000000000035dd53065fdccd56--
