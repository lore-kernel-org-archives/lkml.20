Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994089;
	b=O9RRL0np97hdMOuA6vzlSwV8FE/50gJ3CyfhRH8/Ck7+woUnyvRiDsn1qjqTy4coKCBw
	 U7z4x3Rm4LcogI2RVrcsKHt2ZsErt0rSSfYEPuve3Hc009xBrlWQfcZDTGTGgQAx4gU5Z
	 4DTfrdyFdlcTdgwkn7YPU5hpyGFh22t17TzSUkE7hCJDs5BEy/y2c7O/+JVWSiwAlUdPb
	 3FZRZBeRwzdjk8XWuBiTKwNCWbKAzuSL/KPKDYaV+v837Iiwm7BfNCQNDKYlODEt4+n7V
	 t8RlX+E/OyGrIqEtmu3tyLKE6EKLcUPmcwCQArFQse8h9iAUpsfKwR4kEv5B5n+4Ldw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=csphFTdpMBTVxUq8xSOjb1glIePwWhBgc2G/OqCCfTU=;
	b=fY1GefOzGKHs3WQJp7r7AgZI/lIG3cL8oYc+dhszGZzL56gDChb+XSzHDZP/WLm19fpb
	 AMYy3Y3E2W/LNZmMh0kVRobM0RH4sEnushYsC3HqSj1zdZufqm60u4BpgWsRegNdJr7n0
	 u/D13VID0n+P9MV05BnClhHHkShL2qOCkoP9nJ9nE8dDOXByGaOy71CvBeY8AC4g1Xu9Z
	 biztvNViKr1Adyzdhzk0hfPHTihaw2+t8911cwZMgne/ybGoVQ8yQDpQfrsaOH5Og7hAL
	 4EelRTZRyW5m3eendGd+MFeaszSC5f+F3k4EOJlEsTx2P40UOr/u448TeaeYqBFqQKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VfDn5U2V;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B9606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392B9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VfDn5U2V
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso4906879eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792994082; x=1793598882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csphFTdpMBTVxUq8xSOjb1glIePwWhBgc2G/OqCCfTU=;
        b=VfDn5U2VYNvV56jVfnCG8y6ecapaC3HonQmStD6pBkbEAl0RLz5wg3JDXS9n+l70h3
         lS70Ph3nrjso20JwYz2NZAMCPQJQV4vxmLikdYZhRIVxQ3mzssPNoZtgMt5WwJ1jeevv
         DL22UvA5sJ4T2xY1eAWfUei6w5iR+OH2D6j1o87XE3asVy6QNLWQ9ItpUNrbfl/8bq24
         kbx6UQfTHUsY3eN78kp0Qbz40Ps7wIrJn+o/CGam5nN+7C0Y90DIYgro4pBL4HP8f1Pi
         JJu+e0wAbr7gObXeqRvW2hTrE0wLJxEnSc7roEFnsuZS5bCgn/HqY5vMtPhMVLDWN41/
         ZosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994082; x=1793598882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csphFTdpMBTVxUq8xSOjb1glIePwWhBgc2G/OqCCfTU=;
        b=jdirBinWehPMKtISZvRWkYI6dzjIbr6Fff5yNplfycbnyT0IIq5eGAEGQ8TMVcNfWq
         Kcc3/v0008fAWl724+KxY8PY7n608DNuYZWG9NIGj/6Iuq9ynNolIdxsGuqRI96p53X+
         EcnuaTeqHWFWgLh8v7PoVOwJAI1HCOMu8W27vxLSeJh8neeV05eivxUUzs44SMckUWFU
         3gV/6zyMjiVy+bh/GFPOeA7tdnBLCmbiOYtRw/K95RFId8hqML6E7HzLGvg0FRIgZcCT
         +WKZ9AEtzvjrvitznafkmFk8g/+/pxmdQwlmodJjUQ0QohkWyFi7O1WFfYc49WQesM7K
         Xmrw==
