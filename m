Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900808;
	b=zkrCuHI9XOrHdCkCjM283W/3ArcaKJZvv96gn2XTVvgie0lsX0UWvpuj2Gi3hV4LWg30
	 qSF0XiMSAREmPCuyMMOgmxwV4EFkNIEWtvBhflPbxsREVVKglbQI5SmMaNaKPinTGVCtT
	 zlcimhYM3IlfMeUJYp2g0Z7njVXSuIkFLCjiVjgfS66uGRadmcu0bNQBRRFjZD0cztDX2
	 kVBMSmsw+2IFQjxjxQqySuhDKeFbvp3AG7LIIUZLGFeQ7LFbuGDRuSUYBpQnEo8vMgmtY
	 Is2EyE376tIyc6c3KIX/DnPiRql1wQUkgDa1keKqnS7mcaUtCKf3UCn0yDvoQA7zVbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
	b=JpYr/7OmF925jVmKzwMLL9DN2wWAbZrDpvnB9dFObB9CN0fvc2ApczYYSwKo7YwFE2uS
	 l0Oeb/UZCq4ryNSg+H3PDcRa8YaF4KRqoxzzcJBH974n0w87fGiQFeLpDkHoSA+pGvQo+
	 SCjVEm7g3CZ/Vcrl7nh5M+tXB4a1BdvU593cKQ1VWDDUxKOm0fEjcUfo3VgvURPAfuUqK
	 KdD6tQKCyeaPilSRGKTDzxaqKsO/UHEnSRKJdcxOILv8M/GzF5NiGMW60hH6K1rHWmC/n
	 vKGRO2AHoNEii5YqdfKR0GY9aLS0NzB/N/zNYtNXeryaGnK5NFSRBpSOqqYjvOkD1qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=McviBrH5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=al8J3cNd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629B0606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629B0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=McviBrH5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=al8J3cNd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aXRo1801438
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gG+nqVaWG3U
	c8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=; b=McviBrH5ot36gVyf23ER4mCOgxt
	0YYd/02r4EpvN0INqsDq1WaPFGHhYo7c2pODJIJRbRoqaLVfXC8oHOgH0rEow9uZ
	cLbGDg0N2KHIahNMZmJfRYiG4uh7x+Usa+Bw8+dI2Vlf9fu0plaYD1rinISn7kdN
	6rshjFaWax3TSEia06b/HwQqsLzdA2PlTt0cdRnz7aiT5+5eW9l+f+Xx/CyZgFoP
	qNWniOsHaJgCDDUhLsXXXoNlPfTK8MM8yZtB0W3TpeKTsVXwrOI3e9wRnd1vjdf8
	0gvZmepVTpmW30KStzzAThf/x8v+4WvvHv//MbS44UVavDetcJbt18p3maw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3nct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:27 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-86156035839so5564154a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900807; x=1795505607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=al8J3cNdHILSBFYmtYFgD8NWEwkrtjIZz8WYEE2AWEaMRU6QflIJ4Ww26N6j9AzzCS
         jfZ3lwfBQ3WDOlcRgzJOKGsf8gdoSQp7oDpHPs1PMKh9DZx7C9pfeWytfL03PZfCsizo
         dxCjpUIA+ZrTpcvMnOC5XssNefoQF3qbMCKxNJPPvDzi3SyQ/L16K0OZXttktjeRWBIL
         6S9+/nD8MM+e0DcvVzdUkcL1u8kP9Qu5mlnJPpgLPFdaNvsh19FV55BSwK6Iahjz9lmn
         F831GpcEcNPIb/ttTI8/SoXbzK+1bC8q8t0LpKCZih65dCRnYhBx2BATvzsLnlAlMwoA
         9h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900807; x=1795505607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gG+nqVaWG3Uc8lKpMqhODfiAaBo0/gdCFWDts4D4Jyc=;
        b=s8G0X/5B7DYo7borSU0xBCNVqWW2N/cZuxqnorvwsHpl/0wpd0axitO+Aj1xbU2QIO
         X00MvgyuGEPX5vv0b5LdZSJD9HCBH/IoY4JhRxw0bHgUo/qiaG14LEN2ZhdUamaZ+QIL
         h3+oXu9JTdxl4DDpBo5JOH01qvHnHYRuMynUr5OGWm+6KUme2eVqMQv7K06+lYsDdXK7
         2GmQ91ha5PxNB395ShN5F5ifoNlN2djR7dWPHHi4YF7Rf/3a9odFJxskQJBNgqR+thKS
         YhT7tELtilNtiCa0qTcuHarkocorqHnQ1VHWeTQW1NPrn8gKn/QhVOKDz+IFatAXKGJW
         EHMw==
