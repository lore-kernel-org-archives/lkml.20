Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3C045038
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792281879; cv=none; b=YSHaAV9zLQ+SJRNyXQijlfXVleSA/OvWDgF/+z4erfu7zl4+sGxFy+miyqhjZyUlshN+jkSXfdhHPPz8y63oEQj8OEkglVuACbULakl+sdQgkeb0vAQq4XvJx6+XlcqwKNzp9H8Vvbkor6WpSauzVoNudJh5a0n5uokgu0iOwbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792281879; c=relaxed/simple;
	bh=CRQqrOceBO7jj8qsVMNU69Rgv5g+O9xd6prK5pGo2OU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgtRi0APDT0ooXDw6xsgiV9s+vO67Vb4wtYS48eNN9p2Z4/WUHgik4gydiodAiFx5tAw6gc5bJhuLWWi/Xqv/UxeKo9luzxwU+Qa211GVMv4mTxSOBs+zAIlgc8b87BwkRpsYEFmyFK+Cq4QwYltPBgCU4T/Y9Vk4jWLTh3K9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=wrS99lpF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="wrS99lpF"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso149294866b.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792281877; x=1792886677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRQqrOceBO7jj8qsVMNU69Rgv5g+O9xd6prK5pGo2OU=;
        b=wrS99lpFGWtZLKGWR0lQJ1G4dWf0F8rdvLmplwnrl7eZuJj9y+AAVPy61YLO4vSFko
         ygpRejT+eE5ojuzBoDX+28F6eP5HfClpRry2yUs/T4E5yuE9yIueVhWWuPU2CUjakexC
         3jj/AmhjLpgdirLaovAR5yC7REB2yQamlkStMvNe8Lenkw0iSrNr88TqvTWyVshTIMT4
         KlnTQXDnjRgDcPj2gyznwdozndDfPd12mBb2uHrs0jc9yvr8Te4NcCt3BRSAWeXqyCff
         quM2G7ZepjIb0f8un5GcBM1ep6MkPCx9V2Rk30BGW5FTRQI6/5Uq2QB70eMe6ZDKCiLJ
         0F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792281877; x=1792886677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRQqrOceBO7jj8qsVMNU69Rgv5g+O9xd6prK5pGo2OU=;
        b=TlXYDbhe5DTot9AjSlm2R3XIGfH6MtrOnusQBGMeaUkuI650F97J8xEw0PhU2eysld
         lL6QFzJX7t1tdCxhvYSv/VpfRlcCn5BYN8xNCDeNBr3/IXfaaBZB6/5ancDOSUE1IOun
         jTRdLYfsWAVIYS2NqGIWfcY6ubcu4U5MFLiirDsLO5SwE5yPe5STswbd1ZylN+Cualfx
         OmcfSO6FLqJUn2zQF21+Pjh6V9COJ9Z8k/0fAsIWnctmxvGISxN8FAPG/Wocy0zN5mK/
         FIw0EzuWNxXCUGlj3lJ3q9vYwuc1rxVqD0vLZMuwau2YJjwTeOZ84OyJjQ1stW+IJOsh
         1BfQ==
X-Forwarded-Encrypted: i=1; AKwUvByyCwQq8wr3fBhyVP7a1+t1k8h8xc1Buf1T43QvV/flkiShjFuepXKfL5CHzxkiLgilGUzWk2XUk4GHBEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoDYwp4LSCmXt3JYQ375Ka6MJEpXIMf+8pRczsIl2h/lk3e+tz
	EKBqr3x3O/tUpw9T2lyGAYmXRAfc2bTwfCploUOQkVhOBKPlUjLRbnFGmh2X9NfweA==
