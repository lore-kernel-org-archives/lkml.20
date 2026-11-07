Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794021235;
	b=OtLKNVOcqskKU/fWEbBEzrfwmn3gkf1N/1W5QSd52BNJuyNJyI3DiGja1fp/fKw8qA6d
	 WEry7UNObmo0t10cKuB9bM5mDQGbxlcmgM6mFvBrQzfQgls9++ZeUV+S1ekwZ4h+C4sCJ
	 HBldsQYLXiTQ9UXEp0v9/C/Tvu7a36jsWd6MwXvYq7jnHot2HQ/eqKhytZEVGtvFlL9D/
	 KeLf1KorH0DJN1pJNuO4ZRYGTN5k2vC6xVlsAXd0D5vGi6Ywth3J0rWJj1tYHcHQ85pAD
	 URmYy0+I92Ss8SMQCkPJqOioHMxVHhGF8sIxbON5Mzkoru0+f7svkkKe7cvEd5c3ASQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794021235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oRpf6L6W1qrmOGUB2ywqgKb8dbORXdYECHA3ikhVQCU=;
	b=rT2VntpNUNovxDMKHrne4uURVB4W4z6FXFRLUAeS2xCiSj+KdzkzFmIfiOJ9WugNNnUe
	 Ox7IJXnARWACJ82LIYIwk+rNOiSSWehvtTdD/FcqLdGign4JN3trrmF6vMFWhPS2Q66o1
	 7A+Wlh0m44+9tXsPyOGsEWpII9Ud60lHMr5dd3R6hhlO87rLgbudA/MdGZUjz49SlDvp7
	 0fKnf7r4WCMRZld1Klfsuyw4x/yvsCDiXBSh5tHzB4ji/L0z1y8a3vIV5mbXc+G3BFxDj
	 zrGQ3sa9+alyvrFFMlWsFB7jFbFMPAKgaDb7PdUcx6qrPTi7Xd9CjRPt1Ou+WtbXu5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="K5/xSYU2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5CE606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A5CE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K5/xSYU2
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40e30c26a4so38573366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794021234; cv=none;
        d=google.com; s=arc-20260327;
        b=bU5XuSM2/ZKOKPiPb03b3Q869NdGpDi1YzKqbUHuiOIfV9ZFBRm88mgHEBnAslQFHT
         +TVypR63RuuH/Zgdz+KSg/JmPhopcjCRnFDlWTKekXWcXhh4krAY8pbHsu4WgAJHsiTk
         u0bPiwXtWh4wrmXLzYRZCG3g/MiB/KyS3vNdqPdhrEvAB/AMA4A2h5miYR9GyD3Frvlp
         bADrn4YEaINGi3jNRkZJz90qQ7/EMWjtSn8t+6lvZJeherR/iexKl2HUGifM2a7Phuvm
         asn6DB4b0GJJI6t8MYYfbsqa+1+86INiintxxTyTU5tQWk2mIdAHhG4ij9NIPA+rbcaZ
         FQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oRpf6L6W1qrmOGUB2ywqgKb8dbORXdYECHA3ikhVQCU=;
        fh=P4HQxDV1onsq7uwhCCSwvOtskbJYY2X7CdksYmc8rVg=;
        b=eStUTnmdMst9WAUgcSsWx8+GTW/bhUKGemSJNb9PcvBzEoz+tseCtNlziFPrpTp0D8
         dYLb87viIKUg4UU6oB2XSI7zKLV0s7vF9WFDLGaUkTx8qd3h2cJIOBigPnkgFLXt+15d
         q6PFeqmHEpDu7EzkXAa5JsuQWjTph4wkmAcIeUVj8dPtnOADiQmbG0end17Pb8oSViFM
         5PSNoPv6cQJpSy37cN4AKDE4tx+xNS25V+YWaRC6nFLy/dJdaxm0JSoSgiEZ7wuGxLUv
         J3ZyTzBsP9PRT+zncdh+8+vGe5h4h35d2TeQyEIY89/Kl66lY4kJtbuJQ11yt/ogfOce
         /p8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794021234; x=1794626034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRpf6L6W1qrmOGUB2ywqgKb8dbORXdYECHA3ikhVQCU=;
        b=K5/xSYU2sTp+9F3Ssc9dMvDglneH6jUV7uspfeiii9TYyO072Qw+6C37+H2BuqkWhv
         4rseU2AYAVe4zjHmf0l6pCh7AK5v/CIYQC/ejfCs4DvYqK+kQOJqajhjMCEatzHYNUvQ
         gfRiiZd87mSWTSTX3Xc/Q/VNX+3fTAXEM54dMFBptzvI+h/iN+vLCb/DZOm7Sb5iV45p
         2r1wL6zEAzXVmcSmcQ3RIuZcM/htexTLwdbXmAfWmJ+b6mrIuA8sA3+ogMk7BMgA55G3
         +V3fAM9PBOvMP6b964JFduPMQPJVNzLOmEBClMyhd1REGDF4dW8Ov33ous0HAIWn63Uu
         TPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794021234; x=1794626034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRpf6L6W1qrmOGUB2ywqgKb8dbORXdYECHA3ikhVQCU=;
        b=bDMO/QNrzEKImE8tPfUZJ302mikU1b92L2AsKSfLg9SdhZ+hS1OotOHcF97YflfiEj
         KsBcWEqr4T3eWd+Zt+LbFrlctfWnwIdcorBHxDVqsKxxYrgOGaT7hL7tMHyMAmfptB2d
         w3DO5U8+sq4EF9qq0bFxaREUP1eYU2H7phME2HqRanccI/d+R9ODASohY6G+outlfaXG
         vBKmlr/lyo8uTOPBTZBna8Wb7hl843SkpnTR/oUleSlaBIDv3Dx3WdbyxIWVfvDnwzvO
         mIezCziDvrDyFLOfe84CEhmlIya/f1cv4M40ry8qs/WvtW2UEKDEw/IVQokzbIlbWi0P
         4TmA==
