Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365259;
	b=fQsBWbh6Dr5zgrF853j4KUF1Hf5Ve9NMxsAzZWwAAvs0jJRflvRu4EQ+aDIATuaEm186
	 is5qbMTO7Wc2k/hc4S30vq++hLR/4pCx74xrHKXE3PNG9FipaPilizvP9UnDi3TR39GCB
	 YDhXhPvRtS3FUC0S+Z+6yX9onKIWyn6fGE0lFjTRWZPNb28r/7daE789uv/xPRt8bID7L
	 mHnaXSr5OvzMkWBb/8y0NxbwEbiFihTpbNgkGjfu1My8ZDQpE31ddypG9brHMseTnYcwf
	 VMxyf5Ndbg74M2D++O4WeRYv5qYkQnbrkSf6cmj1x4oEQAN71EmcMlyLt9loJ2FFGdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365259;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Nc1d20iO8S7OwSjr/iHXLonHbzWzCZV2V+n9Ocf83Ws=;
	b=S1372VXXM6j5p/uYRBMAuVtLxW8aaqp+B2u609Xmq9wBLI7ncCzWvhHbwuBbhF3xs2OD
	 /rQo2S3It2iPpFzVM0Nivceu+AkVfaDAbVkHCe2v6vMeRe4doTRr5COHus6zieb4BytEV
	 CilaqbYKXEcHjIHbYTycWXlZtJVzRct/Fc9CeEXJEgYK4YWgjedDHVpxvmGua5HG1vkOK
	 s4g+Th9WfyIuZedttesVITgCcYVfpuv2WAQWpm3aaRXgZhFNedVlRjnxaVd9JHroFesIP
	 Ny/LGVHTA3BcYjnRKmueMKC5ckWlhciWFi5BBUEJ146Bs0XUJdDIvlLviupt9pDCgPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=dcKwnWIL;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AF3606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22AF3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=dcKwnWIL
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 646813FDB1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794365256;
	bh=Nc1d20iO8S7OwSjr/iHXLonHbzWzCZV2V+n9Ocf83Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=dcKwnWILF1fikk6enutxBtqfvgEBrqymMlVo77wrzZgAYQd0U8oxB5TjXX5GJO0gR
	 OBeMANezd1EpPQVb7uxuWUlPzuCO2cGWRoWS7Frs1YlG0knVlAd27rojuJiaucInyS
	 6CH6ithvyK8JMPr3DSk8AUSalJVcGSAgS9qcjOUHbwzBd0LSE5ePQ72tyMYNh3IBxo
	 yThY3O6B9gowMf9aWC9yjWdm+rxIkh3DZ6jnwY0KPUJ+pKeRZy7k5gysa4qNRirsAr
	 EVP/iKRi5fu6MIP+L2pNjNOHmkopvCDoqQGEJHR8tnxAyWYb1lMwy0iPVivaPxIsvW
	 JQF1aNfkoWANa2S3oftjhFBpEKf9zeSM/wjEACDjajFSBYeBEDLBODyxuG7DWQEP83
	 LODEgi4xBFbVuPyb2FaP1oNq/XekMZ9RZ9OQ4Avo6hs6lW9LU9NOADXt0wEU4cp7vq
	 2DHiy1MO3r+wANuN02UQUdiBpnA6JptKbFpFAUm2QxF2YVqr5ZkUzU5XedyZBMaX1D
	 S0VJmp/s1GsYmDp8J8pTMvZwR7N0WOmJivHMziA2sWTE4LcJutx63SPkZ7RXsybT+M
	 reDEv9GTZ+cMx7EGv+RWI1NnbH72w/W3pVf59mJu3pBJjLl5huzNTwTQJxtyqvYttf
	 89jlGgZRzGyf6KTdMo4pIOWs=
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-372800b9a5fso9039eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365255; x=1794970055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nc1d20iO8S7OwSjr/iHXLonHbzWzCZV2V+n9Ocf83Ws=;
        b=Ouat+dHfcVeqF07Coxibsa37zGVkW6M3zK0FMAsaCG6tEr9prJJOJkUSaef9KYcX+h
         sfGbm2YtnGP1gaPDy1R64OlySzs7iY4unA+IB2c7CttQdgxdYh3vzBh/OC8OQI0AYjia
         ALaEJRO6YwfOsSIdhoQu/3aNlsXR3xq/FTe62kL/YWCdmub7Vt55TCbvmIUVAnkPb2Rf
         +QTBlqWPVJUsYCeLfh9GNRL2z5aq9te5J3eFQiz65oq7rKUtsisezd/xbX9tZfxUG2Nd
         S4gWPBzvENmvCc40FLdxnpdJl4v6L7z6MCYF/+mHNjdQkN2h7I/MPbsTINn1AhBmXThr
         HoNw==
