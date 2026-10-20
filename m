Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465406;
	b=CsBBY0W2ERHLhx3zO30gmTCG9KyWwJatSXNJ28lLzFILPhPLUB0xgXmKy6Dizk9KbMCL
	 WObTB+V3KEFYo+q1Y3zwBVTGZj/6rv0NU7IvPsaLqWIL8P+nAOpi2G8BdUSVFscUonJ7r
	 /7TVcxwnOrsHzAwZR89F/iF/j6Ppw9OiWKzjNxNyq5MxfMtP9AIVW5LRgPXeQrBh5LZnc
	 Ke9Kiyk/GjebWcP/pvNB3SvwXCnyCgenwBeHlAam/8P0U4w89SBY8tcZ9o+rz0M6DM4oZ
	 6kJcVtQ6XCZMVDV1QtBEjeNNs/032g0EL2mKtmUwdiGHOKEMSwFwqOosOB2nKsbcN2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7iKM8EwoaojoyuTFakOaMxaMyLliXbiGe3dN6S9YDMY=;
	b=bow/35g2ejhoqhpGhvTHSRILer1Bcjyz/0fxY6MF15xvkeOieNzB0mqa7bavp8Y4Htbn
	 vwBtDhjpaKXdDOwJULnhj66HNB7py6kcGFTZgkTmEyezXV/1JGq0+E4M5Xz8ybnQEE8+G
	 pWvlpeTGG3uIIAHyALEHU0i0209KQGJaMR/S3jeKfqo+SWcMKlklDByeWoYN/xm/jsvxY
	 UWrF/9ooxTyCEr+PK+6xWQNFK8AS3JVJHgP92HyhBb9blTCZoTuboha9qovn236L+8aRI
	 Y2+RdbZfMEpqoFeU0onjEHw459yQkvE8xPXr2FSBCUogCXSu+wh5Vq2ztmkeYwg6RCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YkYiYCQN;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F70606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F70606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YkYiYCQN
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1534498a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792465406; x=1793070206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iKM8EwoaojoyuTFakOaMxaMyLliXbiGe3dN6S9YDMY=;
        b=YkYiYCQNhIREwubHqRXjpJhIVLCmen08ktmOr/IDht2Mu0NDdDzkeStxyUqonSytNf
         NOLbZ++Nt7V5JnCVSAURZdnUHuBkGppvaArpkmC5EtySpmzRNMQYd9nwO3zsPN2eK0Jt
         ToIiOPVq2Gc0VOov9KpToQPQOmOGHk8ozyaZTkW4LVu9hsMFTGKlYL2OryBvMwpSVT1O
         omtRVAVVY2VwnWo+Te45Lt3acnvdgEfnAD5cm6ap9SEu7XJWcfvQZeu+AHZEnxAziZ+r
         0Ym21wMmptonI813GOS0BSJmyeQ/v550S/JYDvcMyTMAE23nuF6R5NIHSrHTRvtxkMt0
         m8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792465406; x=1793070206;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iKM8EwoaojoyuTFakOaMxaMyLliXbiGe3dN6S9YDMY=;
        b=qA54N6x9+8V1Cr4y0aEuib0FldCbNZYUf1WfyqU3ESkttGHh6Cv3H9Ba26VvK//9Z8
         4xEShcc7W8c9VaUbNjn0Vn40uPkMiXQf9JGKMXU6i/f/k6bPFL2FRrMpLJ0VSW1dr7qk
         uSFYarvs6CJfwMhWH7QXn6EsTCElCftipEa43ntKUDq1XxexSua22hJ1UH0kiL2K+9cO
         0sgXeFBRGlsrCk5eAZDJFRc11mKUBOxeG8dXCKV5W+ky3T0dIhyYC5QRlEnh47VJW3t0
         zT8ZCZ6qnER1HiAWdDocF72EwT5T7XKiIgq32JY0wR3RS/nCMqqq1fCn1ishr5e/QXoI
         ZW8A==
X-Forwarded-Encrypted: i=1; AKwUvBzZ8jqSQ1OINaRplW6lmW/otcsdwoIpjnsT6ZTAn0sd3SVNfGalfvDTetXqMDfyCNZWO1GVSKloEliARXE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOTt3gKED0/SyxY7v0ttX1OB/4CKVlSaVN4G1GSw8TeUroyE68
	y8IHLAqFXfXhWFAjWfBvTRfLdvifFADvGy6BTVRRnR54+nxYLEg6ekBJ
