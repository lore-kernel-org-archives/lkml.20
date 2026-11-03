Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708489;
	b=n1pHJNq/XnZLyVURZnaXNT5Fg/qNG1w87rZLSOHGqFnbxh5+19G+htjJrgYX7nCRhszT
	 dSp/nuzx5EAcdfngNI6epUTVxNOuH7/speSDqGeHHjuxzLPBJ1iinrovyT4NYQkQv+Vrd
	 SahB/3t6eUYY4eisIEnm2DnB5jc3SRPMNLcPuxQ0SyH386eMPbz88Tr2bSf1M15IEhFeQ
	 e66PtP43AmuprFJYtLUf/nDuyIlD/JjbWzQqkjT49w0AJZVBvuzGrI7zDbSwn8DvfMrz0
	 ChQ8GNpxPqPoA5Nnqw1Q5bj6d6aLtGgblgoLbtjzRYPd66fpCV+m04CTHOLHTROD2nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
	b=B02uM1bFyoUd3llRKcecZDsnO0XdpxmsZ00S8K1JIQV8MRKUWW3QVvlyd4iuqTnyafAM
	 B3ttCBbcrFS+ho1UUDnojex+of3y3mEG2pLOmT1KA1qnnD3/+Vt61Wwilm02hYK0WbmuD
	 vnGSx0G23uS7T+VhjBGpxH1r2/gPd21cFELGWt+qBsi+Lxy7D//gb3EOrbdF6xAnt/nB1
	 om0WU5M2iTumazGtVbSq66D80RUhyQzBfq/AI4r+GDtjbaqYJ0q9nJsp/t83v5OBs1Ggf
	 trArsLtO0AqTLeZ3ayDiXU1Ejh+umZp4ejaPKX9ZycndgAWqAo11WI5KGxzsYY/McqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="L/zkIaJR";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Svyic/OZ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A593B606D823
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A593B606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L/zkIaJR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Svyic/OZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AApM9928238
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=; b=L/zkIaJRxxUeF6aZ
	Iduk03fXN4VfiteUeYQEDWGAryxfn0/y2C2bHxWx5FavCSHi9wyzbfqf7yXv8Tyh
	+BsR1xTG5cbwu6ypi9ZvbQMziCVPCr6F0aX5wfHfwusB5Z7UDmGl58MyPRElhd7z
	w6DiP7UH8X2mCwXZZD/E+N/t5qB4srEG6Pk+1l9eXWsrOTi+zk6p8KS24sic0oNn
	yepZ7jNSZhU6uIRAmG8gx3JcyTkevao5SXICkcT3SurNm41NEVhC5nrs0bXoDf9B
	vB+WEwpqlMIZkN+cspWd6hpqNn5NW/L7lnaMm3BCDzUWbb2nScSjc+Mmd8fgG+ME
	ba95RA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ekp6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:21:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso579772241.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708486; x=1794313286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=Svyic/OZdIPXsiwJQ/KrProtdmKgNztHRuy6V+D6YcEU0Jt4geh7SOJNzrJFe4MjoV
         mapmBLPDqd5BZRZ05PIO9XbaKGXZy/OZcvpYBroFsnypnlyW5jTbG9wlca6kI7BRu8s/
         qDxQWVVx8HV4piGDRD8YBcF7s3xl4QOZ28m0phVap2b7jhI8S2ZQRHg0rPq3CN6gc+CT
         tsb84mrix4dL+bdP+Svn1ejhFGS+yXJY83B3iylCY82wJM9RhQebnT2LLYbQDsEjj/Hs
         I0fZkDUKle7+JijX91jFbYJH4KI1vcYqYnF+pZ9Dx7epBwPaEXo7tO7ZJTFK+Aq2QoWV
         FkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708486; x=1794313286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=g8IdDXqecV9CqVHzay6xNyEDOrTcFfQGqAaxQv+eRNEY7jSkVIh0lR/fvbHR67b1RO
         PULHYoTIyT88yEDIX8/eZeL8Kq/KuOtS1uUl+ugi0JXR8fZoUnDTlx4N/DWSuNW9zPmB
         cowBYckY+DsvxF6XcBJPVcCdvfBoXRmFNl/Ckex2S67N8QaNvLRA9dOQAE46XkKbrtsq
         je0q9Q3Zh2VyOrGDhaizuj3N9w1syxoUhQr7ia8C70syKbB0q4+iAu43TW5Up+Mmsp+I
         G6Rk5HduS3ZwedWEgSxn1hYorR1FzUz4lSAW4aTZLXuuuU+XIEfiX+xlORy1qS8SPL4m
         IWiA==
