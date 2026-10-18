Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D93876CC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792344043; cv=none; b=DjQSKAK2BTSGOcXwp4ddJMHpox4yW1Dae6QjPTotn8MbYDCVDHXwZyWThr+Lh5sNfiCFIf2Z9E5MQGG73wURLoSLKGxASUsPBxUAiaMo1TQOblAUbMQEeMUy/W6JyyPwFST3bxGrGGHrC7h5pgWgPopIy2GKbZFeSCwS24G1wkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792344043; c=relaxed/simple;
	bh=vUbZtJ/MvcG6rBlRrNNV9fyTQDokTMd/9SbDBCA+nQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+730Qzj4uPqlaNV1vxYnR7yucsNK9r/UkL5t6NhVb0CiwlFkyQf/h1R51u8Db4OE2oVWRwZ/vDEGvbsRIP/xDfjQlvxwUhuargRuiyWjoT/opMEzOti8ycdfus7bcjbIDfsws1PmhXdTPGi3xJaxTC6Ijx1tEyh9YtI++lLDq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GGnHQ9kD; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GGnHQ9kD"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so644934a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344041; x=1792948841;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NBOTPqKnQ/lpNP4k4ScZzcdpirOuWpA0W9VVMVaVYY=;
        b=UKaYwE3xwOFainyrnd7y+qRNkSf2haFdBwHAMleRj3Ba84H+5KZSJKywa7GCpsJ+C8
         GMLkxKTy1K/8Y7XN72AlHvnvMD3ktdjKYnuDyeFzTIMy3yb/2FR7wa5CbYoviLHej+Ev
         o8P4iZ+AaVCx+xeAFdyHyvD+JIgiyL+e7X935cDCA2+mv2io3+wyKEp+1IwNxQcvhZDL
         U3D+J56Aa6x3qHtAteVZeIF89oauD3+O3zNWl42RG2EDVXqcY7yf+5Jnikytvv16+/BT
         R+PfLwcRokIuNqoY0CePmxgvDaaIi3RfXAb8qCs6YQcg0xlGbuQBNkaejZvou+I2EO0c
         BQmA==
X-Forwarded-Encrypted: i=1; AKwUvBzlJxub54u2UKA9JuSYq0+GVebGj2TxgFuXwN0hG9eW7E5kOv/tqRuPaQUqO7Z4M7hXH3bSjgJWCKbcPCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA3uF0r0UOThSzuawUQzFucoPGlVEpRC5AgWxJ5Cu2txqUSEqk
	o1E+iPKu7qNxLCuRIwBPwWuAij98z9WxB37WkZT+zuihUmw/BM6NplUOhaQci8n1FsstRRClP2z
	9cC7Gwy+ZO9uE0m1f+7uCiKpD0hjYM26zCbr1iDJZ6E9sDaAq7OAvu9mfNgZKthDiyx+MnJZCfb
	MNSEc+VTveMPzV6mrhKnjw7X4IL/c9PYGkJB7KJLg4TwvGJdNhGtH5UclseG1saCN8y9RP56ZXX
	6kfVssJnUpL9vHpDKzazfxkAw==
X-Gm-Gg: AYBFou3yXR4FCbyDufkm3HJUJvjBJbtSy1zUvwMjiaGYoJyKJDFu7nEtqSOFaZmxQ/J
	LmbJigvODZMrtWK5qcAFeybk78UfhtYbdc16dy6c7Sf2I8zktD7nS5KWK2pKlVSO/fMewzXijlh
	lCdFe7NhErqgcQTBrukV1HkOnRRpyARaHiSxknXhw08OWrcrw95wTb2YhP4+FjPk4V4nT8nI+tu
	f/6RF/pnM3pWB3d/qjbk17Y1DFYUKl3sIv30/Pvh/2tRDnsliWIRFQsnb+ZwrWc07r/PslTa4ET
	CnwonxzhsNNwrQ7YV/3i4rpzXwU4vJUo3Y17H6qNFjlv9crl39nhjVeEplw7IPudufkQr6axfYL
	eaXpajVcp5GYjnCeQcdP2H6NCXPgERVx4AQZNxUP/qWKeqIxPHhXvnSE9JF0QHdrMfllHgymXYJ
	OGSI/lA6vk8TMhGIcdRFvUFJVoCxqcUMAHRO+RiMuXMw==
