Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318433;
	b=xI93wqEKDGgQQnVSxuE/lCArRjvAgOVGk2m9WkSJDFOJXhF6CYM6PHvHNRpRRWf5j8RG
	 bj1Zm1sjbZhmNMJvMVW1no/P7/ziJOx01XrgC1KgYLjrjlWsgiaILBmbScBbMjAUfKNQS
	 Umz+ihmw2DTlDKCjD6/q7l8/4N/AehW2nfRwmsSx5bUlHr46bZvBX9dSuqbHNzVddOlpB
	 xb22TpO4vfy81SmdygwGW4Z5CVx634Kej9Ch/SGYSH9e3Vs7+Z7NRGq4p+saQsSPGzYAn
	 YihssS78FaC42aPqQNL7enO4zo2zY6mkN5cDqTy9XaI4wPFJHCA54tmGX6oGhAkNR/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TQeRYkQmJ7tDCHRVBmpwt2sZ5VPFxjPdGPyUcZkNU+U=;
	b=cP1CyxE4ZR250/It2lbkrvhNkErZn+LYR7kjuD3w5BLgsi3Ml4bX0919EIobCfGExkln
	 8UUNdXbXn7wT7aswfSR8iiTj+X3XqxKPPG/L/fnuxXzo8178OiydaihqY/FoO7kv9r5le
	 4X/1WrvLJo73DS6aP0kV3D+X4P2Ahgd/JOxuUb/gv480OaeyUetLkAFMvR7+ONtFD5TVU
	 CZd66bPIS4U3SIqO4tUf/HEM72GPLXlQKimyInu2qI7UG0qTrWRD3wilHPVwzFdmhBlA4
	 yvU645l6eewVXBeVwvYhDVDsc7wJmvQ8jhiADQFT2KKZK2rpeGyJhU5cLhIwn7muM6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HibgPE2C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCxphIiC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC660A2604
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CC660A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HibgPE2C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCxphIiC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA6Ww3217038
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQeRYkQmJ7tDCHRVBmpwt2sZ5VPFxjPdGPyUcZkNU+U=; b=HibgPE2CYo0ZoCjq
	bn4Ej/ls73SqO81dC1lhA8bih6HhHGyKLjwtrdIoP1EhnB5CG4fVz3n8KTFSTDul
	JLXtOXZWHnmNOqxKka3Y5ZZXBCFe5PC+Uq9JBoB0jckXtbSMilOcSZpOleD3IEOd
	uoDjSgh/9iIzFAMzrctJTD0dbr8Y0XA/KMQRHJl358ML0/nBMnhfAFkO9/kutOJJ
	iPjDbzhUa5S4agHeous2cvJd9jSUS0wxHHuUNae5sE9CBXffBSmbNC0+3VnzjoEO
	MN6JhITI+KSvqvzAagYsISClUKnq8eKsss4rN49xIXjBeiTyun6MKMhUNme0dPlo
	8BcpNw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd9w2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:11 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-998de183a74so417939241.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318431; x=1794923231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQeRYkQmJ7tDCHRVBmpwt2sZ5VPFxjPdGPyUcZkNU+U=;
        b=LCxphIiCSXeLbyAEooW7Z/XZNUvTJE7bGdX5WQ3ytiEVvPRPUYSTuLIAPPVo8tePr0
         d1wiuylbQoqU10uLeqTnZvYh7hdY+EpfMKATFRn/HJs0alGicYA/B4lCaZGbJGLQCP0t
         CkQu6Y8k1emlVroFeJvEpoydZlOydaQAW+Glm+y7gAUMZaOqvX1rAyc/uEMBc0/JDrx1
         8rlKpGX5lz3y5YlErJWKsAp6ndpr1woIMsuw+VdGMxeBgcZ8Hnds/2f30oD7NELy1X1z
         UZU7Cw6BJOIUP0J5Wkon4hMy2gHeQ7ZukKR2NxNvje11skKhkIc5qLhAZHNjMbvAxY4K
         qUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318431; x=1794923231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQeRYkQmJ7tDCHRVBmpwt2sZ5VPFxjPdGPyUcZkNU+U=;
        b=Lcc9dp7DaBwLhYw3BUwmmWmmnCQCZD7PevrYViGRTGVHSGKo1UW9jIhkRAb/qsrtnv
         X0xAB33HLCIHHCAIvbs9zwD4mHHDQajlyUTRKtgDL5vK5fpzh5MqDnkx62ATY9Nr3NIx
         lgkdt6PO4KqQuz7jF7NbqKd2ztYt2sJ1JIiJganS4FAGutWClpqyz4zHull5lzf12mXf
         Gc1bASK3YM21hzU+xmkXAK0hbZiXDbuWaL3hVtk2A16Uv77LN88Pr0vrm0im8EE5CCsp
         yc7uoziD1+3Ih0acS3yqxWsVdSpRd6Ml7NvM7+bCnUw+3Mmf7gAZvwAYWofXcvTZ1LrD
         CVeg==
