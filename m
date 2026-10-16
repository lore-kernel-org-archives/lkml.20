Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A1423E9E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157243; cv=none; b=jBxT+vA6LqsabQap2oI3x2gQbp4FNFZ6LUNsjYq8vr/0aqtaWloRzzGBP/uhfNg6IZY9oTbAbmMsG23+0snyIvvHzb5drXDJBEqwGVXdi5eebRHb0Rsaot2z2HLuEQCJ6ycPQjA5ot3VoOgYlX30XzNYPJaOQ0wLraftIHkDt98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157243; c=relaxed/simple;
	bh=6494+ZvYu8FHV5Xw+CZy5G3PfZ+nMzT4PcwZU8DlDjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3pjd6tbFaIXAM1Xq/f7B8qrDm3IR0SfP01FEvJ5lyH5VlbBPB65H8lzpiOD8k3opOx4iIVReU2AywPGPH6I1YUlJ8IQO/6AYvGji7wDpE/2YKIxzjPtdRfLK/lSEBA44cYYoQvGQt81zC4362w0UMgx0laNmtugTbTiG75xNOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGcr0Fyy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGcr0Fyy"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso12101755e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157240; x=1792762040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifcJs/P3/5U0EMJlqsFCLeJP9WV/BCVB8uVBDkA2xCw=;
        b=oGcr0FyypDKRrk4goPdjTXylt2pA89T0288SKfBD9bqxhnqR7rHZUinK8IDlJK3QJy
         WV/ZgBjtMgg+Dbq64FzDf2WE77W3e2KdcF7GGCehsnQDvgcQsDDY6+iGuHbgP7tW1MLQ
         AVOFJvkhno8DmTereMvuSsvdgKnVc6q9L6FMw0YeYsYHpnH7yjyy8122jTtUXjfWjTKR
         Z6NHHj+TYbXky6aRZI9loYHVercW/gPk6xT7RLRHVyrf3FJ3mz0Gr56H2LLWxyTWCZJH
         WIr90l6MKfn2cHIJ+7TsHzoto5cVRgSiUPD/WXtXdRFOzunVZeUB97iwxHtDJmBtYQcw
         zWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157240; x=1792762040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifcJs/P3/5U0EMJlqsFCLeJP9WV/BCVB8uVBDkA2xCw=;
        b=TjevwF3Xu6kGyCyAKFe0aM9im4oSmwihWj5nR7vm9vcY2KcQUR7Hh52tj/NgecnSb8
         rODB8mQoabBt5NnnV95toSoBksOcPcCw9zjiyrhfgczVxLk0zNJFQhMzI+w7f+7tTs1q
         jru8/GjF4XDGQRgPM0drcx1r6Xgnd/PWdecWNXaj2XiOdgQdtiwlnlIQyMxxF1kh4yK0
         Svd01B3hp3Ln5qK8iPYhmTmZMYaBN+6Fksb5NwAOLJ0cdDbTQs1NkXAlvm8zwMRU1dbS
         23OeMJW34QjhKWxho59bx9P72WvgnQYCIlI9q2UD/X2t92y/L+P5cGLX0w73E5KgpQDM
         eo2w==
X-Forwarded-Encrypted: i=1; AKwUvBz4WiFZJj3YIsHGt/r7Z4NLWn/qNEcQWo0ridBZlUj+Q6QVLKtNK4xEjlye7wQT1qN2AOb4foo9ie+pIXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMaKlaU9brA4fqWLFdiO5nUWvzWfo/GikdcgdNqpsqzgECBM+Q
	VS5/EguDgNtcZjnE0ZDp1QtTcroz+Dlnoa8pRT4hWLN2KatsIvo+xCdh
X-Gm-Gg: AYBFou1k9iuqWnupOwKLNXRTUtZAz9Fbivnx0BxW3BJYcVrfU3omWQG/MWwg2j10IYU
	EfdPsJQvz73Em3aCQJVzZnfysDdV51hrRAZkGzqk0n2wz+557kvX8hjpCNE9pILUU/KIQmscYFI
	QIhoFu9icO47eQq0yEaXXKbaFBhicq30g2MEWKUK99oDrN3M3xlyNOx3AGaPbfvdJGiGZcwwV4I
	7ZxbqgMBLeE2Tmae90nUFb24kgllddy5UCEp8aIAz0tD4cCffQWC09QKodXRZrUaC1mS6CYh2GM
	EYJuHl6XokQFFiP1krdEYvwiyFGLbGBBwyUg0ANpWvUU4CSBjlG/+4tXiBVhDiTA2xRN0BdpOsv
	NEZcNdyKtJcIjFDyAAyvOAmJ2SISzaji3OsxI2+Fbrc61K/Qlr74MMLvifi/ta3m98RFtzABFVd
	vnLf513X+DKHvPpW8uhmUeI3zB5sLMTXtwO/UYTpnsvkVLbkUoLISB2MyqFwBYzLN68YDPeKNNY
	LeV9B96y6eWC9au1AG14X4ClJoYM2fe+FlMXcl90bNiRS5ALxhswji169M=
X-Received: by 2002:a05:600c:1f86:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a1c6672f2emr64239555e9.10.1792157240153;
        Fri, 16 Oct 2026 06:27:20 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de7230sm58114275e9.14.2026.10.16.06.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:27:19 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	bobbyeshleman@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH net-next v3 0/3] vsock: SO_INQ for stream sockets
Date: Fri, 16 Oct 2026 14:27:13 +0100
Message-ID: <20261016132716.272018-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the follow-up announced in the receive queue hint series [1]:
SO_INQ and SCM_INQ for AF_VSOCK stream sockets, as AF_UNIX has.

Patch 1 moves the SOL_SOCKET option handling to a helper without
functional change, patch 2 adds SO_INQ and patch 3 covers it in
vsock_test.

The value is the one SIOCINQ returns, so on Hyper-V it covers the
current packet only. Accepted sockets inherit the flag from the
listener, and the sockmap receive path does not report it.

Tested over loopback with vsock_test and vsock_uring_test.

v3:
 - split the SOL_SOCKET refactor out of the SO_INQ patch (Stefano)
 - rename vsock_custom_sockopt() to vsock_sol_socket_custom() (Stefano)
 - parse the value in vsock_sol_socket_get_bool() after the per option
   checks, so SO_INQ on SOCK_SEQPACKET always fails with ENOPROTOOPT
   (Stefano)
 - reflow the comment to 80 columns (Stefano)
 - carry Reviewed-by and Acked-by on the test patch; Bobby's Acked-by
   on the v2 kernel patch is dropped since it was split and reworked
v2: https://lore.kernel.org/netdev/20261015154334.3217358-1-devnexen@gmail.com/
v1: https://lore.kernel.org/netdev/20261012235524.41468-1-devnexen@gmail.com/

[1] https://lore.kernel.org/netdev/20260923184008.153541-1-devnexen@gmail.com/

David Carlier (3):
  vsock: move SOL_SOCKET options to vsock_sol_socket_setsockopt()
  vsock: support SO_INQ on stream sockets
  vsock/test: cover SO_INQ

 include/net/af_vsock.h           |   1 +
 net/vmw_vsock/af_vsock.c         | 125 ++++++++++----
 tools/testing/vsock/vsock_test.c | 279 +++++++++++++++++++++++++++++++
 3 files changed, 377 insertions(+), 28 deletions(-)


base-commit: a4057f51efc2b74ddf46721e83f45e9efb13649d
-- 
2.55.0

