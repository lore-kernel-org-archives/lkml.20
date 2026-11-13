Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794589211;
	b=t1sLtMD8983Rrv9++VuABtrp/tvLy1L9sziSBVYEBJJjD9pxQ17Ve4qxTIha3fETPX5F
	 m1Yh3zPZiEmUaCv6V0QMk+UcJBZ4XFeGkbVGZgzAIimKlyxPr2X6KSIoUbvvvED25UhJM
	 Vyv5WhdNkYU2AsqrIk+CSyXO6nJHqYm+6F62HCRoM+4givuWdshzmGoR+dA9nG65LyFQA
	 sKyZ5RvT0xODnokqPsbJC473SI0Vs2l31bg545os28ODvt22qPFSVMztPbgl5Wll2a1U7
	 z9yzN0v1Ov2mpMAPXGxA6/E6dmGiFJzfvbWSkbTcOckw7JLa/rlvSvpq446GtsOCytA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UHCYxYd5XK4zwFxBPXElPTHuvK0+v9+ml9Xij7/pCH4=;
	b=nCOmdgOAcy+8J6Dc2Cw9vTEEx9wDZCveBKO374+nN3kyUc02gJjXd2vZiaTXVQpb4NAL
	 jAVikE8WHeTkHJBbuRXjG73vWDymU3+8Q4DscPBP1TJuA7a5GdN6xBoviR6OJ1GE6Eq3G
	 nUCUvJbtjlLQNiS1YBJXbnJEME/FAdOl2uHkw3yySN+7BkAFrEIeQDSBv0b3RSHRcu1tX
	 RqvXYkUoy3OwMtqe8SzTbIWTl5smxLex+QBUu07xIf9OfDvl5qRyvwQQKLcZowtbsurOm
	 VlkBhKUl2zSj0BYuHEHg0Wz66LFDq9PZ0+j3FkIYDicLiTGQ2ayzUqcxil0xSnHn4xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LchjyZso;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE6660A261A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE6660A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LchjyZso
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2ca055399so274183137.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794589209; cv=none;
        d=google.com; s=arc-20260327;
        b=cAiDsLXlwsZH4zq7IJY24IFgRvDErGYC4RtyNfo+HPSDRVls6Sytyn7ag5ar1arlOI
         hTzL4DcqVPQfwoLP42+tH2nRYkjZQsCGJRlx/2XfFgnrjXDmjhUCPJsnS6ZWoT2FdNl7
         Gd6667VnvuBa9aqt6+qHPfcYU6pVkeRhvkUd6vtCGUy12c3Qd/knlSRoBp3ox9N7LPcs
         OJWJCIXQ58bH9LSxPxLlAcZ/gOHiA/T5DFe1vcZjgckfr/d/kylEi0nHqcf53RFdwf62
         7i5Z1lfOKW40N38mAkSsxdAmHxdmJ8y3Wsx+d4Q2XGOont3D3C5oXha8Dbsg0EcW7Toa
         2lcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UHCYxYd5XK4zwFxBPXElPTHuvK0+v9+ml9Xij7/pCH4=;
        fh=LjkYRWqTCm4vn+hj6FScw33xj3mouxZDq74XRd19nmk=;
        b=FLgdiiho7x3Uo1fmtNSdFfj+6arwnWtQyZOOnCLquVPyzrcNRrCtmvk1JbnTQ5wnq8
         glBK8Xy/zAao3HFzXmzXzEAKwqgvpYhItLW8FWokR4XG7BtYvlDBl/4AFT0J0XP9I9kl
         RnjKO+ggltq9/Fxb9mcFHrzyOzXmDrzPCNHfZYIREKTrwCRrNRSArwzRXZjogAmCgjKo
         Drpzltf/BAAWb2VSaWkI5+zRU+oaFvvcpDyTSu9M0F5bXnjFOvJlHCopYUSHEn9ZVtlf
         Cd7M56vByRDrAUlTk3qTdRiGfIfXBtHH0R9PuKtsYLXuPhDR5FD9FUHTscJFJOCabVpz
         MMaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794589209; x=1795194009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UHCYxYd5XK4zwFxBPXElPTHuvK0+v9+ml9Xij7/pCH4=;
        b=LchjyZso169605P1QIIak18hEtfTovA++tCZlMIcI1c8zfYVIwPE0Q0jhr/6Uxe7Gc
         s6CpIuJsi9aNrxrKZh5k9jYCrOC/nZtJxM6KpAiJl+xyCWVMqcfImMIXo7XGzYOub2+U
         gNL/+lIUxWlS/otfV1FOL/VtpdWPITu2ji6m//8XxziaT3swyXDf0OBhd7CTTreNTRxZ
         2xk6b/U+HTBz1h7IvwZvEe8W5X8dqhS2TNlSc2FJa9AM9bGcZAl6vcC5nePg4shCWo2K
         X19dFX9+pi/kByWp0Kh2bpkTPz/OT5r4NJT60sWZeMyNEySwOtECgeh+HAssdU6ojbpF
         04HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589209; x=1795194009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHCYxYd5XK4zwFxBPXElPTHuvK0+v9+ml9Xij7/pCH4=;
        b=S2oEq0E3u/WEodut1SqBefYUMmx+7nIEZMvnyzj9FAvY8H9r1ZJJfmSaEOjGKaPYxW
         IeF2aVbM5RHAD+JBNgQr1GHVSnoM75UMwPAn1Hn7btQmf/dfzWb5oAlyYibOAJkRYIpX
         5XHjhxpgAli99azRmgW+RU2jqZt2FNQFXTRK3b+rhhZMGrfNvODa/2CynFlpzf0ucqVi
         Oq3BFTdJsg/YHLlrwORC/fFX+M5yLwUOYZ5/aGX+LD9e5G5ip9jG7tJD0A3ceg3I3AB8
         7OtGtOVQa/mZJ4l/gH0qoTJbDe7kUVOznnmHH6YD7HHop/1tbFQ0PiPqxHVd9l7nwBV8
         W+3g==
