Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72729486E78
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628926; cv=none; b=Fx+UJ2ONOvPGYGK11qoHIr3l9v9D9mvhX4f8JUBW2z75CiCTwyyNLpMDr707ZpnXHpp/bNpevhV2+wpjGN5cBSJLiJJZ4sdfcvv1sxdUhqsaZuLenAiLyiBcap7fatMUPJ5ZFHDHVW8N99ZfHToIqZkoG30lyLaItS6v/69Kho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628926; c=relaxed/simple;
	bh=DWQkc7G6x9/l9HXB7zRBR28OwQe/issVxWGt7hAyuBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHNABTXz0+Eajwoxn5Hxn9BG5If3RX+zS6zYj+TonvgpT8/6Mo3bhxJBY4wcmjQbCtycxu/hqxheZn9RVfIrmVrV+RL16KQJGc9lklHNydnl8JOWJciFKYxAUNS8JJJfQy+6B4zfMtOX3fLS+Mhq3tlf2U/zLsm4D+BCDaP4epA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUcIzge0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=df5g1zGw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUcIzge0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="df5g1zGw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60VK91211736
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+mXYarnrnNTKxSI2lhAir8/DlTJRjNeh9Ip0hboFrM=; b=XUcIzge0pfaj0sYs
	Wr8UXHRK6IR2oHrG56gHmPdQjQMkrycO+QVrsSXdWAXxXmdZMx31lp9DqCrZ3v5H
	E+/azQcs0UDg4MOn5+shFlNbaFg+2kZHkAxp3mJOmNhve/hiIv3qvmiQCBYxJBAH
	p70VesisGNvPmev5aqLciOnE91OjltxyNDuSK3hXr9eIp58x71jbdOaMMxTEAYJ/
	KE8FXPuwFZQsraxc+No5fEnyVTt6hdrTKSVtpLOiDJ93A5zE+DMvsMSZS0tWJTQd
	xhaG8GikyU6vA0c4uCLYB4FsQt6EAEuxsoQGJfzxJLz8uuQ8svO1JZZDVvU5gZgs
	fTHO2A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxayb7xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:41 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so761793b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628921; x=1790233721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+mXYarnrnNTKxSI2lhAir8/DlTJRjNeh9Ip0hboFrM=;
        b=df5g1zGwCG+GUHtGAG/FQvZAsyMMPTcU5l1RT36TVKa31xIlDF//R0vVToM5daATBC
         AmTagvzQJU8R/ACrCv3b1o5sG+BfS3aNeGOEu8+vhLPjsPhfDyb+4ZVEC8mrNbdQ0qPU
         +/JViF0aTRanqQJNm3kfXJyo+yO0Q1m7nM6DLFuWQuFu3Epg00/I9eCpYq3UB0TcnYnE
         BiWXIjw0y8iiwbNe5PBWWKJcHCuv+LVFhqLeA/gfEw6VOQ0ea2rAJIkeYeKZJMHqhvY0
         S9k/xaGRziK8unRYMyAYf4pkhm3Yu8SNXSbsxRomble6Z86hQVZrwg/XZdsRdGXoKNyE
         n8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628921; x=1790233721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+mXYarnrnNTKxSI2lhAir8/DlTJRjNeh9Ip0hboFrM=;
        b=cyJfniVzqG6KUl0NT5S2gNHCtPQFuNFJIbLKXnTCZ2bemgHhZdwey7Yp60eSwiWD/p
         aMBzaDfLlkxea62UF3JQqyC/CwI1OR4SZqnhsBP42Ax39aNujmgc0J52IwzfSCgePT1Y
         cyTqcUmjTRQt6orx4T4rC8T1CsQP3sau+rjbfq57/66OchlokZdPXsp5NmdVZOQ8+VX+
         5UHaKLNb4+eHsd175h3yARfxaol+2gVoMnM8qedfN0Kjyid21MQo2x4PlLz4wfvAQwSd
         QUr80oLxaNnj92LeP+cEylrcYZ9QMYQDAQJ/7f5jjRfPQfnF5zHArnGuBABZfCBWwTPa
         dKoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhDr6NDedYJWuVsQVeaFdhGY2TjQPVV4WT7rttbQ5mSJwkR/ba/fk1JcIxKhpzSMZ4NGUjmPGLpOrVzGc=@vger.kernel.org
