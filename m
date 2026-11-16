Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814900;
	b=t7bV7Yzln6Xs1uITypwNE1XUBMVzjSdrNnLOEq8hMhdFyJ0BxBU03VFYFBsEdPk91YnK
	 UXlJuTB7j6Sof0R6d3bz20yd1LIIG2B61d0/leUi6pScdC+f6cIrdEypC49S9yJSWyBFy
	 aWSNqStB0HOkDtm5YNbgjd4M0C6dD55I64gdt3JcgpD3EwBesipFNFAb7ny7VvcmlmYGf
	 2LXE0V4IEYYX0KLTIm6C6BCpPARuosM5vJEFzL3kQg0iVmo7oevFdxeMt6Cv3hYMGaMao
	 +gObOz2fBsrocohinvkAI8RD1cizuEJdJpsJu8RusBf1iHJaziMumIxRYG6bk4gbaoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
	b=RGkj1+6ZrMtwHUzTWMlwu6EqiO31DWDwfv7e4PrDo1NgaEjqfD249pseRFRXIE+k8pua
	 Lfa846SUEI8ewgWkCVoiYlw2X+lT4DrcQtblSzBMUz2Rje9NTuyqfZsy/w2Ps2LljVWh3
	 c5HwDOaW6dVnSTTxyVls5o6xUowMJ2vNvo5r0WRvs4goI+sV7faXMKfLCOfQWSIxIZ/QE
	 Kp1nXL/cdID/mE67d/Y2yH4VwXrdfv7dNggV81kcpItNTCUiqMnOah6FO8UkO30s78dcI
	 ylY3EcuNBGcCaMoYgheigdjQJ9pALcpYYsy+sFkjOEMo4rLT0/3JSg/t6+zCOE5vbcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiD7pAi5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VGgsOagW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76615606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76615606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiD7pAi5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VGgsOagW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7exYF1633041
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gG+nqVaWG3U
	c8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=; b=fiD7pAi5zEstA8r2Vs44yFkqR4X
	YvvFq4o52bSRYK48HE3aQquJlX6w70anF31TAXrQ1eJdQ0xX84w7A3lTBMyh4uf8
	GDH9NSWhY7V5P44oAiF2I/pzBGcs7KiTkHiZmNyLcuqnqQokHS8jAJflVfG5tAhX
	9Pgejhz7no8XiyEPWmu6DxmFuJ4ezoGWC9bjIkaQoCCo4vL7zLycSIyEovbWPoER
	CWXAsaadk2p/vpIu8+mV3ai1DSR2P6GiQobPkbwPR0WWj+wvLIC5eSd4FSt77ilS
	ixsJdNilDpEsS0dK9FVYg7fPnLisGW/dbJU0MxZ5EdiGe8S238tw+Y3ZNhg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmanaun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:41:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so3254612eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814898; x=1795419698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=VGgsOagWNNsOA3nfb5HWNgKKp/k2uhs412HNm96pKHoCrjfnJc0hTNhCqeN8ul7wNv
         8r8YZ6Sr+qhOopKYFJtM58b6YRMJP+FuAckzYitTC08TPQldNV6cFhcLTfS6vuwVzkP/
         ctQt73DiM47ZYv0kXxBuOwrQ5xe+8K6/SUovnYF7t/QrG3qFfSWlsgCtAR7j9GpkxNaO
         o2CI6rxPt5Qha5WIdA61tgrsTU+xfuST142c32aVdKZplSZpkAU7aosHDBPXGZGjpVqu
         vgwW1iO4URU74xqzkJ86FCYWlF9ER7UhuG0i2VBkdv+mJ0GB/xIrwoLSWaiCVBzDHXXp
         zhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814898; x=1795419698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=g+lQVr061t8XYBTXQ1VjyhxAH8P+L1H0Y2fyOxTLgRAhWR9J7iqY3wXlMAheWgyQdw
         e7aXwfVXarLjqN2d83Tyg6fTg8r4ftLoxrKvIlN/XmG8XteVQQVggK5v02nuUOVihIY4
         J4Lj6LhntS4KCjaUEAv6DCaS/pkfRwqbs6prjZu4s9o4MQaAZka1+D/SRYn5z97r10xu
         IXKXYE4Ox02jSm+TySTwLSlsdihFuEANvh7kU1/0XGEvPZlH/zzxFo3wySk/FLo07AZ9
         7fVdKqNYF0ozZbH9eqYTDxJ8SwE7D8QgfXGJXJIdAtwUAN48zHkca8TWrOaqtutH79xS
         XZtQ==
