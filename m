Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D994A5293E7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271297; cv=pass; b=lI/gzCAmKiH6GQqyHrFY6zA727zET+XYNLCnrBuMFByfvazu8XbBp/SBwcmu2YRs94Z7uPu8r/wolYtODhdixOoranY6QZTya3TOvOtcSaIaL2m+G072Om+8BJbS6fqda+JT/E2zD2arfY3b0CTTIeYCvI0BZhgUIyHk1JI+YqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271297; c=relaxed/simple;
	bh=P7+az3yyBJchUR91Z1ziGlXJNmLdkAluzh6AwSulzz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iL+gpF6WDCtVEr+9wREAnjVlORF5gsKJYkDaWx+c4h+AN4WvsfK5BcrBmYIimkGe1zj5z4ns897+8MbJ9Mi9mD0iyST89LHT9Yje9wedbYtvAwgAjcf73F0zmNYTyFhK7LHdUxLdNw6DUC01dF1mD5t+IpgBt+grXrqX2icDxj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oEzCoIoc; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oEzCoIoc"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c112aaaf04so100570b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790271293; cv=none;
        d=google.com; s=arc-20260327;
        b=iQ+9XADXICTCd8pTK6pg6hFOtarBdrKP2ZN+fRHSWMBocTKPnx+nwAU+EkLcghCQ+H
         PiwlJf+NW3AjZyfQUqgGgmqjHdrG1aFi/Le4eNAkeq8u87TeOMMWDVNvVYRpbc1k2qhe
         8145ByoLOa4dNTBgRsxyOA9mNnD7HSABPGZVyMEKxAlfEJHX5MTt2Wz0cb+z+4Lrid9t
         IlPwN5BBNuzJtQxiAgcyvqMirTl+jT22UZO5WlAkFrY6L1g/UJnylY0a4HcW2YvGZWdu
         QJupqn3Bu6aG9bGf0rTWDx6aRCS+vmw7LvzrxBxVZlRY8gCnjDpOay8LtWErlOnHkkcM
         brLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3LlUQJdHFv3q79AvrsTmGXMAeRGwjkC4yOozzaFl6k=;
        fh=42IVF3ufRIeUdf1dsLB+8+jnSFhRrjWFQrAAAv2eLks=;
        b=q3rCtScDWM3O0ZnVM46WKBXVhCxIq6cFHHJm3zJefX1tnn3dHTGh7dtRs3WQboYaHe
         7ntHScfvroed0WhxBw6v3T15ItGkD6O/Ia0R0l/RC/guAn4JnAVRsnEuR55k+l3CvDAZ
         LiWsaRuEdmdrmoprd5rJfFQQR6jsQ1ygDpvZZWj+IyNLHVtQKsRS4u1da7AaTFSzKliw
         WTEG6QiKZobQ6isn2pTvPddOHi8+KXRBqBxSAxYirXfLLsKCywbj5RBXHWnui2xDvhVm
         z5OXeUliLagxe4rJP8xRpgLPjpN6Sih6RqMvfW1Yji1bF76MnZVFbjROw2w+lJbYKofc
         rkJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271293; x=1790876093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/3LlUQJdHFv3q79AvrsTmGXMAeRGwjkC4yOozzaFl6k=;
        b=oEzCoIocp0cuCaITN2wUZkyfp219zOisrPgzxupb+C7R5Zv2par0Iymi/MYzBASgMQ
         Wm9LlpHypnQKeJJfqXONfGqqKGFTp3SwGSjFsf02mYrsmV2C0TAFNLhi/eYEf/Y+KWkc
         5uK3hlUdmi3FlnVUShbB12NSomG+cWzR8zsxPxNjVUmjcbYutQLtMGqk5HFj5EEoSQAn
         z23uNfZShQXO9tYMhxVU7RUOsSOuRrTDnTXNsJ3CuW1g6CwiDqZ8bfjAZ/WHFI3uZNek
         2m+POv/rlBwa6x7lZobAb4gGT+T44A7nxV8pvpP+zfaYTSfZUdT2NgJ2nlwCDTa4EjFa
         hG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271293; x=1790876093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3LlUQJdHFv3q79AvrsTmGXMAeRGwjkC4yOozzaFl6k=;
        b=tzR86DS7EDnAG5jFDdTTR9Ie+EvnuC/qoKhWpqNY2hwes6aTM/K40y/3TiNFtGA9QL
         hsB8kakN/xkGOpoRI4fGfRjVwxSasSkvM4eKQ6O2NGYdSsqIoNQND/MKCI2+MnlCwUyh
         q6Xpxq7hotqvltHMQqWp27L1P0+kYV4/d+1kQWcGre20eGGHY029N75lEC7it/5rqFaR
         GvnAyD2flz02LWF/4aSetC1iilWtNzyRdebtPFzz+NxAD5tlwlookyC2Vji4njEMW8x6
         Gg5PKwREuwjyOpWvkhQnjaJu4ThZqpbrSgsb46Sw0Z8+q4J9FpjHnpTSmmHBfg+4MRJa
         0Ndg==
