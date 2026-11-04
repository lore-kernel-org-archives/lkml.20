Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793773850;
	b=ciX7YF28SihASOqxqpG1+5WVyAXB0tXEdGvZp3vODmkQuxhozyjuClQPcHl9BRAyczEw
	 F8KMkV+vORLZkmx5xLQ/f6g0ScIKOTZIWI7nKPmB7Rbt8oQU4vTNEmEi7lBXsPaQT7ODV
	 MbnH4/Za03aMVMS/rycNO2AwaZz1Iyb9XibCwLXHEurd78O8fLcMAi9TJees4+rJElZtG
	 leN32UQWo1/m8aC2hwik3YSvPMhHVKXPD1HymSnys55yOp20vVVJxqtY4Z4/dgELAzROb
	 aogUOil/7+YZlMgEcCRQuseLhDkVvlZ8v8sLdRlo5YDMB4+/b+3x5K9bm6f8WszBKOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793773850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=Mw7VJYnNekK0b04jd3U00XO5v3TzXJogPpVwvYNW6MM=;
	b=RqNbO7t/a44maMT9G0m7CIB7YEnmae+Eg0GlFFRjYX7x90D2V5tllD5tFBlmAWcIlbM4
	 CF46kgV6qcbsGYkCBm96JjVLYUDeFialwg9PslYOoY65H6OKoKjmTK8FZJLH8/g1GS2+k
	 byeM8Hzosw/5tPKAdu548B4AwAGrZoKwcdrKCGp/bZZazJKapcRMqvmENrWDwnYJwrS+G
	 e8qzFsRnl0P/X9cN+V2/N+OqOkZwGinyxrArUOnUyF5BQD+WN9AkIXrJimZnodWeYQXJW
	 LynSrVbLr905FdvTjM8h2/JtA62s7vcfGSNe8zziPe/5/Sne4gLgqft1e3ibRwD+/SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ge4DWC8p;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C90A606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C90A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ge4DWC8p
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b1ce85287aso363016c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793773849; x=1794378649; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mw7VJYnNekK0b04jd3U00XO5v3TzXJogPpVwvYNW6MM=;
        b=Ge4DWC8p50yuM6BE+AoH2DbZIelL+VUSCXwsaeYpNMsz+PTDS5TIsx+Ou5S/TgXiVh
         6D1P5MbAyNcBV/bo2HUR2y0Z2ydBXauksnTzGC4WhxPaQnLcKMmyBGjQ5ZioZiZwuNHj
         4fTdv6uegGxFf6rKf1KgtgcPTKrMsqB+91iNX0TORH+nTrFBoxsWLGRnTqWPh66cEMIY
         VcewTJ3nBkopOLEfJa5O66Jd0tDdAcIpxqQdbD76B+5sST3paZaHiMlMNqZRRXjreAcs
         6NsKlfG57u+AzUzzqLvdXv74xIlgnbYpc7EgvHfRGjn2ILvxfoD23xNW0LCUBbnwwMgW
         zk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773849; x=1794378649;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mw7VJYnNekK0b04jd3U00XO5v3TzXJogPpVwvYNW6MM=;
        b=z3pPdoHzhMlpxmJopOyHovMEsabhTgECJiwL0nUAnsCJHgCFqDvP/Ly/MMmLQxnXYP
         hWvpCCVSeMBtoTrVJ/MtIGhbFtGn8xprvQQYix+SYW+XSIR/oo852nSN6Fg/WqLYOand
         J5A2V4w/gjODTlp5VXrm+1zRujUYfem6jawswnfnBKqR0kRJT6wAB6bhTIPJGrt63WeZ
         uLXvZZ2I+lWeNI0ZCXl2oKGWry3rnL92T0nbuShvSFRKQVFnlXUJJvHmyvNTjSBcz6zd
         +Ln6BK10qMTuYrgiu0XRIDP+Rs2si1VUZgt1TEIfnpfyOiZpCZWgZA2bPDKlSXhg5Rue
         tmzg==
