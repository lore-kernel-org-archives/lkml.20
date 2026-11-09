Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234282;
	b=ywLPPId1U9CEfhOeOq9KuGAfElODF8AcFrJNAMfOxQrFsePxTCqS+A2kVDSSUJfFpAea
	 wiuMhBjq+rF8DQqNDsdAo2e1mUCs0mGyxtcbG+7D/w/KooipTu114YdImzG+pi4te222R
	 RHZgVe59gaRAVDuL4AcAidctZ88MxCNlxP4INf0X7AoMdorHd1pRwu5OTkZJzHQX8fs91
	 ODxp0e/mw2mNcmj2NqTTF+WnxhI8BZ6NS9ffz+vG3cSQwxbCKUwoXM3f4Z+UvNm5xPKll
	 w8jg3zQDo4H1RYISki/t9hBJKNxaGqDtdtYn3oi4wKAU1mKImNgyXOpWY5I7nnu6diA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=in564Rx+eAadjErat7DyhqNNJgi4ng8yNv6SQYm0xaA=;
	b=XEgE8/IJMBUWENYwCH07OaNhquTH8ZiImwPf6d4uF8qPaucaZ/HByjdXuXCEMI0DjAfm
	 xxOizE1tvh2BS683iPmdTblfgHpxmZ2TXgDASZ73QW9P0Mu0i74cxFzpIOKrIBEP/5r77
	 gXp4wFwuqpFgdS3bA68P5Bq9a+52yn9BXzCaxz1Zc91xH6Qi85NFtn4CJ1LAejVcvp68/
	 p2CDgrRDu1ylrY0UnvAz7pC9FUCEtk/DGbHqBlPTqvndDFU9n+gJOshHcu/4rX4gviMkz
	 h5x/kZD8x9o9wVHaK8NNo2pmPqBOaA04PFlpWWCt76unylpA0Fc68LJNcDHRv9kwElQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAtYvwPD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2NvHccn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755F606D802
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E755F606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAtYvwPD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2NvHccn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEtIM1323026
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=in564Rx+eAadjErat7Dyhq
	NNJgi4ng8yNv6SQYm0xaA=; b=OAtYvwPD3T2zavexsMocHb9hbVcZQFG8+jTdPk
	siYFN50E4u1YkefYYejloooXfwj22UKWSiUDk8o7csVsqMilfda0gWCYbJIWntjG
	CroKpY9/u3SG4l5DLlEP1BhAE/XLEyOBH1XgvleDutwAEmDYhwgJ8TsoXN25hDd8
	6rgGcqCAiNyLVEgPzJhNVe6sI1O1E+nsBo2rzX1mZAt4UT9IOJbbXrpstiWpSrYA
	IKNxYIQtWVPrzmz/RStjLtGJIrVbxMtizZ7qTu5KpYvVKJdVS+zjeog926AmXdBe
	0pGQ8KNCnst+yJGeZEbwwkFyu5toYFuAmh9KSwsbAdKzr9Jw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qre1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:24:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2e2cd9c85so737146137.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234280; x=1794839080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=in564Rx+eAadjErat7DyhqNNJgi4ng8yNv6SQYm0xaA=;
        b=N2NvHccnoKkr9uITp3DLRUoNF0pcM69WKvJbjgjfCvx/HmaswlVk3qjsZGQa3lywfz
         iYad+m9nojtGCJWKfswUyFxVVFW3BKgfkLUFy/FiCI68G7Z71dJ9s2c1wtEgucaNXOoR
         KRP6daqisWNKtZi6eN6ycDh4LnyDcWDhwGg6C7fDd89x9GMQ4/6Skx8TSxoFydSMjnB5
         EHbBZHHYtbYscga714DrsCnuX+o0oM3MzUumSK1na+DZEM/FeYr8fUb6fGZir9E6LLIh
         CqgQ65NhhxkeTBIvzyD2kmm3GT/L7rj2XzbJja6A3ZYqEQJlKKyFKtcUsE+Nv0BK4B/S
         I+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234280; x=1794839080;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=in564Rx+eAadjErat7DyhqNNJgi4ng8yNv6SQYm0xaA=;
        b=ifM6AmAwCbE/Wnagf6AuOt3yNxGka3qXKOSMxR90rwSJ/bmlQOpkLL2gWs6r2YPWIy
         dU/uv6h1DZed89MWWEY6QDdHMqoMBob0vlJoLWvV/Pn4sGdlRbfOpByzJ640BB2UxM9g
         kBQimZdXafIcvzyhz2xcd6lJoIL4OqfnpXVRGzZag2VS/JTMOR5KSauGa2cC3sXOhOcH
         Pp9on/ZYCx8lmPset54RpQCqlDd9gwTfnfHcgd7fUmgqdulQT5Cp+y/2YnD/eGrk4c58
         vGQTCw2eqTq5cOSWIf7kGEPdRj3W0FPumzJEKdQ+rWxpnxAi/LA9tKXAOB0ZlN0fx70+
         qsag==
