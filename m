Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0A3ACA7C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278071; cv=none; b=SWRsa2wK+pE4HRE2DOQTHdHvYSTPzr19oS11yX4w+5obRPkkgxZ3tvJk6fzVnNgAw+teplbHq9QjFO2wPxxEoKzYwU5TFnrz2jJ2xiLczLDHmZEOSU+bX+1TTTgsh8dzHrz5GuhgSmOka+K1IpmTomHxA7NC94YWxNMJltjbV+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278071; c=relaxed/simple;
	bh=K7qcaGAtzPSjI543191e/RtZaNKrmszLgd2MWUKfiHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMsNaH6kt/zaMWBi1QDP2ftV4rrixQDUkPZGvixamv+f7MHAaPcImd+huaEl9rrnlULva48OQu9dy3dvFt3Q/QSn7+VVd6pxXF9swTxXAvrfHq7BsuffA6m7rxH8gYvbpTz9UVM4YB+AsxOPbODBUv8LTiCafTaTxNZ8kUlPVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXLdauGE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVJunhn3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXLdauGE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVJunhn3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eDsk1083626
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 09:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5X0XYv1j42J8veRG6G7BpqboqQUipyEf+4L1o8MCCgc=; b=RXLdauGE0w1DnNTs
	YUWuG7YKz1WclPsIb9Hsy3I+oKKixopFkw7AoxYH5/HyVdniNCyzrtlYq/sZMUf3
	NctLGu6GzWVRosg2iW+RObGn5ZtOdmRHNRZTugL1NWXsaj9uVTlJCCxMwi3mXvQi
	16jLSg825eHIsDtcvxJHMmdyW99sZjWnGcwIzuOs4G4XxSxt7QfAPWlxyiH0FXpX
	b+gMfHclEGvE8qo1ZdGRN1OZ3evJ4oIqVSbovkGeBa0iD6EYlpVXrfQVa60RI5hN
	oInrP5qT+DzIfdKubidc+L2IPwQc9ikhAzU2+8hPBwUNqL3OID16ty0lSONcZaBy
	ZnBL2g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cuu3yhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:14:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a82c7e8fcfso1424211a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791278069; x=1791882869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5X0XYv1j42J8veRG6G7BpqboqQUipyEf+4L1o8MCCgc=;
        b=gVJunhn3euVKyTrfEdNEeyQYEz70E7TR0ZDTxIupmH2BcEkGrfYrgIYVr2BuDVO+6C
         e9ZJrVh5XUkgDVqepaSnh0K/cblE8Fqc1dBUhL8CEICB5pLn4kK7OTOkdU3wHsbF1z3g
         YKmIM95mRFoaIo6ObRx1gwzKUOwJtGR5pUB3NzjknRpY37crI5VzTyW75zPR8X4gdwa2
         c+qBweBw3pisEBeojG10v/PJzYQ2r5EHi4mDOaoyiEzI50igYTCzTghWvHApJvli/E6f
         BpzQiWYY2KjshTGUiIHxR9s2keNfjWXVrN4aZW5hNenCM8Lvt+2Th0fptGJf0/bjXN+I
         yH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278069; x=1791882869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5X0XYv1j42J8veRG6G7BpqboqQUipyEf+4L1o8MCCgc=;
        b=V8D+W26MIuy4YfGzciyppkXooZKkYIkIXoWC/SDw0plSsTHUx7GWywsMtV39zBQKRT
         MeMP/chqjLubOsjfKqjZEiuAp3/9uuFVCf5jaP8ZU43VlOa8cfT9VSf9j0tSg32/6K3r
         MiYLkVqbNNbEpCZrOcC/OGeeLri0g54l3ephjbPNhkhOdgJ3SH9Ond5k8n0cYQtM4LxZ
         zTaEZ1mO4leTFyD5m11/Bnktj1fOJzxcV6087oP5yhOelZI81m7ymE6fmi6qAAp+rPj+
         PGUfiTSUHMo/H9ZOjP0hwLnUdiQkPf6XMwVaArx7KIm3row1lLqHsJb+80aY86A530Nw
         3JDg==
X-Forwarded-Encrypted: i=1; AKwUvByT/V56eW4CnUZqTTKbF8gMrBBlTPHe5iX0s/fM+A9ESU6TqovmLsDjvYXYBrFuV5/KO2TcHMFe7jWECbg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL63FIvQa2RRvQ2T0+iGt2V3A5UKyySpxyQN4CgvF/TiHj38Van
	HgDBRqBXIZit+ljrWuSrCvofNNG0rJgRUywgVzSvD11UYr9O0UicIT86Zht286i5y9elGnfhMuz
	5i6SnPMPUecs98zKg/2HN2OdK8M3LV6vt6mQcvt10P/qHvUgx6HJr6HgEBWiNxAnFlbs=
