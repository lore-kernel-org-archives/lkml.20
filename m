Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5746851CF71
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804859; cv=none; b=pa5CJG0V4uwf1h7WInHxzXsxb5n6B97Vv58BdpanzI5mInUbOKvgbBjfDB7eCtJrMh7XnLnJo+2LpYUfisZQPJ/tSupHngtQoSUdhk6TSgCnICCAItxU6XfsNxWwMj9QLFV44VXXi7OSjvgee/N81IYZZFCCgrfS1L8D8ohgyoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804859; c=relaxed/simple;
	bh=6ydAku9BAiQpEXGfpckD0JO/GBQObyMhMjDB+2Kpxsg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GYXg/SRtmQkdjkoU+oIBMh40E6RgwOQzRVtZxquHaykG5msqZxM80CzO2k62eC3JziTskiGJFhSaTdCAGaXfhZz186i8o7fvbOmDB9k5PYAHfSI6RkQg86lnNpS0bXY77ZsI67hRS+7bjPThNoGjZADxeDng75PA4KzjK9S5JoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dGtyZUOh; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dGtyZUOh"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86b4048367cso6531454b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790804858; x=1791409658; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpS4Ij6gaLgbG+enJW/FVoPzOHJGjU08ieLP+6pYjbI=;
        b=dGtyZUOhO+v4cZ2pIa93A6i4yebZruNbqVef8Z/Z5sOz9vgj8nfghtCexDh3iGMSQ1
         h9EK+upRaw/BQYFvNAThvVzZVk6cmOFlXRunftphplkQC0FnksY8E5b2YnLp+xPoqQls
         o6UYco9+qjDD5/BTKhTBQutNTLfLI02G6YkuQHGXk0V7RM3qdsLMuWPjx0vlOU0whrwf
         25CesYxUyoFftnEAt0qxGQFQ1em0hQYllQ0r2pot/tmKk4XCra7U2JTVhpZuaQ/ZpnrM
         cOaOT9Fv0f16CeGdP2LCMZYZxZV57ceeWCcw2Kpk5pQqFlJRlrssjZPb6EgXf+7/b3Cr
         tSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804858; x=1791409658;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpS4Ij6gaLgbG+enJW/FVoPzOHJGjU08ieLP+6pYjbI=;
        b=k+U0A62g9TFLr6gU584MWjdPZLV9eXzHqv/7il+m8TCA6fwIF7p+uubvipqSrI/0fp
         SF+WdOKHGROizg7S5U6Q48jgbiLfcmvJa8CxrZmDo1xb618uUY/vByM2rAPZfSVUBpNh
         MbMKjP/pn2szcIGmSHfkD5xiMtGfTLRdIj9yafSmsFd/tn7uSJVc7xAur8jmjCIbjT3M
         +6dP6k6VovB9+f4Tux4HgpcGIyNhqWcSn+89UVgLbkejORfayXnMuMwQEZL4ro9ywtRv
         pHWlHlkGU59gi54btDHInle5eJ0CFG75S89yTYn9EyXgUS21kEnoeU92F4dSP8dqpqzo
         Gogw==
X-Forwarded-Encrypted: i=1; AKwUvBwV134V+/i4Lh2GNeF2yWMcR2jSlSYL2b7hayVcLVNIPue55l3WSZPXn2qrAV117N/3AXIfLzRCDfEef6M=@vger.kernel.org
X-Gm-Message-State: AFuF++l3OHrryj6RluBmSrnV6c5olqDirPhifcsHjjfZFWN4QsxpqB0+
	QusQasVB7ynMCYs3ICneb1gJ9LDz+eC9brw4rc2w9MdxkeSnFDsahbyM84f674p79G+k9FlVNH5
	TH8HCg0SCvjV+1Q==
X-Received: from pfbmu12.prod.google.com ([2002:a05:6a00:6e8c:b0:886:8875:ed09])
 (user=joshwash job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:9084:b0:878:34d7:697b with SMTP id d2e1a72fcca58-8874cebda9fmr1853968b3a.41.1790804857384;
 Wed, 30 Sep 2026 14:47:37 -0700 (PDT)
Date: Wed, 30 Sep 2026 14:47:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930214735.3288780-1-joshwash@google.com>
Subject: [PATCH net v3 0/3] gve: various XDP fixes
From: Joshua Washington <joshwash@google.com>
To: netdev@vger.kernel.org
Cc: Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch series consists of a number of small XDP-related fixes.

These changes are split off from
https://lore.kernel.org/netdev/20260922194533.631387-1-joshwash@google.com/
in an effort to prevent blocking relatively simple fixes on more complex
fixes that will need more feedback to merge.

A summary of the changes:
1) fix an issue where XSK buffers that have not been processed are
   leaked when disabling XSK pools
2) fix an XSK buffer leak when an RX error descriptor comes back from
   the hardware
3) fix a deadlock introduced by attempting to acquire the netdev lock
   after it has already been acquired

---
v3:
- Remove the more controversial fixes so that simpler fixes, (the
  deadlock fix in particular), are not blocked.
- v2: https://lore.kernel.org/netdev/20260922194533.631387-1-joshwash@google.com/

v2:
- introduce 3 new patches (7, 8, 9) based on Sashiko feedback
- corrected stat counting for packets according work_done behavioral
  change (patch 1)
- v1: https://lore.kernel.org/netdev/20260814234845.773189-1-joshwash@google.com/

Joshua Washington (3):
  gve: fix XSK buffer leak when rings are stopped
  gve: fix XSK buffer leak on error descriptor
  gve: fix napi_disable deadlock when attempting to disable XSK pools

 drivers/net/ethernet/google/gve/gve_main.c   |  8 ++++----
 drivers/net/ethernet/google/gve/gve_rx_dqo.c | 13 ++++++++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

