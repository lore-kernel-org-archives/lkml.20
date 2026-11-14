Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660376;
	b=W9kDnzwUAGBlFe+yB6fEjwKhsicBKYfXgsST0/AUz4H0/8AmzTIxIFGt4Z6cgVJuKZc+
	 UIGQBzCMiBtOgGeSKZMJZ7bLPQ6GnTWDYOtmXZLW8IBIcrifZ7UYch9EociwpvFmFNG1Y
	 2wuvKXMP38SIFyn2/fpYIhKJyz1W4Wr7DI16Cw5KjJePK4DIKoIb+vkGTIW5IWsVh1uCj
	 pGJYMgBLO17yV18gaxu3+wpl5s+a1xbxB/9206ZpyetlORp++JoFPFJAXmp4MUzX68Vl+
	 nrDz0zcrO9T79PVo9suSvQBQG+vnnZYVNzofDcCpbIM3kZFCqisvz5YQ5rqa5qwLF3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Sm2zRheHuhx9Zfz6c0YchR95H9wicGcjsIbHYljiQzg=;
	b=kgUg/YCRo1NjJZYimg2sKESJ6i50GsZr5yrrO3za4CRE1ykb8mlyaYzbewVQ15WvY34y
	 NK3I+nHYo2zn/96I4kK1cxp8sNli2Kkwr7VnnQco8EES8BH6DlSOFFFvsXyrvYw/baXev
	 B1UYDpb4Pa/ZzKzVWhuT4AMEMxuKxtOLu/giYlGwj0rBajWMF7XYNJ5t4H+4o36DpCdgZ
	 OZrtCZ4rJcntH6ODwYNzl1n0Dt5TaI59ch54SKARBieSdvy1DC8eepkEHNBgSUFXSpN3L
	 NJ+7FW9+jYbk3SReqUmyYm+k1l2f8+9ncJuLLd3XWhNnzrIUOXdFmyWucMcg0UI978Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUfF77o3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="e/NVHpaZ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA39606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA39606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUfF77o3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e/NVHpaZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wI5s1750398
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sm2zRheHuhx9Zfz6c0YchR
	95H9wicGcjsIbHYljiQzg=; b=nUfF77o3/iOd6MsuLJdqvO4ApQD0hF1NDWYmjB
	15agaB6YpomQwUipoNyMhXUP34ctRob3dJ7168tFq9KK67E9XEKprTQH3wBnaVgu
	d5m9Z+xo7k3HTkb3l+1NF/7pjVdyTukpgdIVo2Q0vzba4gBWTcZmzr6Gm+87/p3q
	rrb/W1wZzVHCSO9oFJe82szq0tKHYp0mc0QZYByljGTeiOEcL9SNo0aKnjGU2gGt
	O8OgQD/j3uEPGsOZGWx8HgBPPtsulxVNx0lbII5yqZCldOoijs45eCLlA6kiBKVG
	7CBcKw3c0opUsaY8QJE3hDEQO1rxpDB0eZomcoKD6yMBavXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj40s14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:46:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so430128485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794660374; x=1795265174; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sm2zRheHuhx9Zfz6c0YchR95H9wicGcjsIbHYljiQzg=;
        b=e/NVHpaZNMqalYTrcDKHk/2vjx7t2zTQWFjYqRoTwDkh+HFfgjhBYRFPIUfhPtgxOq
         4sIWxCdWvlcdGYIxQk3p7mYXVFKH2oAbEYfJuCoWy9RcGEkmJL6S85/l14zvIe1xZ1uJ
         iWHU0D2kwgMVYqTwKnWCgCkT80ZOGkNz0Q55TrwBgKQbxrgWLdJu8vIpAJNLKp4wwCZl
         CpxGD7fGECsGEvBeoVqkpjk3Dtpn4RVMY0sQhIuYwhP08eT5P2PpVTE8yzDSQv6lGxiA
         BTOPlx/LJvLTqRlnym5oIYiQtOjf/IKoiRR0FC03g/makLLcU6o7tVlOVVvS/FacF1Ch
         DVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660374; x=1795265174;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Sm2zRheHuhx9Zfz6c0YchR95H9wicGcjsIbHYljiQzg=;
        b=f8DE0KfSq9hyab05qAcKvZnpimcWKthRQXrvCRn4NLmyGfJG8s9bHePVJeHCbfzQmc
         v37sql/I2hjjOGMO3oXJmX+NmiWKHW02+7rUh+WlNmEIuM9gQZV2VlW/TT1p7EHb+hhX
         VomAOPDmS3AhJducto0l/yY84nsU8T3Ah4a3Sm3VTKa4qTs1mW8Bh/QXvej8rkNvd19n
         c6/14Zj3UxihXxaTIiKlu2lQEC/hier98JpabHQ6zevazp7KRkMs70vuVybjWbtZXF4D
         oe+zQ4N6IdA2RbUS7fZcF/inGn9wZF7EgZ+0iHm7/Gix0v5Yg/Lic5mx7itEy+A43dF/
         Csrg==
