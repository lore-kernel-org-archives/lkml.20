Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6E64503E6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604875; cv=none; b=JjXW/TLhVBOoRXH7qyTaP4WdinP8Axa6FAg9NbHBOK3oy+Glq6qbrqB42Yv/Fob3hyayDjQ1xluMnCyneZGfYkE1xne43kbmq6xTJ51VDNei7wRhrCtknx4RXZCrodxu4VxuHBfo3k31+bNpMbD6LD8XoNAkUu7JAzoVA1neRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604875; c=relaxed/simple;
	bh=3H7DWsjdB2t1XmW+qQclm6nGtSHSe5mjsU+kx9BBsDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8vWVO0rM3nNKBU560btUgPgtoTEWU4ArWN+c+KL/FUnpFUCcQ6NULLX8upLQPqW7eUkC3Uaqcs4Iloduy+BytZXeeMtFpMb0Jd+j7lTOA6GHd/ikyqArfUEH/QAloXbveFj6bpbWawr0YgZmojuYoB3lc3/oxgCQRQaMHUhK0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ox+SKv45; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ox+SKv45"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1089929a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604867; x=1789209667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9d1us5ou1/R6dn+w5YFLXgBK3EMQL/jKg3S7fI7Edk4=;
        b=Ox+SKv45BlaCEgLEb11cuz3fFHPGcjrNp5+W59jn0QCLx7ScN0xBi8gARYNmidb9iM
         YSIfySIz3j8o9LU6RWKcKs3/YcIYecNaE4l0Cb09pykqNr92+mUEQOpUpZg5ynlQZuM2
         lILrZbOqaiKyIUsyPx3OJ8Ynq9S8LcfwjQUrprSadJjI+m3nSNPEO7tHOAFTHYeLzuCI
         t1aSYao4Md0PGLXYGXaVSN88rheZJDNtQh6PT1YhzKU2x3B3gxMoy9me7jmSskVquWn5
         BRsvb1avRdwlV1RMXMbCsB34cv7F4ETuhDFVXeFSyRDGhclxkZAZn5/udKBzxEQb8/fc
         WkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604867; x=1789209667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9d1us5ou1/R6dn+w5YFLXgBK3EMQL/jKg3S7fI7Edk4=;
        b=kkkhX4coaPCfZjH31K4EulWRc9FJheTy5Dovk9AIUotsLeze/3PO/12hJ/kGZ7EVSb
         6GOK9utJQxSE+yts9CrNy2V/nCFI2YlcS2zBMkjpFkJwTwhOg2Xj5mQ9QtV4zKIi8s/s
         3DxLGrw6XM2Cu8HYilFcVanyWMnknZsdcpqfWP4J67gXTWMdQmy3uDHwG453NQl1Py38
         vVHTVlTaLVRDm57FFV0zvdvdS/FrhKvIMigZwY2jacQN7FKcp6O7yhxU6ExPsu8L7uhZ
         z4nW08BxCdkT9jTZFux/BSWTPLYT2Y7YdBd/HFytyLzW8rm44UKPYBPjbrV1Rt5ULXD3
         ZILQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ6NlG3tMzP/0/Z2v1HgIZEjzZoCevEQKrVqnA1dKJpBWg9NyQide36bU7B85qB9Jvl7p9pqQnn1BB/e0=@vger.kernel.org
X-Gm-Message-State: AFuF++kp5sjNUhmhI8QdyQ50e4QfbbGu6Mfs8RKbBBwWpX1zC0UTZzAh
	RmS5vf4nzFG5ivDqQ3uqmPOKTwIJ2BJkofuL6reT0ghdJp590u4Gg0E5
X-Gm-Gg: AYBFou32VUX7wyM46NpSUPqWcXXC59KVjm1qUYhIf5GIdpAAgde5jwqoWLicsDCc0Mp
	bhF/pidGZL3epZL0M9mWvc/za2LvdGvwufHN7k8X7dTSxekllVOIQMEhrgivmfe6Uv7gCTzUdtW
	owvTP78s77LGK2S1YFXxWmt14q8N76jVeAP8JgTQpKJ2F+CXdudr/LyxpxjqA6mD5Hw8HJOq88P
	U1Oh7oI3MOmZ1Drk1JoXGvdQm0MzqoYCIHXkV3V0zbuYISh6bUpnpLuehQBFdQQ2KByFxdlNGv3
	+9iKlldK+j115ngn92MTWYIjhbxt41WWTMsgJppPb332QqOQmKjRrwjSHQdPjX4YwqoppIy4CgV
	gwPapD5XFLiEN20qI06hYdXqiQ4KsUewKdLmTDwfRMI1ffzPyz7x9Wv9bmXJomoCVc4PwS4A3jt
	zJEDHzegrNlo1MnV5HkN+GnbFubM5V3fZ/BYbC772BD1pvR8KzsVQzNQ==
X-Received: by 2002:a17:90b:2b8b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39b26272f0fmr18850197a91.15.1788604866501;
        Sat, 05 Sep 2026 03:41:06 -0700 (PDT)
Received: from houminxi ([154.197.57.228])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm13559776eec.19.2026.09.05.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 03:41:05 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@google.com,
	i.maximets@ovn.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH 4/4] selftests: openvswitch: suppress pylint complexity warnings
Date: Sat,  5 Sep 2026 06:40:26 -0400
Message-ID: <20260905104026.3776396-5-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905104026.3776396-1-houminxi@gmail.com>
References: <20260905104026.3776396-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add file-level pylint:disable comments for warnings caused by
pyroute2 framework constraints that cannot be fixed without
restructuring the netlink attribute hierarchy.

After this patch, pylint reports 9.93/10 with 10 remaining
C0301 line-too-long warnings (81-89 columns) on f-string
constructions that match the surrounding style.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
base-commit: 9eab111e765729e93087ff86a2ec9b2ae42d0fa5
 tools/testing/selftests/net/openvswitch/ovs-dpctl.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 5b29aeb4b50e..5948471ffe63 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -1,6 +1,14 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 """OVS datapath control utility for kernel selftests."""
+# pylint: disable=invalid-name,too-many-lines
+# pylint: disable=too-many-ancestors,too-many-arguments
+# pylint: disable=too-many-positional-arguments,too-many-branches
+# pylint: disable=too-many-locals,too-many-statements
+# pylint: disable=too-many-return-statements,too-many-nested-blocks
+# pylint: disable=unused-argument,broad-exception-caught
+# pylint: disable=no-member,not-callable
+# pylint: disable=non-parent-init-called,super-init-not-called
 
 # Controls the openvswitch module.  Part of the kselftest suite, but
 # can be used for some diagnostic purpose as well.
-- 
2.55.0

