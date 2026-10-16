Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A75345199D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141122; cv=none; b=EDEQ3nMHLj0RlmnSAX0+0+BCU6awFp70E824NbJ/gAhsdZ83dxgVZfawudvsfM5AStkv7/zefxFBkk4SkKmeKdAEy5GXP4p7lV+f9lfflH74qBGV3dvOuwLTced50yfXWXE2zUwffHaQB6x54zBwdOGKu+zzk3pNJBj61doUl20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141122; c=relaxed/simple;
	bh=PNIpR7E+HEAfTqXSWWHMSaHir6ljo4+AAvuJ5sSi5dQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q5tEBIxw469T/7iFkuvm8dGXVOgPaJ5stmQvoTETbS+tcMvEdA//UGtPlJB/L5qR+i+wA3ze2flWSccYjE+I43TRrq5Yftl9VTmp5ich69Q5j7eCFlqIIUzDxxxO+O/WdATIhyTjXWA6kjdqv4esCJlK6cIwplISMrQXW2SbG0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ApUgOqLV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7MktzJC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ApUgOqLV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7MktzJC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lEBw1761574
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6T6E/PTJKYn9a4JTmrufJx
	VWoTdQbQUGAhkm/RbWkjo=; b=ApUgOqLVpGcReJ/uQR7ssiWCcNEpdYm78gsqz3
	j9mFh2tVdjg6X0KbTeIiNPv2pvm+e4R8w6EFokWqvB9JAWw+LgvudZQgvyEEpzT8
	MVCuvhs39JsD+H60DI+rOB1v6bEsf//JAlY+88UsoU5jJPZpVsbT7nov0TwJDify
	4fuP+uRR4xumAClnMf6eOePXuNxSsGlcDK5zw8kMP2zkmExW5u5uMJ5IL7sYRHn/
	tnD7R6zZdPonw1kjCZJe89uGD1CYZvGQPCWJNz3/mXH48ig6V57F2DYvkbiAdkw7
	Y5qweRjL/zsxB+xNwIYoD+YvGBr8CuynBUQN00gts1vLfEAg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr634-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so4330737eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141119; x=1792745919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6T6E/PTJKYn9a4JTmrufJxVWoTdQbQUGAhkm/RbWkjo=;
        b=E7MktzJCNdVRAZiuxXB91OV9AeY5hHZMriQ/1HrZtz5u2qrMf8KNZNDgk2GDeF02s7
         TgMzlJWWJhkNkKflYqzMFUh9jIkG6pa8QPm7WaFojAgIC2dY8tJ2kF7PjK2g3JLXVtxz
         yJmEtm0i+gaTWGlpn8cy0ZjTpsYsmiG3nfEKS00KR99P0ODRTdJ+JN33QNZTilddr/Gz
         nisqaQwjICAscKKA3uJ/k7EHPMHRjK0EFPD1EZ5BquZxHovv5MRAwqnOylDe9Eeogfmm
         ZoYzeeznIOztZiNpRwIwPUnLsaCltuc5M4DSz915Kz+D1l2TUBCpaUdDN6TjrDzqgPq7
         EtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141119; x=1792745919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6T6E/PTJKYn9a4JTmrufJxVWoTdQbQUGAhkm/RbWkjo=;
        b=PT6BSL3lbO3BlNXkSOUxn3LNPJ+GbHm/vSDos2j2lLcEvxA5FRiCax981pYKphu4wZ
         lez2J8ddDXgwWovsQ56vtZOkCqGIGrGptPloKS/kyrhfgUYuIrc55qZseQh6eeRP4Q1P
         c61jMV7o8bHB0aVitwftBdDEc9YNavuyNQrT/t+PsDRrDV63knvuqiNLicUDi8xmruaP
         t6pO2RVku3Ja09tsUYcw/5a1fFhGSCVBu4oDkB7PwgQlGtkzsBjw5GFpCNi71Keg61oi
         IT/tst6nGJN9dg4uc6EAk/46z96/Tl58Wb97mvxs7yVOBE+K7af/mN93LAWzfhtLe3xv
         7L8w==
X-Forwarded-Encrypted: i=1; AKwUvBzmSmfxrt0DlbK458E6bpvSjZquSPFQBDI7PeZmHJREBc+/aiVtEiQI0xBpZiwcEygayvGo9Y1Q6qTM2/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHGeBHTiM+O3qVLLTpIcuaJGvcnFJSjSCbgcF3W6OlOjcOCTFD
	GHsN0E2WEb2p0U9t7kKpNU1E3oXHFFNzEpWHuOUfuDLn2yoGFA+lEhRoDlOIgjCy4r9EC7lUCs9
	pgTThjWfXbq1BG4vLRcKAo33i00+PLfA7BXOXPLq+R81XMRadLCET0pj2okuSALeNIsQ=
