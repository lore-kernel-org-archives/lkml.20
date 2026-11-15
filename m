Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794703401;
	b=I3jeIQkqjBGG0wf1H/DaPtX9hmcTEM1C3S6x21V+eigD/hPKzQIOSBFhKOpDbtVwtg8w
	 t6wDLdgzz2clmDgswbT03H9iIw6CWIJ1daGzyt2joboS4pm1DPBQEQjPPhWJGB8PlyDMl
	 PKD0v16u6jmChQJiBai9zeVssBvFYsz/jsswu6G1rEKcpLsWy26o8Po25uS1EuZqn7QJZ
	 mT3NJyuY72yV7/a2zZFg5jPONbthCv9h2jlqCpqygvfSE2grWah8MrjiBBs2QvWJu66MK
	 h6WTBpvvtn0W39HUmK0nJFvqIIn8gTRlSXR6KAhSc+I91aGUnuurOzFsno0EASLXTAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8MMIuK6I3K5vQ1yQIxsPt4KprzePyt/7G+X2OrZOpnQ=;
	b=UH9A2SLifIo1utP0/xGGqv/5UyCr/OBzozbRnKU6ZZmK/tdoddm71UG3Gv1XTbaWsoNJ
	 SPCi7ZILb1YsVpkxZO0JRA/X75bKSwZGQIcaQykCeWtkqPDOQmEnBSAEaqm5oOSC05B0d
	 LVqrpGLetNf7JdlX6cNvSO2opMOwPdBoemRY3IYnsKAn9eS/ajhSwOfAdGyqQisvNJV/k
	 k4PRaPp5rd+2PRoItb7b42fLxshsDHUvmL97E1uTrMywWjl5u1ljBobhp6n6hBhkAzG3O
	 ZOawjvRyVTbCm5wriQU7qmABHyAuMAe2n5t21SNFqHHYBLNyq58GujAtZfaW23bMIOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBanHfsv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681F6606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681F6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBanHfsv
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3acff56a300so21632091fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794703399; cv=none;
        d=google.com; s=arc-20260327;
        b=iJ6jqE448KbxxlP06FexACODFdn/Rlr3NMsCX+0kNal30QCMDXSv+yIBi+hVKfTn92
         qWjxNL0zWIrmPHy1F8jrKO/JZZXeimUvc8a8MJ0IY0NGiVddojoTfz4P/aK+PmwBIUe8
         WJANR5FNjZdem0x7vnAaUeXGkTOylF8xGiCGwIJGRRMU8pXdg6rbd3aeqPBvfcdiVbfz
         pIkm128EYj4KkTznq8I6W4zIpkcR4wrnKBRmhMQcqqe/4d6+GinLvnG6PqmVEdbgf7xs
         az0vqmWRXYLqXO7tqcuM/FNBYug/JB3VXGlCrjsS/NocYRwyHrT38IewAZJjimxFx5Kk
         CbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=8MMIuK6I3K5vQ1yQIxsPt4KprzePyt/7G+X2OrZOpnQ=;
        fh=tA78plMFGEBtjtUzsbUxotDTYrPF5SlJC5WtayCOzdc=;
        b=sSQXVtmOwKr/B22ntnPof/8caX+0IpuuiF1/gFYHQE7h/xw5O3gvTzEWdko9up04nX
         ijyugNXX+LLY9NRazcP+g/j9Ppe3uAlgxHgbWoHs5DanbHLcL/qu3Wr5aU9++l4q0NXq
         rJ5kHBQ60gZQqtPGv4sRPU3GtsXYfR+hc1hATCiyNXzN2TfrXvj2Ou85vH7WZY7MJ+XB
         5XUY6phLkb7X7za3peMzpWpMuQ2ulcPN8FgEs83SKxIA2xyNJzbOmAkION+TpyLWvD9u
         OJr7Qpk0debPwRQ3EkPtxTH2/Az1z3KITjiu/w9vKRYrXshMINXA2fV/NXJbZQytVaFS
         lxpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794703399; x=1795308199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MMIuK6I3K5vQ1yQIxsPt4KprzePyt/7G+X2OrZOpnQ=;
        b=GBanHfsvXOqB75slLJE8LsLWchFvISNyGuo4w7xvL7rAq1Lfb/YkB+j77Xmizbu41Q
         NFremmdoli7wbpdX7104B5dQ9vCEaZwX1+oJmpB6en+RDNoaZx7tgHVK664nesAsBeT/
         FE8GIzicPL0PeDBaCruCxHJmoWk4hTkQ/0AnUkY9mB3VR3EzWXHVLgDX+NdTsNcgpIJp
         xNTXUzk6t4/rvSN+jtY19v4CUMy/x+wGLSv/o+DWGR19PYu6P5pm9s789Fu/s43dDoKU
         Vt8ARK/d7emk5S8hRilnLidFiXt9mx/f17g+2XrqS0bWoBWKSnN3LjqXAE2HKo+cgC59
         BIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794703399; x=1795308199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8MMIuK6I3K5vQ1yQIxsPt4KprzePyt/7G+X2OrZOpnQ=;
        b=MSBpG8pcEAaUIbv/UTTzQKPK/X4QLjvKj+FVSBqXGQ4ML/AEq6sYGhHMBtoIRVpxc9
         T4JKBxNi+uLE+ZsYpq6MyVb7tQkIABCdPa0YMo3KHgY8Uc5Zqolk5R5sbbTTIxH5FQIN
         RkXF/ZJ6Zo/EYjbI7vDjBR1BvNtilh29CVo4C/vL64KvsgdsUTH2NxSASLdZzpXaKhsE
         V8I+g6pNcccDf+SRt33xyGK9/WlWBAg9YvhTnyedkUNXAwjn1Z3w4lGWpUKCBmEFyV7l
         LdUPPgp4+G6L7cp9pGPo3H+ozkH3eFYXzl6OuxJdAD8SjalCk+LPFNLrZEcSEvDiOoly
         UfAQ==
