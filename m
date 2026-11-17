Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911726;
	b=HA33HjlxCCgnLwr8lCChNPEaXe/UFksoRBDSSzpHIgcTVuyv/XJLlA7WZKzzeMjWof16
	 hOFken1jh0DEHbNQfTQ2CorHZz6WscPLI7eAN+MqzMDK5ZdX7y8+AeCJLzaDbAlE1D7/I
	 3zyOPi7L7kaTRUqaXvEzGKWHCJdDnzh3esMsSz+L6GVaKUL2VRF7bqTfVXI+8LyynrRGF
	 RCx7Jvf+v+jNV36Wl85qzi95K8ItgHE7TVKWERkvrv7vRXS4uJnFEJd3SANUpWNmcIMET
	 0CNyFFVtFDnrMFii1vmgnf0wcFDDk154ZpuxYtl4F90gpAgimXcD+xQlaEdXgSAId5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RuyZ4/NgPAofSNXbBjGZkZZB9QA0/aMDca1cWrs9WFg=;
	b=oylBaeV3DCFTvqLpUddYFl3F72qXMAf+HNi/59se1itW4h33ny5jeYzCehS2/fyAHVx/
	 /cWjhuHWXFFrxNQi7nTXKHHQt+hhIenwNSMWodC+8BrzUPkUpvmeqf9ocJv4rRIWJwaSy
	 AbB25b5DRu5AkmqZ4HkxJ6GIe7OCEzV+zeyykDCQ12wsYOADNOz1LHk2kfzt/UGlXOEYG
	 s8e+LqAtlhiRLX2szOO8O3yGByzGJKO0GT1vtGCM94iUGUeE0bjv0vBZGGuFLtRhpZXeE
	 B0tKUnrdF4PnX06QJ13LCZv8BzIZNZaGGayoiMlkq5SU0+eDtpTYuRcL9fM20z0AhVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvFXG8Wj;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BBA606A897
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BBA606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvFXG8Wj
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cde1479f76fso335509a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911725; x=1795516525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RuyZ4/NgPAofSNXbBjGZkZZB9QA0/aMDca1cWrs9WFg=;
        b=RvFXG8WjjKnTMy0oENVxlESIdVeF6WKEdiNDXunqUUCkkvQvKrb1EXZV9xmGB08fS3
         GKBazE4QO+VsYoH2bZHPTRAvxGv4vB31iiEM/JNLZ+0ti7GUimE9nOHnUyWU5J+oxavn
         Usr7arx6vVCNPU0a0O/knm5dDC0CPAlKkRY+lI4/OwzgM+9n7B61/hvjrn9xMv/3vf41
         MaBmT7CMkPOuR1+8iWIJEUqhi1dzJ4sKDGGwtXG7WmbGSjsvwMs5u+yaDQ6lUdy31rP6
         SPBda7tpj6zYniwGPOHetVokVPwpScwCsEiYqFE0y6oRJCAuK3KxHcP9sXQUmXeWuTBZ
         3neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911725; x=1795516525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuyZ4/NgPAofSNXbBjGZkZZB9QA0/aMDca1cWrs9WFg=;
        b=znZhn9VkiwMLX54po714iyY9JvqcdYqyypvMQoNUREpsOLL5DUs4YvLBzRNo/hi/au
         71A4I2cTBsC7o7hUXuvrSu5sVc7kV6e2clOdqXEo+GUxpe9nFozADynaOUWAal9Qu7Z4
         gtJ2GVo2m8je0RHwwwDtVMxzf4RD7yCuekYHX2MjGIbPyNTMQRES3DwK8fMk9UR4Rwrv
         l5xrL8PE8v/xbVazVhDHmlVq6lNAQHZnf8N/sKky9pNxwsLyOGLj9mibT8oRCFab4hYm
         LQf2AM6dBG6iXuGUFSxkgD/AFeEVs0yNvtMTGbtL/saF1zH59KYnQFX4QE737InivLoJ
         GnLw==
X-Forwarded-Encrypted: i=1; AL+hErHoPrXf6vpmluyyO1BQ9gvOkunNCWTuXiCYdizi5jXApty58Wfc7sE6qu4hZj1DDvruD0LSSNADIR7g8og=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o2nJrV9OM7IsZ3DZHPBCne4I5Jw/94L28YROa+dcdgobBvN5q
	6neplia6v6ta9jUsnavwBY5Eodk3z6hNbmDGFAmihWxDT1I4layHwnyz7k50DQ==
