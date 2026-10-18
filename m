Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616FD41F7ED
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321622; cv=none; b=cNNa7p7f3nuLAgYEhJtmjnmVoqx+CnO4sebmMQmtdQ3jWUlvNP4WJkJWkaBrA1zullb2UN2i7zn/GNvVOsyQfeJHUn90I0MA5Keh/fqarV4Y98MEbCDUmyFby8huSpvJAV3LBYC5sl4jtk8nyLFcURhZG085/MQweJvG86gbvHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321622; c=relaxed/simple;
	bh=ALrl2RGUzlXN5xhcL7wZPi3AbsGka30hhw7ftTT99iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFoSeDzCdIR7B/1/OzbvDuU0N9FbZ8PAJbT1+uXrCq7XoZ+UZP6njDI/K5fyleTWGTJMbn3zL2hOVsPq3ht2u5twwZclcrPGfkIcekYjNmreiJEOYZAFos3/j1qP66ebdSFSNmFOgkdh95u4Lhx4cxL29KVQr+pbc36j2qtuSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScBmfbaM; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScBmfbaM"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so2973662eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321619; x=1792926419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjxzy/EiGxBx8JgOHOQAu4umV7/l7agpWQEdIl4EN7E=;
        b=ScBmfbaML1g7lsftRtuMgS7LRMfAGB524FW8vbtRqF/OYsMHA3Q99LwwSoc6GImEmz
         C9FkdOwA0FBeBgqbBA6EDyBE3YD90VRvmlWBAXbLdTv1JVqwVLMNOswFBrOjqbCNLNci
         qgNFBxwXtOltdkgbrxNtcp0QyO6E/VmxrpE6WL9jkb9AU1znQ1XtkeF9X/9kv3nRB4YQ
         v1fB06TsGcJH/tkLB5w11tXk7i7h794u+5YbC+J58UrK0fuElLiEr+AWMGrj88fqOdaG
         RO/Zr3OuRCQywO7w4/rdwb4/gaS1yy3obiK8RXpOugVo/lGp6th7cAfUSndp2spbH8AG
         irzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321619; x=1792926419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjxzy/EiGxBx8JgOHOQAu4umV7/l7agpWQEdIl4EN7E=;
        b=vC7a04Rqgdhj+4UWP7Qhj33/OvNcMdvtQgNhuiWwQk/Fnqhl9PeilDrABx0tJ1XnA6
         TMfFmSkbLqiZWDDKx7cmDMQzuX4F7W74pO4x/NkLXKRtB07kd1LiJG1ltIgwnEu2chCr
         Pt3aHAAUHd9AwZK/NSt/xgOYTxeoDlA2GokaWDF/hUxsLcXLcPZZnnhSueGmIb81trVD
         FO3HsWmHaumYYi0FlTYKO8C9swd4joDYm/++4xfrmjkE0uggPb5GYyLeKsQy/h4rj/sb
         txK+RcDcKqcPIJfRv+Jd7upvSI5AEwItT9h+Bt29xIVY2pDEeHIl2kzkMILSQ5ty50wg
         7D5w==
X-Gm-Message-State: AFq9FYKt99FS8s9nvRi8DkavALO/kmCrNSQCf8MqVx0YaQ13hnW0dwR5
	eXEEGE+hZFrmzvoCeizGAdf98GyjiaWLdfx4NhyVkfXoiI9hvsDrfLcUYFZolN6K
