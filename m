Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908246;
	b=TWROUIiGkOGe/E+QCd8cKFcQzxMDTlBDCC5zwR/yhsTC6eSY1xIIQnvdm39ar+yBpHsU
	 9h5LSNqOYYqlwHD6G/TS0MyXjJP3g4PcpY8yrdBaS0vt4kOrDGc0Puoim4x61onBJyfRY
	 5GnCYEFYv5DYl6jJ7qak2uAvMr7iqM+7D7/JuXvh+w64TILRQUlGxx15WWlibYfESCXeY
	 KQjm0SioTYK/0SKSx8T+7ZbJUUsU/PmGTFuET8CATiuGELz2NYqvAZ//WFJh0rdwPKtTT
	 SeONHONz7C2D8xwVjZkJIrRSYcs785pA5fD2SmyKoXg2CClGYP8oYeCvunI/QhFni4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OFzWKIpfqvHsogWlMHgoDk6JLusnQb0ygt1RW9vKSgw=;
	b=McCtXgTLeU/1BkMDqsbAxjirOu9HQs0YOXSCxd8k3ckUxVTrPe/WvZbZUqfv4Ya+BCqX
	 ZAkyw8lqLZbaflpcHHGUFkO81RhaLRjj7IAxRJI+FJHdfaTtnkvbc2bTIJPrLlA/91b2L
	 +1T89zx9Tb/Exxsxewls0/nwAZ7k3LMKEvSfzQ80syZMYV2fwYaynGxBqR/M24/Kc9Pof
	 OuOVtVj8tUmZpjX9yrsm3lGAWHGIFT4VYwidtPUbXlzmpqYrqisqk6yAqFpY65RQLXx1X
	 KKhHeJ09X/jHDLyCUoBTNoAN3/QL6O01fTIcXF1Ovfzh/cwaW5oScLRr6EGPKzbxxsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ket+7AUd;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A40606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A40606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ket+7AUd
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so2109366b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908245; x=1795513045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFzWKIpfqvHsogWlMHgoDk6JLusnQb0ygt1RW9vKSgw=;
        b=Ket+7AUdfnXGpxqEyOMcN0ibsbMUl850mzNv13fsw9jkNT0qV7qFKg6L+QznPksHGO
         EgzcFuXKWMQcE0zBKXbpjyYBZ/uNetOVouaWgJQdv610bFV2MWf1Yj0+sYdjY/FkvRZo
         D/jOQLl69uvTKIJtD4Sha4Rqv2yYrRo6oK9BOUXC9weEShuQqYGO7JveBntb5vd55VTF
         dFhh53mkuhhktS0ax9hMNl/Dr8kgOWm1SFGkOXBmbdtG/n4pxVyvIgI+maFQhTlclUq/
         rGDyc6SRSeLRc2082Hvgr2b8z3ix1qcKjdkARPKHfTzr2B6U67r1KY8cX504LQVo7EkL
         CoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908245; x=1795513045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFzWKIpfqvHsogWlMHgoDk6JLusnQb0ygt1RW9vKSgw=;
        b=1PGDg9D7WRv8bUceWf37l/hempyKJlJqhnNADn6cEDdh9BsKAqaJbzE2R3qGV0YS9D
         Nn29vvU2eTp0ExDALZjFPXR2N7p7cp6JbizKBMl9dlGFjQbP8KOHcmgtNRCWGo7OYhcN
         vBAeQ012cXrHrL6cOcmw3x65eWXGBpM7oezcXVoe9ErOB9bqsiWbEQ1deEpHn/sZ6jC7
         Jm4sxiwqojCPcHYTyafnxjMrsqGlLfuSe6t/02qBCwqOEvwv6APfmmoQwCBmxT6XJPxz
         KhN7RUK+ZOBuaVhueWsJ1OEm0VuxQrcY2d9YkcKDVrRaa6sv3gTwaBKj9uufe/Mz2PyF
         Y0bg==
X-Forwarded-Encrypted: i=1; AL+hErF3eQOnUTBShs6/XJIlM5XAdH8DwmlVg2cZAY+HHU3H2Fq4cdWr9qaLfVS9jmT5/nBK2KYDvNHpEfDd0+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cv17E/5/ezzcKwTINKJBILDJxQSq8vM60Y97u+1SSoJtlSZjq
	FswQbBYc1+8ijccXhMMFy8V+YJYnyEMj1W6D6xNO4QNvkzpjLt7+ZfP70hlg1TAX
