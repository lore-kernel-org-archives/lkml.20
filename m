Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922C93DDAF6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819310; cv=none; b=cyvE5yKkH/prCZlX0eoRgnPR6zcrUODBXoMYrDPeNLx+G+GTBPc+w0oZinbHtFmGCtNEdcX4LzJtAxkXdWZCNX283mxWqtbhmSBcHq1gahl/TYHw1CGOxVjLrUadUYTaLIkVDgMxz6fIcwUXyqlDiNqVN3/jaj2rm2dQ/4D1Yz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819310; c=relaxed/simple;
	bh=oOR0rKF+rB9JaV0DkdCzqwV1KKdz0AEBPCtqu88rvBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2C98/ixO5o8NK39srbW3n5a90hcBHHFCP+XYPLGyBwfnDvXY/JmgvzmYcimTNbJX41GIC3ui0Of38GyzSMVpn5bg2OkpCeBRhQ12XsLOEapJ19XBF5zgOhjyR4C9HyDogADwexk9bfwe9CEIB2zluuzXreM38CQTfU6vB9j4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZSNLY53W; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZSNLY53W"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so1603764e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819304; x=1788424104;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1Gg52/Acbk7/abJgyArgjCDrp5tt51JFGf5Dd0Sb6c=;
        b=H/gXMx1sfizfjJ8rV8yaVdQIS49l6xQNpHjTAVPK2ayNTLCm1xV5S2V4hCbGNoUtjt
         DbES56IOfbmPQBj0i2yUN70MC3CBIsKcMsnHwTITVY5zr8pBMZh56XBxehWFjH/7UKTg
         kkHXBTnGUylMyb9q5Gjb/7bdyUa2R4v01JjXAP0ekNuoSoTSTt4otAYDV2ARozF1fvk+
         GVZQSyDlez0E+HoDDpUnOrGNzfnjBhqAwm6w1suo1iNYtQ8FV2WPtV7iwBaZQ7ImlnwT
         z7xJoarGOjdK+JbUV8HvULTjWDBF3rjduoBsmkMmWxCbky6unbXDV17z6TtXgVMMFrvx
         6+8g==
X-Forwarded-Encrypted: i=1; AHgh+RqpFnr+IB8QW+StcqNw2VzfhFbQ+mKTsrIS2RhbIG+Jl24lOIhEmdTO3vqK4UEgw4KGFapWiwsnYdxNFOo=@vger.kernel.org
X-Gm-Message-State: AFuF++nlJTf857nagoDZi1py8u/N2P+A6afByq6LAAj+Sgur0Z01xhot
	SaG1+neTwld6TA/e7SBHBNF2O9OzKaF5ahKvYxXVkVvjhJGqAAoBURZOEUJOKnKI+Ki2T951QEL
	ZDIG5bmIGvsg+MW9GYrBBP3r2uIJR9UpztHeCl6yaVBby9hFjQb7HCoDRgruEtIRDmDTbwDfXfF
	qrHVQVqK1zlhyJkdMq5ul4yriXoL/K5MxnbfEsaSMJMRrMVk09xfKvseln77SEF1npFaVFjwt62
	4g8LqOafeVzLAeSp3g=
X-Gm-Gg: AR+sD10dThXDWJyGymjiGGHA+dqppT6CRHWBRZlGt711EE2ujO6XEJHX33tE+tMjdkn
	jXGhngsI1vHtQortRIlHoZMuMRD7j+3+bQ8hwdu7D+X6x8BKgglw5WdUNwtlqUy0+7/tZa/D/HL
	onovKC3+WJKGptjR4lbKuAyNVLx5XOKTn6Q17DTjS9BiTuR6MoiQen1MZKDCXmtE8tgdb7xb4SI
	EzjH8BshpkIm/v79ZFiEnzHCVLtqJK5TBtlW6+9BUzjQ/nwnBKfaN4yGW7FIILnRK3M/94Vl4vS
	N7XtoHUWOuC2FxMW4cjBMdx8C73CEGl8nV5o5QoMpn/0fpwlXJ9whiZo7VgCteYikEW0AjqOStY
	eA53nLbSPD3etS9UXLxc7fSnmiY+3nP8su7+fHTHSeyOtrJAJ/6iyybsKTv5psSDWRT5hzmMaPI
	o/1GuzVl59tdffSZTCJRWzeUA70MTp+cU6BZ0=
