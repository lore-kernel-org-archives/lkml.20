Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846186;
	b=mH3DIodxpCnZvvBFu8598Hc8hVNp6jb3yOcztTGq8QkMGyMEgbiwccMX00jRyi9sGL2B
	 NLu3r252uNfqGN/PVMHQ6BEBHcDKlJ5PibhNERaCtV7Vbolz27mQVmVlUHit5v2UiHpl1
	 9g51akW1IemuBVrRbotgFBwhnAeFDnhsakdXj0NnwU63wDSFiXgpO3tmGtdHT6d6bml9Z
	 k0vQv4ft0AwmVn3LoUhrgnTkvqOsVqF5FeHabWPZlhHPPp49sjSGFW59hP+5L2oc8q+kv
	 Zm7FUfR6IKBeFcsUahpT+PTbytwdkav7l1KaI2CGiJ6Ggezn9fSkTi+pzncNVZ3qyDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
	b=esE36aZXWWxahVPLcXtsTcc8zNV/4jizYqOpSKW6PNxQ+rzacHqPVfdu9Bwx5uT7nWpR
	 752dKfJQMZaGAHDHV3MqjPvAFN5sQJ/ogXQoDPffsw3jVrRqSNhhBwd7yJqmPfX2bCsL4
	 hLkpwnHa15JOpPm3z3XJdt01m+kRnu7znpZ3whY8Iu2mtDte4kvGpEPuQ9uTvv3qbh+AB
	 85m3WIL9FEGAI9pXGTGKfgb5fAz0k40caq+AhL/c1HtNLewY2tpFhnZfp3Oyi5kC1gpOI
	 pKFxgni/HfK5fSjX8qHZnEqQIulbLqU2EzhqC1+riSz+4p5i/Bv/CDVhFfYkeoNuHCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmVTds2r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkMT9f5V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC9C606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC9C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmVTds2r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkMT9f5V
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGI70k3045205
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=mmVTds2r5rkgKTwEnGI5LCpN5b2
	/tLsDWF6guoPca0gYr5QEN4hCVmdEc+pATQVG1P751FBpszfBZsJ4Wybc7N//Cyq
	43ND00eDQ58lfF/yy5tgXS62HcNfy8tR1JIkrA+VHr+eEd8xANlKBfWkJcFZ5j4H
	zeGe2aop2OFMX+rcBxESBd3QXyhNOIS0pEoUptM9zXiDPChmK7gDObRqHAG8TYph
	4v9/DfUuuNaEQj3EDbVGsS9aHrWhzrkEJn2bcONk/h+wY9NimNbIfnqZK+vAT6+7
	R4/5QQkkWc8KSYkzM2upY1JO0UgXH0Hz7eOs39KTTK7pf/GC77z+GqgB9bQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038m8ke1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso5063eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846184; x=1795450984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=DkMT9f5VmNHjHlXwYqRyUbNqwzIvW7+VYHRCXlY1t1Egzbd/VLPPZoKi2T9GYAyUh7
         DedFpAjngg+J8FbIhCk0XY6cWv2FkwaJYUTKAYkX9TEDewgvhNSLok2By+m6IzvmWcIh
         7vZeBn6LdmAjRp5Mi8KIdAqxpQWht1EBLHl/zUrFuTSJJdxJOuY9VYDizjIJx2qvUbJs
         jWuUOQYwfbKh0+Yxco6PgdX0E6/SAQCvn/++8RCgAnWKKToz3CPs7xwI+lpBKmHhH6mg
         +tgVkA3LQ9t7gvtJwER0bO/Nx11e0yh0ib24/qgB11ZH3Ey/5JbzHpUQKyf1j577Z1D7
         NGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846184; x=1795450984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=R7n0OxSFlC8tkah+wHvNsHMweQxUjjZDqEJRN1YZ2V0vxA77UZLS+S//VrE38mo5FX
         jpiiSGsg/CPwG2eMoBL5wrsSXsvQdDsilBc7mMrNIfqp7DK4s2g5Dat64cewjLJnrNl5
         49jjvChXRclTgBshly4iaQhqQE8Mmvg76ebh+nXiNya1NtNpr5a7K8NPnU7A+UadJ/ac
         5O6fqlnDFXdeLbI3qQWnRrj+6T2c7/64CAPalRXabTgpsjQe7PcVEfplOAh46KytiYML
         fllG6IPi35d4qmETnrfgZ5yUxfGIlTyhznP3a12+X4alCHqXq3nMMcwO+cK1xdZ6+c1E
         MS0Q==
X-Forwarded-Encrypted: i=1; AL+hErHCG0qwdKd0SR4mZjNQJgedkI4+6I0+D91k+bpoZoKFkDyG/AhgcWUT73+OQYTUp1SRsr6kqJxGrycXN/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jO5G5ta+KlxFG3jtRp/MrU5nUBdjiO1UR6eV8FQvqWivX3/No
	hSnNY++dbfzLX0zmdkXXX7b9dDRZ2pdytmbx5D7WYcYoTMiUkiFj3ztW5yM+W5GBYzd562rIbuW
	7FSE2JcLL8hFZ7kcXKC4N8IUikDfnNS4Cyq6iyTMRRHE917DlszRxMBzNTFEAqsSXwV0=
X-Gm-Gg: AYBFou3OmsPZRNF+EMjA30NK3F3R+RvDReXLDp3z1avx1x/v/RjaipMfg19vGuCro2q
	IjgsfkRPx8+y0zBQDl5G5TonuJJzIiub3culcGmeBSyJZWMVx8byDoSrIinB4vAPBx5C/Rhg8Rv
	H0XlSfubSHBeAxBF1WoGPp+I5VLqSuwbaE3jI+GV8duUGPKuMG1uSawKRs4up+M989a129prk+h
	NTEsSYSK4o4EQE56q/Ryky/sgzrhGE5FIdELLKazG/8Rl0vzhLceQklMvy/cPRVAc8rfPnttYbO
	/MyT/9tOXGxk+ZjBh4Fvg7T8HArPzrvVbbdIbRJq032FK1Xnc1WMhIa+oHNHFxJvVd/xwBDHgQR
	msiowIAf+nn482QKvWv96RD4BfEiJuWj4fOOjuya2xzQptOuEmQ7eqAgpMHjJgpUmGSXlfBWgqC
	+C
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11218996c88.18.1794846184089;
        Mon, 16 Nov 2026 08:23:04 -0800 (PST)
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11218947c88.18.1794846183414;
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v3 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:45 +0530
Message-ID: <20261116162148.2864501-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXzXPR89lOoh1q
 Fl4wPIfzd+pagVVPR6nro3GjZRqhGQ5uTRkWpC0QUUbmOmMHFUXTUUSUMfvKRDrsT57Pf1Xrscz
 Zq0X9zOe9DGmLYRkrHAerJmEALP/EFeCDQTPBKENwdHC7THqpvKkMgZ13w7LYTMuwZE6Psl95wr
 eTkPFVywNP/4syb0jXQ5mZZWmyf2bxIZ0ujiLtlnugiXOfe7F6rqvg2fyyD4X6s8H2MSauLC3nk
 H1whwVSjGCl/y+++YG9UTY8+hqxKXtJb8J/ijX1WzOX04XTnI7ssHVBQEIWJ+7I5avnBxCgzKmW
 gKS81Qk+dh1vbslLILk3V/UNpqzla81nu1QFWpBiqTuyg3b+iRBlBWXvfq3w/GcnHZBMHatfPi3
 5w2TKxxvS2H8YV/PSIpYxmJVgTBEba7q3WlubLxGk5WMUCVkKZwWajia6B6MjuvvAHvZp+a7T9l
 phNSgwzPoeG9k2zGFGQ==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afb2de9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: I-Sf6Lpe87Ze9LlAQhFht1QRdAOLiM0z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXyu+uGmfasup6
 n/21Igk4y50h9Cc8lTiEAttjTTyJToQ42WfGpGAiOAiVuhPwmurFczk0JrvN/thUv/lh1f/U/n/
 JNsvreewfVCgaWwv7IbUShBaY2qV7VY=
X-Proofpoint-GUID: I-Sf6Lpe87Ze9LlAQhFht1QRdAOLiM0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064

ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
qcom_pas_context_init() and qcom_mdt_pas_load() and
qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..0a37741c2285 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
-		goto out_release_firmware;
-	}
+	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

