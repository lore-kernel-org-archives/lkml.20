Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979230;
	b=qspqXsyhq7xWFjFXaqKmns0QjEyvUFYGRgWS5nhDVHUDR/+IzVFst5YXQ27yOXxQc17x
	 B8ms40yG0CeYsUhWpOHFA0kB6gSpVFG2YbBgu/i/xY4ZqILX8cE1b0I+0Dv+k5r1QDRf2
	 uls6ER0QXrTe3vbbQMG920uF4y7HdJqb7is+NC9C1USpB9bCmwk0RqsXLR50g0VSxNfa1
	 XuhbwSCywnVQl3FFwifiqX6qQgf3N+xvtGzAZ+kyjKK5iEF1Tq/FtTNZ9Qes6BGonbJCA
	 mZVVPuO46i4PHDu9lLn12yRNs2OGDCpkTIRDNo4o0CnE5pm+ow+xvLhnnzTuBhRgErg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979230;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G1ZFrJmoKEm1ZQDDeV68P+KaD9B3DrntJ9AbviR+4p4=;
	b=WuIylES8j/q19hfargeEVpCZQAo9HHWv/nD8u9+9CRD29Xd5CLh06II+R31m76vMsURo
	 3scAJPpd3D1RwfY72DO751Sy3SVISuBkQ1dSCSnqIWcM6314zjmk7p7zWvO+fNyQvqzdE
	 hwCO1lMJhnRvK72DrEU+NHTL9ZNmDhFg4zkyeVHWC+OWH2nXFrcc5mvV/iBES5pjCEAPI
	 SHxQ++b4nVuLVodlyyrqm2v4toekn/QTgsowrqfR5KO4VQb0/Z1gfu7Mp7UgfBHdy0oRi
	 T+9KYEkWa+d0s42kPFminKjX4mIORNszfNMF7nQNfa1o1eL96lX9qEOyqBYnE2YkHfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKmAXkp9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TU3z9QQH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37861606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37861606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dKmAXkp9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TU3z9QQH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F04NM3184999
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G1ZFrJmoKEm1ZQDDeV68P+
	KaD9B3DrntJ9AbviR+4p4=; b=dKmAXkp95NmceLrq/G/h1IQgYjyZ9yuOqaOU+X
	CfXGQnEz3xscfqUT+dvK3Ds6WMDeqiODGV0ffJyKSYli4WbofArlpDMDwTzE4XaJ
	XRW5fyYnxlvzHNqaQDsIxkquTh1kWor5nQ7+Vhp8YDRTkQd5i21F8F9R7F5s86Mq
	p4oTvU6vKh9hh6qHuUoUoVZz82oDOEFIDWJtGz9yWJHjxrYdFNqjUN39zHfR0W1/
	6BgO3ZoC31d4IqucP0olgPppPisF+PE9+G5TfGsMGu1oyd1wk8ttZd+3zmSsPfHW
	NOD1Sl2x9R3y2F7xX9LjFg4kW+7QlZyiDFLmznfnn8Q3A8+A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pabb9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:33:49 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980b637ed69so139951241.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979228; x=1794584028; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G1ZFrJmoKEm1ZQDDeV68P+KaD9B3DrntJ9AbviR+4p4=;
        b=TU3z9QQHX4BqLqVTZ8f2Ms/wFhCRbv0eEVqCpZ2zd/xm0piQ9HQ5X6sOJ5k4fk5xOA
         8TmVBjY/+ibSIaGu6W9QaXJJk8ZrX6o6u9ghcNG1FlfMU11rqYu6oHqYpl781/opURK6
         bjQjQ66y8fP8JLw3E0YASPllZPFc9la72Mi0Gyr75JYxAuH4Kpa5My2Zo6ynkz4rfjx8
         NZ4U/1qaxJjwcbtW8UbGpf1hLu++d2Egm/ojX6XwulL7IB5LHnK6QKYwDOoEFIM8662D
         jFeBdz5l3whYf0cskbHceEk3+azRsXiy7ghD5XUcJCIaucoDA4NJEq65H83PJtjEF+Ht
         NlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979228; x=1794584028;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G1ZFrJmoKEm1ZQDDeV68P+KaD9B3DrntJ9AbviR+4p4=;
        b=LhTIyknjvRkEjjT8G74FvEcvxrdsrIGnTKOxjyPflEc5EizWcbk9x/AmNttoBHVgzI
         Cd3YdY+uGggqs5ZX9DrdE9PXopEVBtFYzeon60HaMa967yxi/uZfvTj67UOi4b5zMu3t
         SdvGi/wmLInVnHx0c7oIjhX+YNp183iDPUplxkd5axNErbawQj3d7rQaNPNhjC2ap+6X
         x42Me0Oj4TnfjimWcy9c/ngw6hs53rrWgbMKJONmOf70ChdPWb4uzWFB3Xrix8lyzFq8
         nBi6rKfRawLDuGiVHPiq9GYKwyjXihI5kcSCRbnFAYyzg3kFJsbPT2hZrV6RM+lnCCQE
         /Bgw==
