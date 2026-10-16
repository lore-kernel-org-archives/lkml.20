Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DB40B11C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792191647; cv=none; b=MqFMuEeXYBtORaQHtSFZ8svh9Ian4xW2Tlxb3ziQIgXHuA0Ji0UY0A3RTI2OOv4jdMOkN5/wXgOUzqZ9a4/GPMp8hTZqlvK4ugWGTobYefPd201adrnZG79Dzlt+phAP9k4QI9IRi59IYD3+fvqN1sXGqFhpkgEwCru9mMlTZ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792191647; c=relaxed/simple;
	bh=DoDb5/3SowuSRtiQ/IVrXUJDL9Gx7dvh6M5JkE/jj7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eH9cMVAuz4sPuj/INQ2S4qk44t6glisbg3M4GFo6YXkzxAX4hg5gRQeJ+f98S+7nyzX0ggobttny/yuoUlQ2fDhQXE89iYexfh6KQme/3O+edJw6YSFCRBeSkcRZnp6wYaWd+KaFIRM2Eh9igRlCbkZhcIt/6Jy3Lns35BeKc+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqWhRHW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kr789ySI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqWhRHW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kr789ySI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJejP43725225
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpHX3jtqRYjFgWPpTxd+jJj1azML1VLq4RsQUKEL/Zk=; b=CqWhRHW+ysm6ckHn
	/KuDqTikjn4y3yxPbBy2qATp8FN3GL6ILSfIjkna0aVGFwQmQcJeZ/lQoIySHqy6
	jCvmarGsapDVq1HZcxA8eHljb164US7Mp2OJD0uAfYWKKL41Z4ZbB1GA7C3lzYaU
	/PRfj9SaZWA8h94+3gB5EmKTKc6ig35yKGYrU6AH6RyTsRw2tvpyI2/tFu+TLvaZ
	KDcKi2IIkIsfXelTsQppOQSNRDO0kMUQXgXRxZZ0eYlLPLsSHVnxh7nPF3+C+ONU
	kOmWxiXJ44V16ss+2LCXZduf2BYHUiXd4hci5dVrBxcnNruq8zb+2uLBDygjakTJ
	oJLISA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbq451bwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:00:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35935fae332so45704eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792191643; x=1792796443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpHX3jtqRYjFgWPpTxd+jJj1azML1VLq4RsQUKEL/Zk=;
        b=Kr789ySIvJox4v4q4qkJRz3Y5ITpP/6IHW/8miatLdoRkm+ADRhSHn+Sg85H098XFE
         +bDf5WDaABgZkI2JAY2JRrY8iCXn5EBJL/RIt+1NSvL+Ryp/fMHME1GZMsyz7p6u1JD+
         m044ehbW11rQyn5mqrzbBRLiFVjKnPOomrf+EJyNdhHr7GK/rWBTK/y7a4kBOcWuYJUJ
         snr04lIJczTcANWmuwUTUhJtzCB09HhhGKqp3EGxcHdfp85h+3p+4MAlVZWT3NX9FBRn
         HUNxfxUTlUZzgfEDYsBBpRBhypbSdaaHu94vBLS3Rjjm+d7Qsbu6nMn5voNFaKMOuZj0
         hgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792191643; x=1792796443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpHX3jtqRYjFgWPpTxd+jJj1azML1VLq4RsQUKEL/Zk=;
        b=s2hzQL/4tl8NTsxXj0ZX98SQevgKGOgD4pMZGlbnFqqsE7rrlA7LD/cEvD227kcwai
         eiYsBA9FqmSjXpqMlbI5Qwzdr+ehOLf47ZJs8fv2jqzVohiXt2T0oSvW620kQZ+JgMaQ
         NGaZfmXROItu1QaK1Fn/ZWY7/rQz0XVT3EsbkB8bb/Tn0S6Au6KOciesXr+LW8GANux5
         CEXO1kUhyjoxSfwmnoV/HVc3mIna4DhgZveRqItUEzp/3zG1ib6+0pz6q8bfdnqKx9iL
         c+h9cfLTTSPrd4OaYLsD3e2NIkebpnXVAGmXQN5dXizr/Cc6AayvLrVJ6n5F2DPITOV3
         j+Rg==
X-Forwarded-Encrypted: i=1; AKwUvBw2CAtnBmYZ4O2bpA++2CN/xYSHkU6hka/K9rx2uQhbXNvjn+tyBYbD8RmYUKIYiU9R08QcU2ul5mZnVTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2KHgNKn6TGFzuQ7SoYPpj+I+erEVIzsQTz80X8ydJyEYe6HT+
	SBXvZStyLvpIzXLEFZxPPANu0J4Ykcg66cUe539lkGFmMLeEBFuXZK/n1oZPo4ApB8TUn6WCRFU
	+cIxN3Ddht4KcRbuWbC3I6VR+iNM04fTkP0p+ml9s+x0Ig4a/mOl5VXdzYYu8kaXRhkQ=
