Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95D2230264
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767944; cv=none; b=g1glxr1IEJ9Kf96TeVj2aox3DlA/tgSSPzQjV0EeTv5kmKYbWSlYyqURjM6gFA7P7kE9iBY9hbuoK4qIhq/0BJp0RyWM8zj4MYBIhHHyvpdouoXcyEizcXhDZm62UP051AQq/+SUUY6b9TRHs92xjqahZMaKzrG1vEBDu5i/09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767944; c=relaxed/simple;
	bh=YCbEy7LvZ4zvg5lCpybvZOkKAZyBBdYj0Er77Bwz/GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIbcqogUL7OI34Nl512PWBl4ieGs9E+U4dKCEGdm1BnkeNAUC9+BageNzmH8hrAyx1B+/ymfNYyuqsq2BnBWwMZinJj3sBxJkTG5Sc96TanHgz74uL7tECpp5UtYfmvWBW6KQJPS9vpgbaXeAKzgNWddTs47DSiBGQpTwJ32vDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMfJaW3x; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMfJaW3x"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d94c868ea5so32931715ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767938; x=1789372738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWQbirqnoJrko/xoiAbUUJU+D4b2sHL+OPlLYee7Yc4=;
        b=YMfJaW3xPWojgT0rx1bnlGosexhl8K0YxO0WFAi+mOEfpFNqcE2XD0SD7bH/uJVUtj
         StEuviRmP9ZGCgzO/0qtOtY/k6yqgS60GFyShfHRi1y6fn9sYchxWSpVddkXbqqC/rLQ
         ta0fM03WCSya4glJTHaSQhfH+VUgRQ+n/1bgLwe4gUkatk1tQ+xpy5o5Ij5yGEbw4E1F
         yxLMnice7htvdOwbiNEcdrOyj+Ij+kRwX+U5bkUmvu+nRE+xF4JZ6vWtyQXMUr40HexE
         RJxNIV2XTn5PWTGCVJM+3slxy9TGFLe3PZytYBrpSzFsuD4rFpHpwlmWnClgs3a0ODms
         +UEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767938; x=1789372738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWQbirqnoJrko/xoiAbUUJU+D4b2sHL+OPlLYee7Yc4=;
        b=gxuBkrszWlGT/AcqzcYax7Pql6G7yhCSPz9tUX2bVdPAIvVpfsd3CMHummpjPNMDO0
         +JtpC8Z6LSqVSBtBW7V16xm7Whyh1zvMWVU95vRHjWM0sVt64gnaD8xPixCEriyZ3n2A
         W231NCOBzzH66tW2sD2M/MFB+56+ntmGR1Q8u64hR7L1lrXifS4u5Gu01DJdIvTorL+6
         eM8TRAQ/P1d1gqAgtig8tEOjbAglCsO+jjmL+OXRooUWPKGav3gCIgoEoFwL99KKYtQy
         WgRDX9E24/zNlIALMYchdwyBN/Kj346vk7vnmMBGd9uoBdXL668FvbvKmFLtHc82s6qL
         bU5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxYOK+xH5HeauWu2N5bp4zBT1QtJgtjdAvcFOlS6YUb4EG2xUF0NvOh5Q0zyoU4lIWGGNFcAGHbLZMBwUA=@vger.kernel.org
X-Gm-Message-State: AFuF++nD1qaOvnhG3VdBiE5upV983Dq92nXTME8qUg4sMD3NJ4ju/36O
	JMWUd++TBMtPmHVul1KxB4Jgr/JE+3qclvafrAhClMzPOW2PX+n9NdWD
X-Gm-Gg: AYBFou3Y8jBItZfhsqllbtgHU9pIXl46Jc0aQMuKD+TV2UW/Rg6fvycsvk15Z5Y6ZX3
	pfY13DlpB5tePrtCpvazml9+N7aGPn6aYKQwVNY5/HgcYbyyfvdAMfmreKgbihs+sUMtjRy9DcZ
	P7vUOzAs495G4oRYaor+BBqWdZx+qVo2GBdSNPCy7a/XfIlJgxOgfJLXRdqYxfCq5dluYB5vZhv
	gKazRetJUc+i4SFd/6Xl6+00etMx0hPsmcIcWeLUf625GUjN0LrQVDBUXAxICW9vZwbWRS4prlQ
	yQIeCaAA4dCcqsE3nzUupnrOGWBeTgrjTBtV9miWOESmLCIDH1WLr8HuuYTZwvcaCNdU2bP463K
	LwH5UMXirZ6GT5YzvbGc5HXb4gr+t39EzGA+R1Zvi47KsnLh415L4pWVBGVZkAmsVbxQ9hn80uA
	N5rtYxVLe60c2jikY30nRlEcFE5FouxLyVuYIUTf9bXT1NixXxmBjM4iKU2ULlxaffr6Wf5losY
	gCMH4o=
