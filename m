Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793112716;
	b=BKxy1wUlMwULJKOF0ohV3wls3qJ7Y0t62Y8bShDYrkScL1rjgi57MX+1J+s44HDPpj7R
	 zQbxHfwc8hn/8tzf2dT507Mza4G63ZHlftkRxK3bbuoDnS2WFeTN0MG26XydXdWP8tbNp
	 HsyDLGJ0YQ/vJ0b+UMbbaZRUweAlC1Ii7f7ZTv8Mawgm0XcSYt1GhzWegmYlqGJgPu0NI
	 Af5Oh9rjGsfyxSQKMO8RgY9gn9b35snYF1tu+//SYshu0fCxaJ4jiasvuvwMqAZL4FbnF
	 rKe/qgxF1aOmEWlhezoQEikSPc6BwPzaPi1Y18km8ovbSUOhVKyhC1mUEarp7G0gGbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JsUBZH84qc3OTom1l1zp1cwnDHudQ8Nvi9ycgLruS7U=;
	b=ssXtQmJcNxKYGOL90xIWrPG7KtExrm+6ZC7WEdeyWCynhcE9YOcoWEHdEFmW9oLz8K7g
	 WZuZmSmhOgFdOycucOC/gO3/tZwZfLFyfiM+EDf0GMxhLGm8d5PosWcQgP621oKlwI07D
	 UmyxhubtlRl9yF5exRF90P8zggX0ePLBt0J+/wE6pHXipieO3/BYhDe0Xtwn3eAzkUkgV
	 gS0kgzPmWV8TcTuzir2uBCR/1TC17aagiNp4OlF1WrBoH7dcKsSG4aEJJsoI98PEgFc+O
	 iuQaGYVRCGvRKDfPAZsYF+Pft9ecvJYF/cZMHuGEx1yGjuwpJUrMb+vnA7n0an8HZsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Te39WAmY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D760A2625
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD6D760A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Te39WAmY
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058f74a54so1700177b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793112715; cv=none;
        d=google.com; s=arc-20260327;
        b=L7XOkZDHs8mCFzPJ/akzaxd0lN56MzG9ly7WPfXjSdpkccs2m9smuWnkPwEIXw5VX2
         UULEVRez0FjFZqDESgdpTKaQEveuOjTfRhc8j2AoXR6npC4C3BMHFUt7cT0J6c4pY4ia
         0TW3+5DO75pZpHNEJ2v/btohJ+yB2iXMHycHfRrqclviZomW24OVZtXyjtym6SsRyWSn
         BI+QH3PeAwGYcg7h18F4zTDjSzsWqTUEmA1sbnbacummgj98rqUCD7k7FiS66it6Qc5M
         SjELubI9pHvwoar5wNpZ0RGxqAf+BmCT/Eno/TvOSJja4BHFsJ07CR6YlcAfAHXaD/pm
         RdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JsUBZH84qc3OTom1l1zp1cwnDHudQ8Nvi9ycgLruS7U=;
        fh=SR2ZlyYNBPyDb4eZKJQmt8/f2B0NqxB97DMJc/pSPQY=;
        b=FZ61nyxb7dLi2432Trg3ziOoOs/O0NuYO95PrH0GgqmVEqlICl1zszrwkT3sEocAbF
         c0TRjnC9blqnmylDjtfZJ7hdrA7uL0TBzRJnUjfTyeLX8DdmZjzZoYQ5h25ZPyuKaGFT
         5kTzXVk8CUvSgNHlXgwbIUmG6Gm4UZXN0WXqyF3g0heVXqu0/mFX9fVu7VMlN5xlB0j6
         rDzYSIK58wf1lizSvSxWGfB5mnJFhNOa5nBiDU3rXQDnUZGT31e2Hw2R/xZtkwASUGqm
         AEOnRc5K5eDBr2eSD6DXk9aScUiSZFThF2WbM3R119WBC0nG+GsKGIw+DwAekuyVUZmR
         kf1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793112715; x=1793717515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JsUBZH84qc3OTom1l1zp1cwnDHudQ8Nvi9ycgLruS7U=;
        b=Te39WAmYF30d17Btsn801Hht51R6mjEgjwIp66srMOz1Qwq45/zM8y6+ICBh6SshdT
         Tv5nT8WD+8K1U8SuES0LRWbil5RWsa3/q7b2Wxq86f5nHDSvYeqtz74prXV/rtXCeJgL
         TdVg+HMO9o8xpky2lkWcG2RaDuziZ6mLAgiA+5q9cmxYoYLqXIHFe8QlkstyxTyQfYUp
         UrgEhoNCOOV7vLnHT53MC8JGFy0p7ERYkHEuTo2IZFiIYjVcbY1G+NyQXdB0VRCbXKV4
         5rDZ1P/ZlbzOwnIjFfPdw1jo4eWtm0KiYZ5oydMuk/+7iJrGVunxVnmkwnPHI8apV7yP
         9CUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112715; x=1793717515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsUBZH84qc3OTom1l1zp1cwnDHudQ8Nvi9ycgLruS7U=;
        b=L8dUdY23Tz2i46kwdfFCNlGVjb3w5Vs83YK1ueUkWWdiPV2XN+lz12WQj7mrKgRNc+
         tNrfelGOAgR7y/Vls1m5bv22g2ZKutBc3hpML2bzpYQqpyctNruQsDJR4gYBgqdNHcHn
         g1LiQKSyljEvOE/16dZnMgmTgtLCAXWoo5dxJ1+JHn99LWL7yPGDSsA89v+nXzh2yi6q
         deL2512C1ASC3jBERK+S4jnnvWXexpW2aH2gEWIRAIuSvS7mfzC40jpUOjbfPGLmEx8r
         dmPC4go51oiV5vML6V/FqaDCSKSu87HvE2i4p/xCuX7cA4LfDlmXkmAO48asWR2Pd2dg
         YbGw==
