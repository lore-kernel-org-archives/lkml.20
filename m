Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25D3F482F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021315; cv=none; b=KHlqEQyG8pshL/95TaPweGW2nsHaN9cXdqOfe0AeKl/u4bdXc3zX3b/umbdMII/5yVONn3MM9zovQusoGXfqg2NMajA4Bu1jwjSzAReFJ7yDA+nUnthSMiQo86XsofB1e5LLTx0FIWA9a8nsBd4BkfQQVz00ftdQyqdLmbpo9gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021315; c=relaxed/simple;
	bh=NHfm0Eh0e5c3LLN1fFu1fRbBPZmobkgTphSr2BvPs88=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=q2klK33gp9KVwTh/G0cmy2YvzM/4wWObtSrEnaP2/aNem8FRAK0BkrGEXa2ScBUZlyUDmNBdC/hnj/dmT7hHWInoT8Ol0NAKZGDiRz4x6cBZjLQDZZk+nEVqVRmcpnp3Ny54+xDXE4gESAgE1ERM6E3xk4wqWlnNXxs4lBChYzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IzdkOdoa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=noE5U2M2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IzdkOdoa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="noE5U2M2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791021312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQ8GTJMyG/70amiU9TQuHecr5ANRYYJaxoKqzMbMzN0=;
	b=IzdkOdoa3IfygrMoO9yhLFMh3KLIyUGfLLotGgjNZcSMpvVm20B5vlfXVq6rFyHwjiZVSi
	ooiyC64Md04ihly25ABWA9U2MvLNnJCWJTz2Eyp6K0+xh2bgQWUgFFphmx+kX2FdeESLKb
	aTx3yJb6NDsAbzwCoWW1vyL5Y46sAvk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-7d3QX02lOGaUKjVcg7vKjQ-1; Sat, 03 Oct 2026 05:55:11 -0400
X-MC-Unique: 7d3QX02lOGaUKjVcg7vKjQ-1
X-Mimecast-MFC-AGG-ID: 7d3QX02lOGaUKjVcg7vKjQ_1791021310
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49febef74e3so4997425e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791021310; x=1791626110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tQ8GTJMyG/70amiU9TQuHecr5ANRYYJaxoKqzMbMzN0=;
        b=noE5U2M2y5mmq+Vd/HOmuubDeUj9xH5I9SB5ud7h1b/jdSpbR+p7UIXYaUIAmXesnD
         YyHSj0SNXxy5hp7VkO8TK7vf4EhEc84+ntkw+GyRUzkhicynII9Fp/kVsP7zWCbgFQiC
         lnpYB9onbPRCh5X6p8Qr9gyPkxyc5fwHHz6QDwAHN0g0II2HDFQD/qnG7q4EjHFg2V60
         mHuMm5ZLW0NqHVCpZ/wmVtAeYTJ97D6TBfBHUmGZvOh2w4/1fVQWA1IFzN7Qu9FrhqNU
         du26bCTyM9CZt8LjGcE2lpjxpN9wDplK0rLG7820T7BEGwk9OGp/UEeEgwXiTcrrMTs4
         1mjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021310; x=1791626110;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQ8GTJMyG/70amiU9TQuHecr5ANRYYJaxoKqzMbMzN0=;
        b=FEdU3zsGa87zyNTXQPRMaZp0LyJiSMrfEkQgLi9yDYVbAgXR1VLsqbxBTclcJWDRvF
         ZTAsmD9awmMvEchSgADLvB6as6VQ+aplGZMljbAcW+nG+XUcntEz2/Dh/z6D87OzA9nV
         ynqooJ02SkZoqGrfzgrkHAVntbmCpLvpNfuvf5bute6vYiPPZSDrWEo2k1rZUi8tB0wn
         K3a0zVbEA+INGaGjLU/GGC4lBX3nIQwKCL0L3Sr51RGfVgkZ14Gm2EN08MXYXwvhXAsx
         xd9TrE1jMaC8q026sBsLMrBnPhzmA5vzxwLTuTL+UVITOni7J5PMHqep+4ocKevE9ear
         Eikw==
