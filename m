Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A9C448B96
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364320; cv=none; b=IKdT/4KB9wmdg+S9Z5TourUz97WAwGmKYDuiK+AciwNUupKd8EO7+53aa9VjbuH9PqW2eCjwRxgAam8fWMgbKTUHqTp4z2QPOMybEP61n/YIAyWd1NwEfWaqWCSv6SlYw8CoeJlonCrO4qMfID3chuESsBXQzfzUE+Vv8DLNei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364320; c=relaxed/simple;
	bh=j5Njce1R2CzMDzpSrCt4D4C2yKngQ2KuqhBpl1pHhmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t3+4oyktkE4XVoWy4zU0tBDdVo5/rh8ksFQ9z9C2UAMj5miopatkMTdZ6XcscmO40PKTAXuiy17I2UD9IAYtgJzEPbcmmiGqUx9koADpv5W/1Pp0GwL/Z50z6PLZeISYUY5FSOml6E/nzd7Wa9Bv5okSSXWlXUT0zqoYMIKWkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZEVauiQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZEVauiQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so792008f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364317; x=1790969117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G9E+sqsbctWeMKlnS+UkV61JpHdXQmDR0/Cg9hJ8tHo=;
        b=CZEVauiQEUUSshI568NztLVATBws7TXi2Zw2Ovcz0GRj7cZIcOjkTw/jvIL0WGzWWj
         xXqQ562xEWyLL9IB/V/wskVU3ZTAt40Ct/mbKk8IDciQB5KgRsspOo7hDmuyifpfzlMM
         82SDqR+l/ZiUn0JtjFPjUBD9STlJQ9/04jpghtw5DVJ4r+meCYtstNRrelvNPluixHx2
         O7WFyvaYq058kl33hPQ6czuFj7cnF3KmnEP/JpAqB9ialZPL0BMCXtYNPGv0JVYudldn
         iGZxbUC/9kVbn+FcWS8Hun+DgiNDV7e7J9tuPjptgKynbzmfTBIeBskqMQ3YKWID4sjA
         kzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364317; x=1790969117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9E+sqsbctWeMKlnS+UkV61JpHdXQmDR0/Cg9hJ8tHo=;
        b=arTV0xDfHL7q6tGcLk9q7jkC30+JLgQ/rNIdGyMx66Gf2tgVcC27cCjhA/JWLdvcJg
         9XV7UtnzmrqcWCeJ53X0J7373F/zKwCuRkC8WAd4W0+JAQqd5WgEMEoRAG3L5pQd751j
         sn+jU8dvyQgMSw2D/kIfdOAYwk5MWtRCDDqR55UEukLubA4YqR4UFOvdZPbs0FxjcFql
         7w6UqnCtLv5BxlKByvqu6MivJtWpWHEUSpeXP72Faq1nWsTnDvirZRFr8KnVILV9Gh1n
         OmBuz6Kqa3YdbfdoRESF279vFFgxc1KAc6TgUjdnhRI1C/cQ6Bxq4XCYUOsOXvsWAWnh
         qGaA==
X-Forwarded-Encrypted: i=1; AKwUvByusriIy0Gyan7axDrCH2QZBusZ40/7J+74hqe8l9U5j+von1ECFsKwQueNSIjNEAYiFLmYcp5EnpqZ8ik=@vger.kernel.org
X-Gm-Message-State: AFuF++k4aq5Oic9cRxGUcG4/PLC5HQcIJoAiMj/zn6qJZ038h+GO5aMe
	gbUrt3bN+ZOFLSn0fyVaHfIvsHy/wXwkuJsYrLAen6CCLOEkKCI95eNP
X-Gm-Gg: AYBFou2Miu7aEO4oI+D9kmztIxV26uEUvhwmHhYe4kgqI/j1j1RtiOVdsULcew7X3HA
	n26lA4VpvBuBJcSQbhk9kluYVyj04eJf2Ffyx990syFaAsSEvTy0Ac2eo41xqdK0QjqE/p2H0pI
	sJQg9vAv2UjQOJkHn9JbK1d5zRBwYmXPBb/M42f9KoqEURXI5Jncl0X+ABrbxbZjo+ZXTqyb02L
	LpnRBgXpIHcH5ZRhu8uzDK/gLUKa1wXRcI9N2hJ5HiFNCY1QWKZvwvZUUSrFIO3medz7Rz1pUL6
	OSn/xGpGgNIZjbqgsd3zRck4nr3waF4Bv1ktOExz9p+fpPO0Cj/AB/HgoqFve6zVgK1WCrrFwGL
	kRxNO0J9bAj9Lk6v7H7/dX8SJAKFNav0xIb5Zz9HY1yf5ujNpmX7lrY5JPFAJzXY66DwuV/79Iq
	IXQtinZHSdUPhKJn+RDFUx0erzFY5DRaa8v/DS4ZajVbKboCvRDFCCq3JvZrvYcJDXdiqTfxway
	zH5MEUpIq3h4ugDeZkPsfDOLhh4GvBhjpkZhzxlUlBnhKQ7meLNHFDLwCoeNix+kEfmy/xAxqnY
	E6JL5V5mFBzzyxs1wenjNjZOEU4VGdlDdgb/sRrm2anOShkSQyF5Wizi/vplCM8tHzkd6b9b1Qq
	lt7PaSmA=
X-Received: by 2002:a05:6000:26d1:b0:487:8ec:1fc with SMTP id ffacd0b85a97d-4887d9fa635mr5543814f8f.12.1790364316713;
        Fri, 25 Sep 2026 12:25:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-adc6-9c01-89ae-b145-8960-cf19.310.pool.telefonica.de. [2a02:3100:adc6:9c01:89ae:b145:8960:cf19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm10205982f8f.20.2026.09.25.12.25.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 12:25:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: mctp: Stop selecting flow support for KUnit tests
Date: Fri, 25 Sep 2026 21:25:10 +0200
Message-Id: <20260925192510.93840-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MCTP_TEST selects MCTP_FLOWS, which also enables SKB_EXTENSIONS when no
transport requires them. Remove the selection to follow the dependency
rule in Documentation/dev-tools/kunit/style.rst.

The two flow-specific tests already skip when MCTP_FLOWS is disabled.
The remaining tests can run in either configuration.

Fixes: 109a5331143d ("net: mctp: tests: Test that outgoing skbs have flow data populated")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Validation on net-next 42a9fb3382fc: x86_64 LLVM builds and QEMU runs
with MCTP_FLOWS disabled and enabled. Both suites pass. With flow support
disabled, only the two flow-specific cases skip. The enabled configuration
uses the I2C transport to select MCTP_FLOWS.

 net/mctp/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/mctp/Kconfig b/net/mctp/Kconfig
index d8d3413a37f7..3a5c0e70da77 100644
--- a/net/mctp/Kconfig
+++ b/net/mctp/Kconfig
@@ -14,7 +14,6 @@ menuconfig MCTP
 
 config MCTP_TEST
         bool "MCTP core tests" if !KUNIT_ALL_TESTS
-        select MCTP_FLOWS
         depends on MCTP=y && KUNIT=y
         default KUNIT_ALL_TESTS
 

base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
