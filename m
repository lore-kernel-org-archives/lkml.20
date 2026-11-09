Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224481;
	b=Pgis3IBExs6tefUmHX8iNuUgTYzIX2H35IUgn3+MFIsr/T9337oVqF0C67MdK0TUTN0x
	 bjqaW6kELkIcPgd3wVESwVmvZPuDoPE2G5mCG+NOnsNB5BzaQGZ9V72Y4C/1sT4ktAyJO
	 gGPPouLelBzdWX3eTmw4sm6uuLoHyTv3ZRiCAfZuoxkClJpoX/5p1FLIzUDoMWnmtGKzo
	 UPRaA5VyuaJHne//idg+A+hSioApUoCDNIo95bLcyEM8kQgYFDqfF5XMcbjlv0/gCTvwa
	 orJQ+FL5sqfSWqyeVTdEoZrTJ1qq3X/l/ibUeW1dmvGKfsg78fMWCOpY118nrHR6fHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224481;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=kjohfqrE27E6V6k3CqFrpx+HyYJnBSQ7JeKd6+2UDis=;
	b=zVqBaYd0O+idEIcSjHvvqKoQrvuRIgj5B1ui06R6XGXyRbOzdrYcZ+c8L8zY4kOdOVcH
	 q+8iP543j0H0Fb9Bb5fItXNfyXecD88lW+M6mTkVw3Luan5+NAFNSiq8P/9puc5ljZvC+
	 l/1stm4h1R3nw6ZvKbt4Tul89dNEKDAMkQSiPYlZ6j6HfLpMLhnNlmTQZlF8HloH+KeCG
	 C6Y/+hhY4TvZ8mN11nrEBlNSEOu7NygG5Sz8R9GctQfdEUMEl68K4etpX7GKUVE7uOyAy
	 2PzELpy/ANJ99Nv6KBlmge5IZ8PcuED8OABj21B039MDYUvg8ToY7vIlL1wBBjNGaoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="FKIA/mIl";
	arc=none smtp.remote-ip=203.205.221.231
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69732606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69732606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=FKIA/mIl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794224469; bh=kjohfqrE27E6V6k3CqFrpx+HyYJnBSQ7JeKd6+2UDis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FKIA/mIlCwqRoBsqFcWkS6pP88LE0Riuwfc6KvgVt8OSSIjPNp0GVm5Vu1bA4AFc+
	 yZ3O1tnmAr/LDFMI3L3RF9a6F8OTZK47y7e/s4ZxsSAeEulSa7c7WDShQvE9vH75ft
	 x5l7vNfSd1sHu3Ki2I4nH/JMZFekE4M/19VXNA7g=
Received: from [127.0.1.1] ([223.88.55.127])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id A4788E05; Mon, 09 Nov 2026 19:41:07 +0800
X-QQ-mid: xmsmtpt1794224467tl4zd7563
Message-ID: <tencent_BC5836E4DF9A8471F3C4982600DD4BA46D09@qq.com>
X-QQ-XMAILINFO: MvUAcPkRmFBfvJBWAjpvQCJRVbM5C/N7jq8Yvxhgb8PSwI+iFmNYMTwkfRAjfS
	 WHtV9D35JVbrfxtaf2cW2xZmkAF8MOTY9SywG9PLEsRlqy7MOvCNf+puuRpGcofQo1el00/rEQ69
	 GpQwITJlDjGTOy6T3dBb2Pw/chequ08v75Mx04oD6yw89dipz+uGKoalIYbBONYs83XlqKD90i+G
	 +T4S1hvnbwX1Yjjl4uoh0FlCe5g5zX+VXqCHAHKUU4CzsqFWnjcqlPtjnMs8aUWPGw5SmewkK8f7
	 ycZ7M0/V66eCd58NuHEA7CZG59otQWBzIgG7O4qDsgGZ+NdFpgqlRElUZbJoNc/NWaTXTqpjGKKE
	 ZXsKY967wmsVYi2vTjG2JNmxtWqcfTWVd7cODORAmKOZbUOnFwFqxg5YmjcjJ1pl99vpXIIFtPEZ
	 kSXBw73xZgHeXQ1izonwdz/hO+mfz383N+4jz3Zg5vTgFekqAt0V7mdkICUAfv+LbJCZZEK5sH34
	 CmLLh2gcdqQPZONzXVwL0zaByvF5QOtHdfWWHhlz744D2i1Tg/qIhimcpgkPIvVAxQzaarmEVwgp
	 FVTmZccJxM4YeiejK5G9iNA23WivqBXZV4IEAvqNp9HCSMxG3XDSsHxXx8Nqg+PsghS49UJ2jXm+
	 vMpkwf80NB5lfghMF0d1eHray5ztKe97sWhNKGgZZzZbDodKznFwVHXpLZoqCsIdeTnjA3Yz7IGB
	 NQRvLSQOsYbQpNaYje4kzOCZfEbveKS0kq39i/nbGcoKgbV2Oa/2DDs3BAcQZC29LKQPTgn9z1gG
	 4T0IYqt/mqnAy6joNuNDlNDcwSmZf8BJ+QrTRvN503OKBpseWuUK9ynxKAHFNaPHgyR+TahlKByW
	 5Sh7qxNRdhaRWbNXYn/bycuN+vBFdpnzV9Ig0aW5bIOQdEmL/4L0Gi5HekQCC6Aonhjk8DKC8aCa
	 SFKHDDYKs4m40lD5cgoLOrcEAHAyegrP1XWEI11hf992WV+G/uyuP0uWki47CO8GrvOlYpZvmfFB
	 arTj4dLVZ27p2pzb7W5Kb9IobHOW05jTdCpCVafaeUgj2d5azrsZ/HiOG0s60=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Shuai Liu <847807867@qq.com>
