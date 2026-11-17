Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916765;
	b=yFvhz4ciCJaklGjh92ZM+fDWpKf4IRCQcv1SYkrU0r7Wjbf1cW5GdpmZVFJAobbBJcFr
	 sjXnP71mZDXQLaEw4MJqYG6yr6cj4SCKMoepBfQDpUZXRlA5VAWhuY8vacdBN7kVJGYyv
	 feGgTLg4ZRVlvuw9mwtrMFPuPqrxoZpWGN8SZuwr6e+1Wf6lX43zgLeb3lt323UkChvmZ
	 iD1TsqlU+fogSTxYceLMfGYM+I2xVdBFrrmQwJvBsr/7h61nj4R4Y/Vyl6yKcBrMl4Av4
	 56YgTyRHrvrl9+m5lluPcX0MxXeO4q6q3YaWS7ULJZ4goT2JYJIYNvxA+BF1wXKS1BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=iaGZac72ngwyW3fTYQJ6bAa7np/wzLV4ElV8BZ9GlJg=;
	b=edxLoc7VVgAlKejjMsy/JD4YkniWD7UNhFgPUjwEchoj7YgQ18hnf1pLxbrc3+j3Po/9
	 fbzIjwmKkw3tA7kMXy0uVNvBumvXV7xb2Qgt6ebVuzJqMQDJNLlRtQjnox4TPCIbPPXgH
	 xBRVYG2HTbyIr31MzpSYVgg2ckXOxwM3S7nsLRaQhzy/sJj3pKJM+KQ4OUJy+IBtJCgzS
	 P6ynHTMMwkDfY3G+IOkkg2EMIJo+aTvyugFjOp/SNqg6fL4VYhIonLaxkGyKTL+cXZsdh
	 FkkLbbK5hja2aPG300Rnx+t01YwOA/ypK2Wk82Z1F8L+/VzHPBtB4H2qq0Sfrr0msDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m7/bNNkN";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C86606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C86606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m7/bNNkN
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so555547a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916763; x=1795521563; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iaGZac72ngwyW3fTYQJ6bAa7np/wzLV4ElV8BZ9GlJg=;
        b=m7/bNNkN37lhLAiRfJ2ZvbBUEfrPSDo4LibL42uKqDfLLMFG6EJUhpGyTHhv5YjWoD
         AWGZDyo9KkAU8WznfA4xa8tRCyHp8POA6PcnuNivpnMW4DzLtt9YS6ZWqLfzOAKVTpTH
         yKAmzRHqBGb+bAQC7Rhr372d+yJegNVKr4k5xNPz6r5F068cRw8aruKJ1sZik35PBrBu
         CjsjBYhRSh2/4eX+Pf2if4S91oYswQjIyWsn+mMI50oS82ECNxahK7ExHDvAsECeHnIL
         hwLGv+UiI7zE2MSSdEe1gblCKbXxS3Frdr+YBpjvcupLE3jHojYSq/5CJw5qhD78Jrgq
         f4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916763; x=1795521563;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iaGZac72ngwyW3fTYQJ6bAa7np/wzLV4ElV8BZ9GlJg=;
        b=YeCmomUjbkAozTO8BwRkIX6P/N0ucPEqUdBelEl0N4sjLN2JOEzaPYR0wclSBin7Eg
         CZh0yC0QMK2nSS27bdABo+K3GBUWrpUl2w6egiJkzL8bCE64jh0xYZdcvhHEY8d67LF2
         uLcMLOLFmq4isVPe1JDXO3O4Rx30WFIGpeXHl/cjaFdAjbVwUROQcAEjegHoQ20w2REF
         Qc9VdVquGVOTdxwan9+zgbLMKXebGnzFlNy6ZcFtWOjsWewLdzK2vZbJzyesP0SVKPpT
         CFB+2vS+UIBlg6naRcY5yahftwudsZ36ZxPvcjT7Vkdopk6Pgl3jmWB/ob5N4GvaZmsl
         VS3A==
X-Forwarded-Encrypted: i=1; AL+hErFRsxH5WZmYFWJx8sn7A88Clc+rSSUipUwELpTr2bxK8cYWj2eKWuOIiQzSQ0EFFImZ8thkCE6L7g3T7SE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8drVx8IWw4kXo6O3gMZuQd3TMPVgaOJlvkyEuwWC96d3dzLi4
	Dx73s0Ah0dkYS7VJ/QdQ5qLiOk5tNL7UjKCvx8sYRHCuNF6AKdATo4iB
X-Gm-Gg: AYBFou3oJigxHWvNyNcVnsBhK8mWjyK8Bo4eFNhFac2TKofRl9sJDLAorSXNFSPciD3
	/atk0SSScEs0cR4J3n6o+zpfXsUJkff5s6v/Cy6N584HeTA4H+x35/k2zmaShQ2XtgliYvFrRQd
	9grdE91QRvAk4lNbTDnlBBkGVvBwT5jqVlEC3XWwU6mjDqPWs99Db+GZGWd0GuscNFAp1TOVQ+x
	tZJUZ3UQp/POkU9aM4PWlb5bgGZmvPBlOzShdTcnveWm9eybUi0Smqcetvy3ictIcUD7nF4Puzs
	0nIudAN6f10S4h+wJHw3V+i0aP6oLo4trRV+Ax02CsV3C6A5BAnGxf7+HeqbQrkvJev1P0nCAa0
	gs24hcCX2fxUmEfEQ5rI9N7rVbjvYUN7K/2NVRORn5ex18fH+8WNgbj8QmItUm28/C/aKiESbYa
	zjhTeJrPsSNKTiDLNpTF/ltxZ8KwsLa7UleKIPXkf+ahgO6lGrRJuv1AKDsef9S/MK2bew0St69
	yQ4HsDygMdXKjNj0bDYex4Jl2mqU7jpTM5JMeaNie6SYMlzQP3zrJaZj5crYJcZa9WpUvwmtAyU
	//LN34zqG6iWMeqiJmNV0cIzbUpbQxLexwDpGSpyAzbqi8iY/O3wkusd
X-Received: by 2002:a17:906:7c49:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c509641047amr851923366b.40.1794916763301;
        Tue, 17 Nov 2026 03:59:23 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5abf3sm523867866b.12.2026.11.17.03.59.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2026 03:59:22 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v2 3/8] char: xillybus: Return error in fops read method handler
Date: Tue, 17 Nov 2026 12:58:57 +0100
Message-Id: <20261117115902.41359-4-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261117115902.41359-1-eli.billauer@gmail.com>
References: <20261117115902.41359-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Be sure to return an error status from the driver's read fops method when
the USB device is unplugged or a hardware error occurs, and all available
data has been delivered.

Before this patch, the return value was zero in this case, meaning EOF,
which didn't expose the reason for ending the data stream.

The existing memory barrier smp_rmb(), together with the assignment of
xdev->error in report_io_error() with a spinlock taken, ensure that
xdev->error has its updated value when the hereby corrected assignment
takes place.

Fixes: a53d1202aef1 ("char: xillybus: Add driver for XillyUSB (Xillybus variant for USB)")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillyusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 16d6101d9269..1aa8e7303ad1 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1541,7 +1541,7 @@ static ssize_t xillyusb_read(struct file *filp, char __user *userbuf,
 			if (READ_ONCE(fifo->fill))
 				continue;
 
-			rc = 0;
+			rc = xdev->error; /* Usually zero, meaning EOF */
 			break;
 		}
 
-- 
2.17.1

