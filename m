Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405BF47F2FA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204170; cv=none; b=M0tiHcPPBLpK+0pYmLtwx693jqSpAecMk1OFfmRdxY5n7fWp8TqxtQR++vUQy9ZykNXWgpGbyF5fESfH7UOjkvHfURnbP3cu8WXmVIBzLxu+VEwiRuNh50QEQRQ7exFlH5rOU1fUgCBfd+W2xMpda5UspxbeNamrSOpVK0aDzPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204170; c=relaxed/simple;
	bh=akFveV0zvQhWUIVXZwUMPUp5qllH1Ir9GOgeSJR66bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ImUvWEuF9lMwi2jfKf3d+1xXTL8M7kKjoI+i+BinaSPy2jh8qkOmPd78cVw0daQumOX3P6n1cxJLByiXOVKrj2r0t5Fm5fSCe+PsUfk9jq4jVr+Ykc6khKASvRwN8nzkuDWPy6Pc5Zj6yP7PyEMd2UTs1nFBAitFr01uIuNbKN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=avcWmZIP; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="avcWmZIP"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8819033dbadso35203b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791204168; x=1791808968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RADvsNGI6PI0+H8DO+zWlB8SV5fMzMIvbDFiKUJGRvM=;
        b=cUA1YgJHABmQu+WvPhEvC+XCIOnosIduGiBRBUiJBt7BDFqepOngFyD0SVsCZx1jqw
         MOwwd7ldKx52LVmRnHnwYjwHG37znaZjdiGTNNoSkY+6KHYaA3JGQApcNOJNVq6CDaai
         2EFnTOttStcuM1gMuVdWqcJ6yHlqblWJ2274Ga0BB9pyZfZLOtERPz841Vz53qnyw1q/
         WXwW9qJiPuYClVKYnOJcfeQzaW5J6XtZSc2ureHGIoza+J14riu3PXciXqkYnzZbfyeB
         hlrGCeF87k4Ob/eXRvLTOC4WWuUH/niIFT4IqSuNIk30U4cNTsuNPL9IJcWUvRgPH/bN
         xUBA==
X-Forwarded-Encrypted: i=1; AKwUvBzL6DSqqUN/L+NxtFE5S+U9yuNTqqpuZcOB+GQ0liemkAKu0A7WCWzgZdDO2nTDQtXHN4DhyiwCXH2MZe8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqigteuIF6D03hGOWSP8cLe8w9E8REXOIe24qYcCLI6P9dMfFq
	+N9spFUZtlQryGg5zA533tGOVUVxig+3oiFF+Tlfd61K2SHQZz534Sobo2kSm8hI07+JWkg4YUa
	pQYaHnaNdKRpJPna2cp34HGa6iJ3YEuszBkhY1ugrhwKhcpsEvs7KROLz2BBUa9v0muP+gBjQOF
	sqekBVut/U97ohYee9zr0M+2HeMyazMa+LU5zQAn17lpZqBKu4ADrJiovuekryPAhxaz2N6xenk
	91yByn03TmrfoBdbmXneMkh4A==
X-Gm-Gg: AYBFou0UhGY3poMJ9309cDHH7eQeQTYPDk6kuaZgq+gVUIV/EZt51Uy6AQsAOqbYv1V
	AvfHD0hn9rdLVsTBMWW7nH/NTcvteM80/v3/eNXybnu17JFFzc413txFYW56WtBOxBT42J9S2R2
	3nw4jI4WlHU++hwFzqWhiJNorovHZ+Ej0ViDaPOGdbnElInxyEYISn96hjh9prXRUO3YqLTud0o
	s155LWHdtXG9wmIVJ+zI6aZALf/4bFRss3/Jp/8eGEJ2dGirXiOIIUwkaWlQtxZdLJIjPLukxh/
	ew8aIqv4L6T3QE/rTmYeOf/FeWhm3LyIaYiSf35oh3fe3FGyxfsoXVgXklkwrxgCcVXb+2GCpWO
	CHcCd/xa5NPWr4MxwIWW9jhjTr++m5RCbSKREt8g/PB6maL2SaMnwBlSYCr8J9tZ6jaMivWJDL4
	Kpy1GRxMK/Vo25qDw+Gdpw+pnk/ZiHKL0Q8bTOmJVF/woa
X-Received: by 2002:a17:902:e5c1:b0:2e2:c602:2072 with SMTP id d9443c01a7336-2e49b6adb1cmr98843815ad.36.1791204168319;
        Mon, 05 Oct 2026 05:42:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2e5b61f995esm84305ad.13.2026.10.05.05.42.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:42:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3966123eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791204166; x=1791808966; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RADvsNGI6PI0+H8DO+zWlB8SV5fMzMIvbDFiKUJGRvM=;
        b=avcWmZIPQKXtQ6FgwzPCBEKaiqneNwpCpjbgzD8SIHv+99qpvE/1NdcZ7oKjL0Qnh8
         Ywr2GKyS7TxKxBMPbmKJGNGOgeFwPVN4LwtJLAKcuQrnmE4i/9BKXDo6j/MTdpDVgpJd
         Fnr/J9E5mv27QV8+dBYtYk2fPs1V1y8Dmx9vc=
