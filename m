Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793401830;
	b=H8L4Xvt0UqqJZvswuEng2x8d2XWSyb1JLD8djQ4n902Cy0+IZXZBPn0go1wdzUReDkCC
	 +u48ENaGM+8dKs3cEdtwcjAG3uBodF1Cdr23JKIs9FRHqE6rmqY7nju7T2vd189yUOQY+
	 3Zy4ykORo1QQWy7SGLCoxa9tDY+p5SbdIzI6kiG1bD2I+JHnwip83lBO4jHsdWiVE37bt
	 bT2hqjygq2Rp7zCw8cyDeqbTa7qCP6m/VOYKPC9MiVdBtGdjhkjx0u7nsiHgkGeNfpoJH
	 6O+hUDd0RoREjfgVqCY4eEig7wNGDlhSMdu5NpDbkY9OWHM8/Um9TQ/ey5LGJWRLJvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793401830;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=OSGkjk/zK9RZwrZq4zQQf/aYsYhzR8zQJNTXjn2n5pg=;
	b=dcOC5ddzv9AcUf5ohpql+8OYfKzFXFgH1pDYQOVM99eku1s3CzF8cZxH7RaTUQzFX+Gx
	 XB8lUhQaqVbKHx7k2WsnkTf9HQcdfy2rGwXt+yUAXt4nl2IdFe5w3oWNvnCqK94Bxgh56
	 ZKvkJ/KgzbacUqYkP8UyNl1DOu11i83001Mzk8jD7Szid2SkoFYxo7TCaogcnNjkR/6hL
	 OBecy4W40VOGzFuGb1LHJ4Z+gO+UokC9scOciHlumi7GTFx5KCKLYo1/WYczxiRAX0kEM
	 5/iksGFQ0KCWO92amKpeW+j0izFfgMAcDRfw6OgrfDp6cg/jzZJRGdPo0c/2JxIBcFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AhKZ4Ahw;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7879606A331
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7879606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AhKZ4Ahw
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so568342a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793401829; x=1794006629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSGkjk/zK9RZwrZq4zQQf/aYsYhzR8zQJNTXjn2n5pg=;
        b=WhihbCTgnnWCGz8huqP/wqkbeFq3xMbSt94IMJLZWEQXs2gnAoPg4YQ6dCCGIq7CCa
         TSDa0qSgxW5ZnIcAflVdDHpwKxS6isuNGmn/UOoqneStfehqVFYaLUSF90GhMqerjc/S
         rhG0DaUiQkd76pa4Z8BtGufO3XNGcc/OOAnhhhkUyvD/E8OWTR4eTC7hZulpHJ5zr1Q/
         raSn+Lvootvosjis1ZOOq9E6+z9hBwUCAT68hrMkaKUCqlMTEEV2wekGU6CVpLZOvZdQ
         RPr8PgkHdzQgAlgb6nQc+vPMgCvt2GLoe/qfqsChubvQonpP5gpoIlqjpT53Vt0K/qTx
         VV8w==
X-Forwarded-Encrypted: i=1; AKwUvByCMLw1jNlcPFr21zSA8MOyVf+InMqgkRjorC8VTNit5vgW+sR14GeFcAVeJdRromEYcEwrQeZ4k46JpQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1IuOJhVBDCyBZ/HyI5ynWxwLd4F+X4FQnf7I+ddVgXJKWlQ/0
	NBixYsjoDpaOFCPHVtXKMZX+8OqL2PRvbFH3u3xIjPfxvnFO2WLlPzU3s/3Wtu3Wu8wt4Ie9YyU
	kXmPboYPOF1Un5Ky+MZZPo7UuBQQfpkMYeFI1mZ+NcOqAU9F0CDjLRN7FZpeIbzKehbrRGBZtbZ
	SHySK5ZGwOggNnF3qkui3gCZ/FaSrDSV1kEaxto5+fMYvuRD0hUJydmqnq3sJ7APIwD60+Qu06o
	CPFgGT8CDaHRn56QiI=
X-Gm-Gg: AYBFou0HyBhpyJC28Ag4krwR74wHbFqLxoW8sHmanffoMNPmP4gJmjlgUXuNuZsWu9r
	kzruLg0yHEjsst2+2hKGRxRUnXhK42zCYXaYMK4U5GvAYc8o5bFw3IEuwMChapIqKdRYzbnAGP9
	7YJiMzXWZdx9+aJ2vmqMmLI/DbjbQhYHb+hC7zBVNT6wN1ts2ebaBPPW3WFW+0RHkgde2tuMBS2
	j6fnygnJxrAb2onz7U0Lv24GFLyA3tVU95AIy3w2N4ZcI3VOtnx2ev06KTv2SRcQbdVYNKV6TcF
	yxJ15RuFW8sBGWW9xaKTw5UPNEVmjLegRXdbJ1jai1IeAL3BZ0tLrpZTkdGqlgchf38KoJOcZxQ
	Hv78AeCmSYg3jSOK+wqJcQCuC+fNxb0OLt87379WEEm54WRZMG4QuWinDl/tAjjE1cTCCAftYJl
	vqHQa+NKtW05ANqtx0HzP9E+lFwHx96F1nZ08=
