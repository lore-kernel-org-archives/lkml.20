Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571844;
	b=gJCve0yn0hSECMCZG/xs9d1/TFwOnco/WAbJqw+6yRk4TWE/C7cw7VmBt+xaihtqRU2Q
	 EIVev256O7LGfS5rR5bvDy8WW+KbvQdFG2Q8KfSsQvqcilFBqEA0yAF8/w3qB01/dAIDA
	 xo6Sp/1aCIqG3bKSwqXHEWUgCFvVFSwiRA+8e8gxVWEJiIjieXqDZIl0jm+lR9Tu24s7b
	 uPnGCpTeloSMTqkK2Ab/H4k9WTFTRfKO699WASO1vS6Bkdp8ccxqFsumDZdQvCWxSfecu
	 TNjLfB7NouLWeEQCge4MbbkomfTBE/K5YLNfgOSgduYjRTb2kE8hcaLe5OCrQG0Glrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UKkKGpQfuAsSbYZ0H+ZknwKr8tAezXYRg/MOMWChtDQ=;
	b=1/Nk2vqhHQa8xSF1Xm00n9/OB32/GOyPJ2nAtXhx6WhYY/XicXkGQG9PjPqCEShEXxRk
	 eJGEjT9ABZ9TWE3SWZ8n5w01sZ8LykiRpZP1jPpxVNf8FiJSgUD2Kn5JWWW5kzOPWIGv+
	 oJhUzQ2VNe4GRMuTFHS2XHZdBYE4gkoUDvXbp9kqtN9MYtbtmNy3M/agdxqj6/wChLjJO
	 6udEAZ/ln6VI0xoWdvle1RvLJG49Il6ZWAbQ8tOZPJUQkD96syM6orCUlPhMxe94na0+8
	 95BvwxhQ4oLQOnyYvy+N1dBHxf4f2YjcoOCPwM+Ts2LWJBp05Pn8wl2IlYIZh90j6RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI48dMOY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inXF5HQr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83B8606F694
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A83B8606F694
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI48dMOY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inXF5HQr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK3Vi2377056
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKkKGpQfuAsSbYZ0H+ZknwKr8tAezXYRg/MOMWChtDQ=; b=pI48dMOYBrvzwYPt
	NiL8NSUkIAawy3OW1oUuVbKNJy9hF2HCjM6ybrLScyGdFEys22ZXSQ47qn6V0OLL
	27zl2cfVxrpdEaKpsf+psU7iKACxFztn/N3yJv3epMELQg7kFQmGKbYY9ULl7dP8
	mn5XY4d7WsdNV/WE24pCuCOxxYS5OToar4AIxuBuU2hnGmuuNgp+rMBjiyHU+Q5A
	yikdk14vFIqyj1kxCefATsb2vFTOL+R7827cIftgvsqtNOWl3oa9F5TAGZSyip/x
	h2rTynTWSqzYKjf0gq1zuMMvYd8lZ/6XaEAiMAMEEmPmh3mmaHbNWcwBGoTOPWq/
	/xO0aA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6me5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:24:02 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so1847666c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571841; x=1794176641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKkKGpQfuAsSbYZ0H+ZknwKr8tAezXYRg/MOMWChtDQ=;
        b=inXF5HQrOQD83mmCW5YcVFjirqNgPFnHN+iBDY/EejyaLqjnTfNiTa8z3fac8maPEm
         NUqV4X9ljnJckakwueZRFcsTRwUJWHsWQGEu/3HWBjxJkC2dn+8EfRHOxNVttn9jF5ts
         KHdgbMD3eHeDeHdmjLRZk4CwX4ERNdTJr33lorpbso+l7Zz8FtIVH3uRUNlBttAZFOM7
         6KTk+bd2oDDOrakVJxOIqhWSvjguSbH0vNBSFwQhRHSeYLl4HRA60K1WNUu093GibAn3
         EoqH7BoMJgeZ8VRdiv9aonsHGJGXqBIjQrPMNiAOTBVEa8hhHfisHXwRydv99Rk/ZFb7
         nk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571841; x=1794176641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKkKGpQfuAsSbYZ0H+ZknwKr8tAezXYRg/MOMWChtDQ=;
        b=rV78IhxRBvOA7fmqhnYUZTytQ0ysp23LNK/SGfHurQqX1BGT3bgw5j7KGYDg6PPpwY
         9zjEYyU3TffdJ+ATY9oj2Fk7wHwTdQN0jiQGY3cuCOiFJqD0WZhOTNwuUdLd5PA3c4Ak
         ibHj925OftW7bNdHOspY7AJ1x1NEMtaDZo00MQTfaiyYF6FvGv+kCOc0uskAekH6vI2P
         8XGjaDf7nmCNqJv7n2b6XOBkzsy91/hgjnUMTHFu5DypuqmWiomEm+AXypfgGDSsl7ro
         ET8UlzTnG6vDkUPkti4o1uRlsa8fRQaJruhZlIWG2oB8fyFSVqF19L6+4BhFdNXKqR+/
         a4nQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3PAFUeMKU/bNJJEsBVA6ePI9L7AlhrF8AjIz2zPjOK3ObhMPxIOuiH3guh47wDYoDvutuqFO6VdDBqVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvdwcP0et0ZcUl3bWxvnb+NWVUuklcN6LC5nyKKuGzujDYDu40
	aleqqcGCSchMbUDR1Evi+FjshCyoPFJyTMNfErhIuMa+P6+uXeo0NUnTCHUNwkWEc/1q+xZw35w
	Gr55QMN29f96pnO6nqxY17FSf4WB5RrB2oB52mhMoiCoU2Tx4W8lsaBhiyruzZJMtnFY=
