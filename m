Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708492;
	b=cdALElQYJRH2xRhZKNKTpoZZ2Ro5gKrspL7TX/s9RORBeISHZtGc3Zw7Bm78RXXEx8mk
	 9i+5OIVanMjUW3lHksm7gAaGJBf8B4NBNJBbbSFPpnlnTTbQeZrLLzYtSyi+zQz+jqX3X
	 vrM+WRpL8wlFiVcgDQAkPUEO/Kge+o46yBwXb5bHMey6wskYonxq1/Nyj/YZz/skeFawV
	 yicxkSXWLCirrcO1N8RKSXCAcBTpx3M3QdWOmnfX7D4yho0CXieyzm+dCMg9X0VnpmGpO
	 MWYMa/+EhWfNT8ZprGVRO6mkFjo5Fm12K8CpBqdB5fCg6Zu7VcBd6eJNRpxGSw5c36Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QGm7wYGmJIQDB3pcidXX7NXQCzJ+tuZDwceOdjmRAzo=;
	b=DrShUkm5wKq+o0RYW5Gn2FpCrubKFXT+O6M85vuextfUvDT/oDtnLNMcy3l5v92jidP3
	 vx9qS4jxq/DyCZbLpoMd318CPgMkwqzXu+8kJgGh98ARwT/5/qULKrYcMCi6qQlxZWL53
	 q0U8OpKqpciZsFKiK08r91Vv0vnXkORhuR3Jg015HAllaY/DsPaFdPdKElexszVtEAGBg
	 VzJhZhBQDsuVhnNWtq1meW7cCx2F3hIW/QV3Jq8I9+lPUq6vKI1ydryQ69+56pWxm8LN+
	 5mgyrhODHro8h5DVM7/UhGOqev/rgjsa9yL3a9cbQ91V8ghDMBsG5FirZX6Q333jr2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQeq+5gX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DclYGcmZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151B606EE97
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2151B606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OQeq+5gX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DclYGcmZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAmOh928139
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGm7wYGmJIQDB3pcidXX7NXQCzJ+tuZDwceOdjmRAzo=; b=OQeq+5gXUZODsuds
	TIi/KQoyYcK9bz/JZCA5U3VVv21Mrufn71okKjfHFAy2DR3f4KE9Bwc4m3TIELVl
	jV8CMeKWyOLa3j/k0f9EW1wxtncrc/ElNLF7b4EGdE+eTyE4EOGwzrcqgSY68e2a
	WYCH5KVMR7CSXutFOQCrsN7Er5GYF6b6zGtimYQ8BTNB7tiL/dqyqc6nVuI1xtez
	4HpM2L7uSjp6IbAOrIghSqCT65xsqUVUaICyLsTTuZFSY7dziyFJbcumVY3gzGJ4
	ytdIoivTFdnS3m6H/9WQurBxtYeaskmmVY9NWmKygR4QyN6NHTb6Ql8XQ6V+gSjW
	DE/MIw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ekp6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:21:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so3134916137.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708490; x=1794313290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGm7wYGmJIQDB3pcidXX7NXQCzJ+tuZDwceOdjmRAzo=;
        b=DclYGcmZExKbHXPPxs/2tjcRnJzkt8AeY6Qxzk57Kc8LLHV01FbSVF2cRQorNzOEqj
         b+zuvfCpUwLWM5a9spG/VoJR2r7l8FsLiurclcly6QWtCdlTQSKkQGvJs2ViUyyp3Fjg
         v7IapZl/SM2SNKblCBsrEo7tPNFABnOSfHmahDht/uX7Kqy66O8wQXfYN1ibLArAuvtq
         rR4rn1JdmEYdMECoMDSM7u694npDpEgdk5UbpOuv9C2NW13ZfhWYI96qIl2+rpKLM6Ud
         mIY2z2lwZlogb1/ydkbQP2B5hpG36ULaH5OmHbWmSkbULZjh93Eq/TmLiR8BBTK5b5pd
         zT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708490; x=1794313290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGm7wYGmJIQDB3pcidXX7NXQCzJ+tuZDwceOdjmRAzo=;
        b=LO+L1Xe0hmdyL+Um341Ule8h3CP65VgR0QfycLygtvMP8d9Fixuqw2ovs6THPOOVPf
         1OA2SUI3i5HYWTTq5+fCA6XSsChxF80ESW14nbT3vrjFKEJqtmB3QY13K7HsMXqBEW4M
         cFKNJyTIW/g4XhdKSy3us2Gjrpo0aBHreBkIFe9kR++VBPEzHpmMWem5M5WmJzlkP6D3
         tYdpZ8wxmnGHk9C+VQtJNa+BWZQEawIVp9h36wnSAkLyd6GdbOiU9etpwbEovpvZIUAg
         wDxZ4Cm/WEsQUBkDMZkXfoGjMhpIwEfUs8iS7pkdiPQD0vvnBaopns8qDmj+0VDffIx7
         xPsw==
