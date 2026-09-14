Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59612931F7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346744; cv=none; b=fI6WjscQreZuu5SGQpS6jh7qF98v++lyFQjuib6SFz+1CXp+09OYljXqgVxDWPnpWV0fbNrWLA+yixKe1NIbbxgQa3kO4MmVoOK8U3xhdJyNPUsULZUWklCqOkflSVDgS89Q7gqA8oVFEV63a54p6qKs69n8pT8W74e398hd5iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346744; c=relaxed/simple;
	bh=HEzr018Zg9zeDMFyAi99qcjka/aNhAhdWDPG3d6Uc0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F/DsHSz1Rb/UlGySG7yclmx2g70KDEk6oJpWrDdCkFBMrnCLBJUeTR/RNrobY37dQudWY/Vk8ndoqCZyHfAkeuV71qQAqtnUrUnMksMrhqy2PVRrIU+DPpyj1h3ivHFjzX/W7pwYZUwQ2BFTRrpO03StgcpurHdSABYpaElmOSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=ORuQkuqm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="ORuQkuqm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d942c7cc2fso25723475ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789346742; x=1789951542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHfRQlL8Oc4xb+7dfHHHoFotMCf8gFX4P34jeATJRIQ=;
        b=ORuQkuqm0YxOAGj8Lix5KphZcJ0+Hqj1zZBmW1hy/eXL4v8AJW5vfTZcSzDP+OTuDq
         7S8j6A9HbXL9NIj3lPnUw1dwZIQPFSgREFmHv9V+TCaXr9zomIW9/PRpgvMhYFJUavqG
         je8xFnwwoG+dmAmgUPiwPBW/udx1CP0zwQxhU05jm2okszDKfi4xKU0QGXKYDTBS6jfZ
         b76nfn0HhPHUiQKvdFDpaJCQEobn2klpAYrUXKh6JjKMS5A1ptm6U76HV4tH+ItEF1FZ
         CsgCp1TaxoEtjTNayaIvhSRQKntMSRS12ukLGV5TINUqr45m033DaNE4Om0cr4BHru/s
         jRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789346742; x=1789951542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHfRQlL8Oc4xb+7dfHHHoFotMCf8gFX4P34jeATJRIQ=;
        b=rDd1d2K/rHMa8jQ5TIZ9cfqXkvhWiBVadiNCdRMTejsxeFsFaXZFnPWSEipVVHOHmD
         lWJdFqTmTZmBKObgj8Z9SxGqqVr5DaSvRuVQ3IZpjICCLz+qenSpPzHmxznnSS2JRIlW
         biV6SOG4GApyveWn3YT4KAGm4L95bN9FX+wFvVM4jyytjanwtyhEO+7xAnuZLoyW25Kj
         uIcsF5FeS6LWvzkFr9075TFb1A6KWIuVfa9ga/YV7GcvilEIkg2ULWd/FUOCywbJSEIO
         cS6jEBQihYSo6T8plAPfBvmJ8IgUWKolN8zW0Id0sp9yXj91HLGUTKs8hgg1tHsGbXGD
         uNbA==
X-Forwarded-Encrypted: i=1; AKwUvBzjK3/hB5+zmnY4vHsTGDFQv9RSZnA8FABRgunkRQ2V8d+Otq/+9z6c0CneYCPJ/VkZtXtPpfNzFcDying=@vger.kernel.org
X-Gm-Message-State: AFuF++nHZ7VkggYzDTMCdJpnCHt+s9tY69nhJQTxdNv44K99MlhfB2HB
	SFlmw0V090duiI/8Y6uXOyLmQmsoFOPctdGbeFtVljaPvGBaRtFXAuhkbaeo/b/DQwg=
X-Gm-Gg: AYBFou2xTvCzoOhuCyYXK6HBr6Yfi0IEf91cLkDXjaViy18d9dVFXWsMeYbp8kDpHmj
	lnUO4cFJKb7ulE21gvqkopPzFtQjKHrLmIZTvxjo8FFmFQ3ExVZOzyS7sQo2h2FjRv1Gp3i3r8G
	1lyr0z2IgJgjkPG0finMH3ufCEn4CTYWP5p73Qz3Y1wG4Q0eMlbKx5aBC/u4tixdhI+mI2KRsDb
	cf61TcZB9Uuzw6QyhAMvXDSiGMbfbhPPLN8Omr81MUySOdirNsH0sKWKPHnpIoIKM273bPkR+2S
	Yd6WeyqY5oeZkbsWXbcTdXIARjN1Of2V3eaLlmv8cW/5fVAPjN7/DSDGsS63IaV4xoe50qzvQS7
	Ps+NN3ylNEuDPLHlyq3oynLAQFAZgcNKo/Q2NQC+5wcDjDBwVlgr3hcp2tpqCusDWQDily3dMik
	UlXvfKoKG/POudZq8glRsgIBSqPXB7znHc8v8vDeLltn/Ia89aqy6PFXZgQPpTqwyyoGM0nWrfD
	LOGs5lXQTCvs23xY27M2eYAvusAzJ6DS+F51IUmZlyZ2v5hhoF25DjMXw==
