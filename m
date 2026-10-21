Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595289;
	b=hgSFDRydeVd3aWyl/0vv0Z7ZOAEM8SEFMxyZ4rRWRgqAcAzlTUklpi19AkQqA7l1uuWx
	 pTNviVa2natAeNYaMgu2CwgElbjrA0ojAAsA/gAYOxCShkhsMrl8cAQPmSExY71L50aTD
	 2qLATU0NfQWXr9x6cMaON2rRx/zstMq3aoQjmGAN4h92YHX/246aDLw8njNpvC1aRh+G+
	 IsyCxzLDmKv8fF8CUqZo08QswzzqpbQRWKPJ7E46QuO8iwrXoxpTBpfsy7+c+4lAj+t4t
	 /0vTKlZeggx8ByKNzzswDMbuX+IcYhzZYswNQfd5IeCQzZKV6pR4g4hSU73lnhEyl8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=60+aLJkPR4YWegHTCgfpjSiZEIO4fqrwRh1gtixdgrw=;
	b=ebahJgX5NpzDtjmMVI7Db86c4e0VS7Q6Llz9/aTkfN1wct/2mK2ISihax90UdRcqi8FM
	 MmJuhB08bUpT69dkaKC56gobIlmh+wEHmmcrzZx0cHnsHUoY/OkGgJqp18ROpVJKnvQcK
	 inOgnt2oYRgS+8m/d/b6pvEsdaQKQHgKCqkVCAAqr4YCiBATN26WSRDHxDudtLRIZxtxP
	 pkvXobmCtaiRFDkEXrU3hSyGrdx4ei0sR0kzUphUM3pNEjfYr/+ev+eMvXkudMLlX3zTR
	 lu+6EctoU7wEpO3LetzP4eMNAm04Vosub9Tm4nzC6mJV3IobeiuXH2lP8RRUjgRRjBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nZdPsMwY;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE314606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE314606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nZdPsMwY
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8490a7d6696so511585a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595288; x=1793200088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=60+aLJkPR4YWegHTCgfpjSiZEIO4fqrwRh1gtixdgrw=;
        b=nZdPsMwYAC0lDw+E+CCxWUq+R8F+hRu+j9rpKUHSrA1H/LgV+UV5lyUdwCZ10kfl5/
         EG+1/ClCIWRNCcBVzjniqo18h+Eq60wHV1fPnBZdRXCzN6y2rvBzAMBis310HRART4NY
         UZieC6ImFdXfnCiCuhtIUk9d9pJqjTEpHPkXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595288; x=1793200088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60+aLJkPR4YWegHTCgfpjSiZEIO4fqrwRh1gtixdgrw=;
        b=2bogYGDPUR3OtAhWnDAL5+upxm+mUK1ELlkCq22KHVnFr1f+T7qCC3TuWS8LOGPuWA
         4qjt4gcoGKsyPpTJOMovEzGRs9XGyhh+czYZd61ImsmKFXbvQcJHSydvHtg3YqThZNYK
         Mkui0V6lYR44BZ6qZDkXzAHk9EJYqN0O5zzSGGvyAVqypeADFa4cZLAjwvFuWE515vgV
         SAlDa8po2Xg2LEaQXza0TcfD7gg5Ice6nD1sWTXsKOA0UyJr82Rrs8KIRj19HiyTsLR5
         rgmnELUhZETfIc7gmfua1zqnvVzokqfgvB06Jg4l1RhKWwXfF/yDBJBoPQUL5Z2nrXHG
         5NAQ==
X-Forwarded-Encrypted: i=1; AKwUvBza+hs6OM2WQRHOYYDaExQNpbfZWFp4MsLZ5DHFc/koz7ZbxZMJt6BAgIpdXn4G+IA66pnVywJgdlpcUU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKspPTJpv14R0AJZOoFq+Kz8oVTGP9GLDURafuIPujrOZzS9fON
	ORBUkUrb7f9MqHQI8AirABbHM9VLt2sB6/4UBbjyryD9q5mueoJ2UO1CNqnsgnGxPg==