X-Forwarded-Encrypted: i=1; AL+hErEALT+g1f1rRKUvT5qb9604OYijAe+4B7gSxwx16l8g/szX4UNLVvMd28OuB86eQEEm0W/oZJdtBuShd1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wl1Ks+qlqK5U2S8tZC59MhkL9PoaO1WkaFGuuoLn0/ekhRjKm
	NGsvD7/BrN0J8hP1xtueHCt7pwRo/jcfBx8MzrBzazvC2NQsE6Zk1qZmOqIT98HtFEnH9AU9EgI
	LNnLfgkVPxzvKsaahKk/209OVcKUy5Ng2Ol3hWnji7ZubhCCe5CnMcILO4Ce8xORHZJg=
X-Gm-Gg: AYBFou3WVZSZfE5wqS5cGLKq3Op9Jj38f4S5UQuYvgVlo+UZTSsZpTBXpf6Vumi1GbS
	UGdLMUWMPJ4ORVx4zVaaFuVjvvFjTDdybxsa9ioZlhpUOTkzylZx78G9vjYm5q7GdYzL9sxtK2o
	ZCla7EI5KwUpSZ1ksv6arGnV+a0a/QzBGns7yWTA6PEeGDthXbayIIgXrViYFDVtiyBxwOPz+vq
	Kxy2c55Cug1PBbzHKLb4lKSBQs5PYQqwjgyXaz9TL009AFB/Sx2CVjLukgYJR6DuPDSU+ZTadp4
	cL6i+WL4oe3y1Fwft/KP1g5qGJBxLmSHkZpzXan4uPXRq2AM5wTeXKIzZ2bYv5kGFCyStVQZ4E5
	vPx3D1MxttgFqhTkZ5AOpBw8sOlG71zF6FHRcQ/QBy4zMbq8SOQs2IgLpvv17pfEDAovYdBj5eO
	68AREwBFnOCjsSwd3isti4W0lEo5mjuBtDf/Se1XfG4Ujk2T9QLgnGu47F8aKmjEQ=
X-Received: by 2002:a05:6102:418f:b0:7d2:b21f:ce1d with SMTP id ada2fe7eead31-7d301bf6bb0mr655113137.25.1794318430544;
        Tue, 10 Nov 2026 05:47:10 -0800 (PST)
X-Received: by 2002:a05:6102:418f:b0:7d2:b21f:ce1d with SMTP id ada2fe7eead31-7d301bf6bb0mr655098137.25.1794318429980;
        Tue, 10 Nov 2026 05:47:09 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ad9sm75913445e9.5.2026.11.10.05.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:47:02 +0100
