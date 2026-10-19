Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A5361969
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376162; cv=none; b=YEBrKuAMrgiFR8LrqEyod7xqaxXorCU9p2IBBhvJ9ixdIsYZBb+GVOMPsMYHu6PhPtpQdpxh8nc/sRBTmdAB8reeUFTnPULd/+F0e3zCKL/ACrPWfCvAs3sWlewCSSW5UlHGK1i+Z8GL4cPUavfCGdj1lgxeVUgKJQ5xnZyg5KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376162; c=relaxed/simple;
	bh=CfsKmXvQMmfwhivJPr8zI/3pkslY9CJXxhXXPKPNpk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ploP5KWNWDvFO7JO+/Iv5c/QtcoDtdnDM3Hn6qBivP7uTjIYUVUmXKdFC/06KdPbwMFiwAmQvyF5O/eqZM1mi3FLACm23g+6ciofFLDto/JhBGGXZ2dSylRpGzR4lq31v4jylzBZU9DxG7jBogMUHMK3/bV7GlApdVcPqKwMsoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IF6SvwoF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsKyxbMN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IF6SvwoF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsKyxbMN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1G1Vc1737180
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPDc/2Iyewb
	HKgbAhopwYa/tAZzWomqFwflZJ88FaEk=; b=IF6SvwoF2MsrRNDG1M5neVgHJqX
	3S4yeRjytbLnsi8jiRbGV2m+HT45CXlAwiJ7nh/SycYS7+wP2q3F8CUFjnCWv9o5
	6ny40mjkam7C+7YZyGq9OQsmalCEKDg+KvlWPX/Bf1UQ5Ka5c62TRNJa+GTOPW+1
	9/bU7f5uB3cRMvQkaij02mK2flTwojwa8k9YRiy/MvucmtmXmLG2CW0T6iFVUIoI
	A2cm+OziGXmdZp+Fyy+4tkot72CqardmoBm0TMDqJWdWB67ikTsUSXpLSs/SK34L
	5mn2mgYVGxk6sQowEai7MJmsSHf0rm35dazQ/mcEhARDcz5ekThuBy1qiIw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1ghs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:15:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5251521eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376159; x=1792980959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPDc/2IyewbHKgbAhopwYa/tAZzWomqFwflZJ88FaEk=;
        b=YsKyxbMNUbCRuA60qdrfJjwGOE+addkK3vGgv4FanaNVxS5Nb5j29k8mHT/muN4EZb
         g0TBuuILMSR85PYZMZs4/3T92ARqOUXnUEoqAVECH9lfReT1U6fui4GjQiWEB649DIe+
         KZ9Nd+TRa41JayBUwwJFjrS6KE5YGMXrV1ksyPeGCg1RxrPKF6XKaXYQccb3NXNdHrJZ
         HGsuun2ZktuqJmUD13zmhjiJrOErqdC6TaiiraMXXdDnLo43swuoVrEREGNSLUGoG6A0
         3KnOQtrqqcvaqtgK0yrocJV2i7RWL/+aVPxsXAGxPBHWje+WXCGL2oW++wZd3yWtr6/M
         A5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376159; x=1792980959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPDc/2IyewbHKgbAhopwYa/tAZzWomqFwflZJ88FaEk=;
        b=Jvo86Ef7QXz6pnuaSXz6qLaZMTKwY/SWcGGSHAOVqmFy2QPqMhaxE3rqETtbC2Bg5w
         JdsPMlT/GhXhQkIHpWN7zHwwI/TfSFbt3G+6IiLXq9JfWFzPfucMoU3s+iUTmFCOT/9M
         vxraXNSzFrWvCqCkxzsd1yMb3N7+NiGfcu4bWHBzkG31/jEJgtwK5uxBGsDtqH2fQZwd
         CrTeW1I7z99k4lxsKEz59a4dMQY3LvKbx0rXxzWT8bQUBGTFJV2Scv69hwk2kdtpc/eA
         lNmbIaG4Eyqu5UhDEC3y9B6pXdMFtduEHT3Pp6vpO/Agozbak5/yG/wsaLbu0evr3iDs
         Ykbw==
