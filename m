Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331773;
	b=owTqE7uOvYHIqLIF4o61lUy5cXPntpwXoPbWlunWgUnxAYcgB//l/i+feiBig89TQpEY
	 nORjbOQIsWMq3431cLlyEz0apQYRrg6YTMj2OadP++m/aJoWRH6Cjk6iCScI2WhgP9RiD
	 WUOP6V5isewnqysB9etpFCtyIc/dn4i1rcrlGrBcrNg8GWFcF1n3ygd+AY3zTt7hivcY6
	 w9A9ORC6HfeqluFf9FBvVB9mgyr4rc6BYg6zHzWp0Kl5IiPYvyCiZeoOaaeIu3fS1Mpwg
	 gf6+KloxIj+dJX0TZJzLmpi5Q7kEGZLNv82LUhtOSAES3LfFDGomEpQfz1Z2Zo9zhWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u7j/C8xOjK1PHdAV1CJRzOiMQIPuYMRbIXTihi5NWIg=;
	b=wbPncnKempSNVUh+glWHGwMNlF01T77/hJyLl7myOUvU//MCddvx8dXC7BNfxYt3TMFE
	 FuxH2dCfhezFR3TBC+EPh1JyDd+UBrPjPSyf7l893p1X4xq4PgReCXqytdICK2RR/tTKW
	 UYUjpOAjURq3lz+/+LED00aDBknwMa5HhNSYP1mvs6dZUJh3fD9h4T7KT1nqLlSIniga1
	 yEatTnCjxxE8T8MzNINPoUtcnP0jyTQLQe10MT7rUfAxv62SwGvQQHjxLisIAiNOHNefk
	 U8ey/NcR74eA1OCte1Kujkl2CMHnBdAHuQBdF+9a51q9626oYPm7NnOkzNrgzNEeYNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K8svwTEZ;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B460A2612
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30B460A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K8svwTEZ
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b6b22be970so891712b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794331772; x=1794936572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7j/C8xOjK1PHdAV1CJRzOiMQIPuYMRbIXTihi5NWIg=;
        b=K8svwTEZd2HRzzn1CnYxhrOi/3XxGADM0ZIAURO93se/tbSpcD6bfCGozhZQvRZ960
         aVE+ONOLhxL236MdIchKlAyfSPNU5GFRD9DDWtl1tGMx100ZAN6lv9xuUa2h0oMrbB8M
         oisJBqykyqWQJoQLeJMTjRnvoXBMgV/aNAtqhlAirqAp/Ca76qJoSvC00Q0TScNeU2D6
         TfWB6W/FqyUu1ibul3a12P1+NWuRyb++I9CvfY+Vozo+HotPzXFBWiv4kQiSHGP75QXv
         QqjBthDU6OwsTcf4UWRvgMjod5srfOYtvt7SmpferJF2XQykWhLSah+08vIKIocpDdMf
         U1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331772; x=1794936572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7j/C8xOjK1PHdAV1CJRzOiMQIPuYMRbIXTihi5NWIg=;
        b=Ux1mgKB7xgtOSVoXWWr1SAmkRa4Y8qlsLprI71zeGfrCsNwm0Vc2pvKNbhuDUfUwvn
         2QemVTVa4MXlqt8jbsL/qDieepE/iSOX3fw3f8U1nH09x77phJXmbDzmlgp5FEbXo25a
         VrPFmqMU3A0fjAJJXqjD3G5ShfWi8/zgfRA6XfcdIBQTT4QZmev33lIGj/JOb3Q1NdlV
         c7pm32iGLDS9Ib7xggghPQM8zZAr6TgkjrcSkjuBgREHnbYJUNOWeVhVYIuSkPUpNHno
         /lzG1XGIFtrQGiLJZCGvWFOa9CziobDt6Xx7Zggq3TX499YbCQ0pvsW6poT7NnZU8hQg
         oV/A==
