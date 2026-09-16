Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5BD2D7398
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576236; cv=none; b=LTREXB8+DbVLBfdELEbIjfLeCS89GVrQeQJdOJudBTPSShDj980boeomyijnqJpirmacYxjfesBUqbY8alAoUh5l3AJ+u07Ch+sKvlPGZyc9tF4alou5sxBCv0sSbnRcO6I0IZmKRl9RVhdc7ey3LmZg9v6xjUF6aRcjBMPhpoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576236; c=relaxed/simple;
	bh=YBJAiI/3GnWtj5A3Hpub7tem4JvQnbPX02UMDdeC0EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBMZFQwyNHW+vwGKo+NBEswXLYX+SybJyHNIQlzXB4TxFVekJw5c3E4jOkq0azZ0Ou2ubPt14EIktaj3lTitESxLQ5Dazk7GQpYuhRd9XStA/+e2ZJWnia5mEr6KJHNedPyR5C/inbtatbwP9HIyxEuQZweYuOxVLFyOMBY5sw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=b4oXuH0x; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="b4oXuH0x"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-7f4e1568932so2161896a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576232; x=1790181032;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJeV2QI2rPXHHKII25NBeA5yXFBvE933s1AdR5g3mY4=;
        b=gyUy7xnIoS/GKjXow+Q4cuyq6EueU/PoQzjVge/CW7RsGZPTkVqkAjKDkvaheiSCUl
         WYcjkeLm6oLNWeobPUaD+ppWOr5Yd8DlALr2DU1kqy+yE6D5LXDqymwJHLnbBV1l114C
         FPbaACN6YIjH287AsojLF/8DfC0wDN0VwZSIzYgpUcebUjXroNZ3HMo6AyMB9m9JZg/a
         H3Jmk1bR+fi/urUBSAf4WlSd+HbM+HHsB8mjQOC7HbW/jh3YnwNyecAx6u2ThLlJgBhw
         M1nF4ygRpQMIBwka4/AyYO7mZP6WfpWXP8vZ/lZd2btbNKCi4bwx6tuM3siaaUQ+msyH
         uo6A==
X-Forwarded-Encrypted: i=1; AKwUvBxVg8T1UY0PdWwI1ZVHBsK1cefy+JaMKYRPhFB1+nbn1ju7mBm/t8z7UIMwoVzuh9dPuqQvHcAHWILoU9A=@vger.kernel.org
X-Gm-Message-State: AFuF++n99kXpj8SaVXtTMup8MBPOr3isf7yRS0I9KXuC98HcI1CA0ZGb
	euwRVz3iD73hhnM9J/y+EVgsNzFMPkTHUc4e+e0JExIyiDd4yF6D/pls2YRUVO9LlZ/JCFmjLWN
	UgitjSF+U/3qlcFhbtCY+x1VlD0G6ecqr4SkFqMyzjCkRPMuQdIGxg5+1Somx1N48XwctT5Zl5h
	SVBmeCvlQgzc44VZ2iNDEK+VTwL0YMky3A5jiSBbGP3y+VN8Zn6fsdkFJTOw2OI0W09ZsznHwC/
	WCWDeGWjSAI2UEzGu57d+0c+g==
X-Gm-Gg: AYBFou3pr6s/bq2vcl3ZN77Cm//KcOYkPx5DuRiOKggzFewXHBl7fTyZPJwiJPhXNum
	8G3m07XScP3h5/2vcHqvIBjNva5IyfrqF5nzPvZDIde1KVW1aRcBBDvJH4nYybkMCPnBK3SOmgZ
	xYQvgG2wXgk52eFhdbEVLFldKYKn0MpdYhCkEMD3pY6wxEUEU+axSn11g9M+GRiATUs1HumF80E
	NO93tsa7pOaMVrD9X0cmbO40hYhFSJpo0iBMsF4pC796JYmOfc/Jrcyrd2WUL+gB9HWeOKR+8Q5
	QtnYSudB6VZb9DJNHrkATtMwKLVanvh1/THGIHnyzmwDXJki64sFzeW0HJ0l8KFzAVW0eu65pse
	l6yVds80n8ZxEgO4c9qTRHtVEBOUznWYQbAXCvACR85Dk3y8ZCv/WW4SoohPLrjD+GNII86KfG0
	2T7Ax9PzlMu4EpXxRnv8F9fG7oXceEENwR3l0VHWigkQ==
