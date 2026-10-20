Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487636;
	b=j8ridQAqGX12uOYTy0dIRcOl5NLVCNxtrTQiz1ymbiu7q4NmALlzJuX9Ec7MAurr270a
	 SAGbNdIFtwc9CnFFWWXfKNxsB33LUfkY5eZt1TTpzgimhCQsbCErs1DePX+jmBTWpQrP2
	 5YWl8avqEtmbQy9r3WjLAhfVOm3uZy+uTBY4sCNiSx599cPp66l3gPxJwtyEbPepNlq3q
	 Oz2Lj65vUT+o3wyOqeGlNoFDjnoVq7MdJM6ZOdl36xYkN9mek9L6Qu77iL9QrfhxEjUmn
	 Ko/mw99KvDUdMuVoEBwI/ZPRAKJSTsk5WIzDQTHruyYzHvjFMmlY6jdJdSbh5CI1cag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gnEpenvt+GUBOtfxEpiHDL8sSuff/Tr1knZSR+pi58g=;
	b=mXEUpisGccbOVFXBgyhvL5XTNKXhbdWcN6jsn0pPnwtCA/QRp87/1JBm63nrRccuSW+7
	 DYkt+Iq6ytAy+ewn8KMMQoi3rTJR69+E5oGFvM72PMfDkrxzytbi/hvhDK580VB3TYP8K
	 VIfdsv8dtd+lv+rttzsVnxaPxOiPIKR4LRGs8tZwBQkBoxQumgwrxuXhhDP7EyPqCdgEp
	 ag0PwIzcd1aHDeRdTDI0dGBPpeH3qGxMx+9/hJ2g8YhicE3/vQHyfR2A5W0+cUI1WySVq
	 e7l+ZCPQ9DScTDVhKwQxBHlhG1zf1X1/RpR2zG9jzTq/tNCoR9CZER5QD49Ssa1gMsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZPY65D2O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A69606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A69606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZPY65D2O
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1392307a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792487636; cv=none;
        d=google.com; s=arc-20260327;
        b=ODSjM8PR03mM5Z78+Q4+5okqCmI8u8gh/eemSnWhaICD9g0PNg6MstZyRJ1MtonR4H
         +YWdz3wK2Z50hgGSI5bMgRyeBi4vcQU85qDF3iZzRacu8x+jPlAO3+2LQ56edHOt4dsO
         NqfisOeO6fbJsxqCXCIahFck3p2xZ5HKIPiOAn7MuREigNEKwRWMwxDXh+11dsgAY/Zp
         sFof5zIyjt5RU6E5vDkStiK2kLL0gIuIK1bXrzR4aCv80xVYIZw1g4KGU0zBsGnd02/g
         lPIB7Jg9S+7BKMISck2JCB+uRA/20zKo5a4hfmiuxGhMvQMQE2nCnLf3sxgBTus9inDg
         sCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gnEpenvt+GUBOtfxEpiHDL8sSuff/Tr1knZSR+pi58g=;
        fh=NEThUO8cVvjhRSOZsIbc4vg0tojz55TP9sqhmUQGYRM=;
        b=fki6cUD/DDN+KhLlDIAmUfmL8CflcZrL29mIY2DLxMvYYig6LpFlw5zFizXi/j9RqV
         8soNqJtNbfIPTGobsqAbTMEmd7UHH6jbaQ4Gs/P//6ei/9SLNaDC6Uu2TbyUeAVHBRUF
         MSX/gyss/5oiw0F2qXENVEBDsAqFZ94pFRmtwppgeVLDN5o/T9Qx6aSeT/ftGk8p8O7d
         KN/vwvJPu52b6kwWYc735fp8Wd9kI2WsSeiXlVF+BInc8M7G6LDNQCj3RCAcceOKrPdM
         fLnTfuvjmIsv3CwI+tCEuZ7owv+jwg+qy2k1AfDGZikfpkt8rcDFX92nOdVWm/ESD2fH
         QFVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792487636; x=1793092436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gnEpenvt+GUBOtfxEpiHDL8sSuff/Tr1knZSR+pi58g=;
        b=ZPY65D2O4v2IFjGpMiA0ks3iad/eQ/cqVy6SjAqXsCdjz4wFs1jA0S7sr/kkiVJKvZ
         osa2LsIPGiU7rbe7z2lZLY2aaqyT83leNDeX481bwhaMjMl5v/KDyAdCJW3h2NcIGCAv
         wQyGz9mnT4yp/H2rpUWs1hBDDBtodR/+Zuv7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487636; x=1793092436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnEpenvt+GUBOtfxEpiHDL8sSuff/Tr1knZSR+pi58g=;
        b=GHhuz83S79ZcsqD2mKOylLuKwxJSNkm2StqF/p7LSfF2SRqfS2g+fsWCfEmBEhTHtq
         zyN9yAC2MXWzaZ07M6PglAwSui2Kee1dXbY4AYgEUTOczxVmKKoin+5RdcnlPdpDQalT
         BY7Vr+eKUrxKxAJErpoccOp8+zqEWMI+D+qGUG5LpcgDjfL2AX3M6uLMwklpS+K09Zy2
         gxaumu0f0dKCmmw2YMnrA1GC84kgwHWqxkXY4epuzpVg2iG6GMOyvc644qpGxHiRnS/n
         5ZAQlZPgZwfr7kL5UQNa0Cmnlwg1MY2aYg2K1FsI3gKKLhJCWlzLaQgsD199iHM6QwJZ
         7ZEw==
