Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802165;
	b=3VBgqWqIe2CkmXNLwZ0+ySdcXE52dgfm4kCV6ZU4fkIvo2p0Y1j4ouLXDXuWMlxauAdA
	 1JNGr1UZVHHUAzIx44XC+sZ7ZARS8eCBnw/xbtK5Zpb/R0fTsbIMaPldU4Wk3MLeO9LMy
	 Ado8JFThG5DNhwYP7AgtXMBwPq5h8Pc1SwGLloJhytAD0+haMOmDOin+dUeDXYMtLDVp4
	 mX0hJylh2dchWbMpnr/WbaN++jkijXEYPtAWkMkhELBmamkyzxhW4vjghBdiQOI0mZ2qR
	 LjXBe/EaRCHE9OUG+6dcWHMFHuMlLfKnxqDephE/BRoQIaNMD5UOWGDhsAzreo98m4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
	b=f7mJNbhUe2QZwQ35EO/RshujpL7DfEIMhcqp1oAxO60kXBQ3tfzKoqvLGHVmPBAJUkbA
	 qtxIYaY9Z6RSVG54qvakkDTPrMkhaM07i19N8nPBm6/0U7lXbfgyStkLOQ/pEzgEgFjA9
	 7UwGhEDAdFtlIpSEQ+OA7HDY+AjjDeyOMCTani638UJtQ7cs0V2a1RdJ1XfIoASMh0wH+
	 4QVXIir/lX0BFSFOjlgD5c5LiicYCZV2EmPr6h1sgllVgFQJIL7oQcgKuiQLwiNSR7xKa
	 nuLy3R5A9xyRZfWj+NrCoyLEp3Ysnqko/IT50ANMBDxZXGxL/wCMFCCcR1JdNmVLRkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X5PXkxML;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gjepgwal;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE53606A324
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE53606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X5PXkxML;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gjepgwal
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuxbb2495561
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=X5PXkxMLShfVuQpn
	RNM1czD4Xr9K5BPvqE5YMV5/fkXBKuCvX5kaFmCAc3N2KE/EOAGeT0pjYdZXlZX/
	4YbST8blcDp5A2NDlKMgOJkd4VcJZ6fwWHJwHWUXU8zRTVJqrdIM8RjHeWrhU5uP
	SfOj/cTcskr9F+dxhn7Pf7EAKjRjMmkRo1x2CU2ILKMvwptPdA2kn8Xy7hQ0dnxN
	lZbDddUSi7av9O8I6waKW5oZZA861JtZbsDQrJqS6lv+G87HkfOEZ1meQvOSAb7j
	AmbSPuhLRvG5atn5Qaj0U8mv+QzkdHMce5ud9yuUevdmMhtU8wQEMHgIQxa66Wbn
	Z0+ibA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr091yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:36:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso225604985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802163; x=1793406963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=Gjepgwalawo9HHnd4y/u2q3Zf/Fa4XgmeCbtZaSXuvQGE913nIjSQRcvHs/w2I6epF
         eGsefH0uzhFuosDMsroBGsro2yqFCov40HpMOoxU9/eL2HuPxeW7WXZ2deu64HWDbP4L
         HufYvCseT0CA+MROFrEivEYq9NrC/Qtd/JSjH1sf2CsfIu+uu55zpDZO4WViigDxyGQp
         Qaj8rJA2JluXOF9iyTo15JJAgcsa+slbO9iLOgj01gXl1Cy8HHoMl8WuwCZWIkmQMe1N
         siBh99tVRYgly9kQORGweKkdCOuDSSQnXppUEHRs3z9MtMCZMDmwUKZYZL3nBAjmc2e+
         Fj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802163; x=1793406963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=ufMytnb9+zwouOMeKDSioO5kdPd4bGcaaqzHI+IG6Rj+2sG3R4zNm7qDAEIBLSHiql
         eIhvrLq+XxnF6WzdIOdY/pQcO5p/cFDJ3FGlr+v8HiCo2Glil9OkLo+I3dAAF8z/qret
         GIGEopncR1yXLwKLOJUP1RAad6IUdkF84DSvj3WffADPggqH1CoZY3TMefiiMrY66JFQ
         5Oup+8iePq505ot/HAtO6neIy0L00vZ6lPtg0JVQGZY85tooZWBbffAUwgumdMpc1QNR
         Y9sHpuAwnkcri27jgAQq5PJoSO9npcbDwtikzvcye0z1d90zVt7X/9G1/iAL+mpgHdq7
         4Wow==
X-Forwarded-Encrypted: i=1; AKwUvBzTWK2XXqRp786LhO9ZTGm8WyoPl/LvH/xEnmJAtPAoTF3zTBD6h8V/NHyMqCB5D7nYT3q9syHykZOdevA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIxyYscGshSdv+3qoEgxzTt7B0qz0jvf3lmy7Gwl1iOSz0Ll0V
	iSP0H5cFvjY206IRSdSKkgEFjrT+6aQffwIY0zFICEsOpJAluYdv/0EYXaPYe1MIYkBOxyYFXXz
	rtBkGnpGUNhemGqApumPThIc34LrcB3jnsB014EuYLG6SXlm2FZP/413mSrrJha7FO+E=
X-Gm-Gg: AYBFou1VQSlxkg+pIEVDxQFA2NHuHMRNNoF4vpPteQt+0bFJHSIvaZOxtK+QxtdjvOg
	BBJksCHz3o/wqxrePKsjr4NEJrVEyV8J1P3Cd6zbQtdGxsegONpcHT8HlToi3KzLrdmJYEbPgWt
	aHRvGxUes8D4REIgYxtysqCNrQ6BMy8lG8s6TE8bU2u+zCOjN6kMMZ/eHnH/vdto1Ryr0a1654M
	MgiGeEqdzKLtNoJOsByKcQj6QtUH7BOMDvuZYBiiPrk41hJ+aYDLv7UoZKc0WCwmiRXS78riGA0
	PfbgRfs6Vl+N8Gn+Wt+1v2goMzq5kSS1ez+HS38IxWvkckRV0Q8TF9UfeXemg/qr+K7qaFaDk1Q
	6vePl1BUe528PzW3WtPSJxkQ9ISymi35Wuqt6251ccSg3I9TxBi5l7ShO18Bg+OGmf/yNIkATq/
	Nuop/oQHmnfBt+
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109940285a.46.1792802163157;
        Fri, 23 Oct 2026 17:36:03 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109934285a.46.1792802162668;
        Fri, 23 Oct 2026 17:36:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:22 +0300
Subject: [PATCH v8 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
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
Message-Id: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1SgHKkiJWw2Q/RmkX21UPsNJT6d9sWxsWfN
 lGk1cDfUG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UgAKCRCLPIo+Aiko
 1abQCACx1C1gEiCjh/JA22nJY5oMv2sH85fmApV29ur3ZJHiuL544WoNV+08rQuI+2s1l7u0BfB
 pSH3B3HC6A7rQlqhDPIA2ruMLYYYjriz6QSC6lw/1JonyaVTNNm8xvMZ/VOSDO60jZpXprD143V
 EqlmhijNpaAWTY4Echcgkl1UjRZvVlWDS+tyd+BfNjvz5PIPoLfUR50gMU3moSgcfAV4eIbHFr3
 LQcvtn/0yLkoo4o5hAATZZOchduLmibkjvq2qCB7lkAlkqZMg6CummmnUdc3zBbEqljwccC3sPw
 wbS9DfpRqegDI381OagL0f5T4ASlv7jgolH3vPOzjKcXhbWk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Oh9jcMPc5t9f4PodX7DiHpRAkq9lVMNo
X-Authority-Analysis: v=2.4 cv=FM6OVOos c=1 sm=1 tr=0 ts=6adbfd74 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Oh9jcMPc5t9f4PodX7DiHpRAkq9lVMNo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX6ql+ZlwoyX5L
 dUZJGMMzN7kl7Idh3GSZLpy2knquXgdL5Obaw50xzDWUAJmSWkb4GDnXbiTEddenQG4eqbD6SzF
 yEJadYSGPh7I2LvGdkfrVnt3ijdkIfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX4cuSgfCCXHi5
 Ce+YyqKsvWFScBzQsxcwh4DXBS6e5ByFjiDcXhGYDznzYAGCXVgSFsfB3g1Rv7IdCTLauL7BcCP
 wuodYr7PKsY8jHueV49gN2AQFsnsb9H3kYaFdFhdGMUwpm7HQsSsPHCG0HjK/+tNa/FAX+GJfPL
 hj5onhPdnMvhAXfIN3kn2eLfOirjeQixMMhMPnZ+/jwxJaDw3+E3lAgucuXDFs2+j6kt1Ck3DMn
 NjV0nYifgyosI8fO4NAun6+h9e9+W7MTLoj40583sUKqoNsVxS7vet7vTs1OwJ5/iCiprc6fC6K
 gssqTa4Iw4l6nTQrmWPj3/vb+Sz8xPPlN3LOaQVuVyeHASGg/PfHZ6nCvF8kh4ewScWiiciHfgB
 2SopXzbYHA4n+P5vwwAt9TcHOojtiIoWYO4YyNFxBvXKY+Ku1IQxgoTFa366fh21AMXo9BBR2tO
 Y0PVS0/kj1VngG6fjVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3

