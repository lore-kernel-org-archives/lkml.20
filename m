Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728581;
	b=KZZ1SKNp8i9Th7lEqIq6L0TCztJWyXQO+F3Qc5T3KE4kP5BQxUim6/FXjZKEQqIefJbU
	 E4EQJJAdVAFeqNlcQ7dcL/p7lRnjxgxyOxyk45MAd49eKg8ctncUwcblp7BdyjugYW4K6
	 kBjBXz2+m/3T9ODj7hs6y6kOWMDKhqjYMEKc+naKgNQOGtLeIrZtBEugZbaSUuRjA14Wn
	 powHrhdjHoX0neDx/ShF74TGdahAGxlpQnG5EDiUbXDnJt9l9zYjeWbLgOytV3ueXCL/3
	 EbV+opv8qKKUIszV/V1AWPOFgcmhnwHJP/1rejCqvrasqDIqaPV90Bp73InLwQQONhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728581;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Cn1hqHiLQJcX9AvOPTcWUfgzPP39MReCfQbew9UssmY=;
	b=k+OxGW4sJH96TW1ECZGjba+HlwcQ0MzyDdZd4tc3S4PVCo8QPLn0AJXoixh0I7bUIqSz
	 +Bhsq1h718rgch2+FJ1t6PCed7zShLBIGVou5R/oYodV5QJgIT3LSd8Ng4m5fvnJIgZD9
	 Z/dPfI2LJ3H2u/Bh9NEvTZfTeT+ZHnCCEzRcaPiPkArE1TU9tTjhqudMrQo6rAYznWZc5
	 JTzSd2RrX94XsYcJKU7IiSm1/umf2kR0TljeMOYBPZRqsUAtnnXjZIP2UugHFfGBoBdD5
	 SFzHWcYzXEcSjZN0P7Y0cAkPGKDpaXE+99PgoTRfEAAbHth+TLqhlogUd+9jClHHuiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=No5Ya2Ys;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C78606A333;
	Sun, 15 Nov 2026 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=No5Ya2Ys
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530ED1F000C9;
	Sun, 15 Nov 2026 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794728581;
	bh=Cn1hqHiLQJcX9AvOPTcWUfgzPP39MReCfQbew9UssmY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=No5Ya2YsMEXvoYeGNBaO8CbHekDrIpZkiLkSrGlbbI9J0DEAuv3HNeQwO9NeDTrY9
	 XorRY7KYbSv7yFWnku1aQyWktoCENsqvXw1AJhcVkNK1eeOMmJrurPhz7uuHR4oeBe
	 IC777mkDpN6KrjgXx5i17OTqTLrQIS3z73z7xY7vPDCWk521w2nn+Zbu3S7N8jNd7E
	 k6QeNeCjz8lfwrJWLL9VdkA4jVwXq1hxBDvH+QCCcpkTYEMFlbEYsTXBQ9GUxU5sjE
	 dqpF5RVmWxnmu2KOsrxjNjrkldOSFvYRBDeZq/ruRknx4IEGFEsSgglo8HBs21LEEH
	 j+KrM1I5RRyLg==
Subject:
 Re: [PATCH net-next] net: ethtool: request rtnl_lock for ETHTOOL_MSG_PORT_GET
From: netdev-bot+sashiko@kernel.org
To: xiaolinkui@126.com
Cc: andrew@lunn.ch, kuba@kernel.org, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me,
 jacob.e.keller@intel.com, bjorn@kernel.org, alexanderduyck@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, xiaolinkui@kylinos.cn
Date: Sun, 15 Nov 2026 07:42:59 +0000
Message-ID: <179472857971.2199510.5265696099741665969@kernel.org>
In-Reply-To: <20261111072724.3295527-1-xiaolinkui@126.com>
References: <20261111072724.3295527-1-xiaolinkui@126.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix covers only one of several commands with the same bug.

--

net: ethtool: request rtnl_lock for ETHTOOL_MSG_PORT_GET