X-Gm-Gg: AYBFou1nalRnWyzYcmnqE+Kcao03iHgV1OmPCvTxCwWq2/w4c2SC3ZaVxa9lDHxmnhS
	k6g+D4652GdFzhS7oXQwUI43R2OjgiZCewZIWXEKVLnleF4BaF8cvL/CjfzfyXt78hxng1/jFnu
	c+fEBSkRw0BKnPjnGi16SbNYA2r7qAUVKJCKL3/SP8sNiqKp9GygMxwKlzVFw+N2nSKWodF1SXT
	6Txq3N6nQSElDHt5gtaC7G2DuMYsOOtUpC0vpry0Z50nreg1XaFkcZ1NhIpGPD7hLmpbKtaVzwo
	2JIIco8TR/Mcg1alM9kw5UqpnB2prj5becQikQQiCnBAsKo/YNvRrjw8vASugVPFDTiasOYtIKA
	GW37fNkbrS6WJlzfdmVewMVUlvfh7Y1juP5QSelOvo6Gd+rdrk16quPFU3jVBy5Dvg4Vh3JZEmh
	+1W596PBDGaR4PwQxDh3pMF0I2g+R3UwHnQ0eYHGx+sLojTbLX9+g+F6mbMGnnKN2A7pQmxwR4e
	3VygOdpruPVD30iOlbvevztusaLFgTg3RpOU+cRWyeycq/rh6lT
X-Received: by 2002:a05:7301:1885:b0:361:7edc:1541 with SMTP id 5a478bee46e88-361a126f7b2mr6723836eec.7.1792321619184;
        Sun, 18 Oct 2026 04:06:59 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm28647706eec.3.2026.10.18.04.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:06:58 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 6/7] scripts: convert leaking_addresses.pl to Python
Date: Sun, 18 Oct 2026 08:06:37 -0300
Message-ID: <20261018110638.9947-7-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018110638.9947-1-breno3011alves@gmail.com>
References: <20261018110638.9947-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of leaking_addresses.pl in Python 3
(stdlib only). Same architecture detection, same false-positive
filtering, same dmesg and /proc walk.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/leaking_addresses.py | 430 +++++++++++++++++++++++++++++++++++
 1 file changed, 430 insertions(+)
 create mode 100755 scripts/leaking_addresses.py

