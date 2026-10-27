Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793112723;
	b=QCw+vXjBIkVaFxACBzDDdQnM8vZ2nzXq2akoB0/vb1KUS1uUYS8w6rDP4wvLIF5gzh1F
	 vCo8bAE7NKzaq89Wvl2VVMM7WFLxoYEaAjYsyUtEwdltUjMXTA3BqHdfAKnn9yK7KDb8E
	 lpq9vEoNroJWcNLZYQvBE6Wo0wAO2oT9YRLHv4+s+Rr7dKGOOXxLUBHIgPWUhHOV6synX
	 9PNyRoJN36taMtQvvw15mS8h1q58JJAwcMqqy+n2R57Y3QEZ36M3Ccm5+cgqSHG+87jSs
	 PZzjAbAvb/XAynkxnKeTfmqB+02OAbyRDlJquBp4yX92KX2EpsSsRXs8c7r0rMy65nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FU7pIPRd0mpxW1uPh7JiRsMpomfdTBJ1PVqebYQBX/w=;
	b=Q0/hVRQxhemG/lrI+2M/0qed5gLEbxJuc36gxeMjHii5OXj1bajM9T/kWxABkwUTKtbx
	 vfIjLqF1QMQNAfTuI63DU/rJX6C48Qum6c++ntYtW+irYuaj0JxD2jRwdSpf6vPdbn9KK
	 ikrMvh9TQH/tHNZyUMoLG344lsn6GwShBTjBJ3YlkIrJ2Dq+PXt6lBC6FE3w9sFu5ia27
	 OC8gWg++oxH3szQ89SIKo/9tyh4dkoQMyaXf9bFaRyc2vcznRSZFPrGZBMLeR4FWj5cQJ
	 SYnZ+1ycF00Fs7A/C3EHMIzAaG43FJZdU6DMoqFt+G80K7NMFRavwGB6dzjYE3TkS5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DqjPCs4d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0739A60A260A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0739A60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DqjPCs4d
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea759cc9b6so16395405ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793112721; cv=none;
        d=google.com; s=arc-20260327;
        b=hqjNPCF8Ctxexx1z5MDbB6XF0QQnw3bkRaj2XTa33bG3cvWSAVMm6sq10tk4X50mGP
         CYQdAprdMd7Ra9Kjhvg466OYB16MrsDXd61ukbhsoWSc+mI8rs1l73tL3hbDQnRqIpFP
         elhNTZK9T8W+3e54uUrGHRuxYV0rCo+tHjP7RHf8Ya+6ACT7FeKGi2qhNh/HYXHHMnAM
         kFekUZX7GJE2OcYJTQMbErQZd73qbWF9m1CO92V/rbB9F60zB+uMRs3ORN/axNhVZo9L
         JnEQkSe22p1zSVIiXzPPhEeVDmCAxuBpHG3GKb9X7Qa1g0W/Cc4rWBXf+vADBspn8tWJ
         k1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FU7pIPRd0mpxW1uPh7JiRsMpomfdTBJ1PVqebYQBX/w=;
        fh=/USClreu/nqvnrAwbU34+xM34Z6SNWX5sKKgZdwUfIg=;
        b=mK9R0zMIUxcr6fp4k9a45qR7CTBvnag+DhIUX41sflOOLLB+6DBnD4yIk0bP7Ktr12
         IQcIoBgzwdNe2Voz4CiwbYqRi+xEDdQcaHC0nodC0PWYyzGt4ypXIZoUv/jaGb51xp9a
         p6pEPaoXu4FgsxufFUVT+x9yYw9HcP+f0IAXpkM2ZytCJ30+00cEQczI4009l47wSAT2
         mGfh4HrYITH+fMxjQ0edRMmu9/CQ6VyuNwDR4oknRq+cg3NA5Hhp3I4Ej2AmkNlG7WHD
         3HXD9iAtzIFY3wrepma5Of6mdu0Axdj2ipEVI8zLNDusj1ZMD+36QeQ7j6TkkTX7iLej
         2YEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793112721; x=1793717521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FU7pIPRd0mpxW1uPh7JiRsMpomfdTBJ1PVqebYQBX/w=;
        b=DqjPCs4dJ32bm7zSatdTMph8eLbrIiZizD/FLI1JoVoFvAmjQIOJhUuqKpg99V5b+s
         LLS+kBx6KBM8bc6Ni0PwXyd+NTKfacgRn/deaixv/tVlbXPDlA/Ca2On1e1TR1EFh+Br
         c1UUutur0IRU2qhpeDblRoVuCg/hmdOs/bxqb0UzpgRT9X+fREQJOsdQzhUQJTS12DBb
         KXfYFt3x79maA41r7KXzXiAL5gTDPnBnp2veRyQWM9pdLidDAhrilD2g8v685KXVIbPe
         6JwcjYXy7pWwc4D3RfOYB9ronLD89y6YutbPrktosT1/XrYkEpAmBnzk9gZ1f2PkR+gI
         zRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112721; x=1793717521;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FU7pIPRd0mpxW1uPh7JiRsMpomfdTBJ1PVqebYQBX/w=;
        b=C48Q0TiouHk2PxQzbzdlli1RgIIPrJHaBrrQ9R/yHXyB5qUafarVlJ85WvF7CjQp1I
         GLgO+IA6j4yaTpUjgyYudjXDMq5aT1U7JevhwRetH/9PZd19oJPodhCv72YfKd0AVZSH
         O9n+jInsBYI3Y7nJaCsyR46PPqfiVpqrtz4HEHOqY7OUrwb1RjGSELJjWWlN35BbEg7C
         efL5kIVkAWRbH8RHFrb1KMY5Iwf4S2imwu4T2maCw1UM5EVAWGiBu+hdjjccaDg0kvg/
         AEZSfpIjmf9LJm1Bjj0g/fd79z2VKWllQsGiftOHeljpsf0CKTBt5ILGQ6xiFnynOUDv
         8qZg==