X-Gm-Gg: AYBFou3SIH+KCoovAL24ZButUkBb7cz/28tI1vaIo4Ql+rHYDlxBCZe55jQt6QiAYT3
	gnN3pup4X2HV7UV0eSFFGMlXJQ8dAKExAbAHYABB4RQiKPGhRUrkQ6BGXOq4JQNOYWdiwDev0qR
	7w64/yUxWineadhepCuZEPmFtLRpIG/dd/kaqh/Kc+h8AKiW7duYAj499jZolvZy8Q+xJd+hWpU
	7WAyltprDlQVRsOw7y2HV7ZbE55TipgNa7+gJvXZR2dCDUpr7U1Jv1o56xNpWaPCPuVogIAsNhM
	8wgJO6npvkOUtnYQmhAuwVkdObnQih9ov0SIH21vkdtJR9DA4AH5gPItwWZcUntfUCMmWa691xt
	6iUMrVvy7IELbWABHYqDhbRjC7xD/87+l/RWAaHCfdSCeCdAx01OQUeODKaHyI0bNVAAnAmzAaX
	JvKYCyyZpFG75ZfBGpcO2YXztzGNW2pmhotheA6zUiyPsMfR8YXMQID30SxvAODBx/hTlQ8d2Hm
	2MLNid3rmG9lMrmzykR00+LLm79G1+l6lQTjAUbVNgFIsTaIWTqpWI3O1KrIZCc6aYK3ETfQWFu
	vXwWRLrMBT7GcHUsHf1a29hwXCM0k9p+
X-Received: by 2002:a17:90b:582f:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3acef542fa9mr8451695a91.58.1792465405825;
        Mon, 19 Oct 2026 20:03:25 -0700 (PDT)
Received: from localhost.localdomain (ip67.244-167-222.hkg.ten111.net. [222.167.244.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5d4005b1sm2215884a91.6.2026.10.19.20.03.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 20:03:25 -0700 (PDT)
From: "=?UTF-8?q?=E6=9D=A8=E5=9B=BD=E5=B8=85?=" <yangguoshuai@gmail.com>
X-Google-Original-From: =?UTF-8?q?=E6=9D=A8=E5=9B=BD=E5=B8=85?= <ygs@cgcal.com>
To: netdev-bot+sashiko@kernel.org
Cc: Guoshuai Yang <yangguoshuai@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm: esp: reset outer TCP GSO metadata on espintcp input
Date: Tue, 20 Oct 2026 11:03:18 +0800
Message-ID: <20261020030318.6471-1-ygs@cgcal.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179237120528.3135.16925112275068010433@kernel.org>
References: <20261018005218.53267-1-yangguoshuai@gmail.com> <179237120528.3135.16925112275068010433@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Guoshuai Yang <yangguoshuai@gmail.com>

On Mon, Oct 19, 2026 at 12:53:25AM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> 
> Does this reset only reach the head skb? skb_gso_reset() writes to
> skb_shinfo(skb) only, and the frag_list members seem to keep the outer
> TCP GSO state.
> 
> In the case the commit message describes, strparser chains a cloned
> spillover member onto frag_list. skb_cow_data() then replaces that member
> with skb_copy(), and skb_copy_header() copies the GSO fields over from
> the shared outer TCP shinfo:
...
> Could the GSO fields also be cleared on each skb_walk_frags() member at
> skip_cow, in both esp_input() and esp6_input()? The members should be
> private there, because skb_cow_data() copies every cloned or nonlinear
> member.

Good catch. Indeed, skb_cow_data() copies cloned frag_list members via
skb_copy() -> skb_copy_header(), which preserves the outer TCP GSO
fields on those members. If the decrypted inner packet later takes the
ip_do_fragment() frag_list fast path, each detached member still carries
stale outer GSO metadata when reaching validate_xmit_skb().

I will send a v2 that also clears the GSO state on each skb_walk_frags()
member at skip_cow in both esp_input() and esp6_input().

pw-bot: cr
