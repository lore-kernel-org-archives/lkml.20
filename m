Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365236;
	b=XFI2oVwO/XEuW0880N8U33WkYpdNzHk71t26E38jCef6HKYL6Z0rIRYBVMLsIwZyF/WW
	 iuQappURFyM8VDbx/RsOgEyPlsaKs1/U5zkNeKdbEFZFGb36WqJ+6AYDJMy/ZRLAnMJJs
	 YE1vueKQMR87L0qoVtRpCJ7IS66Q4kLnkMWd3ItkNU6ek1JgBNDTLXzTGL61xsj1x3e8b
	 BtzFPtSDrEAPBo9/Z2zi3Jqwck4DyUJellbria0OCMHqJS5/wpWN8l5zeXjfG9YQt1TKw
	 Hx6GUTIDhijHZ/3z/LHQoXs4+cZEFGEH7/X3NOju/ht5ZpasjiEeWNxEu+tMMZkFMhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365236;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=RkbYxVSI5rTYmWPGM60TSax/zjdMIP247/fb4MerUmU=;
	b=07KW2scNciDsR8paiTVWPNp2luHjqx7B/UnSUez8/P03PduqwKhuBDp7146zAg2wzc+j
	 F7odEs6XEpyEIxoJ1DxJRiDMbpbLzsz/0Il0pfYQUxFuyTLUf2uLIKGfNvl0I5IMtL9QB
	 knXm6aknWafs0c5BK7VFUx2nitwpSZEOqtLN+wDj9aRJwPOlpEl1LacVG73hzoxTMNv/H
	 p9Q0UVKU/q8DVf+qaS2Md/8/JMXJZX3h+LOKuV/oJHPS/hI/Z4XfDARfNtoedHrp81KnI
	 9jQR4d93EML+X81QVzxQUN7njdqXZfGM3fmmoTawI8rBK5cGhSoXSavQYBBOgLrwgNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C582606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C582606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-54213290993so517158b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365235; x=1793970035;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RkbYxVSI5rTYmWPGM60TSax/zjdMIP247/fb4MerUmU=;
        b=S3N92M5RSuOkUtba81qxgs1/krg4wGywSu/XgkokdCTqm8dt+zLInJtId0SykQ56mC
         16JhFGknxYgFVJhh6i8K1RBWCZiypFE8CXxYAyuPiBugdo/HeCSNUVp1e4MggGtDNOSs
         wWKSVNdplSDvgHWcCGGhN5WP1TSp6GzE16T+ZuLG5ZhfOBUcuqdxyd8Y3f/cfn+0w0jY
         5bLjpLacSb7oKn2pfNfqLqIGwi4ZP+95Zh51NCYms6lN5X1l8mzbwiwDXeV3IPTI2pnO
         62ZaD29Zzw2/itrO1LIcwWk2aUKudBIan3/OxDudtzr3sETNfhS1zjftRJ0kgj3cSCPg
         XCkA==
X-Forwarded-Encrypted: i=1; AKwUvBxDoBZgrceGTaOt6gPoEfLVYyMFRPKB4dP2hokk0dOYr4MD+jc9M35v+dymrwd4FLPD8Vh5pej+BQSbPD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgYGPcxYZ/msjtPaEg9rKxuxiEWMZnxvMJzXVQPFIA5YHBFOWC
	Z6KGTezbA1Eq1+q23mH/nn7ZgNr+Xp07nbb9d/XmXib/t2+89a78AhmxfKM+voMh0RYVTWkFdAK
	FIStzp4WZnGko0KdhbFLokhft4DG/hgcSWQ8b0+GZsPsBFivR5oiKlQ/BIH0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2218:b0:53c:2a2e:8650 with SMTP id
 5614622812f47-5640df72f37mr1342932b6e.34.1793365233620; Fri, 30 Oct 2026
 06:00:33 -0700 (PDT)
Date: Fri, 30 Oct 2026 06:00:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae494f1.31fc0900.6b84.00fb.GAE@google.com>
Subject: [syzbot] [dm?] general protection fault in crypt_setkey
From: syzbot <syzbot+ff132cb52bce4f44ecc9@syzkaller.appspotmail.com>
To: agk@redhat.com, bmarzins@redhat.com, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, mpatocka@redhat.com, snitzer@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6b4b543fa187 Merge tag 'parisc-for-7.4-rc1' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15f0008d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0dd24ec63572ca
dashboard link: https://syzkaller.appspot.com/bug?extid=ff132cb52bce4f44ecc9
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138a6f0d580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1583c259580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-6b4b543f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8a7c3186fb53/vmlinux-6b4b543f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54ff5a2a5728/bzImage-6b4b543f.xz

