Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885032;
	b=Qwio0e5RDtNKJiRYlq5KM/nivzIuyMTzNX9t5BzfCLB5ylWKMUO8F0OLmVYvoWYgZbQL
	 G+5ijxldd6d/SNtR2ZRSUtjgirDGL+pnhEnRW48vIaOo4gBUCpTawCmfA/Bppmmj0+Ktp
	 WZGh4+Hs4vzL0BWuFeIoeTpFg+DpBr6VA04oi+n72ejEceYw+q7vbb6jbWXqWA5ni9HZu
	 basg5coW7Ozz4mvjP8lEQqO7XYqtlEm0chiaBocEmwqGL2Nke2IAG7WwG1fwQ4vPKgJet
	 agmpbByRwEtB3YceXIQIWu1DLZDnA9IxQ+jDACcYK03G8rpjWDec5mPvjUqSCLgbWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TRdxMZNVjHvNy5Du8W+cgRIYuVrbLC7KA1TotGIZa8I=;
	b=0LFAulTBt7RbG5ArA4iJJ1Up9u/bAoq5zi+2d1QToORt+jGcp377cCM4CSdMr+rt8PPG
	 he2YpjngM7O51Cts1gnqZNMo0La4V0m9SOiNftO6JJkaQcHBMhg4LLlmKzmh15ge5peII
	 o7DXotPybEROmp8zsjnDnQ3bW5kCvhNQUJslm4UWNWbYHqYahFvkZN/542J6PHxmqqhd0
	 Z8BSNbqvk2NRoi/MuI5ZoGZaVaAN1pZEJj1MTwN0Y0654a/u8NUwaui66+B6rslP/LpBL
	 Gm2qlmNL7WQZuA1bQSNYqDuevzED0k9D+hV2KM5dJte1TAaEMZPEcwfwsFm38YSYefw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFgFUCiQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYXYWVLr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A546606D83E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A546606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFgFUCiQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FYXYWVLr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tDf1444466
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TRdxMZNVjHvNy5Du8W+cgR
	IYuVrbLC7KA1TotGIZa8I=; b=VFgFUCiQj1DACVLVZoF5SJI2CqdXt6wFCTtkmX
	A+td797+6XNXi9fmnsEOE0sm3n4K+Cz5A4nKtgK2/VTCTpqsIvZA0upmCpO/dcj/
	AMaKHE7mxFk8nbDHIYIqtY90vji7q9jtroiJtwtf4TjybHLCEfSryKre0O0Vgyco
	1tosd/c8VCHrZadjEuH277v/Uc6liwTLTM4uc1qCToM+SuMvdWSXkY57FRXqKRC2
	v9P89rG1dXliOSc6NFezCR3pAEzVfeeijTnZsssumB0e+A1RmXhSiUPSMCchtrM9
	yj3N1NJQD7UKLkXbNfB9+OsmvvrNuGBE5zDphSbNl3U8d+pQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaah6yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:23:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc0a64ad59so503309137.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885030; x=1794489830; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRdxMZNVjHvNy5Du8W+cgRIYuVrbLC7KA1TotGIZa8I=;
        b=FYXYWVLrCWH+QW/3bYsrKYe5Rs/CIO2vkbNwDamT7243Ypkbq0vdrhu5r425nzcaNq
         Xgrnc8AeBpAtF5wI75iyERjaADdbrNouTyWJSo25Ob4uwbkeyxnIR28CXwoC6+zfv6iJ
         6p7FcqJ6ckPSZOy89U+P1z93l3Xzwoy4TA+aQ1aNil5srJZjNBA60boTSqmLjM4rBt31
         X9A3S1wyvgBXVbfbnCEA3gZzvRBQaobjzyYWaWPMjLhVbV9b4QP8LXnaWGGH2OS2v5Td
         nsam7ynCpZI6z6rv67AkGDyy+m0LDwkIgXvSkkbQWWQG5j4N7OL2fj4GKF9hyx7LyGy+
         BNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885030; x=1794489830;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TRdxMZNVjHvNy5Du8W+cgRIYuVrbLC7KA1TotGIZa8I=;
        b=hkJ7v62hLoG7KxbvLNlhhe3OAwlg13UZDM1rTi+nQ76O86kX5OulJNuMpouiNCvItv
         +NMyQndW/lv6KQ8Ydau5qP4Exjhd1QXXcn4ka7gKRG9zH4UhXNqlVhjwHyaqFmrf7PD9
         u1Sjnjs70KkewXsb+XDihbwYBVOb6ME6wDPj3EUhuxXYlRy8dLrTcUE+Y7aXMBmVLwbj
         8+M5QdalvKtL7qeDXdXR38hJ9rOi6zpoX/H+5ZZNVO4e7TEUMaecfA0B3mXkEoLfh0jL
         Hq/ulF7CfhU1VMLEeEqxtsPoWokb+m3tomFmLfja1rQAdQtW1MsOO54Is9cZPWwyHVIK
         ZaZA==
