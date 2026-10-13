Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A24FC8FF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897122; cv=none; b=Kcz7DmVWtYcva/hK5EXfyHkI80qsrBkdGiB1gQyIl4vcCWrBxsU/7Z5Bg9FRbessiipjOrdYztvAMpJQa6XIspTuOJ7xrFrYWHn7L79LKa350pYx8so3i82ZFmgw64n/Dllphmgb8amlromp7Nxg2H9Ni8rW4Jsx3PCC01KYWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897122; c=relaxed/simple;
	bh=YWcagTm29p5qJnhkx2n+r5zM1nNxqP9qfROusu1U1MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JHqxCEXbE9NZPkcbg+pWaRepOvnBDHxjGLBmubQ/+dGn51NRKbgKj5hWBRIEANFP0NeCRUJRzsvD7BtntJJgsmSkuSuQSyVjZu8smn90T0xZIrhU2wiQPs23wOPz0gvzM/YbU1sQo6zcgnsKtq2TPZ4HCynNVjXwm32lXIwRE3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THY2xez0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzisTLi2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THY2xez0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzisTLi2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8RZFD3907366
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=; b=THY2xez0H8z50ENh
	xxhqmir2LpgqQjNVlX0Qgnz25JfX9MMrSUevhDBNhJEkPdI25aC3Ru8y+T6RfTgD
	qi7HyaI6Md4btNjm362nygmiaEUoIxUlXylYKEzO9wf4NfKk5zv6TrOCgM5EpQkF
	JPZwhe0O8jBQ/CiESROzcVhdZ00QjWkYqu1jjCz+4Mi7KxjPRz+hjZn3pJwIj/ff
	Y5sRqO0VK1fxqbtIhgSXkr7AFRy2ScpmzqCni5H+ak4yhM34BCdhXEAxtyCaSgPZ
	D6rQMc3gU9FgojBY6EJXWZsD+NbQY8aFOfnLYcuHcJH2L7uDFIV9f3v4PBYDvOK7
	uS0fWQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqup9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c15deb3794so191865137.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897120; x=1792501920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=QzisTLi2mq7swbhZjiBSFNJmt7lW6Y+c/ZFGIbxzgMmAvJVAnzzEizYgW9o/cmlIVJ
         OBob93SZU7T2uB1BrLi8CsQ7yu2zg/mX1FUqo1eB3wwSL9ScaboB8/VwOx3IImkmv6oX
         z20/1z0aFJh1PTos6aI9/6COq4VpR6jE+Wf7A8UVnIFX5KDsaxoShSrkZVjhuBTjBav/
         t8MTgzXTJyO8Pj/gHFrZenI9WO72u56vf9WaWEouZ2oTrEcZtEiQReNWIXgnYPt5ZIgV
         b/D5tHAPFi5QLBX46lrfGdK+cADj6jemtK8eo1m/4lVg0RKLUxOEw6Fs5aZcr3nnEpOa
         Us8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897120; x=1792501920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X65urE6pCi4HjhKWTTcbc8dQLF4W93p9tRsN8DTwgwI=;
        b=FAtF6645n3a5oVWjYqLmjeBzmYYLeGOlNhxVWygPT/aDdYv1CyfaXt2Z3oj7Fywx+M
         prjUXZolsR40S1T12Kia3UM+GpBK0FF0NXTRqf6IUm6Q1UUg9XYp1HKYeMjXWbd3C2o+
         uzMNmbh4qD4nmRE85ThLLVBNcmU3w+hXUsu+nIt8AsUdfEdHo96+th4lOUkPTAc41bSD
         8453GM1Aj9j49qPN97TarVaml9wWgHPnWbsDYe4AVJFUA+Ac1cMXXHz/7BlXE4ahIj1d
         IPNWRevuqlV3kqKmLCkU5y8pe4qmUYigdknlsDoTnd8+haQ0MfpfoO67bzeaniln65bW
         bvYw==
X-Forwarded-Encrypted: i=1; AKwUvBwvHoiMuWzb/upMAioigPKv6KfBmic8GopgPrOKas4j4+P7pdXH3SCaVaLc/OeOcOVobT07+DMQXn6WAPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc4k5Z1/5P5kNd3oknnZdUbc/kCJ+3rlHty4CTE0Zq2dV8U7e3
	5C8TDOvUa8xwkluzQn6mHVwNibUBk/1F4bhl3qt4z3lETrD2AtnF95M6JXDGC2mCEaRxh6tiOW7
	QlJXlSuvoF8pTSmrsOr0cfCzonviPgGShcZ2vxrglsMNfVxYNk+V5n03R/l5vaOjCt3U=
X-Gm-Gg: AYBFou05+RQlofe7qElqcLqNrEXXKBhvTeGIH+i+mvvjqRR3+vHme1rjU3eu6esy7w9
	YIY9AYwm1wWHF2vRiVXT8/yiiiyKxEEaNu9NaD3CAPzUDGSB4UeY30NR6pFgbNcSDhH9Q//A3u/
	pJEb7V3n/5q1Sq/cwZs4BLfh8QHKbQawvF5l5XNO/dBNcN9Hw+UeABsJr7L3pGq/Kzflepp0BAS
	UEI5NW0QRh9ExrAipEFK/WtNqiJekrv2DPGJObLcd46EhsO2ew4hi4gWb3nM+d9ljcEOb01U7jJ
	PyeUMCitT+vdW2wQGhTYrkx0tDGzfD/ovXoEZumL9lChcWCmPwV0TxezKF1PlzUsMl1f380Ocit
	UArnOObC9ZkX4WUIXquOHfYdC316F
