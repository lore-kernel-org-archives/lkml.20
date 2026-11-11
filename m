Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357790;
	b=32ytIXQOuOnMW0H4FBrzpXy7VZIPI0yrGPl8gMmHZPvBGK4o6Sae+Ew96eoA7fBJtPdj
	 cBteiAVawmfGpEE2mGDFCt06EdMaUR2xjslS1NMVlsT8C7OOhPulMayfOZJxXnZUKlS2j
	 4zEW0QymMWQTpTlp7UtamTNUFlwYsMSWxNlLD1cfR/OfzJD1O2RVQKwwK2pVkrwAKe5WG
	 EH04Qddcmnb9TjobbeYF/JfeaX8+R/iY3Huvg4ig3godgB/rlfAYJI/5wB7klsKmIv1D0
	 h0ncG043t86IAbJE+sb0fv3vgan8yiVp1IJa0u5T3sYKEgM38CMscO86o9Z5L0kmlSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357790;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tg4X3cdll5T1S7kugUAtHU1yiOSVpqm9E/2y7Atjkho=;
	b=4xxNHN54FbibeI6pTnTvwQ7jxgOyn63inzFa/8H+ogaXChcptxMP5VLYSMGTSBH6hVG3
	 y1IQDjJfvOrLGM0D4Yn4mRrYEZuJ65OsNRHW6BKrZpgA/NuFJ9KONtNFaVPVIfgkEFRq0
	 zApLeeoIrnu10yUac0wKGq+/k5UPa7kc5QhK3OkXHJcPaxEMhcWDingMrsA+3ijctlV9b
	 nkOzFsKtCvs9SOFSE5o/IcuYW/bHMWcj4beANU6v+bpAWhxnLp9OBOFQvLsaHKBmj8Aaq
	 TsFwUio30GwtBpm4QQKqF6paT1a2jQM+TpqMcZxGUjtiKiGajIFgzDyh57fuI3CzqbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cEsksMOt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0fSPTiC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91497606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91497606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cEsksMOt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0fSPTiC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKcc51113743
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Tg4X3cdll5T1S7kugUAtHU
	1yiOSVpqm9E/2y7Atjkho=; b=cEsksMOttxjAKuSzdboUbArSKwAsz/CF3eqM/9
	9jFuS7edg3Ynh7bPrA1UE7NFTHKIxC1U9GNFh2o7CGvroD2GJagqeZdKDGxZPrAt
	4OHM2hI5GSzHrjPmkpAytvP6s25PnL9J+ohO01joGrADV1EoV6GgBgoVMTokgdYi
	dVOrHPTE8urO75toSDGj0rN37AVEB6N3Hn0XtZPnVB7D1BhafCZOiF0mDByZCEaY
	AxaY2i+86Ij/YZNaVaRrtIG/jAld4Wbh1eXeyJn+lJ0oj7cN5x0UaaSGjRrXOxFh
	fGfWArXj3aTVsnqXjF2KdyLuWFML+3Ru+gvg3hx9o1Kbv3Jg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c9546-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:43:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea71789d8so70406216d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357787; x=1794962587; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tg4X3cdll5T1S7kugUAtHU1yiOSVpqm9E/2y7Atjkho=;
        b=b0fSPTiCRSS/nVFgQB0nQ+kibm2Zg4fx+UImsDfpA/h3HBncfFGITNFEqhGPLKS09G
         h5LLGPgJtqN9txnAMcZNe2f50mfYKVJ9NB3K5nnCc/zOw1mJLT+zIzflGuws6NDdVgRn
         SzITh33yOBHjdA3iC+0Gk06Q6rJfLGqK0zlstY0zuabFX/OzK2iTO6hTaeW9YV7Ho5Ft
         orAWoDPyuxYT1b1xphH3jdJRAlCtB2AjSxuFgaQ+E4Q/RsuLw0YSk1pIydVM1NCTiu1P
         kHLB135lpeQCgir8XePiJbehK9yiBADzUAwYbBpXcXhU5UDYrO6/FCPtDqy+kUEIXDQO
         aHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357787; x=1794962587;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tg4X3cdll5T1S7kugUAtHU1yiOSVpqm9E/2y7Atjkho=;
        b=bmhqnQTyDVLDb+LjijMjXrQVv70Qfp2FDNpMbhgO/WxNVEiDsdNMY7mhouT6nmiAD+
         gHIaOIKBiXs2583xzBuEcisxOfCcp4U6g+T0XCWL9EGrYcOxaDb1P9+WpFb/BlbH+ScO
         gnR6CXozC3B+fIIRSf1gpMRW74qtJ3ZLSLC7WhCXOVI1WzscWJzZ28OxynGynkjEvOSA
         j1wk5auJ91WB47fv6Z9FRL2bmcMJp1IYwaqTZCL0U5KXHN7/hzdEljfxAO9+ZDJ2wR4c
         8Qd9xdExP1pSt3l0dGxgCOqnwTAbQQ0jK5luaoTVRxUX/j4qeZjLJzTe9rYhTxDMeABY
         Ummw==
