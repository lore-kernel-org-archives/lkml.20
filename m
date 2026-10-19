Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433468;
	b=hFEoEVWvjg3vVVdC2kwRpg7UxBWNzfuu/wJRKeKHXX+1HYWdz2GfpcDchikmta39gzsz
	 54xYHhJTU3ixkvp7+aScQ8jteVYTlcKY1SIYsbG3qpw1Z2s/nsHlPrfPNWX6zX/QQy69H
	 4ZYv5q3n/NJyW3j/ImLBhbWZRYmWpx1FikxEFtFULujNwtGi5XiCs3XzYWhhShJdLMySy
	 S+zcVlTh5a87Aibfl9LfqJX4bko6Fss7Zc2c/PQalno9ztaffIcpegNrmffOzP66mZpoy
	 KDw2+n+AMuA9ZqzescWKoJUwblVBvDpUlKg7M8vbNfAKZw7bfw/ZoiXfTTA8J76XIbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433468;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=oGAwyQN0n84ky1lWzEw+Vsol6hjFQW4kazC/RDKa14E=;
	b=WCP3rfJB+pQJuSdWtw78clliWxGt1GkTDRw+Y9HPXfLm1ptRBhpCUw/lCN6ymrLZMZAY
	 Vw1Qj3J0ep4LTBOvkQXlNABtiXP4zuAg+qL/d923C1YIKl4lyBBdOzgpkFb2tJUo5O7Kw
	 w/LV83PwuSrZErw4CaarIOljPbc7hagsN0Y5Z5bhHoB5p+nY6qDYbYqWgP6cmJSRkW61t
	 s8iiZpJG05T2FxKkAXPVMzOaPd60zVrmd7iZxEqAj6dLSqFzRnsVduVEhOP7qIfnvw8S5
	 cSn8kCKolVu8WxpPex79/h3ZQ3GnsjOnhXUzsD5zVcNRQnCPHxSwpIEqxm95VbbLcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GDDJhCMn;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904060A4ADB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C904060A4ADB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GDDJhCMn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792433467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oGAwyQN0n84ky1lWzEw+Vsol6hjFQW4kazC/RDKa14E=;
	b=GDDJhCMny0ZAD151/Bs/4oHTmsaD/xS5D8UDJSrhDqB+kANb0GkxVfX0iVxn+BVFyraQvG
	KrpOlt3O23Wx1GmuELhs/N4d93R+XN+nJ8q6ghmbZ6KJsWIWEkj79xR/rT46SuqIUg12Uc
	KHDlSXKBSr6l2FdDCpc3+LkBqq+TtLg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-PCCM2deGNaav_nKsyT2vLA-1; Mon,
 19 Oct 2026 18:10:55 +0000
X-MC-Unique: PCCM2deGNaav_nKsyT2vLA-1
X-Mimecast-MFC-AGG-ID: PCCM2deGNaav_nKsyT2vLA_1792433453
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E5D51955F40;
	Mon, 19 Oct 2026 18:10:53 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85DE3418;
	Mon, 19 Oct 2026 18:10:51 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next v4 8/9] selftests/cgroup: Add tests for nohz_full housekeeping check
Date: Mon, 19 Oct 2026 14:10:19 -0400
Message-ID: <20261019181020.1069325-9-longman@redhat.com>
In-Reply-To: <20261019181020.1069325-1-longman@redhat.com>
References: <20261019181020.1069325-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

When a boot time nohz_full CPUs are present and they cover CPUs 0-7,
some of the test cases may fail.  So the test run will be skipped with
a warning message in this case. On the other hand, if the boot time
nohz_full CPUs cover all the CPUs except 0-7, a special set of nohz_full
specific housekeeping check related tests could be run to make sure the
housekeeping check are behaving properly. The test_cpuset_prs.sh test
script is now updated to do exactly that.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 .../selftests/cgroup/test_cpuset_prs.sh       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index cd179854ecd5..7639e9f11cf9 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -84,6 +84,31 @@ echo member > test/cpuset.cpus.partition
 echo "" > test/cpuset.cpus
 [[ $RESULT -eq 0 ]] && skip_test "Child cgroups are using cpuset!"
 
+#
+# If nohz_full CPUs have been reserved at boot time, they should not include
+# CPUs 0-7 as that may fail some of the test cases. On the other hand if the
+# set of nohz_full CPUs includes all the CPUs except 0-7, we can run a special
+# set of housekeeping CPUs exhaustion tests to see if the cpuset code will
+# reject them.
+#
+FIRST_NOHZ_FULL_CPU=
+LAST_NOHZ_FULL_CPU=
+RUN_NOHZ_FULL_TESTS=
+NOHZ_FULL_CPUS=
+[[ -f /sys/devices/system/cpu/nohz_full ]] &&
+	NOHZ_FULL_CPUS=$(cat /sys/devices/system/cpu/nohz_full)
+LAST_PRESENT_CPU=$(cat /sys/devices/system/cpu/present | sed -e "s/.*[,-]//")
+[[ -n "$NOHZ_FULL_CPUS" ]] && {
+	FIRST_NOHZ_FULL_CPU=$(echo $NOHZ_FULL_CPUS | sed -e "s/[,-].*//")
+	LAST_NOHZ_FULL_CPU=$(echo $NOHZ_FULL_CPUS | sed -e "s/.*[,-]//")
+	echo "Boot nohz_full CPUs: $NOHZ_FULL_CPUS"
+}
+[[ -n "$FIRST_NOHZ_FULL_CPU" && "$FIRST_NOHZ_FULL_CPU" -le 7 ]] &&
+	skip_test "Boot NOHZ_FULL CPUs overlap CPUs to be tested!"
+
+[[ -n "$FIRST_NOHZ_FULL_CPU" && "$FIRST_NOHZ_FULL_CPU" = 8 &&
+   "$LAST_NOHZ_FULL_CPU" = $LAST_PRESENT_CPU ]] && RUN_NOHZ_FULL_TESTS=1
+
 #
 # If isolated CPUs have been reserved at boot time (as shown in
 # /sys/devices/system/cpu/isolated), these isolated CPUs should be outside of
@@ -500,6 +525,17 @@ ISOLCPUS_TEST_MATRIX=(
 	" CX1-2,I:X1,I:P1 . .      .     X1,2,I  .      .      .     0 A1:1-2,I|XA1:1-2,I A1:P-1 ."
 )
 
+# Test matrix to be run when boot time nohz_full CPUs cover all CPUs except CPUs 0-7
+NOHZ_FULL_TEST_MATRIX=(
+	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
+	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------
+	# Using all the nohz_full HK CPUs 0-7 in isolated partition is not allowed
+	" C0-7       .      .      .      P2     .      .      .     0 A1:0-7 A1:P-2 ."
+	" C2-7:P2    .      .      .     C0-4    .      .      .     0 A1:0-4 A1:P2 0-4"
+	" C1-7:P2 C5-7:P2   .      .       .     .      .    C0:P2   0 A1:1-4|A2:5-7|B1:0
+								       A1:P2|A2:P2|B1:P-2 1-7"
+)
+
 #
 # Cpuset controller remote partition test matrix.
 #
@@ -1365,6 +1401,7 @@ trap cleanup 0 2 3 6
 run_state_test TEST_MATRIX
 run_remote_state_test REMOTE_TEST_MATRIX
 TEST_ISOLCPUS=1 run_state_test ISOLCPUS_TEST_MATRIX
+[[ -n "$RUN_NOHZ_FULL_TESTS" ]] && run_state_test NOHZ_FULL_TEST_MATRIX
 test_isolated
 test_boot_isolated
 test_inotify
-- 
2.55.0

