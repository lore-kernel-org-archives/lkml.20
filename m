Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797746;
	b=X69P1UEHOB8O7VwlNBZur91EqjDAE6rrPbct+uJ7U7y14UcldbdY6dmmbKCtY1NC8oRV
	 JcuqWsXV5J47y/E7/35RoGGcaIfvFpGsHU0+vPmRoc+bQYJIHDAH7I7o+zmKUCFaEA/8k
	 iU4u3qijMNOryXjYlBBRDMq0GD6IDGLTl7U7Y55+vL/raqWbkm/leyc6zNbPArViCQ68w
	 nKTPdlYEGuzvwMr1xUCUJ+PnoVcjYkmau/sabd9U9RNakCEfUDbzhTczv9yV8zhluXlZA
	 6uqJoFxK7SmL54x7hzA87tnAV7+2g6o0h/Yhqd3/EQc0l0MG+wkmZB0YtXPUL2slNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797746;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=gsj7jd7AfoGtFg0we3Hz9aAVPLheZu59lIGqgYGY0k4=;
	b=ChRa8Wg06yVA/cFMtpQgpxiEAs62y5WrSIZyb7K/65P7slMCSjLX1iEOJoDhT5gnf93X
	 qL/J/JPy8wEWjbL2vPdWYVObnXyX2jEiuHfXl43+mXM7MmW+vvoGZqNUkDgR28Pm/PpB/
	 vjHADahmWxI93H3SBB/7qF2kUoH6gyL+vz6OLxC8GEYXFPDJF1guab9H/9/7ALyPXmpTX
	 GJkJDQWMQOFY/X6vR5VNr8XXE7nXhlhGsXmMsFRe/2WwQVNB8KR6WdzYwOr+gh+yhFEn2
	 miZxOq6dqBNOnaMwucCtH18XYSxUp2Ru86RO3BExB+NU3coGcoeFoN3opUSxWtsSNAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=qXmz27kl;
	arc=none smtp.remote-ip=117.135.210.8
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D73606A31C;
	Mon, 16 Nov 2026 02:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31D73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=qXmz27kl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=gsj7jd7AfoGtFg0we3Hz9aAVPLheZu59lIGqgYGY0k4=;
	b=qXmz27kln8N9k7u9+HSiPuz0MdzTnYwkO8vNHz3NPEobvoN6y3FOifOWFah20/
	hlEdGFoHysxSRgVEedGLKPfXtKOYbQpmg9KQw9QcGJ7a55IFO0bkVFwUKwhstBQY
	t6IVw6Re1LQwvjVxZ4yjCk8AlTV4yKqhWsC5y5QUMX6sQ=
Message-ID: <cc161d10-9f0f-4074-888e-161f3399a10d@126.com>
Date: Mon, 16 Nov 2026 10:54:21 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ethtool: request rtnl_lock for
 ETHTOOL_MSG_PORT_GET
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: andrew@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me,
 jacob.e.keller@intel.com, bjorn@kernel.org, alexanderduyck@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>
References: <20261111072724.3295527-1-xiaolinkui@126.com>
 <avX2MdTZePW5ssrq@devvm16445.scu0.facebook.com>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <avX2MdTZePW5ssrq@devvm16445.scu0.facebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3N6hdcPpq8GeaDQ--.431S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1rKF4UCrW3Kr1rAry3CFg_yoWrGr4fpa
	sYkFyUGr4DXr92gFnrWa1UuF10yanxCw1rCr18KFyUCw45Wr1xGFWxKr9aga45Cr97G34r
	trWDJFWkZa1DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UcBMNUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlR+MY2r6cF91-AAA3T

Hi Stanislav,

On 2026/11/13 01:24, Stanislav Fomichev wrote:
> On 11/11, Linkui Xiao wrote:
>> From: Linkui Xiao <xiaolinkui@kylinos.cn>
>>
>> port_prepare_data() resolves the requested port through
>> phy_link_topo_get_port(), which requires rtnl_lock to be held before it
>> reads topo->ports:
>>
>> 	/* ports in the topo are RTNL protected, but may be accessed under
>> 	 * netdev_lock for ops-locked devices. For now keep them under rtnl
>> 	 * protection, as no ops-locked devices have phy_port capabilities
>> 	 * yet.
>> 	 */
>> 	ASSERT_RTNL();
>>
>> The dump side honours this, port_dump_one_dev() takes rtnl_lock()
>> itself. The doit side does not. ETHTOOL_MSG_PORT_GET is served by
>> ethnl_default_doit(), which keeps rtnl_lock only when the device is not
>> ops-locked, or when ethtool_nl_msg_needs_rtnl() asks for it:
>>
>> 	need_rtnl = !netdev_need_ops_lock(req_info->dev) ||
>> 		    ethtool_nl_msg_needs_rtnl(req_info->dev, cmd);
>>
>> ethtool_nl_msg_needs_rtnl() has no case for ETHTOOL_MSG_PORT_GET and
>> falls through to "return false", so on a device that opts into the
>> instance lock (request_ops_lock, queue_mgmt_ops or net_shaper_ops)
>> PORT_GET runs with netdev_lock only. Such a device that does have a
>> link topology trips the ASSERT_RTNL() warning and reads topo->ports
>> without the protection the xarray is documented to need.
>>
>> Add the missing case. Like TSCONFIG_GET/SET, PORT_GET has no
>> corresponding ethtool ioctl, so it is Netlink-only and always needs
>> rtnl_lock.
> 
> [..]
> 
>> The bug is latent as no device opts into the instance lock while also
>> carrying a link topology, so it cannot be observed yet and the change is
>> compile-tested only.
> 
> Then why fix it if there is no bug? And phy_link_topo_add_port has
> a big comment explaining the expectations?

You are right, and I withdraw the patch.  It fixes nothing, and the comment
you point at is why.

phy_link_topo_get_port() returns before the ASSERT_RTNL() when the netdev
has no topology:

	struct phy_link_topology *topo = dev->link_topo;

	if (!topo)
		return NULL;

	ASSERT_RTNL();

and dev->link_topo is only ever allocated from phy_link_topo_get_or_alloc(),
i.e. from phy_link_topo_add_port() and phy_link_topo_add_phy().  Both refuse
an ops-locked device before they get that far:

	/* Ports can now be queried without rtnl for ops-locked devices, which
	 * we don't support now as port retrieval is done under rtnl.
	 */
	if (WARN_ON_ONCE(dev->netdev_ops && netdev_need_ops_lock(dev)))
		return -EOPNOTSUPP;

(phy_link_topo_add_phy() has an equivalent check.)  So an ops-locked device
never has a topology to begin with: port_prepare_data() gets NULL back from
phy_link_topo_get_port() and returns -ENODEV, well before the assert.
With my patch applied it would take rtnl_lock() and still return -ENODEV,
so the patch is a no-op that only adds a lock - not something I want to
send.  For devices that are not ops-locked need_rtnl is already true, so
the assert is satisfied today.

My commit message was wrong on the point that mattered: it claimed such a
device trips the warning, when the guard at the producer makes that state
unrepresentable.  I should have read the expected design out of that comment
first - retrieval stays rtnl-only until an ops-locked device actually grows
phy_ports, and whoever wires that up will have to move the reader to the
instance lock instead of threading rtnl_lock() through ethtool.

The other topology readers gate their assert on the topology existing as
well (ethnl_req_get_phydev() uses phy_link_topo_empty()), so they are not
separate instances of the same issue.

The patch is already marked rejected in patchwork.  Thanks for the pointer.

Regards,
Linkui

