Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A1941B8CA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065596; cv=pass; b=tJCPJBoC2TvOan09ZRddk4E79wrVG2L2q7HQ7mfWq/baSmGvxZv6hCS17RfvTyrhIohWnPpFGrdJOkgbpAxy4zknIbKo/6KAGE2K8ivEGweVcs/Wbh2Txa49ytqbgzDA7uRoK/sZL+ardhGXNaGlYFH6oHM+E/7zO/ylguFIUGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065596; c=relaxed/simple;
	bh=lvacjQG68N2xcrdqTRJ9VHj4mhfJsAvTAX68qY7zwqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdg3tCaT0xWYMa3F31SmxnjdOW25cTAPZHq4ef976V6aRMymwCfuc3Y8W+9iH98XtvrmVLFEb5Z5hFLDmp7DjtRbi6vJU9gUtcU9r8CelxWRjBJaD3NmQzddS59Rz24ozTJ/Sr1FNDdfLp/vYT4iVflfFi1ovA9sjtKTY1G0nDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHhcjsp4; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHhcjsp4"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d440939efso33502707b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790065594; cv=none;
        d=google.com; s=arc-20260327;
        b=TJOLH+G+FlZ9toLc+iRA7GVHPVrFRVlgYkI4snFixBXML8+QGHDhuVb5hCjCdm86EX
         NhpthbAVWEAPKyG97aGOAc9UaQyg/q20BX5ylezK7IWAYEbE6UHo1FEXjXRro1di4AkL
         JIkFhmAUqAVRZiju9fd+TEPDDXDJ962Mkj2sstNrKWLJeRfWFlBJw4jU+cv0zxPwg6yf
         z529aYgwe6w8vfT64C8tcf/6TYsk9ThQERclghA940KmctFgryQ4WDYE1Cd5vxPgIZwR
         ImR1p3/Z2B6SDHDpu2voVVd7gkrg1Tn5Dhlzyu/poqn/eK6wLhWICeWOUQkgp/08qeDj
         VYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99LwW3jpXQMD0BKLN315tdPNzOGqAVo36rmxu/uCw48=;
        fh=0FSr/9WB2McJ5iJyPVlprAhH9oYIfNVRnQG2z1cZBKA=;
        b=rVrJ3kXQ/0KMtCjQLU9bgPOZyZnWUCMDJ3bRrr/0cnrtZqA9YoohfLQZzgd0y4CTpT
         vHA9b/mYyIMmxa8z4bbzhH/RBj0Pos8Mt5DgqDZr9H42upanyP9K6b1uWN/rsd+pLNwr
         VwVoPoCiY+lrHJAdlP7dQFbwxPKzKLsKcq/8+qbiMotXdWI1XOzILRhbmVQA2nmRCbZR
         X+T5yAO5wzcsxTCLDsVM9r/2BMb9l0VV+7IYb8MnufnFUKmIVF9iJKprvc30ihWtziVQ
         f4CIdu1zSQ0/CbGZXH25wdR+2Gb2gCifADCjjX8eiHcJJg33VRIdwJaupkEEWOGDUyfT
         btlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065594; x=1790670394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=99LwW3jpXQMD0BKLN315tdPNzOGqAVo36rmxu/uCw48=;
        b=bHhcjsp4gEOP5ylEWN1PmBWC113BvpM4G49UlW0jHo0CR4HKz7FeKaws1/xMgYycpf
         RRMFs1Ik611/CaYKiv+NfMORhcbp/fuWxxkY6uXX+TjEFYsO5qM7YKu918wya07Nxr/Q
         K52i0ox8PVrkp/K+5kjVHjvQJ5AoZEQ+xTewGbXRyiNUjuhrLOoLVR50OigAjeTFwycD
         1+lq8kYlL85j2qwp6gDJtWhyHqtRZz3tnwADB9pUAWIUfcVwsRMqq/NTvUpSfIzdyxIL
         U5ALdrp+HrnLucIWIPwDTfAthYr+pk91m+8O9EjEGjPoPUg5nAKizKZTiGhkf9O+MwCh
         uEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065594; x=1790670394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99LwW3jpXQMD0BKLN315tdPNzOGqAVo36rmxu/uCw48=;
        b=kEmRK0lEETNhiFtXQMocSeCceyeMIwtFRf3m+9Ztd8+v/eUM1pYrjTzkMKJNsWBZv0
         B59Lra5hpKjNOfaA1yHA1y6PmUFPeQtZrWJiFDomsmTJY8v482aLenCDdmOAwq+ri8sO
         Ypz63u9WpjOVol9Af7+qtvsrjZcVCWGgT2ie09Sl+eA1bwouEsqJNYQW7csRTt3KKYsr
         h+AuINKcVW4wONjg04iee4+Zbq+Mkk7j7n79Uu8MhXC4VBtTemhUN/d1I/GJ9wXlvinq
         gbXgZU/dbek8YW7KjkiOnp03FWbLMzcoM3iEOHSu7X9Y8+ovOCGp5J1wEeY5TgPEQnDo
         bDIg==
X-Forwarded-Encrypted: i=1; AKwUvBwuaaKAP+MCra2QMoT+3w7GrZKXfbHSYLUpMJM8QPYpZ/FFeSpL0mMczReEGiGzAlDoov2rEKqo5T5OJoo=@vger.kernel.org
X-Gm-Message-State: AFuF++kq7vgTUhf/RgrlZUCFtLt695U3/rQ3tu8mS89v3ZnX2P71ocq5
	0bbSzZXeCpvGns3Kn+C9DBZQu9ZjXDvmAq8Sx7K3JEPRWs78h6VkXVjxZMm/XPQ6ZH/n0D3bwVC
	b8JwblK0bbt7Jj9+uZpbkXCy2taCujzM=
