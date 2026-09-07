Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF307175A6C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764646; cv=none; b=KPni0h6tA5obbjmXNh96oYMan8fgp7C5xTXBMiiAEjsfqM7O2mNTlHXes1bRWUMwaXAA0SAR9fs/RSIE8BXXzoB4iB3gqOaiS1Fi7rhaz8HqfsFis2zbiu7LJVLnsmkLtOwoH3YMsn/CZ2I8DicyjzvlIWh0mjkM3adKNhOLT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764646; c=relaxed/simple;
	bh=xC60j0rVihRHXFrz0mpF9bpsFW3HzWxGQuUrVXji9To=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UvfTE4CPxIO1NbRFPvKVL/a5NWHK8OiVrFf/mI0joCknAhVqzrIOS+jIfEHHdb8QljjfqKWN2RQ8pPq9uhbBCXiGuc/mcwe0+xWgQdaWOWW5D/N95tTvo/0XK42PnB29JaSq3Hy2ZZYZ1Ts/dUnrvRZt6fGyhsx7ogLSGOGTScQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKqq5TlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSzIjRN5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKqq5TlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSzIjRN5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l8qA2390820
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6dv1pUUWz6N92r1bDb3rB4bKkCRSNB0fggx
	uIRingaY=; b=AKqq5TlGrVvdiPCmnW0Mq/ufxC/rIn4VPMMFf5wUk6/8GaGrnbM
	C5XdCRbrqKfwkypt25M8lroj5IlzVFO6QEpOHup6DblsX4R5T2Byy2oqcMU+cGjp
	CEinPhgig+lqlFey4+UK9B2dgDN0A5Z7fj5g5D/NbuHHXp6lKmyn4AqwfFhVleNm
	lJDhWJvBpA9fxhWUjxQAVDO4MpN6Kjr8B2Sy5ZMyQZBnzzLGTbWl63Y0COuTOeRz
	028H0Xh4WQud3JcAxr1OC6q0QXM7YKH0EqTgHBlVtNJS1Yp2IvOIRvAXgomlVTtT
	HoG4vabGKUtQqSHVFa5EIDvL0XMdPVi/dnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuenhde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:04:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3924503a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788764643; x=1789369443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dv1pUUWz6N92r1bDb3rB4bKkCRSNB0fggxuIRingaY=;
        b=fSzIjRN54a/MpUHIDP7QNZqnlekvY45ta/axQue/CWA/hXZG1EORzPKVKFZ0QLwTRJ
         iAHI/WbyhNAwxWEyuCTnNBCR16dcka/pYAnakKdcakwdEqtSxwzCgYKi82iXLXM31zo8
         qvfCHALluy27O45PfBbnMM1lbEB0Doy5O62/L16hPKk9kp7EZWjRDOeXBJl0A2me/y7k
         Qw1e6KCy7K3GQmsH/A/oSrPl8+w1DgzcXLOzEC+GTKIvCWtE2NoK8aW1Qup9mEp+Jsd0
         iKoROELMb4dmCuLsTG3k7OeB3YYgBY53/5Zf+7tfO7QiOELxqCFktVnlf90Qf91sqyZh
         +W6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764643; x=1789369443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dv1pUUWz6N92r1bDb3rB4bKkCRSNB0fggxuIRingaY=;
        b=qDudIxlpCNRsr7z8x/wv28sKPK/OygG97iQudLEe5EA4GoaTmKi63PjV+OfRuYSxf6
         C79qyepv5CFJLMtYzfOEFftLvv6w6atDKBYm+//lshUk6IqBa4Ua0Z32cuXiPJDQa6Ea
         5B+jOSpcEgp3xhYfEQeJNfwtwVjyU4gI6g/DGQ69EkJZ7ROmgFR3vTXAnHvo66OVOYTf
         vrybXXmokvrzaWxifLGEh7VL5CIaytnsmdyfoxaJDVvYoQfvERY9yEHFD5HmDbLYZLmd
         Ny+vU0Aq1Ie2VjJ08LEo3QcqMMkqT/9AvyHfPEuekqXSh0Pm8o2ccRv6cpVhJrdniwpr
         32Pg==
X-Forwarded-Encrypted: i=1; AKwUvBy7HiI96FQcsSV9r3AcFaqSQI6UPCL61GUWURTdSAQJx1v87WH7T+YBkzEH/+PR8/Y9cHEezOufZfWNLHM=@vger.kernel.org
X-Gm-Message-State: AFuF++nKHC22wKIbpyV/PVAQvWuD9Rhyr2zL4XDDe5ou2dZPEPJln+52
	H/FlmpPBzaecuuv9WsGn231Q++BC3khZVa22773OpKBZb1ctygD1pW+pK2UCVHs0/aLEbBqEH+K
	68FKymB9EtYd373kwruXLQ1XgCro5XvjxaON5rJ9EO1g0nudkTYosgZmkFNTC6wR2eMc=
