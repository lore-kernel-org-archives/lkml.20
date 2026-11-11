Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794374474;
	b=edUzCstQRmzQHlcXHzuiD6K6wv3Li/40uanDxvjKp5QP29lvm/ksL8rTiuDsMmpZDWw4
	 jxB9bPAxuril9W/At0wbEJlTZOflPdT/kV4HVCtUvUUq6XT6NVLxVN2jTyHpZhTeQzQ6C
	 2/GOF4GoqiFxeOQ1qVYcI7KDvrl+BgaNsUzh2IMrCg+kqhTfWv8S/8yU6kUoHtD5B4sp5
	 mV9MkibEX+cXmV9hnkTar1f0S6CojYik6AS0oC89XNfqPgk2BXUFOrxZ/0uSFOyNEk5wC
	 tYFK2A9fj5woeSZfa3pXqZP/oTtuYlegJu/3ZESI9MhOvsY5AADNV55biP6qj7wGPvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794374474;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=MTBtxrM7n4p3Ub82CkQlRDSMG5+E5wJ0wH/ucqq5mAg=;
	b=K7nCJXU87gKuZX7YWocjgZ5E3gDqDOTFOSRrvfyZAvPYxlrRrV4sNWLZQR3slHBgJFBY
	 H/4rLJ4GEl9WlwfroGELJ7EbuoJWkZqc/F6txIxDu8bcsL6lLAv2XE6eKLQiZyj2IUP5T
	 FXBi0fXfw01aP0rsno1o9ypIDgxqXC1Zoyq05fbCelD+DajJ3AOtFFAzQFURf/93R85bW
	 q5PT8Pqyf6pDEfnqjxnUcRCH5a//ul4gFFzMPTdxGQbTTQ7lZk7KkO9Nch1+24uTKxkPs
	 Wtb91MGsZ2SBQvrw0N/TDqmjWzzMBFsUsUpI/VULOgOoctY42oKqcRxitc2dylNap7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="XFQ6/mGJ";
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430E6606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 430E6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XFQ6/mGJ
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1171118a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794374473; x=1794979273;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTBtxrM7n4p3Ub82CkQlRDSMG5+E5wJ0wH/ucqq5mAg=;
        b=aoEbEPVjXotRhO9b2hXJ1cbgrmRx4DZgRYAOlqIYT6bxYE6sDnGr62EnZIFoHeIEj9
         yhQzDQe5jXPz+Cbph+bnWcmWQ4wCKiOcZfZ3UkpeNiugIoNF5A6YUVSqo26Gt/8uvYZ/
         QQkZm55oM/VddEmcZ7wN0sjdPG3jmsX5vqbYQOH2VPVklwulSp2YzFZaYYQNFlRk8D7c
         5TU8j1l4xMwkrplHRg+PVCAn1vuK2+ab6Wj8OSDKa5lURgEBs2BsE1uHxMsnLeqqlkk/
         RDVuupPZ2lTsLyBHdA0qs8fLbPK8S6Kt70O/ZzccMTfKoCl/w1923IZuZyUkl+FfZZ5Y
         lNhg==
X-Forwarded-Encrypted: i=1; AL+hErE5+b+AzdVuXm0eVG0I/eOujPZKlMiB3ZWoU9XdkrJj6i+LLXu9a7TnMvzHCA1oacYHUPGAfm3iz6Xdl10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YeLZ4uhYfci5p5Y5Ickio6NhRlhj2GFTY5YHmgHnsP2hy+nyD
	17S+ZUNsMzyNUIny+D7w/3AqvGIvQ8QRsMPFU023nmu+PxECpH8lUNFK7K8Rs5g10zcc8EnsoJy
	tDeDVSCtDU3Gnclx/WQEDOpXmeWSOGuKIirsACA4ojr+rMjYagskzRDpjOkqpDbPgYuxdZLCQbv
	LILq3PXMmZZ2A3Re8DrIahLsloBTmTxRMg0BlT9bh9wHwXFD7DyrPZ3MRGFCjTjxaGU8ooHLw1+
	hb0PFbGNg5Vci2cug==