X-Forwarded-Encrypted: i=1; AL+hErFfkvWOGWhnFR3XMSAnJ2xRcfHMyMFJ1ggp1c60i9w9DTkUirVC+m2YRl93OpJgBIVbNMzPQ/LjWIqaDy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8devp64S/UrCBJJjkhOszunpOyuMOBo8fWiDMjOUDJgaicsgDG
	QrhUrDz89a2D0/w1xJIeiTtasFeUfXLMXhJDlvwrANjHJhOtG+4uLVE0vojMxxTfR3q/Lquf7JZ
	0cpydmMY=
X-Gm-Gg: AYBFou19tNs0T+PAh44VODSV2uSxm5pdY5OCyeKZEsdu9Ba+GDmssT7mcShwJVGKCSn
	X8o3V1bf6lTXos4HXTfLuFNApQYVS4XLAyeArm5Kd86SWyQE5gC/EQfETDpIRXib7ShYRL8/UlR
	H9sFjrrAEFLYwlLid40LibGVZAVWND4+bGp3aLimojGfdrnCYeM42grNNzMCUfxD3FvhtAuiD6D
	6658fjT4jWXHg0iJh7Z95hAgcqtNy5lYr3CRDx07dYwTHZJ/sCY7JI4H7vAZ6C4xi2e1sqlPzMx
	7Zt0R2LxbKlqC0WA4UadREFYe4ZGgec7xxMPSkZvdhqx71F6WpjzpQzzBvD1HGbuRZsA1WbQv80
	/h2MYDDS4kvSmVASDMALi6w7feWtPIe9xgkQa02A4oDorWMHPd/MVooWpCvCP5d+e/jNUG+CxIy
	PnHswQSGvn7s0PaW6zovqzDCqeIwZPeSTpx6fS7vTLE2F5ZQlAxpgXzZarn0ek3MOmjBTMoFNAv
	4ZxCGvTsFFOU0cFiTOJ8sYfg4oxGoMV3vKo/W3hwKyS4z4Jsk4k9werbVS4VFeNGIFI2n1VoqNY
	9hOAGR0Qq7NRfVb7eY3ABG1xWecSmPpbwwM+jvG88ZpkfMLt8eEV4L95yT86wKZgChQIGg==
X-Received: by 2002:a05:6a00:908d:b0:886:3a6c:a9da with SMTP id d2e1a72fcca58-8ba86b93834mr3122737b3a.26.1794331772149;
        Tue, 10 Nov 2026 09:29:32 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f1effsm1197939b3a.49.2026.11.10.09.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:29:31 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 3/3] selftests: net: netlink-dumps: test dump of route larger than skb
Date: Tue, 10 Nov 2026 09:26:18 -0800
Message-ID: <20261110172925.3293312-4-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110172925.3293312-1-stephen@networkplumber.org>
References: <20261110172925.3293312-1-stephen@networkplumber.org>
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

Add IPv4 and IPv6 multipath routes that do not fit in the first dump
skb of a fresh socket. The dump must return the route or fail with
-EMSGSIZE, not end with status 0.

IPv6 nexthops cannot use lo, so create a dummy device and generalize
lo_set_up() to if_set_up(). Add the IPv4 routing options to config.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 tools/testing/selftests/net/config          |   3 +
 tools/testing/selftests/net/netlink-dumps.c | 271 +++++++++++++++++++-
 2 files changed, 270 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index d4416f8bdcfd..e2f136274e6d 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -29,6 +29,8 @@ CONFIG_IP6_NF_MATCH_RPFILTER=m
 CONFIG_IP6_NF_NAT=m
 CONFIG_IP6_NF_RAW=m
 CONFIG_IP6_NF_TARGET_REJECT=m
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_IPTABLES_LEGACY=m
@@ -38,6 +40,7 @@ CONFIG_IP_NF_NAT=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_ROUTE_MULTIPATH=y
 CONFIG_IP_SCTP=m
 CONFIG_IPV6=y
 CONFIG_IPV6_FOU=m
