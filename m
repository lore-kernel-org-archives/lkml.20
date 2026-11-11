Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434395;
	b=3l/NHXoB8KFFcLuh47XcdQGI1PwdE0B9BywG0CWrj1D0tzWgwvNOUdKoCKKhz9xWByl4
	 jtE5cpBphtUPH1srurL9SVIdSU6fNzC5juEJhsy7SV9YjuCEgahLnQ+k3DqQA9G6eSyYG
	 cB50fREojZXr46hQlOa/wbTig+p+wwoqBuTMmFcxQOoIpolCI64V4GaKO9kYvz6FfDHu3
	 50OjzC69a7t0nfcLqZviyXA+inXNU+cW9fjselAeEx5U2iOQel1R7MscvmOkjh8IjTekU
	 RV7mSIflxAnUBq0ELEDZkBhVANb43soj4OS4nFRTTx6eChW+XgqDGF2KQyJRZwht8Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XrENvvNKIizNg3E0NGL/9taygxskV+EhGDLS9DL8Qf8=;
	b=REncDbJ2THL4NAEmhno9KfifeTNnvG8vVEFjPCE1xwWgBWXCSH2gnAtsgX2Kffckoa/s
	 oh84+8XcCEBq1lFKkZwPmIqQ8NLfDkMZ7h7D+VJ2CX854srCjiKKY361yG7zUnONsFFAu
	 e9bMp1HZFPPGo1Ix34ZZYH7woPNuiW9NyLKO0otAH8cN/8sTSD6i9AbceL+E7k73vvUBr
	 0UWBjUiw3Geu1Zn7hGdE6mU2A08pv0dFdVupKlpGv0roRhKQZf4SeBc7QvGEcgsGmJwwg
	 eSXsmm/1cd7fpHuCHUuK95dCgwGIJszfUWX2QBc23NRwWLj4EXZb5rG/W8AFHQjSWOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWriipgA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jUb4GDoK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FF0606A8A5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FF0606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWriipgA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jUb4GDoK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABJRbsV3186556
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XrENvvNKIiz
	Ng3E0NGL/9taygxskV+EhGDLS9DL8Qf8=; b=FWriipgAk4WiYoaHCvZ9S7gVr3U
	d2/PMWmRnn4zzjWeyQ+xf/TMw9aI7tgmpRABmYHQOvwbzHNwRwys3f8ssc2usvim
	VW+mQT77U93bJ09T9t6WA2yM57K5pZOiL7DG6h67TrJn1ljm+HCfHYGR9iVDqAc/
	X4+ssLfTmSo+rfNaa7HHbMNM/h2bDaKQeQh5gWKIQcslFLnwgUD+qeMfVqRFad7H
	Zjije7lbIH1UMSrW+rrCcQOAO3Bzh0zT+6slUPvyrNbzC7YUEQvEZlY24u/gQAi8
	LWNeaJ2BIkifliTrfRO8ejLiEqpWllCCawFFhG4XGSkVCWEXvnnsP4Gxb8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdm3t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:59:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso4380385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794434393; x=1795039193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrENvvNKIizNg3E0NGL/9taygxskV+EhGDLS9DL8Qf8=;
        b=jUb4GDoKuGhaDZSa4pOtwTYFNMsyYIH24Y3mKtVA1VUIRnb9TGUNxEeeb9UEyMsOV9
         gu/r7WevDWOaQSz4ShH0oXvHCUiBUlGYMpZUC81B7Kn681xPVYKqPfOQtOoT20axx78I
         9BDfW4KBewDeLjLADe798Oq94wDvzb+xUGpYw+P8yo3sSfM9IxGqzCwU+eWGofY5pwst
         nO9sDSgoQOp6WTYTVj+MJXdHpcAsfKTV36lHjrvAhHjOn2PyCgSQo3vRf/kiC3DSDPSs
         edj2Mg+B3P3VibPkkqxgJA7bt7Um4f+oKiyvZ0PAFXDNyfzOBS/FXjGnTaaQyBsHTH7z
         0wPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434393; x=1795039193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XrENvvNKIizNg3E0NGL/9taygxskV+EhGDLS9DL8Qf8=;
        b=uk308BDrBBBznjrPvfUziWWn6sBqaY1ZJzlRP7u9yoJ+7KDos06AlGELNqttg8L5Sf
         Nz9VOToRSxj50OUI/7rwz0RAZe5PjkTO1CAZkdcZBgNYSNvvfBz+YOF8exJtlPN3TNdW
         G7nWiijByVoQflN8s/ouyVqX6767k68CQzjvnv65wj1ut8fGieGIyHrHhFyAIujxyezR
         1mDw19v1ePjeeiRfQhd18lR3I3GP8WGvFdiGso+cIgOYyYl9aAc5I3HALEGBTOx5m5DO
         XXsN9CLANjfQ1lZ9f8WhEldGuPRHI8bEleBcmgQ0u5zm84lUZmaSwZGD393Q+ijsJpdl
         wiFg==