X-Gm-Gg: AYBFou126h0LjHKi+2+pGf78S6YChNeuGbU8EV6Be3Jg68BW59urqloxjGX6I0teiFA
	u3mlEdClk9QyM/5Nch4DQB8LwNiJk0uh7LEh2iPq70J9sFlBhcUUg5cotnVBw4JKRcqIUcjflU4
	zOhcukpwuNdWOKasMSJnmI5QGg059A8DE5bKSu9ZMKN9pbmSymbayjaj5GfTlwHHaeBw9niAMiv
	v8hAsQLkhAVugylsH+3XOG4rJQj14KxCCM7hMsohr7tgTv3uxeIkawPDwE41n//QKECyRtyn0sn
	91LuuXmisGlCGh2USep6895Yt65msEP19V4XBqpzFsnjulgG6Mr3UinpDmPzwAaengv9aDK0QUz
	tViep8bzuzmaukZkJMb7skO6zmJBZPSnuMK2sWKlR11gk1yDAlD1eWVTG2eOaTK4vHdDXDzvYe1
	+eSfEtADfUFpoxN1UYakYEmQs4vbDeQgOxOWqT/eGpDwAI3K2nqpvzKtbKqy1dZfn41EWI6f8ZK
	L3yWbOfRkRitlxwGgLEtywHUF8UydTaA6E26CdZQEgBe7krZX9sE5jRcPMK0QJsmijLKFr5ABoD
	XIPZMnsSNS7pGqUyn0rmHmeHp7qXF2MwN+fePQ8obH802g==
X-Received: by 2002:a05:6808:181f:b0:53a:6769:c35b with SMTP id 5614622812f47-553597021ebmr1486139b6e.12.1792595287778;
        Wed, 21 Oct 2026 08:08:07 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:06 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>,
	Anirudh Rayabharam <mail@anirudhrb.com>,
	"Brian G. Merrell" <bgmerrell@novell.com>,
	Suwan Kim <suwan.kim027@gmail.com>
Subject: [PATCH 0/6] usbip: vhci_hcd: fix URB giveback leaks and disconnect races
Date: Wed, 21 Oct 2026 09:06:55 -0600
Message-ID: <20261021150704.3129446-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
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

This series fixes a set of URB lifecycle, locking, and disconnect
teardown bugs in drivers/usb/usbip/vhci_hcd that can orphan pending URBs
and wedge usb_kill_urb() and usb_hub_wq in uninterruptible D state when
a virtual USB port disconnects under concurrent transfer/unlink load.

Patch breakdown:
  1. Protect urb->hcpriv accesses in vhci_urb_dequeue() with
     vdev->priv_lock inside vhci->lock (matching vhci_urb_enqueue() and
     the cleanup helpers), and add a !portnum || portnum > VHCI_HC_PORTS
     bounds guard to both vhci_urb_enqueue() and vhci_urb_dequeue().
  2. Track whether an URB has been moved from vdev->priv_tx to
     vdev->priv_rx via priv->submitted under vdev->priv_lock, and
     complete unsent (!priv->submitted) URBs locally in
     vhci_urb_dequeue() instead of queuing a CMD_UNLINK PDU. This
     prevents vhci_device_unlink_cleanup() from freeing the unlink entry
     and orphaning an unsent URB on priv_tx, and prevents CMD_UNLINK
     from being transmitted before CMD_SUBMIT on an active connection.
  3. Clear vdev->ud.tcp_socket under vhci->lock and vdev->ud.lock in
     vhci_shutdown_connection(), reject vhci_urb_enqueue() once
     USBIP_EH_SHUTDOWN is set or tcp_socket is NULL, and drain all
     remaining URBs on vdev->priv_tx and vdev->priv_rx in
     vhci_device_unlink_cleanup().
  4. Move the URB_DMA_MAP_SG clearing from vhci_recv_ret_submit() into
     pickup_urb_and_free_priv() and also clear URB_DMA_MAP_SG in
     vhci_urb_dequeue() and vhci_cleanup_priv_list() so USB core does
     not call dma_unmap_sg() on unmapped scatterlists on any giveback
     path.
  5. Allocate struct vhci_priv with mem_flags before acquiring spinlocks
     in vhci_urb_enqueue(), and return 0 (with VDEV_EVENT_ERROR_MALLOC
     triggered) if struct vhci_unlink allocation fails in
     vhci_urb_dequeue() after usb_hcd_check_unlink_urb() has already
     marked urb->unlinked.
  6. Serialize vdev->udev clearing in vhci_device_reset() under
     vhci->lock and ud->lock (dropping old usb_device and socket
     references outside the spinlocks in both vhci_device_reset() and
     vhci_urb_enqueue()), and reject URBs from a stale usb_device
     (including address-0 requests from an already-registered
     usb_device undergoing USBDEVFS_RESET) if the same rhport is
     re-attached before usb_hub_wq finishes disconnecting the old
     device.