AI-generated root cause summary:
In drivers/md/dm-crypt.c, specifying the optional "integrity_key_size" parameter
alongside an AEAD integrity profile sets cc->key_mac_size, causing
crypt_integrity_hmac() to evaluate to true. However, when the specified cipher
is not an authenc composite algorithm (e.g., rfc7539(chacha20,poly1305)),
crypt_ctr_auth_cipher() exits early without allocating cc->authenc_key. During
key initialization, crypt_setkey() calls crypt_copy_authenckey() with the NULL
cc->authenc_key pointer, leading to a kernel NULL-pointer dereference crash
(denial of service).

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=ff132cb52bce4f44ecc9

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ff132cb52bce4f44ecc9@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 5579 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:crypt_copy_authenckey drivers/md/dm-crypt.c:2396 [inline]
RIP: 0010:crypt_setkey+0x1d7/0x980 drivers/md/dm-crypt.c:2417
Code: 14 24 4c 8b b2 58 06 00 00 8b 5c 24 0c 29 eb 49 8d 7e 04 41 89 df 41 0f cf 48 89 f8 48 c1 e8 03 49 bc 00 00 00 00 00 fc ff df <42> 0f b6 04 20 84 c0 0f 85 00 07 00 00 45 89 7e 04 4c 89 f0 48 c1
RSP: 0018:ffffc90003aef670 EFLAGS: 00010247
RAX: 0000000000000000 RBX: 0000000000000010 RCX: ffff888030aa4b00
RDX: ffff888035b3f000 RSI: 0000000000000020 RDI: 0000000000000004
RBP: 0000000000000020 R08: ffff888035b3f12f R09: 1ffff11006b67e25
R10: dffffc0000000000 R11: ffffed1006b67e26 R12: dffffc0000000000
R13: ffff888035b3f120 R14: 0000000000000000 R15: 0000000010000000
FS:  0000555578d00500(0000) GS:ffff88808ac1d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f841a4e84ac CR3: 0000000038575000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 crypt_set_key+0x3a0/0x680 drivers/md/dm-crypt.c:2642
 crypt_ctr_cipher drivers/md/dm-crypt.c:3067 [inline]
 crypt_ctr+0x2437/0x3c20 drivers/md/dm-crypt.c:3254
 dm_table_add_target+0x58d/0xc70 drivers/md/dm-table.c:749
 populate_table drivers/md/dm-ioctl.c:1602 [inline]
 table_load+0x325/0x8a0 drivers/md/dm-ioctl.c:1645
 ctl_ioctl drivers/md/dm-ioctl.c:2221 [inline]
 dm_ctl_ioctl+0x9ec/0xe10 drivers/md/dm-ioctl.c:2243
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7fae39f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd11f4b518 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f7fae625fa0 RCX: 00007f7fae39f559
RDX: 0000200000000540 RSI: 00000000c138fd09 RDI: 0000000000000003
RBP: 00007f7fae436b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7fae625fac R14: 00007f7fae625fa0 R15: 00007f7fae625fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:crypt_copy_authenckey drivers/md/dm-crypt.c:2396 [inline]
RIP: 0010:crypt_setkey+0x1d7/0x980 drivers/md/dm-crypt.c:2417
Code: 14 24 4c 8b b2 58 06 00 00 8b 5c 24 0c 29 eb 49 8d 7e 04 41 89 df 41 0f cf 48 89 f8 48 c1 e8 03 49 bc 00 00 00 00 00 fc ff df <42> 0f b6 04 20 84 c0 0f 85 00 07 00 00 45 89 7e 04 4c 89 f0 48 c1
RSP: 0018:ffffc90003aef670 EFLAGS: 00010247
RAX: 0000000000000000 RBX: 0000000000000010 RCX: ffff888030aa4b00
RDX: ffff888035b3f000 RSI: 0000000000000020 RDI: 0000000000000004
RBP: 0000000000000020 R08: ffff888035b3f12f R09: 1ffff11006b67e25
R10: dffffc0000000000 R11: ffffed1006b67e26 R12: dffffc0000000000
R13: ffff888035b3f120 R14: 0000000000000000 R15: 0000000010000000
FS:  0000555578d00500(0000) GS:ffff88808ac1d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f841a650286 CR3: 0000000038575000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	14 24                	adc    $0x24,%al
   2:	4c 8b b2 58 06 00 00 	mov    0x658(%rdx),%r14
   9:	8b 5c 24 0c          	mov    0xc(%rsp),%ebx
   d:	29 eb                	sub    %ebp,%ebx
   f:	49 8d 7e 04          	lea    0x4(%r14),%rdi
  13:	41 89 df             	mov    %ebx,%r15d
  16:	41 0f cf             	bswap  %r15d
  19:	48 89 f8             	mov    %rdi,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	49 bc 00 00 00 00 00 	movabs $0xdffffc0000000000,%r12
  27:	fc ff df
* 2a:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 00 07 00 00    	jne    0x737
  37:	45 89 7e 04          	mov    %r15d,0x4(%r14)
  3b:	4c 89 f0             	mov    %r14,%rax
  3e:	48                   	rex.W
  3f:	c1                   	.byte 0xc1


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
