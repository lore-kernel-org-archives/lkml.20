Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572939;
	b=K6cbRbYtR1FtpuzCzE4o+cfWz9T8PPxvkKJghxT6ug+pieKvfAHPjAmzYCSMal+50yU7
	 PZPy07/mWt7fwaP/1WaBOHbikVlLeOHxTt5BCezl/qdR7Y+sW2FCa6IOp6otUbZPHRUZL
	 epoHGZmdvC97fSIl9jmFsoYeA14fNxrHoRtmECZTRgC67cq4ECLo81X4JSDKOgOFuEF3A
	 o4rNCFcI+6LfK+PqgmI/nKB/Azx5aDY6KPphve80Ztq/k3AznUAGVHgos+vwJmJb+RGSc
	 JcYQXQoEg+HvhBpE1JrGEw9X26Lcr7QE1rKKJxk8UefvFyM5uQZm1yvR2XznS6Tfy4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZlzMMtlOMt0j7sxnZGkr7qkygcFA8MGAgcH9bAVX7Kk=;
	b=n6pWvJyui+tAVEa11WuU5XVSckpNj9gg3IgG8t1q5uTLLnwZ1Xu8qquJP9SjxwvKmcKr
	 oAEHIFz7miskyi6o5MhhoNM70VyTt4nI/hq/7rMBxBNmfCu3GsN4e8sOifbsnMnR505SR
	 VAwIBHeSkVPVCPdtJd5uJyK+DN5oK6z2q0yVjqizmCe8nzIRCx3BbmHlZz4RkplDS6n8u
	 uHafEmz3N3AO5ROmSJjSqiaywHcoIqaHWRowHAkkHsCsevSMx3MfciOLYzWw1qTgqsXS7
	 qr2j+1HckHf/YKjy9ezMim8AITgpRWhdZUjTOUdIiwEIfP3dXSibm3sEd6Lw0dtZ8/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q63ZWMYw;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B960606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B960606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q63ZWMYw
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so275568a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792572939; x=1793177739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlzMMtlOMt0j7sxnZGkr7qkygcFA8MGAgcH9bAVX7Kk=;
        b=Q63ZWMYwY2xiEcGgxNT+yzrIlSaw9gGr5WmMgDxgjgm7sxXVG3yzck52PqI5GprMdC
         0YqC8fY/9VYDsWb6Mw+YnkSo0Q5zzMuwZTqwk99O1vHcqh4zIyKbb13+fHmmKwH2O1bT
         TjC06GLD1Bf2MvZiPAj0Yb4RkP468nRt4HZtclmCnhYNMF/XcJXxaC/d3cGHUvx3U1Uf
         phMYsUrcDAVSoLAs5Yp2Av74cYiwVpLJzASoz3MHKVTzRKP+5wqpnvI4sAPOGZRpzV/z
         ZBdICmaDUU+/c0Wx8a+ojZ9sm+P+Z5cjrFzRe9YC726WzvQgEIgmpAPgKlO+mvbbj7Qt
         2UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572939; x=1793177739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlzMMtlOMt0j7sxnZGkr7qkygcFA8MGAgcH9bAVX7Kk=;
        b=bNTKYURjzoKYv7/ebNC4ghKzWnLwovsqIrtB5JWrbcR5yC83UetcpEAdYnHsP7O+O2
         +5O2IIhz8zLuz2+4KEU/Z/BjHZtR7m9xiWDNjK1l4YNFYWU6XGL00QN8s0xJfwnNOsEo
         aQaCsy7OgrLHyxeVn07Z2i+9FzgDw1p3dAf66XMeKH1YD7DiEPZM3vfwhNMHE9r4Jcuf
         gb67AIgSs6gKPN/O2o9zX3hU5Up2MCjEG+1pxJHo8TMGZRkYc9vNb5HVRp+H+h8rX4IT
         rqpF8m0D+6d36hRwTKJoEjqMi3Yk1LFG0Kpa5r8Z27vESHmizL6nL9Q1r/dr0sW1K7HV
         83FQ==
