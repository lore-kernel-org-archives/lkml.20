Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876712;
	b=uYoRj9Dd2qLzgA2jWdgSLD6s0wYs8M4S2sEc6RMc8ausYCBKLBzKS7WSXbEyxJUx6N9H
	 yUha+8boCbfSihjauNDrNdAdCFrqcVwqQIrNSEhbwAc8M9+xGDpKrjXXzrVJ0M5r5xZoo
	 2uvPOsxtsm8lHFZtYidepy/ahoX3RWdlSyEMj0kTztbm4aqm/2kMeAjoNg5pe6fRaoeLO
	 GalSvp5sfnJY1UEwA1/JSO1GbIITCjGKOh2ZpETDu/Z4lVsCRp7wA0vHOP99tz6cews3K
	 8qbsFjyc3Jx7gTxekdehzIc/8CVIPfyUium/+WyQXxYlMyUKlMoCtOUquf1BnNB3fJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Received:MIME-Version:Received:From:In-Reply-To:References:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=EACSeKrdz4bGKRBeWmqR524LYko7JkqQI6iv01qT4ws=;
	b=uO8K0S7qYVxzr+53ArOT47thhX2hDYQjadzZnyyOYVV32Xn9y3rveWt1l6cg1q4IT3FN
	 wa1WNPAaZ/eTz3g54ZUNpRZr5cnG+wR3fObltzUz5bCD/uriaH2dUQlvl57uDiY7blel5
	 j06jrorB4ezyQx/mJ17cSrNhEBmC40HKRgNGz+IihKRgmJjXn3x+EPYifwaxo3fZU1SkR
	 2/h6gL3IFzUPjloSs702f/3h/yG15wSMhRN9TCMNZo22xQckMQApAqcyvqoA0VfqHL4d5
	 77Bw+VJ6IBg5IJX2H8ebohHMQhGdszz00QQvXUmwhZyTeWWV0/7Ulozzm/48/1YEdKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwQBFCRf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D9606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwQBFCRf
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2261954a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793876710; cv=none;
        d=google.com; s=arc-20260327;
        b=glP/6US53Cxc1gZI3wGdF4DJuI2cAlUJrk14La26pOouM9eD7dia5EBdlKVrb+ZqLH
         Hx0NftoV3SzbEP5w79JJ6am0W9cyFyP6VoZYuHJmvieZz3LXqh7iIRvXRootjH8kYeIz
         +l3AN02OGTUOzfgeC+RW5amL4PbOPBxi6ecVlB5ljKRLnin5bvfcPIUu9GWW+yCGoqhW
         8Iu/1Ef2gG2GIxOsFw3fwux4ipVMS5GSjXQ847KXyGEdEtT9OKYHUrsH5TncUxv7w0L2
         z/4zqHVDqVCeNvJRPAc6mKKYNp68fPL6oG8aNm5ohYdvyTXH4P4IZJY9ShV5abAuojPy
         7p9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=EACSeKrdz4bGKRBeWmqR524LYko7JkqQI6iv01qT4ws=;
        fh=nLEhhlQBvIPxNAek9BIcV99NWJGmeZ3iM70GHVOCIjs=;
        b=L8qMoZJEyNfWvlKY+6Ns7NE2pon2ykrjd6YKe4NN/ebduSI15vswZouINm6h9mJb+y
         8cOBOPP3MFzJ+D1qwgwUCH1NHHhKd9j103JVTxN8uxS4o47BOa7qWmyO5x7e5OTHAPQ8
         6maTpBt76+h/oT2EyfWHalQ/Yqv8uU0a+cddVBkySRY09AWIRDbWD8JE9GgoiB2bdjmR
         mfDE8rluWmvhBuOMEyvc27duO8xRVMQsq/+ZMElidHRB158JK6QHIpMjHSRF7hIS4K63
         fcd78LgrMJgccIFZZmP0iZogzo64pN+i/zinKA5K7xUrIAx4twR+xlJZcUCPVvEqkqEB
         G83A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876710; x=1794481510; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EACSeKrdz4bGKRBeWmqR524LYko7JkqQI6iv01qT4ws=;
        b=UwQBFCRfxFQORo86l7fky65QmFyk5pZq5nf5Gb1HJMrfA1MqU9tR+cmYRR0Z38XIi3
         eeU8i43UkNv0A+eQu1Mrsa934JL5FU7W2ePK8v3eUsDKU/DM/Bvix9pxLBoN3IJuDIcN
         JlQ3r4aWf+s3JdEAsPAdeje+JAttZ+8Pfz/TMNFuK+lUHEBYk3x3DPMMWzq38dXE/CRb
         jQ0NOwlS9JTD/YM+dBUagabK/67ZjyFU9LyabVfN9WqKeUfTAYOhHTncNSIx8oYO7Nl1
         0Gw2EisIskxJCULQNQrkdUGtV75wFy0dD8b686SCbNPhqCAwuIJqeGnvbYefGUVGO3nz
         og5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876710; x=1794481510;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EACSeKrdz4bGKRBeWmqR524LYko7JkqQI6iv01qT4ws=;
        b=1FSM6p3iTI+FaIpOW2PSb3w1QkU7cliscWStE35jbpUBmtaMKBmRJ90bUkTcLmwX82
         Oh+hDR3fHD2g7OC3r6zjsxUKHSzGPELvU6/DXWUsiu5CQupUh33z5OVdx+ez8Z7tT/IM
         3kR05hlMbB5u1po8wGynrJYIAqrc5xENPOFWdDHPSDX9gqD+c9IgE+8RyNVfYnVrMf7E
         rg7Uamr0ZsgPE7ShuZUIsO+yh6EjYBaN4+ui9OurWsvN0Hys3LH1j6MKfnmXeBJ5Z3JI
         BI0w0KlqzP/F86u66jB/cZQ6lsPGTzLoh3qz6chZFMEGpKAWph9RxHih6jA7tV/OdgUH
         1/OA==
