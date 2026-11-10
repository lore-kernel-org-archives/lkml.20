Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280952;
	b=AlbMJ1G3crEycd03BlZ3Z1ipkf1wuFDNA0imMK8qYYy9kmd4dKuf4icGkhtBXYEDMJ0L
	 Fc8Q8M/ATKxM2UtPIveXQqk4kbx/f0sIN6EsrR5pFivr8O6onPi3YpK1vUPdekxVEg2y2
	 AIEkJxwF0QGg3awq6jmxiCxLkvlc+zeCVZoY1eUt/ZYjfR5cUNf4qMLEtBiiNSvMuJV+V
	 kchZV1k9aiWWy3l3kNdb6qPG/62EZU0BD8HK5j0keJLltO9K71t0VEGGKu/p3WLRWfGDy
	 8UIpeTFdNqF8rhMVxbN7UMizJ1CsS9YgwBRbtE0Jm8QbvrUZSHuD9+88vn1K0v5QMow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S4L8juF1z9XwoWM3LNMHZaOpPuOzfNRL0E69hLI/YFA=;
	b=iiAiFScFNLY0mnBVRrSj0Ei7t11EKbPt8jxhS+Y1AwC6KvjYWYFciNiGyJ91I/VnWSHO
	 J3in0tPv9LMcOlO+5o3h32KGXi2dzjeoazEh9Q/7GrbUMOLiPJFlWcK9RA46q6PuNpfMd
	 ngmDHGB/OBvNqAdUqAWAiSWLryX1drjv9xlH/89jiy7f1M2K8LpqKCyPzprJsntxpvaLe
	 CiE8JlMT7WF4RyQ3Tv28IvdOWEe15r9902Mwhdk0gdf4rLopejbGW1/UuRkXJaUJo87PF
	 kN1GflfocOV4HnAhiorEXktNXmStJQgcHwR67cTfZauPr2ZBX5a0GUc6dWHdwikq7Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a0lacXmC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OG/fNAU3";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A09606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A09606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a0lacXmC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OG/fNAU3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j1jD2481044
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4L8juF1z9XwoWM3LNMHZaOpPuOzfNRL0E69hLI/YFA=; b=a0lacXmCPfNcT+6n
	NojZDy+QhdkRemgb5hb6ewXB4zOfA4dehQktIwrX88FIYbMVkWfHH9WtZLulhRKL
	v6xpfqGFyEGuNkNzihuJxbJR0Qi84oDA8/kFlogkrRS1+0RazqP5mBD4QRXe26dp
	JySQ1HpDHxhGfjU94kL9LE68OINxGYz51X2nFSuFLm3xnYJ0XPvWrBhrKWirxyxg
	Woh+DbcATfwtnGR3qzY+F7r+GoiQgqaHs558Yv+XFIq6BjW9a5joP2AdmXkrSd43
	oD40r4DnI2E8VSD+glbl+eL5GsVZHOfMnOUhhlB0JCizWRvGPkeC7putn0oyOuTQ
	N61Gtw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx82nwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:22:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdba239d0easo1636020a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280949; x=1794885749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4L8juF1z9XwoWM3LNMHZaOpPuOzfNRL0E69hLI/YFA=;
        b=OG/fNAU3wsztyMjwL8A1ZDJy3viViyvWS7PHf4X6VM0NiEHigYFKxn+tXHOdSt4zZt
         ZiCB0peXc6kK2udEzoBzo94Rpz6vGgUJOlNnXkmeBFnn/Jvdj3dgbPgZBzaQ0LnnZ5la
         JU7C/oALekLYToT9b5+G+t3lHXbQFJIwiqhg/p2QqEfZ8raHlW0qlSzJcGlQrOBsNP5R
         Qkj9kUFAAfQ0bmiW5Mqu2FvMvQHZuDy38LzmQccSRSxOZUjXJyllfzbQoTz+XPHMD15+
         f44MUJTlcvcz1u10hh31hcirQHiCRVN4TV385JtxxDPrRqTEsCFDUFubXMXG+0Stmv58
         dZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280949; x=1794885749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4L8juF1z9XwoWM3LNMHZaOpPuOzfNRL0E69hLI/YFA=;
        b=myP+KVzzBH/jQ04wVCyQGT6/SqsosiLKla2N5MVehbrPeYbDcmecIKxp9QubqyeFo5
         xB8tCTAiP80dzN9c/f90Hsv5d6rwa8rbffYHvbGDpyftTUXEnsQhwGgzl4IS/1wxvloi
         EdTT04i/BIYSPC88ksobuSII2Sq+Yboo7egU2htKvzkG51L7GEbdV83vNVyt2YLO7/GU
         MI69cb8popcrG+cewhkz/PBPsKYNpMjPz4g0se0hs9lTb70onzQkXVfZ2nNlk98qQGxd
         MvkleF3oGB7r8YbCXHfIDYoOfPZ8aDf4TCZ1YVZFkY0tkTH7E13rm6Xl+66h86o6Qnao
         8vnw==