X-Gm-Gg: AYBFou1QS8HQ1jLtza4PdMAV6q667WH9XYdssD++w0eAvems/zHmPZ6/msVmscgUDXT
	XLvwRaThMGXdxcszf49OGx6GvJoBet4wY2KlkyigMT/8Zrz3nCGhegGs+SQDGqiod1ktuSDyph2
	SV+oPW3NsvZAkbu2uwOoB916VpcTZu8ogWsyp2zXlXUTBo7g1mNme74Z1ur8M+iacWlj91Pwr7N
	Tf+GOnaC9//Hz3E4tZrAWvRiDlCHlV08M98dlCXOehf0g3klX70qIbkO6aFiP1biTqwmrsdAKID
	46D94D/vDsZMgFUqg0LygI2o5aGwPwYbTArV9mlwj5tenFeHPuOGhF5tSjK7V56C711BPQ1KhQi
	7ROjLTAgEGJYrrn+J1N3mzCZo7E74Q0Gu4guEExPpzKU/VTheLs0zTfk=
X-Received: by 2002:a05:693c:895c:20b0:351:bb8f:540c with SMTP id 5a478bee46e88-3537e04f58fmr30651957eec.35.1792141118694;
        Fri, 16 Oct 2026 01:58:38 -0700 (PDT)
X-Received: by 2002:a05:693c:895c:20b0:351:bb8f:540c with SMTP id 5a478bee46e88-3537e04f58fmr30651934eec.35.1792141118063;
        Fri, 16 Oct 2026 01:58:38 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm9475436eec.24.2026.10.16.01.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:58:37 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: [PATCH net-next 0/3] net: qrtr: implement socket shutdown()
Date: Fri, 16 Oct 2026 01:58:17 -0700
Message-Id: <20261016-qrtr-add-shutdown-v1-0-e1cc01ca5919@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACnn0WoC/yWNwQ7CIBBEf6XZsyTQpDbxV4wHLIusB9DdrdY0/
 Lugx5eZebODIBMKnIYdGF8kVHIDdxhgST7f0FBoDKMdj3Z21jxZ2fgQjKRVQ3lnM0Vng598nEc
 HbfdgjLT9nGfIqCbjpnD5J7Je77hoV/ZuItHCn35fa/0Cbqux844AAAA=
X-Change-ID: 20260710-qrtr-add-shutdown-5f10da5af721
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, jeff.johnson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141117; l=1573;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=PNIpR7E+HEAfTqXSWWHMSaHir6ljo4+AAvuJ5sSi5dQ=;
 b=sYbm/wqRPWpKdkEHgg9PzkJJllBZtX2T2VclwmFkpDsGizFMEmKV8zQMlcL7lYfneqYiYONlW
 gjD+z1bIPs3AuRxcFSjYppDjiy3ixnx5eN1qhYOKp2Bbcn7rsMPr5AT
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-ORIG-GUID: WLPg0mxbBVCAoIjPGAPzJBj1_vKCVsvl
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1e73f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8
 a=20KFwNOVAAAA:8 a=PfFHbZv5qE7Lj_dxh7oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=y1Q9-5lHfBjTkpIzbSAN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX29ZtaujTA4xW
 WlqRnyHiZfNJACf9job/zLXPpebKacZT+D6bky8LFWNwy7SwbdOy5PB/kndZ21MFV7+0a2oKOyT
 wShlKA68CNxf2vVYnQQUgikU1IM01Wc=
X-Proofpoint-GUID: WLPg0mxbBVCAoIjPGAPzJBj1_vKCVsvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX0GEbnKyYWpWw
 C5weNq/4aWD0BkeowM0c4TJCkvMdIAwh3Dknp4R9MEQj/x7GmWdfaYr+c1JBoymRDTAdXCnBVgO
 p0Uf/Crae6/hPAFG59JejVjUleDoYoRFR99n21zg/0yVcRmtYWIEtd1yItCKCRZAJGMGxWiMdo6
 UVFzMsRSbgIs+vYfPEXl8C60vdp+nqe/OTtVpkGP0u1H6I1JiC5/6ddXzdQ26+/Ve+RBY+Sh7+f
 KewYRDhVBGivB3cTw8ldYqUV92gcebLjjUq5l1FPKpdBouq782G+E4nN76Yr6rUTtsLQw6+xG0o
 noOW8Qf7sBSEgBvaHHIpVloUCyUGTrbePJFc1f9wNMVhJqGxNE7q1kHkVV6oyOy66l5m+ieNTCV
 AncSWiGZO9rScXnwkV5HhmqD3Qbd5WWVJA/s9qhTF7wFakwKledy721+pHYc6MzfC4MlcLGjVWh
 66AfJifmndxAf9RvN/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

QRTR does not support shutdown(), so a thread blocked in recv() cannot
be woken up by another thread. This series adds it.

Patch 1 stops recvmsg() from holding the socket lock while it waits for
data. Patch 2 stops sendmsg() from turning every allocation failure into
-ENOMEM, so errors such as -ENETRESET and -EPIPE reach userspace. Patch 3
adds qrtr_shutdown().

Patches 1 and 2 address long-standing behaviour rather than regressions,
so they carry no Fixes: tags.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
To: Manivannan Sadhasivam <mani@kernel.org>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: tao.zhang1@oss.qualcomm.com
Cc: peter.chen@oss.qualcomm.com
Cc: jeff.johnson@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com
Cc: christopher.lew@oss.qualcomm.com>

---
Chunkai Deng (3):
      net: qrtr: do not take the sock lock on blocking recv
      net: qrtr: propagate sock_alloc_send_skb() errors from sendmsg()
      net: qrtr: implement shutdown()

 net/qrtr/af_qrtr.c | 51 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 13 deletions(-)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260710-qrtr-add-shutdown-5f10da5af721

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

