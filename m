Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9AF4E021A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548707; cv=none; b=WIk1jrI2CeinpupZSLv3kiXRtztkAyjUYeK84TqYZhF8HRKmmNewi7AcOUfoWumfHMActZQdExeXAdXFKlnlJnHELI40UKKYn5jFicd9tWKc8oyyBRxPVlXBJpHbTfeEI8Foef0G2EOxpYzB7nIM41R+vbwJNYqUy0l6fJMU3AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548707; c=relaxed/simple;
	bh=bNRMeRSS2zeZl/TFXZo5Dn/7UPjVOtd2WRxC549kPzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRGgeQ1IWi60f5QTl/eo7rK5/6VGBhDAHzErIBealB+R9ErEH1mKDfCd9oeFT3XVPLF273CtUBEK2ptHPr/VlrovsmRGBQ1X8qeVHwpbo/UcinqdbrDB3SwKGd8h91r988O3Wogl5zPEOKeT7ftC4M5d1a+3KZru40C0jfWi53w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=RiknP3a3; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="RiknP3a3"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3a8c118e711so1488365a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548696; x=1792153496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBw6Y/BGPzJ2Cx3Et/3lme3MwU7zySJizDRZzvVU+T0=;
        b=RiknP3a3g+Xo3ruK0RhuMfi4RvPiHvVGAPqDgWk98wbPe/f29BbwQDGIAGADbQYoye
         JQbMgWf5Lgea5uBRqB+eiKjFkx7mSMoRZF3TnEocv7OgXllJ2okEgXvQOmn0KfQ5Pvsc
         I8MJc2xqGuW16203yw0sbk4aeNzUCc973XOp2mlFxylKcXcBkUU/PC2C9fzmnZwBPVLe
         hFkS0r1AdKsKl17tGIomCXIFR0heDeHzANmrRsvpX+11KgP6Yn1CRlXAqXXe0F6p0u6T
         X4hN1v08Ho5RJbQFuTeanUmhO7Eu+jxw+oppeRVLyxDX64iH5KU0WTd+3sip+6v5Moi6
         MIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548696; x=1792153496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jBw6Y/BGPzJ2Cx3Et/3lme3MwU7zySJizDRZzvVU+T0=;
        b=W4v6k7r9qKPqJP4cOf27PkW17nUDefW91oOVAsVyh7rTgl86uRX9oAxZUh/HkgBrfk
         CeqXXlJAGJuWYGYZoWdOajI4SOyB7YUBGt3RYv8MfZbiHMLMe8P601JCyfmS2Ymq/G15
         jA6o+TepsptAG9sgGR+psplLeBwwT4zQJljvSV4GLe8FjGOpDGz7TKKypPNhXVXX4q9s
         JV01R9v7VJaUwcn384u4KGDdcZsvLpo53xVnEgImgmee44vARVLperpDCvrSooHYxz3p
         GkLQh2gGmuiBN7APEr+N+WATHAl+3JoISzPfMyEdMIF3gNvdWqYlayQ23LE4mgiV6vKO
         3DMw==
X-Forwarded-Encrypted: i=1; AKwUvByMWZOX3bFtDfUVa+ybEzetZFHfbPJxVr/PkTTavZolFdxqK7nk4tN0LdquikUB+G5EMJgftIKMv2inhWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWzSq9Z+Oy9O7KzIskhEyRk949K2qQvzvsLg0yXdLbxXYd0OCb
	Fv/vPosWDOnRzLWWziueiaxHLZOw4HLyR3EJd71OXPwgVy3oD90JkTUTeaT5oWVJtJM=