X-Received: by 2002:a17:903:1b0b:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2dd6c763100mr5649905ad.22.1789346741862;
        Sun, 13 Sep 2026 17:45:41 -0700 (PDT)
Received: from localhost.localdomain (111-240-141-218.dynamic-ip.hinet.net. [111.240.141.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faf19sm32604465ad.12.2026.09.13.17.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:45:41 -0700 (PDT)
From: shuo huang <f64116045@gs.ncku.edu.tw>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	f64116045@gs.ncku.edu.tw
Subject: [PATCH net-next v3 2/2] selftests: net: Exercise TCP payload verification in udpgso_bench.sh
Date: Mon, 14 Sep 2026 08:45:25 +0800
Message-Id: <20260914004525.46597-3-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
References: <20260914004525.46597-1-f64116045@gs.ncku.edu.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The benchmark script does not exercise TCP payload verification.

Add a verification case for IPv4 and IPv6 using 100 4 KiB payloads.
The payload length is not a multiple of 26, allowing the test to
detect missing per-payload pattern resets.

Wait for the receiver and propagate verification failures. Bound
both processes with timeouts and leave the existing benchmarks
unchanged.

Signed-off-by: shuo huang <f64116045@gs.ncku.edu.tw>
---
 tools/testing/selftests/net/udpgso_bench.sh | 35 +++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/net/udpgso_bench.sh b/tools/testing/selftests/net/udpgso_bench.sh
index 88fa1d53b..4d1938282 100755
--- a/tools/testing/selftests/net/udpgso_bench.sh
+++ b/tools/testing/selftests/net/udpgso_bench.sh
@@ -8,6 +8,8 @@ readonly YELLOW='\033[0;33m'
 readonly RED='\033[0;31m'
 readonly NC='\033[0m' # No Color
 readonly TESTPORT=8000
+# Avoid a multiple of 26 to detect missing payload resets.
+readonly TCP_VERIFY_LEN=$((4 * 1024))
 
 readonly KSFT_PASS=0
 readonly KSFT_FAIL=1
@@ -79,6 +81,32 @@ run_one() {
 	./udpgso_bench_tx -p "$TESTPORT" ${args}
 }
 
+run_tcp_verify_one() {
+	local tcp_rx_pid
+	local i=0
+	local -r timeout=10
+
+	timeout -k 1 30 ./udpgso_bench_rx -p "$TESTPORT" -t \
+		-v -l "$TCP_VERIFY_LEN" &
+	tcp_rx_pid=$!
+
+	while [ "$i" -lt "$timeout" ]; do
+		ss -lnHt "sport = :$TESTPORT" | grep -q . && break
+		i=$((i + 1))
+		sleep 1
+	done
+	if [ "$i" -eq "$timeout" ]; then
+		echo "timed out while waiting for udpgso_bench_rx"
+		return 1
+	fi
+
+	timeout -k 1 30 ./udpgso_bench_tx -p "$TESTPORT" "$@" \
+		-t -s "$TCP_VERIFY_LEN" -M 100 || return $?
+
+	# A successful sender does not imply that payload verification passed.
+	wait "$tcp_rx_pid"
+}
+
 run_in_netns() {
 	local -r args=$@
 
@@ -123,6 +151,10 @@ run_tcp() {
 	echo "tcp zerocopy"
 	run_in_netns ${args} -t -z
 
+	echo "tcp verify"
+	./in_netns.sh "$0" __verify_tcp ${args}
+	kselftest_test_exitcode $?
+
 	# excluding for now because test fails intermittently
 	# add -P option to include poll() to reduce possibility of lost messages
 	#echo "tcp zerocopy audit"
@@ -149,6 +181,9 @@ if [[ $# -eq 0 ]]; then
 elif [[ $1 == "__subprocess" ]]; then
 	shift
 	run_one $@
+elif [[ $1 == "__verify_tcp" ]]; then
+	shift
+	run_tcp_verify_one "$@"
 else
 	run_in_netns $@
 fi
-- 
2.34.1