X-Forwarded-Encrypted: i=1; AL+hErFSGx3wZNVoeSeQkmH6CZoTpTFd5Tk3cvxm3bsp81JQnAtSCMmBzsUcRIf5Rh/iwWqPwmJlvaXTnxUR2eo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BIngkSJ8ah5Sfne4ojw4eYflXmCHHKcCaShbrokQ/ewxah9rr
	Uzo3XAuuYMStiJixd44egcupPrhMrC/kQilVZjxLJZP94GbqPTkk5Fz9slBQucHPxNNfLNI4h0S
	OOlSEh+ot77ZOijCOAfyDJzhRH0Q5AO8N0ovRlE5Me3ZyI7+v947fE9m3pJQb56+hPDI=
X-Gm-Gg: AYBFou3RwxOYpc6a0s0yXBlBoJMBFV6cSDamVRAYM4obeFH7FmVz7fJhwt0YsXzCPwo
	/pAeDBq35QIouVZTgsxkgbzkytW0A85JvKxn9txmeakmy/dNnyv6/9cSyOPwCEyRJJB3dV/2wRJ
	fneXeUSEYGpuW5nWkLd614RBtImXCIFKuJ0IqNeLEbVoMkkO4BNGjAUi3zyXxQy3ALCstJ+gM4Q
	ygfTxB0vMUtQNOm97SGeWom/FzsjS41rlcCekV3GA63aNmjOONDYcIczPqzBd41Z4nw6zbC7qiZ
	HZ9yNag97w82iu6RUI/MB64srern/6c/8oniBJjCcvmYkt/RQOJORjCxpL/Uhku4OCKy9LuCqTi
	I4hO/ce+Mber8y5QHwVzEJTMSSkBbFg+ID0EKcIPTiSyDAboFvGl5/sFw4z4U5zm17YzggVSHz9
	5q7Hodt8JMfIo4
X-Received: by 2002:a05:620a:701b:b0:949:3ba5:15d1 with SMTP id af79cd13be357-9494ba607f9mr836093785a.4.1794660374103;
        Sat, 14 Nov 2026 04:46:14 -0800 (PST)
X-Received: by 2002:a05:620a:701b:b0:949:3ba5:15d1 with SMTP id af79cd13be357-9494ba607f9mr836091585a.4.1794660373584;
        Sat, 14 Nov 2026 04:46:13 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm153977266b.11.2026.11.14.04.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:46:12 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 13:46:11 +0100
Subject: [PATCH net v2] net: qrtr: ns: keep notifying local servers after a
 failed send
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
Message-Id: <20261114-upstream-qrtr-hello-gate-fix_b4-v2-1-2fb62c2853bb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/41OWwqDMBC8StnvriRBbO1X71GkxLhqihrNRmkR7
 95oL9CfgXkwMysweUsMt9MKnhbL1g2RqPMJTKuHhtBWkYMSKpNC5jiPHDzpHicfPLbUdQ4bHQh
 r+36WKRpFV6PqtM5FBrFl9BSdY+EBAwUofiLP5YtM2Lv3WGs5OP85fizyCP89uUgUWFapEpqMv
 Mjy7piTadadcX2fRIBi27YviTSiV+wAAAA=
X-Change-ID: 20261019-upstream-qrtr-hello-gate-fix_b4-c2e8c2f4f906
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MCBTYWx0ZWRfXyZ/MJlX6ETcw
 Xc/jiZ7wPu3R8T+xs5+xOKP6PfdjGfATPL/FSH+1reQQAc8uzP9frt81syL5lIzc5x5yETmr+gr
 yLK4EzivKaNJD34CHh+ue1VE7VmNCsbeaal/Kyx6GYwKJF1ulzKzGmDfusUEU1/mnuKCg6xWc75
 m0VEf+FO1tH+84NL5ysL2xCNJM2JG5utr0osYYNBan4/aNzTEvJ9J+DD6mdOj2Nt7jHl19NAqz5
 xZxO+tkf1mNZPCsZ9eeufUvaJ5ftGNFziKqalr3HzKobAXcIgRgx1IKZR9ee+rYtUX9wtMdF8iJ
 bgrH/7dbXtHRXozLHQ+k1RIVwF7XL6GvLYyh8E7Unw0Amyr15voK5z+9XME+vRDfP+UIW7gw3HK
 XJjLN2FEiUtMKyvyhCxGICaPVufv5L5PGHJfxifp3DcGW7F7rpFOLGUQ4wkt5GrhZLWDjMGyHVR
 YqCqqH0UBTqOQecfV1w==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af85816 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Pio92nEW-iWscqj-QAQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: r7PE5EANLdBUqzAshj0UHVFBq-2ZxFcN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MCBTYWx0ZWRfX2VbWH1dNsGi6
 mkgsOvK65dDsroZk49OtVvkMjsB5egYMZojLBSfejBRTufM0hoWcam/OYyAmaoia9jqftBwdrG0
 ZQCDJzY8tsNKqHILGqBGwtxilV+MePE=