X-Gm-Gg: AYBFou26yQnKMVz+7CQZmCfN2GffoIpqh3H/ZpdpJrnRMsXD9iKq0cY3bNCLXyzW7aq
	pvUPsT/CgskJuocW3qL5uEuLOopzYqp3OYPzDqTP7WrttwKDPD1HdscDHSZLH/xSw6klHe5aKp/
	DHBlF2syB8kWeEJXQ0+ENAB/3dJnEVA1XQQlG+UfcHniiCflb5YU0oYXXnFt9o9rLFAMp5bVTdO
	HVbHsgTR5mHLkX8P8N1RlSFgAPu3UgWvg5+hWZedFPFGSmyYFeDQBzhu2Ne3TjrJ8EH0nVITMQd
	1oGzGB3pXlU2otxQtBKx9+jEYFam2E4aI4TYBRYivmPQyoFuPZpbe8a1adoiyPm4SRAoqG/YrHU
	9QXddE6+VVHJuYUsRpiigzyewzOy6P0zYMBrhWoGkTxvkL75i5ErWX4o02BrzN2ZVoI5DI47uqq
	W2yXBFScrBrqJ5w6l/wD9U1+b0D+6BQIj5tdf5KLXtjKPGM801rYItRZaHVMilsYBOr+sfMVOiv
	km3oqILdy5XymnSs8gBJ/Ct5EchM4znOAlnEXJdOWTNVrKpS5Q=
X-Received: by 2002:a17:90b:3b82:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ab3a94f426mr1862537a91.24.1791548695804;
        Fri, 09 Oct 2026 05:24:55 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:55 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 13/13] selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes
Date: Fri,  9 Oct 2026 12:24:26 +0000
Message-ID: <20261009122426.551178-14-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122426.551178-1-omar@blockcast.net>
References: <20261009122426.551178-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_v6.sh builds a gateway and a relay over an IPv6 outer transport and
checks the data plane, but only with valid attributes. The link-creation
rules this series adds for IFLA_AMT_LOCAL_IP6 and IFLA_AMT_DISCOVERY_IP6
are not exercised.

This adds a small companion without a data plane: no relay, socat or
smcroute. It checks that the IPv6 local and discovery addresses of a
gateway, and the local address of a relay, read back through
amt_fill_info(), that a relay reports no discovery address, that an
IPv4 gateway still creates and reports its IPv4 discovery address, and
that an IPv4 relay still accepts the IPv4 discovery address it has
always ignored. It then checks each rejection: a gateway without a
discovery address, a gateway whose local and discovery addresses differ
in family (both ways), an IPv6 relay given a discovery address of either
family, an IPv4 relay given an IPv6 one, and an unspecified, loopback,
multicast or IPv4-mapped IPv6 local or discovery address. Each rejection
is matched on its extack message as well as on the failure, so a rule
that fails for the wrong reason is not a pass.

Besides the duplicate arguments its header names, a 16-byte
IFLA_AMT_LOCAL_IP or IFLA_AMT_DISCOVERY_IP is not built: an iproute2
with IPv6 support never sends one. An older iproute2 puts the whole
16-byte literal into the IPv4 attribute, which a kernel without this
series reads as an IPv4 address from its first four bytes (32.1.13.184
for 2001:db8:a::2), so the probe checks the readback as well as the
result. This kernel refuses it ("IPv6 address in an IPv4 attribute"),
which is logged as a passing test before the probe skips. The probe
skips on an iproute2 that rejects the literal, on a kernel that ignores
the attributes ("Local attribute is required"), and on a kernel without
IPv6 ("IPv6 support is disabled", or no /proc/net/if_inet6); any other
failure to create the probe link is a FAIL.

The script uses lib.sh: setup_ns for the namespace, check_err and
log_test for reporting, and $ksft_skip when a prerequisite is missing.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 tools/testing/selftests/net/Makefile     |   1 +
 tools/testing/selftests/net/amt_gw_v6.sh | 204 +++++++++++++++++++++++
 2 files changed, 205 insertions(+)
 create mode 100755 tools/testing/selftests/net/amt_gw_v6.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index efdc77b..4212915 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -9,6 +9,7 @@ CFLAGS += -I../
 TEST_PROGS := \
 	altnames.sh \
 	amt.sh \
+	amt_gw_v6.sh \
 	amt_v6.sh \
 	arp_ndisc_evict_nocarrier.sh \
 	arp_ndisc_untracked_subnets.sh \