X-Forwarded-Encrypted: i=1; AKwUvByoPR51KVEUrwJ47qBbTZ6qiR2I5IQ7zM42z8zqqG2hNzKv1tNMxJmh22YSKZXzJ3lMwaoyKk0TtiQDejA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZUynBH/dsXLLyWurfuL0u64TKtYia+o91RikzQMHqyfMw6bA1
	/wz6H6xyDpsL/ETYv07QUATaB4mSuWWAXyCq4x1FStIzqfq7On7RYW4d
X-Gm-Gg: AYBFou2rxmI/djGpGn/4nlRCYXD5iQXEAGpanyImNdZ1PUUn/7qHzrUdOxX5Q800gAt
	9hPT9Cqn2+Og1vuJVQQAXdoJzVIScoikTnp0QHBMp007H48FbZSk4YT7S0JJScyONRmy3MqF0P1
	GWN9rtSNaR2P9ABKl92UGp7g06OAoTiSWHb9PR/M6zjPKuvGoKoXvtV7MS211hex7Zv4HR8UjK3
	kjCELE732t1RUVZs/kvAEG9rqGwy95KX8TzxkDsnF/M6f794Jpz6sDe5/tb6I8ltRdzmr6PsRlE
	bYS/vB3OPSxpexmuVMHpo4MWUZX7FQJgNEhjymX788pjOXMOzWHR2yEA29Ol8liP8CL1H5KtGFQ
	uky2/tiWKYQuFCZmBQ0A+V86XebF7eBCs7V7eJG65iEWgaFzDt3SRa/llG4mrkGoeVq/ZNwRKw6
	sXfzTO2bPLyJo77iiCi3HWmy0swKvjuXea1sJ3p9MZXjNDrZsLxFjIw2twyxFVpSp1sjvX4Re1n
	NWcgp9gNDzViN0SglH45c2DXzYBcnLYeKQGUhL/v9onKRQqOpEkmyo=
X-Received: by 2002:a17:90b:2f8b:b0:3ad:6781:da66 with SMTP id 98e67ed59e1d1-3ad86c79915mr1116703a91.23.1792572938794;
        Wed, 21 Oct 2026 01:55:38 -0700 (PDT)
Received: from gmail.com ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1398207a91.3.2026.10.21.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:55:38 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vhost-scsi: fix page reference leak in misaligned I/O fallback
Date: Wed, 21 Oct 2026 16:54:58 +0800
Message-Id: <20261021085458.196742-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
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

iov_iter_get_pages2() returns a byte count that excludes the offset
into the first page, but also returns a reference to that page in
pages[].

On the misaligned-I/O fallback,
vhost_scsi_revert_map_iov_to_sgl() puts pages already added to the SG
list.  The cleanup loop starts at pages[npages], but accounts for its
first page as PAGE_SIZE bytes rather than PAGE_SIZE - offset.  If the
remaining data starts at a non-zero offset, it can finish one page
early and leave a page reference behind.

Use PAGE_SIZE - offset for the first remaining page and clear offset
for later pages, as in the mapping loop.  Without this, each affected
request leaks one page reference.

Fixes: bca939d5bcd0 ("vhost-scsi: Dynamically allocate scatterlists")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
Testing:

- Four fileio vhost-scsi test instances repeatedly issued affected
  writes using recycled backing pages.  After about 1.33 million
  requests, MemAvailable fell from 5.3 GB to 13 MB and swap was nearly
  exhausted.

The affected fallback is reachable from guest-issued virtio-scsi I/O.

 drivers/vhost/scsi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 4f8c0260bc9e..b7e41c0a91d4 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -883,11 +883,16 @@ vhost_scsi_map_to_sgl(struct vhost_scsi_cmd *cmd,
 	vhost_scsi_revert_map_iov_to_sgl(iter, *sgl, sg);
 
 	iov_iter_revert(iter, bytes);
+	/*
+	 * pages[npages] is the first page not added to the SG list.  The
+	 * remaining data starts at offset in that page.
+	 */
 	while (bytes) {
-		n = min_t(unsigned int, PAGE_SIZE, bytes);
+		n = min_t(unsigned int, PAGE_SIZE - offset, bytes);
 
 		put_page(pages[npages++]);
 		bytes -= n;
+		offset = 0;
 	}
 
 	return -EINVAL;
-- 
2.47.0
