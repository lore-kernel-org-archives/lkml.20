Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556988;
	b=mPm0wHIBOpPfRTtVTWA9HpA6GriS1G1CKLTWLrADxOBZPmuT22J3wz/Cj4FpmIt9fXTy
	 aNnxb1x0vzGIHs0JFJhpEtlmdV7DgLo6r1032EjFYZTZRebGNNuEZ0L6DuCDu8f4Krtd8
	 f5O3FE0j85SYzGusA+4vIW15NGtSMN7XiScxaX0VL2qvQgKh0HYmKzgbEmjYsVKCyYQl9
	 ITz/4tiBcvY/HS/ioT4J4QKrHd05+n+n0WSuP7d2HpuBobYynMH9c2vDjECB+pgCfvBwO
	 5cHZVqU0S7Wc/zd3TdoPx5MbI7cO1nu/b9S0fcYvPEBKBPAUyI5qex9mcggs6gzccvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556988;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=C2OxTrMjSPzr0cpLSbudodgM1xckNX9oUGx/lPpXiXc=;
	b=jPKhGG34dpAiLX98WOM1Tvw540B9Y0zwoEqFE7oOsggOdt2FtqaGZUcRu0WuHV/d2LXM
	 EJxPiWsxP7p2JKQwy7QEkSHA5dweXXgK3bj9OGFmnyibAjUaR5b3dlSPSF41vvZUorxrN
	 Sh8HF7Rpvoj9dkTXAODo9KRszbEzog2Pffe92OSID+GzVVfZlolIC5Gfj/Fx1R5tZDzO6
	 sY0mIaxy96/Nu6vn49ZhyTVUhEcuni2+pPhKXjmyG7AZsxHahmQ/yW+pPJJxnALHNFDZ7
	 RcSAEWgaOSPyVORBKB7tn9ySAisiESnOPgEOeSilc5YPqytD2wZ60jLRSZPbLhnc7CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=puSBH2vT;
	arc=none smtp.remote-ip=95.215.58.138
Received: from mta1.migadu.com (unknown [95.215.58.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FB9606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FB9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=puSBH2vT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w1zAUgXu1ewHnoMcf4RK7QPabu5UkWi+j/aizWEQQo4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794556985; v=1; x=1795161785;
 b=puSBH2vTmu+i0LdiezXCdJDSeYnO8PBEBX3gfCfWwbW5RuhxyXQuwkhsOwxJLlcTzUh4DVM+
 lYuA94UzSHVOQAP7uulRDmC/ofIKkJuZWmEDxUcEHFT4y0Qz5BbZSewlLBKGrYAJIRVnan59sCb
 xfVobNlkfHy4myo8C0tRpjcU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 545262577151813d;
	Fri, 13 Nov 2026 08:03:03 +0000
X-Mizu-Trace-ID: 545262577151813d
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 16:02:49 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	MD Danish Anwar <danishanwar@ti.com>,
	Murali Karicheri <m-karicheri2@ti.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net v2] net: hsr: clean up synced addresses and allmulti
 in hsr_del_port()
Message-ID: <avbEKc__kU8IKdfN@fedora>
References: <20261111060143.183670-1-sunwenbo@cmss.chinamobile.com>
 <avULIJLRzOEoefJI@fedora>
 <avUQ5dAMMRlUTNzq@fedora>
 <avWJrwDyT8HJHWSN@fedora>
 <20261112064716.85381-1-sunwenbo@cmss.chinamobile.com>
 <avWLZTnYPQJ2-z7_@fedora>
 <20261113060623.79812-1-sunwenbo@cmss.chinamobile.com>
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
In-Reply-To: <20261113060623.79812-1-sunwenbo@cmss.chinamobile.com>

Hi Wenbo,
On Fri, Nov 13, 2026 at 02:06:23PM +0800, Wenbo Sun wrote:
> Hi Hangbin,
> 
> I sincerely apologize for sending out v2 too quickly yesterday before
> giving you enough time to review the previous discussion. I really appreciate
> your patience and thoughtful guidance.
> 
> Regarding your question on whether dev_uc_unsync()/dev_mc_unsync() could be
> called from hsr_dev_close(), and whether they should be removed:
> 
> I traced the function calls and verified the behavior in a User-Mode Linux
> (UML) environment across different lifecycle events:
> 
> 1. Can they be called from hsr_dev_close()?
>    Yes. When an administrator administratively brings down the HSR interface
>    without deleting it (e.g. running "ip link set hsr0 down"):
>    - hsr_dellink() is NOT called, and ports remain in hsr->ports.
>    - dev_close() triggers ndo_stop (hsr_dev_close()), where hsr_for_each_port_rtnl()
>      successfully iterates over SLAVE_A and SLAVE_B.
>    - Both dev_uc_unsync() and dev_mc_unsync() ARE actively called here to unsync
>      addresses, ensuring physical slaves stop filtering for HSR multicast while
>      hsr0 is DOWN (and re-synced by hsr_set_rx_mode() once brought back UP).
>    Therefore, they are NOT dead code in hsr_dev_close() and should NOT be removed.

Thanks, this looks good to me. We don’t need to clear the IFF_ALLMULTI flag
because the interface is only being brought down, we still need this flag
after it comes back up.

When the interface is brought up, `hsr_set_rx_mode` is also called to ensure
`dev_mc/uc_sync_multiple` runs. So the patch looks good to me.

Thanks
Hangbin
