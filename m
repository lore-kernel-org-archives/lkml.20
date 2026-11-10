Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285003;
	b=CVS2XqwCcohsGoWnGHKoXF4cmahKaivvXUd3R68v/6RGUB36WshLhxenj+AQ0HzGTXSc
	 D/yto7PR2c2PvdCGtlr9SW9DwD9+haZdcom+B+gKvneOGoh49IaKvSBQIqAKEF7HeL0Dj
	 kJ0bzlY7+273ulbYmuWpM1+dMHCEWZLEJkLb2AhnWI/HQj9WlBio8e/5LQBYDC8kY1drO
	 IncJw2DFkULbz5dQcBZWsnjKcLgrj7/eQpKMPrdfMYWWrXRsmUq7mXq0j/4oPN/vZUxS1
	 +hXr53UA106N3eunZuSF+N/NuaOQpWKkhQEUfODPpmViofEWDWCaS86UnMJh/eJ0TRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6C4Hx+d91lAlBeJL9YUS6/bLXYWsvtNC9yUrV7CQ+/A=;
	b=Sj5x8lCe/f+AI33sp0HXNlzNx60Dhf/iXUSFCcPc47xHDvjs8UasBAAitbPIm/3K6H9p
	 uqtjvi0JJtC5oevRlM/j7+qDB5VWkr6v3PAo64YjfNgH8QVHdThxhF3qUyx1HvVsHVW5R
	 OYdduazPagONQtolJUqDotBlBhZ5cARgAQ6vrNRMlzBG7sCK7yT65ARYswRtUvyPt0PtA
	 DoBhkjHEuTdIgcqqvQNqYliX3VGjm5ncbTWQdxT//0mQtY00vvMPvk9yRwh9iEsm1TIKo
	 lPsm44kAOYbBR4Zw/yrsrTs/u1q6fCMUmXXbXyDCLsfSe2Inn5TEZivoi7vmnbhYR/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKMimoi2;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B5606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9B5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKMimoi2
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53394bffe0fso16499831cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285001; x=1794889801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6C4Hx+d91lAlBeJL9YUS6/bLXYWsvtNC9yUrV7CQ+/A=;
        b=qKMimoi2WwX+SyhMQxEZ/A8E7WOVc4jK6OM/paMrW9cxqwQKtdUaEzopcFxUdfmjoo
         yNLSNWzb/qnzfuGpBNJvSS/7kSCxqaZZmiYJik80BFqptkdukXkK6DnKieeMGzXc9Uho
         ncHtTawsMd0nkoIbZYzF8YPxsenWvUQBoHxzoPs+fl6RaSErbHyTJJ55X6xqg6qx9fg1
         7ZJSULe3zJA5/0h55py4WiBqqLjw6hgVYXV0dOeS1N1myr/g0HxiaIAQulMcJayJiG3u
         3P82hnMrO4nYgQ6bwtIyhW+mzgAHh6Ep4TNWqd4egv+suOX/k02bJABGnTrX4d+Jb45R
         49bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285001; x=1794889801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6C4Hx+d91lAlBeJL9YUS6/bLXYWsvtNC9yUrV7CQ+/A=;
        b=IRym204tJS3BCHTbd+FcPwqO8p6798kAnRNa/ZOgXXbbalS0A3dPlmF+CiVpEXFvN+
         WQ/VYdLd9h2XAHJA2FI5FgQN0yuPgPd5HvKELMyyDWn3jzVX7D8Z3ARk1juyHVVhgU+5
         tijYW8F3Nj8AfUov1xwinHEbBU1bCVuTWiw1RQjZRRTRAR7blNpEtxBpZl21FabtxJIr
         lEJEQ94Ba8oDRyNFkzHeq51GBWQl0qu4D5go9x9yy2KEbF42+Mn/mrPybsrjgvFV/3VM
         b+cUa5TaIEpmZ9Kbb8x8E3AP0QgFM5VfehtCQqZtwYdjvcLbLfGJSL4t7HhEifMXhMLe
         w7jA==
