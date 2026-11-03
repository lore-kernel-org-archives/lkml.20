Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712049;
	b=Z9CDD0tCtAhiEIuqtY3Sahrjm9Lfja40aBVjbkizdMpPyXHBQxIjAssGQE1cdzmR7Iuy
	 Gnnl3MZRBdUOO7Q/eZKBDxW84Lz9K+fk9nYNIJQb2qlNJYb/ymQNrW+uMWNCSyzWdASkN
	 3cMjNRibttZrEMqIxTPNXtgfOiTiICP6beLLnXPOJWPjIFFVZan9ub2XOKm0tlKl6UwSO
	 GjThzQNPZyqHpwG5/4pHBZo2nQaOjmdTW0xMkeCGnt3uuCXpqF6fALLJ5xWl0fmku1Rlf
	 ty8BtXtgxDGFLO4XzRhtljkolOeq6jN4q8e1k3bBtAqYIxKBWg30GcIiYjOvHxsP2jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+BFi12bWqcTOJ6sEqLJK0xoOgxMvabXiHoqzjLlrk80=;
	b=oNVG/Z8ordqz38wfvkEZCEfixKG7smLAd13FbFfz8YK5VzvkNaOT9RW4TlKPZ0Zoz2B1
	 UkKEhbf4VBDfqB0Eze9lQNvB0lZJBMkdss4w5EHEdKnXyblkyFR8kmiHA654oOAp0k3u7
	 kd65Bra0ALT+9LDpqSDRo7G+OpuOVJZmyiN9ASf4Oxf3DXZfOJgufZKfYZNcjCLIvxgTh
	 vhIuPhGNfuQFRrbPMCYRIgeGupSHO358h1F4rItultYgEREvo7etcZSSdoDasZKRiqhkB
	 jHshCzvvLUXhJDTX+jXKN1PI9spjSwWn+WOxc1HfePRQovuDf3NM844z44LSdOU4M3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cpKPonqr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6NadfE7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85531606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85531606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cpKPonqr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6NadfE7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Cl4XT2899176
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+BFi12bWqcTOJ6sEqLJK0x
	oOgxMvabXiHoqzjLlrk80=; b=cpKPonqr34zxijPWKwDHvqw2T4RXbsW/1AacZi
	4Qnxdvf6K+AKzwHKTc1uu65mtNmT2di07rdrugCPBD5AksTVGF/jQjLzjIqrixOM
	GL6jTnPrrlQgU8DZThQO24b7HyrViN0xWHkeExpJeOTgGZcJZz2dLV+xuWoiLH0O
	86a0Uq3VPJ4e3n0iNg/9Tc9WvCduY1iE7tqYydxR5DbTgTAmbDJFwGWAQVDkar83
	NHKCSLWan728eQqFBGhlyL+BjCC2OVinSm7NFfef4HigDUvX5VjCGHojEYk5g/79
	I7bB/AA6BO+iBOnTH1tA8okhpxMakMp2jeZ9hCPlhyPj7jrg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2ack9yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:20:47 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9913f410ba2so827888241.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712047; x=1794316847; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+BFi12bWqcTOJ6sEqLJK0xoOgxMvabXiHoqzjLlrk80=;
        b=g6NadfE7qyBYvm4NLXrdZWsUwkv8k58NyCTME0Xj0ao/vdm1Co+UF65lvr19p0Vww0
         ekRKrjR1x0wvtSEUmTRStseGuguJusgxh6iFeWatwSRFgKPw0HHjQrNSI5DaARqGxkty
         vInnhMKIKtETDaRozr1BgNBnlXAim7A9cHTDdMCnDkNLjymP9wCrgQhXmFPkFvyOlgLh
         ACQjVEdTt0680PTpCCG+qkYCMjmG7DKmUoeovlUwSo4g3bq8at/Rw+eDDPnNknFwWiVR
         omkQpHNxKVrGiz833KfOdgYNHRxg0ic5ZY29bU3u4ybUorp6pPifmKmqjVngxqzEw945
         opJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712047; x=1794316847;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+BFi12bWqcTOJ6sEqLJK0xoOgxMvabXiHoqzjLlrk80=;
        b=c9DCmZxXDbG+uRFPRjOeI2Oz46VmxuC9VtIYiCif1ZXelqProAOuUnoKx4so+LEWQH
         QCUPR/ePnWPOInTV1ZERFCRArP5082gH5Ik5TW03LsP0ut2aDmUKB9vH5d5iHWMf4NpO
         oaiGU5l/LuUPJy0vjH0W7n7DvfmJWA3/mq4mz4H7g6x8d6Bnze1OIWvtC876p/pQDqNC
         hsq3mF2DW8IQybsGDSFb1OHB1ZKi3dcQpZPBcwhPRGIj6Ref3oWA4fMVlAgi8R0eA3lf
         s4NnKRQ0viyZmPvBeoOW/LrbDeSv0QoxJTTgBdAbwvhDnbJEecF8CVyeUDwEFWh1nVEE
         u7iQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKEo6p8StHvJTPGTFiOOSuWDR96Q7hY5uWr2eAq4yJtZ9KXovMm+d78XeXbpD4BaUO7DG6txLgE2YssBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tikLNSe2zE1AkFXtyFKNPN5hgxxtrDLyA/MBi9ZZ87jDPbd8Q
	k4XU0wqWpxDcwDHbTsYuZdX04Yo5RQABXP/7Vw+HDp9WJzeVeIZXZGNmElmlVJCB3aYL7KLqi/O
	2esY9nwxx2/MBHiE2V7gIF+ioORtcatYe0gOStSV+JR9i4QSiJ1+gWaPhMwsv/HU649oEMPXi0p
	M=