X-Gm-Gg: AYBFou1LgFumoHK7E9YVBj2qwFefeh39ulVN0d8AF/YndHuSAUFKDwbCLPpboFdCMFm
	9g0scxSceAyigaphGFKA2b+HQN5Ezt8HLOcD8HTV3QS6YqXNrlfAkhBjzpiALSK2sgTe59TS8Lr
	MnZjp6rsb1PvpxDrn+vlv8EsUp6Lh9aHvERaCRHDe0bFb2VUJOLxGI1UO4PbGE4HP4oa/f5LNmS
	mg6TimTaQxUlWN7xA0Yq+c+CztgwSMjy0vdGFaE0OABzFI1OyPbRHDpQZeFhr5Z0NjPSHdEQydj
	MLOklskwCkVHTi8aAeokUcQrmXf+skO/uWujlbcVvquLUPjIiVLfUfo9OA6ribAB8q6fXCZt5E2
	ArqCO91KrPCI0mSmySw9nQIYapNSp2eP+cY8iiHvCVLnB+p/Atuhcmlyn73efCfJ850q5NF7Mp1
	ln9HQ4ln9U22SpwVLt58EHhZ2SBfCICWfK2w==
X-Received: by 2002:a17:90b:4ac2:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3b182f23803mr1446917a91.46.1794374473252;
        Tue, 10 Nov 2026 21:21:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17db7fc21sm1253142a91.7.2026.11.10.21.21.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 21:21:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso2053942241.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794374470; x=1794979270; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTBtxrM7n4p3Ub82CkQlRDSMG5+E5wJ0wH/ucqq5mAg=;
        b=XFQ6/mGJZPkpcLzMUrd69mmx5ksVtTTDwzaZjDZv4TDntWXLLUYp4ngGfjqd1afcVL
         v0QfTLfjrtB/T58n3j1hqEkgifS6Kv96m8qOJHsp2Z58hWbwjeYOMSklvUAt4sEpSLr/
         u2llkPZo5ABJ7U/6wQG1es/j6iGMp5VD6zVBg=
X-Forwarded-Encrypted: i=1; AL+hErGrx5+CcWbk4PDsEOPP6fGZ0DjMsG6v5cowkxHwXfdMIzImhpcocx5ItJqmj8vRkZ4AQNkZfpVEB2sViKM=@vger.kernel.org
X-Received: by 2002:a05:6102:419f:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7d506111110mr389902137.23.1794374470449;
        Tue, 10 Nov 2026 21:21:10 -0800 (PST)
X-Received: by 2002:a05:6102:419f:b0:7cc:2712:caf2 with SMTP id
 ada2fe7eead31-7d506111110mr389895137.23.1794374469840; Tue, 10 Nov 2026
 21:21:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106093524.838341-10-vikas.gupta@broadcom.com> <179432756090.994134.6899387473854989127@kernel.org>
In-Reply-To: <179432756090.994134.6899387473854989127@kernel.org>
From: Vikas Gupta <vikas.gupta@broadcom.com>
Date: Wed, 11 Nov 2026 10:50:57 +0530
X-Gm-Features: AclHuK9SerFALCrmm9axCODMvbDutIaUOf4S5gZtn7THlLii6HvYbDmP9TWeSL0
Message-ID: <CAHLZf_vP2vf1eJOKPUdLmWB9CJ+=wP6wfrvdWhrPE=joDeurGQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 09/10] bnge: add aRFS flow steering ndo support
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com, 
	dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ee47fe065ff95c55"

--000000000000ee47fe065ff95c55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see a few of Sashiko's comments are valid and will address them in v7.

