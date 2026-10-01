Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859D84E4331
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852542; cv=none; b=H5wpxSYgYNF6Lvsz0xnFqA33ws76RvRoELEiIpcCypURWX7DqujwYqT+c8r0zajPxYFnWFSO1QJB2qco2zR13gg+k7LmipIL9bHZvnFYCgiyqHgI2nszu7ZOwJ2e+kN7xiNr9W9rwTwIJtIxbTF2Qd9/2K6QxkQOP8mK8VcJ6Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852542; c=relaxed/simple;
	bh=03XIH2O6sdDp8jBNtcMZmDL3Sp8Yt02H690f7pWeLgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0W8ox/Kz0IvB8COCUECHfcRjk3f4rD7cWBCMicSsLnQQEEaBbeAxVMhWcDEW8nOT+wIYm+qWOGN7l+dbRDv7hPxqHXCKQ/kcCQ7S6QWzMMVGKt+yPKiur48DyG5Yqb1qzfiJTjX1IoxUHpBJVp4BNCx2tjD7omvf67SOUGU0cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpzTndIV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlvtPP+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpzTndIV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlvtPP+V"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xgXq2337518
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 11:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DkDbVRw9K0aMKne+WgAK+QVXIJQUCz5NzjDL4TgnTpo=; b=NpzTndIVx/e7yEO9
	DeCI7pfme7aKB/HMXORZ4AinIdJTVzu2XwSanrEdD19TzFL+1JFZHAUy0MQ7R3b3
	mUV8uU+thpH6Ffnq0+jJGSBuUksTPjnw62Vg2folDZbGKUdtcs0q2dLCqX5UALV6
	3ZWduSqf/9vQz23ZktCg75XH2JlNjPl+IG4WnZW9JHPg162yh139Omem7zxQpVOU
	AwesmdvzwF/cQ4iYQeQ/E5OEjNiCAhq/IvOfw/+vgcmRUViYAZUEyfwO4hhInLst
	xFxUUDnp57IC9NMbbWBNUWDAuctsVSjCuOSKzz4LqNpHR6ghIGkDtits6b1TH8IT
	OJRamw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n24j6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:02:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3857214a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852533; x=1791457333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkDbVRw9K0aMKne+WgAK+QVXIJQUCz5NzjDL4TgnTpo=;
        b=PlvtPP+VEYxw4Oq4sBYpluYllUwDKWDeXeog5FH9sLzYiQ7vqxaA7NH89Fwqb0k2Ip
         Mj/S6Mrdd8KW++merWgFK14xeVzuwL6sxhw6XqZhDbIZRnDVQjlQMCtBcML7NvUsO4m7
         1QUWpbyaRs0WCtDMgY3cNghh5t3XUK9DEmAWlJTphJFv/AHG+sD6Hm/0Wayg7E9lMfCA
         vJYD3XnZA8jIusf/gJDbn9ooY30wXwzjyoUeSgr3eOBJVx9NJbDnwK7zgpTVASdUSo/r
         CIg3BV3xhP9P1zZH8+5EJvOmd6Jm9vf3rttIoNEPxhp2alwzdWOS1f6R7if0ZK8E3wJT
         xtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852533; x=1791457333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkDbVRw9K0aMKne+WgAK+QVXIJQUCz5NzjDL4TgnTpo=;
        b=HrTgP8uLilbA2hCGc1FYhS32b/WowTmq1HK+3asn+UBzrbocas9z5vUbP+xCszCK0r
         eSugtS/7w8KN63VN+2ZdjBnPZV/IqRciyEskSxK54mR78i9t56Zm5ADYTxRoQp0eE2AZ
         7xF2LYF1ssKvdwr6jfriN8hMNw3A+SxclX1oHfodNMHLxLlNytf0jv4x2lWU+HZXfq2N
         DUbQvJFTkQRf5q5vHl40HDJRC55JlFFbOR/LagiBwKIMHATC4KoUhQDB2CavqfxjG2uL
         XLGzPKl4GsPw+d6XVdq0rudQ5uzCwX4FBsUcbsbAfQZlmvPPkqK49bFxYljoRuCmTeL/
         QRug==
X-Forwarded-Encrypted: i=1; AKwUvByUKIAkDyi+tbroKoSHXc0DITCUD+QOGa0U/X9e0vExAIOw9i+KNO8NmsBz93M6kf/+TTudujKNHWlGQ1g=@vger.kernel.org
X-Gm-Message-State: AFuF++nQPtfMsqbQ+ci5KvqMgC53SwU4t7DyMW2boE2YKqj6rxZMnoXJ
	rUzR5bHFSn35Cae1Cn5jQTAmHmpmskMrd0MbQlZ0B900pVK8+A7m6nwYG+BAftFnG/j5ccIIB2K
	+YYGj2IaBDu+5MHksFBJE+UkjojdpC9KwLSYskOtVAMFclFivSoU7R2He9CPzrByPAdU=
