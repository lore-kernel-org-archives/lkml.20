Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329EA5476EB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882671; cv=none; b=FD5mphd/9JqFRqPd2+XZQqdNg4dVgTue+FydEHo9vLl52iRKzcc+t2ziXQlodTktHBZmrHIotoxvupxo0n6lP9hL0/4ueU+wqalc4yfcZRU4OwqADa4Um98ABDr7RyknTdnbgL8ke/QhVtptte/fBtg/s5sFCtZvBTjDkFIeOkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882671; c=relaxed/simple;
	bh=XSPete4kA8gcLf3/xZdNmlyaz442sDN/1+dtmpWZ2KE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AL/VEYx7L6aDgPQbMjIg2dq9b4gA2Cbz0epRWnax+W/KQkzR5uVJN3QLyzngBXw6FLt6wYuwycamWSZ/fp9GooF7HI+SRMxl/WCyGIy586j38Jrr9M2mWJEG4VcViN+dxCllXdY566/xyMwPEmowXAq2dQj1fGnPNEk4OK0BlLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9QMxGdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBJAI9fH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9QMxGdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBJAI9fH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdwHx361123
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 15:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=adDtYGI97VusfpxJEE5tInx5u7GwKzmvoOx
	LzTA7bYU=; b=F9QMxGdTT4VuSmIdhRsOW6CEzx4M54wecNMKimvIA7KQiq1eGZf
	2RNuJ1rHWvQ88hC87CoYIn0W1tFphCVv8ULzOHu/pUyivfLyouuew2rxWGnog9IK
	SzOXbRgztFPdZVy/KtDvFm09I9NevqVsUA/hJws289Mh4KmJ8F7DHZo2JmHTTauL
	P+6pGKz9R1m7DsVawenBsk6ziOfNkF+gg6tS4ir6UXJbKeX1MP4X2buMlwvFVDZX
	LIf0frH4Q4EXhzrrgMbwDrNkBwM2aVSyhI02XLhde0IGzLKRrWR4KNLj9xwbxG36
	GGFzuqzdqczAQcUCdLATIIhEAMe40H9JA4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pauww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:51:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so5871873a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788882668; x=1789487468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=adDtYGI97VusfpxJEE5tInx5u7GwKzmvoOxLzTA7bYU=;
        b=EBJAI9fHBddQ/H8oR2DEnA4JSPmJWoZaA6763DbpXsFyjb2dOrmWbRqtbEQOsWjeFm
         KFmmQx71SJwRYSIaLs4Y5I62US7ifKxlfAWio5+JyhLg681qn/YGEZMk2MBG3PN8ITeM
         r0HnejkTLEsnISWXsMB7UK6+Zcli+ieOtTOiqFSWaLE9kGpq+r7QLJFt3K8paUBpeeay
         jd2mKBnPvpZsxN2NIpGDQBGP0iTvge89Jms4t4LVzMoCJ/bjk8Sl/T2O3jbhz/5a/pcg
         2fTxMHQFeAjjKzY3d0rc7stnei0DD4rsay3TuZTxNvEMzXCJVbMYCldQu/PrP6brUsDj
         FkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882668; x=1789487468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adDtYGI97VusfpxJEE5tInx5u7GwKzmvoOxLzTA7bYU=;
        b=NpeORs9+8fG6TKVC6CEdFTXjnu52JOBU3AbIFzOFsSmmM8ZM92B20htlPi/5TiH7bx
         J9EQgemjTtgx8U+RCopfD/gt3ZjZE4hAbX/uRvmTr0HpXH2pFv5HZu/vS5jQ9MNPMUve
         eLRr5feE2qpKm7cK9mClPutf0tCqPp6VHiLPsm3j2nU02N5JoF6XiyMrLDN4godCrH70
         YdCafKrxRaQ9VRVu82f2U/rEKDBUudTjoCq7R/gK/9WADYkkRFFw6PH0796B5HDcUepZ
         nKZ1Dattcwfr6FEehC3VrYaBcX8ZyEAGK6mGlGwpLluXfCZ5dYVBMMiKIMufbRCC7onP
         kBcQ==
