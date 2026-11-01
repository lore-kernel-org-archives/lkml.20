Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571710;
	b=sUliYBe4XRERLtAMrX024/l1ujPOyXnQk9kHyJLXRe3hGHYAzECWTSdFQDhz9nrkRVJm
	 mF20TaqbrTpAC/IY5+JKvhmsZHWg5aW9EJTW8BCbZBT/bwNQA7fHo31Qpg3CezdkFzjC1
	 6MDVANxptuHXKNgbHJp6zRdLqIomBw38t91m85SXpxn1xPDItE8IvIMESjjBSVpxBMTYo
	 InpDl999VFH85tBXgMtB9y09iUsLaLm1wtb/rlYTc3IyQMNs47heZNihGg0dy8IZhAkM3
	 GFKK4mwcx5a1DxOVg7V5P+Bd8SaG6GvNJY1g8C88BoLWvColVBlt6qd+HHswYkeDiaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cp3eEG1uR9LfG2MoyOCL+bQoZ2d+X/rNrmJkd2KbD0I=;
	b=2MsYTbvuc3I+JHcuzQfG+5IRDPUNbOoN3UigmJcSt4ExNYP3UvClE7nD12zZXLVgXGk5
	 JuNz6eyMBegvV0348mpaCqFOUsQalIAHgfVNIK6NfJ0djbNNIFgq7UCnCvxLv1Vds+1tO
	 pKSmnqzdXAnpN3WaLAX47g3agLs+HO6vaqrJYU4uHub/Ds951+Be6xtCCOYzCofvB1fCg
	 +DFRU+QBooYYdoRlBBi3tZSVndYxV8TydVKO+XESqfrKgSMgxPIzjawewqh+6AbYZyIPg
	 Izf7A0zzhrJySBmekfqzp+wkMsGpk8ZRuGIjTWdsr8wfYldfzucSRmnZpj4ZH6uV00A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HrzSG3s0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eSlA/tKu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB6E606A6F3
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB6E606A6F3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HrzSG3s0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSlA/tKu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK3gJ835101
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cp3eEG1uR9LfG2MoyOCL+bQoZ2d+X/rNrmJkd2KbD0I=; b=HrzSG3s0fCOiYYn7
	smaye8HJ+vHZKXCpq6Oa6zx5Gff412eCUHnvhqr/citJ29Lbl+6kJJ4gSuJSPZhQ
	leikp9diO33vvFrhYvHic4KtlGuoB27JQlN8b6yyRtW4Zsx+wZ0elvGWeZoK4CO5
	G/8qaiNj6fg67AQXq/C5clMqC2Xu2N3DDrSC/pL/5FpYclrYdSPZ1J8hEpPSdJE/
	icFUlG8PSJa5Uos4hWehPavOKm6Ci9CvpVSWJjNSjCp7CLriVLoFHQ4Jy4YakryV
	MWHbrzAII013rKy+C9RdM2L1h4LwBRjHtNKmRyKPa0gnIfKqSYRCUNeom6MzI3t5
	nSw+wg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9c4q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:21:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso5328301eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571702; x=1794176502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp3eEG1uR9LfG2MoyOCL+bQoZ2d+X/rNrmJkd2KbD0I=;
        b=eSlA/tKuGq8j12AdCQtusamlOoRvWm3c/urpwqvFk/r8oRKoXwf31XW81eLExTyCBH
         2Cj5zH8ltN65JJQZnV6oCGxrnHmiH1cpM0jF3mtz5MiD8p4zxgwpadWODe7EZ5InqK/x
         5CK/xeansljO8u4qZ+CJ1JsfPE7fkaT0PN1RWpAZw351k27+PWpm2ZlvdOJJmsHaXGTA
         hk7G2SMjHGzzK3KMtYwYYr1z7EGjlf2Ayz6KZ4lq04s6IAUe2CRTmRqHU9D6VCfHHwEr
         rB4QZROX43LFUySMjExjYvft0nFLsoFMRL1CqKZp9pO0rscIQproKs7Ih//gDly9vQP3
         ZzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571702; x=1794176502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cp3eEG1uR9LfG2MoyOCL+bQoZ2d+X/rNrmJkd2KbD0I=;
        b=bWHMXgZMdOdPSu5Twas+SPrElMy5C2HUCsdlDKlZWSz8gU367a8nPuPZa2wWavgVVi
         m5rktBJqUIy9cg7IowtnTGIwLLtLItMBK8C8eagzDyD2kfpGgIlWvy8NeGg91C+lGwc8
         tP4VwYq9Vg+/3QaOQSY19iYotrNzOc7uY4ZmP+gdmIPHacbfcdjGBwyrc4h8sZ2Rvtkp
         bRXXBShJtwLyttsb4VQN269UTadM0PTbjAGGKRfht0/bih3nHcx3JaAY/ufj1lHCA7kN
         TTKl04Fw295Rf3kszUiJoYM6PBYP6YjM2Y5c6Y7Vl/uYXq3ODf93ululFl9QeHBX34zx
         wLoA==
