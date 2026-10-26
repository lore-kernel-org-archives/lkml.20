Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995895;
	b=KHUv1fEQbea24nkgqIZIX+zf9jE5ej/6yiY/jGoLskeA+tvGNYh93waNCfZZdXApprFe
	 eyHB2d9d+veVe/UYbmgMPWzOeLuVlqa4zEVjulNusBwxcK5Gmfb61I+82SFfBWHjh/5n7
	 NhARjle5I65hSAT0bAQ6aOmsuQXVmWbHuv7rBsEUH8rk0Z+bN13i1SRp4ANyYzEynlG9N
	 rruOq+1WV88z9XV40GcBwIiTMRADEw/AsiSBxR47ZQcpRuqstO8evgLkbyH7poS3KPyvJ
	 DLf/gQdwtYyqBWN4cmI2+Ke8JNOAfba41RjrLeMk/iXqN/TqtoF67N7c0ACqcgiTWzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
	b=lSwwoZXovTWz2p3OWFEOgopG7eG2QmVTi/8lsUdWTTU7ifnlPi15l8YaHMf8Js/W3X06
	 FxT4/+xwNisPZUEkIMGbJHMvGeFwpHAPlMEzjKvyu7xjOeMR9KorX51sx85uv2bTJqsMD
	 7bwqc+aBDLuMa/3yRl9ciJEAqz1HyIAko/4wqEAVQ3+iHLBppYbAfCjYJsxtZ0ShSmWu7
	 MYV8gC/ACjtgQs5xljByINKnFxH35LPm5B/70HBEhrAdK0r6GZdwIsayb2GY3qjxw0qFU
	 PuZZ4Ne7gpBfYSwb6OMF3NtDL+hAjkS10L3/UTLRyMqnzrHb9x+jmIGESmQxzejrGMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfO+XRp4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmraj0p3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50677606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50677606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfO+XRp4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmraj0p3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aSKl2222559
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=; b=RfO+XRp4pjYRM/xe
	mG9DK22XFlQQwhgLDBfJpX33NFBxj96FU7sl8qDGu+Plw5ex5UktXN2OLXZEcPB3
	lug8o00Xm0AzYhEad9Za2pih0Tbw5exLhKuoCnzPprxIuijvxz4zLfEKcFBfYNBD
	f5+Tb9YCPNgaxfkrq7X4qHuv8gdHeoQw+OyffCNvt95dE6s1lAH7r/ILD/USzVUm
	nwszRM9GZvSc0tqFQRJWBBDN6XG+UW+fGRSaExZ5Y1kMG3hd6Sy/gqDES2f0V+mA
	xysdEC50+zKS6USAkgaQint/7kg0MWwL/gfkLauR2rgrEFrK2k/1zcZdMguReItg
	yLnhew==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd8u12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8e16d22d8so47068535ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995892; x=1793600692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
        b=Pmraj0p3jc+XiKtQWDf6kGCYzkt+NN1PgXCH1bwT2RHr2fJCk0bvHCoMxljqS1Mh1b
         gRnnjLQ2lSJqfdThDi/IPKnoj+Mytx44S4S9i/3DpQyImieFeVAg87pmKucofPl6eCmf
         mIvG9Bh5gdHMPtTfwD+g65xWUte1ZNZU+lyc3vo3rBtGDpAvzdTez1Se6NwXAsd7MH2s
         DH4Rwrv1uTiHwGbxTi33dHs+NiHQEYdzkPve1eH6QUeNCDXDsqMktzPHh2QN7syNP6WB
         W3daK7/EDZrbwovBrZyGeypexIAPXzxZj7MNxdVOqdQlsN4o/GbqhbRrIwb/BqDC05hO
         w8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995892; x=1793600692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
        b=OxmPXJhu9NShTytjJDe/sw6MSmVjwZ4G3Aj5b8rIxbKI0equmnBOxFl7s4/mH+EPK+
         fGjCaoY4TAg+M8p2pnLxpkz+a3l4ve+ghZg8Onxzk636rIie8ZXlr7EcUWASapbV1tb3
         CGQ5RE3oegxkBlstMWePVjhjDd6zqVSL1Vfcr4z5+vNZI5OAxcvB7FvkJVWuf2/H3ReY
         xoHPs8eVqwkWWcdTkt5YUZyv25HTFTSbxxfRhoYKhQpmQ73Z1wTOOudZL0zDptCvmJaU
         W7JpN/EOWDDuDT5C6AQo5ARRB+zX2Fuyew9PF2b0x1B55njaP0mftl4YXSADNsnDUnHv
         LQBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQPLKGFfXNX4/X8fvnveSWTNqiSiuivNEHkXb/DtwcizVlrSlEFdbp68hxypoFifqRozPLZ/X1+4LqLiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg56il5eXcrabaVfcjyTVacqpVW1FtvBmEvkaAp+xba/1qtpNh
	0vd3iovT/e/UPinbBj3J5y/kkFWnt/9eXxru9q9FPn2tudxL7a1iS38nLvvijZLigLvyA3YDTCF
	36DFHc1spt5i5VB+XZTiDcKjavc/VfKSZLBxrDjVFHpHQBVsE3BZvdi2v/kNkyfxI9M0=
