Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571737;
	b=eOEzac/rFVVKrgxnYoMvJ7xi+L9u7TjA1Nkzbk4kwIAUx/wQSeMLUwxwCOkRWWSKe4z/
	 RHDG+w2IvBFkUiwJ2gXdakjpYb+wohRf6qgh90I7LjrbsN5gDwV553D/E9nUZBQo5tKnx
	 gABsi4v/Gw2/QhMZMXK4PJEp5UxXcB20Yxce9AzilCNLQ9do5T0IhLwAXjk+nHj6w/tnC
	 XSuoA10XvvMFmij25tCf6z5OKagqLzGmMcrXBHHUdUsdVM70FefPSlxmmq5KMwDE090OL
	 KJaW2iKsQ0TNFQfBoDTk9EZCVZwWd+VSQ/7StTw680VfInrvcZyCo0jP6umjwFIOOvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bHohxyAY9L/HjWWr8OBWIGtPL19bdpfYctk0XdN5hL4=;
	b=npZNjnmDY3wsu0WE0iUHtd5MqWgln6ZOBzyc6qq0EHopVDv2Fr2vbuN5mQmqrArCGeMt
	 VXXJBg2oN9FitR1Mgb5WyVOR/CKo+M3p953JFdgLUgMc2+xByJuFNZLED6tI2xVRiCygs
	 zy4PsccpQ6nfpAmuekImUQrxPY2nyHcjWa23815YWZJgy2xs37FupHSkiXlxc49BcNhQt
	 EL2ILVRjAm54BUx/+d0/Vo1vRl15RvPbdw292jzl1gPrw/gLt95ZtzZ7OPHiGrTOyqYwO
	 Wqaf9HBxvikVdQFTMeHfiaqB6pCwBc68+2ALGHj9DQIsVjdn/9Ch3ghvOJzCekWl2/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LdoH3/e4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbgB7CaA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831F606E527
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6831F606E527
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LdoH3/e4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbgB7CaA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK5oi1801381
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bHohxyAY9L/HjWWr8OBWIGtPL19bdpfYctk0XdN5hL4=; b=LdoH3/e4qaeGkNR7
	tDdTS3FLvqD+mGh9QTZMY8MQpsjyUKpTxTWZS2D+7H+qo0ZvJauFDcLHftPFDjgv
	vZjOv5egvKpPED2OEEx4ZmQAgS2c1x4hvIGpfMdks+sucWPO197mS2ZJWaAaTOEB
	YXEi6yMQ/ZMQn8BLda2mE9TajLBzRV6wJ9d9bHb2CGROZAddU1Dq3WAxApmwt/mi
	atE/uEcmOBGltMorW3eCBVQiIcc4jz5sT/sm+dV+cOnIGbA/JCDVlv5Dc6Uz+7j6
	oIjG7rf2BXuCFY8U4uiiXRf8fZQBCmBAqbXFGBQIxIP4p2MRk6RgH/IoVtFGXImz
	jZ2OOw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8duca04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:22:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so1845792c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571734; x=1794176534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHohxyAY9L/HjWWr8OBWIGtPL19bdpfYctk0XdN5hL4=;
        b=XbgB7CaAlLgJEM/yNnUYE9lZj9kZppob5cCADZIh23hNOzNLHBSeGq8zBkVAIfnR/r
         zj6yfsU+3YgbdIgGDOngQfwSOjxAw/7PyAj2hhBbVatKOLEkgbo+q6cDlJLrxOdrgM8k
         HsPUGzkNKE5L3s61i79bUoj7wB3uqsxjPEs5rgyy/6WurFplUO/5pCydQ/W//zPLPzAD
         aM8WFpewJ7bftAGx3/o/0u8eh+Wj8hHp498mpJdoaf73D9Q1DXem36GCdWh4NMC1CrLN
         md2kplPu7y3ie8VrCGwA1sHi8c4er9bNzfquV+bwaR61j3vHNqfP0v+Ky58rVUtzvc3S
         ryFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571734; x=1794176534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHohxyAY9L/HjWWr8OBWIGtPL19bdpfYctk0XdN5hL4=;
        b=HNA/f8zeuqNwnhzsuekKRFa9Hz5iXdkoOa/6RKcf3t1kLKYGWyqvfU+LG4KiIt5CZF
         svOb5MARgByaIPhVgUzpT5KKv3KBsMqGoD2akQPuFr80iKazeiiYxSqX/9ymk48Q/1hg
         41z54iCuDh2GIL3wDH2SvGp4G0gQbjuj8yVJR72J0lbith6Jvw831DX411AWJepzklJd
         6Nr1E6w4MR2Rx3PTwSE3rgtC1Lklc5i1apNr2h2trFuPYkuPZrpntPZFK4sGyyEeKY6X
         qKhFw5pZkN/aUfTAolaKZdjhRmLhEK3FAyIjO7RYALuKLdrrDupvMGhebnH7/Ont6lX8
         zC5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwY+xqjN4CaVHlgZeV7gNwe73wRWmdpQnKROZ5KccA2W2NrIFSWwzyMCL9GEfgK1641ebqTxdA3TaeFnFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxMp1bp53twjuEg8AHwvnKL1WXSySXpSntOiLoY2SV7cbNga9c
	J6oyPrKU3GGqR05gGFIJ+HhOnAAJnW+W6dB9GrJvbukqMtSEDvMeIVXSwLNFcQYcEyOk7sRMamO
	OP43tPxSTaG01QFRxlFWKORAEeOYuJd2hqF65jyvYLC7VdGUUcVG9whv/dDt++IsHd2c=