X-Forwarded-Encrypted: i=1; AKwUvBxW+doXLkPWgvm8XYB2OqhzYQJnld4boaUgRS6UbOTR138DZTvsUrdPz2o8CEPaEAhCOD3kk8Z5cnQJ3+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlnPxghJoHJUtOiyNGihg+30i2sXBVNqAb4xnTpDg/bgDHHN9Q
	ecQ30LDDivy7VouZhqphM4MPO4c2odHhr92gX8wgbnEGf8Xhdcs4Pnc1JZYwErqLx0T93yx/ZYZ
	zMO0CeeVyuY/HXZSrr4lYZsFBPzPcSMd6sAGHt5fl
X-Gm-Gg: AYBFou3uZ7PigtPx0sEvSnsDCVJgXZ3btMDn+OMjS1STlZb0MmuOYG/tQtiYf0NIOMn
	KkHm/dgR89nCO61p5Cn7eAB8NhRX+R5Dkxi1eo0Cx5fsBX3AXpIuaHGEQ88wKOBUZKEnslEsKsf
	v+ZbX116D7VWDjZp9cUPB5+hlg4JkHM17uuAMRbRkUji1jBzxuyPYHN7POYzcezSQQ53kipuanH
	srhxgJq4a9BmaLVBLfYcB2LUkrc/SSF2yezjqbYnqlt6nAoOG+i5q2aNlhb6Fs4gwlB0IloqQyM
	6GEgYCtTmkgZRQGQBkbrxirpMnvbgcBCWoZQNAm/fLDkOcgjCmaWELTDL6rC1sHN9Ck/yRE1YgT
	i0uAp9XZUi2qOct+fEIAPSXboOmettK6x9Evp2pcqcCeIytzSXnVRpM4IlsCcSqS1BFl+SrKiBj
	7rctYG2q0dwG2xFWqZ
X-Received: by 2002:a17:903:1a30:b0:2e5:467a:7a6b with SMTP id
 d9443c01a7336-2ea9c69aa27mr88146155ad.10.1793112720805; Tue, 27 Oct 2026
 07:52:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023204706.3112215-5-hramamurthy@google.com> <179306532917.3134.3709041101906222542@kernel.org>
In-Reply-To: <179306532917.3134.3709041101906222542@kernel.org>
From: Pin-yen Lin <treapking@google.com>
Date: Tue, 27 Oct 2026 22:51:48 +0800
X-Gm-Features: AclHuK_CgLe0wYbEvzhKP5oLFw9n_XNsuU2Vaq53lhDlTw36CwDa4KLyFY57Fxk
Message-ID: <CAHwYsip9e1H4+g2FS-t_TBGkG+f4E0w+kc4r0Ni6ODnA57cpCQ@mail.gmail.com>
Subject: Re: [PATCH net v3 4/4] gve: Fix link flap after ethtool ops
To: netdev-bot+sashiko@kernel.org
Cc: hramamurthy@google.com, netdev@vger.kernel.org, joshwash@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, jordanrhee@google.com, willemb@google.com, 
	przemyslaw.kitszel@intel.com, nktgrg@google.com, maolson@google.com, 
	jacob.e.keller@intel.com, pkaligineedi@google.com, yangchun@google.com, 
	patricion@google.com, awogbemila@google.com, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:42=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] Synchronous link-status update in gve_queues_start() races
