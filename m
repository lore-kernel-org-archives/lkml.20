Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794072977;
	b=uqae/mvUCLyo7gtQIjKaFjWdmxFUAkEro3k5BQ+qktFflk2INJWKolxYHYIKNLcQDLPK
	 6ZTM+OWdo8yB4n5Kk+0OLVoD+uOjnAs0K0jfCEFPdQRBNIo+1gvQKg7iYN6y3d47PQx76
	 UhYb0lme/Vx6GZdXx6xl9nwtimVDExDjllElTFvNG/uETPWEfpKdy6zHy5KvkWajnsdod
	 ubOZXOvP/kApZxXe3BdThrnOUX5Tf0DJp7jZvRSdyuxxpQI8n7/yBEPnbP7t8n+4Ngyon
	 qAigNBsBbLzLxF7tGHGH+krUGUpsjiqtVu6SHddH7j2jui7mXE838mujfoEEix2/RNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794072977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uaz4GMFw+Jwy5EdGkS0rWgXGmi0j24GaczxcJZyC6vo=;
	b=aV6D/7LQYSkOTYqY3gfv/JRxXrQ6SRkosOWUVVhQls0bOSB2XfDkjOg51NjcHIuyQZZd
	 7Ue3JvT8RvPP8O+oPf5AniUhP8TpOM85m+EXfmdnHytTWJ5cLXd41sMpOrBpBXHKD9hCo
	 qV1ufU/JpYvhJD+f+UA6HFwWs3AVUrzYy+5nZd316MCiVksRuLul715MtPeNHltjR/Sqv
	 feK7Psa6c13lwSqUqJDfrFvOlD2OS99peXKPeAvkQQ2KiC3iSmOhwwAGCNAolEzb3/qyX
	 v/vxQdTpp734bvQ8oZmgcW2WVcDF0YThgyADjX5x4015BKGYmGuo1vMvXyE0JyVB2MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWcM3yPW;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2365606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2365606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KWcM3yPW
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b70d5b07faso263238a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794072975; x=1794677775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaz4GMFw+Jwy5EdGkS0rWgXGmi0j24GaczxcJZyC6vo=;
        b=KWcM3yPWZajrCpfM4VpWQqZg+4GMoaxVgSP9O8HcY8/OlaGCu91OOFJhR/4cz7q/qK
         NX4e4d5ABbzkxhBMswufhwXOqfWPx6jeR89xZ/Q8jmgmRDV0KDvcRdFWKf2uvwy8qdfA
         ttMYxWo69+TeDef4gaUgrofO0yp+4j9djYPNKnsFTlfAd2QnniHCYPPbykiSAStHVRD/
         jPRkAhB6QGHWrWT1/pBK1imCj3qI4KYLXU78fod2R7a3TPMH0DvXqqUmYFKO9rX5aXhU
         WOcUtZxNQ48tucC/evhHOGf7Iqv3Q8bmbFnDjjfdjrTu9kLb0VohaZdzGf+Zo8/hBn+T
         eFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794072975; x=1794677775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaz4GMFw+Jwy5EdGkS0rWgXGmi0j24GaczxcJZyC6vo=;
        b=O3QjLy5UjkI6KGaQ5fZxN46fpt33JlIprTVMjZE2y5n59pbsvIGeFZOenR5QsoVAgV
         VfmRyyHe/ImpucbL6d64kI3MxMVAOOf72dAfuCt7UmuQne8lrb4TaggyICVvyvP3R5Wm
         /+5MZCHi4xc7Nd5VI48978voICtP7XDojqXnHOA7W+P/JiB3Utnrp7EK94Aj40R/yDxH
         QLJ5uEDJXBxKeaLbcgdpw/3hRYUr6JjAkT92kgniq3b6YVqlCPiXEzuMWRiZEtxoOlrF
         dqgbhiNxMAv8OtWuPO8HjZoLCK+pm3rRTvgRL+cOKWj6QNfa4BbH6zajeXgRfM3icZtt
         bJag==
X-Forwarded-Encrypted: i=1; AL+hErE3h6EzmBsIgJaTucckAegKK86dvNV77UVFHIZeOPFxfSEHo/6JDdm5ySGHPDvxWBBWw72xcKFwCjkQcJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WnVk0Ts/Ixx7BduzV+J+ub7ez3cmcuR+ttfNhTrmVIk1atYuH
	PvDwKFiOBFOqIq2lQ7iEE+7i7a4OhEbyFlqsMqnR3Ha/sExx08DUA+Ls