X-Forwarded-Encrypted: i=1; AKwUvBwYspb/ZtsicuZfX9xizjKmi5C2pNHJFz2wRVLDM5QPAO5ncfU0mYTaWTTI7Q25CI8RmiSx0VJNxME57UM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LM7jjmI1Q15C2YBRWJnUL1nuwKV51VuawRmfPiua13C05tBqc
	4IkVmmjGmYsuw/NuzaQuFoANgttSez8HcMPRVDSJSKWh/Nx09NTlTtVpZ7JN/tXV7iuDQBnYUt6
	SIRsY7jx/Wn+xR2ipQcXWH35PweBu/hjuY93lCd+H++UWmmcj4NmhLE4l714pzP0gXcI=
X-Gm-Gg: AYBFou1ueNB0bkaonEDoKe6uTNECsAO+YiPCFZcELx4PEcLS6dmOBGdS4iHJjthFENY
	KQ85YeT95/C/mWU4Q0qTMFV5/xbDNuFg+jDjVeG4RzY4Tz9NbrSUKd4LcaERK5e/fHRnFoho0Ew
	fDNFtXW+Orj+UrvRkCzfSWF/QASVYmMvIagzjp/pKOqm7tQ4Q8tZalJKZXc1So2ywhBLBRgHzhb
	cadc/DHoGVt3fIg3xRXuOAcRT34t4Tob/s4/5RdXIXSmY4xrPzckEHCfuVyOHGyM1YGIQaVKBVE
	KIz9FMDtOza9D3zaTXHjOPzAV4qH21sJoqzb90Pe834aQ+nNR0tX7RRBO1Jb/PFQlfSJa0gPNfa
	yXqKpAvhbhG/XUsDQqb7Bsdsz1GQ2SBanm9I/jlLXh0aoMXouzYPkC3Mgr01Mj7fk/wvhHXQxjp
	M8Ag==
X-Received: by 2002:a05:6102:3910:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d0728e5ca0mr6759293137.37.1793885029830;
        Thu, 05 Nov 2026 05:23:49 -0800 (PST)
X-Received: by 2002:a05:6102:3910:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d0728e5ca0mr6759267137.37.1793885029286;
        Thu, 05 Nov 2026 05:23:49 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20521sm10347207f8f.53.2026.11.05.05.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:23:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 14:23:45 +0100
Subject: [PATCH] gpiolib: synchronize updates of descriptor labels
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
Message-Id: <20261105-gpiolib-set-desc-label-corruption-v1-1-fa84726ceac0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGCD7GoC/x2NywqDMBAAf0X23IUkxIL+Sukhj61dCCbsWhHEf
 zf0OIeZOUFJmBTm4QShnZXr2sE+BkjfsC6EnDuDM+5prRlxaVwLR1TaMJMmLCFSwVRFfm3rNmb
 jfMzWh8mP0DtN6MPH//F6X9cNDZyeQ3MAAAA=
X-Change-ID: 20261105-gpiolib-set-desc-label-corruption-d024bd14a945
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S9dGRxbbLvzUONk3VoDctp97Hfpf//G89PtLXYijNqM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7INj5nfHiFIa+0yq4PcA0EtllMol9ctLKBAt8
 guB6XpYl26JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyDYwAKCRAFnS7L/zaE
 wwMREACcQVzemlc3w+9MfHvBXrli9QMVPeW/sAJjjUMW/Ki0E7bc1BapWc45DRPZWMpYE1sYicC
 Ige4xacg3nhq5ckbbNkMu/7j9GXCX72fZ8T0/o4qN4GdbS2/wATcuj+SRKtRnJI13c7lglrAu05
 D5BKrhI/Ut6laKyKfmgKPoJnEijlyvE2SoaX2vQbx2TPiLXQkoshwtOMXEIBQVb7+lyTGfypTEs
 7gKk+SE8SShuw98O6vtZBsBVCdu7UIio4NrfeKqdE5BmpGFol9w6WWuffOssVnof1yevfYgytV8
 pZD4jqL/onveJJPzwr/mhPfkW/s4L+qb9pyL6HyVHqQKVvHxp1oquCtJxX+bQamjpOl7KdSJok8
 OiqQYInokNVdOxh0+3DkoFS6MAXMch7DdWTDcOHTlKmWyBjT1lVu/fzxxe+lUKEF8pQdq9Wpt8g
 BA93cplfCjCRtiqi9ezqlEPOSkn85c7XfNUhKk0EXpeFbWn1onV+hbouG8wjE/FuFrN5TQZptFm
 lqQKHF1rqF44OKgqEvljL49lS8/Z/4bMDtpQU2E/bHvpmDTjRFXJFAZxhg3Vd/LEKAIEbFbUFST
 3kNkJt0c9xeF7dqrqGCSajrRiinMdekmNTwBZcoTR19QLGkVDcH0oROUXzon9KXMs0sjlCTU5BA
 LFFZeip8Sy5pDiQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MyBTYWx0ZWRfX3vL/VwsPgIw5
 pTSHKmwp2wVpm7FoyFuY+UgJ7VaAz54N6eXOEJ0p1kaFA6kshfle00rt+bJg53qVr3ZuV4q2x76
 85I1swgbVEspzRJMEduz4608vS6gSPg08sy2MI96NDGugN+qNhV00BmfmJ4zogROtdmjWzfv4iK
 QqBDfRdKleV7ilEX3EWEXn+ptQNZPEVsKv/idiCzVD4ivzhv4JQYA2FVTvx4V0PvClqupySM1WO
 SwM4HmadlItU9tlTLGOLxXbgRl9QdpOiVkCcn9wHGmjgEvEAmwZl94yLbOMxXuEaUVZIfBKVZm8
 fu2Nb98LNrC6Cgk4gToXdWOaZlG9esgSEtZByC57CAaqT9Zjcvj2V+Paw46lhHcriACRLh7JzIC
 SqC0E6R87L2qfc6WL1JaWtyyNQSOV91ZexQm4XVZ1DozUM6os/3l9c3sYxETBGTj+QrS3OKzfde
 MEO6O1AgpdECMqdaz0Q==
