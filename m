Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89FD306779
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262344; cv=none; b=G75DLCx+E3WOGi5fuGR5KotB80vCGShR5QuRS8JrLF/zq6iM+B+Jf8SK2a+Vp48EIM0KO3oSRIoqlRgPoU2ugZsjT5XKELXcIwGy25pKdkA7XA8t/IxBJAUfjrfIgoJyR7jbfwyWqHfWFaqG8Q1IlMlLpHzsO+IXmOwAXexurYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262344; c=relaxed/simple;
	bh=NRVm+NpeqhDaHD1stYDATNicwntE7vF0BHXpPUPT4Ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tZM2urDFduTSQmrKLdPVnyeJOPTbvYpQKNM6zD6idRgerCnKzt9uP+/xPW7R5vRx9CGAupYS1J7L0fdpU7CD+LJ2lKZm2wPyndIz9gKjFa344YT1D+HWbu8fejqT6JYAmZXhkMFocwnYpJAIu1UqlH82CMppBoHl2Phg5XSm7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=WQN2egFW; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="WQN2egFW"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so488291a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262341; x=1788867141;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEmWNrm2JJeYYsOZMUufG1GNwpjiBF7RXVW8N5KgjKA=;
        b=fXozFzCcOTTU0ZGgeqqiLW7MqX7sEl6Gtq5NWD8FJ4hUao4lyuaa8vLatR+ivdEGBf
         83m+gXUN4bGLmq/r9ZMet1YB4OPh8m+FZXGZA5Oi3VUZMi4Q3c906WekY1LbRSp7CjpE
         ej2PaV0deHZg4M1LwSRcxwIT03M++hiApGIz+GHxXpDIbM/oJg2IIBlP/Z7DnbxnKxCP
         Trsh6h4EWSHRUgJsCntMemm0Ny1N1kSaRdbA9wRXOO4Xyja7sZNGf74boD+YMe/373Y5
         +KzIf0XCfG5GhLOFYHxRyII6H5LMGPSfGOIG8v5xtui2b1M13XjGMFITBPFGdT5tEDZ6
         lKAw==
X-Forwarded-Encrypted: i=1; AHgh+RrYwcvCvr7IRe39b1RzQyBhMpWVHgNNw2BQFL/jEqMuE6fMKWPkJY7O+jAA2zF3jR8XdYR/lP5b7VWwX/c=@vger.kernel.org
X-Gm-Message-State: AFuF++l7P92csiizUHR2+UuIIDY2wJ6BovHL4yjhugTvibKt9UpKkn4Y
	VwHqiTYKII4yv7Uw7jkB343KCdCvyxwAMZGBt6C9rXTROLiFJucuSItz
X-Gm-Gg: AR+sD10bj1iwP+ZomH9AgrIpKCsgV2JpBlRcLz5DxiYE6X6QMWFEDnyEsY5SyTbP5H0
	yCJaLlCPjsEzQnnpbz3B0CmQ5TWVnr8oOtFXQu8zHQKjeExsGXPoJ9jSuZ3MCxnMKjOHM/U1Kig
	Jabpg15id8T3c4yJM/QJKaZTmouDjWwvO9HkjxEPNUGbtdbPV+Qy5c+3QQ276A1ujgbYmJ6s1An
	WcAd88TNkBjvRItmO9uko+RMt8U5rdagtOmL+6mjF2QB8hiTH8TNuFja2fr/y0NOgJ20GF46vTP
	CTy+fGnDGH6Rw5m4g/u3mBYaUXZUPebRdDKgncw6ub6w0DNbRJpN64Zk6Jr4QF/iFUnXL79wEDO
	EUeczIZasnUjZYE8w7G5fhtv2bmNagIVZ9nLkSIGg1Odga0aQ6w4oJ2pll/FEYnJ9KCrCG8JHNM
	gJCiiP6g6nE2gbxc65sDLslsQg0xx9O1SLNJ0zaXQOEs2SlhWKwU3X0IVzVReJSX8YrDDWUqnXr
	WwzA/Ncr+uLHEod9m3dm67jcbbQ+c8IpmLZulqdcTfiJzr3AhNe/tt5yQN1M4UIig==