X-Gm-Gg: AYBFou0SJ+lzeB3BLQDmG49WyqjQX7blk4kIqyrA6brEUqBNRPqXoAJrRSYrrG5CcFV
	cLdS5TJSJNKCuyld27cEsJaHJBm20vogObtcmTrpdqH4wLwaRrH7i66dbik/0fnX9jyFbyt8+Gt
	+9W69VFQs9W5x+VElh6MCaHnIdiPrvdbcyidgFKLqNG+dByVPO3UmcdgNEoI/ighse3iD/q1gbZ
	MPqNXu3Iz4FRS9kcub5/SzgooUWlF2v5EVwf3n53r3FN0NfhE9woKDGGODc7s761pto7qJF1G5O
	2vGuO6jnOTTgL3TqaIDh+4UmXVF+tbDkyvFvNdM3eai2qj9mHAvcAmQzSmQqDAZamWDHxxLjyQ3
	txI3y3taaY4e+mR1pbxi6knm2zxaFFh/XuhDh
X-Received: by 2002:a17:90b:2804:b0:3a7:cdf9:8fdc with SMTP id 98e67ed59e1d1-3a8726843a2mr597995a91.3.1791278068756;
        Tue, 06 Oct 2026 02:14:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2804:b0:3a7:cdf9:8fdc with SMTP id 98e67ed59e1d1-3a8726843a2mr597985a91.3.1791278068286;
        Tue, 06 Oct 2026 02:14:28 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm10199342a91.3.2026.10.06.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:14:27 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 14:44:15 +0530
Subject: [PATCH 2/2] mailbox: arm_mhu_db: Remove redundant
 mbox_controller_unregister() on probe failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mbox_double_unregister_fix-v1-2-9011ca208d36@oss.qualcomm.com>
References: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791278058; l=1493;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=K7qcaGAtzPSjI543191e/RtZaNKrmszLgd2MWUKfiHo=;
 b=LpqEEsSK/49LVkMomOKVFr0cGEZB11jw5DSZnW9HRpj+vm/GT8a9n2jIYl1NkeUuPqRnWnEiu
 rdZv4tHV50EAF9o8SQb2kzhn1tb06cqNnrMUTbklSMkoupAgbrj9UkH
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfX6C4vbLA9PJA6
 lBCPzpNknV6tIrSV4bwU5CQdxromu41wZ5rqKHiq4cNrEjyyDZtr0s+eZg+Kn28Lkkv5pBZ8Vcy
 OuUJi8w5gV/nrqfcyrx1EIA1TABNnHM=
X-Authority-Analysis: v=2.4 cv=aKRlOr9m c=1 sm=1 tr=0 ts=6ac4bbf5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=U3cdxg4MlDLirErpFykA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: d3FXOCzRp97q0piiWeblz7UkOla6ekY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfXwvpzUuJqQZhi
 riVAvXOnUPU5QA+Q/y6etylQ+mK2b/ftnrJ6xN9GmRJAyRVyeoBhIIAD8srVKRnpGvbayl6jtTa
 IFkCCQXncrjhr1Z1ei2r6KrDHI3/KfwGUqpZ89tma8YSSM6N390+kXHikB9rhwBB1nVLyoaajat
 +8oGh01M9O1lHDaUZD/zKZ3FTI5QAvPfm4jRlie7ZJaVcVy4LUGgtE/uED3V8UUw2Bo0G3hFKyS
 PRBc4GijPxN68RL57I76ciaGn6W5OaGiLNhkkakr2DmuR61+eQKpNT2dPuG1l4btznWx4FTQH7X
 Kmlj+UTWjsTJamyFRW8ugmNprRWqFK0CmWzaHO5hR1U/GQ6YMWMbEuTpZdI/j73uJHq1nW6DrAi
 jxb8Rnyqg/WXqTQiKUyl0qIKWmm/8VduQy8bTHBN2Uyiw9s8gnN1jxAO8SETQpaDbhj/tU1jMRZ
 zcT3kUBIAE4QWEuyNyw==
X-Proofpoint-GUID: d3FXOCzRp97q0piiWeblz7UkOla6ekY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060036

mhu_db_probe() registers the mailbox controller via
devm_mbox_controller_register(), which automatically calls
mbox_controller_unregister() through devres when the device is removed
or probe fails. If devm_request_threaded_irq() subsequently fails in
the channel setup loop, the error path also manually calls
mbox_controller_unregister(), resulting in a double call that corrupts
the global mailbox controller list and causes a kernel panic.

Remove the redundant manual call and rely on devres for cleanup.

Fixes: 7002ca237b21 ("mailbox: arm_mhu: Add ARM MHU doorbell driver")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/mailbox/arm_mhu_db.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
index a39239e38a47..9668dfdedc78 100644
--- a/drivers/mailbox/arm_mhu_db.c
+++ b/drivers/mailbox/arm_mhu_db.c
@@ -315,12 +315,10 @@ static int mhu_db_probe(struct amba_device *adev, const struct amba_id *id)
 		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
 
 		err = devm_request_threaded_irq(dev, irq, NULL,
-						mhu_db_mbox_rx_handler,
-						IRQF_ONESHOT, "mhu_db_link", mhu);
-		if (err) {
-			mbox_controller_unregister(&mhu->mbox);
+					mhu_db_mbox_rx_handler,
+					IRQF_ONESHOT, "mhu_db_link", mhu);
+		if (err)
 			return err;
-		}
 	}
 
 	dev_info(dev, "ARM MHU Doorbell mailbox registered\n");

-- 
2.43.0

