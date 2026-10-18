Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53849379EE6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318373; cv=none; b=OpY4XZHd+xYbGq4xs4WxRHO2kse4H1Eqpw2chx3v3ndpnwqMhXzt5OdUA6PVnXDFnE8hIPB+xpaEeuBFhXOZ7MhDm+2HKcLb44eULpMvpLoBK4jpN5FWZssStYndx22tsAHVkIDYWVGWEWQEsjoesClCw6i/rji8GLm40JKwt58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318373; c=relaxed/simple;
	bh=1bUPm6sBD4CMJV0SNqZKEbmWT50oy5B92xC1a6wptpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVpf2Ef0V0SPEfb6t4EJtCijkHNMc5TlS1YgeYXuQ08YB/76w3J9QeuhMBDIkriSSrU/OJacXCyh6vGlgaNO+GObR2dA6hJJI2Dq6yel1zXYa5bUaTGo8sCGGPGjPcAiFIqGq/b8sMEOMY2LzXwy0pNhGFIxcuWU70FEal7k8hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2vgwTvk; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2vgwTvk"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2994237eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792318365; x=1792923165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCrNeyWyEfYUUs9lTznwqC5KYXgKNGFTXjJryVOw01Y=;
        b=C2vgwTvk5Hx/+zEAPWAB57IJ+/Y66KeniJxImqW5okn7brgxBcNNEoeYgz/6KXTOEh
         D4Zof/o4EpMLtRVDxwWheIu3yMS2VV8DuD9+iEXvZwgNKpPP3l0IwJIUnRylVyxySHue
         uzLc+9BhW9hLt3VarRIhs+6xWUeDHYdlnTSsTJ27/F1IGZdKnVu6KokvRReY0GvweD97
         JE5TA6fqFp8Y1FRzizKYgeUL3bjfckFON6+FzRdTuscbLRC7SG5qMHKOYMwj5X7gS1ET
         ozLdGCpmK2O74aQPHKZgwiJuPGqFWHVZH8O90QdteTFIJwQBA0CuvAFeI5Jv1YJAbAa+
         785g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318365; x=1792923165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SCrNeyWyEfYUUs9lTznwqC5KYXgKNGFTXjJryVOw01Y=;
        b=aahyVPAHdiNlusFed2gId/OQJEqg26fJ25iLzNKHH2NnXUITDQA8LaaikeeHbHF8M+
         As1BtEertGC2P6t/mkzgw0Hp27BRy33fHD5azF45E2KyUG6kvlVRypI9L42Pz+z2T5aR
         LL6/1MagUNAhd1DZHTuoVU3IRw8if7eRBJIOMlLoXH7beNgW2du9TIC0ySmInL+v7SJb
         SbVPNxXrtBBIDM9EVY01gHPgmO9mOebUo2NETOFHRLeRUulfdThqZDiSaE0m4Ku7OhCl
         rT6BnnGtMdXCbArrYx5AWlE+IuvZ/CuB+u8GZSIk0N89x+l53itU3ePY+eXQEi9+zeGN
         BfVQ==
X-Gm-Message-State: AFq9FYIm8PzkBMHlFHG8mk9gG0Ywg46Ipm4jT4tBXkHE5tzaQgHX0djP
	1p42FOsOt1dA6W5QXxYEnhWVp3or91C7N0dc2cFaenLMtLOuzPR4iySvQPxs3NLe
X-Gm-Gg: AYBFou0Rh2D8oczJVZrfBI9NIIZ4J7Z3KgpzqlitUn2wM+4O6SXUiRp3z8TjGsPXkky
	xBCWEeS5r40XaTsVqBwEoAEhXrYDxFz3iJO2ebJmZw2S0zJlH+pNrldLWOOB4YEDjRZRnB+NHJh
	ghoZpIdEJqP1beh1dvF+IyNgAkVHjLGGYfRNsX0GLJqdelZ7WMBeizh3Ogaby/D0HlGt+4hFcnV
	3HD6sRX9ZqC/V7XN9ifkrp1T9KeNApT8hjz+33n3JvClNrqudgE2fWdD6/HWTs9sRzkL/9lGtsR
	uh8ZFycHGDxy5faWELhcUgwXmGaRA/BlWsMW3d6qmxYhXB2f16n8PLUpQceCfqhano+LcF8ove7
	CEYYLB+BqNXJT/EQEymJyhnh/yXhv8fvsqw0+jiTQWlXQnoiVy/MwbnoiseAav3Bpu8RPXoRjCk
	9o4DQr0N5Zk92HOY9fDrQEbcLMjqwXujogBcJg8BgjCb+LLZAz4ocQ7k9+CBWP9202oheMGOAoc
	W4P9oSQYytNwcGKWFgK/kRtfCj5w11vElL4a3d7C+9T5sTeRWLd