>   with gve_service_task(); the carrier can be left in the wrong state.
>
> --
>
> gve: Fix link flap after ethtool ops
>
> gve_queues_start() now calls gve_turnup_and_check_status() directly
> instead of queueing the service task, so the carrier state is updated
> before the call returns to userspace. This avoids the transient carrier
> drop after ethtool reconfiguration that was breaking the
> drivers/net/ping.py selftest.
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index 52c152a986eb7..e2a016f4430a8 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
>
> [ ... ]
>
> > @@ -1486,8 +1515,7 @@ static int gve_queues_start(struct gve_priv *priv=
,
> >                         round_jiffies(jiffies +
> >                               msecs_to_jiffies(priv->stats_report_timer=
_period)));
> >
> > -     gve_turnup(priv);
> > -     queue_work(priv->gve_wq, &priv->service_task);
> > +     gve_turnup_and_check_status(priv);
>
> [Severity: Medium]
> Can this race with gve_service_task() and leave the carrier in the wrong
> state?
>
> Before this change, gve_queues_start() sent its link update through
> service_task. A work item never runs concurrently with itself, so these
> updates were serialized.
>
> gve_queues_start() is reached from ndo_open, from gve_adjust_config(),
> and from gve_reset()->gve_recover()->gve_open(). It holds rtnl and the
> netdev instance lock, and it now runs the same sequence as
> gve_service_task().
>
> gve_service_task() is queued from gve_mgmnt_intr() and holds neither
> lock:
>
> gve_service_task() {
>     ...
>         gve_handle_reset(priv);
>         ops->report_link_status(priv);
>         gve_handle_link_status(priv);
> }
>
> gve_adminq_report_link_status() reads the register and writes the
> cached value in two separate steps:
>
>         status =3D ioread32be(&priv->reg_bar0->device_status);
>         WRITE_ONCE(priv->link_up,
>                    !!(GVE_DEVICE_STATUS_LINK_STATUS_MASK & status));
>
> Here is one possible interleaving:
>
> gve_queues_start()                  gve_service_task()
>   ioread32be() -> link down
>                                     (device link up, mgmt irq)
>                                     ioread32be() -> link up
>                                     WRITE_ONCE(link_up, true)
>                                     netif_carrier_on()
>   WRITE_ONCE(link_up, false)
>   netif_carrier_off()
>
> At the end the carrier is off while the device link is up. The service
> task run triggered by the interrupt has already finished, so nothing
> checks the link again until the device raises another status interrupt.
>
> gve_handle_link_status() has a similar window, because its check and
> its action are not done under a lock:
>
>         link_up =3D READ_ONCE(priv->link_up);
>         if (link_up =3D=3D netif_carrier_ok(priv->dev))
>                 return;
>
>         if (link_up) {
>                 netdev_info(priv->dev, "Device link is up.\n");
>                 netif_carrier_on(priv->dev);
>
> Suppose gve_queues_start() reads link_up =3D=3D true with the carrier off=
,
> and is then delayed in netdev_info(). In that time gve_service_task()
> can write link_up =3D false, see that it matches netif_carrier_ok(), and
> return. gve_queues_start() then calls netif_carrier_on() while the link
> is down.
>
> gve_set_xdp() and the per-queue start path already use the same
> pattern without a lock. This patch also brings it to the common
> gve_queues_start() path, which used to be serialized through the
> service task.
>
> Should gve_turnup_and_check_status() and gve_service_task() be
> serialized against each other here?

Yes, this needs to be serialized. All other callers of
gve_handle_link_status() already run under the netdev instance lock,
so in v4 we will take netdev_lock() around the link status update in
gve_service_task() as well.
>
> >       priv->interface_up_cnt++;
> >       return 0;
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261023204706.3112215-1-hramamurthy%40google.com

Regards,
Pin-yen
