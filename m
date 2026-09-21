Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FAF3F7A83
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032038; cv=none; b=in2ymVLBeCOwb5BX/+zejfPPcg1riB27VrUXLLuBFMVv44qNjjrJ5dtGXlDM02pg11pmxryoAUOQAg+7c+c8fNNnFaTZyv/fT9gFPBDGzpfPIKRZI1USp25ZIiSzB3WGbqRyYzithX+okPYni8xi9R+GQl8q3eo0pCDKXi9oAuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032038; c=relaxed/simple;
	bh=c93vebiJj6iy2djm+3lrIDeoqd5Be76Gyj2lctZC6wI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U7tSVefuGilGqdP8zMEsaUraL9FMvDC1f3lp1hNfSdvsHHo0n1HvhA0zoWgXkRuG+Idbf4GlqogAAxZgbWJwZcm8IhzKRT6Nz5ZFqkYpLpoLSqS03P9AJtzvuAfF3Me2B72RCh2p+t4fd3f2TVqMdaZv2KihCUskihE7RQVuTXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TbOGyDea; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TbOGyDea"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso6273381a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032033; x=1790636833; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RR0zZiXpRm2WDANYV1GsiZi8Wtsj9oHp4lONKDVQ0To=;
        b=TbOGyDeaeoop2PUQJ478m9EpQljZ6OSWGMYWoRLs5TUEloHfG7diQagyOyQFhdvVdK
         EZYTsZ+P5lNwzC/Fv2Jna/Xr8b4kekEQEDeogQd5/V/m3v/1LJ4kCoNCkx1EkpyPQ9G3
         JIBDq+dDaxY+FqIjlEpspfhLk8Hm7dcm/tayYkXnPGlSz2p8EsWYgMD99Dp5cWqB2loU
         R99pmL0ymIiOv0xmu5tB6m0bDA5OiM4wlTzLnNxJFUEEvfrzyGHp/mug2gHqKiZAps2w
         R7Vod8WkaRYqx8hsKcDtV5lBe/G62MnM0upjh9CngLKjIue20T7I6EhG4i23bVMz7bwQ
         wNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032033; x=1790636833;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RR0zZiXpRm2WDANYV1GsiZi8Wtsj9oHp4lONKDVQ0To=;
        b=tAYMstmQ1TJ2NcvlTZ3GkGYLvY8x+Ph9k1C5nhxAAF73/aQJmEy28eOX2mi54p4c93
         bVpINBY2j+iJI+x8Q7vw12LSF1/7I5qkj4/XTVdeDyeYs8TUvpzmBt/ngFkuzNo1JjGN
         xHdUmfVVCOxtCblebW7ewhTOGB2PHmo8qlOIehMM+VwURoOMvmSbX6EZH8j3ThHoyIuI
         Hjt2H6ATPmTm9khRCKIxnW7f32H2uIsOz2DoMnjTwktVWyHG3jiP1LjdPll+YKSUXRr3
         FRLx3KdbAi4EinYQxKT9F/BwG7n4gvMzy1h2wDOpoHM+VrRdawMEjbjtzS3m9Kx3F9Tx
         GmtA==
X-Forwarded-Encrypted: i=1; AKwUvBy+PwpNwUztm/ORoxlzrpYNSKThFWofs/Np3avKnIKiUt7n10Eb621rO2lJfOncy3gaEetQ9bJ8RdknRVo=@vger.kernel.org
X-Gm-Message-State: AFuF++kl2EpkbHr+ypcZrrsOFCUfef+tNBmM9j7HkS+F5g9NHE5RawrS
	mm9mDjGina7TDYUVV08csd1vZTIDvv2+aWY8UFguVVBd1imNjg+rH8ft9nc0zqLFFiSHORI7eCa
	cFCFGUhvRMVxhLrmqdBduh1jMyQyHxg==
X-Received: from dldz19-n1.prod.google.com ([2002:a05:701b:4193:10b0:143:9704:de05])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:fc4b:b0:3a0:2900:f577 with SMTP id 98e67ed59e1d1-3a02900f8f6mr9538685a91.51.1790032032957;
 Mon, 21 Sep 2026 16:07:12 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:06:03 +0000
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-6-samagazaryan@google.com>
Subject: [PATCH v5 5/5] tools: i3c: add i3ctransfer utility
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
Content-Type: text/plain; charset="UTF-8"

