Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5963AF644
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761300; cv=none; b=bSPJIRfzQrEB9rwc8s0ZUFT04b+z6SzQTejyKCf5UuKQvFCPnRjSD+LfY0eZcZIZsEdjNA8HZe03srb4faba/qx68pKgslNaOrs7sDElqHb3O+s78AvN9VWeWco8ZOdL26mbKHq6bHFlUt+FT7MXkknWr9agDR3rgKNMIaLMfos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761300; c=relaxed/simple;
	bh=2727wpZMjxaqDJx/xyX8PSvCAPU7rdvTg2xevUGGUsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEur6QJyhXA8POgfVgYAnV1wk+mZnV+HiR0qEmOHJBtRrb+t2GNVy/5WLN1DxVZxsE5sG+V1H/mt4+uACNEB7GpZymCdW4MNU64h4F9ffHkLA+mN6uSE0HlYkizn25HbmHGbEguGuOSNccGLShsjhLBiscPKUwnPaygzGwnP438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JLI0IzuO; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JLI0IzuO"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-8ab8d96d02aso2502657b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761296; x=1791366096;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGAzSUBNj1nzc/yVj6lDb+/P/xqk8HT1SBfqkyF7NBY=;
        b=Pd0G7UjJZJYM0T3ymqAU5HGIPjaMdEBiP087QiE4IH5USFjjV9rLdqAiHoyidZNvsz
         rtbTAPnSGptjF6pAVcHfdSz3/dEa8vnPCb4hIutNcAEqhljtLnePZBvwR+/CXCs5etvV
         M6x8t080kwuI8chK2I/NJKg4yskGVNHcGdqlnrKw9zxjjbkoKZufOKXtVI+N8pvQdppU
         AY+iJUdLik3P1gw+rinf4wxK1hMiHIax1VVt0LzLsolB099mz7sRn7WytLBu6kEQ1sNu
         EpW53ir3jZ+XNG/sIcHnNycMVgJlfw3r7KL0Bs6hRdvTbfJxKi/SnX4HZfaKoHdZ4MPH
         mMIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsdtnRYh6EP8hJrpdTKSlnDh3BXBROI+vy+xcAXXfIQWOvwbbEAfF2BLWO/VMgNOL0WCXIQxKzKVljwec=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9HRNzNx0N0+xA7AHhRV99t/uM4W3wdue7YsmwwbTq8NaQioJt
	N8tq1K3crQRhx6JNT2NQti6tPS7WvRT4GyIsp73xQHNTetAIPn15/lb31UnSK8xrk3Xxu6oBV4B
	WL2ATmUzeXX9CqWLSfP7cz7aDlnkJhpdbFU7+KKTqh6j7r67gzw1m6qAjVoK2aG4ERiBz//FDcm
	/D69icC3ZEf8bhI2qUHRQBWbkTzToXOiOrmL8k08j/E43lwN2Nb9w3RD0eLpUxznkxwNLbsDNSK
	nqe1AFH3WiNPx819Bo=
X-Gm-Gg: AYBFou1l562dwC1YyudrkVY6gkd0zD01QeuWhox/1kwecZ9YmTeFEmU7j5RSGjryJxg
	zjRSZIBWmmzaZcpStC9lyrlClu6jtyT8Eno7rvxQ005XeLmEAJFMDGQjAJWogCXkXAGcvBxWG0Q
	/REvX7SubZ7V/gkWJ5UT/tFuTJp7uERcAxfCp/fNsjzSKjUuL/38an2oaiSKySBbXY2dvmCvs0F
	S67M+jc21E4nDfANfaHMjYhMvJhFeO8WJrUNAJovgyONnxIiO9Q0Hrz5J7YIFXa3BngPoxACega
	GmFE+hyXw8ghAsU8JqfqjIixIDcamkrLxIjqSFWiyQJvgKbsOfgquQQ8LzG3vXQmWoyqifolPq0
	b6w1CIly7NR8QvV5K6gn6OS29JqYk5ojYscCjySnA9ot0N5GewDosGis+sK5FQ4J89KezY9EFlX
	nb5+n+NL0cnehCgkO4Qk2TC+2Gde85MSYt3vU=
