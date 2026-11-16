Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822240;
	b=hAEUJPaVfXSLOoCPoBleAGAv+mLylbyYgUbGvJG5txQNXC06KMqp7zjVmmRBm6pKaCQ8
	 b8ktv+Q8SrU3vJ11+PSqIIRxsYbFwFR7vNQnwvxvF0CVr6hwxSCtGzpQ5rYZSZE4esDqq
	 lH2oMVOFczyaGpitburXcuZQW0BIIXFYLNeOCGqQ6WYV37mDlo+HGllG5ATeS1pMsul9V
	 QK71/wqQsPuiGy95gyBucwIHQXi9kZXwNwxZkKy9myGIKlnSWP/59fyt5PbV2nc7fbnAH
	 qWcd0evy8aM3JonMfLDaagSkzryW0s0QIumQzT6QuUuS6Uq42qV4cPMCIVLbV/N1TBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822240;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=biJL2nCMkobNEt0JjETiPXr9Fx1inAXv607twINZeC8=;
	b=BRq/9GyVwlkVFsFIqSoUpZ2EHvJlgM4bzh9HX+Q3KwBqFCT/mncVNYR9FplzLx4E+p1o
	 4wotbQhHKA0PVoel2e2aARJ2+lhOy6KQt4BSf70pFoMrVbsbApB6Jrcn6HFqCdkCIKPW3
	 epmP+9xuMSR8rHjNbw5Fkzdb3Y685e9+Z3M1TfE2n/+jNCr3YguPRjCRwo4oWtX1sEVHV
	 0hr8HTklkbGqqgkuNnb/gcTtbpldrU+RqjptJjifZLMlu5KMmxGECGE0Y1MGpQjJSuStC
	 UluQjW0W8FE9+l+HimXhF5gRLsa4pUSfJVSI3BeRlI1TqnvzxYZh5HuwS54dzMtw+sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ObQHnZ8n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719D0606A329;
	Mon, 16 Nov 2026 09:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ObQHnZ8n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298381F000C4;
	Mon, 16 Nov 2026 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794822240;
	bh=biJL2nCMkobNEt0JjETiPXr9Fx1inAXv607twINZeC8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ObQHnZ8nygy66dswO+XYCUMXCIHDeXrjlchUSE7kwqoxyV9Ez5uGUKzAp3N8FDNyE
	 cJ0vgUgew6xWHp6y7sZz+5oSmmUiqCdM0wxUm1pNaD/NuQgiUGXTbEieUa1FAOXioO
	 UpmKhsxkVknCux2l1R1jY7JkreG4pyo/5rw9AEAYlWPmswhFBx1FljvDXkSuAlUkeV
	 cIG9fuv5gm6hKUW/XiEexQT/rIwS0aSE3ciXZfbA+LwnyfP15pyNgNtVLqGARJxKa+
	 bY1ApgjqpqUoJRxbYiAh1q9FU9X5bbLLAzWmC0ECWWfNuDF0fJO78f0THgA99pVxYC
	 P6F+HM49JAV3A==
Subject:
 Re: [PATCH net v6] genetlink: Reject joining multicast groups no family owns
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com,
 nicolas.dichtel@6wind.com, jacob.e.keller@intel.com, jiri@resnulli.us,
 fw@strlen.de, martineau@kernel.org, v3rdant.xiang@gmail.com,
 aliceryhl@google.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 09:43:58 +0000
Message-ID: <179482223865.3136.3369549991780791717@kernel.org>
In-Reply-To: <20261112094205.1120090-1-anilkaushikwireless@gmail.com>
References: <20261112094205.1120090-1-anilkaushikwireless@gmail.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix still lets a socket become a member of a multicast
  group ID that no family owns.
- [Low] The patch changes how the reserved, uAPI-exported static
  multicast group IDs behave, and nothing a uAPI consumer would read…

--

genetlink: Reject joining multicast groups no family owns

With this patch, genl_bind() returns -ENOENT for a multicast group ID
that no registered family owns. This stops unprivileged sockets from
joining IDs ahead of time and later getting the messages of a
capability-gated family. netlink_bind() skips IDs whose bind callback
returns -ENOENT and joins the others, and
setsockopt(NETLINK_ADD_MEMBERSHIP) returns the error.

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/

> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index 69bb951b5fb8a..ee573ba6396dc 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -1033,6 +1033,12 @@ static int netlink_bind(struct socket *sock, struct sockaddr_unsized *addr,
>  			err = nlk->netlink_bind(net, group + 1);
>  			if (!err)
>  				continue;
> +			/* no one owns this group, still join the others */
> +			if (err == -ENOENT) {
> +				__clear_bit(group, &groups);
> +				err = 0;
> +				continue;
> +			}

[Severity: Low]
Should the uAPI side document this change for the reserved static IDs?

include/uapi/linux/net_dropmon.h still exports:

/*
 * Our group identifiers
 */
#define NET_DM_GRP_ALERT 1

genetlink.c also still reserves that ID for static use in mc_group_start
("the drop-monitor code abuses the API and thinks it can statically use
group 1"). It reserves GENL_ID_VFS_DQUOT and GENL_ID_PMCRAID the same
way, and genl_validate_assign_mc_groups() always uses first_id = 1 for
NET_DM.

After this patch, genl_bind() returns -ENOENT for these IDs until the
owning family registers. If setsockopt(NETLINK_ADD_MEMBERSHIP,
NET_DM_GRP_ALERT) runs before drop_monitor (or pmcraid) is loaded, it now
fails with ENOENT.

A bind() with nl_groups bit 0 set returns 0. Because of the __clear_bit()
above, the socket does not get that membership, so the program sees no
events and no error.

The commit message accepts this trade-off ("a program that joins a fixed
ID such as NET_DM_GRP_ALERT before the family is loaded no longer gets
its messages"). Could the uAPI header and the comment above mc_group_start
be updated to say that the family has to be registered before the join?

>  			netlink_undo_bind(group, groups, sk);
>  			return err;
>  		}
> diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
> index 5cc1037d4917e..f038f04ef4ead 100644
> --- a/net/netlink/genetlink.c
> +++ b/net/netlink/genetlink.c
> @@ -1825,7 +1825,7 @@ static int genl_bind(struct net *net, int group)
>  {
>  	const struct genl_family *family;
>  	unsigned int id;
> -	int ret = 0;
> +	int ret = -ENOENT;
>  
>  	down_read(&cb_lock);
>  
> @@ -1841,6 +1841,7 @@ static int genl_bind(struct net *net, int group)
>  			continue;
>  
>  		grp = &family->mcgrps[i];
> +		ret = 0;
>  		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
>  		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
>  			ret = -EPERM;

[Severity: Medium]
Can a socket still become a member of an ID that no family owns?

genl_bind() checks ownership under down_read(&cb_lock) and releases the
lock before it returns. The membership is set later, and ownership is
not checked again:

netlink_bind()
    err = nlk->netlink_bind(net, group + 1);   /* genl_bind(), cb_lock dropped */
    ...
    netlink_table_grab();
    ...
    nlk->groups[0] = (nlk->groups[0] & ~0xffffffffUL) | groups;

netlink_setsockopt() has the same gap for NETLINK_ADD_MEMBERSHIP:

    err = nlk->netlink_bind(sock_net(sk), val);
    ...
    netlink_table_grab();
    netlink_update_socket_mc(nlk, val,
                             optname == NETLINK_ADD_MEMBERSHIP);

If genl_unregister_family() runs in that window, it takes cb_lock for
write and calls genl_unregister_mc_groups():

    __netlink_clear_multicast_users(
            net->genl_sock, family->mcgrp_offset + i);
    ...
    if (grp_id != 1)
            clear_bit(grp_id, mc_groups);

The binding socket is not a member yet, so this does not clear it. The
ID is then freed and the family is removed from genl_fam_idr. After
that, netlink_bind() or netlink_update_socket_mc() sets the bit on the
free ID.

A family registered later through genl_allocate_reserve_groups() could
get that ID and inherit the member. One example is a family loaded on
demand through CTRL_CMD_GETFAMILY -> request_module(). NET_DM could also
come back on ID 1. Either way, the GENL_MCAST_CAP_NET_ADMIN or
GENL_MCAST_CAP_SYS_ADMIN check never runs for that socket.

When the socket closes, netlink_release() -> genl_unbind() then calls the
new family's unbind(i) with no matching bind(i). Could that unbalance the
listener counting in families that implement bind/unbind, such as
thermal_genl_unbind()?

The commit message says this window is not covered ("This does not
cover a family that is unregistered between the check and the point
where the membership bit is set"). Hitting it needs a family to be
unregistered at the same time, usually a privileged module unload or a
module init failure. But the result is the state this patch is meant to
prevent.

Is a recheck at the point where the membership is set planned as a
follow-up?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112094205.1120090-1-anilkaushikwireless%40gmail.com
