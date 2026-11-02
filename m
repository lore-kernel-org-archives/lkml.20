Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612857;
	b=nTwX5D0frxIu/+E9kpAtURhW6Y+T0ttqDuvMBGyMEBfRpPTku0yd72wcWuXBziidb2OK
	 9/8++84qQRkEPm4DAq1/5RsZeG9dlApUs85QU5yBE/zyk2uIS6vlV8HAxmOl+Uh6U4HEI
	 UTDFH65zTnd+iX9IPGh7f+pdtAbiM0COWoryHJc4M1uyKBwVT56UxJEOYln4SzEi/KCHQ
	 fml9Gm+A7c53aHKFdLhrEFvOlNn+5ldRUSCXqgehijShrtyaLXAZy22FIzBOA/pTcMmRb
	 lOACJ95zH5sgYo8E+LTzNFVpL5zpIFKsGREPCfTDFqc8GmNIDk6qq3/nc5WMr2nPkGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PZ0Yt/kAU8xLZudFvfVf9DbCrZ4b7WTk4z4rLAe7GDM=;
	b=VO6uTmBNXuNHbPtDIqYwDuaz3cMjFBgSdnvhazfqOx7vMmiekL5v0GmJ8KqNLTY/wLeN
	 MZovtq0gMVoHjMpzqfXhrB+mDLe9Z0YlP8KpijTfHAvQDSRrh+AfTQHDOw6v4PL4Uks3x
	 VzNM1m5xzkIiL7swtFrq5kFLDreEz7i3FuLVp/hTMmwGt9soCTLM7Qpnd7kJrB8jZBsft
	 jS2s/RM+GZgvi2NdII8gy8eFjj7uyPLTTrbYp16r46pbveTHAIdhQ2wfkPsOSUlQ0vIYS
	 PK25rNCEm+LuWtcTSEzF3ceKKdFkUrgYwVNj8Mhc+cRLFXwoSBw6zysZaUOyP2zRtFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEPepWZx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bL+qPJba;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7A460A262B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C7A460A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEPepWZx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bL+qPJba
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3eW260570
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZ0Yt/kAU8xLZudFvfVf9DbCrZ4b7WTk4z4rLAe7GDM=; b=WEPepWZxd/63xx2w
	F0MpJibCuZhCCwg1qT1V9T6nrAZY3gflMGWIiUYSAuB9/C0NrV0Pnh5vACftEJ3R
	FoIMOHepfheD1h+FzYSfqsEthzGzgrKf9ROAz3ry8XhQZ1bfloQwNBrq3W/92ygU
	fYdRH3v6ry6J6s5hZNLBfl3HQLw+aqp9DcPVOFmKc9WFiVwm/63YLnAD+KVrftIT
	2JGcbszq2JqI3Eg9t3OLil0tdUX1Qsx8ohVE1pKsfLlT7mAsHcS5R26Fhdbt+ZJz
	1ez+VpaZPvojOoupTFTS6K/CXTcnohi5VRifP9RTPzXoRZWAKLaEfFKXNkJ3uI1y
	R8lHZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvr5kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:47:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so2407763a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612855; x=1794217655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ0Yt/kAU8xLZudFvfVf9DbCrZ4b7WTk4z4rLAe7GDM=;
        b=bL+qPJba2EiWieqYWHaikbYpax2GuHkr/NgYkJxpIP0ddDyT0jCzAO7I29H1izQ/TM
         XPyQ9YpvuUrwTO3TGAPp7fgg+TG4d3c/f11l1cSj4ftllsMlw43T/J1/Aeoh4U4OwAae
         VeD7MtmoymYJU1I9KmI64eMEe5MXsrHOLrqiGDuozDTuoaEzVC22G166jNCS5oNHUDtO
         GAivgA/sTmn+No2kjlnoxARV5+DqkViRw17q5H7E8uO9S3pNeRwEKMxQVNP+Zui22k7c
         dvFF6CFMqpuGFthWSOky8qUmE/xUzKBDT+yHZ4uB0QZ5X2SY8EVIvLWPX5ov6x5U3hM1
         YoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612855; x=1794217655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZ0Yt/kAU8xLZudFvfVf9DbCrZ4b7WTk4z4rLAe7GDM=;
        b=a5u5bS/KnackkRKMyNgc0Qvar5cc5f9NMSy4KigAW126ruM8lRnCWrfH6Cpui414c5
         RKF6dUAkkempvQNwcei6NB3wb5YQiBHEO/YP7kN0cIgXTgWU1W2EBQrK+V+PSUbNl1Ac
         eEO92ZXaofaI8dU+ijZk97hMA+x/3DWG/EngyB1p6BbR/mdj0nwl7rWhNRKgPqmXWcpj
         Y0Aow8dGiuKe/CjbKwbUNox73f2AH5qrvSzqOhhBJLRqDRmoz91MiW9L/oapxHB/Umdn
         kP+yNFO6GMbumCWw7REgdWrIweRadhRj/fpkCLDtWMAQGWoro/bZuKJH4nzAQzg6312C
         NGWg==
X-Forwarded-Encrypted: i=1; AKwUvBwxz+5/nKrE5ejpqHSAyYc91rVColuyJgaE/tUJ80QkD4O9Tb3LZ79oFkMxEIcTjScPb86KfqPRhp01KH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3k6U6pRvVSR5KUCJ3/TDf9cHzXHJ6Q3yiHiX9tGBv9AB9tCwg
	7wYrkGdtVEYm2hXvBlKcncHb8AyeLLzjT39lIyu76TyTufIDmhu9aVlF/pBsH7D+lr0vhW1nYmN
	hm9lASCwblCUMRB/NCjctVrj4JDcGYIdIptCJhVpdtC41nZcrazw65FTku8cM9Bh/tbo=