X-Forwarded-Encrypted: i=1; AL+hErEYxLTm6nRmNp7f07PKOPHBRNMSL1pnjUcwExWaLecmEQUkj31x6mzW+7Q9R75WpmBD9Zb0znqz/hefzqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cR90ySIWyvfOwm9/C1ee2IQ0na/QokEBvBXSoV6ezp0dunTeh
	2AAcC8ffpBqB6SNF63dgS5vFFxblcFd6Wq5+sJCK9qbfFqhBEwCvBeP+DIrGVLgdbp2QAzeDADC
	WlK5M7b8xEeDFHyGc9rg/OPVn6Tw7+FlaVU6ri1Mg33Uga05LTK+OQZ8iPLkLJBrts4k=
X-Gm-Gg: AYBFou32hAVH/YXMWMf3EkSz1IuTBAR+yDU0bILu0zqpZSmUUvcs39ZIAqs83V0xF5G
	zXXAKH3+Zu9ku1NStr3Ydi4a6MUXIn6BRmP0QIen7JFpiK4sbIi6YNSra/kBAlKRyL6dY4OOvc6
	4Zzn7vHByeUv5a7WsnX4SvhNGf7RcbYJdt8p93TW10VbAYYNNLznSUxFur0zeSfMDT8RXvF3Yrr
	JZUBoe2hWO/fxwvF8rCTT7tqY7dwTDmcv5pFldgp6ZwS9J3OP2By3X80eX/g+eQePubT2OmL7A4
	dmS3pWsio0vcVvRSxKTi+U9JiZDJuBc1AGpGZjoV+bar0t1FdRkwvcQcKaeeiu4PBO6vOihY5cg
	1uHL0thQGxwgOVgxfxeXYWXWz2TeE6jmfYqxbhbw/3Q9XDN+1sV+aW05v7b9uu7AbCxmAPDmmI9
	xYLRJrkLHxGJxkVT+254RUjkxWmDvksKsa2XvxVtQTVnftziXOSLlCZCWUsYKWVyY=
X-Received: by 2002:a05:6102:580e:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d2db169f6bmr1317764137.12.1794234280096;
        Mon, 09 Nov 2026 06:24:40 -0800 (PST)
X-Received: by 2002:a05:6102:580e:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d2db169f6bmr1317755137.12.1794234279695;
        Mon, 09 Nov 2026 06:24:39 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f994fcsm11571143f8f.25.2026.11.09.06.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:24:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:24:32 +0100
Subject: [PATCH] gpiolib: keep the line state workqueue alive until device
 release
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
Message-Id: <20261109-gpio-line-state-wq-uaf-v1-1-2e126ca3427d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ/X8WoC/x3MywqAIBBA0V+JWTegve1XooXUVANhpfaA8N+Tl
 mdx7wuOLJODNnnB0sWONxMh0wSGRZuZkMdoyERWSSkUzjtvuLIhdF57wvvAU09IdV7kVVkq1Wi
 I8W5p4ucfd30IHz3TBFloAAAA
