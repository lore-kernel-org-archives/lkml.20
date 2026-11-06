Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942250;
	b=Ll9SFiVNAoWgNBNP8Z6RU9RFmxLoCsJjK0lxai/IiCBL5W/kemUYHxrDpecNSTy0U378
	 oOPeJsTTn2kJme7QHFeVnST6hsQyYIYPZpnmmC4S0iUheckDvSWg2RpuckoG3p0xCz7rv
	 i3UReamGCIsd7F1Qml2YxfmPkGLarw7QGMohF7Erfwwj4/CYSooubmSLZAGqF26nw18Jj
	 fufZtij4oHwnyHpISxJ6Q/dn3aaBaPrQtDcfodTv4qe+evg9X/2VzncZzDlpdvLopd7Ml
	 Dwta84lbJNxYnGeo3FrdCFohJRIZhRkAoNQrZoFdMktWUb4ufGQ+v6MjbHKquPcpLoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=wKPkQFzoUgmDW5ajGq1k5LXk3Iw2pT7nfh9L7siN7ds=;
	b=Xlvo58WHpE6FnCHiJVrDAhnyEzRCoJvRLlM/FpBTOBdSVe+S7QTcLzRxQORit7W/qFZP
	 wOamp9769UbzP9aKhHr24KeYZthff5K6uLSt6jC89Mgsgzbjq2zM2Z9C8+9G+HcCAQIdO
	 phj6D9SqyUSV8wC2MHxOG/+d1ZcDCVCCbCBvRLThXQXrj36srz6fIAGx0PTIw2qlzaZvE
	 C8+TV444etr5FhWgKpFR7b4g4GD9lYK93uizd0u9eRoexM7uD5m8rBCCsAUZ6jttfWOh6
	 eQC+jGIvoGR0sUXnWwZgvuJj6QbKb7fzo1FbCKxbEsOCF7U7fpMkVQEEiT+kpQGadlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="EJjG5l/Y";
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DF9606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DF9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jrhilke.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EJjG5l/Y
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso200567a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793942249; x=1794547049; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKPkQFzoUgmDW5ajGq1k5LXk3Iw2pT7nfh9L7siN7ds=;
        b=EJjG5l/YfLtWUmA8DfgNfzXbhO8URPuzeP06Zexc83aNADxVbMgDeeRO9oJxh/QmYC
         le28ekS7579AEnhwpNury6CVcfFIdRaeA90LCloOKQmNxYpI6NtsuBUoXH1oXb9eQKBP
         O/niIwfx8zKUOOq5JYEAgzr2MIPh/SlD+XpapXcTVq6jDrQTErmqNy5PgJAVqgnx53uc
         IKTHoiv07axZqAxtQeyJ3zK9d3QhIdgulXPTJxNftdpvXXpzkgINpS6TDwa8urAqcPZx
         JYVO8Nqiah++Q+hxlCwr+Zd7fyzUYhAWNMVtDKfpJRsv5Wj4yZUag8ywh9ehO8IF0QJp
         WWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942249; x=1794547049;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKPkQFzoUgmDW5ajGq1k5LXk3Iw2pT7nfh9L7siN7ds=;
        b=tjqqwoS0gy4jLe3cVZgx65m0Fdn/CADq15eSVJCpA6k5Dj6M5mjmbv60hqQSCTN8GQ
         U1bvDOcpyzVWPA/d3BtbAGgdt+eBgv+3lwOQIs2LcyrkYUadgDMiTid9KqGELIQBBVrc
         jFIgG5MXdqsTXv0sfLh+xSsPE3Z01MZJ6kfCQWomDJQWMNPRTZGR+LHpeHLXiWnas4Qj
         lNNsIbVde6EACtm/Lh5RPJ20lvcaJ2VqOYEyOP2Rl6+WntN+ZGgu9KeOi20XdC1r0Ryh
         Wm8GCxBsZmROUxkIM5yUJj2pxVM3ss153aZYmXKj9som5WL7l2Am6wHbZKMttma9t6ix
         3/Bg==
X-Forwarded-Encrypted: i=1; AL+hErELJdMfICPkzDEXTLaHZ54R2L/tbsD9e8NSC+FwUEHrsh/nYy7GnFiMn5PmQZxbVxmmrRyqnEr49+ZcfqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zR1Y/tnmeDBuQHBvAx+G6OYJut0i4WI+BGw2o+MV2RVEK6B6s
	4WFCe7MD2IEDVs/m8hhQbHa9QXDyyMe0kdaMMx6ZPYTypH8WjvE6nEeZ8cTzLND3qIq3saQDRwH
	AmkLQ121O
