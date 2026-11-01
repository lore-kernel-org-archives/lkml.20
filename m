Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571790;
	b=EdZms1ZKwrQ4W/kbHQmHQ9Q+XrzUsPI30ilbKgoDC4fwzj2JgypNCMyah3rfDLtj1ugm
	 Wl5d0orDRP9cvTw+zllsPf/CtnynXZyA0t0cG8zPAh6KFZCSe2tWFyO2WGhP5AfU8xWIh
	 CNyXs5yTZdl08LYLPKhB5mojWL4zZPpb3NSopkntOAsnj/tywrxMqtRnXiAjCKFTeE3+n
	 JncNOm0Nj2AexOVNo5/MklkO3TXlut17DWW6jH8fbbchtNOmlirXYWjSj3v1+6msTR0x/
	 mRUn1HmVNXGoe7Rrv5/8TNpUT3AHe7IHX634LVm3Xe069JebLpHe1WWMSy7oMaTlRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571790;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dyqDo48U0wN+/HQ14KBIOYzfxhiZJtrEQSu8dO44Rh0=;
	b=IefiDLPwy5fMRabH1BIy9dRXe9SusW4yNG3cry+uZ31ijaa8k108SrUSpma+hMk4sSZE
	 js50y2SH3tVpDvuCfrfj+JxTltagGYOsx9XJI4xHAAk/h4srhkg5egfQjJSTzPdUac3Lf
	 RejFUYB/QNVkmP2TMZF5fnvJjTXwgIOdcD3v8QlFnfJHoJqEcQUnLW8ZV0Mq/cNR0Wcwg
	 YJJRHkfDlS9boVaPGH+5qUjkrLWE9IMQz8lgIhl6GGk+Fe5bpy2hWMj2QvuOmkj22bK+H
	 tBhwo1AaUka47L0/xrb880K3RlVVPnwBRU3NrAfjg25sPTtDWPTPiDhXeHF37zhDTDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Zx/pqMOe";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUxSwRde;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D520606E533
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D520606E533
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zx/pqMOe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUxSwRde
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK9dp2822414
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dyqDo48U0wN+/HQ14KBIOYzfxhiZJtrEQSu8dO44Rh0=; b=Zx/pqMOeO+Binx9x
	Z5KLCZzSocsZbHeOTa+usaFcBz7nZcKDppymS5i9nA/5k2CLSqB0EbFzhcdvifWu
	mGnDleyt+jVFcP6HMgrL13A/aIIAbFGOL6jNFRciQ4K+o6MKsvDTPE38Lca8iv1i
	FcO/cLAdNprOdbyGUXbMRbTlMc3FCi9/UK4oQg2sViEWdaZsPk+CzhXbYc7XEKvB
	SWZaDkQA9ub9KbwNIv+o5jQenUbd6DcbRcapUNf9P6RazyGPZH4dftd1nVo0rKJ0
	DbEyb4u/M6g2hbUX15Q0rjunDgsOpZi4ucLLJBFj1NxFugb3DWAw5cOjknjNDccB
	CU96TA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rvf00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:23:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so5881230eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571788; x=1794176588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyqDo48U0wN+/HQ14KBIOYzfxhiZJtrEQSu8dO44Rh0=;
        b=BUxSwRdeCZ25VBhxoYj02anWQEoCDjIC1NfG6fnyVXB4lSMd/Yy8E+crqf9p9yigIX
         2loCmCrx9hEePzkplRVAf3+HgPQimEf0CZBUgB1VNT+GWZunbP/uuuKF/TM8zMBx8VwP
         KlcLU+xoMoG3yTjsG0Wi7J4FAT1a5AuSgfsKNUIQLJuKn8Q5SrU7QYpYqiXiFX5VnzWJ
         0XwUdcNPKRwRr2H7MsWhiabuYPV6MoDmXINBMCkyMXO5i0Q49f9eWKxOSXI5i3wLsR8A
         X5mI9pXaCsnCJ10B3mx0BMIbRoPb+PKXtJOKSBI9FYRgkNsw31otMDJMz2ZTg/X6TXB7
         BfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571788; x=1794176588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyqDo48U0wN+/HQ14KBIOYzfxhiZJtrEQSu8dO44Rh0=;
        b=Cv7K23pegt4POcbnicKQysrLcyKMdQhjWPxZc2hJC6DfqZ2whL81hHrxQRN1kIPC/o
         YtRhHWBkhTR8nBujcSDbHUy41JgcApMniGQIyvDTTh6sDTClOrTRmhwKF9YC39vT7yEV
         2+HNRJJ19vDhvY+GBpyd42WR/naytMhUs3G308ZogCunAQBkMpzZzt2kCPBezTM7zQKF
         WnSxcMYjnEUSoNrJp4szkAS46kzk+UZEFlxHdCj6+pRUcLc4zyQnlyybZFpm+kdgt2kn
         UOdcrhDmsL7rZNQOb3UgxJusB8iijM5fsM494iCUqaCDQtRLA68/aOd+lK2aN4nbh8QU
         S+xg==