X-Forwarded-Encrypted: i=1; AL+hErFb++YpyKjXSDQGZjB9uJ8IKlcl/N70TdiIQaNnBwdU08t8qCwSqnwXwDfEHIzCjRn9tKiEcVcO5O6JOR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q+JdbeioZWrVQT7Cl50sSX3YKfQh1FKg0FxKFw51L4TxD3IeR
	rYJXOXMXblulTcaC0DWyBk/rmbaB/DfPCj0hFuGH2hlUBQBmr+4gpvW1q+rrXYtMunI4wrmXUVt
	nmkTKaVmW5PGH/7WGY17sYaLnGbNtRGyMgcf9fn+qYnO3
X-Gm-Gg: AYBFou1SrYBTaEAU18qHf8dpJ0AcqNOou/rJksWh/CZNLN0Up6i67V95uk7kUHcGFyH
	n8W/uUO6AQwhEjAOJkjtatIkGvfKrYM8QiJxlTImknSqBZjRD4R5f17S7c+lDnS98PhHNwlXoej
	J4dBlMPvsdLqpjvzdpOOYICIFaTNoSxsxbiD0pxaeSigz9GG/3i2oc6GqfeX6gK1Wh1SSdQOZ7n
	sS4V003DuL2p86P8SbWIkXy7p3njrNKtu851Y30hMBAjcjvWcdAvykibcmxpLfgeczBrm1fPJLa
	vNucRcNZSkCdqaFSnZM4kDJkmS/MFJspikE4nSMsvk8HYzwYqMgtRapilQO5jxoDCvAZKzKTgfH
	gBZpo7PZNN803dZXJuf5S4SyaDoNAMvR5ND2aNiwQUplwcK19Ac3bJe/+kKNqISg9Ct8UYCo9yW
	f7A53nokDGewXdIFA0WfBWyWn5dA20X7aa4yaXTGjbmbAYabElhhNOtiQjFuPdi++0RVEnqENtC
	K5yOA==
X-Received: by 2002:a05:651c:1544:b0:3a8:380c:9fb6 with SMTP id
 38308e7fff4ca-3ae2b6aaccemr21264111fa.28.1794703399262; Sat, 14 Nov 2026
 16:43:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Ahmed Khan <ahmadpsn95@gmail.com>
Date: Sat, 14 Nov 2026 19:43:08 -0500
X-Gm-Features: AclHuK8JguVcAUUYQrhGxKWIahEIGkCO11fvzc8h0VRZO67ypHW-NhqDoZkf2P0
Message-ID: <CAOaS1==g3mdoqmS2AjOC0_-woXJbA_X0LJQt7+M7d1=+gfyQqw@mail.gmail.com>
Subject: [BUG] ext4: NULL pointer dereference in jbd2_journal_file_inode()
 during inline data conversion
To: tytso@mit.edu, adilger.kernel@dilger.ca
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Theodore and Andreas,

My name is Ahmed Khan, I am a security researcher from Canada. I
believe I found a bug within the Linux Kernel, specifically, version
7.3.4 affecting all major distros. I will be candid and state that I
used AI heavily in fuzzing the kernel using "syzkaller". Below are its
findings, the proof of concept worked on my QEMU VM repeatedly.

I found and verified a deterministic NULL pointer dereference in
jbd2_journal_file_inode() triggered when expanding an inline_data ext4
file via path-based truncate() on a filesystem mounted in data=3Dordered
mode.

This corresponds to syzbot crash ID:
3eb9083d961b1b97587d103692546ba06797de4e

1. Root Cause Analysis
----------------------
In ext4, EXT4_I(inode)->jinode is lazily allocated via
ext4_inode_attach_jinode(). Normally this occurs during
ext4_file_open(), ext4_write_begin(), or late inside ext4_setattr().

When path-based truncate() is called on a file without opening a file
descriptor, the inode enters ext4_setattr() with EXT4_I(inode)->jinode
still NULL:

  /* fs/ext4/inode.c =E2=80=94 ext4_setattr() */
  if (ext4_has_inline_data(inode) &&
      attr->ia_size > EXT4_I(inode)->i_inline_size) {
      error =3D ext4_convert_inline_data(inode); /* jinode is still NULL */
      if (error)
          goto err_out;
  }
  ...
  /* ext4_inode_attach_jinode() is only called later in ext4_setattr() */