diff --git a/tools/testing/selftests/net/netlink-dumps.c b/tools/testing/selftests/net/netlink-dumps.c
index 4a94a25167e2..43f63f3f2289 100644
--- a/tools/testing/selftests/net/netlink-dumps.c
+++ b/tools/testing/selftests/net/netlink-dumps.c
@@ -263,11 +263,11 @@ TEST(close_with_ref)
 	usleep(100 * 1000);
 }
 
-static int lo_set_up(int sock, bool up)
+static int if_set_up(int sock, const char *name, bool up)
 {
 	struct ifreq ifr = {};
 
-	strcpy(ifr.ifr_name, "lo");
+	strcpy(ifr.ifr_name, name);
 	if (ioctl(sock, SIOCGIFFLAGS, &ifr))
 		return -1;
 	if (up)
@@ -321,12 +321,12 @@ TEST(dump_with_queued_ntf)
 		       sizeof(addr)), 0);
 
 	// A large read makes the kernel attempt large dump skbs
-	ASSERT_EQ(lo_set_up(inet_sock, true), 0);
+	ASSERT_EQ(if_set_up(inet_sock, "lo", true), 0);
 	n = recv(netlink_sock, buf, sizeof(buf), 0);
 	ASSERT_GE(n, (ssize_t)sizeof(struct nlmsghdr));
 
 	// Leave one notification queued, then start the dump
-	ASSERT_EQ(lo_set_up(inet_sock, false), 0);
+	ASSERT_EQ(if_set_up(inet_sock, "lo", false), 0);
 	n = send(netlink_sock, &dump_links, sizeof(dump_links), 0);
 	ASSERT_EQ(n, sizeof(dump_links));
 
@@ -362,4 +362,267 @@ TEST(dump_with_queued_ntf)
 	close(inet_sock);
 }
 
