Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908D2E5429
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354046; cv=none; b=XX7Ztv21EoWZ9MST4sUKSUUrM2GnFT8408it0yfwk940CvWWcOiIY6IPGJCJObD+8Ihi5VQqak0cPy9hPzuYSU1/zaMuLspxP1+csyWoh3AlnLBDn5bXF0TbRaFeNv1Gmnp5ORw1RKLZubnCQm6GPxdvkOG+cc4q7DY+a11MPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354046; c=relaxed/simple;
	bh=7zxqK1EC2u8mu/Y0yATQjVwM0lENPnbrRovA/y8nR4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epNdz7UlfyWl7yuipy6OvK5OMLqBX73PAdzegT+l/4CzFR6bO2nRR7SwqgB3Gv8NspclOqaSTUmAfIvEP2Boz0dWJscvvJh+qkj9rfmPjbRUTwh4kboLqzb+jbXtpRu9py8GJYX2khB7jfEDIELKvVyaMyKGdkNZkwc/b0KWi10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngQMs7uc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngQMs7uc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1510788a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354045; x=1789958845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Z6OvrHx3LTUPgb6h5n2rsH+g5fMXj4Vyw5P9qxQEbA=;
        b=ngQMs7uc0sF1Ex1vSTL4NTeugBuqw+sNqKQlxf9IHJsRxFfDPkBJWTrLqLHEX7SAiO
         HHyd7KKcUnLQvaOrBwrX985rzkcdIpvvI3PgwAO1ZzCBsvq2BLi6hpsRIBf4rGd8TtjR
         99uqM613ioIEMvuqnVW5VKu87vAwsR6toPvY7WV9e9EmesDeLfq1Dap7Fh4dn2nOpVTK
         /ql837N/oVcFJAoUp55JYLtuJlzoPHJxcDxwCEvuUO8WAhrtur9papfU3jcPuS7nXAhP
         vAnYNml4+BMKbgqLz3GJ87hS4G5rqBpXfksOkSwHQoZXoSzrtS/aGncnsukUDbXeWCQP
         1OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354045; x=1789958845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Z6OvrHx3LTUPgb6h5n2rsH+g5fMXj4Vyw5P9qxQEbA=;
        b=Y4/1sO6Qn8MofUEgeiRJKD0wXIUL1fVX1G0TS1ztf3aWWFRUmfDSLGtSR+q3v09WAE
         OUeyEvMC+27cG3GachY/pPXTFSQRhPxkjUFW1WNzwzBcYuFysE1UdZ+gf3s8K0XMWSse
         QWa7j7lUs1hDKoqgWXxt87mNtZRInefoumpLkBy8yez3uC9xmMUZzaGY7UrZQ+7WO1fu
         0P2Bi3UE+RRqvcy+6SGMJzFXntTgAPVDT7etFnpmEabEShD/BHzOrscwtFh5yY47/Tuh
         54dkS05hcvyyxKZtWCsWPZb3u6NXqBdNY0eqv/9GfDQDnpZLdDGrpngkOs+JnCyG7TyZ
         RIxw==
X-Forwarded-Encrypted: i=1; AKwUvBytKgA7Vpf5YhWI71TXhJd/z2BPREtfB8/ti9nz2nDc4jcwOHt2PEM26tXokBnBCECi8llDdf9DuxbnvqU=@vger.kernel.org
X-Gm-Message-State: AFuF++mOvpWl7DyPpVXSko4blktGL30LdtEBMwyrIRKLJZWATOPCaYj6
	ARA90scXHQqrQOiy6oZwyOZ1FDxQq/3/SexH0KDYp/sl5ZEydytEPLwH
X-Gm-Gg: AYBFou1SoSFy73uHUjfCC+zwbEEYglLxOPVNogOwLPbHsWfMO5ChSMl6A5ZR8KSLPik
	lWWH6Tdeks/HkQtd/8pvw3igRd8TTHIhJz1bxzjvtgkXjLdgvXJbG7Bkg21KjS+flq2Cd1Dk7Ql
	GvWmVvXR/qbPE6APJ7hplOH3FQFbb6uWtOSx+GRZNnmjpRMa21GLm/8xoHo5azBtqc7Ux2iIpTZ
	0oB1t2QRpBNFfXJGjrHHcrWdnZzquOlqQsZkbKA4clPc2QUPyiAWcsl6lXPQbJZhjk2Ep3BrtuC
	2WgGgRx8nvxkyRf08IXHEo5/oElAUkGgBtw88kqsjRh3NT/umGgTjeNyVG5L0iCn8UkiPL2SdnY
	+yOPC3F8skJgyObUOlm7YELndABUPbjXUZwb9CUeFh81vbf4hd5UOQxB4an5QcgASvnn3AbviDP
	YXWtpwCSq169DPyRyfCag0xHEsEVv+zVQ99GqQpMTJ0LToFcDlqTU69ZK7p0HA8TOBYWCmflsyy
	58PVnCbqb7URtktic4Tvd44LnyVEZovMw==
X-Received: by 2002:a17:90b:1343:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39debfb227cmr1756193a91.11.1789354044855;
        Sun, 13 Sep 2026 19:47:24 -0700 (PDT)
Received: from Alone ([2407:1400:aa0f:8050:5aba:c339:8cc7:e5f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dbca4c9a5sm3718447a91.0.2026.09.13.19.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:47:24 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] selftests/proc: Skip setns-dcache without UNIX sockets
Date: Mon, 14 Sep 2026 08:32:05 +0545
Message-ID: <20260914024705.706372-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setns-dcache uses an AF_UNIX socket to distinguish network namespaces.
When CONFIG_UNIX is disabled, socket(AF_UNIX, ...) returns
-EAFNOSUPPORT, but the test reports the unsupported configuration as a
failure.

Treat EAFNOSUPPORT as a skip instead.

The change was verified with CONFIG_UNIX=n under QEMU, where the test
now exits with KSFT_SKIP, and with CONFIG_UNIX=y on the host, where the
test continues to pass.

Fixes: 1fde6f21d90f ("proc: fix /proc/net/* after setns(2)")
Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 tools/testing/selftests/proc/setns-dcache.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/proc/setns-dcache.c b/tools/testing/selftests/proc/setns-dcache.c
index 60ab197a7..f4e958068 100644
--- a/tools/testing/selftests/proc/setns-dcache.c
+++ b/tools/testing/selftests/proc/setns-dcache.c
@@ -17,7 +17,7 @@
  * Test that setns(CLONE_NEWNET) points to new /proc/net content even
  * if old one is in dcache.
  *
- * FIXME /proc/net/unix is under CONFIG_UNIX which can be disabled.
+ * Skip if CONFIG_UNIX is disabled.
  */
 #undef NDEBUG
 #include <assert.h>
@@ -59,6 +59,8 @@ int main(void)
 	}
 	/* Distinguisher between two otherwise empty net namespaces. */
 	if (socket(AF_UNIX, SOCK_STREAM, 0) == -1) {
+		if (errno == EAFNOSUPPORT)
+			return 4;
 		return 1;
 	}
 
-- 
2.55.0

