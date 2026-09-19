Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA00363C72
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853332; cv=none; b=imXpEg1QjNOsffmN9eQX76kzdcvMzu/XFfCeZHBNo4HQe2GeAHg+2XOQs462dLA3m6NBs/+dLt5bVKmfvqTOv6xodmkbzp+SxOTA/4HDB2snvLBJYYs36WldoOt20nZRTBcejAfRiUc1fY0e3cgfUlmQWXxl29LjHy7BqKy9+0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853332; c=relaxed/simple;
	bh=txBOqJNUqUZdel+9yUNyCOiCDqWDPLD8LNB84oXPLPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9qjo6euL8JMc5XmVD4Ra6G6cjev11g7RW9S1rZKe+M6rbv7y6JJQZePwUC94jjhfT9gSdjrcsrvWirt5OJcxypClEUlUEXDRkwdGkQtTzhShhUthbubefyfH8XgJcEKdOS5aM1lJ70itG7M0eQaJzHpAEZ6+ejUJ3lqMgUNksw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIXvWwE9; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIXvWwE9"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1481946a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853329; x=1790458129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eGfBY0P65oH7gmD1rjRA1pJgtFrGgNFWTZNcEsIhx08=;
        b=rIXvWwE9MJ8ClY7NHE0LoGMHaCwYyQFBbP62Yi5a/dygd/DbiGFoaUyl6mw4CT0uhi
         3kXKgsBo6swtb6ZYlXENiGdHzyv2WvR9xVFBdzfPgdGi+6rnDopzzwqHNOAc0jyQpEtv
         qHhFccSeqP3LXA1sPZ+y0gtapUbgn/nT8YvxKMparIc+f3JNjBbw5yxM2i0qJYdqgHu1
         IXh1Hf6hsZZgMweFq5RwjpFHdMdHWi19JpRFpFfJmCLReUoI4ou0JYXktu9zzmUUQH8K
         qm/PqFYC90UUw5a9OVm0rU3+Axe/XGytal6l7wFnZPQp9Yw+YfGuyJ+c7HmXlWCa9Klu
         4Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853329; x=1790458129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGfBY0P65oH7gmD1rjRA1pJgtFrGgNFWTZNcEsIhx08=;
        b=bo/7jf0/HTevrKfOJHg8VjLA995/lbW8grsUvpIqTJHtpmSUQIba1IQHS3mqraQsSP
         qcleBihPgJ7p9Z4Yh1IgLno3pOHS5Tquaz4MbdSP9iBja/CwAQ13NNNOWeON70W+xNTy
         8TfsVIDhCc/JA9svvvw/joVoQHx0oXQhEik1kKwfSzPLTDf+l8FSS69CHVybbY/37YGw
         loBqKJ16F76QCy5GEWJt6cba8KaA54phl/AtiVzu4FLTEIihAut+dzxxY3aLtac9/rI+
         ehWLPjHCS+jkIjXShws7L5e9aqb01IZgVzxWLcWyTYoaQ3aA+xtyk0A9vMtHI7+k02Bh
         cORQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs4r1kO6gtI0C0Pz6QAADVT4eDA8nU6Q3J/xNkzgmKmQWaANOOPwag1s1G5/eLZ9UKEhtBjXre81Trx9c=@vger.kernel.org
X-Gm-Message-State: AFuF++lr6FQ9wOf/Z8kDF4CHH5K21c5y19NW0borYe/O35YoheGActc+
	mMESPPt92+4gKFPI2n7x6C5xdiAipp7TbweZWfQ+BZsbl5MdJnKdfjYX
X-Gm-Gg: AYBFou09Nxme4dDz4VJy1E0+tcON8EhrjpKh08uynDsUvzNDojjgdlL3QkpxnFPOLU4
	TS/MuZP+wQCXgyqueVKxxFJVH+TP310cjnJFLIy8BYku+Uin7hj/PLUR6psGn/CXPQZvA1YVi6R
	942CpfjsJS1+tulqogDgNWiaqN+QxksQvvMQfkbpoS7X84+x4nS+GCcFnpsCHUobxmFbQ8kpC9u
	r+s2Anb+BRdMOknM+yGidas9Hct47dFU5rrJDRvBOMFrylHVOsjGUWLbBTsrcMFIsCOMkBrsTSp
	T1D18tsJWC6Vs3liGuXwHbvdAC51+HNbdLP6Vn7D3Tsh/2GyNLfQp4q0TcoYJGa3iOnZMiOrWpA
	MV8HmX5HF27fnYphRaoBxdpLsV+dA/VIUQ1aTKvE90MdBwIPORnlfIPxb0TDXqe+mnj7q+cLR72
	LAd7ruCXk2/UAjw05UM+HjoXscJ7H7yCeAdBQ9kv1GPJmv5v01Me/30KZ1r4wRupahL0S4/4h7x
	QxBF6UA2/XuYpeu6AMjckjFWAFyoYoHSTvOp9ZHAg9ziMLcf6ukvEV7Dqrc79WbQkGX2FR60alS
	1o/Ynz/aSQ==
X-Received: by 2002:a17:90b:2e0b:b0:39e:6c68:c78a with SMTP id 98e67ed59e1d1-39e6c68ca60mr4787983a91.64.1789853328817;
        Sat, 19 Sep 2026 14:28:48 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a026898b76sm3869604a91.16.2026.09.19.14.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:28:48 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: mani@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: qrtr: use u32 for port in qrtr_port_assign() and __qrtr_bind()
Date: Sat, 19 Sep 2026 21:28:47 +0000
Message-ID: <20260919212847.3239934-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In __qrtr_bind() and qrtr_port_assign(), the port number copied from the
unsigned `u32 addr->sq_port` field is stored in a signed `int port`
variable.

When a user supplies a port number with bit 31 set (`addr->sq_port >=
0x80000000`), `*port` becomes negative:

1. The privileged port check `*port < QRTR_MIN_EPH_SOCKET` (`0x4000`)
   evaluates to true for any negative `int`, requiring `CAP_NET_ADMIN`,
   or conversely in `idr_alloc_u32(&qrtr_ports, ipc, port, *port,
   GFP_ATOMIC)`, passing a `int *` cast to `u32 *` risks signed/unsigned
   mismatch.
2. Changing `port` in `__qrtr_bind()` and `qrtr_port_assign()` from
   `int` to `u32` matches `struct sockaddr_qrtr`'s `u32 sq_port` and
   `idr_alloc_u32()`'s `u32 *` parameter.

Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/qrtr/af_qrtr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 78347c937af7..cae7af5b9229 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -785,7 +785,7 @@ static void qrtr_port_remove(struct qrtr_sock *ipc)
  *   <QRTR_MIN_EPH_SOCKET: Specified; requires CAP_NET_ADMIN
  *   >QRTR_MIN_EPH_SOCKET: Specified; available to all
  */
-static int qrtr_port_assign(struct qrtr_sock *ipc, int *port)
+static int qrtr_port_assign(struct qrtr_sock *ipc, u32 *port)
 {
 	int rc;
 
@@ -835,7 +835,7 @@ static int __qrtr_bind(struct socket *sock,
 {
 	struct qrtr_sock *ipc = qrtr_sk(sock->sk);
 	struct sock *sk = sock->sk;
-	int port;
+	u32 port;
 	int rc;
 
 	/* rebinding ok */
-- 
2.55.0.1082.g2b9226bbc0-goog

