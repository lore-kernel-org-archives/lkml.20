Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769509;
	b=uHDRJF2fAqVyxDuyrsQm8jnbha9axNz283P8rvwssVcxl6Pf2b1XM6VpBoeulwxAS683
	 J+UYumjdtp0bovDPzTnp5nsjgJDkE+jDbRDGQmiVz2QswO2hJpUlkRV/XMNujR5q7FXC6
	 +/tFN/jVeK8a1OOFv5BHCCj/gBWuwwvg/83n7dhpqP1kj8uqhXCTcyyMkBgfXyC1kvfRn
	 uvn+OZ74E7sQvmDwPBjXpvV6N9yA3nV5FwiRc8ZicfvJcv+UttIWPZW+3XWFacVZrprF0
	 rsMQdBZOYJkAGNg8/S69Dofh1M4nEobYQG8G2V4fUVklA8A0t+x+yjOXtk20Rp0TAYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=;
	b=0YTxj2I6x1IFPQ8RnvKCfmKYefU2aaoX29ScAb3EhASof/HfXbm5MsOoU1cc21rGo4ti
	 uzwBWXm4HlZKq+0Tiec2Hj7RF5s6dxXykM4liZE2K01pRMCOP8GvJOyJytfc90/RfvF2I
	 Icqx+XlUrTpMErdzRgQsnf76///P+bST6ANytXCIG2lwRVstVHl1xqpCxyheCixV4UpXt
	 n76fKQv3KyhSOgw1TOrjI9jQRtAZAJy06+P/NAfdIpgBI/S73ZvQe73xVB896l7vwwHEP
	 TEhF0oseYewUrh4ieDDbVRFq3E0BuKLzJiL19Q3ZUr+9dadDZwOliQ3V8iF9p+WGISw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W4iKzqSM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYKGcmZk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20EB60A2601
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E20EB60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W4iKzqSM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYKGcmZk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6EAZ1955234
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=; b=W4iKzqSMqHx6B+lv
	BBgeJIjHNZNzLnkJ8AbQAoEDTWTWFjcpj5GMBaJrV4zGinr7ype6ZcJg/CzOzEaI
	FAh+nOAM7/dL89wxj3d8pQn0Lg9mDWHNG6z+0f8XXPHw4LgDQmQFo8S5KcPVTugB
	FwA0XUwKGzmvbbWajzS8feYGGXqceO5wrCKsZjzy26WjEMvpqIjGUcp6LB0Fp0k1
	L5xdUseQiVlpv+vin7tZanMXuiIHVCSmokI8YyeuITeiz0MCzBjTsRMG19my1UNn
	vTS0MuQuCDj1ALYaRpnX9jPE9aX4z6kBiq8d6Wv0pQDgW3sJ8aH8oK3/SQ7ys0Ef
	rHYfOg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbmbu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso897620241.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769507; x=1793374307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=;
        b=TYKGcmZkT3ishGDpQy6S+mOsATqw8SK8HGHD7p7h47OEdz2EkjtrxXWr+HaS7GPLe6
         66W+HxVeljruMyOXi2Wyq5Y0xU6wVv4z1GMqHPHSPJsKordGRfb6+jl4RP/YW7G3NFeI
         xKsgx7FeBfIwhvQQattkHC52rkiIGTKAJ18eGhrDEEAj3eonH4qLFfeE2C19sYHFKlUE
         qnB1TjtXp/gFVf0qQUxKIMHUgH9y94b2G4n5MaWE4DLXAG0qynSpFXm0VkC15m/c1xMo
         zRdhkNh+7Jv/ZS/yXfsrUK5fdYfOVh1PWH88scqFlobrSSt2u2sDTWndAVfbU8HKr6mX
         rpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769507; x=1793374307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PImYCQgikueColtwmltOpJlwc8bGmhUG6ZJmVEsXAFg=;
        b=bvtfxOLk/6mSfLEI1DpPWhYQhQqJPVkh6Eu7TBESxWv48Uez0KLHASOO1wXelZ5rbH
         78t/aULYVruM3sITCrh/ZAsmwkhDhfES//u7OVgCt8I6vRTaJ4qm7/cueaY3WO3neQdK
         mW2nwFOxCoKquoisWGwfdQgrs+MBHXRKR6p3lS2OHcdB0N0KFgmU41e4e8jDqc1ZaVCc
         S55KaNxOQABUOOYes0FS3jKLzuWB/EkXeSsVwUdMDv77Yw+IcoVgf714P6+ZSyXm1fP8
         blstfYb8XlHA783pRcwrk7qn8pb9FQvW9vGzWtHn+8kIV04iUuoufxCCrAUvwP/uqigP
         Xksg==
X-Forwarded-Encrypted: i=1; AKwUvBzql+rop1GLf1Xvln9y25c8mSYuCGI3hLpgDRImFGS0KIDNAWO+Yw7QmmPU+ZLG0SiW2CtGY4fnbTPD1Ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYImTKYlTzE3k+k6X+cz42MzX/bl/cskja2PQgGIufkoe/fB83do
	uqj+fqeJ0qgo8rrxdbCpOGND4drcQGq+/drx3DfWPN0kIwZ8h1oEy5jjl9YBD6/FOjbLHZcScIc
	W28jPy4xGmf+uq8NnNxzWQy9tBq/S+ZWCy0jEA/q00mg9TjcK2l8RyDZw8e4MzZ2v4hM=