X-Forwarded-Encrypted: i=1; AL+hErHJ1j5CeptTLTXA1tSxuC6VLLSDhSTKW0UPqMs+lF8sC7a0y05zdCwkdBWELhXFXnBbZbBjMs73iWxGukw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AXnsFDEQhKMJDnwX8RrRdZH+E2QrX83GI5eFqZFKD1fl02S68
	TEgoS8QFhyGbCPcP/O1q9SPqeKqhP0EJD9HEM9Gxo1Pn5IBweoSEoOA=
X-Gm-Gg: AYBFou1EbNb9Jw6zH7CwQdVrsRMIFHnn24oP+KqnHFG/1tmqczmOU1AUM8EO/1o3+5s
	yoGFaPQUGF9ljVmL2TalABFtqgTXpbmBPEseOHkbC+VECyy2rfYSwHrGBsAU1y+cXy1Xe4WWqOy
	VlWYh7dxb4OoEairmouI6MxVpo7bprnMy08FNFpZ3fZpLr3NjOc1ILyf+GoayRBUncVUpuA0mPP
	1ZR/bnwUIPZptUjJW2u/LmoNQdiAi8tZNw0m2ThdhjrAz5VyVc3pFJ35m5CJ+2OiPtYc83p00qR
	ydK4yihNvxwes4vaQuBNSwtKIrtUpq1QwB/lzlfKd6PeDICu81j8j1WU6xUlSHyFUKnYqetScZ7
	fwIMigFmO0RWr31TgGExDzU2Q3US7VGZmg/Wty1LDyxkkVKiMZ6jztD2z7NY5EwVgYepXYL9oPn
	WNFgCcTvEN0voPzl2Bwkp7quWtQl5yALKbpfK4NICfWfBGjVmDQ+WAu0WehHvOJnfKlxAOw3VNl
	htDAgrEIiuHZ0WfaQGHpNDCxiSzGrovbYFm6Ivqp0va2F0VB5XnXB3gzv20CWot6wWFxVmWuQUw
	BoxrQou/opAaoeuunpjnL7el3DVh6n1IUwQ36GulPpOI+PcHaCywyyK396b9C8bYCWctxblroES
	t6LrC65Wtvi3C3AM6jP672mzZoMTOopj5hKI08mYzyl+eP5AiGQrLdYsxFBwi/0rV
X-Received: by 2002:a05:622a:1e11:b0:547:d087:543d with SMTP id d75a77b69052e-5551667e38cmr23347151cf.3.1794285001514;
        Mon, 09 Nov 2026 20:30:01 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555065e4ad7sm14643351cf.0.2026.11.09.20.30.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:30:00 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] Bluetooth: btsdio: disable the TX work on removal
Date: Mon,  9 Nov 2026 23:29:59 -0500
Message-ID: <20261110042959.56583-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

btsdio_remove() cancels data->work before hci_unregister_dev() stops
the HCI command and TX workers. They can still call btsdio_send_frame()
and queue it again, allowing it to run after hci_free_dev() or release
of the devm-allocated driver data.

Use disable_work_sync() to drain the work and reject later queueing.
Probe initializes fresh work on rebind.

Found by a static analysis tool under development.

Fixes: 73f7b171b7c0 ("Bluetooth: btsdio: fix use after free bug in btsdio_remove due to race condition")
Cc: stable@vger.kernel.org # v6.10+
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

 drivers/bluetooth/btsdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btsdio.c b/drivers/bluetooth/btsdio.c
index a194fc85abfb..680965e74bcc 100644
--- a/drivers/bluetooth/btsdio.c
+++ b/drivers/bluetooth/btsdio.c
@@ -350,7 +350,7 @@ static void btsdio_remove(struct sdio_func *func)
 	if (!data)
 		return;
 
-	cancel_work_sync(&data->work);
+	disable_work_sync(&data->work);
 	hdev = data->hdev;
 
 	sdio_set_drvdata(func, NULL);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

