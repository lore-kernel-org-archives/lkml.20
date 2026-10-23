Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750462;
	b=vvv6dguJb2JxjJfLUen76qrZM+Y7PMd3nqJCiJzfIt0BEa6fjWzJpWUn6/tBXaLH2TaC
	 euwIeup5LqSmMo4kBdWeAKYB0kgXplguBlAV9PzZ6ojre3lLDV9HEU1i/LP4RhtX5UIU1
	 kj/elMKx2wMkDjf+ygPw3E51Ui/2Nyi8SQBCqV40jRfHvquRvw8NNTqhPk+UrsKJ0VUxr
	 /J0An5d/b4qNljAu9VAi9g+ATNIO0SVny9jLpdMOHqJvk2PZ7Nu4bSJ5aN+AmveR8pfOb
	 AjbME/TSD2DOxw9sDp2BXujv9y2h9ThbvJQ3v0GAMCNyHXIuP9lXtzzKqi7R6WDco7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3/lDJvjhBQBuyuaReRi3SarttfTu3Q6e0rLJWgeouyE=;
	b=LBNMZZtpbIz2qbPth1oVwO56hLz4j480MctAaKc8S1YIgcbLHWvN5s2coU3jL1kCu0Zp
	 NKPeA3qNnqxtQP49++0fq6kQVjbXvDd3vsWjmY6fNbPa8Q8Athm8gCjQ4ggs6mY+4/I6q
	 FnS/eSROIMaoVdHuRoO0G5MnUFdrjrLVTh05E0/qlP+O2b56yuqUSgY+0ZBP6VqdtoBNm
	 3te/ndiNmzXmWNIO+BCEv/LKdaoAJpB2iArX0EuGbNiyoTpqasUmBD2SjBoZqPO/ujyTU
	 ZVWNpc1sPIAcA4Ec+uoPRUCQui4gRIPdT12bM1ykeFZGZx34jCuAo7xocgtHwLL/SEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Lgyycgo/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VEwOUJU3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B8D606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B8D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lgyycgo/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VEwOUJU3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAKDb1597403
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/lDJvjhBQBuyuaReRi3SarttfTu3Q6e0rLJWgeouyE=; b=Lgyycgo/B0FC7eH6
	xRgd/soN/MISMo6rhLKsyFgoHPx0Qdw7MmzO0WVhH7ZKOetRsjqoh0B2OQlT6np5
	8xesbdxgElxQRwTCaFfyGBCoy2VIqnGs7pdEh7cr1HfvY5IFlylbAMFMOdZ5dpJc
	kb/Vr48Owld/N1u85HGcJSO4Xq20B9pehzsWjQ37Ggg5xn8bwmtf4O4DWEkqlpOp
	YQe+a9Eo4Pi6us6nxDW7LQRvryRf+X9PQjcTwOx2iWdIYe0l4dK9sQGS7zXLXodD
	PzWvb8BiB8bhh3d6cEkVJ9We8ZvNzAuDgkg5OH0znpsbJL4th4zdTUnS2IkOPZ6k
	qxPAow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms35bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:14:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so125348385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750456; x=1793355256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/lDJvjhBQBuyuaReRi3SarttfTu3Q6e0rLJWgeouyE=;
        b=VEwOUJU3gGpiv3uzn+M2fEohEzFvhwctaDiifteUWsIA3zFYLRQCLmvlcCSIzS6h2d
         Dojpy1phctXlDe9jsMK8PE+2U70tN8xiXsuL0sV3gMffqQZrK5sssFeMFNae+srYyAEv
         xOqIEdpWUild32XLHYoJiRWxo6ruFbxog/+5/eWuDzIAan7qMMG2I07n6MeieS4feEgi
         47qt//9LYtd1tR3j/2cplXYR5rOR6KsvXsvTfbwTpkUJylmH2IVzH1s6scP/F2y99WNL
         BmjGgIvGT4S3mWpsxqxG38J3NEixe7olMCB2NKJnUIWAk6J+2O4r6G8gpvxGKytZy1Vd
         bJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750456; x=1793355256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/lDJvjhBQBuyuaReRi3SarttfTu3Q6e0rLJWgeouyE=;
        b=zjH6uirBNK6SXVoqdmNBds+n+wHQAX+cjIHM3VKm20oNwoMmLXm6AIdlxQh2EgQi10
         SQsPBiulllBmoFnTO3zEVuglMG0yl+0E2ETDyL2wL/BOa8lZdbigY51ZHO288Lgh4xsk
         5YdWkJWi8npjoLqG0LnIQMRTvH8xY5xqIZjZdK84fQ/3VqHdY2aC+QpvVr7mcv5RsB4A
         J2L5qqi9tz6eIKtzO9jZDoqgiYSYRYZTvx8oFo4qlqKdW88cSnVik9PccieW3KrXVErp
         FEPemh9ujuJgGltkLBW3E87xYh1JhE6ktmxHsIs0srC+DZ6WVRQZPcEZgXkHYi5uN+5o
         Gmkg==