X-Forwarded-Encrypted: i=1; AL+hErF+bqqVY7jw905wWjznWsPMFJJyds2A0P7UdjmSSXWBJj9NVXN04cbNM04JZUfPvXInYLwEbWv+/PWxVno=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zCVp7qh46aeb8aoTJFv+g4AoELOANTcRJREtWygRXMv23Xn8e
	V5WN6nbRjT17K9fGx2QrDP5o6OfjSvAnM6Fk755MxtOvA0cIr0IG4NgwZkRzEyU8rV2deLcVgq+
	G7nlFTqhQT60rwcPA8RrX0aHVS7fIkUpVEiQ6atxy6QZjEN0iIsxXzUzUS7LAaIQ84HM=
X-Gm-Gg: AYBFou3dPlOELOLyv5cNtc6KEAMTV0OfQecLSg7eTdQh0cRVjESvk8P9fbOsV7ddh7r
	ebpuD00UYxe5P+bZUAhln6o6NMXwd5aoq1Ept9h+ZOOxREDm6eo8uXL4F02dkbjgQ/9Zt+2pyam
	3nqogKihVr4QJqldjiV/T71cC2SfyWMX8DC2nY7yeV7ugHgXBt6vsm+myY71+wOXcE/oabRUxJg
	Ci8V/Xjkg0ZHRQC7FXDzUEQwWQ2CHmcIOwZ1sYEVyjJgdy/nx8BPHzdzwC8Icc5dJuLyRNBpz7E
	RyUwvJeqix8+RLsSqoWy+0S1zwLEs2h6xu99BFXT6Hp7IukmCIUNS+AJXqbPYcsKiBSYfTDXval
	0RIJGPNopgo3S7hcJvhLu9S56CBsbApoFPuO/5+Zuzwn9brBxzsOAztmdunydAlHURtEa3tAzlO
	vfZ9u7BsuVMg7oL89lsEBBXb4WEhZ7bXDYNA==
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr10492326eec.27.1794814898014;
        Sun, 15 Nov 2026 23:41:38 -0800 (PST)
X-Received: by 2002:a05:7300:8284:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-37966e3b0dfmr10492283eec.27.1794814897499;
        Sun, 15 Nov 2026 23:41:37 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:37 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v18 2/8] coresight: Move CoreSight management register defs to linux/coresight.h
Date: Mon, 16 Nov 2026 15:41:12 +0800
Message-Id: <20261116074118.822731-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: HRWLGGax9ECtVVZZBN557TC9u2AgzyU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXxqlxNB4xq2Tu
 dZAmQanLAM37X7denpy8ffOiByBE4P8WGVqnLsJo5GYj2iNl2uefTBcRvw+RajU6jlivvUUxxoY
 bsbg3uvSHepR2XRtcECYqjeLminp8L5bWu1/RojxuRGaIkunsP1FuYiY+wNrGbm3PsfCds6r6G8
 9O9ohvFktlabZ6m2RhO2fCpjsxFiAn4fXX0glEozvt8XvobjGA36XCpMFyfx3B1Fbtp9scvT4C/
 KuJEdQa8pu7hRC4ApB7KdRIugkTBkY8oDWvZ3MqxBIeKWTAs2WULTMGesURU7kWSxFMvUEWy+5H
 gGMpuUxOUf1wSVBVdiM9yZCYEPkdm20+nXyWmzR/WMEYvmL+xj0Pow87ycgo6alAZAGbaWotxoG
 DfW1MOoHCnrI7o/oyD49NOfL0tZJx05DiD+uDCNBXDzdlZChPCeOKvF1Bu5kHjMC+uzmndFjwN6
 l4Wjdbk2hhSol11gSqg==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afab3b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=37ODTpUNugoFd_DpGuUA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: HRWLGGax9ECtVVZZBN557TC9u2AgzyU2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXx5kgXHP+n6yu
 mW2lhAYGRFpLY7VNAIWrrA24AvPaC321RQUWGa2IBSIA4kA0I+GbOCrilgoKYBAJdvybbMMghDE
 I1EEtIYXPLLoIql0uqqA84H4XTMjcjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
generic ARM CoreSight Software Lock Access Register sequence, which
is also present on non-CoreSight-labelled components that follow the
same architecture (e.g. the Qualcomm TGU). Keeping them private to
coresight-priv.h forces such drivers to duplicate the exact same
definitions instead of reusing them.

Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
include/linux/coresight.h so they can be shared outside of
drivers/hwtracing/coresight/ as well.

