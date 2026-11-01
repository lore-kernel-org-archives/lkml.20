Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571929;
	b=C69VK9Fh3TNK7MWU+rzAV03LyHXrksShnJJ98P7fFvYLdk/DjgPHMyJNV3tk9N2ayKsi
	 QEsCKFkG59/gI329hP2B8LsN/jcxfoHEOFjqlE46mB86KeIw2b+uWmobThbP/6cirr1cD
	 J8RYeC96FaKU5WTo9p/2fJo6mQ2tWiGAS4oFtewsrarEYN98ZXNP+8c1k/nz/TeFiX673
	 YnuPRL5t2A2k8qTKhgrUGIXF2FAe/dESN23nLJ+eYcGrmOjPh7CB4PECnZButa/KqkRLg
	 HPNKa4ziIzSEkRD50xc/PtF0N3uAfH2xT5k0P6rp1/XaaKNtQ3xeRz034fpSA7AQ9dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1kzG/Dg/owMDGYoIx22GjptP1hF8V3h3xBi1CQ1R8Ew=;
	b=R5A6+DNNusU7Fe8t2cdrUi/4giv46EH+OVntiBJBh5JCBlPJt0M1W8QA1ip7mhdrQ8/D
	 A+n6nVtl83a1EhhHTuUb8FVU7e/gctaqV6oKNXSCoDb065L2PEvUCQcU5WBkVRiGuQJ92
	 Sm3aWphzbR/FvMThvEkvkxy3pkcaDHYprO7xiVyQLGuuAC+VpSlg2VNSXxpGTfd7fT3do
	 NAoBWNDeiDQpTfJrLC7HgkO6nhBiVtV0mRh6xPGTjwAQFm+CB3HmE9oUeh0/A4C5v6nBA
	 +wKRMkxVX4lk4xafeaW29wZr05s20KCRlNL5kKKLcqcdTBdjNaQvXwwp2Z5mbXPzcEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jWaSj8/U";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAVwS2fB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F49606E527
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F49606E527
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWaSj8/U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAVwS2fB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KKOd0733503
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kzG/Dg/owMDGYoIx22GjptP1hF8V3h3xBi1CQ1R8Ew=; b=jWaSj8/U1SPL7Kew
	xJJguFpMYtoheN5mgfVxGTnOpNpeCT+WNv5IDsbXzDBQ+ByC1SqUiPEXVoQIhHlM
	FL/RvqSk3vbFWGNB4BACYJ+oSE+4YlAilR5pACV/98CHMI+US+GxrTVqVwWrn17+
	JZ/cagPU6xAMD1o9S4ZdbByFQSiIjk26lkokUuyQVIJHlnZQOBJLeCKGX86eRG2+
	HssEkjSwHMNAlIlyXWXOzJSPIOmH64ck94lCFDc+J7rtdCx3P75kDYSx2Ih1wjLx
	hhdFjpoz+anJhh20ZUK97TCMPEFLsvKgYwZNdoK5qSfY5pfF52XQPtgSE3HnBvpo
	nzAeyg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7v9k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:25:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so4801173eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571927; x=1794176727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kzG/Dg/owMDGYoIx22GjptP1hF8V3h3xBi1CQ1R8Ew=;
        b=FAVwS2fBZhxoJ0Ivzc32h3MHfG98mPbQV36wE6RfteVr8HWR1rypQLwIGX+3n1S9sy
         qlFZ6RNDv12bGkeF3wOZ8K9tG2w8xDDcBQmfPIVbpbIs1GvQ9zTADl3qcL28KhuiCaLV
         pX0ZZ+nqTzRShtNNNHPBAjL5wIwz4p8s/txi9t/QEYiHbu2hfUsZplyg7B5pl26jvCap
         /VPajjExWH6fH5SvVNFhnLIz63K+qRcwAECRQv/qQby+m98X2dJYiOf/hy8BqnmN9Kh0
         YZgWEu06PMA6DhCm13we4bQVHVvfzVdfCaymuaV8gEKHhXE348oT9AxmXHVOAeRJjzUh
         mE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571927; x=1794176727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1kzG/Dg/owMDGYoIx22GjptP1hF8V3h3xBi1CQ1R8Ew=;
        b=i0lTA8TH1Wm/C0Oc9TX4vo+yJ88LGNzOlqUfljQAcDTzx0V7RZxBxdr7Z8sK8xx70I
         T1twWfUS7+juYnZzHCrL41DZLwHJXb7CtPkfJKBrcf+XVw9B4nXeXG4aqaQwqESf5PJ7
         llUDnua6sbm+AVR4407smqQNM5/KLS9ECZVE5ZS+cYXGdaUKQi7QrS94+ewK/6pYk8Cz
         7qN4s61ZPmOZjVEafni9rDeJ0hsDiwFUtQViC6P6QGW/lfcj56lUm5+Wq5y5u5gyV7Wd
         14uuHGagQQT13mvbJyvaQBZycDIj+zRFrYBeor+LT0xnowS3yTm97bkYOJ3mp+dFDO7b
         B2uA==
