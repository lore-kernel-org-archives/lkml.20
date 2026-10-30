Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380880;
	b=rZUQL2hve4OBlEF7Vf7I+d0/VXp8DH8UEgZ1GwPMGMm7KpSRbE0lGWdJMJbrJDX1KfvE
	 B2ta6DnwcIMgN6pPgFj+4qKUE7wdspo1KaCwduISymrtuWtVwWBM/feLk8UQmgbfXcsB1
	 46L7R9KEecNqVH2fqni4PJQOnJCZCgfSFwBUnTN088h4tdiK2mfNRuNW/fEL7RkOaMDUw
	 d6cAa+DOYQbg3dtc+69EEJ9sMEhNQVGKRCwjtxGqlMy/QaMp4Yz9twv/5iNvaHIAZiulD
	 7iUP/qC9JUSEWOhIity8Zwd3ryt3Zeh2xO98qA3ArRV/x2gVrSc0zfaYTI/rPQQazgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VxyF/d0tbyiABUKo5yoe5ji6zMNg4n+kmjLnR2dR3BI=;
	b=DgVujjeGasY6c8HXdbSSastr5Fv2J20t71YXURCcJuJljFUrWaN0dhS+AwzC9uuaIrdn
	 0WlLhFLOxhGVe1uwnCFnFk9qvnkaNoEKhZ8fSAAeStX2TRrKbuHkMxSbdRUaB9D/z+rSZ
	 RnE0Hf5aeGXcHVyXsw+SDWQKRLjknN0BN06AO+usYNCD1q19LPRV2340w54ugjedtS459
	 OkUKPSRrLEblxwebohFA2N7nGE0IqOQiy6YnRc7UqBvXu51MmnylOkeRGG/AC6WM2wZCV
	 VcghUWGSJbht8ed5Sj0tMYX975EseZf5Yt7lOXqLYvcF/kHWki02elLzGSwFp5F7z4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxbf21FW;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ACB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32ACB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxbf21FW
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so785352e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380879; x=1793985679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VxyF/d0tbyiABUKo5yoe5ji6zMNg4n+kmjLnR2dR3BI=;
        b=bxbf21FWR2WYewpid++ZNkYFvvsreelnK1V1ZNObX9hYbbAhlD+5jvz1t1qw9izRxJ
         IHVrb+VOWJQjHqKUWA4alLUiYec5YGz4/iBEx/64gW1nMtk7HP2zO0Zn9QSXNE4dv8M4
         OsMoXyxxqRPCNV+DI/vnHfoqB7MUoqy3nfC1E1tgG1J/cwB9ArwTo23oUbziHmZKlAvt
         7Oz+8STex4eHXGUjo6f2Zz9lkDdbYPGKZ9SXnibUDM7SH5RshWyoeXmJxVmMk4aYmFh7
         smhuNbWtSoLMnnYnbPqWspN3wuC+i7pzX52eQCJxAqZB4/ZJeBpLnVa0D/3uJKwwO3ZL
         V2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380879; x=1793985679;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxyF/d0tbyiABUKo5yoe5ji6zMNg4n+kmjLnR2dR3BI=;
        b=t79Q9TEPPRNS2mbNW8n//+TCqkmL27tp+9FDzRxNVOve0MyfX+l4YlOE1zYwGY4J2Q
         0wCmh2zwGt8YEacMdxSxclDwwBD9MXzGNL96FoRysF8SusSMlZLDBjETQCgkYy83U4rj
         CYEIj0awjQoJszCh+Fk3os+R46lbb2W7utH5TaK5MWjae4jPTze8wBAZlK6FKMoz91H1
         QadSAJOBAX5GVn5qZvR5+QO03qLZ8y/WUnTFdz+674BIboxu2jpfyqMWslRJJG/W8kGN
         O0gR0PesQsUdZnN1q12jV0UN/XHLImC/d2ECR9/ERl7dPhv8B1J7FRtFGanyDWrO8mzm
         y8tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaji9a64ciaXgF3V1/DWTrd3bygZNGyxcBJcwrwRLXW7Fyk4W4C4qKc0xiMBvgKO4SSavqDP3PpjBd1i8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOJcz5GOhav47hNE9KBSGrRNLzxhySKaFQHuEshKr21luQu3zo
	7uRYQjx7EueQcHqGN8LDt+yh0e7/P2rbFmjjtmd7LYxwdWffidbakc0k
