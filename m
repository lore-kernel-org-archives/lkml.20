Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342C378838
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860275; cv=none; b=Dfyis7boR4o1rcwHnc7crBqy8qbjh9nHfEzsQGiRd4WaHgOFTJd0BQvQJW8pAwgXcX7AJI8QFKLU0PGUZQb+4KtvkOkj+HPOpJ5NhFCGH5RDM17G1mHOXBneBxkc4f/wjOcStaLWH2KV8+2I1uH/u0NCbek8hMIGAQlnFxQQ37U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860275; c=relaxed/simple;
	bh=jFs2ejwyQRoiUFaaaOWLo95jLgIUJD5pi3UvSHe6KKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXmWVW16eNdh2RfY8cQTxYFa1OAsImzP55EdLK5mgYA6Y9eMCWPHTQ00ltl9pRgOo3+l13Fks6mo+oFuezD09USsYI7ZvXEXss8sCohk899Dz+ed0RKa5H4YX2+gO0/3sHuDTYmiOhcHUVn2jyXrL10qHthTqGkEqdlrtBBQ1PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security; spf=pass smtp.mailfrom=octane.security; dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b=mwTWtItM; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.b="mwTWtItM"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35b647aac23so865837eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1791860273; x=1792465073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKlzSdYOmHmxNkajBIoZRP6k3zgKUV8Nk9LgZQpvxD8=;
        b=mwTWtItMZIEma8k/cXQ+xJgo+gDTwDliVSFTrpNvTylLLvaFVMNSmCktD4DDyzDC8l
         s9uwMbC2x4D/DsmGvGFukPJbiAjC7Oix+AZPylJ1ujKvsDTmcBofAwFbGg6u1P8aOqVD
         SjwYIZbJO1b3Th7wK9H/p9eqpzDgE7rPcJ3LPWXR62hRJqnayIWZR3wP2dEnTCAvEe0+
         5Vrtu7RZIJ9u5+MbLBMCcVoGJTUVLS6EWVV3aR5qZaS1cMbTXpFMzfkD4u5cLbVL5stZ
         +Mgz/f7qoyTl2coTqgdrALmvHCwxjqBvyvW9sZawyUtuoAI25oP0E4Kj8L9ZX9c+eiYU
         8nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860273; x=1792465073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKlzSdYOmHmxNkajBIoZRP6k3zgKUV8Nk9LgZQpvxD8=;
        b=oanRLJE3+Y8Inq+SRdx9cq6vG7ay3sppPHAmPTr2DoVzvpTqdC71+voAc9QsluTmf1
         CRaRbvhMQ2G/vESLt2aWGr8n6sxrVqcfLxU1DO+cMjfM5UC+uo3cUoSygjil3uI0N9o+
         wWHBXR/4TWBa1x9UNVnDQRXm/p1abB8xN+bC1crow04ArgcWMx4wjrV/5+zTyfrHEBsf
         X+gYYqfPcv0kPB+DpYM9+nYdz7GJJd5bfOObMQXWzIvuBU60nV+rrIqsDTYBRd9yIFZ2
         5zu8DMKl5dD8UCCwBNiAtVGNg/XF6RkXpHGOvwFTym4TF0yVZpiln4zuoSjs5YWFhyL/
         likQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdFDA1yGc3SfodxETxCx4r/ZpBba0+dUpUbZQLaqbCtZhsMcrxydq7ZmFYuuACBfHuYTrn6ZegOMbKuOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh3ekexL1RKiAU1gLyjvjXZI83ZHTiDWu8jM9sGD97xEwDdM4L
	V42NS3hg54kLq5YkwFWjM+yxkUTv22T1fZhPyT0kTdFJSC95/S1LXgMjIZqfNatk1f4=
