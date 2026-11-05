Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874040;
	b=4D5YDGSXiXRS5i3A6vJjjFPmHxd3zO43a62WpaEIKlLmqvPgKcLOIjGWP12gAvCsHPf7
	 YVoD+SaMp5LYRwoDkly1OIF8kZ0sEc4AxhFimn04eCbHOiagv6Z38Ypd/9gJAvTfwPXCT
	 cHpGyHDrm/EA89G9NkB6rYUrDuR9gVw8vQChdw0FLvJD8+R765DE5Zun19CcSU762oAT9
	 Eqh1igwJP1jIDuEe3MsBQmnlhwGFbPAiP0VCA/3k2JlvJxQyMnnx2BC+wG1MxvfmmuesT
	 x3nfFInNwHGGqg6wpEjRNPAmCPjSKyxisbSJ0hEJLzcfnTk7NNBFzk7hi+p3PlxGJBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j3MiXUY5DliQEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=;
	b=b/6hmXRh43OoqsRUQbw4fbhzmm5O6NiLk3+qso0t9D/txbzx1cIrEVR3hEuvOjZLgKWH
	 gvgRaBvtF16hQwpbTQ+z9s8ORikw16GiU6mwph/BuNkO78vXMienM8HzQpfxppEcZ76B8
	 KzIChXynFe6Y8O9jWB+gqI8CStBya3ex2ISClAUd9bzJEpmU+TbPX56bhVg215HqqybLv
	 HbsZncirGsLF/83yey12E+k2a4E0oiZXzM4RDotuIjBuPzQsz8eqglAfWf3cSqb6emaQW
	 E3LkaQVh6Qdwdyawlvb4oJIY+k1RfKRk8aiwIOZWSYDsZPJku9+aQjFXHYS2RqwYllw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoYRXa2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVnnB7Ks;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EB6606EE80
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91EB6606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BIoYRXa2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVnnB7Ks
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1Rv61416479
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j3MiXUY5Dli
	QEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=; b=BIoYRXa2x8aYOAwTsLZfTmGF8Y6
	XpAWstodhWEybFqn3hxiZnEnsuXocduhyZMBCkAEDcALVBS1fq0XMFmboTVpgjvb
	fFjSDzzsFtGeOqUtCjWTjeFPH+Z3WC+A9k3qK5Q0oNZBgMIELDhFXkCBTO0+p+Sr
	RSG8a+6LqhZV4MgAG9cRDJoPV11NSznKG7YCX4NVbL8NGX64e9AvU7Q2CHwKcvqn
	AbQEZ3r5CqCuGiQi1xJffhfUGt5tWU2ZDpcju4WYd5dhvBxequlL9AdIcSKKDSHY
	5PXiFco8rou2Mpm0OwnsOhqf/Andm9+pq6xR0OPB/5nlNWJJvvJ49hC6aeA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd02j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:20:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2173043eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874038; x=1794478838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3MiXUY5DliQEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=;
        b=gVnnB7KstJLVITcQ8YTexJyRr5zD/nTonevvAbVz4q/WOl1yvx/L1sricwba6fdOCE
         vROHQHjvt4muJhMZvfbD8mCQF3Dt4IlpU0+uS/UpZWqgdd8MLoNNcKnKb/mkUkSXmsHv
         goNSHEOte+i1pJr5jTHhYWkgPdimfAhEudTzcBjgrdidM19+RvFAkwBJbsuIJu+27PoZ
         jSliQusn4hcH0qPnSgy2/dt3m+YQuEbNFtb4DbLbrSitC/xlquQftOspl1R/IKSSWRpX
         afWUaPmKDAGWf8b4qnp0hfIugndvO9flGcP5bRBfTjL9UVrQjGT7f4nkpESAw0NVzmsK
         RE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874038; x=1794478838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j3MiXUY5DliQEu2W104SSlUFqiy4PGY7JahO+C2gJ4E=;
        b=kiEDP8gCX6gxRwPB3wpwxn2mmn9nEVuGAAGLbh/Kpc8fGxfks6/OtBZUe23GsP+xqu
         i809T4ssz1hmp7g8i/C4Ut7AN9BApYKCVp13gW/sCQTjD0ZaNz9R1JIuzU1I8yebrSrI
         ZAbI08GKtMxYpSSS7adxYTzRfUjgKHxPLQqV4kL2CEoEXMKdnc/n9BBGMF6ODFP4Otm5
         P+9vWeb9uoj02p62xnBj3o1ff8BfDw69HONH9qbbq1T8pz/JZoEYo+y3l/dzJXH1Mfku
         N6JYyd6y9K5NPGNgTBlFVIUDYBWk4Ew2AgMvtPkNBEqBDfF6E62tad+Zo1H8y4qz8IMx
         tOVQ==