X-Gm-Gg: AYBFou3y9dGnHEXi9GOASvD7T8kzP3Wp4IshANFRYgaXpqGb3NKlL76dC9r6HsdoXFi
	kLj9GSLNaVO30ypckumQOidiZBGrMVgyB4eqW81slQF9gDiafQeQ4utSHsn4cQpyG5AkeNsIKX1
	dw7OAQ5vurFGzinzWpmdrtJk2Ne3LTlKwGwjcYRwGcjRRdzVJvmXiJy2/8HAfecfBYB7VJbbWkA
	Q5OR9OnDY1HHt8PnOFILLRIy8Q6x6QOnFXLJIKYbFaXsj40XBPY2Bf9E/sdox8lKL8vYY7q0Ejf
	HFSjRhuKHkrZjtqJNh9jDs2+kW2ALZEzxlcHgl8D0xqSZB9oZq75Lt5ScMSnZHnGekGVjpAnB29
	E36TzNxQVNO4JgwLksAz4L00XBpVE1BeKHJl5GGUwkdOj7y6rAPCL3g3q28V7SgNW4bw7iz8+5U
	vsECR8w3igqk3OgB1OW+FBwzWm5toGbGWazNrcr4XI37fewyM1e5JwXYKq0Pe3Jd5nC0g6LNngT
	qgCgfBHnKjU0E90hXzbanqdIvL+yR0jJYqt8uMnEv8n5DGYVpyKDvKdhcpIUYSjpqmmhHEiAR/8
	b+jHw/ouGETEn4IJ9Kya9sb1U7Hzpd77V72QiwNokJHlSYgqzQXiHfBwc3OCwXHBl32RlvVqzZi
	Klram4Z066iXHFY2ypMu9ap+Sch5tZobMUNB2qJ2eAF6PSVIbzsT43TvVRPqLyzAaUSls8H3Kfk
	a4+KaC4WBU06om96sHp8ndRtPmqRRq3Zn6QWus54lLkELmb84p5z3DxxOcd5DBXRwh1einAmqzW
	tp+k0vB
X-Received: by 2002:a17:907:9713:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c419a942f35mr242613066b.2.1792281876811;
        Sat, 17 Oct 2026 17:04:36 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247412f10cc8c3f7d773dd5eb.dip0.t-ipconnect.de. [2003:f2:4741:2f10:cc8c:3f7d:773d:d5eb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm213267866b.33.2026.10.17.17.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 17:04:35 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	razor@blackwall.org,
	idosch@nvidia.com,
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v7 1/2] netfilter: flowtable: tear down direct xmit flows when the fdb entry moves
Date: Sun, 18 Oct 2026 02:04:33 +0200
Message-ID: <20261018000433.1466958-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atCsGx2IRecQNK3r@chamomile>
References: <atCsGx2IRecQNK3r@chamomile>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resent as plain text, the first copy was HTML and did not reach the list.)

Hi Pablo,

On Thu, Oct 15, 2026 at 12:34:06PM +0200, Pablo Neira Ayuso wrote:
> > Assisted-by: Claude:claude-opus-5-5
>
> I did not use this LLM assistance for my patch and I show as
> co-developer here ;-)

The tag covers my changes on top of yours, v8 says so below ---.

> This comment is not needed? LLM likes to bloat code with unnecessary comments.

Removed.

> Why LLM decided to rename this function? :-)

No reason, back to fdb_valid_dst().

> I think bridge_ifidx is not needed here and I am not sure we can cache
> this value?

Dropped. The gc now walks from out.ifidx to the bridge port through
the vlan devices in the encap. A 2-bit port_vlans says how many there
are.

> Why do we need bridge_vid? See below to explain an alternative.

[...]

> A new flag might be need, but there is room for new flags to annotate
> this VLAN header came from bridge filter filtering, I understand
> info->encap is not enough.

Dropped too, there is a bridge_vlan flag now. For an untagged port on
a vlan_filtering bridge the vid is not in the encap, so the helper
uses the port pvid.

> Why LLM moved this away from nf_flow_dst_check()?

Moved back, nf_flow_dst_valid() calls both.

v8: https://lore.kernel.org/netfilter-devel/20261017235849.1066624-1-julius@bairaktaris.de/

Thanks,
Julius
