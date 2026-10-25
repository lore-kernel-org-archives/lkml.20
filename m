Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792886922;
	b=rk/K8KdrWGbwDwL86lsncHNIxU8qJfKPcJgjIg6SFvky9/+/IazY/HeuPSwKXyA++YNk
	 MYsGL8b/pkRTUCuoDur5a9p2dMELYqI8WBPKkaCnIXggbpOqqb9Z44HgEQmV1Cu0owBBx
	 i9uITxraMAipKRBVRoR1ER6uHP+E9DE0prbihE5HQ3mLx0LO27ANGMd/rUV6BSE4SwZn9
	 p6quP95tB6J+YFzGFFoNFtYntwDVNqAAzFs9Yn/+4VKk4JkXvmDku0nEl/5/Q6snP3gnI
	 +jXDpPfcnOoJLbUW/xCNuYhzSSv5SlCjBiI/9dkYX6e92UjMc10G1on+STwzY6PPu3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792886922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/qVk/Qm5KB2NtxRwDV9R6TEykk+BaYAsUC+sF5ExwfA=;
	b=JNXEYgAKTvmu5qVScpwLdrWTjCZ0PJmJvG/ydN9Qbj2+ygaNLGyKcJaUVc6nzMhYlfpF
	 v7nBiwuK+4P8i55WHNDCTXGOj3+EArUu39gjJIvSB+67zsyGIb4yLjKYYuQcseMYg7jr8
	 uFoyxp03epudvF59ngKFyV/vzX+6nvFUdQiLHxIElYNNMyCpsedo0Iovh7UKiurqPQXG5
	 qQdWs2euKsafDWgyKWRw0sPEc8xYi0WLs2wZc0YvQXuV/eA/5hWK2rUZRBHsdDkcsVhCO
	 EP+5pxCgq9F+xFstgHjW89wwC3WhhzEjlT8qrRKbJn8zCENntqctP/3smJJpAHSfDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pmxg7SKO;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA14606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA14606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pmxg7SKO
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0a921ee46so14963727b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792886920; x=1793491720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qVk/Qm5KB2NtxRwDV9R6TEykk+BaYAsUC+sF5ExwfA=;
        b=pmxg7SKO5g6vGaL/iSs3OOBR+HLuy1mCfumm5Kg+Y1mkNehopY2OvCeOn92yWXOjzn
         0h5A2vVuDoEiic3cXKvO90Gv2Ek9bWTMSJOT9Av77kqlFo+S2DEAglyToqj2RcpxwBdq
         kxkk8QO7lvh6WRaKra8uo1T58KOh2M/w9YgsWApA3AdEK/55iWKxXvKPz+cdTnkHm18c
         andS2f3LMH/AN3t+GU/6aHSuvUhs18fFgPRGyKdClqpEtWQG7QZgUv6GLP+P3xJq2zL1
         YdZBrq4LXDKWvGasUkmqCLZ/4gu9FmRBah2cnH+D1GP9RYVZISzcorLhyX42Gv2iZ9Sb
         FgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792886920; x=1793491720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qVk/Qm5KB2NtxRwDV9R6TEykk+BaYAsUC+sF5ExwfA=;
        b=KZVT8LpWH9Us5OCfQW3C0PejXURndIZCccwwaIRCH9ZJwm2KY65Hou3XCAzFEAoRLd
         xv6fhDQ6SbqI66Is2K7UoWNcX/2D5J/tWMa+wss8aT3uMvgRUUoSpJIJYY+FmrSNqbYA
         qTPztp/pV9ojjuEWHjDMJpr3xW5jEJBjxxUinT0Sf5CLcgJlzWX8B+CB64fDUreA+n0E
         oPPqYnp7dOrF3Sf3R+8wAT1OL+9fbjSSYfOtA3jqQID9sdHcjiF16awZpOPCAXgE2hl+
         bhB4IZETQxzmhqZX8bJZ39PFpYyaCR88GL8SFdcenPtJvQYjrz784gci+H5VmF+92ga6
         PVsA==
X-Forwarded-Encrypted: i=1; AKwUvBxZMHiOSKJHnIwjkpYg2qYYPIjmWMDkgDTaWYW6PiXuy77Xj0Y5gUbEyUEEnQTA0gXdGDG4GBUt851U0HY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXrZmgrHH+FPHhd/DaiajOQlm2SkqAaO68E2a9bxEr2Oiy4En6
	GBrRfAszduXhozBdvwFkHoQJLySEh9gFQzr1jgoSqU9ry0qyg+E46ltO
