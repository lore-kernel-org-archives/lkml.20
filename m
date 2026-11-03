Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712397;
	b=CAREEqqM9cUSN0ANLs3lva8OGbzzm+E1/YEcJj/j2HloGqe+7KsnooUIX/WxCGtIutRp
	 r7Efces99R7BlgAnfOeuZjJ8JxM9aWcOWtD83UroUmEJR644pYfbXfBIiI4PTaiZ+4r+f
	 Q1UPFXhYxEFA/Cj360Zx2AxQVW8StnBZndN4S25pTpgaSv4SBUt72psbgDFOhfkusYQqt
	 VoHuCUO6baQs5f04UC1z283a00YX4bGEPeK5W+QUb/mvBMq5KygHMNo31iWjquKgMC7Hf
	 ksQaTNS/+TBQV9Kl+Gfmeh8EqJRip+jcj5DRop78j/FaZtkp1AxeWZb7HfqhJyX7iSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712397;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8lMZMIQfgxM1Y1sLfd9pmLbFTG91TDyafPfpoX4xnzA=;
	b=tOzVXbzUg8kTA8t1u1m5v9OXBji1RbxQcsT03/0kLl1R/qt+E+Bf1Jvt502zimdwAldT
	 HAA2vQz5/g1zoXDC8y5NhsH+TDmADanhsojuBGJjQQKJk6PJdIkxmtQfJWHsAyGbGFLft
	 9gJwcOYURCDj/2W0xmwblTZxy5/R/ytL3TfkdoXrO4KyLkGe6zoWvddYpPT3xgtB36R/m
	 SzTdd0ggOm3Hs1bhZ8xh+pwTwC6Xme0kWLSAzXLZOgBw1pXcRp+JGE68NsiJ4WP2CxO1/
	 zYwg77zkF6ewnwQRtlWPf2hSysFadRzeU2LliY89+dRxWZ2qPCUwa2KD5Wpb5nR0UqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.13
Received: from mta0.migadu.com (out-13.mta0.migadu.com [91.218.175.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD87606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD87606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VwdILgRNSWIPkWDn3eJqPy63I1Bwv0LiB91pK15cOp4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793712391; v=1; x=1794317191;
 b=RKUEs0xXGMHXqpldvK6xKP9OgY/JkqJguHg9nwDITmPZYbZSfAdhCDOfLqEXbyxGkw5DOJg+
 sUpJMrY5rz4yDlReExV7mql76Heuw9veg2/T3jq7KFYQjb+PtZryeX40GnyotIZJX2ts1N6upNJ
 9H01i8xwDXIYfrtWX8KekVE4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 223b7a157b0f36b3;
	Tue, 03 Nov 2026 13:26:31 +0000
X-Mizu-Trace-ID: 223b7a157b0f36b3
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org,
	josef@toxicopanda.com,
	axboe@kernel.dk,
	alexei.starovoitov@gmail.com
Cc: cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	linux-kselftest@vger.kernel.org,
	cui.tao@linux.dev,
	cuitao@kylinos.cn,
	ameryhung@gmail.com
Subject: [RFC PATCH v12 0/4] blk-iocost: BPF struct_ops cost model
Date: Tue,  3 Nov 2026 21:26:09 +0800
Message-ID: <20261103132613.1952975-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
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

From: Tao Cui <cuitao@kylinos.cn>

This series lets a BPF program take over the cost model of one device.
The BPF model provides calc_cost() for charged IOs plus two transfer
coefficients for the completion-time sizing, io.cost.model selects
between the attached model and the builtin one, and enabling and
disabling the controller stays with io.cost.qos.

The builtin model is a linear formula derived from a handful of device
parameters, and the right formula is device specific.  A BPF model can
be adapted to the device and updated without rebuilding the kernel.

The series is based on next-20261030.

Patches:

  1/4 blk-iocost: add BPF struct_ops cost model support
  2/4 blk-iocost: add iocost_ioc_tick tracepoint for per-period
      device summary
  3/4 selftests/bpf: add iocost cost model test
  4/4 docs: cgroup-v2: document the iocost BPF cost model attachment

Changes since v11:

- dropped the cgroup callbacks (the models build their state in
  calc_cost() anyway)
- dropped the queue freeze from detach
- folded everything into blk-iocost.c
- the selftest now uses cgroup_helpers: the tests create their own
  cgroups and remove them on exit; io.cost.qos/io.cost.model are
  root-only cgroupfs files and the test reverts them on its exit
  paths

Tested on next-20261030 (qemu x86_64): the selftests pass, and the
2x example model doubles the charged cost over the builtin on a
rotational device (2.01x measured), returning to 1.00x after
"model=linear".

Link: https://lore.kernel.org/r/20261028143534.135968-1-cui.tao@linux.dev # v11