X-Gm-Gg: AYBFou1Mk339zSg522B89s6/ucuAwDjfdvt28EMpFUC86YbnkTrLFtcpkGzhsQI91c9
	ENuQCjZJo1jJNTD29izcGOj2pPqjGsYq3vmgggkFVVbB5+KSexSJ6RRXKopcPqwjXN8lorMMTPI
	PCavIcKm6PAbb5hxnfaCXsKqOzqoZLoY/79XmsMLYLmKZAwSo8PBRVJ4cSc9MNLtPbFyAUbcu5H
	iqx4w16sQnTKJujvgmrLrmvWAfGxMkjIQsWSXWfw8aNRDzTYrEqeoMh5QHnepEAcyELYN55k/la
	v59/91nG86HgoqDZYjdrMwGRK4uF85a6iUCNku6dGhWOo5SVMvRt3TQCddzo/KRgK/y68OWUo74
	mInM38tSBeg/EFJsAXWgZF1KciMZet+AMXSmcrUNnI7rTnwAFRnNeagmBTwH8ZLZ0P7JpvB6jYA
	==
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr32080546a91.9.1788764643325;
        Mon, 07 Sep 2026 00:04:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr32080494a91.9.1788764642834;
        Mon, 07 Sep 2026 00:04:02 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26155324sm18344681a91.17.2026.09.07.00.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:04:02 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_chennak@quicinc.com
Subject: [PATCH v2] misc: fastrpc: Reduce console noise from expected DSP info, reserved memory and session messages
Date: Mon,  7 Sep 2026 15:03:56 +0800
Message-Id: <20260907070356.509-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3NCBTYWx0ZWRfX/ieJV5sdM9/p
 phMlPhEW2ioeORjJTUoEqq+fxYzAGCX6ZHCfw5wsjzNOqCdQaYoPYS52A6ZcrrHgNAg1a5t9Fh8
 tr7nCDMxUCfjGYrhgQaCX+A7RHUqPVR4CZxapQ/6LOYoGQKy/kRszrVmXrLEtXEFplCOTEruZDQ
 B2Ayz5279GdmJMcWKL4mNAo9HA12vhVPcfglA6OKVP1XOPshwC1rvHqH8ADPtiPXbVTnaKL5vIP
 Mcio+oed35fLCfyZbvMO+nmoPpWgB8C65p5I0bf/slE01Rn6hB2vvsV7/IPMxaDiEZeIdZllIpa
 u+Ns3gSkfnfsEN9HDywOvtlcNh4IiO/AusiLn0d6x4A74JNv9HzgANbNAFOnapPkku9eY7Ga1kZ
 UqYDrlQxFZuQW630QZce0U1+5QzkMwky3gC2Qc4Bm26KAX7U5Kf9e7sVYma9/11Rvm8QR9BtnBh
 fQQagvBR/PU125xzjGQ==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e61e4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LgK48ucg0MBlhcVu-asA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 9YI3T1EUAJuPsUQ0g2LO5DXKJcChVhqz
X-Proofpoint-ORIG-GUID: 9YI3T1EUAJuPsUQ0g2LO5DXKJcChVhqz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3NCBTYWx0ZWRfX7gnpnxyfmG9d
 AL5mjDR9bvh+YGKuaLq+OuB/VuwoCDYcbOjjcpUvxgkRb71PRI/LwqbW6kjvS5tQjjkLXOJiu5B
 1IJ7opARIh+4kBsEFqWKfW7av+pbpAs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070074

On some platforms the DSP firmware does not support the fastrpc
capability/attribute query. The DSP side returns an error (err: -1)
while handling the request, so fastrpc_get_info_from_dsp() does not
return DSP_UNSUPPORTED_API but a generic error, and the "else if (err)"
branch in fastrpc_get_info_from_kernel() is taken.

cctx->valid_attributes is therefore never set and every open()/query
re-prints the same "dsp information is incorrect" line. This is not
tied to boot timing: it can be reproduced at any time by manually
starting adsprpcd. On RC builds with metadata flashing enabled several
clients come up and flood the console.

As this is an expected, platform-specific and non-fatal condition,
downgrade the message to dev_dbg. Similarly, the absence of reserved
DMA memory is a valid configuration and does not indicate an error,
so downgrade that message to dev_dbg as well. Also rate-limit the
"No session available" message with dev_err_ratelimited(): it reflects
a genuine failure (open() returns -EBUSY) so it should still be visible,
but must not flood dmesg when the session pool is exhausted.

No functional change intended.

Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
Patch [v1]: https://lore.kernel.org/all/20260514062825.50172-1-jianping.li@oss.qualcomm.com/

Changes in v2:
  - Add "misc: fastrpc:" subject prefix.
  - Reword commit message: drop "temporarily", describe the actual scenario
	and state the errno returned by the DSP.
  - Rate-limit "No session available" with dev_err_ratelimited().
---
 drivers/misc/fastrpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..1f9531a534b9 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1783,7 +1783,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 
 	fl->sctx = fastrpc_session_alloc(fl);
 	if (!fl->sctx) {
-		dev_err(&cctx->rpdev->dev, "No session available\n");
+		dev_err_ratelimited(&cctx->rpdev->dev, "No session available\n");
 		mutex_destroy(&fl->mutex);
 		kfree(fl);
 		fastrpc_channel_ctx_put(cctx);
@@ -1937,7 +1937,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 		kfree(dsp_attributes);
 		return -EOPNOTSUPP;
 	} else if (err) {
-		dev_err(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
+		dev_dbg(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
 		kfree(dsp_attributes);
 		return err;
 	}
@@ -2559,7 +2559,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	}
 
 	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
-		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
+		dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
 				"qcom,vmids", &vmids[0], 0, FASTRPC_MAX_VMIDS);
-- 
2.43.0