X-Gm-Gg: AYBFou2Q3IYIH6exrKw8EaTQ00ti2SdhtQp8PrPdB7LaZEWJoso4PV2htmSBQGTa7J1
	RfjaniG2O5NJCacBv2nJhEWyZJzX5+8yvoEG/meSQMeLxCii9Q87GBLr/nC0+Vehzgs+PL0v+WE
	gerAAaezpAfWHLsvaRZid7ASVl/GI6CEtGGWSiOu870ilYwufuxZUh/HEECDZPMkO7EU2+ZRx8j
	PI6otj/B7eL9vWN4Wc3jtxz4OKMWXBMQUWsz2Ntyu1y1235ObnnKTV2ojidMAYMWmxmBX5EzAa9
	wtrtU2KQlZtKv8LGWcDbYMdTrdOUEBVu/7fbIzhNhJbvpGc/WOW8hqHBZ/tRjqYiTbIW6OfEnG3
	vNelwwQ6ylcbLDSislTJuqfQ4cVOuMk5HgLDHgPPZz/vxq6sBaS0PIeV4CMjxOLGPIWp45Hztja
	F1iTKv4A==
X-Received: by 2002:a05:7022:5f02:b0:1a0:e3e2:22a3 with SMTP id a92af1059eb24-1ac5e323588mr10959444c88.31.1793571841067;
        Sun, 01 Nov 2026 14:24:01 -0800 (PST)
X-Received: by 2002:a05:7022:5f02:b0:1a0:e3e2:22a3 with SMTP id a92af1059eb24-1ac5e323588mr10959376c88.31.1793571840324;
        Sun, 01 Nov 2026 14:24:00 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:23:59 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:27 +0530