X-Forwarded-Encrypted: i=1; AL+hErGK5UrhLkV3ypoVrpbr2fzMxoGRTmCzjdDcb/eGjEBHVL3hnCZtpij7D7azwwq4xwX4INvEv0AgfzeEj34=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s5KtlXMBJYk6Ywy/97HydfYPE7+O4hOeVjpYsin+PhV/HruH4
	yXw+/ZD4mYSe5+53O/o0BJRt67jVU1wJN91Jm/q3PTCJ/4+erFbKngL6p5grWyP9eASIvtKv2wn
	7WSaGIkjZaFldoa41pd2lyQJjAHRqarw0UoPRAYiDxSOzXugWmKEN7ABghYgZY48kRSs=
X-Gm-Gg: AYBFou33aTnkjH3MPvDJlmYO/Gpfte/zELgC/UsQM2LUE9ct8tWFt5lEChmETU7esZg
	XdXLWM5Zzz2rF7I9OZJwqkBZXjgYGy3g45Wp9QWY++c9j76EK3Cw7KYsOj6OcELachEa50PZPwT
	frV8uwXpPmoo2kWL/bIxsZIIb+UKlYQ7ZD5C+tBzi6nAJbuFc5AHzTHDgH5pjwEeMe1WVqG9Z6Z
	nfb04hCjl9EBhb5SRXvxCet8HSNTNCleWvs5dmEEXX3ggn6ZYjGth7CBDaop22mwWmvprldMJ0Y
	d3sFul/bHPgV6QnrVOAQok1TXFqD5kxgP12023NAc7e1Oiewxl8mFNpd+uhhxpbKj6bLmvxeQWv
	VdkypGch6OV5OTwIDvjMM6JxIz9wYluf5afiQqKn27ZVWrvTd9UJrTcKjTJ/KfxhK9AsjmKktPd
	9RMK26OXEtPFrdw6JFf12QYxxR9kgdtXR01g==
X-Received: by 2002:a05:6830:4388:b0:862:b7d6:16fa with SMTP id 46e09a7af769-862b7d618e7mr6933546a34.30.1794900806757;
        Mon, 16 Nov 2026 23:33:26 -0800 (PST)
X-Received: by 2002:a05:6830:4388:b0:862:b7d6:16fa with SMTP id 46e09a7af769-862b7d618e7mr6933538a34.30.1794900806329;
        Mon, 16 Nov 2026 23:33:26 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:25 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v19 2/8] coresight: Move CoreSight management register defs to linux/coresight.h
Date: Tue, 17 Nov 2026 15:32:59 +0800
Message-Id: <20261117073305.3854951-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-GUID: zvDXz5izygxf-inXh2w6C9tkiZS7T_oX
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc0347 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=37ODTpUNugoFd_DpGuUA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: zvDXz5izygxf-inXh2w6C9tkiZS7T_oX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX5jNGJ2NBp4JR
 Kjb/4xrmGq9Zr2TJa/OU/KzZpzVWF9kRnmjj0p6jPNCCnRxLsx75sDYXTmICq9WlM7Qfg/sqsni
 6R/7VZNOKl6L08LZvZMdlrVJVkgH9ng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXyLheAVoDZBjC
 UNFIpiJ2J5EW9dAKIKSZ1WnerfYP+fu3SELCWWEMdhwvkDztI1p88ncKLWNtYpi6GzZWhwXbwoY
 192pSaPrMxBe6Akp9wF2l17v3cnsX5x/fB7t/uTXbtadPf1vK+QFXZjGvy4W5FYbzWRZ2be7dms
 y8mbdFYV6Ff6Y9uOIEKrE4zs/mTWRYJ1c/MV2QK7nynbkMd6BVt73+vL9fn6v8aqZP45xFHcQ4Y
 xcFMXMi5kwhJ9eMOY5fFqyJSM+0uXGQqOA5xqWC7AzPu98PyzJSHcUsMMklVDeyLccs4qGFYhAX
 4rN3NwJtDZ2oQL/LRROInkh0K/zAyw0zG7VDl4lp1yqHkO/8dR3L8crfMXYvy5O96ZxwUcm3IRM
 aWoYrjQoupW277Nvm1goOpgNpN9VGU9+y2INg+KWuckhJO4doaeyeHETRaiSGt/g6/RS0Dp+qZL
 QI8izwNqh5jLW+Pihvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029

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