X-Received: by 2002:a05:6122:d90:b0:5bf:b497:87c3 with SMTP id 71dfb90a1353d-5c65b588e58mr5455893e0c.0.1787819304242;
        Thu, 27 Aug 2026 01:28:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-97cbe1e6e6fsm1067969241.4.2026.08.27.01.28.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:28:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc15155cde2so2355597a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787819303; x=1788424103; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1Gg52/Acbk7/abJgyArgjCDrp5tt51JFGf5Dd0Sb6c=;
        b=ZSNLY53WKupTThSC7aWZl5hQAfTlNTG36Blg9dfyq/9f4yOWnyZ9XzVJj1OopYeGNz
         ZLeJga7L1hSr+veFZ9xhcnlfmUN0lsoaG2N82V6mmTpXvnwPUAe1RPw5MnfSoVAOb4AS
         LTrX81i4pgwBQJoFClRcrd7QvcCLEgblRIx8M=
X-Forwarded-Encrypted: i=1; AHgh+RqrvuSg08whzmcsoAeyYSTXBz8VJjezrJgfhPsTuK01t1lxhJovupOAsVkofx0aYTUAZDhgcoP3G2kGfCk=@vger.kernel.org
X-Received: by 2002:a05:6a00:2d81:b0:848:6b76:592f with SMTP id d2e1a72fcca58-853722a1873mr22145199b3a.5.1787819302984;
        Thu, 27 Aug 2026 01:28:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d81:b0:848:6b76:592f with SMTP id
 d2e1a72fcca58-853722a1873mr22145154b3a.5.1787819302579; Thu, 27 Aug 2026
 01:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-bnxt-uc-overflow-v1-1-f20d48864fe9@topgolf.com>
In-Reply-To: <20260827-bnxt-uc-overflow-v1-1-f20d48864fe9@topgolf.com>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Thu, 27 Aug 2026 13:58:10 +0530
X-Gm-Features: AcwNN1XWQNSDDkVbClCgjHDVZjiJXE8b3YY9KztOJ4Zg0dWwWS-kthVRWZrRtQY
Message-ID: <CALs4sv0ng6DquAhOFSjKeXhckzxa-NrCKA3k98uezW46Rx+BRw@mail.gmail.com>
Subject: Re: [PATCH net] bnxt_en: avoid redundant RX mask updates in UC
 overflow state
To: johnathan.browall@topgolf.com
Cc: Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?Q?Pontus_H=C3=A5llstedt?= <pontus.hallstedt@topgolf.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000007f9083065a031e8d"

--0000000000007f9083065a031e8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 12:42=E2=80=AFPM Johnathan Browall via B4 Relay
<devnull+johnathan.browall.topgolf.com@kernel.org> wrote:
>
> From: Johnathan Browall <johnathan.browall@topgolf.com>
>
> bnxt_cfg_rx_mode() stops programming individual L2 filters and turns
> on the promiscuous bit in the VNIC rx mask when the interface has more
> unicast addresses than the hardware has filter slots
> (BNXT_MAX_UC_ADDRS).  The driver state never becomes consistent after
> that: vnic->uc_filter_count stays at 1, so bnxt_uc_list_updated()
> keeps reporting the UC list as changed on every rx-mode callback, and
> bnxt_set_rx_mode() removes the promiscuous bit from the mask it
> computes (it only re-adds it for IFF_PROMISC), so the mask comparison
> also fails every time.
>
> As a consequence, every rx-mode callback resends the same
> HWRM_CFA_L2_SET_RX_MASK to the firmware, including for requests that
> change nothing, such as setting a link flag to the value it already
> has, or a macvlan going up or down.  That would only cost an
> unnecessary firmware call if SET_RX_MASK processing did not affect
> traffic, but on BCM57416 and BCM57504 (firmware 23.3 and 23.6) it
> does: each invocation causes a short interval in which incoming
> unicast traffic is dropped.  We observed this in production as
> sequence gaps in GigE Vision camera streams on a PF carrying 19
> secondary unicast addresses, with HWRM tracing showing a SET_RX_MASK
> (and no filter alloc/free) for every repeated "ip link set ... arp on"
> that changed nothing.