diff --git a/scripts/leaking_addresses.py b/scripts/leaking_addresses.py
new file mode 100755
index 000000000..a1664a66d
--- /dev/null
+++ b/scripts/leaking_addresses.py
@@ -0,0 +1,430 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# (c) 2017 Tobin C. Harding <me@tobin.cc>
+#
+# leaking_addresses.py: Scan the kernel for potential leaking addresses.
+#
+# Use --debug to output path before parsing.
+
+import argparse
+import os
+import platform
+import re
+import signal
+import subprocess
+import sys
+
+DIRS = ('/proc', '/sys')
+TIMEOUT = 10
+
+SKIP_ABS = {
+    '/proc/kmsg',
+    '/proc/device-tree',
+    '/proc/1/syscall',
+    '/sys/firmware/devicetree',
+    '/sys/kernel/tracing/trace_pipe',
+    '/sys/kernel/debug/tracing/trace_pipe',
+    '/sys/kernel/security/apparmor/revision',
+}
+
+SKIP_ANY = {
+    'pagemap', 'events', 'access', 'registers', 'snapshot_raw',
+    'trace_pipe_raw', 'ptmx', 'trace_pipe', 'fd', 'usbmon',
+}
+
+RE_ARCH_X86 = re.compile(r'i[3456]86')
+
+# Active per-arch state
+_ARCH = platform.machine() or ''
+_OPT_32BIT = False
+_PAGE_OFFSET_32BIT = 0
+_PGTABLE_LEVELS = None
+_KALLSYMS = []
+_KERNEL_CONFIG_FILE = ''
+_PAGE_OFFSET_CACHE = None
+
+
+def dprint(*args):
+    if _DEBUG:
+        print(*args, file=sys.stderr)
+
+
+def is_x86_64():
+    return _ARCH == 'x86_64'
+
+
+def is_ppc64():
+    return _ARCH == 'ppc64'
+
+
+def is_ix86_32():
+    return bool(RE_ARCH_X86.match(_ARCH))
+
+
+def is_32bit():
+    return _OPT_32BIT or bool(_PAGE_OFFSET_32BIT) or is_ix86_32()
+
+
+def get_kernel_config_option(option):
+    files = []
+    if _KERNEL_CONFIG_FILE:
+        files = [_KERNEL_CONFIG_FILE]
+    elif os.access('/proc/config.gz', os.R_OK):
+        try:
+            import gzip
+            with gzip.open('/proc/config.gz', 'rt') as f:
+                for line in f:
+                    if line.startswith(option):
+                        return line.split('=', 1)[1].strip()
+        except OSError as e:
+            dprint(f'failed reading /proc/config.gz: {e}')
+        return ''
+    else:
+        rel = subprocess.check_output(['uname', '-r'], text=True).strip()
+        files = [f'/boot/config-{rel}', '/boot/config']
+
+    for path in files:
+        try:
+            with open(path) as f:
+                for line in f:
+                    if line.startswith(option):
+                        return line.split('=', 1)[1].strip()
+        except OSError:
+            continue
+    return ''
+
+
+def get_page_offset():
+    global _PAGE_OFFSET_CACHE
+    if _PAGE_OFFSET_CACHE is not None:
+        return _PAGE_OFFSET_CACHE
+    default = 0xc0000000
+    if _PAGE_OFFSET_32BIT:
+        _PAGE_OFFSET_CACHE = _PAGE_OFFSET_32BIT
+        return _PAGE_OFFSET_CACHE
+    val = get_kernel_config_option('CONFIG_PAGE_OFFSET')
+    if val:
+        _PAGE_OFFSET_CACHE = int(val, 16)
+        return _PAGE_OFFSET_CACHE
+    _PAGE_OFFSET_CACHE = default
+    return default
+
+
+def is_false_positive_64(match):
+    if re.search(r'\b(0x)?(f|F){15}[0-9a-f]\b', match) or \
+       re.search(r'\b(0x)?0{16}\b', match):
+        return True
+    if is_x86_64() and _in_vsyscall(match):
+        return True
+    return False
+
+
+def is_false_positive_32(match):
+    if re.search(r'\b(0x)?(f|F){7}[0-9a-f]\b', match):
+        return True
+    if int(match, 16) < get_page_offset():
+        return True
+    return False
+
+
+def is_false_positive(match):
+    if is_32bit():
+        return is_false_positive_32(match)
+    return is_false_positive_64(match)
+
+
+def _in_vsyscall(match):
+    v = int(match, 16)
+    return 0xffffffffff600000 <= v <= 0xffffffffff601000
+
+
+def get_address_re():
+    if is_ppc64():
+        return re.compile(r'\b(0x)?[89abcdef]00[[:xdigit:]]{13}\b'
+                          .replace('[[:xdigit:]]', r'[0-9a-fA-F]'))
+    if is_32bit():
+        return re.compile(r'\b(0x)?[0-9a-fA-F]{8}\b')
+    global _PGTABLE_LEVELS
+    if _PGTABLE_LEVELS is None:
+        val = get_kernel_config_option('CONFIG_PGTABLE_LEVELS')
+        _PGTABLE_LEVELS = int(val) if val else 0
+    if _PGTABLE_LEVELS == 5:
+        return re.compile(r'\b(0x)?ff[0-9a-fA-F]{14}\b')
+    return re.compile(r'\b(0x)?ffff[0-9a-fA-F]{12}\b')
+
+
+def may_leak_address(path, line):
+    if re.match(r'^SigBlk:', line) or re.match(r'^SigIgn:', line) \
+            or re.match(r'^SigCgt:', line):
+        return False
+    if re.search(r'\bKEY=[0-9a-fA-F]{9,14} [0-9a-fA-F]{16} '
+                 r'[0-9a-fA-F]{16}\b', line):
+        return False
+    if path.endswith('key') and re.search(
+            r'\b[0-9a-fA-F]{9,14} [0-9a-fA-F]{16} [0-9a-fA-F]{16}\b',
+            line):
+        return False
+    pattern = get_address_re()
+    for m in pattern.finditer(line):
+        if not is_false_positive(m.group(0)):
+            return True
+    return False
+
+
+def parse_dmesg():
+    try:
+        out = subprocess.check_output(['dmesg'], text=True,
+                                      stderr=subprocess.DEVNULL)
+    except (subprocess.CalledProcessError, FileNotFoundError):
+        return
+    for line in out.splitlines(keepends=True):
+        if may_leak_address('dmesg', line):
+            sys.stdout.write('dmesg: ' + line)
+
+
+def skip(path):
+    if path in SKIP_ABS:
+        return True
+    return os.path.basename(path) in SKIP_ANY
+
+
+def parse_binary(path):
+    try:
+        with open(path, 'rb') as f:
+            data = f.read()
+    except OSError:
+        return
+    for addr, symbol in _KALLSYMS:
+        off = data.find(addr)
+        if off != -1:
+            print(f"{path}: {symbol} @ {off}")
+
+
+def parse_file(path):
+    if not os.access(path, os.R_OK):
+        return
+    # Skip pseudo-binaries
+    if path.startswith(('/sys/kernel/btf/', '/sys/devices/pci',
+                        '/sys/firmware/efi/efivars/', '/proc/bus/pci/')):
+        return
+    try:
+        with open(path, 'r', errors='replace') as f:
+            for line in f:
+                line = line.rstrip('\n')
+                if may_leak_address(path, line):
+                    print(f"{path}: {line}")
+    except (OSError, UnicodeDecodeError):
+        if _KALLSYMS:
+            parse_binary(path)
+
+
+def check_path_for_leaks(path):
+    if may_leak_address(path, path):
+        print(f"Path name may contain address: {path}")
+
+
+def timed_parse_file(path):
+    def handler(signum, frame):
+        raise TimeoutError()
+    old = signal.signal(signal.SIGALRM, handler)
+    signal.alarm(TIMEOUT)
+    try:
+        parse_file(path)
+    except TimeoutError:
+        print(f"timed out parsing: {path}", file=sys.stderr)
+    finally:
+        signal.alarm(0)
+        signal.signal(signal.SIGALRM, old)
+
+
+def walk(dirs):
+    stack = list(dirs)
+    while stack:
+        pwd = stack.pop()
+        try:
+            entries = os.listdir(pwd)
+        except OSError:
+            continue
+        for name in entries:
+            if name in ('.', '..'):
+                continue
+            path = os.path.join(pwd, name)
+            if os.path.islink(path):
+                continue
+            # Skip /proc/PID except /proc/1
+            if re.match(r'^/proc/\d+$', path) and path != '/proc/1':
+                continue
+            if skip(path):
+                continue
+            check_path_for_leaks(path)
+            if os.path.isdir(path):
+                stack.append(path)
+                continue
+            dprint(f'parsing: {path}')
+            timed_parse_file(path)
+
+
+def format_output(path, raw, squash_path, squash_filename, suppress_dmesg):
+    if raw or not (squash_path or squash_filename):
+        _dump_raw(path, suppress_dmesg)
+        return
+    total, dmesg, paths, files = _parse_raw(path)
+    print(f"\nTotal number of results from scan (incl dmesg): {total}")
+    if not suppress_dmesg:
+        _print_dmesg(dmesg)
+    if squash_filename:
+        _squash_by(files, 'filename')
+    if squash_path:
+        _squash_by(paths, 'path')
+
+
+def _dump_raw(path, suppress_dmesg):
+    try:
+        with open(path) as f:
+            for line in f:
+                if suppress_dmesg and line.startswith('dmesg:'):
+                    continue
+                sys.stdout.write(line)
+    except OSError as e:
+        sys.exit(f"{path}: {e}")
+
+
+def _parse_raw(path):
+    total = 0
+    dmesg = []
+    paths = {}
+    files = {}
+    try:
+        with open(path) as f:
+            for line in f:
+                total += 1
+                if line.startswith('dmesg:'):
+                    dmesg.append(line)
+                    continue
+                idx = line.find(': ')
+                if idx < 0:
+                    continue
+                p = line[:idx]
+                v = line[idx + 2:]
+                paths.setdefault(p, []).append(v)
+                files.setdefault(os.path.basename(p), []).append(v)
+    except OSError as e:
+        sys.exit(f"{path}: {e}")
+    return total, dmesg, paths, files
+
+
+def _print_dmesg(dmesg):
+    print("\ndmesg output:")
+    if not dmesg:
+        print('<no results>')
+        return
+    for line in dmesg:
+        idx = line.find(': ')
+        sys.stdout.write(line[idx + 2:] if idx >= 0 else line)
+
+
+def _squash_by(ref, desc):
+    print(f"\nResults squashed by {desc} (excl dmesg). "
+          f"Displaying [<number of results> <{desc}>], <example result>")
+    if not ref:
+        print('<no results>')
+        return
+    for key in ref:
+        vals = ref[key]
+        print(f"[{len(vals)} {key}] {vals[0]}")
+
+
+def _load_kallsyms(path):
+    with open(path) as f:
+        for line in f:
+            parts = line.split()
+            if len(parts) < 3:
+                continue
+            addr_text = parts[0]
+            if addr_text.startswith('0'):
+                continue
+            try:
+                addr = int(addr_text, 16)
+            except ValueError:
+                continue
+            _KALLSYMS.append((addr.to_bytes(8, 'little'), parts[2]))
+
+
+def main(argv):
+    global _OPT_32BIT, _PAGE_OFFSET_32BIT, _KERNEL_CONFIG_FILE, _DEBUG
+    p = argparse.ArgumentParser(add_help=False)
+    p.add_argument('-d', '--debug', action='store_true')
+    p.add_argument('-h', '--help', action='store_true')
+    p.add_argument('-o', '--output-raw')
+    p.add_argument('-i', '--input-raw')
+    p.add_argument('--suppress-dmesg', action='store_true')
+    p.add_argument('--squash-by-path', action='store_true')
+    p.add_argument('--squash-by-filename', action='store_true')
+    p.add_argument('--raw', action='store_true')
+    p.add_argument('--kallsyms')
+    p.add_argument('--kernel-config-file')
+    p.add_argument('--32-bit', action='store_true')
+    p.add_argument('--page-offset-32-bit', type=lambda v: int(v, 0),
+                   default=0)
+    args = p.parse_args(argv)
+
+    if args.help:
+        print(f"Usage: {sys.argv[0]} [OPTIONS]")
+        print()
+        print("Options:")
+        print("  -o, --output-raw=<file>     Save results for future processing.")
+        print("  -i, --input-raw=<file>      Read results from file instead of scanning.")
+        print("        --raw                 Show raw results (default).")
+        print("        --suppress-dmesg      Do not show dmesg results.")
+        print("        --squash-by-path      Show one result per unique path.")
+        print("        --squash-by-filename  Show one result per unique filename.")
+        print("        --kernel-config-file=<file>  Kernel configuration file (e.g /boot/config).")
+        print("        --kallsyms=<file>     Read kernel symbol addresses from file.")
+        print("        --32-bit              Scan 32-bit kernel.")
+        print("        --page-offset-32-bit=o  Page offset (for 32-bit kernel).")
+        print("  -d, --debug                 Display debugging output.")
+        print("  -h, --help                  Display this help and exit.")
+        print()
+        print("Scans the running kernel for potential leaking addresses.")
+        return 0
+    _DEBUG = args.debug
+    _OPT_32BIT = args.__dict__['32_bit']
+    _PAGE_OFFSET_32BIT = args.page_offset_32_bit
+    if args.kernel_config_file:
+        _KERNEL_CONFIG_FILE = args.kernel_config_file
+
+    if args.input_raw:
+        format_output(args.input_raw, args.raw, args.squash_by_path,
+                      args.squash_by_filename, args.suppress_dmesg)
+        return 0
+
+    if not (is_x86_64() or is_ppc64() or is_ix86_32()
+            or _OPT_32BIT or _PAGE_OFFSET_32BIT):
+        print("\nScript does not support your architecture, sorry.\n")
+        print("Currently we support: x86_64, ppc64, x86\n")
+        return 129
+
+    out_fd = None
+    if args.output_raw:
+        try:
+            out_fd = open(args.output_raw, 'w')
+        except OSError as e:
+            sys.exit(f"{args.output_raw}: {e}")
+        # Redirect print() calls
+        sys.stdout = out_fd
+
+    if args.kallsyms:
+        _load_kallsyms(args.kallsyms)
+
+    parse_dmesg()
+    walk(DIRS)
+
+    if out_fd:
+        out_fd.close()
+        sys.stdout = sys.__stdout__
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