Subject: [PATCH v3 2/5] gpio: shared: use atomic set_bit() for descriptor
 flags
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
Message-Id: <20261110-gpio-desc-flags-atomic-v3-2-2f463bce8086@oss.qualcomm.com>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4MZFB/JlsIQls6voOiVQ+Wibv3mjdrlerjol78TPPcc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8yBYx4jd800vQenp6odZ1Gdf0mNQcvRrYNO56
 oaMo6LneDqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavMgWAAKCRAFnS7L/zaE
 w1UiD/0ShLDYH0Rohl7UYOWbHwrWX1HDtQKjUTTjjWLmjVOmZuUr4RjDaPaw40o0aYPD1NIcgOa
 haaMVUDQFtphI1BwE+p0SuR+AHXwR3FRbCuinhJq7VlIXfF8BEGDCXVV46ledJkDQL480Mu6eHY
 3LELcg/aOOjmKH6j/M543xc2X56LvU7AXOMjmontWUpekKMnZeBXLNZvlxxGRv9dNP3P1FshJBb
 /UKAil+H7abucpiRiXsDttHojdsKH9pBAAp4A6b3rA88J/YEl67+qxDXLsVcPqBdICuYfhKhpPG
 TJxO7+x3br0hbKzTkgVbw20j8y92/uDU7dyMm2UZQtAcDdkj7ecEp7fjPgnnDxdpBslKzkgi40j
 b80+t8HnNH3kYy0VSh4zrZHT0N7tjhtrYqP3+/FPraYeal4i/28tdzBmlzX13o+LIKuOyy6Hzmd
 swc83vDZR2tW1DeVxB5ICa/vFiXYjnncMTQe8kin5b0qP4VequIsFGox48qoGgrPrZUjXxYPRBl
 Sk6tfD5l1hCDqEPMIQP5eR0hNOT39hIs/2TxleZd842fs2mkV0CysmHlYb8mhXSWpH/uB6ZX/pW
 uGJ6/reMo0X0QMSKnX3V4LObdY80VXIVUA9Oz+W617HK1Xx/fam/42VPg3xsEd66cUlnAJcINGR
 unpOfhPwCUvZl8Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0ulH5r0dhHoykQPt5HxlOlIHcs3zP61b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX9mXkd+uWL2Zd
 zG9L3/8WHtDzxitT+4GgBcHNbFjOJvNLUYOEfu/tMxQ7zAizGLVnFsiQRrh4BQ0hVh98bQyOCg+
 9v4G7MCpfZirmPcUjrzrd9p/ingG2zE=
X-Proofpoint-ORIG-GUID: 0ulH5r0dhHoykQPt5HxlOlIHcs3zP61b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfXyFlcWwPQvEPB
 YGOsLEU4c2hMSU5tA4TPMf9ZUS8IODyQaKggDA44pW8fkAjISbBGJkyfpBRF7RjLvdVbhqOUz8P
 IwWQiHkAgP88Ja/s+mrmLbG1aVU4ns6oPdC4TpH4/ul5tnA8fY6h1EKW20r3POoKoTiShH338LC
 US55m023zicrVH8pupWXIrV2VrlaAJP/2H5UPRYEEZ8HBp7nOL21sGH1JCq+FBAHHXvHjdde+iW
 3ZTqVYy9gU8QED6Ywme38dBBglb6+n0QfGeKQwg0Vv5Y2d/Zru4UTeFMgIdIUwsQ7VY1IMIuEn0
 0iS4tZI1e1gG6qeXc7XIrB6Teet6e1jXJmuKLJoB1EvOlk957MVHyPI6//vxmTQUuaRB94zvh/R
 j3a3fHUTmccCoMZG/SUl9Nb7WuVFqZ8SD9E6ZUW5OQ3fOfvGFzUN4wVNsI2vQQ7XxeVDMvo/dGw
 k3kZZpGiUvZyEEMGSgw==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af3205f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H6RLajfuJ0QrpAsTGAkA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100054

Use the atomic set_bit() instead of __set_bit() on desc->flags so that
every modification of the field uses atomic bitops. No functional change
as these run before any line of the chip can be requested.

Cc: stable@vger.kernel.org
Fixes: eb374f764a70 ("gpio: provide gpiod_is_shared()")
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..7faa5109617018af84896163f3602ff7dc2ab62f 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -532,8 +532,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
 				 */
-				__set_bit(GPIOD_FLAG_SHARED_PROXY,
-					  &gdev->descs[0].flags);
+				set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);
 				return 0;
 			}
 		}
@@ -573,7 +572,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 			desc = &gdev->descs[entry->offset];
 
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+			set_bit(GPIOD_FLAG_SHARED, &desc->flags);
 			/*
 			 * Shared GPIOs are not requested via the normal path. Make
 			 * them inaccessible to anyone even before we register the

-- 
2.47.3