X-Forwarded-Encrypted: i=1; AKwUvBxrsoxptZgOmYMIkWwZGIh5o0z1q4W6iUmLklbKEpEPFehtnhr9jgflUFE9Xn46aHr0NCzCRjou1QExHc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YzKwH/Sy3Uu5nv6Ro2ObTpAMWNHpZerAaIZkkww/G95y8Kowq
	Efz0behrAgjxpPpYYun6ifxRixZETguXnhKg+Axdd3oL9Ggwwzwl5CCFs+0vmScH19Seodz2WMF
	7V7hyNpUC9kro9YlJrxsH96m5YmrffrA=
X-Gm-Gg: AYBFou3DClMaL03QUkgOo3ngQ3xbVjdoGbGD3Z1oo4+dg+EX1T+puNYYrLWStUG5LA/
	fjciSN7g4zaRdc/jtArKSJCSIwZK7fiB6ylMLOnIoJp3V0eZgecyg0jdJzVm9Vx0vqekoVPzNIK
	CAcCtFup7TXpGowD7G4Iw2FzRazqi6iEBnuh1hj7B/gqZgzducaRZdYDmolEcT+kkbJ6rveM12c
	Bdbx4w0pl+pCsLkoLdyi7TLaQpzhifd60IcKBDJY9nVvuDtVx1nylFl5L+I1F/pKB1gDOHXhn8l
	PFHFT8PoPj0OPxGab0yD/Ni5Z6XPmaV1fnyd2029WieoAt/57Ld0jv3RPcRzfMHRlYlYwShli4v
	zDkNfHoN2mi+jQRGACMxQq4MeqDZmucosnDIOmATHB7O5zcJ4AzmyWsyXzcSTioRBJtyy37tREe
	B/mQwucLtityQMvPuoMqYHv2lkfpZ3D7rZZN3R++fYBGF0LbNc2prCMuDQs8EDQETg4dEWrQnjw
	oQ1gW36xN2Q7pRgaw==
X-Received: by 2002:aa7:ca5a:0:b0:6b1:d2ee:392f with SMTP id
 4fb4d7f45d1cf-6b4d4d7456fmr10223394a12.25.1793876710202; Thu, 05 Nov 2026
 03:05:10 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:05:09 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:57 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 03:04:14 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 02:57:56 -0800
From: Florin Badita-Nistor <baditaflorin@gmail.com>
In-Reply-To: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
References: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
Date: Thu, 5 Nov 2026 03:05:09 -0800
X-Gm-Features: AclHuK9ci3ISHKdlFTJfWL5UQTii2K6y9JcFzosGDRAOWFRE1BZCZMqATJw5ROk
Message-ID: <CADnh+D1CH7yU2fsnoKBnLUSgDdFmWCivS31PQHfDqxUptp9aiQ@mail.gmail.com>
Subject: [PATCH net 2/2] selftests/net: cover odd-sized local port ranges with
 one free port
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Leave each port in three- and five-port socket-local ranges as the only
available candidate and verify that bind(..., 0) can allocate it. Cover
both lower-bound parities and repeat allocation to vary the random
starting offset. Use the existing IPv4/IPv6 TCP, UDP, SCTP and MPTCP
fixture variants.

This catches the false EADDRINUSE caused by rounding an odd-sized range
down during TCP port allocation. Without the preceding fix, the TCP
and MPTCP variants fail on both IP versions when the last port in a
three-port range is the only free one. With the fix, all eight variants
pass.