Testing:
  - Built at every commit in the series with W=1 (0 warnings, 0 errors).
  - Verified under User-Mode Linux (ARCH=um, UP with CONFIG_PREEMPT=y,
    CONFIG_PROVE_LOCKING=y, CONFIG_KASAN=y, CONFIG_DEBUG_ATOMIC_SLEEP=y,
    CONFIG_USBIP_VHCI_HCD=y, CONFIG_USBIP_DEBUG=y):
    * Test 1: Abrupt server disconnect mid-transfer while client threads
      loop 32 KiB scatter-gather (num_sgs=2, URB_DMA_MAP_SG) SUBMITURB,
      DISCARDURB, USBDEVFS_CONTROL, and USBDEVFS_RESET (5/5 cycles,
      0 D-state tasks).
    * Test 2: 500 rapid SUBMITURB + DISCARDURB + REAPURB iterations on a
      live connection, plus deterministic verification with a stalled
      tx socket that unlinking 40 unsent URBs on priv_tx completes them
      locally with 0 CMD_UNLINK PDUs sent on the wire.
    * Test 3: Immediate detach + re-attach on the same rhport while a
      client thread submits URBs on the old usbfs fd, confirming all
      stale submits fail with -ENODEV and 0 stale CMD_SUBMIT packets
      reach the new server.
    * Test 3B: Deterministic reproduction of the field deadlock sequence
      (unsent URB queued on priv_tx while tcp_socket != NULL, followed
      by concurrent USBDEVFS_RESET and server socket close), completing
      with 0 D-state tasks.
    * Test 4: Lockdep (debug_locks = 1) and KASAN clean across all runs.
  - Built and soaked for 18.5+ hours (280 cycles) on an SMP gLinux host
    (7.1.6-1rodete1-amd64) where the original usb_disconnect() /
    usb_kill_urb() deadlock was captured, completing 125,000+ EP0
    control transfers, 21,000+ async URB unlinks, 8+ GiB of
    scatter-gather USB Mass Storage bulk reads, 1,000+ mid-transfer
    SIGKILL client aborts, and 850+ live USB/IP socket disconnect
    teardowns and port re-attachments under active load with 0 kernel
    warnings and 0 hung tasks.


Raul E Rangel (6):
  usbip: vhci_hcd: protect urb->hcpriv with priv_lock in
    vhci_urb_dequeue()
  usbip: vhci_hcd: complete unsent URBs locally in vhci_urb_dequeue()
  usbip: vhci_hcd: stop enqueue and drain all pending URBs on disconnect
  usbip: vhci_hcd: clear URB_DMA_MAP_SG on all giveback paths
  usbip: vhci_hcd: allocate vhci_priv outside lock and handle ENOMEM
  usbip: vhci_hcd: reject URBs from stale usb_device after port
    re-attach

 drivers/usb/usbip/vhci.h     |   1 +
 drivers/usb/usbip/vhci_hcd.c | 236 +++++++++++++++++++++++------------
 drivers/usb/usbip/vhci_rx.c  |   6 +-
 drivers/usb/usbip/vhci_tx.c  |   1 +
 4 files changed, 162 insertions(+), 82 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog

