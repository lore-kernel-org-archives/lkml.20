Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708484;
	b=VPso5L0nXEO3VNE54zkcjbLpTj1HJ1eSBGqPuMso6ycBoAb82Ci49j+VpGBBVVRb26j0
	 dIs5j1hG7ubVBBsc29XWT84HVxdeo5ltk8LnjtzhK1ShdYZmWqfIFa7mfsdSZVxRHDo4U
	 /tUfI57WCJp1Wqv5tHKVj0zTqTw/DjsduDqVBvXnVQqadN1yzdtk7HPumuwn5KEzXYqcv
	 t4Q9WqqeaTPXIkr7OnoUWdwFB5PnGMmBZXk94nAO5H55vcwm41rxQBfp2p+JP+cvdZSzd
	 RFPp+fXa2LOg//P9IoIg3a3/vKgEmzJwspprb4s0iuMIzlYs7rGGAH1F4d+eqS9zHnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=jXCYcA+ow1iw7l39Wsxs1WDZgFqDtq6oBgZm6l1UJbQ7QWp9+dFq/B/5jFZ7OoEOYk99
	 rQc2W6TMKCkfe6XpCdPvdgKLDJaeYG5a94hioCvr5Dv7GEm7KawQGkasgEWrhlCYVXgvs
	 btI2gGudwh6TwczguLFd1q/eUoR0AwsLpGzPL4VuKYNw7MfTj/My0KNXVliLYzgVl/a6r
	 G4Fwg/0QknorXLddlpB1JhvUlhqPNoVZGnFM6gW0jbCRXRXsERkKiC+//MaCWTNJx2amz
	 RPX/Wyn+Zd8vFz55HcXkolMMtPkoXQB2OnELMZH2RRl3zi9gJDscFZf7Rj4axuKNGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6tUbbjP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtqBXbxo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843F606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7843F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6tUbbjP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtqBXbxo
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAF5D2522010
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=V6tUbbjPa0AfuqVa
	adIczz3l2IH6zM8HBT0Yzrpxp5KLyf7sZ5pL8Z2/Pk5mInrMYezNfChEaQkdblbW
	CYeym450U/WrPB34oBnANuyvHDFrXB2+X5bYtVQ7GU3lLJawXJZdEsz8zgqV8w99
	9wAZt7yCDzxQW2GtcU5sznawXBgFZVhL7uT6cqEWScQsu18cg32nngvYnWEFWeY9
	jIsCTBH59cUPfcoZ8qj06N6cFA8tw3EKHuTMdBu3k1/Qd/liHj9WpLlmVgIKe7zs
	q9es2NIem1hP89xnXLkbq9AythA7CYbC+wL/rtZZZwSL9xTr5XuqXxDIvlJGAMdO
	JX7Z3g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jkns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:21:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc4149b885so3236169137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708483; x=1794313283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=NtqBXbxoZSu8AelhZLuKmJKLzOWvvHojF0f79XTCuED2nNOC5yaVMYzc7xxN3r/WYi
         Ffb9PWgUxAw2stCDnMv9KskMbWzDBmWVb2av9Fqepeh2HCMbWp9OLUn/7kZlUbEkpRO+
         d+c4uaOGoaPn7XU7XUNyLem+Oyyq4CpgTp2YOT0nZKdDFZ6N8qd5rbOBSXxpz5EgV4Z4
         9Zkx6RzzEQk9Zqo6q7PIJoHgJZrJarFMD0ct9x2HBFloGwuMCnOMsN0D89M5PzjZRKAk
         Xl7mkNGJzadjWQ7DyuVCq/yX5YXV2VXxA9OlPkAuSgguRgWtdZME57QWLMCiNbkF2jfd
         OyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708483; x=1794313283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=eAlhQNGq4O/zMJg4xqdUwuSkSUaAX1cj+JE1MS7fwyp/txASlurzJ1hmVzHx9x04Wp
         IXDSQ+7l5jZcgoRM+03mDSatkl6tmLz6P0Nh4dhLQrSVoTJwV6v31h/57i/G9HP/M/fv
         /aLk0HhiL15b6b6+TLlTFofnegJ1+MsLmSxtJL2MUMaZDxYaW7Qk7XNLrDbrCh14wAnk
         fiIUPcdqnQ6uxSOtAgbbxy0m5cBHkQ2FZTFnn9p6oOHhcgT3OT1ix+J0YbJXDAlEXa1G
         vogPKHqVXvi8HhHMmNGXvoCpRziJ/3596D9UbksfKMg4UOoz4ORiO4W2EVYbDCv8JlAG
         mR0A==
X-Forwarded-Encrypted: i=1; AKwUvBxsiO6MyS+QwNhB+6U9w5rEaj6ut03IyGEajqp1QCpCFiQUIicisCyszaaexZC6/6QYWDk9P6yIaO+1VxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hZhIGYE3WtLX2NBpQ4BtgzHQ/41/YLohH5FIIDQV7MEE8Y6wq
	TcWh4w61Uod9JLSOL7AeUue0Ug22B3JpNhQu5/K1ZR/StGHX5/pHUL+Qa7t7DQj0HG1hlD4Ah3H
	WRidHGF+A/DbnPqMU+uxOA0UEkrog0GdlLQjA26sylKcqca6QeJZPsFM7kmW2Sj9sG6I=
