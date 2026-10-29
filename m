Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264763;
	b=00ySQrGbabwioScZzdtP2/8+krIv2sjEhpPSEZ0tNXzoQzWC/T4tX/3qmv2KdMTM+qa2
	 bHDTyDHrZ5L9UXVbYPCnXbL3Z0VUuzs0XmDaM2sbqlR+7VVFcCsWe11QmxMqJ2H641bZE
	 6wu+4a7Oihxs1c8rFqMQV+l2VfBnNvRR8ZpgVO+Dj7dsA/2To+IK9Ta8+9ETQ5OOkhnkR
	 kpP5BGDaqxyYc0xpSYwh3EgWVIDjacGm+o7jjC+F/WeLpmpBP1ga23zLJybED7GbSVqcN
	 Xp8Nu3YSUtGwYprVkJuQLjuBAbLPNneYDV2oTWpTn/DG97Ql6cZHwPfiNdEe8brGEvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264763;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=go4dra+4YH06N3EmUqzNTwrDp7mjFjmaeDVnD3tSruE=;
	b=UFcPYWAjLxmIORKYTxszPA/fVHCUunC/Y0wGsk4jK/Ig51ikICU0PbH32TNYURkRsvxV
	 kOvrL2vvXZqjNeh31wKdGjG1czx7EIW2XFsSUJHdFj2pbgbemZ2tcchxVtlxkvHsK/60t
	 /ACVPii5eB7kvhbpjOtCMYTTEy1ihB7Za+Hjcx38cSKtC2jWVum2dULNVm4AlOL+UUv0T
	 RwUbxFB53TxDv3ilIrpaQ+DGaEifaHkKLn9beSp4vb1rzi2Ed5+iQuQUs6dRXewEu0u8d
	 DUhaW0uqkTyQnhAQtLCideDMWbt5JQuDZnsnomEyx2m2lTvmqxoBya4v7wajHxwbZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5BD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D5BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DYXaWemXvBwC95FCj8igDWaYEMt1wgMdHlRzj74nyZo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793264760; v=1; x=1793869560;
 b=YuiZSbABTER+omjjyXPzKhHlur2Uqj1Jta1IouI2KDmN4MHDWjbGkTD5cwLw/5v2XlxD8xce
 kvkXCgD9BomAqNyvzox09YHSQLdTyQ72qUwNZxOrQ4RpZdU25z01QqEljCpeJW3NqRJSc6SevDY
 7AMwL0Z+MaFZrhhHJqa9nH9A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44560a5e9cf9788f;
	Thu, 29 Oct 2026 09:05:59 +0000
X-Mizu-Trace-ID: 44560a5e9cf9788f
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: pasha.tatashin@soleen.com,
	rppt@kernel.org,
	pratyush@kernel.org,
	shuah@kernel.org
Cc: guodongtai@kylinos.cn,
	kexec@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/liveupdate: Preserve VM workspaces with run-vmtests.sh -k
Date: Thu, 29 Oct 2026 18:05:42 +0900
Message-ID: <20261029090542.13283-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
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

From: George Guo <guodongtai@kylinos.cn>

run-vmtests.sh -k keeps the test output logs, but vmtest.sh still
removes its workspace and qemu.serial, losing the guest output needed
to debug failures.

Forward -k to vmtest.sh when keeping logs and update the help texts to
match.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 tools/testing/selftests/liveupdate/run-vmtests.sh | 7 +++++--
 tools/testing/selftests/liveupdate/vmtest.sh      | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/run-vmtests.sh b/tools/testing/selftests/liveupdate/run-vmtests.sh
index d656ce58c5a7..6f592aec0f85 100755
--- a/tools/testing/selftests/liveupdate/run-vmtests.sh
+++ b/tools/testing/selftests/liveupdate/run-vmtests.sh
@@ -26,7 +26,7 @@ function usage() {
 	cat <<EOF
 $0 [-k] [-o output_dir] [-h]
 Options:
-	-k)	keep logs
+	-k)	keep logs and VM workspaces, including guest serial logs
 	-o)	specify output directory
 	-h)	display this help
 EOF
@@ -48,6 +48,8 @@ function fail() {
 }
 
 function main() {
+	local -a vmtest_args=()
+
 	while getopts 'hko:' opt; do
 		case $opt in
 		k) keep_logs=1 ;;
@@ -59,6 +61,7 @@ function main() {
 	done
 
 	if [ -n "$keep_logs" ]; then
+		vmtest_args+=(-k)
 		if [ -z "$output_dir" ]; then
 			output_dir="$SCRIPT_DIR/results_$(date +%Y%m%d_%H%M%S)"
 		fi;
@@ -74,7 +77,7 @@ function main() {
 
 			printf "  -> %-8s %-24s ... " "$arch" "$test_name"
 
-			"$TEST_RUNNER" -t "$arch" -T "$test_name" &> "$log"
+			"$TEST_RUNNER" "${vmtest_args[@]}" -t "$arch" -T "$test_name" &> "$log"
 			exit_code=$?
 
 			case $exit_code in
diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
index 69beda6c961d..bd7032c4b122 100755
--- a/tools/testing/selftests/liveupdate/vmtest.sh
+++ b/tools/testing/selftests/liveupdate/vmtest.sh
@@ -40,7 +40,7 @@ Options:
 	-t)	run test for target_arch (aarch64, x86_64)
 	-T)	test name to run (default: luo_kexec_simple)
 	-w)	custom workspace directory (default: creates temp dir)
-	-k)	keep workspace directory after successful test
+	-k)	keep workspace directory
 	-h)	display this help
 EOF
 }

base-commit: 9a6a70aefe77f6fb9ff2b3037dcf87f6dff65c8c
-- 
2.53.0