X-Gm-Gg: AYBFou1suxq6fAr/3gkICw58OdyqTfY0OtR+phPehsPI3dgqzK4+EmTG49ZxWMC+FAV
	b4RyBezYYm3T8JrpeRlR4nAAOtXxY8/LIQUvfFqV8+pJtlSl/r0HALVug0tconljJt03udWTDm+
	3Ab9e1UuwAD0lnwRHT5kF03MQYf9Kv38AzSaf3MkofAwhls8SWWkFuU5hA840wOYaNAmATXkM72
	aKKGcv2522vCTZPo5Z2Vif8xfzjkgT4d9huJqHkn4e/eCDjeS1n+Yg6uX3d02cYbuvAODDqcZww
	mpb2dkwN8JpMiRPOi//g4EdgpjMPMJTXwsQxBKNldBb/WyU5oMi+TaVkwFmn7QuDxOpCWLkC+Is
	e8q7keOgVHaDdGECmk4yxWsShEgiISUU6Ucot5XFUTgvJzeOGLUVJxIo5l65JFQolqQ8pTlBQJp
	vi1A==
X-Received: by 2002:a05:6102:c13:b0:7ce:a69d:b020 with SMTP id ada2fe7eead31-7d072232e7dmr4404433137.5.1793712046595;
        Tue, 03 Nov 2026 05:20:46 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:7ce:a69d:b020 with SMTP id ada2fe7eead31-7d072232e7dmr4404421137.5.1793712046016;
        Tue, 03 Nov 2026 05:20:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm25028605f8f.43.2026.11.03.05.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:20:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:20:42 +0100
Subject: [PATCH] fsi: aspeed: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
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
Message-Id: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKnf6WoC/x3MQQqDMBAF0KvIrDtglKatVykugvO1AyUJGRRBv
 LvB5du8gwxFYTQ0BxVsappihXs0NP1CXMAq1dS1nXeu7Xk25WAZEF6yJo4pYp/+q+kG7kWCF/d
 6fvybapELZt3v/jue5wWazr8fbgAAAA==