X-Forwarded-Encrypted: i=1; AKwUvBxLPJpCEyJH1HE0jMBJhaSvRJrxOU15YZvePC5f5+5POWCd2IKlR7PmmX1Ra7dg1OW5w/PDvX423WQbHDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C42GSIarYtKUfgDGvYoiU01ERxXQMzbaf6J6CTWNMMFWXL/nM
	pr+n8JGarvVDMlfNA4SZD3djxUhyARf8WL0dMsNy8iRD9wQOP0+/Su9y5K9L2uQzzl19j5ZtLTW
	vzbzwKGMtEdbbWtxHIMq/8JBQt1MbocqcMPhB3Qb0CO/WDxBbhxY51p3CT/pXzMfjN2U=
X-Gm-Gg: AYBFou3Ul5ZUrh9heFkMntAg52/MgB/yC+S9mmQEndQwo0Lzsm41zjl/osIxE9iI8Qx
	xNA9zHp0uh/zugxOxz4ypDVTXiJVCQBf8v5MvOghEaSqVyTAadEaGfZVJWlX56gQAHaoJdiBFGU
	1Xh1Re7gesqlTqwM+8rwdmRd8ZkCdnH5CUAc/XM9pUSaqnK9ldDMaFqkGnXe+puyhrbkckwAd+i
	Mf4hjCnI2/So1F1cgRDcS1lUnhkk1Be/i8YCafaIVu8TMK2Hwh/j5Jwv2IXPc7B8mBEG1Jak2pE
	eFvO5B5EaVhZcOqyr3nOayiWgaL1TWqhlx8ilK2Ncy/oKf9I/nbMiQ7v+zMerwn/oVG/CNmSwtT
	PpUyP7b29PtHe3kNSL0F0XZDU2VHGkzejdTH8zzf/onevfvcTP2j9PVrUpHA7/q4kCl4r+FceY6
	Bz9Q==
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr4084411137.12.1793708486482;
        Tue, 03 Nov 2026 04:21:26 -0800 (PST)
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr4084404137.12.1793708485974;
        Tue, 03 Nov 2026 04:21:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 13:21:16 +0100
Subject: [PATCH v10 3/5] gpio: shared: unwind partial failures in
 gpiochip_setup_shared()
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
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-3-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QekYjtrADoWd66GPIisjizU3FTTnaBTEJebZvmRuj4A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+/cg6goh5Nqda0LhUqPC1f+YZp+Qr4mN6y
 v18/ZW14TGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w3kQD/9gf30U+O/gYGWmckn3O27+6KmRXS42MTsduBSRTKcL2dSvTIyfq6AXHmKOIYufmQWthVt
 QLZ19+0X9XVpgpdFdOUNgCUDMw7SMgqsD8UjxqX3npnjmYu8sg3ZcgFduYlITWwgCi8qWE57RFo
 VzPTWA8cV4hqYHxfHBXI+Gh0TN+jpvczcTLAmixJWOGPde55oeiIgeBhY+HRgUtMImqsuYl0FA9
 tCpItlT0iFjSGXd1QxXfJ1/EjNIwbXKx1G9I1PabzYwuiBxub7JTdcxp/AOgrN2K+wthd7v6e/y
 v7mDQkYdoofPZlvT40lSmjz963QwkpRgEzcPvT5jmYU5MXMcoY2qOn4wtbfypjm6UiuVzTqlC9I
 N5OiYzk9eB4h6+O/mU7TcVloAct+kfEB3INyroFHNf9bGWjpW8GjUYHOg/K8Gx/7dOU3y7UDvbj
 L73ZXYXCYmcQwyUTPSLQ4fEh7i1yuEciW2Xze/KY/sB/Tko7SA1VJqDGaOrGP+2QHKSR9L8M5KU
 Ql617TUGDeCX/eFCHa0XQrWtZuAPtUnTNc0z+KTvQiSA2vx0smH2a5UObgxz86g9O7fOeRHWkUn
 eBAR9/Ijw9ur//GKCtwFMG2mtgPNyzG4MxIQ5GE6o+aaXFhq3Tgtns5plEDuzGoxzNP0alu/q49
 MlmZBA1gMvVFGUA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX9KlJLMl4BE+v
 n+6RdbOI6Q40hMCC7l9cP5T3J0ut3WEyowJZUgcV2u8hkRJEuYKwZi9VoA+WEKTRQRgL7kA6r7z
 8209EwQ+zyCoKKaCZ5m6XYOQsEcVEUNa+CGN5q6zKdnADRGlmtDceuK+3676ucjcE+lyWd/zF7o
 CfrZshrPyH78Cu9pEmYApXma7aC0DQ+WKq3ZzxM5+IJAHCyLmm8dV7CSYcnISnxkh9t8+4SIMI8
 g2Af3c779SypGTI1T4vVe636fVt/ILz/j71IAMDP8TaDW+LsDnlcWZTwVNJuHHAZ/lUVUTfoT7v
 Uor5WI0G2iTIEJ9dK+rpvPj2Jw296lGByAQb9wQt0746fdt8nQp5jAjDjrU84fTe9WEuTK9GKsN
 sDwMGuA/FyMg3lr1QahrKWyUlAOJh1XwJWONsmhgFUyLc9JGehMTp1YQG0krAj9bWtDsqfeS4sn
 /4tLWSx6fj7uShghEaQ==