X-Forwarded-Encrypted: i=1; AKwUvBwAwgXTIbOQ8+sKhyCyk3EAMtcH/P3+lnrl6tgq5X6u3wYV0Q3O3LC97rivi4nYQLl2xDE2zcsRRVjVHxg=@vger.kernel.org
X-Gm-Message-State: AFuF++kRri9t7j7h38j2zEvCPj9SR11huJXm7uod1e1JVW5MBeeIgVuY
	jhlmF0EBR2ixq7aqq56cNg8ZcHJJL02MxPDE9UULRDU0i1DxxgpLuOVjDQSFShLwgHsxQs8lkBa
	8dbgzPZ7afGMY9dFf2/Fx6pUTAEFOEzYoKrSx+oSjgvLKjKB+XAMdgtnu8es/vntbGQ==
X-Gm-Gg: AYBFou0jREkcI50Tgamk5fzYTPlDCe/yNMJzbyel9g1V5B5fcdihrU6otuA5Oj/Z/Ee
	nXYeEnpJIY8C+ZQqi4BYY+7memOylDHuuwfdsTTVrR9jBG7nTtZnPPs3jSe6S93fAKgkAa/2GCW
	2ygSmatRD/4USt0unIQ9pCaSm3GEoPZ+ESNvhnWCVuWQxjGTIF0HhHB/zve6yFJTEWzGcDfiKJv
	euKM6Hi5YeNnHbi2AAykqcuqAmt8ei7xkOWcaCg6OFjOSYhX4/Ff8YK6pz++p+CEW0BykccEaP5
	4fTLXUnMEGxSzCS+uZC11jmeAioD2WK+w/fXqx6N7GABwTgfPGWNYRPaIZkLGy44dDwQ+o6y+BG
	Dv7lgvsG8Zv5zPyIEly4fVCk1go1jt6GyDPVehBg=
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a027447475mr93187275e9.0.1791021309697;
        Sat, 03 Oct 2026 02:55:09 -0700 (PDT)
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a027447475mr93187105e9.0.1791021309284;
        Sat, 03 Oct 2026 02:55:09 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a00:e580:bf11:1:2666:d874:79e6:3214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm173800425e9.7.2026.10.03.02.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:55:08 -0700 (PDT)
Date: Sat, 03 Oct 2026 11:55:06 +0200
From: Ivan Vecera <ivecera@redhat.com>
To: intel-wired-lan@osuosl.org, Petr Oros <poros@redhat.com>,
 netdev@vger.kernel.org
CC: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Henry Tieman <henry.w.tieman@intel.com>,
 Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Jesse Brandeburg <jbrandeb@kernel.org>,
 Preethi Banala <preethi.banala@intel.com>,
 Kiran Patil <kiran.patil@intel.com>, Dan Nowlin <dan.nowlin@intel.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_iwl-net_04/10=5D_ice=3A_restore_th?=
 =?US-ASCII?Q?e_default_XPS_map_after_a_netdev_TC_change?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261002130752.2597259-5-poros@redhat.com>