X-Forwarded-Encrypted: i=1; AKwUvBwi2+7cOByR81SwnDJZb1q/ufZKuW5whFU0LAjpQeQY8zDR2/yVuWLlAxVp6ckSHOQSIMwTuNCqyM0F+2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ken8fCmdqW4FZsDIvP0RvZ31XE8L3rBuewvEOFPq+lEBsnQPH
	Ol5wAH2EoWK6LlTeVCdnHvX4YKO70+yxR3n7G5HTgRLRvWUvPcjlbNBa1KpCv1X2bF9x2oYrA0g
	AFtAWswwQyp7g76miDWAzN/NoVhaE4uSiz8sisBFs7wnUrQQzigyb4UV/1gCd7QDpVm+0NNzarA
	g=
X-Gm-Gg: AYBFou0gc5tpaURVtMK1Yd8MxlI3npWgXGuknp3/Xgyds0suOmYPtfEJTrNPSn7/F3H
	cNuPa1kpTlRyfveyds3mkVpruG1SjCfK7gABzEVUE1Rs1cOSzwLHfuDj9fv36cjegX8QLVrCl/9
	eBaiN/qjteOicIMziNTcha6gxXpO7eE2bDMpxTRI57FTfbzVL6kPhnlIDZ0UOz77Pvpn6wshF8F
	k2h+7NwaWF+53cDv73jMwLNN+sMpJ3+0LkMLKt16NHSXMbuXeiNIIm1igCxvQWrMI8/Th3EFJjK
	1A33iTFSF633QFG8KvjXlfOAqys44SZaAiPJDr5saQmuxu045mQG2g94IiSz/p2WLlzIuThaZBF
	8u7TDjCfIzaw3JhJdb309/8tKPpYHs/Fbvyni9aGANSivVs2FWJjVBsVo8qtKEU2eiACcchI/8b
	msFQ==
X-Received: by 2002:a05:6102:f0a:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d072bb37d1mr5700001137.12.1793708490221;
        Tue, 03 Nov 2026 04:21:30 -0800 (PST)
X-Received: by 2002:a05:6102:f0a:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d072bb37d1mr5699983137.12.1793708489651;
        Tue, 03 Nov 2026 04:21:29 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 13:21:18 +0100
