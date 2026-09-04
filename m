Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D94F55C3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536552; cv=none; b=kVaBxTC/ZT4wYlEmrY8VsrtV2Yt0MBwTpbQQ9zZVMym2PGhahjjN5rucSHqg5QYd0QUMRoKEspXz4gQ+WfVj3HNiFqFRItIMuTnN5yQG7NfYNZx5ZpB2fdyiSrWNGzHdIEKu0YLcpjmYyHpkQXv6BzASzPqZb0gfTdGstQroqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536552; c=relaxed/simple;
	bh=OAyBvAGn77FVJ1TEIXYkJmoJP05YhYEzxSuqREVqRmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDSvArSURRl9BUfPeYXJDd2+l9Te5PoM8QCuOOnED4wxP2ZBEUVVed7MGEQZlW/lzge7MGyWhD/U6oADEpTsDuOjlo4GZgCBWb1E7Y2SAJMv7bizrU1zlPO7FFX/1PuupoQ+XCqeSXEMCdiXOud3Xo3FtnjzQd17cNrL9xjxnlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGBeXoFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+l6nJ0w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGBeXoFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+l6nJ0w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684DgvZD3121431
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 15:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VylTNBJr2gT81asOG9g7+O/m6VUb/i0HgKb0Gfyh7go=; b=iGBeXoFAs1uNGu2s
	+Pc6BIlzA8meYia0mNjGynetdm2Cg/bNmAvjt1IWU4SLOw/6ifb65VazWT3UPRNT
	eUo9SOuuAsvxCXaVJMnFGFT7DaajvVSk26ezHGFQVJa0uqjH2jT6ZyVQ1KLNAgvu
	b/EOZdr2jC1OFSGDQdTHHliLXv/29B+MgJrYbKnnQcKIEjrbCCqzHEzFpo4e3J5e
	pDfGiVZqNuGFMf5tXcjeyHBGHB7lnTeLGHcSUS+i0V241D1MEHff038ovdOKk4FN
	5kZOtk9Qu9ti1nkZiYrrUPxy//waHoPfT2B8tts2TbgUtdvFawNgk4xYQxwg2UB/
	wEUTSw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fjn6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:42:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so881349241.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536544; x=1789141344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VylTNBJr2gT81asOG9g7+O/m6VUb/i0HgKb0Gfyh7go=;
        b=R+l6nJ0wjzcybw7ETQay/f2YHnCmDQox7JRoghaIYOHXNGoiKzY8X1vWcm1+xkSrgM
         iWZKGDf8+MtNI5vLTT/om3IPdzhE3NTnkiyB0Dv0mggXZcGtHcKZuSaIa864mqKjMnuY
         bl+nj6yLEGd/JF/0dtezE0jXl8gv1BN5yw9c6Jrh7ZH12CruUQTI1u07WGBQ9Gg4NRy2
         9Zj/oFwJL/h3jns1DzMoGwyZyWIFu6WUDKyFYABerqk4ubxt2CrL1vKwlpvtdZeprBSi
         izlnQRBkGlI1xa5e4jb6KERRc5ObUFiXFy9SzV8zsbyoUjeJmmqi/TImExsnzpdCzAky
         f+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536544; x=1789141344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VylTNBJr2gT81asOG9g7+O/m6VUb/i0HgKb0Gfyh7go=;
        b=sHC/B5OYfXklu/4e1VwuaXNsSyR6teMOZbbPYhs0ucoH30v8x1dR7i6HWpU2PxwXjl
         kV4TR50PjfbIUptYOPEFaXqA1bZ1KaM2cqs0Pkw4PCjM/gUd1nQntLpHd1BWbQVdDVM9
         ie/PzqNfZ5ZBt5gRQGEvk9OxBd/mA3yvN1S0WGRKx3pMrOeb204z66Ldx5NoFib11Onm
         WsBH55qRRVpDXVmJ6gN1+fiu3B72x6r4VM/BWG0ks5I4Fi8On4ZBOEcPlPQvsBWwI83T
         p+HA8uwp5hvf8DAirN21LgWI4fNh1Yu/9ONLtUD70IJEShxMjZu1jLdT63STsYvAD3nk
         qJfg==
