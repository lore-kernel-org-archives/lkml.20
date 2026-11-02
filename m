Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625526;
	b=ufp1zeCz1SvQOLPhihFzuZrzGdCYMO4uuoMCll8KXJLuTUZ4leHqKXMaKMrkpbWylMkA
	 v8u01144v85jgFzwiSmwunPSGUUdKtcL9a2+7HNkY28GI1NHUNisHwGgOi6AnKb3gXRPj
	 KYapKoWOHOEwlMWEaos/hbW9MBEVo19v4TxtS7h+87foijHCOLR9GL4EaaRz7UkRdCJzB
	 Vovwtq6TrEgh1SQWb0O+1LxwwZNWsBexxds8ksPaKCMzY/zJMCuhWKDcwqxjLsaYV9SvG
	 dJovrHZHvGIaIxE8l0G6fSMlXfZfUTvS/QvAqnaQmic/X/LEyomI7PdXc2E5a+Sz3dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/djIokTma7cGa0Kj/4n5LFRRxYa150VHT4D61l8dCPA=;
	b=r3ja7JitajzkCpw8BuzY4aaMYJ1mQM6szxlqIn7Xt7W3YKg1SCSiXO3jc0+zXdbdw3GL
	 9QCSO2y0rgK2tDwajEypMo7RxpgnmxvEsPVnqtLXM0P7WT56K5kg6SXvH6xMKfXHydEnI
	 Yri0xFtOdTsF8u3ZqDIkgSOrAu+2GzSinipqf9l/rOu7WmwjvgcznKAxZHiA744Fc7z0B
	 IQUhGPKy0pHh+5kRdN0Cp/oacjzERsEsW+XOFr3JfC9pVZE92xSsRnrqQF/sBPHufCzjp
	 LMad1rH5UpDNIdeBfXlBFaL1QlHtAQAs70oM1MfGMf5hb9+FFs1vVU/o0D0pNyA9cnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaNx9xWq;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDE7606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DDE7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaNx9xWq
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so24064225e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793625524; x=1794230324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/djIokTma7cGa0Kj/4n5LFRRxYa150VHT4D61l8dCPA=;
        b=QaNx9xWqvk9ifE6aYb5mY+vkxyJcq2ZFy+uOmU953b1hasAz8Mjtr2mgxkH9IFYcPS
         OvRwjZIgWU9VYZld2h9JWGIfR2vuaqEO9U9KpSiGRmD6tEib32etFg8sg0Qu1seKSsKP
         MVyLnbJYrht6XhPTK8RQQK03xXeK7ScuZqYw2wldOCeO057MRxtghXDQo6uPhMIor3bB
         6H9d9XEhQg8sAZBCQA4tQhIH1kOtQ3QxwJLNOj0VQjTl3ScfzDLYBa1saHeSQ5QHXSRu
         Adl3Dn8/MrnTm7iA74wtvHbnk/ik2es4066wWIGAWGry1Y0wYMEl1o+OwRo13CK55YZZ
         SEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625524; x=1794230324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/djIokTma7cGa0Kj/4n5LFRRxYa150VHT4D61l8dCPA=;
        b=TJAMeT3wxCJ9ETUD+uKFGoEva1jaUMfjimrlB2xxzzMp47aGZbvGLcev5O2k+gB+cs
         9LCUiXKmkOQt6boBM9bcPY+YQXNRe0l5CN/q9dUu7fHLHb3+Y2Oqp2x/UCR+0ioEL/vY
         wabBnKsq6RaJgl05v3CPfHykocvbWmWlm3I3oLnQbsOqbWTrWb7dcHVO/Gfnr5jqdvDP
         gHIo2YiIyPVphkjxgs/Kku/SkjE3EM/Uz10Nc5kKB+U8e3fCk6Ap7FoUDEMVRTNpQ8qb
         aaM1R3bp+kJgFx2Mj04C6WbvKC/E+5kr12hhTHrVyxjsS4k+ePqZ2pTNPSUipUByAqp0
         v5Tg==
X-Forwarded-Encrypted: i=1; AKwUvByHTm0hHDvOkucrVEX9QY2xRhChPcoYO+oVfxum0zySHP7YdfaTfkdj7tQ4RwMeAWwtYk0fnjApc2tRqQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL03uGWGdoo7TB06AWrs7FxcqYR2vEn+4UNesYnygS/r1xV4Rod
	g5xGPFfNmfeUzrnziPqbEfCsrXQa64nGFZvOl6Z5hbSIB85iahFX5dVi
X-Gm-Gg: AYBFou3eJEcGN9b48zFfTJd9PIWdZt7FqbAxB2KFWnQXqoVQ9vhOvgvNmjXcQZj066K
	2hlpUekKivomTSl4BFQqDI/wNqhCbXndljG+pYbbrkqd9R9U2Ddg6PfwIMsaW/PMMpX7Le7xJxu
	oCyRcVP/Gg2bzRLLzEovHf31MRbMSbYF1cYDr3TcCi6Ogt/4E2JusqS5usKscSnTI6O/kJp4qxq
	59aDMH4MU6McrNhSkAXiF9fbirHV2m1mi36LuAFQjHpqgTnRryaiRjFKVuym49RzulSxYz81HgN
	LtPPRmM+TE+PR+4y5u6roDN8Mnn675f0FqirmO5JXT6eCyBW+g4VLibAc/vkMzrOKtwFZLGefGa
	iUaBWOGP9m5QYbrt4NalaMqsJ7LueVtCm8D5yTYiARkyKuLwBFcx1OpaM3xb9pXmsP5/fmhg+o0
	1YWoTUt5UTXDG1bpTzfwkCEwPYWTKE2WrH4Gm99/CwSpDIDBhyU2PilZyiJSROZqaGzxyS1jWg1
	MGxqTaPkyGnP8lUbswHuVT1l/GXuvqp5Q08KaTfgoYgd0d+87J6XpUS2E6k++6ZuneE3gEN/DaH
	+NDF8XQ46UGvlpdIzJxhkiaSAITy4V1JaSo5bXwTLrclM7u8kJWf313GkfjdoSTGCNy8pE/vR9K
	2TtwiwN4=
X-Received: by 2002:a05:600c:4e43:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4ac180f28f7mr215180225e9.15.1793625524195;
        Mon, 02 Nov 2026 05:18:44 -0800 (PST)
Received: from pop-os.. ([51.36.40.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm336511045e9.0.2026.11.02.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:18:43 -0800 (PST)
From: Ahmad AG <ahmadag1001@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	kuba@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] net/packet: account user-triggered allocations to memcg
Date: Mon,  2 Nov 2026 16:18:36 +0300
Message-ID: <20261102131836.1074942-1-ahmadag1001@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179361314688.3131.15505744143383263524@kernel.org>
References: <20261101094847.664612-1-ahmadag1001@gmail.com> <179361314688.3131.15505744143383263524@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Does this fully close the PACKET_ADD_MEMBERSHIP bypass described in the
> commit message?

It covers the packet_mclist entries, which is what the commit message
claims, and the PACKET_MR_PROMISC numbers measure exactly that path.

The struct netdev_hw_addr entries are a separate case. They are device
state in net/core, shared and refcounted across every dev_uc_add() and
dev_mc_add() caller, and allocated with GFP_ATOMIC under
netif_addr_lock_bh(). Accounting them changes behaviour for all of
those callers, not just AF_PACKET, so I would rather keep it out of
this fix and look at it as a separate net/core patch if that is wanted.