X-Forwarded-Encrypted: i=1; AKwUvBwwZbA5vKRcIHiTrK+pXlKdoRb2cHHqM7Ty0vsVslZq0vUAMouX0vhhRwotkv4JzFaGlK5+8xWaINVA8kE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiTDeZ/mz5s0kxmh7tFuOW6qTn19PDQG+dB9j2WClyjQvbAlVR
	hex+csDdK+2ToseR/uL8SzAhxaOHdZQ2EveLEAFczKnDPhFv+jUyGLqucgYpnlIRqBNRuZ7mYQy
	weA7pNBOFoGFHmSEMbU7po3dMEvAR4T6kDUBDJqzWSAvjA2Zr8Lsx8hV15YmmoiLhzAI=
X-Gm-Gg: AYBFou2TuAJnFzbIO2kw5BJvm/Uty5PNIEKMHm9alQmr1NBRnYBjqflT0FgulpBMAr3
	Cq9t2w+0ZRX8N/sbiuRUixGEeQAle8JvbHo1rxQBysr6T9PGqrLjj5Jzd9P/YOv5peua67BNCjx
	8BGyEcRWuGNaoxwYjl7o8O7JZdXKBuDtxuhQ/D/7m/BhDZsMaakLG2gd1Fd6oHggJzoxxqeugvC
	a23lMIWziwvQKMBoaaMOKMftR2j2KG6LWgoM2wZ3Z0dTvpnoZQOImpPWCHkM0n1+pf0batkFHGz
	qZddBw7tdZc2WQMq1doy+WRPSXA8JZyOds6Zse7h5DvpxVvnuAisOOmu9+03KWllGq6QAOXJM0t
	qP88ChqotE9vGIMQTT92X/8kVDEwfirOSnfkb1NsCJs1h4cWAPDTwqfqw51S3RV0ueYdrLDRV6r
	hVzv83WA==
X-Received: by 2002:a05:7022:2203:b0:18d:c38c:bcc9 with SMTP id a92af1059eb24-1ac56e8a821mr18675822c88.3.1793571926922;
        Sun, 01 Nov 2026 14:25:26 -0800 (PST)
X-Received: by 2002:a05:7022:2203:b0:18d:c38c:bcc9 with SMTP id a92af1059eb24-1ac56e8a821mr18675754c88.3.1793571926248;
        Sun, 01 Nov 2026 14:25:26 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:25:25 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:35 +0530
