Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793648965;
	b=HKl6VMDrAF9tgwjjliBNUkGBu+6F3ffyUybGIeaWzz3tPSyIbmY7SmUOxqRdBxs0qcu2
	 FTjoTprcA7w9XxVovyd0AKtVCH2gaq2q+6+iWymExGU0VTUZuDgps6QZveti7U45Ear50
	 UGJO9qjby+IM/ZoKL8mClLtn12gwocixWuME007PO+Zx93ztMyRk/HCHIgKdIFryrKQjM
	 sWJZipRi3QBvkxb3213modNELCTqhVE1i7s25PmfU105C0jxaMffzAJCtR7Obhx1KlQ5f
	 8Zev45DoF6hmGPGHM73WE0cW/zFyiCxsoW4rInrr0Lww0HnEfmL+uFdUJnAyjDFKnLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648965;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=WWVCxwNmclKBiA1HWgH44SVxokhuUVv65U9BSPMB8hM=;
	b=mQNdMDeQW7ymvP8zW9VBL9PoLxnz/KS6I0dX5b5NJnnfirGm9VHHC8HUuhNK5dAZGGi/
	 6J7H+VyEb0zuAS+R+CHq0Vd5YNnaZTlcqDq+VEKkygU3x+GlXF1wpj2O4DvyJt3yETspl
	 CDhjwOVypyvW7U1B9pBDxM5l/BxqiI6xPIJ+tgoZMMDx1eyZeHFzddm+4f68guyOAPzqB
	 csxYJOD2+aOHUBpx1G862bM1W/ZIH7aQJEZq385KJQMRPbcquG7+wzV4IhVvh9rSo7t16
	 XlfwvExob2HoyxGyRkU88GO9vLqMuieMvKBQARCJl25zEBRTK5kZ+Rp2Co5ANzCz6Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QaM5xXg6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GZPN26rX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43423606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43423606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QaM5xXg6;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GZPN26rX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793648963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWVCxwNmclKBiA1HWgH44SVxokhuUVv65U9BSPMB8hM=;
	b=QaM5xXg6PmvuF2z/E6SOZAr0JcwXklTlOkwDEPt6dfgCn3qGyGo9aPbJMG1lDfX2ymvybP
	VXwQWYJx4WIVRWq9ir8SoTGJaIV2tNNPkKRPLIBIPGvDEqbTnjxKEwVrXizJ3OF4BZxqVD
	Wo78Af1CFCXX93dwiPj1Uh4pLM1KJfQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-y1IBDDO-PZuVXCodyTfKtw-1; Mon, 02 Nov 2026 14:49:22 -0500
