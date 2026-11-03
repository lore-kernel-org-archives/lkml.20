Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723011;
	b=SFHZO9wed+by2Dq95ZRjS6HPlazUm4fdjRHXwjKNh0Co4jAlIoGI22Hw9Ab8ot2qI0yy
	 or/CUwDuSCAGgqFwWUegw8o6a7aZf5ItNCnDJSyPcqowYasyoQDBAENKBsZ3J+364ArD2
	 V7yYXScfES0qm3jPxlmOb1vnreIj3tUSwUaOpySFtY2GtddkXFZ0hys1E/Fbg2lhKHQyS
	 0B6L3IrXvBhsk3QqYKtrKglNMCYiiyd5Nc40TRcvkOkooOzEvpEeW+f08C+J/HefVBYZ2
	 Bai4BH6kVq0qFK2ZiECAECo3Hdqmh0NY0zTxGddOdZeqiHXxI/vNIe7sIGjNxpqAJ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=siM8Df/snDn0jLC7QUxpaD63oeFqtwGPtlZ0Xno7Huc=;
	b=4nwYODRl6+EsWgb472urtHIAVIMa2iqZCm3e18k8S3JXxB7e0BhzAl4mar6O59h9O8N/
	 pdV0anv5JfmeAiVMQWljCu5OFV3W4/Y8Qom3ZDjXt0SWwP1jYWYmo9GpQ15e+8rVieVta
	 C2M2FebBkaZ90iBO2lYf03hzMwEN0bRr3jX7tnZHh+3R9Ovzty11b6kAAzaHUjOiUqY5V
	 0baLgNU6JqkbzdSB1XP5zNWaXdh6sKx4iAXVoYOUQSDc0G31q/qO5XhRAKOBFW1x74/rw
	 PFqWraTq4BDO1F0Gd7BUK1oZZqhxpw2scKx2lhEPFZZf8LO9ca/hq45/fN8Btid+qXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D8imWgDf;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D211F606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D211F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D8imWgDf
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1e00100eeso5216246a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723009; x=1794327809; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=siM8Df/snDn0jLC7QUxpaD63oeFqtwGPtlZ0Xno7Huc=;
        b=D8imWgDfjigOJiw/1+h9P9edKVLjzbE6UNEmMHzg16OwaNOXW08/3YpkEKn50DXLz/
         7pBfmEaGt8Uphk76TAYdefar6SLw5dXS2fOmoARz8mfU9dV6ncwiLJO7WXlUvvvGbXZ2
         jItwmvV8DrZCmxI1CwiveXttySCbapbR7sQgdkVQiNOAHzCNZV2DjULEwssYxngz+FyP
         pXHQu1qHMOABPGjK9YEhnrtON5/lzOZuELpBr8aue+wWentDABr8484tq0BFLcqe+RKG
         lvqs0iEYctpX1RUhOab2vmQuTS2/pqre4roN/oP+BSz/cWoR+k+973fL048trOXlA3Sc
         DAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723009; x=1794327809;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siM8Df/snDn0jLC7QUxpaD63oeFqtwGPtlZ0Xno7Huc=;
        b=yZWBz6AnZ4lALnaR+9V6jwln5a7pn/jt7dQNwZUa+eAb+14JfmfmH0+op3NjusczOh
         fmXNHLFaJBA+pgfpmnc04nWomwsy+D1vGcomm/zzGCJ7nAmXMIBW1W2Py1Ct4ZPToLDL
         jm6CLl67G7TBpVk6+QwjZlAt9cq88mU9CUHrOUmzZbd979SAMVWV5ied4QzWLsmwedOk
         dc7anW7x9UKBy6/pJg7Q78hn10QUU1mmYAQP7Ywb/CV1k5Tbv1OvKjAMHqoPr+EVsGKm
         sxxX/oSVK2OMk/JyqcKQi5XroIgsr1f5JxScrftquJnhNwG6y0bN+k3rq8/doNQbH+hf
         DIOw==
X-Forwarded-Encrypted: i=1; AKwUvBwbV9m08MqKLCMqXvFarsHGKl4lr1ReAcugjja2d9ivDaJQzpMxcNrt75ItlgTLiQNZ+EVhLqIUzIUQdag=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VhC9b7FcyzIdW6ncpXmhCYubMyub0n4TVNxNKGqyvpm4q7jDC
	5NUWNcyebYcttiQsgoNMJbiPk/x/WhgrBIHVxKwbRsRHZ3u3OomF4X69VFjRmyspcsuevUmvRJA
	25vCe1w==
X-Received: from edj17.prod.google.com ([2002:a05:6402:3251:b0:6b4:21ae:bf65])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:d313:0:b0:6b4:1d53:519e
 with SMTP id 4fb4d7f45d1cf-6b4d4d80728mr6622485a12.40.1793723009040; Tue, 03
 Nov 2026 08:23:29 -0800 (PST)
Date: Tue,  3 Nov 2026 16:23:23 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103162326.3615979-1-lrizzo@google.com>
Subject: [PATCH iwl-next v3 0/2] libeth, idpf: use GFP_KERNEL for the initial
 Rx ring fill
From: Luigi Rizzo <lrizzo@google.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Luigi Rizzo <rizzo.unipi@gmail.com>, Brian Vazquez <brianvv@google.com>, 
	Joshua Hay <joshua.a.hay@intel.com>, Larysa Zaremba <larysa.zaremba@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

libeth_rx_alloc() always allocates with GFP_ATOMIC, including when a
driver fills its Rx rings at open or on queue reconfiguration. That
fill runs in process context, right after page_pool_create() and before
the queues' NAPI is enabled, so it may sleep, and GFP_ATOMIC is
needlessly restrictive there: it can neither reclaim nor compact, while
the initial fill can allocate tens of thousands of buffers across all
queues.

Patch 1 adds __libeth_rx_alloc() taking a gfp_t parameter and turns
libeth_rx_alloc() into its GFP_ATOMIC wrapper.
Patch 2 switches idpf's initial Rx ring fill (both splitq and singleq)
to GFP_KERNEL.

v3:
  - rename libeth_rx_alloc_gfp() to __libeth_rx_alloc() and put the gfp
    argument on its own line in page_pool_alloc_netmem() (Alexander Lobakin)
v2: https://lore.kernel.org/r/20261019210604.2433620-1-lrizzo@google.com/
  - split into two patches (libeth helper and idpf consumer)
v1: https://lore.kernel.org/r/20261016151835.2500807-1-lrizzo@google.com/

Luigi Rizzo (2):
  libeth: add __libeth_rx_alloc() to specify allocation flags
  idpf: use GFP_KERNEL for the initial Rx ring fill

 .../ethernet/intel/idpf/idpf_singleq_txrx.c   |  7 +++---
 drivers/net/ethernet/intel/idpf/idpf_txrx.c   |  9 ++++---
 drivers/net/ethernet/intel/idpf/idpf_txrx.h   |  2 +-
 include/net/libeth/rx.h                       | 24 +++++++++++++++----
 4 files changed, 31 insertions(+), 11 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