Subject: [PATCH v4 22/25] accel/qda: Add remote session attach to the
 legacy shim
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-v4-v4-22-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=9210;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=S1LrahsubxpMaNQzoAQki/9y8aw+aoYCRtlc5M1H2kY=;
 b=GjSwacbsixMm165OAPn7wFwGAIWRJ4X49iL1fNYEkJEXQMujlDQNttaV2fthf2y4/tbCqH+Hi
 AUaznHTWPzgCNLeqhFxJJY4tEOdv7KFfQPr48M42ML1Js+GsAZnhVzN
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: OivBAzLIJQcdAO7zr6hQWHpx_eQsWJ3J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX9gvDWxVYqhYf
 uRuQydaVRsnNrs3aI0b+osf4Rkmep9EeKt/m3jRK84Pg5EqfNNQUsTyl4DUeo5/rMX4ldvZOd8H
 9D41hVaxLPE3FkRr9Vl3lvF62bZptNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX8xS+AuUUW2Bi
 ht7lfw/55ZC/JmIC7PK6xwO/kH9vMbwZ2gALP0INu+7HR05P788evBZC9m6IAxL6RqMfa6fcJrh
 UJHUv6e/RcuVh9/PbaDzxpHJGavJ0ueeXq+xDX0YWa0Rqwekw0r2mU/y/Di48njIw/oxb4bHVMn
 5qYWv25NC4263asIRPzomyTLdOxrXY25VS7vypVyWCLi6YWPnfqxrr695A+zW5SULWSmGTZgO4n
 7DZB6Y5TYTyt5JEtnakwbAp8eV0ru/oNc6V7VUoVVtkdPPomHodelWg51akEgFGRnYiF8gec3np
 U1g+lLO6OR3Ow2oGle6QzYkjmAjrrCGttvDRNXu7z8LuYHiUwNJmJKA/UntLwakUDkTrUe6ACOx
 nh/iOTOEdkSlnuUptLO3bNlIMF7QWekwwuy9IiORuWnSB8sHh4XKSdAjq3mwJXQYl0fE+9NJDxZ
 UDFDze3LN661T2Fg2DA==
X-Proofpoint-GUID: OivBAzLIJQcdAO7zr6hQWHpx_eQsWJ3J
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae7bc58 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WqNVZKtITsyolQqna8AA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

Wire FASTRPC_IOCTL_INIT_ATTACH, FASTRPC_IOCTL_INIT_ATTACH_SNS and
FASTRPC_IOCTL_INIT_CREATE_STATIC into the legacy FastRPC compatibility
shim, so existing user space using the /dev/fastrpc-* ioctl interface can
attach to the Root, Sensors and Audio protection domains.

Root and Sensors PD attach carry no payload. INIT_CREATE_STATIC forwards
its name and length; memlen is ignored, since the Audio PD remote heap
size always comes from the device tree rather than from user space.

Move the attach logic out of the ioctl handler into a session-level
function that both interfaces call. It checks CAP_SYS_ADMIN itself, so
the legacy path is subject to the same privilege requirement as the
native one.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_fastrpc_shim.c | 24 ++++++++++++++++
 drivers/accel/qda/qda_ioctl.c        | 54 +++++++++++++++++++++++++-----------
 drivers/accel/qda/qda_ioctl.h        |  2 ++
 drivers/accel/qda/qda_legacy_ops.c   |  1 +
 drivers/accel/qda/qda_legacy_ops.h   |  3 ++
 5 files changed, 68 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/qda/qda_fastrpc_shim.c b/drivers/accel/qda/qda_fastrpc_shim.c
index c46d2de4f581..c1464b1adbc2 100644
--- a/drivers/accel/qda/qda_fastrpc_shim.c
+++ b/drivers/accel/qda/qda_fastrpc_shim.c
@@ -18,6 +18,7 @@
 #include <linux/uaccess.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
+#include <drm/qda_accel.h>
 #include <uapi/misc/fastrpc.h>
 #include "qda_drv.h"
 #include "qda_fastrpc.h"
@@ -295,6 +296,23 @@ static long qda_shim_init_create(struct qda_shim_file *sf, void __user *argp)
 	return err;
 }
 