X-Gm-Gg: AYBFou3zejy3B4IES7iOzPGbaknHCqgbARgUkpFltzdGaClbo6/Oxq10+tOg6dr5S7u
	O992lajfLTGuvGwSulkgKs/oUccA5vColc/wet6oH/BrV8dFFlZC0Nuve1n39wXOqbR70ifnwx4
	GkkjthR+PuMX+gJW6T4XMuGEvoZg8EJr5uFStuyy9NwZ9NSvB7IUUcgkYIcxOkLJkDGUvgT67K6
	b2p4CnZ5QOevMPJnM5RNLn7SBd+cepXtAGlzz7yvUwnQo8NJoSzWLE14XVu3X/Fk0R7etrTYVO0
	EgTcbw75aPpQU/X+x+sRNpS8oN/7HuSQa1IGBfA6ctpMZ97aOspKL/In4g==
X-Received: by 2002:a05:690e:4087:b0:671:316c:3945 with SMTP id
 956f58d0204a3-6717fc63363mr4790057d50.18.1790065593563; Tue, 22 Sep 2026
 01:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919173405.3718408-1-lgs201920130244@gmail.com> <4ca4f5c5-5021-4a63-bb14-4b7d0502eef6@suse.de>
In-Reply-To: <4ca4f5c5-5021-4a63-bb14-4b7d0502eef6@suse.de>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 16:26:20 +0800
X-Gm-Features: AcwNN1Vp1Z9Tq03Y5viAHRjjzoW0XTYRpGaxw2OWC81kqrhnlnCGwEcxNi_VTN4
Message-ID: <CANUHTR-AHqeBhiuTpoVSrGjBqpWzug2JW3npaQEv7ZDZj7q9BA@mail.gmail.com>
Subject: Re: [PATCH] scsi: libfc: fix directory server rport memory leak
To: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Robert Love <robert.w.love@intel.com>, 
	James Bottomley <James.Bottomley@suse.de>, Joe Eykholt <jeykholt@cisco.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hannes,

On Mon, 21 Sept 2026 at 16:48, Hannes Reinecke <hare@suse.de> wrote:
>
> On 9/19/26 7:34 PM, Guangshuo Li wrote:
> > fc_rport_recv_plogi_req() creates an rport before allocating the frame
> > used for the PLOGI LS_ACC response.
> >
> > fc_rport_create() does not add FC_FID_DIR_SERV rports to the discovery
> > rport list. If fc_frame_alloc() fails while handling a PLOGI from the
> > directory server, the function returns without starting the rport state
> > machine or dropping the initial rport reference.
> >
> > Since the directory server rport is not present in the discovery list,
> > there is no later teardown path that can find the object and release
> > that reference. The allocated fc_rport_priv is therefore leaked.
> >
> > Record when the failed frame allocation leaves an unlisted directory
> > server rport behind and drop its initial reference after releasing the
> > rport mutex. Keep the existing lifetime unchanged for ordinary rports,
> > which remain owned by the discovery list.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 3ac6f98f4113 ("[SCSI] libfc: correctly handle incoming PLOGI req=
uest.")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >   drivers/scsi/libfc/fc_rport.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/scsi/libfc/fc_rport.c b/drivers/scsi/libfc/fc_rpor=
t.c
> > index c25979d96808..884b233c2f72 100644
> > --- a/drivers/scsi/libfc/fc_rport.c
> > +++ b/drivers/scsi/libfc/fc_rport.c
> > @@ -1848,6 +1848,7 @@ static void fc_rport_recv_plogi_req(struct fc_lpo=
rt *lport,
> >       struct fc_els_flogi *pl;
> >       struct fc_seq_els_data rjt_data;
> >       u32 sid;
> > +     bool drop_rdata =3D false;
> >
> >       lockdep_assert_held(&lport->lp_mutex);
> >
> > @@ -1940,8 +1941,10 @@ static void fc_rport_recv_plogi_req(struct fc_lp=
ort *lport,
> >        * Send LS_ACC.  If this fails, the originator should retry.
> >        */
> >       fp =3D fc_frame_alloc(lport, sizeof(*pl));
> > -     if (!fp)
> > +     if (!fp) {
> > +             drop_rdata =3D sid =3D=3D FC_FID_DIR_SERV;
> >               goto out;
> > +     }
> >
> >       fc_plogi_fill(lport, fp, ELS_LS_ACC);
> >       fc_fill_reply_hdr(fp, rx_fp, FC_RCTL_ELS_REP, 0);
> > @@ -1949,6 +1952,8 @@ static void fc_rport_recv_plogi_req(struct fc_lpo=
rt *lport,
> >       fc_rport_enter_prli(rdata);
> >   out:
> >       mutex_unlock(&rdata->rp_mutex);
> > +     if (drop_rdata)
> > +             kref_put(&rdata->kref, fc_rport_destroy);
> >       fc_frame_free(rx_fp);
> >       return;
> >
>
> Wouldn't it be better to always create an rport for the directory
> server?
> That would make the teardown path far easier.
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich

Yes, that sounds cleaner.

I kept the current directory-server special case to minimize the change, bu=
t
using the normal rport lifetime would avoid this extra cleanup logic.

Do you mean adding the directory-server rport to the regular rport list as
well, so the existing teardown path can release it?

Thanks,
Guangshuo
