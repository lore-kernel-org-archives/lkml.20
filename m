Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40337E300
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636978; cv=none; b=RfLNVgUfo7DaDB3mtw+iL+aLyLwnpAJKNYLahqnZnx/imBQtV1KVK3RzHKZvsu/koUkUEpc73RyqaubfHzpbTUPOOVAcz0jkV3YBoNCqbzevPm0rM2rjVwg76Y9C+QscHmvii9u45UGn51/BbP+4hQkgyKyy03GnQt7ljBRTUcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636978; c=relaxed/simple;
	bh=nmzuZyubg0gt3//chnPIsntuNPv0HEE5hrN4K2onAh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fB+qDiFQz3P15z2OSlTOjaGwfxWrQ6kxRlb81t8f1CS0YJ7AZFDLpuuTpyjf4GXsF19wCyq6CG7PhaRRYX3/7w463CghHt+ba6TVlH2tIZIKV+dgXrb9ms3i7NYPw9wln90/G3hsqEVWYqd3DZhdIF64DfhV5qYacahoGBD3y4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAiOK6J4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVjIhGdD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAiOK6J4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVjIhGdD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60M0a1721354
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=52MPaQVsK93P9Ci+1dC4f+
	YeRomvaMYMgeuUx6T1Jww=; b=CAiOK6J45mFnFXDR1mHUZIMOiy1RS+Ctq9/FhE
	POOuwgbAbQdoT606283o58lpXYphEoG4WttkEOvn1DkFAp+IzNxxd3GT3AajAoCR
	SvfaAhCBl8XcWj0QwNWI/BsCB7M1Clij8ggvTW3e2lqONM8ZbQ0GGZYX+Jwlw58d
	/uSokX8WfsF5cbmXaEhWpW3JCNGF0guKUY36MNypGWflzwjx4PhnHK6IZuhsSuqT
	rn9uCYUZgZDMui+L9pQpJYgkOTBXdNCNen5LWwTZnyjAA8jzcFEYWUlXpmegKiT7
	XmvCdT2QasBkni6d7Z6mwinQzQ+9Rn1GL50XSqQqL4GB7PGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m1hfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:22:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so1038085a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789636976; x=1790241776; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=52MPaQVsK93P9Ci+1dC4f+YeRomvaMYMgeuUx6T1Jww=;
        b=WVjIhGdDXv99bsHrVsuCXN9+gqQWDg288+Ux1xRvBF2I5hE9/tLAqqYojD//aWc1gS
         K0oRn4l/jC/C7HxdaVOEfZPa3P1sgiEHhS2qx11JQPpCurAP4bb5bgoVB2PMxfNEG8D3
         1OUN1OfKOfVDjkhKPVTBD0Dc0uX8EPi5FzUslYPy82Q31Vi87vT4afVh1M7mm61CC5bp
         2vwbNQ8HfN36iP7i3zXocJioIt1oqqjv0ab7cfdQHPYQayrgjKSsme80A8XNhn3v7wvC
         w1q66ofiJgFMPLX1w2EibByC4KxE6lvBXfG5QCjv7dANY7qD3fcQVJQeCrG4+7vbIWQG
         vw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636976; x=1790241776;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=52MPaQVsK93P9Ci+1dC4f+YeRomvaMYMgeuUx6T1Jww=;
        b=1RQtY5XN752oej8VIyxAcxtcXR/6+rWXiUxlzR9rFgaYed1O9oNiGgd4I93I3yOLei
         pP1GcoLe7XX/8FcVaGhG586DiRllqHS3g39n4ZuBH+7UZTiAuqOKmPbyGmpoaNllxyEt
         cXlBBAzTVn2Jzh6fMWRPwScjKNOG8x+IsrgB3XAEDgm8oRf+bVe5WUzKfjFYru9bB9nj
         zEOb0n008YoS6GR8UujHqZSxJAWkh7aZXNx9/rqfVw8ISV03TM2N3enHSK0KMdDMV/kk
         0CbUy1ep/oTf1t8z8mBeZp27mOgb2ZJvhGT3fLudDptg2T9M6ulBAUbs3fUivT8iqemH
         ngpQ==
X-Forwarded-Encrypted: i=1; AKwUvByJItON1ktOPSjmG/BAezDmAf5CV2oM6QuivoHXUhZJnah9hDtFCHtjo32DUT/2Tg5XAVNDMEQVwASdIMo=@vger.kernel.org
X-Gm-Message-State: AFuF++mxq95qNCJ2gF7IeCz9e6VGJCbPqiMZUCcbJaABvSQk2y7yc0cH
	6btVjZuzE81P7BcXfC701MggP0Hcl4Yfb8gJ7nweTTGMu4FVMyyVPC0Wg4xNnOIq6pzx9MfMnSZ
	HaC4kr78pHA7WoAlEkGdG5EfmL4EUtd630aPYNlgp7mSHT6B4zg2uyGHi3/wA0+z6yfw=