X-Forwarded-Encrypted: i=1; AL+hErHph/19SL2XcaUnebHaPUDW/+SsdE4BEn1EY+/UZqZ2REDWywbKvNQRW+orezm0qr37x/FayFUGZ5VRyjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XjHwYRH96RjEgnhYsDzeCEst7HZwfuON29BKfbncenZO7LQaH
	24Gzx5zjOc/UYHP7/0+xC5QT5OgRQXw0vlidhn4lVSbIe78ptZF6cM7bJ5NpGWmQh+cvjvuYPiZ
	eWmQQqGVXAwBfAOCVj60PxqmYSNRDNsqosQyGyy7guUaimIlg3bpxzCyixXJNz+Y8b3s=
X-Gm-Gg: AYBFou3XEcaI4mNohsBgAqbtruuiL+sKI9MdCfIgvdruVEGviVpFvBmnigvhCOX5JBk
	lNLl363KYNLE9+gHX3W5YCUr4Zr21sCWC/zGgrNGj69JHZ+BmKcqYD8fZ4Eh79fHqK2zpo8mbyt
	KqAJfKQDUN7kx3mwuBDMUGZ4N+jeX0xOS2n3PXNARliqn3mLcTOnaBpdoGgdnNUy7QIzXcnmIRz
	9BHcRchHEG15xKSqd5T85b+iOpouMEjiwOsL6svT+2N9F0jZEf2OcXRnWHhYlTWp8iQ5n5OXyag
	fkjUhX+qvsHFS3scoWJAxuEkR1F8reu1bxGjQD6nEMFT2QNiqMp3bbOp/T9gUW3ZT8XPJnsD0EP
	dtMF6HNuuJ2M4XdQ3y4ysH24i6i3hvmbMhO1UaxaDOAgiD9TtKd6E7UqvQhtS6rc6/r9Ctln4Sc
	eM4S0iBNkJkBojZ5I0zwgcGt30dOvBvMFMbYjnYGVRLcJApkP5G5DRdFl+MaAnJQ==
X-Received: by 2002:a05:6214:4109:b0:91e:8cb1:b842 with SMTP id 6a1803df08f44-91f0416afc3mr18101346d6.49.1794357786446;
        Tue, 10 Nov 2026 16:43:06 -0800 (PST)
X-Received: by 2002:a05:6214:4109:b0:91e:8cb1:b842 with SMTP id 6a1803df08f44-91f0416afc3mr18100956d6.49.1794357785839;
        Tue, 10 Nov 2026 16:43:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092896d8sm7499011fa.32.2026.11.10.16.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:43:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 00/10] drm: writeback: clean up writeback connector
 initialization