On Tue, Nov 10, 2026 at 9:49=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 3 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The aRFS expiry loop in bnge_cfg_ntp_filters()
>   (drivers/net/ethernet/broadcom/bnge/bnge_filter.c) ignores the return=
=E2=80=A6
> - [Medium] Check-then-act race between the aRFS expiry loop in
>   bnge_cfg_ntp_filters() and the retarget path in bnge_rx_flow_steer().
> - [Medium] bnge: race on ntp_fltr->l2_filter_id in bnge_open_core()
>   inserts duplicate filter
>
> --
>
> bnge: add aRFS flow steering ndo support
>
> This commit adds an ndo_rx_flow_steer callback to the bnge driver. The
> callback creates NTUPLE filters for aRFS and inserts them into the NTUPLE
> hash table. A new function, bnge_cfg_ntp_filters(), runs from sp_task to
> program pending filters in firmware, reprogram retargeted filters and
> expire idle filters via rps_may_expire_flow().
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers=
/net/ethernet/broadcom/bnge/bnge_filter.c
> > index 6cf6531a27231..579eca2b7aee9 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
>
> [ ... ]
>
> > @@ -711,3 +711,80 @@ void bnge_clear_usr_fltrs(struct bnge_net *bn)
>
> [ ... ]
>
> > +     list_for_each_entry_safe(fltr, tmp, &expire_list, base.list_node)=
 {
> > +             list_del_init(&fltr->base.list_node);
> > +             /* Retargeted by bnge_rx_flow_steer() after the scan */
> > +             if (test_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state))
> > +                     continue;
> > +             bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr);
> > +             bnge_del_ntp_filter_rcu(bn, fltr);
>
> [Severity: Medium]
> Should the return value of bnge_hwrm_cfa_ntuple_filter_free() be ignored
> here?
>
> The free can fail in two ways. bnge_hwrm_req_init() can fail to allocate
> the request, or bnge_hwrm_req_send() can hit a firmware error or timeout.
> In both cases filter_id stays valid:
>
> bnge_hwrm_cfa_ntuple_filter_free() {
>     ...
>         rc =3D bnge_hwrm_req_send(bd, req);
>         if (!rc)
>                 fltr->base.filter_id =3D BNGE_FLTR_ID_INVALID;
>         return rc;
> }
>
> bnge_del_ntp_filter_rcu() then unlinks and frees the software filter,
> which is the only object holding that firmware id. It also clears the
> filter's sw_id bit in ntp_fltr_bmap.
>
> Does this leak the firmware n-tuple rule? It would keep steering the flow
> to the old RX queue, and the driver could not free it until the interface
> is closed.
>
> The update_list loop earlier in bnge_cfg_ntp_filters() handles the same
> failure by keeping the software filter:
>
>         if (bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr))
>                 continue;
>
> Should the expire loop do the same?
>
> This path becomes reachable once the follow-up patch "bnge: add cpu_rmap
> support for IRQ affinity" sets dev->rx_cpu_rmap.
>
> [Severity: Medium]
> Can a concurrent retarget from bnge_rx_flow_steer() still get lost here?
>
> The test_bit() check runs without ntp_fltr_lock. The filter also stays
> linked in ntp_fltr_hash_tbl until bnge_del_ntp_filter_rcu() runs, which
> happens after the sleeping HWRM free. One possible sequence:
>
> sp_task, in bnge_cfg_ntp_filters():
>   rps_may_expire_flow() returns true, so the filter goes on expire_list
>   test_bit(BNGE_FLTR_RXQ_UPDATE) returns false
>   bnge_hwrm_cfa_ntuple_filter_free() sleeps
>
> softirq on another CPU, in set_rps_cpu()->bnge_rx_flow_steer():
>   bnge_lookup_ntp_filter_from_idx() finds the still-linked filter
>   WRITE_ONCE(fltr->base.rxq, rxq_index);
>   set_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state);
>   rc =3D fltr->base.sw_id is returned to set_rps_cpu()
>
> sp_task:
>   bnge_del_ntp_filter_rcu() unlinks the filter and clears its sw_id
>   in ntp_fltr_bmap
>
> set_rps_cpu() then stores the returned sw_id in rflow->filter. While the
> flow stays active on the same CPU, set_rps_cpu() then takes this path:
>
>         if (READ_ONCE(tmp_rflow->filter) !=3D RPS_NO_FILTER) {
>                 if (rps_flow_is_active(tmp_rflow, ...)) {
>                         if (hash !=3D READ_ONCE(tmp_rflow->hash) ||
>                             next_cpu =3D=3D tmp_cpu)
>                                 goto out;
>
> So ndo_rx_flow_steer() is not called again.
>
> Doesn't that leave the flow without hardware steering until it goes idle
> or moves to another CPU? The RPS flow table would also hold a sw_id that
> has been released and can be reused.
>
> The comment "Retargeted by bnge_rx_flow_steer() after the scan" suggests
> this check is meant to cover that case.
>
> The scan loop also reads rxq and flow_id as two separate lockless loads:
>
>         rxq =3D READ_ONCE(fltr->base.rxq);
>         flow_id =3D READ_ONCE(fltr->flow_id);
>
> Could these see a torn pair while a retarget is in progress, and put a
> filter that was just retargeted on expire_list?
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers=
/net/ethernet/broadcom/bnge/bnge_netdev.c
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> > @@ -3222,6 +3231,132 @@ static int bnge_set_features(struct net_device =
*dev, netdev_features_t features)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_RFS_ACCEL
> > +static __le64 bnge_lookup_l2_filter_from_key(struct bnge_net *bn,
> > +                                          struct bnge_l2_key *key)
> > +{
> > +     u32 idx;
> > +
> > +     idx =3D jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed)=
 &
> > +           BNGE_L2_FLTR_HASH_MASK;
> > +     return bnge_lookup_l2_filter_rcu(bn, key, idx);
> > +}
> > +
> > +static int bnge_rx_flow_steer(struct net_device *dev, const struct sk_=
buff *skb,
> > +                           u16 rxq_index, u32 flow_id)
> > +{
> > +     struct ethhdr *eth =3D (struct ethhdr *)skb_mac_header(skb);
> > +     struct bnge_ntuple_filter *fltr, *new_fltr;
> > +     struct bnge_net *bn =3D netdev_priv(dev);
> > +     struct flow_keys *fkeys;
> > +     __le64 filter_id;
> > +     u32 flags, idx;
> > +     int rc =3D 0;
> > +
> > +     /* Hold rcu_read_lock() across the L2 filter lookup and check
> > +      * BNGE_STATE_OPEN inside it. bnge_close_core() clears the
> > +      * flag before bnge_shutdown_nic() frees the L2 filters via
> > +      * kfree_rcu(), so if we observe the device open here the
> > +      * filter cannot be freed under us for the duration of
> > +      * this critical section.
> > +      */
> > +     rcu_read_lock();
> > +     if (!test_bit(BNGE_STATE_OPEN, &bn->bd->state)) {
> > +             rcu_read_unlock();
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (ether_addr_equal(dev->dev_addr, eth->h_dest)) {
> > +             struct bnge_vnic_info *vnic =3D &bn->vnic_info[BNGE_VNIC_=
DEFAULT];
> > +             struct bnge_l2_filter *l2_filter;
> > +
> > +             if (!vnic->uc_filter_count) {
> > +                     rcu_read_unlock();
> > +                     return -EINVAL;
> > +             }
> > +             l2_filter =3D vnic->l2_filters[0];
> > +             filter_id =3D l2_filter->base.filter_id;
> > +     } else {
> > +             struct bnge_l2_key key;
> > +
> > +             ether_addr_copy(key.dst_mac_addr, eth->h_dest);
> > +             key.vlan =3D 0;
> > +
> > +             filter_id =3D bnge_lookup_l2_filter_from_key(bn, &key);
> > +             if (filter_id =3D=3D BNGE_FLTR_ID_INVALID) {
> > +                     rcu_read_unlock();
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     new_fltr =3D kzalloc_obj(*new_fltr, GFP_ATOMIC);
> > +     if (!new_fltr)
> > +             return -ENOMEM;
> > +
> > +     fkeys =3D &new_fltr->fkeys;
> > +     if (!skb_flow_dissect_flow_keys(skb, fkeys, 0)) {
> > +             rc =3D -EPROTONOSUPPORT;
> > +             goto err_free;
> > +     }
> > +
> > +     if ((fkeys->basic.n_proto !=3D htons(ETH_P_IP) &&
> > +          fkeys->basic.n_proto !=3D htons(ETH_P_IPV6)) ||
> > +         (fkeys->basic.ip_proto !=3D IPPROTO_TCP &&
> > +          fkeys->basic.ip_proto !=3D IPPROTO_UDP)) {
> > +             rc =3D -EPROTONOSUPPORT;
> > +             goto err_free;
> > +     }
> > +     new_fltr->fmasks =3D BNGE_FLOW_IPV4_MASK_ALL;
> > +     if (fkeys->basic.n_proto =3D=3D htons(ETH_P_IPV6))
> > +             new_fltr->fmasks =3D BNGE_FLOW_IPV6_MASK_ALL;
> > +
> > +     flags =3D fkeys->control.flags;
> > +     if (flags & FLOW_DIS_IS_FRAGMENT) {
> > +             rc =3D -EPROTONOSUPPORT;
> > +             goto err_free;
> > +     }
> > +
> > +     new_fltr->l2_filter_id =3D filter_id;
> > +
> > +     idx =3D bnge_get_ntp_filter_idx(bn, fkeys, skb);
> > +     rcu_read_lock();
> > +     fltr =3D bnge_lookup_ntp_filter_from_idx(bn, new_fltr, idx);
> > +     /* Filter already exists. If the flow moved to another queue,
> > +      * retarget it, sp_task reprograms it in hardware.
> > +      */
> > +     if (fltr) {
> > +             if (!(fltr->base.flags & BNGE_ACT_NO_AGING) &&
> > +                 READ_ONCE(fltr->base.rxq) !=3D rxq_index) {
> > +                     spin_lock_bh(&bn->ntp_fltr_lock);
> > +                     WRITE_ONCE(fltr->base.rxq, rxq_index);
> > +                     WRITE_ONCE(fltr->flow_id, flow_id);
> > +                     /* Pairs with test_and_clear_bit() in sp_task */
> > +                     smp_mb__before_atomic();
> > +                     set_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state);
> > +                     spin_unlock_bh(&bn->ntp_fltr_lock);
> > +                     bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT)=
;
> > +             }
> > +             rc =3D fltr->base.sw_id;
> > +             rcu_read_unlock();
> > +             goto err_free;
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     new_fltr->flow_id =3D flow_id;
> > +     new_fltr->base.rxq =3D rxq_index;
> > +     rc =3D bnge_insert_ntp_filter(bn, new_fltr, idx);
> > +     if (!rc) {
> > +             bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
> > +             return new_fltr->base.sw_id;
> > +     }
> > +
> > +err_free:
> > +     kfree(new_fltr);
> > +     return rc;
> > +}
> > +#endif
> > +
> >  static const struct net_device_ops bnge_netdev_ops =3D {
> >       .ndo_open               =3D bnge_open,
> >       .ndo_stop               =3D bnge_close,
>
> [Severity: Medium]
> Can bnge_rx_flow_steer() run here before the retained user n-tuple
> filters have been rebound to the new L2 filter?
>
> bnge_close_core() keeps the ethtool n-tuple rules in ntp_fltr_hash_tbl
> and usr_fltr_list. They keep the l2_filter_id they had before the
> close. On the next open, bnge_init_chip() allocates a fresh default L2
> filter in vnic->l2_filters[0]. bnge_open_core() then enables NAPI,
> sets BNGE_STATE_OPEN and enables interrupts. It calls
> bnge_cfg_usr_fltrs() only after the sleeping HWRM calls in
> bnge_get_port_module_status() and bnge_hwrm_realloc_rss_ctx_vnic().
>
> In that window a packet for dev->dev_addr can reach
> bnge_rx_flow_steer(). It passes the BNGE_STATE_OPEN check and picks up
> the new vnic->l2_filters[0]->base.filter_id. It then looks the flow up
> with bnge_lookup_ntp_filter_from_idx(). bnge_fltr_match() compares
> l2_filter_id, so a retained user rule for the same tuple does not
> match while it still carries the old id. The NO_AGING branch, which
> is meant to let the user rule win, is skipped.
> bnge_insert_ntp_filter() then adds a second, dynamic filter for that
> flow to the bucket.
>
> There is also a plain data race on the field itself.
> bnge_cfg_one_usr_fltr() rewrites ntp_fltr->l2_filter_id without
> ntp_fltr_lock:
>
>         ntp_fltr->l2_filter_id =3D l2_fltr->base.filter_id;
>
> At the same time, bnge_rx_flow_steer() and bnge_insert_ntp_filter()
> can read that 64-bit value from softirq. On 32-bit the read can tear.
>
> Doesn't this leave two hash table entries for the same flow? Once
> sp_task programs the dynamic one, it could also leave two firmware
> rules, one steering to the aRFS queue instead of the queue or action
> the user configured with ethtool.
>
> Would it make sense to restore the user filters before
> BNGE_STATE_OPEN is set? Alternatively, bnge_rx_flow_steer() could
> back off until bnge_cfg_usr_fltrs() has run. If the l2_filter_id
> update has to stay where it is, should it at least be done under
> ntp_fltr_lock?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261106093524.838341-1-vikas.gupta%40broadcom.com

pw-bot: cr

--000000000000ee47fe065ff95c55
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
ZKzsTDzWEhPsCM5DcbMg/B7eD9n+rBWHxsk+yKJKdkLpkpTKdxxTd1Y5Ln+k5KCTjxlCUQQ7Q2Zz
qYU8bfRq5ZMwUVJD3NZCqEKbEIgSX2vXFS61zdPwnLyHyaC/erAWmgHLu4kzpk/V10NcnUjX9FYK
f/Ggi9MeMNG20gEIUbCg3RgYf89YLXUJDOuoz/Yajw/VuiVlwS81wF44DmJhAVcGzrI00uydpksG
oQY2qVlhYsvNTqU2V/uaBrKQnyM0PkU140cCAwEAAaOCAdwwggHYMA4GA1UdDwEB/wQEAwIFoDAM
BgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcw
AYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIARe
MFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZo
dHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBo
dHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIwYDVR0RBBww
GoEYdmlrYXMuZ3VwdGFAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQY
MBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQI6pBWVwIN47wGrC1m7lYfqN94QjAN
BgkqhkiG9w0BAQsFAAOCAgEAOdSnSEyuTvTtsnmEilB0JfgRKx1MM7kNdv0pfWcINJhssfHD8Fc5
wm+JzenYR9yJAkntX0Lr9yv+OG0Jqhvy7u9gKljfI4jXO4qxZ2jf1YvI+fDK29/NV3JAQuipT3Vs
IxBI73CQO11VwMePOTsUNM1s+9cWT5zLuqOEEu+95jRo5KEtH1/4nahrToLU1Y+flylsBaAUhB72
KoBBzdewa+psa32lY8X23AWDoczIlUBmPt0hmApBvHOUCYszSiBu4/VhVDuq2iMBtnYAj2j9Q7Ct
pZHPj6fQv247S9dTDDym05r8arHAsUw7B29KvPfxeaqexL4gwQQjIsfdZeh88XYLXA+mvEej6OlO
YO3546G7bczFxIjO6V9RrvYEeAb+n7udXYymuIm02XtxIkr/Uk0gRuFoOpG2Dw1OH8xsOUER1+16
qGb2QKMgaKL/IIM3gXAuCxNVBOT+Fj/wh5hw7MFvTTXPFA8IKusoHZYpxdrr9xjoJ/wt6j4/E6K4
IO/WuSc4nM6kshiwIu5c6r97213ZtJFOrjoITiBIYFP0WQsTsEbWvaBX/7daT5IVr9rvCOCk2JA8
bOWwP4OYXCKJY5nZOntb0ECSI7RM0kGelGY4MAD42+OBWHxKU1Qvt5WK4kIXdKpdFp9Drv17PyCU
dR4AvAJyWnkqZyi5QuRg/hMxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIz
Agxt8eaxmNwH4eu5pUowDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIHiR3QXTgOzR
budDaKssAqt/MCbFBO7X2xmaOq9qHGSUMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTI2MTExMTA1MjExMFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAKY7VAExySHoiYAJoDZ3e9mmGRrZKOTxpALg7Ob/sHL8zdQN
URen4CsccuOHLx4/rCx7QB3DWlKymXERUIDB/GV0N1N6A5/IGXccXzPVYmV6C5sMyD1muJh8t2+j
d2/FL6PqsWYb5aRSSU11MqdhtnlU8G3vFqV126QuRWhsUOk9oPx40CSbPOu+9Ei0MrMcCXmL99KJ
9r3PYYULzl1qg70D17QKtYJoeS74oBYxeL9Pb4HTlgqe8kcKQjXXQCb1S7NsHer9VsxM3XEFuTEk
bjfuLig8hWuJJMorsztoQiWn36xP2puYzST9vWn7Ub9qyit6hVKnugajcDk86clkOgU=
--000000000000ee47fe065ff95c55--