X-Change-ID: 20261103-fsi-aspeed-gpio-nonexclusive-3dda6d175968
To: Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-fsi@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JM4hxUuDHFTKWRhWdb7Y0Uxm9PMGHQj200nKYHyrYSQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6d+sehilbkXKePTpQgQLuD9189WQlF28F6T9I
 V48CXFl2ACJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunfrAAKCRAFnS7L/zaE
 wzsLD/sF/61Ts6Vl9U1VcfUV+7ggD61FAlUXLtBKNyTjHiX0HkjN9eP0cHAw5zg8n7GuNyHt+EF
 iEDpgCrXHP2zr1ihPlySUvhY+FOuCrc7v0+hz/R7vNRwRfyWIagRxUs3Ie12UDY8W0JSsN3TtHH
 vvJtFquRlw0DDk2ZR6vWYyfKiacbSqogBp+mMRkTr05O5go/cr/al/FBc+wsK36UxBGhUkS1fBX
 moOhqrXCaYRIVRf54qMYOGg0TLG4jwd54NKTzaLQp1ANQ3ipb2sgY+9M7f9pmwuRmAdE8EIKkKP
 w6uNzCdV7u6AZ970yxsacAuTjjFShmP653M4ycK73dFsNyaQU95EOjZXC8Uzgo6qCm8gCBoSFbR
 BWiv4AdasEoDL5fmCDHORU9APEAggAxy1EbL0mAgS5byGLCZf72WAF9qh05Mea2lMgrEYhThLbT
 nWm+3D1EJb4JjDEojVo5evlfAc67c2Ttb8m7xrG+ziXIYKrOTdOPFTNsdPJH2V/f3aun4mU1zyU
 BOCBxw0sb6pOYfGQCojViGgWxZ8P+QtzUtsbQ+5S3tNSYRFqDsJsPCjRUqJe0rgHd3PAQib8Y6f
 qXL6cHYOKZu/Trd0DLQyCk9stc3brh8bf1rQo9iDFoHm/xNSOObDWOoTy14uhNpveFCSI4lvwqB
 6Z6tJwa+9K/jT/A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9dfaf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FqAFu7yXOSDO3m4w5aYA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX19D2NnvD9lt+
 v5A9zyLiFyhGFchRE6QMxeUjVIcJxAgIrSbtNHlEJrizYKImf0iU5lBPO8dxTgg701lxeeUVrrN
 B2ZSji/iB5bsEhyMFNFZWmfQJ+qyvkzlnorwl/i6efcxkBMUgmJ9G6EYqxrqkU+/7hR7PLbdyGz
 3Ca/zR1901uOc69+AymF8coZYlT3oHcGFS0JdIhWqu83nhgPp79fD561Lq3QwZbAftJ7xlLnbbV
 VchQLYdDmmxMzeur4jmuMW7d2WxUDsWSeLtIDHV8BmNflFqFz1WK8ujx4s+G+RR27U0KrmK61Zh
 kHLtTSOipl6J1fGOPIzcP4ek+uZBAjzHXFamyjVxf6Qwz5JpW5HkUFqTSmWfQP49eBg7RsEkSGZ
 m6zLQ8W//r33C72Pk2vm2QFwKERVTnbUEtOu+BkKfBa0UbikM2EBPW5Giu7qf/XNjm0pNBPZ5wT
 e0p6da5nYUCrG9JByng==
X-Proofpoint-GUID: 4PjXhuw7sWM1ugqr6XOw1XkSOYPs6B9L
X-Proofpoint-ORIG-GUID: 4PjXhuw7sWM1ugqr6XOw1XkSOYPs6B9L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXwXo3IsGNcx4B
 I02nilRSMNPF3jmqSf3laISGKFeZE4HIvv43x+AcJ/K0ykvbUW4TWEwNjVDpaj/F5lWJ0qMHpqC
 gLEFKoQO+smbIUpogAH7XTjEHrg6jRI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

There are no users that share fsi-routing-gpios in any of the upstream
DT sources. Even if there were, the right thing to do would be enable
HAVE_SHARED_GPIOS for the aspeed platform as this is the preferred way
of sharing GPIO pins. Don't request the GPIO as non-exclusive as this
flag is now deprecated and will be removed.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index aa1380cdff338dfef7caa8d516322e6bf90371cd..88a3a90abef9cd22cae03f5666936ef7eced8a7d 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -496,8 +496,7 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 	 * The routing GPIO is a jumper indicating we should mux for the
 	 * externally connected FSI cable.
 	 */
-	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing",
-			GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing", GPIOD_IN);
 	if (IS_ERR(routing_gpio))
 		return PTR_ERR(routing_gpio);
 	if (!routing_gpio)

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-fsi-aspeed-gpio-nonexclusive-3dda6d175968

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

