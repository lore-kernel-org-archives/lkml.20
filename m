Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C659C98D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655963; cv=none; b=r6DBYXrGV7zGPHAKuaO8HWNfHxmmaZjKK0mbmRvT5Sl+T5wAyzofhKJdCx7XVoZ1x3J7Eehrm1bffW1s4STEdNr6IubRRydB6/KFxZLJ55LRcA3KYj9aDIuP49ahTUGv3qYbjFu4x3x+cK1+ZoK2SyA6xGr6NFKhXMCxrXMwwV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655963; c=relaxed/simple;
	bh=KJGDQz0jClEuVNq8PSHBBrMlIymEy6de5iMIMZaAPaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=twfvhw2O5TLmh69sypnx4RRSyR1xgDKYIhKdd6haBUsF9C2Ggn6DXW9RNu2zP2loIqBj5pcu7/D838o+ykWgng+0/RFYrJX3ueGqiKPVkvBD2IEHrv9uO/IcBCkfrBClM3HvLFKtIRFvFlsws8T08GY1BMVMzojyMvWnKKwrTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvSSbAw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvEbJcV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvSSbAw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvEbJcV0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj1rv2266096
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+J3SWA5v2W4etnoMRMEzJG
	kIa4Z0oDr+xyxUG6dh8NA=; b=KvSSbAw/0ykVoA9UBQYTdDSIFpYRQcLAQ9UrEM
	n3d6f3sUMlbgpMTRum+JT0fS342oIZGVA2hBu0jmqsuH3QxE8vHoa2p8395vV84Y
	ZZyzYdBa7pfeoBBheBwigDRdqFOdj08oqwtm1M6ojeg0z9d4CMEGGPHdIoYS3m7Y
	3fk/Wk5klIkLF7RmqFBia2kuYHakAYf5q2c5pei3pD/D76WoJTrdIjR7i/TfZEnG
	w9xpCX8F3j4Kxjr1v8bq0VVtwVVFuly1VikfL4sJ1HWu+QFGlMM5UGt9/RADpRbF
	2Kee+qhdK9hMlLsSOxTd0t7k/TLBtPkKPmZne6iWJ78ILA9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppgrrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:39:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a00c70d28so146888685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789655954; x=1790260754; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+J3SWA5v2W4etnoMRMEzJGkIa4Z0oDr+xyxUG6dh8NA=;
        b=VvEbJcV0tEyxF/Wh2rQR3cIOQIma8fEgAGSpEKb2GYLp0eEhWOfw+1IvpumtofkauR
         W6eDe1VOkcT/R1fkcmzcfh2iIx+Gl02ep4AMa6GObDYBnsjhcJLGPXEKFq40Bw8smfAN
         U6SCCgudaNsISh+nyMQamDdEwBDOBsInsF7VGa/9fuJiYMLbm6Dpqh+UAw1rnHOf6ZQ/
         bVN3FfaAOZ5tAL8X6Ep0V5XUx+zTH9ZgTNbe8zZXfcAHI8gFMAEqx3yOyHWuCKvZo7CL
         V3gCPlQPG0SneGw9ykYIMbYq9tk2t5dH9ffHafGMw6GxQjyGcfPB5/eJMutKnYwCI1BZ
         onqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655954; x=1790260754;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+J3SWA5v2W4etnoMRMEzJGkIa4Z0oDr+xyxUG6dh8NA=;
        b=HDd7g7QLfRw36Azq/VQgPNGospPu0V1dZCzVUFmRQ/p80vl8l1AnbKVhRVteG0zfFo
         2HsXRWriKOlLzl01/tX64w014WCkTkJYRb321kv3VwfbQSzmtczLDO8VFbTf2V93h8Cr
         l5PyxXiaLWc4fPnFntjwfFXhxJgcXg0S7lXh/+WLWmXqY3fQhfkNsLntTIfl9FeRSfU9
         N8gXLImruuVN5x1QxtMlZ7NXO1qQTUAffgsxyjo7NtdgKkNRSfH6+yXJwwiSqTtrp9l4
         HO45bqvPYsOMwfqjcXrxLpl0k++kKGWhUv6ilkaGf2cxHL1U4seuL44oe0uxW0c6espm
         PMaA==