X-Received: from pjuz17.prod.google.com ([2002:a17:90a:d791:b0:3b0:a489:6e84])
 (user=jrhilke job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e185:b0:3ac:80dc:f40a
 with SMTP id 98e67ed59e1d1-3b0db6c99bamr1392450a91.16.1793942249005; Thu, 05
 Nov 2026 21:17:29 -0800 (PST)
Date: Fri,  6 Nov 2026 05:17:26 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106051726.3964374-1-jrhilke@google.com>
Subject: [PATCH v7] vfio: selftests: Find devices that have VFIO selftest drivers
From: Josh Hilke <jrhilke@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: David Matlack <dmatlack@google.com>, Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a new script, list_supported_devices.sh, which prints out the
segment:bus:device.function (SBDF) numbers and names of devices on a
machine that have a VFIO selftest driver. This makes it easier to
determine if the system is capable of running VFIO selftests.

Some of these devices are on the vfio-pci denylist, so vfio-pci refuses
to bind them unless vfio_pci.disable_denylist=Y. The script marks such
devices as DENYLISTED and prints how to enable them, so the user is not
left wondering why the selftests cannot use a "supported" device.

Includes a -q (quiet) argument which prints just the SBDFs of devices
that vfio-pci can bind, so that the output can be passed directly to
tools/testing/selftests/vfio/scripts/setup.sh. Does not print the SBDF
of a device on the denylist.

Examples on a host with eight Intel DSA devices:

$ cat /sys/module/vfio_pci/parameters/disable_denylist
N

$ ./list_supported_devices.sh
0000:6a:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
0000:6f:01.0 - Intel DSA SPR [8086:0b25] (DENYLISTED)
...
vfio-pci does not bind DENYLISTED devices while
vfio_pci.disable_denylist=N. To use them, reload vfio-pci:
  modprobe -r vfio-pci
  modprobe vfio-pci disable_denylist=1
If vfio-pci is built into the kernel, boot with
vfio_pci.disable_denylist=1 instead.

With vfio_pci.disable_denylist=Y, the script lists the same devices with
"(DENYLISTED, but vfio_pci.disable_denylist=Y)", prints no hint, and
includes them in the -q output:

$ ./list_supported_devices.sh -q
0000:6a:01.0
0000:6f:01.0
...

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
---
Changelog

v6 -> v7
- Mark devices on the vfio-pci denylist as DENYLISTED, and say when
  vfio_pci.disable_denylist=Y allows them (Sean)
- Print how to enable denylisted devices when the denylist is on (Sean)
- Leave out denylisted devices from the -q output when the denylist is
  on, so the -q output only has devices that setup.sh can bind (Sean)
- Add the igb and mlx5 devices. Leave out nv_falcon, because its probe
  matches on a BAR0 register (PMC_BOOT_0), not on a PCI ID, so the script
  cannot tell if a given NVIDIA GPU will work
- The mlx5 IDs and names are copied from mlx5st_probe(). They are not
  tested on hardware
- Print a message on stderr when no device is found
- Read device IDs from sysfs instead of lspci, so the script no longer
  needs pciutils

v6: https://lore.kernel.org/kvm/20260602222941.3133236-1-jrhilke@google.com/
v5: https://lore.kernel.org/kvm/20260602185615.3025904-1-jrhilke@google.com/

 tools/testing/selftests/vfio/Makefile         |   1 +
 .../vfio/scripts/list_supported_devices.sh    | 146 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100755 tools/testing/selftests/vfio/scripts/list_supported_devices.sh

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..160aa989828f 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -16,6 +16,7 @@ TEST_GEN_PROGS += vfio_pci_sriov_uapi_test
 
 TEST_FILES += scripts/cleanup.sh
 TEST_FILES += scripts/lib.sh
+TEST_FILES += scripts/list_supported_devices.sh
 TEST_FILES += scripts/run.sh
 TEST_FILES += scripts/setup.sh
 
diff --git a/tools/testing/selftests/vfio/scripts/list_supported_devices.sh b/tools/testing/selftests/vfio/scripts/list_supported_devices.sh
new file mode 100755
index 000000000000..d1fad82f704a
--- /dev/null
+++ b/tools/testing/selftests/vfio/scripts/list_supported_devices.sh
@@ -0,0 +1,146 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Devices that have a driver in selftests/vfio/lib/drivers.
+readonly DEVICES=(
+	"8086:0b25,Intel DSA SPR"
+	"8086:11fb,Intel DSA GNR-D"
+	"8086:1212,Intel DSA DMR"
+	"8086:2021,Intel IOAT SKX"
+	"8086:10c9,Intel 82576 Gigabit Ethernet Controller"
+	"15b3:1011,Mellanox Connect-IB"
+	"15b3:1012,Mellanox Connect-IB VF"
+	"15b3:1013,Mellanox ConnectX-4"
+	"15b3:1014,Mellanox ConnectX-4 VF"
+	"15b3:1015,Mellanox ConnectX-4LX"
+	"15b3:1016,Mellanox ConnectX-4LX VF"
+	"15b3:1017,Mellanox ConnectX-5"
+	"15b3:1018,Mellanox ConnectX-5 VF"
+	"15b3:1019,Mellanox ConnectX-5 Ex"
+	"15b3:101a,Mellanox ConnectX-5 Ex VF"
+	"15b3:101b,Mellanox ConnectX-6"
+	"15b3:101c,Mellanox ConnectX-6 VF"
+	"15b3:101d,Mellanox ConnectX-6 Dx"
+	"15b3:101e,Mellanox ConnectX-6 Dx VF"
+	"15b3:101f,Mellanox ConnectX-6 LX"
+	"15b3:1021,Mellanox ConnectX-7"
+	"15b3:1023,Mellanox ConnectX-8"
+	"15b3:1025,Mellanox ConnectX-9"
+	"15b3:1027,Mellanox ConnectX-10"
+	"15b3:2101,Mellanox ConnectX-10 NVLink-C2C"
+	"15b3:a2d2,Mellanox BlueField integrated ConnectX-5"
+	"15b3:a2d3,Mellanox BlueField integrated ConnectX-5 VF"
+	"15b3:a2d6,Mellanox BlueField-2 integrated ConnectX-6 Dx"
+	"15b3:a2dc,Mellanox BlueField-3 integrated ConnectX-7"
+	"15b3:a2df,Mellanox BlueField-4 integrated ConnectX-8"
+)
+
+# Devices in DEVICES that are also on the vfio-pci denylist. The denylist is
+# in vfio_pci_dev_in_denylist() in drivers/vfio/pci/vfio_pci.c.
+readonly DENYLIST=(
+	"8086:0b25"
+)
+
+readonly DISABLE_DENYLIST=/sys/module/vfio_pci/parameters/disable_denylist
+
+function denylisted() {
+	local id
+
+	for id in "${DENYLIST[@]}"; do
+		[ "${id}" = "${1}" ] && return 0
+	done
+
+	return 1
+}
+
+function denylist_enforced() {
+	local value
+
+	read -r value 2>/dev/null < ${DISABLE_DENYLIST}
+	[ "${value}" != "Y" ]
+}
+
+function is_blocked() {
+	denylisted ${1} && denylist_enforced
+}
+
+function device_name() {
+	local entry
+
+	for entry in "${DEVICES[@]}"; do
+		if [ "${entry%%,*}" = "${1}" ]; then
+			echo "${entry#*,}"
+			return 0
+		fi
+	done
+
+	return 1
+}
+
+function denylist_note() {
+	if ! denylisted ${1}; then
+		return
+	elif denylist_enforced; then
+		echo " (DENYLISTED)"
+	else
+		echo " (DENYLISTED, but vfio_pci.disable_denylist=Y)"
+	fi
+}
+
+function print_denylist_hint() {
+	echo "vfio-pci does not bind DENYLISTED devices while"
+	echo "vfio_pci.disable_denylist=N. To use them, reload vfio-pci:"
+	echo "  modprobe -r vfio-pci"
+	echo "  modprobe vfio-pci disable_denylist=1"
+	echo "If vfio-pci is built into the kernel, boot with"
+	echo "vfio_pci.disable_denylist=1 instead."
+}
+
+# Print the segment:bus:device.function numbers of PCI devices that can be used
+# to run VFIO selftests.
+function main() {
+	local blocked=""
+	local quiet=""
+	local found=""
+	local vendor
+	local device
+	local name
+	local bdf
+	local opt
+	local id
+
+	while getopts "q" opt; do
+		case $opt in
+			q) quiet="true" ;;
+			\?) echo "Usage: $0 [-q]" >&2; exit 1 ;;
+		esac
+	done
+
+	for bdf in $(ls /sys/bus/pci/devices); do
+		read -r vendor < /sys/bus/pci/devices/${bdf}/vendor
+		read -r device < /sys/bus/pci/devices/${bdf}/device
+		printf -v id "%04x:%04x" ${vendor} ${device}
+
+		name=$(device_name ${id}) || continue
+		found="true"
+		if is_blocked ${id}; then
+			blocked="true"
+		fi
+
+		if [ -z "${quiet}" ]; then
+			echo "${bdf} - ${name} [${id}]$(denylist_note ${id})"
+		elif ! is_blocked ${id}; then
+			echo "${bdf}"
+		fi
+	done
+
+	if [ "${quiet}" ]; then
+		return 0
+	elif [ -z "${found}" ]; then
+		echo "No devices with a VFIO selftest driver found." >&2
+	elif [ "${blocked}" ]; then
+		print_denylist_hint >&2
+	fi
+}
+
+main "$@"
-- 
2.56.0.455.g6c5a503b38-goog

