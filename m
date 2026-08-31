Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1EC43A80C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184994; cv=none; b=cPowEvemcqjSr7/Q349FDybxirWLvRUfZm8y9lfHtb66dO7El1ELL4gnS+QY9yL86F33wPMi+dYqqPdBjA1b7pUN9wBTPdWxYbF1NVTrQ/MdgfQN6BfqBjC+cL292rPZttYENcCmwUqKPLpNwy3iv6LUkF3Zq1+RWtc2pcMh8rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184994; c=relaxed/simple;
	bh=uBRstAJdzOQ6fCXenmU9zLfDCyFOq7Yo1hdroUnVRwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsWuo4jCJyTnFSCHriDoWNPevzuIupMtYpIQXEpxN2OBJ7dz+BSnXhuJlaCc69Ir73vYLgU1L4EpD8H1CDHgikikGNBrz6G0DICVTPYJaSrlGM5UyqqTKY2QMkkxRfP6V93KpiCWqECbHICTlP4xiu6FH9hEXPqOTQMBbzwT3YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRk2ddqn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRk2ddqn"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so41158635e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184991; x=1788789791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjSPBLWPdLhA0verlG4+qAuqvJiAKOz1NhqEAjoTdrA=;
        b=WRk2ddqnjdJubnaEL1KMvwrP/DhXX+bnazcYR+udX4YFWOiB6xYd7EoPWweMgKl9oh
         W0wqXwp+jlv6OGvSQTt0EYHAIris2ENhbFSDk6xlLoYe4t6VsG828dKcoXP2UfS5I/5d
         ZfDutYuKkcEeayEfHPkE9pvLsX+08CvzojK89Qoi64PHmIkkWSsA6FnUeylL9Nx4fTDq
         aJ+L+Xn8JmLJ8/d252oA7iJ5otu+chZ3Z+VgkGilb5wBXgNPOCdgTjmwmlUlXN2Pp6YG
         GAFLtdMb+p8W8Q6L2mR7FwSbKsAWSQMlINR9/auYt8SZj1smfOs+dS9G9kN54iyRslaL
         cKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184991; x=1788789791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rjSPBLWPdLhA0verlG4+qAuqvJiAKOz1NhqEAjoTdrA=;
        b=nonLfN3mW9n0i2DDn4iY3gkYotU4Lv88AuNvR1/0AwFJ0B18xNgWiGxYr3TYQ8sFul
         ZXMKom5hHtxNxYUJv1ABRBF1QJuAxkGZucIybJq6whcKCguT0rL1xPNvvqxMFzhcCl04
         Qqs3GM27ksnEsqDNPb+WaO+XPWUhAifP5TSSY7yueQIYrsR8c+HYzxWsQ5wjd/GOFtO7
         8r5rfpEE9D6QP6uVsHyxVW/bf2LEwTzgXI+1RZG7hglZKnpHbvRAwdkY9PeJhnT1KA/o
         h2JoJY08KIF28SHZ60bbkJ0pQmFPOr2rGDet7XVjTZ8ONNE72oQaM+Pogjad8boZGn5/
         ZuEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp06mh4ke/NU4lZXy5/gehKra+URk7muGWqnOeASvnmq7wJZdAYrCopW1znL5ERdG8qNw3noWJSZNeaZvA=@vger.kernel.org
X-Gm-Message-State: AFuF++kzbiXOiJwnjx1kBDxNoQam8AfoB+Yxuvf6cCIQuwMRlUI7ZJWf
	wZ/bngLbsAGMBM/Hj+fi8l8TfAG8Zap18GSfHiZ7hzJoe4oa9kbRWa8=
X-Gm-Gg: AR+sD1184Rsx8noISe4DVggy7fNBMtA511pykdiS7rlwQjuxCTnxCiJlzFNEyBs7G4m
	eKaFMcrMgju+6C1DewznXzBnqqOsl75XMgiEcK/vhwiyT/6PUlKq3wikw6EGB2VUga4kqFANnwc
	rmdZ0tHs7UsGdfZzdmXv+vabcpudR0LovISikCuZuPoHVVUB3bbsG7KYjYwxyMiNyCqvDtevEJS
	5hPqPsThOpQ+wU1PuyImj9bhI/kS06ihUIfxhMQrfi0r0z0z8ah14UpmmgNSn4VE7ykTvkPHBsw
	fbvo/QAjDgbRLl6YcblaMznWW/tg5rnts8bvfD4RDbwXn5KFKGtEvMmnaSY4bCfUTFmeth2QBnY
	+cZtCRe5Nyc/GoHOAOzgBVye9VHeAsMknh7ZugOr8vDkATfiwgT8QcnxSEgVgQRKJFZdXVcfcRD
	P7SmIXTeBQ6BiBht7fJFCEvcxc47yDfAvbBFtUrRi9f3xE9KFHHmIHk8nWUWiHcZMtyDupXfyjU
	9ICLqKR16I7xxRwNx7C13REnz8PR4zAnE6grdpiNPxFZvXV6vz+4UE=
X-Received: by 2002:a05:600c:4e8d:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49cdadaf6c7mr15081095e9.0.1788184987289;
        Mon, 31 Aug 2026 07:03:07 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm173851415e9.2.2026.08.31.07.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:03:06 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH v2 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Date: Mon, 31 Aug 2026 16:03:01 +0200
Message-ID: <20260831140304.45940-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831094257.29398-1-dmanresa@gmail.com>
References: <20260831094257.29398-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v2 of the ipu-bridge rebind series, addressing Sakari's review of v2/2:

- shortened the 2/2 commit message (dropped the cross-reference to 1/2
  and the IVSC/VCM elaboration);
- dev_info() -> dev_dbg() on the reuse path;
- replaced the free-text AI note with the Assisted-by: tag per
  Documentation/process/coding-assistants.rst, in both patches.

No code changes other than the log level. The v1 testing stands: on a
Surface Pro 7+ (IPU6, OV5693 + OV8865 + OV7251) the PCI remove ->
module unload -> rescan -> modprobe sequence, fatal today (-EEXIST),
completes cleanly with the series - twice in a row - with all three
cameras streaming after each rebind. (The same sequence with all sensor
sub-device drivers unbound first fails identically without the series,
as reported in the parent thread.)

Thanks,
D. Manresa

D. Manresa (2):
  media: ipu-bridge: don't reference the module image from software
    nodes
  media: ipu-bridge: reuse the software nodes on rebind

 drivers/media/pci/intel/ipu-bridge.c | 38 ++++++++++++++++++++++++++---
 include/media/ipu-bridge.h           |  9 +++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

--
2.43.0