X-Received: by 2002:a05:6830:6105:b0:7f8:4ac8:bd2a with SMTP id 46e09a7af769-80b2e558715mr8183033a34.12.1789576232450;
        Wed, 16 Sep 2026 09:30:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-80c46fb719asm103748a34.7.2026.09.16.09.30.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:30:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a642d690caso6815360a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789576230; x=1790181030; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJeV2QI2rPXHHKII25NBeA5yXFBvE933s1AdR5g3mY4=;
        b=b4oXuH0xtaInSgKebud1k8RSaHJj2zDWB8w9WI6dX3eKiglSBH5ModZ/7VRVxNooVT
         b5lGGU5g2IHoS6kB4oNNL7cA8ndSwQelR/CV+o8yToc+Y7xUG6VMHZVZVAHt24yhk8Tm
         gsAFPd7qCIs6AXbmKh4SA2LgOgNDX1zEZTw5A=
X-Forwarded-Encrypted: i=1; AKwUvBy7l2oe0gr5c46pC8yx+fjXF+3pAT2Zh1nfBsyAE6Vjti7VRJ0lU1bdY0sO0oDAFu4+GHzhO7OXAFS7siA=@vger.kernel.org
X-Received: by 2002:a05:6402:450b:b0:6a6:32f5:90b1 with SMTP id 4fb4d7f45d1cf-6aa22433a12mr5727899a12.19.1789576229766;
        Wed, 16 Sep 2026 09:30:29 -0700 (PDT)
X-Received: by 2002:a05:6402:450b:b0:6a6:32f5:90b1 with SMTP id
 4fb4d7f45d1cf-6aa22433a12mr5727846a12.19.1789576229274; Wed, 16 Sep 2026
 09:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825191619.2326087-1-danesh.petigara@broadcom.com>
In-Reply-To: <20260825191619.2326087-1-danesh.petigara@broadcom.com>
From: Danesh Petigara <danesh.petigara@broadcom.com>
Date: Wed, 16 Sep 2026 09:30:16 -0700
X-Gm-Features: AcwNN1UI2rn9CuIcapnWbtjF0yW7-pc0JUcoRwAuIIKv4HjYApcFiqau8nGwTHQ
Message-ID: <CADvvoPnp5cWDj8ogLAuZR_=mDi78K5uJFLUXrvo-jo8ctPKasw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: bcm74110: Cap rx_svc_init_list growth to prevent
 PMC-induced OOM
To: jassisinghbrar@gmail.com
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com, 
	james.quinlan@broadcom.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000007e273c065b9c2f74"

--0000000000007e273c065b9c2f74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

A friendly ping on this patch. Is anything else needed from our end,
or does anyone have feedback?

Thanks,
Danesh