X-Gm-Message-State: APuU4Z9POTEWA958BLpRbe1C9vimMORYncM/QFofGwYyX1S1JiMcS1DW
	kJaIbayQStpS/XSdkBvZQb2R9XikPFcG3uTLkK8Z7FEEEEeq0LzBpeGyfb7LqbLJZwpgJmcP5+W
	+EX9i9ZKigucmVQUL/JHTakuvCo3BmPNCuolFetZfXHNYCTVPeUrG5zsbeyWG5+G0hBg=
X-Gm-Gg: AYBFou1SoHSoDFrSNkMZfht5AeejB/eXxMYp6ytPBd0CiLKgltQdMx8O39t0pkxwsuJ
	3ZsOZBVv6KcsqSdI8LNA1idhwlz4els5JZ4+exaAXA5E26LNXcCsHXCoeeHi9Z/lGldZqSl/+Wl
	HR5lNrgwzmMnKN1oqxZ707Wsv5KynQ5O5wE4mPrila+rG94FQfz1RWoVaCEBfOteaEjkHCn8SrR
	1QvXK6YTZM+ckND0dqUh7rJU3HSVGIaURkZBCYE7z2+62hzdLjD7worTNDY2+J88okD6/bcVAZq
	dX5I5tYy1Dz4RUedmKxR/tSxtfKXmuK7MyweJ5CbCzHEBK6s01V8OoelPqIzp7YxfKOZ0vmETUO
	FC6iqiPo0vpa7JxV7my9VyiDpZtBqXwNIObAWmKbI8ulqUeKUruEqz1BcaaDLgI0E66ZLL7Sx4G
	XbWHmPa0ExztCZWHH/0w==
X-Received: by 2002:a05:620a:1a09:b0:93e:746e:235c with SMTP id af79cd13be357-947afd680f6mr633741785a.15.1794434392584;
        Wed, 11 Nov 2026 13:59:52 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93e:746e:235c with SMTP id af79cd13be357-947afd680f6mr633736485a.15.1794434391826;
        Wed, 11 Nov 2026 13:59:51 -0800 (PST)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm13244740f8f.0.2026.11.11.13.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:59:51 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, peterhuewe@gmx.de, jarkko@kernel.org,
        jgg@ziepe.ca, sumit.garg@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: [PATCH v3 2/2] tpm_ftpm_tee: use the tpm_optee transport core
