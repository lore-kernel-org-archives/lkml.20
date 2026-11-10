Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269653;
	b=QnABpSPCTwPVdqFy/rqhVRHVyGvBvtfUEV484U19QrkE0tqyI52Ic1+/cO7Mnjbd5T16
	 N1iCQVtOQcZADmeLgcVreb51dLr/0Sy5f9eC85zqXZwMRLdSpFKwqXF5lmrubDWxEaG04
	 CKmUmhiT+VBE6tUQ9M2GRudT02HfPyfWEOQIOuYcaa1xBtZqEP3puO7Z+i8BfAzjZ47mX
	 Wawlt3DECejmQKOhC1S+LKpQPR8LAfzhuPIyO9oS3nwPOnML+KtdXgpgopnKDqnEICzDV
	 JgvRzGU1Btl39CsYnaKNVYYLj+aLfJy5bSKZ85n9v/HNNzEMdDta3rE2cMRtj+N06ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269653;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:X-DetectorID-Processed:
	 Content-Type;
	bh=bda16U6NloFf8bkZ47nBGVpza1UIhMCdES+qIqZlrcM=;
	b=y7QyYjM5VlK0n1qXtHx9kctxOQGbQvBvVILvnfkfTjVn++Qty4VsZXioh3n8DnB0H6/P
	 7sIVQnc4ORLhLK0r6XT6kOwLRRUiF0V6zXmtBOGAmTbKO/FG3+OvjGsEi3ul9UZ8YEPLY
	 rbUOCu68H2jeMHoZpLT/Tj6Yxe5/RIekmAODrDvUJaRl3+8Gk1dvzNB6gX+WcHJZBf4mY
	 H22Jy15kr1AZWqkF8Kw037K5NX0/GFK824vxARf6IldWClaYu3IR6/DiXXPFueNs2I0jM
	 JBzHPrQCCnRmd37BpUmkbA/YAyexF+qblr+yon0fvjWhoTiogiMo481CnXVRvx7q1+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DoqvPqIt;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AA760A2618
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80AA760A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DoqvPqIt
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so658613a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269653; x=1794874453;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bda16U6NloFf8bkZ47nBGVpza1UIhMCdES+qIqZlrcM=;
        b=cjIJy+RDVDxBSwKfHAem2fg0ZStMdnv46BzTQHOIsUAkyHcajHiTybD3wvvo+7K2+K
         DLqV8eXZMFM9Jdeuwdo7OcwDRk8+9wdLqi6bJCxFvWnEQoh6vACfm44N+IwaZ7iXmo+6
         3+AKNeYCRFRc2n/1RCR6KUBSqAicwUQlvAdyrm7toHc9DEBS8nS/KpsMQ5YILIA/tYrO
         fTKkgCE67Uo6DRz0ht6v6eGym5V6ZvlG/Pwk9olBkGGJ7Po7bMhK0o6RaesA4rrs77dP
         JzMeSzXhBEQr+IWR6+rG7/6zRNTZS0oeQIej20SvHjcwYDSP4g7+Z7oRtGyhg4sAd9KE
         jDOA==
X-Forwarded-Encrypted: i=1; AL+hErHCKI/AhWfHc6NwajrLrQPr7AenbTnpcFquVOTr+v6IhmDPtBSAfkcBmleUXnSQVb4VF64KtRPDNksoePo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EM3DCoYzT84gfu7DwYquvzLkaPxAiW4t5rKTbqnacIxmJqZLr
	DmKnfD5P4WaIyDfwA1IWOjBJG0gQ8DZut6gjx+1pJ+3yd8NyneodVV/2G4VkM702fKEJK9audVt
	qkv1A2CkS/NNst79SKnl8COIkugomVVbaPBLncmDE0RWh1ou1XsNZmLrB8ZwRMMg0OR6wHwRKsc
	o/i/34ZzqiNleZiug2aVd8/agUwkcjidmGJgunaqW1VE4U/fABHiBMDdgaZ7MYRParm1GlpvPT2
	OjwUNkgvjC0fJX5kGk=
X-Gm-Gg: AYBFou1gmLO3F5Q/JD2aCvoD/Wq7ExiBN+y0Ts8R7lCujAD3lCXJxXLp5mNNAqD6tlZ
	ymimEjmcIDEEg6C3mY3IOBmJdhoLs+4tSw95+kgW6L/5MDc1lRqbvxJoSTfdWmOsMTx09hVxg7m
	CYBXzfDq3V/fAevA1p1vG0rgeFJudJ6zfisdkv0DSp6uJJTQSjui3AqAJphDP69UW+zqXP2n2Ce
	Q4CP6SVD60VdtLEcNbObQo2MW9x7Bk0xyvyqdpo4GL/i4s4AifHhopc3paC5kZpQOry4odaDYAI
	+B9weQOHI4CIWfPr0e4WSU9qjQ1ZZZG98525Pk+ET3b7N2KcIuP6zcYVIZIhlsoc5wp4v3z8OVe
	1WDuDAqmuymGQYraDSMuiANbsJ20yUJXObd3m036rKZMRvEcJP8++V6g8kmlghB5LiAxcNQQ22u
	nxUHGaIPc+rT/VNYSoGJL0n/ovob7o84RN/vk=