X-Forwarded-Encrypted: i=1; AL+hErF7CDvIYc1kbKhfnofIgtYf292z0xfUmAKpgSiYrnef8BhBosLUZR1n6QSlp4QSu0rIzMMh+/kQ/74vbxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b7WyIKQJPeZgc1REjBnfmyCR2uz9RJ1tQgKmJ97ayuoFASZGc
	PsQL3CW+1npUa01luW4rN20rvUfhChsFZq9nyt+S3ZUlygR3nVo/EYvhDhX/kXI8OFIJ5KbbjVS
	32qoYsJ7CiTxczkmUWCbyVe1IBoKNcBkg6SppJtYTZqQjm/MugofCVodLwjR+rg67TtM=
X-Gm-Gg: AYBFou2+dW5jtkqVP29aPMqlTmrQjtbWhghCA6s55czJpnlrFpXBuoStr7KotsJ8XAc
	58ioXzEcc1/ZWWwrZHVj1xJnrRM3ymf27aYjt55PI2kvYCcKswVOydGppghzWGlPPBMHHlq0N8a
	17DRgL+va3yGdLwKdevuc8Ymfgf7ONWiZSDeF94PnwgW11MITQI2zyGghUM7jcQ5YJ0/GxPs1eZ
	egZVoZYbsdJroJD6DQXViQWP3iytX/K88+6kIsg188Gi/6iDNUKXPyfH06yaG9APtX56bVaXGJ+
	fojaQJHDrY0ZbFHxf0NJZRP9wX0cxCk6bM+WaGPVv3aopXkK3EqBADcJi0xGYtTccsVp60Hgkt/
	/TTyBYFpiF2z8YBv55dN9lio7uqqCyx3eu82Nya9wuTuZAidaxd/BQDpl0VeXlqrf9tF92dYPhO
	3bm8JO1ct4ntq+PkMBDEnPY4oPf9ip7luhr96J
X-Received: by 2002:a17:90b:524d:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b166cc14bamr1596198a91.15.1794280949060;
        Mon, 09 Nov 2026 19:22:29 -0800 (PST)
X-Received: by 2002:a17:90b:524d:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b166cc14bamr1595842a91.15.1794280940568;
        Mon, 09 Nov 2026 19:22:20 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:19 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:24 +0800