X-Forwarded-Encrypted: i=1; AKwUvByMvZogZ/EhzkbG2SNu/20WC1a+q+e5N8tSD09Lwt91LIDaKgCBe5ZbasUE1JvaMEW4S3AuNo6+zqV31gc=@vger.kernel.org
X-Gm-Message-State: AFuF++lHVmOTM+VV5HKHlR2Gn35bRF4bWxISE/cFz6v0/A6nskfIpqR4
	Fa+hUVWCeR/QTbYg6bxJ92jCF+d8dqMHKbHWQZ+6QpEuZsVNPP9dzQDlZtrjMqnOcL9jnkbE7k5
	JruOF0NBtXMsnLD78DNjMn6iY74JbAYsqa+vdCBCy3zdLJEJ/3eq/LUAoSWcuk2mUNaU=
X-Gm-Gg: AYBFou36zL/LXWe6g6ogCrvlB1CVFuOf4fLxWc8U8xMgB738L49Ru/ktxzNvtSoUoT/
	bSjR1c0IHGjgJ41a/DCcsIxevRxr281z4pKKNyFeDg/whbPXYqLjN5PsVLazu4fLb4Buw3h3yHb
	anIOioPcIFDPjm05mj7isSSZrsgtV3QTrsKl1nz26meO47fExoYL/un/JAqbrUUR7Ntv6yNmHG8
	A8oVMqQW23q6y0DNdgfTnumc14P2cNeLwDYFKSPvabhgN851jSZwbd65+wc3YABUCQYbfIfF/Ta
	QokL4c7mkKWFpPOdAQG+GgMHMZ28D1M/bD9qFgb6npR8cow6+erxMICl1qygmGb2hcM2zGslPyK
	LbSgTVXnp7Ty3Y+AA2TrvyZo2vJaNJ92mk2tWWWG3a8V1Kok/9I3yPVndUP3wCXaqmnxSkD1FAF
	VqUOFqlAaxkqqM16ux3ZXPCw==
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr43264079a91.14.1788882668523;
        Tue, 08 Sep 2026 08:51:08 -0700 (PDT)
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr43264017a91.14.1788882667899;
        Tue, 08 Sep 2026 08:51:07 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm58606342eec.16.2026.09.08.08.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:51:07 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH] mailbox: qcom-cpucp: read mbox hardware register using readq()
Date: Tue,  8 Sep 2026 21:20:39 +0530
Message-ID: <20260908155039.1203344-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kTuF0bEdAFT_KALpDcpa6LHQAQN-QHhv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfX1+kGsrl+yQ2R
 yoRI9a9LbCaFToVhPhkxx27BIte8CMTAmjTUzPbB4QmVbeGdAIzbwxNcr7N3TwfXAIG4WoS/el+
 leyXYeULSNba9q3+A+kUzCcTaFRwI1A=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa02eed cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zVvgFSUyQItoBg7ASCAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: kTuF0bEdAFT_KALpDcpa6LHQAQN-QHhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3MCBTYWx0ZWRfX0aBn15vEhDY4
 O3WsJWqh5WqbC4HEDpoR8Xz7Zt/34xU7YATYROgXrazNP+k3H9SXefimVdTD/dQzzJ+Ejwqrvzz
 WkiMO6flWUeAmjspDjh/nKhBiCj8axi8zVrdJttuE+jHtkLrlgGZPzb8tHhhhrIGP+YgJVe0pgC
 x4tGQfQFSEoVhR2o09LmPGCtb+fdzROvY3Mos/b8C/vfCZESjsdV5BxOD8iyfOjTUCMLkhUC2cb
 hw8OgbWRkaoa/hREUuoxOd9RV4FmU9QVFn4S75UloW3IVaa+Zq4Q17rtH3G6C8m7OQBDblStKim
 nKMxZas1axAKXEVDEjZQTBVo8+r931Pc/aUvtQ3jrC0nOWRx+D/CoA5C1BKcQviJikQkwrxBHC3
 fgqLIZtrmNX5T2aIDTmfC/wWYNayP11fkA8BeFRR4HFTfZPX+43RxRny2JWsmnK/IKSFdOutjO3
 jwrMZsFzhXFs5IbMWEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080170

Mailbox hardware registers are 64 bit but the interrupt handler
currently reads only 32 bits with readl(). Use readq() to read
the complete register value and pass it to the mailbox client.

Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 7ffc40acea9b..f56a05149281 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
 	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
 
 	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
-		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
+		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
 		struct mbox_chan *chan = &cpucp->chans[i];
 		unsigned long flags;
 
-- 
2.43.0