X-Received: by 2002:a05:6102:a48:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7cb373fae29mr3132629137.32.1791897119969;
        Tue, 13 Oct 2026 06:11:59 -0700 (PDT)
X-Received: by 2002:a05:6102:a48:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7cb373fae29mr3132617137.32.1791897119501;
        Tue, 13 Oct 2026 06:11:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm371862945e9.15.2026.10.13.06.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:11:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:11:45 +0200
Subject: [PATCH v3 2/4] gpio: shared: gracefully handle no-device lookup of
 shared GPIOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-shared-fwnode-lookup-v3-2-4553c1a7d80f@oss.qualcomm.com>
References: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YWcagTm29p5qJnhkx2n+r5zM1nNxqP9qfROusu1U1MU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzi4TEUKbbuDgFXBUntbfXe6WAmC2bcsmgvEp0
 FPBffm/kOCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4uEwAKCRAFnS7L/zaE
 wyqaD/0WvJD5QVZ/b6AaO4FBlY9lKmz/XCzQGAg2hdZKyrISsfrHj5B5FWh8L0fINSuUWISwF5o
 b7mZ2ndNIVQonatCZr7z+uknukVzJmeIgbFwS1vNorye1K7f8I3N6Qyun1499Of/e9ewv3ImLJa
 zImRFmqG1FSv599ziv+YDKS/z58R+e9AZVdmI4WBJKCiZ8G4Jnpme6gQ0eJcIjM+asmAbfukKaa
 LPXuCzvNvK6juM3l3yG7EZ4GkmaUSx0lGEV0DzYZTZEfvRPWHEXYGZTlwUXnSwgz4WG2VmxyuPG
 mAvSzdknxSvZv2ufQaYUJD3ppNCLWJQriEmRVkD67FvZz1/IcQUV9uVr1M+ZdmCUYh3aHDVPyy9
 WVML9mqZ1pmkX0uQgcMGQi/ZThwbzLqMk7I9vz2RTCG/G2plm1LQrQsaeFLcleiWdeJBS/7fcn4
 35/j8UCzo254G4p6ueD5zT0T066TJP7miHB+wEZJG2aKwjY9GrtlZndpUesR5ZzM6cj+1PLVFjX
 VAZZD9QxNovl9h7LSFTSJLjzgMo7wpKkaSj/jyfs1XdOsCbwVnE98DvfaWC+B+oJPNLrlyG2RBq
 pXZRlA+JluOpx+LLhwvDxuuGO3Y+l8GzRBtb+wde7guJ+t/RkG0UuJxBL+HNG+W8/LSHEtIFu48
 OcoTnXKL6IHF44w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX8MAEnyBnvqRL
 2SYV7UDS8dqgmFcadQ8JGc1NacSWFWGl56zWRvYbFbstXma/PX8SOlZfBPJvNKeEsMdp0v9QQjZ
 WJizm31sZ3xTPC6uN3+tjkRaZz+H+1yDsNv71BZzjccF619zlSU5e240S1OgE0oQpUqa52ma9wv
 nLuK6MkJahF6uEwNf1p5RBA5nrdSfzYqhEVpTbvwUrkWiqCvRAnTCIe5V8+xRVxemLc1WD4OzZ5
 /78dvVO3w+1sgPt5V7aVgskB4PIdFmw1I0kZfijkuFaBDG/X1Quwx/eoM2ncujeC1HFohZioYzG
 7flexrilTWxTg2zPgcMnwSHl1NIiuhTz+NQ1Z3hfYaKpSyWLYdoglJh9y5+2PhhMlA0u8pQAy3j
 gONkOYTMtzZwq3XzlRjPtqQaLP35SGuReuDJO+ENBcMCZGbY6opvkUS/DRSRDkrj1XI6WojI0Xv
 CN8vi4rhjwT+6agvkVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfXynyeKf2jGdbk
 ous9RVUlhuSgK0JohoAAp6kccvfHQZcGhT8daRdd3GiZU55DGX9bcVWRbRCJvcd8rfSAiZ16A5H
 gKReMIhMsme1V2b3AQXXyaAF0GtUP1Q=
X-Proofpoint-ORIG-GUID: dR2EAVFdqFFxYo_IspY3VyX7gM-rTzFz
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace2e20 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Il3CDtT01e2KgOc3ggcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: dR2EAVFdqFFxYo_IspY3VyX7gM-rTzFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052

We use platform lookup tables for shared GPIOs. This mechanism needs a
struct device to work so fwnode-based lookup with no device associated
currently causes a NULL-pointer deference.

Adding this functionality will require a larger rework and it has never
worked anyway so add a check that allows the kernel to gracefully handle
this situation with an error ahead of implementing that functionality as
a new feature.

Cc: stable@vger.kernel.org
Reported-by: Abel Vesa <abelvesa@kernel.org>
Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6acfec73b73477245c7e4c593f2925efbc8980c6..8c9ac9d9330490b17fb3936b8758beb97a308a15 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -449,9 +449,14 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
 				 const char *con_id, unsigned long lflags)
 {
-	const char *dev_id = dev_name(consumer);
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
+	const char *dev_id;
+
+	if (!consumer)
+		return -EOPNOTSUPP;
+
+	dev_id = dev_name(consumer);
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {

-- 
2.47.3