X-Forwarded-Encrypted: i=1; AKwUvBwfI6QB3sZry7BZIIvqxQQiaVVIQB3m9yMAPyU9ZiCT+MXl9DzogQjs6WWiFi9MiUuys+fZUX9GCXnZEC4=@vger.kernel.org
X-Received: by 2002:a05:7301:1a03:b0:33b:bea7:84dd with SMTP id 5a478bee46e88-34f21994b42mr13189307eec.34.1791204166356;
        Mon, 05 Oct 2026 05:42:46 -0700 (PDT)
X-Received: by 2002:a05:7301:1a03:b0:33b:bea7:84dd with SMTP id
 5a478bee46e88-34f21994b42mr13189267eec.34.1791204165735; Mon, 05 Oct 2026
 05:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005121704.227866-1-bhargava.marreddy@broadcom.com> <179120300167.1402591.3718496528368377342@kernel.org>
In-Reply-To: <179120300167.1402591.3718496528368377342@kernel.org>
From: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Date: Mon, 5 Oct 2026 18:12:29 +0530
X-Gm-Features: AclHuK8XM6JniRoIQZRdD7OPHsTu9ycKVNU8ZEBJs2oiW0KxiZZ2n-_uhef5_hk
Message-ID: <CANXQDtZ_7u51Tsqx8ugZHSVY0Nc+O0bJMNtB7bCLBYdVaKE7bA@mail.gmail.com>
Subject: Re: [PATCH net 0/4] bnge: Fix error-path and IRQ setup bugs in probe/open
To: netdev-bot+sinfo@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, vikas.gupta@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000016ecff065d173891"

--00000000000016ecff065d173891
Content-Type: multipart/alternative; boundary="00000000000004fad6065d173864"

--00000000000004fad6065d173864
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

To provide the requested context for reviewers:

- Discovery: Identified during review of the "bnge: Support async
  events while down" series -- three were flagged by Sashiko, and one
  was flagged by Simon Horman.

- Trigger: Identified via code review and static analysis (potential
  issues in failure handling and IRQ setup paths).

- Testing: Tested on physical bnge hardware; compile-tested and
  verified checkpatch --strict clean.

Regards,
Bhargava, Marreddy.


On Mon, Oct 5, 2026 at 5:53=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:

> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
>

--00000000000004fad6065d173864
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,<br><br>To provide the requested =
context for reviewers:<br><br>- Discovery: Identified during review of the =
&quot;bnge: Support async<br>=C2=A0 events while down&quot; series -- three=
 were flagged by Sashiko, and one<br>=C2=A0 was flagged by Simon Horman.<br=
><br>- Trigger: Identified via code review and static analysis (potential<b=
r>=C2=A0 issues in failure handling and IRQ setup paths).<br><br>- Testing:=
 Tested on physical bnge hardware; compile-tested and<br>=C2=A0 verified ch=
eckpatch --strict clean.<br><br></div><div><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr">Regards,<div>Bhargava, Marreddy.</div></div></d=
iv></div><br></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 5, 2026 at 5:53=E2=80=AFPM &=
lt;<a href=3D"mailto:netdev-bot%2Bsinfo@kernel.org">netdev-bot+sinfo@kernel=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hi!<br>
<br>
This is an automated message. This series looks like a fix, but its<br>
commit messages seem to be missing some information:<br>
<br>
=C2=A0- How the issue was discovered, e.g. hit in production, hit during<br=
>
=C2=A0 =C2=A0development, syzbot report, manual code inspection, LLM or sta=
tic<br>
=C2=A0 =C2=A0analysis tool scan.<br>
<br>
=C2=A0- Whether the issue was actually triggered, or is only theoretical<br=
>
=C2=A0 =C2=A0(e.g. found by code inspection). If it was triggered please in=
clude<br>
=C2=A0 =C2=A0the symptoms, like the stack trace or error messages.<br>
<br>
=C2=A0- What hardware the change was tested on. For driver fixes please<br>
=C2=A0 =C2=A0mention the device (and if relevant firmware version) used for=
<br>
=C2=A0 =C2=A0testing, or say that the change was not tested on real hardwar=
e.<br>
<br>
Please do not repost the series just to address the above. Instead,<br>
reply to this email with the missing information, so that reviewers<br>
can take it into account. If the series needs another revision for<br>
other reasons, please include the information in the commit messages<br>
then.<br>
<br>
The evaluation is done by an LLM so it may be wrong, if you think<br>
that is the case please reply and explain.<br>
</blockquote></div></div>

--00000000000004fad6065d173864--