Subject: [PATCH v4 14/25] accel/qda: Add invocation through the legacy
 FastRPC shim
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
Message-Id: <20261102-v4-v4-14-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=14703;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=21l63ZVWUFF26+ylulnT7ztx0HSiNTEOlwqfJOHwlr4=;
 b=MHk2ESut0MYi0BIErN+G/x7CEU+0cU1k1dxJECGmJbWRBSGxaZZClI7rokj6OPiHRer5C0k2O
 sA3cNYgB9JKA9Ss9jMFLjzrKnyT/KP1KT4Bl8NEUTJAjlApvU91EqWp
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: L01i1X5xNDEIiOuO37ec7KxNPyjN-Zjc
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae7bc02 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=v0r2gR-24sa0sj8xi20A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: L01i1X5xNDEIiOuO37ec7KxNPyjN-Zjc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX8jreXwwD3lbG
 9C2koJZy5RPWmUy0MC65mlry5fugrIaVbEZw/NrvK/dREXmGfaKEU7ifP/FyRxhIawxCiajRxK1
 5LhGe9bqSSEVX/V8fLPxhFPusWKJaYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXz7Kho0pYelSy
 7JJDyAtErU7ch3RK/Z1ElgD8zO7Pt7iEClizaUQME6tN0N1+UKllJpC+26MT00sIx9pBBilHbpN
 RKMN3VD8AiegGXzg3Wg2NeYLoKUExtNezzlj90BVhxCpOX8Lv8/8uX8uJvuFF6zlTm/AoROrIrC
 XKMWYnPDBST/NZbNrpWtBacf02b3JsaSxzY/YIUynOJTHhg4i/CFKYjdI6d6749OotoFFB27BHD
 nNWum1fxDDmVPLW6nN0rhwXV14BzMWvvbBtREO3uq+p60S3W+CeshoNZZGuUlHJcjXNSh20DCyX
 94Ow1roTqicliLvR85YKqtrOCjwXiUkZB8p+CPo/qcy6TiinPpT+79h3DnYiDUCeUID1riEPCv3
 VuVtrgLCCbap5vVLrXme64d3NovlpydaFB082jwvFQmJdpWRc/l1TgyQvjLOaTwbPT2Bsay8APf
 ZG2E2Y7LxQNHAaHvd5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

Let applications written for the /dev/fastrpc-* interface run methods
on the DSP, by converting their arguments into what the invocation code
takes and handing them over.

A legacy argument is a user pointer, a length and a file descriptor for
the buffer it lives in. The shim imports each descriptor into the
session's context bank, so the DSP can reach the buffer, and passes the
resulting objects along with the pointers and lengths. A session the
shim created has no handle table, so these arguments cannot be named by
handle the way the accel interface does; the invocation takes the
already-resolved objects instead. Ownership of each object moves into
the invocation, so the shim drops its references itself only if
importing a later argument fails.

The pointer a legacy caller passes is an address in its own mapping of
the buffer, and the interface predates GEM handles and cannot change, so
the offset into the buffer is recovered from that mapping. Unlike
handle-named arguments, these are not checked against the size of the
buffer they name.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_fastrpc.c      | 151 +++++++++++++++++++++++++++++++++--
 drivers/accel/qda/qda_fastrpc.h      |  19 +++++
 drivers/accel/qda/qda_fastrpc_shim.c |  87 ++++++++++++++++++++
 drivers/accel/qda/qda_legacy_ops.c   |   8 ++
 drivers/accel/qda/qda_legacy_ops.h   |   4 +
 5 files changed, 262 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 3a1959e2c53e..693dd6f035d2 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -55,6 +55,22 @@ static void setup_pages_from_gem_obj(struct qda_gem_obj *qda_gem_obj,
 	pages->size = qda_gem_obj->size;
 }
 
