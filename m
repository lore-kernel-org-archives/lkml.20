Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF73E429014
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905225; cv=none; b=GSN2HuzivP2NXkHocg594aTuy81orVkKFEu/F8R0uhqzRdigOBRsBGvjO0b976AbHI5B36h81HBa3yhz+LY4vUO7ZAO+mMg+yKekCA8w33vY/ZQncU6sPCs31IC9hdje98xaIGzJI6Psgfl7g1CQr2zAo2Z2cOgC3GtZ7VythoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905225; c=relaxed/simple;
	bh=EdvgcP4aHZc8haPwmoIl6H1B9OiogdwgeO18M9WYPaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ieTqwwudyMDq8dsdu9cgS5Dqc/LMAvumB73xcr/2ktgUxjq1rEUOWtWe4DGQj520GCGk2Wc4oLEgq4ebPMigrYWJjlOX8Y0YRyAoKp3wSjrwyPK5F+jxtgNbBhpAM7mQHD5UDNyI3IAy9K5yS65XXhj7cdqDczQLAoXELunthUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJ/lIkJ3; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJ/lIkJ3"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398c066106cso1684215a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789905221; x=1790510021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oWY25NeFXFYHw+xb7xVpN+y7ofPMo41LdHxDaElxJf8=;
        b=BJ/lIkJ3AYOwFIZD7yeT+bs3Mif8lQbppMOXA1fSTQtouoCuVDD6llZ8XDZqb9shVq
         9jgdD1k2ENb97iLrlnUtKiwkGcmPLg5eT3JpqbGBptGo/qOH5xQKgtHA9gLCuMyEx4u2
         YhyL0/kN+cTMLks8b/aFt8wtyVVqTng3EbaeutiMN9B4/o43Q1ub4u4JDHWc/A4dbUdH
         pkYlkZ4JJdXB/6wtbtEbBbjhAmVthKu+cNaR8pEsOUC/wYkW/89Se76+z3K1JAFceGla
         YWrYpIEM9qXDtvSISl4j2ppL738NAPQOgvzm2jc3D2nfVxEv1X0qsizLRFhMlNE4URte
         /fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789905221; x=1790510021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWY25NeFXFYHw+xb7xVpN+y7ofPMo41LdHxDaElxJf8=;
        b=qAjnXZgYOCHqY5D7cIsOLda+8lS3t39D+lWhGOnpPS+ddpdzhoI0CRAtGkyjAS05YV
         VHk7MOu7uwg4QpPa0/6eJ1NAG1L4mFGaXllDxUCFTXKoljCzedagMrSiVR96EMeXpO7Y
         ml4CoxtCkvIcIx+3q1s4WqRy0Ysd0InFeBdhI5dW9swoWP3KZkUgcC0jjoweHg004doP
         4hBUzP6jfRfe/EAyUG2paGx1PSQvPaobreuBRKN7zxUfXr9xhjm78bhUsuT9vRmyH+/s
         eZ0uMu8fhteTg9aULPVcDlcP5QFuzRO45N07F2YtyA4s5uDP/CQQzYfgli2EApSNMSdh
         f05Q==
X-Forwarded-Encrypted: i=1; AKwUvBxa0tzfL0S+jwC4qP3sl1pEXLk6pmuFWgA7GtI1T95PPAGSz+39KYFAg22BFmfiMNItm8R2rm+uxidfm5A=@vger.kernel.org
X-Gm-Message-State: AFuF++nRjcstdFD08iUqru8vVp4myNUBSmKdwnTA1PQm3QM3Gcty5acI
	1jshTEdA6JwWUNgFZcE/UipS3Nblbe14u4n/jLotluFNUhY+8Ua3A543
X-Gm-Gg: AYBFou25gmDK/CrE5Xh7M73u/oAaJbaxrh6/s4HjNv/g/k3LkFNjynbCzKBVShUUnmb
	DZ/+fkjrsGz5wle3Sg5NBKfcPu3PRalQnDmHXbURQlXdQ161i/idv5aR0f5ka6QnZERBNWAu9AS
	NHY4OGqlOBJRMIecKrNkmVxzIu0Zkvf+5GIuDClNoTGeibZNL1Yqxu0aS2tt+xRXhOWrrf/IsHm
	jcVFONR7R6DfcPf2fsasnmQx8znOJ7eaaSRDNmskv4wE1coH8lek490U2X5E+str6vBx/P0iUaG
	oichDyp4O+Hxq6ts91Xj+xRE3xvd1u3wYLi9siGx06i/Ltx8LOWGGtlW2ZCoHeOkPPHFXipRq1X
	WxslYXlXB+XCRHiB5cgoHI9tRwS3oYYCkxmAT+5hdokvGaLuGd5PuLdytxMn8L4M/JqB5EIykrT
	Ch6qMq7sNLoAAEBn97x+oSO5hOxpbsju7zO6fIXdBtAiCGOOpe1mFPhh7Y8e1VhM/K4KNU0NV5G
	9qn9/8hzF/HzkY=
X-Received: by 2002:a17:90b:4fcf:b0:39e:6c68:1550 with SMTP id 98e67ed59e1d1-39e6c6832d7mr8193562a91.24.1789905221398;
        Sun, 20 Sep 2026 04:53:41 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:2022:c2a9:de8:d005])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm8537927a91.0.2026.09.20.04.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 04:53:40 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>
Cc: ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+21f8628595b2061c438d@syzkaller.appspotmail.com
Subject: [PATCH] libceph: reject bad connect_seq in msgr1 READY reply
Date: Sun, 20 Sep 2026 18:53:34 +0700
Message-ID: <20260920115334.16219-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

process_connect() WARN_ON()s when the peer's READY/SEQ reply carries a
connect_seq other than ours + 1. That value comes off the wire, so a
misbehaving or malicious server can trigger the warning at will (and
panic machines running with panic_on_warn).

Check it before touching connection state and fail the connection with
a protocol error instead, like the other bad-reply cases here.

Reported-by: syzbot+21f8628595b2061c438d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=21f8628595b2061c438d
Fixes: 31b8006e10a4 ("ceph: messenger library")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 net/ceph/messenger_v1.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/ceph/messenger_v1.c b/net/ceph/messenger_v1.c
index c9e002d96319..b3ff3274344e 100644
--- a/net/ceph/messenger_v1.c
+++ b/net/ceph/messenger_v1.c
@@ -887,6 +887,12 @@ static int process_connect(struct ceph_connection *con)
 			return -1;
 		}
 
+		if (le32_to_cpu(con->v1.in_reply.connect_seq) !=
+		    con->v1.connect_seq + 1) {
+			con->error_msg = "protocol error, bad connect_seq";
+			return -1;
+		}
+
 		WARN_ON(con->state != CEPH_CON_S_V1_CONNECT_MSG);
 		con->state = CEPH_CON_S_OPEN;
 		con->v1.auth_retry = 0;    /* we authenticated; clear flag */
@@ -898,8 +904,6 @@ static int process_connect(struct ceph_connection *con)
 		     con->v1.peer_global_seq,
 		     le32_to_cpu(con->v1.in_reply.connect_seq),
 		     con->v1.connect_seq);
-		WARN_ON(con->v1.connect_seq !=
-			le32_to_cpu(con->v1.in_reply.connect_seq));
 
 		if (con->v1.in_reply.flags & CEPH_MSG_CONNECT_LOSSY)
 			ceph_con_flag_set(con, CEPH_CON_F_LOSSYTX);
-- 
2.43.0