X-Gm-Gg: AYBFou2vx5cPj2hBIt4LAw23nLHwOW/ppom2KYeuNZTlollq9eQ2pbEAups2FW7pQb5
	Xh/m7Th0+Ez9XdlMcKM7+Ebk8QuKfXa/FxVxKsvu9emxXOrjdvny0+DvZRC/31yVdOkSjgxcIDj
	lis1dp+scfFNAGT7Frr3VabvmLcIegeqlmNPfcFViVpB+UieCk0MSlKvwKqpu8VHri/wo/Qwtad
	YDEQyOcd0GG+0VKwf6B+jkRYh42DCyWx+EYxXLs7TE/EfWKATLYNqzQnJb0x2Dg4gEVQTGYpZsT
	SZgjtrZVT2DYHzpmnvwueicrJrjZn/Z1WFkiVW8OvQ4aNkDQ2tsdvQSdHw1RnO/6E1t+Qa8za0q
	rkjaZ/gHRkOQ6NN88ocLKyaxK80ChuWpVq21ucm3fPZ8HOJQawWgNB8wPCdIYyzxIobRTDCy9H2
	r+AHI3gw==
X-Received: by 2002:a05:7022:ea55:20b0:164:ae59:935 with SMTP id a92af1059eb24-1ac5eea1b40mr13406019c88.34.1793571733877;
        Sun, 01 Nov 2026 14:22:13 -0800 (PST)
X-Received: by 2002:a05:7022:ea55:20b0:164:ae59:935 with SMTP id a92af1059eb24-1ac5eea1b40mr13405944c88.34.1793571733173;
        Sun, 01 Nov 2026 14:22:13 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:22:12 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:17 +0530
