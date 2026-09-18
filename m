Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559994FC8F1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739409; cv=none; b=erY74I917me7wXTMTufyXEt+mfA5c8if1LpTfDs6D2Z1QIc21VqzOUsXFVYLY3T97tJXMFwhsvBxo4YwCqJ9vwvwj+U36V2FxPotxHoM1WLH7YyKGX9WkLs3/dxplggnbDU2O45kS4VW32iISxGWavjm8q+/NkyKrSCOe1hCuig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739409; c=relaxed/simple;
	bh=3zPDkuCDmQ38oUL9/eF9wJT7+qJydWJzTsR5SSVPT00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arYbXCQCQ2Lx1V+1e6dJRiipm554ZgLZS5gZHc3OdUkeOngy5p4Gr6wflc534TkRm/IwOMyuv+q2lzy+rbLZ4AUBYEvS4n7LYkvToGV8r3I8JCACtRAuQ0Xi2ek2c3crnLzIVR3/mrnsXCMSnHh+RKxqPSGPCZJiYPg0czhnBRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgDK1/CH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4NkAV8k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgDK1/CH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4NkAV8k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDP8er046645
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=; b=QgDK1/CHfX1G/gL4
	S2I6jAuWNMUTvi3gKzzUZBr2Cy4aLUUx8s1bpU537HyOiPV0E617cKVhDtOwTTNA
	ZogziqhCjhuF8+puWTskpneB+fTnPgcGCzQyN69JIWnto/HYxEjKX+2Jzgh6EEI3
	T1Phzl2wsx82cwa2mTehDk0ju1gnoP1s87f74Y0T1Y7kkmTBplDB81SczXkdot17
	H3wky8I2Bo8p95CDN4KgtiB+X9w/JmDAbtvNHnueU/dwD0M18TzXOmhSr8D9ZI3x
	kPdxZZ7+MT4lnP1z+qe+UOA9nj9+WUf8D/c7i/oMWzanNArFPsvzJSDbonwr75TI
	nyuccQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5me9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso724580a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739407; x=1790344207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=b4NkAV8kis2ZYikazsxk3lIx6pMovHhGGjeJ0kVddugQjK845Cm20MIdjsm0oOMRKv
         ZaLVwTkcaJ3ZzsSojCfSa4vQXU9d86yg0F3iAl00tDTNZ/ROxpLCo5fDchjjAwvLrePz
         wjNwQoFKMIEKbY/MpWl53KvVQKdCnIlEzXPhLp8qcX1JGyE16TAwvex4nVFFCWYFG36h
         pM2hunhx/il9wZuzTU4U0TB0qkMW/6eIRqBuaaMQSgpgipC3KMwxQy7WKvX6lK7Apt5T
         aQbtnc8IbeCGSzQQP6g5/FXSFBnrjcTDdS5faAkj1pCP3Vlh3kossvg2OLhd0FS3iMGd
         4Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739407; x=1790344207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=mnZIBu1bIXqd5JivHLZWkQK1dTFYn7/fwYg6QYcVlFwRAA3jXIbAv7uuDbiRg2vuQo
         0cfSakqt2rBifVfcN9LVH5SR6IDPwO5ZSfiME2NjfC630lv9xlyPGu2oDEo35Q1AUdn+
         SAs9Cdh0MSjcO/pzGOt9f5+9OMqHPVFBPLHOWhvPaOvYDvaTx8aXBAZqHhyO49DLQJ3F
         H+Fq1IPL4Kam9RFYuaxAK8MfRUsCXlsSv+mWXp/7dAvB4sS6+cHQyl9s3IYl0e50DE63
         DRXv6S5RUUUXz8hFhTyNLqxzuK9QOgDtdrGQKh/qubFYkZsf/c856yhM6s/ARsyMVaLS
         b0ew==
X-Forwarded-Encrypted: i=1; AKwUvBz8Lg5IQ3S1Qja33SoB1aKnVCBSqYuOxbDyHLf+qFL9GjQ5se5nx8SlOpxO1CIbr+tL6SGzk21OPPdoZfM=@vger.kernel.org
X-Gm-Message-State: AFuF++kfFtO0e5KG7y17t5qRSsr0BhIhxeCPQM8AEuuPHUjF52Ryax2c
	JXU6JuzGxClwGzB7qHORRxahyOnKtiV2qkoLPIRVwLQrLjOUP2SZdOvHTx/l0H6+4FzQ+cfV/ST
	f8OOzTYVycVwRV9Hl9FuKv1LDfydWJM3Kk9jsu7amRVqAGbv2yrJrlLZOL3/iHjIpuy9c0PyPlW
	g=