X-Gm-Gg: AYBFou3eTaXBP2n9j6xV1BGc64/gSBt2zX7e3/raMP0gZN2i5tOjoIlTyPCgRcqj0FK
	tAipGXdCtO9qrJhvWyUz4MPkWJW/+lVczOR+kbjMMGwrHW/2mFJ9DerdznwjGIXLxp2IvnFiXdJ
	JYIbhTW8rbc3S5gEVjl4/Vaz9BxQpV8tzoyqt/xGuXNo9NqLLo5R7dMixoioe2kwYhXrgQefbaK
	UGzArrO9SpEOpDD9MUUV0bcoeNMdSZoDusGKOVwWcq/9TuWpx8415xJ/4pc3mosDR8BcZsDWrcO
	REJVuR14AyUZa9+2FkKRWw1N973Go/3glZoPMMu/Q1QEyLi0Cv8sQhnMxvWIxSh6Z7pnPAo04Zp
	R6DGK4+2nBZ1xoWOFykbjZIM+IeNGVkv7WlcMkM3DpDKQqZ0E3jVxjbQSTkjxYSuhCJzpCMO+B8
	y+uUwo0nElvP9H9S6Rx19UH1BGNu62pAH0zGY=
X-Received: by 2002:a17:90b:2fc3:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3ae89771953mr7718883a91.37.1793612854956;
        Mon, 02 Nov 2026 01:47:34 -0800 (PST)
X-Received: by 2002:a17:90b:2fc3:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3ae89771953mr7718855a91.37.1793612854431;
        Mon, 02 Nov 2026 01:47:34 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm5053234a91.15.2026.11.02.01.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:33 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:31 +0800
Subject: [PATCH v21 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
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
Message-Id: <20261102-enable-byte-cntr-for-ctcu-v21-3-231e069b7853@oss.qualcomm.com>
References: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
In-Reply-To: <20261102-enable-byte-cntr-for-ctcu-v21-0-231e069b7853@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793612829; l=4491;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=e7qSmNkg1bJ9CuA5XfZ/wTAAZZTOW6tXZW1EGCi+WMY=;
 b=xcyDWk4tPPulZu+qTEV4TTf9k8ChipkC2MqSxxOK3fOjIHDtEQPzWqfqUCK3APffkY8SUjvOH
 AOPzBqxBOi3De8xgqdjlgRhtZ5zsasb5Lkh/Lt8FJRXkGrBro9ZQdgJ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae85c37 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TPt5YZYWydgKV8fuSqQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: wlItFtYEDIeEhcV8Lxq4SXyPui6YyMVL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX3nfeRf1UCinp
 uZgRgSrtut+E0VvphsV4pb0IIAvRXMu03aaDSbooM7GELw1riUiz1OjPQCEc5p+IXu4i4F0tjp+
 EckKYpcyXD07WMWnqFUyeq2V/l3rnyc=
X-Proofpoint-ORIG-GUID: wlItFtYEDIeEhcV8Lxq4SXyPui6YyMVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX90FpjsMKS8R0
 Kw7UXTu6a497uhkFr0VLos7a6CoDOlFVDlZc6mbCWwt2/lUCGuJfEBg86xg9itSVj6iDJ/Xe/7z
 QRjf2Y76UZZvlo/P19VzL+X42ZkimZ0B6ZDK2Hb/am4cb0aNo6iKydzApOK4zUx2PJYaj+2YcGn
 dY+Rjo1aNYMmX+FbBxB6+syN7I9kvArLQwTz12NPvZf+tjQ0aY5KfhXRCz0pL9/6KSYq3Wz3d3S
 h3FhjsyOcDJ5CmoMzSPqrqnNFefgNlReZysjkYpRsGR/piYtnEjb4vHfCDkG5xp2MweK1HC+Iad
 GH5apN7+ZPifSS/PzTRc8tWXJ3572y9fH+Iye2lqi/6961guHxCMBtu/ydPXEf0d8RRXIXDfu/a
 eU+aPSRmRPastKWTN1mzcRjZvEszQqHkS4v5qP61tXxuTnT/RtGNNXB+BmMOcJMe5Rdz0Wn9E5a
 DxChtX9Eb0gTfHTslRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
etr_buf_list without disabling the sink. It returns the node of the
switched out etr_buf, so its synced data can be read while the ETR keeps
tracing into the new one.

Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
done in one critical section. Otherwise tmc_disable_etr_sink() can run
in between and leave drvdata->etr_buf out of sync with the hardware.
Provide the sequence as a TMC helper, so callers don't need to know
about the locking of the ETR state.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index eee98a9269df..2de31d73a4b4 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode or there is no free buffer. The ETR is left untouched in both
+ * cases.
+ */
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		goto out;
+
+	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf)
+			curr_node = nd;
+		else if (!picked_node && nd->is_free)
+			picked_node = nd;
+	}
+
+	if (!curr_node || !picked_node) {
+		curr_node = NULL;
+		goto out;
+	}
+
+	__tmc_etr_disable_hw(drvdata);
+
+	/* The switched out buffer is free again once it has been read */
+	curr_node->is_free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->is_free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	tmc_etr_reset_sysfs_buf(drvdata);
+	if (__tmc_etr_enable_hw(drvdata))
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return curr_node;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 7c604b9f92e5..30b15c38b080 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			is_free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1