The remaining CoreSight management register offsets (CORESIGHT_ITCTRL,
CORESIGHT_CLAIMSET, CORESIGHT_CLAIMCLR, CORESIGHT_LSR,
CORESIGHT_DEVARCH, CORESIGHT_AUTHSTATUS, CORESIGHT_DEVID and
CORESIGHT_DEVTYPE) were still defined in coresight-priv.h, splitting
the 0xf00-0xfcc management register block across two headers for no
good reason. Move them into linux/coresight.h too, next to
CORESIGHT_LAR, so all of them live in one central place.

Also add CORESIGHT_DEVID2 (0xfc0), which is part of the same register
block but was missing; it will be used by the upcoming Qualcomm TGU
driver to discover the number of implemented timers/counters.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 34 --------------------
 include/linux/coresight.h                    | 34 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..c365cd881e4f 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -15,22 +15,6 @@
 extern struct mutex coresight_mutex;
 extern const struct device_type coresight_dev_type[];
 
-/*
- * Coresight management registers (0xf00-0xfcc)
- * 0xfa0 - 0xfa4: Management	registers in PFTv1.0
- *		  Trace		registers in PFTv1.1
- */
-#define CORESIGHT_ITCTRL	0xf00
-#define CORESIGHT_CLAIMSET	0xfa0
-#define CORESIGHT_CLAIMCLR	0xfa4
-#define CORESIGHT_LAR		0xfb0
-#define CORESIGHT_LSR		0xfb4
-#define CORESIGHT_DEVARCH	0xfbc
-#define CORESIGHT_AUTHSTATUS	0xfb8
-#define CORESIGHT_DEVID		0xfc8
-#define CORESIGHT_DEVTYPE	0xfcc
-
-
 /*
  * Coresight device CLAIM protocol.
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
@@ -116,24 +100,6 @@ static inline void coresight_insert_barrier_packet(void *buf)
 		memcpy(buf, coresight_barrier_pkt, CORESIGHT_BARRIER_PKT_SIZE);
 }
 
-static inline void CS_LOCK(void __iomem *addr)
-{
-	do {
-		/* Wait for things to settle */
-		mb();
-		writel_relaxed(0x0, addr + CORESIGHT_LAR);
-	} while (0);
-}
-
-static inline void CS_UNLOCK(void __iomem *addr)
-{
-	do {
-		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
-		/* Make sure everyone has seen this */
-		mb();
-	} while (0);
-}
-
 void coresight_disable_path(struct coresight_path *path);
 int coresight_enable_path(struct coresight_path *path, enum cs_mode mode);
 struct coresight_device *coresight_get_sink(struct coresight_path *path);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index edf2a2fc697c..1e2ce7861ce0 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -14,6 +14,22 @@
 #include <linux/sched.h>
 #include <linux/platform_device.h>
 
+/*
+ * Coresight management registers (0xf00-0xfcc)
+ * 0xfa0 - 0xfa4: Management	registers in PFTv1.0
+ *		  Trace		registers in PFTv1.1
+ */
+#define CORESIGHT_ITCTRL	0xf00
+#define CORESIGHT_CLAIMSET	0xfa0
+#define CORESIGHT_CLAIMCLR	0xfa4
+#define CORESIGHT_LAR		0xfb0
+#define CORESIGHT_LSR		0xfb4
+#define CORESIGHT_DEVARCH	0xfbc
+#define CORESIGHT_AUTHSTATUS	0xfb8
+#define CORESIGHT_DEVID		0xfc8
+#define CORESIGHT_DEVTYPE	0xfcc
+#define CORESIGHT_DEVID2	0xfc0
+
 /* Peripheral id registers (0xFD0-0xFEC) */
 #define CORESIGHT_PERIPHIDR4	0xfd0
 #define CORESIGHT_PERIPHIDR5	0xfd4
@@ -36,6 +52,24 @@
 
 #define CORESIGHT_UNLOCK	0xc5acce55
 
+static inline void CS_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + CORESIGHT_LAR);
+	} while (0);
+}
+
+static inline void CS_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(CORESIGHT_UNLOCK, addr + CORESIGHT_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
+
 extern const struct bus_type coresight_bustype;
 
 enum coresight_dev_type {
-- 
2.34.1