X-Received: by 2002:a17:903:13c8:b0:2db:56da:6a0e with SMTP id d9443c01a7336-2db56da6ea1mr65563755ad.9.1788767937845;
        Mon, 07 Sep 2026 00:58:57 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:58:57 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 04/13] rcutorture: Add atomic-SRCU support to torture.sh
Date: Mon,  7 Sep 2026 15:58:20 +0800
Message-ID: <20260907075829.2073224-5-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

Add the --do-atomic-srcu argument to torture.sh, which runs the
SRCU-N, SRCU-P, and SRCU-T scenarios, thus covering both Tree SRCU
(SRCU-N and SRCU-P) and Tiny SRCU (SRCU-T), with
rcutorture.reader_flavor=0x10 appended to the boot parameters so
that it takes precedence over each scenario's own reader-flavor
setting.  This exercises srcu_read_lock_atomic(),
srcu_read_unlock_atomic(), and synchronize_srcu_atomic().

As with other torture.sh tests, the --do-kcsan argument runs a
KCSAN+PROVE_LOCKING variant of this test.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/bin/torture.sh       | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/selftests/rcutorture/bin/torture.sh b/tools/testing/selftests/rcutorture/bin/torture.sh
index f0083891ee81..8885812d866a 100755
--- a/tools/testing/selftests/rcutorture/bin/torture.sh
+++ b/tools/testing/selftests/rcutorture/bin/torture.sh
@@ -68,6 +68,7 @@ do_clocksourcewd="${ifnotaarch64}"
 do_rt=yes
 do_rcutasksflavors="${ifnotaarch64}" # FIXME: Back to "yes" when SMP=n auto-avoided
 do_srcu_lockdep=yes
+do_atomic_srcu=no
 do_rcu_rust=no
 
 # doyesno - Helper function for yes/no arguments
@@ -103,6 +104,7 @@ usage () {
 	echo "       --do-rcu-rust / --do-no-rcu-rust / --no-rcu-rust"
 	echo "       --do-scftorture / --do-no-scftorture / --no-scftorture"
 	echo "       --do-srcu-lockdep / --do-no-srcu-lockdep / --no-srcu-lockdep"
+	echo "       --do-atomic-srcu / --do-no-atomic-srcu / --no-atomic-srcu"
 	echo "       --duration [ <minutes> | <hours>h | <days>d ]"
 	echo "       --guest-cpu-limit N"
 	echo "       --kcsan-kmake-arg kernel-make-arguments"
@@ -148,6 +150,7 @@ do
 		do_kcsan=yes
 		do_clocksourcewd="${ifnotaarch64}"
 		do_srcu_lockdep=yes
+		do_atomic_srcu=yes
 		;;
 	--do-allmodconfig|--do-no-allmodconfig|--no-allmodconfig)
 		do_allmodconfig=`doyesno "$1" --do-allmodconfig`
@@ -183,6 +186,7 @@ do
 		do_kcsan=no
 		do_clocksourcewd=no
 		do_srcu_lockdep=no
+		do_atomic_srcu=no
 		;;
 	--do-normal|--do-norm|--do-no-normal|--do-no-norm|--no-normal|--no-norm)
 		do_normal=`doyesno "$1" --do-normal`
@@ -212,6 +216,9 @@ do
 	--do-srcu-lockdep|--do-no-srcu-lockdep|--no-srcu-lockdep)
 		do_srcu_lockdep=`doyesno "$1" --do-srcu-lockdep`
 		;;
+	--do-atomic-srcu|--do-no-atomic-srcu|--no-atomic-srcu)
+		do_atomic_srcu=`doyesno "$1" --do-atomic-srcu`
+		;;
 	--duration)
 		checkarg --duration "(minutes)" $# "$2" '^[0-9][0-9]*\(m\|h\|d\|\)$' '^error'
 		mult=1
@@ -497,6 +504,23 @@ then
 	torture_set "rcutorture" tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration "$duration_rcutorture" --configs "$configs_rcutorture" --trust-make
 fi
 
+# Test atomic SRCU across Tree SRCU (SRCU-N and SRCU-P) and Tiny SRCU
+# (SRCU-T).  The reader flavor selects srcu_read_lock_atomic() and
+# synchronize_srcu_atomic().  Tiny SRCU requires SMP=n, which aarch64
+# does not support.
+if test "$do_atomic_srcu" = "yes"
+then
+	torture_bootargs="rcutorture.reader_flavor=0x10"
+	configs_atomic_srcu="SRCU-N SRCU-P"
+	if test "$ifnotaarch64" = yes
+	then
+		configs_atomic_srcu="$configs_atomic_srcu SRCU-T"
+	fi
+	torture_set "atomic-srcu" tools/testing/selftests/rcutorture/bin/kvm.sh \
+		--allcpus --duration "$duration_rcutorture" \
+		--configs "$configs_atomic_srcu" --trust-make
+fi
+
 if test "$do_locktorture" = "yes"
 then
 	torture_bootargs="torture.disable_onoff_at_boot"
-- 
2.43.0

