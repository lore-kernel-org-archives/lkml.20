Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.205.69.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371570;
	b=0QaEwy4i4ivlHq6XEa7SpgtqZ8ENY/JgqeV/hAE7EOcRuJy8Q8YYavYSPbrb40uycjNf
	 Gg5NKiLdvlAJcTMeJ4+J0gv96MRzGr/wJXjeIrhADqpbKC51KzWPdtlKhOF00SYLYF43j
	 DLf3dqeACfPneu0OYi1sxeGKKow1zjprk+ER2EE+/7PmL/8kITV0aIzIloESnleZdigHR
	 gJgwWvXFThkL5HOvF+0MhBnabudkgG50+1vXKWMOiTyv9iPcGn3U3kSlJcYKH4RGEd4Ef
	 1A00d6I8YrpIWRZB7B9Y2cHdGy3Ys9FA7q0H48cs7TtJxKCcWF9NvRLrZ1avJmyDUuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371570;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Feedback-ID;
	bh=pMqOs9POd/nFez3NQApXq5U89yNIxrjJgtJv5CPX2Yo=;
	b=JQt8b+3SNl5ncCidB6041kSAEseD8NHf+jP6k6OCn2ekwQpQn/edIG3gK+FSywoyMvcu
	 3n7x82EqYMaQnOUIrBhW7Fj9xPhZFzeHDdaiV3HXbZZdIS6W6Qf0GEofxZXARPULUPBU5
	 xh3FgLRUuZlu3jsjGgd7XKDRY5gLMN9ADms5ExY2t0bUiep+/7mvN0I6blsBP4qtBh2Er
	 PRRmPqufP+DMsJt6Nuc6T/MNjTHxEQQs2kOiOug5xXEZ82hyF7h5UcvHMkavk0XW/6K5+
	 CorRsbNiviB8qIRPH1U6r6p/J01+MWADT+2qccAh8qt/0Di4XmLCotqDTZ9xT8UA5Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=well-founded.dev;
	spf=pass smtp.mailfrom=well-founded.dev;
	arc=none smtp.remote-ip=185.205.69.214
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AE5606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AE5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=well-founded.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=well-founded.dev
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 9963119F60B65
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:46:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793371561;
	s=s1; d=well-founded.dev;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=pMqOs9POd/nFez3NQApXq5U89yNIxrjJgtJv5CPX2Yo=;
	b=Ndlo3KxNHleP2mYx79KSiJ4AnOwnEtxe321wTcMteVa3qcJH7BlZzRic40e7Ulcd
	MNOadZMyCbr4LNst3Z1iQv5VsOJ8aro++N2EL1ehWHQEj8iB/Q7pJYcLaYGQYUJ7nx0
	JUmikAIWNnq7HwXjsdLhpdU128jYmlxmZWPxJ+8uovXtV3hb8ELQ/DAGxl3rb6lEHUt
	q7VNBr5r5jaR520o0obyAm5dXvyBFao+BGUcWNf7RDolejFTD0PZGOh7Hve1KPnmhxp
	F/QGyLqv44lOcGywEOLePIgCjdOE+z7X+wPRHCJ7PfFipWEKCSnxwzQM22DKtrTT3G5
	0rr9rvZpRw==
Date: Fri, 30 Oct 2026 15:46:01 +0100 (CET)
From: Ramses <ramses@well-founded.dev>
To: Netdev Bot+sashiko <netdev-bot+sashiko@kernel.org>
Cc: Jv <jv@jvosburgh.net>, Andrew+netdev <andrew+netdev@lunn.ch>,
	Davem <davem@davemloft.net>, Kuba <kuba@kernel.org>,
	Pabeni <pabeni@redhat.com>, Jbohac <jbohac@suse.cz>,
	Edumazet <edumazet@kernel.org>, Netdev <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Razor <razor@blackwall.org>, Hangbin Liu <hangbin.liu@linux.dev>
Message-ID: <P5CGXCc--F-9@well-founded.dev>
In-Reply-To: <179336101608.3134.1827486120303560891@kernel.org>
References: <20261028-bonding-last-rx-v4-0-4d8e4cd47467@well-founded.dev> <20261028-bonding-last-rx-v4-1-4d8e4cd47467@well-founded.dev> <179336101608.3134.1827486120303560891@kernel.org>
Subject: Re: [PATCH net v4 1/2] bonding: fix initial last_rx vs
 ARP-monitor
 slack window
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
Content-Transfer-Encoding: 7bit
Feedback-ID: 0163e381fa67fa966160938ffa017803050e57578bb1735d37cd25d20463a96a9bb3a550250bbc5eaa94bfdfd8cf3defcf1aa43859ae980630826bb8230f264e7f:TurnOnPrivacy!:tutamail

> [Severity: Low]
> This isn't a bug, but is "until a real reply arrives" accurate? More than
> ARP replies can move last_rx forward.

Right, with arp_validate=none any received frame updates last_rx. v5
says "until it receives traffic".

> [Severity: Medium]
> This seed uses the arp_interval in effect at enslave time. What happens if
> ARP monitoring is turned on later, or the interval is raised?

That issue already existed before this series. The seed was already
 computed from arp_interval at enslave time and is not refreshed when the
 ARP monitor starts, from bond_open() or bond_option_arp_interval_set().
 This patch does not make it worse. Reseeding the slaves when the monitor
 starts touches different code paths, so I would rather do that in a separate
follow-up than grow the current patch series.

pw-bot: cr

