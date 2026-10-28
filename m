Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213994;
	b=wDk4KUzi9pXHyngI0JnJJXxor069Yu+BB2DWoyOjetPiuT2swnv/jBDEukfhj4bxCRl3
	 8+0OllNrOEY/PeDxxaxLeKwMa/qWG6O8sl0JkuFB395+S+eotSAAc57F6scyqJJ8DLv60
	 mk14Cg97KgLrmvPGXUMCI+IPFpJCd3M7kuNY30psnyaxQsnAZwRVjMrlNZC6KzNkui1qf
	 33wlIgGvCihis8miZ95L06pl0I+vEL4xwLEqkw6CI7F5V1X1NrYG6TVOt2ya7+3zS1J24
	 CaaTJHQkNoxa7hEyxPHKCWFvQq9a49Z6w3Aqmvvk2C44Xe2GfQ6aZZkFhvSXiL7hQkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213994;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
	b=cmFuVQT4R+0v8klHb55JHPyEN7pN1GEi8DJZ9h7/SQ1KrNbau+1dD+i87UCgb5BF5WHz
	 xvn2hnsZjZn2s9DpM1TFFHcyiPCSf/7v44xpIiSnbk+93zmIqP3U2Sdb6Xi9ZHdE6tGTH
	 3gwJxf8DdXhBab0P67JRoWRoAY7WKsnTgpSO2BXzjoXnRsFq95YNm1XbPQ0xvQGP8p7PM
	 Sk6oOF+iLMVLyRtiKH0ZPikdFljm4vJglz5Wz9tOKftzqInCNmBm+3g2md0R7lDJvoZa9
	 q+sBcz1TzV90gHxTApjkMr/cOrJ93pNWNqW7vmsFuGI6pYfXoUMv0RrgzALq1j4TV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLLHmiL7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BVpg/oIh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BF6606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50BF6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLLHmiL7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVpg/oIh
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPglV2431699
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VfDVxALSW97
	OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=; b=YLLHmiL7LRRFAS3o6PkkWiRyCpG
	8rHz7D26TAvIACIOESgrQRz5AV+p2PTt35heKebPPNW1ttNNDUkfvreuTq0XK+FI
	eMI4W0ek5YpuuG+NnTwj2AFjwiwmMxHImX0PviX0Ko28GIOhMcpV7BaPLrCxQlzR
	ufzd3Zmjt8SJBZeg2zcZk7sgv0hWINzNSH6C6vHQnLKqfK+PAk+Ni5WAN40FEA16
	OAX9mZhycbEVmTGn0WeXcf+kqNYk/xGXaYPXWI1omHNaeGiDAOs6fh0iotMR2QFv
	AeKsWA5+ucPGS91/PeZogGpZkqaM21bCIOd/zWCuj8R+xFFeiwn8EpREI2A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7tm89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:59:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso2825710eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793213991; x=1793818791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
        b=BVpg/oIhuvODiiAChzNftA3cS1BCyRhf4Bly6jYCfcQG79ygWA+8lSLjenBc4BNlbQ
         b8fCmGxqZhnn2/aZzQg94vNGrxKL2fk0Ai7ufi3pE9HsgUuubM2TNQsvzbiOBdxLyh+2
         VHAZum7SUHJo1kcRHj7BJ6UWAjT/sCP7XJbFmSrA4a7V3EtIOkz/9vL4hsBGETP6NOio
         Z1dltUIHGF6Mc3mf1qv3NAIUVcUfhgcZ/arUG3heKFwvvXBTS91/cF60qjXPxONFW96l
         Qp75+0V/EGILjJ8sMT5IJoePD3eXeOn7+cm6lMIJBsWVgk8wlhgti/akBCd0YXJXJJPu
         IOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213991; x=1793818791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfDVxALSW97OkQKGJei+3ksl3p9bGFnyfKAfdtOvsI0=;
        b=gKjj9sfbacW3aDp9FX08yIiuY3nsCUNafAki97f+Qq+XzUqIXYsQkaPBWxArLhV36B
         cKJG6b/CIyRNFfAny8J5Ih/hVbx+nTKeRIMCE9zF/IB6G5zGSU4dM5V9b7u1shGZY6R5
         RhXFiQaDi7PCdN8hmQ7B0YmSNkz6ZLOnxxyuseSBLBzpm1GKDUaUieo3UeLCA/nMFhtX
         Uc5DmSNI7+y38A+jWm/rTQ5EGKUDkZXmY4jbB+mAer4UoICr1H55+FNQ/telXLfELN1t
         +c4/ZdBYE3GcwwVpuBc6KdJSvn9lNxQMnVBxI0hb2StEs4A1lqM58ggifDW1VFag2Zmt
         sw7A==
X-Forwarded-Encrypted: i=1; AKwUvBzn+Q6KKV3e5nl94xcAiCBNgwxky8TPr3bg8HBGTWc7O/ACXelUhHpchaZilyRqJgCVHvoUd1n24Ti6Z70=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfv/Qqx6Nhqt3ieW8eAf6/akrMBF8UvT/Bgn6i1baYZDSbtLCc
	hNW4y08RRoL+Xr8K6tOktakTL+U8oLQQGYboHYbpv3yaI6fq/dDKNWHHQ9EIjpBS1AKgwYC4vr0
	1nW+MMoosun3N0Eqm8kJGAi0joax1qhb1dSU3z9Rp8N4WFxiJuS0rYvVClhnc7OxE5uw=
