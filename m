Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342683;
	b=b/X5B76lh6Ika4XMgwP7bcu3xZagbzn/yOMnm7TGYFUWEYhhSDuk4s5mIyazsWL1W7LY
	 j6z5BhmRuFBexkm3EqxJFV6zabb5Q798XWHNUOIMrkcx9Fcp+tYRw9K5/K5yugK9Ul4eO
	 00aOIfYd268rVb/IOMm4uSW3xZlGb9X1v1WTwqiTatCoddLt/2Y4oT0do7bdqn/IjKFH2
	 u+qw1NQy5f4c5TmxKQK3mvY4HjHFr6RQ3V3YyULKTzECz8se4irD9RJbESwsxy5Kq/Q2f
	 i5d5GRJxenIgDWZcV80idTyFbuPeIwMvTdQcGp3TvTsm4tY1sHGM7JHoI/pwB/qZWvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KVgic764o0iBpmXvPU3DCQnb57odNSKZ7p6xGDlXMlc=;
	b=D3B/t+2/HMA+5Jh3YK0T4RzKaHG+kZwvGo2pGaio5BSQ9iZiTCd0Iv3GxNaJp0i9E7EI
	 aVNenUP2b4qzKZ7HdxLK+qgqdGp/6/cvyn0eO0kW5w3x0GeZc2oy32lqnXeStIIg+vIUu
	 NUAZRzZlXanleWFDSZ6xF1O5acJx4801RtBTtfl7jsjeAGpBq6LjqVk2h4r71NT3VKs9S
	 tUnDnvsQxtxJwjP+GG5RFfkyqpl/Dmnm94sw4LrQRhHGtG0gighh60Q0lVMOQPqzWI/hX
	 OKYc59twuLOPM62z7I5HWd8XpfPi9sLPnPW5KGWDcs7Uhfn9AN1cqOtVpekxzCxqctA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aipXEA6J;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94F8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aipXEA6J
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so246890b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793342682; x=1793947482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVgic764o0iBpmXvPU3DCQnb57odNSKZ7p6xGDlXMlc=;
        b=aipXEA6JAApVHjDKmzVEGRXy9PdB/5s0w6omxzgzDN/CSCHQUtbciRfLoVEAx966Oh
         AGl2/2al8EFD0reNSEMGxdw6mwROiysRLy//jh9f1b1djY5j7BF3QqGyiOpY7eXKWkIx
         ShlJ+kxMLJgvviBWicaEvoVrZCLlYKCcIFGjih2xMgJlCtJUZUDg1yxZJMpfkQtW1f6w
         gzJxqesAoL59H8sfOv9o3jqnGOX6/Htk3Cm8zqCKTsIn9U0jBLdAh8db8IYaJTs/Raix
         hOZq3/zaMADwO+km6d2iDg5XAWmH9fhFTavj5mmRR8mbUNOQz1eHUI6dEprlw4Top0RH
         7Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342682; x=1793947482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVgic764o0iBpmXvPU3DCQnb57odNSKZ7p6xGDlXMlc=;
        b=GjxPodzVUIxToCNm3ojSZwXv0sxhO6x5Wje+pjKNw45kHMy00gCaOq1pveEucvDGAf
         Um8W2guaS1vU0qXYliIx9RkCy17Cl3icKTKBa100CLl1A6UxkRFcrFRYQIgn4BAQ2epH
         NFGxg3SrJRNFZGVj59de8OHvyS4lUsT+K1ATkfaOU3LFGGkIfeeGXM3qnlqHs4v8KYvW
         al7sZ7RrWzPX8MCEvvEwkGqZyp8OuThO5RSNmjMobo5ET1W5xE2Q5846Y/VhAw92e8Ts
         n+G5oozFPB5/FPRoONTF8lvLJSc1qHQaCbxklV0wE8nOFTCnMM0iHJetQfaoodHkKui5
         OO/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMtLnjklZBRiegENsbY0D8mS56NsQxDK8FK/Q1TrJDz2UeHWjoXWank+am4tMJti/WkJD/uSuRNY0rvCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyhPmeP4ik0y1g+kRYqaOtMVhK754aK8kxbQv7OUYjmCq7t/FA
	L2yW2gKj08RpevItzLLqWv0K4oOTpq7Mn1Q/f8MbGMtk5n74IW6gnQ1+
