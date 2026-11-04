Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801080;
	b=R9zSvFm7xwCQ0GQe6fExRJRNQduI6JlVEZEk24JGgDPwcwQ+IicNHhpOdLNfgrdAy42N
	 LXBn66cu34lyywpxhm95PnvZdrXI5r9WZnInpSgpzak0ohTPCTlv8Gaki4/76Wm7O17ze
	 4ceGTuLwQ8IP0QvkHEx9WzF7lCqWSSkOWLRlzNN9MfCMvYeoeY0+4t2+RYyikICdcwMOX
	 fV9w44IotsjcYNxylSd8GqTUOhmmgqWaZg0C1DAexzXMFVcM53EYaHJcs7pAgBjLFlE7S
	 d08i2IeURVzsIQIltHCFf8rt06iYwD7Ha/xQ02N0RWgqH9GyF29EdkQDLINtRuBTZ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
	b=2F7HtLhIowWjGVL/fvV/9Sq7IgJGcDItAlibxB1PxeDkyV9W27UFjPAbcnuJcqOoDPgF
	 LjeM0riXIx3zFDYykliNqTxFxi8XC2P9hyWFHahnZa/5VxIq/M1w7LvB6uBqncD3U6bGj
	 f9Cj0ydRQLT45dTs3tTJ0+j2Fu9VODK7iZetqYDTOpVNWfaoNi7ZA0eebWntlqqNkKQJZ
	 alOb0inTdSY7xX582RzVwh0HQ/bQx95cp/zk0+h+mn5TWMr7SoEjG/ByqRnuwsTYmR/Hw
	 EfxrDhcGnKGc1BcbMG/x5GcGHcI7fTekfMRpFMTDjIgiyIxqV3b0877TGYi+SFYoEfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n6BlCfAp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NvbfJL/y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3D6606EEAB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3D6606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n6BlCfAp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvbfJL/y
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZraR2284164
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=; b=n6BlCfAplDkRIGJY
	OtZvEiHnmJxfVXUqgCmbQ3HY4qMos58f49uoPT2qpuxiyvNqXiZUg3EAZ5KwManW
	X/P1irYdeYwkWlRqhibdk0ToPW3KLNnTBRwQTibR6cnH0c2CL3909RF2qxFC5T4z
	MRmi9u6ZWWSk4u5RY207c56jDfI53aj3If+toqprwFx9Ltygiea/igBKX3yIXB1z
	2ASo1yVQ/7vqLDwKgTyjFS0FLODgtQOWhBH3BwSI9kvYT9eMd0/0Aucly+AJ/ijl
	ncAoe+ZbTi4hAD4DoJLZaXlEQGcrbpqC04GepOi+liW37GrSLDaBhRL1d4h7xKaf
	1U6CiQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s05h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:04:38 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab0467c89so810756e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801078; x=1794405878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
        b=NvbfJL/yWxdly0mzMB6/yTHY5+E/Ed5Ks5a5IdsMVPNmio7uI50dSuB7OPdrgmR/iJ
         YzLCDOysbwjZmCAMywp1x1GvF13tF2X9QjMhslJc25ut4RmcRt3DBjP11Xc4iBGPT5LG
         JsLzl1Qqh0aprVLr0n6i/Iz2oVbOVnPXml+LGzbZAn4dCjd8QOkXq+DVyI9bAuKnncvh
         eR4x0xTwt5J1NK2j1Ee6jnMv1eRQMybnj0OIj4P59aWcz7CRxzpPSI4hP9tVhkKr7JsB
         PudwoIpfe0kOpaNwiJeTBEvECxLxzoKJhXYEuT3MFMed7j/Nt4xx2Q93r/0kRIZOZUrj
         wE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801078; x=1794405878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RA2CSJdL7Exblpp4WzRIxFOf+cFemPFyxHbTRFzm9pI=;
        b=hRNyqrEYBI2VU0+QTHS1hcivGXrKNbvRVHCEja1fGUIilp5IR64c6JsBUCAZ+FirIg
         oxOFXonaVBxWW6jowHpei95hD4b8Yg72HoZoBRPQ+ZVez3zQ/0UO6isU/ZAG1SHobK9X
         z2g5vug+WLCz+TgkZZfPEYNs5uDzHELO+Hc2nRp6tL6axSXOZ1h54rflMO9hTEeBcr2H
         DVGF4l16cUymWOp6cRzh84Gw8Our8l6r4PaZDy97xIUvM70XqOF7iAR3Y2fL5Eesd893
         7+B7ciV3V9ivv4Y6x/uSsZm95p79psT/UhwOHPUbButCnZULYcmzUq4ij+ryhJXrLH1R
         uElg==
