Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571715;
	b=XD3Ma53ZHq739ihbSVtfE7eylt603/pmYOZDmTUY+nxmlR1BZEp1Y5n3RahzWznALjHf
	 jPnjm/5x/FU0ZCZCzg+oD3CcPfMJE2EmnGzpLqJSR7H0sVvuGX9N+zrTZuYXrrH8Qaco8
	 TpuGRtMt+/IeI+4tp+6Cd5PnoNJn/ZoZLn59o+li+ASYU7jDxsDS/GRtQTgqSgd+I39BW
	 /hekSqt+mYvAVOie30WIF8Bnop2Kz66OzM0MYSN3MN9aZqwUSPl/WRhCidct6lwEJhIYK
	 r26AaXOgUXnWR0Qyhyzn0nj96yoZTWW2px8TxVQdT5yDhd+0LJOwgOw2N9s0SVDAOYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+e+UbA44vcf8UTJECZJplFj0MSqoCWvpoDyTNmMPLK8=;
	b=IiE6jIY8U/0DsaexaOPiSTCmhZFezbPZJHQuITdBvkpzn851D0H+oACm156/2amgwGXq
	 qBJw6c8KLGxR79h6YvLEFh5o9WLw+QPeGAG9TpdlpHWVl6eTWSK7lN98+nNau8N8+6eMA
	 KasRdSp59DDYiZqEVXsC3jQJN0vLffApBk5cs5dHj/jozwS5rf2kQIm5GVM6O4MJo6Dtw
	 y7C273kP2pPKSOJ0yMETfL/C4aSm3BcF8rMrVeckR0AVhtOCxOKi5LK/QwnN8EWhqoCFL
	 qahxtBZJwSDJLEpq4Es1bHiKdeO3eLA6x44woNcxbLV8ipllvG272OmdJCxni700jYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Iq64/ikr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+3RkuyB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C039F606E507
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C039F606E507
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iq64/ikr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+3RkuyB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK8Va1808587
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 22:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e+UbA44vcf8UTJECZJplFj0MSqoCWvpoDyTNmMPLK8=; b=Iq64/ikr5QdG0DtI
	lVnDGXMOMQKB3QueaQZ/OSdZ9mR0NvHzkcVmeCOZh7x6Ck2hw7/YrpPKU0aT3oLo
	9OSGtQeAaXDdHuMawLulxKVvOfJLwPGXAVEs6hFV/XDrLGT1vVYmIBLBrEXJJ7VC
	yi6dxvqZ+4jHdzNdf6rpU148onSRXTgT4YHRmTmXXepeXLv++GP2sFeKvhQknUlQ
	ze5MKZlkTpjTnsL/ZDXsr0BucrBt7tzdTCWRjvJhmKUO1HP64DBiOXRDpFP0h+kp
	CoE6or1OxXeoQhRLzEK47OlZ9IyeVTnXv/ET70m1KNiSXUPrFKybr7RrXkhR3Y9r
	mEn1jA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkmpt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:21:53 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so4537404c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571713; x=1794176513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e+UbA44vcf8UTJECZJplFj0MSqoCWvpoDyTNmMPLK8=;
        b=S+3RkuyBbiVfolXYd4RA0pI9Gh/flN6Wk6QlxgwgTDuCmdAUa8+emIR7euBX3hhKw0
         b/VYt3espw62W3Jyaz26UKxzWYqbXM1+KJXjUQdPM1n5u7KCLi7m2cNMKNOed36EgdZ3
         OAH6RlEhK9u/tja1Hk523smS0UYLeWVs4dkvjszwEIYRo+fMbiYlDBd2gcorFdDEa0bv
         xxpKsuGEdb+7nSS7ROkeksZz08IisDiOtI4fM4o+y36rCYn5+lcHWYZ09S49pzPp6Py+
         WP31ZH0lUfcOBwH5ElqSqnfKACjDQaRYdF3cNCdP/vxEjojoGyjQufCOovB8/GJNjM0b
         ioPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571713; x=1794176513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+e+UbA44vcf8UTJECZJplFj0MSqoCWvpoDyTNmMPLK8=;
        b=q/lguSobpTecUho99qCJ4m4Rmlf/PmFcsbt5O0QuGyFAPcrMWe0+wPV0LW2HDTYHbK
         7uBG+8t9X7Ohelz5FcJ0qE+LF8iP+MTM39wiEKHtLtCqpcL45Nio/68zT4N0Y/6u+Opg
         w9QogxsxBmC16/4iPwjeJ+CLo7H7OhGoZYhMy/xPLtASMEdV93SBibtWPTrykytvJODw
         qX/goSSdYQw4v6OeI9RORElQkbGPOr/ZF7MUyUKHfFdeYGcFg/36FkUUwIDrTmOJB8M/
         4kr8EJyCvJo3PERnFCaxkLDPEeEj8xL4aFTLqoaOPtwdqpxkGKTdBzX/YFr6JqphdnGU
         osnw==
