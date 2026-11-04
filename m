Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806624;
	b=3Qo65yjmJGD8AI2DclC700qTMcmLUQPyMa7Vtp7rMBCoTHsVw+dcA4trEHL2npwUVagr
	 2x/tW8GqhhyJ039f9aMdnRa1z8OsdOU8zxcHZsBpDDxf5vb/NaBGCUhu7Ec0wTHCU9SXk
	 VLtDFu86BOjukOG3NvzJvzRQrGjzgtkbuRnf6X3bsXKzuSHp2tb3pu7LvwUKA0KsDYe8m
	 di5qp5U6ohY2gk0ocwo5vwbJoTLJd0XlagTWKQw/4X5IlqEiy7vgmHQowXtbv1SQ+q0p6
	 1jZu4mZ+5ZLqx7RVGWFW3vcqt4TkE4RLR9qrKRrgVWGivo3y167iUisETpDJlXhAyBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qaKkZOLJT6rypFd2sX4FBnQNajzRPhE4C5UxTUP/QFw=;
	b=t29qUqo9gD76A6b1nYlH2vgX/Xl0nKfWz7PGJB6ITxDqj+DyvstkfIDgd4/euMSGkedv
	 3Y5p3RhEyDPgaLO8ozCurmkgVIChtUrVi9Kb1R7QBaUGDG960zSCBNu6PM+l9O/NO9Zez
	 y7gVmtXuyhOMIaSD/ZgDsF89Yk3vsMiP+ZYAodDqFc9CRuQVUK9fSytxs5BDIYrHmVBVO
	 VBrDkqls2TwOZCFl2Hmq1WCvGoc8I9WvMdICZVGKBB7gWVGVPB9bMVvXvu4CbDfWZH7Cr
	 vQd5pvmrRhF9BAE6TDdm9CN4FbVvzkwu/LAE3gECA6/5I/h/kzkLruqzWRUVyzxeMEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNd6UMoM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=knr6WHXT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB15606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB15606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNd6UMoM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=knr6WHXT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtHV119358
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 15:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qaKkZOLJT6rypFd2sX4FBn
	QNajzRPhE4C5UxTUP/QFw=; b=SNd6UMoMqmvr/CP7iQCyVCk6LSGAoORn7R2Nac
	y5Ma7d1tBYmLSheG6FjNLcZ6JNMFgKSv2CxFujtYmKUsp7zDtlswsUlLtju7k0eZ
	HZ6caqqd9KHrXqQi/PfBGalvqnu+4iCmjul8onMeMDEgkUnyUYBdsblgzLEDl+5r
	s9Om4VwGVKHuYZ4tOIQWbRDSqEU4YL0nDFWKGWQhnEHaPuDjQ91gN/1mhAKXstCa
	RnCA8YlXkEbregjKDf8D77VzBxgVJN8S5usaLm8AqEdWJURr76cduuWYzuIvRVlA
	VQVL5rj+BioH6I0pivUMm2cIJ3zsPhn7zk5L67eTQnpPqauw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0ap35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:37:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf634a101fso719137137.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806622; x=1794411422; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qaKkZOLJT6rypFd2sX4FBnQNajzRPhE4C5UxTUP/QFw=;
        b=knr6WHXTZbGcoLt+KCZmiBHx1w8LZhVWCZ6fJBkLcuBHEK5C1DWMHDMfW09aJ5mW8J
         /jzDAgqcW/HcjEtFK7QrGlW1Yz3n8yVDJ7Q+cIol94s9ShUuuKKeBPa+SJ41cTdxnm1G
         hCrI42Unnn0orog8Vv6Y6jQeY8oy90OCCWQ2qyXliu1QVHRU7p212kTEmTZJlebexSa7
         xAQQT1hT4J+NvlXnvFQ/rjExeCVsD/ffQlKOuoWgCXuFF2m6orcgjK8yuITbNFuRNfZN
         tl9OqTKw7S25zpkmGGUV1+YfPD4NljGy5lpLzcfVq5aKJUu9VBpV4eB8x4w3Woj9UiAw
         PgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806622; x=1794411422;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qaKkZOLJT6rypFd2sX4FBnQNajzRPhE4C5UxTUP/QFw=;
        b=ref28FkzPtDxcewBezFIjqEvmt2kjwUpLK3hlZQmTsA+IfLyvd5d/kdi8Jm0RMMjga
         bQuUifcJmL4cgAZC/WEl9/fttki8plOVZ0X+Ch4E9AnlYRySRO9mP6yzv1K/pHRq93Wq
         qAzHlDA1RU60wIxPHwjIpNPTi+AUyYeC65YfTp8IeIAjKjW6iPoeGPQGXldVj8ImymvV
         ZUpFqZsOSqr3rlfV2emjEKebBGWdJiZtexauxIYuvqa6ozivOcj+7/1jTmLeBPQjkU7A
         7/CX/hV1irxD2C4cuLIxPOsu/Vvce2cj75lx3etiDAAgjGMNforCessJQgFPv4f46afO
         KxNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrICDmqeTY+14MLjQc5K0qgUbRAwsCVbpg8O7Lv+rColwW6f8JzlchLDZByKe4ApqP360ApNT7DDFEBjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qctm2uX4S2F52gabWVdHGS/+Uc/kKEu2g+oT1R0u0w+w4DGL2
	7Mip2S6zWAaWUDF3HcuBkxM+EcpOleMsPdHvLE5OvrC76Ofqf6fZlW0uYgex2GfQ6ZOqOfY+CEQ
	G+KgvmdvgQ4GE9YtxbkIhEMzOlSvJ6kcy2MF+6j0x3hHEqpMDSeCHvvG42dfD6UbWxRw=