X-Received: by 2002:a05:690e:480b:b0:675:47ba:217f with SMTP id 956f58d0204a3-676832e42c4mr185042d50.6.1790761296109;
        Wed, 30 Sep 2026 02:41:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-676813ef8edsm501757d50.20.2026.09.30.02.41.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2026 02:41:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c2dc14de1c1so330575666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790761294; x=1791366094; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGAzSUBNj1nzc/yVj6lDb+/P/xqk8HT1SBfqkyF7NBY=;
        b=JLI0IzuOGLdOjFZcCiUZ/G2KvgQZDyVgx2ESMBdhhI7aiXDoJf36owYgt8ER7p8NEF
         EdkxomI+HSz1BLhemZugU81RhONmRFeO2Re6nlGEiiyrdr33AXT35KNUMXMBHebsc5XW
         RSGsuJD3iR/82QciDTKUwdXjMT4z4Dp36zUfE=
X-Forwarded-Encrypted: i=1; AKwUvBxaKlcnoGvvAY+quM2XKmxkp3NOJQZ0a3cIRY4e5dDxweWTgf86tcdneuEcUBb1vHwkyoCE+PbivsI8BAc=@vger.kernel.org
X-Received: by 2002:a17:907:c714:b0:c29:cfce:1946 with SMTP id a640c23a62f3a-c2e23c69afbmr69155966b.15.1790761293054;
        Wed, 30 Sep 2026 02:41:33 -0700 (PDT)
X-Received: by 2002:a17:907:c714:b0:c29:cfce:1946 with SMTP id
 a640c23a62f3a-c2e23c69afbmr69153266b.15.1790761292497; Wed, 30 Sep 2026
 02:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arp2hp7wRlcK_4D8@sirena.org.uk> <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
 <3fa086ea-2868-4cac-a34b-2389355c31b0@sirena.org.uk> <CAMuHMdVZpKLzvmRyJ9=jhnT8OhXtTRsHYOAir4S07mzrEa4mkA@mail.gmail.com>
In-Reply-To: <CAMuHMdVZpKLzvmRyJ9=jhnT8OhXtTRsHYOAir4S07mzrEa4mkA@mail.gmail.com>
From: Ranjan Kumar <ranjan.kumar@broadcom.com>
Date: Wed, 30 Sep 2026 15:11:20 +0530
X-Gm-Features: AclHuK93Xpdl_eYz2il2__ve8S0UFC3VnF8iSGlW-KZ4HOv48gQJM2k8FukYyoU
Message-ID: <CAMFBP8NvykpHj7Dh7TPf-U1f212Av7cppwaS6g-_G4K8ktmr4A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the scsi tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, "Martin K. Petersen" <mkp@kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000db3f0e065cb01af5"

--000000000000db3f0e065cb01af5
Content-Type: multipart/alternative; boundary="000000000000b81707065cb01a50"

--000000000000b81707065cb01a50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert and Mark,

Author of commit 29e3f0856e854 here - confirming Geert is right, this is a
genuine double-put, not a style difference.

mpi3mr_tgtdev_put() is a plain kref_put(&s->ref_count, mpi3mr_free_tgtdev).
The block earlier in the same function already does the full cleanup on
this error path:

if (tgtdev) {
        tgtdev->dev_spec.sas_sata_inf.pend_sas_rphy_add =3D 0;
        tgtdev->dev_spec.sas_sata_inf.rphy =3D NULL;
        mpi3mr_tgtdev_put(tgtdev);
}

The "if (tgtdev) mpi3mr_tgtdev_put(tgtdev)" right before kfree(mr_sas_port)
is a second,
independent fix for the same underlying leak that duplicates it.
With both present, this path releases the reference twice for what should
be a
single release - either double-decrementing a refcount another caller still
relies on,
or touching freed memory if this was the last reference.

The fix is to drop the second occurrence and keep the first,
since it also clears pend_sas_rphy_add/rphy before releasing the reference,
which the duplicate does not:

list_for_each_entry_safe(mr_sas_phy, next, &mr_sas_port->phy_list,
port_siblings) {
mr_sas_phy->phy_belongs_to_port =3D 0;
list_del(&mr_sas_phy->port_siblings);
}
- if (tgtdev)
- mpi3mr_tgtdev_put(tgtdev);
kfree(mr_sas_port);

Thanks,
Ranjan


On Wed, Sep 30, 2026 at 12:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org>
wrote:

> Hi Mark,
>
> On Tue, 29 Sept 2026 at 13:07, Mark Brown <broonie@kernel.org> wrote:
> > On Tue, Sep 29, 2026 at 10:48:09AM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 28 Sept 2026 at 16:23, Mark Brown <broonie@kernel.org> wrote:
> >
> > > >         }
> > > >  -      if (tgtdev)
> > > >  -              mpi3mr_tgtdev_put(tgtdev);
> > > >         kfree(mr_sas_port);
> > > >         return NULL;
> > > >   }
> >
> > > Are you sure this is correct?
> > > Martin's conflict resolution in 0b5b2fb484f3b kept the
> >
> > >        if (tgtdev)
> > >                mpi3mr_tgtdev_put(tgtdev);
> >
> > > part.
> >
> > Dunno.  There was another put came in further up the function.
>
> Right. So Martin's resolution looks incorrect, too, as it calls
> mpi3mr_tgtdev_put(tgtdev) twice.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker.
> But
> when I'm talking to journalists I just say "programmer" or something like
> that.
>                                 -- Linus Torvalds
>

--000000000000b81707065cb01a50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Geert and Mark,<br><br>Author of commit 29e3f0856e854 h=
ere - confirming Geert is right, this is a genuine double-put, not a style =
difference.<br><br>mpi3mr_tgtdev_put() is a plain kref_put(&amp;s-&gt;ref_c=
ount, mpi3mr_free_tgtdev).<br>The block earlier in the same function alread=
y does the full cleanup on this error path:<br><br>if (tgtdev) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tgtdev-&gt;dev_spec.sas_sata_inf.pend_sas_rphy_add =3D=
 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 tgtdev-&gt;dev_spec.sas_sata_inf.rphy =
=3D NULL;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 mpi3mr_tgtdev_put(tgtdev);<br>}<br=
><br>The &quot;if (tgtdev) mpi3mr_tgtdev_put(tgtdev)&quot; right before kfr=
ee(mr_sas_port) is a second,<br>independent fix for the same underlying lea=
k that duplicates it.<br>With both present, this path releases the referenc=
e twice for what should be a<br>single release - either double-decrementing=
 a refcount another caller still relies on,<br>or touching freed memory if =
this was the last reference.<br><br>The fix is to drop the second occurrenc=
e and keep the first,<br>since it also clears pend_sas_rphy_add/rphy before=
 releasing the reference, which the duplicate does not:<br><br>	list_for_ea=
ch_entry_safe(mr_sas_phy, next, &amp;mr_sas_port-&gt;phy_list,<br>				 port=
_siblings) {<br>		mr_sas_phy-&gt;phy_belongs_to_port =3D 0;<br>		list_del(&=
amp;mr_sas_phy-&gt;port_siblings);<br>	}<br>-	if (tgtdev)<br>-		mpi3mr_tgtd=
ev_put(tgtdev);<br>	kfree(mr_sas_port);<br><br>Thanks,<br>Ranjan<br></div><=
br><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Sep 30, 2026 at 12:42=E2=80=AFPM Geert Uytterhoe=
ven &lt;<a href=3D"mailto:geert@linux-m68k.org">geert@linux-m68k.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Mark=
,<br>
<br>
On Tue, 29 Sept 2026 at 13:07, Mark Brown &lt;<a href=3D"mailto:broonie@ker=
nel.org" target=3D"_blank">broonie@kernel.org</a>&gt; wrote:<br>
&gt; On Tue, Sep 29, 2026 at 10:48:09AM +0200, Geert Uytterhoeven wrote:<br=
>
&gt; &gt; On Mon, 28 Sept 2026 at 16:23, Mark Brown &lt;<a href=3D"mailto:b=
roonie@kernel.org" target=3D"_blank">broonie@kernel.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 if (tgtdev)<br>
&gt; &gt; &gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mpi3=
mr_tgtdev_put(tgtdev);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(mr_sas_port);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; &gt; Are you sure this is correct?<br>
&gt; &gt; Martin&#39;s conflict resolution in 0b5b2fb484f3b kept the<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tgtdev)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mpi3mr_tgt=
dev_put(tgtdev);<br>
&gt;<br>
&gt; &gt; part.<br>
&gt;<br>
&gt; Dunno.=C2=A0 There was another put came in further up the function.<br=
>
<br>
Right. So Martin&#39;s resolution looks incorrect, too, as it calls<br>
mpi3mr_tgtdev_put(tgtdev) twice.<br>
<br>
Gr{oetje,eeting}s,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert<br>
<br>
-- <br>
Geert Uytterhoeven -- There&#39;s lots of Linux beyond ia32 -- <a href=3D"m=
ailto:geert@linux-m68k.org" target=3D"_blank">geert@linux-m68k.org</a><br>
<br>
In personal conversations with technical people, I call myself a hacker. Bu=
t<br>
when I&#39;m talking to journalists I just say &quot;programmer&quot; or so=
mething like that.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -- Linus Torvalds<br>
</blockquote></div>

