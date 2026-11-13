Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598608;
	b=Pqpl+e6Ix0Rozr3Rgh4enDp61umQDXK7OOAp/ftMr0Lf4DrskWwqPVjrNT+3Jz1E1u+E
	 21f0P7kFnN29GSAOCEzxKwD0rPtncLCStURPmForarML4RsUHbHybn7z0dpS2ULdUbB/G
	 IS/yleMbDW5eFfSfYBRymfFGM91sl0eh+QS5nP9iUU2RZ+LwAll/3nGEFumq/TONJMTr6
	 9lAHBD8azuU6KYvREjfPjgyJPH2SPULVCHKZ563tyNO4bjrReqXjo/svYE3nV0nKHVpvR
	 Gv7xst1wsGr+3VW7nZaM5bk3OaH7LsyhnM7zXVGqFxLkmxeOjMoClVQMo8FT5+dBRZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wsqfOsYBIJEA6780O70LpBwKZw81Yzd+mwHdFq/MSF4=;
	b=lQ+uwtdEMTXSAc8C8obIhkiIPoLMQDmG+xij/5JyBPyQgItTQAnGYvtNvnLIVG5l3ZUo
	 edvpCnZ0Ip7snw+zD84Gz4rQejF5Bj4tWUmzqOaJ2rEQkJsSo7PYtiqusiSqmP2qs/DSO
	 F8+x96PrfCQzGxPlVgW9HvrW1iRkkyteLqxs3+0iyAx8ohObkLnTclJciFvM27Uw1wlVN
	 ylsb8SyjVqwV5m2dCSRYemmOrEXX/4mEw80Ve7aukyZDdtQkrhkAj77UZIFM05z/Eqq7j
	 l3YqPGDGNRv6VzznCWKfgXFyPryVL1b+HdGUTzEJUQFKUu5sPFZXKtFbdYgnqlEZW9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OM6IfTCu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OcE22Mfj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE5606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFE5606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OM6IfTCu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OcE22Mfj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ1ir71085146
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wsqfOsYBIJE
	A6780O70LpBwKZw81Yzd+mwHdFq/MSF4=; b=OM6IfTCu894BN3S+ZhDtqO/cdaa
	usaOsYVW8dlYq6gqlE5Nhvgn+uWB5Go3x94yrWRa9iDUdGKwq/YBvmHeU70bUP3N
	Rl48HUF5txnNinHZMVBhm2VJ38sitjzRgk4c3iu3FSWMcV3XO+QxAq3BquLzwi+6
	JEZw+M7N+qFZWEts/RFpNEuYuwoSwscrf/4EwtIwvzswxtfOqBhgGnN1vwT7AgT2
	9WZ1CPdPLUFA190MiwytwEneFjwh3o8lOr9Hvc/csx3sBV/6QbxdX81PeA9aN2k7
	OlbKcrnsvC5MoH9wJR8UaM7kpfqbhx1MxnxqYCQZXByAO60sHy4remMPVAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaaxvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:36:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-945b0154705so223349485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794598606; x=1795203406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsqfOsYBIJEA6780O70LpBwKZw81Yzd+mwHdFq/MSF4=;
        b=OcE22MfjpjQ2O4cxLA8AORbEbD5r0+du+bwmsoGlPJ5jzpq0QKW7u5bGTtrhrRe0Fj
         3L20UURZtTmqdH/aEzm0OJS990yrrS9QPqlv75MiXHQwYUGj1UktnmlH/r+rRZTZAQyn
         pURorGk6wmHH1w3+XfOPxJFNtqglmTDH8lhZp7U8nfYG78nkeij9ctZgL+Kq+qIccKye
         C60+WduU0SMeI2Av3rTUy+O/5fGme8SAtFCv3sAX991n3icx1u0J02Qqr+zChLvohvO9
         SN4UY2VdB3Os7ej5pAZsrtuQRcLciBmO8CMvl6r7HZVM083sx2DuECAuDbYSOidIK1Eu
         ZIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794598606; x=1795203406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wsqfOsYBIJEA6780O70LpBwKZw81Yzd+mwHdFq/MSF4=;
        b=kegQrF+sFY8IhFGpTKO+VoUFgOuvGHYexMplnKG26/XO4OFLTmXsVkoYVaOkNgoKh/
         xpBDmU6f/qEhTRDNNWFdgs8jpm5VK7U7UCBAH4wt1OJkbhVtcLfD561ZuB8R/sJqW4gA
         7MlVmJlTaEir70n++/Ye1RpI44TOV+bmlPmNmAvSqmUynSakCIU2X+QzSzx//pYWx3vE
         pQM4X0MkDG6RgAr16dA2WKR1EynBi4sOzv4hvDpEYVUDb4Y9ppQrWOQkiLh2jgsb8/DC
         LSTn+EeSJcpIv11rtqyKYMGbrqxDov1ChgHdJLkEMDLca/BC00mjqyTD/I0t4i3EG7FC
         aDZA==
