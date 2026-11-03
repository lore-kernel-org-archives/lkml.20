Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726325;
	b=UnkKfqik2Ok1t53QwCXbbJXDVlCegobc/1SeaJtnw+R1cy0H9bcofUk4XUzv2IzTWot9
	 KxT/6MXpkt88Csr83UdDXKo1EpwlML3XRHSXFDrhGjI0/kgGXqt3gy7ckJ+8RUtnNYrI5
	 PVpeqt7PvM7dsip316kt5qU66l4qTvfRstn0o95H1e1gJbiwxzhfYGmfRKwqRWH+FzJkL
	 mAPd8oSHSaU8mdf1qC6DtCP7o4IrfBjwbeh77zx/HNhfZUHyMM0SMpEEUZFoHhnfyQ9ap
	 SwX1gaIG3NvFyjGwm+gocJpLBJ9mxahSL8JP+WQ9tOdiUNha00QCgKFkXRNPv8pAYvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726325;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=GWoVw7tRVfl2rL+tUrsqQwVBseak+JcCT1Gf1dUVGgI=;
	b=VyFPLzBaqX0zIz/YdQb2PHMODZjPNhB0vwMxPjn4PclS051eHya6TDqZ7hx916IrOKC+
	 Ay1579bMyNoH+0BcHySGpVqgo9vU1IFznFNIAYNR1GACHpTIGgAsnbXNsg/Lxllb6jVGt
	 p8fJVADLLzoXKUfzRQaHiQoE+7hX0O1JKdcWqyLP10S7vAjhVYcJ0ub/RiX71QlEtxUPR
	 oGtNU7dcpnhd9bwsz1XcvC/rBBoTs+dxi1nJyXlA/aibV8FsQzORg6Fs/BOAI2yS0FGZP
	 8aMAIOxSzJ1QjiB6N29kEFWbfg7SMB8KT2OGlCPA43qYqQ1slNGebC5l5HT9ptLwLHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stu.shzu.edu.cn;
	spf=none smtp.mailfrom=stu.shzu.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6846606A32C;
	Tue,  3 Nov 2026 17:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6846606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.shzu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stu.shzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.shzu.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=GWoVw7tRVf
	l2rL+tUrsqQwVBseak+JcCT1Gf1dUVGgI=; b=ewv3Q2WOqErHhTKRT9oCda6Sc0
	X4SKfTsoF4DV38Uqs7pOiNtMwo2WBOup9klY+XuJ+rpBwzfVSyv1eWRKdGdr9Vir
	tNaJdQgzRSDT4EnW+gTY19hUKEZ9k0TDqth5DwK1hygaYt34onhbsUbuyIvOEDxI
	elZfD1vB3zjqkWDBg=
Received: from kernel-build.. (unknown [124.119.50.14])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkD2+fxpF+pqV5MfAQ--.29090S2;
	Wed, 04 Nov 2026 01:18:34 +0800 (CST)
From: Wang Xiong <20221010117@stu.shzu.edu.cn>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: gspca: konica: fix two stream lifecycle accesses
Date: Tue,  3 Nov 2026 17:18:30 +0000
Message-ID: <20261103171833.6136-1-20221010117@stu.shzu.edu.cn>
X-Mailer: git-send-email 2.47.3
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
X-CM-TRANSID:BbQMCkD2+fxpF+pqV5MfAQ--.29090S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw43JrykAw1DAFWUAFW3trb_yoW8XF47pF
	Z5Ja13G3yUKFy0kr4kZFyUX3Wrtan5JrWUWryYq343Zw15ur10yFWIk34jqFW7CryfZw1q
	qr1DJasrCF4UuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Jr0_Gr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx
	0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY
	02Avz4vE14v_GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUY
	8-PUUUUUU==
X-CM-SenderInfo: qsqsjiyqrqiiux6v33wovk63oohg3hdfq/1tbiAgUSCWrfb0EObQADsn

This series fixes two separate lifetime errors in the Konica subdriver.

The first patch avoids reporting a snapshot button release through a
cleared input_dev when an open video file is closed after disconnect.
The second clears last_data_urb before a new stream is allocated, so
the first status completion cannot read an URB freed with the previous
stream.  Both errors are described by archived KASAN reports.

The code was statically checked and the exact patches were applied in
an isolated tree and compiled as konica.o with INPUT=y and INPUT=n.
There was no runtime test.  The archived test source commit and its
effective configuration have not been established; these fixes were
developed and compile-tested on the base recorded below.

Before submission, konica.c at mainline commit
05441d697f7f9a927264f4058cbbc6a03dfcac9d was checked and matched the
base version of this file.  The related mailing-list search did not
identify an existing fix for either access.

OpenAI Codex assisted with static analysis, the two code changes,
validation commands and these messages, in response to a request to
review the archived crashes and prepare minimal lifetime fixes.

Wang Xiong (2):
  media: gspca: konica: skip button release after input disconnect
  media: gspca: konica: clear the cached data URB on stream start

 drivers/media/usb/gspca/konica.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)


base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
-- 
2.47.3

