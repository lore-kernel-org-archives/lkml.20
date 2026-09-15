Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB92D4CDA37
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509632; cv=none; b=PMwBcPgooayF78RMuhEo5cJEjU/DWkgYx2mc/jefJ7dm2V4O1nN5F7SFbzfZnMTkbnI3qMXNiSdTfXoiqODHWC5pzdTfy3d2tRxCddbU6k3CW4GKTpgIlTvbJdARbtpv+dWX6wGGawasdOXKkGO4YAcQksMRLXJxMKqbT2Im2Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509632; c=relaxed/simple;
	bh=W4KJ4/cRaUhT4aJPGYQieyDy2CUuHLjA+S4NcGfr9rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+1eF/AV4t7zW1QHy2MC8rpydFe7TNeSTsQ6Nzqd+37b5EU17YqcKsVDyobkvR3ss/7kJ/c3sItRAvFSODUIZdRRVT5JctWMBpeKHiJqpWVPncZi8B9dFmAcCW1k5BAumYSfu9245/bAY4cNUktiMLhB7n7v1Wmi5b9crTPB0WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsOLdaCJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AacoGLv7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsOLdaCJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AacoGLv7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZJu9080544
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtVMWvUgXxinKbJf6CgTIuBPkLjW6igzz8lufb5j0eA=; b=JsOLdaCJawHWoth9
	rXp4rVyWVsW+0tWEyeRNr+wWV0PryHx/0O46w3CadQRwtcQJ5S8GdmAlP1ggGzqe
	WjimjKzmUhX5idJZPIAMiSh7zbkvUTUBLRRR2O7YRBk3XpYbD448EiSugnI3akFy
	uL8hXqbLcaYedeZXooYt4re1S6n6MNU2A9M7q/3H7xrum49FKj2NENW65eVBWfp0
	oxKDub8FhtNVJBP7CtHctR6zxsjFkDO1Y5YE0BAuaIaf3Nr9i36Rd/EMY/SkMXUl
	p42BD1jmdWtqitRIghMzOWNirYHtqkZXidjg8Y3yKJku8tv1LfXTtuFPcaMwO4fl
	ZBk0xA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageh320-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:00:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b8eb84685so1458774a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789509611; x=1790114411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtVMWvUgXxinKbJf6CgTIuBPkLjW6igzz8lufb5j0eA=;
        b=AacoGLv7hYGJ7l3H3wvF4XMUmiDB5Ld+PXP21VA8g8ErGb9uYxHeYdj7uwEOQCEro2
         vnRwnt/Ay981yaA8NVXfdpV2qBxukSL1dBVls3WmkgkluyrSOWJjps4vkLLnpweUvLE2
         bCWf5EJG/5Qrk01EvfhETw2KrPR85bHzBaglj8uHQe/rWP3Bdrk4C4v6isGsjCvPEI8w
         5hxWCuwveoE8DkF5cCciH2Y22a8cEJInX0d9tihl5dJ1+qeWKO0wUbIR5yN6ITqf4a0a
         llpw5dyZNYwsxPNMhBdtLoxgz/y5JdqsMreDjMqss0raZgzwB5hMRgXw+1hDc+uEGOWq
         xd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509611; x=1790114411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtVMWvUgXxinKbJf6CgTIuBPkLjW6igzz8lufb5j0eA=;
        b=EzsHndEJeswzgxcZFTFvc3d2VCkWaX/GWw5/9kCIwhSuE6kf9GUEqKkB5cX++ZMpBu
         ZMrmkZKnmSAw1pbOAxyZ8G5UgpX07Q5QMiNRFQdbgsarQZwSMhtNxAwLMwuwwkwiFwLD
         vsxmCFfT34tJY54WM/p+9xVkm1AAB4EvCo8VKJoh+PbFPoxC78m+Nehyfdy77jw2W7xE
         9pZmQ219F1dORqMlrmyl7ozkDVSo3clOpL3vAEWojyIvtfFcycv9ls5FWD5UpjYyej5v
         Uil5+Azcze4WnzHSeE7v7tIPy8YU2rvcn5K0sZhcyJ8Tm/zlyzgn0CcIi/bWof9NV8wJ
         PMDQ==
