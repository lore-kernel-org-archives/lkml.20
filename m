Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456588;
	b=W+9bYz8Db/bdCeFzqkJOeCbQC2OL2CpGwUizjLqRlBpN56+OWJys1OLESUyoI+Xbi5y/
	 l3TKIGM5+vg9AdHF8/MJFEVOmkMzPvrBnAqRByihBT1uXGl/K2fzVVyPHC61P97zdEP/i
	 HCdgKQfXyxMnHt7yQ/U59Mw94lo4PL5XdCtUVDBpbEU6ZKilqKd1T+9AjMAErfAfnXlQp
	 /LlrhLf7UTx6t/fdXFknWYwazEmTj3fwRwfxKnmbCeKGByqTu5+a0P9yh5Nox1Cl8Ns+O
	 6BsJINAD1yrGNYUXQ5tUBKuBGatPRISCdR7McxxPULHlFAsDaaUQt4Q8gyZyBEx0CXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456588;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=vrwQ4UcFXwhQ3qDSdK1JN1nsT3iCEicbv6hL+NhyQIw=;
	b=N6yVBCyBQrzl/XdEKEVpvugfx8kJqXA1lItqNf8W9K3BFdpvs2Cn4T4PdaI6kYR67tcz
	 g+TWPyvieiE6howUpP4zCAfV2MzEC3KzxsIGjTwPM7zXYRIp/I10gaAqP6GuYSRDemrvV
	 fBHcJNwYoIDzrfllIfy0r+AuJhC6tAxxB62Hrh7cNgD+uJkpZT+9VUmg7UQFKPOqhvYPG
	 fgyAv4VGjyoqtKDi9iZMRp7k+EMQ0Y7xJSTwfv8MyCpKRjz1K/Dyw/RF74VeCYEUqF7cC
	 go1HTQRjptLXrrRSZ2GUvAU/TjcIdhSkEpb8tTHBQQJHkaE5RqdrJvi8ejxd0VeTkkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=p+21fwko;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25542606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25542606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=p+21fwko
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vr
	wQ4UcFXwhQ3qDSdK1JN1nsT3iCEicbv6hL+NhyQIw=; b=p+21fwko9kAFsDQhes
	7tXYcdhmPHu6mkosxOWaRfiuwtbeYWkpan9cpiuYhgwpmbepT25J/Ggp/Ah3TNQQ
	epzFPzcYw8+Ms06KGGfc5+zIpdx58nRwbq+VmzbRh9Cak2oy9ktkXSk4wgZ32v+J
	3zK512kYJIb6HlbA+7jsn+ruc=
Received: from shaos.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCnZA2At9ZqARJXAw--.38032S2;
	Tue, 20 Oct 2026 08:36:16 +0800 (CST)
From: shaos <shawnq1@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] fs/ntfs3: an ADS rename target can overwrite a base file
Date: Tue, 20 Oct 2026 00:36:16 +0000
Message-Id: <20261020003616.1011559-1-shawnq1@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCnZA2At9ZqARJXAw--.38032S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF1xtF17JF18JFyUJFy5urg_yoW5Gw1Upr
	ykAFWfKFs7tayUtw1kZF45GFyrWwn2yFWUGFyUX3WxCF45XrZIvw4fKFy5GFy7Zr4kGr1U
	XF4UZa17Jw4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ul2NNUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC8QBebGrWt4BD8gAA35

Hello,

ntfs_rename() rejects an ADS source but accepts a target name containing the ADS delimiter.  With ads enabled, the target parser truncates f:ads to the base name f.  The existing-target branch removes f before the rename installs the source under the truncated name, silently replacing an unrelated file.

HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
git tree:       upstream Linux checkout, local branch master
source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)

console output:
https://gist.githubusercontent.com/shaos26/ed9ecf403e25839c2adc7cca3429b29b/raw/3b3e7b34634cf0d124b98ae8ca648213707e55af/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/ed9ecf403e25839c2adc7cca3429b29b/raw/5eeafdbb8044bfe53ae5eea6ab0a15ff311a3152/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/ed9ecf403e25839c2adc7cca3429b29b/raw/4bcf15d059e55bc0a19c6320263fb5e34657a5b4/poc.c

Run in a disposable VM with a fresh read-write NTFS3 image mounted so uid 65534 can write to the root directory.  The first invocation creates the files and attempts the rename; unmount and remount before the verification invocation:

    dd if=/dev/zero of=/tmp/rename.img bs=1M count=64 status=none
    mkntfs -F -q -L TEST -c 4096 -s 512 /tmp/rename.img
    mkdir -p /mnt
    mount -t ntfs3 -o loop,ads,rw,uid=65534,gid=65534,umask=000 /tmp/rename.img /mnt
    gcc -static -O2 -Wall -o ntfs3_rename_ads poc.c
    ./ntfs3_rename_ads /mnt setup-run
    umount /mnt
    mount -t ntfs3 -o loop,ads,rw,uid=65534,gid=65534,umask=000 /tmp/rename.img /mnt
    ./ntfs3_rename_ads /mnt verify-run
    umount /mnt

Three fresh vulnerable boots returned success from renameat().  After remount, a now names the original source is gone, f:ads is gone, and f resolves to the unrelated file that had previously been named a.  ads=0 preserves ordinary rename semantics.  A diagnostic fixed-kernel control rejected the ADS target and preserved all files.

Impact and prerequisites:
A local user with directory write permission on a writable NTFS3 volume can permanently lose the pre-existing target name and replace it with another file.  The operation also leaves the original MFT record and clusters leaked.  No kernel crash, memory corruption, or privilege escalation is demonstrated.

Validation: Three fresh boots reproduced silent target loss.  The ads=0 control and a diagnostic kernel that rejected the ADS target preserved the files.

Thanks,

shaos

