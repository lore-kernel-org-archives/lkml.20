Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F4D376A0C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857273; cv=none; b=B8+YvA775ifphG1WsFZZ3zJf4KkDn0ghUGSsC0CQRhN/koX6BrhjR0BeYju1NAsj5LXn1lnhBjBZcn958ptW+NR4OsMK78M8tlIKMQLHxSctRVS+u2NeEYcvnapvsFB2rpftG5MwJ7UE8CvL3GTDVpWoErr4kZZ+fQSzGX7mqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857273; c=relaxed/simple;
	bh=YJbTTv0t2BWIFrbdxBZVugRFfM4btTyxQU6vJrhf3OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BHx301a0eBt+8mG1EJklj+bI9amyYWqY9ESHuOG2Q8rMZEw3J/7dDSkeqIOe8NO6rnShi/fQEYW8qYBA3DyaWvNaLuUGDasLkye9WwyGeQMExT3c1XGcY0k40jSgoOouaY5vsfm5swlBFZmIXSCU8nWGgry1eE5rLD+0+EvsixU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifYVTsZn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifYVTsZn"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso1493506a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857271; x=1790462071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UAwXKmx+R09A7nHDL9ZNtNOP7/6ryqJI8+NyxhqUBXc=;
        b=ifYVTsZnCqOjY48tPbQdI3BRb9dRV0zdTqv5LieteSjmT0VU8iVedFlA/rZKPdf7Ih
         WbMgK1oIPKQrio09BonuYkM9mBjxVyObXJHDggi2hXQnKQHn8SpNtJ+tuW/WA+Mlb5un
         bgLIb96RWYlzQXsCxylzF/GRizUTFB86FHd00pXOoBuDts5GRCRmdBLXDXBpAKPy8Sw3
         MwgtC2AnNWlqiY4KBQMZZe9pnB8YuSCZ/oaBBSD4iHR0cqXnopJYYN+Ar7iW2kSljL4o
         XOKhy8mPcVPpH9RXCMAfiML9LyEMDMp+QzpRLwepcJdxYr66oPrNrj3AQlX+8kDL4dvK
         3dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857271; x=1790462071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UAwXKmx+R09A7nHDL9ZNtNOP7/6ryqJI8+NyxhqUBXc=;
        b=qF0b7IaIBZwVjwSmZX2rjbRpfoF3CgWw5p05CAt9QSLKwX4Mhk97m+peUqBSO6+aTo
         X3+s1zjnfoJs8eDyPqhevBwFcz4El15tjBsXpgNgzlboluJPHzYs//9JRHRP53Nn08Vl
         aMBqsRhG7zvuW4HDiHfjVgpjNeBdWY83hZ3N7GzqfQWDEbzQ5IggAmYbUMyZrtev5W77
         BPLBrBQWHEC2I+iBkk1W2x9xgwtH+ZTphEai6354KHGxc/Z+ZpwCjwCwbr1LHyyTySSI
         7U2iCYMr/g4/uPPdHHCeEyb5oWJYfhTClfyIYdtCG9GuscO00saUFBtO+E1Q9DdVDNSc
         kCYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH2jmW0q02hM1MRTCnLkuRrPuUo2Dx/+vZ1MnkiNoiyaGfWLq2yGQ2XT6zHEIH4Ha2DvoDcBjZZuADeLw=@vger.kernel.org
X-Gm-Message-State: AFuF++npegkFK2MAkAwS0hKxr4Sqr9spCpwvpL4ycIzsfnyixxEgZRx8
	5qshSURDmMCmsoFIaUglf9Ez3bj9bg7w/z01cp4E2j/PJV0RIkpnCzj3
X-Gm-Gg: AYBFou01XCc11uLY+cUbcH7OdcM9prJPyuzla4zM0g3PV13UO9Ip9WR6Em6Exu/jieg
	BbFYi1empB9aDWPg370sLeCR+t9ZU/kmiNTLNGQPOVlDLcVkAAOWAcBNB4xIyhj6h4qeJIkTiUl
	onvwhLR0jmm6YjFod7PuQpc9pqr8xppTxDUEe32hBvQZ1LWFK2g2gOJA1g9E5j4UqjBpeYzMt0b
	0EsI/hApuRXK+bx+c5byJc47CbqmsEbiw/cBBZWpyT7/oaXugWGVIJH1bVLB9J7y1DnfXzn7RAC
	fJPYJ9ymwG0SGVMFA/qD4LMmeZgax1r+EUK4g8FRvOH7I/bkXZ6NlZs0UxRDMir8ADLfgAz5JUo
	h5rTBnxAThQoT21qMX2hVTcxaIITjdAzBC5joJebhiWqybudIrigAPaPZsvtGB0szlvgr0hTvLG
	spqKv9RIKoJfk80tP6eUSDZ2tHqqcSOpqa0lN2QXrEBeH0tHp7hCDe/lnX9oIKJO1Q3WVRuXNq0
	VQLhfgzyo6QvvpbRmTVKlrAaqjMtY9NzD+u6aQpIZEIQmEnzkzm/MVucP4S4+NbTz3/7nk3Tj/V
	0+oK6SVijg==
X-Received: by 2002:a17:90b:3883:b0:39e:6c68:1559 with SMTP id 98e67ed59e1d1-39e6c683328mr5728171a91.33.1789857270696;
        Sat, 19 Sep 2026 15:34:30 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55b83602sm4702164a91.1.2026.09.19.15.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:34:30 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: achender@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net/rds: fix incoming message refcount leak and header bounds check in rds_recv.c
Date: Sat, 19 Sep 2026 22:34:29 +0000
Message-ID: <20260919223429.3882046-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In net/rds/recv.c, ensure incoming RDS message references (rds_inc_put)
and socket receive queue bounds are properly balanced when handling
error or truncated incoming frames.

Fixes: bdbe6fbc6a2f ("RDS: recv.c")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/net/rds/recv.c b/net/rds/recv.c
index 6204e577a90a..0743706af8ca 100644
--- a/net/rds/recv.c
+++ b/net/rds/recv.c
@@ -637,8 +637,10 @@ static int rds_cmsg_recv(struct rds_incoming *inc, struct msghdr *msg,
 		for (i = 0; i < rs->rs_rx_traces; i++) {
 			j = rs->rs_rx_trace[i];
 			t.rx_trace_pos[i] = j;
-			t.rx_trace[i] = inc->i_rx_lat_trace[j + 1] -
-					  inc->i_rx_lat_trace[j];
+			if (inc->i_rx_lat_trace[j + 1] &&
+			    inc->i_rx_lat_trace[j])
+				t.rx_trace[i] = inc->i_rx_lat_trace[j + 1] -
+						inc->i_rx_lat_trace[j];
 		}
 
 		ret = put_cmsg(msg, SOL_RDS, RDS_CMSG_RXPATH_LATENCY,
