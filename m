Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636012;
	b=e0cS3ogvVgLuGtGS3OQwzslGGEJTNYAQ0nYc2xJKgawu+uv9IxR9un9UcJV/iYqAw3lO
	 HTYOYlAjPyfCGrZAqmZObEZihWPzwYCLX2TcwB9qQF2mmveri2JJkcvuQrIO929RNJi0D
	 DjTN89p7RoXz9xIamRDR+0LyLbRpA8V/rG27Ic6YNjUJYL2Z0YpxlLUrEYTLMgHln1FXO
	 8VTHy6B8cQM499j3puquBLiYBF+n/oz+YHqaUGxrYmG1W92XECbd+LEW68WksdumcVD7D
	 sQXdDyu5bpYETmBK5M+/dmuGWVh5tNQnXsy+Yw0hzp36IyyRF6qnreQ5wJrDWj4OlvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=E5f69N1afNwnZIbIaExQBEbVt7VaM+P2Su75ERCUnMk=;
	b=huhOOBQWyKsuWX3ZHm0614VFZqA3g5jxzlzef2JwUS7QW4QKyfNiSaTLtb5sPoDzRA90
	 6eMlFII5KD9pR60RePqb/R+rfBPZ/G+MsiUXyjOsSD4ZEDeHQcoMUCykiWt8Y5PLJNuyx
	 pGtMFjzUl4HlWuWtj22OPpEZ0+3kXI6Nt5yzHs3sn+9EshHCnywCtsfLgg2cMjvE9jDOp
	 L7+Qulkvi/BOqzPuyUXwKNBuZ1EPbUCgcnSxg+rYyzSsloFHro0t1fWPQEM3v70gU4wN6
	 eAbrcC22YcAUK3JVIoeBdILXiYPrQrjZO3L441m1iqt6SYRfMUVQaexH/7QWBA5JNiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ncv6SjoU;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1E460A261F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1E460A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ncv6SjoU
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3791619605cso3502062eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636010; x=1795240810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E5f69N1afNwnZIbIaExQBEbVt7VaM+P2Su75ERCUnMk=;
        b=ncv6SjoUxDlbxsBnSYYXSk60WhpJ0DfxQ2wQE/BSwhPivcpr1UrEp7n/voQVMccGeU
         hW9fCkvcW4VoBqwLx1Q0fTScheRBw18CUY09XrD/DV0EMZb2jvKeRIKFUOBXNgeZQPPz
         7GCOIcX6Cl4JBhdWKhZACF47kfiJtK23u0j6oMaZuWS6IZVRhSEXVPIJSc+kmiF1tv+T
         rqtvOxlS+bTI6f99F5vPkcN+Gghf/ovnKY7q1a1eI5AoqcKMwREsW8DjR7c2rmaVU+8A
         9wT9bsUILLDgsPK1GIp9Gkvq11WL/yKcvvMYyMVdqOSGQArticrOYeM42E2s36PvnybY
         W+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636010; x=1795240810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5f69N1afNwnZIbIaExQBEbVt7VaM+P2Su75ERCUnMk=;
        b=2SnpgbsyP2m1UH7DuLZ2ENHSc6SkflFmKmZ5lJIptTgoSr5B6owHzM6PRZjiIFaSoL
         1QV4bmtnKE1EAi8+/kPy0Vf2hzGJWJvxE6Zr0ICVshe7o5ChbZyBR4HfQyMfphbMXrNj
         1DNG+dPfUzfbadbsDtAXhg5tV7kbG0SSVfILfsKISZVTs16TGQpISw5FmTbNh4VqsfJH
         vHbwv/VePaY8vguVEG1a1jdhHxSrcwa0+cm7ty7OPmiLkgMC3xz6cG/jG9k8ybu3I/Td
         wtSj0sOAVWAXgdPkX55FcTIbzgkEMTOCQvrvuhjyA7q2ONgJU/auqiNbkm20cwNCPKzm
         mK7A==