Date: Wed, 11 Nov 2026 22:59:35 +0100
Message-ID: <20261111215940.3503287-3-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111215940.3503287-1-jorge.ramirez@oss.qualcomm.com>
References: <20261111215940.3503287-1-jorge.ramirez@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4e559 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=p5XVOwWNAAAA:20 a=EUspDBNiAAAA:8 a=DtFL08XvnnzGsi3Z16wA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: BTeLOWFO7he88vvpmVQi-xQzTOZLntpx
X-Proofpoint-GUID: BTeLOWFO7he88vvpmVQi-xQzTOZLntpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA4NyBTYWx0ZWRfX58Aodus7vNlO
 fC3qTqrcx7YKPT0wEset6D1uRsujNgHxvFKLNw6q//cSl2urxtsQPr47tsX5RBsRGNuv46TEcfV
 D6Mffw9dzwfe2NfCQLyXiIOKgX/1svR2r42u0L/bkaU+ZvTGjF/7eZgrAm6RrULZC9mia+1icwS
 iLVGq7NxO7TMU5D0qLr4pgjE0ekwZiALiu2ZSzKzwM9Tas+Wa6CKB0emdRLhsIi8Tefy5ekh+jb
 lyLWkpdigFIBgTTUIuAdIL/YNlpTXfvrNmh0GrfMn9pZLa0p0IR0Oek4iiCXZG0F/5pAQNfGQIs
 qZq17lBvjbuoujVsa9iD1AwSNhxcwBxLWuHzL4wmYOohX57PyeItH5XDYBeUabTwpcgJYJCNuRt
 hhx8qM72cJlt6OnPvCK9v3a6rAzDGVjAgHoPlMZ/1BmE7b2yjaNp2FQGVCJ1iv/LTX40qDzTY3X
 pkTlyhia5vYNVk0EQZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA4NyBTYWx0ZWRfX4XRg+eNnMmVM
 L+m5fHQvbkOURQFQgjCYBaKmkxIDN+RnyNlPB7GKilD1nlQquw36Dig78ngJUHGknkmUHzNboIE
 diYejUzZc4Cn6vg7mS9hEX9bhwrixCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110087

The firmware-TPM driver and the new discrete-TPM driver share the same
OP-TEE transport, now factored into a common core. Move the firmware-TPM
driver onto it so the transport is not duplicated. The driver keeps its
name, its platform/OF binding and its shutdown behaviour; only the
transport is shared.

Two functional changes come from sharing the core: a command longer than
the caller's buffer is now rejected (it was previously only checked
against the application's maximum), and a failed command submission
returns -EIO instead of the raw error code from the secure world.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/char/tpm/Kconfig        |   1 +
 drivers/char/tpm/tpm_ftpm_tee.c | 295 ++------------------------------
 drivers/char/tpm/tpm_ftpm_tee.h |  35 ----
 3 files changed, 19 insertions(+), 312 deletions(-)
 delete mode 100644 drivers/char/tpm/tpm_ftpm_tee.h

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 779154e05204..35aff3003a32 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -240,6 +240,7 @@ config TCG_VTPM_PROXY
 config TCG_FTPM_TEE
 	tristate "TEE based fTPM Interface"
 	depends on TEE && OPTEE
+	select TCG_OPTEE
 	help
 	  This driver proxies for firmware TPM running in TEE.
 
diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
index b82490439633..1665e9b584a7 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -7,17 +7,22 @@
  *
  * A reference implementation is available here:
  * https://github.com/microsoft/ms-tpm-20-ref/tree/master/Samples/ARM32-FirmwareTPM/optee_ta/fTPM
+ *
+ * The TEE transport is shared with other OP-TEE TPM front-ends and lives in
+ * tpm_optee; this file only carries the fTPM identity and its platform/OF
+ * binding.
  */
 
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/tee_drv.h>
-#include <linux/tpm.h>
 #include <linux/uuid.h>
 
-#include "tpm.h"
-#include "tpm_ftpm_tee.h"
+#include "tpm_optee.h"
+
+/* The TAF ID implemented in the fTPM TA */
+#define FTPM_OPTEE_TA_SUBMIT_COMMAND	0
 
 /*
  * TA_FTPM_UUID: BC50D971-D4C9-42C4-82CB-343FB7F37896
@@ -26,299 +31,36 @@
  * Defined here in the reference implementation:
  * https://github.com/microsoft/ms-tpm-20-ref/blob/master/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/include/fTPM.h#L42
  */