X-Forwarded-Encrypted: i=1; AKwUvBzL1/KS09eASphfYBzvH9MTAOHTwGOC1q3fGlys0epwF5P0xeP+q3ZIAEzoBvR4xJ5//prQsXJ7jtuGxlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SrQCk0HJRT52T4E1wIA8aq0L8f7CpO/T0sNncOVV9VWOhXQ2h
	wH/GitKQ4jd8F8yxneS2/hoyV/WfCmyUxdlFhDVGzq/BViXCK18rWWVMczH7w8Qxp5AX4/Irs10
	EN4XZUq3itB95zdMsUxwoRAGkdJhTndNa6KhkecWsAzUoZCuWRlvnLZ9TA71hT8A1iUo=
X-Gm-Gg: AYBFou2Oa8QujoPmVe2TprbRn1C8BE26jIt4gbaFY56kO9dRUFTVE7LpX8m5mLJCqrv
	oPzviQ+SPeNL1s2NCFv3/esAyrhNMdZ4HzsgN+I6codQbk8WnIYja/+YBHjkfU6f0lepa0b4X3L
	7UOmz0ic3FO3D8qwYzh3VatXNhQwXfEaxA8ZCaVnccsEjRMkc6YFH1Egudfu37pwRhqLe6/vHqP
	8N+n48XkkHAN4psJTDsF8Ve2u87bPDnt28p60xZftv2tjTIP2lYGNaOPKp3B/paood7kt+tQl5K
	Nl42ubL5OxkPS6Dnsm79FVfUkkdA5AT+K4m4OI1OzciIsn/uZCWkT0nkL1JIMcFfbUM1DVf27Wm
	Ile1l3fXWG8eNMIRzIp5bXjTML43AdkRwiH2GazVNHfCYO97Mg4650vchM7+j6w9R+ba81U3EZN
	wCEQ==
X-Received: by 2002:a05:6122:c89:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5ec689f696dmr7593943e0c.20.1793801078026;
        Wed, 04 Nov 2026 06:04:38 -0800 (PST)
X-Received: by 2002:a05:6122:c89:b0:5c9:c60e:3a48 with SMTP id 71dfb90a1353d-5ec689f696dmr7593898e0c.20.1793801077646;
        Wed, 04 Nov 2026 06:04:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:50 +0100