X-Gm-Gg: AYBFou1ZJ7QYmgNVYH7YSvJcddHhNdGRbo00O7J69NrcjwjTRGA8UsZJF/p7f3f06tD
	85lp9c0awG7URGsgLu8EW3AHQcwHFghBgtGkUG4gGpPRA3boJuzg2XZ/5NIqYEh7eRn0Al2QG9J
	uo77w8XjTOlwxjdI3ru8l2A07Li6VlHMzfcJ89AFsX3VuZrDaIjUxvSPR5ag8hsL2s4bNUZf2vQ
	75h9uakT0NO/BWv5IX8kQ1Svfdc6FJXGCmMZ/r579j0bYYg5FqENoPiyamcS9w0I01p+WJzJBeB
	1XZz3bU4JFAYQZ3BilFXD98/B+WnbxcbEMtuDV/nbs7jp84CRnt7iXnp3LmBdosa+JSd0dfEtES
	6eN8A1+6xLtOcYWYivHMU6SAaGxupP3JQnPYGLfIQIlGSnkLVlRhXX1MQpkmtwgAP+4YLmvRK0t
	/jF2ciz1j2pBqsnaRmO1n11Mdx0FPcLJU22wioIIPzlvezlU86+oB5cu0p8VxSHcbZ/GUC492vM
	I3Q1XgoWLVrUIicthLMV3Kul9uB0oqDqZZLxm+PjrukGlQOEhTL8A==
X-Received: by 2002:a05:690c:39a:b0:8b0:eb9a:7383 with SMTP id 00721157ae682-8b166c3cee8mr21547227b3.77.1792886919768;
        Sat, 24 Oct 2026 17:08:39 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:1::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166e0bdb6sm14384667b3.19.2026.10.24.17.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:08:39 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org
Subject: [PATCH 0/5] PCI/sysfs: Wait for config access lock in sysfs attributes
Date: Sat, 24 Oct 2026 17:08:28 -0700
Message-ID: <20261025000836.58294-1-thepacketgeek@gmail.com>
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

Many PCI sysfs attributes that read from config space are using kernel
accessors that don't wait for pci_cfg_access_lock() holders before reading:

- serial_number
- max_link_width
- current_link_*
- *_bus_number

If userspace attempts to read from these attributes while config space is not
available (e.g. during a reset) there's no telling what values will be
returned: All ones, zeros, or garbage.

Looking at attribute addition history it seems like this was an oversight
instead of a specific decision so this series tries to resolve the attributes
above to match the sysfs attributes that do use user accessors: config & vpd.

Patch 1 is a prerequisite for the rest of the series. The kernel
accessors these attributes use today skip devices marked disconnected
but the user accessors don't, so switching over alone would make the
attributes start sending config reads to disconnected devices. Patch 1
adds the same pci_dev_is_disconnected() check to the user read
accessors.

Note: That check also affects their existing callers. On a disconnected
device, VPD reads and writes, VFIO config reads, and VFIO writes to
PCI_COMMAND now fail with -ENODEV, rather than returning ~0 data or,
for VPD writes, timing out with a "firmware bug" warning.
pciconfig_read() fails with -EIO, and the sysfs "config" file and
/proc/bus/pci still return ~0 data.

Changes were successfully tested by continuously reading sysfs attributes
while a reset was issued.

Matthew Wood (5):
  PCI: Add disconnected device checks to user config reads
  PCI/sysfs: Use user config accessors for bus number attributes
  PCI: Add pcie_capability_user_read_{word,dword}()
  PCI/sysfs: Use user config accessors for link attributes
  PCI/sysfs: Use user config accessors for serial_number

 drivers/pci/access.c    | 57 +++++++++++++++++++++++++++++++++++++++--
 drivers/pci/pci-sysfs.c | 35 ++++++++++++++++++-------
 drivers/pci/pci.h       |  2 ++
 3 files changed, 83 insertions(+), 11 deletions(-)


base-commit: f4319f548f7d8cb595ac1c91bfd459876399eeb3
--
2.53.0-Meta