Subject: [PATCH v4 04/25] accel/qda: Assign a context bank to each session
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
Message-Id: <20261102-v4-v4-4-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=17484;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=A/IeZzLGu61VxF7Cei5WLUjdtzr8+flEA2Tuiri0lt0=;
 b=b9v0uuhBIyxElfGmu4kLQ7Kj483Osk48O3vvxnNWav6c1357Da0gdwX+yUfdt8FX4qrM+ut7i
 FfS97qXsZTNC3wGBoSs7US+qvQLGjyN7hf+fp117PxkTxCbhbRttftA
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae7bb97 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vbzk6Z98Z6Qeo9ramqoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: goQFISWs9yGnHX2PczpGgQPUipmmCTxl
X-Proofpoint-GUID: goQFISWs9yGnHX2PczpGgQPUipmmCTxl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXy643OOz5lKtV
 VItZAfU5wk4dh/zAryXhcCZP0InUliwZl4mK0efmqj8GOwQZy8UUajY9UNZQ6lGx9CGjyDsCtT+
 lbOKqxOUphPew7DDIiKTHvTlBze4wXZ/8QcxEMEvwjUU/XzYVWfevcYYdNrCpifZk/76Nvy+ujy
 pN6YAAb4jpDLi7q6m38bi6QL0+XcFzEo6vWBc3A+cw8YlzO7nXB+cslgf7+lW92VfHTlnOccNvN
 WOq+GTb7hL2jX7ztp9zRrAEQ0jvbFtDzHanj5OU64WtR9+rD2jq4ReITrNUUnmV4N9cI9kbDzZt
 +ZGjOZitRh6OwzTlGGL43Z/xgACTRY9UZir3/1d9+b2ZB5fr76HtUbmSKuKXvvHbwKaei6FldJe
 BgBLuV3Gx8jKqq3vBD0PDFI+9E/pbrvgmH01U3xR5/a3yewfhnI9qwHfZDZmnUp5p4QGJllnxrn
 vsexZzm7B6BqK1Nk2kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXykRcJp4wIGJo
 ugqSfbY6WJGhxZZsrTNYzCuAPN3g4ndqIaZ2XL2/nSphW1+UJEToZtxqtVA0r0QH+Vm4TNQP1Jp
 GZzuphftGxSovyuyBijxY7RUvqdWdmg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

Buffers a session gives to the DSP have to be mapped into one of the
DSP's context banks, and the DSP identifies them by an address in that
context bank's address space. If two sessions allocated from the same
context bank, each would be able to reach the other's buffers through
addresses the DSP accepts, so a context bank must not be shared.

Keep the context banks of a device in a registry sized to the number of
nodes found in the device tree, and hand each session one of them,
exclusively, until the session is released. A session that asks when
none is free gets -EBUSY rather than sharing. Nothing allocates from a
context bank yet; that comes with the DMA backend.

A context bank is reference counted and held both by the registry and
by the session that owns it. The rpmsg channel can go away while a file
is still open, which destroys the context bank devices, so the session
keeps the object alive until it closes rather than leaving a dangling
pointer behind.

qda_cb.c's cb_devs list and the new qda_memory_manager registry track
the same set of context banks but for different reasons, and keeping
them separate is deliberate. cb_devs exists to run the platform_device
create/destroy dance against the device tree; nothing there knows about
sessions. qda_memory_manager exists to answer a different question -
which context bank, if any, is free right now - and is the only place
that needs the per-session exclusivity rule from the second paragraph
above. It is deliberately kept independent of GEM: the context bank
registry has to be consulted (and a bank assigned) before any buffer
exists to attach a GEM helper to, and the same registry will grow to
hold each bank's IOMMU/DMA state once the DMA backend lands, which has
no natural home on a GEM object either. Folding the two together would
make qda_cb.c respond to session lifetime, or qda_memory_manager drive
of_platform_device_create()/destroy(), neither of which is its job.

Note that this inherits a property of the existing fastrpc driver: a
DSP has only a handful of context banks, so a process that opens the
device repeatedly can take all of them and keep others off the DSP.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile             |   1 +
 drivers/accel/qda/qda_cb.c             |  45 ++++++++-
 drivers/accel/qda/qda_drv.c            |  30 +++++-
 drivers/accel/qda/qda_drv.h            |   7 ++
 drivers/accel/qda/qda_memory_manager.c | 176 +++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_memory_manager.h |  69 +++++++++++++
 drivers/accel/qda/qda_rpmsg.c          |  26 ++++-
 7 files changed, 349 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 4f2f236086a4..1ca991e198ed 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,5 +8,6 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_cb.o \
 	qda_drv.o \
