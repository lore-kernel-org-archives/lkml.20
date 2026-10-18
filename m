Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389245D5C9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321624; cv=none; b=NKSkVV+oOTVKG7D35sxR0aQMKM2IJuu4LLl+wKdEAZqVEBJdy8dKeTGBV42pwxJkjBw8c+82unSyHbOBDKfv0dC7YQY6TdFS3AUf482U4zDeWrMFDNb/2ho1XDUqXqpi1YVpp0hFiW3NXXZgbyietHssZn95Rr5R7+AZXCVD+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321624; c=relaxed/simple;
	bh=LX8fE35Cj/2gFE+zo2D2gxXWTGAUs0rkaeR3fGhkG2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZNfJZI/JKgRv2lRhJrat23HZhGrVwrfEZLMeIwgV45cYsOpiZMKwM1cw1W1j6Ij/a2aWC2zLkau7AaVElIhtiXng54zd/+EJTa7OfyY0R2I5/4u2kJDKKKGSuxuOD7R1Gw24Nc3aKIr9w5Ciu8UoghTvCMFqB4ZkboY7DzOciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hgc00hPy; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hgc00hPy"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35829219da8so2548722eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321622; x=1792926422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7NF2esYNfvyHNQymgmkZ5HR7jue4RTMDCzKYb80QMk=;
        b=Hgc00hPyCupU+bCZYLpYjmrra/FwMpJB+i0YhdatLw02uKs9VBlXNbIi0i6Yo0DMBT
         rXs2XqT90XPiSR/smsa7zAeJhLxVI/fjRHMuv0SaZvWDvuOOOHEIas5jt419IfLv16MV
         mYW7B/SxPqUrHiTewDjqOpgzyF4rFV4FXWhL2UK6L+DtVtsfGwFyUtFQMeNrzJAA+OzK
         gsKG+ILTlb39PXXol+p68CeFf4/HZtJQkp9nwTSgmZ0LKEQVROvmWnJl0IIv3XSCLkAs
         030rHjFgrOx3JDuzYNUYxEJmnS/Z2nk0csab4KrhhXdNzimjRqdF0Be020aqI5R6WDoE
         fhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321622; x=1792926422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7NF2esYNfvyHNQymgmkZ5HR7jue4RTMDCzKYb80QMk=;
        b=HDH2xT4bQlkDKnxVBsNntd5wtTN68ljggrZtbc1YukklXpWjQL8DgM9vzvxAhX6jYW
         yb15v1iUpprjogG3I95qT98TqnG5RzDor9OvRQnXdGWO8F70AC/e4/KT5dxw4Drun9Ai
         NmWDEyr4JB5y7iJrdxAUi2nhMIOo+FuB7ZGqEgu83nIsLef5RvEf28EBuLJnBGfzkGuC
         yUT9t4F/+4Flh/yIp6NG3yQVT54Nj4oCaonKGvbBn9hKJCkHYZ/Up8nLZuPtmUU4KgW1
         ces542w02JgXbzkyMYFBtgtl3TpVYIWeC8Y9omk64NZRRTHAPjRW15MsHvcxQzcOnjfX
         15XA==
X-Gm-Message-State: AFq9FYJFwjhGI9tRfF0J1rCkYgJGpJGshoq/k+mqfMTvN+GiLJoPzPM0
	SmEbCIe14njrj1A0EYJEcVMzd6vdtKlWfvoPxV+yUA3yLeBVQnScyUOuSns45+GQ