X-Gm-Gg: AYBFou22MBgiQCfFaMTKu+lYOJa9q+4wgTFwSHDf05h+CehuVl51qdtr+J/ZTNqu7kn
	N2kIq7yOhK25ZcX1grizspg+E46RujdaP2phAbIlqOKpIznETRQ2JqzIxZIQodp0Mr0cjObk368
	Ta1pXHj62kH/9GUDbZJRaKODudTjXt8Zxo/Sh9zcGrlwe2Nz5ulKqkUen7IeIdVYxBaZr2l6gNU
	W7S5CofVu730dAKoANCKM/4hjLq5lCeMUff2gXUQUs8qKaKSghS4OEioFfR8YFVtlMMCWVns1vC
	ciP4ibN0Fy8xRX2puU5Eq9O90sM8W0WpOYW95ZChASYEf1JvDUMQXD3xfeRCoJGD14GOfHz1WUI
	I5YUTy6VgllARElARbKoRDWg6Kg8ASH5SWg==
X-Received: by 2002:a17:902:d4c9:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2ea9c8ebd4cmr50093395ad.51.1792995892312;
        Sun, 25 Oct 2026 23:24:52 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2ea9c8ebd4cmr50092955ad.51.1792995891873;
        Sun, 25 Oct 2026 23:24:51 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:51 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:28 +0530
Subject: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=888;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=OlbpUMWfalcU4LvUc4XxjyJ0N4RsG6REGtg5lYpZB2g=;
 b=hqaldRzU9Cfrh8WAe0bLtlXt2+O+xAhC8XiFVF+11GcI+fP7EIgtkw/lV0bwk/zrXWsIWG3i6
 OCdlUUwhFkECpl0mDzYq/rh+5qzmVsGCw0XRLE0D382TWK/dkx/0epo
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: OQSw3lKv-9BUS_oQSt06XypIj8baUDBj
X-Proofpoint-GUID: OQSw3lKv-9BUS_oQSt06XypIj8baUDBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX09W8g93lRIO6
 8DXNoabqpiGZBpZFDgJa/hpTmYwB/5+2NzCznQMb479lWslznw6MwNMY/7Qaz8z4qNbhBHUoiLJ
 GUZyG4cdRd2+Yg4VmCmkDuhsVgYiBWQYhVxZV2EfWX2Q9q9Ei0K7FZEgmot7PDnSYL0sG4CFvrt
 HTqb+uUgh5uGK+GDkHh34g6bSdbsReV0FoCR8DjnP4xJctDWK7BF/xJ4T7r6porp2XdAF6yblKx
 74+fwN5AC2WLJwRM3bjkl+k+KbZNZCtgv9Hx4XDOkaW6gEOWUy7bewW03ZvyPHmud1atmK97H6j
 5ULPNxqFZ4aUR2+UAKMICFk7BsvWpJz4vnokDxva6Yx15gYiXWRcW2OI8WNRU6ucmYrKWQu7xrS
 osVyimBI8exWMTuzxenEEDe2L8qJchOaOvOA6sq9Ji82h02nPA93jK7lVRQYc5SxDKD/XU3aGlp
 UU2fyDwzTx6Uod1cCcg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adef235 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WCyPByqoPTdveakBLZ4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX+p0S8NyPvp1j
 rjagzN6ea5VA3sG3qTe8Zp19glo7h+PK291In6Bh1xKke5ORR+xUGk9ia0CPCNrqZKYd5xl7a8L
 EEVgzCkKBaVe+YyIPgFdbg3ZtAYE/PU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed
as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
common VirtIO ID header so transport and function drivers use the
shared identifier.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 include/uapi/linux/virtio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index f9056af0c622..6c6f283733b1 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -70,6 +70,7 @@
 #define VIRTIO_ID_GPIO			41 /* virtio gpio */
 #define VIRTIO_ID_SPI			45 /* virtio spi */
 #define VIRTIO_ID_MEDIA			48 /* virtio media */
+#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
 
 /*
  * Virtio Transitional IDs

-- 
2.43.0