X-Forwarded-Encrypted: i=1; AKwUvByc5Ca0r+X+BORek7aqFyVB7+OdM9c9zQNqPbRf/Vi6bGWY77gEuXEIg6QfsuGjoSRMAClGuCPmnp2UTrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8xf+X6feqeDXUauJTBWzzvvJXOoP7TgSoIAkvSTFx34c+YXgf
	zkt7+w6FaFRbCTQ+/7r0jZym443IBgTgm6Q+ymJahfCorbVymmaf8lMZJHxN3+grV2Jvk0VXyMI
	2p8DX37AEZa6sB03Bipv31FlWVWpVl2kYr4On0E4X4v0UePJCXlUyhW7nfiH2jh5tJKw=
X-Gm-Gg: AYBFou2sn5MIvIMsbby//2/bcmUPRrQn/hgmgAStFGWtaRiz//wgVobCFglrv2jCTVl
	asFn8cfER154qmKHs8qHtjWaUqZw97xpcIlnhHh0JloyB8NSf8I5eB2c3Dtgp/kjXAyrWua/GQl
	3KdoRGo3L/TMU5Ox/7Ud91Q/Hq1BbZ/eIa2aXoktr2tfVkyPyzxECJ5VzEBct9RisYdyPOGEhb3
	Cixk26Q9aJI7G0+eySSHMcbUkC0qWSzaQqfBL3/S4FXW78BhssgGGdEO7M1T3YMv4OHBTAddF2G
	wSuSdaOEzfwhBZTl3joUEGdrLaD23IJayKQ95JuL9nKPMa76NBD2RDCVrPTaMtq2W58BPFZjaZq
	dR1Ie2NWkFWs/O4NxE9m1uBVfYypJnqKNy1jHmuKXInUeAYMyPUrLxR4dDmgVjXPcarBj97EIwa
	Hruw8CYyFp
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr30656491eec.38.1793874037746;
        Thu, 05 Nov 2026 02:20:37 -0800 (PST)
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr30656446eec.38.1793874037091;
        Thu, 05 Nov 2026 02:20:37 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:33 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
Date: Thu,  5 Nov 2026 15:49:55 +0530
Message-Id: <20261105101955.3732723-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX5h/3q0runScD
 m3W54NLUQH4ihOD0fGr/bB8o0UcAVL9lwfLPbn6ysFkA3yQtriV7yPsRnq7wNBFig1CeORTMsq4
 v944l523rt7JR5NNlxqX8aS+N7lAn7s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX8+qcuUwEMgpk
 cezFb+rkd3JzolzDqNCjxZrXVLENoD82y4FmM6aTXWAItcVOcgbX5G8oUhXwMIWajSCI20hfmB0
 QFpil++h6/QP7XtV9bnL/nrTGXeu/rdeovz1n2dTBLB4vVMHhQFrhkMAKQBj65uVsm3b24TA61a
 pwTvxlrCnHHXI2ODqi8CB1/7fxsJLArRHFC+ppUDVcsjs3vV5i8/l1eBw5pQztj9OQ8MzbGwaLI
 t0sEvZ+828XAAmQhPq+uug9jPBuF7eIo03PTGvt4dZnI5BKo2PbsiBpjfbXUPOpLIctD0bQRDHx
 DumVnUmI+ev8PBOkNXO5x9/4WOg9oDP4xkSbP61T56VzbZtPF1V6hgSrUH6MQvSpiOYjVxmyZMQ
 SK8NwuXw5bqRIQT7LdDrQCNx1SJSCNGHQQcCScoEhcvVZ9DGBapoECE8HfSpC8ln2FoORnic1a2
 pej0I2V+Zd5NR6u2RMQ==
X-Proofpoint-ORIG-GUID: P97pxS6jAFKk7ZJdvP2l2SP7AgZKfGVE
X-Proofpoint-GUID: P97pxS6jAFKk7ZJdvP2l2SP7AgZKfGVE
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec5876 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=eWlXABRqF5iA9XQ1jREA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050041

Enable the SDHCI controller for eMMC functionality on the Monaco EVK
using a device tree overlay.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c5b2e95cb9d..3563ccbe771d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -80,6 +80,10 @@ monaco-ac-evk-ifp-mezzanine-dtbs	:= monaco-ac-evk.dtb monaco-evk-ifp-mezzanine.d
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
+
+monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
+
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
new file mode 100644
index 000000000000..6454efc03ddb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s2s>;
+
+	supports-cqe;
+
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
-- 
2.34.1