X-Gm-Gg: AYBFou01z8vtjeMcDe+ikFz+JV1TQ5ZCMxbWiSEL38OvEQ6ytm4mnylYyv3aPxYKKc+
	eT/4qI8mWoYYGzv5QI5Xtd4ZkJYf3eR4KHP8UuIkTfAEregB7fd+MElqy2znOfNodKSDaQXqRMq
	EsFgMSrXwy7HHJ+GquK4CcdGHwML+H2MhtuhDhw8akVFwgcan90vHX479ZmtXTmHuQREwFpqaZ7
	OUW0Q4M+dBnSf6VwsOX7ozRjLtFPn3WPaj2vlUtN0YW83a6IHtiIcSkODzusIl3ikmR/5ymWZnf
	o/9a9p/5to1WcTFY/qih39wPdrslVANvwMcIHDW7RXTZR/yVw+LcHaYWcDbxjJVcBKv/zXh1u1Y
	akrEHEwwx2Vqr6Yq8+jzVCF6VP0Lc1Vaft4noFXa5Yzwu0DzKTxihZtMAPCNdv6p5P30ChdC6+s
	y+ON2WUdVw6p4ZUcvbv55BCZl0kSu6vEnfA7MmKj9aZY0IRZ4TTf3S73aR3vWVeMGP70GziK3to
	NhFsCXsdNyGs7pWd0+EiUeHICmz32sVcB1lhmlit0STywI1u4MX
X-Received: by 2002:a05:701b:4555:10b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-182d0a8d4ebmr8713285c88.0.1792321621702;
        Sun, 18 Oct 2026 04:07:01 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm28647706eec.3.2026.10.18.04.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:07:01 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 7/7] scripts: convert recordmcount.pl to Python
Date: Sun, 18 Oct 2026 08:06:38 -0300
Message-ID: <20261018110638.9947-8-breno3011alves@gmail.com>
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

Faithful re-implementation of recordmcount.pl in Python 3
(stdlib only). Same per-architecture regexes, same 9-step
pipeline (nm -> objdump -> assemble -> objcopy/ld).

Tested byte-for-byte for x86_64 and arm64; other architectures
use the same parsing rules as the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/recordmcount.py | 335 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 335 insertions(+)
 create mode 100755 scripts/recordmcount.py

