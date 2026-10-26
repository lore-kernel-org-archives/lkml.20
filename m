Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985486;
	b=wb1BNyAnDN4B8/x022d3Ig1AzbNMxd08rkrvd+SBJygXlMn3x7uFsmQLmdDgt+/ZljV3
	 vwnXU01IASx5LV6fyMvU3hlZEXsyBKwheeh0UaeP4okG3lqEig9WVZ+uNsZcjZPRyfjWd
	 0c0fAIMtdgwzdB+QV9qhIqRDfgIK/fAdQb0yr+Wq+2SS8L3x8kbI9apLquBIYlCjXEjQO
	 0/9nlVcUA6GVlhd2i3QQ9bUeH9xwsBaGqFy0BQMEh1I/7qGKpV13qjqbuXa6cG5WHAC7Y
	 v8Qw5lgOdCm5wunbcLLuhbEO0ihyhKDkX7HfAeS2MuvY2GNmo3a/mho0eOGgU3ZyPWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985486;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q0ND4bsI7olG+bcJ2oFCEqAfSxwkslyibAWglvsbmZQ=;
	b=bmpZxq5WpQ8SfmozunT675q+a6D7jRfSkHVyAU1rPm+v/CUdA7osUMeQ+tQ5cm0hgvLo
	 zOpB4yWukmYmHDIHeRS4cJI5HGZDEdnufHZ0+HSJoVpwY1NOFAey3ynkB1cPWSKh4TI4Q
	 7mNf+gmzyMEhXyTgjolpJDDub7yiFqzxCDiYC22uMTQmOA1ZDlfQ5jtBO7x+tkB1PVwXF
	 +0k2y2neplhEscF9vUTvbol2XlP/hsZTXErJuf4V1TYUNRcazcSh3h2W6gEb5OCEXjCaF
	 omJsNUHwVB6s9V21/oyq1CCriFA5AKiCv+t62FgFEGM2WiJt0HnXizgrBrg/5D+37qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gmuz2rWB;
	arc=none smtp.remote-ip=91.218.175.22
Received: from mta0.migadu.com (out-22.mta0.migadu.com [91.218.175.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DF8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gmuz2rWB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=x39ufFhSR9iF7ouum3UUtIW0rlo3aLIetTlRgwm0ywU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792985482; v=1; x=1793590282;
 b=Gmuz2rWBk3Ztc1ZOnfFHppCvw84/x0H6YLEsjRI8gqEPyf4Xn9h8wsuKqazFHADeKEiK0Ioz
 UBQrkyd1biq4q9f0hO0Ak+8o7lNI3wUIPITw7iWqOenoVrnMJXaaaNtUiEq1CXhmgwPQ2x27LNz
 BX4Gje3GmeI3zvGELBfvhjoc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 666ad9eda4df890f;
	Mon, 26 Oct 2026 03:31:22 +0000
X-Mizu-Trace-ID: 666ad9eda4df890f
X-Migadu-Flow: FLOW_OUT
Date: Mon, 26 Oct 2026 11:31:13 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Ido Schimmel <idosch@nvidia.com>
Cc: Gabriel Goller <g.goller@proxmox.com>, David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] ipv6: Add NETCONFA_FORCE_FORWARDING to netconf
 messages
Message-ID: <at7JgfsvrAUxtPzy@fedora>
References: <20261023-ipv6_add_netconfa-v1-1-94d14b07d621@proxmox.com>
 <20261025131102.GA184152@shredder>
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
In-Reply-To: <20261025131102.GA184152@shredder>

Hi Ido,
On Sun, Oct 25, 2026 at 03:11:02PM +0200, Ido Schimmel wrote:
> On Fri, Oct 23, 2026 at 12:59:18PM +0200, Gabriel Goller wrote:
> > Since force_forwarding was added, changing the sysctl sends an
> > RTM_NEWNETCONF notification of type NETCONFA_FORCE_FORWARDING, but
> > inet6_netconf_fill_devconf() never emits the attribute. Listeners only
> > receive NETCONFA_IFINDEX without the new value, and RTM_GETNETCONF
> > replies and dumps omit it as well.
> > 
> > Fixes: f24987ef6959 ("ipv6: add `force_forwarding` sysctl to enable per-interface forwarding")
> > Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
> 
> This seems to fall under the "Not a regression, not critical" category
> [1], so can wait for net-next.

One question about this rule. For "not critical" fixes, should I make that
judgment myself and post to net-next? Or should I send them to net and let
the maintainers decide whether the fix should go into net or net-next?

Thanks
Hangbin
> 
> Also, NETCONFA_FORCE_FORWARDING is not emitted when it's disabled as
> part of:
> 
> sysctl -wq net.ipv6.conf.all.forwarding=0
> 
> Is this intentional?
> 
> [1] https://lore.kernel.org/netdev/CAHk-=wiSnTE9vBZ=5_v+3EEkdazCCbBM5YABRzRHUAeRdyd4Xw@mail.gmail.com/