X-Gm-Gg: AYBFou0FyGZaSG+SuAjSgTG74KbB6AVmWcU6YMvk6AJKIPygTnpW3ZbHTQ+gwTgPVVx
	4OP6wK0MKm3yFfD5C7/wUgqiOIp5yTvHfwM/h4/8YkI01Dwe8eeCqGFO9e69F6pWSn/wdjEOV4I
	y/V0wdhwyd/MV0heBQFXF5Hy4FyTVX+J9RGdJyIJjp4SPIPk63r/tvSYX+b0WEYV4tHugHcKbEx
	pm9a/11P0xDD/ArzXOPT+k/gE7DtRm8/bwWpHCogmfLaR0TTi9Qg+jLPZwl1vyRdIqa9zDk2FZJ
	tZPDByb7cQpq1kpCBJugGy+iuaNEUj/zyskO3JjuaKuQDWIx3Xoak8YzjMfRS1pQK89sGgKxg9i
	DwPl+eFjnZnWRhrdfZuKbbFPwHBowo3pHwBO3f6otA/wGl07vNXUaeH2HtqCh5wLmsQMYkDUPfQ
	DvnApPVw==
X-Received: by 2002:a05:7300:bf18:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a20443a5emr5127240eec.41.1793213991046;
        Wed, 28 Oct 2026 11:59:51 -0700 (PDT)
X-Received: by 2002:a05:7300:bf18:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a20443a5emr5127196eec.41.1793213990474;
        Wed, 28 Oct 2026 11:59:50 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a56e9sm8639936eec.27.2026.10.28.11.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:59:49 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] usb: dwc3: qcom: Distinguish PM and runtime suspend/resume paths
Date: Thu, 29 Oct 2026 00:29:32 +0530
Message-Id: <e39a38d334b5276d8a47b917b1f0fcd0a32bcfe9.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae24628 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jIQo8A4GAAAA:8 a=tqe-1LZTDOhu2qnNqD0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: _CQIZfULE9GDpLdbH30b-7MQ_LzX2q3F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfXx7kj1YGasq6e
 ZvrlFEiJlHoIeocCM13do8TnPv6aYNuEHu8N8vbjotcQHH3lDlImYHiBqIKpweyYXhuFtZTygas
 ceEdGUbx2sa4go5E5h1+m7/wT//VqQM=
X-Proofpoint-ORIG-GUID: _CQIZfULE9GDpLdbH30b-7MQ_LzX2q3F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3NSBTYWx0ZWRfX+orhNNA229Jb
 IBTLB9OBXKoslPjS0pCyGDobAX6mD2LOX2/sAX4WSPnWXA3M/XnQyv8gBYbz28N81+qXdD1Hix4
 DIZe88fg7U+4r8PrZaVsYqN4XSkutzEnljbwkDtUUrWJCef6ugerClRIX0aEg35oRvfHMZKR1Qs
 NAPburDDobo6P7RuVPEqC9QGI/U0D+6WAU1NPtS2n7SEylYLmPABR3iBHWBI/gQOjsHGV/FXX4e
 VsWZ6YYUb+QGZ39MiYpIyIQnZcBZh4fYQt0hrdm7UrNAgTlK8H3cB34koBFix54OolGfjRJzpdh
 MvaLs1zyGhJw/vjt+7dVPHf0neJRNwzz9JI/TzqvvU2RA77cGm0BRdwsvJ/jWmw6dnYiBXIlz7c
 OdCcRNVk7Nha6QKWokWzhGwNXmsOvgCF3BdRHrwRzSCW8QOqcwEtHUWDQQUNoZSk+RnGiH0vaQW
 NTlnz/a079JY0jh5O7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280075

The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
handle both system PM and runtime PM paths but cannot
differentiate between them, preventing distinct power
management strategies.

Refactor suspend/resume functions to accept pm_message_t
instead of boolean wakeup flags. Use PMSG_IS_AUTO()
to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
system PM (PMSG_SUSPEND/RESUME) paths.

Preserve existing wakeup behavior: always enable wakeup
for runtime suspend, check device_may_wakeup() for system
suspend.

Follow dwc3/core.c pattern to enable future per-path
strategies like differentiated power states.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d4fda4dd81f6..508b1ee7cd0f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -346,14 +346,24 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	qcom->wakeup_irqs_armed = true;
 }
 
-static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	u32 val;
 	int i, ret;
+	bool wakeup;
 
 	if (qcom->is_suspended)
 		return 0;
 
+	/*
+	 * For runtime suspend, always enable wakeup.
+	 * For system suspend, check device wakeup capability.
+	 */
+	if (PMSG_IS_AUTO(msg))
+		wakeup = true;
+	else
+		wakeup = device_may_wakeup(qcom->dev);
+
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
 		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
@@ -380,7 +390,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 	return 0;
 }
 
-static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
+static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 {
 	int ret;
 	int i;
@@ -766,14 +776,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
 	ret = dwc3_pm_suspend(&qcom->dwc);
 	if (ret)
 		return ret;
 
-	ret = dwc3_qcom_suspend(qcom, wakeup);
+	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
 	if (ret)
 		return ret;
 
@@ -786,10 +795,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 {
 	struct dwc3 *dwc = dev_get_drvdata(dev);
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
-	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
+	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
 	if (ret)
 		return ret;
 
@@ -826,7 +834,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return dwc3_qcom_suspend(qcom, true);
+	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
 }
 
 static int dwc3_qcom_runtime_resume(struct device *dev)
@@ -835,7 +843,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, true);
+	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
 	if (ret)
 		return ret;
 
-- 
2.34.1