Date: Wed, 11 Nov 2026 02:42:29 +0200
Message-Id: <20261111-wb-drop-encoder-v8-0-62948ed87d13@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPW582oC/3XS327CIBQG8FcxXA93OOWvV3uPZRdQYCNZW4Xau
 RjffajRmdTeED7C+ZGQ70hKyCkUslkdSQ5TKmnoa9AvK9J+2f4z0ORrJggoQAOjP476PGxp6Nv
 Bh0yNstAq4bzwitSpbQ4xHS7i+0fNX6mMQ/69PDCx8+myNTEKVCOXXALHqPzbUMp6t7ff7dB16
 7qQMznhA8PknMHKRCOYD8Ajj2aBaR4ZM2eayjiurbRRGWjcAsPvDEPUc4ZXRmiPOkipDbAFRtw
 YCQLEnBGV4SikcqpVNuICI/8ZyXDOyMqY2FjBo2YNgwVG3RkGz/5GVcZz1NqiDE7wJ8zp2oYcd
 vtaq/FaCeJsCfR8KY2blc8d7VJpX28b2ofDWEdPf380LrSZAgAA
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        John Harrison <John.Harrison@igalia.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        John Harrison <John.Harrison@Igalia.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6121;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eaXxqDG4WrpTkfdaiMoy+rNXi5klWk6+CeDvCurUMK0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq87n6hOU2QvpLiPujdsHCYHYfu8QrSQipqUVwh
 rP0H5Xo42CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavO5+gAKCRCLPIo+Aiko
 1YvTB/0a9YP74Woyq7Tx/JgbG6dxAN/qjgPFsMEZehC+9i3MVe4qiudQeHjHIGfJQvTduTO9Xqk
 tdFImxF3Hgmud1zSHt2T9loQX8oTx1pNCacq6kCaciiI64Y6SJ+d/N0vUyVVUpH77b0Nqw12ESP
 kl/TbEJKOBH8xPUzhMrDp8T/Pc7d3r64JpEgNO8lHLEU6Ts1z+j8neRmLLYq5T9Fb9iE0gaW3kI
 GfP9BXJtkeRj5M23Zcn3EyEa/S3EJqpa0deIEt/yaP+JFeGtn5+NZAwlYlDobyduHTYEIcIoXJ+
 WhoS8YRnyTSA1orhhwRUBgKDvvyat0rVOikzuzu5bOQkV4Em
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX7yzKB4E/IsAc
 eaST/PvbQVlj/mTmlHTPTIyZxCggMj5vtQCMUAeeFSWO8qiedhYfPh9xPEtIVY9UmraeoTuzWnS
 mFvRoO0PqwKGPsH2EtWwT8lTzW2z/qpbs/Le2LspFaznA/fZ026OlRRTJC1bkgdHIy2poSMvXd8
 RAVHY5bqDLo1ug1MAH02bziTN3qOYsAJAg5SPbdTKguRdSSYnAYtsxnoZHdAzDoJWLlhQgHaPJB
 zDIaFwjZ1xwvXB/WMxG6rBQgmK6KVuGsgyPAHNqlS1oYIu2qsTAp7y1mWZ2AfKYRxuF9G9P6THC
 Gb4Zt2OaeCgf1e6kmM/+AsAN0uA3/3btMZP5RZBbdrWABKpONwpaHe3klzI3JDafkbxbw8tTWE3
 B2fuvgBbAFarcz+u5Uc06EKVnwo0eAjtbfRmNlcooxKMjl7tQumKYaOTJyHyT5frDCcVRzWuv90
 T3AFPSXd39+6Q++BYEg==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af3ba1b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=V2sgnzSHAAAA:8 a=zd2uoN0lAAAA:8 a=7CQSdrXTAAAA:8 a=P1BnusSwAAAA:8
 a=RF00TdSWAAAA:8 a=P-IC7800AAAA:8 a=-VAfIpHNAAAA:8 a=e5mUnYsNAAAA:8
 a=wUE-LUHtHEr0u8wc4aUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Z31ocT7rh6aUJxSkT1EX:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=D0XLA9XvdZm18NrgonBM:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=srlwD-8ojaedGGhPAyx8:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: yNH-Vqw6-Nj8Tr0wdUv6czKspG78W1uW
