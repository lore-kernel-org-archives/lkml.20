Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788696;
	b=NGxbUkAOfH5glwC6jz5Pemvv375cvf1qqboTWKQposohG5XKVIeNtQJiPQVWNWOBWlvk
	 w/VZb5tJdxHx7X0H7O4QqRQk8EPd3kMbT/uavnBSfxTnVlHDlsW/weeQ7Q3B6n0lIYa6+
	 Azc48hNubxxUA/UwF7df1Jc66z+E13WsTbp0hSh6EJQfGaYcYVydy6rjBReaGmz0qI3Kg
	 mhqF06ZEUHxxFK08YUhZczY3vENUXok75PXtmfKLmhdI45Du3evALFZVlYzbeNbqUbGuQ
	 dMvftcHhWH5zZvHVDAUqd5ZolMVPk5C84FLxh/rikIrvoQKUXcEG/hf1sPHIvZLWFkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=XGcTziq8UM9+XOVlvmHFEU6dDrPtO9/IDL0QzoN/P7ZHrSv2HckDlcjMfWP3OvRYpaF1
	 Y4rJsKHhInFk5lD1JJYcgjlPZQvAm5u5KVXRwcb2vtwpJEOjFvXBDnaCB+K4YE0NrIGux
	 KxWDudPMCV8RCkrNyuWpa57/YCK/BrkESd4ZPGXxPTNQUmaPPlBKoLd67cyPT2lJ+jxEA
	 O+dBDh9ocQpKn57212RK25sq2cYHwsRqVzqAzTPi0B9g7g0im4xbW5WVFZ6gL1V+jxCOx
	 UI0ijIvuTEGXl90nYCktVxBwL/4Va2/bFIGynyvydJp8jRrsMxLqyTlpIarkO8cM5uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIAKT3p0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXGfBuQj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BCC606D80C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BCC606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIAKT3p0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXGfBuQj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KNHm2290386
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 10:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=KIAKT3p0JgbizLPl
	KeNnVMorCDKUb27upVBlhan5k+GCzI7KK9OJDpOx79wqWbu3SNAfq4/lKJGqXBn2
	oPYqnPgbD0Ody4D/V3Arytd0ho6+3hX9tC0DMad0d+YL7poek3GwE74+7aZFklYg
	gFqsxBmh0OzV7Ow4zaO5mrrdB88jhjNpyc03BhSkNiqvM2wCPN6+z5GisjZ0ahEN
	jszIcpaorErxrx4dQ03moZBjcEMyaDMHoay56T4ELr6Qtlfc2Qw24dnIbIWkGKN2
	wXZbo96G7hOV6LcBKkm00+MZrqzFKrSZWLC0GOIRT/4Gi2pDnOKg8TQjP5orjhP+
	w0l/xQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvaxh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:38:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9984a7eb3ddso501614241.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788694; x=1794393494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=gXGfBuQjXWCFAzlQNRV4LdZkobR/rOGIfCvtrfAgwRGax17eHbQkSH2ql9InsXHleP
         p06KKLD3K/qHOFhCYe/j5lb/UeK+4ssLUNDk+3EHhZya8VUumEFoQb8Xl6SwCU0HX6R/
         cwTO/lfM9L84IPFOXP6FuK3j7m92DK7cWhPzzmuKFVyIVa65vUySGxleFXX/9/CnON+V
         O3v2szdOHgNOU6STBCU9ZD0kGzukIxLuRbWnhheKWujnbYb1JfCaFLbKm5bRmijomamH
         R9N8h1OoaCNjXiY2U6MHQ3o2Xz2RtKbJMkvcN4wYC8+MMeuhmgfjqsMQqk2IGiQU3MSj
         VVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788694; x=1794393494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=SMiDfHwaIQ1e3BDwVbhCk5DTelXjzla5ej0U63gBGITJgI/mlG18sHUHKTqJDLG9+h
         KdshZASHz+6V2l1jKHyiTBLP1E3vb39FtBqK/O1mE/PZhiajWbcFxvOoIQt84T3lDcn9
         P8EixtnpZVjOKjr6Zp1CwF1vfOcZSdV3pP9CUHn6fFDgUWE0WqI0m3bZRddsC4wsPYV8
         lRiX2ijyrUFKFYkzVSENhrCJu5LoZavof7F+UFkBqA1F5m11TMhlZB9eoQVWFLNqDfhD
         RPfYIRCzG7/o5XVUB2v9NDs5by6tL5AxMJrJTL2rtrY6uq2Qg1yDdMARk70ZtIO8Lsk+
         mkDA==