X-Gm-Gg: AYBFou2NW8zSPlynHfMKYXhzqejNnZ3V8axKxmf8PLHtotaUKMpyTXF6sMgiDv0GoTr
	e0Mn1h8npYXmBqv3Vy7c6jWp0+bcK3duEpnv43fx9me8M5+jOgc1xYI6lgwCUvksK8ua8MGnU2Y
	qSV+wxizBeE/iPNDgtAs3pdjw451f3+Q8sVxJoqyhJ8QPX30AkfjjwF9a/NdMJZLn7wfhHmp/sy
	aJaEt3aBRO4LNZ9wLjhP1oqdpF2Z7Ly5QrGIxgpePmfu/zIeQbSEM4TEf0YwQDk5sHoju5fdp25
	yQbXpD3hniJUOohtE5Cds4lmporMZ4YPxEHl0+7Gsgr4JpuX2CmRXpvoZORRXul8RETjcnX3lm/
	sYkGIo42v0kcgXeXCplqiX4niqZ11HfUj03obsEZ6Klv76bTLfvkaemGzOVtfQGlRKjl6Zz0UHv
	9XdzycB0/nJ0F8YFj0dPemOCQgzTVWGl2pUYM+h1NW5lZS0Ex6i0UILydff2Tbetvuk+6GhLJHL
	ZD1IhQEpgXG96sVfjW+9oeJZgPNlI6DPDlZgmu9dBQUSROtb59R8a5mT87anZXzG7Hs1GXkuvNx
	zJVysRf2b4Efgdg8h9HpiPI2FN74fiDxQOKmutgv0NtsVzOVL6s8hRFD+Y8=
X-Received: by 2002:a05:6402:5384:b0:6b4:d7fb:affd with SMTP id 4fb4d7f45d1cf-6b5977de20emr4001934a12.12.1794072975168;
        Sat, 07 Nov 2026 09:36:15 -0800 (PST)
Received: from frame (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664afbc12sm1890076a12.22.2026.11.07.09.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:36:13 -0800 (PST)
From: Elvira Khabirova <lineprinter0@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Hubert=20Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elvira Khabirova <lineprinter0@gmail.com>
Subject: [PATCH v3 0/2] usb: musb: gadget: don't flush a waiting RX packet
Date: Sat,  7 Nov 2026 18:35:59 +0100
Message-ID: <20261107173601.63095-1-lineprinter0@gmail.com>
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

Since commit 3fc137386c46 ("usb: musb: Fix hardware lockup on first Rx
endpoint request"), musb_ep_restart() flushes the RX FIFO instead of
calling rxstate().

When using some functions with musb, for example, f_mass_storage
or f_acm, this code path will be used mid-communication, and it will
cause data loss.

Patch 2 fixes this in musb_ep_restart() and schedules a bh work item
instead of flushing and losing the data in the RX FIFO.

Patch 1 modifies the semantics of musb_ep.busy from a flag to a counter.
If usb_ep_dequeue() runs at the same time as another musb_g_giveback(),
`busy` could end up with a false 1; this would stall an endpoint.
I added this patch in the series as prep for patch 2, because patch 2
would otherwise add one more case where such a race is possible --
a musb_g_giveback() of a work item with a musb_g_giveback() of nuke().

v2 -> v3:
- Added patch 1: `busy` is a counter now (addresses sashiko's
  "overlapping musb_g_giveback() calls wedge ep->busy" and
  the nuke() part of "race and ordering bug in musb_gadget_disable()
  for rx_kick")
- Schedule a kick on every OUT ep when resuming to avoid stalls when
  the USB session is preserved across suspend/resume
  (addresses sashiko's "lost rx_kick across system suspend and resume")

v1 -> v2:
- musb_g_rx_kick() does not re-queue itself when `busy` is set.
  Instead, musb_g_giveback() re-queues it when `rx_kick_deferred`.
  This new flag is set in three cases:
  1) `busy` is set inside musb_g_rx_kick()
  2) musb_gadget_queue() adds an RX request to an empty request queue
     and `busy` is set
  3) `busy` is set in the beginning of musb_g_rx() (addresses sashiko's
     "RX endpoint lockup after giveback in musb_g_rx_kick()",
     "softirq busy-loop and livelock in musb_g_rx_kick()", and
     "race and ordering bug in musb_gadget_disable() for rx_kick")
- musb_g_rx_kick checks musb->is_runtime_suspended now and exits early
  if the controller is suspended, and the work items are disabled
  during system suspend (addresses sashiko's
  "unushed rx_kick work in musb_suspend() accesses disabled MMIO")
- This time tested also on a Pine A64+ (Allwinner A64),
  which has both MUSB and 4 cores.

v2: https://lore.kernel.org/linux-usb/20261107105505.6554-1-lineprinter0@gmail.com/
v1: https://lore.kernel.org/linux-usb/20261027202744.79556-1-lineprinter0@gmail.com/

Elvira Khabirova (2):
  usb: musb: gadget: count givebacks in busy
  usb: musb: gadget: don't flush a waiting RX packet when queueing a
    request

 drivers/usb/musb/musb_core.c   |   3 +
 drivers/usb/musb/musb_gadget.c | 128 ++++++++++++++++++++++++++++++---
 drivers/usb/musb/musb_gadget.h |  11 ++-
 3 files changed, 133 insertions(+), 9 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.53.0