X-Proofpoint-ORIG-GUID: r7PE5EANLdBUqzAshj0UHVFBq-2ZxFcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140050

ctrl_cmd_bye() and ctrl_cmd_del_client() forward the event to every
local server, but stop at the first failed send. Each send goes to a
different socket, so a single server with a full receive queue
(-ENOSPC) hides the event from all servers after it.

Log the failure and carry on. Likewise, keep notifying local lookups
when the NEW_SERVER broadcast fails, which can only happen on -ENOMEM.

Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
The lost-announcement problem v1 went after is fixed by commit
743b5c86276b ("net: qrtr: announce local services again once our HELLO
is sent"), so v1's patch 2 (holding control packets behind the HELLO) is
dropped, as Mani suggested. This is v1's patch 1, reworked after the
Sashiko review: it no longer touches announce_servers() (every
announcement there goes to the same node), and instead fixes the BYE and
DEL_CLIENT loops, which stop at the first local server that cannot take
the packet.

qrtr_bcast_enqueue() still ignores the per-node enqueue results and stops
at a failed pskb_copy() (Sashiko, pre-existing); not touched here.

Tested on the Arduino UNO Q (QRB2210) with next-20261112 plus the board
support it needs, with a test program that publishes a server whose
receive queue is full, and then a second one, on a higher port:
- unpatched: the second server gets neither the DEL_CLIENT of a closed
  client nor the BYE of the stopped modem ("failed to send del client
  cmd" / "failed to send bye cmd", -ENOSPC);
- patched: it gets both, and the name server logs the failed sends with
  their destination; modem stop/start, 3 boots and the board tests
  (WiFi through the modem, ADSP, Bluetooth) pass.
Built with W=1; checkpatch clean.

Changes in v2:
- Rebased on top of 743b5c86276b; v1's patch 2 dropped (Mani).
- announce_servers() left as is: carrying on there only repeated the
  same failure and could print up to 256 lines per HELLO (Sashiko).
- ctrl_cmd_bye() and ctrl_cmd_del_client() keep going after a failed
  send, rate-limited log with destination and error (Sashiko).
- Commit message: lookups are local observers only; the NEW_SERVER
  broadcast fails only before enqueue, in practice -ENOMEM (Sashiko).
- Fixes: points at the commit that added these loops; for net.
- Link to v1: https://lore.kernel.org/r/20261019-upstream-qrtr-hello-gate-fix_b4-v1-0-bd420aec171b@oss.qualcomm.com
---
 net/qrtr/ns.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index bcb090ee79d4..8209573221a5 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -374,11 +374,11 @@ static int ctrl_cmd_bye(struct sockaddr_qrtr *from)
 		msg.msg_name = (struct sockaddr *)&sq;
 		msg.msg_namelen = sizeof(sq);
 
+		/* A server that cannot take it must not hide it from the rest */
 		ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
-		if (ret < 0 && ret != -ENODEV) {
-			pr_err("failed to send bye cmd\n");
-			goto delete_node;
-		}
+		if (ret < 0 && ret != -ENODEV)
+			pr_err_ratelimited("failed to send bye cmd to %u:%u: %d\n",
+					   srv->node, srv->port, ret);
 	}
 
 	/* Ignore -ENODEV */
@@ -458,11 +458,11 @@ static int ctrl_cmd_del_client(struct sockaddr_qrtr *from,
 		msg.msg_name = (struct sockaddr *)&sq;
 		msg.msg_namelen = sizeof(sq);
 
+		/* A server that cannot take it must not hide it from the rest */
 		ret = kernel_sendmsg(qrtr_ns.sock, &msg, &iv, 1, sizeof(pkt));
-		if (ret < 0 && ret != -ENODEV) {
-			pr_err("failed to send del client cmd\n");
-			return ret;
-		}
+		if (ret < 0 && ret != -ENODEV)
+			pr_err_ratelimited("failed to send del client cmd to %u:%u: %d\n",
+					   srv->node, srv->port, ret);
 	}
 	return 0;
 }
@@ -487,11 +487,10 @@ static int ctrl_cmd_new_server(struct sockaddr_qrtr *from,
 		return -EINVAL;
 
 	if (srv->node == qrtr_ns.local_node) {
+		/* The lookups below still need to hear about the server */
 		ret = service_announce_new(&qrtr_ns.bcast_sq, srv);
-		if (ret < 0) {
+		if (ret < 0)
 			pr_err("failed to announce new service\n");
-			return ret;
-		}
 	}
 
 	/* Notify any potential lookups about the new server */

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261019-upstream-qrtr-hello-gate-fix_b4-c2e8c2f4f906

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