X-Gm-Gg: AYBFou33OBw7B4636D37WOFMF7QZLubufeulaSEcExImJDT1r+kvRp38pfxjyykbXOQ
	LZoQhQGTDQTX18hQ6Z5K5buP4Vyi+jSynVUQrRncJ7VT6r9al+dHRM+HlatURYtnMQca7X1jVv0
	J5TsnL9zwQSmKc5WIvW/Lmk7vyCDiqVBk3szZW8Y78IDRuWLNvf88RZFAlnpfSpcRc1lkBwJ2lv
	ybu9aEsvjzQhdDwbZNCpPcp26kxYu5WL7reaIE8r3z4MKC2c+k6zHvkIuw+2n1nsF/FBpDd8A2H
	aMU3sHwfpsD7R7xXZa6Svw+e1gWwabyzxyNJltOfbBzXCdZcTn+aOYenBu1d46ygtvOtsI/m/sm
	CCGLc7ioLH1WgLVAfiv0ZERccW2Z+ipsIZn1KvlDiRRWdE+qtb7xCLjQ+/Hg+MjgrV/FA/uqx8e
	S9Bw==
X-Received: by 2002:a05:6102:2d0e:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d072247ab2mr6925494137.1.1793806621662;
        Wed, 04 Nov 2026 07:37:01 -0800 (PST)
X-Received: by 2002:a05:6102:2d0e:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d072247ab2mr6925480137.1.1793806621215;
        Wed, 04 Nov 2026 07:37:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/5] gpiolib: improve concurrent access to the flags field
 of struct gpio_desc
Date: Wed, 04 Nov 2026 16:36:55 +0100
Message-Id: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABdR62oC/x3MMQqAMAxA0atIZgOtiqBXEYeSpjWgVhoRQby7x
 fEN/z+gnIUVxuqBzJeopL3A1hXQ4vbIKL4YGtP01poO4yEJPSthWF1UdGfahJBo6FtniYI3UOI
 jc5D7H0/z+35cD7SOaAAAAA==