-static const uuid_t ftpm_ta_uuid =
-	UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
-		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
-
-/**
- * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
- * and retrieve the response.
- * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
- * @buf:	the buffer to send and to store the response.
- * @bufsiz:	the size of the buffer.
- * @cmd_len:	the number of bytes to send.
- *
- * Return:
- *	In case of success, returns the number of bytes received.
- *	On failure, -errno
- */
-static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
-				size_t cmd_len)
-{
-	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
-	size_t resp_len;
-	int rc;
-	u8 *temp_buf;
-	struct tpm_header *resp_header;
-	struct tee_ioctl_invoke_arg transceive_args;
-	struct tee_param command_params[4];
-	struct tee_shm *shm = pvt_data->shm;
-
-	if (cmd_len > MAX_COMMAND_SIZE) {
-		dev_err(&chip->dev,
-			"%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
-			__func__, cmd_len);
-		return -EIO;
-	}
-
-	memset(&transceive_args, 0, sizeof(transceive_args));
-	memset(command_params, 0, sizeof(command_params));
-
-	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
-	transceive_args = (struct tee_ioctl_invoke_arg) {
-		.func = FTPM_OPTEE_TA_SUBMIT_COMMAND,
-		.session = pvt_data->session,
-		.num_params = 4,
-	};
-
-	/* Fill FTPM_OPTEE_TA_SUBMIT_COMMAND parameters */
-	command_params[0] = (struct tee_param) {
-		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
-		.u.memref = {
-			.shm = shm,
-			.size = cmd_len,
-			.shm_offs = 0,
-		},
-	};
-
-	temp_buf = tee_shm_get_va(shm, 0);
-	if (IS_ERR(temp_buf)) {
-		dev_err(&chip->dev, "%s: tee_shm_get_va failed for transmit\n",
-			__func__);
-		return PTR_ERR(temp_buf);
-	}
-	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
-	memcpy(temp_buf, buf, cmd_len);
-
-	command_params[1] = (struct tee_param) {
-		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
-		.u.memref = {
-			.shm = shm,
-			.size = MAX_RESPONSE_SIZE,
-			.shm_offs = MAX_COMMAND_SIZE,
-		},
-	};
-
-	rc = tee_client_invoke_func(pvt_data->ctx, &transceive_args,
-				    command_params);
-	if ((rc < 0) || (transceive_args.ret != 0)) {
-		dev_err(&chip->dev, "%s: SUBMIT_COMMAND invoke error: 0x%x\n",
-			__func__, transceive_args.ret);
-		return (rc < 0) ? rc : transceive_args.ret;
-	}
-
-	temp_buf = tee_shm_get_va(shm, command_params[1].u.memref.shm_offs);
-	if (IS_ERR(temp_buf)) {
-		dev_err(&chip->dev, "%s: tee_shm_get_va failed for receive\n",
-			__func__);
-		return PTR_ERR(temp_buf);
-	}
-
-	resp_header = (struct tpm_header *)temp_buf;
-	resp_len = be32_to_cpu(resp_header->length);
-
-	/* sanity check resp_len */
-	if (resp_len < TPM_HEADER_SIZE) {
-		dev_err(&chip->dev, "%s: tpm response header too small\n",
-			__func__);
-		return -EIO;
-	}
-	if (resp_len > MAX_RESPONSE_SIZE) {
-		dev_err(&chip->dev,
-			"%s: resp_len=%zd exceeds MAX_RESPONSE_SIZE\n",
-			__func__, resp_len);
-		return -EIO;
-	}
-	if (resp_len > bufsiz) {
-		dev_err(&chip->dev,
-			"%s: resp_len=%zd exceeds bufsiz=%zd\n",
-			__func__, resp_len, bufsiz);
-		return -EIO;
-	}
-
-	memcpy(buf, temp_buf, resp_len);
-
-	return resp_len;
-}
-
-static const struct tpm_class_ops ftpm_tee_tpm_ops = {
-	.flags = TPM_OPS_AUTO_STARTUP,
-	.send = ftpm_tee_tpm_op_send,
+static const struct tpm_optee_config ftpm_tee_config = {
+	.ta_uuid = UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
+			     0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96),
+	.login	 = TEE_IOCTL_LOGIN_PUBLIC,
+	.cmd_id	 = FTPM_OPTEE_TA_SUBMIT_COMMAND,
 };
 