X-Forwarded-Encrypted: i=1; AL+hErFNScgRYeKyedhBSUCksZsu6wP3gCGM5nNoBTi5IkoDsJvZJ5hQGTfvK6sqfB96O9h2N51Zgv1xNjMHSD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8yZhOk1+u3h94sKRRmz4jm8pZ8GYff2cMcx/Q4op+8OzQTt6z
	pVdiC0XaB+SsHf5NFb1GpQ7tV7Pj3e1w2ty4bH77XYWSO1X4szpqcjb3BsGL0l9EMcix/Gz5PGp
	EfYne8lFtzhlqdGXOX2HLXW6EpBWsIDKWoBfUI9d9
X-Gm-Gg: AYBFou2rX7mvnA3tkPhK3NKFaHEh6vRLXiakq1hq3RLZxxLEC3WPTYXBtjcqUb+Fd8O
	HgzOKkT1vPgUS103OWr4ixXZ7qUsuhSPVM8fX4fy/+6An6Nmb4bEI3kEP1t7295PJ6FrPUyqms4
	nhp0RnbKhX8GBJ9FobAFw6B4+cpNaaX9LlH0E56tLWkGN7vz67r/cyq32WzQfjJjT+HOBkDYrbm
	YjrDQOPxllMRlCUyUSZhYepxk58NDeJvxL67y2/d7VNINb/8JFhxJ9TQd245KpQzDeP4tl0Kbo+
	KqCouAuis9ARYopyJvla+yC8Ifm9N+fyYswmDXqh6yXdQhTB0p2BaHiC6h4XfNw/SOxst/4vUkj
	dIrO8vVaW/Y+GTofKc0nbmWnd6Y2c1Ch2vxwE
X-Received: by 2002:a05:6102:6054:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d64d760b84mr707578137.14.1794589208188; Fri, 13 Nov 2026
 09:00:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112011108.1524624-1-sgzhang@google.com>
In-Reply-To: <20261112011108.1524624-1-sgzhang@google.com>
From: Brian Vazquez <brianvv@google.com>
Date: Fri, 13 Nov 2026 11:59:55 -0500
X-Gm-Features: AclHuK_36w4X0Vb1j6PMfyNVfQLXnMNvnnYRJqgmsyGgLC4L1v_Ze30b5mGksjY
Message-ID: <CAMzD94T95F96c0oq+4POQsMHfkWOWjODNK_n27Xw6BsdaGExog@mail.gmail.com>
Subject: Re: [PATCH iwl-net] idpf: preserve tcp-data-split setting across hard resets
To: Ray Zhang <sgzhang@google.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, intel-wired-lan@lists.osuosl.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	David Decotigny <decot@google.com>, Li Li <boolli@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch Ray,

