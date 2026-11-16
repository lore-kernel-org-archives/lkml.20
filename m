Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814513;
	b=EeTN42hpCgK7cBuFCmVZVxhxzeZvWqYFWSlxW4vifIoApelIuX12Ai828F6w4ccT0oPS
	 UQRTUnyzPkvfsjoHbrFlG6n9HVpXVE3LZCOKP3ZmEncZfc9yUSd0z1YclnrBlHO2Lq+JZ
	 qbD0JVbdSk46ucSsOugUhqnSJA+WzffKgYquhHuHZrnLx5/YI+oon41f59m7P9QJz7IBE
	 C4ZYTOjZS1hFquK5VF7LSWujNzaHeN/dRb5zBinymU31fwAJ1UcOA4ogF/2ZKuKjfPhpt
	 zFvqWmLNpvF7PRljj+uMH0NV5cMdlv6LZKxJKFTdACK4sfvirL1mR8rtWqLi6/50a5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814513;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=fIDdNcF/l0x9lZp8RfumuNlHiHkBHNTTSBewvQAJ4vY=;
	b=XDinFIeoHl8z4CT2tDxxkTHWZCAfh268zZ+a8rHYkLmfnAQbn9fWoH+KpigKhTIwGORl
	 ecVqygjg3ZZGb+QB+cPsY+9Vd+TeCGqwveQ8gblMUKZd79ZtptNK5gEM3/Hdou5X/O+Eo
	 Kr5zyl+qbJYWgXL+gBRW5L/cDQbuWjfhGa/gJ71tHvZkck3wu2L/OghXA8I3VB4/XTR9w
	 1AyiFlkgmUSQq9v+vTvQrQFF6Lv/ZgAVZrsCWnhFLtX5Rgh3WIOxrsOIA1Ux6VMh4CXUZ
	 2rzKbVmv3agpnYh8uXUUL6fNt/xUm3egjRpgxGP1X1nWNr2BjObFWXKZom0pf7pz/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e5wR6+lB;
	arc=none smtp.remote-ip=91.218.175.42
Received: from mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C59606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e5wR6+lB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=x4W9yp3gYy0iqIhiaZihhZVq/EH24yiSsMyRtu3ztFY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794814510; v=1; x=1795419310;
 b=e5wR6+lBOsAwBtaBKgbi5r01C59pveEpoxWK4HNiqUeaWkqAQWOU89MNWjqrz/quCBAMKdOA
 DRNkRWrPLPx3DoKCw0ERMs7I8ufHdahhqCyOQYzkg4Y3F19R+nqyIsOYyJMsxfg87205XMK1rWq
 PmkZDdr7h/1xZ4FvH2JHJT80=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1092aa451d9b8fb9;
	Mon, 16 Nov 2026 07:35:09 +0000
X-Mizu-Trace-ID: 1092aa451d9b8fb9
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 15:34:49 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Lin Jiapeng <ljp1205831794@gmail.com>
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	sfeldma@cumulusnetworks.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lin Jiapeng <jiapenglin@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: Re: [PATCH] bonding: unbind 802.3ad slaves on enslave failure
Message-ID: <avqyGXhRkA0gfoEr@fedora>
References: <20261113130454.63032-1-ljp1205831794@gmail.com>
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
In-Reply-To: <20261113130454.63032-1-ljp1205831794@gmail.com>

Hi Jiapeng,
On Fri, Nov 13, 2026 at 09:04:40PM +0800, Lin Jiapeng wrote:
> From: Lin Jiapeng <jiapenglin@tencent.com>
> 
> The 802.3ad enslave path binds a slave to an aggregator before publishing
> it in the bond's slave list. This lets the periodic state machine select
> the port and attach it to a LAG while enslavement is in progress.
> 
> If a later step fails, the rollback removes the slave and frees its
> ad_slave_info without unbinding its port. A port selected in the meantime
> can remain linked from another live slave's aggregator, so later LAG
> processing accesses freed memory. A test-only kretprobe forces
> bond_sysfs_slave_add() to return -ENOMEM, after which KASAN reports:
>      BUG: KASAN: slab-use-after-free in ad_agg_selection_logic+0x1a0d/0x1fa0
>      Read of size 1 at addr ff11000109be946e by task kworker/u16:0/13
>      Freed by task 110:
>        kasan_save_stack+0x30/0x50
>        kasan_save_track+0x14/0x30
>        kasan_save_free_info+0x3b/0x70
>        __kasan_slab_free+0x47/0x70
>        kfree+0x1b3/0x550
>        slave_kobj_release+0xb6/0xd0
>        kobject_put+0x17e/0x300
>        bond_enslave+0x1acc/0x5090
> 
> Call bond_3ad_unbind_slave() in the common rollback for published slaves
> before unlinking the slave from the bond. This detaches the port under
> mode_lock and preserves the invalidate-drain-free ordering used by normal
> release. Successful enslavement and earlier unpublished failures are
> unchanged.
> 
> Fixes: 07699f9a7c8d ("bonding: add sysfs /slave dir for bond slave devices.")
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
> ---
>  drivers/net/bonding/bond_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index e9f5e753f677..60cc9a6a4fc7 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2355,6 +2355,8 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>  	bond_sysfs_slave_del(new_slave);
>  
>  err_upper_unlink:
> +	if (BOND_MODE(bond) == BOND_MODE_8023AD)
> +		bond_3ad_unbind_slave(new_slave);
>  	bond_upper_dev_unlink(bond, new_slave);
>  
>  err_unregister:
> -- 
> 2.55.0
> 

Thanks for your fix. I’m also working on correcting some error rollback issues
in `bond_enslave`, including the 3ad unbind problem. My patch still needs
further adjustments[1].

Just FYI, I’ll leave it up to the maintainer to decide whether to apply
your fix first.

[1] https://lore.kernel.org/all/20261113-bond_enslave_restruct-v1-0-364c549e78db@kylinos.cn/

Thanks
Hangbin
