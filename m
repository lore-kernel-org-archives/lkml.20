Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA6B547078
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792110272; cv=none; b=JQQq+oCs8oCxeXq61rEFfXAHHWXAjwYHmNmPYftC7UpqV+5EEOjYbRbiahftq99GEMF8uzzQNj1GHmCCTDA1EmYBKFO5+7dXSOghHpmmJzYM541ko2N87Gw6SfKq9cTV46+lOLp/cWhn+rihWt1hnkY0CUxlauFo+BTVNzAoQ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792110272; c=relaxed/simple;
	bh=hL6mtDs6/B84fk7/+W2d4BXH2JG2EoqzxGwgSukCgic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lMWjew5cCKWFXm3Gf1mKCIDjN4QbqrQVh3g3KlUSOSY7Scf7778StBirVh7D6uwEXCKQwRbemuRn983K2bEiLrXap9gYp8Q/I1DeVT2RPp8+zRtMTdWnAVGG77iPpIIbdffUMQzwa3tNiVatTnvs9tPs34538Kx5NM4yMESFVbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=l+4BKTQp; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="l+4BKTQp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bt
	rJprSS194OAW2n6AQnMcqpIUNr9AAzjlrzl1y+2yA=; b=l+4BKTQpNdNlwWQFiu
	BuDVrswfIwfI88pIRVs3W1EgLbZ29agEgU1aGXwpz1Jnxri+Rgj33aJV00sTvJT7
	5C+VfLImKOUxS2JWQpvQPpNb0BoIYZ80y37Klj2qFKNnDP2KeqPJosEy35nFE7kX
	iJF16pDDYx4fB0hLAZS0POZns=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H1+KbtFqgGZ0AQ--.60229S2;
	Fri, 16 Oct 2026 08:23:40 +0800 (CST)
From: Haolong Wang <18766350203@163.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] mm/memfd_luo: MFD_NOEXEC_SEAL memfd becomes executable after restore
Date: Fri, 16 Oct 2026 08:19:00 +0800
Message-ID: <20261016001900.4722-1-18766350203@163.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H1+KbtFqgGZ0AQ--.60229S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF45Wr15Cr1UWF4xXr15CFg_yoWrXrWkp3
	y5Gas8ur1DJrykKw4I9F10qFyfKa1fJr4jvrWSgFyxAan8Wrn2yF4F9FyUWF9xArsrWa1j
	qw4Ykry8A3W7JwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5wIDUUUUU=
X-CM-SenderInfo: jpryllawtvijiqt6il2tof0z/xtbC9g3NlWrRbo1-AgAA3G

Hi,

I observed: LUO preserves and restores the seals of a memfd, including
F_SEAL_EXEC, but it does not preserve the inode execute mask protected
by that seal. For a new memfd created with MFD_NOEXEC_SEAL, when it has
not been fchmod'ed, its state before preservation is normally
inode->i_mode & 0777 == 0666, seals = 0x20; however, the new inode
created when LUO restores the memfd has default permission bits 0777,
and the seals also change to 0x3e during restoration.

Although the LUO documentation states that it is not a completely
transparent restoration and that only the listed properties are
guaranteed to be preserved, I think that preserving only F_SEAL_EXEC
without preserving the inode mode, or rather the execute mask, is
somewhat unreasonable. I am not sure whether this matches your intended
design.

To put it somewhat imprecisely, I think the LUO mechanism may bypass
the "no executable memfd may be created" expectation that
vm.memfd_noexec=2 is intended to provide.

The analysis is as follows:

1. If we pass the MFD_NOEXEC_SEAL flag, SYSCALL_DEFINE2 goes through
   the sanitize_flags() check, which may modify flags, and then enters
   memfd_alloc_file().

2. In memfd_alloc_file(), it enters shmem_file_setup() and then
   __shmem_file_setup():

```
	if (flags & MFD_HUGETLB) {
		file = hugetlb_file_setup(name, 0, mk_vma_flags(VMA_NORESERVE_BIT),
					HUGETLB_ANONHUGE_INODE,
					(flags >> MFD_HUGE_SHIFT) &
					MFD_HUGE_MASK);
	} else {
		file = shmem_file_setup(name, 0, mk_vma_flags(VMA_NORESERVE_BIT));
	}
```

3. In __shmem_file_setup(), the inode->i_mode obtained by default is
   0777:

```
	inode = shmem_get_inode(&nop_mnt_idmap, mnt->mnt_sb, NULL,
				S_IFREG | S_IRWXUGO, 0, flags);
```

4. Back in memfd_alloc_file(), inode->i_mode becomes 0666, and
   F_SEAL_EXEC is set:

```
	if (flags & MFD_NOEXEC_SEAL) {
		inode->i_mode &= ~0111;
		file_seals = memfd_file_seals_ptr(file);
		if (file_seals) {
			*file_seals &= ~F_SEAL_SEAL;
			*file_seals |= F_SEAL_EXEC;
		}
	} else if (flags & MFD_ALLOW_SEALING) {
		/* MFD_EXEC and MFD_ALLOW_SEALING are set */
		file_seals = memfd_file_seals_ptr(file);
		if (file_seals)
			*file_seals &= ~F_SEAL_SEAL;
	}
```

5. In memfd_luo_preserve(), LUO obtains the seals of the original
   memfd through memfd_get_seals() and stores them in ser->seals:

```
	seals = memfd_get_seals(args->file);
	...
	ser->seals = seals;
```

6. After switching kernels and restoring the memfd, in the
   memfd_luo_retrieve() function, memfd_luo_retrieve() directly calls
   memfd_alloc_file("", MFD_ALLOW_SEALING). This call creates a new
   shmem inode with permission bits 0777. Since MFD_NOEXEC_SEAL is not
   passed and only MFD_ALLOW_SEALING is, the execute bits are not
   cleared, and the inode mode still remains 0777:

```
	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
```

7. Then, in the memfd_luo_retrieve() function, it enters memfd_add_seals():

```
	err = memfd_add_seals(file, ser->seals);
```

8. In memfd_add_seals(), ser->seals holds the F_SEAL_EXEC that the
   original memfd has because of MFD_NOEXEC_SEAL. Since the restored
   inode is 0777, inode->i_mode & 0111 is true, and
   SHRINK|GROW|WRITE|FUTURE_WRITE are additionally added -> seals
   becomes 0x3e:

```
	if (seals & F_SEAL_EXEC && inode->i_mode & 0111)
		seals |= F_SEAL_SHRINK|F_SEAL_GROW|F_SEAL_WRITE|F_SEAL_FUTURE_WRITE;
```

Meanwhile, I noticed the earlier review discussion about the original
seal-preservation patch:

https://lkml.org/lkml/2026/1/26/843
https://lkml.org/lkml/2026/1/26/1044

I feel that your discussion touched on this issue.

I think Pratyush has already come close to the essence of the problem:
"But I think that should be done by preserving the mode of the inode
directly, and then copying the seals back." Unfortunately, that
requirement did not make it into the final implementation.

Regards,
Haolong Wang

