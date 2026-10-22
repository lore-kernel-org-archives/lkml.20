Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660175;
	b=hC+V3Ao7F/S7REDRjPpYsmVEruDQRj6Blq+nXQqA8viDuh/q1Qj1Gmo4WgQM68v7hV8e
	 iQ7dPYufBjEEQlMalYhay2El22bGW4KE060IRuSEIuh4UEdJ6ztYn3B+NvjTkEMolUrtz
	 EBlqbOndVUbzl0FtNvLZk/bnNJ2X/skBFdtlc+fLG195VANg7to2INpULIhVwhD4iQIov
	 X93hdcvk9DwZK8oDzg43BnAJKRA990cXPczJDcIKQ44ooIJWKAGHmTesL24mXj1bsp8Jj
	 0DyKO6RMNRdd7hXnjVQWwbTygaDstFoMc4tOicGrp9+NLnAU+VhGhyBqjYesKGi4zuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I1otG1lzuT2TL603n+ZyA3mzLoyhPcar5mVP11oCq/4=;
	b=cBNjN01Y5VglwCcaP8ne1yLQxBQ/bWLh+NckFARdlivJz4hnd9DyrckWpUwzI13pOB13
	 x+AZ3izxAw3vSeQqoGislxu75NOPqM+66QsrsPrNGqRQUd2hw3kvN6FYsIC9NSBg9JIaL
	 qFs+Av740ONtdtwZ6ClFQjOJwcmJ93/Y5FnJIZmr7cIyvtz689viwXVvjwM+c27YdqCu7
	 dOGaiybzXr2JIRcjgdYwDPczlYtoHbAjO4rq4QpW5yiExxHeiP2GcxhhjlFuXsKQb72Bb
	 yV9oRpMIY1RwHYRWyNesFvqG/UR2FtGaacfknAsn53Jy9wJ2vsCfBH5Ldi8Bhjf34LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awUZGDvU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea24wtUy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA4606A335
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCA4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=awUZGDvU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea24wtUy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8NdKh3776637
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I1otG1lzuT2TL603n+ZyA3mzLoyhPcar5mVP11oCq/4=; b=awUZGDvUo381zakE
	6IlU2NFPZS8CF4z1toImlJP1v4c1Us3D8S8tMGlDHsaLjViCgF5tKaRlScW2sGNR
	nzmedS4PMfnjR80vijvCqrG+GaG9VAtgMPp61NXNNJ+RGPWnoUrwzavCYwRD9Fqi
	Xu94BxbDRb0fejtCJuA7qXSkwI800z1MI2kh4i77allNd8iPzTyOwc1uN4mPJvyG
	HyzsOwQKdSGYfdPjTtbmSVQJ9M5NPr42HxJ+UdPWqwgtVfKifdlqH+nVZWQnYBBJ
	eGs2OR9c60sSgnLWeeuN0rZli8aJruEX5nBv+Y6TGTDLvc39pLaVUWJWwRKTO1A6
	EIc1wA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9jmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:34 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so1555484c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660173; x=1793264973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1otG1lzuT2TL603n+ZyA3mzLoyhPcar5mVP11oCq/4=;
        b=Ea24wtUyaW/1mp5kCSKxinV7weiADb7vlc+rbTVs4Rr6MVQ0Ktx7fQOHqsL4vjeYLI
         ReKEHJ3LB9QnoXMjsiIJlhjxwkDxYHwlJfZwe7ZkbSJqKckXJS26Lug9qJ4EuoE2+5XW
         oZqsGwWsFJb9/ixpUl5dHVTkLAfM3hjjA44K3fDZMnjjcJeAcCJLAqqIPgei0WwpIKfR
         f/lk+QftV703uCBVWBgIp1FExn91gyvvvKd0M9SjAMb6Tq9LVgSbmIq6YL9P7vLEI8T1
         FKTVyCZBstxtJlM0Ecc+YUnNzjqWwtigzAZnXB5MG5rFA0EUfewhvAtxAaGpHVwDhtQJ
         Ci6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660173; x=1793264973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1otG1lzuT2TL603n+ZyA3mzLoyhPcar5mVP11oCq/4=;
        b=alm1DnmHpMIbhPVAI5vx6meDDt7HPs7i7yP2gwo/u/o6qz3D7ivbp9oyLPV9bkKNJ8
         8LNCNgJrVWYvB7Lmv1U/40PQ4Fb699YOHfGm8/camjh/XDdQBNqFvT/qJoMs4xlvD+Kf
         SZWdEnb2c76uar9K8u6r0t3ZF+hohCaz3XpmGmnHeY9//Y3q46mboWQ4iDVVufw57gj4
         hLrYd41v0ily8Sxg1aMZudvu6uUCERVZTXOHFw9Y9L9s0u6aSWs56jooO2ugltc8iyGh
         LsuIKEtCyI3b27+xnVDGOKywb77KcFdQsi/wdNzI0WCAMiLoqQnOImz9rZCko5mhPBbd
         6n6w==
