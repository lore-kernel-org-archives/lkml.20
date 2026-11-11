Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416658;
	b=UIUJidRDa6OXi/tEpHbDxvnFRaH/pfB7hLQRlj0n+3yYfVzkNXpUg/ItWZVX/iJXH2/C
	 gKjLfaOMmUYgggUdflW8QWkm3v8uZIRBIev8BziDQX7I4prtx0892lEQ5llqtZXTU0bqD
	 VnPHxG+iupymSn9yc+3ZHPZkpq6zEcT9NQgl7NhvUkPwklgtKUR8sTWLsLjbjX31KA1+w
	 xOPoRO6w7cJFGNzSJdIn0auzf/o/E/teYbaun6utHuLEx3P5VF586LEsxwsw6saZprGkf
	 B5EBdLJF2+uygXBmcLdjbh/Ug/VeqX7AIId4riWRzoZ8N9PaW9eqIs5gIsKfW+CqI4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
	b=WCdWMSrkU9/xeCGbsmQD5A8AxEjlTGgbdW3ym+2Ww7XWQPL+IZh/CCHFKdqp/RR0aUqn
	 G7pa3/lnYq7D4WUtriZJVfWIZyg/RYLajfH6E2Yf/x4k34RRW+ykTUG+vKtgp7i/AyjWy
	 W+otRFi8lbYwWMX2yxfc/j8+WZWWOXS0pQdKY7E1MayrrVouNmFrJpt+Ns2eh1AT8oDP5
	 ek1ztAsPp9mMlJXtbFH7H3g3+vqemfCgDldVlfaKO4V4lBmmNRhGZQK11+pZY64cqvK1i
	 /dZLqtdjCbKw1+1Wp1BCYXW+Q73myDBXVs7e72YZrI24WtrLGJ19hCdieSf2sboEy5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BSL+3uUU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Orv4fv3x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436C760A2604
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436C760A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BSL+3uUU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Orv4fv3x
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF18FE2115606
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=; b=BSL+3uUUU7PSjLUb
	EIdXgPNwgNerp+danDrC0RSeTAei3ZG4Ww+w5q12weaGjSZAEJ/IbMCu4E2zCHaW
	dIJBZXjy5qP27uq0VQ6Ppwl+6bJ0XGnJbyjsyfRXJFjaJJOwkCoJ+TDF3KhBsKYn
	9GG9yQdOP2J5JiVbEaTkEZHqAJr7BBaSFGJNUAEtW/aoQXd8DboGAiZwX1mSlJBT
	Cp6FV7mTLtQo5NMXXDg8VpccA7+E+qzTiEIXJt8nd54irE1smTaiJzLE+DN32ubG
	7RBx2gsoqkWDGKd40qOLl4L6xCQkq0Zx04yj+zZJi+2k4aICKVjMqwvkr7Dj8XO2
	A0Cfeg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawk664-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so1427052a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416657; x=1795021457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
        b=Orv4fv3xLFlMnVP9lccYoYWWekDDjqK2/YSMb3mZKKUjJyhODIeJyJTbpfG3SKV15r
         EVWb/vDU3yuIohOazhTaUoBvU4WDyVFaoOJeMarl9KD3bJ04lWrmiXA0FlNank/r/UMl
         VmfwCUyRKA6K4r7Fs/GATyCPF81wRs03Us1b19eGv/8TIm5BvpkjQ32zOhFwPbinx825
         R0l4GGnmBziEWj4h2TdUrBjOMbyDW5wpYoUv2ZSVKGKfOX92QIwl+vyQ/G1bzo38MUI+
         gRN3tZpeZ7ye5oEelxu7YcY0KGIzDGPNJqzmFpFiA6f0a6jVYjOb4A75llsbMrY5vJ58
         3SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416657; x=1795021457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
        b=wPIRWCYmF3+uk85ZAaEZU6ElaV4s0B8Qk3jtKYzsBMmaiKQJh8304zA4VH6muf3FAj
         i+cZEV16jtvG/SXeFu8WYwFuJGyeBlgB/hDrevrojB3BKBg0+iaAut3mrT+fpWW69Khz
         ZqFMO4lGdrjvTb1myMeEwOREJ/gdI3ZIMY0zQwhl4m5TSlS2Zux6Iu6+dd3YV6F0EH6B
         0Toc6zfdhWLtVwCvadzXbXFaT3uc8cv8fOi4DnGVjTXMoZvtH/WgHbpioqvbXtFrQUDG
         pKa1DDENA8F1RGSdNu/Ou/cLAeV4GNCcaBknXEf0i0R+S8xnt6ZmeTJ/6SZvlS4HxhZW
         OqGQ==
X-Forwarded-Encrypted: i=1; AL+hErEoD3Pok8Du4LJg9NiD/mNEwHyuZ0KW911VQNBrP4J4FzQPLxppLTgE+DwaCFI+RYOw63bO5GEy48ZLw4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HOVPAZBOOdqON9THJ2D6A7MwRjAFR46FSgDEkjRk9NMZyr5iM
	xKNbhaN2C6/sVXF1kaaUt53KtEhsQKee1zNIwdw8xhE4yBqLkKtNB98KFZeGCStzUXRotgtmXPi
	uBwbtBMffxs7Ws88pDSbyIvvA3/p5hZ+GwHDbUpFzrrap4DVsLlbnm4e3I/tkaI2UVIo=
X-Gm-Gg: AYBFou0fETOw72cJ0hNsXTuM4V1RyoCGGRxHojBOTsZYfJSzJjxjpOgvf0jGjGIw/6f
	sZAVUB6vy+LC4KuptRPb6XMwfgf6uHz59RAm6J0dfVHJ73/fjpvMciQk7wKyiAu4yFhi2E4a7aq
	uHFxxKvB/SKMfttrQOs9barhqh4BT57ZfPtd7pBl4yQn04h65DKVAZ4KLrimVw8eycWPAYQVpmx
	qw3RL7ILK8DLK2AcrW2WcRMb3Wrx1UaVPU6trSiEzgvgskjjrnC+POrZSxOZ39C562uWY4la0hp
	EcMQGYgXNN5Bm6oZRSxovcppkDwkd+PInNtIbgmjmfR4GXPt/Qf1J7jjj6dgSvWicpzw37YpqY0
	HRHvGMFpsX0xsAe9n7htRp9FXtNb36p4mTvOY045rf6rgmZw3tFES8ZSol9YjFiSr1vk=
X-Received: by 2002:a17:90b:1e4a:b0:3b1:6f2:a188 with SMTP id 98e67ed59e1d1-3b182f14e11mr3059340a91.55.1794416656565;
        Wed, 11 Nov 2026 09:04:16 -0800 (PST)
X-Received: by 2002:a17:90b:1e4a:b0:3b1:6f2:a188 with SMTP id 98e67ed59e1d1-3b182f14e11mr3059287a91.55.1794416656080;
        Wed, 11 Nov 2026 09:04:16 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:15 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:56 +0530
Subject: [PATCH v4 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
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
Message-Id: <20261111-pm8010_i2c_support-v4-7-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=4405;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=EfuTwFmhnLDuS09J9v0oeKJL4sbTdb1eqdg7aPMRmLk=;
 b=gAfkj0yBJYo8RtKBB6tTtIgSHIBH+pATCqy04DvBUvdVsOFkFPTE5snXDexCicsVmPPqqgcvL
 BSxhyPLjIUABQfXqeem4JwPFGg0C0WHQz4N+36b7NuLmakytymONriu
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX5/7gCkD+H6bV
 vZkpzaaybuQlVm7tuhIMk1mG0SdwXEQ3SndDFgn8sGYkQ8VdkSpWjv/cjkTHasoMFyZsSJSFFEG
 4qny/2wS7dJkKqZiiEC4FjlxYz2G5hk=
X-Proofpoint-ORIG-GUID: pUJbf7kAayHeqXnM3ZzR_NP7jQOH6Vvy
X-Proofpoint-GUID: pUJbf7kAayHeqXnM3ZzR_NP7jQOH6Vvy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXwRjt4J/e1upb
 OqaxSKo5gzABAz6kE6Igg4h2MLzFXfHvkOLTnK2C8N9B+e672rgB85LeOzdaP350Q2Yt5wcbZLG
 JNAsHJiAs27G3H9bvkHxY+P6ZoQbEm3TXnTAKpn7BoxBcAEeR+f44Ol++QNS3kBj+fNi9qB62oo
 8QqiJhcW20pMhSrEn+nn92qUCexPAxNTE/sMaCrgMBojkPS+dp8k81l6a2rE4u+wCoTPDXo7XPf
 wZZB4MiXjLXBsPUfHgSDYFUHA+7nBlotI0l/EoA3PMH2e0EQLJLj1NFICHlpQqxy2ObVrmytmnm
 w6tcj2Mdq0olGifXYLqk+Zw9hK2pccr0bf76ufrnUlZBZLZX3mCfh0GV16eMMXK4/rr97VNX1s8
 Db10eKADpSrbqwsQhamPM9sJwsQmMMILzCSYyETR7T0WLJBBm8DoYNr6Sc9uVnWEXlxrbPo3gLJ
 zkCxKhYnxc9dqDMcOAQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4a011 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lbcZtXRpr0qBkvjFNboA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 39fae8d48e46..9ebbecb90b0f 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8008_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8008-regulator"),
+};
+
+static const struct mfd_cell pm8010_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -215,20 +223,51 @@ static void devm_irq_domain_fwnode_release(void *data)
 	irq_domain_free_fwnode(fwnode);
 }
 
+static int pm8008_irq_config(struct device *dev, int irq, struct regmap *regmap,
+			     const struct regmap_irq_chip *irq_chip_desc,
+			     struct regmap_irq_chip_data **irq_data)
+{
+	struct fwnode_handle *fwnode;
+	char *name;
+	int ret;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+	if (!name)
+		return -ENOMEM;
+
+	name = strreplace(name, '/', ':');
+
+	fwnode = irq_domain_alloc_named_fwnode(name);
+	if (!fwnode)
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+	if (ret)
+		return ret;
+
+	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, irq,
+					      IRQF_SHARED, 0, irq_chip_desc,
+					      irq_data);
+	if (ret) {
+		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int pm8008_probe(struct i2c_client *client)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip_data *irq_data = NULL;
 	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
 	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
-	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
 	unsigned long pmic_type;
 	const void *match_data;
 	int num_mfd_cells;
-	char *name;
 	int ret;
 
 	match_data = of_device_get_match_data(dev);
@@ -255,6 +294,19 @@ static int pm8008_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	if (!client->irq) {
+		switch (pmic_type) {
+		case TYPE_PM8008:
+			mfd_cells = pm8008_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells);
+			break;
+		case TYPE_PM8010:
+			mfd_cells = pm8010_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells);
+			break;
+		}
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -285,25 +337,11 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
-
-	name = strreplace(name, '/', ':');
-
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
-
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
+	if (client->irq) {
+		ret = pm8008_irq_config(dev, client->irq, regmap, irq_chip_desc,
+					&irq_data);
+		if (ret)
+			return ret;
 	}
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,

-- 
2.43.0