X-MC-Unique: y1IBDDO-PZuVXCodyTfKtw-1
X-Mimecast-MFC-AGG-ID: y1IBDDO-PZuVXCodyTfKtw_1793648957
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3acd4c7120eso4411591fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793648957; cv=none;
        d=google.com; s=arc-20260327;
        b=F16j5Po/OlO1sglt+nT+FLorYKvfEGCvBdzX9yeKW+lmKigKf1JHZ5T1ndOFzY4rrr
         gJwgiQZh/A+6i4JrtI3H+nq+sYiGZJ2ZAwSxzqsjDv3BTB08GNmPpAmdIYDTQuojdjv1
         p2p+WUks9ZXSNkvein0UaDYi+aSrFo7Q/QLcEghUzxz1Q/ss5+YryW3pI/dQsV9DgyMo
         56YGYCj+bogCKtjX4y78vnnZYYwC1LCvyrKNBgWNhJuENXuAPladDL1fawlgLQBjGJWB
         dAHFcU4zUO15NQZdLLs0OkmCRQmrTUg0uKsqTWFWzYItCRZg93kU0avimkbe57oSPo4y
         /bxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WWVCxwNmclKBiA1HWgH44SVxokhuUVv65U9BSPMB8hM=;
        fh=E2PkJi+YL0Dd7QnmoKiRMBB9VNxkP5ehkUL3Jf5tp34=;
        b=fp4VFy30MgUM4Fr+CRBKq0qdQ8eFw555QvlDIhXVKP/tT34iSSh9A2TC3gzXPPbe33
         vXAiYCbL17293QOC+Vgbp8xSDYMjO51d3P6vIKvl/9Xg8KSdQy297ZT1lqPM6+4wfiv1
         xQgEi+VOQ9mPG7X2L+J9CYVnQ46s1yM1uTFlXaSXR/313I/0Q0GLztWJ9ZdttvMYXu8K
         oT88JrN3JG/Ilza/mZpl5o/5YzG4WV9KyNKvtQNETc98n1QxubayGkMWDLHOrIE10MUN
         6bmMk0ICKghLEKgGumSI9DqWPrYtJ0P+hFkOJs5j6yCirQzJI2MlSKrWkYi9QOS1SOk1
         bwYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793648957; x=1794253757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWVCxwNmclKBiA1HWgH44SVxokhuUVv65U9BSPMB8hM=;
        b=GZPN26rXTz648Sbx7W2NREvzZidWMGu/9zzzgP6NsavF63+B7pRst7xS4Fnv9KOl44
         DhZMUc4xAzmMwZj8CCl2Jcfl5gVYuXzXdEJsMbgbogVi74gWGWx6uSeg3iHAlV9AuosU
         bKfNrWDKSfyaYZdeclnUzak4XyypB774QqE2bJNMD157EeQCYVIJuP+miOsBk6y6uw/C
         deKBvWK1W68FtjRpekltm5PgEZdkUooFhAQrt4IiQOLLDaJeLMd0SVc3Zw+Ib/6jteqx
         b06J3pWcov/ZPjUWmXQ1+Vly5mG/MNo7ITk0TKpqQtAMogKJbt7N2+F/Ol1LPp30Ri31
         Unxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648957; x=1794253757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWVCxwNmclKBiA1HWgH44SVxokhuUVv65U9BSPMB8hM=;
        b=D8chMF8PoNkDC+jcUQl3rVpsubVuF/gnsdiI+9bB/Ls+hh623Q18flz2u5LmmL0IWT
         wj2d/AUHzjfm9rbulrtm9CdXX4HNcb9UawK3HzbcqZ1sFrJ+EWJ0MQosy+AaaDqzoJAp
         cQ0kjOloOtuSWk56LqPMbFXGeeDfTQeaTWKcenku2WVvl8ls9jVX4OFqGZBKp8i0Ds0v
         Tk5Ve+3FMIFvm2sWA40fNvldbA40K7WjsDsT3qM72qeYRaJox5Mh3RkN077fPIQGc6NQ
         LYBWV4D/RV2oxPLiyBxvyOLxvkGGsI0H2Cpvmi/nfDf0fqvpAa8pTlNzxna+6PAkruIo
         W8EA==
X-Forwarded-Encrypted: i=1; AKwUvBztWzxg+sUwB7m/sjnvpIaDLNdg97RhLJ4mCUPokhOJ7fJTdpTrYD3g1ISolPnNNiS/k+8+ajpUG1xraQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TCyIwmvA+ikYNdQIGdn0SQrxsojDE5SZQ1LO3qOCf4mGea3qN
	DjkguX2ij8/Eg5oYc/E1GRD2WMTWlyVMrFY2/xYt8kewBnv1YM3jV7cZLvPYe9uxPI1HjOmGucC
	3RgZ8yO0Wn6kYF6X5gVVqfV+DvS5sxD6HzrtnAwe/TnolCp3uC7s13H7Gj0IZQkSRQBQCrUfPOD
	0kP29Rtlbyd8MPh1qQwUXs/K4DnIbZMy6uIV2AY72Z
X-Gm-Gg: AYBFou03jtWfgQufR3CCrdE+ndxrSwm0PqdQ765310YZIfGHSWLoUcSQFpzjXXypAIJ
	cu7nN6Bipucbn1CQK2dfx9VaRPFIOurJTZmscR9Hkb65Cbfr9ZOG7ljZgulHQVGNIVMDJYROUEV
	6hKiInxpCI0NXVlTDv6rctIyghtgTjvYUt9dgFFxh+xcbp2iK9Mnx+z7EO
X-Received: by 2002:a2e:a551:0:b0:3ac:8ce3:c477 with SMTP id 38308e7fff4ca-3acb7b30453mr24991641fa.21.1793648957442;
        Mon, 02 Nov 2026 11:49:17 -0800 (PST)
X-Received: by 2002:a2e:a551:0:b0:3ac:8ce3:c477 with SMTP id
 38308e7fff4ca-3acb7b30453mr24991601fa.21.1793648957032; Mon, 02 Nov 2026
 11:49:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019151627.3324886-1-ameer.hamza@truenas.com>