X-Gm-Gg: AYBFou1X4aIH3EyjoO3O2haYTj++l1t8tniQZI2ukA3f+vN7w9325H/UtNNtjQiIaEr
	A2yhF47BGnyQoDeabWfmxI5ZsBmB0tdWRyHGfuqO32AQLC3zgMGEIJdqFBy8XQm5q7LR5Le3x8G
	UxiaUtE7euPXbeo5iulCDlXiyjqKribBxYsM1DhW9v69dR9POwKYKm/yaqs+CYsfxjMgyR+HxxZ
	SDKv/MfPIjNQboHO6MwO+ISHIrHPjn9PcaL0yorRhRbrGI6akvAOruLGMcDJLtHNAwf2z8DCAxI
	KL5DSQ1+FzeV3sbcxFQa17GV3ayK6aZJK8ueByotlSXgALBeVtUG8KDGN4gJBYuwmOH1q8o76C8
	sFXg8hkP7JMIcrVo0vGQAuP5vSgd/yxWUvHMp3K9YkjIZzAtZyPZ/CWT8UV6nl8q99+DdB1YOPY
	jEPI0VUt1XcbEnxqudJQR/kz1ShKwioWfcSy7mTxCMqgIg4vg/KVXNHu9m9qFiylH+qWSAKWasl
	6KNRLsh0bdNyVRKdB1cgj2UDErOTvsLbFcuXnmBqUs05Nh+bZzpa2FRctX74TWyBEns3PbjoPaI
	+CppLqSaP50mhEQmSzcdZj6HQMKpYiaYjs/3KqUWYxDd5vjyjDkv1PBY4hcgBHVMxMgdBn6Mf66
	RpmYwB6C5wPNX29e8qXnAfMSOF5eSQeCbCvUG0/XpdYX6eqMmHT+CeIoOFq+7xMsdxMPN
X-Received: by 2002:a05:6122:3a03:b0:5ea:c722:b3a with SMTP id 71dfb90a1353d-5ec6871d778mr1795867e0c.7.1793380879159;
        Fri, 30 Oct 2026 10:21:19 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69803be7sm3127076e0c.0.2026.10.30.10.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:21:17 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:21:17 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jingxuan Xie <jingxuanxie@deeproute.ai>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Message-ID: <willemdebruijn.kernel.17d3748debf8b@gmail.com>
In-Reply-To: <20261030081704.251652-2-jingxuanxie@deeproute.ai>
References: <20261030081704.251652-1-jingxuanxie@deeproute.ai>
 <20261030081704.251652-2-jingxuanxie@deeproute.ai>
Subject: Re: [RFC net v2 1/2] af_packet: prepare the virtio header before
 reserving an RX frame
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jingxuan Xie wrote:
> From: jingxuanxie <jingxuanxie@deeproute.ai>
> 
> An RX virtio-header conversion can fail after packet_current_rx_frame()
> has reserved space in a TPACKET_V3 block and increased its packet count.
> Releasing the copy lock on that error path does not remove the incomplete
> record from the block.

Can you give a little more detail on the exact bug: what state does
not get reverted on error, and how problematic is this.

> Prepare the header in a local variable before reserving a frame, and copy
> it to the reserved frame only after conversion succeeds. Keep drop
> accounting, notification and copy_skb cleanup on conversion failure.
> This also keeps conversion out of the receive queue critical section.
> 
> Assisted-by: LLM
> Signed-off-by: Jingxuan Xie <jingxuanxie@deeproute.ai>
> ---
>  net/packet/af_packet.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 823e0911c910..7b3e1e27f777 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -2273,6 +2273,7 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
>  	__u32 ts_status;
>  	unsigned int slot_id = 0;
>  	int vnet_hdr_sz = 0;
> +	struct virtio_net_hdr vnet_hdr;
>  
>  	/* struct tpacket{2,3}_hdr is aligned to a multiple of TPACKET_ALIGNMENT.
>  	 * We may add members to them until current aligned size without forcing
> @@ -2375,6 +2376,14 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
>  			vnet_hdr_sz = 0;
>  		}
>  	}
> +	if (vnet_hdr_sz &&
> +	    virtio_net_hdr_from_skb(skb, &vnet_hdr, vio_le(), true, 0)) {
> +		drop_reason = SKB_DROP_REASON_PACKET_SOCK_ERROR;
> +		atomic_inc(&po->tp_drops);
> +		sk->sk_data_ready(sk);
> +		sk_skb_reason_drop(sk, copy_skb, drop_reason);
> +		goto drop_n_restore;

Probably prefer a goto drop_n_account_unlocked rather than open coding
that here.

> +	}
>  	spin_lock(&sk->sk_receive_queue.lock);
>  	h.raw = packet_current_rx_frame(po, skb,
>  					TP_STATUS_KERNEL, (macoff+snaplen));
> @@ -2388,16 +2397,9 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
>  		__set_bit(slot_id, po->rx_ring.rx_owner_map);
>  	}
>  
> -	if (vnet_hdr_sz &&
> -	    virtio_net_hdr_from_skb(skb, h.raw + macoff -
> -				    sizeof(struct virtio_net_hdr),
> -				    vio_le(), true, 0)) {
> -		if (po->tp_version <= TPACKET_V2)
> -			__clear_bit(slot_id, po->rx_ring.rx_owner_map);
> -		else
> -			prb_clear_blk_fill_status(&po->rx_ring);
> -		goto drop_n_account;
> -	}
> +	if (vnet_hdr_sz)
> +		memcpy(h.raw + macoff - sizeof(vnet_hdr), &vnet_hdr,
> +		       sizeof(vnet_hdr));
>  
>  	if (po->tp_version <= TPACKET_V2) {
>  		packet_increment_rx_head(po, &po->rx_ring);
> -- 
> 2.25.1


