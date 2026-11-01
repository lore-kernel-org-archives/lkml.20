Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542558;
	b=nx4LMBXJp6BTaY8k5qCJlmTB0dO3MM/BZIATHvLyjE5LTE6ts5WiBQ/J0bNj63aqw5wq
	 eeG1DqfAjlmyt/wxV8j1kqbk/9nUvgzu4609AeVDaFWfZkv3tJyb5CESOwGeWVQHw28b5
	 rre5adXevKMwxTABtV4PCS41GLov8XjA6rprv6fVH0c6FSbt6WBjMQtH+pgEPfJTkAmnh
	 YAbq8lashvFOYJ9gdN1AAb/7mQ111vNgTLEQ6MnQp5o2tTT4v90z1xbIis1DTdf4NVe0N
	 FZLyOQI6dYUYnV91KVIewIrVpmmp8p11u1YFN5XjgU4cPUZOSlzfY3h/vxgS0j/x0Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sMIiBsBGGfnuS5WxfPmtADmv/TO4FUudGIPAhofipOw=;
	b=oH3107cwDVbp9qFmXLFW5yqniCeyTJfJML7PfREK+95ys8PYENEr/Bk3nk1uTL6jaAhG
	 9oyS+gK4tCUS3TsUgerrTDJMBDD/rT1G4CxsqQq1cr2o/YFDAYghtHUKEhftmChdjoc4T
	 +3TMj9viRuwHIzFg5u/udHXsj8XlscDLkwU0hshGVVoB/LSFjscip0yufqdGrqnQPsR1Z
	 Y7utaBufig1rtVZTlnqU9JnU6PT50j4HaMfTMvWeRPKS0EoTXFMwX8b8pBXQRrFPN5B5T
	 w23/Dc8N1hF5cI1teqoVuyzYMKkGcaVZvdESvEBaaYrCBZmUHFElnCc38vMmKAW3x9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcJpqmfU;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC95606A32C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC95606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcJpqmfU
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so2105747e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793542557; x=1794147357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sMIiBsBGGfnuS5WxfPmtADmv/TO4FUudGIPAhofipOw=;
        b=vcJpqmfUdbN8tkReri4l0x+jGDh7UGhpZX4DbVuZ5aO4NgyOTuHU+T6NbhzFMYImAg
         6fmdb8ooUrh4DGkUSvCTKj5ZK3k6tXOTNvyrmJcTaFDCkZ3N0qR7EGxWkrwAzXcOQMQU
         xvKdVF12c0p5iJhej1VGBebhKRztuSAjblBZGLK4TwsNeJ12C/CucXclbxvKDU3TyUHR
         LRATY/blOtNAzhAAFTvgoxRlYufIMGXOwDhHOTu1qKARAPRmaUYepZpCnzmIrIU5VSYb
         2rurZlIlN2ToB0EBySYLkROwUBAQm2/f/kgDzkhu7UcXI1URIj4PvoRLYb+26BqTHg7M
         kh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793542557; x=1794147357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMIiBsBGGfnuS5WxfPmtADmv/TO4FUudGIPAhofipOw=;
        b=fKQDg/FnksG+AuVuLUg42ZbRcuoTepo870FEd/buvEkrT31hjoV+ihr+3piEYoCIR1
         Yv/mgrTnkvsyFBBLt7VYWoH6YEx/mjS+Q99KGMCVQh3p1frER6CNFUXNMCo8NQPUY1S8
         ChPaBckMs/4Jwq+z950M6l3G2Ku69tNemsqcVCvTuWe0JkDiOX5jFMoGFgg4nf78brTk
         5uhYniyi8cawoARGq94B1W4oADI19V2WIcgVOabH9IEVhG95/6Kp0ynaRSHlbR6CJ4I0
         HMScIL2gx8rPzV0Y7N4mChp9TpVersJfk8ImlZexfOhyfKmb10CRXzRPvwWsI7gSeRO3
         prxw==