X-Forwarded-Encrypted: i=1; AKwUvBxOXXae+YZIdkmFcFL5nOcIX1aGg8UOe/EfYSUZhbi7r/+oS4vVYVgL0CHPu+NDM5vD0EOJFQlSeYyxE2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9Nmsir7qWcRhFdq3igydlmJYe6bPUIn/vfbPaUJUeYLAiVBdc
	LcmOPn7ic1lnEw6rGcQV62uxsS2cj3ibCr0+vWTxOp/kK1egu1iDIXTBsCx7Ji5bwjMl4Lau/1H
	TQqIoIfruuonDEGSLyjl5YmUUn6JuFg4yH8eW6hNZ68Wij38D7dxWKLfAEFY/SaEzhMU=
X-Gm-Gg: AYBFou3PSPYpHSVGIw5MOpVEnk5N00VWaboK95VgYo9Q0FB0UOMOudEI0Rh5K8tmoSB
	yCCf8mYz7LWWwjEHl9Z9ONSLusm81bpIkXXqb0uN6e0Zt9+oEUnrOXbWGNuQk3KbyQa7g2pglLU
	EDgl4oPgNJiDOp+EGiaOqdATEd3hb7o3rsrDyGEtnvapIRuL8DofeSXKW8gpzkXVLRR7B/4UM4Z
	jvUNAfyvNlY9Nw4gmuhxY9gdrKkhNaQDWOPeI8dgoB7HgLjtZ9eeId4I4UeL7TWx1gSocjn4pNP
	Cpso1OVNScF+mqM1kIV0MB0O7bl3e9TaW5L8FEwgem7Z8CElUg2rucOEv7DMUu+AwZ5vMKko1su
	kWdrAlekpn7HkpBfsY09GiMaFxITxoarviUzHLw8oh+pjDfyQL/YhPduUldNXppG/qJcMg3j2Iw
	e2Tphf5g==
X-Received: by 2002:a05:701b:4509:20b0:1a3:9936:d11e with SMTP id a92af1059eb24-1ac5e6007a2mr12040844c88.41.1793571787619;
        Sun, 01 Nov 2026 14:23:07 -0800 (PST)
X-Received: by 2002:a05:701b:4509:20b0:1a3:9936:d11e with SMTP id a92af1059eb24-1ac5e6007a2mr12040776c88.41.1793571786890;
        Sun, 01 Nov 2026 14:23:06 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:23:06 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:22 +0530
Subject: [PATCH v4 09/25] accel/qda: Add legacy FastRPC shim skeleton
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
Message-Id: <20261102-v4-v4-9-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=10632;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=JRvVnRwqFjLn0AI8JRg3A4maBAywdoHfA7bwJFsszxY=;
 b=/Zdsb0wLzHJ0hKqyoEAtcmWfrL5VJE79940mlHqDZsukvGybBVSLQnAlLaxHXy2Cs+2zu1++r
 T3LMB5J/4ZeDBOTZWxceu4obcG6IPH4LI4sB9+mShtiaCY0ewybVCC4
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: _HhXE-26uvSGT5yf0av91aJZ51_yjZ7n
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae7bbcc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_LhGIrvswYtaaL6YFqAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX9RDh2vY7VSin
 izzmrG929wEibs9mC3ykhunDHbl8Rd+DorIjJxw/LRsj1ketyDlMmeqvGXtMtzBL8nDzjkoNapu
 8I4YTvGtX6yKcBFaLegBolvuVO10TVs=