Subject: [PATCH v10 5/5] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
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
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-5-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10463;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=H8KMjMOZF8TiAQ5T+V5cwh0II/qArLt6ic6QXL7Hedk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+7sa0FXInV7kDT1U6tjrn3ZLjfy/oqcNS6
 QNnB6x0pHOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w31tD/475vUW1J10d76D9c+EfzcaG0IbNwbSu0E6JkCT3K+hu/39Org8F+mOHFXzz6XODB+TQJI
 GOndUqIw5+dabPnLQgMf4wcwo8oNM1JoP6s6rYuDNvqhzZGGicBIVIRqdYtEXLTsj8IKfF3tkvG
 NdStEkC8W0pRcEAynDI/FWsA8RC4eEzkIQXYun287IOwX4RZsNZZc05sbELVxv3W4oJ+RVe1w3T
 BVXUwGelnNhs2Ef9e2z1Ng65bBxZ+jViUutPDjkpmi5+GJO5JyWMsqtPHI6Hcajm7F0VhhY4Ei+
 3PNq1QiJEANzu9x2oHyFtrVjKjTnBljv9omnBondeJxgVguq2KrNPnFA2bPEY9yW4E7kpxNSD6J
 +IYMB2mtXdI/Xeu6UdcQKVxwdp4VmhQvUT17/WTZdPYRnTCJJGoWbUA49UYApA5ue/VYPeBBVRq
 ixSfrV5J2bR+ZbMRuKxDQMQ1C6kc7bQCZW0zuszYTdrJvqqSc/SYq+Q5VTSVUkQdjn4KFpHFbEI
 ajXUteERSIsCM98uNS0iANHxO/a+eJu3dKlVO+72nPt7TWdxg83yC/K0Ms9gq0nRZzAbSDSKGJd
 RKTLEwyl/N6yYJrY+7lO4iJRyS1kw+DZHV4L0172JuLMN/B1LFpoPu2qb0rXGL4/JiXY9wpjM3K
 0sfV9sT8CP+ShPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX7hkYBGQ34vFy
 rGqqB9otefZHkSh9w/P2fEg8E249eq5JQha7ffDkkAhN/bDtwWZt6QPvNZ8hm3iV3c3Qnv3E9XM
 LWsPKzZItepZH7J/KqQrsEzBZ0VYKFhACDS3hEpSL8kj4iJA+07bj0ijl7a48w2Roh1CehU4HGn
 WGrD0iDYHmJqCXpWkAlVONpb5xQV5jw3oQ7AnNEfHZtvKTR1rPQrv0sE5C5hEoUCyMN7SJovGRw
 oW39prkKHHvgO7h4ibZnn7Dv6KPBNQ0yq1Zfmr88FnmYx7rzd1hCwAxksVuWS3Kpf/fglCfj51I
 q3nUe0/hakOcCf8hKhdpP0m6axCddNhPsSJ+Q0kLHbQlthKp1dAkcMtl2noNo0WLTNP4ZOc9nS7
 mzfwl4T154sfyGioAXdL5GU2dc+CDmniKudmWhgVyiKW5yZwhb80eVgxeW+bnugXd71kwrkqFQ+
 ehQvsAC8H0ny6f+z4wQ==
X-Proofpoint-ORIG-GUID: m57fWscjyfN6XzRrAUube9XcijzIl29W
X-Proofpoint-GUID: m57fWscjyfN6XzRrAUube9XcijzIl29W
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9d1cb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Kgpy9_VVMJhbcq1J-EAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfXzFF8y7YWn3+j
 UBpzzzN2W/Yd9NkE+LajUl2f4DoRC90CMGx2tByKnZEx2sDZlR8LpygmidAfa/X9DsR0OLz6rVY
 FxC0isOYdUGrw5LtnSr1MaOA9yAaVt8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

Automated management of shared GPIOs only allows to request shared pins
when they're assigned to a real struct device. Firmware node, no-device
lookup currently isn't supported and can't be because we're using
platform lookup tables to point the callers to the shared proxy GPIO
controllers.

Rework the GPIO sharing by using dummy software nodes assigned to the
proxy devices which allow us - once the correct struct gpio_shared_ref
is found - to find the target GPIO device by its firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 145 +++++++++++++++++++++---------------------
 drivers/gpio/gpiolib-shared.h |  15 ++---
 drivers/gpio/gpiolib.c        |  20 +-----
 3 files changed, 82 insertions(+), 98 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 9d73a02e998909746f5216f40dfe4d82f7be9e1c..d5f272b31e4ef5feab56c2ebd6252dfb5ebb6af5 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,11 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	/* Protects the auxiliary device struct and the lookup table. */
+	/* Protects the auxiliary device struct and fwnode. */
 	struct mutex lock;
-	struct lock_class_key lock_key;
 	struct auxiliary_device *proxy_dev;
-	struct gpiod_lookup_table *lookup;
+	struct fwnode_handle *proxy_fwnode;
+	struct lock_class_key lock_key;
 	bool is_reset_gpio;
 };
 
