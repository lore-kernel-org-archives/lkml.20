Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315D4772BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348536; cv=none; b=aOrwfPT/zRk0RsNsQTrrOE3YTSk0XevXPtx3u4E5OEpJMJJmSkhMcJrEdjvyc1RzayXsuzhZEmkxm+35T9wb8m2/DM62aip30i+OIoxob8WWjFShgKLgyeUDamJdfrGCMXn1QrLswbdzWQercGYnIHFQ8Hxl0NJJNFWoqe6rUBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348536; c=relaxed/simple;
	bh=NoLdNt1/jh8WFIXhMuOvygWxJDAeLH0H+pkPVRDV3fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rYSe9b2Yq9xciWtIt2daWocWXk3dYBFG6V0whtRoFgQF5z9PD+DjwkKPhNpANGJG3RSHs/0Nko7Z/GOhbWo1V9SeyrOvfp5MKoaZ5R5Mjk2LK/Ssgl9mYTVUyPnZofjX7BpUPYUeKlyrj7ACnUaSMLqIWzur59WfQ6kCAJwkXCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VnaTLsQo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBnOp4Wv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VnaTLsQo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBnOp4Wv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829N3Hu1080197
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 11:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZxyDCBARacFokeB1SwXXNrQKCO9dXz+vxea
	N4piuWkA=; b=VnaTLsQoz3jwZtJTyidpMSXOUSAsIfbOgO9ufcq+K5ir5GrLuAY
	5dpSkiQwWAnkQQRNWwcP7y2xBxVmG0YTFhA3Is/7PTrkO/uQWkceMUi05ZmUJvZX
	AF3hJkSWEB80yKdTGHfWxpDyy0i1F1s+J1ZDLtLjB7XoxRAkr6CI+wm/5kfgdHn/
	gTWftxiRtil08tMq47DmMr5/6F6HWX9FYIGqA0Oeg2D4eNQkUCyhyZuoYrRWWi/Y
	kC82D7PMMiADvvvQZm3/8O2kTri6f/JJXD1NLpK0Gs005bW+5v+on4RriWnx2Oki
	uLqExi1JPko6QQzcGj7dmaSnsCGp1rE05mA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb561wcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:28:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so200348085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788348531; x=1788953331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZxyDCBARacFokeB1SwXXNrQKCO9dXz+vxeaN4piuWkA=;
        b=IBnOp4WvL7nrHZwEuOixoC9VEAIPcZWLjG3WsGUkeXfNMneMEjAv9R8aHK5ZSRDrjG
         lMXAUImMB+Y7UL/eb3Sxg4I5sGEDCQNq0rN3NT3IU6NDgB35UAGZrWU9AamBucgoCYQN
         bzR9sE8ApOUP0e0sW+i4l5pclYYazmzfFM9q+8oWYHZI4dz6z35j9v0lnOKUae6Vu7vM
         o/XFxO4JDNn661VxPsWZUKDQ5D+xxdttoaDFP5DgXMC3oqIF660JoyTYJWRvHFNKVu8x
         GPuQwCAD4wLz6I9sIkeu4K5/QeXEHjY4z2AOOrtL7ugvXYSmzN3PXM68LE/zuLThTLXt
         CSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348531; x=1788953331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZxyDCBARacFokeB1SwXXNrQKCO9dXz+vxeaN4piuWkA=;
        b=k+ZpqVaN6msIEKGS9HGmB3WrtFnUPnhQyutVRpiN0uekuS4jitCnxe2tp/+YnDJ81L
         OYm77OL1nMehsQs1TfQu9Z/VbHrj7ko/ZYEidP6otSELjjgCcwxYH/mbehQOiYIaZzJh
         AVJeCx5EdxVNHwrKNKwc4OZvsHTS0yekqx/8bGRnxRA2A5NrpQJFxxhpt1ZjkEcNuMTl
         uy2KK/W4VTc82rl93aRvCNCbnyx4uAVLMI+muM4bK+UnyOOt6qpIgIbisBGE/Wu4Fp9F
         xcCDsF+ICjH+HnrABht1yc99/AWmqTHNk3FJd7xqMV5OrOWR1OcbtzuJMSEl0CZ21/SK
         PtWA==