-/*
- * Check whether this driver supports the fTPM TA in the TEE instance
- * represented by the params (ver/data) to this function.
- */
-static int ftpm_tee_match(struct tee_ioctl_version_data *ver, const void *data)
-{
-	/*
-	 * Currently this driver only support GP Complaint OPTEE based fTPM TA
-	 */
-	if ((ver->impl_id == TEE_IMPL_ID_OPTEE) &&
-		(ver->gen_caps & TEE_GEN_CAP_GP))
-		return 1;
-	else
-		return 0;
-}
-
-/**
- * ftpm_tee_probe_generic() - initialize the fTPM
- * @dev: the device description.
- *
- * Return:
- *	On success, 0. On failure, -errno.
- */
-static int ftpm_tee_probe_generic(struct device *dev)
-{
-	int rc;
-	struct tpm_chip *chip;
-	struct ftpm_tee_private *pvt_data = NULL;
-	struct tee_ioctl_open_session_arg sess_arg;
-
-	pvt_data = devm_kzalloc(dev, sizeof(struct ftpm_tee_private),
-				GFP_KERNEL);
-	if (!pvt_data)
-		return -ENOMEM;
-
-	dev_set_drvdata(dev, pvt_data);
-
-	/* Open context with TEE driver */
-	pvt_data->ctx = tee_client_open_context(NULL, ftpm_tee_match, NULL,
-						NULL);
-	if (IS_ERR(pvt_data->ctx)) {
-		if (PTR_ERR(pvt_data->ctx) == -ENOENT)
-			return -EPROBE_DEFER;
-		dev_err(dev, "%s: tee_client_open_context failed\n", __func__);
-		return PTR_ERR(pvt_data->ctx);
-	}
-
-	/* Open a session with fTPM TA */
-	memset(&sess_arg, 0, sizeof(sess_arg));
-	export_uuid(sess_arg.uuid, &ftpm_ta_uuid);
-	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
-	sess_arg.num_params = 0;
-
-	rc = tee_client_open_session(pvt_data->ctx, &sess_arg, NULL);
-	if ((rc < 0) || (sess_arg.ret != 0)) {
-		dev_err(dev, "%s: tee_client_open_session failed, err=%x\n",
-			__func__, sess_arg.ret);
-		rc = -EINVAL;
-		goto out_tee_session;
-	}
-	pvt_data->session = sess_arg.session;
-
-	/* Allocate dynamic shared memory with fTPM TA */
-	pvt_data->shm = tee_shm_alloc_kernel_buf(pvt_data->ctx,
-						 MAX_COMMAND_SIZE +
-						 MAX_RESPONSE_SIZE);
-	if (IS_ERR(pvt_data->shm)) {
-		dev_err(dev, "%s: tee_shm_alloc_kernel_buf failed\n", __func__);
-		rc = -ENOMEM;
-		goto out_shm_alloc;
-	}
-
-	/* Allocate new struct tpm_chip instance */
-	chip = tpm_chip_alloc(dev, &ftpm_tee_tpm_ops);
-	if (IS_ERR(chip)) {
-		dev_err(dev, "%s: tpm_chip_alloc failed\n", __func__);
-		rc = PTR_ERR(chip);
-		goto out_chip_alloc;
-	}
-
-	pvt_data->chip = chip;
-	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
-
-	/* Create a character device for the fTPM */
-	rc = tpm_chip_register(pvt_data->chip);
-	if (rc) {
-		dev_err(dev, "%s: tpm_chip_register failed with rc=%d\n",
-			__func__, rc);
-		goto out_chip;
-	}
-
-	return 0;
-
-out_chip:
-	put_device(&pvt_data->chip->dev);
-out_chip_alloc:
-	tee_shm_free(pvt_data->shm);
-out_shm_alloc:
-	tee_client_close_session(pvt_data->ctx, pvt_data->session);
-out_tee_session:
-	tee_client_close_context(pvt_data->ctx);
-
-	return rc;
-}
-
 static int ftpm_tee_probe(struct tee_client_device *tcdev)
 {
-	struct device *dev = &tcdev->dev;
-
-	return ftpm_tee_probe_generic(dev);
+	return tpm_optee_probe(&tcdev->dev, &ftpm_tee_config);
 }
 
 static int ftpm_plat_tee_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-