This commit adds an ETHTOOL_MSG_PORT_GET case to
ethtool_nl_msg_needs_rtnl(), so that ethnl_default_doit() keeps rtnl_lock
for PORT_GET on ops-locked devices. It does this because
phy_link_topo_get_port() asserts RTNL before it reads topo->ports.

> diff --git a/net/ethtool/common.h b/net/ethtool/common.h
> index b062e99e89dbf..372304722ecc4 100644
> --- a/net/ethtool/common.h
> +++ b/net/ethtool/common.h
> @@ -124,6 +124,14 @@ ethtool_nl_msg_needs_rtnl(const struct net_device *dev, u8 cmd)
>  		 * these cases are Netlink-only.
>  		 */
>  		return true;
> +	case ETHTOOL_MSG_PORT_GET:
> +		/*
> +		 * port_prepare_data() resolves the port through
> +		 * phy_link_topo_get_port(), which asserts rtnl_lock before
> +		 * reading topo->ports. There is no corresponding ethtool
> +		 * ioctl, so this case is Netlink-only.
> +		 */
> +		return true;
>  	}
>  	return false;
>  }

[Severity: High]
Is PORT_GET the only command with this problem? The commit message says
an ops-locked device with a link topology "trips the ASSERT_RTNL()
warning", and it calls this patch "the missing case". However,
ethnl_req_get_phydev() checks the same condition before it reads the
topology:

net/ethtool/netlink.c:ethnl_req_get_phydev() {
    ...
	/* If there is no PHY in sight there's no need for assert locking */
	if (!phy_link_topo_empty(req_info->dev))
		ASSERT_RTNL();

	if (!req_info->phy_index)
		return req_info->dev->phydev;

	phydev = phy_link_topo_get_phy(req_info->dev, req_info->phy_index);
    ...
}

The prepare_data or set callbacks of these commands call
ethnl_req_get_phydev() unconditionally:

  STRSET_GET      strset_prepare_data()
  LINKSTATE_GET   linkstate_prepare_data()
  STATS_GET
  PHY_GET
  PLCA_GET_CFG, PLCA_SET_CFG, PLCA_GET_STATUS
  PSE_GET, PSE_SET
  MSE_GET

All of them go through ethnl_default_doit(), ethnl_default_dump_one() or
ethnl_default_set_doit(), which compute:

	need_rtnl = !netdev_need_ops_lock(req_info->dev) ||
		    ethtool_nl_msg_needs_rtnl(req_info->dev, cmd);

ethtool_nl_msg_needs_rtnl() still has no case for these commands, so they
fall through to "return false". LINKSTATE_GET is covered only when the
driver sets ETHTOOL_OP_NEEDS_RTNL_GLINK.

The cable test handlers ethnl_act_cable_test() and
ethnl_act_cable_test_tdr() have the same gap. They call
ethnl_req_get_phydev() after netdev_lock_ops_compat(), which takes only
netdev_lock() on an ops-locked device.

So take the device the commit message describes, one that is ops-locked
and has a non-NULL dev->link_topo. Wouldn't a plain "ethtool <dev>" still
hit the ASSERT_RTNL() WARN through STRSET_GET or LINKSTATE_GET, before
PORT_GET is ever issued? Those paths would also still look up topo->phys
and use the returned phy_device without RTNL. That could race with PHY
removal, for example an SFP unplug, which runs under RTNL.

As with PORT_GET, this is latent today. None of the in-tree drivers that
use request_ops_lock, queue_mgmt_ops or net_shaper_ops register PHYs into
the link topology.

The PORT_GET change on its own looks correct. Should the patch either
cover these sibling commands or narrow what the commit message claims?
Some ways to cover them:

  - add a case for each of these commands
  - force need_rtnl whenever !phy_link_topo_empty(dev)
  - move the topology xarrays under the instance lock

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111072724.3295527-1-xiaolinkui%40126.com