X-Forwarded-Encrypted: i=1; AKwUvBxSrwgG5y3quJ6HhQO3CUOGtW4RJlxzn51QKY/TOSkOJfkNTpOHiQxlZxWA5hQMrYeBrp58QockCVT9qxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lPICx5ddUMbOTFcpmQOnMHgAmRf6uqJbZlJGnR7PUDeXI2Nkp
	CpGmcS25xig67N2nQR6H/6X+yrahGHqrL8cIL7SWrDdGiOIpYEKVuh4KKTmGtHHUVdlZtohmWou
	Ri6z/BP0vJzxMJLdCGHe7MvU0/vkvkvHVuG0LLgar0ah4D+qDHxHhJWypSJPKnCnuts8=
X-Gm-Gg: AYBFou378tczg42zQYkWfR/fEQgPlqWwggjOe2pSfAJoMOErCOdrO93VL/TaJ5Wkeew
	yoyQMvd9azLveYdaYC/lDY2ZPnLujMylIe0oGt+tzuzzCSeRFvlWzCV/cI4HdzyusHyxn8GWYVN
	huRe5WhcM3ps0UJZ8Pilku/Ggn8DdBv/dSWEP0W7Lt3QzPIxbqRLHFs0yILf1mxvqQsjhCaEtW+
	q8kXowMKpRj/ScbzeTp2O/5WdXeBlk1so/9SKdzHL96pd/yfsUddpjVktJFbLeKi5pPblt65+pJ
	u974RTIlipbS5bH8xaa2gwhrSL5v7/7V9KTVy5pKMCMiHY6khE2ZywNrGyCWGn8iqQuJT57u1OF
	+KNiqfhgbSgpQr1g2jFvme9hi9ujcr8aalGIlHrD8fCMTv02t/3hrp9jA8FhBdxjWGdP5blUr7Z
	H0Pg==
X-Received: by 2002:a05:6102:508f:b0:7d2:8dd0:301 with SMTP id ada2fe7eead31-7d2a166f095mr1397424137.29.1793979228399;
        Fri, 06 Nov 2026 07:33:48 -0800 (PST)
X-Received: by 2002:a05:6102:508f:b0:7d2:8dd0:301 with SMTP id ada2fe7eead31-7d2a166f095mr1397408137.29.1793979227771;
        Fri, 06 Nov 2026 07:33:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76031265asm29603215e9.4.2026.11.06.07.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:33:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 16:33:45 +0100
Subject: [PATCH] gpio: virtuser: fix interrupt leak and UAF
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
Message-Id: <20261106-gpio-virtuser-irq-uaf-leak-v1-1-ce9772d8ad0d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFjz7WoC/x3MSwqFMAxA0a1Ixi9gUxF1K/IGVVMNip9URRD3b
 nF4BvfeEFiFA1TJDcqnBFnmCPNLoB3c3DNKFw2UUm5MmmO/yoKn6H7EEkU3PJzHid2ItqQmo8Z
 TYS3Ewars5frm9f95Xix83yNsAAAA
