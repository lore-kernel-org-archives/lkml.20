Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798643;
	b=LG3sULXc8c0P96XsM2h2Gk7WsODS7vf8mSd/9a9AUX4430ZHodH13e+OEpPUuLyd92JB
	 QhpTKMCOStWshso4Ks/SYYc03jOHjJG5ZQwdN7zbgzkV4MBFwrpmxzIl4CuYm6uOnUcS0
	 eN/OA80xb+of5Ah4fdiMDkSgCbyKAnGbg7QVva5uVnGJ3qz52GGukhavwmLiOpIfuvp6h
	 ymvQaht+5Os2SifSoZ1xwCDHCFkWG4OPkJ04MApXF7wT+MPpnU6Cz2w0KJK4RQyXYE5b0
	 ACAlGcBGjEqRA5b2tUU8C93k1oVFtuwD6WqEwYYsCgrrImlwjLPuCYFsakFPY3TeVjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798643;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=90ahyTqYBvlXIySaOxks0/UBauBPZtUXCET2ljcJ8X8=;
	b=o8ddn7MUAZenpHGq1FFU2w8zLDr0V/1akxS8L8PEqB9426rPrUcA8vGOXsr9ujA3Aeu/
	 0lCYSfUa6C+eKkY0+dB3c1vplkDQmxHvqMk/ZCLetOTPLdleFIPVHisr0MygG/iqSiqKw
	 8tr8pkDKDRQXlfRoaLLvA4rVzQH3a3alS0r1GTvxcqGoi8wtTva/INa3hZL0rJ4ZOGD/f
	 VIBf2JVi4L1tUwfkegQnqeYbiqp5pn0wp/oACSK0gu0gBPIXrH8DYHFyZ9LDmXWzjYBhZ
	 oUSG5uNcudb9L3mi4AwfAluEGF9/GRyFDHeCpcGZnGit+JPjFtiteS9CXbzVzMUAp6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ipisBCaD;
	arc=none smtp.remote-ip=220.197.31.9
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB1606A31C;
	Mon, 16 Nov 2026 03:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DB1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=ipisBCaD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=90ahyTqYBvlXIySaOxks0/UBauBPZtUXCET2ljcJ8X8=;
	b=ipisBCaDrPsxLOFyBWnjT9jYmHFX3Tx3YyAzk1tYejGcHM3I6z93iOnMwdO9jE
	k6VgCxPc74Rzb1Yc7n6Al192mF5seC2OiIop6ETOBC3Ecw1pHxK2tdhiXZsof+zS
	5q7lEJvqssj8OkgTfI0y9MAx8dVko9LGAOxkVA11caMj8=
Message-ID: <6aaecc63-8d85-4fef-8a1e-65d5f29205b9@126.com>
Date: Mon, 16 Nov 2026 11:09:23 +0800
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
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me,
 jacob.e.keller@intel.com, bjorn@kernel.org, alexanderduyck@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, xiaolinkui@kylinos.cn
References: <20261111072724.3295527-1-xiaolinkui@126.com>
 <179472857971.2199510.5265696099741665969@kernel.org>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <179472857971.2199510.5265696099741665969@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PSkvCgDnL_rjc_pqGXvHCw--.34471S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrykKw17tF4UtFWfWFyrXrb_yoW8Cw18p3
	yqk3WfAF4kGws7XFnrWw1UuFW8ZanrCrZ8tFZrKr13uw45Wr18KFyxtrW0q3W5ur97XF4F
	qFW8JFs7Ar47ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UxDGOUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqQRvRmr6c+R5DQAA33

- [High] The fix covers only one of several commands with the same bug.

Thanks for the review.  The patch has been withdrawn following Stanislav's
review (patchwork already shows it rejected), so there is no respin and no
"pw-bot: cr" to send.  On the substance, the observation about the call
sites is accurate - STRSET, LINKSTATE, STATS, PHY, PLCA, PSE, MSE and the
cable test handlers all resolve their PHY through ethnl_req_get_phydev() -
but the conclusion does not follow, because the device this issue asks us
to consider - ops-locked, with a non-NULL dev->link_topo - cannot exist.

dev->link_topo is only ever allocated by phy_link_topo_get_or_alloc(),
whose only callers are phy_link_topo_add_port() and
phy_link_topo_add_phy().  Both refuse an ops-locked device before they
allocate anything:

	if (WARN_ON_ONCE(dev->netdev_ops && netdev_need_ops_lock(dev)))
		return -EOPNOTSUPP;	/* add_port() */

	if (WARN_ON_ONCE(netdev_need_ops_lock(dev)))
		return -EOPNOTSUPP;	/* add_phy() */

So on an ops-locked device dev->link_topo is always NULL, and every
topology reader bails out before its assert:

   - phy_link_topo_get_port() returns at its !topo check, before
     ASSERT_RTNL();
   - phy_link_topo_empty() is simply "return !dev->link_topo", so
     ethnl_req_get_phydev() skips its assert and never touches topo->phys;
   - the cable test handlers resolve their PHY through
     ethnl_req_get_phydev() too, so they hit the same skip.

The drivers that opt into the instance lock (request_ops_lock,
queue_mgmt_ops, net_shaper_ops) all do so before registration, so there
is no path that grows a topology first and becomes ops-locked later
either.  If an ops-locked device ever grows phy_ports, the right fix is
to move the topology readers under the instance lock, as the comments at
the producers already anticipate - not to add a rtnl case per command.

Regards,
Linkui

