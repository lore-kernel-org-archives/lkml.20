Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283193;
	b=AeW+UVJ8kOACxFJstXeN91PMWUr0qp01F8885youKn9LWVZ9+oPGN+scAz3af22FVM1A
	 3Gk5YE/v2pNaT1fMPRZtFGfJcLv09zc1kponbBevZfVCi4quAZOHp/KAUxQAN2ldzePPF
	 zIIG180bvGC2RriMcBR7n4C+ZHDtDHo1/OTZoJh8lS4+omuJkPP1VuF9oftbj16X0OV9o
	 WYjmI5MKYtO+7WJkWMPALskXXSFH8uel4sezgerx9wTAGMl4JRDcSzwNrreD9YOMU1fII
	 S3TE5rcvFXwgjZhpEFKVGbd35P1ZToWxdHhA1RjIJdFdWY0sOLoeN9eDhFfh2CDx1tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:In-Reply-To:References;
	bh=/xFKafHDsYELV/yo3mc1RPbd6e33UmkEhLPepVBsz6w=;
	b=1FcOXY5qR1yCJ53VEaVk9RvTiMdqN4wPXi8NKFzGw42+/1MqsceTwsJQQSyICHBRoi7k
	 fFT/DVfx54ym6qVz6Geh2516n/+JP2QN6zfzTPxJtgv8dE3alYqvXJ0NjUv6u9zrdZe6J
	 0NotAMYry6JM0L0Xg3BsqSmZif2cB4HVaJE7ySqtrThUjxG9q5pH1sNUE+kUx4mbLQDhH
	 liOGw62SDjD28enQFzXDWk0LynLbG/MSSIKc3ja4JnFcPvTtYNWYGYsnv7wfElXfQKXjL
	 8RrO8n0TaZFKJzfAk46mkGZRXx/LAVj8VFvRBW7RtgNSa770G9ooMk/4qClc/KjUmfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRjBrmZh;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2213606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2213606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRjBrmZh
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14fc585291cso1955844c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283192; x=1793887992; darn=vger.kernel.org;
        h=references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/xFKafHDsYELV/yo3mc1RPbd6e33UmkEhLPepVBsz6w=;
        b=XRjBrmZh6F1LgOxFM1Mrmf2N4R4LkVMGUxdWWCjXaHlvkDw4dwEJu2VVNpSGx2pjjU
         7NVnUGooupEqB4vj8DHFDK/B51AvOYcvQCgLyiVrveSXlghSBh/fiMPyzsKN8KL+tC60
         qhC80/GQ4oZLuPJ47RvXq6dvWd3zndVtlm+TF8N8bz3leKaIBEVJSe5Eem0CwUQ0AUnG
         xvqf51zQ8wgQ2rRpeMUgYhPyhabA8xwKtpzoIQAQM0A8VYeSAJeE8AFChJYnokZLrmsF
         66GDIymu4NvNOZDopstIPohNeitWL4Z+/AQmid6bTVYJWKAWB62tc9+D4X51aKnvFTkA
         K+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283192; x=1793887992;
        h=references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xFKafHDsYELV/yo3mc1RPbd6e33UmkEhLPepVBsz6w=;
        b=24+58kkwpbS8G16nd/ZIkKubS0p3Hu2/mgvPmhuxRmnmkUzvTKXT/y9845edAeOiyS
         lx2zH1gHrg3xaG6yQf7Gfdk8jffQNAC8cM22pSndnJlVDSnNJEDPmCft19jBuT6a/Q4J
         bTbUDDE7X0O2l/ieDbxiqiESJ1ZWU/te/ks/ib9Qu1YOC4bAN6WUieTEBkwYUIRMgkRm
         SnWK+csnpOH6a26RE97fvpMnqGGiTw95u+zzTZvB6O0s1XXHdCEPWsImO+NzkdfH4qSV
         tvjjeErFS4nK4nTgYQsDvAzaEvW+Zvd84Ry+a+TUUvdy6WHboRymchIOhgXij/EfGVgF
         sOIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDJqtYOFN0XpQeZ1l4NtZCAvSiDQVVdcdsg3prObG+Uvg7cFqiW0bypV6hcuRxe1fHgSUVEmVD3SaKxPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrztWwOTjPsB0y29IkHgEJh5oilckaxctB7zqt0Hao/4i5IpgQ
	cVu7ucjtNx1x+fYkWbQNGti03i1jl/b0T+gSV7B9KygCUEaC8k9nAsnM
X-Gm-Gg: AYBFou0GN/XqwcDDP7L3nGvHLQpaf9EHJKq87FSXGmnLchlbZHZ2UJdHxuE9jeMW6CL
	KOstOAfu21hi3Hc6NF+1jvCV+vvQc6epKCwlWF+xNJVz/m/eFLm7Y+WDeKg5f5f9TDs4goVjDJq
	HR+6ADzeJ2YsCt7KOzni1I8/zzWnwqvWw9QwDSwM3zUXURqrO3FkWBjDXvSuluqqstbteaPwMAq
	X9TnRW/eRLZ1phgUbHYql2UeHNFp2ZVeHIzN4AQA0rL3dGaSfNd7B0nA04MruZJVUP5EE+lLtUt
	NT9fdrVEScvyDdUWibUlYb5pFnbMXLqSrDXMG02zyXIhRT27JewfhtUNzbQIzU/IkV7A8eVMxc1
	Y6opfcX/DRkZg+1gotHZdesW1A9bYTS8b1XO8x2DtcfGzqx6m4fkxJG3CUycFPonISle4mzF30n
	4opYuY7DLbehbAPrA0p+Uh3rj7Y/1dA96uF1ClwBYaYR6rf4kB1zDO0JT2Uo9K5jBSna2H0IaH+
	LF1q5cMBFaoueqMi38dhYTjVhTAEeJFR633SgEwEAhojR6tOGAxegdxubX/tBLrAyp4qxdCqazo
	/KX+RlByQdqj1Spy2RQ7OSKNFYl/gyRQa9T5DQA4ZKhLpXdGKdS+Lw==
X-Received: by 2002:a05:7022:4390:b0:14d:ef19:246f with SMTP id a92af1059eb24-1a6d00d1754mr9997725c88.45.1793283190582;
        Thu, 29 Oct 2026 07:13:10 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:13:09 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To:
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] usbip: clear actual_length after a failed receive
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314074.648427.388274461758949120@gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <179328314073.648427.8311262845412746237@gmail.com>
References: <179328314073.648427.8311262845412746237@gmail.com>

vhci_recv_ret_submit() receives the transfer buffer for an IN URB.  When
usbip_recv_xbuff() fails, it sets urb->status to -EPROTO and gives the URB
back, but leaves urb->actual_length at the value supplied by the usbip
peer.  A malicious peer can set actual_length larger than
transfer_buffer_length; usbfs then copies that many bytes from the
kmalloc(transfer_buffer_length) buffer to userspace:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x79/0xb0
  Read of size 88 at addr ...
  copy_urb_data_to_user+0x36f/0x480

Clear actual_length on the failure path so the failed URB never carries a
peer-controlled length.  The URB is completed with -EPROTO and userspace
observes a zero-length, failed transfer.

Fixes: aabb5b833872 ("usbip: Fix error path of vhci_recv_ret_submit()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 drivers/usb/usbip/vhci_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c..741107a 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -79,6 +79,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 	/* recv transfer buffer */
 	if (usbip_recv_xbuff(ud, urb) < 0) {
 		urb->status = -EPROTO;
+		urb->actual_length = 0;
 		goto error;
 	}
 
-- 
2.34.1