X-Forwarded-Encrypted: i=1; AKwUvBzugHQUPL3nBOdFTwL9E1JgXobZ2pkEOZkNxQIvoJ3mIm0rXCv5ckWhiHdR4c3e5mhefuLMMP88YvBLrQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFoNfxB82yP56ozxy7QOpfim0wZZJhWhuD5RJs9CSuFOjWc6jU
	B9ohr2zFA4H10YRkk90Fh5vle9AHo2O3h/1009gNd6Lh7z5zqoIhEr1jNEef9+jsqO59Qm6+ZwN
	ZJ4T/Mjmc1ahbv+2oSI78sHRy7+XoFT+tethGy/ZCvx8d1wJR1IsWlNJE/Go1Jvj2lxs=
X-Gm-Gg: AYBFou12TWVSxHC6JUxpRQhkuBBCqu+V20bjbRWLp2QHEyNV55NabWNHlZKK99AYhke
	yRiyt64ZPpbcaNZtmf6bp6cEfdToqkxM5gdeUm9FDaRC9ei6CzC9H48DmigHsYeENTzpY3AX588
	OztqNKPtvYyiQbYs10Uw0s2lo0wq2pgzVpYqpxA0hI4r2MvdFya9I8ygmykQRQD+0cNj5zKGQ3p
	5pOQEI7XaJU/0Ru8i8tx/Kwe22QMKhI3+JK4QYb1mIJBvyLdiidO4AitJjaOTmjgcO4SCGn0p61
	4mw4X8rjNXHt73ceNwIr9KKY/+YQdj8Dos5A52aZUm1P01+40tebiM6Ocg0ZJe9LMt4i1fkTngQ
	O2fg0l5+97/hfZwAB9GYkuodi8pzg7s8OHL+cQ1YGN8Cl7Y9Ohsbf5i9GzT/zp+v9o4fW4ypE0O
	uoWurW6w==
X-Received: by 2002:a05:7022:619b:b0:144:eb3f:563a with SMTP id a92af1059eb24-1a9497b9d52mr23433364c88.15.1793571701582;
        Sun, 01 Nov 2026 14:21:41 -0800 (PST)
X-Received: by 2002:a05:7022:619b:b0:144:eb3f:563a with SMTP id a92af1059eb24-1a9497b9d52mr23433298c88.15.1793571700795;
        Sun, 01 Nov 2026 14:21:40 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:21:40 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:14 +0530
Subject: [PATCH v4 01/25] accel/qda: Add QDA driver documentation
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
Message-Id: <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=13102;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=jmM3pSIPYEkLouo1xFl+BJbx6wXTrOJiMV1SgH//ji4=;
 b=yZtzolAKc5qfruLbUURpgtdGmlJ+j3pMkKGIgbN0Nd5PWev4RRRHgNo8gSGWzrlvV+MiBKmAk
 PCe6RZ2qoZgBFQlBTELsDZezA9l3GzxdwawCkzNUaQl/Rw1k88S+URs
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: plhdfjvM0W9_9u15_hd-PGC-jyOP4J5C
X-Proofpoint-GUID: plhdfjvM0W9_9u15_hd-PGC-jyOP4J5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX7jr3TClLK2Sv
 22k3aUN1a5cksUhvT0csNARbT1ZDncWIJ0MHWsifzmKG4xJALcRHRWzt+PCPr2xcABVMB5442yn
 /ytLNw/0g3h0UioEf/RKBXvZwbOqBpRdY57xULqaNSvcCACUDToEY1K1rxEP8GXaARbUkd2Iayu
 Oj8dhTjGRNVHZ/oUBtwyVuJ/wwXHKogBkqIs3oigJQg4tU/bustEawjKZ1kKH+cdco1tFcj7CWZ
 t1qWXUA3NiSSUlhTH5kU4D4nulWuvFC8GqnzgJfAJcHBirzapHgOjCoEeuUyLPSJKtdjDlgN3zX
 XvmXe9CtgId2OTk61B9YaHut7UqkMZO6Tj4zkH0/59YvRnhNfeC/ZCQ6GxMHzyvnYwtfmftoDO1
 gRdaa/ylRMiVfR0EDhcC8FocPhUXs9EZncxN+LU0hMPN8yTzRkDtphJpr0nATbvduISDUFeN3Ro
 hm1Tb6bt0tNEd5KL6+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX2I4LX9OFDP+T
 QUgYfs5qGbYcICGHs5xrbjYKhv+/6DqMHu4lCY2dVAYZwzClau84IbCqWfBtuojcbQBKPGC9QXi
 O8m7Ds0nOlCRV/dhvKUCcKy8ZkhFWiY=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae7bb76 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=2kRYhx3FWN7WjntzlDQA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

