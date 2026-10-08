Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F823955CC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477538; cv=none; b=nrbBXFdC9AcC1f1itMEtHQ0K8I2NwLnX6ELJo2D5nJ7rcDsNDSmkMtYRtg9Y+KrNee7JitG9EigG2NgL3rY50mklunkMstNbWGVPC1ynjTku1iG4w18Xd+IGn0U1qJQwa1hwsQMOdx7yX+W6l4OyPW/y42Ahe5IEERrPWVeimHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477538; c=relaxed/simple;
	bh=B7/RTXGw6xEkN4S3aF0mbacVGPs2NY7fb3eIo7Z50+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GD8d1CFTlu4vLRRBveas2matYnZ/u5m71M7n7mXnztjTMVO4RjAwFcMBSEY6zrpbq1Thv1wWBTR2deNav6dL9jAkAxxd5cP9pXutcfrKypDxYMT8B+GDRfFqgD84BCTKu9gwKz+ZAJpkr2ZjwPh3yHzvKYUx51plNYLZVrDN9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bd12I3zl; arc=none smtp.client-ip=74.125.231.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bd12I3zl"
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-6de822d01f0so2183128eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477536; x=1792082336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcr1e3DelCZYM4o9phxk5vNklRMQLSyAKhNB5dBEr6o=;
        b=bd12I3zlGqyad1SU1bgON32oKdVg4UULWAImb6h+3sJnng3qlhcbkplvxvAkvuk4wy
         n7fxfP1/TRsOZqH/+7c4BzFXKjP7Yl7k4wliFAro8W/8j4Ze7RHGVoEkYBB+dVGXF17n
         BLwdE4Shb1LzlCR1TKekFl1fF25eYKIUcJFPEhPfUDv/lqxm7tqe0kvYFFRxCB3Vdm0l
         QJtS3AU2q4FwEkuhBWyr8qSG119ifKefVvF7EDPdv+EHNIvbwuPN5hTqBlZdsCX3IlcQ
         U1+KL5Z7GdhuL5BUi6Xnz65klnYNoncYECenOGTtbQSbSnh62anWF8f9bUzli/prkDxi
         dWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477536; x=1792082336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcr1e3DelCZYM4o9phxk5vNklRMQLSyAKhNB5dBEr6o=;
        b=AzyAz0DKKYZNS4mNgghr/YNCiEwGL1vxNsHtWJWkugkFIpCKyp4qeo5y3LJ25I1Zt7
         d/nzvqbh6MUbK+vUzVvkFTHSPlbBMvCIIkLHUuBfhFu/7o22kZqhwabqav9J/YWjrFEm
         +ogPFyT7NMH9OczLQaNHE829kQnbdlJ3Y6Gmhm/o+YLN3TA7mUk2TcA/VIzLngHLAo0l
         TJXsl/R3l4VV82Squ+7Jen4maECIftCRpoAu6Xq1mhXZzwk/dU/LIlr8tiu6Ws4gsIS2
         Ug/JaOCPI5CI5naxqFtfoZz5a6SgFzV7u7leEnN7iaDmCsaowg2vIskZ8ZwSW6r0Jskq
         rAPg==
X-Forwarded-Encrypted: i=1; AKwUvBw7DvpKw2VMAhEZYZfqJbmgIK3ZAqKEY1u2JlxS6H3ps9TS4IPCeb9yqXAjNHTd9/nBjs9bq9HZrXi0U2o=@vger.kernel.org
X-Gm-Message-State: AFuF++lxxB/3MDNigyCmNtCbJrL0R/BYfdHZSE7i3iojGmNpJ9AHzjjB
	jCccGWKskqBYs5w5pp80sawLUXUtpVywe2EBbvalGQX1YWnuuNJfhLNR
X-Gm-Gg: AYBFou3uk2pPxp2gOY0wtkCOcFqlSKZW91kt/v5lZAOQA2ELvTpA5oxbWoWokyigHhK
	ZOrmfr2trcdrdBbOdTd79bNuhSGo52IfDZjFm35B7/+8KaVwhDZ7ccrWOOmzCgMUQxAIMtQygQT
	5Mma69ql4P2hLzvRrW7005hYahuyG64TI7iciqi8gP3Vix2vX7BO/R3A/mHhlQkXS63Ud3ygHA7
	KRY4BUX4ZSdNCMUAeGzOQnIzHzqe771ckTxWwfXLpV/hn9a5/hkFXsEeR/b8l+Cm2xmSUpvzWLx
	8bOO2sFwEJdDZEY9M1yTvUaIpc2xcPCARf1cmLy8EA7GRfDqvxM/cynBtGL9QuHXX5E2PTBIh+W
	wt1rM3+Sx+UAT7hMv4tJ6aCqC5tlqVEvyrC8sTdFrKvB0bdVgHfv2PkyHuDL+fgXbUlhpbn+L9y
	IuvGx+3g2O6j9lTkkZ+s+FrbGqwQBx9PWKySIty//pTnNgpDAztF82uMc5CujyI3L7RNsNJFuJl
	GbOG4xanEshmy82VrravV2Mb7oK+VU0FtcD
X-Received: by 2002:a05:6820:1628:b0:6d7:a13d:fd7d with SMTP id 006d021491bc7-6e7a727cb87mr5941490eaf.53.1791477535895;
        Thu, 08 Oct 2026 09:38:55 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82fc7cc8ad4sm64328a34.7.2026.10.08.09.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:38:55 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] rds: fix out-of-bounds conn_path access via handshake NPATHS
Date: Fri,  9 Oct 2026 00:38:43 +0800
Message-ID: <20261008163843.957325-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Connections on the IB transport (t_mp_capable unset) own exactly one
rds_conn_path slot, but the peer can still claim eight lanes through
the NPATHS extension header of a handshake packet, and every
subsequent fan-out path then treats all eight entries as real: the
mp-start helper iterates conn->c_path[0..7], dereferencing cp->cp_conn,
taking cp->cp_lock and queueing delayed work on cp->cp_wq at 504-byte
strides into whatever comes after the single allocated slot (KASAN:
"Read of size 8 in rds_conn_path_connect_if_down").

The negotiated lane count is now clamped to the same value the
transport was allocated with (trans->t_mp_capable ?
RDS_MPATH_WORKERS : 1), so a peer can never ask us to walk lanes that
do not exist.

This vulnerability was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: ba3d1f480c7a ("net/rds: size a connection's path set by the transport it ends up with")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/rds/recv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/net/rds/recv.c
+++ b/net/rds/recv.c
@@ -224,7 +224,8 @@
 		/* Process extension header here */
 		switch (type) {
 		case RDS_EXTHDR_NPATHS:
-			new_npaths = min_t(int, RDS_MPATH_WORKERS,
+			new_npaths = min_t(int, conn->c_trans->t_mp_capable ?
+					   RDS_MPATH_WORKERS : 1,
 					   be16_to_cpu(buffer.rds_npaths));
 			break;
 		case RDS_EXTHDR_GEN_NUM:
--
2.43.7