In-Reply-To: <20261019151627.3324886-1-ameer.hamza@truenas.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 14:49:04 -0500
X-Gm-Features: AclHuK9ZeucLYL1DScuSSaHH7_rMZLYot-5hfyfC4xJE5FYtmB70sxRvxJe_mfg
Message-ID: <CAK-6q+j64=mSzuufOaSGjsC2aSwhb0hs9MKxxaAhbwugdztHZw@mail.gmail.com>
Subject: Re: [PATCH] dlm: don't set RSB_MASTER_UNCERTAIN on rsb with no master
To: Ameer Hamza <ameer.hamza@truenas.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	caleb.stjohn@truenas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 19, 2026 at 11:17=E2=80=AFAM Ameer Hamza <ameer.hamza@truenas.c=
om> wrote:
>
> When a local request reuses an inactive rsb, find_rsb_dir() sets
> RSB_MASTER_UNCERTAIN if res_master_nodeid is not our nodeid. This also
> matches an rsb that never got a master (res_master_nodeid 0, res_nodeid
> -1). set_master() then trusts the "cached" master, copies res_nodeid -1
> into lkb_nodeid and skips the lookup, and _request_lock() hits the
> DLM_ASSERT(r->res_nodeid >=3D 0) in is_remote():
>
>   rsb: nodeid -1 master 0 dir 1 flags 200 first 1 rlc 0 name pr
>   Kernel panic - not syncing: DLM:  Record message above and reboot.
>   Call Trace:
>    _request_lock.cold+0x3e/0x3e [dlm]
>    request_lock+0xcc/0x110 [dlm]
>    dlm_user_request+0x110/0x340 [dlm]
>    device_write+0x605/0x6d0 [dlm]
>
> Such an rsb is left behind when a request is cancelled while its lookup
> is still outstanding and the lockspace then recovers, e.g. because the
> dir node died: dlm_recover_waiters_post() completes the cancelled lkb
> instead of resending it, so no master is ever set. Once the rsb is
> inactive, the next request for the name revives it and crashes as
> above. If we became the dir node in that recovery, deactivate_rsb()
> even keeps the rsb as a dir record, so it does not age out.
>
> Before commit c04fecb4d9f7 ("dlm: use rsbtbl as resource directory")
> the flag was only set when res_nodeid was > 0. Restore that and set the
> flag only when a master is actually cached, so that set_master() does a
> normal lookup (or becomes the master itself as dir node) for an rsb
> that has none. res_first_lkid is still cleared, as the cancelled lkb
> leaves a stale id behind.
>
> Fixes: c04fecb4d9f7 ("dlm: use rsbtbl as resource directory")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Ameer Hamza <ameer.hamza@truenas.com>
> ---
> Reproduced with two nodes: pause the dir node for a name, request the
> name, cancel the request once the lookup is out, remove the paused node,
> request the name again. The second request asserts without this patch
> and is granted with it, also when the dir node moves to a third live
> node.
>

question:

how do you "pause" anything in DLM?

>  fs/dlm/lock.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index c715e171bab7..2323c7709aa1 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -826,8 +826,12 @@ static int find_rsb_dir(struct dlm_ls *ls, const voi=
d *name, int len,
>
>         if (from_local && (r->res_master_nodeid !=3D our_nodeid)) {
>                 /* Because we have held no locks on this rsb,
> -                  res_master_nodeid could have become stale. */
> -               rsb_set_flag(r, RSB_MASTER_UNCERTAIN);
> +                * res_master_nodeid could have become stale.  If no mast=
er
> +                * was ever set, there is nothing to confirm and set_mast=
er()
> +                * must resolve it as for a new rsb.
> +                */
> +               if (r->res_master_nodeid)
> +                       rsb_set_flag(r, RSB_MASTER_UNCERTAIN);
>                 r->res_first_lkid =3D 0;
>         }

I tried this patch and no significant failure occurred, although your
case is difficult to hit with a normal workload. So I will ack this
patch...

Acked-by: Alexander Aring <aahringo@redhat.com>

This reminds me that there are too many places that determine the
master or when the master isn't set, instead of having one central
place. I tried to improve this situation, but the changes seemed too
extensive to be accepted upstream. [0]

- Alex

[0] https://lore.kernel.org/gfs2/20240423195559.1527187-9-aahringo@redhat.c=
om/