To: syzbot+66e09ade4298957334df@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org
Subject: Re: [syzbot] [kernel?] general protection fault in psi_task_change
Date: Mon, 09 Nov 2026 19:41:07 +0800
X-OQ-MSGID: <179422446761.1059175.17180117212466669829@qq.com>
In-Reply-To: <6aec699e.73adde43.12e2c1.0000.GAE@google.com>
References: <6aec699e.73adde43.12e2c1.0000.GAE@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

I had a look at this report. The fault is not a bug in psi/cgroup; it is
the reproducer reconfiguring the Q35 host bridge so that an ECAM window
overlaps DRAM. Please consider marking the bug invalid.

What the crash actually dereferences
------------------------------------
cgroup_ino() is reached with cset->dfl_cgrp == 0xffffffffffffffff. The
register dump confirms the load path:

  mov 0x88(%r13),%r15   ; r13 = task->cgroups = ffff888054570000
                        ; dfl_cgrp is at offset 0x88, i.e.
                        ; CGROUP_SUBSYS_COUNT == 15
                        ; (CONFIG_CGROUP_DEBUG=y, CONFIG_CGROUP_DMEM=n)
  lea 0x1a0(%r15),%rdi  ; &cgrp->kn, -1 + 0x1a0 = 0x19f
  shr $0x3,%rdx
  cmpb $0x0,(%rdx,%rax,1)   ; KASAN shadow check, faults here

The load of [r13+0x88] itself passed the KASAN check, so the css_set is
alive and initialized; only those eight bytes read back as all-ones.
dfl_cgrp is a valid cgroup pointer by construction and is never -1, and
neither a use-after-free nor a migration race explains this: both would
have failed the shadow check first, or left a sane stale pointer behind.

Where the all-ones come from
----------------------------
The reproducer does:

  openat("./proc/bus/pci/00/00.0", O_RDWR);   /* Q35 host bridge */
  write(fd, "R-", 2)   x64, async
  write(fd, "-1\0", 3) x64, async

Both writes are async and share one file description, so the 2-byte and
3-byte chunks interleave while the file position advances. That sprays an
arbitrary mix of the bytes {0x52, 0x2d, 0x31, 0x00} over offsets
0x00-0x13f of the host bridge config space (clamped to cfg_size).

Offset 0x60 is PCIEXBAR. Those four byte values are enough to program

  enable = 1                  (bit 0, from 0x2d or 0x31)
  length = 64 MiB or more     (bits 2:1)
  base   = 0x52000000         (byte 3 = 0x52, byte 2 = 0x00)

so the ECAM window [0x52000000, 0x52000000 + length) is placed over DRAM.
The crashed css_set sits at

  0xffff888054570000 - 0xffff888000000000 = 0x54570000

which is inside that window. Accesses there no longer reach DRAM; they are
decoded as PCI config space, and an address that does not decode to a
device returns all-ones. The KASAN shadow lives at a different physical
address, which is exactly why the object still looks valid and the fault
is deferred to the next dereference.

Corroborating observations
--------------------------
* At the same timestamp another CPU reported an unrelated

    BUG: kernel NULL pointer dereference, address: 0x0000000000000f

  Two independent faults in unrelated subsystems at the same instant is
  the signature of a changed memory map, not of a cgroup race.

* proc_bus_pci_write() is not itself broken: drivers/pci/proc.c clamps
  nbytes to dev->cfg_size (pos >= size, pos + nbytes > size), so there is
  no out-of-bounds access on the kernel side. The write reaches the
  emulated host bridge and reprograms it, which is what root is allowed
  to do.

So there is no kernel change that fixes this crash. Preventing it would
require lockdown (proc_bus_pci_write() already fails with -EPERM for
LOCKDOWN_PCI_ACCESS), or dropping the /proc/bus/pci writes from the
reproducer.

#syz invalid

Thanks,
Shuai Liu