diff --git a/scripts/recordmcount.py b/scripts/recordmcount.py
new file mode 100755
index 000000000..b4e1728a3
--- /dev/null
+++ b/scripts/recordmcount.py
@@ -0,0 +1,335 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+# (c) 2008, Steven Rostedt <srostedt@redhat.com>
+#
+# recordmcount.py - makes a section __mcount_loc holding all offsets
+# to calls to mcount. See recordmcount.pl header for detailed design.
+#
+# usage: recordmcount.py arch endian bits objdump objcopy cc ld nm rm mv \
+#                       is_module inputfile
+
+import os
+import re
+import subprocess
+import sys
+
+TEXT_SECTIONS = {
+    '.text', '.init.text', '.ref.text', '.sched.text',
+    '.spinlock.text', '.irqentry.text', '.softirqentry.text',
+    '.kprobes.text', '.cpuidle.text', '.text.unlikely',
+}
+TEXT_SECTION_PREFIXES = ('.text.',)
+
+MCOUNT_SECTION = '__mcount_loc'
+
+
+class Config:
+    """Per-architecture parsing configuration."""
+
+    def __init__(self):
+        self.local_re   = re.compile(r'^[0-9a-fA-F]+\s+t\s+(\S+)')
+        self.weak_re    = re.compile(r'^[0-9a-fA-F]+\s+([wW])\s+(\S+)')
+        self.section_re = re.compile(r'Disassembly of section\s+(\S+):')
+        self.func_re    = re.compile(r'^([0-9a-fA-F]+)\s+<([^^]*?)>:')
+        self.mcount_re  = re.compile(
+            r'^\s*([0-9a-fA-F]+):.*\s(mcount|__fentry__)$')
+        self.section_type   = '@progbits'
+        self.mcount_adjust  = 0
+        self.alignment      = None
+        self.type           = '.long'
+        self.ld_flags       = ''
+        self.objdump_flags  = ''
+        self.objcopy_flags  = ''
+        self.cc_flags       = ''
+
+
+def config_for(arch, endian, bits, cc):
+    cfg = Config()
+    if arch in ('x86_64', 'i386', 'x86'):
+        arch = 'x86_64' if bits == 64 else 'i386'
+    if arch == 'x86_64':
+        cfg.mcount_re = re.compile(
+            r'^\s*([0-9a-fA-F]+):.*\s(mcount|__fentry__)'
+            r'([+-]0x[0-9a-zA-Z]+)?$')
+        cfg.type = '.quad'
+        cfg.alignment = 8
+        cfg.mcount_adjust = -1
+        cfg.ld_flags      = '-m elf_x86_64'
+        cfg.objdump_flags = '-M x86-64'
+        cfg.objcopy_flags = '-O elf64-x86-64'
+        cfg.cc_flags      = '-m64'
+    elif arch == 'i386':
+        cfg.alignment = 4
+        cfg.mcount_adjust = -1
+        cfg.ld_flags      = '-m elf_i386'
+        cfg.objdump_flags = '-M i386'
+        cfg.objcopy_flags = '-O elf32-i386'
+        cfg.cc_flags      = '-m32'
+    elif arch == 's390' and bits == 64:
+        if '-DCC_USING_HOTPATCH' in cc:
+            cfg.mcount_re = re.compile(
+                r'^\s*([0-9a-fA-F]+):\s*c0 04 00 00 00 00\s*'
+                r'(brcl\s*0,|jgnop\s*)[0-9a-f]+ <([^\+]*)>$')
+            cfg.mcount_adjust = 0
+        cfg.alignment = 8
+        cfg.type = '.quad'
+        cfg.ld_flags = '-m elf64_s390'
+        cfg.cc_flags = '-m64'
+    elif arch == 'sh':
+        cfg.alignment = 2
+        cfg.ld_flags = '-m shlelf_linux'
+        cfg.objcopy_flags = '-O elf32-shbig-linux' if endian == 'big' \
+            else '-O elf32-sh-linux'
+    elif arch == 'powerpc':
+        cfg.local_re = re.compile(r'^[0-9a-fA-F]+\s+t\s+(\.?\S+)')
+        cfg.func_re  = re.compile(r'^([0-9a-fA-F]+)\s+<(\.?\w*?)>:')
+        cfg.mcount_re = re.compile(
+            r'^\s*([0-9a-fA-F]+):.*\s\.?_mcount$')
+        emu = 'ppc'
+        if endian == 'big':
+            cfg.cc_flags      = '-mbig-endian'
+            cfg.ld_flags      = '-EB'
+        else:
+            cfg.cc_flags      = '-mlittle-endian'
+            cfg.ld_flags      = '-EL'
+            emu = 'lppc'
+        if bits == 64:
+            cfg.type = '.quad'
+            cfg.cc_flags += ' -m64'
+            cfg.ld_flags += f' -m elf64{emu}'
+        else:
+            cfg.cc_flags += ' -m32'
+            cfg.ld_flags += f' -m elf32{emu}'
+    elif arch == 'arm':
+        cfg.alignment = 2
+        cfg.section_type = '%progbits'
+        cfg.mcount_re = re.compile(
+            r'^\s*([0-9a-fA-F]+):\s*R_ARM_(CALL|PC24|THM_CALL)'
+            r'\s+(__gnu_mcount_nc|mcount)$')
+    elif arch == 'arm64':
+        cfg.alignment = 3
+        cfg.section_type = '%progbits'
+        cfg.mcount_re = re.compile(
+            r'^\s*([0-9a-fA-F]+):\s*R_AARCH64_CALL26\s+_mcount$')
+        cfg.type = '.quad'
+    elif arch == 'sparc64':
+        cfg.func_re = re.compile(r'^([0-9a-fA-F]+)\s+<(\w*?)>:')
+        cfg.mcount_re = re.compile(r'^\s*([0-9a-fA-F]+):.*\s_mcount$')
+        cfg.alignment = 8
+        cfg.type = '.xword'
+        cfg.ld_flags      = '-m elf64_sparc'
+        cfg.cc_flags      = '-m64'
+        cfg.objcopy_flags = '-O elf64-sparc'
+    elif arch == 'mips':
+        if_bits = bits
+        cfg.mcount_re = re.compile(
+            r'^\s*([0-9a-fA-F]+): R_MIPS_26\s+_mcount$')
+        cfg.objdump_flags = f'-Melf-trad{endian}mips'
+        if endian == 'big':
+            cfg.ld_flags = f'-melf{bits}btsmip -EB'
+        else:
+            cfg.ld_flags = f'-melf{bits}ltsmip -EL'
+        cfg.cc_flags = f'-mno-abicalls -fno-pic -mabi={bits}'
+        if bits == 64:
+            cfg.func_re = re.compile(
+                r'^([0-9a-fA-F]+)\s+<(.|[^\$]L.*?|\$[^L].*?'
+                r'|[^\$][^L].*?)>:')
+            cfg.type = '.dword'
+    elif arch == 'microblaze':
+        cfg.mcount_re = re.compile(r'^\s*([0-9a-fA-F]+):.*\s_mcount$')
+    elif arch == 'riscv':
+        cfg.func_re = re.compile(
+            r'^([0-9a-fA-F]+)\s+<([^.0-9][0-9a-zA-Z_\.]+)>:')
+        cfg.mcount_re = re.compile(
+            r'^\s*([0-9a-fA-F]+):\sR_RISCV_CALL(_PLT)?\s_mcount$')
+        cfg.type = '.quad'
+        cfg.alignment = 2
+    elif arch == 'csky':
+        cfg.mcount_re = re.compile(
+            r'^\s*([0-9a-fA-F]+):\s*R_CKCORE_PCREL_JSR_IMM26BY2\s+'
+            r'_mcount$')
+        cfg.alignment = 2
+    else:
+        sys.exit(f"Arch {arch} is not supported with "
+                 f"CONFIG_DYNAMIC_FTRACE")
+    return cfg, arch
+
+
+def run(cmd):
+    try:
+        return subprocess.check_output(cmd, text=True,
+                                        stderr=subprocess.DEVNULL)
+    except (subprocess.CalledProcessError, FileNotFoundError):
+        return ''
+
+
+def main(argv):
+    if len(argv) != 12:
+        print("usage: recordmcount.py arch endian bits objdump objcopy cc "
+              "ld nm rm mv is_module inputfile", file=sys.stderr)
+        sys.exit(1)
+
+    (arch, endian, bits_s, objdump, objcopy, cc,
+     ld, nm, rm, mv, is_module, inputfile) = argv
+    bits = int(bits_s)
+
+    if re.search(r'kernel/trace/ftrace\.o$', inputfile):
+        sys.exit(0)
+
+    if not objdump:  objdump = 'objdump'
+    if not objcopy:  objcopy = 'objcopy'
+    if not cc:       cc = 'gcc'
+    if not ld:       ld = 'ld'
+    if not nm:       nm = 'nm'
+    if not rm:       rm = 'rm'
+    if not mv:       mv = 'mv'
+
+    cfg, arch = config_for(arch, endian, bits, cc)
+
+    dirname, filename = os.path.split(inputfile)
+    dirname = dirname or '.'
+    base, ext = os.path.splitext(filename)
+    mcount_s = os.path.join(dirname, f'.tmp_mc_{base}.s')
+    mcount_o = os.path.join(dirname, f'.tmp_mc_{base}.o')
+
+    # Step 1: collect locals and weaks
+    locals_set = set()
+    weak = {}
+    nm_out = run([nm, inputfile])
+    for line in nm_out.splitlines():
+        m = cfg.local_re.match(line)
+        if m:
+            locals_set.add(m.group(1))
+            continue
+        m = cfg.weak_re.match(line)
+        if m:
+            weak[m.group(2)] = m.group(1)
+
+    offsets = []
+    ref_func = None
+    offset = 0
+    state = {'opened': False, 'fh': None}
+
+    def open_out():
+        if state['opened']:
+            return
+        state['fh'] = open(mcount_s, 'w')
+        state['fh'].write(f'\t.section {MCOUNT_SECTION},"a",'
+                          f'{cfg.section_type}\n')
+        if cfg.alignment is not None:
+            state['fh'].write(f'\t.align {cfg.alignment}\n')
+        state['opened'] = True
+
+    def update_funcs():
+        if not ref_func or not offsets:
+            return
+        if ref_func in weak:
+            sys.exit(f"{inputfile}: ERROR: referencing weak function "
+                     f"{ref_func} for mcount")
+        if ref_func in locals_set:
+            convert_set.add(ref_func)
+        open_out()
+        for cur in offsets:
+            state['fh'].write(f"\t{cfg.type} {ref_func} + "
+                              f"{cur - offset}\n")
+
+    convert_set = set()
+
+    # Step 2: parse objdump output
+    objdump_cmd = ['env', 'LC_ALL=C', objdump, '-hdr', inputfile]
+    if cfg.objdump_flags:
+        objdump_cmd[3:3] = cfg.objdump_flags.split()
+    try:
+        proc = subprocess.Popen(objdump_cmd, stdout=subprocess.PIPE,
+                                stderr=subprocess.DEVNULL, text=True)
+    except FileNotFoundError:
+        sys.exit(f"error running {objdump}")
+
+    read_headers = True
+    read_function = False
+    text_found = False
+    text = ''
+
+    for raw in proc.stdout:
+        line = raw.rstrip('\n')
+
+        if read_headers and MCOUNT_SECTION in line:
+            print(f"ERROR: {MCOUNT_SECTION} already in {inputfile}\n"
+                  f"\tDelete {inputfile} and try again.",
+                  file=sys.stderr)
+            sys.exit(-1)
+
+        m = cfg.section_re.search(line)
+        if m:
+            read_headers = False
+            sec = m.group(1)
+            read_function = sec in TEXT_SECTIONS or any(
+                sec.startswith(p) for p in TEXT_SECTION_PREFIXES)
+            update_funcs()
+            text_found = False
+            ref_func = None
+            offsets.clear()
+            continue
+
+        if read_function:
+            m = cfg.func_re.match(line)
+            if m:
+                text_found = True
+                text = m.group(2)
+                if text not in locals_set and text not in weak:
+                    ref_func = text
+                    read_function = False
+                    offset = int(m.group(1), 16)
+                elif ref_func is None and text not in weak \
+                        and not text.startswith('.L'):
+                    ref_func = text
+                    offset = int(m.group(1), 16)
+
+        if text_found:
+            m = cfg.mcount_re.search(line)
+            if m:
+                offsets.append(int(m.group(1), 16) + cfg.mcount_adjust)
+
+    proc.wait()
+    update_funcs()
+
+    if not state['opened']:
+        sys.exit(0)
+    state['fh'].close()
+
+    # Step 3: assemble
+    subprocess.call([cc] + cfg.cc_flags.split() +
+                    ['-o', mcount_o, '-c', mcount_s])
+
+    if convert_set:
+        glob = ' '.join(f'--globalize-symbol {s}' for s in convert_set)
+        loc = ' '.join(f'--localize-symbol {s}' for s in convert_set)
+        globalobj = os.path.join(dirname, f'.tmp_gl_{filename}')
+        globalmix = os.path.join(dirname, f'.tmp_mx_{filename}')
+        subprocess.call([objcopy] + cfg.objcopy_flags.split() +
+                        glob.split() + [inputfile, globalobj])
+        subprocess.call([ld] + cfg.ld_flags.split() +
+                        ['-r', globalobj, mcount_o, '-o', globalmix])
+        subprocess.call([objcopy] + cfg.objcopy_flags.split() +
+                        loc.split() + [globalmix, inputfile])
+        for p in (globalobj, globalmix):
+            try:
+                os.unlink(p)
+            except OSError:
+                pass
+    else:
+        mix = os.path.join(dirname, f'.tmp_mx_{filename}')
+        subprocess.call([ld] + cfg.ld_flags.split() +
+                        ['-r', inputfile, mcount_o, '-o', mix])
+        os.replace(mix, inputfile)
+
+    for p in (mcount_o, mcount_s):
+        try:
+            os.unlink(p)
+        except OSError:
+            pass
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