X-Received: by 2002:a17:90b:1c83:b0:3ac:a11a:7c91 with SMTP id 98e67ed59e1d1-3acef55d796mr4626412a91.44.1792344041188;
        Sun, 18 Oct 2026 10:20:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3acd3d2b819sm1723259a91.3.2026.10.18.10.20.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Oct 2026 10:20:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso4003515eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792344039; x=1792948839; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NBOTPqKnQ/lpNP4k4ScZzcdpirOuWpA0W9VVMVaVYY=;
        b=GGnHQ9kDqB3omtIbiC6/FSSupUxhjA+c0HGMBfmoLIHYnm7DcPXG1zNA87JJLrlclM
         dtTfhgvbJp2usOen4l8hQp5kQHFrWg1amhghtxYIGBdm/8Bna6h6n2YFme9ao6nmcEgK
         SXF4mTolE0LY6fj+GP7TSZyl15kH1MZceWP1s=
X-Forwarded-Encrypted: i=1; AKwUvBx0OedZZkVsOtYilR3eqHgygiuwq9uhmU4daRIYv8YfdL6o04GVIcXj8A4xMzW37JcdaHzzGJ9i5rotjOU=@vger.kernel.org
X-Received: by 2002:a05:693c:415a:20b0:361:aca0:522b with SMTP id 5a478bee46e88-361aca053bcmr8353116eec.11.1792344038836;
        Sun, 18 Oct 2026 10:20:38 -0700 (PDT)
X-Received: by 2002:a05:693c:415a:20b0:361:aca0:522b with SMTP id
 5a478bee46e88-361aca053bcmr8353085eec.11.1792344038206; Sun, 18 Oct 2026
 10:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013200645.1346299-1-bhargava.marreddy@broadcom.com>
 <20261013200645.1346299-6-bhargava.marreddy@broadcom.com> <CANXQDtYRVg10b+kNyrNTmwXy-Dre7ZhSW_XsJK8Y1SqUR2128A@mail.gmail.com>
In-Reply-To: <CANXQDtYRVg10b+kNyrNTmwXy-Dre7ZhSW_XsJK8Y1SqUR2128A@mail.gmail.com>
From: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Date: Sun, 18 Oct 2026 22:50:24 +0530
X-Gm-Features: AclHuK-ybOay08gJRLMP4GvlzGgmZKLyBotvihyhhRL8MA2xQdDW1yKJ8IKP614
Message-ID: <CANXQDtbXy=e6a5_3sv6o6P6S88GvCYC8eb1K1TatKsArVW_P4Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/5] bnge: make NQ0 persistent across
 open/stop cycles
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, vikas.gupta@broadcom.com, 
	Dharmender Garg <dharmender.garg@broadcom.com>, 
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>, 
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c8c51b065e209dff"