@@ -303,56 +303,76 @@ static int gpio_shared_of_scan(void)
 
 static void gpio_shared_proxy_dev_release(struct device *dev)
 {
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct auxiliary_device *proxy = to_auxiliary_dev(dev);
 
-	ida_free(&gpio_shared_ida, adev->id);
-	kfree(adev);
+	ida_free(&gpio_shared_ida, proxy->id);
+	kfree(proxy);
 }
 
 static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev;
+	struct property_entry properties = { };
+	struct auxiliary_device *proxy;
+	struct fwnode_handle *swnode;
+	struct device *dev;
 	int ret, id;
 
-	adev = kzalloc_obj(*adev);
-	if (!adev)
+	proxy = kzalloc_obj(*proxy);
+	if (!proxy)
 		return -ENOMEM;
 
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
-		kfree(adev);
-		return id;
+		ret = id;
+		goto err_free_proxy;
 	}
 
-	adev->id = id;
-	adev->name = "proxy";
-	adev->dev.parent = gdev->dev.parent;
-	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_proxy_dev_release;
+	dev = &proxy->dev;
+	proxy->id = id;
+	proxy->name = "proxy";
+	dev->parent = gdev->dev.parent;
+	dev->platform_data = entry;
+	dev->release = gpio_shared_proxy_dev_release;
 
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		ida_free(&gpio_shared_ida, id);
-		kfree(adev);
+	ret = auxiliary_device_init(proxy);
+	if (ret)
+		goto err_free_ida;
+
+	swnode = fwnode_create_software_node(&properties, NULL);
+	if (IS_ERR(swnode)) {
+		ret = PTR_ERR(swnode);
+		auxiliary_device_uninit(proxy);
 		return ret;
 	}
 
-	ret = auxiliary_device_add(adev);
+	set_secondary_fwnode(dev, swnode);
+
+	ret = auxiliary_device_add(proxy);
 	if (ret) {
-		auxiliary_device_uninit(adev);
+		set_secondary_fwnode(dev, NULL);
+		fwnode_remove_software_node(swnode);
+		auxiliary_device_uninit(proxy);
 		return ret;
 	}
 
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
-		 dev_name(&adev->dev), gpio_device_get_label(gdev));
+		 dev_name(&proxy->dev), gpio_device_get_label(gdev));
 
 	scoped_guard(mutex, &ref->lock) {
-		ref->proxy_dev = adev;
+		ref->proxy_dev = proxy;
+		ref->proxy_fwnode = swnode;
 	}
 
 	return 0;
+
+err_free_ida:
+	ida_free(&gpio_shared_ida, id);
+err_free_proxy:
+	kfree(proxy);
+
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_RESET_GPIO)
@@ -457,23 +477,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 }
 #endif /* CONFIG_RESET_GPIO */
 
-int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags)
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	const char *dev_id;
-
-	if (!consumer)
-		return -EOPNOTSUPP;
-
-	dev_id = dev_name(consumer);
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
-			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
+			if (!ref->fwnode && consumer &&
+			    device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
 			} else if (fwnode != ref->fwnode) {
@@ -484,54 +500,48 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) != 0))
 				continue;
 
-			/* We've already done that on a previous request. */
-			if (ref->lookup)
-				return 0;
-
-			char *key __free(kfree) =
-				kasprintf(GFP_KERNEL,
-					  KBUILD_MODNAME ".proxy.%u",
-					  ref->proxy_dev->id);
-			if (!key)
-				return -ENOMEM;
-
-			struct gpiod_lookup_table *lookup __free(kfree) =
-				kzalloc_flex(*lookup, table, 2);
-			if (!lookup)
-				return -ENOMEM;
-
-			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
-				 dev_id, key, ref->con_id ?: "none");
-
-			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
-			if (!lookup->dev_id)
-				return -ENOMEM;
-
-			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
-						       ref->con_id, lflags);
+			if (!ref->proxy_fwnode)
+				/*
+				 * There's a matching shared reference but the
+				 * associated auxiliary device has not been
+				 * created yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			ref->lookup = no_free_ptr(lookup);
-			gpiod_add_lookup_table(ref->lookup);
+			struct gpio_device *gdev __free(gpio_device_put) =
+					gpio_device_find_by_fwnode(ref->proxy_fwnode);
+			if (!gdev)
+				/*
+				 * There's a matching shared reference but the
+				 * associated GPIO controller has not been
+				 * registered yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			return 0;
+			return gpio_device_get_desc(gdev, 0);
 		}
 	}
 
 	/* We warn here because this can only happen if the programmer borked. */
 	WARN_ON(1);
