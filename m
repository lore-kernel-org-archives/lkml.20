Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419282;
	b=fnQWGSjXDcB+BWUErC2oz6Dz/iaRcr5iNnhWh674J+ju+ut+V1sgVYm2UffBkUhYZoer
	 bBu5qo8fdnoyeqcY7AW33WslucQF8j+2Ao3H3JU85ca3W9BGc/o75Aw+qSdAkHgi9Vg4z
	 /0I3APbE1mLfm+GDaa9mS0JmSvxitJ+Hr5xSU27f3aXGJOUuM8KsMGb3NNVZ23LcYTJeG
	 fJnJNYFvW2jWuqAbSI6WQF73uMcFhFL8wufzFAoPK6lsLJjvocBAwOKeYCzodMtFz4dcN
	 wmtrA4bksUrdQv0sQbSunQblzs9Xd1DGQNakrPImBbr7Az9HAGtUlwY/4CGpgCu6d5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iHEyEjx61i5+KpzynKjMkfGNsZoJzf5A43ccLavLZAI=;
	b=ZHoB0NfbCXpJS32ZttDL4supgSCjiol9chOBL75I/Iag/PyyAnQQAl3eaV1LaKw1CYNR
	 UJdGv1lmvbPSrSD6MKC3BH+8xhC3xFxsUF5+zZ4M6qMpuOsjAW/aejxYEOQ9Sv6w4751l
	 TVjdz7MG9RyHCOwpxv3IH+/kOhROSRiHXxdvRRAN8twzwpCWGxf7sqhxHckY59RiaPOSO
	 HLMjG87qmo5Icq6D9wX8xmKq7OvCsUMy832vj8AJqAoZ01UhYDnIbhG0aEUhgQZKa78T0
	 uBOnZAYx0ybRRq6DLqwo4l8Lk9hEkskFk8Jjh/oD+Ae51jBDhw2MyIZBvb64B5ciGRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D83WIRG3;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0A606A88B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D0A606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D83WIRG3
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso1181257d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794419281; x=1795024081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHEyEjx61i5+KpzynKjMkfGNsZoJzf5A43ccLavLZAI=;
        b=D83WIRG3J/Z+076mzvh/YssO+Jre6Z7MuWj0DlXDwtQsZ2wYkARYNwMoORfVP375VC
         NWqe+5jVeq0bizthE1v7GvtERH2otTKWL6Zj+HaCaC+c6/Uba4hwn14MPXfjzennzNIe
         Kk5I0WV6SBG98chNTcd07LAtSKLPedPvr/Glmq+52cS8ADs3jHk38vGrvzFKVBNDiyze
         om/99G7o82pb2HD584tzROXFbuHLbnqzxE8+FvQ57SDQnl5ouuron6fOZgAls9BHjV2Y
         cRjifjJ9CSYfdE1vaq99GHt0x9+I0j8eIQQdMKgGigGFDny5VCiZE9JAwB+0RxaQgp7f
         cgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419281; x=1795024081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iHEyEjx61i5+KpzynKjMkfGNsZoJzf5A43ccLavLZAI=;
        b=Pnc5vA9PI99zJ0SMZGkEJQBrrqMrHTAjw/2AslM5j89r56reAi8MtaQ2Fsabqsbasi
         +uKfoJeZ6G3pMwKRaRoOD2pvf2aM8rCfrHrHhUhh/3VHUW/aeGlP5wep4DWVwTBqa2qH
         rkmq9oBTjfWStUWQ50jGoJEx4pkN98QO/kOa0bR0Z11xy/UeI/N2cwrevwTg040QXuy9
         EstU2ZmjvijemVjzxcXKgvIkD+SqnUzD8RCnSZodoxykHglU69koPnA21OZvojYnuQ10
         Q5K9DCs3eVK6sQ4LV/eRnCTfnMK/iquZmTM+68quUbSYp3vVg08d0lSzssrzG7wo8cHJ
         b7sQ==
X-Forwarded-Encrypted: i=1; AL+hErH8cf/J1REhqt1PgspUjAvA5zrEKxU433lN5vjRCeiXJgywDlDuVsb46UTxhoKUyL6ZmhWPBWszedrOt0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z91X/7GfdMGhjHB4Ili89UCk/Oc9t/gBGMd9AhUmEz7FinnvNbY
	BrT0osxUYUnN8TBcQJ5mInrBoLrfynGgSoayRE36U8pAt4+G49fIGEwo
X-Gm-Gg: AYBFou209N/aPLt7sbWSUXY+CI+pNu6fYANl+uDKYmjGymIIUfsf+xveac1wCVGnY9M
	lggA/TKwNEu2OicmkV29GOzkhtdxh75F2UmmTmaetHLNgo0GQsdyiDcxFgJ1WzhEZrxi+rVzxYa
	BmhhD1RqA7bUyOO77NS4SWIFgHntKT+o8xRkab1lUWPaKJwAI4eNfXTQReZ4hD+OmEtniDc8KGO
	xZY01P5dsAFvlwy8zbABttRqkoKYaqCtGOpCADld7qGtt5QGC/l1d9aX3ra7h7yLdMIK6JZAtGl
	/G6rNR4nxwf8X4++q+2F2KQI3Wbq+fSa9jHIWigyn00g6wLcVjwSKemKqm3WfFNUBBvw3aiizaR
	iR55IX6fdlNim0f0VAZjw/+8hR2uhuM9e3Pl5aKeiSmiKlkn0c0DqznhriqfOSa1hHeZWpdzCY1
	zXAsxrPbMZD1cKJ+sOZ0A1PbqSfiDELe5CF6TZDYdFG8zzo+fjVEAofZW9Ol2EHMVsj2z4HsGPH
	OnwF65GAbtyqK7oqBdy+a+B64I0mUw31sswjUsmz1+uSQuq8UNQCt2TJ5OdWJHe7RwdNfcwbIGe
	Isa26/R7bf6dU4/FjcgA3xvLrEYzoxAY4EVayJ0mq1SN02neh4BzbA==