X-Received: by 2002:a17:90b:1811:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3ae897bae6fmr2858045a91.29.1793401828971;
        Fri, 30 Oct 2026 16:10:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae87dc5982sm1014220a91.2.2026.10.30.16.10.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 16:10:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c465c4c8da0so140858066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793401827; x=1794006627; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSGkjk/zK9RZwrZq4zQQf/aYsYhzR8zQJNTXjn2n5pg=;
        b=AhKZ4AhwQ35tRjgdA1adHuedjTG5bHZmiwymiR/k6w3txeu+aJ5aqfor5NcmML214U
         Oxu/gcRBrDd5sUIZoqs2lcPEf97G4Q0kqFgZqB27OYHVmTKF3Ky2Ow/fHa0KCbQp4xbu
         up4GD2FifrCQRBlPIaBv9Uk51wMReGG6NN5WQ=
X-Forwarded-Encrypted: i=1; AKwUvBw8G4CMeXTOdqY7jHPT1hY2u2nRoLhpg9BtbPcPo5l2ujKj0m9pJXWwankqKbDYFs8q1VjK7KkMo2UlP5U=@vger.kernel.org
X-Received: by 2002:a17:906:c142:b0:c46:8063:220c with SMTP id a640c23a62f3a-c4ca7a09d81mr334387766b.11.1793401826733;
        Fri, 30 Oct 2026 16:10:26 -0700 (PDT)
X-Received: by 2002:a17:906:c142:b0:c46:8063:220c with SMTP id
 a640c23a62f3a-c4ca7a09d81mr334385966b.11.1793401826355; Fri, 30 Oct 2026
 16:10:26 -0700 (PDT)
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
Date: Fri, 30 Oct 2026 16:10:13 -0700
X-Gm-Features: AclHuK9hJDTZaouUxzpKmWR-DkKmTaJI8qHS-cV9IrWrbtUnZMWGYhJMWGH5xP4
Message-ID: <CACKFLims7tJxbs-ozin-yTQ1W2Lf2Lc8mO0YH=m6KmP4a7nVTA@mail.gmail.com>
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
	boundary="000000000000d6c05a065f16e650"

--000000000000d6c05a065f16e650
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
>

I've discussed this issue with our FW team and they have confirmed it.
Writing to an MSI-X entry that has not been reserved by the FW will be
silently ignored by the HW.

...

> @@ -11701,8 +11702,23 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq=
_re_init)
>         int irqs_required;
>         int rc;
>
> -       if (!bnxt_need_reserve_rings(bp))
> +       if (!bnxt_need_reserve_rings(bp)) {
> +               /* FW may already hold the reservation from an earlier
> +                * reservation that was not followed by growing the dynam=
ic
> +                * MSI-X vectors, e.g. because the allocation failed.
> +                */
> +               if (irq_re_init && BNXT_NEW_RM(bp) && bp->irq_tbl &&
> +                   pci_msix_can_alloc_dyn(bp->pdev)) {
> +                       irqs_required =3D bnxt_get_num_msix(bp);
> +                       if (irqs_required > bp->total_irqs &&
> +                           bnxt_change_msix(bp, irqs_required) !=3D irqs=
_required) {
> +                               netdev_err(bp->dev, "Unable to allocate %=
d MSIX vectors, maximum available %d\n",
> +                                          irqs_required, bp->total_irqs)=
;
> +                               return -ENOSPC;

Once I rebase my net-next series, this will likely not be needed since
there will be infrastructure to scale the rings down.  I will make
sure to handle the case where dynamic MSI-X falls short.

The patch looks good to me.  Thanks.
Reviewed-by: Michael Chan <michael.chan@broadcom.com>

--000000000000d6c05a065f16e650
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCQf9MW
8gY4/IvNlcCmrTSqOnGovXPH4W+B1E23JSvk/TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjEwMzAyMzEwMjdaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBcfJ8I23esBU74IemJCMQgOH3mSRLwDKJj6yqZgxj/
NnAgmRMmQ9P8piRvR8+mGpb/6TqZ552GRyHx+uJLqYk6GoOl56DBkJrCPdAne5kxLiwBHoTexqR9
Ehz7F4fFV5jdLr282KyIRI2em4Q+0te7dmvfQLqB7k3F/ZBh6Ge+31KfBqkOoV2/fSbIVKQxi6e6
+IadfQ9qPHemjS4HfmU0czMezcqdG0w2dDs0aHreA3XH0mfK4hEnrGMjL+Zp8IYpTcYfsU3f0Jh2
9Etgde+MI+EqhEsuFFSD+3XBN37xkIKGopQfenWSwp1cx7cyzc+leofWa2sk9UobtNpz2Hwd
--000000000000d6c05a065f16e650--