X-Forwarded-Encrypted: i=1; AKwUvBy/49M0iqYGVdMBwHOlMmSteFLJisu2NHFFuO/mT14khHZ6hEmEH7XjHa8yTQLWmNOLvacYcbC1/iCCqu8=@vger.kernel.org
X-Gm-Message-State: AFuF++kqhwhraxDR/fN2h93XW6ZIU3/bVjO+GzbxI4TBzbJIDx4ApRe+
	f9swPwhQW9LHEz/kNPMvWumJBwPTCE1bc9aEXhwXrc/gzbYqKEJ3bARrsXQH17MyYo6BV/0wC1i
	/nnjkMdG1DFW2egmT2yeIN0KsaUIbHrShMGA15+VksityADp+AbZIr+p0KgI=
X-Gm-Gg: AYBFou2njK32azJ0lQKV0FcNU6fBnK+oFeXAaYuwHrnfld2zbVNnNGDVvJOJ0r/iiqa
	QkZvfmh30BEMh+0/hvjEY4f/yC6sOy/to5gYqcfZSQJrssCR3r98g/07jwuUA/mJdQXjbE+Bb7P
	+1aueburneldG7MM4MvMDJUoiCCulDIVwAAuskUBx1CaHrAH1XZkdClq8ehPS08zgnsxeAuJLAM
	KPoN+/p8+OXdDxH3zEh06ZBwG+ST90QQqsg05rQzQkruuUBC6um4ezJHjkbMjlH1ZpxoxeBoMmp
	ZY2iMMlEFJb4lUGZdpC6vURnB6cqdxn9v6jLU7ocdDvzYWV7bWBq0TRjO2s8CY7aGpGgYJpG0PH
	LPq6Y/nSp
X-Received: by 2002:a05:6808:16a8:b0:4c3:95d:91f1 with SMTP id
 5614622812f47-4d728c29fd9mr3339337b6e.1.1790271292781; Thu, 24 Sep 2026
 10:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916043957.3362995-1-xu.yang_2@oss.nxp.com> <arJdb9kip_YCzjV2@black.igk.intel.com>
In-Reply-To: <arJdb9kip_YCzjV2@black.igk.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Thu, 24 Sep 2026 10:34:41 -0700
X-Gm-Features: AclHuK_fQ4a1sDCLA9MNnm5rNq9xegB11a5TSGfdfhcIWsSj0kYwqVQmb6LZFsg
Message-ID: <CALzBnUG78eno0Qbv0Hg0_LeqKq02Gmcsiwwee03ju6-OGhb4Fg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, badhri@google.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for tagging me here Heikki.

On Tue, Sep 22, 2026 at 3:50=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> +RD
>
> On Wed, Sep 16, 2026 at 12:39:57PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Commit Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanis=
m
> > for Discover Identity VDMs") advances vdm_discovery_state to
> > VDM_DISCOVERY_COMPLETE when a CMDT_RSP_NAK is received, but it does not
> > advance the state when a non-modal port returns PD_CTRL_NOT_SUPP.
> >
> > This can re-arm another vdm_discovery_work if the port is going to
> > respond with PD_CTRL_NOT_SUPP to the partner.
> >
> >   tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
> >     tcpm_queue_message();
> >       mod_tcpm_delayed_work();
> >         tcpm_state_machine_work()
> >           tcpm_send_queued_message()  -> send PD_MSG_CTRL_NOT_SUPP
> >           run_state_machine()
> >             case SRC_READY:
> >             case SNK_READY:
> >               mod_vdm_discovery_delayed_work(port, 0);
> >
> > If both the port and its partner do not support modal operation, they
> > will send DISCOVER_IDENTITY to each other infinitely.
> >
> > Advance vdm_discovery_state to VDM_DISCOVERY_COMPLETE in this path as
> > well. In particular, update the state to VDM_DISCOVERY_COMPLETE if it c=
omes
> > from the port partner, and to VDM_DISCOVERY_CABLE_IDENT if it comes fro=
m a
> > cable.
> >
> > Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for D=
iscover Identity VDMs")
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: RD Babiera <rdbabiera@google.com>

> >
> > ---
> > Changes in v2:
> >  - cover a cable returns PD_CTRL_NOT_SUPP case reported by sashiko

PD Spec indicates that unsupported cable VDMs get ignored, but it is
very much valid to keep the filter in case a non-compliant cable returns
Not_Supported.

> >  - kick off vdm_discovery work to continue working
> >  - correct previous wrong fix commit id
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 2d6b14aa2085..5cea820e00c4 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -3891,6 +3891,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_por=
t *port,
> >               case SRC_READY:
> >               case SNK_READY:
> >                       if (port->vdm_state > VDM_STATE_READY) {
> > +                             if (port->ams =3D=3D DISCOVER_IDENTITY) {
> > +                                     if (rx_sop_type =3D=3D TCPC_TX_SO=
P) {
> > +                                             tcpm_update_vdm_discovery=
_state(port,
> > +                                                             VDM_DISCO=
VERY_COMPLETE);
> > +                                     } else if (rx_sop_type =3D=3D TCP=
C_TX_SOP_PRIME) {
> > +                                             tcpm_update_vdm_discovery=
_state(port,
> > +                                                             VDM_DISCO=
VERY_CABLE_IDENT);
> > +                                             mod_vdm_discovery_delayed=
_work(port, 0);
> > +                                     }
> > +                             }
> >                               port->vdm_state =3D VDM_STATE_DONE;
> >                               if (tcpm_vdm_ams(port))
> >                                       tcpm_ams_finish(port);
> > --
> > 2.34.1
>
> --
> heikki

Best,
RD