References: <20261002130752.2597259-1-poros@redhat.com> <20261002130752.2597259-5-poros@redhat.com>
Message-ID: <83677D09-EC66-48A1-94CA-6DE008FE1AE5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 2, 2026 3:07:46 PM GMT+02:00, Petr Oros <poros@redhat=2Ecom> wro=
te:
>ice_cfg_xps_tx_ring() programs the default XPS map only once per ring,
>guarded by ICE_TX_XPS_INIT_DONE=2E netdev_reset_tc() and
>netdev_set_num_tc() drop all XPS maps of the device, but the bit is never
>cleared, so the default map is not programmed again=2E
>
>Since commit 122045ca7704 ("ice: config netdev tc before setting queues
>number") ice_vsi_open() calls ice_vsi_cfg_netdev_tc() after the Tx
>queues have been configured, so the map is wiped right after it was
>written on every open and stays empty:
>
>  # cat /sys/class/net/enp4s0f0np0/queues/tx-*/xps_cpus
>  0000
>  0000
>  =2E=2E=2E
>
>A DCB reconfiguration ends the same way through ice_vsi_cfg_tc()=2E
>
>Clear ICE_TX_XPS_INIT_DONE in ice_vsi_cfg_netdev_tc(), which resets the
>netdev TC state, and configure the netdev TCs in ice_vsi_open() before
>the Tx queues so the default map is applied after the reset, not before
>it=2E
>
>i40e fixed the same stale bit in commit 82e0572b2302 ("i40e: Fix not
>setting default xps_cpus after reset")=2E
>
>Fixes: 122045ca7704 ("ice: config netdev tc before setting queues number"=
)
>Assisted-by: LLM
>Signed-off-by: Petr Oros <poros@redhat=2Ecom>
>---
> drivers/net/ethernet/intel/ice/ice_lib=2Ec  | 6 ++++++
> drivers/net/ethernet/intel/ice/ice_main=2Ec | 6 +++---
> 2 files changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/net/ethernet/intel/ice/ice_lib=2Ec b/drivers/net/eth=
ernet/intel/ice/ice_lib=2Ec
>index 5e183314e0d792=2E=2E416e2d6a6f1709 100644
>--- a/drivers/net/ethernet/intel/ice/ice_lib=2Ec
>+++ b/drivers/net/ethernet/intel/ice/ice_lib=2Ec
>@@ -3218,6 +3218,12 @@ void ice_vsi_cfg_netdev_tc(struct ice_vsi *vsi, u8=
 ena_tc)
> 	if (vsi->type =3D=3D ICE_VSI_CHNL)
> 		return;
>=20
>+	if (vsi->tx_rings)
>+		ice_for_each_txq(vsi, i)
>+			if (vsi->tx_rings[i])
>+				clear_bit(ICE_TX_XPS_INIT_DONE,
>+					  vsi->tx_rings[i]->xps_state);
>+
> 	if (!ena_tc) {
> 		netdev_reset_tc(netdev);
> 		return;
>diff --git a/drivers/net/ethernet/intel/ice/ice_main=2Ec b/drivers/net/et=
hernet/intel/ice/ice_main=2Ec
>index e62a8f544345a3=2E=2E8a21f87eb6ca21 100644
>--- a/drivers/net/ethernet/intel/ice/ice_main=2Ec
>+++ b/drivers/net/ethernet/intel/ice/ice_main=2Ec
>@@ -7559,6 +7559,9 @@ int ice_vsi_open(struct ice_vsi *vsi)
> 	if (err)
> 		goto err_setup_rx;
>=20
>+	if (bitmap_empty(pf->txtime_txqs, pf->max_pf_txqs))
>+		ice_vsi_cfg_netdev_tc(vsi, vsi->tc_cfg=2Eena_tc);
>+
> 	err =3D ice_vsi_cfg_lan(vsi);
> 	if (err)
> 		goto err_stop_tx;
>@@ -7569,9 +7572,6 @@ int ice_vsi_open(struct ice_vsi *vsi)
> 	if (err)
> 		goto err_stop_tx;
>=20
>-	if (bitmap_empty(pf->txtime_txqs, pf->max_pf_txqs))
>-		ice_vsi_cfg_netdev_tc(vsi, vsi->tc_cfg=2Eena_tc);
>-
> 	if (vsi->type =3D=3D ICE_VSI_PF || vsi->type =3D=3D ICE_VSI_SF) {
> 		/* Notify the stack of the actual queue counts=2E */
> 		err =3D netif_set_real_num_tx_queues(vsi->netdev, vsi->num_txq);

Reviewed-by: Ivan Vecera <ivecera@redhat=2Ecom>

