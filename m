Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD744F7CC5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628847; cv=none; b=SJqERIHUpKmnVaK2uppbyHAob3D+Nk9qyMnP48XishZSkdINz/89IOhKMTJKNnCnl8ahNigoqnSnjKMiV5bb+MzHod7J17tqGqaaygs6+/iQghix62A5sevhg4NoKXmqDkqLJzbAk/H0MmcJjlDAKE/zFdcBOz4Zz8jolfg/IpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628847; c=relaxed/simple;
	bh=p4z8FqgH2wRH3DNXfLP/C8tVgznBcTgSwV5kisQHgOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oWAaiGYPYetgFcNnpBY78un3ZmEVzMuIDzTdKM8KA284AZdmYyQ3sHARhgl7UUq/Bny6k0FCeOBg4+BGT9A3R+JA+OrRMm+5wseKvfpEWwyws/ICxNnEczYLjP530drdiMNAzdAhrPvuP/vz93lPUGxZz/d+9z2hwKPxgfqTGdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nizLRGAa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nizLRGAa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso11722555e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790628844; x=1791233644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoftrO08HwDktpofinrTBCoRJxn64c18AOQxxmnppJw=;
        b=nizLRGAaKFUMCIahkZZE2GItc1v6vkpzHOzS/r8qI487Td6UTZcGg7REC555U9QtyX
         axizRcFPBZ6Lv5TYF102D2O1EDk/AdN3kkdXDKGwjHK7dok1oSa+qrAnAj5rM3uYg2+s
         0QX9P+BRWYZj3N+9ReyoD87Go57wyskAS7KdvL6431DLvoX4V2u/bo5lBv+Y1QXY0yy3
         /JE+5rV1jtMeCcQaPLPDZu1K+ELrv8L+WoSwIttqlheGpoZ+gX0SjBdBFDedGGOk7B8Q
         mZscQevshL2fGEbhAnD9mpcAqUWSorJyhn3lZoTUF0w9tuN8uMNaX9s2DLeTpNl2tToh
         RsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628844; x=1791233644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MoftrO08HwDktpofinrTBCoRJxn64c18AOQxxmnppJw=;
        b=xMX1XgbdZaqhLkgDzJ3A//y5AOZlg5gGYkLTmB/0Am7TUD+kHQz83RXc2lNXn0TCcX
         O4UFhX0ZElomwVqmRj/6b+paFtgoyEgr3gWEa6hijyzU1/Mcw5TbRFLZDj2meEq6MxeY
         xXzpS1yR97IamWgE/mhRlXKZ9z5u9hz+nK8SHT4CeiiyN8detW2ICp4lABWaLxvwFR6S
         T9cyEJmIyVhQBtTxCGxnAqY/xm20hZiju1ADwOmiSyMQtERkrpM8KJ04vawl/eiqKcxc
         7MW1zPbR64ISn+E/iI0QsGx1p5b0LRXlcPwGt+CcEx78VPH3FXnWeSY7ODn9f6Dfp1LF
         1Lqw==
X-Forwarded-Encrypted: i=1; AKwUvBzH21r9iitXERV6891VCL6yh4NbWkusmfR/BmrjZce+5fWaqy69gyfSvSMH5NCjSt2PObZDTMdgPLt6YIw=@vger.kernel.org
X-Gm-Message-State: AFuF++mp7PXBhhC1qDEG7SuIDDvwLzvFRwAEVenTD8Aj2SZDCpKa0IYO
	styplBCgYssHoco8oRxyy6W5GYTdVvUOdQXpKlGKelmPSljR9MeSJi4m