+	qda_memory_manager.o \
 	qda_rpmsg.o \
 	qda_soc.o
diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
index afb0bb71a1f4..6f1cff1133f9 100644
--- a/drivers/accel/qda/qda_cb.c
+++ b/drivers/accel/qda/qda_cb.c
@@ -7,8 +7,44 @@
 #include <drm/drm_print.h>
 #include "qda_cb.h"
 #include "qda_drv.h"
+#include "qda_memory_manager.h"
 #include "qda_soc.h"
 
+static int qda_cb_setup_device(struct qda_dev *qdev, struct device *cb_dev)
+{
+	struct qda_iommu_device *iommu_dev;
+	int ret;
+
+	iommu_dev = kzalloc_obj(*iommu_dev);
+	if (!iommu_dev)
+		return -ENOMEM;
+
+	iommu_dev->dev = cb_dev;
+	iommu_dev->qdev = qdev;
+
+	ret = qda_memory_manager_register_device(qdev->iommu_mgr, iommu_dev);
+	if (ret) {
+		drm_err(&qdev->drm_dev, "Failed to register context bank: %d\n", ret);
+		kfree(iommu_dev);
+		return ret;
+	}
+
+	dev_set_drvdata(cb_dev, iommu_dev);
+
+	return 0;
+}
+
+static void qda_cb_teardown_device(struct device *cb_dev)
+{
+	struct qda_iommu_device *iommu_dev = dev_get_drvdata(cb_dev);
+
+	if (!iommu_dev)
+		return;
+
+	qda_memory_manager_unregister_device(iommu_dev->qdev->iommu_mgr, iommu_dev);
+	dev_set_drvdata(cb_dev, NULL);
+}
+
 static int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
 {
 	struct qda_cb_dev *entry;
@@ -30,10 +66,14 @@ static int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_nod
 		goto err_destroy;
 	}
 
+	ret = qda_cb_setup_device(qdev, &pdev->dev);
+	if (ret)
+		goto err_destroy;
+
 	entry = kzalloc_obj(*entry);
 	if (!entry) {
 		ret = -ENOMEM;
-		goto err_destroy;
+		goto err_teardown;
 	}
 
 	entry->pdev = pdev;
@@ -41,6 +81,8 @@ static int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_nod
 
 	return 0;
 
+err_teardown:
+	qda_cb_teardown_device(&pdev->dev);
 err_destroy:
 	of_platform_device_destroy(&pdev->dev, NULL);
 	return ret;
@@ -70,6 +112,7 @@ void qda_cb_unpopulate(struct qda_dev *qdev)
 
 	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
 		list_del(&entry->node);
+		qda_cb_teardown_device(&entry->pdev->dev);
 		of_platform_device_destroy(&entry->pdev->dev, NULL);
 		kfree(entry);
 	}
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 6ecb6a966f68..a99e23933f6b 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -39,13 +39,19 @@ static int qda_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
-static void qda_postclose(struct drm_device *dev, struct drm_file *file)
+static void qda_session_free(struct qda_session *session)
 {
-	struct qda_session *session = file->driver_priv;
+	if (session->assigned_iommu_dev)
+		qda_memory_manager_release_device(session->assigned_iommu_dev);
 
 	kfree(session);
 }
 
+static void qda_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	qda_session_free(file->driver_priv);
+}
+
 DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
 static const struct drm_driver qda_drm_driver = {
@@ -70,6 +76,26 @@ struct qda_dev *qda_alloc_device(struct device *dev)
 	return qdev;
 }
 