X-Proofpoint-ORIG-GUID: yNH-Vqw6-Nj8Tr0wdUv6czKspG78W1uW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXw4fOmyw1gwJY
 4ZWoqRkllr4Fd8G8VNi6hnVvXetkjeQVlAAZrV0kyr9WPXD+1ReB8mEghBEWwvtUqQJ5Dyos2Ok
 drJw97BivUboOLwdSEkTT3oEvI+UWkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Enough of the drivers don't use
the encoder embedded into the drm_writeback connector.  In preparation
to further rework of the WB connectors (as planned to enable WB for i915
/ xe drivers, which would move drm_writeback_connector to be a field
inside drm_connector instead of subclassing it) remove the drm_encoder
wrapped in struct drm_writeback_connector. Rename the
drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init()
and copy drmm_writeback_connector_init() interface. Then, with the
encoder being gone, handle proper cleanup of writeback data in
drm_connector_cleanup().

---
Changes in v8:
- Fix the out-of-bounds access Sashiko reported on v7: track writeback
  initialization with a new drm_connector::wb_initialized flag and key the
  cleanup in drm_connector_cleanup() off it rather than the connector type,
  since a plain drm_connector may use DRM_MODE_CONNECTOR_WRITEBACK.
- Clean up the writeback jobs outside job_lock so the sleeping teardown no
  longer runs under the spinlock (new patch).
- Link to v7: https://patch.msgid.link/20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com

Changes in v7:
- Significantly reworked series, no longer insisting on using drmm.
- Link to v6: https://patch.msgid.link/20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com

Changes in v6:
- Dropped applied patch
- Implemented suggestion by Alex to use drmm allocation for the
  writeback connector.
- Link to v5: https://patch.msgid.link/20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com

Changes in v5:
- Rebased on top of drm-misc-next
- Expanded commit message for msm patch, describing devm vs drmm issues (Laurent)
- Expanded commit messages, describing why the drivers are converted to
  drmm_writeback_connector_init() (Laurent)
- Link to v4: https://lore.kernel.org/r/20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com

Changes in v4:
- Rebase on top of drm-misc-next, dropping applied patch.
- Added a note regarding memory leak in the AMDGPU driver.
- Fixed a devm vs drmm issue in the msm/dpu driver.
- Link to v3: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com

Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: John Harrison <John.Harrison@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
To: Leo Li <sunpeng.li@amd.com>
To: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maíra Canal <mcanal@igalia.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
To: Mihail Atanassov <mihail.atanassov@arm.com>
To: Eric Anholt <eric@anholt.net>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org

---
Dmitry Baryshkov (10):
      drm/amd/display: embed the writeback encoder in amdgpu_dm_wb_connector
      drm/komeda: embed the writeback encoder in komeda_wb_connector
      drm/mali: embed the writeback encoder in malidp_drm
      drm: renesas: rcar-du: embed the writeback encoder in rcar_du_crtc
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()
      drm: writeback: don't destroy the shared writeback properties
      drm: writeback: clean up writeback jobs outside the job_lock
      drm: writeback: clean up writeback connectors in drm_connector_cleanup()
      drm: writeback: drop the drmm writeback cleanup action

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  27 +++-
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   4 +-
 .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |   3 +
 .../drm/arm/display/komeda/komeda_wb_connector.c   |  24 +++-
 drivers/gpu/drm/arm/malidp_drv.h                   |   1 +
 drivers/gpu/drm/arm/malidp_mw.c                    |  25 +++-
 drivers/gpu/drm/drm_connector.c                    |   3 +
 drivers/gpu/drm/drm_crtc_internal.h                |   3 +
 drivers/gpu/drm/drm_writeback.c                    | 156 ++++++---------------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h     |   2 +
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    |  29 +++-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   8 +-
 include/drm/drm_connector.h                        |  12 ++
 include/drm/drm_writeback.h                        |  22 +--
 17 files changed, 159 insertions(+), 167 deletions(-)
---
base-commit: 41b5458595c60143d0ebaa1e032c9cda5d764dff
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
--  
With best wishes
Dmitry