The QDA driver is intended to replace drivers/misc/fastrpc.c with a DRM
accel driver. Its design differs from the existing driver in ways that
reviewers need to see before reading the code: buffers are only ever
passed as GEM handles, each open file owns an IOMMU context bank, and
the legacy /dev/fastrpc-* interface is provided by a separate
compatibility module instead of by the core driver.

Add the documentation at the start of the series so that the following
patches can be reviewed against it. It describes the driver as the
series completes it, and so covers ioctls and modules that later
patches add.

The document also points to the open source user space, the FastRPC
library and the QAIC compiler, used to exercise the driver.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 Documentation/accel/index.rst     |   1 +
 Documentation/accel/qda/index.rst |  13 +++
 Documentation/accel/qda/qda.rst   | 222 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                       |   9 ++
 4 files changed, 245 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index cbc7d4c3876a..5901ea7f784c 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -10,4 +10,5 @@ Compute Accelerators
    introduction
    amdxdna/index
    qaic/index
+   qda/index
    rocket/index
diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
new file mode 100644
index 000000000000..013400cf9c25
--- /dev/null
+++ b/Documentation/accel/qda/index.rst
@@ -0,0 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==================================
+accel/qda Qualcomm DSP Accelerator
+==================================
+
+The QDA driver provides a DRM accel based interface for Qualcomm DSP offload.
+It uses the FastRPC protocol and integrates with DRM and GEM infrastructure
+for device and buffer management.
+
+.. toctree::
+
+   qda
diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
new file mode 100644
index 000000000000..4d81f6b413ff
--- /dev/null
+++ b/Documentation/accel/qda/qda.rst
@@ -0,0 +1,222 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================================
+Qualcomm DSP Accelerator (QDA) Driver
+=====================================
+
+Introduction
+============
+
+The QDA driver is a DRM accel driver for Qualcomm's Hexagon DSPs. It provides
+an interface for offloading workloads such as AI inference, computer vision,
+audio processing and sensor processing to the DSPs on Qualcomm SoCs. It
+speaks the FastRPC protocol to the DSP over RPMsg and uses the DRM GEM and
+PRIME infrastructure for buffer management.
+
+The driver binds to the device-tree nodes described by
+``Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml``.
+
+Relationship to the FastRPC Driver
+==================================
+
+Qualcomm SoCs currently offload DSP work through ``drivers/misc/fastrpc.c``,
+a misc character device driver that predates the DRM accel subsystem. QDA is
+intended to replace it.
+
+To keep existing user space working, the ``qda_fastrpc_shim`` module
+(``CONFIG_DRM_ACCEL_QDA_FASTRPC_SHIM``) registers the same
+``/dev/fastrpc-<dsp>`` (and, where applicable, ``/dev/fastrpc-<dsp>-secure``)
+device nodes and translates the legacy ioctls onto QDA sessions. The shim
+holds only the legacy ABI handling; the protocol, buffer and session logic
+all live in the QDA core.
+
+QDA and ``CONFIG_QCOM_FASTRPC`` bind the same device-tree nodes and create
+the same device nodes, so they are mutually exclusive. Once the shim has
+reached parity with the legacy ABI, ``drivers/misc/fastrpc.c`` is to be
+removed.
+
+The shim keeps the legacy secure and non-secure node model. A DSP domain is
+secure unless its device-tree node has ``qcom,non-secure-domain``. ADSP, MDSP
+and SDSP get a single node, ``/dev/fastrpc-<dsp>`` or
+``/dev/fastrpc-<dsp>-secure`` according to the domain. CDSP and GDSP, which
+support unsigned protection domains, always get both nodes. On a secure
+domain, a client that opened the non-secure node may only create an unsigned
+protection domain, and only on a DSP that supports them. As in the legacy
+driver, access to either node is controlled by the node's file permissions.
+
+Architecture
+============
+
+The QDA driver consists of the following blocks:
+
+1.  **Core driver** (``qda_drv``): device registration, per-open session
+    state and DRM accel integration.
+2.  **Transport** (``qda_rpmsg``): binds to the DSP's RPMsg channel and sends
+    and receives FastRPC messages.
+3.  **SoC data** (``qda_soc``): per-SoC parameters such as the position of
+    the stream ID in a DSP address and the supported DMA address width.
+4.  **Context banks** (``qda_cb``): creates a platform device for each
+    ``qcom,fastrpc-compute-cb`` child node of the DSP's device-tree node,
+    using ``of_platform_device_create()``. Registering the device is what
+    gives it its IOMMU domain, so no driver has to bind to it. They are
+    created before the accel device is registered and destroyed after it is
+    unplugged, so user space can never reach a context bank that does not
+    exist.
+5.  **Memory manager** (``qda_memory_manager``, ``qda_memory_dma``): tracks
+    the context banks and allocates DMA-coherent memory from the one
+    assigned to a session.
+6.  **GEM** (``qda_gem``, ``qda_prime``): GEM buffer objects, mmap and PRIME
+    import.
+7.  **FastRPC core** (``qda_fastrpc``): argument marshalling, invocation
+    contexts and the DSP process management calls.
+8.  **Legacy interface** (``qda_legacy_ops``, ``qda_fastrpc_shim``): the
+    compatibility layer described above.
+
+Memory Management
+=================
+
+Buffers are GEM objects backed by DMA-coherent memory allocated through the
+session's context bank device, so their DMA address is an address in that
+context bank's SMMU address space.
+
+A session is one open file: either an ``/dev/accel/accel*`` file or, with
+the shim, a ``/dev/fastrpc-*`` one. It is assigned one context bank,
+exclusively, on its first buffer allocation or import. If no context bank is
+free, the operation fails with ``-EBUSY``. Context banks are not shared
+between sessions, so one session cannot reach another's buffers through an
+address the DSP accepts.
+
+Buffer arguments to every ioctl are identified by a GEM handle together with
+an offset and a length within that buffer. No ioctl takes a user pointer to
+buffer contents or a DMA-BUF file descriptor. To use a buffer from another
+driver, user space imports its DMA-BUF with ``DRM_IOCTL_PRIME_FD_TO_HANDLE``
+first. Imported buffers must be contiguous in the context bank's address
+space, because the DSP is given a single base address per buffer; other
+imports are rejected.
+
+The DSP manages its own virtual address space. The AP side only maps buffers
+into the SMMU context bank through the DMA API, so QDA does not use
+``drm_gpuvm``.
+
+User-Space API
+==============
+
+The driver exposes the following ioctls, defined in
+``include/uapi/drm/qda_accel.h``:
+
+``DRM_IOCTL_QDA_QUERY``
+    Query a property of the DSP selected by ``query_type``:
+    ``QDA_QUERY_DSP_NAME`` returns the domain name (for example ``cdsp``),
+    which is how user space picks the right ``/dev/accel/accel*`` node, and
+    ``QDA_QUERY_DSP_CAPABILITIES`` returns the value of the DSP capability
+    selected by ``attribute_id`` (cached per-device after the first
+    successful query).
+
+``DRM_IOCTL_QDA_GEM_CREATE``
+    Allocate a GEM buffer object and return its handle.
+
+``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``
+    Return the offset to pass to ``mmap()`` on the accel file descriptor to
+    map a GEM buffer object. Imported buffers cannot be mapped this way.
+
+``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``
+    Create a user process on the DSP from an ELF image given as a GEM handle.
+    Creating a signed process domain (``attrs`` without
+    ``QDA_INIT_ATTR_UNSIGNED_MODULE``) requires ``CAP_SYS_ADMIN``.
+
+``DRM_IOCTL_QDA_REMOTE_MMAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``
+    Create or remove a persistent mapping of a buffer in the DSP's address
+    space. ``request`` selects between mapping a whole buffer, optionally at
+    a hinted address (``QDA_REQUEST_MMAP``, ``QDA_REQUEST_MUNMAP``), and
+    mapping a region with SMMU attributes (``QDA_REQUEST_MEM_MAP``,
+    ``QDA_REQUEST_MEM_UNMAP``). An unmap must use the same request the
+    mapping was made with.
+
+    A mapping does not keep the buffer alive. Its GEM handle has to stay
+    open for as long as the DSP uses the mapping, and must only be closed
+    after the mapping has been removed.
+
+``DRM_IOCTL_QDA_REMOTE_INVOKE``
+    Call a method on the DSP. This is the main execution primitive.
+
+    The scalars value ``sc`` selects the method and describes the arguments:
+    bits 28..24 are the method index, bits 23..16 the number of input
+    buffers, bits 15..8 the number of output buffers, bits 7..4 the number
+    of input handles and bits 3..0 the number of output handles. ``args``
+    points to an array with one entry per argument, in that order, each
+    naming a buffer by GEM handle together with an offset and a length
+    within it.
+
+    The handles must stay open for the duration of the call. Buffers are
+    given to the DSP by their SMMU addresses, so they do not need a prior
+    ``REMOTE_MMAP``; use ``REMOTE_MMAP`` for buffers the DSP keeps using
+    across calls.
+
+``DRM_IOCTL_QDA_REMOTE_SESSION_ATTACH``
+    Attach the session to an existing protection domain instead of creating
+    a user process: ``QDA_ATTACH_ROOT_PD``, ``QDA_ATTACH_AUDIO_PD`` or
+    ``QDA_ATTACH_SENSORS_PD``. Requires ``CAP_SYS_ADMIN``, and fails with
+    ``-EBUSY`` if a process has already been created on the session. The
+    first Audio PD attach on a device additionally hands the DSP the remote
+    heap reserved for it in the device tree; later attaches reuse it.
+
+``DRM_IOCTL_QDA_SET_OPTION``
+    Set a session option. ``QDA_SET_OPTION_POLL_MODE`` switches a dynamic
+    invocation in a user PD between waiting for an interrupt-based reply and
+    polling shared memory for completion, trading CPU cycles for lower
+    round-trip latency. Rejected with ``-EOPNOTSUPP`` on DSPs that do not
+    support polling.
+
+Usage Example
+=============
+
+A typical lifecycle for a user-space application:
+
+1.  **Discovery**: open ``/dev/accel/accel*`` and use
+    ``DRM_IOCTL_QDA_QUERY`` to find the node for the wanted DSP domain.
+2.  **Initialization**: call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` to
+    create a process on the DSP.
+3.  **Memory**: allocate buffers with ``DRM_IOCTL_QDA_GEM_CREATE``, or import
+    DMA-BUFs from other drivers with ``DRM_IOCTL_PRIME_FD_TO_HANDLE``.
+4.  **Execution**: use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to run functions on
+    the DSP.
+5.  **Cleanup**: close the file descriptor. The DSP process is released and
+    the session's buffers and context bank are freed.
+
+DSP Restart
+===========
+
+When the DSP's RPMsg channel goes away, for example because the remote
+processor is stopped or crashes, invocations still waiting for a reply fail
+with ``-EPIPE`` and later ioctls fail with ``-ENODEV``. The DSP comes back
+as a new accel device, possibly with a different minor number, so user space
+has to close the file descriptor and repeat discovery.
+
+Debugging
+=========
+
+The driver's debug messages use the DRM driver debug category. Enable them
+with:
+
+.. code-block:: bash
+
+    echo 0x2 > /sys/module/drm/parameters/debug
+
+or, where ``drm`` is built in, with ``drm.debug=0x2`` on the kernel command
+line.
+
+Testing
+=======
+
+The driver is exercised with the ``fastrpc_test`` utility from the
+open-source FastRPC user-space library, built with the open-source QAIC IDL
+compiler:
+
+* FastRPC library: https://github.com/qualcomm/fastrpc
+* QAIC compiler: https://github.com/qualcomm/QAIC
+
+For example, to run the tests on the CDSP with an unsigned process domain:
+
+.. code-block:: bash
+
+    fastrpc_test -d 3 -U 1 -t linux -a v68
diff --git a/MAINTAINERS b/MAINTAINERS
index aaf2825ac945..6803c60cbc64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22973,6 +22973,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
+QUALCOMM DSP ACCELERATOR (QDA) DRIVER
+M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
+M:	Srinivas Kandagatla <srini@kernel.org>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/qda/
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org

-- 
2.34.1