X-Forwarded-Encrypted: i=1; AKwUvBwKmo/1SBQad/71kd8ufFFPcmWLUUtAsb5H3du4afq6Aope2FVcUGJEvkuXLz8SB6l/UDoYo1axavojhso=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQm593XrYtfO9+6dIidy/rHBix357pV5BLAhT9V1ZU75uXL1Cz
	zA4mF3J1mMx2vpSVG2wWEtuKqpL8NKmg6EI8Y4roY7xn211qc/pbwZg+q/ub+ohkch3uYGxPZ5p
	oGEteFZY0L9M2X+gu30zpIbnWhEgqJhULCciFWldD
X-Gm-Gg: AYBFou2XRrcq08mDnHZwSLISY/dNeF7TeW2c+IbhLy/M3U02sRTgR5wmdsVtIx+pIgK
	UKulOqBB+zVSOPDUC4NTWfci6nPTF/9qyK6fqjfx8r6LhjsiHqDfWgUvhNnqSmdmJodCYaRUML0
	CJ/nyM/6t3TmXHvStFRoY1m4YUP3W6wsLyBodMRg3MnsDBIy+PcziiIsyKKM2OexMjTEdPnI50s
	VZYEDwH2ivbB50vnY+1ICapCAZXXhaQ3o3TJEB17IFQriJa66LZkB8FqK1b/Uq2uLxH+31cpq9e
	rN1CkFch3diCCXp7o19E+1KCCEPSfwm3caTcNFu8hu6pXYUyUDVel2UEzpkDYAjPG0/Nail2opu
	fgS03bq4VXByHaQ==
X-Received: by 2002:a17:90b:1845:b0:3a5:1b:34a5 with SMTP id
 98e67ed59e1d1-3acef506a0dmr8831280a91.49.1792487635692; Tue, 20 Oct 2026
 02:13:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261008134056.3816556-1-akuchynski@chromium.org>
 <20261008134056.3816556-3-akuchynski@chromium.org> <atDDunhd_1mucOVh@google.com>
In-Reply-To: <atDDunhd_1mucOVh@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 20 Oct 2026 11:13:44 +0200
X-Gm-Features: AclHuK-IikjZ7p_nqJNC6TxS3TMChIviiM1vHKrzfiG-2lIHM3azwzb2rJdLiFc
Message-ID: <CAMMMRMdpOidJsFdSyscZ23jZ9XXqhEn_Hyc4P6+e3JVM3cDbDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 2:14=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Oct 08, 2026 at 01:40:56PM +0000, Andrei Kuchynski wrote:
> > @@ -406,17 +406,6 @@ static int cros_typec_register_port_altmodes(struc=
t cros_typec_data *typec,
> >       struct typec_altmode_desc desc;
> >       struct typec_altmode *amode;
> >
> > -     /* All PD capable CrOS devices are assumed to support DP altmode.=
 */
> > -     memset(&desc, 0, sizeof(desc));
> > -     desc.svid =3D USB_TYPEC_DP_SID;
> > -     desc.mode =3D USB_TYPEC_DP_MODE;
> > -     desc.vdo =3D DP_PORT_VDO;
> > -     amode =3D cros_typec_register_displayport(port, &desc,
> > -                                             typec->ap_driven_altmode)=
;
> > -     if (IS_ERR(amode))
> > -             return PTR_ERR(amode);
> > -     port->port_altmode[CROS_EC_ALTMODE_DP] =3D amode;
> > -
> >       /*
> >        * Register TBT compatibility alt mode. The EC will not enter the=
 mode
> >        * if it doesn't support it and it will not enter automatically b=
y
> > @@ -433,6 +422,17 @@ static int cros_typec_register_port_altmodes(struc=
t cros_typec_data *typec,
> >               port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> >       }
> >
> > +     /* All PD capable CrOS devices are assumed to support DP altmode.=
 */
> > +     memset(&desc, 0, sizeof(desc));
> > +     desc.svid =3D USB_TYPEC_DP_SID;
> > +     desc.mode =3D USB_TYPEC_DP_MODE;
> > +     desc.vdo =3D DP_PORT_VDO;
> > +     amode =3D cros_typec_register_displayport(port, &desc,
> > +                                             typec->ap_driven_altmode)=
;
> > +     if (IS_ERR(amode))
> > +             return PTR_ERR(amode);
> > +     port->port_altmode[CROS_EC_ALTMODE_DP] =3D amode;
> > +
>
> It deserves a code comment to note that the registration order dictates
> the priorities.

Thanks for reviewing.
I will add a comment explaining the registration order priority in v3.

Thanks,
Andrei
