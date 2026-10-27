Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103211;
	b=3WefEbiV5LQv3v5rYB5/FOvRPE/uKWHfbxiwfzUCE8+5MGNDoK9jZyn56BX8nb198mD5
	 0brhXb3weHVucMVdhGEaMGkczYcP7gvJ6GZjRtbSNacnCETZJNOMoc8TfFwoQ9D0QzPXI
	 q8G3799Pf5MJC4IxvHfrsRsrZ9lhZ5KcuPIcohXIT6PrgkZIcyafCR5pxbr5CeNC1rlhC
	 LzNgMaxMg3Xk+I3VzrAmTI2s+UmAa6QkgtJo8rmOjX0TlL+Zz4rgnFbWPnGChuZ5YcrdY
	 qqwAs6CxTZA3vhAqn7nKuuArGD4rMDQMhjjBAhJv0kuGCdsITN6MyT12S6j2kUiED5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103211;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bv8zVoHbSrIX7BVSNh9Ga9PU7EhbCPSf8uQb+AR6ROc=;
	b=wE1OXiMNYDq756Aa3fx01IKUARzucyrak+zHVJ6L2PvsWr3pGifhPlBHGQ+hF0lu2XVs
	 fAKMio5yzKh1U9bCfcy52E6o9cfY75pY6Rw5tzfJDTUiZ/lKXJrb2HN+2Mc8JSpfCKHFQ
	 YWGUtF1Fl1Aik3M5/FEdB6/Y+J8NCYyqEiQ0WfSEDyG2tes7CKLcabZukFSomsOFeGJQv
	 YUDHoWdh22xkRjRj/4DXfznZ/6UuJMEUD18Sez8mtMa3a4pE4uBW+Q0/G1zuY1Row4UHE
	 amNuh3CpHAEVnNVplrVT+9gqPoTvOxg8t+t+3YYkwI6Se374Z2ISCuJYWIu8JECMBWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jdtkfbrg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=b4H3Zn2N;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67160A380A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A67160A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jdtkfbrg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=b4H3Zn2N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793103209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bv8zVoHbSrIX7BVSNh9Ga9PU7EhbCPSf8uQb+AR6ROc=;
	b=JdtkfbrgCGLwl3Gty2ipvEKU9/LDKoP3Qw9jKYDCasCa0us0OBIBEePN1xStY3MHg5tztd
	u9qh8FRQIyUo4s8gt0Gmnp9bCT/gWp76ecNrBC9eRBtZ6/S2gQN2b50lO2F23SygVAF2si
	29bGuH94KYtDnQ2axKKXWDUoWFLy7kc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-Yxq7EgslMMyR5SebS_Zhug-1; Tue, 27 Oct 2026 08:13:28 -0400
X-MC-Unique: Yxq7EgslMMyR5SebS_Zhug-1
X-Mimecast-MFC-AGG-ID: Yxq7EgslMMyR5SebS_Zhug_1793103207
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso28159965e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793103207; x=1793708007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bv8zVoHbSrIX7BVSNh9Ga9PU7EhbCPSf8uQb+AR6ROc=;
        b=b4H3Zn2NqCXi1TzCWwVZtbcJLilvzGtuX5Ae7E2k3ErGVM7dOd+nMiBdMDSNFelp0C
         Wql16KwtnUVjx9H2ruY8ZlXpvxUYs0l8bl0gxQFymagtHBUCDym1JqBqWnaQiDCY3WFT
         FkNIdYM4xt7pRjVV0WXMU+jAagnw0TcyXXcagC6YcuZ7JHem48Mod9XT1XVGtr/3FtLc
         VQbqtc7WkXyjcTHf5hWQJZhEs9JuticAKj4uksVNVNpYVRFp+7Nq6AOQFxFN+XI2u17u
         S2WU0CxHDRnkRL9/vEPynUPnhwXDN+md9v3z5RTm/T3m0KtawYMK5ovBlL4H78fo5oWn
         MnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103207; x=1793708007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bv8zVoHbSrIX7BVSNh9Ga9PU7EhbCPSf8uQb+AR6ROc=;
        b=R67RmSSk3ss56mYoqn9pnUy4E8Su0cjDbMDKQlrUIup8cKWGYwE0yCln1Ji/wuVpq7
         F1rqPh0mRtz64JwUAx6hrIk6MOoCLQ837pVCWvCWyX3DIin3nYUEZRmuFoPOpZBMzFBb
         DSZhwGNlt6MbH0qsSKQeJpjPbctf4/sJvWMP/XjIpn8rMSqikScVNJCWwA372q8hyn/Y
         I3diEW3ib2Ow99n4IDAoGRm7qg9PmxXWO3XS/EGepAEyLVtRfaOSrXOo1lWm813y+b/o
         gfZjhF35pSCGTL7Mr5W5le1v4OqJ986EepcSLyvw4OYCES4ip1WmB7vd+w+Jp3NySoNG
         wUYg==