--00000000000016ecff065d173891
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGqjCCBJKg
AwIBAgIMFJTEEB7G+bRSFHogMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNTI1NVoXDTI3MDYyMTEzNTI1NVowge0xCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzERMA8GA1UEBBMITWFycmVkZHkxGDAWBgNVBCoTD0JoYXJnYXZhIENoZW5uYTEWMBQGA1UE
ChMNQlJPQURDT00gSU5DLjEnMCUGA1UEAwweYmhhcmdhdmEubWFycmVkZHlAYnJvYWRjb20uY29t
MS0wKwYJKoZIhvcNAQkBFh5iaGFyZ2F2YS5tYXJyZWRkeUBicm9hZGNvbS5jb20wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQCq1sbXItt9Z31lzjb1WqEEegmLi72l7kDsxOJCWBCSkART
C/LTHOEoELrltkLJnRJiEujzwxS1/cV0LQse38GKog0UmiG5Jsq4YbNxmC7s3BhuuZYSoyCQ7Jg+
BzqQDU+k9ESjiD/R/11eODWJOxHipYabn/b+qYM+7CTSlVAy7vlJ+z1E/LnygVYHkWFN+IJSuY26
OWgSyvM8/+TPOrECYbo+kLcjqZfLS9/8EDThXQgg9oCeQOD8pwExycHc9w6ohJLoK7mVWrDol6cl
vW0XPONZARkdcZ69nJIHt/aMhihlyTUEqD0R8yRHfBp9nQwoSs8z+8xZ+cczX/XvtCVJAgMBAAGj
ggHiMIIB3jAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADCBkwYIKwYBBQUHAQEEgYYwgYMw
RgYIKwYBBQUHMAKGOmh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZz
bWltZWNhMjAyMy5jcnQwOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dz
Z2NjcjZzbWltZWNhMjAyMzBlBgNVHSAEXjBcMAkGB2eBDAEFAwMwCwYJKwYBBAGgMgEoMEIGCisG
AQQBoDIKAwIwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3Np
dG9yeS8wQQYDVR0fBDowODA2oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2
c21pbWVjYTIwMjMuY3JsMCkGA1UdEQQiMCCBHmJoYXJnYXZhLm1hcnJlZGR5QGJyb2FkY29tLmNv
bTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAd
BgNVHQ4EFgQUkiPQZ5IKnCUHj3xJyO85n4OdVl4wDQYJKoZIhvcNAQELBQADggIBALtu8uco00Hh
dGp+c7lMOYHnFquYd6CXMYL1sBTi51PmiOKDO2xgfVvR7XI/kkqK5Iut0PYzv7kvUJUpG7zmL+XW
ABC2V9jvp5rUPlGSfP9Ugwx7yoGYEO+x42LeSKypUNV0UbBO8p32C1C/OkqikHlrQGuy8oUMNvOl
rrSoYMXdlZEravXgTAGO1PLgwVHEpXKy+D523j8B7GfDKHG7M7FjuqqyuxiDvFSoo3iEjYVzKZO9
NkcawmbO73W8o/5QE6GiIIvXyc+YUfVSNmX5/XpZFqbJ/uFhmiMmBhsT7xJA+L0NHTR7m09xCfZd
+XauyU42jyqUrgRWA36o20SMf1IURZYWgH4V7gWF2f95BiJs0uV1ddjo5ND4pejlKGkCGBfXSAWP
Ye5wAfgaC3LLKUnpYc3o6q5rUrhp9JlPey7HcnY9yJzQsw++DgKprh9TM/9jwlek8Kw1SIIiaFry
iriecfkPEiR9HVip63lbWsOrBFyroVEsNmmWQYKaDM4DLIDItDZNDw0FgM1b6R/E2M0ME1Dibn8P
alTJmpepLqlS2uwywOFZMLeiiVfTYSHwV/Gikq70KjVLNF59BWZMtRvyD5EoPHQavcOQTr7I/5Gc
GboBOYvJvkYzugiHmztSchEvGtPA10eDOxR1voXJlPH95MB73ZQwqQNpRPq04ElwMYICVzCCAlMC
AQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMf
R2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0EgMjAyMwIMFJTEEB7G+bRSFHogMA0GCWCGSAFlAwQC
AQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCEL7JydKWKsWGCwnKivkr+8c5qRpv9PBmdOVNKPQtqcjAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjEwMDUxMjQyNDZaMFwG
CSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYI
KoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBUp1Ve
iqUhUy7pqiYCEIZ8g/O5OeNJ1zRSaymRQ+zKn38TN18mTqhD4swf0OZbP+ZlEY+72T54vRVaJr8Q
QQtGvdEvQqqBar4AD/ioaLHCiM9Qf6P6VL9SPOxEGsharXbHRqRavRF+3zxnPn1fHDQaBj3anARx
wKLNzPvapaAYYK5EA+h8NCYFTPnk9o5u+uPrRrGiWvvaj31XGvNBTGwKfGLsmcQADtio6Ne0cjzT
jcpSg0WYoW/EVgu6MdjMmgWY9rUEApSUNtmaAcPMYcr9DhB3DItmEZoJu2VKi6xG2CEVqb5J8kOi
jYxFJolw7ezjt03Qi/qsvEYIAVJ3ajwU
--00000000000016ecff065d173891--
