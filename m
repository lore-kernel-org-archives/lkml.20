Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360942;
	b=fc+QOMf6pxkQYdXNDnQIH1LgNRub4YYims2rfPw6miIMNlXV7xrs+84qykpVPJ3rgUHX
	 uJzo5uhqlgpWqntM/aT+Rx6Sob69lUceCCydoAvusSommEtoPRvcxV2kV5aphzk+ym4rD
	 kDrUdFqJPm3cliSNYs3P9nJ03SIcfwhW41CtOGZPvJ52T9ZIzgHDYXcSZtErfBntrFDLr
	 5qtO3E8rXiJ73huWBccRYIwPWLW62EfcubDtkGijsZL0sF7HgOj3lYN4vmo7unzjX+ITn
	 KR+QQKjguyLUabZKcqeXhtKPuaT3hcbLOnb8yIAhNnQ39IY+qvN2odOebSyayEZdRxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pfQqYpokmZVzyF+aracTrgq2mm2QsLoqIsns9BsxbLs=;
	b=N6PGEp9SUwSH18GOqlG+HtZVzCGEWeCwHbssF9VG+zpMiigx7sHSMCFS2bejyqQZuT7W
	 nJIU3cj3t85k2Y/csgjw5rSxREHm+3couMaTnAUTe7ZsLwaI1jNmbwCMQQ7Av/tGVJG0J
	 nhuOWJXbcwxiWz4J80n1Pkhe6EJu/lWkst6Ur0HTneafllQXuSuhJ+Cyu0b9Np+l4pojr
	 uLo1gxG1eTWWhlK9ZbIG6Aaa8sRSvbEsTtTYjgzRtq07WN9OKJ/Lx14YDtiwxm4RMubi2
	 SOJ3vb3/as9ee/9EUefTtU/ZxfbH4dpETxgsvI/qFuFbaGxEjslBDRUvr+6DTxgVi2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=Bx+xqW+D;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0225606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0225606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=Bx+xqW+D
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so4598124c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1794360941; x=1794965741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfQqYpokmZVzyF+aracTrgq2mm2QsLoqIsns9BsxbLs=;
        b=Bx+xqW+DV9goEpGGY/QAN0sUO8vxR2YZAfom2OG6TW9RgB6WMH5OunJGSLrsDWpWSa
         m20S6DoegeayR1BMrWO9L6DcrlUtGBpoATX4Q6C4xa2YFTzkVWcdWjI5dViI2bcu1aQi
         9mqL1FNImrGZ2sXzF/uXwUBiBHa9gMHCAEFd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360941; x=1794965741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pfQqYpokmZVzyF+aracTrgq2mm2QsLoqIsns9BsxbLs=;
        b=CyGHRfoomwNyQ0EGno05W8co+CXKDvi1IhK8v82JP2n3uQablMz2f9G0kyR8rzYp8j
         jFKTOffyB5RBYuckzSrZ4IAVSHJXoxEbZ/+OvxUXMYggVu36aoW/DmRjQy7CVodGQ/z2
         qmLk971wUQ+O2UXSZg1+FH3EK0a7H05LGdyKYFT/PKSYUEso7VGWvBBJoparcwkphx4k
         zm8EehTEmy16utXR6K1nwign6aYLxRL3SEjmAj33wl6RMoNRjwxmNvf7BJX+a8iqEv/D
         I7Q3jlz9TB3g4Rv9kVoaSieGPuID+0qS7wITg+GfBnq3WO50aTOWIjAMDjnqE/qpw95x
         eprg==
X-Forwarded-Encrypted: i=1; AL+hErFeloxL7DEomEq6qq72BvrkC8NEZwh5ZI6Lmnvq88ZJe8rxx8vBSf7WOsVp7enKCo3pZviAUANeSlzMSx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xwidSC9JwoT2lyFCKPI4pmy6Dj4wN7OjAszZEWdQPko0C6snp
	5D8NanzDD2d4EYVhnCfZXTIPjnELQJKqzrqQJOsI2giJz4cmp6Qr+tFwz4HyziHixzs=