X-Change-ID: 20261106-gpio-virtuser-irq-uaf-leak-392b42bf2833
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3951;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X3CGwkCMFhQqUGqNpJL/j/edYRDWPzS7au0W+PzOmPo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7fNae0WZiDuvb9VaFd+CIUlczloIyURCFjRFs
 TJ5j9sXRI2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCau3zWgAKCRAFnS7L/zaE
 w2YnD/4om7aGJ+28/5A42nhYI+A6BJkBAJ3yo+n7KlsZ0Cc71YOQXSaNJKhIdXaNzAZ+sU9ReKo
 nycGF0T6ryFnmM8mdfMm0bwP0c3Nv/Hw7yAGVhKr/1EDYOVQ2Z2EU33uYV2Btm/aJSZRgnoq1P7
 V9NcRA00a9jWtS+MladYM/38CzUYmBhpv3i1W5DXLGsG2GeEo7kA+vLOUOGwLcAKL5oe5kLbJWL
 GOqlV29DmZJPIpoSsgfY5NZYI+ZWGoN1+cich5LWmzXjn3FOhIOX2aamwc9UdIO1BeEl0f9MGPG
 aQvUJTR4ZzqBFm9OdL5xcK4by/T0Upk9GtIZFqPZ8bZxj8KKcEPhmHq4RxGC/Noi0KJM35kbtdK
 /hhDnIOgTtDAtdi1SatNQMIo8gtSN4PCY6ym2pQRlbsTTPrxc0YBO5I/wcEjjlFKtF1EY0Oi4HT
 NOyzpxyfC6D35F7gTVwo/LiOeqDMgsgy/07prUmXAWBznVajPiFwavpl7wZoWTREA2CNXAriRG0
 NHHqbaQLtORIFLtTitLrEuv9Omif223gxIXDKcAKrsYjddo7jbjTMdkktqFt2i2m5jzr+HRCpg9
 eNQG/yPuJ2k6pCduqMOUtgpZCn6YF+YB+SUaJ/7h/lNldzKkVh7NalCjvUVUBblm29DmURFUTJH
 6mjgXQLLpwpyAAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Y3BWen1SVAPgvv8qJsyiM6Crcl4O1Zw2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX39vBvIMoSMzN
 VOLD/8j8Dg1sRKvRfjFZ+AQDqFR54hG9fr2VkxhEo4XoE8JFx7YHH/Ga1qWDb7h68DZ31cv/SyS
 rI4tXdBEvXf4qWPb752BWJ/mr7DVnoP2OwrF8zjf4fm5T7tpbgHRE0S4cFRZD9Xe3FCm4dVY4Au
 FgR1iisYO9rFkY8FbouW68mEAXoujzw+nWkjQsy0h9TezpESdTPIwdOhvslYKMNx3+MHwVBfLE+
 7nczZQMzvbvQa+FlCe5wI1EamhtdEPSd7jyn971JKJpSKIfDornapGfprHPiCv8YCCAFRPQVdNJ
 YZVzyPJaegwrZ+B3KKMUOvR6y8sCYmkBKIPR6ogjsjHxALirECtuOMjuzKww0nKDpbwBDGZhUZe
 piqfuqLBGLwN4dldPeBc7cExGCpzMfoyOy+arm7cQxyhnFbgmjdLvFiz1Wac8ZBWTRMqmK15ElI
 RdtyZeU0zujGK3eLWjw==
X-Proofpoint-ORIG-GUID: Y3BWen1SVAPgvv8qJsyiM6Crcl4O1Zw2
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aedf35d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WVLbfADCyz3l7nWlDDIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX6IDSgJAbBBPn
 O+OaMkRD+fptW1pTWMaT1cnunf2cb67aulqekZQlVxA0nw/st+PKf2IlAylpdM0qXiUFR2uS2la
 yOFifpIvFJZqEMo7kaMZFo1+G58EFmM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060061

When configuring interrupt handlers for GPIOs requested by virtual
users, we never verify if an interrupt has been previously requested and
just leak it if it was.

We also never free the interrupts at device unbind. This is both a leak
and a potential UAF bug.