X-Gm-Gg: AYBFou3PMt8vCE/f0e+crqpPYD9fYdDQ44QYqBOzIqB2/BHGdhVHflA39wQFNfAz6dq
	qlLOYRaXiyBCdfpzBR5Zsuz6BoyUFMqXK6AhrdXY9xGtz0exgSDx+R3LJV+B3WR60/c6i518Vy7
	8ReUY4c2ejv5kaO+4+xuv961LWaIDYAES3NmbiM20ksznEV8XhiJ20+m0N9b6lzPqtfD2g9+H5+
	N8YgxMNgyAFSTYX6CCSuKXVIOZbJPZ0Lps17nUIoMkWiLwsWErueXiP8ixrLuHVYMalws4KT6GI
	nH0lkef0YGPyKQfMBh/blHR9ayV0+UiHgIuhTwK4ksTMK3oTgT9ot6pkpnMFZ/pYfsl+qiBZkdz
	6heogj1cmDZGqekwnwl+g/ClrBeHeoDCmQrSJmc6taNEvrX1syzX5slb2mX769L39LhBjZqfqwK
	xKkzsoPtni5DkZ
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:f062 with SMTP id ada2fe7eead31-7ccc32e6f1emr955178137.17.1792769506995;
        Fri, 23 Oct 2026 08:31:46 -0700 (PDT)
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:f062 with SMTP id ada2fe7eead31-7ccc32e6f1emr955155137.17.1792769506521;
        Fri, 23 Oct 2026 08:31:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:17 +0300
Subject: [PATCH v2 02/14] drm/msm/mdp5: forget the hardware blocks of a
 previous bind
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-2-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8zzii9JdhRdB7nBZfP+Qff9ThpfwQO2kWqv8U5qv/u0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233QvLsI0SSlFav7kR/7r5wVbXfXkQvPgCevQ
 6zBaDsxECCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt90AAKCRCLPIo+Aiko
 1fVsB/4uE6zB+ZCeEPSsh2+l0rlt5kzuzPpCdeocaGaRJoRySeT3WIGe02Se4qOsnW90nIpKjec
 E7CInyhY8fDDp5M28T1qqijTDyeoqPGCaagDwxy6FDPjpOXH1WVJfrL5PdaYGIHWIqzwxVxNcf2
 0FPBahxSKBnsbx+uafnSQo6HqfAS3Lp3eGaVK97nijrQclB66p+4d57GGuIr7/FeNcCupib2GGT
 oDK5sNDV36ylSApCzpiSDonphao2FIAwyaUzQhY09+Qm+RhRx8lZOOkR/v8JRSPFtuQQI8BvdQf
 2Cls4LaGRNMnm6cXZrQ2vcioRccLaV12rOvwTkfD94eMoDBC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX0N+jGvL65+hW
 uZJub6SH6kr+6Dt35hGXUHkcANsIy40bKtdtpXLTgVkiXAIwNgMRDHvO30A0y9XMG4WezbpykHw
 zI9xksR3XSUN1G9zARNg1s1eYmdYZKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX9X1P06hlW4gW
 4lWpnQ/PY9U31NfPw3VyZQ4lYIixinqFJFmMwIsXg+m39+9biJDnRJIdXsN54U1bzCA1t3B7YjO
 RvrxJqOUGvM4I7FP3+B/LZednu0ECKk0nGQAAA4O1F+TvMdyaAzetTROnH4k/uwSphzVDvun1mJ
 oNfqYEvaxUfn0tBISYvE1dBd9fF1BAp5l9ZerBJmV8KZoiF/A3awRAMhse0qPQn5YLwU6yEPDGh
 lXbkgA3fiw3s8Mkvq63krzGrh+Il8imHXEn+BwAmhLdX8avMNAyTsTNypVS3ZPlmzKGnC9/9Qs/
 ThuUkjWmdOibiLW1RyF1NCJNsJ/EhIeMXFoJeVRyFljUVAphQBZXVKL53iHHx+xnkOUW/cm77JY
 f09Geazwy/YRVHWV5W7hrARsczyVVVrAQFH+7fDCRkxluqLm9IdLrxAOZH/mBeTY3BlAET5Uwvr
 KI/fJXIzbxvAVm+kAMg==
X-Proofpoint-ORIG-GUID: Xq5cdYAYM8r20nEsHr0kUO6l93ccdvZa
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb7de3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=X8-H6Saci9yJdrauny8A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Xq5cdYAYM8r20nEsHr0kUO6l93ccdvZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

Binding the MDP5 driver again, after an unbind or after a failed bind,
corrupts struct mdp5_kms. On DB820c, binding it after a failed bind
oopses in hwmixer_init():

  Unable to handle kernel paging request at virtual address ffff0004d411f9d8
  pc : mdp5_kms_init+0x264/0x7f8

Since mdp5_kms is allocated in mdp5_dev_probe(), it outlives the bind,
but hwpipe_init(), hwmixer_init() and interface_init() still run on
each bind and append to the hwpipes[], hwmixers[] and intfs[] arrays
without resetting their counts. The second bind writes past the end of
hwpipes[] into the fields which follow it.

Reset the counts when the hardware blocks are torn down. The blocks
themselves are devm-allocated on the MDP5 device on each bind and are
only freed when it is unbound; that leak is left for a separate change.

Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3934cd060b27..085c23820f46 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -570,6 +570,10 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
+
+	mdp5_kms->num_hwpipes = 0;
+	mdp5_kms->num_hwmixers = 0;
+	mdp5_kms->num_intfs = 0;
 }
 
 static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,

-- 
2.47.3

