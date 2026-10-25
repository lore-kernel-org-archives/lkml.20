Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950036;
	b=dzHcV5b3PSAZW0yzUfxRhMpAqoX9JTFaTyrVtZ/XSM4xB+pBaAQT52fsohRByJChfJEA
	 hYrHEqiPxF89Ld3Ved3VE/8nvcU+77/+9UQhL/bvnBs//7D2t38MNbjY2O94yuHp5eKXe
	 hyDq3xK4V4jYaR0VmQtSItijPQTNGHv3DiNDNA1fQUt13LKtRQgJQAQcZv8KaiOMkoD5I
	 UhWX+m32msJs20LYW05UAyVKMRsGR1wYJnfzyAgU9NkWqI06ZtETglM+AsfWWCbzL76ih
	 pLfNVfpWJb4bCNpTc1PaZFBl1XkSidMsaY272zpx3uqwFuIIy5Lyk96AO+HX6ZZiXtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bAlNiVr8BQR0wHHuK51By00coxfZadVdizds6cbggxE=;
	b=riYuiO3w/+MdJ+thePxHR2K9L/dqVYT7mtxMSZF78H5H18740jLpX8QQCdwoD9tN6GRF
	 jmKeVbtHXMoN6Fw/Cb0o8imr9+I08X9z2QO/G0Fvy1IVsLJTryL28jHpRGfzDqSfbIIID
	 Eudv76XlJszk9o826j0YZ4RolO+SiMMrrJMr4kPU59tn/crkEao9SZgnOoJXdiTPfErWS
	 dQ2GwBelevOZ4fcoCEzmy4ZKTXAyNaqXYeZhodxMEyAqc8EwGlKBklJgw0Gq0WWEttNxV
	 1tqGIClrcFptRaWm/mJeplZeuxwlMYJo+l1tTpWliIvOJeMojMtJ52Tdd+Pl7csyM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=N6YEfxas;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6C60A260D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03A6C60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=N6YEfxas
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eabf243d05so931432e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950032; x=1793554832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bAlNiVr8BQR0wHHuK51By00coxfZadVdizds6cbggxE=;
        b=N6YEfxasFHKLaEwhcf9geAk/2K0O025Apw/bGWlF3mmgSY1SiuuoGzIJZOxoNxLmHe
         8XVs7ryDmc9WPcwMHanhW/VtV7OyheTFAlcj47RAOF7QTbgmlbm0Jqw1uyL/CTNFGTwh
         yrkwVsJzjgR34LNc2FaSi6evBqe+/4UywiBOqcHyYLNYr4IBZE7soj4/Hgoqpq8KfjEi
         cpwjZt3YKx5l/4v2fFYwYezhDd5ea44cxj9kTHN/dwLCeSjRiTbF+dC3fpAFeJXpz4Le
         uD4SV188ZS2gnX7uOGSOd80XDyDhxwhZAedyQWMV4o8pktmTMjtKdV6i5UtFNS7pJBoe
         78MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950032; x=1793554832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bAlNiVr8BQR0wHHuK51By00coxfZadVdizds6cbggxE=;
        b=NtR4Fa/dIcIRS+iZhmqWZ8LCoCIc6/nFGoEZy0LKhhOYXshALPMIaTUqPE6Xme6Yn5
         Um0/AZX8lixSVl77ZpQTK3YWYR8QPQZl9dg0g8PrIJ2NtdyZaNGcfHZWDbxn4LzUGExb
         C5c9Tqw5VTRxLb0fm2avFpFCDvPRC38G/SahWZeLGXXhRV+Nxr9j3I8+WrPPbs12TjjF
         9Hon5/UF+AAhv6VVNa6ZdFO1sZ2PM+14KweUZy646luQYyW8SHrbXL/7l9oHkCwd0Q4h
         10+fhyZ5l1kasTboOQ0mrPcZtAq6QCDGKCtMcqu+2Cffqzj89ame22VrJHZUPJwQi73A
         EGEA==
X-Forwarded-Encrypted: i=1; AKwUvByb8iKRvLgQKf3ybj3k+DY6+i5FjR+rMWL1Omiqdv6oZPJaK5n/ZbL5ACkP7PIc6V6GbXhVZhtSzVjo4MI=@vger.kernel.org
X-Gm-Message-State: AFq9FYImM6pC2bYNlg8RXd96UZJVSfYtV5HWds+t/lfVmmUZ73hf2o+e
	vVReanHrflRVl6tp1yN3WvtHZf6QoeodBR3yHrZZxsq/RShss7o2dUQyAjj43cRZicM=