X-Change-ID: 20261109-gpio-line-state-wq-uaf-e7343655998a
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hbuvUSfXK8YGaz4BAiKiIRwnx3gmzKOymFIb3TMJ1zY=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGrx16TIf30+qUn7EeOBS704nhXBl8JzIFD72Yj2pOXjQrkoE
 4kCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJq8dekAAoJEAWdLsv/NoTDpLMP/ReC
 zsfu5IwMEnlAfkQHPLeMs83dqdmnZq9F1eHZP0Wm45jmoI//22sr4oXS8hTt19rYaxzn4agwNRR
 VVPFtUVhQNQ81wipl/HEGA3va9FMoWJuKXYj57wEIVKv4zjgcJ56OM2ev7sVtdQ8H3GxrPyWnRe
 S6g5DYJalatcdNNCu0zZl0xPQ6GKja8vAB6n5QPpN6OuqsQX4qAJe21lOuWS/TSJuyImpvh0yNv
 JQo+mA7bAcUjG5WgvpNwIAJSH6HRsU8H0Sor3OlQT0iOtsh4D2pu9eEzjqrsTd6le7E28pWZ42c
 EqvQWr3HZ43EdkJY18gty1k87rwiQCTEZabwWfaVrUJiLyhYMzEf5PdGZBfmR6M2SQHyesE7yzh
 u5crovPRL+4Rp22EYRMopcJOoWujyIrxuhp0qcgR8osZMOhQH5uTae81wD/5aNZ9ZgIh/Z4rCGB
 BMY8BYvgdBVvZf/S8MTvz+2/DKzSRNBYqgdAuETOeUAVaD1fQnYGvkfQEhdB8ZdkQV9WhcpGqj5
 YaF698eYzozZ5bQFwLX+Ivv+T1nuzMzKfxI9YB4T0Fne8h+KeQMxydegUdUdtvHN7G08pwtZg2p
 liYpR0UDjdW8mghNlmxTm3m2YqW5vVzitpyEdtwwz7mYLJUYvoyYHIysvaidPa7sHJCZPjoY857
 ZV8Gs
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX4+W2N51nVqST
 Yg0i9P6OikfZOzBecBb+TcYn9fWUlt4J624eJKBkGQL4Jtl1PyGam5LXkmYh+JmDMsrdErADHDV
 EWVCUAzdDNeRXpyUVcAlAQN84K1C6GMMCYcdm8Ff+PVLpuurA2tUp4BT6L/UD9hVZ38k13DEt1U
 2ui89vsIzNoPy6IkPm8ACnoooThugGDMjXdbAkJm4O2oQq/PKXm+eHARafXLTBQu7Gsy9duieLR
 Br/ez/SHDC/qpAlBW06sG9ehNxsgU6ep7PyMblcZD3SNWI/wjgPwTO2IdMsh8gB6KBWLRAy0VI8
 0K0vBYjzbOk0skegf6PvdHFcDpCIOQ7da+a+g4OPA9cycFV0MA0PnUSvHe5nqhUn+q2aR1FoBwC
 uhedDOsJLCp7YFNoizzBR5lLprSX9sDzMu+fxc6J4fwtlKG+LD0vQ17Jpued+kcdL1+MQtP6tCc
 tSAMBY9T7pzCO9sBNsw==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1d7a9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KQQni2JmCJhbBse-3uIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: lni2eZQLjN8cTIqhoL3QtSxUgLOsXgyt
X-Proofpoint-ORIG-GUID: lni2eZQLjN8cTIqhoL3QtSxUgLOsXgyt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX3WGvgKICPnSh
 E6Hn0OCrRKvxEt96pWPgW11seEbdspZpmYYtH2V2KRfaVyJI+CPpqtbf0EIf1+i2jRTTzx1/16E
 Acy16yoWUPdBm4+b4CHwFhy5a17izi0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

gpiod_line_state_notify() races with a concurrent gpiochip_remove() which
unconditionally destroys the line state workqueue causing
a use-after-free situation where queue_work() can schedule a work on a
freed workqueue.

Keep the line state workqueue alive until GPIO device release.

Cc: stable@vger.kernel.org
Fixes: 07c61d4da43f ("gpiolib: notify user-space about in-kernel line state changes")
Closes: https://sashiko.dev/#/bug/linux-d0e9e518-2348-4fe3-857d-f3d61a42f159
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-cdev.c | 1 -
 drivers/gpio/gpiolib.c      | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f68e33cbd7d4cd5153e82ad77768cf52a90601d6..1dc170364c46a51092d21391c5a602bf9dee820c 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2768,7 +2768,6 @@ int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
 
 void gpiolib_cdev_unregister(struct gpio_device *gdev)
 {
-	destroy_workqueue(gdev->line_state_wq);
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
 	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..c954c7eec2bee3a8dd55b949ec9b92f31461b25d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -28,6 +28,7 @@
 #include <linux/srcu.h>
 #include <linux/string.h>
 #include <linux/string_choices.h>
+#include <linux/workqueue.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -898,6 +899,9 @@ static void gpiodev_release(struct device *dev)
 	synchronize_srcu(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
 
+	if (gdev->line_state_wq)
+		destroy_workqueue(gdev->line_state_wq);
+
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-gpio-line-state-wq-uaf-e7343655998a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