X-Forwarded-Encrypted: i=1; AKwUvBz/OZ9zBKaKUDEN7JlFL/mKbKPblyqkH/Wpq8Apif8GZXlnJ5nIWllLjGCNwIR/vzgF+vuwlTcZJfqsKwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1Y5g6TJBGPhfiRmOQKkuld+h35nHB7aQjStx73QKMVQLAYsBg
	OI4z8rqscSTiN9CB3a0CLVD0TRLr79FoOhJwq6noX734uFX4Z+Y6NQeNBwjslX9OA9h3dwSGxWV
	VX5GNyrvgxCi0IIO/p3TkFF7dAJ/Wi/r7xpM2xjOXRDhSArfaCxp6EWF32fJiZFscM/A=
X-Gm-Gg: AYBFou1nPQpq6d8VUwrYa+tzHtfCBjoo9x/shztbRUffCNnZOXqaGUSLl0O1G/qXsKz
	7BcrL09A9JDr7ry6gSTvwnHr3vn3PS3BlWUTK1iNcjgdIn+n8CHHnXfapTyg9zITl7p7jVtNrQQ
	UTRdOLItvSpkyycsNPJ2bKOz00jjJ+HzK/FQkYkmuFD5vdu9d+KxjTdip4s0Hu3L2tsCG5bJ6W2
	yg7V6T3Lb12rBZ3xaHuBDSg8ECnQiSW6HI2A+KcZSXb8rMWdcv6Qxy+hyPJIadZaTRhIklkRcx4
	+nDqkFw/TBA2JpgmGBhf56Ms+grO3wT/RDt2hgUD7izxFUMCakUSdOzB9fnUDczlYusezwpWqt9
	At9k4snoZ8QBR4pmBJhSHw+MTTYBz
X-Received: by 2002:a05:620a:284a:b0:939:6de6:9518 with SMTP id af79cd13be357-93f6f972914mr327955185a.47.1792750455191;
        Fri, 23 Oct 2026 03:14:15 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:939:6de6:9518 with SMTP id af79cd13be357-93f6f972914mr327952585a.47.1792750454685;
        Fri, 23 Oct 2026 03:14:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025da3sm4397734f8f.19.2026.10.23.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:14:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:14:03 +0200
