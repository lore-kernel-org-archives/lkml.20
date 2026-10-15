Received: from vtj.irix.systems (vtj.irix.systems [82.76.27.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747452269B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.76.27.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068515; cv=none; b=AVIfYAEW/BJVrnV911GaRC6KOM0pxYp3RRwtKThsT1cqp6NM30H3neuLkcJyAaNLqKWTv0E3o5wC0nPGdXBsrVwfSYvkNgwKNZ26peuR+qU0kzn6jXXPh4QV0eIqo5IgFfXSsGYweX0M5GltUDu1f5wHYxQKzVI2mIeW3LHhadQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068515; c=relaxed/simple;
	bh=0b5P7PoQ3bIM9S38C0CKFLR+3iggiDQrMOHPRGp/rzM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j2ACqhcusuGynl2terJH7wXFVe70OoBHZAnvPQoiF0JOVLDD9ZUJn1zuty54joh0fsKdBJ2mLLJeGkY68nUVRJIMwesAXbelyN9AAlWsbde6MINw2TGXEVgJtMqNQxTE4jYNKlAMyLA3/Bfh9oRzeB8D/93mnCHWZjNL3X/vljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrei-z.com; spf=pass smtp.mailfrom=andrei-z.com; dkim=pass (2048-bit key) header.d=andrei-z.com header.i=@andrei-z.com header.b=BzH7eYkX; arc=none smtp.client-ip=82.76.27.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrei-z.com header.i=@andrei-z.com header.b="BzH7eYkX"
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 26C5421A1C;
	Thu, 15 Oct 2026 15:48:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=sig1; bh=119VP403nfjkeLiaufYaFI0/9KsUBZ0Gua38E5Mm05E=; b=
	BzH7eYkXjCFc4c5oLd/j6K177GIQzrCQ0jrESb230ZSvqYebzkKcflw1O6EkaJ59
	LZiFNAigjVV4zc37uzh1q4HjzDuEBPUVlcFeepEBMTREDKDmMSHPISbRlKM31Hwb
	57eAB/pIVF6lGX/gA8kEd+YpWug1n0i+VMbWrz09Qk6G/GSBuQX3ytTFFNJWgnb7
	JUqUaqyALvXjpY98iCfxHihlGbEsjysH3522lEijrRhML6hhwGR6av8OEfV4M8Y6
	5xBCyze4DiUusBKgB8Uv1wutPr+d+ur+HGNot+9qv7DdU1GT+8J1mEsWtylD+xOk
	kc8IPZeUx8AMwW23pkVMrg==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id CA5C8219E3;
	Thu, 15 Oct 2026 15:48:23 +0300 (EEST)
Received: from [10.89.11.73] (10.57.8.14) by VTJ-MX.corp.irix.systems
 (2a02:2f04:1:9c24::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 15 Oct
 2026 15:48:23 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph
 Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	<linux-nvme@lists.infradead.org>
CC: Andrei-Alexandru Bleortu <me@andrei-z.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/1] nvme-rdma: post the command capsule inline when it fits
Date: Thu, 15 Oct 2026 15:48:22 +0300
Message-ID: <20261015124823.2962700-1-me@andrei-z.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)

The host posts each 64-byte command capsule by reference, so the HCA
reads it from host memory before it sends the command. This patch
asks for inline data at QP creation and posts capsules that carry no
in-capsule data with IB_SEND_INLINE. The commit message has the
details and the measurements.

The target is left alone. For a read it posts the response capsule in
the same WR chain as the data RDMA Write. In the measured runs, inlining
the response alone made no measurable difference, and inlining both
capsules was about the same as inlining the command alone.

It builds with W=1 on nvme-7.4 without new warnings. I tested it in a
QEMU guest with rdma_rxe on a dummy netdev and nvmet-rdma looped back
to a file-backed namespace. 16 MiB of O_DIRECT writes and reads at
4 KiB and 128 KiB compared equal. The QP got 80 bytes of inline data.
4371 capsules went inline and 4098 by reference, mostly 4 KiB writes,
which carry in-capsule data. With rxe changed to refuse inline data,
QP creation fell back and the data still compared equal. The guest ran
a 7.3-rc4 based kernel. Its drivers/nvme/host/rdma.c is the same as
nvme-7.4's except for one later fix, 909307cea08a ("nvme-rdma: don't
complete a request after a bogus remote invalidation").

I wrote this patch with an LLM coding assistant (Claude Code), which
also drafted the commit message and ran the build and the VM test.

Andrei-Alexandru Bleortu (1):
  nvme-rdma: post the command capsule inline when it fits

 drivers/nvme/host/rdma.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)


base-commit: bbca7c312ab25efd0024eb87545c51a76ab2ea39
-- 
2.56.0