X-Gm-Gg: AYBFou3zzxiC22H8arZ/v5NVN6etg8D2G7zUcaSYAx3Z64evexAz8UJGQazI/b58ypx
	M/3VXb7z7vpphp/19DfRoQTZp/yftY8siqE/KGLjgob7+83wdcqLv6mL0Vsxs6ElIDd5WVJh0P7
	l0rWE+csdIrGsKBBZE9939O17hNPYZsxZ6yzZDycIcPimejlyHrJkZfYSQgx9B5i7SGtjvOJHiE
	7sCEsfueiN2jjWkGh1EmgLomZzstRch2XMejFgO4SpgoN+w7+xqxQab53953JzeQ4N1M3G/EvyS
	zbOiS0zEDVnVONAtRvOUjyGHPEr9r3a38Xb7sDRwkrljqjwTSRe49FAZQ2M1XmjyAB0fd8MOfQS
	t6os4gLMQLsMxOee1WZI0qTGhdzjAg+vJ+1X7h7LIp/HRTx3EOYkPWGfCBVUg5zrqIKh1rJeRAp
	uNJIyP04Q7+4CLQaxI7mDj+kIQHtrCSqIL3vgkW8oK3dqSrvuQH7IaPkdHiChIo2c4RhlKNg+EJ
	VJp0o2fArY9MQ/gBLDyOyTmGPWeCmRCi9/+8H2WNB2t0ywTJX3maj/NHiMgY7R+QCgrJVzwQIvi
	S7oevenZJa3kOp5BBjH2CORIZ+g6xHBTNOpWf1DSirT8xAb5
X-Received: by 2002:a05:6a00:1995:b0:89d:29fb:b5e7 with SMTP id d2e1a72fcca58-8beb5da5bf5mr12558126b3a.24.1794908244905;
        Tue, 17 Nov 2026 01:37:24 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2b190bfsm4804882b3a.50.2026.11.17.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:37:24 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] misc: bcm-vk: bound plane descriptors against the message buffer
Date: Tue, 17 Nov 2026 18:37:12 +0900
Message-ID: <20261117093712.185359-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In bcm_vk_write(), a VK_FID_TRANS_BUF message embeds an array of
num_planes struct _vk_data descriptors at the end of the message.  Their
start is computed as:

	data = (struct _vk_data *)&entry->to_v_msg[msg_size + 1];
	data -= num_planes;

num_planes (0..15) comes from the message cmd field and msg_size (a u8)
from the size field; both are fully controlled by user space and are only
checked with 'msg_size > to_v_blks'.  Nothing verifies that the plane
count is consistent with the message size, so a crafted message (for
example size 0 with a non-zero plane count) makes 'data' underflow below
the copied buffer.  bcm_vk_sg_alloc() then reads num_planes descriptors
from out-of-bounds memory and interprets them as DMA addresses/sizes.

Reject any message whose descriptor range does not fall entirely within
the buffer copied from user space.

Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/misc/bcm-vk/bcm_vk_msg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/misc/bcm-vk/bcm_vk_msg.c b/drivers/misc/bcm-vk/bcm_vk_msg.c
index 17114092a284..e0d57f99a569 100644
--- a/drivers/misc/bcm-vk/bcm_vk_msg.c
+++ b/drivers/misc/bcm-vk/bcm_vk_msg.c
@@ -1192,6 +1192,21 @@ ssize_t bcm_vk_write(struct file *p_file,
 		/* Now back up to the start of the pointers */
 		data -= num_planes;
 
+		/*
+		 * 'data' and the num_planes descriptors that follow must lie
+		 * within the message buffer copied from user space.  A crafted
+		 * message with a plane count inconsistent with its size (e.g.
+		 * size 0 with a non-zero plane count) makes 'data' underflow
+		 * below the buffer (or run past its end), leading to an
+		 * out-of-bounds read in bcm_vk_sg_alloc().
+		 */
+		if ((void *)data < (void *)&entry->to_v_msg[0] ||
+		    (void *)(data + num_planes) >
+		    (void *)&entry->to_v_msg[entry->to_v_blks]) {
+			rc = -EINVAL;
+			goto write_free_msgid;
+		}
+
 		/* Convert user addresses to DMA SG List */
 		rc = bcm_vk_sg_alloc(dev, entry->dma, dir, data, num_planes);
 		if (rc)
-- 
2.43.0