X-Forwarded-Encrypted: i=1; AKwUvByjqul2f7DJ00bFp1Yqc67Y6tUt+6UuY74VnGgqWuProl4WKJdWBs+FbaMIlSAlwh4cYsA8mdIyGWPfnBA=@vger.kernel.org
X-Gm-Message-State: AFuF++mECSasgWn++rPDhL8i9/u7S2o7c9wtP0Y985GY/jcRNrM96XYs
	MX2kg69vw2usTw10rHOfRphJ1B+9WNf7a8gUmrF/V4GEVbSfS5N9FZ9IZvBCY1PlvNvz2loN6IL
	v5HmZU23skE3euu8DSj6irAZEdQhP0uxlB9OlmAD9GdaOlegkruwp6kR+CFkFapGNyW8=
X-Gm-Gg: AYBFou2tQu0kvCh/Y8R7U/vknaW8FWRJvM9TZD4FpJOaA/vpVePMxPgs/bv3sZ0OOmZ
	TOq8BPNwF7iXWNfuUTS8Rarhio1zMQ8kr0bjeHFIHoQt+CYROpOHffaqrj1v+hSmKS59bpVnNK1
	mR0XK9YE2Q0dzn9VzkscnPKeKkPWgrFYea7ETIxjJlZ5FrFEqJYYeVbb7kvvVPyjdESU5217yYj
	H1P4On+ppknXxXRydRg97MLSFcotehHtJ62N/oAALn5Gc67PAy7FXEvHrcmBfyfPDZJJmEDdUiG
	MoX8S4v8MNvAGkDRB/ZeNUX8dfhXri0w05jEUYd6698gewCTLI/inezUZpYnyoOErX0YnwxDBid
	rX832vAAvltSQdkJD+WkMPGs5XAY3FMWUCRFZ3othA9ekICbQ5mNYqpwI4YPw
X-Received: by 2002:a17:90b:2d45:b0:39e:207:9db0 with SMTP id 98e67ed59e1d1-39e1e50f7bamr334157a91.4.1789509610672;
        Tue, 15 Sep 2026 15:00:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2d45:b0:39e:207:9db0 with SMTP id 98e67ed59e1d1-39e1e50f7bamr334099a91.4.1789509610061;
        Tue, 15 Sep 2026 15:00:10 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm1878345eec.16.2026.09.15.15.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:00:08 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:00:03 -0700