X-Gm-Gg: AYBFou1kc2MYfcLLHuZ/7mi1Tfyd2NvSVORZ/OO4zYVtJ8PJ7SG6cqdLw/KktkIYST4
	Hh5OvoFhOJjkQQ0/WC49vUIhmT9hKAEqVJiU8yMaLQPCIIrL2FbjGzNhSPlYRyad2Fjdza09XOd
	Nvw/hhBTlDYq5rmtEve732OtwLpRHIRFk3cr6gpvMkQR3hTjw2euq3tSbi2vWdNlCZ3tBuhQgOQ
	uHqL/PtNWWtoc4ojRB2Ip1pH+8U/b8AjdA73lpBlaxRyWlQIT7WmOY/zAKmf05e3X8f22Ky1AEq
	jXczo15uuOhEWvznMybwppTOdJec8TPqwtcUauqLnK4Vte+T4XA2jQYMZFz+zWiTGtCpqPQiZbn
	+vKXiE4hk46fvAOE0feLMxXPFZPgZkVspqzeU0gP6+AQSk36CBw+4RjvnGzU=
X-Received: by 2002:a05:7300:51e5:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-361a107bbfemr2430294eec.2.1792191642865;
        Fri, 16 Oct 2026 16:00:42 -0700 (PDT)
X-Received: by 2002:a05:7300:51e5:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-361a107bbfemr2430078eec.2.1792191641164;
        Fri, 16 Oct 2026 16:00:41 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm9379101eec.18.2026.10.16.16.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:00:40 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:00:32 -0700
Subject: [PATCH v10 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-enc_roi_enable-v10-1-bc5bd37b6f3e@oss.qualcomm.com>
References: <20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com>
In-Reply-To: <20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792191637; l=8019;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=DoDb5/3SowuSRtiQ/IVrXUJDL9Gx7dvh6M5JkE/jj7k=;
 b=REQsHs3+jxFTRIinhIfftnuiuciXWxXL0sZcNRNE4OACg+boUYA36qSSVCp3x4BMf7idUzJn4
 MaIQ+dTcTOCAtx2oYGiUyUm/yazaEpce1A6hSDtHjaZGSBc0tdXnrsj
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: wNGzr4u4KKfdTj3-5NZvMU77cJkjgktk
X-Proofpoint-GUID: wNGzr4u4KKfdTj3-5NZvMU77cJkjgktk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX8pp6YnYr47Gc
 kGrSmDL7pfPoejYDP/5FCv2s9oAKm23CMVCnZY2X8d238uk4ESdO+26BWuOAvZ+WDrPcGtIiiSV
 tlQ5m76Gmk+lL9NPVy6Mi37SdZVEwlpu4b/wvv+Q5DWbXXHhcvNo/tGuR/pMj5MYmFUIcFc5hwK
 7/S3Z7Hqdez4Y4SRQVSS04KjTsikY77Zm2xbSdMjQimuq8ffOxjLheVpQySqwLr5Re/YUojjD3K
 RX10dRrhGqaDcdXOZpoOvXNWz9AZ3YahgB5hzaFFg3VzhVWq9UvCCYXCkykKi+outgD1UKH1IZt
 4GlVp/e9f0RyltGwrYiJFclYPHo4V+rbssWYbxzmFfKNt4+ctH50hT3uCuyL94n4F8QCyrRRhBq
 +PyOU3O7pGlc4mirTC6/By4hH0FVozIy4DGeqwWt/khRVu72aG/PRrxvb6pptqmPEUW7RzfKiZN
 6WwL6rxeZSozqUNK6Gw==
X-Authority-Analysis: v=2.4 cv=e4GT2qp/ c=1 sm=1 tr=0 ts=6ad2ac9c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZvH2QzoBumBvrUatZloA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX9IQqzamU3r49
 IKH1LLD3axyDYdMcW7+X2Ob30owLLPpWfkfwbbgc2OfKqdhYIDFoaT6quyetkfq1pJHjBXRY/qJ
 pDY7a4t9ONII5hxN9ImTD6nxWxNvHrY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160091

Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
control type for signed 8-bit values. Add necessary support in
v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
v4l2-ctrls-api.

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/videodev2.h.rst.exceptions   |  1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst         |  6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c                 |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                | 16 ++++++++++++++++
 include/media/v4l2-ctrls.h                               |  2 ++
 include/uapi/linux/videodev2.h                           |  2 ++
 7 files changed, 32 insertions(+)

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
index 661a3a25da5220d2e824f71e68871181533e6cd8..c5df0e0a54f81c73975f427957b7c99fd421d5ad 100644
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
@@ -1501,6 +1509,10 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
 		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
 			return 0;
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (ctrl->maximum == S8_MAX && ctrl->minimum == S8_MIN && ctrl->step == 1)
+			return 0;
+		break;
 
 	case V4L2_CTRL_TYPE_BUTTON:
 	case V4L2_CTRL_TYPE_CTRL_CLASS:
@@ -1732,6 +1744,7 @@ int check_range(enum v4l2_ctrl_type type,
 	case V4L2_CTRL_TYPE_U32:
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_INTEGER64:
+	case V4L2_CTRL_TYPE_S8:
 		if (step == 0 || min > max || def < min || def > max)
 			return -ERANGE;
 		return 0;
@@ -2037,6 +2050,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
index cec9217d97ac698cd447574f5d079dd913a9ef6f..cbda866197d894657b571ee5d57b4956818b7ee0 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -30,6 +30,7 @@ struct video_device;
  * @p_s32:			Pointer to a 32-bit signed value.
  * @p_s64:			Pointer to a 64-bit signed value.
  * @p_u8:			Pointer to a 8-bit unsigned value.
+ * @p_s8:			Pointer to a 8-bit signed value.
  * @p_u16:			Pointer to a 16-bit unsigned value.
  * @p_u32:			Pointer to a 32-bit unsigned value.
  * @p_char:			Pointer to a string.
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

