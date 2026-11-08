Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131554;
	b=hQRpeprAww83jAvOXlRP0f1TXxfytwiTJXYANkSMIkmW7KbI5xx4R4lrp1uMtQIOtCYP
	 3Jsn/h25Wup+RmXHMTn5hyYb4DTXweqntkvHtAaI/17OiHhTN308jFyAcxcCnLtwsucnY
	 NWfDtbaLje6NNnC4bpBsgEzw8jEWWPpWCPzy8btJXHy9sU1WiRQkBPJDlbjqQ5QeaxD+y
	 rr5dv7YJo0w8j+igTtCJEzAj7rGxlTXdGEr3qFO6wmFCzofQcSe/H0KqU6SJVxjT1BEhF
	 5m1i3XW+EarYBJh0445lhdQtlageJAXI7sfIf/YxD+hhpzGs0gXyFfm3kj0P3+otdvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131554;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ETZrdZOhArsLJy6lMGfpmdf9xjZhQqXb8yfOpDMN3NA=;
	b=sM8WlUgUld+SmmUixMFMog1Hui1JLCyyqQcC2/hKU+1P3cgBzTJWn2rnUec8Dy6p+WcQ
	 OXfvn0ZKFdpigcHNLbs9sfLh0id9XX9xFgXa8C76cSQeopWkkcoLOFx4WNIcACrUlgSF7
	 uSh32sL8KUJptIlTt1YwSXIXQJ7xOczTFvq4fPUk9hvtf+9mtEKJXYaCtB0HuHILfoKLj
	 MEAiiQumgD0viR9MhQG8LfYWf4+9RhRQrB35CUXlWQJ0Ofiq0MwFnRiElgZu9SE6eKo+/
	 44gpR3kVERzCtx0Wla52rKf1l+e/oRDi4ff2xWENZYV7M3kGCeXYUQmROM83xGzPPiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=GlxO93ck;
	arc=none smtp.remote-ip=203.205.221.210
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78B0606A31C;
	Sun,  8 Nov 2026 09:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=GlxO93ck
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1794131543;
	bh=ETZrdZOhArsLJy6lMGfpmdf9xjZhQqXb8yfOpDMN3NA=;
	h=From:To:Cc:Subject:Date;
	b=GlxO93ckU55VsTseTvtWcSrnEqEGqAHLogbTVKYOG/vABViwhLDnsQWrcTaXbvwa+
	 7LEp8yN7QWROR3/KQgOeKEebKtVbFQMeylJKN9Bs955j3NzecZs2tRnhtGlgM4JTjv
	 JbYXsJELHxRLDG2hipbuL6fP1MKupsJrwq79V8gk=