X-Forwarded-Encrypted: i=1; AKwUvBzn8sgFDMbLnusm53E46RpU7Vl+wcBCeaIBLz0zmo3oooZ2ON8ZOl768M8LtI/TgPdYtq/C7S8PKJ96FK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXS8q2bqmg/gkTFqq5OfsKH0xI+CjGBA5MIPg0Kdxu/zft/ZZ6
	4VBk2EuXhZtY4f64TEng+p07TMFn42pVi+c0Sb7N+2H1QPgZl5SnmPj+OXX2a2k0cdZUT+FbYWp
	UzhZS4QMG/MyfniilqWQbHg6RIb8RJnNfVKFQTSEj2cv+NwMR3jE3i1NrN5CRGgYxAVc=
X-Gm-Gg: AYBFou0gAGkTCDlepjG6gipAc85JuImUMjz6ChdB9TsChc5Q/Vks/5a40dl2COODrik
	/4axMqUZOZFrrncS2S57UXXC1II18M6M6NwDfSUa/J6HUnaDw1ag7nAIM7L0eYJbsy2Btuf+hNJ
	voBNRoMxkpZ+mmQpGo0rK4EpWSLO5Jg91x4LXhZSQCf6qhOC/NRu0ffF5o9Zt/h7vM8ImWCYcVA
	Nq7zvNfLoJa5CrmCmvkBLASnRd3ALkiRUehHv8aDm2PawrR9HnNEcnk99iWo6AOrX4Dof9/k5rz
	PBPM3bYmryZnipPY9+GlVLDgqtS1aUH3Dqmcsn5lqNxOqrOmJKzJ/4pYaQlT0YxhVDfUtOn5yof
	X2Kw2Gwj/DI2VOzCroupz5YDn+PyOn7q2
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr6565166c88.15.1792660173269;
        Thu, 22 Oct 2026 02:09:33 -0700 (PDT)
X-Received: by 2002:a05:7022:3f09:b0:18b:bce0:a227 with SMTP id a92af1059eb24-190a6adcd36mr6565116c88.15.1792660172672;
        Thu, 22 Oct 2026 02:09:32 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180b9esm20475694c88.4.2026.10.22.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:09:32 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:38:47 +0530
Subject: [PATCH v2 1/2] misc: fastrpc: fix NULL rpdev dereference when
 session alloc fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-fastrpc-probe-fixes-v2-1-a6b3f6f62571@oss.qualcomm.com>
