Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7405A44A3E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302336; cv=none; b=O/ags8yhmZke6O8TRt4L42hR48EwN2B6A0VQ1CutKhyKbOCpo/19COkuq3uX4LVMpIcDukwkWddRPeqTQbfVgNkhXJL2nSdnD6/2/W4OtLghbskIgCJUl4Nyfa5ha8tRr3sUkVczLbn+vd1uamgftL2SSYJqDKvh7PYcWpT46CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302336; c=relaxed/simple;
	bh=j9UQvDhnTz8iWLmNRuA0DNH2ohcjBp5KDNWd4xaepTk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mjmtLTLFNXYuHmMEIQm3zzsEWeH1HtSoET+ZNsLxXrubsiHdJ62ubto82yYXoI0KAx8/vCYzvuiFxjMkoffxibJ3t17cooF/NdArYZxRgGOd9bfctvARyH+El1sTkn+fzpgx//AaZihORCZrgJ5w+dmVPftXBq+5COnFgjXiKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Edw8m4fG; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Edw8m4fG"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-396555b8c7cso50307a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788302334; x=1788907134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZmM4o6AtfOjzX+lBw9oMlu0125coIi3sG1O5FhkJfs=;
        b=Edw8m4fG5qQfyrjoJMzGlj6O9Ua8KcqvaH1S3y/1D4YvNdQLM+RhOy6gd/6MMGQm+V
         RymL+gsqeJ7GdgSEHkplICxrK1+PG40UXkSZjYuKxbrHZSAdhkBLbPsC8Bj1dWCR2fuF
         v4kCJ/jhfVGqUJruZZc3K2AklQIsk6eNthSnHK5zVHJdvGC9BgCthCDKxvw+zjin5EmR
         /KsPVyW6y+KfrceoJh91VX/Pr0LKE2yqm36YZQaGlO0ZIbTmXLaDCQcqfndwUCGFc5VQ
         Ld1lpzv34Yat96DXwjg4mbvO2d2Qz1T19l74DKL/+z67cF4gqet8wAZn/F903s/p1Hc+
         wTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302334; x=1788907134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZmM4o6AtfOjzX+lBw9oMlu0125coIi3sG1O5FhkJfs=;
        b=VG3m8QXPjLdgGy3kenTj8FNXK/HmyDXZkVAaTnks15HqTIHYI7CGcxdX9f31Rr03+P
         ZBICsiYGkaQdabIf3w/bx/jfixtL1Mu17VC7HdVe26PmQeOLlnsbIpKgXzqVZMuCj5il
         oliKj/FdBOA6m4jNbqtREwZ6cPSHDcYGHsk2QMawKujMwy04yI18b6bPyU8D9SiDGZK0
         hVyVumQXKG+qq1URtlz4GNHiih5ia3JVXtAR0fLyx9tkq25eJiC1DfeehKsl6sTPGdrU
         UmNo59qMFDnfkIfJY0iIIv5gOVghGG0SID7xqb1wZksUAdLNIlVu2JZZr+vrmbXD69Ss
         ax2g==
X-Forwarded-Encrypted: i=1; AKwUvBwHOfS6+TO69GKDjY/ROh535ARlQ8X42MkRnPiFaw0nYpJ7oryhTRF2RiO6w74Fr6CH+eCjrdLO+Dvec74=@vger.kernel.org
X-Gm-Message-State: AFuF++n2iiv1RLmHShsOePwBzxunlSUf4Bqxn/8jY17TQnkQQCo50zks
	GJykBakr2upM9NCqcVo5uLnvywywjtN/opuvN6nFPTg43w8K7NBC0JSO1rOVOCI078xazvOYA/q
	HTex4
X-Gm-Gg: AYBFou1H2+y8beitgPZrHspvl3+G21tzse1Qjyo+E0y+u/XeGXJLDDrs+2VWlWEs1Qw
	pIttl5gOkQGuI+PMOO9ZjQjN/ywzEZRIrT6oIOmfPl15qBPB7u1Hrq23L+abSWMRLmzIcdeJiik
	0dTCWpqR0HjM5A16hQWhn0GJr9LN+3n1sgMaYMS2wkIjCgikLOb+JrQqGnK5DN+kKyTjMIzo/28
	fSJ6bGuXt+WllGrVkP2dG8twCT2ZceqmghYaG1VQXWn3sHLLwvxpcpeSQK+9WHbENw3o4yOM9w/
	+2Axns1Air9WQdLNY0Anaecbx6gq8RI9/NiGPKnMLoFzpdGaw6ju6wlXGA/51fuTjMlAHtCh4hY
	KPQpKAVVrEB0BCu3HhsY4PeePvfeJYiTBimlsBYC9eqxt35n4qAeLf6gFF7lwx1LR2od/qLrms7
	qhw/R5btWixPHnqw00uCFqUYy6VCyKdaj61eELD+GVmKn3yrk26Xmq1yVuBGeSB16ftgTFovvPB
	7xhVoHiBp50mtmb
X-Received: by 2002:a17:90b:4b8b:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39aee1c6d08mr164366a91.4.1788302333643;
        Tue, 01 Sep 2026 15:38:53 -0700 (PDT)
Received: from dev-cachen2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-32f07baa594sm1453891eec.22.2026.09.01.15.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 15:38:53 -0700 (PDT)
From: Casey Chen <cachen@purestorage.com>
To: linux-nvme@lists.infradead.org
Cc: leon@kernel.org,
	sagi@grimberg.me,
	kbusch@kernel.org,
	hch@lst.de,
	axboe@kernel.dk,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] nvme-rdma: fix ib_device removal race that hangs PCI unbind
Date: Tue,  1 Sep 2026 16:38:09 -0600
Message-Id: <20260901223809.2346699-1-cachen@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831221355.1715088-1-cachen@purestorage.com>
References: <20260828232436.270184-1-cachen@purestorage.com> <20260831221355.1715088-1-cachen@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 31/08/2026 16:13, Casey Chen wrote:
> The ->add path is new in this version and has not run on the setup that
> reproduced the hang, so this wants a fresh soak before it is applied.

That soak is done now, so the caveat above no longer applies.

The test bounces both mlx5 interfaces carrying the NVMe-oF RDMA
connections, one at a time, with IO running throughout and a userspace
daemon reconnecting the controllers:

  ethtool -i <iface> | grep bus-info
  echo 1 | sudo tee /sys/bus/pci/devices/<bdf>/remove
  sleep 30
  echo 1 | sudo tee /sys/bus/pci/rescan
  sleep 30

30 iterations over the two interfaces, so 60 remove/rescan cycles, with
60s of settle time between iterations - roughly 90 minutes.

No hang with v3 applied. Every write to remove returned, the interface
came back on the following rescan and the controllers reconnected. The
->add path is covered by this, since each rescan re-probes the HCA as a
new ib_device and so goes through nvme_rdma_add_one().

For contrast, on the same setup without the fix the write to remove
eventually never returns and the task is left in D state with the trace
in the commit message. It is intermittent - most removals complete
normally, and only one that lands while a connect is in flight strands a
controller.
