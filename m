Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB23BBA03
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121015; cv=none; b=oI7OBuDdRvrr9tXdUBEZn7+b90qIJ72jT3Jaf01KNjntIz8EcpOF1VimaEMDJR++MdQUgwmW3cZlXvvovyCunpiqu240dfdEy7VCEh5R6H7CHBCgfqVifY8Z+ZnVuM4Crkvv4l+nYp1x0fkC8qqffKvofrKSt/lMFV5IAEN4se4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121015; c=relaxed/simple;
	bh=gHoevFlJ8f4J6mxGnrBN2ZcH7vECwqYOa+9ckLIRxGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMfdFBsvb44lqIMaxjejLzqRBcKXymt2x6v/pnvfDyKCMgL1RHNQiXv0bkWKEMlOi7zf/bxodElwQ+lLqmqNlzp4raEG7VCefdSeThA3uK2DZM3DQx02Rc5lqRF2Qjc/zQl9iCxInpBh2RQF/qtR5FEk7j5jiSgsRVnr+GWeakc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hp1/0zI/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIbLUO/q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hp1/0zI/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIbLUO/q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FLoYcj2678111
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0/Zj0MYSFvI8JS+zbx1HrjkY5oDDcWhtrhbfmiCpKU=; b=hp1/0zI/ZJwcspzN
	MoC6M8AyyA6QbfgnN3gTLD/CdGcjDw8dQmbP3O5MH6z8LYUZPT9OkbagC05AHSQO
	Zr7irxieXeqMI93f1LPwprPuT+7F2LikPVKayeE0+eNT7VuGozLvWjOvygcFv+Hb
	dS3pPvD/CqVG/5dxf0KBYVskyYHh8owK8hiQKOxy3ancD4OB5Fq6BU9D983sqwDf
	u9Y0Rq6tLKrkzPO7UJq8VRhA9EWoQEEYfifePdaWRrBb7aMiRa3B8LKoyol6dzRl
	AbqKpAdt1TiHamPhZT44+PukZdviNvuwDIpKRJ7SmoQzaxFodP5pujUOlJE9gki2
	mM4yPA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tagjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-143826c4a13so3667903c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792121012; x=1792725812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0/Zj0MYSFvI8JS+zbx1HrjkY5oDDcWhtrhbfmiCpKU=;
        b=BIbLUO/qRLiiuQmWybvJ7lYLeYFLTpJ6K7N++cE7cZv3EoUBK17kJP3nQ+91Z+55pS
         WL/M0YOpsEWxUIWv7HTzP+mfpn83kCNXjTYozj51D4RTQT/MxaJYnJiMFlEmFSKHrEvq
         2vv+jb+tdZt2PtMyjfSXSzKPunzfqRxhUD1rYpGSZ+KAdu3oN1iOn/ji+LIj7S6F2F8r
         gjNQjk2fDLpLSr8uslBsYZhd4HpGsZQhTzD9jqtBa9hXpC1sbfVqU6gHZ6evhDWJg9pX
         poXGvtwcapq1AXdnwZhb2Hmn4JnR/oGg721B3LqrIZYlM1Dwt74itQb6eS1bv8OzZdYV
         8EDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792121012; x=1792725812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0/Zj0MYSFvI8JS+zbx1HrjkY5oDDcWhtrhbfmiCpKU=;
        b=rND2xmnqZVmWf1uALMJka+EddV8BOfaoWkmooDI4zaUKqya5kD5oRr3PKtmxg9w36I
         OMSm4GqpLDnolT4FNhbp8rXadow68+RSz1udJmmu6QrB67IG1fZfa3IW4N9bJPNJvbwQ
         0wd1PRBvn/almx/51RQ5QFbG2ykCVbmS+iH7CVNMh9n2vzvK2evUhMPoEwNwIZgnwKIO
         pYZ/AuM32i8g7n0W6KFS40EhD16LnqEVjM0HGW9jJqO5833YBqvMSyjpyM3EO6nXlhmz
         PfJp3Jxos6O9HDcuH4fN6kRtM8DEIXKV1pCtOpG7X2o+5uMnxD1MkGmAQlYCc951XJDP
         6wCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKbchQXutIt5ziPGAnG2vS8ZLF/grtlrKJ5D0jKdzqO2V3WuI65l2oZI4I7wVR1KjhjNIsfiN8qqlCs/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGkOlu8/zBAy1T2QlL31X8aH4832ECxpa3cm9eQS/r9FpMq1ff
	Pl/1mG35ODXodNriiYrURu73deZpAnK5UNBtB7LMPVrPcIIMJfWvt2RY6iaCnn8QyDQqqwBPQVd
	JxFqAHRmACa5a098H86Hsm7/wrzi1kEeS6H62d7Ez7AHii7nm59bVtpWOqbcozz207nE=
X-Gm-Gg: AYBFou3AT4p0nfEzNPcX/OLf0VnA4TqfSZNSuofaw74x1ir5ejt8ufAQIQBwgTBpztK
	TA7cWB+2F55Cotbhmv011h6d0GWWAm953uTqFil1Z7RaYXID9CkcfMao1BAPcHCyqK/fBVJrS6r
	wN/V3aU+p2myueCOd6zCPSB+/1CZ8p8iHf/UDPyahYSAlhToglxPc7UYXGwb1d8hiaJwkWfNBXA
	jgMYlN1TXts6cHIX2pIfp5lf2q6nt0sJGbkQse6nv/faLylRHiyXqBlCtzIuEsLyjCx6gVol4Te
	Z0CZ77OFrexMgs59nl24jNLKIw0a7ISumBpcnbRCyMOjtdCKzTtZg71TM9t7Osuo48kjuBc+Fsz
	vvsyuAQLpUNM/4E+xVbc6r7jXYheqMiB+dA88arEt1xik5dJVSJPkLTG+71I=