X-Forwarded-Encrypted: i=1; AKwUvByGX5q9uXRnFXp3FBVRDk0q89GWnidyPDLoV9gAbXnszKOBeQ+XbASaiKSIXmtwSwVU3IUU7AMtK1fNU28=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oYxhc3I/z/jx3XsqoWjlNARQihVc5nVmnugRnXRHn1Lhabnkj
	O4V/RiwDSU2DTqOOvbmg3hd2pXVawMOpAmfo7uX8a0rOaPHkff1jI4HgXois0mZJo5/zBQ62RD4
	engFnN6DE9j6FQ5lrVG9ty0UA+vyhQV7hf0I9/1jTc8h5Iaj7sJSyeiojfzjDltDx3RgZ9TIEkU
	I=
X-Gm-Gg: AYBFou2G3Qiigwee0YWvONdsTdUgcsWFt2YA586p07vaoprilqpX7KRZnYGGeFqb2gj
	b171hbSQRqffJqxkCFVk5M8ENvjfRYbDvHTWykV61ODYk4zniz84g/1k8WD+RI/Ur3eJZdeEBZB
	lZc8p+2R/IeScvAxzHVy9ZLvZ3bLui1PBR33mLXdmL2Ecd5UxUm4owkFUO19RiT7prAtcNyUFap
	qSb2NmHh5jBSjOIivo5w6TyfJHj5Rne9jyk4KiRvXuN1NJ/iKuXUsZaAkPQBSacOkilM5PGslOw
	2RQBj8bjnyGV1c/Zt+5FDq2tB/wNC83mCtc3HCb5VMEIurYg4nl/0pbN4Opl750xOc5CACPXbtl
	DwvixOhSXIMvErJzrMNgpjWB/AWBinPswrDumrQA/jsRyGeHJbQGZHMtQmGu32VY0wrRywBiUTN
	zrnA==
X-Received: by 2002:a05:6102:c01:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d072c596c4mr6323440137.20.1793788694564;
        Wed, 04 Nov 2026 02:38:14 -0800 (PST)
X-Received: by 2002:a05:6102:c01:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d072c596c4mr6323434137.20.1793788694170;
        Wed, 04 Nov 2026 02:38:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:08 +0100
