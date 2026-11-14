Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618853;
	b=FGitYcP3ryLBBr/q46cOnOKcyBoqXkGcNoxQ+Ts9H331vLk4TmZT6fHn9F2m/Dhiy+Fo
	 i3dJn3X9Csx+NeX8v5KJmmrBJKsdRbiqCxiDUFg9YFc23bU4tqqZ/KFTsbN1F8XPJPeKi
	 x/SGDkl+Rdfl6Ksdksjo89sXNJ6a5UkZW+luSYmkieuRgwcWmxK7d/7U+61CXYfenkLzJ
	 0JS9qq9HTo+0N+GmfFDfu/A+s4OaThP6/B8OH2sNeNLW4gBqjAaXMMCic8qYKzKdO8mdn
	 Du3UqWrsrEhtdOnzrBjGbLiRzVdsqd5/YIcNC5pLZhe724WdKSeEA5jSdnE1GlOmkSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618853;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=wcDgw1MpsvvJYR0IwaQT4PWuugDLWk1+xlvQyNqr1B4=;
	b=Nt6ZcUoIwWQBQRVDtvJ9N/ZOUF2SJ5hU1SpCUuHAC8xZyOoWEKalOVtcTFAGLV+W9aby
	 q7DmAhrbjMkj2yxRZHeZzrtU5NiFDzf3yAC3q7KBxLb2guD8PAZwIijvBRj95Eihlu4Xp
	 RPF9eQX+35TKOZEW2Dsc9lX3bqJTCxofFWO8VpdUH9SkISyd/yVP5TahjNlOcrIfMu3YZ
	 ZiAjApijr3X4sm8xx5Z14syHujYMCCh6w4P1TG42zOyJp0XikMed8EzWOuy/b8Ac6NzuS
	 v2tHIq9MDGUAYD6njxCd+WDapvjJ1B2fWUyPhS8ez9fr46opWy2I0mvbm7S5lgGvgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AQ5eMtLC;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C09606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C09606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AQ5eMtLC
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdab938dc83so838048a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618852; x=1795223652;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcDgw1MpsvvJYR0IwaQT4PWuugDLWk1+xlvQyNqr1B4=;
        b=ZvZFSITZHnO+5t9A8qY5qtZkWfO0nuus6MhaNnv52Qvo3AsG8J9AGn+J+GV0jtvJ/F
         WljvmwBpeccKni0T6QZLVodD8nZ9iSHPeqGTCK5sTIJ5zbReRJjf5j34teYYjW20DWbl
         8B/DlV8DCgZ53gZv4T2a+YBFfq9BWtVd0sl0wMm7x7oUyyHpqh/NHRrOdLFZIh5iO2tm
         1Jguy3TCFrS4fO9reVA3KvhYoVlZsnl28Fh3fC7pJ9o08r/e+VKEgN7Vq+pCFs/Zc3vV
         mKVbVL/hch37TXd0ZzY9I88sK2Z99hGA8Fw5ZcmEGBnT/kesG7AdI8HFh7t837U3FjaU
         f3BA==
X-Forwarded-Encrypted: i=1; AL+hErG6nHELEEPEhgjLSgoZ+wTe1qiBWfZu8Z1+Zm0VTlUht0sWd0KvFFFpmpT3zO8T9jFz7I7yOYtOz47Ju+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UCqGOu/z9sF4/pZHW/6Q7qi1oFxvC3tLbH28n5rmY3BfMKoEg
	9OSRGyObK6NtAwg5XnCA4mcYirNIRG8VV9J+FelpCyGi9NYDEgT+Y9qV5CvKZanpWI1cgdtGnW3
	KyjapTiIESa8lPWEg19jH/Ho63BfBudoc4PuAWtq3ggrNUKPmNG4SvQf3SGDDyocJDgtoqG8B9L
	9hRiX5Y1vS/736dt4j8q9Tj+x+PZ8tDtzT+ZOCFZUfpK7OJquvbdT+h4RJhvvqfhu8akd35R2Au
	rUaXhtjm5GCKRAa8aQ3
X-Gm-Gg: AYBFou2o4cocdAf/VspBVTax7Rx/E9XuMpYB5YsK6ytom7tOXys+fVkg/7TkoLu/04C
	MZl1faah0yOa/TxPh+LAzIt0w/vv11b41afF/Owa3dr9wrTo/Cugb1Moey+9IYFu2snBSwedIgU
	bVlgYArlakeCbKaIKcva6oz+YBqC2fFeNNxxBWAAzfyt2BObEFQc8FFTT5meHKOAPotY7DcNqEp
	d6MIwgkRf5IRsrdjMpdEP5ZvULxPl+9Eb/mnt3UlvVJbv8wgRbnhMRwupmZFFG7zehokpbmIsRi
	e4ViYBGEWxNSGlWym08YXRHNQlAKVo0PMmNYrQlorCEFzI9wO4G3YvPL01Nbozx6fGNFFk35H23
	HErrSM/KrLvPesvMyR72XwuqQGalyGp28i6U151hZR2b+Hr0s8zvKEUlePOjw0luWQxeSobPK6Q
	Afi83mreES0HS+jQVmFJrL1FyobHjAYh+BvP1j