Since header-split is on by default on this device, and vport_config
is allocated zeroed, what about fliping the the user_flag meaning?

  __IDPF_USER_FLAG_HSPLIT -> __IDPF_USER_FLAG_HSPLIT_DIS

If we do that then config starts with the right value on the
user_config, if it's flipped user_config is already persistent acrros
hard resets.  And then we can just delete the call
idpf_vport_set_hsplit(vport, ETHTOOL_TCP_DATA_SPLIT_ENABLED) from
idpf_vport_init and do not worry about where it should be.

On Wed, Nov 11, 2026 at 8:11=E2=80=AFPM Ray Zhang <sgzhang@google.com> wrot=
e:
>
> idpf_vport_init() runs on both initial probe and hard reset, and
> unconditionally calls idpf_vport_set_hsplit() with
> ETHTOOL_TCP_DATA_SPLIT_ENABLED. If a user disabled header split via
> 'ethtool -G <dev> tcp-data-split off', a subsequent hard reset sets
> __IDPF_USER_FLAG_HSPLIT again and silently re-enables header split.
>
> Move the default idpf_vport_set_hsplit() call to idpf_cfg_netdev(),
> which runs after idpf_vport_init() sets rxq_model and returns early on
> hard reset when IDPF_VPORT_REG_NETDEV is already set.
>
> Found by code inspection. Reproduced and verified on an Intel IPU PF
> (8086:1452) by disabling tcp-data-split via ethtool and triggering a
> function reset from a test module via idpf_idc_request_reset(): before
> this change tcp-data-split reverted to 'on' after reset, and with this
> change it stays 'off' (with rx-hsplit remaining 0).
>
> Fixes: 9b1aa3ef2328 ("idpf: add get/set for Ethtool's header split ringpa=
ram")
> Signed-off-by: Ray Zhang <sgzhang@google.com>
> ---
>  drivers/net/ethernet/intel/idpf/idpf_lib.c      | 1 +
>  drivers/net/ethernet/intel/idpf/idpf_virtchnl.c | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/intel/idpf/idpf_lib.c b/drivers/net/eth=
ernet/intel/idpf/idpf_lib.c
> index cd1b173e3b27..db6603711be4 100644
> --- a/drivers/net/ethernet/intel/idpf/idpf_lib.c
> +++ b/drivers/net/ethernet/intel/idpf/idpf_lib.c
> @@ -945,6 +945,7 @@ static int idpf_cfg_netdev(struct idpf_vport *vport)
>         netdev->vlan_features |=3D netdev->features | other_offloads;
>         netdev->hw_enc_features |=3D dflt_features | other_offloads;
>         idpf_xdp_set_features(vport);
> +       idpf_vport_set_hsplit(vport, ETHTOOL_TCP_DATA_SPLIT_ENABLED);
>
>         idpf_set_ethtool_ops(netdev);
>         netif_set_affinity_auto(netdev);
> diff --git a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c b/drivers/ne=
t/ethernet/intel/idpf/idpf_virtchnl.c
> index 928de868fa62..fc56437b01ab 100644
> --- a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
> +++ b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
> @@ -3381,8 +3381,6 @@ int idpf_vport_init(struct idpf_vport *vport, struc=
t idpf_vport_max_q *max_q)
>         memcpy(vport->rx_itr_profile, rx_itr, IDPF_DIM_PROFILE_SLOTS);
>         memcpy(vport->tx_itr_profile, tx_itr, IDPF_DIM_PROFILE_SLOTS);
>
> -       idpf_vport_set_hsplit(vport, ETHTOOL_TCP_DATA_SPLIT_ENABLED);
> -
>         idpf_vport_init_num_qs(vport, vport_msg, rsrc);
>         idpf_vport_calc_num_q_desc(vport, rsrc);
>         idpf_vport_calc_num_q_groups(rsrc);
> --
> 2.56.0.611.g1030f0b940-goog
>