X-Forwarded-Encrypted: i=1; AL+hErGww+9hlSUjKqmmZiaeYI+LiTbbI5fKN2+XxbIjUQzbOy2uEc87Uikv458Qi1dZdh82qQhEqHO70qg3qyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p2Y4X+IvqYNzVV17VpDFhpla0FnRq8Wb1rn4wziXwvgc8JLg3
	CqTu5cyUFoYVgQgTUMv5D4CcUtr/Z7EesuSoY+XHexfjywp+Fa5BhN/kOg7jHGipJxgG4HtPOWg
	2eyq3T3702c1Tv8wrtPVKJtIk3yzvZ/XxRDbmT2khzyKgqypu3Lgusm3arC25KTInJzh+VrsvNP
	pimQufwg==
X-Gm-Gg: AYBFou2tgYQ1vUl5KfE0vyHSjTj/v4rEudwdkUlxPAEvPBRlxFLJ++1J4PiEcIWvv0n
	tLI7pLVEGwYNW0V9MyKWCPRmefsd7yNLtSKDhz4S/oF5byx60+hG3YsfxM0ZpcD94f4HwbmHi81
	D3fSe3X7BnNP8lj56FEZvNT3Bs6aEejrZK7exQhWx8nkbky90eULnPTI4sdwYLMmIDZOZK/ZyHf
	p8YauJ7S5rWyXMloiToZzMnK69KbSiu5eFLQqva1wKRHWaSjEKwvZYSjQF09Sp8NzFgljsAkH5d
	aw8+e7DPI5rInlYBKBkprA/lpj7GxSepJA4a84tkBBbKB200v5D0TsooSEVarn/ro5M0PXUlTm1
	uloVLZGIm7RJAXWEY8U6a9aiTky5nvDk1P04NmF7SydqLfllgTZzY+eGXOomXU00SH1k=
X-Received: by 2002:a05:701b:21c3:b0:183:d275:cf76 with SMTP id a92af1059eb24-1b3c02fe0abmr1434456c88.2.1794365254544;
        Tue, 10 Nov 2026 18:47:34 -0800 (PST)
X-Received: by 2002:a05:701b:21c3:b0:183:d275:cf76 with SMTP id a92af1059eb24-1b3c02fe0abmr1434406c88.2.1794365253829;
        Tue, 10 Nov 2026 18:47:33 -0800 (PST)