X-Forwarded-Encrypted: i=1; AKwUvByXqlDNPOV/KohUk7a4njndvOrhtzOr29FOkCVo2RPhaKDSe8j6TGmgiphkm4aElUit9clFaZKeK/kBuyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzKQIF9iH7kdEEt7by8ZY8HshVVhJP/abcSutaqYRTCEcmgIjv
	l8yh2dsxauoFwcuLd+hWTQfaqYoLOLGVNW9+w8X7zF8JNeZm4MnTuELAznCLwQooFdMCsl9JQZ5
	6jyBw9bHyXY71DD09ABq674l4nliJqkJU0qnUc+FgsArkza2uh4lvaeA9zuD853iyp+Y=
X-Gm-Gg: AYBFou1twsfoVDPepjG/N9jRkR/XUi3zZljTE7owSLf4ZGcfiOGftVon1Z43H88FY4/
	sGWDuZMHxpL5OfHJh0SW/zv6Hc/Ih4WApbnaAUstfJ0+ZbbEDxn3avyya0aSsfpsGGBmU3WgJy+
	2eObiJaMk+TOxoKSz76fj/tp4o0QhlALPLL3pNDl9VMjWV+3Xi6dHCnOJUwkzwoArBxlEDGLtTI
	OKWEUca1mSLVjQrmJUEbSMGK8sZKoqHcntGZ4f816qhYOYs70K05flOm48sdPqbNU6A8yQcxyMs
	H/DQdIaS7rDd1ad6yWUwA1MeDZW8lyvvsJBsrFGGRO8iUDtCHhu9nG5l2MnT0TgLHLX3LjWB9/3
	aHwNmSl9hyCQ+9tRp7tmNPxsgXo2sgIXrh7vr8J1/gPtl01rGFfFLYljn0FOsiJxc8/esiiCOCM
	CYY2KmfA==
X-Received: by 2002:a05:7022:ea46:20b0:143:5266:48ee with SMTP id a92af1059eb24-1ac5ecb4ad3mr14416679c88.42.1793571712256;
        Sun, 01 Nov 2026 14:21:52 -0800 (PST)
X-Received: by 2002:a05:7022:ea46:20b0:143:5266:48ee with SMTP id a92af1059eb24-1ac5ecb4ad3mr14416636c88.42.1793571711559;
        Sun, 01 Nov 2026 14:21:51 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:21:51 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:15 +0530