X-Proofpoint-GUID: 7XbFxTIzYqZu-eiz2Vtb9mYGHZNGlUjn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MyBTYWx0ZWRfX5prqG4CgMaet
 vJxzyeAH9UVuPMKHGBau0uORpnCYR2ZjAhtfTekrLChmAoAXLMRm2x8hiin0Hn1GyhpXH84jP5Q
 fzoQHPc3TZRsCqTxkiAWQGokVx3aOFY=
X-Proofpoint-ORIG-GUID: 7XbFxTIzYqZu-eiz2Vtb9mYGHZNGlUjn
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aec8366 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JaOSqjnWr-vPQE8BqLIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050053

desc_set_label() swaps desc->label with rcu_replace_pointer() but
without any synchronization of concurrent updates. The swap is a plain
read + write: two threads can observe the same old label and then call
call_scru() on the same SRCU head corrupting the state of the chain.

Add a spinlock to struct gpio_device - we're using a single spinlock for
all descriptors as using a per-descriptor lock would unnecessarily bloat
the size of the desc array with very little chance and no consequences of
contention - and use it to serialize the pointer update.

Cc: stable@vger.kernel.org
Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
Closes: https://sashiko.dev/#/bug/linux-2f7ac8b6-5034-4ff1-9afa-5700ff44e3e9
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 11 ++++++++---
 drivers/gpio/gpiolib.h |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..574f1b161d22c41e5f9248fe59efe25d7fcf5032 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -154,9 +154,12 @@ static int desc_set_label(struct gpio_desc *desc, const char *label)
 		memcpy(new->str, label, len);
 	}
 
-	old = rcu_replace_pointer(desc->label, new, 1);
-	if (old)
-		call_srcu(&desc->gdev->desc_srcu, &old->rh, desc_free_label);
+	scoped_guard(spinlock, &desc->gdev->desc_lock) {
+		old = rcu_replace_pointer(desc->label, new,
+					  lockdep_is_held(&desc->gdev->desc_lock));
+		if (old)
+			call_srcu(&desc->gdev->desc_srcu, &old->rh, desc_free_label);
+	}
 
 	return 0;
 }
@@ -1201,6 +1204,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_free_ida;
 	rcu_assign_pointer(gdev->chip, gc);
 
+	spin_lock_init(&gdev->desc_lock);
+
 	ret = init_srcu_struct(&gdev->desc_srcu);
 	if (ret)
 		goto err_cleanup_gdev_srcu;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 650a702741dfb938fbdf11db65a46ac85b6af512..8dd8ea747f8a907664ca334b29b6602661c3767d 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -37,6 +37,7 @@ struct fwnode_handle;
  * @valid_mask: If not %NULL, holds bitmask of GPIOs which are valid to be
  * used from the chip.
  * @desc_srcu: ensures consistent state of GPIO descriptors exposed to users
+ * @desc_lock: synchronizes the updates to descriptor labels
  * @ngpio: the number of GPIO lines on this GPIO device, equal to the size
  * of the @descs array.
  * @can_sleep: indicate whether the GPIO chip driver's callbacks can sleep
@@ -71,6 +72,7 @@ struct gpio_device {
 	struct gpio_desc	*descs;
 	unsigned long		*valid_mask;
 	struct srcu_struct	desc_srcu;
+	spinlock_t		desc_lock;
 	unsigned int		base;
 	u16			ngpio;
 	bool			can_sleep;

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpiolib-set-desc-label-corruption-d024bd14a945

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

