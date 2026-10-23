Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741059;
	b=3cNr2doFie0wVSO9YDe769ylj4D3eATgZDnXWDnYA85+FwkNjZP3Qq8OKOvwGIpMGKnH
	 yA9Y3vIxETWNzMiV+gEoatAU6EvuSbspbBoV4TRliBEkv4Qn8/2EhWLR+A4PInJoa+fo7
	 jxAkyQJKiklf1uK3Nklez1MyjRuA6f+AWthbP1/M+GnHFgN4IPPpZL5EiEAMmZYSjkpJh
	 XMDwdD+KtdFpCZjLfNXwRsDlEnZgksTezf4Ind9FnDce8TP3q9PhUbZiXAtZsRh3jZmh9
	 hbhTSFr1F81OrqAI/Mp8vD9XJ6mS8jWSkrQy5+NT7vRaNQuTYyrALvn+8WLux4cP+sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/W7+697pKZHE+D8ZJXXPuDp9wLNG99eVTuseb9Fgv3c=;
	b=fAWTIgAgk1nG0wMFShUpNacnWeXedEJNpxoNizUQcGRyJwulnJW3Sh3IwyFYpTvE5FOx
	 OywyE5PiYphd4EqLUFMZcG6FzzlVgj2ZGwtLwziD97NzADtlkt5tnBf72ACWHbJ9SpwRA
	 sPG0DWUgoZyvXwhKM19PpsSDkic/l8btMQQWPVpu5AopB5CMiobAjp83wK+jDB8E3trCm
	 TvQ1Myp3quTtVFkLXZwXspx29EnoRCg7IL0+jL2xH0JzZGa+hW/OmX/y/+xWm0POOtdTJ
	 Wfr/C288fdFHS/zIoK/XRUcnpgT0GpurW8SgpmhaINpHowfsvq3uPbW0s2WZyZ/rjZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p9Y1RZW2;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2314F606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2314F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p9Y1RZW2
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso203321eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741058; x=1793345858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W7+697pKZHE+D8ZJXXPuDp9wLNG99eVTuseb9Fgv3c=;
        b=p9Y1RZW2cGPzye197/Eq2buSblrNpsRFp4EnUdf6e01GpeWxyVR9D8PspwVdAwv9dF
         qSjqlo2sz1sjdBLgIvbLLNSl8FhoQjVu8ZEBFoRZady0ecVG50rJBAvR/1kKNFI6elX3
         YjreTs6Wf9dyV4AiUcGsO/b+b07U2jEbW0aRtB8B9SndhwntAswp2+STchBPQNtiUPdo
         AJgTNHtbjUPx+xcv/b+vNTHBjBKLOxw0VmNh4T/8oa5d4YVYfQZbqXISdoP9D0DeHmWX
         x2ZZU4CUCc037tUvo7ePS7WrdiuVaal0NE3YPXTH8ODnYG+4D/F8Bs02EwxcMcOVtEON
         k2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741058; x=1793345858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/W7+697pKZHE+D8ZJXXPuDp9wLNG99eVTuseb9Fgv3c=;
        b=UnGXF20gs7GXDj3i6e/3DiWWzUx3Ca60e8fm80tAh6wGTFpneeUD5AwLyL3yRfOqJM
         3JSIDRHOTovJSNziGokyxuMBGfclVHdiHVVWxGBu0NFvNE2udlKUOWlO/tWI37LuPyVo
         KpabYwalXRtsQqPLpe37r99Y9fa3tZIHfIhgs2pI8Dkf/mkhFnjZ8OpzfzMHCgyVh3h7
         LonLbqf0/XPHDH4ZjZlFtkTWP4GjMXVIn6rQPfIzvGbgxTo6AGmavWtZ1nmDtIN2pKiF
         OQFnt5iJlFqKapZrGIT6oehKPUwiaBjC4YGUw0KAhg3jrE9qilxdG7IwEKgtd6d0TUAH
         OWHQ==
X-Forwarded-Encrypted: i=1; AKwUvBycG8g/zFL3CcvARPdB9EJR0rz60xWvNw8QkW+2/6dUY/Knj7baUtIQzeXTJD9cUGRstm4K4Bu+olQvA5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ2I9UbgcKVhmfL4notOrv1RajPeP6B6BI/2dCUhoRVc65OUF/
	F5boNOB7mlROBc4rPiRWxPXgtl2zbuc6moqcJc75hhPlH+J/d4jsEn7iEpLa7Q==
X-Gm-Gg: AYBFou3dpbf3i1U0mOVdcIY1KhR1LwBBsTJnJKu77leigLYWQc+YGBUEtsjusmAFAhj
	AM/8UfkdmmcvJPncQN4Vm2iuOR+2GWbIPKSxItd0sttKO9PAs5Gxa3EGNK6jw+n2BkaCK/E87Gq
	WkOezbWqolyt7dsmZQV2i7T40o9pkHXuRubXbjXn5O3NbLh0V91tQ26XcdmpacvY1S7Pvxyltyy
	e64F2mJouTMw3X/iOy2kuyYBaxHNRGdHJrK6ertuprN0BlIMoApOiFfIBxZdsdyyz5vc0XCdACt
	5XCZ0s7xsiaXOxf4R6JNGja0uM0jox+Hp6cs5BM35/qcVx8ht1I2QnaWF5jxQVEJioQ6tRy9nVw
	dcIkwgNYQlfqOKWSkNqJ5ZO2vcmpHDttl+BriPxCqd/gP9jJTPS2X4lA4vQOdiM74+hUW/0HGMx
	fvjbW1FfT0/dc2c7W3oxhiPT2nQjW9KjUWnU66p8eRIqpTYHkVTYmC1gImzdfNPm81G7mjHhn+P
	c7YCXCd+1xfnKLdhP3BLW1qFzlyAHycHuYDs47WBY1UjsQR8bvlmNBHV9K+gMRQQtkYnddMecDE
	U1lsCz7hQWktYfY2AewhgW8UGTCqbVf2osK/KAfpEZ0cim7XERhwSdJsUf5xBF0sUMeCpdGMRLu
	Cn8TKiq2b9S8p6TWRCHIshV3J
X-Received: by 2002:a05:693c:60d7:b0:350:2a5c:56c with SMTP id 5a478bee46e88-369d97a05d6mr1926432eec.20.1792741057920;
        Fri, 23 Oct 2026 00:37:37 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5e9edsm4200927eec.9.2026.10.23.00.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:37:37 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] gtp: Require 'CAP_NET_ADMIN' when joining the gtp multicast group
Date: Fri, 23 Oct 2026 07:37:31 +0000
Message-Id: <20261023073731.2436301-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179273868210.3134.12145105670992560597@kernel.org>
References: <179273868210.3134.12145105670992560597@kernel.org>
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

On Fri, Oct 23, 2026 at 06:58:02AM +0000, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] After this patch, the multicast group and GETPDP carry the
>   same PDP-context data but are guarded by different checks.
[...]
> Could the commit message say that the multicast check is still weaker than
> the GETPDP check?

Right, it should. v2 says it: the group check is still weaker than the
one on GETPDP, as genetlink has no multicast group flag for the initial
user namespace, and this fix blocks the unprivileged users.

pw-bot: cr