X-Forwarded-Encrypted: i=1; AL+hErGAkp2WlGRlkbjpnSBKpK4XPNpTbuG+RerFrjXYGaEzZAKvF6RIv9xTeFMYv4JJ+flmHDU2quZcgGVj2Qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UL2DXnaMhQfcOsPqCm6BWOCBuJRjAf/Pz7avldwZLP/35tZ7w
	saVIqczDow+siIzjZFTMFTjAJtuWshKXreGR8eFnx3mOKUXXN//o1wgC
X-Gm-Gg: AYBFou3RUQjbKNivQ4rbgeL4k3lgwPwJUwyjvTZh38TuSCxtG4Ax2ZGPm09gDKtWQtM
	vd/D3vkol7AFp03OrSU21OzjvI3SIitwcKuRppPhRKRgsmESLRjVTuMwFYNsbrHM9xdjxO6GRn/
	so079USNNN77yemvmz+xHcU31jvRDPyMa+XCjcZkg9ztwj1bVF/b70lsRSMnOGibEmxVPxdY8OG
	3ZXdi9kogiHMJB7TjxuRgXECZoh7OVV6zjZ7fbYQrVl6IYk9+XG4F12SdbZmlzMtzyFl32zvmY5
	dJIOCw9Sks7PsWnmthf5FIetNh6RmeRlEuzNjAQOV28XijhjorK7LH65VC6DQECcvww2wrc6Iyv
	spXM8XlSZXOXNV6puggmdSeplg66vK4ERAGD6Qga+ntFPlTZrabqp1oz4HJ+88onUgaSbwuyvh4
	P7W7cu0k26/GVUC64LRFuQIaMpnPHX7/lPLYlTd+qTo3B+JDqWOKSepvBCps4QhimuV+ei1WKpu
	07Q248W/CTyhqls6PeKkJlFevRivnHrxYukizfBLeOukC79oU3AJgogVlOPa8kch9jBHovB06g2
	ktUgQoZBTa0/BwltqkTS0+rZ0yv/MApeyLM2bCSThXyPvR5VwdmFtwkM5Z/+YhMbIyZ8ce+j2lt
	cbPxMVeHSnfAI0KQV
X-Received: by 2002:a05:7023:a4b:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b503115c0fmr4167409c88.29.1794636010082;
        Fri, 13 Nov 2026 22:00:10 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:09 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 21:59:56 -0800
Subject: [PATCH 06/12] HID: rmi: avoid GFP_ATOMIC allocation with hard IRQs
 disabled
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
Message-Id: <20261113-hid-rmi-v1-6-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Storing incoming attention data allocates memory with GFP_ATOMIC while
hard interrupts are disabled, triggering sleeping lock warnings on
real-time configurations.

Stage attention data before disabling interrupts and use the safe
generic interrupt handler helper.

Fixes: 0b2c7a897378 ("HID: rmi: Make hid-rmi a transport driver for synaptics-rmi4")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index d3e4ee0f62f0..a4406bc6af43 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -362,7 +362,6 @@ static int rmi_input_event(struct hid_device *hdev, u8 *data, int size)
 {
 	struct rmi_data *hdata = hid_get_drvdata(hdev);
 	struct rmi_device *rmi_dev = hdata->xport.rmi_dev;
-	unsigned long flags;
 
 	if (!(test_bit(RMI_STARTED, &hdata->flags)))
 		return 0;
@@ -373,13 +372,9 @@ static int rmi_input_event(struct hid_device *hdev, u8 *data, int size)
 
 	pm_wakeup_event(hdev->dev.parent, 0);
 
-	local_irq_save(flags);
-
 	rmi_set_attn_data(rmi_dev, data[1], &data[2], size - 2);
 
-	generic_handle_irq(hdata->rmi_irq);
-
-	local_irq_restore(flags);
+	generic_handle_irq_safe(hdata->rmi_irq);
 
 	return 1;
 }

-- 
2.56.0.679.gc527c65306-goog