We use atomic_t for the irq field for now reason, it can't be modifying
or read from atomic context. Let's repurpose the existing consumer_lock
mutex and serialize access to the irq field. Let's add sanitization of
input and schedule a tear-down action.

Cc: stable@vger.kernel.org
Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Closes: https://sashiko.dev/#/bug/linux-d8935133-0e80-487a-9e00-e748056f595e
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-virtuser.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 185c1be39b27760b468011acee1c21e649e87f8f..21b4bc64d4d346c51811491ab1d92b4af36ec3c6 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -55,9 +55,9 @@ struct gpio_virtuser_line_array_data {
 struct gpio_virtuser_line_data {
 	struct gpio_virtuser_attr_data ad;
 	char consumer[GPIO_VIRTUSER_NAME_BUF_LEN];
-	struct mutex consumer_lock;
+	struct mutex lock;
 	unsigned int debounce;
-	atomic_t irq;
+	int irq;
 	atomic_t irq_count;
 };
 
@@ -607,7 +607,7 @@ static ssize_t gpio_virtuser_consumer_read(struct file *file,
 
 	memset(buf, 0x0, sizeof(buf));
 
-	scoped_guard(mutex, &data->consumer_lock)
+	scoped_guard(mutex, &data->lock)
 		ret = snprintf(buf, sizeof(buf), "%s\n", data->consumer);
 
 	return simple_read_from_buffer(user_buf, size, ppos, buf, ret);
@@ -635,7 +635,7 @@ static ssize_t gpio_virtuser_consumer_write(struct file *file,
 	if (ret)
 		return ret;
 
-	scoped_guard(mutex, &data->consumer_lock)
+	scoped_guard(mutex, &data->lock)
 		strscpy(data->consumer, buf, sizeof(data->consumer));
 
 	return count;
@@ -675,7 +675,12 @@ static int gpio_virtuser_interrupts_set(void *data, u64 val)
 	if (val > 1)
 		return -EINVAL;
 
+	guard(mutex)(&ld->lock);
+
 	if (val) {
+		if (ld->irq >= 0)
+			return -EBUSY;
+
 		irq = gpiod_to_irq(ld->ad.desc);
 		if (irq < 0)
 			return irq;
@@ -689,11 +694,13 @@ static int gpio_virtuser_interrupts_set(void *data, u64 val)
 		if (ret)
 			return ret;
 
-		atomic_set(&ld->irq, irq);
+		ld->irq = irq;
 	} else {
-		irq = atomic_xchg(&ld->irq, 0);
-		if (irq)
-			free_irq(irq, ld);
+		if (ld->irq < 0)
+			return -EBUSY;
+
+		free_irq(ld->irq, ld);
+		ld->irq = -1;
 	}
 
 	return 0;
@@ -793,6 +800,14 @@ static int gpio_virtuser_dbgfs_init_line_array_attrs(struct device *dev,
 			data->ad.dbgfs_dir, data);
 }
 
+static void gpio_virtuser_free_irq(void *data)
+{
+	struct gpio_virtuser_line_data *ld = data;
+
+	if (ld->irq >= 0)
+		free_irq(ld->irq, ld);
+}
+
 static int gpio_virtuser_dbgfs_init_line_attrs(struct device *dev,
 					       struct gpio_desc *desc,
 					       const char *id,
@@ -809,14 +824,18 @@ static int gpio_virtuser_dbgfs_init_line_attrs(struct device *dev,
 
 	data->ad.desc = desc;
 	strscpy(data->consumer, id);
-	atomic_set(&data->irq, 0);
+	data->irq = -1;
 	atomic_set(&data->irq_count, 0);
 
+	ret = devm_add_action_or_reset(dev, gpio_virtuser_free_irq, data);
+	if (ret)
+		return ret;
+
 	name = devm_kasprintf(dev, GFP_KERNEL, "gpiod:%s:%u", id, index);
 	if (!name)
 		return -ENOMEM;
 
-	ret = devm_mutex_init(dev, &data->consumer_lock);
+	ret = devm_mutex_init(dev, &data->lock);
 	if (ret)
 		return ret;
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-gpio-virtuser-irq-uaf-leak-392b42bf2833

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

