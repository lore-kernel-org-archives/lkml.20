Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793560;
	b=OWQSQ2XhCeM8hN6GRa8dTgU9P6YPdKTVE10/Ek9lGFOSgQ4qABOqP1hfYetAy+R+9Euu
	 GQaG5ui9IQA3uYfb69MQsCbXZuxw7P02hXDXfcn6Mc4p6LuDWhgk8mBeD+cv56CDcq25Y
	 oifkULidxk1tAWjqpVLLm61p4dFyBo8rUUrvLjsgoaSVCYYc+atji3M5Oq3XRDfQwNehG
	 hNKrjG0W7rzOZfHtiwA0tn+9DrXFFhdEFHgIeeQnEDU3yo/nnC4oofM2y0xLusl47Guo4
	 S/xe48vjChs2RJTkaFlZoznXA0mOGoWrfuAsif3Dr40vte/WFEkKjQsZD/U4bYXH5ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793560;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b7Wi/6ZDmxYKqHTLqZCINBNqiHTmjIEfH93pIzChtsk=;
	b=k0DcVyKT9JgcsGw4Zpnz+1ZF7EXkv0c/TgmwRR3wZfeMHjvFjFiXz3f0h7X5deU9Ditb
	 cdTLMTyO9BeNYQuLe5vQi7hlyaR0EdBXRWKQtRK2zrFvyua+hjTQZU1KxGl8V70AVWMKN
	 fFyd/g1EKEAasqacDTvKbMJHVoNyrXuV18uXn0K1MlousPzkS7bG8dDtSIv75bLs6KOK6
	 R4N2NtsXAr6iYnO7G9iHjkPRiCA717G1ZPJyatW0jof18/PeG2aV3uB4aiMPdtBMsqDOJ
	 71vuj5Gu7A0NymjVqMKx3dpBkdHZ+LJ6b3kgoonfENAB2727Ww7faXvID6ob5kTL22w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KKOt1RaS;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818C6606A31C;
	Mon, 16 Nov 2026 01:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KKOt1RaS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=KKOt1RaSByzIJZcanf9SxY+TRbUvefLBdbtve03YLZ3X/iftl4PDK8YpdBSWbfAvLOCDhPvcipFUF
	 2ixNdS5Tr21dmNanaH7sAIZEeWRMsnUt5P1jPeyfQ/EB/Y5rbvQvEjxAnTe2Oa72PHn2AJMeg+J356
	 GSjUQnNjecNa0Yfw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afa604b60b-99a7a;
	Mon, 16 Nov 2026 09:45:49 +0800 (CST)
X-RM-TRANSID:2ee86afa604b60b-99a7a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.net (unknown[112.23.105.204])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afa604b0d0-7759e;
	Mon, 16 Nov 2026 09:45:49 +0800 (CST)
X-RM-TRANSID:2ee56afa604b0d0-7759e
From: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
To: netdev-bot+sashiko@kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunwenbo@cmss.chinamobile.com,
	1342116488@qq.com
Subject: Re: [PATCH net-next] ipv6: check mc_forwarding before calling ip6mr_get_route()
Date: Mon, 16 Nov 2026 09:45:28 +0800
Message-Id: <20261116014528.17713-1-sunwenbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <179473722928.2199510.16768078668045707324@kernel.org>
References: <20261111094528.425826-1-sunwenbo@cmss.chinamobile.com> <179473722928.2199510.16768078668045707324@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the detailed review comments. Please note that a 2-patch v2
series was already posted prior to this message [1]; below is a detailed
root-cause analysis, our modification plan, and the UML reproduction and
verification results for the upcoming v3 series:

1. Root-Cause Analysis:

   (a) [Medium 1] Returning -EMSGSIZE when mc_forwarding != 0 (skb->dev == NULL):

       In inet6_rtm_getroute(), `dev = dev_get_by_index_rcu(net, iif)` is only
       used for ip6_route_input_lookup(), and `skb->dev` is never assigned on
       the newly allocated reply skb (`skb = alloc_skb(NLMSG_GOODSIZE, ...)`).
       In addition, `rt = dst_rt6_info(skb_dst(skb))` is the per-CPU route
       initialized by ip6_rt_copy_init() from `f6i->fib6_dst` (the `ff00::/8`
       prefix installed by addrconf_add_mroute()) rather than the queried
       (S,G). Consequently, on a cache miss in ip6mr_get_route(), `skb->dev` is
       NULL regardless of `mc_forwarding` and ip6mr_get_route() returns
       -ENODEV, which v1 mapped to -EMSGSIZE at `nla_put_failure`.

       In the v2 series [1], patch 2/2 ("ipv6: preserve ip6mr_get_route() error
       in rt6_fill_node()") already implements the error-preservation approach
       mentioned in the review: instead of overwriting negative errors from
       ip6mr_get_route() with -EMSGSIZE, rt6_fill_node() preserves and returns
       the negative error (such as -ENODEV). Note that simply assigning
       `skb->dev = dev` in inet6_rtm_getroute() without reworking
       ip6mr_get_route() would not be safe on its own: on an unresolved cache
       miss, ip6mr_get_route() allocates a 40-byte `skb2` (`sizeof(struct
       ipv6hdr)`) without a netlink header and queues it onto `nl_queries`,
       where ip6mr_destroy_unres() / ip6mr_cache_resolve() later pull
       `sizeof(struct ipv6hdr)` and write `struct nlmsghdr` into an empty skb
       (while inet6_rtm_getroute() also lacks `err == 0` handling and would
       send an unfinalized reply skb without nlmsg_end()).

       In v3, we also refine the commit message of patch 1/2 so it does not
       imply `skb->dev == NULL` is caused by `mc_forwarding == 0`.

   (b) [Medium 2] Excluding interface-local / link-local multicast and checking
       `dest` instead of `rt6_dst->addr`:

       This is a valid gap still present in v2. IPv4 rt_fill_info() guards
       ipmr_get_route() with `!ipv4_is_local_multicast(dst)` alongside
       `IPV4_DEVCONF_ALL_RO(net, MC_FORWARDING)`. Likewise, IPv6 ip6_mc_input()
       never forwards groups matching `(IPV6_ADDR_LOOPBACK |
       IPV6_ADDR_LINKLOCAL)` (i.e. interface-local / node-local `ff01::/16` and
       link-local `ff02::/16`), so no MFC state can ever exist for them.

       Furthermore, in normal route-get queries (`!fibmatch`), `rt6_dst->addr`
       is the matched FIB6 prefix `ff00::` (from `ff00::/8`), whose scope is 0,
       while the queried group address is passed in `dest` (`&fl6.daddr`). In
       `fibmatch` queries (`dest == NULL`), `&rt6_dst->addr` holds the route
       prefix. Therefore, checking `mc_dst = dest ? : &rt6_dst->addr` against
       `(IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)` is required so that
       interface-local and link-local multicast queries bypass
       ip6mr_get_route() and emit RTA_IIF even when `mc_forwarding != 0`.

   (c) [Low] Fixes tag / net vs net-next:

       Because this series aligns long-standing non-crash route-get reporting
       semantics with IPv4 (and full `mc_forwarding != 0` MFC lookup in
       inet6_rtm_getroute() + ip6mr_get_route() remains a separate topic), we
       target net-next without Fixes tags. If maintainers prefer targeting net
       with Fixes tags, we will be happy to adjust.

2. Concrete Modification Plan (v3 Series):

   Update patch 1/2 in `rt6_fill_node()` (`net/ipv6/route.c`) to inspect
   `mc_dst = dest ? : &rt6_dst->addr` and exclude `IPV6_ADDR_LOOPBACK |
   IPV6_ADDR_LINKLOCAL` before calling `ip6mr_get_route()` (and drop Hangbin's
   Reviewed-by tag on patch 1/2 since its code changes, while keeping it on
   unchanged patch 2/2):

   ```c
	if (iif) {
#ifdef CONFIG_IPV6_MROUTE
		const struct in6_addr *mc_dst = dest ? : &rt6_dst->addr;

		if (ipv6_addr_is_multicast(mc_dst) &&
		    !(ipv6_addr_type(mc_dst) &
		      (IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)) &&
		    atomic_read(&net->ipv6.devconf_all->mc_forwarding)) {
			int ret = ip6mr_get_route(net, skb, rtm, portid);

			if (ret == 0)
				return 0;
			if (ret < 0) {
				err = ret;
				goto nla_put_failure;
			}
		} else
#endif
			if (nla_put_u32(skb, RTA_IIF, iif))
				goto nla_put_failure;
	}
   ```

3. Reproduction & Verification Steps and Results (UML):

   Setup in UML (`CONFIG_IPV6_MROUTE=y`):
     ip link add d0 type veth peer name d1
     ip link set d0 up && ip link set d1 up
     ip -6 addr add 2001:db8::2/64 dev d0
     ip -6 addr add ff0e::1 dev d0 autojoin

   To test `mc_forwarding=1`, a helper (`test_mc_err`) opens an `AF_INET6`
   `SOCK_RAW` (`IPPROTO_ICMPV6`) socket, enables `setsockopt(..., MRT6_INIT,
   &one, sizeof(one))`, verifies `/proc/sys/net/ipv6/conf/all/mc_forwarding` is
   `1`, and runs `ip -6 route get ... iif d0`:

   - Before v3 (with v2 applied, `mc_forwarding=1` via `MRT6_INIT`):
     * `ip -6 route get ff0e::1 from 2001:db8::3 iif d0`
       -> `RTNETLINK answers: No such device` (`-ENODEV`, preserved by 2/2)
     * `ip -6 route get ff02::1 from 2001:db8::3 iif d0`
       -> `RTNETLINK answers: No such device` (`ip_exit=512`, FAIL: entered
          `ip6mr_get_route()` for link-local multicast)
     * `ip -6 route get ff01::1 from 2001:db8::3 iif d0`
       -> `RTNETLINK answers: No such device` (`ip_exit=512`, FAIL: entered
          `ip6mr_get_route()` for interface-local multicast)

   - With v3 applied:
     * Test 1 (`mc_forwarding=0`, routable `ff0e::1` with `iif d0`):
       `ff0e::1 dev d0 proto kernel metric 256 iif d0 pref medium` (PASS)
     * Test 2 (`mc_forwarding=1`, routable `ff0e::1` without VIF/cache):
       `RTNETLINK answers: No such device` (`-ENODEV`, PASS)
     * Test 3 (`mc_forwarding=1`, link-local `ff02::1` with `iif d0`):
       `multicast ff02::1 dev d0 proto kernel metric 256 iif d0 pref medium`
       (`ip_exit=0`, PASS)
     * Test 4 (`mc_forwarding=1`, interface-local `ff01::1` with `iif d0`):
       `multicast ff01::1 dev d0 proto kernel metric 256 iif d0 pref medium`
       (`ip_exit=0`, PASS)
     * Tests 5-7 (IPv6 unicast with `iif`, IPv6 multicast without `iif`, and
       IPv4 `224.0.0.1` / `239.1.1.1` with `iif` regressions): all PASS
       (`FAILURES=0, TEST_EXIT_CODE=0`).

[1] https://lore.kernel.org/netdev/20261112094630.197244-1-sunwenbo@cmss.chinamobile.com/

Thanks,
Wenbo

pw-bot: cr


