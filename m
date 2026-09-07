Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14486318ECD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818863; cv=none; b=pPzt3ZqJA2P7s61rqq2vnSSS7uP6/zhVvoXe9Z6MzRW9voS7raBXoSt2wGMwCsEWmbVTEWrgafF/jWE1J1pZakctPF203KazQHUeTmHbqcs3GwMXcZ1THwOg6YFdLPFt/Yx0zaDBvoK8RHtpKWDoBIlGN2Na/q38Hq+IXfFhdYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818863; c=relaxed/simple;
	bh=K1O9/EWYo1lBKzj/LHkCxfQs/NTsRAdAcHbTyTiHha4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMqbBOQ3eBjnuztwQiHQ4ZxOlDN1mX95l1MY80dz+DriX2vTAMkDRTMe4uRgzjk6ruIbZblEAsR66nlvQtSM/dtgXNLdWxmTFPJdOpZcUUdZJzRbfytDKz8BKW0w3PiF+zGWoLYV3ImTgsj6CWfivH7Pi72lSgPYLHfoN4Ur7nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSjZn79s; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSjZn79s"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-930f618435cso440742585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818861; x=1789423661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjx2cSG0Y440hHpGOz4TpM8YmWgHPJ46e1ZgRB1OX70=;
        b=RSjZn79sGCsqZi/pYF9+u7sA9BXaUN0KAsdDefYfPmdCg6ad2/Ghh1lDnooWB2rwLv
         1w/O23VxixFJibKag1v7uwA0UBr4F1jgQSXmplPY6hdfNwOwiMKNYqW42xLqLfD56eVX
         Qe0rYTCaqOh2ZkKbtlyCsMUb6OGeu4PVTU+tIt90FOHTe09HLhKpC487TGyuFhnGdF/U
         yk0O8VDi20PKwUo9QgqFOIZVqOGyvsFEKXfGOanv81yN6N3ghB1y8a5L0Iusrp8bDk7E
         Iaa43/I0T6RGYxq1FrDhROoHeoZeBwKDgie1bzeupdxTg9HjEJ9gVhLknK5kN2gceFdW
         DfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818861; x=1789423661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjx2cSG0Y440hHpGOz4TpM8YmWgHPJ46e1ZgRB1OX70=;
        b=C8JBlN09+n/CzNAkXeojX4P1Z1MoXA4aSaXeoYdeYwcSfXIE84Pq+8SKvZvgA74MmY
         8E8t1a2aXYjjOoWZYMf3ygtAGQTZWoccX/X9x6bPjmvmqmDrEzLdWd3gqUAHoQsli563
         FT3CufW6v8rJ2zY4FFVrna+Xs1LhEm+RLod1HaVn9wWvEVkaAnapwgqs4+7Ga3mXnTJ0
         SmHxW3XtMfQZaMeLCsN5Fuyh5ts81PPWsFeGFyWpbUnqV86tIsi8zwEBTluOgcV33r5B
         HPj2L8kKa8veHDb6iZJ6uotcW4NbuX6czQPAokl1fwWhsUDMbA5DRri6PFMaa41TSXR7
         63sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpU1ADD5tlcY2POV4TkJaHL+Yvi46z8aMGu3s+4i4oYMIW6KmrW5G/bGOaYQnkX+vaXVUh7C045H5aLPI=@vger.kernel.org
X-Gm-Message-State: AFuF++kaNfzHqzAHp6a8FjYW1IcsTKeS3qPXrIrOhJd6QaBjZB5LCOaJ
	Qeq2X2L76IgrA5qBryDBFIodt9FMGHKKUWJHS3WbVSiRI4hwzxcD274F
X-Gm-Gg: AYBFou2Rtvdt4szbrgAzbc6h7jrcn/5WpK0Kckrpx0Hzc1xq4hx+0cD1E648TkltwWd
	X6Ed0R3aiahiG5Ca5o0xkPX5Z1qMfdhSNAM284mnTY6IaatyHjkPgLSR2CrTYuBXSJjbbdKBIVz
	ITyCtfkM/IlzTw/w7wm2689bhS5axwBmdYFBNydJ4RPjh/FqNKpeNsUPPua3JKXDqKw603uZnmu
	YqcU2LW+e6Iy6iBENXLAA4LxAwm7SkuvF4pTeoOQ7O8r8gmFXycJmkdivy6kv067fduqJ18ZuY3
	08zFxCwInhPJmQ4RZgm7sYPyLmkJ4znb7d2Xa+1yOxUc/szvNgeousDOy/FYt0KN/kaL9f4TM+8
	aXmDwbFPxJcjhzTK83qeikrGota8u7fJgdzuzzD8Z8DhD72va3o09kyCLsQX+QTBaGB/nLMNKw3
	plrEm7aRLQxZ7se1hN35GwesahhGe8KqfZ1JLSsogjVLZ2IH4R4Cz4uyf9L/rHMnmfRfBRAzFGG
	wocfL2RNtBWbRlt/obx7rrWr/V/v1n4B4u2ks9mXJiKlThKn+Q+btTj4c3q3yc3fXTuWw3tw84d
X-Received: by 2002:a05:620a:3725:b0:937:3aae:1385 with SMTP id af79cd13be357-939803241c0mr2320238285a.11.1788818860917;
        Mon, 07 Sep 2026 15:07:40 -0700 (PDT)
Received: from philip-ThinkPad-E16-Gen-2.localdomain ([73.8.4.60])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b0493142sm244506085a.13.2026.09.07.15.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:07:40 -0700 (PDT)
From: Philip Popko <ppopko03@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philip Popko <ppopko03@gmail.com>
Subject: [PATCH] selftests/watchdog: remove stale WDIOC_GETTEMP TODO
Date: Mon,  7 Sep 2026 18:05:56 -0400
Message-ID: <20260907220556.53041-1-ppopko03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coverage for WDIOC_GETTEMP is already implemented, but file still
contains a TODO claiming that coverage still needs to be added.

Remove the stale TODO.

Signed-off-by: Philip Popko <ppopko03@gmail.com>
---
 tools/testing/selftests/watchdog/watchdog-test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/watchdog/watchdog-test.c b/tools/testing/selftests/watchdog/watchdog-test.c
index 4f09c5db0c7f..74a581250829 100644
--- a/tools/testing/selftests/watchdog/watchdog-test.c
+++ b/tools/testing/selftests/watchdog/watchdog-test.c
@@ -5,8 +5,6 @@
 * - Tests Magic Close - CONFIG_WATCHDOG_NOWAYOUT
 * - Could be tested against softdog driver on systems that
 *   don't have watchdog hardware.
-* - TODO:
-* - Enhance test to add coverage for WDIOC_GETTEMP.
 *
 * Reference: Documentation/watchdog/watchdog-api.rst
  */
-- 
2.53.0