X-Change-ID: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C0TsLY/WDXWzyDJzC88M19ROyZcPTlo0UPHlXxPXewg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61EaCXVyTKKnSmhQSlczgLfJ3oZRSbDR4yhex
 xcs1pRzcVWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGgAKCRAFnS7L/zaE
 w7MRD/4t0JVWEudwhEu0Y4ohvGw7dr+eNtwsG+eNqd6FpScFT74Ri15eE68uj+pRdMt8QBP/Hnt
 U4f+MV1JHzJVwlUZDPyfUzU6Ti7qO0o7cZnJniRWcFoJCXe1OdEBOJqmw0yV6DKG8NbSWNia8zK
 nCV5toEPjBRNQv9VQ6kX5jfKJ1yZqT9jU/hi8syr7AsbUXipZdW0h9KcfkEB16p2YE/+EP//cb1
 low8gHRcD+VE32QwbXu6oJltiHJa4leTBjJhShY/l0xVKuBY+F1dsre1ogMKLl8mLhBYtnm3zdT
 G/fyFSd68/D2YcD+3JEQTxPRKutXXyV/iyvhDL7P/QyWATUzpBCV3HiTz+U/qgkmO1Rs6+VjrSS
 u7C7Qe4IlHRxVtDYpAn9EYQ5paYl0BXAbl1HepWqJWna75myjYI8afJvytbzVATm16pZ9ew9Gt2
 qqWqvnJ7S2jRBNiZifnOfs8xTRGkAnmr2KTkUHnJrjxrm5We0A+/jyqqBu3bbiIy21QDsHC8BUs
 Gcm8D8vXMtnq43EU1zw069DvDGEvw63j4nJp3Fcnhbanb0+IlC+Yw6lomezqwEN2qUgV+F5lX2B
 k43Bz6PwCtIyTmr4fkoT73GbepEsFcFXt04LBAoMJBkWuw1J980gOEpM0wbkevWdcZJg9sy9ygT
 leNfqdGYTwHKAnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfXzNj7EY1pXx/H
 hD0BM+owzia15LP5LaPj7bz1atRpjybBGnU23YyyEdCZVd6F/Loficxc+pvRg/WlOiL7ngeh1lc
 Jrwd+Qe7Uw5hN8U96FZlRxI/lFhBgwI=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb511f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bXYUuKcbincyNTxPRNEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 3hqo67xOP0HY-5gJyL14osbR4gMQa_Am
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX6faeFO6M+Emm
 5kirmGMYLW6z017Dx/GNr1kTlEDEThkPrGORx3qxpiMPswCLbf3Hz3uR4q3Frr4AMPlJvVVsvNe
 AhXTZrcoo4v/3EPwmHmoqFadw5G6ljmvTv2qTJwHA+ffKlxYPBAOIjILX5xOodtf5o21FAUEV9n
 zDiEQ2RhAoyy3bvwPgTg8AJuqPhQ8q+FQ1ZACVBezLopuB93zvQIufD/9nsCR8QwhSNB70qINxr
 2/LZiV9kI4rz93NzwQRuZFk1IwWFFPhOT6ZMastSBxOfrzvOKSyUJxkRTkOMcDFRh1O6R9lafJ5
 Lkc1jXSXmgVwJLKYtnpwOVYO73HwV1o/KU3p4dozXycOv/I8rB70FuEvCQAYwq7nt/vlXUH65ZI
 G5dc3H/yOsuFvkzziBrFNsIWoR5f2nON/x8H9IBDO+51RSXBLWbB/NGtrVH1JRIO4vE/8tdQ7aN
 sJnofqNKZHDFcLilo8g==
X-Proofpoint-ORIG-GUID: 3hqo67xOP0HY-5gJyL14osbR4gMQa_Am
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040062

This is a follow-up to our discussion[1] about desc->flags and possible
races with users who don't/can't synchronize with other means.

It's an attempt to use try_cmpxchg() to update only the required flags
atomically where needed + minor fixes using atomic variants of bitops
where it makes sense.

[1] https://lore.kernel.org/all/20261015153714.GA105746@rigel/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (5):
      gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
      gpio: shared: use atomic set_bit() for descriptor flags
      gpiolib: provide gpiod_update_flags()
      gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
      gpio: cdev: don't overwrite the whole flags field when configuring lines

 drivers/gpio/gpiolib-cdev.c   | 118 +++++++++++++++++++++++-------------------
 drivers/gpio/gpiolib-shared.c |   6 +--
 drivers/gpio/gpiolib.c        |  29 +++++------
 drivers/gpio/gpiolib.h        |  21 ++++++++
 4 files changed, 103 insertions(+), 71 deletions(-)
---
base-commit: f1fa734d14164cddc063dbf2138c2feb38baab42
change-id: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

