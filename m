Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742194;
	b=5FZbqhH1EL98YS4CE0qTCO8sbf5rrv3QNBttMXIdwZTSYiloy6AFXz0PjX4amSTOIfLd
	 xcqioQl0ZZh6zkrZeUGoonivlDqIeYLsK6MvN21+WqYVkgX2+B3RivadcQ4YvgC+bDbAu
	 OgO+nYbyLgqnNoh9gljYhJBDf+6Bj1RgJHnL3V24qpd7HBnd/fPQ9lSk+SMQ+yFvraA0r
	 n9rzxxXChCn96BJoAEGye5Xgb4kYn//+wF26pw7Hzr7AhXbcndRsOzWUg2Ow7LCUv9TNj
	 5JKX3srAPvr9gChtYgn18O2ps4TVVoOjXOFwnOztzWaJWPovfOQzmTylVbP6WMon4qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742194;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a1fLNTNQuElQrkhiWKcrIu52BrjXQYMDASDkpVEAwms=;
	b=kvdLz3+79gn15k8L6bPOmR4g8JvzdDIGZv2fTI2TmO5qD0y8nD4VcaqSxFRLzzLiO5UF
	 B+XASGExoT2DX2uOoa6cX+EAObcC8/4Rg/rQ7XNjLRrAAPem+IK5m+QOCX1OE+5ouHirN
	 gd3V52AVHTGo1vTHaO7+Rahl31fHsf/8j4RZ+axr0/OZ5u7OnXMxM/O9WpEwH8kVHCt0X
	 AxhyAJWGGI4RJuJZBc3xekzfPZMggu5jRJd+CTxrr2qX4Txjltsy7qUwGLsrmSN60oOx4
	 qHrlXDyrTsWYHQpVA/wRnxz4E5LYz/ST1ANi5Tgye2PM4qOEbkvt7GaslR3hXSx5z8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wW2D8xx+;
	arc=none smtp.remote-ip=91.218.175.199
Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7A606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F7A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wW2D8xx+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AxDTtbQpe1Pw1Gld4FexP/rem2OpjOhFrzr3t8rvVIc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792742191; v=1; x=1793346991;
 b=wW2D8xx+DdbRIC4AHcSsoWygNrMVamSR+kr6fATyTg+RyS24w+tgSGJSJea4RaHGc1sJGUTR
 uzy2bS5hJ0SH08Tstg8AwLygSAn1nXcr4+uSM40DDuBP9W6GwrgQjgb2jM1Wt50KldLURcH1v9y
 xNof3we7jE5136Rq/sttJ0m0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 4835e8e05efbd0ae;
	Fri, 23 Oct 2026 07:56:30 +0000
X-Mizu-Trace-ID: 4835e8e05efbd0ae
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 15:56:18 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	horms@kernel.org, john.fastabend@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, stable@vger.kernel.org, yana06070@163.com
Subject: Re: [PATCH net] macvlan: fix passthru promiscuity accounting while
 down
Message-ID: <atsTIt31dw6DPENI@fedora>
References: <20261022090809.12019-1-yanxia@cmss.chinamobile.com>
 <atrKdb1atGzCYka4@fedora>
 <20261023061630.350083-1-yanxia@cmss.chinamobile.com>
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
In-Reply-To: <20261023061630.350083-1-yanxia@cmss.chinamobile.com>

On Fri, Oct 23, 2026 at 02:16:30PM +0800, Xia Yan wrote:
> Hi Hangbin,
> 
> > If we discard the MACVLAN_FLAG_NOPROMISC change, should we remove the bit
> > before calling WRITE_ONCE(vlan->flags, flags)?
> 
> WRITE_ONCE() still saves the new flags. The patch only skips the
> lower device's promiscuity count update while the macvlan is down.
> 
> If NOPROMISC is cleared while down, macvlan_open() takes the
> reference on the next open and macvlan_stop() releases it. If it is
> set while down, the next open leaves the lower device's count alone.
> 
> I'd keep saving the requested flags. Clearing the bit would lose
> the user's setting. Rejecting the update would require bringing the
> interface up before changing this option.

Ah, I see. Thanks.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