X-Gm-Gg: AYBFou3CddKLLJ4EvyPDwag3Vk5lHD4Air98HqFVNZAedMoy6Btnu9yukXsGMtzEPTa
	1sQxzSViUpcuYYPbfOCjx3SsVHU5PdXWuhkoI8RSYZRHyUimQvfJKC1SlI3odLWG6DVqQUUlGBh
	gGACDT/JLR10bRXsdtov/quV4viDzQrns2HWYkZce962aZAxTXLXKL1OVSObgBcFrBVEfjQ41Op
	KbL6Adyf1b/GfoAIq0A8VcvO1XchLVW9EOiXHNvvUJoGPCD/Od/HShoI456fFTBw0BnZvMbvCwY
	3fN1z/DklirckuKZRCun2Y1QO6hd57nSSFAXu/EZRc/guXA8RTduCgUONGJTKikNqEe/PObjMLR
	26O4lw5BRCBIN+HeV1x0BcYgFkSq3s5MBylPF+s3PhVZGHUfbhtHQ4ElMwqfA7OczcqffW5NcBS
	6RV+K51PwD0P7IP7fqUv4cKXvsOhNYktDbDSeRyNAMsmhOjcfq/G59YkREoCd7SN+KStJN0ego9
	Z/xe6xI0ptCfl/C008skmvFp0tUvDJ6I7JgUHjO+AcVtE4MOZ/0/rr4b8S6dWUt8rE6ToWIp5zQ
	+hQaVismqXTgOU7Upkdg0yRCcRtuWcV72K/0q98/N88r6VFI/kUuOZ5qLw==
X-Received: by 2002:a05:7022:671e:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b3c0332a06mr1071478c88.27.1794360940616;
        Tue, 10 Nov 2026 17:35:40 -0800 (PST)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9696223c88.8.2026.11.10.17.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:35:40 -0800 (PST)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v5 2/2] net: usb: lan78xx: reject short register and statistics transfers
Date: Wed, 11 Nov 2026 09:34:54 +0800
Message-ID: <20261111013454.34542-3-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
References: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
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

lan78xx_read_reg() and lan78xx_read_stats() read from the device into
a freshly kmalloc()ed buffer, but only treat a negative return value
from usb_control_msg() as an error. A device that answers with fewer
bytes than requested leaves part or all of the buffer uninitialized,
and those bytes are then used as the register value or the counters.

Treat a short transfer as -EIO in both helpers. lan78xx_write_reg()
does not use uninitialized data, since it fills its buffer before the
transfer, but make it fail on a short transfer as well, so that all the
register helpers report a partial transfer as an error.

Found by code review with LLM assistance and reproduced with an
emulated USB device (raw-gadget + dummy_hcd).

Suggested-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---

Notes:
    This patch depends on the previous one. Without it, a failed statistics
    read would make lan78xx_update_stats() compute the counters from its
    uninitialized on-stack buffer, so the leak would move from the heap to the
    stack.

 drivers/net/usb/lan78xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 76c2d98b49df..4a58febcddcf 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -612,6 +612,9 @@ static int lan78xx_read_reg(struct lan78xx_net *dev, u32 index, u32 *data)
 			      USB_VENDOR_REQUEST_READ_REGISTER,
 			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			      0, index, buf, 4, USB_CTRL_GET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*buf))
+		ret = -EIO;
+
 	if (likely(ret >= 0)) {
 		le32_to_cpus(buf);
 		*data = *buf;
@@ -645,6 +648,9 @@ static int lan78xx_write_reg(struct lan78xx_net *dev, u32 index, u32 data)
 			      USB_VENDOR_REQUEST_WRITE_REGISTER,
 			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			      0, index, buf, 4, USB_CTRL_SET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*buf))
+		ret = -EIO;
+
 	if (unlikely(ret < 0) &&
 	    net_ratelimit()) {
 		netdev_warn(dev->net,
@@ -695,6 +701,9 @@ static int lan78xx_read_stats(struct lan78xx_net *dev,
 			      (void *)stats,
 			      sizeof(*stats),
 			      USB_CTRL_SET_TIMEOUT);
+	if (ret >= 0 && ret != sizeof(*stats))
+		ret = -EIO;
+
 	if (likely(ret >= 0)) {
 		src = (u32 *)stats;
 		dst = (u32 *)data;
-- 
2.43.0

