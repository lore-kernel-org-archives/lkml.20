Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063037;
	b=M/+Fiqgjdc7/fOaUj5J7WE5uqXaWAm/Sh7OVKZeu/wnG/Eqa34MNjdmxn19onDECRZQz
	 vurMNY3Rk+shTXxHWSiMlWyKSVCDPu0aWKwirTnzcx0fIPTDs87dPdema0fUbHgoqqMD7
	 tTrj3kBQjE0dI9wF/7a87KPuACnmy78D0etrVDuQl8IYrXnNDT4LQ7kYrmFbFhWMIC27V
	 1U0ovDMq2P6J39hGBUqrPBWpLgBCpeF9yJSZEexhVzNDP0URffUzE9WKQppICdp0VPAAL
	 N8LK+QPBu2Tpc+FbT7HwSPN/CFVr4NPkl+R3DhXc0tt0nN5Jvk7g0phBoHIXk3k1Lgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wae4+lr9g9z2uadKIYhnawrpwms/uihzaKeb+1TSuHM=;
	b=Yqc5oQiquFJWmGQIkgMA/2nIYN+rS6qgu9Dy/fggmJW47fkEJ0cmONXvyhYHehOSuM+m
	 gn8El3Hrkb+Y+y4jBh0KnNFZ2hzYDUB+Dce4HV0GZqA7Gqyj7NwIMXNeQVnD3aP55XMVB
	 LyTmeB5v7WYezW6o3rPgpM57JVszV/2pP1Fwu9UcNFpA1pFvvBZAknJzNx5Z2i3iLBzN7
	 +WWw2lOU4GTXgejwpjnKedgtqievwmrTbnXnT8hUM+82/RdKP+/PoQAxx4K0/PQNfs/hl
	 luj5bxFK0OLJO6HpSjjK8YSRqQdBHy6LCoPGZaUM0XSFn9TwHZamPubjt11duwbmoKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzW1D4rp;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87773606D81A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87773606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzW1D4rp
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2492601eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794063037; x=1794667837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wae4+lr9g9z2uadKIYhnawrpwms/uihzaKeb+1TSuHM=;
        b=bzW1D4rpqqnOrb3vsNFhb5DTW95O08SqswKmvfhfySuSdgX19/bskdFL2KSEVEWUWL
         80QLoZIPdsm8fy6NKgHVevW2gUd4K6uG3HdTzLvmW96pYBPcldWbXfVtcgYMbmKL6Q7E
         dXr9hb20mwtth71Z6mU4EQ5rwkxoLkOhcoluYH0ScgXwTqSfyHxt+qYOEVI3Wk90y/GS
         a9EagFB2gSQVh2UjPSpAadsXSenYmvn+RWIj3lRSo3Y/sF/Jp/el5lG4PV9/Ghw6EZIo
         6Hz1A+hG92rC4QbYrCLHV3U/PXa7205CEMNDv0kgXb+ZV8bMD1CUADKR7d1moDCPxS28
         DBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794063037; x=1794667837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wae4+lr9g9z2uadKIYhnawrpwms/uihzaKeb+1TSuHM=;
        b=bPTqD4lAZAk7UA+VhVJspZ4UZHK/q+UW8cUg3CRPsQGW9NFxm0fAjb3sWLhb5Q9v5j
         9JGEH5kaI9Q/+eYHywGr6KB3zgyjYDeRpUCBK5tLF/TbLVu8b9II1/9r0+D0Y4L7kKo/
         5gsWyvkV/dYgOlLKyYZaIgSCodk8yPKYxMTQ8To1mM0FOL7wv33r0/RfLl8il/dLOTix
         tuCGs/bue8HZXZGIkVIgI/bdIZPEbQWA+vs2HetKRNEAZZgabrsbKxrpwfGGSSKMEt64
         resqFg5RZl8lpI7gQHRbWiWlGAldizBZZAcR0wUG6PNgXiKG9TpvDIVP4vnDDCxcNRES
         obZw==