X-Forwarded-Encrypted: i=1; AHgh+RoWgSyihQuk1jmBrNoeEbSzFX+c4y868cpJCDaUs2VKBsXJvlCJONEE7BymeNu99KryTM6P7yJ4X554reQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nCKd4Xj3ElyFAOmH3a7AHZdAuxA0g4Bw2mbyIS3MgUmIrLcDrS
	KLXoArTcmvWgdg7RQlE0lI9P5i9yKzZ6/zHMhR2DEQkPrAf7a++daiJ8skbqrwE9T5b9U8hlwWt
	TP0YjVASjzZcIrb2a8j2nO/1CaOQtqmk9kzYjdFWUOoFFbx+X4RwJarpGYeCPuA6rC3A=
X-Gm-Gg: AR+sD13Tr4OeNiRAEIp0lS/eKH2lEabN2hPoOfM0ZeDTd/iU1b5KdGzBsfzRMYitM41
	TjNllYvw7njzmhM+lqkUqu5N4408IYe6BExaogItJqxJHEE3FX/eUVVZr6lZHjzXg/DxwOryx9J
	uRi67gZN5Yzte/qqoQFevkKGDC1C9bCi1/Vc6J51VspWYgjASSjOyCGbNygtRsNyQ51x0hq6tEa
	mZKj7Zr1ogKPzhNpWVM8NdifMQRaDl6feMYa2+IDWJH9F4fFXqp4S20XAbPH41nWUXf8PcSKjSI
	F8kW30wqZmd4a7qrPiir/Gu0G2uQsP1HDKV8r7Kc16oM9XWWqRJOZCpdkiFlv7uSXumXEQgd3KV
	U5X9w4vt0Hkc3Wg==
X-Received: by 2002:a05:620a:28d1:b0:936:e08b:733d with SMTP id af79cd13be357-93960f67f2fmr461973185a.35.1788348530530;
        Wed, 02 Sep 2026 04:28:50 -0700 (PDT)
X-Received: by 2002:a05:620a:28d1:b0:936:e08b:733d with SMTP id af79cd13be357-93960f67f2fmr461950285a.35.1788348528070;
        Wed, 02 Sep 2026 04:28:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce4a804sm165902455e9.15.2026.09.02.04.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:28:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: vkoul@kernel.org
Cc: srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>
Subject: [PATCH] soundwire: qcom: cache SCP_ADDRPAGE1/2 to preserve MBQ atomicity
Date: Wed,  2 Sep 2026 12:28:38 +0100
Message-ID: <20260902112838.1369446-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwMSBTYWx0ZWRfX47tQkR/GEX68
 DJrJ8vVpXjlHdnWc27uFjqrMkusk6YWfAWGssKD7SIBj4eiYmVpATSNkP3fq2ZdXBMziQup5KLT
 fUnJJhO+OnLJlzqkgnpF7ZyDksaYtYHEtuqJqwTFbl+rHL+qR6tJBAtQ/b+l0s+whGymufm48rA
 Zc6jWBsruDf/vKQqRmAXGKUVKi0IGrc8J1oRCZxgbi/tmUD/76ie1aqjft8HUs5bTd1I5uaxG80
 d8+pGqNPceD9JRr8bEYRjYIzi02ExeSSPUnS8l7sy9ghlOmqd2x8EaLjNgiG0TdZnQkUOuLavhq
 i78dJ8erZPU/DlGZhUGrdckpncivZqAyxXsiBBthQg0xL4xetayJvKa5tflhH+tb1blRUSlyues
 H/5nBwHJ0pIlAop1b/uEJY3oPAhQf642csHu9ILWu8gAScFGLrpxgzl07/ezV1ZHiWeHNHgzj1R
 2ZbTJI200DfHnYlDd0w==