References: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
In-Reply-To: <20261022-fastrpc-probe-fixes-v2-0-a6b3f6f62571@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660163; l=2456;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=gXjATeM4mZmReR8r0Cip4k+l0pcgcK7OC7jL7Usz15g=;
 b=8iJBr+ATdJCU8iVTzYlUb94TGIBcH2KOuljI0XoPmBRr5XGtpiQDEOswWN590/Yv2vamfMEy3
 TbUqejlm+2lDL+f2YkKmWMu7HVv5HlkgMxM3BKl9mdpWAdKCNExxSM6
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX4qjlZwY0z1jP
 sGkW+vLxsGI/j6BH7wdYEs41BaicCf2XrtmOu3IBI6kA7bVRro1e7Zr+o3J1Yrwrx6drDUaL8As
 lT1aK3ad3Q/l3Fw/INLL+0KViNCoH4c=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9d2ce cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HPkHAgnwbDoOiCnvmVMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: qytao9W1-iP79zylj97WR7C1wK8VyJ9h
X-Proofpoint-ORIG-GUID: qytao9W1-iP79zylj97WR7C1wK8VyJ9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX69wf68a6odRi
 HqN+xqvcyMXcMsdeQCU6sJzXGoDAZy64s88JclIJu2UfjiKvHhDSIKLivs44/FQD60isnd56s/x
 mXw8D1wgBCWy3N5TWSCUgZoiEqGZ+CwYUxxnGAZPB3xJ+pmPwaDQWAJfv8DVuzUOdEUClXOKLoj
 h3qPpEEJYif0gSHnORMsBuDhgeoE1cfy0P1vj8ZnwqQDBgwjGVyuRHUBFqgctXDeq9qJiHR38N6
 wLKV9R/Q7tSEKr9ZP7bIYifZfNP/HBvl6B+HuI/sE3iAnElah8wB6brEle5QRRPY2wworuiSiYG
 sSUEaGvTsFsGFdXl0tFtyoz3+yCRQ5luTzVGRY75oKZ7EwF8OPKiHB8XdaeBdQzxr+lYKH2lbEl
 Eye30zpoDXQQ4p9gPFmCJPNNKujTuh+dvk1S1VdArXSMyEDOmsLWqEd0/MhR6CgBGOZqU5RPX+X
 PeYLayo7QvnCDi8YffQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

When a fastrpc client process dies abnormally without closing its file
descriptor, fastrpc_device_release() is never called and the compute-cb
session slot is never freed. The abnormal client death on the DSP side
triggers a glink channel teardown which propagates up through the rpmsg
bus and calls fastrpc_rpmsg_remove().

fastrpc_rpmsg_remove() nulls cctx->rpdev before calling
misc_deregister(). If a concurrent open() enters fastrpc_device_open()
in this window and fastrpc_session_alloc() returns NULL (sessions
exhausted by the leaked slot), the error path dereferences
cctx->rpdev->dev causing a NULL pointer dereference:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  pc : fastrpc_device_open+0x1b8/0x258 [fastrpc]
  Call trace:
   fastrpc_device_open+0x1b8/0x258 [fastrpc] (P)
   misc_open+0xd8/0x1a0

Fix by moving misc_deregister() before rpdev = NULL. misc_open() and
misc_deregister() both take misc_mtx, so misc_deregister() will either
block until fastrpc_device_open() completes or prevent new opens from
entering it entirely.

Fixes: 7c11df42d0c7 ("misc: fastrpc: Fix device_open when no session is available")
Cc: stable@vger.kernel.org
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5dd1990d3e2a..f280bff2edf0 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2697,6 +2697,12 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_user *user;
 	unsigned long flags;
 
+	if (cctx->fdevice)
+		misc_deregister(&cctx->fdevice->miscdev);
+
+	if (cctx->secure_fdevice)
+		misc_deregister(&cctx->secure_fdevice->miscdev);
+
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
 	cctx->rpdev = NULL;
@@ -2704,12 +2710,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 		fastrpc_notify_users(user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	if (cctx->fdevice)
-		misc_deregister(&cctx->fdevice->miscdev);
-
-	if (cctx->secure_fdevice)
-		misc_deregister(&cctx->secure_fdevice->miscdev);
-
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 

-- 
2.34.1