X-Gm-Gg: AYBFou3rVywWAGHelQMphR4QxLj7H9UpCpYh1kjD9bfieAB/cXgxYSqMioBmwnUD+WS
	F0v/ATilE4+bMSGZsE1+QYg++eepDj4cK8Jd5JGsPj3CT4EoJi0fPuSYYJYNAlILBfLay/XNjvY
	L/SOeEHG4h380Bct8NGbNr9EBBle4e9+7WkAnP5OptESJD+8mkof6tlGUFmMhsCKI6ZNby+gPAa
	brWsdj/7ljtYD0ZE08+t9V343VLD5dB/MMCZE7Lig7mWS0pUS0MlCXdiZ3/GVCaJdThxM7Nd6ru
	/7e+GObZYcWbcbkuGregy/Xa93JOR1xbgsuJ2AsZC/tWxaw8pOsD1/J8DMjv50mrZllYbf3rPHI
	+NH/TTG/pl6JDSEdBarMIB07wMNElR3LypA==
X-Received: by 2002:a05:6a00:218e:b0:882:99c8:8678 with SMTP id d2e1a72fcca58-8874a79f1eemr3714172b3a.16.1790852533099;
        Thu, 01 Oct 2026 04:02:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:218e:b0:882:99c8:8678 with SMTP id d2e1a72fcca58-8874a79f1eemr3714120b3a.16.1790852532506;
        Thu, 01 Oct 2026 04:02:12 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888197ced69sm886049b3a.48.2026.10.01.04.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:02:11 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:31:25 +0530
Subject: [PATCH 1/2] misc: fastrpc: fix NULL rpdev dereference when session
 alloc fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-fastrpc-probe-fixes-v1-1-1376d93b8b3e@oss.qualcomm.com>
References: <20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com>
In-Reply-To: <20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852523; l=2369;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=03XIH2O6sdDp8jBNtcMZmDL3Sp8Yt02H690f7pWeLgQ=;
 b=PUC+a/kjGMciW26JOjwX7e+QyLjNCCIp5KkBOyrnvDjoTZ+eDBlQlWoDkBxjFltJr5gjub0VJ
 97iRYxSD9RdAS87H1Rl5ojgtXjFYeVut9GpUvMim4uA1KTJH+61UBUJ
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe3db6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HPkHAgnwbDoOiCnvmVMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXyDbWO8YVjEfF
 cZceRiHd44JORlXG1JDXKYmQ1D6W8mwJ7ldXzFr8GqBo67/nprKZ9TRch6n6dsv8kjTRk2nUn91
 kh272Ghq4OdC+9PJGOCJBkQAB9WIpZQ=
X-Proofpoint-GUID: PO4sokHo_7u2eRtWxVYfg2nzpL7N4Z5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX8WnUlgdJgp/d
 XAykaqvn3kQFG5Us6/NPf2UmmsgyFzYCyaZ3DiWGN28A9gcJJyDAUTJRrjlSQMdWNNBeHnHbP3J
 Z5gXHwIBIXmTOup88dBjmdqKpzpXl0Cj87SrsBov7JysSZ1zJx13BNLz6pR2y31cKYecK3U0ddA
 YFFHzzVOKiyvq8gN3BNBob2fsvTlaVlWTCZlPYV3PhaNdxMbdxL0a/VkDj3dZDA+oErw2lkhlKg
 46IPa8kgJyA+R3ieCPussGEOyDePZwHdbDeIxWrEag+kH+uoAEeCNJSojtgzD1mPNynGUU/vT+U
 mEs8FMjkzv+GiEtFQOQREyNIMz9nMimAE/ba8ydZdZYiK81ATr3oIb7HlW4eHOhYCeAVXFIpEsL
 +fYMKNY5MwkiAHpnO1zZfmAg4lViJMgJ/Xuk+Z6XzcfJWKS4GBcT51qet/4YujhzdOqd/iOQM0+
 ZI3JbvvCbfbgm50K37Q==
X-Proofpoint-ORIG-GUID: PO4sokHo_7u2eRtWxVYfg2nzpL7N4Z5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

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
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index b29c1fd00de2..7ab1cbbf19bb 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2706,6 +2706,12 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
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
@@ -2713,12 +2719,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
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