--000000000000b81707065cb01a50--

--000000000000db3f0e065cb01af5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
zZSItX49nLoa4TBbzuCzoINrv59QeSCVlVdAYussUS3840ZjvcYHSQx3tqYcBN+an07lDASmGEM5
7PEXJPVInjl/Fva3ksL3r8anR4PWc3Xz5jLD8Xg6BU4zmIcR/t1GlqWuz8uTWmQtm40C9m91Q9a+
2alIIV6BTs8IG2ELtt4EfcVvi5af+Hu878sGeBtMx6Z9ljoKl3MfvDdtUNO4bkJ97a7PXy/CKxiy
TApQj4qg9SKQcsH0xzQan67XeXjkvk4frNDhRikCAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZcmFuamFuLmt1bWFyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUfLdm66N7GfDsoL8cYp3s4YdO
isMwDQYJKoZIhvcNAQELBQADggIBAA/lnAxDb9jbesclnBxWIKUSxAMIrq4XKO5WKHUYIOOzd2sL
o59fH9AWg1AfVONfWIUNdWDrmNNLs0+drSKaZbGx2RWMbaL9ubo7+BTQV33ZRBxnnkmc9QszlOo5
m6FB9uPOGB9LvJMCkJ8S7hNc9G/p7dB79s1IKc8JGEDIrsgX3s4xSCJA20WdePHY5rLh5ySwXyI2
3sVTUC+oK0HJFRo+TpdMMtdpOetWzIkUbGceiOA2ur8372+0KOmvlIHA/jEnW3BRfmB2vmdk+raY
C/xbXY9JEfS6D881+X/90w+cCQ7nuA1OELebS1RbSdXT6YkRDPWYA/DPFhOYCAiMwVAPRaAH1AQc
8J8yTDigwRUCq4qKCYU9YnqQh3YZRbUYnW+i3+rAO2SUbKl0VM5y0tq+GOGLC7w+v6yGossZmy+6
3w72qp/Colr4r5ZaROb+L2FXqk4tL/HfkRhliyPPPNIjre2mIkvFuShk5A5FcvQYCzDtejAz9JHq
ZVJ1ZD+auQDbIUxT+Dn9bI5XkQnWJ9KrlcORtztdYTDafN8VQuweS3JY0X/VCNBNZkiYXd7fzOza
hvkw/S+v8cIfiakLKBREtiBHqWLdVf5CNDVYpd17yz0LGz0TKARbfuK/EiKflA10pnnnOB33Ru9D
WPp9aHW3szGYr3+H9AHS6IDwkIxyMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMDcMaKRu9LrbAxERoMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCrf1BA
Lc+jkTLdbeZr3WkkjOVJZVlzwpG9JaW+O4VEGTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjA5MzAwOTQxMzRaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA1ypOAFG5Z8LjscnMpMsv3ICTo3DtUjil9ON+V5V0j
/FkKLY1VdKKq9j9/3VHUHQ5X9KAozg8YPTli/gjo38yH/eA0ifNAcw4z5pztgPvJYXeQR2J4yNk6
y0X9xn0kbr7pCOkjpVCioMH+ajFaYdrvQk3gTmrhM+os51KKgDmECQ/8eZV3CGyrMxBY2kpOcbAa
EreAOHWuh3HFzui09PosRyX69WytkI321e50jokzVNKiO2yFJo1VjRcS8tAGw4XxmjIxrZ0cw6XI
uB3YDzIPTynXh7rT7ESDbD1Rg3JIJcewbSlDHnBzMuKEME2biSf/0/dsc4bxvTuymSznO+bl
--000000000000db3f0e065cb01af5--
