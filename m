Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573088;
	b=5YNCsLXwLU9VTtoBleen6FBor0dal2XYDFP9Nr1jvzkoev7ENmwwfkTYeBT6XcDuruns
	 RbVYySPtrSbBAA1kQx5b62xNa3p8fQWVRoqPYDnuoOpk9d4IE2YXnLG5+eLG3zSCu1XK1
	 JYDkhEXTO13ma4mvO3UBgRttnw88gsAAL7rlIKtU8x1vb7kmeZN4nLPTAx85QGh9TStBy
	 6j+Fihwzai/zaYrN+7+/jZqkBP20qZgFUd4xqGk0VQRY5gFtRonWQLsE/+G9W27hdswJT
	 mXF4qjj13wjGUnnOrCSF2wWLIcxlktsamx89oUaz5JMvtXGt+4lxc3z2qwu+lhPIMEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2AfyFc0ogUfdrYyNRX9G1+SJ+Gxo1o57TnNd9vgut88=;
	b=18u6nxE0vZdk9kHoMgfJYVXEL3qpQDSEBe/1zNbNVNCjEluPjzr2nlUpca7jt/4zBur7
	 rM5OJJ73WrSf99KhMUHnO73zW+rQt06DGEhBSHxAkklQTTuqj6V4Wu8zF2C1qLxYLXj47
	 RegkLRVVOG7/wlftDw1039uC0zQCm1gFrNJtuILeZTvVI0yLlMqfNR2svT5eXEYEnIm23
	 XevJFxh85ztzK/TsP8C4xxZNCE4aJxKc/ooOhJsBdDl/cF9tKdN9u/OWt8M3IhVspjpaY
	 AhowOSHh1Hyi/I6vFLQfeXeqIqai0pWYHDsujYa7n1CY7/VbMeyWWfJbN+zAlpLfNQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbmHNU7k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PhKd0apH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A37606A333
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A37606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbmHNU7k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PhKd0apH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j1Pi3925772
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2AfyFc0ogUf
	drYyNRX9G1+SJ+Gxo1o57TnNd9vgut88=; b=gbmHNU7kQbdNXFPXrzA8QJJo2CZ
	a42GcmLkNAmhRgxA0rgy/vM6nUJiUDYRiryxZRkTPDO7AdSiBeh7CvexixDNA/6c
	ISGYKWNKm9ObxCFzqHhhYuAePZLPaLpKUvBVtSu3bgzT630fa7PfYyw0fLPvYj6S
	2TUyUCfEVL5hcvYyLZTS++vaNYLPEHKDgrtIo8C7tJwoVmBSAgjcXNP8MiOisesC
	vcdnQJoKnJkvGE3BKvTKriPn2dQyynSbHrL/cIIksjF7AnhpaWQsmwcKAbfdi1dh
	Jq6C8Rk5dRN2VewIjop8Ty4eJkqf5za68/ekn2P9HwvOKLIqro1xsyK5/cg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2cpvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:58:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so108045385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573086; x=1793177886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AfyFc0ogUfdrYyNRX9G1+SJ+Gxo1o57TnNd9vgut88=;
        b=PhKd0apHDcO7HGXlquY/vh68RAcWKK0YnTRc6B2RfUSS/A127TaLP+PfnrR9/pTo/f
         ZPybIELJvJvWDmovFf+2/vibMHED2U0dPVytowVfXDDfMYEgFXi8a9zbDRTT06/Nukxz
         50MLg92kyIFYazLZkPRh+O4nSYwjo65ma4K6KDK+yuVTNPRrsFMVWS3IBvFWtmUgJK+j
         FbxVaTQSVPdmA9JVuTIRsvbomkTipdG90ouysK8Bj7NfQKDQ2F5DEFPuR+QY7N3WXzVR
         asR3ZJHDwpeav6vda0ykOtv9Jalm6vc91xgku7PY0rWz113YkWAgopwqxdauaCgyXV3E
         KmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573086; x=1793177886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AfyFc0ogUfdrYyNRX9G1+SJ+Gxo1o57TnNd9vgut88=;
        b=j1iTtZXVjRuCE2PLf6KzNECYZERRoNUCyvj1cnDgv62DL3yRpyTcRw/XnW4Nc3O3LL
         CcIh+OoicSrOX3YH4zGKeP0OPYD25J/AcqNqav53RIyWROXZzYpQff5yreMGvoFG/f2s
         +d2iIt8K3SiOXaKc50iuiG0D/5xVfzEKYBadF1MZemAcPyIpJVZsM35cLBJbpSbq4BH3
         S7HZrW/Y3kUh+gkT58caXRZNvjZAyFqSvcXlfzCuouH6Ep/QhQEj9jZeCdDvYyWpIPx4
         2YS/5nEMd4YCrRpYS/F6Cmlq2LnkzQfTWr+ahLhrsiarJOUf3ZHLki9EoP7q23Qyjf08
         KbVA==
X-Forwarded-Encrypted: i=1; AKwUvBwebUk5UDaIl5i0ghdIzTm49rDIQZBfN/GA5q97FKitSIjuW4Li4aO8Fb8oV2rY3Nex/fCXwEKkze9kiMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM9966iIYbpU5wEr9GOq9bf+rKmu9ukpTe2qltF9wroP5glqNZ
	vxUwWjYbW5CKQVwPehA8v9KSCwbTpJGtvdWMOwMaHb8heBrVHzq+GsCQ/OtxSNnCG4anu8YwLNj
	gb0vmQIgnBpXrQucfVVVXU2ZXWMlPDeQrOSbMWurHmTxDxjYJy5+kFgusrmHA1qtVjh4=