X-Gm-Gg: AYBFou1r3nZ+II3tHD6gMylLyMSs/LG1+BsbaCI3VTJc43DC8lLd91V96MTh56mq5+W
	9E6ZVu6Jj8t91Jbim6FMT7dQMjBq+S/gXzlHbLdoHnB4NePQMWTPMyHohch6qegnKImARTOrE2v
	kxsc2JwJthlIiGMOhFg9k3OkdgKatrIQ6Rt9E0Cpg5X4hecm7tDMSu8K3RZ0rJKw0zI+ReCTEVv
	9ThO2qkx9/lmsKZGIkc/Y+2UhW3PBjEmHW0u5DF+K52HEOpHC3rXhP5qHSe2RljvohXf990gwBV
	w/+p4RLANZyvvBMepxvZ0byxtzdoJDyQPIjSFOGqmPozXjR2ax8k4Lk4zPisWKAUSgE/KRpBJdB
	AClY4ZOwZcDx0/nhgDoJu6ghhUGAGdyEoiwu6ter1oag55wfjwNL6CUs4tCzN6ylVp+Od8HSqTQ
	SY9fHcQEFMwNkL3RoTPqeY4/W5h6CFceCqfrwcGnKPtIew+IczfYUILuo1A8GrNDAbXfFoQhHey
	dSOz4Wv2ZIjID8MSRvZdp01ePfDxpLJMuDc3tLzYk1dT4VjEJbY/1RNnAdAGsRwR6Bwzv5KYih0
	iXOKjA6nIaIoIQLQCbB1Buot0m+tKVWBLDIFhcVW0bZSyAagKdAp513vNTMs16b/kNasKrCv+bs
	HX4G2x6l5CDE=
X-Received: by 2002:a05:600c:8a1a:20b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-49ff0bd1ea8mr133111765e9.23.1790628843492;
        Mon, 28 Sep 2026 13:54:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acba-a601-4494-3582-465b-0eab.310.pool.telefonica.de. [2a02:3100:acba:a601:4494:3582:465b:eab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm21210805e9.14.2026.09.28.13.54.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 13:54:03 -0700 (PDT)
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
Subject: [PATCH net-next v2] net: mctp: Make KUnit tests depend on flow support
Date: Mon, 28 Sep 2026 22:53:52 +0200
Message-Id: <20260928205352.30502-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925192510.93840-1-kmehltretter@gmail.com>
References: <20260925192510.93840-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MCTP_TEST selects MCTP_FLOWS, which also enables SKB_EXTENSIONS when no
transport requires them. Enabling tests should not silently enable
additional kernel functionality.

Make the tests depend on MCTP_FLOWS instead, following the dependency
rule in Documentation/dev-tools/kunit/style.rst.

This keeps the full flow-test coverage: the suite is available only
when flow support is enabled, for example by the I2C transport.

Fixes: 109a5331143d ("net: mctp: tests: Test that outgoing skbs have flow data populated")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Depend on MCTP_FLOWS instead of removing the selection, as Jeremy
  requested, to retain full flow-test coverage.
- Rebase onto current net-next (014d795c7383).

v1: https://lore.kernel.org/r/20260925192510.93840-1-kmehltretter@gmail.com/
Review: https://lore.kernel.org/r/8edc4e71edceb124e2dca233cddb75e198b53a51.camel@codeconstruct.com.au/

Validation on net-next 014d795c7383: x86_64 GCC 15.2 builds and QEMU
run. Both MCTP suites pass all 80 cases, including both flow tests,
with no skips. Kconfig checks cover flow support on/off,
KUNIT_ALL_TESTS on/off and a module I2C transport.

 net/mctp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mctp/Kconfig b/net/mctp/Kconfig
index d8d3413a37f7..e64d4f7ef6aa 100644
--- a/net/mctp/Kconfig
+++ b/net/mctp/Kconfig
@@ -14,7 +14,7 @@ menuconfig MCTP
 
 config MCTP_TEST
         bool "MCTP core tests" if !KUNIT_ALL_TESTS
-        select MCTP_FLOWS
+        depends on MCTP_FLOWS
         depends on MCTP=y && KUNIT=y
         default KUNIT_ALL_TESTS
 

base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
-- 
2.39.5 (Apple Git-154)