X-Gm-Gg: AYBFou1dUuubHtqL3NiVm5kuzNAMxGzZ6/XiNDs7fxLMbkamn96uASnKzKjhpu9CDxy
	fpCjujzqrq9XpV+MyW6PvKHR2QKxUA9ByW1y+pAhffrCZoPhWk1kWQqdUv1HCiDkWCvlKt2RxuB
	+JFWvgFbQMGXq3uDC0LidwMsuiJX6vaI39Kt3Fy070i0Z1ql++uCEUHnXGFDJ/5l/ApGQO8GrgC
	nnfff0Ua1fKyfmsotd7ZyKU3VU8r2ya23jZJZhiHRRYMakdV/2nJ7LlZd7RBnGDwyiRaJjX4Sxw
	8woqxcwVfaBS+No6CkIXvUQjkZhRRcS0TUuWP7aAhe2zEsFAt+VfV98XBIsPs7nVHKVbNNA19d+
	YcSkJ1EgEXhb8NVtK7xKH83OKBo4QzDPVgz5x4IFfthEb/dIvxpZ66HocepSIrATRXAIBIqwcGP
	drhXhdA8TwMXTjHFt1wVUyXV1jfsXXsvKErMD5YnKjq557W8VmRNdyURepiRyqFl87JvLqLnmlt
	cjD4Mb3Y/i+GUDY5nOdl8TVQ7cjdVBmwIpmjX51ewl0BVf+HibDD5mabjY1i3JmXcy2Y0IcT2gG
	xzD6aV89+BuRaW8/2mCJsRUm5jKWOKWE315sWZ+RPA==
X-Received: by 2002:a05:6a00:4612:b0:857:726d:2e96 with SMTP id d2e1a72fcca58-8a9bd1faff2mr1359294b3a.19.1793342682057;
        Thu, 29 Oct 2026 23:44:42 -0700 (PDT)
Received: from localhost.localdomain ([147.136.157.1])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8a9ef56b38dsm363397b3a.31.2026.10.29.23.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:44:41 -0700 (PDT)
From: phind.uet@gmail.com
To: Stefano Garzarella <sgarzare@redhat.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	George Zhang <georgezhang@vmware.com>,
	Andy King <acking@vmware.com>,
	Dmitry Torokhov <dtor@vmware.com>
Cc: Nguyen Dinh Phi <phind.uet@gmail.com>,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vsock: reject negative tv_usec in SO_VM_SOCKETS_CONNECT_TIMEOUT
Date: Fri, 30 Oct 2026 14:43:50 +0800
Message-ID: <20261030064428.73930-1-phind.uet@gmail.com>
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

From: Nguyen Dinh Phi <phind.uet@gmail.com>

The timeval validation checks tv_usec < USEC_PER_SEC but not
tv_usec >= 0, so a negative tv_usec makes the timeout computation
wrap into a bogus value, later tripping "schedule_timeout: wrong
timeout value" instead of being rejected.

Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
 net/vmw_vsock/af_vsock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index d0508887a2fb..1d7d53542724 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2156,7 +2156,8 @@ static int vsock_connectible_setsockopt(struct socket *sock,
 					     optname == SO_VM_SOCKETS_CONNECT_TIMEOUT_OLD);
 		if (err)
 			break;
-		if (tv.tv_sec >= 0 && tv.tv_usec < USEC_PER_SEC &&
+		if (tv.tv_sec >= 0 && tv.tv_usec >= 0 &&
+		    tv.tv_usec < USEC_PER_SEC &&
 		    tv.tv_sec < (MAX_SCHEDULE_TIMEOUT / HZ - 1)) {
 			vsk->connect_timeout = tv.tv_sec * HZ +
 				DIV_ROUND_UP((unsigned long)tv.tv_usec, (USEC_PER_SEC / HZ));
-- 
2.43.0