X-Gm-Message-State: AFuF++ko573TjWOl0e5pHxxCkfFIolhOGchIKvWAKVp2bT58ceBZXdI+
	yYoSx5lcYdSZqh/vnRJXr2viIctO/MAn6Lo4/CmW9vAvWwoF8Uy75jgKPWsImjkABqnAN3JzRB1
	9X1FGwTMmP+l94EGScXhVL7NWkWEdTRKYygvgfQgNM2bpXhTMOjNzP4Er8F3lQqvbLco=
X-Gm-Gg: AYBFou2vN6G6xatfHnafwvMFTzxWhMxzWqQ9M1aDTwzIL+mOA+JsWWtPMSs39qdSBot
	WohTfiOAbEmQRic+Y94o0TJBzzstVoedBCS5U35LWycBAmfRutxF1twFjA8RP2MvyhCdAgnN0w8
	rpwCODd3gCqwgeOKguEZrPlJVjzbs51jaNEo0Ph7MuiSlkUJOtEpxE5KIga1r1LPsEyyEH7M4gi
	LUgATcEyuCIp3JLj0QuD2Biu02M2i6T2BTYKCBzGuEDPfc4h/HNR8X/J5vwe6L62g/GZLqxVtcy
	KKsMrOtmuziKepP2t4biPc1SolsUmu/VA011lzDz2W6c3EMfsiCl00jpcivGz3RytOjA+wlBYwF
	N/b3VpXamnpPb+VcHwXojTdxN7BHw/gjHkBg=
X-Received: by 2002:a05:6808:1782:b0:4b9:a8ac:47e with SMTP id 5614622812f47-4ca4c283485mr6719339b6e.28.1789628920719;
        Thu, 17 Sep 2026 00:08:40 -0700 (PDT)
X-Received: by 2002:a05:6808:1782:b0:4b9:a8ac:47e with SMTP id 5614622812f47-4ca4c283485mr6719320b6e.28.1789628920293;
        Thu, 17 Sep 2026 00:08:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:39 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:04 +0530
Subject: [PATCH v3 3/6] bus: mhi: host: Add support for 64bit register
 reads and writes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-3-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=3724;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=DWQkc7G6x9/l9HXB7zRBR28OwQe/issVxWGt7hAyuBE=;
 b=MEY/Kgj6zt4Jwmsz9JirKEr9cooGz2obeJh2fDuBhTYOvHZuY3ZS9gOWbkITFCnH3PAZZbC1f
 2OAIbxunUWAD4BoQFAANvna7ar2L4xw7jpHUuEqswyWyZbI4TO/nPr4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX3JiF3AlV/3UJ
 hY3mePD2Mee2wqD03jv1ikivIISnf6OJf2MIkXTNxLh3VAphxexmVnkFrDfi8/BqnC0/JRHcaUq
 L3qrsRYzGh0MR0QJicO0wt+93GadNYt/W0ycn7rq6acOJXZCK27VF1MncKlS6GDMxyRUqijp+98
 bCIBDB6+gGWZUgLmLmcCZvrayz7JM344q/PDmSCCENyKedvbvIkgHPRTet29h4nur3FGhy/0C2A
 vpkuZ9yWDfMRqKflQzt8Fv42u+K16drb9qQmjAAF62oruyl/pWUYlZjBo2mcSmv6Ux9PgAJNrpa
 E+qgr3h2CdazJkAviVfmCYmlPJTwxA58Ys7FKetu3AtHzusmf9uPmu8Ee5t8tkUXGpG+s3mt5pV
 EdMBtAHuuRY+sEo89GmvdcuQMX0Jqsf6lrtlORsfzJdCYxTiIeh5/KhGkF1dfjNPxf0xuFksgMo
 zUDj6y65klfmI9FeeWw==