X-Proofpoint-GUID: _HhXE-26uvSGT5yf0av91aJZ51_yjZ7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX7TvkipGBxZrM
 D6uJU4yq05sPDlD4ql/MnjfBz33ra1Hdwi8fLkwFYobY3ISO6mYhUps+dg9Mx84Os/qq1Immv3M
 zxxDeOHixLYnoPJ85dkwDy9tgmzIEX+231t0Jq57wrqVUmULZpyvCz2iqv57pdwt0Mm+mysVhB4
 JNb9pjexDmInTCILYzGTaJwWBX9IfE/xyIZG+HvVcYcEDOMvEu5ufp+4KaMDlhiSmcRvsWwdYmZ
 oExTjBASlrEwrRvQ+yStWrsk+PKgoEjCsRadFVXy21RnkIpFt/ax0u59q/1e5ep3+PhKFid7zkb
 RMccpdyT/9paaTSy8P+k4gl4rXTT8vUTnaUTmxnkSK0N79u8W7MTj/1kewlIx68XXWymBOExMGr
 PHMxkP3/mkSZMSWqED9pqLmQ6psJXGijtdcoWh/Zdow7wuuicRVYQbp3NwXPQmMoDJHRAXpIBhA
 U5KyF90/AfLpCtXTQXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

Existing FastRPC user space talks to /dev/fastrpc-<dsp> through the ioctl
interface of the driver in drivers/misc/. Add a separate module that
serves that interface on top of this driver, so such user space keeps
working while it moves to the accel UAPI. It is separate so that the
driver itself does not depend on it, and so it can be left out.

The module binds the auxiliary device the driver creates per DSP domain
and gives that domain its misc node(s). As in the driver it replaces, a
channel is secure unless its DT node has qcom,non-secure-domain. ADSP,
MDSP and SDSP get a single node, secure or not according to the channel.
CDSP and GDSP support unsigned PD offload, so they always get both a
secure and a non-secure node, letting untrusted applications use the
latter on a secure channel. Nothing distinguishes the two nodes yet;
that is applied to the operations that need it as they are added.

Each open file gets a session from the driver, which also pins the DRM
device for as long as the file stays open.

Only FASTRPC_IOCTL_ALLOC_DMA_BUFF is implemented here: it allocates a
buffer and returns it as a DMA-BUF fd. FASTRPC_IOCTL_FREE_DMA_BUFF
returns -ENOTTY, as in the driver this replaces; buffers are released by
closing the fd. The fd is installed only once nothing else can fail.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Kconfig            |  16 +++
 drivers/accel/qda/Makefile           |   2 +
 drivers/accel/qda/qda_fastrpc_shim.c | 268 +++++++++++++++++++++++++++++++++++
 3 files changed, 286 insertions(+)

diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
index c174f9edf2d5..c440191a54ff 100644
--- a/drivers/accel/qda/Kconfig
+++ b/drivers/accel/qda/Kconfig
@@ -26,3 +26,19 @@ config DRM_ACCEL_QDA
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called qda.
+
+config DRM_ACCEL_QDA_FASTRPC_SHIM
+	tristate "Qualcomm DSP accelerator legacy FastRPC compatibility shim"
+	depends on DRM_ACCEL_QDA
+	default DRM_ACCEL_QDA
+	help
+	  Exposes a /dev/fastrpc-<dsp> character device per DSP domain, serving
+	  the ioctl interface of the FastRPC driver in drivers/misc/ on top of
+	  the QDA driver, so that existing FastRPC user space keeps working.
+
+	  This is a compatibility layer for user space that has not moved to
+	  the native interface in include/uapi/drm/qda_accel.h; new users
+	  should use that instead.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qda_fastrpc_shim.
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index a867a888c5f5..0996e4ed5798 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -16,3 +16,5 @@ qda-y := \
 	qda_prime.o \
 	qda_rpmsg.o \
 	qda_soc.o