+static int calculate_vma_offset(u64 user_ptr, u64 *offset)
+{
+	struct vm_area_struct *vma;
+	int ret = -EFAULT;
+
+	mmap_read_lock(current->mm);
+	vma = find_vma(current->mm, user_ptr);
+	if (vma && vma->vm_start <= user_ptr) {
+		*offset = (user_ptr & PAGE_MASK) - vma->vm_start;
+		ret = 0;
+	}
+	mmap_read_unlock(current->mm);
+
+	return ret;
+}
+
 static u64 calculate_page_aligned_size(u64 addr, u64 len)
 {
 	u64 pg_start = (addr & PAGE_MASK) >> PAGE_SHIFT;
@@ -286,23 +302,45 @@ struct qda_fastrpc_invoke_ctx *qda_fastrpc_context_alloc(struct qda_dev *qdev)
 }
 
 /*
- * Resolve the address of an in/out buffer argument. The buffer is named by a
- * GEM handle, looked up in the calling session's own handle table, so a
- * session cannot name another's buffer. The offset and length come from user
- * space and are checked against the buffer's real size: a region described as
- * larger than its buffer would let the DSP read and write past the end of it,
- * into whatever else is mapped in the same context bank.
+ * Resolve the address of an in/out buffer argument. The buffer is either a
+ * GEM object the legacy shim already resolved into ctx->gem_objs[i], or a GEM
+ * handle looked up in the calling session's own handle table. For a handle,
+ * the offset and length come from user space and are checked against the
+ * buffer's real size: a region described as larger than its buffer would let
+ * the DSP read and write past the end of it, into whatever else is mapped in
+ * the same context bank.
  */
 static int process_msg_buffer(struct qda_fastrpc_invoke_ctx *ctx, int i,
 			      union qda_remote_arg *rpra,
 			      struct qda_phy_page *pages)
 {
 	u64 len = ctx->args[i].length;
-	struct qda_gem_obj *qda_gem_obj;
 	struct drm_gem_object *gem_obj;
+	struct qda_gem_obj *qda_gem_obj;
 	u64 unaligned_addr;
+	u64 vma_offset = 0;
 	int err;
 
+	if (ctx->gem_objs[i]) {
+		/*
+		 * The legacy ABI predates GEM handles, so the offset field
+		 * holds an address in the caller's own mapping of the buffer,
+		 * or 0 if it has none, meaning the start of the buffer.
+		 */
+		qda_gem_obj = to_qda_gem_obj(ctx->gem_objs[i]);
+		if (ctx->args[i].offset) {
+			err = calculate_vma_offset(ctx->args[i].offset, &vma_offset);
+			if (err)
+				return err;
+		}
+
+		rpra[i].buf.addr = ctx->args[i].offset;
+		pages[i].addr = qda_gem_obj->dma_addr + vma_offset;
+		pages[i].size = calculate_page_aligned_size(ctx->args[i].offset, len);
+
+		return 0;
+	}
+
 	if (!ctx->args[i].handle)
 		return -EINVAL;
 
@@ -551,6 +589,105 @@ int qda_fastrpc_invoke_common(struct qda_dev *qdev, struct qda_fastrpc_invoke_ct
 	return 0;
 }
 
+/**
+ * qda_fastrpc_invoke_legacy() - Perform a dynamic invocation on behalf of the legacy shim
+ * @qdev: Device to invoke on
+ * @session: Legacy session (no backing drm_file)
+ * @handle: Remote handle to invoke on the DSP
+ * @sc: FastRPC scalars value encoding the number of in/out buffers
+ * @legacy_args: Kernel-side argument array, one entry per QDA_REMOTE_SCALARS_LENGTH(sc)
+ *
+ * Unlike the accel UAPI path, the argument descriptors and any backing GEM
+ * objects already live in kernel memory: the shim has already resolved
+ * every fd-backed argument via its own import path, since a legacy session
+ * has no GEM handle table to resolve a handle-based argument against.
+ * Ownership of each @legacy_args[i].obj reference transfers to this function,
+ * on failure as well as on success.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_fastrpc_invoke_legacy(struct qda_dev *qdev, struct qda_session *session,
+			      u32 handle, u32 sc, struct qda_legacy_invoke_arg *legacy_args)
+{
+	struct qda_fastrpc_invoke_ctx *ctx;
+	struct drm_qda_fastrpc_invoke_args *args;
+	u32 nscalars;
+	int err;
+	int i;
+
+	nscalars = QDA_REMOTE_SCALARS_LENGTH(sc);
+
+	/*
+	 * An fd naming a buffer another session exported resolves to the
+	 * original object, still mapped in that session's context bank, so
+	 * the same check as for a handle applies.
+	 */
+	for (i = 0; i < nscalars; ++i) {
+		if (legacy_args[i].obj &&
+		    to_qda_gem_obj(legacy_args[i].obj)->iommu_dev != session->assigned_iommu_dev) {
+			err = -EACCES;
+			goto err_put_legacy_objs;
+		}
+	}
+
+	ctx = qda_fastrpc_context_alloc(qdev);
+	if (IS_ERR(ctx)) {
+		err = PTR_ERR(ctx);
+		goto err_put_legacy_objs;
+	}
+
+	/* Dropped by qda_fastrpc_context_free(), as for the accel UAPI path */
+	qda_session_get(session);
+	ctx->session = session;
+	ctx->handle = handle;
+	ctx->sc = sc;
+
+	ctx->nbufs = QDA_REMOTE_SCALARS_INBUFS(sc) + QDA_REMOTE_SCALARS_OUTBUFS(sc);
+	if (nscalars) {
+		args = kzalloc_objs(*args, nscalars);
+		if (!args) {
+			err = -ENOMEM;
+			goto err_put_legacy_objs_ctx;
+		}
+
+		ctx->gem_objs = kzalloc_objs(*ctx->gem_objs, nscalars);
+		if (!ctx->gem_objs) {
+			kfree(args);
+			err = -ENOMEM;
+			goto err_put_legacy_objs_ctx;
+		}
+
+		for (i = 0; i < nscalars; ++i) {
+			args[i].offset = legacy_args[i].ptr;
+			args[i].length = legacy_args[i].length;
+			/* process_dma_handle() skips handle args whose handle is 0 */
+			args[i].handle = (i >= ctx->nbufs && legacy_args[i].obj) ?
+					 (u32)legacy_args[i].fd : 0;
+			ctx->gem_objs[i] = legacy_args[i].obj;
+		}
+
+		ctx->args = args;
+	}
+
+	ctx->nscalars = nscalars;
+
+	err = qda_fastrpc_invoke_common(qdev, ctx);
+
+	kref_put(&ctx->refcount, qda_fastrpc_context_free);
+
+	return err;
+
+err_put_legacy_objs_ctx:
+	kref_put(&ctx->refcount, qda_fastrpc_context_free);
+err_put_legacy_objs:
+	/* The context never took the objects, so release them here */
+	for (i = 0; i < nscalars; ++i)
+		if (legacy_args[i].obj)
+			drm_gem_object_put(legacy_args[i].obj);
+
+	return err;
+}
+
 /*
  * INVOKE_DYNAMIC: the argument descriptors are supplied by user space, which
  * is also responsible for having imported every buffer to a GEM handle.
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 61f80c64e6d2..3243bd1065c6 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -198,6 +198,23 @@ struct qda_fastrpc_invoke_ctx {
 	struct work_struct put_work;
 };
 
+/**
+ * struct qda_legacy_invoke_arg - Kernel-side invoke argument for the legacy shim
+ *
+ * Built by the FastRPC compatibility shim from a legacy fastrpc_invoke_args
+ * entry; @obj is NULL for an argument with no backing fd.
+ */
+struct qda_legacy_invoke_arg {
+	/** @ptr: Argument pointer (user virtual address) */
+	u64 ptr;
+	/** @length: Length of the argument data in bytes */
+	u64 length;
+	/** @obj: Pre-resolved GEM object for an fd-backed argument, or NULL */
+	struct drm_gem_object *obj;
+	/** @fd: Legacy fd, forwarded as the DSP-visible handle for handle arguments */
+	s32 fd;
+};
+
 struct qda_fastrpc_invoke_ctx *qda_fastrpc_context_alloc(struct qda_dev *qdev);
 void qda_fastrpc_context_free(struct kref *ref);
 void qda_fastrpc_cleanup_handlelist(struct qda_fastrpc_invoke_ctx *ctx);