X-Gm-Gg: AYBFou0V9fAn+xaktd7DRFf267PvUnL9j2fTpFwyFwnqND654T40nJyIswfwjJYSdo9
	+k0oGyTxeoElbjqcZBCeYSSdeoHqLyVe9iRdvhQ2sEBqMEcrEM1PLdPOrOrk8MAkC1tDDBgPhG8
	iNjsgFlceVmB9PMpWRh/Bt/qJIEH7l/C4AiWqPS9/qq6nHIC2FAdh8Rcmu0nJlmcunLrDMuIZTX
	ILf2nqSO4dl5DgNoGk3lpZ4jRp7+R81FH+8N6ZSmc24M9DKF5cW7sVcv2HS9rNy1DA0bjYkupv1
	79DNojrpKtWICk30pCdL3w6beamyKAydA8okHhxjKGfqLhI+S+xrK1Mrf40vvbeP+nvVje+YqYE
	T4PmmUOu06U8h4JRdEdbv4is4K67wMPvF9oVzdZqDbb7QVKiYOx4xHlU=
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr20525415a91.20.1789636975224;
        Thu, 17 Sep 2026 02:22:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr20525246a91.20.1789636974432;
        Thu, 17 Sep 2026 02:22:54 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b0520asm15106437eec.27.2026.09.17.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:22:54 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 02:22:44 -0700
Subject: [PATCH] rpmsg: glink: Implement get_mtu callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rpmsg-glink-get-mtu-v1-1-edc9496d0da0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGOxq2oC/yXMwQ5EMBCA4VeROZtEERteRRzQ2ZpFSadEIt5dr
 eN3+P8ThByTQBWd4Ghn4cUGqDiCfmitIWQdDGmSFkmpFLp1FoNmYjuiIY+z31B3LeVZUeos/0A
 oV0dfPv7XunktW/ej3j8ruK4bmsD68XcAAAA=
X-Change-ID: 20260911-rpmsg-glink-get-mtu-dbae4369d347
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, christopher.lew@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789636973; l=2525;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=nmzuZyubg0gt3//chnPIsntuNPv0HEE5hrN4K2onAh4=;
 b=X6rwYjbG9fkHKBgwAubKaK2Urs7cuItN31PRv8K3MpPy8RSEEnJVQ134FsMaAz+4F+Wcik9xc
 SsLQ9VA3ODuCCApsAldj3EggHWmJDhSS1Kv77Rh6kG2I8SJ/gPrdkmi
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabb170 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6_0z5GgOHooh7QBrRKcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: D-iqd4Al0QzL2jZ9CSQApvRf0Rk8RZPE
X-Proofpoint-ORIG-GUID: D-iqd4Al0QzL2jZ9CSQApvRf0Rk8RZPE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX7OSg6MYPEF2J
 xkmAufHpGeL92WyAiYsKHh2/A4U1hrtxBKNKJZaKdhJ55PAs94K6u4fwCmwU/KDQ55HheFiUkAu
 MgJ8/q2bAyt7tdwoqd/YCGSf+ldSx594X9weI7f+7qrIJRJlGA0abtPPfuaS3IpOw53BQ5uYd4A
 LEebwJbSLtrwNDVDe0BQSrUG3ihU65eRIzmfW25HrYhoLNkXjKYBJInqpc9e4u+GINyNeFZV0lW
 rZ/n1vHr3IVy2XfOU/xxZyLGFxXOFDSyNkxPsWjeEM4mVrCZpoqkoxLNGcrlfnRUaaqVLnoifXq
 m8mDtTEFayqrdx/n1jfzU43TUi0zp8FthMKBAo8qJfdq9KxPIb1XIHP1l8EwcFrTenZv4oVgcjw
 Xbc65Uh3o2wU42LkIo7HGfgMC995NmRbiDn3Iq+CVHu/VJdUV2DPTn7bCToU3oY0STIF02aHi0e
 zmq5oZUUjsWoLDpxtqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX0+cZbcIdC0vs
 hLSwyDwTkXOyV91gw7VlAZ1amaGeZF2vpqx9DYUnOvR0D60ADY/Uc9/u7/NJ6CTHcq7VJFc4wnP
 9KmllJqnZ9zZg7thTMpxjQ74IHu8J4c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170127

Without a .get_mtu() callback rpmsg_get_mtu() returns -ENOTSUPP, which
makes rpmsg_tty unusable over GLINK: every write fails and write_room()
reports zero. Implementing the callback is all that is needed to reach a
remote console exposed as an rpmsg tty channel.

GLINK has no protocol level MTU. __qcom_glink_send() splits a message
into GLINK_CMD_TX_DATA and GLINK_CMD_TX_DATA_CONT chunks that the remote
reassembles, so a single message is bounded neither by the FIFO size nor
by any fixed buffer. The only bound is the intent the remote allocates,
which is negotiated per message at runtime and is therefore not known
when .get_mtu() is called. Report INT_MAX, the largest value existing
callers can represent: rpmsg_tty narrows the ssize_t result to an int and
treats negative values as errors, so anything above INT_MAX would be
misread as a failure.

Assisted-by: Claude:claude-opus-5
Co-developed-by: Chris Lew <christopher.lew@oss.qualcomm.com>
Signed-off-by: Chris Lew <christopher.lew@oss.qualcomm.com>
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 55793fc18293b..ade9ca1cb9b9a 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -6,6 +6,7 @@
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/list.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -1605,6 +1606,11 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 	return NULL;
 }
 
+static ssize_t qcom_glink_get_mtu(struct rpmsg_endpoint *ept)
+{
+	return INT_MAX;
+}
+
 static const struct rpmsg_device_ops glink_device_ops = {
 	.create_ept = qcom_glink_create_ept,
 	.announce_create = qcom_glink_announce_create,
@@ -1617,6 +1623,7 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 	.trysend = qcom_glink_trysend,
 	.trysendto = qcom_glink_trysendto,
 	.set_flow_control = qcom_glink_set_flow_control,
+	.get_mtu = qcom_glink_get_mtu,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)

---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-rpmsg-glink-get-mtu-dbae4369d347

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

