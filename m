Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003769;
	b=sLsVcaqNGm0TTNmitbtYX30wM78deJjXEfqbQqORF2Pk9XPvBUOtJvqy7oPbSt3AgDOo
	 uF8Ghxc4az4WeK8sKTUoA1GaDXyYSIYnWft/iiaAxwNsL54qqTC6kwlgEcaIZWW+X12iM
	 GOLMijbkhTJrbN5hSq05GcqUXH3LU3V2RiUDoCR3SAaP88sSN/ZjcMYd9tIb6KH7kqh1R
	 NoaavsNam9bn5mXl8GuOd+o+qgHEl2MkAZatHPrUn+MaFDBF1Y4/uAFSxHUWeryfOaIpS
	 ykJsvGiNAcPwINFXsJ52KIJ9woUk9ARuipQxhiPJTtQLSsVZCIVQCJ2It6/Dt7/ImTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=pGix9wDnfmXvLJ0u/zilNWpGlgDLRWrAE8dxSLfPGs0=;
	b=5t580HtBoP85XXIkmiG76qnf/LHKAIsorQscyJrcLmyDi9R2ekLQK6/zESiFoP0uj8y9
	 lIoswRrOUaBhhjTqm2mEuy+idY1h8ub9bTco/dAocGVG3je/MGrJxHm2oygw+6LHYXWRV
	 lCJq48b+WMpg4KInVgUpPRe6oRM5WNLo8DT4d5HOSPwxcD2l2rxE+BpBSqB84a91fVuv3
	 EEL20yGQeXmtfbmF01Y9s9mOZPSeDqcZjAw72aSBLGCyl98ESUirPqlyOnWFvVNSY+7xu
	 he44woWWlbcu62kfMkSlz/Uox7Kz24Lciu6bWhzOYsw+ovsxb8VMsTNs0rIgI/eO14g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbXhkVFO;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B147606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B147606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbXhkVFO
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so351953eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794003768; x=1794608568; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGix9wDnfmXvLJ0u/zilNWpGlgDLRWrAE8dxSLfPGs0=;
        b=bbXhkVFO2CR8FKQjf8f7WB0KuDK3v1ANl/JoPZKnZ5rpzVaeGT5RyUpjpemk6sloC5
         kP4UQDOEvPw8aS30DevMDZkRiPARoFgYxMScMN+E/NOT2UqgYfFQt+5LqyzW2sQ2DYMD
         KGLMYSerjYDhMflq3JQ1NxOcR/yt8l8Y7IZEQdLW09tCIwlFHCzfLDZXbR5GnyOi+icx
         zPLemJYwKMXIO3OfzCWC5mOBnnHwmyV1fXtD2LW1Z6W3MdrqB1FtB1m5/yVGlT+OO5Sc
         WoYNZM+Zyd+TGrMr/x9byS2a/9GEo/HHjQmR/qRzgUNQk/5cMTw1XNgbbKKbognRG7Lx
         fPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794003768; x=1794608568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pGix9wDnfmXvLJ0u/zilNWpGlgDLRWrAE8dxSLfPGs0=;
        b=nH4bN8wsWDKt+/aXd8zU5YHpIP0bvNt+fmr8FdaAWyeZAn9digIhcQWJDv+ds+u8Ew
         tpmocTIfh+mJEFjlAwPzqXWzXzClKIiXtfv2nBe0nZU0sxPdMb9/pKzF1ezZ1poQnHIK
         ntSIvS/JmyFXl7703QIsotBZ8r1wrkFIx/Dd1DOsAhNkp4zWeEChBr9unI3FDxT8sFUi
         G2nEi2WAYhw4z+YHQ/4Sd8J2hC2ihYoSNbufTud9K5drEIE3Vpi8PSbwWGZVfIuNwZma
         WTG+HHEwbmMaEk6wvee2H0Y0JpZR1fKHE7e9pIIXEnyhPQlmFTPyuSpqgO1UXqOnEEUO
         2HHw==