X-Gm-Gg: AZFdTZcsQxaKOm8c553PkxNdYEQCcDnDtRn2YbOXZGRxQtZbcaHPaYHm5fiWS8YSbEq
	C1a8Lf329Nde8WViCqfEuUA0wAigd/SKFFjxYW5Zez3dx3N8JjH1VdP/NBFcl/92sDw3S79sR4J
	Kt3BaBToMvcSCsVcMcjtN8gMKI5ORDPxfnIwDzcvB+qv63rz0wJGRYKqYFgu9JM2MDTqPddGZO1
	pWW8Ez/6YlMHy3p9HAOJstovM678CypIIqFpJp4O9Lxnk2GpHTz08k+qILAvIY6pQw6NDs/oOtj
	Iw4bpghu6YqlYGwEDdNISU7MjOCPWUBGdlsKhS++tGRYdzatCtHLirfau9DyOrXaqz/pnRUUShN
	UPBM5b5awe1Cx28W/7pqkkz5HuyNXKN6OdLkvS2KoIg/vPodQFaVuVqqWsFPuDyB5nr1o5xIOf7
	VFvycFHOQA8QzaN6XOenNpazpg5fEWD0gucuhW45FCs8ZZJogJncWqa7CGiS8dlaCF0y5fqSKjs
	9TvW39E2aDoDeowoCj8ASaLAgF/8bKr9lksX5IShn+y9eK+J50S2COlx8LIe0JLM4v47CYhXjRx
	4SyTdADSTS/+0cLEuBEfINrwdge+b1YZG4FD7rNcuHR6
X-Received: by 2002:a17:90b:1f86:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3b1b0b666c5mr13803607a91.19.1794911724811;
        Tue, 17 Nov 2026 02:35:24 -0800 (PST)
Received: from gmail.com ([116.162.234.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abeaf532sm3518806a91.14.2026.11.17.02.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:35:24 -0800 (PST)
From: Xue Boyang <fuchen.dust@gmail.com>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
	kernel@pengutronix.de,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] can: j1939: fix null-ptr-deref in j1939_session_completed()
Date: Tue, 17 Nov 2026 04:35:15 -0600
Message-ID: <20261117103516.535910-1-fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
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

j1939_session_completed() looks up the receive skb using the session's
current data packet offset and passes the result to j1939_sk_recv()
without checking it. If no queued skb covers that offset, the lookup
returns NULL and receive-side processing can dereference it.

An inconsistent ETP session offset can leave the receive buffer lookup
unsatisfied when the session completes. The DPO receive path does not
validate the offset against the receive buffer, so completion cannot
assume that the lookup always succeeds.

Check the returned skb before distributing the message and releasing
the lookup reference. Keep session deactivation and activation of the
next queued session unconditional, so a missing receive buffer does
not leave the completed session active. This also matches the NULL
handling already used by j1939_simple_txnext().

AI assistance was used to analyze the bug and prepare this patch.

Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
Cc: stable@vger.kernel.org
Signed-off-by: Xue Boyang <fuchen.dust@gmail.com>
---

Notes (j1939-null-submit):
    Based on mainline commit 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4.
    The affected transport.c and socket.c are unchanged from the original
    local report baseline daf677c2c6449011ee695d55b48b5b2977a36f88.
    
    Validation:
    - Built net/can/j1939/ with W=1 on x86_64, CONFIG_CAN_J1939=m,
      CONFIG_KASAN=y and CONFIG_WERROR=y; no build warnings or errors.
    - A temporary userspace harness executed the extracted completion
      function with stubbed dependencies. It checked missing-buffer receive,
      normal receive reference balancing, and transmit completion. The old
      function passed NULL to the delivery stub; the patched function did
      not, while retaining the completion-helper call.
    - This revision has not been boot-tested or run against a CAN interface.
      The harness is not an end-to-end kernel regression test.
    
    AI assistance (OpenAI coding assistant) was used for source analysis,
    commit-message preparation, and build and isolated-function checks.
    No packet-level reproducer or triggering sequence is included.

 net/can/j1939/transport.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 8fcfd13e5e6f8..ecf7f245f8378 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -1244,8 +1244,10 @@ static void j1939_session_completed(struct j1939_session *session)
 	if (!session->transmission) {
 		se_skb = j1939_session_skb_get(session);
 		/* distribute among j1939 receivers */
-		j1939_sk_recv(session->priv, se_skb);
-		consume_skb(se_skb);
+		if (se_skb) {
+			j1939_sk_recv(session->priv, se_skb);
+			consume_skb(se_skb);
+		}
 	}
 
 	j1939_session_deactivate_activate_next(session);

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