+#define BIG_RT_TABLE	100
+#define BIG_RT_IFINDEX	100
+#define BIG_RT4_NH	1500
+#define BIG_RT6_NH	500
+
+static const struct {
+	struct nlmsghdr nlhdr;
+	struct ifinfomsg ifm;
+	struct nlattr name_hdr;
+	char name[8];
+	struct nlattr linkinfo_hdr;
+	struct nlattr kind_hdr;
+	char kind[8];
+} new_dummy = {
+	.nlhdr = {
+		.nlmsg_len	= sizeof(new_dummy),
+		.nlmsg_type	= RTM_NEWLINK,
+		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
+				  NLM_F_EXCL,
+		.nlmsg_seq	= 1,
+	},
+	.ifm = {
+		.ifi_family	= AF_UNSPEC,
+		.ifi_index	= BIG_RT_IFINDEX,
+	},
+	.name_hdr = {
+		.nla_len	= 4 + sizeof("dummy0"),
+		.nla_type	= IFLA_IFNAME,
+	},
+	.name = "dummy0",
+	.linkinfo_hdr = {
+		.nla_len	= 4 + 4 + 8,
+		.nla_type	= IFLA_LINKINFO,
+	},
+	.kind_hdr = {
+		.nla_len	= 4 + sizeof("dummy"),
+		.nla_type	= IFLA_INFO_KIND,
+	},
+	.kind = "dummy",
+};
+
+static struct {
+	struct nlmsghdr nlhdr;
+	struct rtmsg rtm;
+	struct nlattr dst_hdr;
+	__u8 dst[4];
+	struct nlattr table_hdr;
+	__u32 table;
+	struct nlattr mp_hdr;
+	struct rtnexthop nh[BIG_RT4_NH];
+} new_route4 = {
+	.nlhdr = {
+		.nlmsg_len	= sizeof(new_route4),
+		.nlmsg_type	= RTM_NEWROUTE,
+		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
+				  NLM_F_EXCL,
+		.nlmsg_seq	= 1,
+	},
+	.rtm = {
+		.rtm_family	= AF_INET,
+		.rtm_dst_len	= 24,
+		.rtm_protocol	= RTPROT_STATIC,
+		.rtm_scope	= RT_SCOPE_LINK,
+		.rtm_type	= RTN_UNICAST,
+	},
+	.dst_hdr = {
+		.nla_len	= 4 + 4,
+		.nla_type	= RTA_DST,
+	},
+	.dst = { 198, 51, 100, 0 },
+	.table_hdr = {
+		.nla_len	= 4 + 4,
+		.nla_type	= RTA_TABLE,
+	},
+	.table = BIG_RT_TABLE,
+	.mp_hdr = {
+		.nla_len	= 4 + sizeof(new_route4.nh),
+		.nla_type	= RTA_MULTIPATH,
+	},
+};
+
+struct rtnexthop6 {
+	struct rtnexthop rtnh;
+	struct nlattr gw_hdr;
+	__u8 gw[16];
+};
+
+static struct {
+	struct nlmsghdr nlhdr;
+	struct rtmsg rtm;
+	struct nlattr dst_hdr;
+	__u8 dst[16];
+	struct nlattr table_hdr;
+	__u32 table;
+	struct nlattr mp_hdr;
+	struct rtnexthop6 nh[BIG_RT6_NH];
+} new_route6 = {
+	.nlhdr = {
+		.nlmsg_len	= sizeof(new_route6),
+		.nlmsg_type	= RTM_NEWROUTE,
+		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE |
+				  NLM_F_EXCL,
+		.nlmsg_seq	= 1,
+	},
+	.rtm = {
+		.rtm_family	= AF_INET6,
+		.rtm_dst_len	= 64,
+		.rtm_protocol	= RTPROT_STATIC,
+		.rtm_scope	= RT_SCOPE_UNIVERSE,
+		.rtm_type	= RTN_UNICAST,
+	},
+	.dst_hdr = {
+		.nla_len	= 4 + 16,
+		.nla_type	= RTA_DST,
+	},
+	.dst = { 0x20, 0x01, 0x0d, 0xb8 }, // 2001:db8::/64
+	.table_hdr = {
+		.nla_len	= 4 + 4,
+		.nla_type	= RTA_TABLE,
+	},
+	.table = BIG_RT_TABLE,
+	.mp_hdr = {
+		.nla_len	= 4 + sizeof(new_route6.nh),
+		.nla_type	= RTA_MULTIPATH,
+	},
+};
+
+static struct {
+	struct nlmsghdr nlhdr;
+	struct rtmsg rtm;
+} dump_routes = {
+	.nlhdr = {
+		.nlmsg_len	= sizeof(dump_routes),
+		.nlmsg_type	= RTM_GETROUTE,
+		.nlmsg_flags	= NLM_F_REQUEST | NLM_F_DUMP,
+		.nlmsg_seq	= 2,
+	},
+	.rtm = {
+		.rtm_table	= BIG_RT_TABLE,
+	},
+};
+
+static int nl_request_ack(int sock, const void *req, size_t len)
+{
+	struct nlmsghdr *nlh;
+	char buf[4096];
+	ssize_t n;
+
+	if (send(sock, req, len, 0) != (ssize_t)len)
+		return -errno;
+	n = recv(sock, buf, sizeof(buf), 0);
+	if (n < 0)
+		return -errno;
+	nlh = (struct nlmsghdr *)buf;
+	if (!NLMSG_OK(nlh, n) || nlh->nlmsg_type != NLMSG_ERROR)
+		return -EPROTO;
+	return *(int *)NLMSG_DATA(nlh);
+}
+
+// Dump table BIG_RT_TABLE on a fresh socket, so the first dump skb is
+// small, and count routes. The table holds only one route, too large for
+// that skb. Returns the status from NLMSG_DONE or NLMSG_ERROR.
+static int dump_big_table(struct __test_metadata *_metadata, int family,
+			  int *routes)
+{
+	int netlink_sock, i, ret = 1;
+	char buf[32768];
+	int one = 1;
+	ssize_t n;
+
+	netlink_sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
+	ASSERT_GE(netlink_sock, 0);
+	ASSERT_EQ(setsockopt(netlink_sock, SOL_NETLINK, NETLINK_GET_STRICT_CHK,
+			     &one, sizeof(one)), 0);
+
+	dump_routes.rtm.rtm_family = family;
+	n = send(netlink_sock, &dump_routes, sizeof(dump_routes), 0);
+	ASSERT_EQ(n, sizeof(dump_routes));
+
+	*routes = 0;
+	for (i = 0; i < 100 && ret > 0; i++) {
+		struct nlmsghdr *nlh;
+
+		n = recv(netlink_sock, buf, sizeof(buf), 0);
+		ASSERT_GE(n, 0);
+
+		for (nlh = (struct nlmsghdr *)buf; NLMSG_OK(nlh, n);
+		     nlh = NLMSG_NEXT(nlh, n)) {
+			if (nlh->nlmsg_type == RTM_NEWROUTE)
+				(*routes)++;
+			if (nlh->nlmsg_type == NLMSG_DONE ||
+			    nlh->nlmsg_type == NLMSG_ERROR) {
+				ret = *(int *)NLMSG_DATA(nlh);
+				break;
+			}
+		}
+	}
+	EXPECT_LE(ret, 0);
+
+	close(netlink_sock);
+	return ret;
+}
+
+// A route that doesn't fit in the first dump skb must either be dumped or
+// end the dump with EMSGSIZE. It must not end the dump as if complete.
+TEST(dump_large_route)
+{
+	int netlink_sock, inet_sock, i, ret, routes;
+
+	ret = unshare(CLONE_NEWNET);
+	if (ret && errno == EPERM)
+		SKIP(return, "Needs CAP_SYS_ADMIN for a netns");
+	ASSERT_EQ(ret, 0);
+
+	inet_sock = socket(AF_INET, SOCK_DGRAM, 0);
+	ASSERT_GE(inet_sock, 0);
+	netlink_sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
+	ASSERT_GE(netlink_sock, 0);
+
+	ret = nl_request_ack(netlink_sock, &new_dummy, sizeof(new_dummy));
+	if (ret == -EOPNOTSUPP)
+		SKIP(return, "Needs CONFIG_DUMMY");
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(if_set_up(inet_sock, "lo", true), 0);
+	ASSERT_EQ(if_set_up(inet_sock, "dummy0", true), 0);
+
+	for (i = 0; i < BIG_RT4_NH; i++) {
+		new_route4.nh[i].rtnh_len = sizeof(new_route4.nh[i]);
+		new_route4.nh[i].rtnh_ifindex = 1; // lo
+	}
+	ASSERT_EQ(nl_request_ack(netlink_sock, &new_route4,
+				 sizeof(new_route4)), 0);
+
+	for (i = 0; i < BIG_RT6_NH; i++) {
+		struct rtnexthop6 *nh = &new_route6.nh[i];
+
+		nh->rtnh.rtnh_len = sizeof(*nh);
+		nh->rtnh.rtnh_ifindex = BIG_RT_IFINDEX;
+		nh->gw_hdr.nla_len = sizeof(nh->gw_hdr) + sizeof(nh->gw);
+		nh->gw_hdr.nla_type = RTA_GATEWAY;
+		nh->gw[0] = 0xfe; // fe80::<i + 1>
+		nh->gw[1] = 0x80;
+		nh->gw[14] = (i + 1) >> 8;
+		nh->gw[15] = (i + 1) & 0xff;
+	}
+	ASSERT_EQ(nl_request_ack(netlink_sock, &new_route6,
+				 sizeof(new_route6)), 0);
+
+	// The ACK reads above used large buffers, which raise the dump
+	// skb size for this socket. Dump on fresh sockets instead.
+	close(netlink_sock);
+
+	ret = dump_big_table(_metadata, AF_INET, &routes);
+	if (ret != -EMSGSIZE)
+		EXPECT_EQ(routes, 1);
+
+	ret = dump_big_table(_metadata, AF_INET6, &routes);
+	if (ret != -EMSGSIZE)
+		EXPECT_EQ(routes, 1);
+
+	close(inet_sock);
+}
+
 TEST_HARNESS_MAIN
-- 
2.53.0