Received: from jeconder-p14s6.. ([101.98.128.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm10011461c88.0.2026.11.10.18.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:47:33 -0800 (PST)
From: Jonathan Conder <jonathan.conder@canonical.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Conder <jonathan.conder@canonical.com>,
	jailhouse-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/jailhouse: Cache the Jailhouse CPUID base
Date: Wed, 11 Nov 2026 15:46:51 +1300
Message-ID: <20261111024652.516000-1-jonathan.conder@canonical.com>
X-Mailer: git-send-email 2.43.0
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

This is an optimisation for booting nested VMs. With one level of
nesting, this patch cuts down a 2.5s boot by about 1s.

jailhouse_paravirt() looks for the Jailhouse signature with
cpuid_base_hypervisor(), which tries every possible hypervisor CPUID
base from 0x40000000 to 0x4000ff00, i.e. 256 CPUID instructions in the
worst case. PCI enumeration calls it repeatedly.

CPUID always exits to the hypervisor, so this is slow in virtual
machines. A KVM q35 guest with 16 PCIe root ports performs about 78,000
CPUID exits while booting. Caching the base removes the need for most of
these, assuming the result doesn't change and is the same on every CPU.

Disclaimer: the issue was discovered, and patch authored, with LLM
assistance. I built and tested the patch to confirm that it does speed
things up significantly.

Signed-off-by: Jonathan Conder <jonathan.conder@canonical.com>
---
Tested using the script below, 3 runs per kernel. Built using
x86_64_defconfig, kvm_guest.config and CONFIG_JAILHOUSE_GUEST=y.
I ran it inside a LXD VM on my AMD Ryzen AI 9 HX PRO 370 host.

Before:
uptime           2594ms  2452ms  2771ms
acpi_init         347ms   442ms   486ms
pci_subsys_init  1497ms  1269ms  1612ms

After:
uptime           1446ms  1559ms  1498ms
acpi_init         287ms   357ms   259ms
pci_subsys_init   419ms   505ms   515ms

Reproducer:
#!/bin/bash
# Boot a kernel under QEMU/KVM with 16 PCIe root ports and print how
# long ACPI and PCI init took. Intended to benchmark nested VM boot, so
# run it inside another VM.

set -e

kernel=${1:-arch/x86/boot/bzImage}

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

cat > "$tmp/init.c" <<'EOF'
/* Print boot timings, then power off. */
#include <stdio.h>
#include <string.h>
#include <sys/klog.h>
#include <sys/reboot.h>
#include <time.h>

static char log[8 << 20];

int main(void)
{
	struct timespec now;
	char name[64];
	long usecs;
	int len;

	clock_gettime(CLOCK_BOOTTIME, &now);
	printf("REPRO uptime          %ld ms\n", now.tv_sec * 1000 + now.tv_nsec / 1000000);

	len = klogctl(3 /* SYSLOG_ACTION_READ_ALL */, log, sizeof(log) - 1);
	log[len > 0 ? len : 0] = '\0';
	for (char *line = strtok(log, "\n"); line; line = strtok(NULL, "\n")) {
		char *p = strstr(line, "initcall ");

		if (p && sscanf(p, "initcall %63[^+]+%*s returned %*d after %ld usecs", name, &usecs) == 2 &&
		    (!strcmp(name, "pci_subsys_init") || !strcmp(name, "acpi_init")))
			printf("REPRO %-15s %ld ms\n", name, usecs / 1000);
	}

	fflush(stdout);
	reboot(RB_POWER_OFF);
	return 0;
}
EOF

gcc -O2 -static -o "$tmp/init" "$tmp/init.c"
(cd "$tmp" && echo init | cpio --quiet -o -H newc -R 0:0 > initramfs.cpio)

ports=""
for i in {1..16}; do
	ports+=" -device pcie-root-port,id=rp$i,chassis=$i,addr=$((1 + (i - 1) / 8)).$(((i - 1) % 8)),multifunction=on"
done

timeout 300 qemu-system-x86_64 -accel kvm -machine q35 -cpu host -smp 2 -m 1G \
	-nodefaults -display none -serial stdio -no-reboot $ports \
	-kernel "$kernel" -initrd "$tmp/initramfs.cpio" \
	-append "console=ttyS0 quiet initcall_debug log_buf_len=4M panic=-1" \
	< /dev/null > "$tmp/console.log" 2>&1

sed -n 's/^REPRO //p' "$tmp/console.log"

 arch/x86/kernel/jailhouse.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index f58ce9220e0f..7ace1b331e97 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -44,7 +44,7 @@ static void jailhouse_setup_irq(unsigned int irq)
 	mp_save_irq(&mp_irq);
 }
 
-static uint32_t jailhouse_cpuid_base(void)
+static uint32_t __jailhouse_cpuid_base(void)
 {
 	if (boot_cpu_data.cpuid_level < 0 ||
 	    !boot_cpu_has(X86_FEATURE_HYPERVISOR))
@@ -53,6 +53,19 @@ static uint32_t jailhouse_cpuid_base(void)
 	return cpuid_base_hypervisor("Jailhouse\0\0\0", 0);
 }
 
+static uint32_t jailhouse_cpuid_base(void)
+{
+	static u32 base = U32_MAX;
+	u32 val = READ_ONCE(base);
+
+	if (val == U32_MAX) {
+		val = __jailhouse_cpuid_base();
+		WRITE_ONCE(base, val);
+	}
+
+	return val;
+}
+
 static uint32_t __init jailhouse_detect(void)
 {
 	return jailhouse_cpuid_base();
-- 
2.43.0

