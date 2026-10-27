Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065133;
	b=BDEh7W/PKvSSt+agEMWkORPkts89kq+tAiJGS5pijhr5+Ib9eIMJK4Ncv9VAWn6n+Z+A
	 HpzVT1DG80Ij/A6IZeE89oIxMVa0uNfc77EuRfVqfWYYCoLrO2n+addMljjpKWk27YrRT
	 fYospt3ABjtqYdjXPANqi9pUvMWFbfJoaFwB7PPPZgRse18WNtKY3oCvuxjSV4Syyfzsj
	 iQLXkcCVJclRHiBYNvmaU7Zw/H0y3OLKf2+7Tp5yvR1TN3rl8t6guw7gErPZ+/TWQWOpi
	 UzkNYAVFHrmkyTmTfCoNlx2fNS5tODkCrFAVLoFMmFJXzi50n8MVrWCtyz8IkLVSwlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065133;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z5R2y4WIB6GYJwGdw7y2Iv9L7vI0mR86YCmyG3VujCs=;
	b=1B1tfW0p7NN5EoGkHJsINeNRDjGjaDyjme3xGueBqD/MjdpGjTDvAzDcTTWJg9LdjT/+
	 4NDQ1y5Ew2+rzgUEOIEQ2uXikxWiJ4UAAbKQb9i4WKobCBd2ChYkX2hZXtnEN09Ca34gg
	 BCjJaEAY5AQoXWtctlD8QXAKSU2ghBSO+UcZWntF9U+p8e5b1Oc6G+Hsxll4omQLCc4YY
	 K+hkLZUG8Di1GGjkXbOCU39r0QgOL9jTtYLkp+TTlXrfbSDgpe8je+u027eo2ZSzCeEmX
	 k1PfBeRa/lIlGkNNr1EjVCe0C+DUMZPnOKdEN0SCQIgqzEaxUH5CFyzZIsq9k3/i6/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="ZHlNrt/e";
	arc=none smtp.remote-ip=95.215.58.210
Received: from mta1.migadu.com (out-210.mta1.migadu.com [95.215.58.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B9606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692B9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZHlNrt/e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zauBrSfUPWo8ed8MLMF8MB5SQEZTdd6mcbUfIXqE0Uw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793065124; v=1; x=1793669924;
 b=ZHlNrt/eTVvTSj22xmTXSm4cJzYDnJT40bh2aIZLadxDLvZv6iFo0zzyQpGrX5AuLmdMzFX6
 Emk1xietszqBk9+qmXWhXALZpg5mbtRH/JnIStdwdprfHgRSjtd6NTbggR7FbNnYmQTP7cmlNsa
 iUiSB5r/6ep2ho+1iOvP7Hlw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 1ddee2693febae24;
	Tue, 27 Oct 2026 01:38:44 +0000
X-Mizu-Trace-ID: 1ddee2693febae24
X-Migadu-Flow: FLOW_OUT
Date: Tue, 27 Oct 2026 09:38:34 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Antoine Tenart <atenart@kernel.org>
Cc: Zhou Qiuyue <n0ps1edzz@gmail.com>, netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] ipv6: raw: fix use-after-free in
 rawv6_send_hdrinc()
Message-ID: <auAAmqXcxmC6BDrR@fedora>
References: <20261026044808.613-1-n0ps1edzz@gmail.com>
 <at7uk8gXtzNufuQF@fedora>
 <at9sKRSEJLVGj9OK@kwain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at9sKRSEJLVGj9OK@kwain>

On Mon, Oct 26, 2026 at 04:07:40PM +0100, Antoine Tenart wrote:
> On Mon, Oct 26, 2026 at 02:09:23PM +0800, Hangbin Liu wrote:
> > On Mon, Oct 26, 2026 at 12:48:08PM +0800, Zhou Qiuyue wrote:
> > > diff --git a/net/ipv6/raw.c b/net/ipv6/raw.c
> > > index b965258cf..bdea82543 100644
> > > --- a/net/ipv6/raw.c
> > > +++ b/net/ipv6/raw.c
> > > @@ -654,6 +654,9 @@ static int rawv6_send_hdrinc(struct sock *sk, struct msghdr *msg, int length,
> > >  	if (unlikely(!skb))
> > >  		return 0;
> > >  
> > > +	/* l3mdev_ip6_out() may have replaced the skb dst. */
> > > +	rt = dst_rt6_info(skb_dst(skb));
> > > +
> > >  	/* Acquire rcu_read_lock() in case we need to use rt->rt6i_idev
> > >  	 * in the error path. Since skb has been freed, the dst could
> > >  	 * have been queued for deletion.
> > 
> > Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Doesn't this change the device seen by the nf hook / used for the stats?

Should we still use the old/released rt->dst.dev after the VRF output
path replace skb->dst? vrf_ip6_out_redirect() said it allows the nf hook
use vrf device.

Thanks
Hangbin
