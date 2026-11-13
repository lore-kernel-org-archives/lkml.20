Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582482;
	b=WZXXRgXpelD4Xwp8shUqBeS1g1JG3F33W8nCfjeg1vHZGeB+bWbYrsne0zYgonbA3d59
	 ldZt3GU5ouOq/gXMERI+M/npzs+HQXb4UT2hXW+l6NfYZ2LhJ8nRfGIeOocojXZTD43EH
	 ZSvrRP+CM5IKdEgWKIxB/q+1aE1D07wOkR5baRFl5B/yKs3hPOPBcC5vedrsAatZt3jmj
	 Te+ZjFKUFdypobzNPLYHCNW3GhfpVy7GmRvN3GQB1SnLppxFzVmf2tIC5SvWpGebLIs1d
	 hC/9EKfQ3KRZnrz+wcJhSyTlqV55bV6z/RSsdtpCavpuM53D8BKADKq2Z5iv6kmLMgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582482;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aOrKfpbFYffgtTODqXNpk01o8WFHQPGbS4apVzTT7bQ=;
	b=NHjVMeqbJiGo+5GzJQZReSiVSM6DIkN4ep2fhuClBVCsBMAFN5ueQOPEphBYuI3GBYb5
	 ATKFLyVlwlkLD9rlk/CvLXLg4Re1Xiic28+caCoFJkoKlHt17p4kB2hXpp9cLsBFf9vlT
	 Q1ZYVSFYOtSIxW5YSNDhkC/DJII0S0FNvidIyXJf+dS0MSywbQnRYODgNJ2CNK1YyLey9
	 Q95NvwejSCQZlPf+ZjIUUMSEOoVAFcqQYY3tUZFPJnd8G9KDS4gV4AvFksfE3FmzeHJcu
	 i3lH0v17yIOo2dtEF16mbYy9Ffg6F1FqJzpHFpIfLqtae1ozHXltYTb95HmTrv2x1sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ipm2ljuh;
	arc=none smtp.remote-ip=95.215.58.71
Received: from mta1.migadu.com (out-71.mta1.migadu.com [95.215.58.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD0D606A896
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD0D606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ipm2ljuh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5JN5ghI8dNw9QS0mTyFnJuNnXSuxG5Od9sIgQTg8Rss=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794582479; v=1; x=1795187279;
 b=ipm2ljuh89p+MZIQXU33RzY4MuB1Vxg9XvIjcS7OMHudXFJJv24l/QkflnkA2mYduWsRza54
 QmR+IomLiLmC2VEgoHNbMl462ECO4XVGeb4W17dznlZujBECOqka9t5myQtyK3ILw+HZCcqm6dL
 YsN62VGocIqqUWtdBFtKNOMY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 190fc832efd7b1c5;
	Fri, 13 Nov 2026 15:07:58 +0000
X-Mizu-Trace-ID: 190fc832efd7b1c5
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Oliver Upton <oupton@kernel.org>,
	James Houghton <jthoughton@google.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] selftests/cgroup: Make the object directory an order-only prerequisite
Date: Fri, 13 Nov 2026 15:07:57 +0000
Message-ID: <20261113150757.646085-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The cgroup_util.o rule in libcgroup.mk lists the object directory as a
normal prerequisite. The KVM selftests include libcgroup.mk, so for
them that directory is their own $(OUTPUT)/lib. After any incremental
KVM build that rebuilds an object there, the directory is newer than
cgroup_util.o, and the next build recompiles cgroup_util.o and relinks
every test.

Make the directory an order-only prerequisite, as libvfio.mk does.

Acked-by: Michal Koutný <mkoutny@suse.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    This was patch 2/2 of v2 [1]. Sean took patch 1 through kvm-x86 and
    asked for this one to go through the cgroup tree [2].
    
    Changes since v2:
    - Collected Michal's Acked-by.
    - Rebased on cgroup/for-7.5.
    - Dropped the Fixes: tag, as the patch only saves a rebuild.
    
    [1] https://lore.kernel.org/all/20260922071945.693714-1-fuad.tabba@linux.dev/
    [2] https://lore.kernel.org/all/avJqZzKX1ZVAMGr-@seanjc-mac.roam.internal/

 tools/testing/selftests/cgroup/lib/libcgroup.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/lib/libcgroup.mk b/tools/testing/selftests/cgroup/lib/libcgroup.mk
index 7a73007204c39..bcf6fe2516223 100644
--- a/tools/testing/selftests/cgroup/lib/libcgroup.mk
+++ b/tools/testing/selftests/cgroup/lib/libcgroup.mk
@@ -13,7 +13,7 @@ EXTRA_HDRS := $(selfdir)/clone3/clone3_selftests.h
 $(LIBCGROUP_O_DIRS):
 	mkdir -p $@
 
-$(LIBCGROUP_O): $(OUTPUT)/%.o : $(CGROUP_DIR)/%.c $(EXTRA_HDRS) $(LIBCGROUP_O_DIRS)
+$(LIBCGROUP_O): $(OUTPUT)/%.o : $(CGROUP_DIR)/%.c $(EXTRA_HDRS) | $(LIBCGROUP_O_DIRS)
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
 EXTRA_CLEAN += $(LIBCGROUP_O)

base-commit: 80bf33fd523ee1df2d265d34970df670a44a2ccd
-- 
2.47.3