X-Received: by 2002:a05:7022:ef04:b0:183:c7c1:879 with SMTP id a92af1059eb24-183c7c10cf2mr199978c88.1.1792121012202;
        Thu, 15 Oct 2026 20:23:32 -0700 (PDT)
X-Received: by 2002:a05:7022:ef04:b0:183:c7c1:879 with SMTP id a92af1059eb24-183c7c10cf2mr199937c88.1.1792121011630;
        Thu, 15 Oct 2026 20:23:31 -0700 (PDT)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831bd28789sm1674445c88.19.2026.10.15.20.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:23:31 -0700 (PDT)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:23:19 +0800
Subject: [PATCH net-next v3 2/2] net: phy: aquantia: add get_features() for
 AQR113C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-net-phy-aqr113c-fix-pma-capability-v3-2-0bbb1b84035d@oss.qualcomm.com>
References: <20261016-net-phy-aqr113c-fix-pma-capability-v3-0-0bbb1b84035d@oss.qualcomm.com>
In-Reply-To: <20261016-net-phy-aqr113c-fix-pma-capability-v3-0-0bbb1b84035d@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792121003; l=1800;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=gHoevFlJ8f4J6mxGnrBN2ZcH7vECwqYOa+9ckLIRxGE=;
 b=Y+qvEBYqzncCqEibtXBIX3e4JphkK77JDqakBLSvGUOtpbkUU9JXECxvjzLL36vfHdwRWFXyP
 xZW5ORm0x4aA64mUfUCWiNuuhixATTwJescTBU7W63bJ6Mb/J6sEKqt
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-GUID: AxwP_IrXv02E0JbmxX5I-hUO5qK_C0nw
X-Proofpoint-ORIG-GUID: AxwP_IrXv02E0JbmxX5I-hUO5qK_C0nw
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad198b5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VC2PuVUzhp9AgKou7WYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXxK7z2999pXya
 zKnIctJeTumnUbeiVqaADFcSLXgj4nMGadRSiTU0rEJRTWyjXeihtyTbWwQ+U6MQEBiVaM63Fvn
 J/aV9/yqNwb5ftdkxkNVquGoJCfVzAJduK+u2Irj5KYHUBQB7Qf7qJiGF/50r3YZbAQPxwwtrIw
 xl36o6hBMfKQ/qWgZl/P0Tx5TkCR7Uvm4obH4QKpQa1EcDGVmF0ZFsS+uYRqcu4EheqdAgyPKNA
 MOTqhNKZgyhj8C1ytNweWTK/Ze04G2FIaZmt4UzmvqZgjjYsEHmXYRWGMmI454zMW5lzUEKHH2K
 ywNXZ+Qz9cWpP4aWY5xLvHawbMYh7u0p+lNUy0JfDqpdskh8X4/OxQwSo8as7+OIET9sbqbLREA
 zH/kQQ+Nx5J4KfS1IfzqCqk8f63bQnWvpzo4ws4KyXID/2pmlXOvM3+U0rIXaIXHFfEVR83w8Wv
 YjOVdeisnPMGwbR2yHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX3mbf5Kc+fypM
 YPO8mMSd+x/o4NYwTCyk3uFQ7Ha9xOB8CS+O5x4fwwQbAQWUS/BI33zBL82WcnrlEexF+jqTV6P
 6VTmHFr43yHOJogLHhhkRbKw2bL5558=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

AQR113c does not correctly report its supported PMA capabilities
which includes speeds like 10G/5G/2.5G. Add get_features() to
explicitly declare 10G/5G/2.5G/1G support instead of relying on
PMA register reads.

The AQR113 likely has the same issue since it is a closely related
variant, but this fix is limited to AQR113C as that is the only
hardware available for testing.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index ed5631f2956e..8213d9a15b4f 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -1096,6 +1096,23 @@ static int aqr111_get_features(struct phy_device *phydev)
 	return 0;
 }
 
+static int aqr113c_get_features(struct phy_device *phydev)
+{
+	/* Generic C45 PMA abilities do not fully describe the PHY's copper
+	 * autonegotiation modes, so add the 10G mode explicitly.
+	 */
+	int ret;
+
+	ret = aqr111_get_features(phydev);
+	if (ret)
+		return ret;
+
+	linkmode_set_bit(ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
+			 phydev->supported);
+
+	return 0;
+}
+
 static int aqr_gen4_config_init(struct phy_device *phydev)
 {
 	struct aqr107_priv *priv = phydev->priv;
@@ -1446,6 +1463,7 @@ static struct phy_driver aqr_driver[] = {
 	.get_sset_count = aqr107_get_sset_count,
 	.get_strings    = aqr107_get_strings,
 	.get_stats      = aqr107_get_stats,
+	.get_features   = aqr113c_get_features,
 	.link_change_notify = aqr107_link_change_notify,
 	.led_brightness_set = aqr_phy_led_brightness_set,
 	.led_hw_is_supported = aqr_phy_led_hw_is_supported,

-- 
2.34.1