+int qda_init_device(struct qda_dev *qdev, int num_cbs)
+{
+	int ret;
+
+	qdev->iommu_mgr = devm_kzalloc(qdev->dev, sizeof(*qdev->iommu_mgr), GFP_KERNEL);
+	if (!qdev->iommu_mgr)
+		return -ENOMEM;
+
+	ret = qda_memory_manager_init(qdev->iommu_mgr, num_cbs);
+	if (ret)
+		drm_err(&qdev->drm_dev, "Failed to initialize memory manager: %d\n", ret);
+
+	return ret;
+}
+
+void qda_deinit_device(struct qda_dev *qdev)
+{
+	qda_memory_manager_exit(qdev->iommu_mgr);
+}
+
 int qda_register_device(struct qda_dev *qdev)
 {
 	int ret;
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 737232f7027f..c852d3b05310 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -13,6 +13,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include "qda_memory_manager.h"
 #include "qda_soc.h"
 
 /* Driver identification */
@@ -28,6 +29,8 @@ struct qda_session {
 	struct qda_dev *qda_dev;
 	/** @file: The drm_file this session belongs to */
 	struct drm_file *file;
+	/** @assigned_iommu_dev: Context bank owned by this session, or NULL */
+	struct qda_iommu_device *assigned_iommu_dev;
 };
 
 /**
@@ -45,6 +48,8 @@ struct qda_dev {
 	struct device *dev;
 	/** @cb_devs: Compute context-bank (CB) child devices */
 	struct list_head cb_devs;
+	/** @iommu_mgr: Registry of this device's context banks */
+	struct qda_memory_manager *iommu_mgr;
 	/** @soc_data: Per-SoC DSP integration parameters */
 	const struct qda_soc_data *soc_data;
 	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
@@ -66,6 +71,8 @@ static inline struct qda_dev *qda_dev_from_drm(struct drm_device *dev)
 struct qda_dev *qda_alloc_device(struct device *dev);
 
 /* Core device lifecycle */
+int qda_init_device(struct qda_dev *qdev, int num_cbs);
+void qda_deinit_device(struct qda_dev *qdev);
 int qda_register_device(struct qda_dev *qdev);
 
 #endif /* __QDA_DRV_H__ */
diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
new file mode 100644
index 000000000000..87e8d3485e81
--- /dev/null
+++ b/drivers/accel/qda/qda_memory_manager.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <drm/drm_print.h>
+#include "qda_drv.h"
+#include "qda_memory_manager.h"
+
+static void iommu_device_free(struct kref *ref)
+{
+	kfree(container_of(ref, struct qda_iommu_device, ref));
+}
+
+static struct qda_iommu_device *assign_available_device(struct qda_memory_manager *mem_mgr,
+							struct qda_session *session)
+{
+	struct qda_iommu_device *selected_dev = NULL;
+	int i;
+
+	for (i = 0; i < mem_mgr->max_devices; i++) {
+		struct qda_iommu_device *iommu_dev = mem_mgr->devices[i];
+
+		if (!iommu_dev)
+			continue;
+
+		guard(spinlock_irqsave)(&iommu_dev->lock);
+		if (!iommu_dev->assigned_session) {
+			iommu_dev->assigned_session = session;
+			selected_dev = iommu_dev;
+			kref_get(&selected_dev->ref);
+			break;
+		}
+	}
+
+	return selected_dev;
+}
+
+/**
+ * qda_memory_manager_assign_device() - Give a session a context bank
+ * @mem_mgr: Memory manager of the device
+ * @session: Session to assign a context bank to
+ *
+ * Assigns a free context bank to @session, which then owns it exclusively
+ * until the session is released. Does nothing if the session already has
+ * one.
+ *
+ * On success the session owns a reference on the context bank and must
+ * release it with qda_memory_manager_release_device().
+ *
+ * Return: 0 on success, -EBUSY if every context bank is already taken
+ */
+int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
+				     struct qda_session *session)
+{
+	struct qda_iommu_device *selected_dev;
+
+	guard(mutex)(&mem_mgr->assignment_lock);
+
+	if (session->assigned_iommu_dev)
+		return 0;
+
+	selected_dev = assign_available_device(mem_mgr, session);
+	if (!selected_dev) {
+		drm_dbg_driver(&session->qda_dev->drm_dev, "No context bank available\n");
+		return -EBUSY;
+	}
+
+	session->assigned_iommu_dev = selected_dev;
+
+	return 0;
+}
+
+/**
+ * qda_memory_manager_release_device() - Release a session's context bank
+ * @iommu_dev: Device previously obtained from qda_memory_manager_assign_device()
+ *
+ * Drops the session's reference and frees the context bank up for the next
+ * session.
+ */
+void qda_memory_manager_release_device(struct qda_iommu_device *iommu_dev)
+{
+	scoped_guard(spinlock_irqsave, &iommu_dev->lock)
+		iommu_dev->assigned_session = NULL;
+
+	kref_put(&iommu_dev->ref, iommu_device_free);
+}
+
+/**
+ * qda_memory_manager_register_device() - Add a context bank to the registry
+ * @mem_mgr: Memory manager of the device
+ * @iommu_dev: Context bank to register
+ *
+ * Return: 0 on success, -ENOSPC if the registry is full
+ */
+int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
+				       struct qda_iommu_device *iommu_dev)
+{
+	int i;
+
+	spin_lock_init(&iommu_dev->lock);
+	kref_init(&iommu_dev->ref);
+	iommu_dev->assigned_session = NULL;
+
+	guard(mutex)(&mem_mgr->assignment_lock);
+	for (i = 0; i < mem_mgr->max_devices; i++) {
+		if (!mem_mgr->devices[i]) {
+			mem_mgr->devices[i] = iommu_dev;
+			return 0;
+		}
+	}
+
+	return -ENOSPC;
+}
+
+/**
+ * qda_memory_manager_unregister_device() - Remove a context bank
+ * @mem_mgr: Memory manager of the device
+ * @iommu_dev: Context bank to unregister
+ *
+ * Takes the registry's reference away. The object itself stays alive until
+ * any session still holding it is released.
+ */
+void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
+					  struct qda_iommu_device *iommu_dev)
+{
+	int i;
+
+	scoped_guard(mutex, &mem_mgr->assignment_lock) {
+		for (i = 0; i < mem_mgr->max_devices; i++) {
+			if (mem_mgr->devices[i] == iommu_dev) {
+				mem_mgr->devices[i] = NULL;
+				break;
+			}
+		}
+	}
+
+	kref_put(&iommu_dev->ref, iommu_device_free);
+}
+
+/**
+ * qda_memory_manager_init() - Initialise the context bank registry
+ * @mem_mgr: Memory manager to initialise
+ * @max_devices: Number of context banks to make room for
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_memory_manager_init(struct qda_memory_manager *mem_mgr, int max_devices)
+{
+	if (max_devices <= 0)
+		return -EINVAL;
+
+	mem_mgr->devices = kcalloc(max_devices, sizeof(*mem_mgr->devices), GFP_KERNEL);
+	if (!mem_mgr->devices)
+		return -ENOMEM;
+
+	mem_mgr->max_devices = max_devices;
+	mutex_init(&mem_mgr->assignment_lock);
+
+	return 0;
+}
+
+/**
+ * qda_memory_manager_exit() - Tear down the context bank registry
+ * @mem_mgr: Memory manager to tear down
+ *
+ * Context banks are unregistered as their devices are destroyed, so the
+ * registry is expected to be empty by the time this runs.
+ */
+void qda_memory_manager_exit(struct qda_memory_manager *mem_mgr)
+{
+	kfree(mem_mgr->devices);
+	mem_mgr->devices = NULL;
+	mem_mgr->max_devices = 0;
+	mutex_destroy(&mem_mgr->assignment_lock);
+}
diff --git a/drivers/accel/qda/qda_memory_manager.h b/drivers/accel/qda/qda_memory_manager.h
new file mode 100644
index 000000000000..13354158674b
--- /dev/null
+++ b/drivers/accel/qda/qda_memory_manager.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_MEMORY_MANAGER_H__
+#define __QDA_MEMORY_MANAGER_H__
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+struct qda_dev;
+struct qda_session;
+
+/**
+ * struct qda_iommu_device - A context bank available for memory allocation
+ *
+ * Wraps one compute context bank device. Each one is exclusively owned by at
+ * most one session at a time, which is what keeps the buffers of one session
+ * out of the address space of another.
+ *
+ * The object outlives its registration: a session keeps a reference through
+ * @ref, so the context bank can be unregistered while a session still holds
+ * it.
+ */
+struct qda_iommu_device {
+	/** @dev: The context bank device to allocate from */
+	struct device *dev;
+	/** @qdev: Back-pointer to the parent QDA device */
+	struct qda_dev *qdev;
+	/** @assigned_session: Session owning this device, or NULL if free */
+	struct qda_session *assigned_session;
+	/** @ref: Reference count controlling when the object is freed */
+	struct kref ref;
+	/** @lock: Protects @assigned_session */
+	spinlock_t lock;
+};
+
+/**
+ * struct qda_memory_manager - Registry of the device's context banks
+ *
+ * Holds every context bank of one QDA device and hands them out to sessions,
+ * one each.
+ */
+struct qda_memory_manager {
+	/** @devices: Array of registered context banks, sized to @max_devices */
+	struct qda_iommu_device **devices;
+	/** @max_devices: Capacity of the @devices array */
+	int max_devices;
+	/** @assignment_lock: Protects registration and assignment */
+	struct mutex assignment_lock;
+};
+
+int qda_memory_manager_init(struct qda_memory_manager *mem_mgr, int max_devices);
+void qda_memory_manager_exit(struct qda_memory_manager *mem_mgr);
+
+int qda_memory_manager_register_device(struct qda_memory_manager *mem_mgr,
+				       struct qda_iommu_device *iommu_dev);
+void qda_memory_manager_unregister_device(struct qda_memory_manager *mem_mgr,
+					  struct qda_iommu_device *iommu_dev);
+
+int qda_memory_manager_assign_device(struct qda_memory_manager *mem_mgr,
+				     struct qda_session *session);
+void qda_memory_manager_release_device(struct qda_iommu_device *iommu_dev);
+
+#endif /* __QDA_MEMORY_MANAGER_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 78b5f31974c1..2c9d79937b10 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -59,6 +59,18 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	drm_dev_unplug(&qdev->drm_dev);
 	qdev->rpdev = NULL;
 	qda_cb_unpopulate(qdev);
+	qda_deinit_device(qdev);
+}
+
+static int qda_count_cb_nodes(struct device_node *parent_node)
+{
+	int count = 0;
+
+	for_each_available_child_of_node_scoped(parent_node, child)
+		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb"))
+			count++;
+
+	return count;
 }
 
 static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
@@ -80,14 +92,24 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
 		return ret;
 	}
 
-	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
+	ret = qda_init_device(qdev, qda_count_cb_nodes(rpdev->dev.of_node));
 	if (ret)
 		return ret;
 
+	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
+	if (ret)
+		goto err_deinit;
+
 	ret = qda_register_device(qdev);
 	if (ret)
-		qda_cb_unpopulate(qdev);
+		goto err_unpopulate;
 
+	return 0;
+
+err_unpopulate:
+	qda_cb_unpopulate(qdev);
+err_deinit:
+	qda_deinit_device(qdev);
 	return ret;
 }
 

-- 
2.34.1