X-Forwarded-Encrypted: i=1; AKwUvBx6vfgI+ZeezOv0iq10Tgks/mwzzNvbPxGW0ILSXM0pg7bC5YXgbz9VbSNhgTscgad3r7IYhNNsepCRgS4=@vger.kernel.org
X-Gm-Message-State: AFuF++l6kc6oplZzHfF4m5pyqETicTaZuEXzohjfhLzMBLgexU6VkH3u
	ZmDJ16bGC3Hn4A+Ltpa09sZ5h5/3UWwQeSmR7Bo8M8/3+36PB6fAjl1Rs2F+lA+osHO5KmP8kq7
	gxjLLVD7zFlLo5n3rhHX9asizQ+a/LCs0VINPVc8WS9CDSwXOqQS4zm1kDxgX6CaaFAs=
X-Gm-Gg: AYBFou2TWFokFY19RIGnR7hTYKWJn/CBuqzQ+xArX40fipM4mDRFkRMH1sOeAXR5x4v
	+WaOROb/Q8Q6GeUd2JtkBy8nL0aoxG0Yg8f8uLCgiHQGBX328b49E5nLWmVKfUkCz1qcs3LrSDO
	XXg/vgbq07u/p9i3gvoZN6q9TIp4i2C/NPba+6lavREJ5yRYK1dnJ9n7tvSZdUIDwl348Yv39UP
	RGlt4eWf52DiHVCRIGhvQ7ma4W3oeQoHtYI8twQrk5V6L0V06Eju7EtL4QyDE1S0fQ24xqKHf30
	XZviqMUCEC5X2rVlpEU5HEN/ISNdM422tIZ2dUqhGCAfFkLC5kHYWZrz74JT+K4ZepNovFlyHUX
	bp9JBGNHPXa4Wet2hr/k9hFdUzKg=
X-Received: by 2002:a05:620a:4611:b0:93b:d7a2:83cf with SMTP id af79cd13be357-93bd7a28b6cmr95862885a.62.1789655954567;
        Thu, 17 Sep 2026 07:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93b:d7a2:83cf with SMTP id af79cd13be357-93bd7a28b6cmr95857585a.62.1789655954108;
        Thu, 17 Sep 2026 07:39:14 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dafdcd26sm16584001fa.36.2026.09.17.07.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:39:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:39:05 +0200
Subject: [PATCH] gpio: cdev: fix kernel stack leak to user-space in error
 path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIj7q2oC/x2MwQqDMBAFf0X23IVExMb+ivSwJE+7WFSyIoL47
 waPwzBzkiErjD7VSRm7mi5zAf+qKP5kHsGaClPt6tZ1/s3jqgvHhJ1tkzjxHzLxoAeMQyMpdD5
 IC0dlsGY8ovT997puX3hY1WwAAAA=
