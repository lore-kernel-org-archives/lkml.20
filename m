Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2CC521225
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804865; cv=none; b=EOxjV8FXoD+H+uZyTP3TpCnJZEnqT741bRQCa4nKE7PPuKdQ9itY+MCrBj+umK5vQ5uVFI0GK+tZbd2X8B0/se+zCNMSHhFp+O0p3VJVFBvuPn8DefAENFNRElOxlV+lPAyBbHIbzM+aNs3jr0R4cts3Ah8xxzql+eQJ0ezo14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804865; c=relaxed/simple;
	bh=3RSdV5bBhWRULyl6uKfnW1LG/ffeWbw+PgurKVAIkeI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FuJlRCiKzJJ9ehc8O5zgXYThR7mGWFi4N5L8TIPO6exeL7NlegtTEjv4e89nVXbQvQB2XWedC+NRDYhw06IY2GAfdVGDUVzKQoBeHy0Hvg6lK1YK48Gnw/WIp50dXq1CAVOai3pFGh83BeZ7oSGvaJ/Py/tfHClPkHCQfdofph8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K3IXNbi2; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K3IXNbi2"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2c785aa62so32496665ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790804863; x=1791409663; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXsSMFeS4wLeCuWu6IbDBclh7ggI9zoXvgi6QeCApjg=;
        b=K3IXNbi22Chsfq9FHM/J0rx9cHrpfRflGM6gnXYeoGYGmfCYln5ZzG/NfBcFdXdyhZ
         hWDChGty6sfXCNwTPMqrrtmHRHDFTFPORK+NbvSgiyP7ZNQUtE+MTCEVdlfbiuUV3J3a
         6Qmrr0yB+2VdYDshFwDAafm26cic9znfEcSyHjGeBFR1UPKXt29zsxedUgjRaJYlDblF
         nDYxpOeX6B9WbAnFOX3646zl9uZbukQRWogNU6qZBc2vNrWq1v4gPPLwQST0yCHPzmX/
         ZMiggwTMqNdBAmfuX9kt5wthWJAkpkGKGW/wRoLgImz6ed6JtR3ynvl+6hvt4eGkIT5P
         VNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804863; x=1791409663;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXsSMFeS4wLeCuWu6IbDBclh7ggI9zoXvgi6QeCApjg=;
        b=APy4bPe1EZMgPgcAzXPtU15CMynPU5DxnmiTCTp2XWQ60VjG4qSQKsb1vFEEmR7WN9
         0P7W0dekELLXJZaEIqftEzqSjYMgt6uwQCY1brxk666DRQvTo0SkQ5xOF8Z7HyXdmr/A
         64EymhazjUAEHzUv+miqIBgUescQA/GbPuoHzPv1d1Owg3s0d0tZoJ9hHPVlbYOSZxpN
         +lbjTjKfSS9cNt0w+sW7RJBFHB+CzmMdE1Pq7AP+ar1HSbawe78MZ3acpcqeReHnB0Q2
         +302ZGzjRWmQJuE9QDbfs5JO2RrTWu58CuQvEeaJ7JdFEbqsFzAEkWMGosWsXLH3p8ts
         J4KA==
X-Forwarded-Encrypted: i=1; AKwUvBwqMBWC6fhcRx59Vij7esWVyi4cLHa7ZWhR/ptHaSnB9u0TvPEQAxl3XIzf+Xox3WQxEti6Y1WNIu1sE60=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFpBiRJSXB9DMoAi6IUfa7CFPlwWr6a5TK2wNKdBfhgNBdvaJr
	TfDcgYoK57cjTMLreiboTfiRMwgQIMKJ3mKz0K1m4hWSTmjYAltRgAfxhgGPShQymibw5+4x1vZ
	gG+L0FcF6p+gWsQ==
X-Received: from plyt22.prod.google.com ([2002:a17:902:d216:b0:2e1:33de:ada4])
 (user=joshwash job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f684:b0:2e3:913:31a9 with SMTP id d9443c01a7336-2e30913f27emr449105ad.34.1790804861617;
 Wed, 30 Sep 2026 14:47:41 -0700 (PDT)
Date: Wed, 30 Sep 2026 14:47:33 -0700
In-Reply-To: <20260930214735.3288780-1-joshwash@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930214735.3288780-1-joshwash@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930214735.3288780-2-joshwash@google.com>
Subject: [PATCH net v3 1/3] gve: fix XSK buffer leak when rings are stopped
From: Joshua Washington <joshwash@google.com>
To: netdev@vger.kernel.org
Cc: Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

GVE does not free XSK buffers when resetting ring state as a part of
stopping queues. This causes all XSK buffers which are posted to the
NIC to be leaked.

Free XSK buffers attached to an allocated buf_state when stopping rings.

Fixes: c1fffc5d66a7 ("gve: implement DQO RX datapath and control path for AF_XDP zero-copy")
Cc: stable@vger.kernel.org
Reviewed-by: Tim Hostetler <thostet@google.com>
Reviewed-by: Jordan Rhee <jordanrhee@google.com>
Signed-off-by: Joshua Washington <joshwash@google.com>
---
 drivers/net/ethernet/google/gve/gve_rx_dqo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
index 5cf242b28557..a2c4a08ce68d 100644
--- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
@@ -113,6 +113,12 @@ static void gve_rx_reset_ring_dqo(struct gve_priv *priv, int idx)
 				gve_free_to_page_pool(rx, bs, false);
 			else
 				gve_free_qpl_page_dqo(bs);
+
+			if (gve_buf_state_is_allocated(rx, bs) &&
+			    bs->xsk_buff) {
+				xsk_buff_free(bs->xsk_buff);
+				bs->xsk_buff = NULL;
+			}
 		}
 	}
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