X-Forwarded-Encrypted: i=1; AL+hErFrkiw3OoQQCUao2XfheHUmrjnm+zQFZhcpDkdXzDZfyNpgseZxsoxMfic8cK9qbopqutjYbWq718otdYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s0h7GGb3lG7y6VCk44lyHR1LBRTK8RhpoTHPCW2+gBS6b8Mlq
	YqT7fgvs9Dybm7E30KZAsli41BgagrkRtYoHMgOSB3Xsr0EXHq/6ouR32PEMZ8o9
X-Gm-Gg: AYBFou2/eEzmeK2+vASRrC4NP4D/kOuYGQFVAGBYKPOV98uf9PG4AMSmTT/8BlHJEl2
	/980HPVVnYtzfdi14OU7iANFH9OhYqjWN3010bcObCJx8sDF57fJBjtM4i8A9byZDPEFo7dRuRM
	ksyD4RDypdQTAKTAdRxjjWI98vIeDILU/jGHZ3J+mh4YS/HggGcnI8o9l8vyPmmsmbsXT/0EzHU
	wM3PU8IUAa/Ijb+cMKdab5gH4g97S6LIjudcRhlTAP2VrsXLmIHry4jFWo6SkQYFC6YrMIgCsh7
	iuDOq+E3HmmHW1D9/WJGPFv3otbEJodCp/IVOI5uFJ8MeoLmzg5xCB1bT8q713WRLl2oSfxBPTU
	dNs/S4qo8MrlC3GosgZKNjb7b8jZ2QxUy7wbzn/vW83ujdskEtSuanA6BQIAxU/CfL0hm2m9je+
	kRqM7yYUTjFJnlcfypWOmMcHioTUTEqgmWFGCnrmNdoYdrUOFNJNRukP2SbuT8dTOfgcEKUA4NX
	ZGztgd6VHoRtRx40BeHjlQPIYDX58R0fULKIqpZjCnP2kaHSzJXqNbLzwgL32NnVzgVVr8xtq4F
	CsNX2oXXHKMKJz00yM4V8kvmEBlv8OkKIQcUGjLI9lJaATv9ezbOq/CMyMlo/mcHMdONGA==
X-Received: by 2002:a05:693c:68da:b0:36c:a0d7:e4ea with SMTP id 5a478bee46e88-36f729cff49mr7699920eec.1.1794063036532;
        Sat, 07 Nov 2026 06:50:36 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm15787371eec.9.2026.11.07.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:50:36 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: sl811-hcd: delete the driver timer on stop to avoid use-after-free
Date: Sat,  7 Nov 2026 23:50:22 +0900
Message-ID: <20261107145022.3734911-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

sl811h_hub_control() and the transfer scheduler arm sl811->timer
(sl811h_timer) with mod_timer(); the timer callback dereferences the
hcd-private struct sl811 (sl811->ctrl1, sl811->lock, sl811->port1, and
register I/O via sl811).

sl811h_stop() deletes only the USB core's root-hub timer
(hcd->rh_timer); it never deletes sl811->timer, and nothing else does
either. struct sl811 lives in the HCD private area and is freed by
usb_put_hcd() after sl811h_remove() calls usb_remove_hcd(). If
sl811->timer is still pending when the controller is stopped and the
HCD is freed, sl811h_timer() runs against the freed struct sl811
(use-after-free).

Delete sl811->timer in sl811h_stop(), after the port is powered down so
it cannot be re-armed, mirroring the existing hcd->rh_timer teardown.
sl811h_timer() does not re-arm itself, so a single timer_delete_sync()
drains it.

Found by static analysis and code review; not tested on real hardware
(needs an SL811HS USB host controller).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/host/sl811-hcd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index b044977..53a0bc8 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1520,6 +1520,8 @@ sl811h_stop(struct usb_hcd *hcd)
 	spin_lock_irqsave(&sl811->lock, flags);
 	port_power(sl811, 0);
 	spin_unlock_irqrestore(&sl811->lock, flags);
+
+	timer_delete_sync(&sl811->timer);
 }
 
 static int
-- 
2.43.0