+
+obj-$(CONFIG_DRM_ACCEL_QDA_FASTRPC_SHIM) += qda_fastrpc_shim.o
diff --git a/drivers/accel/qda/qda_fastrpc_shim.c b/drivers/accel/qda/qda_fastrpc_shim.c
new file mode 100644
index 000000000000..25f5c242efde
--- /dev/null
+++ b/drivers/accel/qda/qda_fastrpc_shim.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/dma-buf.h>
+#include <linux/err.h>
+#include <linux/fcntl.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/limits.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+#include <drm/drm_drv.h>
+#include <uapi/misc/fastrpc.h>
+#include "qda_drv.h"
+#include "qda_legacy_ops.h"
+
+/* State of one open /dev/fastrpc-* file */
+struct qda_shim_file {
+	struct qda_session *session;
+};
+
+/* One misc device node */
+struct qda_shim_node {
+	struct qda_shim_dev *sdev;
+	struct miscdevice miscdev;
+	char *name;
+	bool registered;
+};
+
+/*
+ * One per DSP domain, holding up to two misc nodes. As in
+ * drivers/misc/fastrpc.c, a channel is secure unless its DT node has
+ * qcom,non-secure-domain. ADSP, MDSP and SDSP get a single node, secure or
+ * not according to the channel. CDSP and GDSP, which support unsigned PD
+ * offload, always get both, so that untrusted applications can still reach
+ * the non-secure node on a secure channel.
+ *
+ * The two nodes behave identically for now; what separates them is applied
+ * to the operations that need it as those are added.
+ */
+struct qda_shim_dev {
+	struct qda_dev *qdev;
+	struct qda_shim_node nodes[2];
+};
+
+static const struct file_operations qda_shim_fops;
+
+static int qda_shim_open(struct inode *inode, struct file *file)
+{
+	struct qda_shim_node *snode = container_of(file->private_data, struct qda_shim_node,
+						   miscdev);
+	struct qda_shim_file *sf;
+
+	sf = kzalloc_obj(*sf);
+	if (!sf)
+		return -ENOMEM;
+
+	sf->session = qda_legacy_ops_table.session_create(snode->sdev->qdev);
+	if (IS_ERR(sf->session)) {
+		int err = PTR_ERR(sf->session);
+
+		kfree(sf);
+		return err;
+	}
+
+	file->private_data = sf;
+
+	return 0;
+}
+
+static int qda_shim_release(struct inode *inode, struct file *file)
+{
+	struct qda_shim_file *sf = file->private_data;
+
+	qda_legacy_ops_table.session_destroy(sf->session);
+	kfree(sf);
+
+	return 0;
+}
+
+static long qda_shim_alloc_dma_buf(struct qda_shim_file *sf, void __user *argp)
+{
+	struct fastrpc_alloc_dma_buf args;
+	struct dma_buf *dmabuf;
+	int fd;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	/* The size is 64 bits wide on the wire but a size_t further down */
+	if (args.size > SIZE_MAX)
+		return -EINVAL;
+
+	/* args.flags is not used, as in drivers/misc/fastrpc.c */
+	dmabuf = qda_legacy_ops_table.alloc_dmabuf(sf->session, args.size);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0) {
+		dma_buf_put(dmabuf);
+		return fd;
+	}
+
+	args.fd = fd;
+	if (copy_to_user(argp, &args, sizeof(args))) {
+		put_unused_fd(fd);
+		dma_buf_put(dmabuf);
+		return -EFAULT;
+	}
+
+	/* Publish the fd only once nothing can fail */
+	fd_install(fd, dmabuf->file);
+
+	return 0;
+}
+
+static long qda_shim_dispatch(struct qda_shim_file *sf, unsigned int cmd, void __user *argp)
+{
+	switch (cmd) {
+	case FASTRPC_IOCTL_ALLOC_DMA_BUFF:
+		return qda_shim_alloc_dma_buf(sf, argp);
+	default:
+		/*
+		 * Includes FASTRPC_IOCTL_FREE_DMA_BUFF, which the driver this
+		 * replaces never implemented either: buffers are released by
+		 * closing their fd.
+		 */
+		return -ENOTTY;
+	}
+}
+
+/*
+ * Mirrors drm_ioctl()'s unplug check. Not drm_dev_enter(): holding the SRCU
+ * read side across a wait for the DSP's reply would stall drm_dev_unplug()
+ * in qda_rpmsg_remove() for as long as the DSP takes to answer.
+ */
+static long qda_shim_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct qda_shim_file *sf = file->private_data;
+
+	if (drm_dev_is_unplugged(&sf->session->qda_dev->drm_dev))
+		return -ENODEV;
+
+	return qda_shim_dispatch(sf, cmd, (void __user *)arg);
+}
+
+static const struct file_operations qda_shim_fops = {
+	.owner = THIS_MODULE,
+	.open = qda_shim_open,
+	.release = qda_shim_release,
+	.unlocked_ioctl = qda_shim_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
+};
+
+static int qda_shim_node_register(struct qda_shim_dev *sdev, int i, bool secure)
+{
+	struct qda_shim_node *snode = &sdev->nodes[i];
+	int err;
+
+	snode->name = kasprintf(GFP_KERNEL, "fastrpc-%s%s", sdev->qdev->dsp_name,
+				secure ? "-secure" : "");
+	if (!snode->name)
+		return -ENOMEM;
+
+	snode->sdev = sdev;
+	snode->miscdev.minor = MISC_DYNAMIC_MINOR;
+	snode->miscdev.name = snode->name;
+	snode->miscdev.fops = &qda_shim_fops;
+
+	err = misc_register(&snode->miscdev);
+	if (err) {
+		kfree(snode->name);
+		snode->name = NULL;
+		return err;
+	}
+
+	snode->registered = true;
+
+	return 0;
+}
+
+/*
+ * misc_deregister() takes misc_mtx, which misc_open() holds across the
+ * lookup and our ->open(). So once it returns no open can still be using
+ * the node. Files that are already open hold neither the node nor @sdev,
+ * only their session.
+ */
+static void qda_shim_nodes_unregister(struct qda_shim_dev *sdev)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sdev->nodes); i++) {
+		if (sdev->nodes[i].registered)
+			misc_deregister(&sdev->nodes[i].miscdev);
+		kfree(sdev->nodes[i].name);
+	}
+}
+
+static int qda_shim_probe(struct auxiliary_device *auxdev,
+			  const struct auxiliary_device_id *id)
+{
+	struct qda_dev *qdev = dev_get_platdata(&auxdev->dev);
+	bool secure_channel = !of_property_read_bool(qdev->dev->of_node,
+						     "qcom,non-secure-domain");
+	struct qda_shim_dev *sdev;
+	int err;
+
+	sdev = devm_kzalloc(&auxdev->dev, sizeof(*sdev), GFP_KERNEL);
+	if (!sdev)
+		return -ENOMEM;
+
+	sdev->qdev = qdev;
+
+	if (!strncmp(qdev->dsp_name, "cdsp", 4) || !strncmp(qdev->dsp_name, "gdsp", 4)) {
+		/* Both nodes, so signed and unsigned PDs are both reachable */
+		err = qda_shim_node_register(sdev, 0, true);
+		if (!err)
+			err = qda_shim_node_register(sdev, 1, false);
+	} else if (!strncmp(qdev->dsp_name, "adsp", 4) ||
+		   !strncmp(qdev->dsp_name, "mdsp", 4) ||
+		   !strncmp(qdev->dsp_name, "sdsp", 4)) {
+		err = qda_shim_node_register(sdev, 0, secure_channel);
+	} else {
+		err = -ENODEV;
+	}
+
+	if (err) {
+		dev_err(&auxdev->dev, "Failed to create %s node(s): %d\n",
+			qdev->dsp_name, err);
+		qda_shim_nodes_unregister(sdev);
+		return err;
+	}
+
+	auxiliary_set_drvdata(auxdev, sdev);
+
+	return 0;
+}
+
+static void qda_shim_remove(struct auxiliary_device *auxdev)
+{
+	qda_shim_nodes_unregister(auxiliary_get_drvdata(auxdev));
+}
+
+static const struct auxiliary_device_id qda_shim_id_table[] = {
+	{ .name = QDA_DRIVER_NAME "." QDA_LEGACY_AUXDEV_NAME },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, qda_shim_id_table);
+
+static struct auxiliary_driver qda_shim_driver = {
+	.name = "fastrpc_shim",
+	.id_table = qda_shim_id_table,
+	.probe = qda_shim_probe,
+	.remove = qda_shim_remove,
+};
+
+module_auxiliary_driver(qda_shim_driver);
+
+MODULE_IMPORT_NS("DMA_BUF");
+MODULE_AUTHOR("Qualcomm AI Infra Team");
+MODULE_DESCRIPTION("Qualcomm DSP accelerator legacy FastRPC compatibility shim");
+MODULE_LICENSE("GPL");

-- 
2.34.1