X-Received: by 2002:a17:90a:fc46:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3b166d12339mr1311610a91.39.1794269652659;
        Mon, 09 Nov 2026 16:14:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2edb62debb1sm280205ad.8.2026.11.09.16.14.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:14:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c4108bfb63dso88759866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794269649; x=1794874449; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bda16U6NloFf8bkZ47nBGVpza1UIhMCdES+qIqZlrcM=;
        b=DoqvPqItP9TKIP0/SZBRsQCHBKcgwpw3w7RNnf3yJUP3wPBNjjOrlOsvyTifuXE3eC
         XiN1qUckz2h+MClLKVv553FelbegEH/5vWvMjSznbLooer5lKVeoTVLdMkFRAanvugec
         4Y3kJCF3epmwzeQlN4A799NOlYkGd1VzNIkGE=
X-Forwarded-Encrypted: i=1; AL+hErFIX06U89yJxfWZc6H5kkggY9PXBbH2b/ySrF2FMOUMpW5+cjiKihaZMf+KSS0x1/uPnFMfAKSENAscIHU=@vger.kernel.org
X-Received: by 2002:a17:907:9694:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50494b5845mr74213666b.16.1794269649539;
        Mon, 09 Nov 2026 16:14:09 -0800 (PST)
X-Received: by 2002:a17:907:9694:b0:c2e:4e08:19ab with SMTP id
 a640c23a62f3a-c50494b5845mr74211466b.16.1794269649094; Mon, 09 Nov 2026
 16:14:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106191423.4194081-1-joe@dama.to> <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
In-Reply-To: <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Mon, 9 Nov 2026 16:13:57 -0800
X-Gm-Features: AclHuK-jrxOLfQRNf9fKaRtWtyZkfvLEw5DqyLpJjSJNfyjWAS85MvJZzM7AQ2M
Message-ID: <CACKFLinPK+wR=TMA3zNJDKQR_=HfMFUHPxKS+yhvv9SegZw7Ow@mail.gmail.com>
Subject: Re: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001adece065fe0f52d"

--0000000000001adece065fe0f52d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 12:12=E2=80=AFPM Joe Damato <joe@dama.to> wrote:

>   - Notifying bnxt_re when DMA is stopped.

I think this is probably the one item that should be added to the
patchset.  When DMA is disabled, RoCE will not work at all so adding
this will make the series more complete.  It may be as simple as
calling bnxt_ulp_stop(), but I haven't looked into it in detail.

We have tested your patches by purposely unmapping the TX buffer early
to simulate the IOMMU fault.  When the number of rings is small, the
fall back logic to check the HWRM_RING_FREE response during message
timeout works most of the time.  With a large number of rings, some of
the HWRM_RING_FREE messages do not come back at all and DMA will then
be disabled.  The FW team is still looking into this to understand it
better.  Thanks.

--0000000000001adece065fe0f52d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVWQYJKoZIhvcNAQcCoIIVSjCCFUYCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghLGMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
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
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGjzCCBHeg
AwIBAgIMZh03KTi4m/vsqWZxMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNDk1NloXDTI3MDYyMTEzNDk1NlowgdcxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzENMAsGA1UEBBMEQ2hhbjEQMA4GA1UEKhMHTWljaGFlbDEWMBQGA1UEChMNQlJPQURDT00g
SU5DLjEiMCAGA1UEAwwZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTEoMCYGCSqGSIb3DQEJARYZ
bWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
AKkz4mIH6ZNbrDUlrqM0H0NE6zHUgmbgNWPEYa5BWtS4f4fvWkb+cmAlD+3OIpq0NlrhapVR2ENf
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDMLavE
u78gHAX24MJ19Wj7766eU23P1ZgVbNIkM7ZOWDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMTAwMDE0MDlaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBVmUQGZFOSQL5/lKl/ROEEc8q6fqTUrT/rnMdduZfn
8DsvCbO30cEUdEu5pCphGgYvW7YLHtbUBWQoNcIvrcXh0cDl5islURoIC8xN1Nrn3hnRgYB60/a5
/4+RacNIo6+aSVOpLcAp84GF3SAnOqNaB+2p1rAgAzqxKnvSIT92CRcC0PTFbvnzfjxOlEHh+JKC
F4PfE4pKHv4og3PqnB0SX3mV73Z9UMYBHWoxiG1FvSWPXtoW4v40jpBKOdHVNGZDvFES3XMRE3vl
TEL6ifU1s7Sv9X7YmT24RBFQNxjoXWzHXtzVmjToSDNmzMAJYF5ab9Yl8JOk2ORsMbZLTtet
--0000000000001adece065fe0f52d--