--000000000000c8c51b065e209dff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 9:02=E2=80=AFPM Bhargava Chenna Marreddy
<bhargava.marreddy@broadcom.com> wrote:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> Source: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/2026101320064=
5.1346299-1-bhargava.marreddy@broadcom.com
>
> On Wed, Oct 14, 2026 at 1:38=E2=80=AFAM Bhargava Marreddy
> <bhargava.marreddy@broadcom.com> wrote:
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers=
/net/ethernet/broadcom/bnge/bnge_netdev.c
> > index dc6cf3525034..c6649a2c5876 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> > @@ -1209,10 +1209,20 @@ static int bnge_init_ring_grps(struct bnge_net =
*bn)
> >                 bn->grp_info[i].agg_fw_ring_id =3D INVALID_HW_RING_ID;
> >                 bn->grp_info[i].nq_fw_ring_id =3D INVALID_HW_RING_ID;
> >         }
> > +       /* NQ0 stays allocated in FW across open/close */
> > +       bn->grp_info[0].nq_fw_ring_id =3D
> > +               (u16)bn->nq0->nq_ring.ring_struct.fw_ring_id;
>
> Discovered by: gpt-6-astra, opus-5-5 =C2=B7 Ranked Medium by: gpt-6-astra
>
> bnge_nq0_init() now allocates NQ0 in firmware and sets it as the async
> event completion ring only once. After that, every open reuses the
> probe-time fw_ring_id here, and bnge_nq0_resume() re-arms the cached NQ0
> doorbell.
>
> On the way back up, bnge_hwrm_if_change(bd, true) returns only rc and
> does not check any response flags:
>
>     if (up)
>         req->flags =3D cpu_to_le32(FUNC_DRV_IF_CHANGE_REQ_FLAGS_UP);
>     return bnge_hwrm_req_send(bd, req);
>
> Suppose firmware resets or reclaims the function's NQ while the
> interface is down. Would queue 0's completion ring then be allocated
> against a stale nq_fw_ring_id? NQ0 doorbell writes would target a ring
> firmware no longer owns, and async events would stop with no error.
>
> The commit message acknowledges this ("Recreating NQ0 after a firmware
> reset is not handled here"). Other probe-only firmware state would also
> be stale in that case, such as the context memory from
> bnge_alloc_ctx_mem() and the registration from
> bnge_hwrm_func_drv_rgtr(). So the driver does not handle a firmware
> reset while down today either.
>
> Does firmware guarantee that it keeps NQ0 and the async event CR
> configuration across FUNC_DRV_IF_CHANGE down/up?

Yes. Firmware does not touch NQ0 or async event support across
FUNC_DRV_IF_CHANGE down/up transitions, so the fw_ring_id cached during pro=
be
remains valid across open/stop cycles.

A full firmware reset is a different case. NQ0, context memory, and driver
registration would all need to be recreated=E2=80=94which the driver does n=
ot support
today, with or without this patch. That recovery path is out of scope for t=
his
series, as noted in the commit message.

>
> > +
> > +       rc =3D bnge_hwrm_set_async_event_cr(bd, nqr->ring_struct.fw_rin=
g_id);
> > +       if (rc) {
> > +               bnge_err(bd, "Failed to set async event completion ring=
: %d\n",
> > +                        rc);
> > +               goto err_free_irq;
> > +       }
>
> The commit message says probe will "configure it as the async event
> completion ring (a failure is only warned about, as before)". Does that
> still match the code?
>
> Here, if bnge_hwrm_set_async_event_cr() fails, the error is logged with
> bnge_err() and the code jumps to err_free_irq. That tears NQ0 down and
> returns rc. bnge_netdev_alloc() then treats the error as fatal:
>
>     rc =3D bnge_nq0_init(bn);
>     if (rc) {
>         dev_err(bd->dev, "NQ0 init failed rc: %d\n", rc);
>         goto err_free_port_stats;
>     }
>
> So register_netdev() is never called and probe fails.
>
> Before this patch, bnge_hwrm_ring_alloc() only warned and kept going:
>
>     if (!i) {
>         rc =3D bnge_hwrm_set_async_event_cr(bd, ring->fw_ring_id);
>         if (rc)
>             netdev_warn(bn->netdev, "Failed to set async event
> completion ring.\n");
>     }
>
> Before, a firmware rejection of this FUNC_CFG request still left a
> working interface, just without async events. Now the port gets no
> netdev at all.
>
> Should this failure stay warn-only, as the commit message says? If it
> is meant to be fatal at probe, could the commit message say so?

The failing probe is intentional. Without async event support, the driver
cannot receive firmware async events, so a netdev coming up without it woul=
d be
only partially functional. The current commit message is inaccurate on this
point, which I can fix in a future revision.

Thanks,
Bhargava, Marreddy

--000000000000c8c51b065e209dff
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
AQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAApofUop+/UHkrN6XsujuypmU5TcliKv9ri6x/89Mj8TAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjEwMTgxNzIwMzlaMFwG
CSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYI
KoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAMUMG2
lZuNQCXadkZvKo4ldIOEU8TFdTnbMsifAZR48R/Z3o/xforzNYndL8r1O2AZ23tBWerKVNDfC2xJ
Y399rF2Tt8ZsOd3BdPdDJLbNzWx9gK8zntB+FlyNBeqHk0RUxcH/uYkJaCo+VY9GQPg4xlhjhK/r
BFi1uRJnDzkicWwu5OGnxw8p9Z9b96p5wkP+/HnT7NHF6D1Wv+6oM740CH/CAHhSrRcpwAccKqG7
si1wMIKKWNYkn8EWfKUbfpYfx3kiLRY8uqzCqe6H3erK5vsaimg09Ptv2b/AFAPHlw9pedgE7BM3
RimfLrPxhVU5MGyg9POdup0nSfxS6HFP
--000000000000c8c51b065e209dff--