Add the i3ctransfer userspace utility to tools/i3c/ for testing and
interacting with I3C target devices via /dev/bus/i3c/* character
devices.

Based on the i3ctransfer tool from i3c-tools by Vitor Soares, updated
for the unified I3C_IOC_XFER UAPI (struct i3c_ioc_xfer):
  - Supports SDR and HDR (HDR-DDR, HDR-TSP, HDR-TSL) transfer modes
    via -m/--mode and -c/--command options.
  - Reports actual_len bytes received on read transfers.

Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
Note to Vitor Soares:
  This patch ports your GPL-2.0 i3ctransfer utility from i3c-tools into
  tools/i3c/ and updates it for struct i3c_ioc_xfer (SDR/HDR modes and
  actual_len read reporting). Since the original GitHub commit did not
  include a Signed-off-by tag, could you please reply with your
  Signed-off-by or Acked-by so we can properly record your sign-off?

 MAINTAINERS             |   1 +
 tools/Makefile          |  13 +-
 tools/i3c/Build         |   1 +
 tools/i3c/Makefile      |  58 ++++++++
 tools/i3c/i3ctransfer.c | 307 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 374 insertions(+), 6 deletions(-)
 create mode 100644 tools/i3c/Build
 create mode 100644 tools/i3c/Makefile
 create mode 100644 tools/i3c/i3ctransfer.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 30a5cb12c4f0..8a4166ebc9dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12365,6 +12365,7 @@ F:	drivers/i3c/
 F:	include/dt-bindings/i3c/
 F:	include/linux/i3c/
 F:	include/uapi/linux/i3c/
+F:	tools/i3c/
 
 IBM Operation Panel Input Driver
 M:	Eddie James <eajames@linux.ibm.com>
diff --git a/tools/Makefile b/tools/Makefile
index cb40961a740f..7c17e7555fd7 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -20,6 +20,7 @@ help:
 	@echo '  freefall               - laptop accelerometer program for disk protection'
 	@echo '  gpio                   - GPIO tools'
 	@echo '  hv                     - tools used when in Hyper-V clients'
+	@echo '  i3c                    - I3C tools'
 	@echo '  iio                    - IIO tools'
 	@echo '  intel-speed-select     - Intel Speed Select tool'
 	@echo '  kvm_stat               - top-like utility for displaying kvm statistics'
@@ -70,7 +71,7 @@ acpi: FORCE
 cpupower: FORCE
 	$(call descend,power/$@)
 
-counter dma firewire hv guest bootconfig spi usb virtio mm bpf iio gpio objtool leds wmi firmware debugging tracing: FORCE
+counter dma firewire hv guest bootconfig spi usb virtio mm bpf i3c iio gpio objtool leds wmi firmware debugging tracing: FORCE
 	$(call descend,$@)
 
 bpf/%: FORCE
@@ -126,7 +127,7 @@ ynl: FORCE
 all: acpi counter cpupower dma gpio hv firewire \
 		perf selftests bootconfig spi turbostat usb \
 		virtio mm bpf x86_energy_perf_policy \
-		tmon freefall iio objtool kvm_stat wmi \
+		tmon freefall i3c iio objtool kvm_stat wmi \
 		debugging tracing thermal thermometer thermal-engine ynl
 
 acpi_install:
@@ -135,7 +136,7 @@ acpi_install:
 cpupower_install:
 	$(call descend,power/$(@:_install=),install)
 
-counter_install dma_install firewire_install gpio_install hv_install iio_install perf_install bootconfig_install spi_install usb_install virtio_install mm_install bpf_install objtool_install wmi_install debugging_install tracing_install:
+counter_install dma_install firewire_install gpio_install hv_install i3c_install iio_install perf_install bootconfig_install spi_install usb_install virtio_install mm_install bpf_install objtool_install wmi_install debugging_install tracing_install:
 	$(call descend,$(@:_install=),install)
 
 selftests_install:
@@ -166,7 +167,7 @@ ynl_install:
 	$(call descend,net/$(@:_install=),install)
 
 install: acpi_install counter_install cpupower_install dma_install gpio_install \
-		hv_install firewire_install iio_install \
+		hv_install firewire_install i3c_install iio_install \
 		perf_install selftests_install turbostat_install usb_install \
 		virtio_install mm_install bpf_install x86_energy_perf_policy_install \
 		tmon_install freefall_install objtool_install kvm_stat_install \
@@ -179,7 +180,7 @@ acpi_clean:
 cpupower_clean:
 	$(call descend,power/cpupower,clean)
 
-counter_clean dma_clean hv_clean firewire_clean bootconfig_clean spi_clean usb_clean virtio_clean mm_clean wmi_clean bpf_clean iio_clean gpio_clean objtool_clean leds_clean firmware_clean debugging_clean tracing_clean:
+counter_clean dma_clean hv_clean firewire_clean bootconfig_clean spi_clean usb_clean virtio_clean mm_clean wmi_clean bpf_clean i3c_clean iio_clean gpio_clean objtool_clean leds_clean firmware_clean debugging_clean tracing_clean:
 	$(call descend,$(@:_clean=),clean)
 
 libapi_clean:
@@ -227,7 +228,7 @@ ynl_clean:
 
 clean: acpi_clean counter_clean cpupower_clean dma_clean hv_clean firewire_clean \
 		perf_clean selftests_clean turbostat_clean bootconfig_clean spi_clean usb_clean virtio_clean \
-		mm_clean bpf_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
+		mm_clean bpf_clean i3c_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
 		freefall_clean build_clean libbpf_clean libsubcmd_clean \
 		gpio_clean objtool_clean leds_clean wmi_clean firmware_clean debugging_clean \
 		intel-speed-select_clean tracing_clean thermal_clean thermometer_clean thermal-engine_clean \
diff --git a/tools/i3c/Build b/tools/i3c/Build
new file mode 100644
index 000000000000..6a22328ad983
--- /dev/null
+++ b/tools/i3c/Build
@@ -0,0 +1 @@
+i3ctransfer-y += i3ctransfer.o
diff --git a/tools/i3c/Makefile b/tools/i3c/Makefile
new file mode 100644
index 000000000000..43ce8769185b
--- /dev/null
+++ b/tools/i3c/Makefile
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only
+include ../scripts/Makefile.include
+
+bindir ?= /usr/bin
+
+ifeq ($(srctree),)
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
+srctree := $(patsubst %/,%,$(dir $(srctree)))
+endif
+
+# Do not use make's built-in rules
+# (this improves performance and avoids hard-to-debug behaviour);
+MAKEFLAGS += -r
+
+CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
+
+ALL_TARGETS := i3ctransfer
+ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
+
+all: $(ALL_PROGRAMS)
+
+export srctree OUTPUT CC LD CFLAGS
+include $(srctree)/tools/build/Makefile.include
+
+#
+# We need the following to be outside of kernel tree
+#
+$(OUTPUT)include/linux/i3c: ../../include/uapi/linux/i3c
+	mkdir -p $(OUTPUT)include/linux/i3c 2>&1 || true
+	ln -sf $(CURDIR)/../../include/uapi/linux/i3c/i3cdev.h $@
+
+prepare: $(OUTPUT)include/linux/i3c
+
+#
+# i3ctransfer
+#
+I3CTRANSFER_IN := $(OUTPUT)i3ctransfer-in.o
+$(I3CTRANSFER_IN): prepare FORCE
+	$(Q)$(MAKE) $(build)=i3ctransfer
+$(OUTPUT)i3ctransfer: $(I3CTRANSFER_IN)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+
+clean:
+	rm -f $(ALL_PROGRAMS)
+	rm -rf $(OUTPUT)include/
+	find $(or $(OUTPUT),.) -name '*.o' -delete
+	find $(or $(OUTPUT),.) -name '\.*.o.d' -delete
+	find $(or $(OUTPUT),.) -name '\.*.o.cmd' -delete
+
+install: $(ALL_PROGRAMS)
+	install -d -m 755 $(DESTDIR)$(bindir);		\
+	for program in $(ALL_PROGRAMS); do		\
+		install $$program $(DESTDIR)$(bindir);	\
+	done
+
+FORCE:
+
+.PHONY: all install clean FORCE prepare
diff --git a/tools/i3c/i3ctransfer.c b/tools/i3c/i3ctransfer.c
new file mode 100644
index 000000000000..a5b071e63530
--- /dev/null
+++ b/tools/i3c/i3ctransfer.c
@@ -0,0 +1,307 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 Synopsys, Inc. and/or its affiliates.
+ * Copyright (c) 2026 Google LLC
+ *
+ * Author: Vitor Soares <vitor.soares@synopsys.com>
+ */
+
+#include <ctype.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include <linux/i3c/i3cdev.h>
+
+#define VERSION "0.2"
+
+static const char *sopts = "d:m:c:r:w:vh";
+static const struct option lopts[] = {
+	{"device",		required_argument,	NULL,	'd' },
+	{"mode",		required_argument,	NULL,	'm' },
+	{"command",		required_argument,	NULL,	'c' },
+	{"read",		required_argument,	NULL,	'r' },
+	{"write",		required_argument,	NULL,	'w' },
+	{"help",		no_argument,		NULL,	'h' },
+	{"version",		no_argument,		NULL,	'v' },
+	{0, 0, 0, 0}
+};
+
+static void print_usage(const char *name)
+{
+	fprintf(stderr, "usage: %s options...\n", name);
+	fprintf(stderr, "  options:\n");
+	fprintf(stderr, "    -d --device  <dev>    device to use.\n");
+	fprintf(stderr,
+		"    -m --mode    <mode>   sdr (default), hdr-ddr, hdr-tsp, hdr-tsl.\n");
+	fprintf(stderr,
+		"    -c --command <cmd>    HDR command byte (0x00-0x7f W, 0x80-0xff R).\n");
+	fprintf(stderr, "    -r --read    <len>    read data length in bytes.\n");
+	fprintf(stderr,
+		"    -w --write   <block>  write comma-separated bytes (e.g. 0x01,0x02).\n");
+	fprintf(stderr, "    -h --help             output usage message and exit.\n");
+	fprintf(stderr, "    -v --version          output version number and exit.\n");
+}
+
+static int parse_mode(const char *arg, uint8_t *mode)
+{
+	char *endptr;
+	long val;
+
+	if (!strcmp(arg, "sdr")) {
+		*mode = I3C_XFER_MODE_SDR;
+		return 0;
+	}
+	if (!strcmp(arg, "hdr-ddr") || !strcmp(arg, "ddr")) {
+		*mode = I3C_XFER_MODE_HDR_DDR;
+		return 0;
+	}
+	if (!strcmp(arg, "hdr-tsp") || !strcmp(arg, "tsp")) {
+		*mode = I3C_XFER_MODE_HDR_TSP;
+		return 0;
+	}
+	if (!strcmp(arg, "hdr-tsl") || !strcmp(arg, "tsl")) {
+		*mode = I3C_XFER_MODE_HDR_TSL;
+		return 0;
+	}
+
+	val = strtol(arg, &endptr, 0);
+	if (*endptr == '\0' &&
+	    (val == I3C_XFER_MODE_HDR_DDR ||
+	     val == I3C_XFER_MODE_HDR_TSP ||
+	     val == I3C_XFER_MODE_HDR_TSL ||
+	     val == I3C_XFER_MODE_SDR)) {
+		*mode = (uint8_t)val;
+		return 0;
+	}
+
+	fprintf(stderr, "Error: invalid transfer mode '%s'\n", arg);
+	return -1;
+}
+
+static int rx_args_to_xfer(struct i3c_ioc_xfer *xfer, char *arg,
+			   uint8_t mode, int cmd)
+{
+	char *endptr;
+	uint8_t *tmp;
+	long len;
+
+	len = strtol(arg, &endptr, 0);
+	if (*endptr != '\0' || len <= 0 || len > UINT16_MAX) {
+		fprintf(stderr, "Error: invalid read length '%s'\n", arg);
+		return -1;
+	}
+
+	if (mode == I3C_XFER_MODE_SDR) {
+		xfer->rnw = I3C_DEV_DIR_READ;
+	} else {
+		if (cmd < 0 || !(cmd & 0x80)) {
+			fprintf(stderr,
+				"Error: HDR read requires command (-c) in range 0x80..0xff\n");
+			return -1;
+		}
+		xfer->cmd = (uint8_t)cmd;
+	}
+
+	tmp = calloc(len, sizeof(uint8_t));
+	if (!tmp)
+		return -1;
+
+	xfer->mode = mode;
+	xfer->len = (uint16_t)len;
+	xfer->data = (uintptr_t)tmp;
+
+	return 0;
+}
+
+static int w_args_to_xfer(struct i3c_ioc_xfer *xfer, char *arg,
+			  uint8_t mode, int cmd)
+{
+	char *data_ptrs[256];
+	int len, i = 0;
+	uint8_t *tmp;
+
+	if (mode == I3C_XFER_MODE_SDR) {
+		xfer->rnw = I3C_DEV_DIR_WRITE;
+	} else {
+		if (cmd < 0 || (cmd & 0x80)) {
+			fprintf(stderr,
+				"Error: HDR write requires command (-c) in range 0x00..0x7f\n");
+			return -1;
+		}
+		xfer->cmd = (uint8_t)cmd;
+	}
+
+	data_ptrs[i] = strtok(arg, ",");
+	while (data_ptrs[i] && i < 255)
+		data_ptrs[++i] = strtok(NULL, ",");
+
+	if (i == 0) {
+		fprintf(stderr, "Error: empty write data block\n");
+		return -1;
+	}
+
+	tmp = calloc(i, sizeof(uint8_t));
+	if (!tmp)
+		return -1;
+
+	for (len = 0; len < i; len++) {
+		char *endptr;
+		long val = strtol(data_ptrs[len], &endptr, 0);
+
+		if (*endptr != '\0' || val < 0 || val > UINT8_MAX) {
+			fprintf(stderr, "Error: invalid byte value '%s'\n",
+				data_ptrs[len]);
+			free(tmp);
+			return -1;
+		}
+		tmp[len] = (uint8_t)val;
+	}
+
+	xfer->mode = mode;
+	xfer->len = (uint16_t)len;
+	xfer->data = (uintptr_t)tmp;
+
+	return 0;
+}
+
+static void print_rx_data(const struct i3c_ioc_xfer *xfer)
+{
+	const uint8_t *tmp = (const uint8_t *)(uintptr_t)xfer->data;
+	int i;
+
+	fprintf(stdout, "  received data (%u bytes):\n", xfer->actual_len);
+	for (i = 0; i < xfer->actual_len; i++)
+		fprintf(stdout, "    0x%02x\n", tmp[i]);
+}
+
+int main(int argc, char *argv[])
+{
+	uint8_t mode = I3C_XFER_MODE_SDR;
+	struct i3c_ioc_xfer *xfers;
+	char *device = NULL;
+	int file, ret, opt, i;
+	int nxfers = 0;
+	int cmd = -1;
+
+	while ((opt = getopt_long(argc, argv, sopts, lopts, NULL)) != EOF) {
+		switch (opt) {
+		case 'h':
+			print_usage(argv[0]);
+			return EXIT_SUCCESS;
+		case 'v':
+			fprintf(stderr, "%s - %s\n", argv[0], VERSION);
+			return EXIT_SUCCESS;
+		case 'd':
+			device = optarg;
+			break;
+		case 'm':
+			if (parse_mode(optarg, &mode))
+				return EXIT_FAILURE;
+			break;
+		case 'c': {
+			char *endptr;
+			long val = strtol(optarg, &endptr, 0);
+
+			if (*endptr != '\0' || val < 0 || val > UINT8_MAX) {
+				fprintf(stderr, "Error: invalid command '%s'\n",
+					optarg);
+				return EXIT_FAILURE;
+			}
+			cmd = (int)val;
+			break;
+		}
+		case 'r':
+		case 'w':
+			nxfers++;
+			break;
+		default:
+			print_usage(argv[0]);
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (!device || nxfers == 0) {
+		print_usage(argv[0]);
+		return EXIT_FAILURE;
+	}
+
+	file = open(device, O_RDWR);
+	if (file < 0) {
+		fprintf(stderr, "Error: failed to open %s: %s\n",
+			device, strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	xfers = calloc(nxfers, sizeof(*xfers));
+	if (!xfers) {
+		close(file);
+		return EXIT_FAILURE;
+	}
+
+	optind = 1;
+	nxfers = 0;
+	cmd = -1;
+
+	while ((opt = getopt_long(argc, argv, sopts, lopts, NULL)) != EOF) {
+		switch (opt) {
+		case 'h':
+		case 'v':
+		case 'd':
+		case 'm':
+			break;
+		case 'c':
+			cmd = (int)strtol(optarg, NULL, 0);
+			break;
+		case 'r':
+			if (rx_args_to_xfer(&xfers[nxfers], optarg, mode, cmd)) {
+				ret = EXIT_FAILURE;
+				goto err_free;
+			}
+			nxfers++;
+			break;
+		case 'w':
+			if (w_args_to_xfer(&xfers[nxfers], optarg, mode, cmd)) {
+				ret = EXIT_FAILURE;
+				goto err_free;
+			}
+			nxfers++;
+			break;
+		}
+	}
+
+	if (ioctl(file, I3C_IOC_XFER(nxfers), xfers) < 0) {
+		fprintf(stderr, "Error: transfer failed: %s\n", strerror(errno));
+		ret = EXIT_FAILURE;
+		goto err_free;
+	}
+
+	for (i = 0; i < nxfers; i++) {
+		bool is_read = (mode == I3C_XFER_MODE_SDR) ?
+			       (xfers[i].rnw == I3C_DEV_DIR_READ) :
+			       (xfers[i].cmd & 0x80);
+
+		fprintf(stdout, "Success on message %d\n", i);
+		if (is_read)
+			print_rx_data(&xfers[i]);
+	}
+
+	ret = EXIT_SUCCESS;
+
+err_free:
+	for (i = 0; i < nxfers; i++)
+		free((void *)(uintptr_t)xfers[i].data);
+	free(xfers);
+	close(file);
+
+	return ret;
+}
-- 
2.55.0.1082.g2b9226bbc0-goog