X-Gm-Gg: AYBFou1bCPHz9uaf1tXghLBt3+duxgk+YiMFGrG32KXQqeXjy9SYrM21F645K6flg3N
	BTchpq8pHwhTCpmcA/RfE3KSWxOE+6NQp39PGuUCvRe4+rQwjg7SaZtJTsu836C2wAZYd51IamP
	2L5elbxbEsTFlyMQXws8oA3KYpbgtmBVJur2T+nturctVHE2NN5pwYvhkO4IEY/mKWSLJX/Gbmk
	Td0+CyzfYkIFqj5FGbuWV+fFykmrT6epY/at3VHDOp5XeWQpXCxv1+Gc/8J/o2r/knwVW2akA6J
	mG1bSxzmf9ShBF+3wCZfgG2VPuDcJz8C/JHvJ2WZ6rh2kAnIHcUVnuXpautCIkU0KERreWt/ojU
	Bk4kzmC9E1ZGZ/IOIN83A+bEeuiscKYntbV9ySfbktUD64RMJBUezN9XYAKItwEOUAD69MXGp8D
	j73Q==
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5468458137.16.1793708482705;
        Tue, 03 Nov 2026 04:21:22 -0800 (PST)
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5468443137.16.1793708482196;
        Tue, 03 Nov 2026 04:21:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 13:21:14 +0100
Subject: [PATCH v10 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-1-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+6wdSPRH1rPuN+UD8TJRPtXlvt0JwY6x+y
 Fz1jdAAJvCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w/HHD/42h6ZeqO/+2wIFbZAiCsVqWLIuntzfuCGlmnMpTszctbfmwz7DNx1LHuqo5oQHNaLUVpY
 HL44ss8ggWYUIwCFfLudAWeczX4H9yyPdCxwC31IJpxfaneSnkpCvq3VZxurOs6OwANjCNDqb0o
 gTDIZK8d13ZHI5Z9aJ6qEkERUvlZW/vHMBB4mns4cx/HtcDgS9H540W4c27/pxN9UkbjJVXWhyb
 xbRu/aN+5QTyGp08CflDDqBHaiuyJ76n4eg0Xkz+T83m1AKYtdLbaymp0D0eiIq1RZMgqD8Bclg
 2yJrwX+kViiHyxI06S9BUAVvY8v6GiEBos10PKjdVTKYJNEhwX1q+0kBPZ1vYJeYS9LYzkBIPkR
 yF9DKWRWdQcZJsEDK4kiaMX51kkksdtaHnW8ATgNzuK2JPC/mnxQsI1tpSbAk8l4shypfD63r9F
 wo7lW4dpO2ub+wGcZwQ6Ta2R8F3Y1ZSEe8OC42fYMj+FuSwIDSpdQ21UbTuJhn3Y5WrHQPKyUpf
 oDPpnRUDhd2n0wwR0rcgMlYnNp3zdDaqhhaPdc3aXa5HO4aMUY1/l6NNwfG3qoAX2xuey5HJbm5
 r55bMd+shLnejmlM9ZzOS4hGF69gSOzGkDtYDjTkglU9vXHdEtO/DVi/58XMCdccQZZoKAaq5jk
 hsoic5FijbZhhwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: bkLq_Sy-56zuZaFTDDJ2KyGgdNHa0bgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfXzBgsmJs39I3m
 uDBxUAHYEDqddm7BzHQ0OySEQ3LMmuHmLa0SrTcUHHPqGbNR73sYxpgWcxcTq1aVzQ/sogacGir
 j/QwHfoGEvZKUare147PzOELIlpA6gwpOLM0vhzBALSe1I4C16UOrKUpvsI7Ygc+fEwNoFddQNm
 rcMCU9RiuWg+aMo7n4AD1y/Y2LS4Rt5M/SZk5wz+n/3dS4iRB0bmOzasURKAVi6X2R5O1+HKGAb
 kHSdK/cZUjFa4t98M3XcwmkoIsFQ7NguH8vvRGG0sR+Npdh9cDFW3uNWJCgtAqu1u99l80QkzcI
 UFCGSWczI+5RpiPALwl1cvc0o5W/kyXR5/78EkK92rys4oYIrECjhXL9Oo8GhmOewxPyQdLqjyq
 bx9E45dwhdfDF2Pn5yucZC/VZ8pTYGMQ0CAEOvGa/OBCFUKu52ZmUkERcDS8RPCfprzvBpSCEGa
 5bchYskXHRQfxL3FxVw==
X-Proofpoint-GUID: bkLq_Sy-56zuZaFTDDJ2KyGgdNHa0bgy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX0cZQPh7J8uaZ
 GXRKV5MqfYjr9Qn7igB1Ynb/ry3O+CvXn8NO9YkefLhgq3urm3CkJ5V/p/KaoRFtgoJuunK76KG
 hPhem1xNyMSdh8+QCNDZ1O6Fm4Ibv74=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9d1c3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

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