Allow the loopback bind helper to take a port so the test can hold
explicit binds on every other candidate. Retain the existing helper for
automatic binding and run under the existing isolated-network-namespace
wrapper.

The regression test was developed with Codex assistance and exercised
on booted x86-64 KVM kernels before and after the fix.

Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
---
 .../selftests/net/ip_local_port_range.c       | 67 ++++++++++++++++++-
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/ip_local_port_range.c
b/tools/testing/selftests/net/ip_local_port_range.c
index 3d32b33cb..c17d95045 100644
--- a/tools/testing/selftests/net/ip_local_port_range.c
+++ b/tools/testing/selftests/net/ip_local_port_range.c
@@ -44,7 +44,7 @@ static int get_so_domain(int fd)
 	return domain;
 }

-static int bind_to_loopback_any_port(int fd)
+static int bind_to_loopback_port(int fd, __u16 port)
 {
 	union {
 		struct sockaddr sa;
@@ -57,13 +57,13 @@ static int bind_to_loopback_any_port(int fd)
 	switch (get_so_domain(fd)) {
 	case AF_INET:
 		addr.v4.sin_family = AF_INET;
-		addr.v4.sin_port = htons(0);
+		addr.v4.sin_port = htons(port);
 		addr.v4.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
 		addr_len = sizeof(addr.v4);
 		break;
 	case AF_INET6:
 		addr.v6.sin6_family = AF_INET6;
-		addr.v6.sin6_port = htons(0);
+		addr.v6.sin6_port = htons(port);
 		addr.v6.sin6_addr = in6addr_loopback;
 		addr_len = sizeof(addr.v6);
 		break;
@@ -74,6 +74,11 @@ static int bind_to_loopback_any_port(int fd)
 	return bind(fd, &addr.sa, addr_len);
 }

+static int bind_to_loopback_any_port(int fd)
+{
+	return bind_to_loopback_port(fd, 0);
+}
+
 static int get_sock_port(int fd)
 {
 	union {
@@ -301,6 +306,62 @@ TEST_F(ip_local_port_range, single_port_range)
 	}
 }

+/* Leave each port in turn as the only available one. An odd-sized range
+ * must not report exhaustion while a port at either end is still free.
+ */
+TEST_F(ip_local_port_range, odd_port_range)
+{
+	const struct {
+		__u16 low;
+		__u16 high;
+	} ranges[] = {
+		{ 40000, 40002 },
+		{ 40001, 40003 },
+		{ 40000, 40004 },
+		{ 40001, 40005 },
+	};
+	int i, j, port, free_port, fd, err;
+	__u32 range;
+	int fds[5];
+
+	for (i = 0; i < ARRAY_SIZE(ranges); i++) {
+		range = pack_port_range(ranges[i].low, ranges[i].high);
+		for (free_port = ranges[i].low; free_port <= ranges[i].high; free_port++) {
+			for (port = ranges[i].low; port <= ranges[i].high; port++) {
+				j = port - ranges[i].low;
+				fds[j] = -1;
+				if (port == free_port)
+					continue;
+				fd = socket(variant->so_domain, variant->so_type,
+					    variant->so_protocol);
+				ASSERT_GE(fd, 0) TH_LOG("socket failed");
+				fds[j] = fd;
+				err = bind_to_loopback_port(fd, port);
+				ASSERT_EQ(err, 0) TH_LOG("bind(%d) failed", port);
+			}
+
+			/* Exercise different random starting offsets. */
+			for (j = 0; j < 16; j++) {
+				fd = socket(variant->so_domain, variant->so_type,
+					    variant->so_protocol);
+				ASSERT_GE(fd, 0) TH_LOG("socket failed");
+				err = setsockopt(fd, SOL_IP, IP_LOCAL_PORT_RANGE,
+						 &range, sizeof(range));
+				ASSERT_EQ(err, 0) TH_LOG("setsockopt(IP_LOCAL_PORT_RANGE) failed");
+				err = bind_to_loopback_any_port(fd);
+				ASSERT_EQ(err, 0) TH_LOG("range %d-%d, free port %d",
+						       ranges[i].low, ranges[i].high, free_port);
+				ASSERT_EQ(get_sock_port(fd), free_port);
+				ASSERT_EQ(close(fd), 0);
+			}
+
+			for (j = 0; j <= ranges[i].high - ranges[i].low; j++)
+				if (fds[j] >= 0)
+					ASSERT_EQ(close(fds[j]), 0);
+		}
+	}
+}
+
 #define REUSEADDR	0x1
 #define REUSEPORT	0x2

-- 
2.51.0