X-Gm-Message-State: APuU4Z8ZGM5Yd2e4uHG3koeuZdwAYPOBAMhSuc5s12+APitQQEWBsOVT
	yJkV60bcZJMdjXEuWNvbPUsjLN15DueLSzJRvMx3/6SwN05Fob1N9sX3IpLP32pZ828jHQ98qim
	vbWMu6qa0E5J5NERsjUv8GleKVqSRbWHXoz24N37EPC7O33Pfz7yoOgZUlann9qP9+v8=
X-Gm-Gg: AYBFou0FiBI3lKV7LDXN2I5xuwx64nUrdrosznJv4IJSK1Tj6uRXYz1eCgiGbxK6Fq0
	01pS0hNQKtW/dNYr1YatctmqN2S49lKctMRgUs+3TSp+jSKDyn+ZJl78YaJMxMppfSBCSTxN0cy
	vZy8AD2D6gSe+l6Xyw7hAPnOQHbV9uQw8dsCzdH4ebwr5f2/C0IDt0euuaiEhAnIofSG1tawJia
	9QBXqyZTevce63hkxSgeASomSX40NuG2+PGgLwtDYVKfIIQB5V9xrMTBjixiV0USn3H8VF3Thm4
	q1vnQ74cwHgtt4CmnhhyFbC9AKkXzszQRGAU66f7erVKoEzgpmlTP7M6U7sKhumjevKtiUBzcUV
	GmZn/sS2ZQB+zL2hGbzKc1isD+Sxhmcs4SqrBNnnJSi4RW2iqK/EnrhI+PgYgVd3A5htZL4X38p
	vUEsucGckfB0Vs3SJ4mw==
X-Received: by 2002:a05:620a:1a02:b0:93f:6c67:152d with SMTP id af79cd13be357-9494bad4a81mr600052585a.38.1794598605836;
        Fri, 13 Nov 2026 11:36:45 -0800 (PST)
X-Received: by 2002:a05:620a:1a02:b0:93f:6c67:152d with SMTP id af79cd13be357-9494bad4a81mr600047485a.38.1794598605216;
        Fri, 13 Nov 2026 11:36:45 -0800 (PST)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da11c5sm6268876f8f.54.2026.11.13.11.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:36:44 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, jarkko@kernel.org, peterhuewe@gmx.de,
        jgg@ziepe.ca, sumit.garg@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: [PATCH v4 1/2] tpm: add OP-TEE transport core and a discrete TPM driver