Subject: [PATCH 8/9] of: property: implement the count_references() fwnode
 operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-8-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jfcJL94RVspgN8CyK/snZo0rp9b0uidqlV9W3mfnsrY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSrVGZJPcf5ImbusE8w0YzObuzDwHNwk2vf
 XWwfHOBNamJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w2USD/9+/oAE3ozJ0woCpNJfEKxkKc6OkP+Fp13bf7ApUWvG71blBdfNz430uIpxhii9lx9NSHF
 H5yKot93opIVe4f8X7I07vIwVAQBfP1dtTdnVWavMAELyhSWVOIQX2Lp3EFd4Rtky9afjzaw5CJ
 n2zulXoabInrDbALeCiYXy7xfflbtsynqdIjm6SLgnLpb4SURUSTbySU1yoF6hIZLyU9GmQ+Zm/
 A5D4lBHWrYNUZL0OIcWQvWX2Rq/S98QJJAzublBzvLUImTHuwL2SuDBQA/qMIjc8oKlukqHP+/l
 QGKLXZ/T5ru2K9z8VOZXMD6tyZBzMrVvhZSIBS3UqsgNlS5FSNVGiBR5bWprnwdgXI59W5smAKT
 toEgXdyTdb5o5ZUIziSIfpQabmoln4rKHRISWIGZQ8WuqucOi1iVa2XCEQKsUkLiy82wmALNRKD
 uPDnmLZQVGnDdSWcMrHPAQ/qWTFNV4K1lClnzSLHITbCd5uM4piou2+lxdYgbR9X36K5wP2jxS4
 areuRfuUDSYwSS/3EZBlTtUolLcKcPFlfrgY+TPvIuh8EPLSKz5Dc+BGF15ed3UqLsy8M2yU5GU
 GxstGJJLPGB+wYvlupd0Y9JXoZFvF0wuLIWD1XqR7FCCgW3to2+DXgWre+0LHZF5xUFVpyD9SjA
 YNWIV37TclMW99Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb3b76 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zSBz9IY8uK3Zdpgw7pcA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: XmodoR-SJ_xP4Elnt2rNvLzgbiM8cYni
X-Proofpoint-GUID: XmodoR-SJ_xP4Elnt2rNvLzgbiM8cYni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXy9Ud7CgCieCt
 VxhU14VIb1lpLkBZMa7F9yydI9W5o9PEqTHsasZHUXTxN0GaWQp4uQ2opIYSE/fvZogAWDnEiyT
 1hAGFhWFvcwXPDyLT6vvqsIEpc5Jj1NU941DZLPimBFUaDHqUeI94WyEbV9MqcXieo9JKnOP+2C
 aC9HQfyLnXDMHSBYoIBYZb42uD+yhoIFOHNRcES26Xz89VK6YJYYwyWswgTGGi+HhcgKpm2GRVA
 Ois4PmQRcd62K0+ZZZ3fTyqRn+c+awfZhLHH2BmcKUEo6EWofT0I1a7QK5AlNtVQfhzdExjPP4M
 pkmn2YW/UxAF5v+5fGfHAZN01myXrYctChRxN2T9a9kE7nh5AocjmNr9M+3X7hCzmxY5xLUs/aw
 cUGYjoxpWK1bmeQUvSyK0P9Md5rksTJvnEPefrnsFIvfX0c9mwct4wvPZ4e3Vq4gjNfgYS7m1p4
 4TJH5Kgb1CBzidR4xkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX1JuFb/h7W8Yy
 EHbpUCsIkSvzM/T98a/ypD847vgCoi7hN9++Pg352AL+1/l2oNH8OYPzw6pLAnajgnK+YUwHBMl
 8YfeeMJVTiVyvQoNmgDlH5MnRpazHPM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

Implement the property_count_references() fwnode operation for OF nodes
by wrapping the existing of_count_phandle_with_args().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 16c9c307633bdc7c9343782b1cd3bdb845552c6a..ae2561479e2382b241fd87dcddf52dc7f52a950e 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1231,6 +1231,12 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	return 0;
 }
 
+static int of_fwnode_count_references(const struct fwnode_handle *fwnode,
+				      const char *prop, const char *nargs_prop)
+{
+	return of_count_phandle_with_args(to_of_node(fwnode), prop, nargs_prop);
+}
+
 static struct fwnode_handle *
 of_fwnode_graph_get_next_endpoint(const struct fwnode_handle *fwnode,
 				  struct fwnode_handle *prev)
@@ -1747,6 +1753,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.get_parent = of_fwnode_get_parent,
 	.get_next_child_node = of_fwnode_get_next_child_node,
 	.get_named_child_node = of_fwnode_get_named_child_node,
+	.count_references = of_fwnode_count_references,
 	.get_reference_args = of_fwnode_get_reference_args,
 	.graph_get_next_endpoint = of_fwnode_graph_get_next_endpoint,
 	.graph_get_remote_endpoint = of_fwnode_graph_get_remote_endpoint,

-- 
2.47.3