X-Forwarded-Encrypted: i=1; AKwUvBwzhBgDGlwqhvpaaEjk7SsDGVP9ciO8ZD18Tr8gqympVcDHwtGTaL8c7rlviwuh6TREGW3vP3kJ5kV8ceA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx2eu4O6rmSpRcgjHXQfMXLzH1N1A7eUQ+IqH2tDCkWPoXhk3F
	0fMbkOteYMquJ+SHu9YrYH/MVPmVkx8QUqznPXiWDOIczd5jKJCet3+hWKx5I/8afNAXgBnse27
	L3HbcFW8YhFu5J5U2McDiPmQKexo9SbwMjWqdWC3e
X-Gm-Gg: AYBFou0BBG/GZQJVhrl8a78AcK/ixBLRJxllKpFECZP1yGTRztleu73E9fA4oUk4pED
	GpjnqxYx0ig9k05rl9VppTya3xr0GEbpYrHHuX+vPwZcJqX/9HtKdYHYOaVx1FkXuuC4hVjC0dc
	Lwtak6IfEOifigzYmhaaSg6ac5IgWtu8FWf3YzlSHTVRP2+yZJaKrW3X9RIQUUIBoXs87fE1ulK
	7FCDQnxBIZDmuINcEfrpk7UaKcsndsCOYSKdVhCe5z5uFMPwqinZZe3sgc/E1Z61hRfmYjtDRP5
	rIxnkAtTlHR0Ezu+aCoaVvvoBSHVQ96sZWVKZrTHPmxUbit1FH04VNz3t/EF+e0WbRmUihzG+UH
	yKLiCU8ZpMLP+hSnGX4IjLGYgS/jdqhzDIqtipBMxwwHrpkldevNZ7+sAJ9J2gk39dp1zH5LM
X-Received: by 2002:a05:6a21:a518:b0:3e1:d997:e1c8 with SMTP id
 adf61e73a8af0-3e7bfd0ceeamr7820354637.30.1793112714335; Tue, 27 Oct 2026
 07:51:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023204706.3112215-4-hramamurthy@google.com> <179306532757.3134.16501377800126286936@kernel.org>