X-Change-ID: 20260917-gpio-cdev-stack-leak-fixes-84ad8918a6e0
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KJGDQz0jClEuVNq8PSHBBrMlIymEy6de5iMIMZaAPaY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqq/uLAWr4ZOYTHnn3qvDYcPIpcOIPLN97i4ed+
 4qwQwvNjB2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqv7iwAKCRAFnS7L/zaE
 wzpAEACCSlb9HMiTLkOHsr6o0L83DPdQFlrW/F9IwZqRERPM76qoWjZtjJRQsZhX5tf0e8Nzp4T
 P5lDOUyaMBdmD3varnRKgJDEc+erO1KGywhADd3+Rr5AT4VCIzLZ1l/fZ755Mo6GyCT3ANR4BMV
 An+mT68/d1JaNTlcy7UwNM6EFl81xCJ7OyNqWqHaO8bWtr+3O5H1PfdyAubjHSdb9sv5etk3+B3
 5q/zFLrkjmkmSj5uYCxMfG1oaIG5p3yBaQKT+K5yE/vcWh6kRAOSInB2uMpVrsO7dStvey2fjUW
 cc3mVZiUhtExcI6eLVm4pUJh+CWRmljc80XGT5LUsTAXKv/8UoNmkNdJSSK/TOgaR9PRXs/LIED
 wLgffb4m5OI1SBURvWGHyDsoyDa7QkM9bhFlG6chOirDRR0YIetM/Jn9FQpdfg6W4TyS4qT/AoZ
 /XF1E51Hrl1cFpnCTbAWYCbqT87nGOKp8jE8tj6dv2cjyxz36Yym4/L9hNv9nbH3qhmqNwZ2nHY
 8Zq6EkZd1nBlZFebkjH5ls0Pilhk5+tSF7y6S+43xTntapEPU2ZtINOa37BWkk02fU4eBy4cVk9
 8g2JNESzVHt9Ycf2OT1BbedWd388xw0K89ySdDYnQ5e4dXe9hSuANfrcfGCvKpSJzkPvyG8IDib
 Zodh8Inp8Sh1I7Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ebbPglwHwal5qIOrQTnQ2G4Mvj7WGhwf
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabfb93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rv4DqzIR5Y_92oHlb8cA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: ebbPglwHwal5qIOrQTnQ2G4Mvj7WGhwf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIwNyBTYWx0ZWRfX8r3s5gVj/tER
 OPD5dlcEvMKTqTFnw3xQ6YP3TZu7IQw/3ldQx33jgf2e+1RUom79Wwl6FuBU/DZeAbmQ5Wdl7Zm
 gLcEDefVAMBgjAq7ny5Svq6lG5F3h6tY4UJmKsEIbIBpnsy5h38AyX3vR4m2jHCv80CLzoJ9f3a
 8rpb8/z8H0CswI6HKq6htpG2MUTHQXSLbvMCYSWVaUmyS3tFFiL/wrtfKVr4wG2Wr0/CG58ZIrS
 FEAnoFfZW02J2KI2vZuPBozbymq6oWpKSiq3WC/jBGGqchYbEhQX1O2vWvYpG0blgoy8QFbQwP2
 OeOy4o2uNPZSwrzDKF+2DI9epdIMA4lMJjQUWqa2LJSDsdiJ0H/k6vyOSRViuUtYzrDBeoJ1hTg
 iMCETY/spvbryy0jcnfbnCc13JUMRPAoL+N9XVdmKCOk0bDZx3lp5CGJJDTtwPgdm2RMzKxIEV3
 S4D9/EJjy9Tq2FTN+xQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIwNyBTYWx0ZWRfX0u1SZIG//Pb4
 E1MOCoBJyJHyABHKP0a+BvYA+j2TCIxM32YFy2nVFaE4Ev1Zo4tde8Tm3WrG+a/L5RNUjNZ3yiC
 v+DAfMxIa/9r4dBWitlTZzhWAuK4ALA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170207

If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
return immediately before zeroing the info struct we'll end up passing
to the user-space later in lineinfo_get_v1(). This may leak the kernel
stack contents. Move the memset() before trying to acquire the SRCU read
lock.

Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260912123529.7951-1-tzungbi%40kernel.org?part=3
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-cdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b5da6e8566dcd777ef4e7784989b722416c07fd3..ccdb3584c727613334875350cefc13a6877783f9 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2181,11 +2181,12 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	unsigned long dflags;
 	const char *label;
 
+	memset(info, 0, sizeof(*info));
+
 	CLASS(gpio_chip_guard, guard)(desc);
 	if (!guard.gc)
 		return;
 
-	memset(info, 0, sizeof(*info));
 	info->offset = gpiod_hwgpio(desc);
 
 	if (desc->name)

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-gpio-cdev-stack-leak-fixes-84ad8918a6e0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