X-Proofpoint-GUID: GEbDV6VfQILu2c44_uBuRm28Tg98VOpl
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab91f9 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CnzCB1l8zP_khqs2e6IA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: GEbDV6VfQILu2c44_uBuRm28Tg98VOpl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX52Wck7YcYEZS
 3apoEpWvhx93Nc+7yvT/NtGTMFn4rxP44r2x4EuzIoP98IknIKs9WrsXGl9XrtKfFerJ0LfzWGg
 DpbDhb4R2d6P6jB18DcZMAQvXOUGTO8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170094

Some mhi registers are of 64 bit size, instead of reading high value
and low value separately provide a new function op to read & write to
64 bit register.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/internal.h |  4 ++++
 drivers/bus/mhi/host/main.c     | 13 +++++++++++++
 include/linux/mhi.h             |  6 ++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index ca50961769fa..bb96dfffabb6 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -386,6 +386,8 @@ void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
 			     dma_addr_t db_val);
 int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 			      void __iomem *base, u32 offset, u32 *out);
+int __must_check mhi_read_reg64(struct mhi_controller *mhi_cntrl,
+				void __iomem *base, u32 offset, u64 *out);
 int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset, u32 mask,
 				    u32 *out);
@@ -394,6 +396,8 @@ int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
 				    u32 val, u32 delayus, u32 timeout_ms);
 void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		   u32 offset, u32 val);
+void __maybe_unused mhi_write_reg64(struct mhi_controller *mhi_cntrl, void __iomem *base,
+				    u32 offset, u64 val);
 int __must_check mhi_write_reg_field(struct mhi_controller *mhi_cntrl,
 				     void __iomem *base, u32 offset, u32 mask,
 				     u32 val);
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 4d458396233a..bfeb5cf53448 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -67,6 +67,19 @@ void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 	mhi_cntrl->write_reg(mhi_cntrl, base + offset, val);
 }
 
+int __must_check mhi_read_reg64(struct mhi_controller *mhi_cntrl,
+				void __iomem *base, u32 offset, u64 *out)
+{
+	return mhi_cntrl->read_reg64(mhi_cntrl, base + offset, out);
+}
+EXPORT_SYMBOL_GPL(mhi_read_reg64);
+
+void __maybe_unused mhi_write_reg64(struct mhi_controller *mhi_cntrl, void __iomem *base,
+				    u32 offset, u64 val)
+{
+	mhi_cntrl->write_reg64(mhi_cntrl, base + offset, val);
+}
+
 int __must_check mhi_write_reg_field(struct mhi_controller *mhi_cntrl,
 				     void __iomem *base, u32 offset, u32 mask,
 				     u32 val)
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index e994ca4f9810..3dc1844222cd 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -374,6 +374,8 @@ struct mhi_controller_config {
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
  * @write_reg: Write a MHI register via the physical link (required)
+ * @read_reg64: Read a 64 bit MHI register via the physical link (optional)
+ * @write_reg64: Write a 64 bit MHI register via the physical link (optional)
  * @reset: Controller specific reset function (optional)
  * @edl_trigger: CB function to trigger EDL mode (optional)
  * @buffer_len: Bounce buffer length
@@ -461,6 +463,10 @@ struct mhi_controller {
 			u32 *out);
 	void (*write_reg)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
 			  u32 val);
+	int (*read_reg64)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
+			  u64 *out);
+	void (*write_reg64)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
+			    u64 val);
 	void (*reset)(struct mhi_controller *mhi_cntrl);
 	int (*edl_trigger)(struct mhi_controller *mhi_cntrl);
 

-- 
2.34.1