In-Reply-To: <179306532757.3134.16501377800126286936@kernel.org>
From: Pin-yen Lin <treapking@google.com>
Date: Tue, 27 Oct 2026 22:51:42 +0800
X-Gm-Features: AclHuK-aAAS9K6XbqeKJ_G1eib3xbVZPcm0WEWowmR7QGbK-_ZxkhSUNyi4ymwk
Message-ID: <CAHwYsiqVPz4ifYz5yUCFAStitr0H_hKNDz8mfYJxGdZJ7ET6MA@mail.gmail.com>
Subject: Re: [PATCH net v3 3/4] gve: Block invalid ring sizes when device
 options are 0
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
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] In gve_parse_device_option()
>   (drivers/net/ethernet/google/gve/gve_adminq.c:194-197), the new=E2=80=
=A6
>
> Pre-existing issues:
> - [Low] gve_parse_device_option() (gve_adminq.c:177-197) accepts
>   MODIFY_RING options with option_length 9-11, because it rejects only <=
=E2=80=A6
>
> --
>
> gve: Block invalid ring sizes when device options are 0
>
> When the MODIFY_RING device option reports a minimum RX or TX ring size
> of 0, this patch makes gve_parse_device_option() fall back to the
> driver's default minimum ring sizes. The goal is to stop ethtool -G from
> accepting ring sizes small enough to crash gve_tx_alloc_rings_dqo().
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net=
/ethernet/google/gve/gve_adminq.c
> > index 8b215fca9c1b6..2c848f0c23dc2 100644
> > --- a/drivers/net/ethernet/google/gve/gve_adminq.c
> > +++ b/drivers/net/ethernet/google/gve/gve_adminq.c
> > @@ -191,7 +191,9 @@ void gve_parse_device_option(struct gve_priv *priv,
> >               *dev_op_modify_ring =3D (void *)(option + 1);
> >
> >               /* device has not provided min ring size */
> > -             if (option_length =3D=3D GVE_DEVICE_OPTION_NO_MIN_RING_SI=
ZE)
> > +             if (option_length =3D=3D GVE_DEVICE_OPTION_NO_MIN_RING_SI=
ZE ||
> > +                 be16_to_cpu((*dev_op_modify_ring)->min_rx_ring_size) =
=3D=3D 0 ||
> > +                 be16_to_cpu((*dev_op_modify_ring)->min_tx_ring_size) =
=3D=3D 0)
> >                       priv->device_info.default_min_ring_size =3D true;
>
> [Severity: Low]
> If only one of these two fields is 0, should the other minimum from the
> device be kept?
>
> Both directions share the single default_min_ring_size flag. When it is
> set, gve_enable_supported_features() replaces both minimums:
>
> drivers/net/ethernet/google/gve/gve_adminq.c:gve_enable_supported_feature=
s() {
>     ...
>                 if (info->default_min_ring_size) {
>                         /* If device hasn't provided minimums, use defaul=
t minimums */
>                         info->min_tx_ring_size =3D GVE_DEFAULT_MIN_TX_RIN=
G_SIZE;
>                         info->min_rx_ring_size =3D GVE_DEFAULT_MIN_RX_RIN=
G_SIZE;
>                 } else {
>     ...
> }
>
> Take a device that reports min_rx_ring_size =3D 1024 and
> min_tx_ring_size =3D 0. Its RX minimum would become
> GVE_DEFAULT_MIN_RX_RING_SIZE (512), not 1024. Before this patch, the
> non-zero value was used.
>
> gve_set_desc_cnt() copies these values into priv->min_rx_desc_cnt and
> priv->min_tx_desc_cnt. Those are the only lower bounds that
> gve_validate_req_ring_size() checks:
>
> drivers/net/ethernet/google/gve/gve_ethtool.c:gve_validate_req_ring_size(=
) {
>     ...
>         if (new_tx_desc_cnt < priv->min_tx_desc_cnt ||
>             new_tx_desc_cnt > priv->max_tx_desc_cnt ||
>             new_rx_desc_cnt < priv->min_rx_desc_cnt ||
>     ...
> }
>
> Would ethtool -G rx 512 then pass validation and go to the device, even
> though it is below the minimum the device reported?
>
> A per-field fallback would use the default only for the field that is 0.
> Could that fix the zero-minimum crash and still keep the other limit from
> the device? For older devices that report both minimums as 0, as the
> commit message describes, the two approaches behave the same.

The gvnic device either reports both minimums or both as zero, so the
per-field fallback would behave the same in practice.
>
> [Severity: Low]
> This is a pre-existing issue, but can these new reads go past the end of
> the option payload when option_length is 9, 10 or 11?
>
> The length check earlier in this case rejects only lengths below
> GVE_DEVICE_OPTION_NO_MIN_RING_SIZE (8):
>
> drivers/net/ethernet/google/gve/gve_adminq.c:gve_parse_device_option() {
>     ...
>         case GVE_DEV_OPT_ID_MODIFY_RING:
>                 if (option_length < GVE_DEVICE_OPTION_NO_MIN_RING_SIZE ||
>                     req_feat_mask !=3D GVE_DEV_OPT_REQ_FEAT_MASK_MODIFY_R=
ING) {
>     ...
> }
>
> min_rx_ring_size and min_tx_ring_size sit at payload offsets 8 and 10,
> and sizeof(struct gve_device_option_modify_ring) is 12. With a length of
> 9 to 11, part of each read comes from the next option header or from
> unused descriptor space.
>
> gve_get_next_option() only checks option_length against the
> device-provided total_length. Also, total_length is never checked
> against the GVE_ADMINQ_BUFFER_SIZE allocation.
>
> If those out-of-option bytes are non-zero, the fallback does not fire
> and the bytes are used as the device minimums.
>
> The baseline gve_enable_supported_features() already read the same
> fields in this case, because default_min_ring_size stayed false. So this
> patch does not add any new reachable impact.
>
> Would checking option_length < sizeof(**dev_op_modify_ring), instead of
> comparing with =3D=3D GVE_DEVICE_OPTION_NO_MIN_RING_SIZE, close this?

This is pre-existing and not changed by this patch. The gvnic device
sends this option with a length of either 8 or 12.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261023204706.3112215-1-hramamurthy%40google.com

Regards,
Pin-yen