X-Forwarded-Encrypted: i=1; AKwUvBxRMIQiefFG0Iw3v8nbDqKUfKS6CNnoeSro6va9m4Gxa95HbGgz/kI6R3BXCkZv2PB0hE9nC2FeE6Ierjs=@vger.kernel.org
X-Gm-Message-State: AFuF++mNlKhSAO3gyKLDWsVdCGYDBgs4ojoB60ApfPGtb+O754urIF7p
	zB4jILuPjXYeUR71bjhkmTA5bbNgx1HCjEZPVkqrogiGheMpbCmucHG5wHl1O406v+o3LnrHl2C
	vtoqMiIxuxzGoK1iHqDM3Mpe78Sr0dboiFx9Jb8+bGIillRUNVKL0tPsddQHqHjOY1XM=
X-Gm-Gg: AYBFou1duHjrNIZQ8azH2QbwntP2Xi7hcX6IcY9IpnORVdaGbj3rl1HQ/Rfi3KcRSIB
	7RteU9w1W6g8i4SBZiYsSzjNosUiR/tLqsSRL1IpnlyujmeeBxM3OLRZ94NDk8TTistSDnxgQdr
	SYuDkNXk859DhzyUvXk3GWWKLHIeXgdjS/QQkDDXvfr4ZHN/+PcDzC15vxMgu7qOyBLzGFd11aD
	2QDSMs84RMAr5NkuCBf7wVobdUtewtl3Jo4B1GvDxyXJ0MVqiNzg+yEffC+NH4n4Nv1z+RPhNf3
	DxRMP9LVz0eALj6xWVvoqUIOeOL7lCEcIVZ38/QPrf8XT2snQ7zznqeZ66YhGHhvOOqUlJjo+Fh
	igjJkt+QBRkaghL8GzZJY9QvTfn3vrJpF6gJGevoUWz/h1h/0Y6DTIoMiBaynfDOuZTQCbbI76H
	jePZ3h0byFp2rcaUgW5oiO3QjJQQVlhNeqMBW2m4fjt46Mk1m7oOI=
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr2809071137.10.1788536544026;
        Fri, 04 Sep 2026 08:42:24 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr2809050137.10.1788536543607;
        Fri, 04 Sep 2026 08:42:23 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:22 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:17 +0200
Subject: [PATCH v6 02/11] Bluetooth: hci_qca: Rename 'power_ctrl_enabled'
 to 'bt_en_available'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-2-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9ae6e0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wYtw_XDhO1ghKZOGarAA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: S1sG3qnw-3NCY20m4S727lMGumw3UpF9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX8Eo9TZafi4Tp
 I3SyETYVZ9/W/kE/hdRbdkykCOEH4vavrEKrCKatb4TvpPxtGXX8dhkH961ph56uo1IpAx9Sl4P
 14aze6tf2OhcS1UEyjjN3K/geIdgr0A=
X-Proofpoint-GUID: S1sG3qnw-3NCY20m4S727lMGumw3UpF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX+bNIetaqwCrv
 87VpTopiAzuvscRT2R+VrHMPn1pa+m9xcotTf8Q4XKR3D+EJabCgLQRWJIYr/64tQOTVX0Gl72E
 rMkiMXYAT1gQql4Zzb/T7hwPwmOE6/EsLR8nznbrAdCaRjxvcbQ4RXb1AAp3sCf8UjnF7Pj1Qp7
 jWttH/7LnFbbbt8LxsHAF6zKSuVx6F3xWDnSBc4q2PTIER5RT38dEG7I7viL2mqTG/MfvDrF88Z
 HSBCRQ8/5bJXng8e/qLj6p8eS3D9oKpyUL14Mb0+St6FmUM4pqF19F8imD8FH2qlYzoapn+1aaz
 uBSvWtrfP1nHuq1E0FYiYe07lO5U97W+rQXz/UHUIo9pRwJeuVW0UPkU0mNMnnmHWJRHr7zZCmL
 R2hOqu8qw/GVC9edgXRAZykftcvowiMUTzFFcuPvK2mpz50ANpkuJRE781y55jeYZvxyRqh8zrR
 usm0Uir4x3O17Bimwpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040143

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
GPIO in devicetree. But the naming causes confusion with the new pwrctrl
framework.

So rename it to 'bt_en_available' to make it clear and explicit.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c8ea5507bdc2c83f214e3154b5ad6d05f418a1d4..f7a20138cb742e8f6ea51d565aa8da8751f21f37 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2396,7 +2396,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
@@ -2504,7 +2504,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2542,7 +2542,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2560,7 +2560,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1