X-Forwarded-Encrypted: i=1; AKwUvBxb4lowI2xXflx532V+3JrDEFO7h4TQ3f/2Ler6ziso648GR0UVkaMkMaF41I9G4XrJn5XpPOv0xQXDX+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7fMxPatJn0jOy0ZtVgnak1BonBayhBTOWhi9qlDNHrIItSZSv
	DTpRTfOB6b37T8f6R7KD941gXoK6swv/P/s55EZdwb7gcw/NCkeeUudTtCou+X62K8FuZw==
X-Gm-Gg: AYBFou2hYoR9pqv3Ww/Am6V6l55YkD6PhfGBmWrNhAuYfI28Ce3Hdag5jPb+ONNcfBJ
	ZkcQ7LFoJyOajuvI8a617SvG8xgFLRyAc4TNJwOtUJ6Yhtvq6hapmlrGJQvbgMSNawZJRR5EKxB
	p+qPSdo1DrKbGGrOflJV9xYaZ1Hr460zNoSlKD3H0p64WdFxwApI8ivV2Izj2MppmZWCgFQx5JD
	9zddkuk/f6DoVDEYeC4w5p9WYOZXgFU92v2rjHSE7TMDTqejXot2f1tGpfIeH8c8/WaEkA+8enP
	ZonIiFROLbv1FLwkD6l3UgYdWhKcAoNzwrZj74kgiQN4h/m6te7sPyDAH76i+yeuZo+jKXETjCR
	IZXUcFBU39tkE9DEyEaXb/7UmSpwroesC0tZHcXr17GMVr6vNoi9LNUb3w0t1ec1rRfnSFP0RQY
	pq4H8ptq857rBQeGcaOQIAX3C9L1DmqLvlcWFqH6uIOYyz4d37DCYHuKxBcYn6jqIsHpM0VTL05
	euHgB1eeWFQN2FcEiP6xocxvCbf75SkidekKyuZLCu2cxt6CKMHBjQZP8xt96CBJrRRsIu4sZfv
	j7kKAd88q5pI+llqm2xoxTKn
X-Received: by 2002:a05:7022:158a:b0:185:869a:8c64 with SMTP id a92af1059eb24-1ac56ca0239mr24721522c88.1.1793773849198;
        Tue, 03 Nov 2026 22:30:49 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c65194sm4454290c88.19.2026.11.03.22.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:30:48 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] nvme: fix removing namespaces under SRCU readers
Date: Wed, 04 Nov 2026 01:30:38 -0500
Message-Id: <20261104-bug-nvme-remove-ns-srcu-v2-0-feb64ecb96ca@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7R6moC/3WNywrCMBBFf6XM2pEmwT5c+R/SRZqO7YBJJLFBK
 fl3Y8Gly3PgnrtBpMAU4VxtEChxZO8KyEMFZtFuJuSpMMhaNkLUEsd1RpcsYSDrE6GLGINZsVd
 Tp9uT7kcxQlk/At34tZevQ+GF49OH936UxNf+mupvMwkUSFL1dddOjdLmMlvN96PxFoac8wcuk
 0/JvgAAAA==
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

nvme_remove_namespaces() splices the namespace list with
list_splice_init_rcu() and synchronize_rcu(), but the list is read
under SRCU. A reader still on the last namespace can then walk onto the
on-stack list head, which KASAN reports as a stack-out-of-bounds read.

Patch 1 adds list_splice_init_srcu() for lists read under SRCU, and
patch 2 uses it in nvme. Both are needed for the fix.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Add list_splice_init_srcu() instead of open-coding the splice in nvme
- Put it in srcu.h, as rculist.h doesn't include srcu.h
- Update the numbers from a new run, median of 3 runs per boot

v1: https://lore.kernel.org/r/20261103-bug-nvme-remove-ns-srcu-v1-1-e239087d63ac@gmail.com

---
Qiliang Yuan (2):
      srcu: Add list_splice_init_srcu()
      nvme: wait for SRCU readers before splicing the namespace list

 drivers/nvme/host/core.c |  3 +--
 include/linux/srcu.h     | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 2 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-bug-nvme-remove-ns-srcu-93d8a75a9b1b

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

