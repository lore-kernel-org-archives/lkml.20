Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E963FA5D0
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021380; cv=none; b=enXDAxa6HJ3bFaJF+k3/IgKP1+y9FYtycHXsgDgmbGyd6PQdYzUk2HQhd/vtXdugz+5nZivVyFkhxUy7+Gehnv/bjDFvIX/fSM1V/h/zU4tmtzYRwjgwCO6EM3UrIjGQK76b9cJE1IGglq5x/S2+iFLuBevoZqQ3tBNapU4fK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021380; c=relaxed/simple;
	bh=yoxZ8bT/2tnoW+aoZPk3W+kJx2jfdtxBJMrb8XM8I9A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=GEHG8UyGfVkGM4PhBatqvGx8eeMe6iuxKse27XE92uDHqC+/gWB0RS+MFWunihaR2d4eeqmunYedxzU2qFHO+yzy8qq1Vvi+MWPKRQjl2ahgXRhxbQ254grX8cKLXLA/0cA4ISq2n3C/mxl2tJVBDVi6fEthDRBYVsD4Jiz9Zt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ooi0/ZCi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yfl8fz3r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ooi0/ZCi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yfl8fz3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791021378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i118fgept/V5HNHIJAC4nRHOFN2iHEPIInJ6/LxCKAc=;
	b=Ooi0/ZCiFC2wP2moyqmETTm+CALGbv/CPhFEwL9qGhAlwgSyRwdXCVqBX25rl5bwdbuUeX
	EVcv25syOKTn28C13lE8aH+kTpZyHIxIVaPzd8TVLGJfDt92AEsDaK+mKs2N6Gh9XXny9/
	ejibjwFp3PaeVB7/TmljiZW1KfFdtt8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-U6uS1BreOJeRTN07gBlsfw-1; Sat, 03 Oct 2026 05:56:16 -0400
X-MC-Unique: U6uS1BreOJeRTN07gBlsfw-1
X-Mimecast-MFC-AGG-ID: U6uS1BreOJeRTN07gBlsfw_1791021376
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49fcc575709so4566015e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791021376; x=1791626176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i118fgept/V5HNHIJAC4nRHOFN2iHEPIInJ6/LxCKAc=;
        b=Yfl8fz3rAreF7c+1ltgHTRz5XKmdvuNVMpBLRl3eld+vG831+ZJR1p8+RchwLo5WvA
         cO4349w6TXrGQQ5NN68ElD8VB16O05noOx3oWLYrHJiLFVefach+QE3VN7/jNcqQwcGD
         JB24Jx2a4RXrneXVMRpEs+v7PsCv+h4SpjoHoOgEV31iEVWbcNtTy+sil3aGQe2MyMyZ
         JNtkBl8zBQWHaEN4Swvp8hYrDSvKDoqwE9N4fRZYEXv5bOXzXcnVa3xJ6fxnN9D6FiVI
         WCJpg1ulrpiXgH1Wgi0jjxZAkX503yQlegJJ+uMIdz0htf36q4z61kkivlIfmZ/rcgAG
         /slA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021376; x=1791626176;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i118fgept/V5HNHIJAC4nRHOFN2iHEPIInJ6/LxCKAc=;
        b=Tr5pL4zFXY6h4MEIuXN5SWYwmVpDKGMmrRhO8vHgQAqkeuGmigAs+phulFUzRALk3H
         hTXKDsRPdP/FxP9HxX17JwTdDP4nGCtnwq2t21hseUC64uSVo15XWtYYAzhB4C1wG/cA
         Ap5EY0JZgQeeswj0LLBFZrUNIBYqGMgfJ8Lra5OJXx7AhofPEhX5GQnlppCw7n6rjQEI
         nxehVFNjCrwY0jRroaImELmYDtXfrPeQ76clLbIIEcc47CDNWNUIz4GWTQ4c2lAMTe3G
         4y1Y2pgc4wutv83cdQGfuZYvqtm6lNB48a26IC8Yjvfq3VFhIVn/r1D8y2oMDGoE4c42
         tSkA==
X-Forwarded-Encrypted: i=1; AKwUvByrojho/evqukG35IIoq4Y7LJRLKdmQWunO3jxi3fJGgLGp6n0leFi4vuBmHRhZQ90LH1NVxUzoj4Lvz9A=@vger.kernel.org
X-Gm-Message-State: AFuF++nNgg77cjYiLR7FsTRKRDHPbZ+7634U1qpTPIF+e2T3Ap1MRXKY
	ctqZOSbGgf1EE6PDJS13GDd+plwicJXtg1Z4MxyGQtSLHn+pOsLebHDpIuW92XrkU4f2x8q/D5h
	bqWXu9+ryy1z2jTqljsJBli9uzFdHRBFGZjQi5yWSjpaviuaaRQmO/uB8vAHsDGzmAw==