@@ -207,5 +224,7 @@ int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 int qda_fastrpc_invoke_pack(struct qda_fastrpc_invoke_ctx *ctx, struct qda_msg *msg);
 int qda_fastrpc_invoke_common(struct qda_dev *qdev, struct qda_fastrpc_invoke_ctx *ctx);
 void qda_fastrpc_flush_pending(struct qda_dev *qdev);
+int qda_fastrpc_invoke_legacy(struct qda_dev *qdev, struct qda_session *session,
+			      u32 handle, u32 sc, struct qda_legacy_invoke_arg *legacy_args);
 
 #endif /* __QDA_FASTRPC_H__ */
diff --git a/drivers/accel/qda/qda_fastrpc_shim.c b/drivers/accel/qda/qda_fastrpc_shim.c
index 25f5c242efde..03fce990ccdb 100644
--- a/drivers/accel/qda/qda_fastrpc_shim.c
+++ b/drivers/accel/qda/qda_fastrpc_shim.c
@@ -15,8 +15,10 @@
 #include <linux/string.h>
 #include <linux/uaccess.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
 #include <uapi/misc/fastrpc.h>
 #include "qda_drv.h"
+#include "qda_fastrpc.h"
 #include "qda_legacy_ops.h"
 
 /* State of one open /dev/fastrpc-* file */