X-Gm-Gg: AYBFou2mAMQC55V+j6KmJr97fhi7x5fLjGQOcE8+uVEUGy6LDNkqd5FoMbMmY5Roo+i
	pkOh5BDjugTtWdOSDD0syblCxVwDFsDZ3hoPtCLtprV3U8F9Cv1laMmWurF4ROJ3r5NxTDyqGBY
	kMRCJgnE/Cm3WmMt78MVF75AWNdIBfBHWkGpxQiR1FhcaffPAY+R10Qbkb0cQ6mY0W/y2GM/mOu
	JUDa71JhPgEVXuHmdBEveY1aLoK/IRosIClipSfXEqXp4wasAmX1vwPh3tCxPnVhyUHtZUbJaTC
	EqED+ZOyYbAa6vDaNja0igHPKfZPWcC6pC0fOB+jqxZ0KbHoS3Bm0h3uouroDYWHP2wY//xXsKO
	o+ANNbun3XEQ0J2W4uTzvbq9HjMc=
X-Received: by 2002:a05:6a21:1b81:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3dd8c3d3acfmr6221628637.4.1789739406879;
        Fri, 18 Sep 2026 06:50:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3dd8c3d3acfmr6221581637.4.1789739406436;
        Fri, 18 Sep 2026 06:50:06 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e9fbesm1013934a12.32.2026.09.18.06.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:50:06 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:19:35 +0530
Subject: [PATCH v3 1/3] ASoC: qcom: q6apm: clear g_apm on driver removal
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-vmid-v3-v3-1-f1cbf47bf173@oss.qualcomm.com>
References: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
In-Reply-To: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohit Sharma <mohit.sharma@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX3KXyZ32tR0J+
 BdQSOZaAI/+VNLAzvDh0o1fr4NgZ1iV6rYuTJoDkQTX355vbIHEKAs5msugsL8RWAPweoVybKET
 +lKGMqEsBTpFvdSceEcAZrn3gxtr0U41B2Ru0UHyjrBeHzwenYVj3qTu0ulkGmQqlLWcQ16/nQ9
 9P0AkOkEbLNoaUUsnSISC0dpjQDdklnCIzMAs7z1eh8M9b06EEnxtTblF9g13diu4/FXKKrEq2p
 eoaGjGQRljSscjHjhke/lQkdocgf8mGqS6mkCMbMTLQRBx222riDO0x80cmhMYCHNNHtY6WmQ3i
 zYSq9iAwAQvbr6h4CwruK8rywFoNMGkMuC/7V0TqQy/5OUdkNxW7m6goNXZqR1HE/hLGx6ankB9
 wuxnM6VwsoyefWjyt4X7hhUNh/DOVGomOyqxYk7hWkhzU/n0puW/iDJoL5J/CKFzRvCQG2Xx/hT
 9PiYYutwpikleFwQrxQ==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad418f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=i9zpEd1wrD5FINdKp7YA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: m_dfk55Rmo2HEqGXzAZRi8t4bEX9yzF5
X-Proofpoint-GUID: m_dfk55Rmo2HEqGXzAZRi8t4bEX9yzF5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX5aZrNyeZbZKV
 nKHFLtCgW5+IRysQjB1PX9H1daVhW7g5dqUIirXMLjhZkCmF8Hn6OHLj3Vsof9mIMVI4ut1RGFc
 2Pa1HkinsUhjoz/NpsGfM5ZchwFDWiE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180196

The global g_apm pointer is set during apm_probe() but never cleared
in apm_remove(). After the driver is removed the devm-managed struct
q6apm is freed, leaving g_apm dangling. A subsequent call to
q6apm_is_adsp_ready() dereferences the freed pointer.

Clear g_apm in apm_remove() before the component is unregistered so
that q6apm_is_adsp_ready() returns false instead of triggering a
use-after-free.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 641d6d243229..12c6dfe4c58e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -894,6 +894,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	g_apm = NULL;
 	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }

-- 
2.34.1

