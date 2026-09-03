Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B648B38A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431763; cv=none; b=f0RcyRlVaYXBNcmZBmmkbiCKlrkOSlmXTBOLxm7Rej0s92we2bWIWdf29+Uu630GwM2AEJijBu8+3wTxBln1i7r7QU3rS6CTn8GQU0F+vPt3vDq9se6BpMrlLc+5ZbRC0iUsxw+utv6lv0/NHRYpv35IWMw/uuG5VtW1NFPCjN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431763; c=relaxed/simple;
	bh=oCZyy8cESa1CQw46kQlW92KVpEPUeUQ8pnzCsXZVcOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBzDNPcAhKLlmupGy0eMNO5uMLub6Dxzv4l9y9D5rtMsbymVMdb7fkPBL/PbwpvO/KWREqAcaddHweb2ZVqeCsbHoDQBuzqNTLuCWkEh6rIKtRPZIhpwI0KLkNpRbU9v2epKrCCbz4i1pFShOuEnirLjJufvpv2pjpTWMFqIUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=mIqdakbF; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="mIqdakbF"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 18E2344B99
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788431749;
	bh=pRApGfPAXtPOCs+RBxplz3SPHgBy4a8d2R4AbBpaGlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=mIqdakbFeFZuHZ8MMUgmrKIkGLoeyuVrA//XpCsooHxuv2GE1L/V8dsqlmF8kO5FJ
	 nN/Q8e/CohBUWGpOi0v54v+6dSN9B+CmrP2K3aP/kJ9EaCplfKJ4PNQjsN8NcKksiQ
	 E8qhf96yDBgt7xReNZskXiN505/5SBIcqUl5N2M97b1VUs2BtBquX1Twu6Zqgo0bYy
	 DC6Fq7Uexzl9WbLNtKF1Eky1LVt7d64KKfOW+kXyU53JEjvzIlWJcstu02PAsiIf17
	 vmDPfX7yZU7tuKHEnZhLYX3/Cv3LjOPqbusScYrU5xS6tgIRwWuRcaDVGdqbrCqofL
	 ganOtiI/ua+EaubbL5XRjot1kUEOio9FE4D2ggjCt/8RrZzqYlDZXv7lqV/d3UBxYu
	 ktofO/gSMBtGIfED2moqqxMPss9iZoI72p+yLMYXKW1st1GnWBHTf3QEVKTjtJXPp7
	 kZlihwsFOapiRsD+MRrMgRxUFRKC64h32DQhsiETijlvGpSKlIWsCKBHJnFKQ5f5eb
	 5HyMWu4i8sEp9oNDn9Zx98vxxPycdo9Wc1BJ1cgdswWe8xjwhI02eYTBIbjpVhp0DR
	 bvJLNLpwUyQB2m/Lx783+QtZZBE4ZzSq1yLOKMXXQcxiZBNbu9s6ZJBsguMOBflr1u
	 /hLgpNMEzhrWgEQ0h1bc7u1c=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so13096685e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431748; x=1789036548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRApGfPAXtPOCs+RBxplz3SPHgBy4a8d2R4AbBpaGlM=;
        b=iGebJFtJMAibtzadg1iA5F8fWNL07JzNvBAKTPw8RoqbdatecMg1tZFVAQ2KmAqS2i
         6Rr+0NJ0SduzqqacOR1sE9bk0ZpfENPY7Zml+ntHXPBa8y/IfiOF0K3M26zixP3TSdY6
         jMNaOIv6dBWdHe208vLqfWjqmqFpZmm5S0DURWMUxLAAT8Zf5PeZw953AFOqb+uTFO4Z
         CFve44otn2zgh2/ZZliMDlP54fxLVtTFSEHqh2ZNVZKlbqwF9iFOhzf8CqBsv7R7F77t
         o1WLoD3DWG6Mc+2MeGYM0cHMnDq6x58Ulx7ux5w3gclH3og3RmgbKZ7w1MMFgNpghj6i
         gVXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqQou0gRj0p4FQCRk+KJhc3afRmN1ujgGaFU8w8WS8dBtd3yOQwSAaZuvpum28mfSoul04UJkwhR/Cj2o=@vger.kernel.org
X-Gm-Message-State: AFuF++lf4ZDxTxfNzFUJaD7Zw8wDev39yKe5YC67TlPPuR/BEyFxubw0
	HSUzlNSF3U0bOMUO5bg1H67xsqgyVbkHQFzSdcNFLrDtl/jP5yS0SXsLKpidpOmobnXI6hPM4Am
	4u9qhimHMeffvDGouXVWWPir5Ay4StKOWGa2lEKm0psMCpJodt2VUUyHVPYujvJ0jBeLJ8f48FN
	4W2uHSQQ==