X-Gm-Gg: AYBFou37bu+wXCol5HgAUhhIJrABDPmhbfCNrzUNNvsKiS71VUmSYVrno0HHtxord5q
	W4rZVkqsup6yhBXGCJr3bArfOdO2AF94UdNrQ1xn4VVToUv63tu7LS1q90m8YlBsv0BmxitiCeH
	Ism1jv81srpd933yg1uQZhqJICkxaYkbvzdVKR5g3jM40pllFMCQb8oVPS8twis3biHSjwlAk5z
	vNzChuXUFQp8ek1zYeYfEVVHimeQwni4MGHVTvLkV9WhBp8DVy37y3dEsAF4betNa7LvvcjnPHg
	P11ovVsqh6qogEIf/aXC+Ij2bGKWJ0pydwDjCj/PbAJFsoj1fypxuqJAYo2wafyelT8yz7+Y6rM
	7lfVrPig0SbVnSu9URuxv+3Nfx4dphOG4QGErqYrS4ut/6QoWbxqkboQnzVZF6zA5dfkG50wj2h
	xPbKcR4Ykh0Hm2z7Jd26oFcjfOFBzDTX1/BVCS5a9+L+0XGfu2TvNYkPGyURazq9TtYAnOrmf7F
	HoEFxjvQbRzN2DWB7zec89UX0ZQzx8WroXzbfACHAXWwZlJOvpmqu1M/NsEbPfaVngh+mcdZvnd
	/CpY176KENER5A==
X-Received: by 2002:a05:701b:42d3:20b0:156:d588:c881 with SMTP id a92af1059eb24-16a0adc14acmr15455735c88.2.1791860273055;
        Mon, 12 Oct 2026 19:57:53 -0700 (PDT)
Received: from localhost.localdomain ([103.207.175.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm34223721c88.7.2026.10.12.19.57.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 19:57:52 -0700 (PDT)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	cuissard@marvell.com,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gio@octane.security,
	Shubham Antil <shubham@octane.security>
Subject: [PATCH net v5 0/2] nfc: nci: uart: quiesce write_work during teardown
Date: Tue, 13 Oct 2026 08:27:44 +0530
Message-ID: <20261013025746.41292-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the NCI UART write-worker teardown ordering without
blocking the controller reset which nci_unregister_device() may transmit
during teardown.  It also fixes the Marvell UART state-publication race
reproduced while exercising that path.

Patch 1 publishes the Marvell UART back-pointers before NCI device
registration can expose the device, rolls them back on registration
failure, and establishes the controller's initial halt state before
registration.

Patch 2 serializes producers with the write worker's final state handoff.
The generic close invokes the transport close first, allowing the
unregister CORE_RESET transmit attempt, then blocks new work and cancels
the worker before freeing the skbs.  Marvell performs that barrier after
NCI unregister but before it releases private state.  The failed-open path
uses the same barrier, and the transport module is held while its open
callback runs.

The tty write-wakeup description has been corrected: a wakeup may queue
or run immediately before close; it does not run inside the close callback.
The same spinlock now protects producer scheduling and the worker's final
SENDING/WAKEUP transition, closing the reported lost-wakeup window.

Both ordering issues were found during an LLM-assisted source audit and
reproduced using a pty-backed NCI UART under KASAN.  With these patches, a
61-cycle regression run and a 56,690-cycle registration/hangup stress run
completed without sanitizer reports.

Other concurrency concerns raised during review are outside the scope of
this teardown series and will be handled separately.

---

Changes in v5:
- Preserve the unregister-time CORE_RESET transmit attempt by closing the
  transport before starting the generic worker barrier.
- Quiesce the Marvell worker after NCI unregister and before private-state
  release.
- Serialize the worker's final state handoff to prevent a lost wakeup.
- Correct the tty write-wakeup race description and close-contract comment.
- Take the module reference before ops.open() and drain work on open
  failure.
- Publish and roll back Marvell UART state through transport callbacks.
- Add the LLM-assisted audit and KASAN discovery details.
- Keep unrelated concurrency follow-ups outside this series.

v4: https://lore.kernel.org/netdev/20261006115532.72100-1-shubham@octane.security/
v3: https://lore.kernel.org/netdev/20261002055620.18339-1-shubham@octane.security/

Shubham Antil (2):
  nfc: nfcmrvl: publish UART state before registration
  nfc: nci: uart: quiesce write_work during teardown

 drivers/nfc/nfcmrvl/main.c    | 18 +++++--
 drivers/nfc/nfcmrvl/nfcmrvl.h |  3 ++
 drivers/nfc/nfcmrvl/uart.c    | 32 +++++++++++--
 include/net/nfc/nci_core.h    |  3 ++
 net/nfc/nci/uart.c            | 90 ++++++++++++++++++++++++++++-------
 5 files changed, 120 insertions(+), 26 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.43.0