X-Gm-Gg: AYBFou2YqdxI5NKgccLu3PFTAAf1t8Ae4cwWYfZzhuKWwhZ4qo7z98RIJ4/+gj8QL51
	8yEbZp/AlZ7LFsVVxUzSwIo/K0p1a7Z+2axLC1+/Fan3dJEUcP/euVdj0tGtCbJBFvDJo1bNh2z
	sLvK9azT81XJWFVqE8tfMKVMQ3sijooj+LMTNCOSzSJkGPqdDny9eM9dxt/BoO5uwDd3N6N+KR4
	f/LiOpBqY80Jw0Mwo1GdmoznB/dTaK6iYf70OlsT0HbWpX6kHOAVSK0dmoESlGp7m/2VKL5qfyg
	lmWxeoB2xvgx6j22CNzXfQFNklcC31CFpdHeT6/l7ulKXJSGC6Kh8gQ62ULHhMwHqVLGT4lhlr/
	nB8g63uEQsBHK0S3wULMOBUN9sQ==
X-Received: by 2002:a05:620a:1b95:b0:93c:c162:125b with SMTP id af79cd13be357-93f57f233admr308222185a.39.1792573086370;
        Wed, 21 Oct 2026 01:58:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:93c:c162:125b with SMTP id af79cd13be357-93f57f233admr308220085a.39.1792573085975;
        Wed, 21 Oct 2026 01:58:05 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8d9e:b00d:491:1503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258424bcsm4058401f8f.55.2026.10.21.01.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:58:04 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com
Cc: andersson@kernel.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-pm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] thermal/drivers/qcom/tsens: Validate the sensor count before initialization
Date: Wed, 21 Oct 2026 10:57:47 +0200
Message-ID: <20261021085749.3786101-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021085749.3786101-1-daniel.lezcano@oss.qualcomm.com>
References: <20261021085749.3786101-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: AhWgLxk5qpsLjhT7zNrrV-cPowsomwbW
X-Proofpoint-ORIG-GUID: AhWgLxk5qpsLjhT7zNrrV-cPowsomwbW
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad87e9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Kcfep0Es--GOdI1On_cA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX6xG3yKvdYM7z
 naWB4tzK+8WGUE2hxpZEiwN7reEsKhubSk1i8mOGOnOMcsS7KpsmEDDSf+dcxZz9LVNCjaN5kgR
 DkC5vyVEVfXic4c0gSP2eFxO5ifjNTY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX/COMv1AYYgvO
 IoPAhbGPLRJuoNqUYKq1FXhQmtlJHqHzFvudmzRZSRobrJvZYtRn9tZ64Fxoye9FPHUiyn5z783
 SPJA2NxSs8bmZR17aTK2WHmgEY8iiAzXQmk4an5QtGwiDhQV2/OUmw+ihw0yefqeikX5RYC/wCF
 5T+PcHCWFc/rgjTXzg4NR7p859dnKv1r72vy30hJzmxk8W1SpX9UPz4ktwaUxXDofdbo4UBIPSV
 4r36KwGwjeyQIl/9SLV5il4RLfV+JiAumn8UZIqdOad1j+Ibkbkm2n1xKpC2OqJ9UCGdNK/s0Db
 klH0uf1gf60ORnIpLL7Q0i4DGNlYsZLNfLdySUHIAlk2eoJcfNTR42ayjuCvMXaPZlrjgXhidz0
 X0c/7KzI2tm4Q34vwN5KPwldQxV3sRknNm8qL6q5eWQNMk27snU3b4d0QhO/+jG5eu0xMzw3Gkh
 Ud71SDgJU3CXfYKVSZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035

The #qcom,sensors property can override the platform sensor count without
an upper-bound check. A count exceeding the IP's maximum causes the
driver to access uninitialized regmap fields when handling interrupts.
Platforms with an explicit hardware-ID table can also read beyond that
table, even when the count remains within the IP's hardware limit.

Reject zero counts and counts exceeding the hardware maximum or, when
present, the hardware-ID table length before allocating the private
structure and assigning sensor IDs. Preserve the existing fallback to
the platform default when the property cannot be read, and document
both the fallback and the sensor-count limits.

Fixes: 6d7c70d1cd65 ("thermal: qcom: tsens: Allow number of sensors to come from DT")
Closes: https://sashiko.dev/#/bug/linux-d0867095-c131-491e-a6aa-a81debfd0df5
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>
---
 drivers/thermal/qcom/tsens.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 4f69ce4976d9..9134637a3458 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1399,10 +1399,20 @@ static int tsens_probe_common(struct platform_device *pdev)
 
 	num_sensors = data->num_sensors;
 
+	/*
+	 * DT may override the platform sensor count. A missing, empty or too
+	 * short property leaves num_sensors unchanged, retaining the default.
+	 */
 	if (np)
 		of_property_read_u32(np, "#qcom,sensors", &num_sensors);
 
-	if (num_sensors <= 0) {
+	/*
+	 * Require at least one sensor and stay within the IP's hardware limit.
+	 * Platforms with an explicit hardware-ID table also limit the count to
+	 * its number of entries, which may be smaller than the hardware limit.
+	 */
+	if (!num_sensors || num_sensors > data->feat->max_sensors ||
+	    (data->hw_ids && num_sensors > data->num_sensors)) {
 		dev_err(dev, "%s: invalid number of sensors\n", __func__);
 		return -EINVAL;
 	}
-- 
2.43.0