Subject: [PATCH v2 1/3] driver core: provide a test-and-clear device flag
 accessor
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
Message-Id: <20261023-swnode-dev-notify-balance-v2-1-948d920a79f6@oss.qualcomm.com>
References: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
In-Reply-To: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=z4Jc1b12fs1aifGCYeI0BXhsdZ7Li/X0waRYIl2iCrc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2zNyS0nR6r/NdXwiQFTkQHidfD6CLufh/QrMX
 B2eqAWLpr6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatszcgAKCRAFnS7L/zaE
 w2HSD/9Ovh2uv/UTJT8dwylA1DdD/J+L+gyMRIpMw5NbEgVO1ppcv47lZ85VJPS11yB21GSYUru
 MAC33BJT7VZSOWBkkgbQi55NNrev9csl5CXDD3CBowBx9d59FfGhHGmwOxoDVEnxZ43NMjW7mz+
 6irUMK7glppjTS+AJiIiAyhDGsVAKGMHAL1lWldTrO4qd/IyHZMHnnNIKQcMRahlf+ra7EyBVBh
 /77PWAmTEyzql+re9iW6iRu9aVKAgSQFT1n47B9bXS3dMxDn5iN3C8KKw05Gf+K0/z4OVG2KX5v
 d3RHLAVYnGoXnteqaUy3AXmevJ8HPpO97Qp/xRAvRJs6hP4J3krTWRaK0y7JJVhTKlDf4gWhiry
 EtvJn9Lvv5EyFb6Vqg/i7wooIL9hs6q05mMh8hy7WbCa+H0hQLRnyZ4bAONQnObQKVryL0SB0Id
 mmq0vFUDbfHgjtpLRMbTYAThU9Ihh5NNDjypsbCjI/KJaFBK5tpc1/JLKnuYCjz+UFkPfD3baKU
 /6qZSEhe9sWDvYOrCApN2E8oyivZQolcli2oYKSkKCFR+hdXIz6TVvUEz7rqYOQUQTHt5vNusye
 dtIU+VCzGWETt+YmozzMCrpERZlPwgUDFJbiovfp3kISVcOabdw7hTPt6LhhLcDqA48R2rNzJNI
 iTNur4J6kJ+8Fng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX1oKeJ/O7G3sh
 nmg8cix2zlaBaZRrI1EbjzPeAH5HRPRBHGUSOnv5InQ5jblfSrrYXmro+K4Fzj15dFONhuqkcBX
 2R//+7JycyWSyFRC8zYUQSmgB2Namvawv1ofTUxfeoBrhUL7lg2S/BYHdX1ogZ3J6E0qTIJwJaS
 yCzI26OCg1zEtXSsVO6QL9vGpUb+xA89Sw8Xh7kiFCq+NLUZ5YKh1ryRwlbLZORN5QYOBqoSNX7
 qYviI91g7Uf2SFGnfXC+QRtZrZxMqsotAmypdNCmzUB58J14ABD2rTloww6ar3/nYSmXhcG9Xhv
 TORfHNN5sbTeWOevTDpyqByDfkYEL/R0VH+a7dxGOLx8T17TfyNkfbXCqapL5FhRbAKkajCPgwm
 13kfLvvpMh6erPFGnbZymefgk8AVC3Gn+P5cSvgSTKWlG09q0RN/LYHvuHSP/xzk9J2W232qS7J
 MRVxy4ehKXbxjPKdtnQ==
X-Proofpoint-GUID: q5KtmprHsJOiIfMZ2L5crsWTvW8wUDS0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX2tx23ATvdiwy
 rQKzIScgMmNKO+C7NZaTSl8Ido2+K1Nvip+or5E6MyqsQjx9xxzCfkgFvXipjmudxyNgra7OuvV
 SD9NNV6yO6UspOhy8L14vCq3/9Ks31Q=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb3378 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0Wdk4a6BYWEShyIiZzoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: q5KtmprHsJOiIfMZ2L5crsWTvW8wUDS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230039

Extend the device flag accessors with a test-and-clear operation.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/device.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 429e39f647cf907d2a9868878d1f89526345c3cd..f31fd62dca9a89c1c9ad565b1cd673b71b740faf 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -822,6 +822,10 @@ static inline void dev_assign_##accessor_name(struct device *dev, bool value) \
 static inline bool dev_test_and_set_##accessor_name(struct device *dev) \
 { \
 	return test_and_set_bit(flag_name, dev->flags); \
+} \
+static inline bool dev_test_and_clear_##accessor_name(struct device *dev) \
+{ \
+	return test_and_clear_bit(flag_name, dev->flags); \
 }
 
 __create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);

-- 
2.47.3

