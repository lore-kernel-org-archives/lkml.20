Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460745;
	b=mB4DMdYYZnijmcmIHAnWCzNtY2CFDN7TyvWR+jyV2vrqbBWGDiiSij/iwQCoD4eC8B7o
	 3ElqZ+PYRjWtWZPJtXtyQKC6lG+fsWKCBlr67IBkbc7+x4l78d1sTvw3f8iK6xKgdgal7
	 Nf9rvzy60BalOufiesBTR5Y/YhTEV/dIvw4SruWRV23Nt+IbVhAE6mb8FC0wrsmrRV4uh
	 zbkasL1NIfqOfd8nT4Lps8bBa+IexvhNmivN+6BtU8sDg6Rx44YsPbz48VBdZFVbo/W7P
	 VKaGdf0ROeAzLeeoXrF7NuCkkg859e/ZcnmWF57zZVQsKVI41zkze439viQ6cwjHe8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460745;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W034+nZvG4TDfNjiR8mU9NccyHyyWqiASz0u3uyLj2w=;
	b=IkTQbqN1tSQZtVPHGs+U7MyFT+4Alfm2vecVY9FBNZlf4O+GKKH0GofQ1FXnUNT0A7CX
	 YgIuh7MTfDSsZWbnOD9zT83tbwq01PjFp32vVCGLIyVlmxfHnH70tP38+sjD73qeYTSMh
	 qLn8zz6ydLu311Nffh6RjRviqjQe31Cxq+sX/+zMZYdfE2SyF6c+uGSBeyO6NlmFmMnFs
	 vrDUO4hn3HMqHr269KTXv8YE/w10s/JQxRzzUSF9GpWEXQn0M50L90nQ5wk+UVrE8o3/T
	 R0AWpeuF821m3G2uM3DXHBaNK4JsVi51embg7IFfrsPyhJdGPLEjQwoSZtZoyWGxTNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WzuPIzSr;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C889606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C889606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WzuPIzSr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KcmKimTUWSvc0OwhXD4P3O1CuX5gAOJ5eE3dl16aHmo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792460742; v=1; x=1793065542;
 b=WzuPIzSrsCA1MlfOa5zYuIHLKtXoqvmHfIugD5ErB4Zsazk0T/9P2glA79bCb8cNXGIbMcBr
 MOayFE7r5vhQKoM2YM/5euZPbhrdBsfiYMdiScGR/uw2/MjgjT/HLs3j6HPGEFhtmEQC+Rw/oiG
 wbRHgVdRAMdUncRg3RLf2m2Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 65c4eaa1d9014f00;
	Tue, 20 Oct 2026 01:45:23 +0000
X-Mizu-Trace-ID: 65c4eaa1d9014f00
X-Migadu-Flow: FLOW_OUT
Date: Tue, 20 Oct 2026 09:45:15 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: lirongqing <lirongqing@baidu.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] team: fix promisc/allmulti leak in team_port_add error
 path
Message-ID: <atbHq7a_YzR6VuTg@fedora>
References: <20261019083122.1841-1-lirongqing@baidu.com>
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
In-Reply-To: <20261019083122.1841-1-lirongqing@baidu.com>

Hi Rongqing,
On Mon, Oct 19, 2026 at 04:31:22PM +0800, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> team_port_add() increments the port's promiscuity and allmulti
> counts before calling team_dev_type_check_change(). If the latter
> fails, the error path does not undo these increments, leaving the
> port in promiscuous and allmulti mode even though it was not
> successfully added to the team.
> 
> Undo both increments in err_set_dev_type, matching the cleanup
> performed by team_port_del().
> 
> Fixes: 43c2adb9df7d ("team: set slave to promisc if team is already in promisc mode")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  drivers/net/team/team_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
> index ca75f08..3b30063 100644
> --- a/drivers/net/team/team_core.c
> +++ b/drivers/net/team/team_core.c
> @@ -1386,6 +1386,10 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
>  	return 0;
>  
>  err_set_dev_type:
> +	if (dev->flags & IFF_PROMISC)
> +		dev_set_promiscuity(port_dev, -1);
> +	if (dev->flags & IFF_ALLMULTI)
> +		dev_set_allmulti(port_dev, -1);
>  err_set_slave_allmulti:

I think we can remove the dev_set_promiscuity(port_dev, -1); in
if (dev->flags & IFF_ALLMULTI) and move it under here.


Thanks
Hangbin