X-Forwarded-Encrypted: i=1; AKwUvBydAIW3fEEGWHTSZ59Ql+puJFX6AqRqh7g+ogOFdQUFpqYcibtajPBZEd8WhxqC6MvY3o3OO1WUxB9z0Bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoNCWv4ahqZjEql+N9Glhag2LcFE6vMYvdITo4j9VJ6688x3j4
	ZMPfwycCqFfjI//CLSTBecLKnwifJ/Zf/ya6m6JPmxl4QmSDvN0JpAA2D5ek5BsNDAKTWIV779s
	uEdwNUXml11hPFZHIwMH4b5I0OpUpUKZGUyekoTbTy883mP+izkXt/ClVoXrW/wAwig==
X-Gm-Gg: AYBFou0mz+nA9GFrQ0Eaj8iTcJ5zvhpFhrvtNDMDaUuECnVqmflplKuTYjAqdwg1daL
	LH6e8Rz29rDK+mTVwnXezlATNLYhQvzWMnIg1/eMZ7aQsRvjTHxPfVwxJ5irPB+NaeVDBbkRqPf
	KSB3gCUKHaiu3jkseKoCwQXDHFz8Ji4WEYf8UigNMYuqXOrfU9GOCj4ThnTFEy9pNyMkmqi4Ij6
	r6Hppv2fgjD0mCbeKZTU/tv/gKS6E1Jq3T3C3MLjkuJpWYyQvpVWwGYa4PWUhV7LFcCs/JjDkl7
	SbSTDUkCpFyeNLhHYvAux2HGg20QTil90v/XAf8KiQrDPfWlMIuuvp/XT9ihZw9o0OgkmP6YuBu
	aPypIJDmDyL43TeY5hyLet7OxoTsKknDSL9pTWlqKpKLtLoe6wVZpN0LjCVnWZNK0wEGibPUYpA
	==
X-Received: by 2002:a05:600c:3b93:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4a35acb0791mr198799825e9.28.1793103207049;
        Tue, 27 Oct 2026 05:13:27 -0700 (PDT)
X-Received: by 2002:a05:600c:3b93:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4a35acb0791mr198799275e9.28.1793103206632;
        Tue, 27 Oct 2026 05:13:26 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm324835885e9.7.2026.10.27.05.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:13:25 -0700 (PDT)
Message-ID: <8c000566-a792-4777-8148-6da137537f7c@redhat.com>
Date: Tue, 27 Oct 2026 13:13:24 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] gtp: Require 'CAP_NET_ADMIN' when joining the gtp
 multicast group
To: Anil Kaushik <anilkaushikwireless@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Harald Welte <laforge@gnumonks.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023073738.2436362-1-anilkaushikwireless@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261023073738.2436362-1-anilkaushikwireless@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 09:37, Anil Kaushik wrote:
> The gtp generic netlink family sends notifications on its "gtp"
> multicast group when a PDP context is added or deleted, and for GTP-U
> echo responses. They carry the same attributes as a GETPDP reply: the
> MS and peer addresses, and the TEIDs, or the TID and the flow label.
> 
> GETPDP requires CAP_NET_ADMIN, but generic netlink lets any user join a
> multicast group by default, so an unprivileged user in the network
> namespace of the gtp device can read all of this. Found by code
> inspection.
> 
> Fix by marking the group with GENL_MCAST_CAP_NET_ADMIN, like the psample
> "packets" group. Only users with CAP_NET_ADMIN in the user namespace
> owning the network namespace can then join it.
> 
> This is still weaker than the check on GETPDP, which needs
> CAP_NET_ADMIN in the initial user namespace: in a network namespace
> owned by another user namespace, its root can join the group, but not
> use GETPDP. Genetlink has no multicast group flag for the initial user
> namespace, and ioam6 pairs its ops and its group the same way. This fix
> blocks the unprivileged users.
> 
> Tested by joining the group as root, as root without CAP_NET_ADMIN, and
> as an unprivileged user:
Please additionally update Documentation/netlink/specs/gtp.yaml accordingly.

/P

