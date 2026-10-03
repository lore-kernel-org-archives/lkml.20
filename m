Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E339CD0A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021245; cv=none; b=TZdK2rK7t3a9/woCNDrhcqxi5sNUH4jAxNj1bLIHDCcMj9UgYxSNnGQ68E1yRHvShK+STg3bImLUCSkGkBaKJFmQRZDWQSdguzXddqbJpByJVSKpZ3ix8Do0UkHR52rxDx3OBQFgnQIxtJhBINOOaZMagiEDbkDtni9QbJGXTyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021245; c=relaxed/simple;
	bh=PuFx0zWXcplwcO/kwwbec+csZfwCfv3PjuRMiBzgrK4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=etmWYJRcKFhroYZgIOsPhZcMKiS5PtdTxas4u80NjCCftZpH3sKJWPtWhlAYStVprPlqk2Z2jTFhBcWxjlvVmng1oJotmVMkEype7RB1dEEkheBtYk2MjelS6b/H40bCcVbhzXU4a689HQg/0ehKWPuE1y5dseWeaBTomrgy+7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aywX4vr+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HtdP3DZb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aywX4vr+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HtdP3DZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791021241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pj3fnkRnguG1XzZ2CAsEmH/UIzLjDfjSPrnu5Kpy4iA=;
	b=aywX4vr+jaPHR9wHwKFtCLHdgwxLpsZrxWyQxnbQRHpkoiFnVLBMmNWMxLmPezj7Q4CH7Z
	OvNBHUpaaAKmhjP2iV9PYgEoWK9KtpxsnAHpT7sSKof4aP2Q9G0bbp9SMO/puxbzOEhjBO
	Fo8YP+Pa0zF/4Y4o2cn/Y92OJeM2GH0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-1zNTjjnUNdSUa0dDTGU2bw-1; Sat, 03 Oct 2026 05:54:00 -0400
X-MC-Unique: 1zNTjjnUNdSUa0dDTGU2bw-1
X-Mimecast-MFC-AGG-ID: 1zNTjjnUNdSUa0dDTGU2bw_1791021239
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e6862e924so4689985e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791021239; x=1791626039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pj3fnkRnguG1XzZ2CAsEmH/UIzLjDfjSPrnu5Kpy4iA=;
        b=HtdP3DZbWeCreZmZN7fUAmzif1TTLCD2K0/R7NvgKggJcSCHrJjMylmT6ue7xwE40s
         TbnGviD9DHMNXAibM8qXYdnQxdrAY8uOBon9OCwrwCaspyiWmjFZGfIvLMV5LXk24/TD
         LlnnAz69e1QxX9IbrWZQmVsS6glGm5tJT2gEzXo+e/LwjCmgyWMniTkEkfY3VAioqeei
         8DAcnArkz9HlxbOqOrgNGpI1FDkIe66wHiOgrvU4mrqrRlMKiKrjaLH4UGcJ7lnVGQo5
         YIlqEh0LL/gIzFcuCxeVU9o3KC5Sdr296uouQEm3Y6GdOKNBELMfqTm+XHGskK9Eo6A4
         hBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021239; x=1791626039;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pj3fnkRnguG1XzZ2CAsEmH/UIzLjDfjSPrnu5Kpy4iA=;
        b=bfOrmA9F6r+plwI0lDuNgQr3aXSkCsu03gxqM5ZUgfIVtCXraQmh0x+vqx0cgu0YKD
         equBZI06ChJvB497t1CGM5wXW32989qcikGRNgjA7iS/vtTpoRHJsJ2/ujce2OV/S9CQ
         O1txoMUMsnWmoqdsnan7J+mQmljXk+6oVVt8P3dMMGUMrj93chrG7VAQfbeHXjyOSKGj
         4SgHwpvdIAhDUFJS28sK/2YYRifP4+dirZliV2EOv5D5Y9pIfk5k10ejpVM65nOzAd8A
         4KPPWX1h9Dk3ym7WO/ywmmI5XEsReSShclOcsMXzu44OCSs79onTJzWOQQRTJQ5IuIUo
         hvAw==
X-Forwarded-Encrypted: i=1; AKwUvBz3G/nMX4233njhZwjjMbPxYrtYjCoMQNIFVWBkqk0ltcH/TEYbNKvDsxyvpfFiTXOK7UtniVVz43kY+Sk=@vger.kernel.org
X-Gm-Message-State: AFuF++lNdGjFxsTjBf/XlR2XELx/qeP847KnBGz5nhZtq5qSccppThwK
	zYPAyb8K81jzOPyQAJL6mTgatuu4rwP/UzZEhYVE5AfB9zchBwKJYgssdUj+bGbF5Yptuelr9V3
	5qdvjfsB35Ts4fUnExxjPFZGPiKIq6AaATK8Fi+dbNPULgvHDT9M2m/NpsHE+s2N8MQ==