X-Gm-Gg: AYBFou1fryc9xTrrs2pKZDJ75ckuBH1ng9xHhmtCL8l1+0k9s7/NhLSs1e5Ei0leGFk
	6+kNT7pkBk283H+fSojcwgzNZ7uHmuDPDiX+le0/q7xp4Y0ObFXu424jx3p5jQqQtHrGNyEc3Jf
	Ua2j+OPA5e+lRpb9/vI5iEu6e2TvtZzb+fLMYsOllaay1sVtH+lR3wUtJVWp0lSh8r8IOwwOQqi
	0YSti4s2CbGc2kqF4lXOukcJtkF3430xD2H/qU49o60J9R1pNQ3ig0yEVHAfoI3BQS7ilmMVo1V
	xAqnzHTSYs337kZ4XlcsYtFQ3B2udjsM3fBm67HoRqA2pBkMRZjOZ5ETqxgSKoNxza+26L3c18P
	hwjyPKnCzX06/L05WlsITPiiH+yV8DmHjzA3xgV3COT0WUmF75TvRu1JNHSxudYKvR6WHVftkzL
	HDTNQ2BHNGdzeDZk4Vvy+1cWtB5iyC4LydpesNphCnYlWeRSkS4r9OV6QPQ//AactVYJHw4uy/F
	MkNvad+4I+L1cGgQBxkdl+aAnEBEB9i+nO5Ow607OhNyMw4uBX8JBr0+mJuDu5qsCi+DrxbwzCf
	y4GuIcoVEQw7M5w34e3sW3xrfhXcXd02SAkzTC3SL5yDAyrjZ+UbzruuWu+HzhLxrYHOqGzaz1t
	k
X-Received: by 2002:a05:6122:3117:b0:5ea:e196:272b with SMTP id 71dfb90a1353d-5ec23326b7amr1522204e0c.19.1792950031820;
        Sun, 25 Oct 2026 10:40:31 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:31 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 9/9] selftests: kho: add read-only KHO test to vmtest.sh
Date: Sun, 25 Oct 2026 13:40:16 -0400
Message-ID: <20261025174017.3870481-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
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

vmtest.sh currently only tests standard KHO restoration and does not
exercise read-only KHO mode ('kho_ro=<fdt_phys>') in QEMU.

Extend tools/testing/selftests/kho/vmtest.sh and init.c to enable both
CONFIG_KEXEC_HANDOVER=y and CONFIG_KEXEC_HANDOVER_READONLY=y in the
kernel configuration and run a second QEMU test verifying read-only KHO
after the standard KHO test on both x86_64 and aarch64:

- Enable CONFIG_KEXEC_HANDOVER_READONLY=y alongside
  CONFIG_KEXEC_HANDOVER=y in build_kernel().
- Pass KHO_RO_CMDLINE ('nokaslr kho_bootmem=64M,64M,64M' on x86_64) to
  the first kernel in the read-only test run and configure 4G of RAM on
  aarch64 so GFP_KERNEL KHO allocations are placed in ZONE_NORMAL above
  4G, outside the read-only kernel's System RAM.
- When booted with 'kho_ro_test', read /debugfs/kho/out/fdt_phys in
  init.c and kexec into the target kernel with 'kho_ro=<fdt_phys>' and
  architecture-specific memory parameters
  ('memmap=792M$16M memmap=24M$1000M' on x86_64, 'mem=128M' on aarch64)
  so the preserved pages are excluded from the boot memory map and
  mapped via kho_ro_map_folio().
- Verify 'KHO restore succeeded' from test_kho in read-only mode.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/kho/arm64.conf |  1 +
 tools/testing/selftests/kho/init.c     | 38 ++++++++++++++-
 tools/testing/selftests/kho/vmtest.sh  | 65 ++++++++++++++++----------
 tools/testing/selftests/kho/x86.conf   |  1 +
 4 files changed, 79 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/kho/arm64.conf b/tools/testing/selftests/kho/arm64.conf
index ee696807cd35..202f92121695 100644
--- a/tools/testing/selftests/kho/arm64.conf
+++ b/tools/testing/selftests/kho/arm64.conf
@@ -1,4 +1,5 @@
 QEMU_CMD="qemu-system-aarch64 -M virt -cpu max"