X-Proofpoint-GUID: mXfHoQ1PEYjxpZAymaXwqlMIAJM9JfNR
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a980874 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ToP9Kl2iMMeu-1lUGmUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: mXfHoQ1PEYjxpZAymaXwqlMIAJM9JfNR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwMSBTYWx0ZWRfX5pQeKfoGexJb
 u7rTJACarIsm15qlLcLkZad633msRNPRkDEhrxC3AhSN0kHYkxYEzYf38sKmQK3q0GlGlGmMPPU
 EEF0tHgenU2Sz9ySQ3FqgRumr02Trp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020101

qcom_swrm_xfer_msg() reprograms SCP_ADDRPAGE1/2 before every paged
transfer, even when the paging window hasn't changed. Besides the
wasted bus transactions, this breaks the atomicity that SoundWire
Classic Multi-Byte Quantity (MBQ) writes rely on: the kernel's MBQ
regmap emits an MBQ pair as two sdw_write_no_pm() calls to bit-13
aliases sharing the same page, and the intervening PAGE writes
invalidate the MBQ high-byte staging on Peripherals that observe
them.  On WCD9378 FU42 Q7.8 Channel Volume this drops the MSB byte
silently.

Per SDCA v1.1 sections 12.2.5 and 12.2.8.2.1, MBQ pairs are expected
to be atomic on the wire.  Cache the last-programmed page values per
Slave, skip the FIFO write when they match, and invalidate on
re-attach since SCP_ADDRPAGE1/2 reset to defaults on re-enumeration.


Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>
---

Same pattern exists in intel/cadence and amd.
It makes sense to move this cache into the SoundWire core at some point
if everyone agrees with this approch. Buf for now the patch is focused
on qcom controller.

--srini

 drivers/soundwire/qcom.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 55678a30cd4a..35ffffd541bd 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -221,6 +221,9 @@ struct qcom_swrm_ctrl {
 	u32 slave_status;
 	u32 wr_fifo_depth;
 	bool clock_stop_not_supported;
+	/* Per-Slave SCP_ADDRPAGE1/2 shadow; -1 = unknown. */
+	s16 page1_cache[SDW_MAX_DEVICES + 1];
+	s16 page2_cache[SDW_MAX_DEVICES + 1];
 };
 
 struct qcom_swrm_data {
@@ -630,6 +633,10 @@ static void qcom_swrm_set_slave_dev_num(struct sdw_bus *bus,
 		mutex_lock(&bus->bus_lock);
 		set_bit(devnum, bus->assigned);
 		mutex_unlock(&bus->bus_lock);
+
+		/* Re-attach resets SCP_ADDRPAGE1/2 to defaults; invalidate. */
+		ctrl->page1_cache[devnum] = -1;
+		ctrl->page2_cache[devnum] = -1;
 	}
 }
 
@@ -976,17 +983,25 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 	int ret, i, len;
 
 	if (msg->page) {
-		ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page1,
-						msg->dev_num,
-						SDW_SCP_ADDRPAGE1);
-		if (ret)
-			return ret;
+		if (ctrl->page1_cache[msg->dev_num] != msg->addr_page1) {
+			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page1,
+							msg->dev_num,
+							SDW_SCP_ADDRPAGE1);
+			if (ret)
+				return ret;
 
-		ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page2,
-						msg->dev_num,
-						SDW_SCP_ADDRPAGE2);
-		if (ret)
-			return ret;
+			ctrl->page1_cache[msg->dev_num] = msg->addr_page1;
+		}
+
+		if (ctrl->page2_cache[msg->dev_num] != msg->addr_page2) {
+			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page2,
+							msg->dev_num,
+							SDW_SCP_ADDRPAGE2);
+			if (ret)
+				return ret;
+
+			ctrl->page2_cache[msg->dev_num] = msg->addr_page2;
+		}
 	}
 
 	if (msg->flags == SDW_MSG_FLAG_READ) {
@@ -1561,6 +1576,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
+	memset(ctrl->page1_cache, 0xff, sizeof(ctrl->page1_cache));
+	memset(ctrl->page2_cache, 0xff, sizeof(ctrl->page2_cache));
+
 	data = of_device_get_match_data(dev);
 	ctrl->max_reg = data->max_reg;
 	ctrl->reg_layout = data->reg_layout;
-- 
2.53.0