Date: Fri, 13 Nov 2026 20:36:33 +0100
Message-ID: <20261113193639.4020859-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113193639.4020859-1-jorge.ramirez@oss.qualcomm.com>
References: <20261113193639.4020859-1-jorge.ramirez@oss.qualcomm.com>
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
X-Proofpoint-GUID: faFJiLqo24VR3J4VxqjSjc-y8oqLugO6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3OCBTYWx0ZWRfXyppdenAnfSjH
 JwPD3MdE9Pzpzqu1H/F6qZjn/PwhKs+YR95p81yeH57vqvt2ErmERmk6l+aTgKvWLm4o0tucXuX
 4R4LrQiidx0r8wCfL69HEHT4W9mNtpk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3OCBTYWx0ZWRfX5s0I0sABenxC
 1CQhFgaXdn/oQ43EFRvfqH1EjPjV17GpZ4lmxkve9dnyMQCcYhu+f4HmmUb68i2MyftcWP/pX3l
 drjjG9YJd4vP+u0MUbqOuhq1Zz90BJs7EjVSpVYZRNSBpgAgSXdOPWUolCqvWHQM2U89Jhx9nh2
 kJBKMLb421hPFBOalwVv5nOygR4OCUHzzCkgLTCxL2wYO8CQETt0NkYAkVOC67uIA1xXwNSNLmD
 C5SUbhmrQTyqto60eJBvJL3LYCMTE5Y4iYKeE0hOYtlkWWug0H11MjQ6DrEo3OPlPgKYsreAQlj
 q9CxAI1HzpUcWAzrRi94XAZjoLmNdR8+83j5+T8vAWQ9nmMAFNX+8RmMrwu44VUVV8kH0KuoRPo
 1cnHHsfr8gSXMqikQbQz2kNdw8Avg3zDB0PIEsnzNulvlz9tv/KihXIVvG2oLCMabWKR0yRlis7
 ETfOmNMhQ5e3AlZ5T0Q==
X-Proofpoint-ORIG-GUID: faFJiLqo24VR3J4VxqjSjc-y8oqLugO6
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af766cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=eWAozK0ZnoFYOt3N-tIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130078

Some platforms place a real (discrete) TPM on a bus that only the secure
world can drive. OP-TEE owns that bus, so the normal world cannot reach
the chip directly; it instead exposes a mediator trusted application
that relays TPM2 commands. Add a driver that talks to that application
and presents the chip as a standard TPM2 character device, so the
normal-world TPM stack works unchanged.

This is a separate driver from the firmware-TPM one rather than a reuse
of it. The TEE transport is the same and is shared through a common
core, but the device identity differs: the firmware TPM uses its own
application and a public-login session, whereas a discrete chip needs
its own application and is restricted to kernel access so that user
space and other applications cannot submit raw commands to it. Folding
both into one driver would also break on a platform that has both.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 MAINTAINERS                       |   8 +
 drivers/char/tpm/Kconfig          |  27 ++++
 drivers/char/tpm/Makefile         |   2 +
 drivers/char/tpm/tpm_optee.c      | 253 ++++++++++++++++++++++++++++++
 drivers/char/tpm/tpm_optee.h      |  32 ++++
 drivers/char/tpm/tpm_optee_dtpm.c |  73 +++++++++
 6 files changed, 395 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_optee.c
 create mode 100644 drivers/char/tpm/tpm_optee.h
 create mode 100644 drivers/char/tpm/tpm_optee_dtpm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 056408bc086e..48ca59d53b69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28428,6 +28428,14 @@ F:	include/linux/tpm*.h
 F:	include/uapi/linux/vtpm_proxy.h
 F:	tools/testing/selftests/tpm2/
 
+TPM TEE DRIVER FOR DISCRETE TPM
+R:	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
+L:	linux-integrity@vger.kernel.org
+S:	Supported
+F:	drivers/char/tpm/tpm_optee.c
+F:	drivers/char/tpm/tpm_optee.h
+F:	drivers/char/tpm/tpm_optee_dtpm.c
+
 TPS546D24 DRIVER
 M:	Duke Du <dukedu83@gmail.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 5f672f2c01b0..779154e05204 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -243,6 +243,33 @@ config TCG_FTPM_TEE
 	help
 	  This driver proxies for firmware TPM running in TEE.
 