X-Gm-Gg: AYBFou3N8kbElMpobvZjYjj4Fmk0qt23n7ncM2CNn6kFBwyWX2A3u+L39ZhEOBWEbHE
	diwIVzLWs9+OEYJeEvpeIRa//XRbFm0t8eseF20TdKGYy74lKze8+wwt4lfX09FyAjojDWQQGeU
	VqNurn2lmwA8Qzy2PjdHWQP1sh16tA6PbZAkDreW3IKaSBfc6vH4ctmOelMGxQKypaC8ovS1KQv
	PjYlWTbNZ/L5BwIUqSE76OXGx6h5e0Cl50eMG3IWErXdMPaSBvfsO5KCx5cvkctMx4av1DaHyLa
	uyvwpEMBdFFZmffiiK1zJBOFFxkdECpZuir8xdojT3jy+9c/BCKfD0xnknZD3TJMyPKlhZSFNJa
	py1vyrhsYdwO6B54UqJgdeybx4GRkj9D8nXkU6VM=
X-Received: by 2002:a05:600c:b90:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1680b5402mr30628065e9.2.1791021375687;
        Sat, 03 Oct 2026 02:56:15 -0700 (PDT)
X-Received: by 2002:a05:600c:b90:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1680b5402mr30627735e9.2.1791021375223;
        Sat, 03 Oct 2026 02:56:15 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a00:e580:bf11:1:2666:d874:79e6:3214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm121786205e9.2.2026.10.03.02.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:56:14 -0700 (PDT)
Date: Sat, 03 Oct 2026 11:56:12 +0200
From: Ivan Vecera <ivecera@redhat.com>
To: Petr Oros <poros@redhat.com>, netdev@vger.kernel.org
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_iwl-net_09/10=5D_ice=3A_program_multica?=
 =?US-ASCII?Q?st_magic_wake_before_tearing_down_the_main_VSI?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261002130752.2597259-10-poros@redhat.com>
References: <20261002130752.2597259-1-poros@redhat.com> <20261002130752.2597259-10-poros@redhat.com>
Message-ID: <5BEDFB6E-4B19-47EA-9CB8-893CCF103D49@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 2, 2026 3:07:51 PM GMT+02:00, Petr Oros <poros@redhat=2Ecom> wro=
te:
>Since commit 5b246e533d01 ("ice: split probe into smaller functions")
>ice_remove() calls ice_setup_mc_magic_wake() after ice_deinit(), which
>frees pf->vsi=2E ice_get_main_vsi() then returns NULL and the function
>returns before it sends the Manage MAC Write command, so multicast magic
>packet wake and keeping a locally administered address across the PF
>reset are never set up on shutdown with WoL enabled=2E
>
>Program it before the netdev and the VSIs are torn down, as it was done
>before that commit, so the current netdev address is used again=2E
>
>i40e had a similar problem, where the multicast magic wake setup ran
>after the admin queue had already been shut down, and fixed it in
>commit e661414c98df ("i40e: Remove duplicated prepare call in
>i40e_shutdown")=2E
>
>Fixes: 5b246e533d01 ("ice: split probe into smaller functions")
>Assisted-by: LLM
>Signed-off-by: Petr Oros <poros@redhat=2Ecom>
>---
> drivers/net/ethernet/intel/ice/ice_main=2Ec | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/net/ethernet/intel/ice/ice_main=2Ec b/drivers/net/et=
hernet/intel/ice/ice_main=2Ec
>index ceb9fec2af21e7=2E=2Ea885b3e0baaa5d 100644
>--- a/drivers/net/ethernet/intel/ice/ice_main=2Ec
>+++ b/drivers/net/ethernet/intel/ice/ice_main=2Ec
>@@ -5456,6 +5456,8 @@ static void ice_remove(struct pci_dev *pdev)
> 	if (!ice_is_safe_mode(pf))
> 		ice_remove_arfs(pf);
>=20
>+	ice_setup_mc_magic_wake(pf);
>+
> 	devl_lock(priv_to_devlink(pf));
> 	ice_dealloc_all_dynamic_ports(pf);
> 	ice_deinit_devlink(pf);
>@@ -5466,7 +5468,6 @@ static void ice_remove(struct pci_dev *pdev)
> 	ice_deinit(pf);
> 	ice_vsi_release_all(pf);
>=20
>-	ice_setup_mc_magic_wake(pf);
> 	ice_set_wake(pf);
>=20
> 	ice_adapter_put(pdev);

Reviewed-by: Ivan Vecera <ivecera@redhat=2Ecom>