On Tue, Aug 25, 2026 at 12:16=E2=80=AFPM Danesh Petigara
<danesh.petigara@broadcom.com> wrote:
>
> From: Florian Fainelli <florian.fainelli@broadcom.com>
>
> bcm74110_rx_push_init_msg() allocates a GFP_ATOMIC struct for every
> BCM_MSG_SVC_INIT word received from the PMC co-processor and appends it
> to rx_svc_init_list with no cap on list length.  The only consumers of
> this list (bcm74110_rx_pop_init_msg_block / bcm74110_rx_flush_msg) are
> called only during probe and at shutdown respectively; after probe
> completes, PMC firmware can continuously inject BCM_MSG_SVC_INIT words,
> exhausting GFP_ATOMIC reserves and causing a whole-device denial of
> service.
>
> Add BCM74110_INIT_MSG_MAX (16 entries) as the maximum list depth.
> bcm74110_rx_push_init_msg() now checks the count under the existing
> rx_svc_list_lock before allocating; if the cap is reached the message is
> dropped and a rate-limited warning is emitted.  The new rx_svc_init_count
> field is decremented by bcm74110_rx_pop_init_msg() on successful dequeue
> and reset to zero by bcm74110_rx_flush_msg() on shutdown.
>
> Fixes: 52436007b862 ("mailbox: Add support for bcm74110")
> Cc: stable@vger.kernel.org
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Assisted-by: Anthropic:claude-sonnet-4.6 cursor
> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>
> ---
>  drivers/mailbox/bcm74110-mailbox.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/mailbox/bcm74110-mailbox.c b/drivers/mailbox/bcm7411=
0-mailbox.c
> index c8709d509912..bec138d76914 100644
> --- a/drivers/mailbox/bcm74110-mailbox.c
> +++ b/drivers/mailbox/bcm74110-mailbox.c
> @@ -97,6 +97,8 @@ struct bcm74110_mbox_chan {
>         int                             type;
>  };
>
> +#define BCM74110_INIT_MSG_MAX          16
> +
>  struct bcm74110_mbox {
>         struct platform_device          *pdev;
>         void __iomem                    *base;
> @@ -105,6 +107,7 @@ struct bcm74110_mbox {
>         int                             rx_chan;
>         int                             rx_irq;
>         struct list_head                rx_svc_init_list;
> +       unsigned int                    rx_svc_init_count;
>         spinlock_t                      rx_svc_list_lock;
>
>         struct mbox_controller          controller;
> @@ -148,7 +151,15 @@ static void bcm74110_rx_push_init_msg(struct bcm7411=
0_mbox *mbox, u32 val)
>         msg->msg =3D val;
>
>         spin_lock(&mbox->rx_svc_list_lock);
> +       if (mbox->rx_svc_init_count >=3D BCM74110_INIT_MSG_MAX) {
> +               spin_unlock(&mbox->rx_svc_list_lock);
> +               kfree(msg);
> +               dev_warn_ratelimited(&mbox->pdev->dev,
> +                                    "PMC INIT msg list full, dropping me=
ssage\n");
> +               return;
> +       }
>         list_add_tail(&msg->list_entry, &mbox->rx_svc_init_list);
> +       mbox->rx_svc_init_count++;
>         spin_unlock(&mbox->rx_svc_list_lock);
>  }
>
> @@ -225,6 +236,7 @@ static int bcm74110_rx_pop_init_msg(struct bcm74110_m=
box *mbox, u32 func_type,
>                                  list_entry) {
>                 if (BCM_MSG_GET_FIELD(msg->msg, FUNC) =3D=3D func_type) {
>                         list_del(&msg->list_entry);
> +                       mbox->rx_svc_init_count--;
>                         found =3D true;
>                         break;
>                 }
> @@ -248,6 +260,7 @@ static void bcm74110_rx_flush_msg(struct bcm74110_mbo=
x *mbox)
>
>         spin_lock_irqsave(&mbox->rx_svc_list_lock, flags);
>         list_splice_init(&mbox->rx_svc_init_list, &list_temp);
> +       mbox->rx_svc_init_count =3D 0;
>         spin_unlock_irqrestore(&mbox->rx_svc_list_lock, flags);
>
>         list_for_each_entry_safe(msg, msg_tmp, &list_temp, list_entry) {
> --
> 2.54.0
>

--0000000000007e273c065b9c2f74
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
GLYYHVIFsNlNBk9ehmbzaNAGKDZQL2g6yMMOyfvt2s5Y4jecunfY+Sf5c3Ptg5X23fqYpno7w5us
Fyf9UX0AfPQxXj3xOYXXOmW3wHsEwXQ/ix4BSk+9TqzVwMiNm1pyqJUxPMdUwUzCVHZBhftOjpfn
FV7xK09ekAS7/FgXzG/fp2YRiinLawP/OAq2Jso3/NzsEOjKVDyQp9NjKBvnT2KPEG0EQ/YHKXaN
G0nhKAI9CNoSnLc+L6668zqiuyfY+4GBwm5fx3YFPlYZHr0JcusCAwEAAaOCAeAwggHcMA4GA1Ud
DwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6
aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNy
dDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2Ey
MDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIG
CCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8E
OjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5j
cmwwJwYDVR0RBCAwHoEcZGFuZXNoLnBldGlnYXJhQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUYZsdWn6M
L18zay5xy95GDwiowUEwDQYJKoZIhvcNAQELBQADggIBAAO+GZJHoHFGjKzRRmPg8zMhqkUoAurb
EVL1A6UGmL2cSAOuQcZdI5ESkaDFKYuhsSB3dEr6ZWVhQk5p+AP2MxVJ8SViEV7NP3DVtFwqaE3I
VongrfkM+43NJTKEUBTJHYFGsANIUubqC3I69Dw8PxFghAU6M6nJxqAvNgxjMR0GRlJUR9eRR3GY
QszACooBBuGtl8VM9fZKqQUuu4ypKu4coRSbwWqKKuJXfElWpqakEjgK2szPloPPAvrfXN4//ilz
Rcgf+v6s6tPvaP0Kuf8Kvk3qLxHGVFzFdzLcwKEm/H28pKAXxd7nHiUQcddZjwhYtLahzfF0PCxP
W+RDL3K2gf3KD5nDX7Fx8bsYFQDrDWJa1cpuLVjzhkuWx/k+6hJ5NJLRB6OnHNnggQADstvnT4Z/
FdAzNY/Cppgsu4XfgsPmrDAoXyiFvcjHRS7J5hr0ce7W57bdKVlEVdeK10o1/23F8H37kp0V2mYj
7gmkwjbisZjfklj55cFq9czwyMyedkz0EW1u4CNRfwSZ/a6tZ1dwGPSe4CJcUdbKR7N3tnOwPzO8
gWuU54A5ADxxRL34dPcj7LevtZo+7co9qIEdODq3zfJRjEmnKnHeWLRzV9HrM6rn3l47QP3YlxjV
hbZundqE7qI4+OxL2uh7uYgN4JIdKmzkZRYIcWa/uPc1MYICVzCCAlMCAQEwYjBSMQswCQYDVQQG
EwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0Mg
UjYgU01JTUUgQ0EgMjAyMwIMXIDSN3UslytorZSOMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3
DQEJBDEiBCCHSgxVZBXAaBgixHARt4ZryEaa2kU/LlfhvydETRHpYzAYBgkqhkiG9w0BCQMxCwYJ
KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA5MTYxNjMwMzBaMFwGCSqGSIb3DQEJDzFPME0w
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZI
hvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA+a78NLV7/tcKupzG4d0k21TM+
nlhPYUxHSltjbQD3psqsSp05xE0CZxXIPxjivj2+UQ3R5s0gP/0G3DiurBAosqs8f8kxZf0Xrdea
wFTbhVPn8+cfgBhD+FKAyCdK/4rCke49zgn6QmJijfrhpqFzKGv9q0HM8GOsQ4OLEja8o3iXQg3M
iMy/0ilZP+k28kVsF8JWCH5ZZxHPO2GuLOdmi4pEGX5AdaSVA9o1IBqNgDxpCj5cNhi0V/ziGS5N
HBlhBubqRiR5aAylQzwlkm5yNTJpAnaz8bh8U48BrrrV18cqxn6E64Ii0BD+4vCx1/KO61Xnr66v
oWT9fch/bVZr
--0000000000007e273c065b9c2f74--