X-Forwarded-Encrypted: i=1; AKwUvBz/xzyBB+gd4XB6qENB0HZNvjUGef4qbhtycLjUEbqwoJPFpWr4vc86G7m64fDjeuSfbyLyajA4vXSHWnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXB/T6HBKMwB1ufHzQ3sIxO0TSUogI1arzz0+GItYP5wPajMVa
	IKvWx1dAEfVjNYEqhIpzalZsA719/b5HLfoXTlqc8awldRt5591jfJlw
X-Gm-Gg: AYBFou2a+Rmpvc3uh/aGGj31TMDUKVi3AJHMJTSJcBTrq7YRaF+Y5OZPZ1yxowbjkUZ
	wSqYcYmgQI1LItD0E19yxDUMiURy6F2uCurAKj+IT90KR00CuCOgYqLgc4Rv49xHS7meCw9BI+6
	MELbLQ7Ta6b39xEAy3Jp1OW4NZgUD3uB4gHWaOHXs2gupT7NzjLW1ZJvn1KUONaK5XY0v/DGdyt
	OKZqYHqORSH44onBCBhIz09V6Tl+vAWyAoJ8F7aCy2/vwpPH71cPbR8k7HjPImSDq5B1/nJnoA+
	Jkl9tmZp9NTz1LUGC98uFtHF02Jkcyu65jGFaf4k1BRTM5WElvmNjuBzV/74JIAyp8OeizpY/zO
	OjvPvyTrkGF4wrgjfqQQb45imstIvrdiB26JY9ua50zErRM/akl60AHMvwZ0i6msb0NOi1FtXON
	sAk0GlYo2tMKzD002GZ6d4u4JwyPU3BgFF4031zVFgiEZt/0+ZUW2uV7z5+yUMKSvUMUrZ9jY0s
	WW2mWNZ7H6AIKlHJY3zZswDvsXBL1o+HSSTNGZvVB7++sFnbs0td6uEvIsf3soUoFhG1RNuz4V+
	P9xID9v/RvnlPSA26m8XjAE9Ay7Xs5xxHtaMsXnD62yJsmUX+Ni2bhXFFdNL1Z2iqY0tOA9N7iF
	OtrnYfGINOG9xZTKSWlwkVxhqJVBePuyk161sK1WmMcJCLT1ec9jITgqy
X-Received: by 2002:a05:6512:3d17:b0:5bf:a27e:e23e with SMTP id 2adb3069b0e04-5bfd957fbe0mr2778352e87.57.1793542556592;
        Sun, 01 Nov 2026 06:15:56 -0800 (PST)
Received: from xps.taila9902.ts.net ([2001:464e:6820:0:f43c:bf8:ce8f:65e6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1791832sm1043672e87.23.2026.11.01.06.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:15:56 -0800 (PST)
From: Nikolaos Gkarlis <nickgarlis@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikolaos Gkarlis <nickgarlis@gmail.com>
Subject: [PATCH 0/2] RDMA/nldev: Reply with the command of the request
Date: Sun,  1 Nov 2026 15:15:19 +0100
Message-ID: <20261101141521.2426198-1-nickgarlis@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Two doit handlers reply with another command's message type:
RDMA_NLDEV_CMD_PORT_GET with RDMA_NLDEV_CMD_GET, and RDMA_NLDEV_CMD_STAT_DEL
with RDMA_NLDEV_CMD_STAT_SET. A client that decodes replies based on their
type mis-decodes them. AFAIK iproute2 igores the reply type and rdma-core
does not use these commands. I spotted these when writing an RDMA netlink
client for Go.

I used AI to prepare the patches but I reviewed and tested myself.

Nikolaos Gkarlis (2):
  RDMA/nldev: Reply to RDMA_NLDEV_CMD_PORT_GET with its own command
  RDMA/nldev: Reply to RDMA_NLDEV_CMD_STAT_DEL with its own command

 drivers/infiniband/core/nldev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)


base-commit: c3e8e9451e6f1b69f685b75e0fbf14f3d0fb2539
-- 
2.55.0