+static long qda_shim_attach(struct qda_shim_file *sf, u32 pd_type)
+{
+	return qda_legacy_ops_table.attach(sf->session, pd_type, NULL, 0);
+}
+
+/* memlen is ignored: the Audio PD heap size comes from the device tree */
+static long qda_shim_init_create_static(struct qda_shim_file *sf, void __user *argp)
+{
+	struct fastrpc_init_create_static args;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	return qda_legacy_ops_table.attach(sf->session, QDA_ATTACH_AUDIO_PD,
+					   u64_to_user_ptr(args.name), args.namelen);
+}
+
 static long qda_shim_mmap(struct qda_shim_file *sf, void __user *argp)
 {
 	struct qda_shim_mapping *m;
@@ -516,6 +534,12 @@ static long qda_shim_dispatch(struct qda_shim_file *sf, unsigned int cmd, void _
 		return qda_shim_alloc_dma_buf(sf, argp);
 	case FASTRPC_IOCTL_INIT_CREATE:
 		return qda_shim_init_create(sf, argp);
+	case FASTRPC_IOCTL_INIT_ATTACH:
+		return qda_shim_attach(sf, QDA_ATTACH_ROOT_PD);
+	case FASTRPC_IOCTL_INIT_ATTACH_SNS:
+		return qda_shim_attach(sf, QDA_ATTACH_SENSORS_PD);
+	case FASTRPC_IOCTL_INIT_CREATE_STATIC:
+		return qda_shim_init_create_static(sf, argp);
 	case FASTRPC_IOCTL_MMAP:
 		return qda_shim_mmap(sf, argp);
 	case FASTRPC_IOCTL_MUNMAP:
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 41234fc576a9..aaf3e5e6b5b1 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -183,7 +183,7 @@ int qda_release_dsp_process(struct qda_dev *qdev, struct qda_session *session)
  * so that a concurrent one cannot skip the heap while the first is still in
  * flight, and the flag is set only once the DSP has accepted it.
  */
-static int qda_attach_audio_pd(struct qda_session *session, struct drm_qda_remote_attach *args)
+static int qda_attach_audio_pd(struct qda_session *session, const char __user *uname, u32 namelen)
 {
 	struct qda_dev *qdev = session->qda_dev;
 	struct qda_static_pd_args sargs = {};
@@ -193,20 +193,20 @@ static int qda_attach_audio_pd(struct qda_session *session, struct drm_qda_remot
 	if (strcmp(qdev->dsp_name, "adsp") || !qdev->remote_heap_size)
 		return -ENODEV;
 
-	if (!args->namelen || args->namelen > QDA_FASTRPC_INIT_NAMELEN_MAX)
+	if (!namelen || namelen > QDA_FASTRPC_INIT_NAMELEN_MAX)
 		return -EINVAL;
 
-	name = memdup_user(u64_to_user_ptr(args->name), args->namelen);
+	name = memdup_user(uname, namelen);
 	if (IS_ERR(name))
 		return PTR_ERR(name);
 
-	if (name[args->namelen - 1]) {
+	if (name[namelen - 1]) {
 		err = -EINVAL;
 		goto out_free;
 	}
 
 	sargs.name = name;
-	sargs.namelen = args->namelen;
+	sargs.namelen = namelen;
 
 	scoped_guard(mutex, &qdev->remote_heap_lock) {
 		if (!qdev->audio_init_mem) {
@@ -226,38 +226,60 @@ static int qda_attach_audio_pd(struct qda_session *session, struct drm_qda_remot
 }
 
 /**
- * qda_ioctl_attach() - Attach to a DSP-resident protection domain
- * @dev: DRM device structure
- * @data: User-space data (struct drm_qda_remote_attach)
- * @file_priv: DRM file private data
+ * qda_session_attach() - Attach a session to a DSP-resident protection domain
+ * @session: Session to attach
+ * @pd_type: QDA_ATTACH_ROOT_PD, QDA_ATTACH_SENSORS_PD or QDA_ATTACH_AUDIO_PD
+ * @name: User pointer to the static PD name (QDA_ATTACH_AUDIO_PD only)
+ * @namelen: Length of @name including the NUL (QDA_ATTACH_AUDIO_PD only)
+ *
+ * Shared by the accel UAPI and the legacy shim, so the privilege check lives
+ * here rather than on the ioctl.
  *
  * Return: 0 on success, negative error code on failure
  */
-int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_priv)
+int qda_session_attach(struct qda_session *session, u32 pd_type, const char __user *name,
+		       u32 namelen)
 {
-	struct drm_qda_remote_attach *args = data;
-	struct qda_session *session = file_priv->driver_priv;
 	int pd;
 
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
 	if (READ_ONCE(session->init_mem_gem_obj))
 		return -EBUSY;
 
-	switch (args->pd_type) {
+	switch (pd_type) {
 	case QDA_ATTACH_ROOT_PD:
 	case QDA_ATTACH_SENSORS_PD:
-		if (args->name || args->namelen)
+		if (name || namelen)
 			return -EINVAL;
 
-		pd = args->pd_type == QDA_ATTACH_ROOT_PD ? QDA_ROOT_PD : QDA_SENSORS_PD;
+		pd = pd_type == QDA_ATTACH_ROOT_PD ? QDA_ROOT_PD : QDA_SENSORS_PD;
 
 		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_ATTACH, &pd, session);
 	case QDA_ATTACH_AUDIO_PD:
-		return qda_attach_audio_pd(session, args);
+		return qda_attach_audio_pd(session, name, namelen);
 	default:
 		return -EINVAL;
 	}
 }
 
+/**
+ * qda_ioctl_attach() - Attach to a DSP-resident protection domain
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_remote_attach)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_remote_attach *args = data;
+
+	return qda_session_attach(file_priv->driver_priv, args->pd_type,
+				  u64_to_user_ptr(args->name), args->namelen);
+}
+
 /**
  * qda_ioctl_mmap() - Map a buffer into the DSP's address space
  * @dev: DRM device structure
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index f6f5d64e36ce..94adba549989 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -21,6 +21,8 @@ int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_pri
 int qda_ioctl_munmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_session_init_create(struct qda_session *session, struct qda_init_create_args *create);
+int qda_session_attach(struct qda_session *session, u32 pd_type, const char __user *name,
+		       u32 namelen);
 int qda_session_mem_map(struct qda_session *session, struct qda_mem_map_args *args);
 int qda_session_mem_unmap(struct qda_session *session, struct drm_qda_mem_unmap *unmap);
 
diff --git a/drivers/accel/qda/qda_legacy_ops.c b/drivers/accel/qda/qda_legacy_ops.c
index ea815ab0c52a..fc5e94c0c9bc 100644
--- a/drivers/accel/qda/qda_legacy_ops.c
+++ b/drivers/accel/qda/qda_legacy_ops.c
@@ -192,6 +192,7 @@ const struct qda_legacy_ops qda_legacy_ops_table = {
 	.session_create = legacy_session_create,
 	.session_destroy = legacy_session_destroy,
 	.init_create = legacy_init_create,
+	.attach = qda_session_attach,
 	.release = legacy_release,
 	.mmap = legacy_mmap,
 	.mem_map = legacy_mem_map,
diff --git a/drivers/accel/qda/qda_legacy_ops.h b/drivers/accel/qda/qda_legacy_ops.h
index e3126ac10507..95a169edc594 100644
--- a/drivers/accel/qda/qda_legacy_ops.h
+++ b/drivers/accel/qda/qda_legacy_ops.h
@@ -33,6 +33,9 @@ struct qda_legacy_ops {
 	/** @init_create: Create a DSP process from an imported ELF image */
 	int (*init_create)(struct qda_session *session, struct drm_gem_object *elf_obj,
 			   u32 filelen, u32 attrs, u32 siglen);
+	/** @attach: Attach the session to a DSP-resident protection domain */
+	int (*attach)(struct qda_session *session, u32 pd_type, const char __user *name,
+		      u32 namelen);
 	/** @release: Release the session's DSP process, if it has one */
 	int (*release)(struct qda_session *session);
 	/** @mmap: Map a buffer into the DSP's address space */

-- 
2.34.1