Subject: [PATCH v4 02/25] accel/qda: Add initial QDA DRM accelerator driver
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
Message-Id: <20261102-v4-v4-2-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=12898;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=F1iB2txhAlMtDV5SE45Y5wVcBvdSVuSaauH/TqBkY44=;
 b=xEcvjWQxmKnXBu17rNu2cKJ3gHWFBVD3phell8y0BSa6WK9dNs+63D4oFjOlrGyQnfLY1Va2g
 VB6jkLfx6NcCd9VDQPS1/aYJvin851oS2m+MWAPiCd/LrDmXDvWilXb
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: C8oAQ0NAGGCiWT9iqI_q8Pfh4xjR7QB1
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae7bb81 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZwOoXynyJOYGx0NfN0cA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX1mmdAn1x4DwR
 aiPS/N/l85txmbh8n64xc2FjEh+AkV3jYcf02k947wLgFi+f3Qg601mDn5TcCejc5nSWkVR/IMD
 V5Fm7AGH7FKPKD2DHavgXwRhKlreTQw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXyGK83BuPBSxI
 fv30fihSyA5A2tZUqe/60BTwVMBwj2DS2p7qFW9tijzkaqS+SUpNH/90MgR5wtQzwBLZSnkcypa
 0Qh7pFmhiJWveOIPhYdRI6Tt4XPjk4evjG3COxREh9fjtSd+giOhCh34lfUkK8l9ohppKJOLx/C
 2HbeaWyFGIqmO8nHDGs912/LWvLXpaAaJSnTx1WXN3ECy9O+Qz7yHMS5shq0kSN5BKbwkn7hcDe
 ZZAEEkbpav6Bya7hwMyqekLXMtu/THOUvDKZj5KYD2QjPXf7UVUkwyt3zZyqhQtXd+RbtOYePnp
 4W6NeG7oBo5IrUILVQaF05TLNORBCkzBWAIZz2TMxvShijibABQx8SO2/If0mJrr4+9CmC9AVrG
 jw8jIBO+O4meaQpkgY11qfx67d90XY8sVcnlTr7gbBem7IDUZ1aPwek8wjewEakXmOfNEGtUB9e
 xv/MTc/WY+MVjyZF7Bw==
X-Proofpoint-ORIG-GUID: C8oAQ0NAGGCiWT9iqI_q8Pfh4xjR7QB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611010089

Qualcomm SoCs offload work to Hexagon DSPs today through
drivers/misc/fastrpc.c, a misc character device driver written before
the DRM accel subsystem existed. QDA is a new driver for the same
hardware, built around GEM and DMA-BUF instead of the ad hoc buffer
tracking the legacy driver has to do on its own, and exposed through
/dev/accel/accelN like other compute accelerators.

This patch lays the skeleton: a drm_driver with DRIVER_COMPUTE_ACCEL,
per-session state that later patches share between the native UAPI and
the legacy compatibility shim, and an rpmsg binding that brings the
device up when the DSP's RPMsg channel appears. The DSP domain name
comes from the "label" property already used on this node, since that
is how the platform identifies which Hexagon instance a given channel
talks to.

Both compatibles the binding defines are matched, so the driver probes
on every platform the legacy driver supports. The glymur, hawi, maili
and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
compatible and so are matched by that entry. The DSP parameters that
differ between these platforms - the stream ID position in a
DSP-visible address, the DMA address width, and whether the firmware
supports invoke completion polling - are added as match data together
with the code that uses them, since the values are only meaningful
next to it.

The rpmsg binding targets the same compatibles that
drivers/misc/fastrpc.c binds to, because both drivers talk to the same
physical DSP behind the same RPMsg channel. Two rpmsg_drivers cannot
share a device, and driver_register() refuses two drivers with the same
name on one bus, so drivers/misc/Kconfig now makes QCOM_FASTRPC depend
on !DRM_ACCEL_QDA: a given kernel build contains one or the other. The
dependency is expressed on the legacy symbol so that enabling QDA is
what turns fastrpc off, rather than the reverse.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 MAINTAINERS                   |  1 +
 drivers/accel/Kconfig         |  1 +
 drivers/accel/Makefile        |  3 +-
 drivers/accel/qda/Kconfig     | 27 +++++++++++++
 drivers/accel/qda/Makefile    | 10 +++++
 drivers/accel/qda/qda_drv.c   | 84 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_drv.h   | 65 +++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_rpmsg.c | 91 +++++++++++++++++++++++++++++++++++++++++++
 drivers/misc/Kconfig          |  1 +
 9 files changed, 282 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6803c60cbc64..77687a35ac13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22981,6 +22981,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/accel/qda/
+F:	drivers/accel/qda/
 
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bdf48ccafcf2..74ac0f71bc9d 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -29,6 +29,7 @@ source "drivers/accel/ethosu/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/qda/Kconfig"
 source "drivers/accel/rocket/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950..17686a592900 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
-obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
+obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
new file mode 100644
index 000000000000..e2f3f01016c6
--- /dev/null
+++ b/drivers/accel/qda/Kconfig
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Qualcomm DSP accelerator driver
+#
+
+config DRM_ACCEL_QDA
+	tristate "Qualcomm DSP accelerator"
+	depends on DRM_ACCEL
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on RPMSG
+	help
+	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
+	  This driver provides a standardized interface for offloading computational
+	  tasks to the DSP, including audio processing, sensor offload, computer
+	  vision, and AI inference workloads.
+
+	  The driver supports all DSP domains (ADSP, CDSP, SDSP, GDSP) and
+	  implements the FastRPC protocol for communication between the application
+	  processor and DSP. It integrates with the Linux kernel's Compute
+	  Accelerators subsystem (drivers/accel/) and is intended to replace the
+	  FastRPC driver in drivers/misc/. Both drivers bind the same device tree
+	  nodes, so only one of them can be built.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qda.
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
new file mode 100644
index 000000000000..dbe809067a8b
--- /dev/null
+++ b/drivers/accel/qda/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for Qualcomm DSP accelerator driver
+#
+
+obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
+
+qda-y := \
+	qda_drv.o \
+	qda_rpmsg.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
new file mode 100644
index 000000000000..f4430332ff6e
--- /dev/null
+++ b/drivers/accel/qda/qda_drv.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_print.h>
+
+#include "qda_drv.h"
+
+static struct qda_session *qda_session_alloc(struct qda_dev *qdev)
+{
+	struct qda_session *session;
+
+	session = kzalloc_obj(*session);
+	if (!session)
+		return ERR_PTR(-ENOMEM);
+
+	session->qda_dev = qdev;
+
+	return session;
+}
+
+static int qda_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct qda_dev *qdev = qda_dev_from_drm(dev);
+	struct qda_session *session;
+
+	session = qda_session_alloc(qdev);
+	if (IS_ERR(session))
+		return PTR_ERR(session);
+
+	session->file = file;
+	file->driver_priv = session;
+
+	return 0;
+}
+
+static void qda_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct qda_session *session = file->driver_priv;
+
+	kfree(session);
+}
+
+DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
+
+static const struct drm_driver qda_drm_driver = {
+	.driver_features = DRIVER_COMPUTE_ACCEL,
+	.fops = &qda_accel_fops,
+	.open = qda_open,
+	.postclose = qda_postclose,
+	.name = QDA_DRIVER_NAME,
+	.desc = "Qualcomm DSP Accelerator Driver",
+};
+
+struct qda_dev *qda_alloc_device(struct device *dev)
+{
+	struct qda_dev *qdev;
+
+	qdev = devm_drm_dev_alloc(dev, &qda_drm_driver, struct qda_dev, drm_dev);
+	if (IS_ERR(qdev))
+		return ERR_CAST(qdev);
+
+	return qdev;
+}
+
+int qda_register_device(struct qda_dev *qdev)
+{
+	int ret;
+
+	ret = drm_dev_register(&qdev->drm_dev, 0);
+	if (ret)
+		drm_err(&qdev->drm_dev, "Failed to register DRM device: %d\n", ret);
+
+	return ret;
+}
+
+MODULE_AUTHOR("Qualcomm AI Infra Team");
+MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
new file mode 100644
index 000000000000..dd3345b6a5ad
--- /dev/null
+++ b/drivers/accel/qda/qda_drv.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_DRV_H__
+#define __QDA_DRV_H__
+
+#include <linux/device.h>
+#include <linux/rpmsg.h>
+#include <linux/types.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+
+/* Driver identification */
+#define QDA_DRIVER_NAME "qda"
+
+/**
+ * struct qda_session - Per-open-file private data
+ *
+ * Allocated in qda_open() and stored in drm_file::driver_priv.
+ */
+struct qda_session {
+	/** @qda_dev: Back-pointer to device structure */
+	struct qda_dev *qda_dev;
+	/** @file: The drm_file this session belongs to */
+	struct drm_file *file;
+};
+
+/**
+ * struct qda_dev - Main device structure for QDA driver
+ *
+ * The DRM device is embedded as the first member so that container_of()
+ * can recover the qda_dev from any drm_device pointer.
+ */
+struct qda_dev {
+	/** @drm_dev: Embedded DRM device; recover via qda_dev_from_drm() */
+	struct drm_device drm_dev;
+	/** @rpdev: RPMsg device for communication with the remote processor */
+	struct rpmsg_device *rpdev;
+	/** @dev: Underlying Linux device */
+	struct device *dev;
+	/** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
+	const char *dsp_name;
+};
+
+/**
+ * qda_dev_from_drm - Recover qda_dev from an embedded drm_device pointer
+ * @dev: Pointer to the embedded drm_device
+ *
+ * Return: Pointer to the enclosing qda_dev.
+ */
+static inline struct qda_dev *qda_dev_from_drm(struct drm_device *dev)
+{
+	return container_of(dev, struct qda_dev, drm_dev);
+}
+
+/* Device allocation (uses devm_drm_dev_alloc internally) */
+struct qda_dev *qda_alloc_device(struct device *dev);
+
+/* Core device lifecycle */
+int qda_register_device(struct qda_dev *qdev);
+
+#endif /* __QDA_DRV_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
new file mode 100644
index 000000000000..6bd977e8d68a
--- /dev/null
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/rpmsg.h>
+#include <drm/drm_print.h>
+
+#include "qda_drv.h"
+
+/*
+ * Both compatibles the binding defines are matched here. The glymur, hawi,
+ * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
+ * compatible and so are matched by that entry. Per-SoC DSP parameters are
+ * attached as match data by a later patch, once there is something that
+ * consumes them.
+ */
+static const struct of_device_id qda_rpmsg_of_match[] = {
+	{ .compatible = "qcom,kaanapali-fastrpc" },
+	{ .compatible = "qcom,fastrpc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qda_rpmsg_of_match);
+
+static struct qda_dev *qda_rpmsg_alloc_and_init_qdev(struct rpmsg_device *rpdev)
+{
+	struct qda_dev *qdev;
+
+	qdev = qda_alloc_device(&rpdev->dev);
+	if (IS_ERR(qdev))
+		return qdev;
+
+	qdev->dev = &rpdev->dev;
+	qdev->rpdev = rpdev;
+	dev_set_drvdata(&rpdev->dev, qdev);
+
+	return qdev;
+}
+
+/*
+ * The rpmsg core requires a callback, so one is registered from the start.
+ * Responses are dispatched here once there are invocations to answer.
+ */
+static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
+			void *priv, u32 src)
+{
+	return 0;
+}
+
+static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
+
+	/*
+	 * Unplug before clearing @rpdev: once there are ioctls that reach the
+	 * DSP, this is what stops a new one from starting and waits for the
+	 * ones already running, so that none of them sees a transport that has
+	 * gone away.
+	 */
+	drm_dev_unplug(&qdev->drm_dev);
+	qdev->rpdev = NULL;
+}
+
+static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct qda_dev *qdev;
+	int ret;
+
+	qdev = qda_rpmsg_alloc_and_init_qdev(rpdev);
+	if (IS_ERR(qdev))
+		return PTR_ERR(qdev);
+
+	ret = of_property_read_string(rpdev->dev.of_node, "label", &qdev->dsp_name);
+	if (ret) {
+		dev_err(&rpdev->dev, "Missing 'label' property in DT node: %d\n", ret);
+		return ret;
+	}
+
+	return qda_register_device(qdev);
+}
+
+static struct rpmsg_driver qda_rpmsg_driver = {
+	.probe = qda_rpmsg_probe,
+	.remove = qda_rpmsg_remove,
+	.callback = qda_rpmsg_cb,
+	.drv = {
+		.name = QDA_DRIVER_NAME,
+		.of_match_table = qda_rpmsg_of_match,
+	},
+};
+
+module_rpmsg_driver(qda_rpmsg_driver);
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index c40e89cc5724..14b7bbaadcaa 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -269,6 +269,7 @@ config QCOM_FASTRPC
 	tristate "Qualcomm FastRPC"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
+	depends on !DRM_ACCEL_QDA
 	select DMA_SHARED_BUFFER
 	select QCOM_SCM
 	help

-- 
2.34.1