Subject: [PATCH v6 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-enc_roi_enable-v6-1-29dd4c8bccff@oss.qualcomm.com>
References: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
In-Reply-To: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789509606; l=7252;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=W4KJ4/cRaUhT4aJPGYQieyDy2CUuHLjA+S4NcGfr9rs=;
 b=cT23WPwPBFBwl1zrstEkdc05Si+qxjT4R8ehCGTjnqZWQLyNIFJSkcMWpqw4hZ3mdINj3m+fw
 qaP3Gw/n2qZAeBvk8X/r4EwJkxFNoV3rM0pzGC2XjxG0bhdB+JAUHVH
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX2zWN6Kn/cpw6
 VQZRmL5VDAmcEZ3OMlVSN+IVDF3zCtOYIxVhQlzI7+RqDggKhyrauv5XMtDSg30CWQHqFLbXy+D
 aZnTZ/O5NIHzG6zRvCVj1ABZKRAGm5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX0PkFmX5waFSY
 jpgA81/pPt2BGpSDDMWCckeE8lRTc+Kz9Z7kpSvg8+hLlD5/Qjsm1WLBYnpaIQjKZg6gjy/VLXA
 v9J2iAs3ERLb6+v3o8Q407kW60QRDgym+HSDK5BfLFAmX1enBD53B60vt6bh04UxUBOG50oxPq4
 cJHymPXBgzWWcqlZHJVwxy4UavSJhHmwOOGbU9V6ka1ElPRfetzuyyBJdolVDg4CpHW1nujzkMe
 KRoEDRlTg2ayiHCwRcKEcH5n5/UyOvetUZ9yxCsg2gqlQ4bQVjX2ZHb4gAPgz2QA7epWdkA2sG5
 YJffroW/y+Juw19a7U8jJiCibCu+adueOQ/GZOw1uv/q74YZgAmw7zwaPrmmhz06DJY8om9T1H5
 zYIzcRj+T5QpiPtg0Z3xazNJDI279vGuf9iWY1bo35W2o6vMF2UrEruVGyT+tUOvlQ/SiZHOkBT
 /DGBL33xzj6qtZvOLoQ==
X-Proofpoint-GUID: o9D6AGevhTkR2c43T8XarQzRoJWLHbQO
X-Proofpoint-ORIG-GUID: o9D6AGevhTkR2c43T8XarQzRoJWLHbQO
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aa9bfec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zatfZSFVlCmks967f3wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150321

Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
control type for signed 8-bit values. Add necessary support in
v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
v4l2-ctrls-api.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/videodev2.h.rst.exceptions        |  1 +
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  |  4 ++++
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    |  6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c                      |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                     | 11 +++++++++++
 include/media/v4l2-ctrls.h                                    |  2 ++
 include/uapi/linux/videodev2.h                                |  2 ++
 7 files changed, 27 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -188,6 +188,10 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
+    * - __s8 *
+      - ``p_s8``
+      - A pointer to a matrix control of signed 8-bit values. Valid if
+	this control is of type ``V4L2_CTRL_TYPE_S8``.
     * - __s32 *
       - ``p_s32``
       - A pointer to a matrix control of signed 32-bit values. Valid if
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
       - any
       - An unsigned 32-bit valued control ranging from minimum to maximum
 	inclusive. The step value indicates the increment between values.
+    * - ``V4L2_CTRL_TYPE_S8``
+      - any
+      - any
+      - any
+      - A signed 8-bit valued control ranging from minimum to maximum
+	inclusive. The step value indicates the increment between values.
     * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
       - n/a
       - n/a
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
+	case V4L2_CTRL_TYPE_S8:
 		if (ctrl->is_array)
 			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 9caca56478d1a97ccde582a2086e7039411b52ed..b78992e32e21c79b1c70ec673b81759c9ca84206 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -297,6 +297,9 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		memset(ptr.p_s8 + from_idx, (u8)value, elems);
+		break;
 	default:
 		for (i = from_idx; i < tot_elems; i++) {
 			switch (which) {
@@ -377,6 +380,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		pr_cont("%d", *ptr.p_s8);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
 		break;
@@ -1442,6 +1448,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
+	case V4L2_CTRL_TYPE_S8:
+		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
@@ -2037,6 +2045,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -27,6 +27,7 @@ struct video_device;
 
 /**
  * union v4l2_ctrl_ptr - A pointer to a control value.
+ * @p_s8:			Pointer to a 8-bit signed value.
  * @p_s32:			Pointer to a 32-bit signed value.
  * @p_s64:			Pointer to a 64-bit signed value.
  * @p_u8:			Pointer to a 8-bit unsigned value.
@@ -61,6 +62,7 @@ struct video_device;
  * @p_const:			Pointer to a constant compound value.
  */
 union v4l2_ctrl_ptr {
+	s8 *p_s8;
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..ac588d0093df9cc35c11d0b9d41d052d5e800925 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
 		__s64 value64;
 		char __user *string;
 		__u8 __user *p_u8;
+		__s8 __user *p_s8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		__s32 __user *p_s32;
@@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	V4L2_CTRL_TYPE_S8	     = 0x0103,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 

-- 
2.34.1