X-Received: by 2002:a05:7023:901:b0:17c:393d:a0c8 with SMTP id a92af1059eb24-1850c40d87bmr8098426c88.5.1792318365209;
        Sun, 18 Oct 2026 03:12:45 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm17967876c88.14.2026.10.18.03.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:12:44 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 3/4] scripts: convert markup_oops.pl to Python
Date: Sun, 18 Oct 2026 07:12:26 -0300
Message-ID: <20261018101227.7680-4-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018101227.7680-1-breno3011alves@gmail.com>
References: <20261018101227.7680-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of markup_oops.pl in Python 3
(stdlib only). Same CLI (-c, -m, -h), same oops parsing,
same objdump invocation, same register tracking logic.

Uses subprocess with argument lists instead of shell
backticks for objdump/modinfo calls; no behavior change.

Tested with -h; full oops annotation requires a live oops
and matching vmlinux.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/markup_oops.py | 324 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 324 insertions(+)
 create mode 100755 scripts/markup_oops.py

diff --git a/scripts/markup_oops.py b/scripts/markup_oops.py
new file mode 100755
index 000000000..e9bafcb42
--- /dev/null
+++ b/scripts/markup_oops.py
@@ -0,0 +1,324 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright 2008, Intel Corporation
+# Authors: Arjan van de Ven <arjan@linux.intel.com>
+#
+# Turn an oops output into an annotated disassembly of the faulting
+# instruction and surrounding code, tracking register values backwards
+# from the faulting point.
+#
+# usage:
+#     dmesg | python3 scripts/markup_oops.py [OPTION] [VMLINUX]
+
+import argparse
+import re
+import subprocess
+import sys
+
+REGS = {}
+
+RE_32_REGS_A = re.compile(r'EAX: ([0-9a-f]+) EBX: ([0-9a-f]+) '
+                          r'ECX: ([0-9a-f]+) EDX: ([0-9a-f]+)')
+RE_32_REGS_B = re.compile(r'ESI: ([0-9a-f]+) EDI: ([0-9a-f]+) '
+                          r'EBP: ([0-9a-f]+) ESP: ([0-9a-f]+)')
+RE_64_REGS_A = re.compile(r'RAX: ([0-9a-f]+) RBX: ([0-9a-f]+) '
+                          r'RCX: ([0-9a-f]+)')
+RE_64_REGS_B = re.compile(r'RDX: ([0-9a-f]+) RSI: ([0-9a-f]+) '
+                          r'RDI: ([0-9a-f]+)')
+RE_64_REGS_C = re.compile(r'RBP: ([0-9a-f]+) R08: ([0-9a-f]+) '
+                          r'R09: ([0-9a-f]+)')
+RE_64_REGS_D = re.compile(r'R10: ([0-9a-f]+) R11: ([0-9a-f]+) '
+                          r'R12: ([0-9a-f]+)')
+RE_64_REGS_E = re.compile(r'R13: ([0-9a-f]+) R14: ([0-9a-f]+) '
+                          r'R15: ([0-9a-f]+)')
+
+RE_EIP_32 = re.compile(r'EIP: 0060:\[\<([a-z0-9]+)\>\]')
+RE_RIP_64 = re.compile(r'RIP: 0010:\[\<([a-z0-9]+)\>\]')
+RE_FUNC_32 = re.compile(r'EIP is at ([a-zA-Z0-9_]+)\+0x([0-9a-f]+)/0x[a-f0-9]')
+RE_FUNC_64 = re.compile(
+    r'RIP: 0010:\[\<[0-9a-f]+\>\]  \[\<[0-9a-f]+\>\] '
+    r'([a-zA-Z0-9_]+)\+0x([0-9a-f]+)/0x[a-f0-9]')
+RE_MOD_32 = re.compile(
+    r'EIP is at ([a-zA-Z0-9_]+)\+(0x[0-9a-f]+)/0x[a-f0-9]+\W\[([a-zA-Z0-9_-]+)\]')
+RE_MOD_64 = re.compile(
+    r'RIP: 0010:\[\<[0-9a-f]+\>\]  \[\<[0-9a-f]+\>\] '
+    r'([a-zA-Z0-9_]+)\+(0x[0-9a-f]+)/0x[a-f0-9]+\W\[([a-zA-Z0-9_-]+)\]')
+
+
+def parse_x86_regs(line):
+    """Extract register values from one oops line into REGS."""
+    m = RE_32_REGS_A.search(line)
+    if m:
+        REGS['%eax'] = m.group(1)
+        REGS['%ebx'] = m.group(2)
+        REGS['%ecx'] = m.group(3)
+        REGS['%edx'] = m.group(4)
+    m = RE_32_REGS_B.search(line)
+    if m:
+        REGS['%esi'] = m.group(1)
+        REGS['%edi'] = m.group(2)
+        REGS['%esp'] = m.group(4)
+    m = RE_64_REGS_A.search(line)
+    if m:
+        REGS['%eax'] = m.group(1)
+        REGS['%ebx'] = m.group(2)
+        REGS['%ecx'] = m.group(3)
+    m = RE_64_REGS_B.search(line)
+    if m:
+        REGS['%edx'] = m.group(1)
+        REGS['%esi'] = m.group(2)
+        REGS['%edi'] = m.group(3)
+    m = RE_64_REGS_C.search(line)
+    if m:
+        REGS['%r08'] = m.group(2)
+        REGS['%r09'] = m.group(3)
+    m = RE_64_REGS_D.search(line)
+    if m:
+        REGS['%r10'] = m.group(1)
+        REGS['%r11'] = m.group(2)
+        REGS['%r12'] = m.group(3)
+    m = RE_64_REGS_E.search(line)
+    if m:
+        REGS['%r13'] = m.group(1)
+        REGS['%r14'] = m.group(2)
+        REGS['%r15'] = m.group(3)
+
+
+def reg_name(reg):
+    """Normalize a 64-bit register name to its 32-bit form."""
+    reg = re.sub(r'r(.)x', r'e\1x', reg)
+    reg = re.sub(r'r(.)i', r'e\1i', reg)
+    reg = re.sub(r'r(.)p', r'e\1p', reg)
+    return reg
+
+
+def process_x86_regs(line, cntr):
+    """Annotate a disassembly line with live register values."""
+    if len(line) < 40:
+        return ''
+    m = re.search(r'([0-9a-zA-Z,%()\-\+]+)$', line)
+    if not m:
+        return ''
+
+    lastword = m.group(1)
+    clobber = lastword
+    clobber = re.sub(r'\([a-z0-9%,]+\)', '', clobber)
+    clobber = re.sub(r'.*,', '', clobber)
+    if cntr == 0:
+        clobber = ''
+
+    clobberprime = reg_name(clobber)
+    lastwordprime = reg_name(lastword)
+    result = ''
+
+    for reg in list(REGS.keys()):
+        val = REGS[reg]
+        if re.match(r'^0+$', val):
+            val = '0'
+        else:
+            val = re.sub(r'^0*', '', val)
+
+        if reg in clobber or reg in clobberprime:
+            if val:
+                result += f' {reg} => {val} '
+            REGS[reg] = ''
+            val = ''
+
+        if reg in lastword or reg in lastwordprime:
+            if val:
+                result += f' {reg} = {val} '
+
+    return result
+
+
+def in_range(address, target):
+    delta = int('0x' + address, 16) - int('0x' + target, 16)
+    return -4096 < delta < 4096
+
+
+def usage():
+    print('Usage:')
+    print('  dmesg | python3 markup_oops.py [OPTION] [VMLINUX]')
+    print()
+    print('OPTION:')
+    print('  -c, --cross-compile CROSS_COMPILE\t'
+          'Specify the prefix used for toolchain.')
+    print('  -m, --module MODULE_DIRNAME\t\t'
+          'Specify the module filename.')
+    print('  -h, --help\t\t\t\tHelp.')
+    sys.exit(0)
+
+
+def run_cmd(cmd):
+    """Run a command, return stdout text or None on error."""
+    try:
+        return subprocess.check_output(cmd, text=True)
+    except (subprocess.CalledProcessError, FileNotFoundError):
+        return None
+
+
+def main(argv):
+    parser = argparse.ArgumentParser(add_help=False)
+    parser.add_argument('-c', '--cross-compile', default='',
+                        metavar='CROSS_COMPILE')
+    parser.add_argument('-m', '--module', default='', metavar='MODULE_DIRNAME')
+    parser.add_argument('-h', '--help', action='store_true')
+    parser.add_argument('vmlinux', nargs='?', default=None)
+    args = parser.parse_args(argv)
+
+    if args.help:
+        usage()
+
+    cross = args.cross_compile
+    vmlinux = args.vmlinux
+    modulefile = args.module
+
+    if vmlinux is None:
+        kerver = subprocess.check_output(['uname', '-r'], text=True).rstrip()
+        vmlinux = f'/lib/modules/{kerver}/build/vmlinux'
+        print(f'No vmlinux specified, assuming {vmlinux}')
+
+    filename = vmlinux
+    target = '0'
+    function = ''
+    module = ''
+    func_offset = '0'
+    vmaoffset = 0
+
+    for line in sys.stdin:
+        m = RE_EIP_32.search(line) or RE_RIP_64.search(line)
+        if m:
+            target = m.group(1)
+        m = RE_FUNC_32.search(line) or RE_FUNC_64.search(line)
+        if m:
+            function = m.group(1)
+            func_offset = m.group(2)
+        m = RE_MOD_32.search(line) or RE_MOD_64.search(line)
+        if m:
+            module = m.group(3)
+        parse_x86_regs(line)
+
+    if target == '0':
+        print('No oops found!')
+        usage()
+
+    target_int = int('0x' + target, 16)
+    offset_int = int('0x' + func_offset, 16)
+    decodestart = target_int - offset_int
+    decodestop = target_int + 8192
+
+    # Module case: find .ko, compute VMA offset relative to text start.
+    if module:
+        if not modulefile:
+            out = run_cmd(['modinfo', '-F', 'filename', module])
+            modulefile = out.rstrip() if out else ''
+        filename = modulefile
+        if not filename:
+            print(f'Module .ko file for {module} not found. Aborting')
+            sys.exit(1)
+        out = run_cmd([cross + 'objdump', '-dS', filename])
+        if out is None:
+            print('Cannot start objdump', file=sys.stderr)
+            sys.exit(1)
+        pat = re.compile(rf'^([0-9a-f]+) \<{re.escape(function)}\>:')
+        for line in out.splitlines():
+            m = pat.match(line)
+            if m:
+                vmaoffset = (target_int
+                             - int('0x' + m.group(1), 16)
+                             - offset_int)
+
+    # Disassemble the region around the faulting instruction.
+    out = run_cmd([
+        cross + 'objdump', '-dS',
+        f'--adjust-vma={vmaoffset}',
+        f'--start-address={decodestart}',
+        f'--stop-address={decodestop}',
+        filename,
+    ])
+    if out is None:
+        print('Cannot start objdump', file=sys.stderr)
+        sys.exit(1)
+
+    counter = 0
+    state = 0
+    center = -1
+    lines = []
+
+    for line in out.splitlines():
+        if state == 0:
+            m = re.match(r'^([a-f0-9]+):', line)
+            if m and in_range(m.group(1), target):
+                state = 1
+        if state == 1:
+            m = re.match(r'^([a-f0-9]{6,}):', line)
+            if m:
+                val = m.group(1)
+                if not in_range(val, target):
+                    break
+                if val == target:
+                    center = counter
+            lines.append(line)
+            counter += 1
+
+    if counter == 0:
+        print('No matching code found')
+        sys.exit(1)
+    if center == -1:
+        print('No matching code found')
+        sys.exit(1)
+
+    # Find start: scan backwards up to 10 source lines or 20 asm lines.
+    start = center
+    codelines = binarylines = 0
+    while start > 1:
+        start -= 1
+        if re.match(r'^([a-f0-9]+):', lines[start]):
+            binarylines += 1
+        else:
+            codelines += 1
+        if codelines > 10 or binarylines > 20:
+            break
+
+    # Find finish: scan forwards.
+    finish = center
+    codelines = binarylines = 0
+    while finish < counter:
+        finish += 1
+        line = '' if finish >= counter else lines[finish]
+        if re.match(r'^([a-f0-9]+):', line):
+            binarylines += 1
+        else:
+            codelines += 1
+        if codelines > 10 or binarylines > 20:
+            break
+
+    # Annotate registers backwards from the faulting instruction.
+    reglines = [None] * len(lines)
+    i = center
+    while i >= start:
+        reglines[i] = process_x86_regs(lines[i], center - i)
+        i -= 1
+
+    # Print annotated disassembly.
+    i = start
+    while i < finish:
+        if i == center:
+            prefix = f'*{lines[i]} '
+        else:
+            prefix = f' {lines[i]} '
+        out_line = prefix
+        if reglines[i] and len(reglines[i]) > 0:
+            pad = 60 - len(prefix)
+            out_line += ' ' * max(0, pad) + f'| {reglines[i]}'
+        if i == center:
+            out_line += '<--- faulting instruction'
+        print(out_line)
+        i += 1
+
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