X-Forwarded-Encrypted: i=1; AL+hErGAs+i9jfYXf+DcEcxqmxmWJ2jlXiaMBc0i83BkbgOJwb1Ks6ozaRNNJy05J64ITKZK1We7CxUAIBf4S5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pFMJwVMJwx+9Rw3BaDo/Bor7t173Xe0FS5gBFxo06mjCijzYq
	0xVVKhN3Oeq1OULsc1p1SpxLWmQIxcoSeBDQqg31WZoR8iSXQA8FKp5+/TCMbyHhWYfVRxt35wb
	tsTPqMVCzXzIWq11ygc0ROQE0B1OljpHl8Vz14lK2
X-Gm-Gg: AYBFou3rOi/5NJl13k/bWE+WRq2wg0SY2NB4Iav5lgJqjWKvw+cyfyeOmZcB9JENPDP
	ES0xFl96WuhI1e95pc2W4Ml3m10I/kefuksh5gnrTrQAmc64nUqG34Snr1OT0bLZ4ZKYmnJfmph
	wpdsQQlbvLmS2/CQ0OuKOrk4JCVp6kZtTc23uZ+mkCyqKmTqCUFBVBoAOg2rsEspcfd2H6Cuexj
	dCZOIE1Jaj/Bi0E22p+L76NH1tipDBUhFSGY/+CLdpyu6sqFUft7q1/Q+uFiho3QScbbW2jQLx0
	AvAYf9YhPF75/ZBrj78h5VSu1puVeXDltvQyv85V3MYl1J3At5QbVd3DpfYguRm1zsezGqw5UXl
	Z8WA1CNLE65mXe708MhWuX2BXniRvbWcUUHvVgZr1Ky+U//5uBxBn3Vp07fraSq5CGyM=