+QEMU_MEM="4G"
 QEMU_KCONFIG="
 CONFIG_SERIAL_AMBA_PL010=y
 CONFIG_SERIAL_AMBA_PL010_CONSOLE=y
diff --git a/tools/testing/selftests/kho/init.c b/tools/testing/selftests/kho/init.c
index 88a41b6eba95..e2ebcf7ab307 100644
--- a/tools/testing/selftests/kho/init.c
+++ b/tools/testing/selftests/kho/init.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <stdio.h>
+#include <string.h>
 #include <unistd.h>
 #include <fcntl.h>
 #include <sys/syscall.h>
@@ -12,6 +13,15 @@
 #define COMMAND_LINE_SIZE	2048
 
 #define KERNEL_IMAGE "/kernel"
+#define FDT_PHYS_PATH "/debugfs/kho/out/fdt_phys"
+
+#if defined(__x86_64__)
+#define KHO_RO_MEM_PARAM "memmap=792M$16M memmap=24M$1000M"
+#elif defined(__aarch64__)
+#define KHO_RO_MEM_PARAM "mem=128M"
+#else
+#define KHO_RO_MEM_PARAM ""
+#endif
 
 static int mount_filesystems(void)
 {
@@ -32,7 +42,8 @@ static long kexec_file_load(int kernel_fd, int initrd_fd,
 static int kexec_load(void)
 {
 	char cmdline[COMMAND_LINE_SIZE];
-	ssize_t len;
+	ssize_t len, fdt_len;
+	char fdt_phys[64];
 	int fd, err;
 
 	fd = open("/proc/cmdline", O_RDONLY);
@@ -41,11 +52,34 @@ static int kexec_load(void)
 
 	len = read(fd, cmdline, sizeof(cmdline));
 	close(fd);
-	if (len < 0)
+	if (len <= 0)
 		return -1;
 
 	/* replace \n with \0 */
 	cmdline[len - 1] = 0;
+
+	if (strstr(cmdline, "kho_ro_test")) {
+		fd = open(FDT_PHYS_PATH, O_RDONLY);
+		if (fd < 0)
+			return -1;
+
+		fdt_len = read(fd, fdt_phys, sizeof(fdt_phys) - 1);
+		close(fd);
+		if (fdt_len <= 0)
+			return -1;
+
+		if (fdt_phys[fdt_len - 1] == '\n')
+			fdt_len--;
+		fdt_phys[fdt_len] = 0;
+
+		len = (len - 1) + snprintf(cmdline + len - 1,
+					   sizeof(cmdline) - (len - 1),
+					   " kho_ro=%s " KHO_RO_MEM_PARAM,
+					   fdt_phys) + 1;
+		if (len <= 0 || (size_t)len > sizeof(cmdline))
+			return -1;
+	}
+
 	fd = open(KERNEL_IMAGE, O_RDONLY);
 	if (fd < 0)
 		return -1;
diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
index 0014bd76e88d..ca59a58ae2fb 100755
--- a/tools/testing/selftests/kho/vmtest.sh
+++ b/tools/testing/selftests/kho/vmtest.sh
@@ -35,17 +35,12 @@ trap cleanup EXIT
 function skip() {
 	local msg=${1:-""}
 
-	ktap_test_skip "$msg"
+	while [[ "$KTAP_TESTNO" -le "$KSFT_NUM_TESTS" ]]; do
+		ktap_test_skip "$msg"
+	done
 	exit "$KSFT_SKIP"
 }
 
-function fail() {
-	local msg=${1:-""}
-
-	ktap_test_fail "$msg"
-	exit "$KSFT_FAIL"
-}
-
 function build_kernel() {
 	local build_dir=$1
 	local make_cmd=$2
@@ -55,10 +50,11 @@ function build_kernel() {
 	local kho_config="$tmp_dir/kho.config"
 	local kconfig="$build_dir/.config"
 
-	# enable initrd, KHO and KHO test in kernel configuration
-	tee "$kconfig" > "$kho_config" <<EOF
+	# enable initrd, KHO, read-only KHO, and KHO test in kernel configuration
+	cat > "$kho_config" <<EOF
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KEXEC_HANDOVER=y
+CONFIG_KEXEC_HANDOVER_READONLY=y
 CONFIG_KEXEC_HANDOVER_DEBUG=y
 CONFIG_KEXEC_HANDOVER_DEBUGFS=y
 CONFIG_TEST_KEXEC_HANDOVER=y
@@ -71,11 +67,25 @@ $arch_kconfig
 EOF
 
 	make_cmd="$make_cmd -C $kernel_dir O=$build_dir"
-	$make_cmd olddefconfig
+	local need_config=0
+	if [[ ! -f "$kconfig" ]]; then
+		need_config=1
+	else
+		while read -r opt ; do
+			[[ -z "$opt" ]] && continue
+			grep -q "^$opt$" "$kconfig" || need_config=1
+		done < "$kho_config"
+	fi
+
+	if [[ "$need_config" -eq 1 ]]; then
+		cp "$kho_config" "$kconfig"
+		$make_cmd olddefconfig
+	fi
 
-	# verify that kernel confiration has all necessary options
+	# verify that kernel configuration has all necessary options
 	while read -r opt ; do
-		grep "$opt" "$kconfig" &>/dev/null || skip "$opt is missing"
+		[[ -z "$opt" ]] && continue
+		grep -q "^$opt$" "$kconfig" || skip "$opt is missing"
 	done < "$kho_config"
 
 	$make_cmd "$kimage"
@@ -107,18 +117,23 @@ function run_qemu() {
 	local qemu_cmd=$1
 	local cmdline=$2
 	local kernel=$3
+	local test_name=$4
 	local serial="$tmp_dir/qemu.serial"
 
 	cmdline="$cmdline kho=on panic=-1"
 
-	$qemu_cmd -m 1G -smp 2 -no-reboot -nographic -nodefaults \
-		  -accel kvm -accel hvf -accel tcg  \
-		  -serial file:"$serial" \
-		  -append "$cmdline" \
-		  -kernel "$kernel" \
-		  -initrd "$initrd"
-
-	grep "KHO restore succeeded" "$serial" &> /dev/null || fail "KHO failed"
+	rm -f "$serial"
+	if $qemu_cmd -m "${QEMU_MEM:-1G}" -smp 2 -no-reboot -nographic -nodefaults \
+		     -accel kvm -accel hvf -accel tcg  \
+		     -serial file:"$serial" \
+		     -append "$cmdline" \
+		     -kernel "$kernel" \
+		     -initrd "$initrd" && \
+	   grep "KHO restore succeeded" "$serial" &> /dev/null; then
+		ktap_test_pass "$test_name succeeded"
+	else
+		ktap_test_fail "$test_name failed"
+	fi
 }
 
 function target_to_arch() {
@@ -164,7 +179,7 @@ function main() {
 	done
 
 	ktap_print_header
-	ktap_set_plan 1
+	ktap_set_plan 2
 
 	if [[ "$target" != "$(uname -m)" ]] && [[ -z "$CROSS_COMPILE" ]]; then
 		skip "Cross-platform testing needs to specify CROSS_COMPILE"
@@ -182,9 +197,11 @@ function main() {
 	local kernel="$build_dir/arch/$arch/boot/$KERNEL_IMAGE"
 	mkinitrd "$kernel"
 
-	run_qemu "$QEMU_CMD" "$KERNEL_CMDLINE" "$kernel"
+	trap - ERR
 
-	ktap_test_pass "KHO succeeded"
+	run_qemu "$QEMU_CMD" "$KERNEL_CMDLINE" "$kernel" "KHO"
+	run_qemu "$QEMU_CMD" "$KERNEL_CMDLINE ${KHO_RO_CMDLINE:-} kho_ro_test" \
+		 "$kernel" "KHO read-only"
 }
 
 main "$@"
diff --git a/tools/testing/selftests/kho/x86.conf b/tools/testing/selftests/kho/x86.conf
index b419e610ca22..2c097c5bd6c6 100644
--- a/tools/testing/selftests/kho/x86.conf
+++ b/tools/testing/selftests/kho/x86.conf
@@ -5,3 +5,4 @@ CONFIG_SERIAL_8250_CONSOLE=y
 "
 KERNEL_IMAGE="bzImage"
 KERNEL_CMDLINE="console=ttyS0"
+KHO_RO_CMDLINE="nokaslr kho_bootmem=64M,64M,64M"
-- 
2.56.0.307.g5fe7bd680c-goog