-	return ftpm_tee_probe_generic(dev);
-}
-
-/**
- * ftpm_tee_remove_generic() - remove the TPM device
- * @dev: the device description.
- *
- * Return:
- *	0 always.
- */
-static void ftpm_tee_remove_generic(struct device *dev)
-{
-	struct ftpm_tee_private *pvt_data = dev_get_drvdata(dev);
-
-	/* Release the chip */
-	tpm_chip_unregister(pvt_data->chip);
-
-	/* frees chip */
-	put_device(&pvt_data->chip->dev);
-
-	/* Free the shared memory pool */
-	tee_shm_free(pvt_data->shm);
-
-	/* close the existing session with fTPM TA*/
-	tee_client_close_session(pvt_data->ctx, pvt_data->session);
-
-	/* close the context with TEE driver */
-	tee_client_close_context(pvt_data->ctx);
-
-	/* memory allocated with devm_kzalloc() is freed automatically */
+	return tpm_optee_probe(&pdev->dev, &ftpm_tee_config);
 }
 
 static void ftpm_tee_remove(struct tee_client_device *tcdev)
 {
-	struct device *dev = &tcdev->dev;
-
-	ftpm_tee_remove_generic(dev);
+	tpm_optee_remove(&tcdev->dev);
 }
 
 static void ftpm_plat_tee_remove(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-
-	ftpm_tee_remove_generic(dev);
+	tpm_optee_remove(&pdev->dev);
 }
 
-/**
- * ftpm_plat_tee_shutdown() - shutdown the TPM device
- * @pdev: the platform_device description.
- */
 static void ftpm_plat_tee_shutdown(struct platform_device *pdev)
 {
-	struct ftpm_tee_private *pvt_data = dev_get_drvdata(&pdev->dev);
-
-	tee_shm_free(pvt_data->shm);
-	tee_client_close_session(pvt_data->ctx, pvt_data->session);
-	tee_client_close_context(pvt_data->ctx);
+	tpm_optee_shutdown(&pdev->dev);
 }
 
 static const struct of_device_id of_ftpm_tee_ids[] = {
@@ -343,7 +85,6 @@ static const struct tee_client_device_id optee_ftpm_id_table[] = {
 		   0x82, 0xcb, 0x34, 0x3f, 0xb7, 0xf3, 0x78, 0x96)},
 	{}
 };
-
 MODULE_DEVICE_TABLE(tee, optee_ftpm_id_table);
 
 static struct tee_client_driver ftpm_tee_driver = {
diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
deleted file mode 100644
index 8d5c3f0d2879..000000000000
--- a/drivers/char/tpm/tpm_ftpm_tee.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) Microsoft Corporation
- */
-
-#ifndef __TPM_FTPM_TEE_H__
-#define __TPM_FTPM_TEE_H__
-
-#include <linux/tee_drv.h>
-#include <linux/tpm.h>
-#include <linux/uuid.h>
-
-/* The TAFs ID implemented in this TA */
-#define FTPM_OPTEE_TA_SUBMIT_COMMAND  (0)
-#define FTPM_OPTEE_TA_EMULATE_PPI     (1)
-
-/* max. buffer size supported by fTPM  */
-#define MAX_COMMAND_SIZE       4096
-#define MAX_RESPONSE_SIZE      4096
-
-/**
- * struct ftpm_tee_private - fTPM's private data
- * @chip:     struct tpm_chip instance registered with tpm framework.
- * @session:  fTPM TA session identifier.
- * @ctx:      TEE context handler.
- * @shm:      Memory pool shared with fTPM TA in TEE.
- */
-struct ftpm_tee_private {
-	struct tpm_chip *chip;
-	u32 session;
-	struct tee_context *ctx;
-	struct tee_shm *shm;
-};
-
-#endif /* __TPM_FTPM_TEE_H__ */
-- 
2.55.0