X-Received: by 2002:a17:907:d22:b0:c3f:2:6faa with SMTP id a640c23a62f3a-c4d523bb4f1mr41862966b.1.1794021233358;
 Fri, 06 Nov 2026 19:13:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106114551.212675-1-amaan.cheval@gmail.com> <20261106114551.212675-2-amaan.cheval@gmail.com>
In-Reply-To: <20261106114551.212675-2-amaan.cheval@gmail.com>
From: Joshua Washington <joshwash@google.com>
Date: Fri, 6 Nov 2026 19:13:41 -0800
X-Gm-Features: AclHuK9hqj7STkrMrTFdH3gqq3iNgCshZou6dOEEbH9VmQvXrAu4YpDfrgJPse8
Message-ID: <CALuQH+VtASWP=w9ibTJ7ioYxWrS5sgi9yCZMVK0D831_A-zusw@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] gve: block XDP on the DQO-QPL queue format
To: Amaan Cheval <amaan.cheval@gmail.com>
Cc: netdev@vger.kernel.org, hramamurthy@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	bcf@google.com, jordanrhee@google.com, przemyslaw.kitszel@intel.com, 
	maciej.fijalkowski@intel.com, pkaligineedi@google.com, maolson@google.com, 
	csully@google.com, willemb@google.com, yangchun@google.com, npl@google.com, 
	awogbemila@google.com, shailend@google.com, nktgrg@google.com, 
	maxyuan@google.com, bpf@vger.kernel.org, john.fastabend@gmail.com, 
	hawk@kernel.org, sdf@fomichev.me, daniel@iogearbox.net, ast@kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 3:46=E2=80=AFAM Amaan Cheval <amaan.cheval@gmail.com=
> wrote:
>
> Commit d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ
> RDA") enabled XDP on DQO-RDA by dropping the queue_format check from
> verify_xdp_configuration(), which until then refused every format but
> GQI-QPL. Nothing replaced it for DQO-QPL: gve_set_netdev_xdp_features()
> advertises no XDP features there and gve_xdp_xmit() rejects it, but the
> core only checks that ndo_bpf exists, so a native XDP program, and an
> AF_XDP socket on top of it, can still be attached on DQO-QPL.
>
> The DQO-QPL RX path was never written for that. Its page accounting
> assumes the driver keeps a reference of its own across every handoff:
> gve_xdp_done_dqo() passes the buffer to xdp_do_redirect() and then
> recycles it with gve_reuse_buffer(), so a redirect target that releases
> the buffer synchronously, such as an AF_XDP socket in copy mode, can
> drop the page's last reference when pagecnt_bias runs out. The page is
> then freed while it is still DMA-mapped and registered in the QPL, and
> the driver posts it back to the device.
>
> Refuse XDP program setup on DQO-QPL in gve_verify_xdp_configuration(),
> matching the features the driver advertises. A zero-copy XSK pool bind
> is already refused by the core for the same reason, and a copy-mode
> bind never reaches the driver and is harmless without a program.
>
> Fixes: d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ RDA=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Amaan Cheval <amaan.cheval@gmail.com>
> ---
>  drivers/net/ethernet/google/gve/gve_main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/eth=
ernet/google/gve/gve_main.c
> index 2437cd8ba633..4e9e692a0ed0 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -1723,6 +1723,12 @@ static int gve_verify_xdp_configuration(struct net=
_device *dev,
>         struct gve_priv *priv =3D netdev_priv(dev);
>         u16 max_xdp_mtu;
>
> +       if (priv->queue_format =3D=3D GVE_DQO_QPL_FORMAT) {

Thanks for implementing this!

Minor suggestion: Can we check based on dev->xdp_features
(NETDEV_XDP_ACT_BASIC) instead?

> +               NL_SET_ERR_MSG_MOD(extack,
> +                                  "XDP is not supported in DQO QPL queue=
 format.");
> +               return -EOPNOTSUPP;
> +       }
> +
>         if (dev->features & NETIF_F_GRO_HW) {
>                 NL_SET_ERR_MSG_MOD(extack,
>                                    "XDP is not supported when HW-GRO is o=
n.");
> --
> 2.47.3
>