X-Received: by 2002:a17:90b:4ad0:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b1b09f3fa7mr4363889a91.19.1794618852088;
        Fri, 13 Nov 2026 17:14:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae999e55sm5369698a91.7.2026.11.13.17.14.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 17:14:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67a781c1069so2560687d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794618850; x=1795223650; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcDgw1MpsvvJYR0IwaQT4PWuugDLWk1+xlvQyNqr1B4=;
        b=AQ5eMtLCtWNNdfBWBuHxFFGQ2mRgVKNGKGUXc+3e89B9xfF2Q/J0FGxpEmdhJsCi+O
         XS2hssPoADcXr6/LhBD0Oo482dVjRhDMiuJMYEidFvQ43XYEIXjEt+oMEHceWKxMu4Ms
         WWznYnyvLFeRUGoYJrrLayQtBoKeLSso4OaDU=
X-Forwarded-Encrypted: i=1; AL+hErF2CGNmTxk/pMiW7IjPOhVHO0lGd+Ia3zy+dFkFHB9tT+Rp9qSHw5ebsBF/LBrXeiXzDnxEuKW6tKty1mM=@vger.kernel.org
X-Received: by 2002:a53:bb46:0:b0:67c:cab:bd6a with SMTP id 956f58d0204a3-67d8979c38fmr1854251d50.99.1794618850735;
        Fri, 13 Nov 2026 17:14:10 -0800 (PST)
X-Received: by 2002:a53:bb46:0:b0:67c:cab:bd6a with SMTP id
 956f58d0204a3-67d8979c38fmr1854230d50.99.1794618850357; Fri, 13 Nov 2026
 17:14:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHi4H7GHGO27Q=O8Upfds8jk-ujSHU5h91hCZw6qjftNX7a2Ng@mail.gmail.com>
 <20261111173637687ugnRPRBKJkF0zihl662i2@zte.com.cn> <1d8b7784-f217-45ef-8f09-658044e441ea@sirena.org.uk>
In-Reply-To: <1d8b7784-f217-45ef-8f09-658044e441ea@sirena.org.uk>
From: William Zhang <william.zhang@broadcom.com>
Date: Fri, 13 Nov 2026 17:13:59 -0800
X-Gm-Features: AclHuK_maj7EsvGk_I16ayPW9r7muNo5t_6sq3nWetHC11ZBwP1W1SHWmOy8E58
Message-ID: <CAHi4H7FCOxcXnYkNfXNa_iO9KFZRSC96urJthPkgoem7C52ppg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] spi: bcmbca-hsspi: fix division by zero for
 devices without a max speed
To: Mark Brown <broonie@kernel.org>
Cc: shao.mingyin@zte.com.cn, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, pjw@kernel.org, 
	samuel.holland@sifive.com, kursad.oney@broadcom.com, jonas.gorski@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com, 
	florian.fainelli@broadcom.com, rafal@milecki.pl, 
	linux-arm-kernel@lists.infradead.org, sven@kernel.org, j@jannau.net, 
	neal@gompa.dev, asahi@lists.linux.dev, ryan.wanner@microchip.com, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001eed67066032433c"

--0000000000001eed67066032433c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 4:51=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 11, 2026 at 05:36:37PM +0800, shao.mingyin@zte.com.cn wrote:
>
> > > IMHO the upper layer should fail ... rather than having the controlle=
r
> > > driver to override with a risky 1Hz clock.
>
> > Agreed; the fix belongs upstream of the driver, not in ->set_clk().
> > Mark, which do you prefer: reject max_speed_hz =3D=3D 0 in spi core, or
> > have these two drivers clamp FCW >=3D 1?  I'll wait for your call and
> > won't spin a v3 meanwhile.
>
> Ideally the core should do this but that's quite hard to do due to knock
> on effects of handling 0 as a default everywhere, together with having a
> bunch of existing drivers that don't provide any information.
In that case,   Mingyin, please update the patch to ensure FCW >=3D1

--0000000000001eed67066032433c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVXQYJKoZIhvcNAQcCoIIVTjCCFUoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghLKMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
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
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGkzCCBHug
AwIBAgIMPaigUjJ79aI7cqBlMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYxOTEzNTIwOVoXDTI3MDYyMDEzNTIwOVowgdoxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEOMAwGA1UEBBMFWmhhbmcxEDAOBgNVBCoTB1dpbGxpYW0xFjAUBgNVBAoTDUJST0FEQ09N
IElOQy4xIzAhBgNVBAMMGndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tMSkwJwYJKoZIhvcNAQkB
Fhp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBALBa4WsRxbnpowbqT9/K1B0+Fmm/xDtPPHKbcdL+yvZ2PemlfcBwapeHvbu53TO6TTBCtmSi
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
na7zN428dqvN3qv0jZyGX18mmRwX7OEo4hf86TDhbJIwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTE0MDExNDEwWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAa5dcILoTGJNkndX0Md8r8pS8i6kOAy1lmYC8
46iPG27uHewcLmvWkKg5FQqnW/a0okWNA5Gc8eMcyklZK3FDwn5NrIDMzvNi1VTKIq5sy1EEYYqV
MqN/yR9EtuU8rSs8F1m8PHYHDG/E7G5je6XkQ8kuviAu18wT3eyOan9KTxOfcRKCBtfNk1QeHQ++
8oRZkAVRlUnS3Bm3a+tKJn6pMBHAvIZ6+zY8eKAypfeRpGYkGkKMQjQfi/rl3dHQ7eG5fCsypy+W
DBavrbcSBRKukbNrjpeTVVvhFg6fm+C8v6Oy7pG65xIEcsQSXGFLVzQsaMySbZQF6QzSqNOajiog
Bw==
--0000000000001eed67066032433c--