X-Received: by 2002:a05:6820:2017:b0:6b1:5d5e:679d with SMTP id 006d021491bc7-6b1c679e571mr29869969eaf.28.1788262341283;
        Tue, 01 Sep 2026 04:32:21 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1ce2916a8sm13636111eaf.10.2026.09.01.04.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:32:20 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEFE660D1F;
	Tue,  1 Sep 2026 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1788262338;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hEmWNrm2JJeYYsOZMUufG1GNwpjiBF7RXVW8N5KgjKA=;
	b=WQN2egFWZ83BoX6boVS3fAw8WgfZ0I6glPax5x/l5hbQkcOA9qdHlRmUwJG+L2QAXOWQ/0
	2FrGxt1oEu7Ia50mWE2W6OkRNFR4u7NwYGZWibuoBTBgBodLpNhOh+acBmuZNsq08XE7NS
	9YzPM0GoZPq7Jrjmk9spTbWqny69Dsy7LG7r4zLxoRafEci2SQTaJbhGSjG3vQmEvOX/Dw
	t01lxVeOUVkwGOVkURI8osV7fmMYjiTYntFQry4vfqf26fU3MtyoBYatP4FdwZfVDpZ4mk
	OAFOm1FLZlW8D08mPh3r93zq2KrgjxnD2PKfxR9g6ebAwRDb94DAQNznjeXx4A==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Tue, 01 Sep 2026 08:31:58 -0300
Subject: [PATCH net] selftests/net: Fix flaky bind_wildcard due to
 ephemeral port race
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260901-selftests-net-bind_wildcard_race-v1-1-880ddc7ed62e@marliere.net>
X-B4-Tracking: v=1; b=H4sIAK23lmoC/yWN2wrCMBBEf6Xss8E0Qr38ikjZbLZ2pcaSjRco/
 XcTfTzDzJkFlJOwwqlZIPFLVB6xQLtpgEaMVzYSCoOzrrNH2xrlacisWU3kbLzE0L9lCoQp9Am
 JDVnb7dEF2tkDFM2ceJDP7+IMZQOXf6hPf2PKVV5rHpWNTxhprFEpbu8oEdb1C+5nDyOkAAAA
X-Change-ID: 20260901-selftests-net-bind_wildcard_race-c0067a2dc308
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1788262332; l=2208;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=NRVm+NpeqhDaHD1stYDATNicwntE7vF0BHXpPUPT4Ug=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAQvMA+iXtgn9SGn6DViwidV1JIXPs63Piol0t0aGONt4f1I1seQ/5dbxTlA5gP59kodzeGuJvW
 Uyx2XB5WcnAE=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

bind_wildcard picks an ephemeral port by binding fd[0] with port 0, reads
it back with getsockname(), and then reuses that exact port number for the
other addresses/families in fd[1..7]. This all happens in the default
network namespace, so unrelated processes on the same host are drawing from
the very same ephemeral port range (net.ipv4.ip_local_port_range) at the
same time.

Such a process can independently get assigned that exact port number on a
different, non-conflicting address in the short window between fd[0]'s
bind() and fd[1]'s, making fd[1]'s bind() fail with EADDRINUSE for reasons
that have nothing to do with the wildcard-bind behavior under test, e.g.:

  # bind_wildcard.c:775:plain:Expected ret (-1) == 0 (0)
  # plain: Test terminated by assertion
  not ok N bind_wildcard.v6_local_v4_local.plain

Fix it the same way so_incoming_cpu.c, tcp_port_share.c and
reuseport_dualstack.c already do: unshare into a fresh network namespace
and bring lo up, so there is nobody else to race with for the port.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/selftests/net/bind_wildcard.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/net/bind_wildcard.c b/tools/testing/selftests/net/bind_wildcard.c
index 7d11548b2c61..be3298c791b2 100644
--- a/tools/testing/selftests/net/bind_wildcard.c
+++ b/tools/testing/selftests/net/bind_wildcard.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright Amazon.com Inc. or its affiliates. */
 
+#define _GNU_SOURCE
+#include <sched.h>
 #include <sys/socket.h>
 #include <netinet/in.h>
 
@@ -716,6 +718,9 @@ static void setup_addr(FIXTURE_DATA(bind_wildcard) *self, int i,
 
 FIXTURE_SETUP(bind_wildcard)
 {
+	ASSERT_EQ(unshare(CLONE_NEWNET), 0);
+	ASSERT_EQ(system("ip link set lo up"), 0);
+
 	setup_addr(self, 0, variant->family[0], variant->addr[0]);
 	setup_addr(self, 1, variant->family[1], variant->addr[1]);
 

---
base-commit: 1376afc7660bad2a1a5ee0876898312a486cf8bd
change-id: 20260901-selftests-net-bind_wildcard_race-c0067a2dc308

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

