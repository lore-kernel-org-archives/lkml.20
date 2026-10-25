Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933170;
	b=QIFZQBK+N/tH2t8edfZaNJlcOAh6WHKM4OZr9B9rIwNGXYzsdronBU9VSVTWRviCYSEC
	 3da0uT06d3Job2HE58tWhmban7YzoqraVLnywfk4Fe56xcPk4n5YbMQGTP0rksnFtmU/h
	 TEnB5fpeiVjIvkjEgyzfkVLs8FOzxAwKz98GlpuVHnnnvMUVXJtcu+moQRcRaCfd2oNjb
	 xY0/e1jqYVTj+WN1widsPTkFMxKTJr8635J6dSApXmIUcSZsQr8x8bFqmIVPIVZocf4JZ
	 PWWAqHESbMdk3Z67H7XZV0PfLvtHC9ktuXjBPYAPshzlryLBZ8s5OhzdhnnAq/Me2rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7VHZxL27tPxxp1usvovdEi4PohkLXe+WTp5TnVE1dnM=;
	b=k3TGQpNV3vBm9AuvpZeIhWky46xH9/U0fcfhq8OEkn9PDREI9r2iEFieV+5igvRYsskb
	 7BcZhXI8bu+ocA9Zea9l85EJPDimyGykyyJUuhDIqW2j4AbYyzW0YJn/5OtN+9HrU2tcX
	 RcSlL5S8ttzIxlnoRXz+dxAOdnRaxw29I8slgBxNwA1IrJl7aWuz2O46Y8R7E/OPwt5il
	 TN/8wCMzAuHTEtkkgNigt5slR5kmGYIFdi7dOx5Hu38CZiw3cjBaSICwDq5UANKT+YBGF
	 DU5TYXTqNKkBkNxGV2PXTc5atmk8GPsyPNrQNcbP0th5qIVd2GSc9CDIWrfdEYJgwMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rZk08NxT;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB43606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCB43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rZk08NxT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22366575e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792933168; x=1793537968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VHZxL27tPxxp1usvovdEi4PohkLXe+WTp5TnVE1dnM=;
        b=rZk08NxTTVEpTzIZsF83JIm/vfJjHC/3TWlRjj/odwGc/R78ukigXNtW+Mu/QgSYN4
         jwiQVTMr32so9LFM+q4CL3OeKAzqOLRnDH+6lCswwFw2cNlbCkUdQlL/cjb/cR3Heb/D
         ef3iwdyultFPtA2c382MOTaCxropI+ycx/V9jBBfy51lGWhoeWDLhFZYEGw8Ifr6hoIF
         F41BB//tthWuFP/RQ+zB8NJvSlOBGMyXUeLkeiTgHbgpQjuYDLd7YdDTsPoRjnVGJw8w
         KWs9PcBS1hl0vP41aywQgWsDrdFh6Xjpimu3FJu1m2RHJonVaXzq6KJSBHSj8IzBfUkT
         FWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792933168; x=1793537968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VHZxL27tPxxp1usvovdEi4PohkLXe+WTp5TnVE1dnM=;
        b=Yp67PMZvsi+Sr+3jfVA6LcXqnnYyAgZwLjIxqsaqsph+pRL5EpaC06+QCT01WwZVva
         BxOWnEGRr0cC06/LSnWYmx/sHFFQnx6QbYB/EHxLErfYG0x/Sg9VrQuEamEp9KqlLzP5
         Cx6mTwtY0GErCeV4aFKbDpLE2kPcbdFhHblv6kPoUcOB6IcCGBjAsciWhr9a+mC1F4Gr
         FHtqHEPpT6iaYv1r8kYp370J57f4Aru0Wf8C0SPG4F3nAHaWPXBgU6NxIXHcPLwGNKrd
         vpd57XZG0nJLkf42UfCKi8AVcY85ebIgwaWUktY4NE2hqtPv6cnyjZvvhxTKFohtPuXE
         xByA==
X-Forwarded-Encrypted: i=1; AKwUvBx5G34k6y+ad7EtNnlK4jiHeO9jFPOfhDQmmzYziyDW6+EX+EdhgjJCDJyZE/RrwxzqOrDeOJ/YUJVOT4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYRhCA4ebXNtBQDnv6m3dThfKxAMNyNLyj1hXw+mKEBuK+f52r
	iGXGmdIUDSodcopE6i1LosgoK6rSoyD5qqV5X68uBhZSHYVN8z+RzKuQ
X-Gm-Gg: AYBFou3mxL2ye4ViR6X88V6ZzIpIXWgc73I8pPPJuCpPcIc439nGkAHTjX9Dm9AOYGh
	K9wVNjK87ibjYL48fqGG/VPWFgRrs0nb1ljD4bMw052kGFs720LYzsIks5HCLu1hmXAKRT4YLa2
	Ngv+L74EBjkR7EzM5ZpJCZix9vexd2EzgBIsffT+4r8U8WSjjMWWHg+8u3JQpPc8ZzUSYVJH7yr
	qYpT68kBl8S/5Jf8wEtoG48uLKDDmMkaQLG7WxTQvDH01OSSsoEcZsSQRK3WUpKEONWd3wp/iLO
	xM34jgQyPfg1T0kQJKBUPS2okYMwheQAc1TxkwaVVBxE9vwwwsALGQH2j2aorXMt6YIZe+ULo2C
	jHJF1Svsr8jaZfL9Sr9dKT/Dmj6McND/nsD79OS3z9tfTMcPOFq87LSAKnNL7zmMkNJIG9w8Da5
	9MwfYp502PkDhFD08pa1kq7yh7SjGx0cthsbfwVh8oXB5+nW6XkgyF8MV0Z50GIgP/n/3T/Mzpx
	INmUORhzgS7FWQ9cHqq1E1NV2T13rFtu0pTiG6qp6WlXj3s9irWt/imH5vUz250V6ZJM/ql
X-Received: by 2002:a05:600c:6289:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4a35acc8109mr68061445e9.21.1792933168107;
        Sun, 25 Oct 2026 05:59:28 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:4c6b:e3c0:928d:b2cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm10250807f8f.1.2026.10.25.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:59:27 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] SUNRPC: Balance switch queue length on transport removal
Date: Sun, 25 Oct 2026 14:59:24 +0200
Message-ID: <20261025125923.2221205-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When call_connect_status() moves a task off a transport marked for
removal, it decrements xprt->queuelen but leaves the switch's
xps_queuelen unchanged. The stale count persists after the task
finishes and skews multipath transport selection.

Decrement xps_queuelen alongside xprt->queuelen, matching the normal
transport release path.

Fixes: 6f081693e7b2 ("sunrpc: remove an offlined xprt using sysfs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 net/sunrpc/clnt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
index 6cedc824cf82..9b980cfd1bd3 100644
--- a/net/sunrpc/clnt.c
+++ b/net/sunrpc/clnt.c
@@ -2257,6 +2257,7 @@ call_connect_status(struct rpc_task *task)
 
 				xprt_release(task);
 				value = atomic_long_dec_return(&xprt->queuelen);
+				atomic_long_dec(&xps->xps_queuelen);
 				if (value == 0)
 					rpc_xprt_switch_remove_xprt(xps, saved,
 								    true);

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.43.0

