Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893286;
	b=NngaiFr99H/vnE+iX2LcNitN5deSoeOLzlndFhbJYVbWBKxv1Dc4X1gxg8eYOUg/zro6
	 +7ma84UO9ab76I4ojrvqFevAFzA6oozn6ieaxpR4Xsor52lYA9ckIsypjHuXSJBB6DOBR
	 v4v2Y9xsV2+AuqiBVe9X1UY90HqMG7D2ZueHkO7BaJmkaRk6QW4BpwQmf/3QHBF4NuGaU
	 PPzW16fn4sFHtCVyAF+LtW4HlZUPsQZ8vLX+4cPHK1dZF61TuDGjVF2UPYha1lLZhTyMd
	 Z9ThrvgEq1ncnXeVRdHFtO7avdSbmBqnmLKGbs3N3/JFt/W3JKmZeuRw1z37cW0vBrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893286;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2ozDtAX6fngmVkbtCv2yTK/ANg4ulVzze2Q8cAf4UeY=;
	b=q4rD4hyUqu78urbmX1x8gKZ1iimHpftbfMm0AqaXln2PbIJsLwghM1QSRF/eXgxyCzZQ
	 v/g/TlvlaCceaU20rItTtV/mKjgKR9cb61z4j8q6guhucXAHChhqEJUckVC53XWKdFco7
	 MUBOJfUNhbM/D5bcSlkE3PfzusOLcis3tbysWC+VZhpbNfiUM30yuVpcrfiuKM+XEXrKV
	 //IWPx4UdXDuGde5W4UV/scYpj+Gjits0g5wGFtKCcNQBN4gsajJbdYyZGHVAzWxRndue
	 9trox4w5Uj83C07dfZ1P0Mv62Yq3L1v7p2REz+EajFxevPnaT8We8tZ8DSrbW70oCQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=logarcheon.com;
	spf=pass smtp.mailfrom=logarcheon.com;
	dkim=pass header.d=logarcheon.com header.i=@logarcheon.com header.a=rsa-sha256 header.s=protonmail3 header.b=M6SHJD6j;
	arc=none smtp.remote-ip=79.135.106.25
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6FE606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6FE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=logarcheon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logarcheon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=logarcheon.com header.i=@logarcheon.com header.a=rsa-sha256 header.s=protonmail3 header.b=M6SHJD6j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=logarcheon.com;
	s=protonmail3; t=1794893281; x=1795152481;
	bh=2ozDtAX6fngmVkbtCv2yTK/ANg4ulVzze2Q8cAf4UeY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=M6SHJD6jRQN4Ne+ymm/1/+8YDcXF7eIlH9IkiAogJ71Dm9H1ffbn1AAIJovEicsGV
	 63y7agDt1br32tlW89zP6RrbGIdwPU00tsLI9xrvdGZok8smfWUCULQ9vM/AjZeCgE
	 hmAr6r60J577q7wvg2BT84aVtv8x30X7E0ivxDEHzRdVGKZLAUyfuzGBxHMd3vMXk0
	 EQt9bEVoPbPPTrGGMj5gKawtep2hUCGl8nBTNymBuw/UUyrQ8ofjWCNXTBfhvQ6aMm
	 3mIcP5XhTFbs6SRKaeFysBKGLOcTeqKp7CZTbEpWiUbWjngfhQLsMHhZnnqp+2FpNb
	 cKIYsf5p2d8xQ==
Date: Tue, 17 Nov 2026 05:27:57 +0000
To: Theodore Ts'o <tytso@mit.edu>
From: William Chuang <founder@logarcheon.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.cz>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, Ritesh Harjani <ritesh.list@gmail.com>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+e8180f5590685cbc9037@syzkaller.appspotmail.com, syzkaller-bugs@googlegroups.com
Subject: [PATCH 0/2] ext4: fix two journal credit shortfalls behind one syzbot report
Message-ID: <20261117052750.2955-1-founder@logarcheon.com>
Feedback-ID: 145408520:user:proton
X-Pm-Message-ID: 85f0608268d50119822b560b6ebb69d9e144fa1a
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

syzbot report e8180f5590685cbc9037 ("WARNING in jbd2_journal_dirty_metadata
(4)") collects crashes from two separate paths. Both hit the same WARN:
a handle dirties a new metadata block after its credits are used up.

1. EXT4_IOC_SWAP_BOOT: swap_inode_boot_loader() reserves 2 credits, then
   updates quota under the same handle (crashes of 15 and 16 Nov).

2. Inline data buffered write with a short user copy:
   ext4_generic_write_inline_data() reserves 1 credit, and
   ext4_write_inline_data_end() then calls ext4_orphan_add() (crashes of
   12-14 Nov, x86_64 and arm64, including data=3Djournal).

Both were reproduced on UML at 666539eec ("Merge tag
'assoc-array-fixes-v2'") with small standalone reproducers, before and
after each fix; details are in each changelog. One patch per path, so
each can be reviewed alone. Both patches carry the same Reported-by
tag, and the report closes only when both are applied.

William Chuang (2):
  ext4: reserve quota credits in swap_inode_boot_loader()
  ext4: reserve an orphan credit for inline data writes

 fs/ext4/inline.c | 7 ++++++-
 fs/ext4/ioctl.c  | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

--=20
2.43.0