X-Forwarded-Encrypted: i=1; AKwUvBxMy1UHaacRb5DaN1XFvBPi6uoHepKvrc7vzMFDjE3xoRS7HWi3rpta7aFfrW/bySiueBWJdtg4mcfrCnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwsoi/DakRpQvtWGdowzDiWgX2cG5ETZlDK1ORYCM1xWhQsYKg
	ORn4otDKUhI0gnypu75P7QIeM0Opt6zZZK9iii6iqntfESsVrn/YbRhIsf/JF/dDJ3XawUXdZ5v
	1clR3VEfJPAZLlsjCsdrckNqFjBbUtIQdfs96RHQQShAgXBqjUkEvfZBflEF/5SLSmWo=
X-Gm-Gg: AYBFou2QSdOR8snX9Xh0fwnRdtS7BNZsekbsuL1eJLXM+dPoXxxfV+BRaB/EOeWqBn8
	GFYAJ5u+v+TYosNog/48OnVi2+cE0hEL6Su1CGh7yWsIyzysEiZf+2sLL3Z0yiKQegcKN+rgDdE
	4zebdIHBbHff56fGvuR1mqdt4S+dMwUCOtx+RvZtSC/CfcSN4p5xJhJsg4L2PgkvIvOsJdUZnej
	UgOcc34B2OovcqEkYDL3AXRNgC7hNG7OzOKxnfoPCYRzo/KZXc9n0EXGeeuzGPqyHRhW8pQY+1C
	SW6plv9pVxfvPt3r9kMsl8zQg9gvmHMi2OOObPKUqlwrc2nc8dw2fDEwI3nvEZ5QTNYlAzy/B0d
	0uIuZiVLS0WLpwp1FhUR39eLBk/h4SrewNzCCio1r8plqq/RhVg==
X-Received: by 2002:a05:7300:ae22:b0:359:2a1f:520 with SMTP id 5a478bee46e88-361a2052f01mr9491242eec.24.1792376158818;
        Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
X-Received: by 2002:a05:7300:ae22:b0:359:2a1f:520 with SMTP id 5a478bee46e88-361a2052f01mr9491203eec.24.1792376158225;
        Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:57 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Set snps,resume-hs-terminations for USB controller
Date: Sun, 18 Oct 2026 19:15:45 -0700
Message-ID: <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: msMDo9RGBm9tn15pAoFyljr66KSlhVvY
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad57d5f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=_PA-CDJEJREJmSlHXOMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX7aoMvI0VpPEh
 sHf4hlXTLH3+X35baTij0cKIlOn8580Ym9dOJ20//08Cww6UiAlvaoHQttFSs45wp2DffWYGrTk
 BgzwI5urEpncF9ZopRBkp3QA/EThNRA=
X-Proofpoint-GUID: msMDo9RGBm9tn15pAoFyljr66KSlhVvY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX8vMlXavgkLL9
 GZ4ZhNofU2tG3HI0Yty+QvKSZ4Si5fubCB/Z4xfpgW8W9Fjbmsig3A8xaNx11Lf6gFZmhgCvJWW
 ttROyfFVwrz/L0NDBMl3dh1ok8TBVZkf2Cl7uxohRtfULXVtVxU8WAdCFMk4XMU5r2nyloZ+DQE
 MfYcxGl0nldw/2vtXKafBQNfeuyhtT0QwjhDC3tg+24i2yHMoqdu65DW4WzVWzABqfZDLbvSsv7
 tp2B/bXP9mcJJQFxCDmM206SiKx06lSQAdbJtMr2XLpnuzd06uvjdS0qEDFmNaCBnORWUA9sjYH
 TYnZY+bGJKaRUPeeKgtMEejkJXewUMNURBH0LtP8iS4UmPr4Ih28SzQyu3lbrwjCkmHTHRSW7cs
 MapfzeHHNbn0O+54+Bqy8faLwGYf9xeNWOFKquOo4lr17DHtzCWUgQBiku9Ox2nSYpp/QT7anST
 igsLzg8wiywR+tVa9bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controller on SM8750 is paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Set snps,resume-hs-terminations on the SM8750 USB controller. This makes
dwc3 core set GUCTL1[10].

Fixes: 7a5bb9f60527 ("arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 521b1d224c28..21ba6992eaa6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3334,6 +3334,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,usb3_lpm_capable;
 			snps,usb2-lpm-disable;
 			snps,has-lpm-erratum;
+			snps,resume-hs-terminations;
 			tx-fifo-resize;
 
 			dma-coherent;
-- 
2.43.0