X-Proofpoint-ORIG-GUID: FxUdKDXM2zF_-SmN7lUZlB_rS0HNbq-k
X-Proofpoint-GUID: FxUdKDXM2zF_-SmN7lUZlB_rS0HNbq-k
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9d1c7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX4AC/GyNGaK0K
 nBGqirWGxUKpVZ8cni0wryaPuIckRRTeZ9urYFS8ozWx4AtZKbRTB5Oq1nH7BxMHOL4wdN4b6JN
 H8lAYgy6q2bkqDyggAze8knMI9rFFfU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

If gpio_shared_make_adev() fails for one of the references of a shared
GPIO entry, the auxiliary devices already registered for the preceding
references are never removed. Similarly, when setting up an entry fails,
the entries that were successfully set up before it keep their requested
descriptors and proxy devices, as the caller does not call
gpio_device_teardown_shared() when gpiochip_setup_shared() fails.

Make gpiochip_setup_shared() all-or-nothing. Have
gpio_shared_setup_entry() undo its own partial work: free the descriptor
and remove only the auxiliary devices of the references that precede the
failed one, so that no device is removed that was never registered. On
failure of an entry, tear down the previously completed entries in
reverse order using the same helper as the regular removal path.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c9500c2b904ca53dd1e3cfe1bdb921d767d18b3d..6b183864933870e54780715c4dd9179faf800d09 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -591,6 +591,9 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 		ret = gpio_shared_make_adev(gdev, entry, ref);
 		if (ret) {
 			gpiod_free_commit(desc);
+			list_for_each_entry_continue_reverse(ref, &entry->refs, list)
+				gpio_shared_remove_adev(&ref->adev);
+
 			return ret;
 		}
 	}
@@ -598,6 +601,13 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 	return 0;
 }
 
+static bool gpio_shared_entry_needs_setup(struct gpio_device *gdev,
+					  struct gpio_shared_entry *entry)
+{
+	return device_match_fwnode(&gdev->dev, entry->fwnode) &&
+	       list_count_nodes(&entry->refs) > 1;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -624,15 +634,18 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
-			continue;
-
-		if (list_count_nodes(&entry->refs) <= 1)
+		if (!gpio_shared_entry_needs_setup(gdev, entry))
 			continue;
 
 		ret = gpio_shared_setup_entry(gc, entry);
-		if (ret)
+		if (ret) {
+			list_for_each_entry_continue_reverse(entry, &gpio_shared_list, list) {
+				if (gpio_shared_entry_needs_setup(gdev, entry))
+					gpio_shared_teardown_entry(gdev, entry);
+			}
+
 			return ret;
+		}
 	}
 
 	return 0;

-- 
2.47.3