@@ -50,6 +52,25 @@ struct qda_shim_dev {
 
 static const struct file_operations qda_shim_fops;
 
+/* A negative @fd means the argument has no buffer, which is not an error */
+static struct drm_gem_object *shim_import_fd(struct qda_session *session, s32 fd)
+{
+	struct drm_gem_object *obj;
+	struct dma_buf *dmabuf;
+
+	if (fd < 0)
+		return NULL;
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf))
+		return ERR_CAST(dmabuf);
+
+	obj = qda_legacy_ops_table.import_dmabuf(session, dmabuf);
+	dma_buf_put(dmabuf);
+
+	return obj;
+}
+
 static int qda_shim_open(struct inode *inode, struct file *file)
 {
 	struct qda_shim_node *snode = container_of(file->private_data, struct qda_shim_node,
@@ -120,11 +141,77 @@ static long qda_shim_alloc_dma_buf(struct qda_shim_file *sf, void __user *argp)
 	return 0;
 }
 
+static long qda_shim_invoke(struct qda_shim_file *sf, void __user *argp)
+{
+	struct qda_legacy_invoke_arg *largs;
+	struct fastrpc_invoke_args *uargs;
+	struct fastrpc_invoke args;
+	u32 nargs;
+	int err;
+	int i;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	nargs = QDA_REMOTE_SCALARS_LENGTH(args.sc);
+	if (!nargs)
+		return qda_legacy_ops_table.invoke(sf->session, args.handle, args.sc, NULL);
+
+	uargs = kcalloc(nargs, sizeof(*uargs), GFP_KERNEL);
+	if (!uargs)
+		return -ENOMEM;
+
+	if (copy_from_user(uargs, u64_to_user_ptr(args.args), nargs * sizeof(*uargs))) {
+		kfree(uargs);
+		return -EFAULT;
+	}
+
+	largs = kcalloc(nargs, sizeof(*largs), GFP_KERNEL);
+	if (!largs) {
+		kfree(uargs);
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < nargs; ++i) {
+		struct drm_gem_object *obj;
+
+		largs[i].ptr = uargs[i].ptr;
+		largs[i].length = uargs[i].length;
+		largs[i].fd = uargs[i].fd;
+
+		obj = shim_import_fd(sf->session, uargs[i].fd);
+		if (IS_ERR(obj)) {
+			err = PTR_ERR(obj);
+			goto err_put_objs;
+		}
+		largs[i].obj = obj;
+	}
+
+	kfree(uargs);
+
+	/* Takes ownership of every largs[i].obj, whether or not it succeeds */
+	err = qda_legacy_ops_table.invoke(sf->session, args.handle, args.sc, largs);
+	kfree(largs);
+
+	return err;
+
+err_put_objs:
+	while (i-- > 0)
+		if (largs[i].obj)
+			drm_gem_object_put(largs[i].obj);
+	kfree(largs);
+	kfree(uargs);
+
+	return err;
+}
+
 static long qda_shim_dispatch(struct qda_shim_file *sf, unsigned int cmd, void __user *argp)
 {
 	switch (cmd) {
 	case FASTRPC_IOCTL_ALLOC_DMA_BUFF:
 		return qda_shim_alloc_dma_buf(sf, argp);
+	case FASTRPC_IOCTL_INVOKE:
+		return qda_shim_invoke(sf, argp);
 	default:
 		/*
 		 * Includes FASTRPC_IOCTL_FREE_DMA_BUFF, which the driver this
diff --git a/drivers/accel/qda/qda_legacy_ops.c b/drivers/accel/qda/qda_legacy_ops.c
index 9639ea84b200..74ee4995350e 100644
--- a/drivers/accel/qda/qda_legacy_ops.c
+++ b/drivers/accel/qda/qda_legacy_ops.c
@@ -8,6 +8,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
 #include "qda_drv.h"
+#include "qda_fastrpc.h"
 #include "qda_gem.h"
 #include "qda_legacy_ops.h"
 #include "qda_prime.h"
@@ -71,10 +72,17 @@ static struct drm_gem_object *legacy_import_dmabuf(struct qda_session *session,
 	return qda_prime_import_dmabuf(&session->qda_dev->drm_dev, session, dmabuf);
 }
 
+static int legacy_invoke(struct qda_session *session, u32 handle, u32 sc,
+			 struct qda_legacy_invoke_arg *args)
+{
+	return qda_fastrpc_invoke_legacy(session->qda_dev, session, handle, sc, args);
+}
+
 const struct qda_legacy_ops qda_legacy_ops_table = {
 	.session_create = legacy_session_create,
 	.session_destroy = legacy_session_destroy,
 	.alloc_dmabuf = legacy_alloc_dmabuf,
 	.import_dmabuf = legacy_import_dmabuf,
+	.invoke = legacy_invoke,
 };
 EXPORT_SYMBOL_FOR_MODULES(qda_legacy_ops_table, "qda_fastrpc_shim");
diff --git a/drivers/accel/qda/qda_legacy_ops.h b/drivers/accel/qda/qda_legacy_ops.h
index 76b80dc87a4b..ba1ce3c0a22b 100644
--- a/drivers/accel/qda/qda_legacy_ops.h
+++ b/drivers/accel/qda/qda_legacy_ops.h
@@ -11,6 +11,7 @@
 struct dma_buf;
 struct drm_gem_object;
 struct qda_dev;
+struct qda_legacy_invoke_arg;
 struct qda_session;
 
 /**
@@ -34,6 +35,9 @@ struct qda_legacy_ops {
 	/** @import_dmabuf: Map a DMA-BUF into a session's context bank */
 	struct drm_gem_object *(*import_dmabuf)(struct qda_session *session,
 						struct dma_buf *dmabuf);
+	/** @invoke: Run a method on the DSP; takes ownership of each @args[i].obj */
+	int (*invoke)(struct qda_session *session, u32 handle, u32 sc,
+		      struct qda_legacy_invoke_arg *args);
 };
 
 extern const struct qda_legacy_ops qda_legacy_ops_table;

-- 
2.34.1