X-Received: by 2002:a53:bdc1:0:b0:679:a692:630d with SMTP id 956f58d0204a3-67c67ff79dcmr1390972d50.86.1794419281418;
        Wed, 11 Nov 2026 09:48:01 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c6f24sm5077708d50.12.2026.11.11.09.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 09:48:00 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	josef@toxicpanda.com,
	jbacik@fb.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>
Subject: [PATCH net v2 2/2] selftests: net: Add SO_REUSEPORT bind cache test to bind_wildcard.c
Date: Wed, 11 Nov 2026 12:47:04 -0500
Message-ID: <20261111174704.24312-3-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111174704.24312-1-juanagusnicco@gmail.com>
References: <20261111174704.24312-1-juanagusnicco@gmail.com>
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

Add a test for the bug fixed by "tcp: Fix the SO_REUSEPORT bind cache
admitting a conflicting socket". With a 0.0.0.0 listener on the port, a
v6only [::] SO_REUSEPORT socket fills the bind cache, and a dual-stack
[::] SO_REUSEPORT socket must then fail to bind with EADDRINUSE.

Without the fix:

  #  RUN           global.reuseport_v6only_cache ...
  # bind_wildcard.c:860:reuseport_v6only_cache:Expected ret (0) == -1 (-1)
  # reuseport_v6only_cache: Test terminated by assertion
  #          FAIL  global.reuseport_v6only_cache
  not ok 1 global.reuseport_v6only_cache

With it:

  #  RUN           global.reuseport_v6only_cache ...
  #            OK  global.reuseport_v6only_cache
  ok 1 global.reuseport_v6only_cache

Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
 tools/testing/selftests/net/bind_wildcard.c | 54 +++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/testing/selftests/net/bind_wildcard.c b/tools/testing/selftests/net/bind_wildcard.c
index be3298c791b2..334a0cf87edf 100644
--- a/tools/testing/selftests/net/bind_wildcard.c
+++ b/tools/testing/selftests/net/bind_wildcard.c
@@ -811,4 +811,58 @@ TEST_F(bind_wildcard, reuseport)
 		bind_socket(_metadata, self, variant, i, SO_REUSEPORT);
 }
 
+/* The SO_REUSEPORT bind cache (tb->fast_*) filled by a v6only [::] socket
+ * must not let a dual-stack [::] socket skip the conflict check against a
+ * 0.0.0.0 listener.
+ */
+TEST(reuseport_v6only_cache)
+{
+	struct sockaddr_in6 addr6 = {
+		.sin6_family = AF_INET6,
+		.sin6_addr = in6addr_any,
+	};
+	struct sockaddr_in addr4 = {
+		.sin_family = AF_INET,
+		.sin_addr.s_addr = htonl(INADDR_ANY),
+	};
+	socklen_t addrlen;
+	int fd[3], ret;
+	int on = 1;
+
+	ASSERT_EQ(unshare(CLONE_NEWNET), 0);
+
+	/* bind(0.0.0.0:P), listen() */
+	fd[0] = socket(AF_INET, SOCK_STREAM, 0);
+	ASSERT_GT(fd[0], 0);
+	ASSERT_EQ(bind(fd[0], (struct sockaddr *)&addr4, sizeof(addr4)), 0);
+	ASSERT_EQ(listen(fd[0], 1), 0);
+
+	addrlen = sizeof(addr4);
+	ASSERT_EQ(getsockname(fd[0], (struct sockaddr *)&addr4, &addrlen), 0);
+	addr6.sin6_port = addr4.sin_port;
+
+	/* SO_REUSEPORT + IPV6_V6ONLY, bind([::]:P) fills the cache. */
+	fd[1] = socket(AF_INET6, SOCK_STREAM, 0);
+	ASSERT_GT(fd[1], 0);
+	ret = setsockopt(fd[1], SOL_IPV6, IPV6_V6ONLY, &on, sizeof(on));
+	ASSERT_EQ(ret, 0);
+	ret = setsockopt(fd[1], SOL_SOCKET, SO_REUSEPORT, &on, sizeof(on));
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(bind(fd[1], (struct sockaddr *)&addr6, sizeof(addr6)), 0);
+
+	/* SO_REUSEPORT, bind([::]:P) conflicts with 0.0.0.0:P. */
+	fd[2] = socket(AF_INET6, SOCK_STREAM, 0);
+	ASSERT_GT(fd[2], 0);
+	ret = setsockopt(fd[2], SOL_SOCKET, SO_REUSEPORT, &on, sizeof(on));
+	ASSERT_EQ(ret, 0);
+
+	ret = bind(fd[2], (struct sockaddr *)&addr6, sizeof(addr6));
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EADDRINUSE);
+
+	close(fd[2]);
+	close(fd[1]);
+	close(fd[0]);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