-	return -ENOENT;
+	return ERR_PTR(-ENOENT);
 }
 
 static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
 	struct auxiliary_device *proxy;
+	struct fwnode_handle *swnode;
 
 	scoped_guard(mutex, &ref->lock) {
 		proxy = ref->proxy_dev;
+		swnode = ref->proxy_fwnode;
 		ref->proxy_dev = NULL;
+		ref->proxy_fwnode = NULL;
 	}
 
 	auxiliary_device_delete(proxy);
+	set_secondary_fwnode(&proxy->dev, NULL);
+	fwnode_remove_software_node(swnode);
 	auxiliary_device_uninit(proxy);
 }
 
@@ -543,17 +553,8 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	scoped_guard(mutex, &entry->lock)
 		gpiod_free_commit(&gdev->descs[entry->offset]);
 
-	list_for_each_entry(ref, &entry->refs, list) {
-		if (ref->lookup) {
-			gpiod_remove_lookup_table(ref->lookup);
-			kfree(ref->lookup->table[0].key);
-			kfree(ref->lookup->dev_id);
-			kfree(ref->lookup);
-			ref->lookup = NULL;
-		}
-
+	list_for_each_entry(ref, &entry->refs, list)
 		gpio_shared_remove_proxy_dev(ref);
-	}
 }
 
 static int gpio_shared_setup_entry(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aafd087df267a4a32732ccc03af38e..27fd2a40c5cb77a19c258e3fbf429d3f6e7d4b32 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -14,9 +14,9 @@ struct fwnode_handle;
 
 int gpiochip_setup_shared(struct gpio_chip *gc);
 void gpio_device_teardown_shared(struct gpio_device *gdev);
-int gpio_shared_add_proxy_lookup(struct device *consumer,
-				 struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags);
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id);
 
 #else
 
@@ -27,12 +27,11 @@ static inline int gpiochip_setup_shared(struct gpio_chip *gc)
 
 static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
 
-static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
-					       struct fwnode_handle *fwnode,
-					       const char *con_id,
-					       unsigned long lflags)
+static inline struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
-	return 0;
+	return NULL;
 }
 
 #endif /* CONFIG_GPIO_SHARED */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..402de2e106f19fd110d67eeecd3c07794b7a5cdd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4841,24 +4841,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	scoped_guard(srcu, &gpio_devices_srcu) {
 		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
 					   &flags, &lookupflags);
-		if (!IS_ERR_OR_NULL(desc) &&
-		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
-			/*
-			 * We're dealing with a GPIO shared by multiple
-			 * consumers. This is the moment to add the machine
-			 * lookup table for the proxy device as previously
-			 * we only knew the consumer's fwnode.
-			 */
-			ret = gpio_shared_add_proxy_lookup(consumer, fwnode,
-							   con_id, lookupflags);
-			if (ret)
-				return ERR_PTR(ret);
-
-			/* Trigger platform lookup for shared GPIO proxy. */
-			desc = ERR_PTR(-ENOENT);
-			/* Trigger it even for fwnode-only gpiod_get(). */
-			platform_lookup_allowed = true;
-		}
+		if (!IS_ERR_OR_NULL(desc) && test_bit(GPIOD_FLAG_SHARED, &desc->flags))
+			desc = gpio_shared_get_proxy(consumer, fwnode, con_id);
 
 		if (gpiod_not_found(desc) && platform_lookup_allowed) {
 			/*

-- 
2.47.3