Subject: [PATCH v22 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-2-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280921; l=11149;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U4HskpX6PrOSAOAyyWQLKaU/4nxuObv+lgNTkac5H9E=;
 b=OuUSn9yMHxdMpfu1hoDOP0/l3eVPmbmAjTsuI3qiEacejtAspKfJTq7kZtNmI6QvJIzv6IqRS
 9YAIDWkqo6pBeNLPdh/1lBRvAzibj0LZ7VD8YUYKsR6gC268nTGMtDh
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af28df6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=1SojUABPoRlnvLJ90t8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 0jrZ36xkhaDPUY8GyZPnO2MiJqSQYCX1
X-Proofpoint-ORIG-GUID: 0jrZ36xkhaDPUY8GyZPnO2MiJqSQYCX1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX7P4CejsPTUYC
 1ZO4Z87IfoqEb++KRxRntQEeMWUgX2ypLJJhJpeu3JMEebcugsNTU6JnQNmVvJfIk3c7oH9/HN6
 +NxbcnQJ7lLEgFHVbaErIKSJTbmqfzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX4mt1M+cmmf/w
 Lhg9WhZdEJDnYRkWca3EAnXqPiiW1kAof4a26X6DstDbtKDvp1btugmr8MYOc3ocNigL28rKPsi
 Yzb0sVRXzrv5MI4r6lkYGh4mPiSKdNDr/GP4Lv77hI7nKGm8KKexlWpaJScrv+HIGufHJKrcs+g
 sY/OtYmukTCLj5Qxx5Y0WgwZ6/zviFebg/9lzG/TiMDC72qlxfKxPaM0jUAX4tvvy5COoy0zxKP
 1jQVAT2uc0y+cqRjsIs6kY/OQO4ZnbJaZwqSt0TzilBXHbBfiUlRReXf6vBhoza9F7scOh4l0yh
 kz84jb9mpDp32N9sH+N7o9gCd/vgtwymsxqskeE4UORRRu+OUT4HfMWfoSonzzmGArfImxz686r
 Z+fyTGMqJz2zqgveMNpCF3f/iVqyPA5QsFcF6mu1a6+cAXOykiHWIVn0/gFcpnTJdXfQUYIBcBH
 k7xwcEV0c8Hujk/M1jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100013

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 205 ++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h      |  18 ++
 3 files changed, 222 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..bc7dd676da47 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 361a433e6f0c..e9213f456834 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1268,7 +1268,9 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
+	/* The sysfs_buf is owned by the etr_buf_list, don't replace it */
+	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF ||
+	    !list_empty(&drvdata->etr_buf_list)) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1918,6 +1920,204 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/* Remove the nodes of the list, the buffer @keep is never freed. */
+static void __tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata,
+				     struct etr_buf *keep)
+{
+	struct etr_buf_node *nd, *next;
+	unsigned long flags;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		if (keep && nd->sysfs_buf == keep) {
+			/*
+			 * The buffer is owned by drvdata->sysfs_buf and may hold
+			 * the captured trace data, whatever the mode of the sink
+			 * is now. Only drop the list's reference to it.
+			 */
+			nd->sysfs_buf = NULL;
+		} else if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+				/*
+				 * The sink is still enabled in sysfs mode. Keep
+				 * the live buffer owned by drvdata->sysfs_buf
+				 * and only drop the list's reference to it.
+				 */
+				nd->sysfs_buf = NULL;
+			else
+				/* Free the buffer below through nd->sysfs_buf */
+				drvdata->sysfs_buf = NULL;
+		}
+		list_del(&nd->link);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+		/* Free the buffer (NULL is ignored) and the node out of the lock */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		kfree(nd);
+	}
+}
+
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
+ * If a node holds the live sysfs_buf and the sink is enabled in sysfs mode, the
+ * node is removed but the buffer is not freed; ownership stays with
+ * drvdata->sysfs_buf.
+ *
+ * Locking: must not be called with @drvdata->spinlock held. The spinlock is
+ * taken internally to serialise the @drvdata->sysfs_buf accesses and the
+ * removal of the nodes against the ETR sink enable/disable paths and the
+ * generic sysfs read. There must be only one owner of the list at a time.
+ * Must be called from process context: buffers are freed with the lock
+ * released.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	__tmc_clean_etr_buf_list(drvdata, NULL);
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Locking: must not be called with @drvdata->spinlock held. The spinlock is
+ * taken internally to serialise the @drvdata->sysfs_buf accesses and every
+ * update of @drvdata->etr_buf_list against the ETR sink enable/disable paths
+ * and the generic sysfs read. There must be only one owner of the list at a
+ * time. Must be called from process context: buffers and nodes are allocated
+ * with the lock released.
+ *
+ * Return: 0 upon success, else the error number: -EBUSY if a generic sysfs
+ * read is in progress, -EINVAL if the sink is not enabled in sysfs mode or
+ * a buffer is of the reserved buffer mode, or the error of the allocation.
+ * The live sysfs_buf is never freed on failure.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf, *live_buf = NULL;
+	unsigned long flags;
+	size_t size = drvdata->size;
+	int i = 0, ret = 0;
+
+	/* We don't need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/*
+	 * All the etr_buf of the reserved mode are mapped to the same reserved
+	 * region, so they can't be used as separate buffers of the list.
+	 */
+	if (drvdata->etr_mode == ETR_MODE_RESRV)
+		return -EINVAL;
+
+	/*
+	 * We expect that sysfs_buf in drvdata has already been allocated.
+	 * Wrap the live sysfs_buf into the first node so the captured trace
+	 * data is preserved. Take the sysfs_buf and add the node under the
+	 * lock, so that the ETR sink enable path sees a non-empty list and
+	 * doesn't replace the buffer.
+	 */
+	new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+	if (!new_node)
+		return -ENOMEM;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	/* The sysfs_buf is in use by a sysfs read session */
+	if (drvdata->reading) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		kfree(new_node);
+		return -EBUSY;
+	}
+
+	/*
+	 * The sink enable path reuses or frees the sysfs_buf of a sink which
+	 * isn't enabled, so only wrap it while the sink is enabled in sysfs mode.
+	 */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		kfree(new_node);
+		return -EINVAL;
+	}
+
+	if (drvdata->sysfs_buf) {
+		/* The mode may have been changed since the sink was enabled */
+		if (drvdata->sysfs_buf->mode == ETR_MODE_RESRV) {
+			raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+			kfree(new_node);
+			return -EINVAL;
+		}
+
+		live_buf = drvdata->sysfs_buf;
+		/* Keep the buffers of the list in the size of the live one */
+		size = live_buf->size;
+		new_node->sysfs_buf = live_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		new_node = NULL;
+		i++;
+	}
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Free the node if there is no live sysfs_buf to wrap */
+	kfree(new_node);
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		/* Allocate the buffer with the lock released */
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		/* The buffer mode may have been changed to the reserved mode */
+		if (sysfs_buf->mode == ETR_MODE_RESRV) {
+			tmc_etr_free_sysfs_buf(sysfs_buf);
+			kfree(new_node);
+			ret = -EINVAL;
+			break;
+		}
+
+		new_node->sysfs_buf = sysfs_buf;
+		/*
+		 * The drvdata->sysfs_buf write and the list update need the
+		 * spinlock, to serialise against the ETR sink enable/disable
+		 * paths.
+		 */
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		/* We don't have an available sysfs_buf in drvdata, set one up */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else {
+			new_node->is_free = true;
+		}
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		i++;
+	}
+
+	/*
+	 * Clean the list if there is an error, but keep the live sysfs_buf even
+	 * if the sink was disabled meanwhile, as it holds the captured trace data.
+	 */
+	if (ret)
+		__tmc_clean_etr_buf_list(drvdata, live_buf);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
@@ -1928,7 +2128,8 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
+	/* The sysfs_buf is owned by the etr_buf_list */
+	if (drvdata->reading || !list_empty(&drvdata->etr_buf_list)) {
 		ret = -EBUSY;
 		goto out;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..7c604b9f92e5 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,20 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * struct etr_buf_node - node of the etr_buf_list
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +259,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +290,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +463,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1