X-Forwarded-Encrypted: i=1; AKwUvBzhyTs0/CbHTA84vOKOFDXxbK7PaOgAOl70O08WUSv+z4UJhO7w5CceDgkiarXNaujw8DPR7It7TeUz6mY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtJ3aKnZmgTeovpNLXdAk1MaSNYCwXST0yFLcVZINYfmmfoG1C
	YhAzJNarTWhS2Ig0eX+bzsN/nzcyhwvUcBObTmUXlloQfNii8zAoGpqoDq81okVUhJA=
X-Gm-Gg: AYBFou0FkOxXd7E+41M7+D0cLK/3PMqZCwWlBrQm/NOSnpM63nSrjmckupnfDN3xUIn
	PBCZm2T8TcldoXWiKdDMfkjNZZew4G74QP9vsG6dpYIecYNRSxev/PKHpEnQ73GU1ywfeL0lSqR
	E/w5euEJjpbqCZn7T6N5Moj5CV/mirmAb+AjvQqcSJfvT0x3td2saTpmHcLqtfv/FYLmoe6L7lG
	SAxe2NalB82HSgnfYkPEvgwma5Ta2ZTRvToefhq5U1dn/rOqhosVWGstmyf50kU195cKy5EVriL
	BzbKa15KqRuga/K2vk/FGIedOWiYHVBj9bisjxtC8obTlXMN6IzNyscejRYJFJiqVmmEQkGxgnU
	GW1Vz+XhGAAasRE1vB+uNOs78HJbCZMAsAjF+s9Rrc8BW3CCFIfttSuAZr2UsIaKp1HorQaPFIg
	TCVDszqfiM1ON8KfmpG1Ojz3mrw7hmUcrfHYM6A8jmTHYqa3fbeP5doPZ4BqQssOwemb2Z37fZz
	V7CDGT/2MsiCL58LxaA5VYl3adJT1HxueVM3pThVPFStYS251C6mxm4aGrqEOYOtzEYxDcy6Lg8
	MXrcaVPD2/XcktJ4IZo1IRKu2G6AiwwTBusX+qDck0w+9KFJ
X-Received: by 2002:a05:7300:ccb0:b0:366:4c26:2968 with SMTP id 5a478bee46e88-369e84e560emr9111160eec.26.1792994082149;
        Sun, 25 Oct 2026 22:54:42 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d845ddsm22290613eec.11.2026.10.25.22.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:54:41 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 RESEND 0/2] RDMA/srp: bound the receive IU the target asks for
Date: Mon, 26 Oct 2026 14:54:28 +0900
Message-ID: <20261026055430.406487-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

The target decides how large the initiator's receive buffers are, and the
initiator never checks the answer.

srp_cm_rep_handler() takes max_ti_iu_len out of the SRP_LOGIN_RSP and
srp_alloc_iu_bufs() sizes every receive IU with it. The first patch refuses
a login that reports less than an SRP_RSP, because such a login hands the
receive path undersized buffers, and a report of zero is worse: kzalloc()
answers it with ZERO_SIZE_PTR, which ib_dma_map_single() accepts on a
virtually mapped transport without looking at the length.

The second patch stops srp_recv_done() from syncing those buffers with
ch->max_ti_iu_len. The receive ring is allocated once and kept across a
reconnect while max_ti_iu_len is taken from every login response, so a
target that reports a larger value the second time around makes the driver
sync past the end of the mapping. iu->size is the length that was mapped,
and the length srp_post_recv() posts.

Resending as a standalone thread; the v2 I sent earlier went out
In-Reply-To v1 by mistake. No code changes. Apologies for the noise.

Changes since v1:
1/2 unchanged. Dropped v1 2/2 (drop a truncated SRP_RSP): the floor makes
the buffer always >= sizeof(srp_rsp) so there is no out-of-bounds read, and
dropping the response would lose its req_lim_delta credit (per review). New
2/2 bounds the two srp_recv_done() DMA syncs to iu->size, the reconnect
case review noted 1/2 did not cover.

Yehyeong Lee (2):
  RDMA/srp: refuse a target that cannot receive an SRP_RSP
  RDMA/srp: do not DMA-sync a receive IU past its mapped length

 drivers/infiniband/ulp/srp/ib_srp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)


base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