diff --git a/tools/testing/selftests/net/amt_gw_v6.sh b/tools/testing/selftests/net/amt_gw_v6.sh
new file mode 100755
index 0000000..c18ceff
--- /dev/null
+++ b/tools/testing/selftests/net/amt_gw_v6.sh
@@ -0,0 +1,204 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Netlink coverage for the AMT IPv6 attributes, IFLA_AMT_LOCAL_IP6 and
+# IFLA_AMT_DISCOVERY_IP6, and the rules that validate them. amt_v6.sh covers
+# the data plane; this needs only one netns and one dummy device.
+#
+# Not covered: `discovery <v4>` together with `discovery <v6>`, or `local <v4>`
+# together with `local <v6>`, in one command. iproute2 rejects the duplicate
+# argument itself, so those checks are reachable only from a raw netlink
+# client.
+
+source lib.sh
+
+readonly V6_LOCAL="2001:db8:a::1"
+readonly V6_DISC="2001:db8:a::2"
+readonly V4_LOCAL="192.168.0.1"
+readonly V4_DISC="192.168.0.2"
+
+# add_amt <name> <args...>: create an amt link on gw_dev, stderr in $ADD_ERR.
+add_amt()
+{
+	local name=$1; shift
+
+	ADD_ERR=$(ip -n "$GW" link add "$name" type amt dev gw_dev "$@" 2>&1)
+}
+
+# amt_field <name> <key>: one attribute as amt_fill_info reports it.
+amt_field()
+{
+	ip -n "$GW" -d -j link show "$1" 2>/dev/null |
+		jq -r ".[0].linkinfo.info_data.$2 // empty"
+}
+
+# An iproute2 without IFLA_AMT_DISCOVERY_IP6 may not reject `discovery
+# <v6>`: it can pack the literal into IFLA_AMT_DISCOVERY_IP, which this
+# kernel refuses and an older one turns into a v4 gateway from the first
+# four bytes. So probe on the readback, not only on the exit code. A
+# kernel without the IPv6 attributes ignores them and asks for a local
+# address. Skip in those cases only; any other failure is a failure of the
+# code under test.
+probe_v6_gateway()
+{
+	local got
+
+	if ! add_amt amtprobe mode gateway local "$V6_LOCAL" \
+	     discovery "$V6_DISC"; then
+		case "$ADD_ERR" in
+		*"IPv6 address in an IPv4 attribute"*)
+			# An older iproute2 on this kernel: the rule that
+			# refuses the 16-byte IPv4 attribute is what ran.
+			RET=0
+			log_test "16-byte IPv4 address attribute is refused"
+			echo "SKIP: iproute2 lacks IPv6 AMT support"
+			exit "$ksft_skip"
+			;;
+		*"Local attribute is required"*|*"expected rather than"*|\
+		*"IPv6 support is disabled"*)
+			echo "SKIP: no IPv6 AMT support: $ADD_ERR"
+			exit "$ksft_skip"
+			;;
+		esac
+		echo "FAIL: cannot create an IPv6 gateway: $ADD_ERR"
+		exit "$ksft_fail"
+	fi
+	got=$(amt_field amtprobe discovery)
+	ip -n "$GW" link del amtprobe
+	if [[ "$got" != *:* ]]; then
+		# A kernel with the IPv6 attributes names the missing
+		# discovery address this way, and must have refused the
+		# 16-byte IPv4 attribute that an older iproute2 sent.
+		add_amt amtprobe mode gateway local "$V4_LOCAL"
+		ip -n "$GW" link del amtprobe 2>/dev/null
+		if [[ "$ADD_ERR" == *"of the local family is required"* ]]; then
+			echo "FAIL: 16-byte IPv4 attribute read back as '$got'"
+			exit "$ksft_fail"
+		fi
+		echo "SKIP: iproute2 lacks IPv6 AMT support (read back '$got')"
+		exit "$ksft_skip"
+	fi
+}
+
+test_v6_gateway_roundtrip()
+{
+	RET=0
+	add_amt amtg6 mode gateway local "$V6_LOCAL" discovery "$V6_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtg6 discovery)" = "$V6_DISC" ] ||
+		check_err 1 "discovery did not read back as $V6_DISC"
+	[ "$(amt_field amtg6 local)" = "$V6_LOCAL" ] ||
+		check_err 1 "local did not read back as $V6_LOCAL"
+	ip -n "$GW" link del amtg6 2>/dev/null
+	log_test "v6 gateway: discovery round-trips through fill_info"
+}
+
+test_v6_relay_roundtrip()
+{
+	RET=0
+	add_amt amtr6 mode relay local "$V6_LOCAL"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtr6 local)" = "$V6_LOCAL" ] ||
+		check_err 1 "local did not read back as $V6_LOCAL"
+	[ -z "$(amt_field amtr6 discovery)" ] ||
+		check_err 1 "a relay reported a discovery address"
+	ip -n "$GW" link del amtr6 2>/dev/null
+	log_test "v6 relay: local round-trips, no discovery reported"
+}
+
+test_v4_gateway_unchanged()
+{
+	RET=0
+	add_amt amtg4 mode gateway local "$V4_LOCAL" discovery "$V4_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtg4 discovery)" = "$V4_DISC" ] ||
+		check_err 1 "discovery did not read back as $V4_DISC"
+	ip -n "$GW" link del amtg4 2>/dev/null
+	log_test "v4 gateway still creates (no ABI change)"
+}
+
+# An IPv4 relay has always ignored IFLA_AMT_DISCOVERY_IP, and still must.
+test_v4_relay_unchanged()
+{
+	RET=0
+	add_amt amtr4 mode relay local "$V4_LOCAL" discovery "$V4_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	ip -n "$GW" link del amtr4 2>/dev/null
+	log_test "v4 relay still accepts a v4 discovery (no ABI change)"
+}
+
+# expect_reject <description> <extack substring> <args...>: the create must
+# fail, and for the stated reason.
+expect_reject()
+{
+	local desc=$1 want=$2; shift 2
+
+	RET=0
+	add_amt amtbad "$@"
+	check_fail $? "link was created but should have been rejected"
+	ip -n "$GW" link del amtbad 2>/dev/null
+	grep -qi -- "$want" <<< "$ADD_ERR"
+	check_err $? "rejected for the wrong reason: $ADD_ERR"
+	log_test "$desc"
+}
+
+require_command jq
+if [ ! -e /proc/net/if_inet6 ]; then
+	echo "SKIP: the kernel has no IPv6"
+	exit "$ksft_skip"
+fi
+trap cleanup_all_ns EXIT
+setup_ns GW || exit "$ksft_skip"
+ip -n "$GW" link add gw_dev type dummy
+ip -n "$GW" link set gw_dev up
+
+probe_v6_gateway
+
+test_v6_gateway_roundtrip
+test_v6_relay_roundtrip
+test_v4_gateway_unchanged
+test_v4_relay_unchanged
+expect_reject "gateway without discovery is rejected" \
+	"Discovery attribute" \
+	mode gateway local "$V6_LOCAL"
+expect_reject "gateway v6 local + v4 discovery is rejected" \
+	"of the local family is required" \
+	mode gateway local "$V6_LOCAL" discovery "$V4_DISC"
+expect_reject "gateway v4 local + v6 discovery is rejected" \
+	"of the local family is required" \
+	mode gateway local "$V4_LOCAL" discovery "$V6_DISC"
+expect_reject "v6 discovery in relay mode is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V6_LOCAL" discovery "$V6_DISC"
+expect_reject "v4 discovery on a v6 relay is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V6_LOCAL" discovery "$V4_DISC"
+expect_reject "v6 discovery on a v4 relay is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V4_LOCAL" discovery "$V6_DISC"
+expect_reject "unspecified v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::
+expect_reject "v4-mapped v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::ffff:192.168.0.1
+expect_reject "loopback v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::1
+expect_reject "multicast v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ff02::1
+expect_reject "multicast v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ff02::1
+expect_reject "loopback v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::1
+expect_reject "unspecified v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::
+expect_reject "v4-mapped v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::ffff:192.168.0.2
+
+exit "$EXIT_STATUS"
-- 
2.43.0