X-Forwarded-Encrypted: i=1; AL+hErFpM1Mnz2BTSUs3l6kMTEvvV+so+pCLc27pRM6odDoRMETdclUxuKHM+JJgSGo5shsj3XOdONsCQwNkNCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nffj5aoUONn665IPjSzsk6VZMF3RIwlPu1qH4ybLAauyL2BUj
	KS1MUzPrR9Y/CjPm/cO1qDftj8PzTGohMD8KyxCWI9K3wEsAjJkP6cDC
X-Gm-Gg: AYBFou3JNFZEoRTqlI7nE2uODExbDWDh6T5nijvwghXVB/rtAz6cHynQTgC+jO/1S3R
	kU/2SH0DVq95ysbKjwwnwwhFpi8kIucU3EATj57uETqAtnQsckxZRvlz0X4R95LPKbYRhCD2zAc
	HQJVLrTHV/8iOYckI8+V0fg/5I2XLlspPh5KB4vxeWHSmI1ZxnYI/ho37L8BdB6sguQtD5VKzjN
	qF1zfjFecU2iMBECCJVa1GJtMtpdpLFQHkJDHuuDi9ZRB9y3vF2K7zWjCF7UyjrT1TZH1KSnIXI
	gtDezlCyKPuiSbUJ0YNRvFZRLIMqe/GdccEgg4KHxwGINEOHGy9yqJpxIbMkFxfOCN+J1KIlFZF
	EZkN78uZvrHsLZjES0Y5U4bmkK32ofgP/p/yMVI+rfiRCpzfitn5s+ubKw56RTZYgi5901unCIR
	YbnE/02b7l8MozBh7V1MHtLuShWuv3mZmINrfb8P9EaqUumH4AokhKfh8xvo5VZNHOE/71lYx5i
	egh2lPfo63KtvRgqocHg0lL1PlFDfN6hW29XWN93GKcUXTJ9+iL9XYmy9mZZaE2okEBQM7DhVTZ
	kJQWB5tUpQrlA7ZEx7lPvQ==
X-Received: by 2002:a05:7300:4fa6:b0:36e:e349:f2cb with SMTP id 5a478bee46e88-36fb6a9164dmr4235055eec.19.1794003768057;
        Fri, 06 Nov 2026 14:22:48 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm12198327eec.19.2026.11.06.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:22:47 -0800 (PST)
Date: Fri, 6 Nov 2026 14:22:43 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Eric Dumazet <edumazet@kernel.org>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net-next v3 2/2] net: prevent mixing frags from different
 memory providers or bindings
Message-ID: <au5SPWdVCuso8Esq@devvm16445.scu0.facebook.com>
References: <20261104042521.3979880-1-almasrymina@google.com>
 <20261104042521.3979880-3-almasrymina@google.com>
 <auy0aaY0-g32aYi9@devvm16445.scu0.facebook.com>
 <CAHS8izNrM+iaT6OOJVoZdVp00TkNRhFe9ucCVrwaUWL0oQS7Ow@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izNrM+iaT6OOJVoZdVp00TkNRhFe9ucCVrwaUWL0oQS7Ow@mail.gmail.com>

On 11/06, Mina Almasry wrote:
> On Thu, Nov 5, 2026 at 8:59 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> > > +static inline void *skb_net_iov_provider(const struct sk_buff *skb)
> > > +{
> > > +     struct net_iov *niov;
> > > +
> >
> > [..]
> >
> > > +     if (!skb_has_net_iovs(skb) || !skb_shinfo(skb)->nr_frags)
> > > +             return NULL;
> >
> > (a few nits/questions)
> >
> > Why !skb_has_net_iovs is not enough? (and if !nr_frags is required,
> > maybe fold it into skb_has_net_iovs?)
> >
> 
> Well skb_has_net_iovs only checks skb->unreadable, which is not
> actually enough. The skb doesn't necessarily have net_iovs if it's
> unreadable, it technically could be that it has no frags, right?
> 
> Technically we should never have the edge case where
> skb->unreadable==true && skb_shinfo->nr_frags==0, but I don't think
> the code is careful about that today, and I don't know that I want to
> do a global refactor everywhere we remove frags, which skb-> flags
> need to be updated.
> 
> but you're right that it can be folded.

Not sure I'm buying that, but happy to look again if you disagree. I think
the only way to make an skb unreadable right now is to add at least
one niov frag? Don't think this is (ever?) gonna change? What does
and unreadable skb without frags even means?