During inline conversion, ext4_convert_inline_data_nolock() calls
ext4_map_blocks(..., EXT4_GET_BLOCKS_CREATE). When the inode also has
EXT4_INODE_EXTENTS set and the filesystem is mounted with data=3Dordered,
ext4_map_blocks() calls ext4_jbd2_inode_add_write(), passing
EXT4_I(inode)->jinode (NULL) directly to jbd2_journal_file_inode().

jbd2_journal_file_inode() then acquires journal->j_list_lock (with IRQs
disabled) and dereferences the NULL jinode pointer at offset 0x28/0x38,
causing a fatal Oops/GPF while holding the journal list lock.

2. Reproduction Steps
---------------------
1. Mount a crafted ext4 image in default data=3Dordered mode containing a
   regular file with both EXT4_INLINE_DATA_FL and EXT4_EXTENTS_FL set.
2. Without opening a file descriptor on the target file, invoke:
   truncate("./file3", 0x10001);

 * Proof of Concept: Linux Kernel ext4/jbd2 NULL Pointer Dereference
 *
 * Target Linux Kernel Versions:
 *   - Upstream Linux: 7.0 =E2=80=93 7.3.4+
 *   - Confirmed Distro Kernels (6/6 Tested Distros Crashed):
 *       * Ubuntu 26.04.1 LTS (Linux 7.0.0-38-generic #38-Ubuntu)
 *       * Ubuntu 26.10       (Linux 7.3.0-10-generic #10-Ubuntu)
 *       * Fedora Cloud 45    (Linux 7.2.11-300.fc45.x86_64)
 *       * Debian Sid / Forky (Linux 7.2.15+deb14-cloud-amd64)
 *       * Arch Linux         (Linux 7.2.11-arch1-1)
 *       * openSUSE Tumbleweed (Linux 7.3.3-1-default)
 *       * Upstream Base / CachyOS (Linux 7.3.4 SMP KASAN)
 *
 * Vulnerability Summary:
 *   Triggered via truncate("./file3", 0x10001) on a crafted ext4 filesyste=
m
 *   where the target inode has both EXT4_INLINE_DATA_FL and
EXT4_EXTENTS_FL set.
 *   ext4_setattr() calls ext4_convert_inline_data() before attaching a jin=
ode,
 *   causing ext4_jbd2_inode_add_write() to pass jinode =3D=3D NULL into
 *   jbd2_journal_file_inode(), causing an immediate NULL pointer
dereference (GPF)
 *   while holding journal->j_list_lock with interrupts disabled.
 *
 * Crash Signature:
 *   Oops: general protection fault, address: 0x0000000000000028 (or 0x38)
 *   RIP: 0010:jbd2_journal_file_inode+0x14b/0x5b0
 *   note: poc1 exited with irqs disabled / preempt_count 1
 *
 * Compilation:
 *   gcc -O2 -o poc1 poc1_ext4_jbd2_nullderef.c
 *   Prerequisite: ensure /dev/loop0 exists (modprobe loop && losetup -f)
 *
 * Originally autogenerated by syzkaller (https://github.com/google/syzkall=
er)

3. Crash Log (KASAN)
--------------------
[   18.161021] Oops: general protection fault, probably for
non-canonical address
  0xdffffc0000000005: 0000 [#1] SMP KASAN NOPTI
[   18.162724] RIP: 0010:jbd2_journal_file_inode+0x14b/0x5b0
[   18.163481] Code: 48 c1 e8 03 42 80 3c 30 00 74 08 4c 89 e7 e8 4a
41 8c ff 49 8b 44 24 28 ...
[   18.170125] Call Trace:
[   18.170410]  <TASK>
[   18.170685]  ext4_jbd2_inode_add_write+0x138/0x1e0
[   18.171220]  ext4_map_blocks+0x1102/0x1b40
[   18.171691]  ext4_convert_inline_data_nolock+0x18e/0x450
[   18.172281]  ext4_convert_inline_data+0x17c/0x250
[   18.172780]  ext4_setattr+0xa2c/0x1ea0
[   18.173200]  notify_change+0x628/0xd60
[   18.173620]  do_truncate+0x144/0x230
[   18.174020]  do_sys_truncate+0x17e/0x200
[   18.174450]  ksys_truncate+0x2c/0x40
[   18.174820]  do_syscall_64+0x10e/0x5e0
[   18.176450]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   18.178920] note: poc1[318] exited with irqs disabled / preempt_count

4. Suggested Fix Direction
--------------------------
Calling ext4_inode_attach_jinode(inode) inside ext4_convert_inline_data()
(or prior to calling ext4_convert_inline_data() in ext4_setattr())
ensures jinode is allocated before ext4_map_blocks() attempts to add
the inode to the journal's ordered data list.

Please let me know if you would like the standalone C reproducer or
the minimal ext4 disk image attached inline. I have this in a private
repo and would be happy to add you as a project contributor.

Best regards,
Ahmed Khan