Subject: [PATCH v11 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-1-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsSdij8MwidL5YjreXSe2x/t7F1YjSi2702i
 2Ue5AlVbBuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 w6iLD/0Qnc30/hEW+C4AMO6KkDdtwTYy0Mnu84FJRZ8lkcG9jxso1Yb6sNokAKXPdivTOY1b5qA
 SzZx3ok6/Tv8EAxffEZd6Ot0Th+AeCje75lIwa5Qg6StH4uDRgbFC8B/S8XBQ/xq2vpQYELyj7x
 n3TnzU/WpveS3QZH37BMrqrFNuavU5j34sET+Zv+05wASgblseGSRIi7rfMZ/I8ItOa011S5AnE
 531NHfZSOL3oGllUyZI6tTXx6qjs4roprq9ckruGj+Xi35svZrlAAjE42Q6phXZULr+GdOSfnvF
 05h84/npTVb+c/4G98oXBea4ZjCguQMW7I2aTXYya8VH+Mww4YSpYxui1KV+u3q6zKO0wF5CG+2
 xSfEWyNsz8voTm3bufSa9n8zhCP0579p1NYs3lTXob48esDH1Zf6gL0HsbM6/7KJ3g1w6CYu/jM
 kB4djqL26gTe8UHZuNR39P1LWc1waenLDd96wnRSks10RM2FrVOkahCi2qEHCrHHdH4hkSy+RSN
 iNkOLElB+ZhZtSJDDuo6+kAKkrSvQcZJXl525wWnqUFE8uqxwzDI6+dR0gyuaOKiC9EhrLjZ52l
 egrBu54qeXkd/buod/hGnmpPGk52Vmze+0sNiCRs3WI+aVVhQj4Favtuz77QzpD6T4Gl2d9Gj3v
 WvB6/EVGL0kppzA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb0b17 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: ZA8E7KMXgtqvSRKe1AQR5zuAna7fhqHC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX8l6BvftS8xJK
 08+yqWqopXWpt+MYJt9pfkq8OPCA43mrQKs0gCPtGpWYVZed6XTMuCc9m7VU8EBVrIprBAMRUN8
 0DYiiykZ8ENiWB1Yet8of8Y0XTSNSr8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfXz7AVYrZUNU9g
 oMzdG4QYgpiDIvyrN4FyMVGZ7iekTm+6Ux2OwGzC3hBEy2MEMogkY6Ucxs/DZoe/DyKNBkv0rSt
 xsDp0Jy5sBFPS4ZqJXSA+oAZkW80iymAwx4dgqtPQwmTlHdaX1qT9JR8ttyPwvh1uRSIqFPlvrQ
 im/dDzNZG0euoeGabgKrida3WP3lW9r9w27hY+54JCRoZZr2x7daHsQDGuLzLRduQ4bo6O404cM
 yrdfFNMt6wN8KtPZ4iYxU2XWH9ZTJKr+5HBDC5xHeKLw9JbCm0x5VeXm8jPSY4mrMw8TmRXdXYS
 llKz2GGNb9kk/ZDOft3bUit2yUP5z1934Mn9rQC1bbwA/W6UZiTy/7rI4DDF60vcOLaqi0Wc5bc
 8Yvy9TnM+IddKpzkQQ73NMXTfjgx5bbuDq51Af8nFVbHtrNpc7+hDtsjqs8m6shqHU3fiCi9pnf
 xppObDhWcbK09NDTYTg==
X-Proofpoint-GUID: ZA8E7KMXgtqvSRKe1AQR5zuAna7fhqHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040042

Move the body of the loop in gpio_device_teardown_shared() into
gpio_shared_teardown_entry(). This is a preparation for unwinding a
partially completed gpiochip_setup_shared(), which will need to tear
down individual entries. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..64bb450f0a8461d214a45aa97e2474ff0d1857ce 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -517,6 +517,27 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 	auxiliary_device_uninit(adev);
 }
 
+static void gpio_shared_teardown_entry(struct gpio_device *gdev,
+				       struct gpio_shared_entry *entry)
+{
+	struct gpio_shared_ref *ref;
+
+	scoped_guard(mutex, &entry->lock)
+		gpiod_free_commit(&gdev->descs[entry->offset]);
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		if (ref->lookup) {
+			gpiod_remove_lookup_table(ref->lookup);
+			kfree(ref->lookup->table[0].key);
+			kfree(ref->lookup->dev_id);
+			kfree(ref->lookup);
+			ref->lookup = NULL;
+		}
+
+		gpio_shared_remove_adev(&ref->adev);
+	}
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -606,26 +627,12 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 void gpio_device_teardown_shared(struct gpio_device *gdev)
 {
 	struct gpio_shared_entry *entry;
-	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
-		scoped_guard(mutex, &entry->lock)
-			gpiod_free_commit(&gdev->descs[entry->offset]);
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			if (ref->lookup) {
-				gpiod_remove_lookup_table(ref->lookup);
-				kfree(ref->lookup->table[0].key);
-				kfree(ref->lookup->dev_id);
-				kfree(ref->lookup);
-				ref->lookup = NULL;
-			}
-
-			gpio_shared_remove_adev(&ref->adev);
-		}
+		gpio_shared_teardown_entry(gdev, entry);
 	}
 }
 

-- 
2.47.3