X-Gm-Gg: AYBFou0LS5OS0/pHMeBJyrN1LyaGjCZ5RTM8ORwMGRPDwuOoOaQlTIP5H3WcfmMrzWv
	JKqWgqHwRCzZk4kXvWBndneUgUUqgq/WrUjaA6RxwO9q+/RjkS7otfBW/TX6rYWRwS6L1iYvt35
	JFA9YJCHwATLMYf87FYS7J5weweRz9lLJ+dy4nwHdqPAvZIxe5wosQOubR48hJcdoPBDsbcOerx
	jiftPfOjETv9JztxykxZZ/3juqMVf9P6axlC4/qIryKosenMlLwMp/aMPAyAipn+nYJ22Nq520a
	0QOO2mQIIvt3uL3VDpvI2xk69Pc54VIHscJxf1QzIwvLkQBU9TrQ2WYvH9bGVDmlMnvcht6Ty7m
	fzsO1Isu6jfRg/+u4rGnrjQYVV7YgHHMHncWIaiyKIzTiOq4tAt4q51keb5iXAaiBHjs=
X-Received: by 2002:a05:600c:63c6:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49ceb160bb1mr110957245e9.3.1788431748682;
        Thu, 03 Sep 2026 03:35:48 -0700 (PDT)
X-Received: by 2002:a05:600c:63c6:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49ceb160bb1mr110956765e9.3.1788431748364;
        Thu, 03 Sep 2026 03:35:48 -0700 (PDT)
Received: from localhost (93-40-88-16.ip38.fastwebnet.it. [93.40.88.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d9db2sm62799975e9.8.2026.09.03.03.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:35:46 -0700 (PDT)
From: Alessio Faina <alessio.faina@canonical.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [net-next, v2] selftest/net: skip srv6_end_dt[4/6]_l3vpn_test.sh if vrftable not available
Date: Thu,  3 Sep 2026 12:35:45 +0200
Message-ID: <20260903103545.1325276-1-alessio.faina@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case iproute2 is older than version 5.11.0, released ~Feb 23, 2021,
the vrftable support is not available and the tests
contained in the following 4 test files
 - srv6_end_dt4_l3vpn_test.sh
 - srv6_end_dt6_l3vpn_test.sh
are failing in some kernel backports.
This is the result of one those tests in an unsupported environment:

\################################################################################
\TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
\################################################################################
\
\    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
\
\    TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)       [FAIL]
\
\    TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)       [FAIL]
\
\    TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)       [FAIL]
\

To amend this, check the current running iproute2 supports the vrftable
feature and, if not, just skip the entire test to avoid a failure.

v2: - remove dx[4/6] tests
    - test if vrftable is available in the installed iproute2 application
v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260824091537.2305107-1-alessio.faina@canonical.com/
    - initial approach by testing DT[4/6] and DX[4/6]
    - test if DT4/DT6 are available in iproute2

Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
---
 ./tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh  | 21 +++++++++++++++++++
 ./tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh  | 21 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
index a649dba3cb77..037e5fe1da2a 100755
--- a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
@@ -469,12 +469,33 @@ if [ ! -x "$(command -v ip)" ]; then
 	exit $ksft_skip
 fi
 
+test_vrftable_supp_or_ksft_skip()
+{
+	local nsname
+
+	setup_ns nsname
+	ip netns exec "${nsname}" sh -c "echo 1 > /proc/sys/net/vrf/strict_mode"
+	ip -netns "${nsname}" link add vrf-100 type vrf table 100
+	ip -netns "${nsname}" link set vrf-100 up
+
+	if ! ip -netns "${nsname}" -6 route add fc00::1/128 \
+			encap seg6local action End.DT4 vrftable 100 dev vrf-100 2>/dev/null; then
+		cleanup_ns "${nsname}"
+		echo "SKIP: SRv6 End.DT4 vrftable not supported"
+		exit "${ksft_skip}"
+	fi
+
+	cleanup_ns "${nsname}"
+}
+
 modprobe vrf &>/dev/null
 if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
         echo "SKIP: vrf sysctl does not exist"
         exit $ksft_skip
 fi
 
+test_vrftable_supp_or_ksft_skip
+
 cleanup &>/dev/null
 
 setup
diff --git a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
index e408406d8489..9a29e0d6c912 100755
--- a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
@@ -479,12 +479,33 @@ if [ ! -x "$(command -v ip)" ]; then
 	exit $ksft_skip
 fi
 
+test_vrftable_supp_or_ksft_skip()
+{
+	local nsname
+
+	setup_ns nsname
+	ip netns exec "${nsname}" sh -c "echo 1 > /proc/sys/net/vrf/strict_mode"
+	ip -netns "${nsname}" link add vrf-100 type vrf table 100
+	ip -netns "${nsname}" link set vrf-100 up
+
+	if ! ip -netns "${nsname}" -6 route add fc00::1/128 \
+			encap seg6local action End.DT6 vrftable 100 dev vrf-100 2>/dev/null; then
+		cleanup_ns "${nsname}"
+		echo "SKIP: SRv6 End.DT6 vrftable not supported"
+		exit "${ksft_skip}"
+	fi
+
+	cleanup_ns "${nsname}"
+}
+
 modprobe vrf &>/dev/null
 if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
         echo "SKIP: vrf sysctl does not exist"
         exit $ksft_skip
 fi
 
+test_vrftable_supp_or_ksft_skip
+
 cleanup &>/dev/null
 
 setup
-- 
2.43.0