X-Gm-Gg: AYBFou1Jm49btGFssNlPfVkXmM6IZ7qoZ+ULcDofOQLrr1y2+CcOF45domK1n1SzwN3
	14/fKUvxOgTqWE9xzVWF++S/A/Zg+q2+M7zZdAH4FA+qUR92pT7yfIwws7FiY1WRCEtM8439DmA
	mcD13IOU2I+mCl4qbXy29uv+XXjhu4HCv5R++IttyjCmHoJhs+Lxn+aWIogAG089ZpL54uEFLbE
	7r/mgXyKJarT6qldn3+lH4OuG6VONPptkAaMVo7kLHiLCcf4dnSXXpgrBugiU8GerSHpqdzG68K
	0S13YI0ynUq/GddERwQ2+yZnx8rGakJ9hcuHf8PXQDATFtvttjBHdRL6CONbhdgkBmiuwcgH967
	jv5QExLfBU9V2nff7WUcqur6OUSF21Kbfd8PNjcE=
X-Received: by 2002:a05:600c:3c98:b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a168101d2dmr29368985e9.29.1791021239057;
        Sat, 03 Oct 2026 02:53:59 -0700 (PDT)
X-Received: by 2002:a05:600c:3c98:b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a168101d2dmr29368635e9.29.1791021238635;
        Sat, 03 Oct 2026 02:53:58 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a00:e580:bf11:1:2666:d874:79e6:3214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104d64sm10844602f8f.29.2026.10.03.02.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:53:57 -0700 (PDT)
Date: Sat, 03 Oct 2026 11:53:56 +0200
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_iwl-net_02/10=5D_ice=3A_fix_IRQ_fr?=
 =?US-ASCII?Q?eeing_in_ice=5Fvsi=5Freq=5Firq=5Fmsix=28=29_error_path?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261002130752.2597259-3-poros@redhat.com>
References: <20261002130752.2597259-1-poros@redhat.com> <20261002130752.2597259-3-poros@redhat.com>
Message-ID: <5E5BE0F3-4AB6-4DCB-A730-511D626B9189@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 2, 2026 3:07:44 PM GMT+02:00, Petr Oros <poros@redhat=2Ecom> wro=
te:
>The vectors are requested with the q_vector as dev_id, but the error
>path frees them with &vsi->q_vectors[vector], which is the address of
>the array slot=2E devm_free_irq() finds no matching devres entry, warns
>and leaves the IRQ requested=2E The unwind also tries to free vectors tha=
t
>the request loop skipped because they have no rings=2E
>
>Forcing request_irq to fail on the fourth vector during ndo_open gives:
>
>  ice 0000:04:00=2E2 enp4s0f2np2: MSIX request_irq failed, error: -16
>  WARNING: kernel/irq/devres=2Ec:191 at devm_free_irq+0x30/0x40
>  WARNING: kernel/irq/devres=2Ec:191 at devm_free_irq+0x30/0x40
>  WARNING: kernel/irq/devres=2Ec:191 at devm_free_irq+0x30/0x40
>
>and the three IRQs stay registered in /proc/interrupts while the
>interface is down=2E
>
>Pass the q_vector as dev_id and skip the vectors without rings, which
>the request loop never requested=2E
>
>i40e fixed the same mistake in commit 915470e1b44e ("i40e: fix IRQ
>freeing in i40e_vsi_request_irq_msix error path")=2E
>
>Fixes: cdedef59deb0 ("ice: Configure VSIs for Tx/Rx")
>Assisted-by: LLM
>Signed-off-by: Petr Oros <poros@redhat=2Ecom>
>---
> drivers/net/ethernet/intel/ice/ice_main=2Ec | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/net/ethernet/intel/ice/ice_main=2Ec b/drivers/net/et=
hernet/intel/ice/ice_main=2Ec
>index f2121e79fca993=2E=2Ed246cde36ae726 100644
>--- a/drivers/net/ethernet/intel/ice/ice_main=2Ec
>+++ b/drivers/net/ethernet/intel/ice/ice_main=2Ec
>@@ -2582,8 +2582,12 @@ static int ice_vsi_req_irq_msix(struct ice_vsi *vs=
i, char *basename)
>=20
> free_q_irqs:
> 	while (vector--) {
>-		irq_num =3D vsi->q_vectors[vector]->irq=2Evirq;
>-		devm_free_irq(dev, irq_num, &vsi->q_vectors[vector]);
>+		struct ice_q_vector *q_vector =3D vsi->q_vectors[vector];
>+
>+		if (!q_vector->tx=2Etx_ring && !q_vector->rx=2Erx_ring)
>+			continue;
>+
>+		devm_free_irq(dev, q_vector->irq=2Evirq, q_vector);
> 	}
> 	return err;
> }

Reviewed-by: Ivan Vecera <ivecera@redhat=2Ecom>

