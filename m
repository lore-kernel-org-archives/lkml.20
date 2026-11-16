Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793685;
	b=b8vN07F2rnXDe+bXQ4PX/d2G+RGPDkVTOBzjPou5i/FPIutNxpQen3ux+ekYenLPCy/Q
	 kF/rGg6UnibQFMg0GimKv1YLkVU4L7V4x8dEQ6FNM8+F2CUoSPt4XlEWW2p4S0hK65QW7
	 ackXj5HQvHzcJTIeLoNVDG4Va7ykotBEe6EoUbBywCYCuixfOqAKM5WJ60Qpu3xB0dmAU
	 0ouNtSY8dcHV4n+qnsYGTf+1V8oKMutcw2/sd0+rJQFmbhSu95M+7E4lZQsxqlkU3M2BK
	 PA891ay58OP8yxaxFKcpLDoTPooqmymmwA/8WZMcMHmTR8qt4tlYHj+uXaZpBoJ9U+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793685;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/nwHSgmULD7w39MCVwYL6c8RIu9ZjvKKhOiW+6dDf6A=;
	b=3BPza5PfVtqJ2/x1WespVm5sTCFst12+4hC73zHSyv8hImZlA2/ZFLRYGiq8Uw6uoV4v
	 /2Bt0Jlc23uCfEe3A06gxu6guKRPi+fwNAYaHn6E0Z/BP+8VzoUVS0zGR98g6uQ9xNSLS
	 L16L4Pn8Os46MN5oMYFHsSIm9j0/Am9TpGVAeZNyQJnHwve/3CQq8GMnT0onKu/BpFxa/
	 z4fmHYRQh/PWdBFGH4oCWqVzwnouVNBp1UFCQ21sQyUQirkHiS7UatSNzPwoKEHYFWcTX
	 Y8I+RjexWVqhlk+3Ba7IlUMBxR2k6LX6YdR3KMpyza9SGEr/cN7X0IGnltfDvVAkyJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=bQ2YaFLj;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AB8606A31F;
	Mon, 16 Nov 2026 01:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AB8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=bQ2YaFLj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=bQ2YaFLjoRVgsgwi8R8prqEzQn1s0bwikfK0pqTMpT8lIqQspW0suY3lmKXbPXQzfw9x4LE1/OkP8
	 3/dRNqWnBfmq03BLZqcmkyNSN1/6zVF6zHRUNzkznel5Lbg7OsDLyU8fQ3IXsEKKuZ4Uoy4ezaP3M5
	 u5MOOI5saNSang4I=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afa60d388c-99a79;
	Mon, 16 Nov 2026 09:48:03 +0800 (CST)
X-RM-TRANSID:2ee46afa60d388c-99a79
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.net (unknown[223.64.115.200])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afa60d087e-7782a;
	Mon, 16 Nov 2026 09:48:02 +0800 (CST)
X-RM-TRANSID:2ee66afa60d087e-7782a
From: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunwenbo@cmss.chinamobile.com,
	1342116488@qq.com
Subject: [PATCH net-next v3 0/2] ipv6: fix rt6_fill_node() multicast route query handling
Date: Mon, 16 Nov 2026 09:47:42 +0800
Message-Id: <20261116014744.18223-1-sunwenbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
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

When querying an IPv6 multicast route with an input interface (RTA_IIF),
rt6_fill_node() currently calls ip6mr_get_route() unconditionally and
masks any negative error returned by ip6mr_get_route() with -EMSGSIZE at
nla_put_failure.

Patch 1 checks mc_forwarding and excludes interface-local and link-local
multicast destinations (checking dest when available, otherwise
rt6_dst->addr) before calling ip6mr_get_route(), aligning with IPv4
rt_fill_info() and IPv6 ip6_mc_input() so queries fall back to reporting
RTA_IIF and normal route attributes.

Patch 2 preserves the negative error returned by ip6mr_get_route()
instead of overwriting it with -EMSGSIZE when multicast forwarding is
enabled.

Changes in v3:
- In patch 1, also exclude interface-local (IPV6_ADDR_LOOPBACK) and
  link-local (IPV6_ADDR_LINKLOCAL) multicast by checking
  `dest ? : &rt6_dst->addr`, as pointed out by Sashiko review, and drop
  Hangbin Liu's Reviewed-by tag on patch 1 due to the code change.
- Clarify patch 1 commit message regarding skb->dev in
  inet6_rtm_getroute() and add UML test coverage for ff02::1 and ff01::1
  with MRT6_INIT enabled.
- Carry Hangbin Liu's Reviewed-by on unchanged patch 2.
- Link to v2: https://lore.kernel.org/netdev/20261112094630.197244-1-sunwenbo@cmss.chinamobile.com/

Changes in v2:
- Reword patch 1 commit message for clearer tone.
- Add patch 2 to preserve negative errors returned by ip6mr_get_route()
  instead of returning -EMSGSIZE from nla_put_failure, with
  Suggested-by: Hangbin Liu <liuhangbin@kylinos.cn>.
- Verify both mc_forwarding=0 and mc_forwarding=1 (MRT6_INIT) cases in
  a UML kernel alongside W=1 builds on UML, x86_64 allmodconfig, and
  x86_64 allyesconfig.
- Link to v1: https://lore.kernel.org/netdev/20261111094528.425826-1-sunwenbo@cmss.chinamobile.com/

Wenbo Sun (2):
  ipv6: check mc_forwarding before calling ip6mr_get_route()
  ipv6: preserve ip6mr_get_route() error in rt6_fill_node()

 net/ipv6/route.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

-- 
2.33.0