Regardless of why/whether firmware behaves that way, to me, your patch
looks like the right thing to do.
LGTM except that you may want to fix the checkpatch complaint of 82 chars..
Reviewed-by: Pavan Chebbi <pavan.chebbi@broadcom.com>

--0000000000007f9083065a031e8d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
/HTPxpDrr4vzZL0yoc9XefyCbdiwfyFl99oBekp+1ZxXc5bZsVhRPVyEWFtCys66nqu5cU2GPT3a
ySQEHOtIKyGGgzMVvitOzO2suQkoMvu/swsftfgCY/PObdlBZhv0BD97+WwR6CQJh/YEuDDEHYCy
NDeiVtF3/jwT04bHB7lR9n+AiCSLr9wlgBHGdBFIOmT/XMX3K8fuMMGLq9PpGQEMvYa9QTkE9+zc
MddiNNh1xtCTG0+kC7KIttdXTnffisXKsX44B8ECAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUxJ6fps/yOGneJRYDWUKPuLPk
miYwDQYJKoZIhvcNAQELBQADggIBAI2j2qBMKYV8SLK1ysjOOS54Lpm3geezjBYrWor/BAKGP7kT
QN61VWg3QlZqiX21KLNeBWzJH7r+zWiS8ykHApTnBlTjfNGF8ihZz7GkpBTa3xDW5rT/oLfyVQ5k
Wr2OZ268FfZPyAgHYnrfhmojupPS4c7bT9fQyep3P0sAm6TQxmhLDh/HcsloIn7w1QywGRyesbRw
CFkRbTnhhTS9Tz3pYs5kHbphHY5oF3HNdKgFPrfpF9ei6dL4LlwvQgNlRB6PhdUBL80CJ0UlY2Oz
jIAKPusiSluFH+NvwqsI8VuId34ug+B5VOM2dWXR/jY0as0Va5Fpjpn1G+jG2pzr1FQu2OHR5GAh
6Uw50Yh3H77mYK67fCzQVcHrl0qdOLSZVsz/T3qjRGjAZlIDyFRjewxLNunJl/TGtu1jk1ij7Uzh
PtF4nfZaVnWJowp/gE+Hr21BXA1nj+wBINHA0eufDHd/Y0/MLK+++i3gPTermGBIfadXUj8NGCGe
eIj4fd2b29HwMCvfX78QR4JQM9dkDoD1ZFClV17bxRPtxhwEU8DzzcGlLfKJhj8IxkLoww9hqNul
Md+LwA5kUTLPBBl9irP7Rn3jfftdK1MgrNyomyZUZSI1pisbv0Zn/ru3KD3QZLE17esvHAqCfXAZ
a2vE+o+ZbomB5XkihtQpb/DYrfjAMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAB7Ci7
q3rZ80kO0x/ZHeM7YwGo8mOAIG0s0Xsi78r39DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjA4MjcwODI4MjNaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBTKHuRc/Y8J7IA3K3fci7AxWc71tf4JShdczPwMM++
BIWJaqTG4ytji58ubDif7Jf0cVXalK+tNDhNdB8L5X8C41Z6uqowKTnWhM5MBEdNX5Kdjxj4RNuw
bduxULhOHqjGNGpL0oiofl8jKYzUkXUoEweSgpAgggOgVKPlAKfZAyM/W1Ln8CtYZu3aHxha2kpD
qof50/dA6wgJCy8x7XzXuIRHYQCoIdwKK4SPkXmEGON56Qu8g40vvGii857WKdvztxywrIbXPEw0
ncueB5Cfd7LTVjUl6r1HsVS4irNhw6mnjFEEa2rooiTqa8JsRdZ0IZctSQri/WPqnaN8eKaY
--0000000000007f9083065a031e8d--