+config TCG_OPTEE
+	tristate
+	depends on TEE && OPTEE
+	help
+	  Shared transport for TPMs reached through an OP-TEE trusted
+	  application. It is selected by the front-end drivers and is not
+	  meant to be enabled on its own.
+
+config TCG_OPTEE_DTPM
+	tristate "OP-TEE based discrete TPM Interface"
+	depends on TEE && OPTEE
+	select TCG_OPTEE
+	help
+	  This driver proxies for a discrete TPM that is owned by OP-TEE and
+	  reachable only from the secure world (for example an SPI TPM behind
+	  OP-TEE's TPM TIS driver). OP-TEE exposes a mediator pseudo TA and
+	  this driver pipes TPM commands through it, presenting a standard
+	  TPM character device to the normal world.
+
+	  The secure world is the sole owner of the TPM and of the bus it
+	  sits on. That bus/controller must be disabled in the non-secure
+	  device tree: disabling only the in-kernel TPM driver (e.g.
+	  tpm_tis_spi) is not enough, because the normal-world bus controller
+	  would still drive the engine in parallel with OP-TEE and corrupt
+	  its transfers. With the bus disabled, the TPM is reached only
+	  through this driver.
+
 config TCG_SVSM
 	tristate "SNP SVSM vTPM interface"
 	depends on AMD_MEM_ENCRYPT
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 5b5cdc0d32e4..431d1351c2e3 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -45,5 +45,7 @@ obj-$(CONFIG_TCG_CRB) += tpm_crb.o
 obj-$(CONFIG_TCG_ARM_CRB_FFA) += tpm_crb_ffa.o
 obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
 obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
+obj-$(CONFIG_TCG_OPTEE) += tpm_optee.o
+obj-$(CONFIG_TCG_OPTEE_DTPM) += tpm_optee_dtpm.o
 obj-$(CONFIG_TCG_SVSM) += tpm_svsm.o
 obj-$(CONFIG_TCG_LOONGSON) += tpm_loongson.o
diff --git a/drivers/char/tpm/tpm_optee.c b/drivers/char/tpm/tpm_optee.c
new file mode 100644
index 000000000000..3c17de1306a1
--- /dev/null
+++ b/drivers/char/tpm/tpm_optee.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shared transport for TPMs reached through an OP-TEE trusted application:
+ * open the context and session, relay raw TPM2 commands over TEE shared
+ * memory, and register the result as a standard tpm_chip. A front-end driver
+ * supplies the per-device identity (TA UUID, client login, submit function
+ * ID) and binds the TA.
+ */
+
+#include <linux/module.h>
+#include <linux/tee_drv.h>
+#include <linux/tpm.h>
+#include <linux/uuid.h>
+
+#include "tpm.h"
+#include "tpm_optee.h"
+
+#define TPM_OPTEE_MAX_COMMAND_SIZE	4096
+#define TPM_OPTEE_MAX_RESPONSE_SIZE	4096
+
+struct tpm_optee_private {
+	struct tpm_chip *chip;
+	struct tee_context *ctx;
+	u32 session;
+	struct tee_shm *shm;
+	const struct tpm_optee_config *cfg;
+};
+
+/* Validate the response header the TA wrote back, return its length or -EIO */
+static int tpm_optee_resp_len(struct tpm_chip *chip, const u8 *resp,
+			      size_t bufsiz)
+{
+	size_t resp_len = be32_to_cpu(((struct tpm_header *)resp)->length);
+
+	if (resp_len < TPM_HEADER_SIZE || resp_len > TPM_OPTEE_MAX_RESPONSE_SIZE ||
+	    resp_len > bufsiz) {
+		dev_err(&chip->dev, "bad response length %zu (buffer %zu)\n",
+			resp_len, bufsiz);
+		return -EIO;
+	}
+
+	return resp_len;
+}
+
+/**
+ * tpm_optee_op_send() - relay a TPM command through TEE shared memory.
+ * @chip:	the tpm_chip description
+ * @buf:	command on entry, response on return
+ * @bufsiz:	size of @buf
+ * @cmd_len:	number of command bytes to send
+ *
+ * Return: number of response bytes on success, -errno on failure.
+ */
+static int tpm_optee_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
+			     size_t cmd_len)
+{
+	struct tpm_optee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
+	struct tee_shm *shm = pvt_data->shm;
+	struct tee_param command_params[4] = { };
+	struct tee_ioctl_invoke_arg transceive_args = {
+		.func = pvt_data->cfg->cmd_id,
+		.session = pvt_data->session,
+		.num_params = 4,
+	};
+	u8 *temp_buf;
+	int rc;
+
+	if (cmd_len > TPM_OPTEE_MAX_COMMAND_SIZE || cmd_len > bufsiz) {
+		dev_err(&chip->dev, "command length %zu (buffer %zu)\n",
+			cmd_len, bufsiz);
+		return -EIO;
+	}
+
+	/* memref[0]: command in, memref[1]: response in/out */
+	command_params[0] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
+		.u.memref = {
+			.shm = shm,
+			.size = cmd_len,
+			.shm_offs = 0,
+		},
+	};
+
+	temp_buf = tee_shm_get_va(shm, 0);
+	if (IS_ERR(temp_buf)) {
+		dev_err(&chip->dev, "tee_shm_get_va failed for transmit\n");
+		return PTR_ERR(temp_buf);
+	}
+	memset(temp_buf, 0, TPM_OPTEE_MAX_COMMAND_SIZE + TPM_OPTEE_MAX_RESPONSE_SIZE);
+	memcpy(temp_buf, buf, cmd_len);
+
+	command_params[1] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
+		.u.memref = {
+			.shm = shm,
+			.size = TPM_OPTEE_MAX_RESPONSE_SIZE,
+			.shm_offs = TPM_OPTEE_MAX_COMMAND_SIZE,
+		},
+	};
+
+	rc = tee_client_invoke_func(pvt_data->ctx, &transceive_args,
+				    command_params);
+	if (rc < 0 || transceive_args.ret != 0) {
+		dev_err(&chip->dev, "SUBMIT_COMMAND invoke error: 0x%x\n",
+			transceive_args.ret);
+		return (rc < 0) ? rc : -EIO;
+	}
+
+	temp_buf = tee_shm_get_va(shm, command_params[1].u.memref.shm_offs);
+	if (IS_ERR(temp_buf)) {
+		dev_err(&chip->dev, "tee_shm_get_va failed for receive\n");
+		return PTR_ERR(temp_buf);
+	}
+
+	rc = tpm_optee_resp_len(chip, temp_buf, bufsiz);
+	if (rc < 0)
+		return rc;
+
+	memcpy(buf, temp_buf, rc);
+
+	return rc;
+}
+
+static const struct tpm_class_ops tpm_optee_ops = {
+	.flags = TPM_OPS_AUTO_STARTUP,
+	.send = tpm_optee_op_send,
+};
+
+static int tpm_optee_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	/* Only GP-compliant OP-TEE is supported */
+	if (ver->impl_id == TEE_IMPL_ID_OPTEE && (ver->gen_caps & TEE_GEN_CAP_GP))
+		return 1;
+
+	return 0;
+}
+
+static int tpm_optee_open_session(struct device *dev, struct tee_context *ctx,
+				  const struct tpm_optee_config *cfg,
+				  u32 *session)
+{
+	struct tee_ioctl_open_session_arg sess_arg = {
+		.clnt_login = cfg->login,
+	};
+	int rc;
+
+	export_uuid(sess_arg.uuid, &cfg->ta_uuid);
+
+	rc = tee_client_open_session(ctx, &sess_arg, NULL);
+	if (rc < 0 || sess_arg.ret != 0) {
+		dev_err(dev, "tee_client_open_session failed, err=0x%x\n",
+			sess_arg.ret);
+		return -EINVAL;
+	}
+
+	*session = sess_arg.session;
+
+	return 0;
+}
+
+int tpm_optee_probe(struct device *dev, const struct tpm_optee_config *cfg)
+{
+	struct tpm_optee_private *pvt_data;
+	struct tpm_chip *chip;
+	int rc;
+
+	pvt_data = devm_kzalloc_obj(dev, struct tpm_optee_private);
+	if (!pvt_data)
+		return -ENOMEM;
+
+	pvt_data->cfg = cfg;
+	dev_set_drvdata(dev, pvt_data);
+
+	pvt_data->ctx = tee_client_open_context(NULL, tpm_optee_match, NULL,
+						NULL);
+	if (IS_ERR(pvt_data->ctx)) {
+		if (PTR_ERR(pvt_data->ctx) == -ENOENT)
+			return -EPROBE_DEFER;
+		dev_err(dev, "tee_client_open_context failed\n");
+		return PTR_ERR(pvt_data->ctx);
+	}
+
+	rc = tpm_optee_open_session(dev, pvt_data->ctx, cfg, &pvt_data->session);
+	if (rc)
+		goto out_tee_session;
+
+	pvt_data->shm = tee_shm_alloc_kernel_buf(pvt_data->ctx,
+						 TPM_OPTEE_MAX_COMMAND_SIZE +
+						 TPM_OPTEE_MAX_RESPONSE_SIZE);
+	if (IS_ERR(pvt_data->shm)) {
+		dev_err(dev, "tee_shm_alloc_kernel_buf failed\n");
+		rc = -ENOMEM;
+		goto out_shm_alloc;
+	}
+
+	chip = tpm_chip_alloc(dev, &tpm_optee_ops);
+	if (IS_ERR(chip)) {
+		dev_err(dev, "tpm_chip_alloc failed\n");
+		rc = PTR_ERR(chip);
+		goto out_chip_alloc;
+	}
+
+	pvt_data->chip = chip;
+	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
+
+	rc = tpm_chip_register(pvt_data->chip);
+	if (rc) {
+		dev_err(dev, "tpm_chip_register failed with rc=%d\n", rc);
+		goto out_chip;
+	}
+
+	return 0;
+
+out_chip:
+	put_device(&pvt_data->chip->dev);
+out_chip_alloc:
+	tee_shm_free(pvt_data->shm);
+out_shm_alloc:
+	tee_client_close_session(pvt_data->ctx, pvt_data->session);
+out_tee_session:
+	tee_client_close_context(pvt_data->ctx);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(tpm_optee_probe);
+
+void tpm_optee_remove(struct device *dev)
+{
+	struct tpm_optee_private *pvt_data = dev_get_drvdata(dev);
+
+	tpm_chip_unregister(pvt_data->chip);
+	put_device(&pvt_data->chip->dev);
+	tee_shm_free(pvt_data->shm);
+	tee_client_close_session(pvt_data->ctx, pvt_data->session);
+	tee_client_close_context(pvt_data->ctx);
+}
+EXPORT_SYMBOL_GPL(tpm_optee_remove);
+
+/* Release the TEE resources on shutdown, leaving the chip registered. */
+void tpm_optee_shutdown(struct device *dev)
+{
+	struct tpm_optee_private *pvt_data = dev_get_drvdata(dev);
+
+	tee_shm_free(pvt_data->shm);
+	tee_client_close_session(pvt_data->ctx, pvt_data->session);
+	tee_client_close_context(pvt_data->ctx);
+}
+EXPORT_SYMBOL_GPL(tpm_optee_shutdown);
+
+MODULE_DESCRIPTION("OP-TEE TPM transport core");
+MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_optee.h b/drivers/char/tpm/tpm_optee.h
new file mode 100644
index 000000000000..a3a2ea2a951d
--- /dev/null
+++ b/drivers/char/tpm/tpm_optee.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shared transport for TPMs reached through an OP-TEE trusted application.
+ */
+
+#ifndef __TPM_OPTEE_H__
+#define __TPM_OPTEE_H__
+
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+struct device;
+
+/**
+ * struct tpm_optee_config - identity of a TPM reached through an OP-TEE TA
+ * @ta_uuid:	UUID of the trusted application to bind
+ * @login:	TEE_IOCTL_LOGIN_* client login used to open the session
+ * @cmd_id:	TA function ID that submits a TPM command
+ */
+struct tpm_optee_config {
+	uuid_t	ta_uuid;
+	u32	login;
+	u32	cmd_id;
+};
+
+int tpm_optee_probe(struct device *dev, const struct tpm_optee_config *cfg);
+void tpm_optee_remove(struct device *dev);
+void tpm_optee_shutdown(struct device *dev);
+
+#endif /* __TPM_OPTEE_H__ */
diff --git a/drivers/char/tpm/tpm_optee_dtpm.c b/drivers/char/tpm/tpm_optee_dtpm.c
new file mode 100644
index 000000000000..08385e72f7e5
--- /dev/null
+++ b/drivers/char/tpm/tpm_optee_dtpm.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Front-end for a discrete TPM owned by OP-TEE and exposed to the normal
+ * world through a mediator pseudo TA. The chip sits on a bus only the
+ * secure world can reach (e.g. an SPI TPM behind OP-TEE's TPM TIS driver);
+ * this driver supplies the TA identity and binds it, the shared transport in
+ * tpm_optee does the rest.
+ */
+
+#include <linux/module.h>
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+
+#include "tpm_optee.h"
+
+#define TPM_OPTEE_DTPM_SUBMIT_COMMAND	0
+
+static const struct tpm_optee_config tpm_optee_dtpm_config = {
+	.ta_uuid = UUID_INIT(0x50568cd9, 0x370a, 0x46b8,
+			     0x9f, 0x2c, 0x6f, 0xd9, 0x06, 0x64, 0xd2, 0xee),
+	.login	 = TEE_IOCTL_LOGIN_REE_KERNEL,
+	.cmd_id	 = TPM_OPTEE_DTPM_SUBMIT_COMMAND,
+};
+
+static int tpm_optee_dtpm_probe(struct tee_client_device *tee_device)
+{
+	return tpm_optee_probe(&tee_device->dev, &tpm_optee_dtpm_config);
+}
+
+static void tpm_optee_dtpm_remove(struct tee_client_device *tee_device)
+{
+	tpm_optee_remove(&tee_device->dev);
+}
+
+static void tpm_optee_dtpm_shutdown(struct tee_client_device *tee_device)
+{
+	tpm_optee_shutdown(&tee_device->dev);
+}
+
+static const struct tee_client_device_id tpm_optee_dtpm_id_table[] = {
+	{UUID_INIT(0x50568cd9, 0x370a, 0x46b8,
+		   0x9f, 0x2c, 0x6f, 0xd9, 0x06, 0x64, 0xd2, 0xee)},
+	{}
+};
+MODULE_DEVICE_TABLE(tee, tpm_optee_dtpm_id_table);
+
+static struct tee_client_driver tpm_optee_dtpm_driver = {
+	.id_table	= tpm_optee_dtpm_id_table,
+	.probe		= tpm_optee_dtpm_probe,
+	.remove		= tpm_optee_dtpm_remove,
+	.shutdown	= tpm_optee_dtpm_shutdown,
+	.driver		= {
+		.name		= "optee-dtpm",
+	},
+};
+
+static int __init tpm_optee_dtpm_init(void)
+{
+	return tee_client_driver_register(&tpm_optee_dtpm_driver);
+}
+
+static void __exit tpm_optee_dtpm_exit(void)
+{
+	tee_client_driver_unregister(&tpm_optee_dtpm_driver);
+}
+
+module_init(tpm_optee_dtpm_init);
+module_exit(tpm_optee_dtpm_exit);
+
+MODULE_DESCRIPTION("OP-TEE driver for a discrete TPM");
+MODULE_LICENSE("GPL");
-- 
2.55.0

