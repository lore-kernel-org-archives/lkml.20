Received: from mta0.migadu.com (out-194.mta0.migadu.com [91.218.175.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77703C3F6B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027642; cv=none; b=o+UHit6VfE/l0tJPqae8CFJ7lU2ZqutR8Chnlr2ejfVMf9ykP+sOEPdc2ZhnewWjDuWFW7TChOwye/mNM9W2CG8c1lTUQwsj0YpFU3gkoFKh0dqxD6wHM2BeHaVVpmZaxmSf3QedT46oSslkcOXfl89WK6+/cofRPa49zQQE24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027642; c=relaxed/simple;
	bh=RNsmLPwonwNvXWmvwdyUuCmNIqO0zcfuzsQ6a72c5uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hKZH7eEqgbOJysFW3I5ZF7dLViMPhsQVfo2+GleFTDy/cELuf6tgFeNB57dYwshOTskFlAW8FYKzay8DJ1jn2EBD1BgvxHRDnEX9YBjOC2mf5yLs26E3TGJSc7WzL2MFem6qmSP8byGhNlk4plivemTiRyrjSOEONJcv5+W4GOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UR3ShMZT; arc=none smtp.client-ip=91.218.175.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UR3ShMZT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RNsmLPwonwNvXWmvwdyUuCmNIqO0zcfuzsQ6a72c5uA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789027634; v=1; x=1789632434;
 b=UR3ShMZT/lLmRhfgwNzLasLRXoe/rCii7Og3IXCumvSCxti/TT6JxZ3mxTybw5+fBTB5SEeB
 jU7LIDZozLpomb+nuSSrboBEgMufdLdv3U4panC4MCHcV5o2kgP7atMesxYms2MHWdnZdv/H+C4
 A2sQV3YLqFGdO3iwlbXRxxzE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7030ea7761e91a2c;
	Thu, 10 Sep 2026 08:07:14 +0000
X-Mizu-Trace-ID: 7030ea7761e91a2c
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 10 Sep 2026 16:06:58 +0800
Subject: [PATCH net-next] selftests: netdevsim: add TEST_INCLUDES to
 Makefile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-nsim_lib-v1-1-0be0d49eaa42@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0atI1hZqcb6KiHSIGtAorYhQvLvF5
 YPPjxDQEwboswgebwp0cEKRZ2BXzQsKcsmgpKplV0jBgfZpIyPKtrOu0maWTQkpPz3O9PyrARg
 vwfhcML7vBy7FUu9kAAAA
X-Change-ID: 20260910-nsim_lib-489cd5abf074
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

From: Hangbin Liu <liuhangbin@kylinos.cn>

Some netdevsim selftests source forwarding/lib.sh and other files, but
the Makefile doesn't have TEST_INCLUDES targets, which makes

  make INSTALL_PATH=/tmp/kself TARGETS=drivers/net/netdevsim \
     -C tools/testing/selftests install

failed to install related lib files. Add TEST_INCLUDES to the Makefile
to install the dependencies.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
As there are multi nsim selftests include the lib.sh but no error report
for the installation issue. So I won't bother fixes tags and just post
this patch to net-next.
---
 tools/testing/selftests/drivers/net/netdevsim/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/netdevsim/Makefile b/tools/testing/selftests/drivers/net/netdevsim/Makefile
index 9808c2fbae9e..bb90fe89d9a1 100644
--- a/tools/testing/selftests/drivers/net/netdevsim/Makefile
+++ b/tools/testing/selftests/drivers/net/netdevsim/Makefile
@@ -22,4 +22,12 @@ TEST_FILES := \
 	ethtool-common.sh
 # end of TEST_FILES
 
+TEST_INCLUDES := \
+	$(wildcard ../../../net/lib/sh/*.sh) \
+	../../../net/forwarding/devlink_lib.sh \
+	../../../net/forwarding/fib_offload_lib.sh \
+	../../../net/forwarding/lib.sh \
+	../../../net/lib.sh \
+# end of TEST_INCLUDES
+
 include ../../../lib.mk

---
base-commit: 63487bb38a97918656751a2a4b74809bbe22eacb
change-id: 20260910-nsim_lib-489cd5abf074

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