Received: from nixos.tail04abde.ts.net ([153.37.85.101])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id D048084E; Sun, 08 Nov 2026 17:52:04 +0800
X-QQ-mid: xmsmtpt1794131524tc8ruwjyr
Message-ID: <tencent_9286255027243E5338FE93692C54FEC21D09@qq.com>
X-QQ-XMAILINFO: NeHZ50d3l/WZZDI+hYRr+tDmWArJfUVTHPa+8sr5iM9Efq5jqswzS2oyHLVcmD
	 LOwnbIEC57Iksl93J96/icqxhEX6PtMGLXeoyHb26adkHXE51RtYamXxm59UqW/4Fh5s7bNY9R/o
	 rTCL4DwZoDoendL2bqwUqto1hhI1nmbdCpqK8tnsKzT4RPsLhTlKuOuhyr14lDYAlIug42qHP//F
	 iWivMFdmTwIMyJtY3LuTArh0pzPYyE3k7sAyOmWEc9QrfwGHTvAgl0X0OnGz0U2vQRqSoebrmitI
	 wf11aaB2HJix3yLi2pAkHZRGh8Tr20+6C0YdYXx4DPE378VkS7nq4s+6nsSbU6bYmNomgl8lNUup
	 M5BtWh2VvzkkSBlaqaH1d+1DRZfaGLQzkZRKR7zxQEHEwlf7QrOjS164uSJi28k+I0qBT/v/yfBL
	 MGskVnvfrfq2W/t6WTAjhi2jkV4W2fNfNfwsfb6Hgr8aoVh7vRFshsS8To7zpmhn15w/IhokLsx6
	 /B96N+ghe523MRrDW0m2jyCXMjKdlJJX4l/uQyzmJ8fW+vbhHjVxOXsoXJWEe4Q4ec0YJThAWPOs
	 Rc5KgbJKGeFMy4LZZbrIjqEGEoeiKMO4ba4w4+eWy7dFls9//jnCqQ1n1dSEXGqN4NE2rQAtvRKS
	 TPHCkoMs5nNwKe6FxIH5Ant9bxhLpUP0ZIYDRBqpaQHXah0C/j9WcU2PQLdWVhZr5Hv+mKQL/tdR
	 5o8sLNLPALrmdzaqUAYlSdk3In+KNZI2jHJAwiDWjGQKGIoeFAQs4wB2Vn9lacrDuKChAuVdSreu
	 PMiTyTwjsJzheBb6rZIXbGm5xZFodx6I0jEesL7jbnhgBCm5TWpHpWotgtzPymdkDXTiyDUKmCnh
	 QVlIAdjFFHU+TM1ZIRi45UxqNu+2fC3x+nKrnGqIodQmbMVqgX5dGwA9eAHma7YYxkNy/Tp7QwK4
	 bn6hTTEBHKoiIwPcNMrx84BAozfFvdF1uYKert47QhLUuGRrJC6f/0WRDT2akHSH0vYuWWbNTZcY
	 Al174WrhN4NvzXb5HFg3lBeOTryhAmB0QKQ7phG8LkmQlGvrq46XGrZwgQgJvpVe1dFg5oAzLHqH
	 OqI0+p
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Jiajun Wang <ryan1202@foxmail.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: xiyou.wangcong@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RAS/CEC: Fix decay work delay calculation
Date: Sun,  8 Nov 2026 17:52:01 +0800
X-OQ-MSGID: <20261108095201.2393382-1-ryan1202@foxmail.com>
X-Mailer: git-send-email 2.56.0
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

The conversion from a timer to delayed work left two issues in the
decay work scheduling.

The initial delay is passed to schedule_delayed_work() in seconds,
although the function expects jiffies. This schedules the first decay
after 86400 jiffies rather than 24 hours, or approximately 86 seconds
with CONFIG_HZ=1000. Use secs_to_jiffies() to convert the delay.

When rearming the work, cec_mod_work() passes the relative delay to
round_jiffies(), which expects an absolute expiration time. Use
round_jiffies_relative() to round the delay instead.

Fixes: 0ade0b6240c4 ("RAS/CEC: Convert the timer callback to a workqueue")

Signed-off-by: Jiajun Wang <ryan1202@foxmail.com>
---
Build-tested on x86_64 with CONFIG_RAS_CEC=y.
Not runtime-tested.

 drivers/ras/cec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 15f7f043c8efd..3c61c2aa78f2e 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -166,7 +166,7 @@ static void cec_mod_work(unsigned long interval)
 	unsigned long iv;
 
 	iv = interval * HZ;
-	mod_delayed_work(system_percpu_wq, &cec_work, round_jiffies(iv));
+	mod_delayed_work(system_percpu_wq, &cec_work, round_jiffies_relative(iv));
 }
 
 static void cec_work_fn(struct work_struct *work)
@@ -582,7 +582,7 @@ static int __init cec_init(void)
 	}
 
 	INIT_DELAYED_WORK(&cec_work, cec_work_fn);
-	schedule_delayed_work(&cec_work, CEC_DECAY_DEFAULT_INTERVAL);
+	schedule_delayed_work(&cec_work, secs_to_jiffies(CEC_DECAY_DEFAULT_INTERVAL));
 
 	mce_register_decode_chain(&cec_nb);
 
-- 
2.56.0

