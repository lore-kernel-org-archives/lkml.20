Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755707;
	b=N9N5X7V/IXapjEXgtxNKMObFKzAbcpPkxGOSv9nxQqC3MzscTBPEdxma5iYqvm86sLnM
	 b2OLTT6QwZjXWq40s0gsWMoLHK7HmFkWPtUNBi5YS6T7TPEMajYcnzaNlFU5bHEtgjLrN
	 z8R7Ltom6zk5GfBX9jhYoPogQ/IXv0GmYTiGfCw7iAz9Kiw8jagHZL8HKyGXESNJy4+ir
	 RlU7H9hFIJOAtVVpT6TOL+LPCzCoYw4PivL//dPd935PbJs1Nohe+k/n9sR1I1PEMI2i0
	 akrjj/VzvbKnmJCb8/ZDPIszYBVl0z7pbYC62Dd7I3qRtSLHIbQs7hXFTaLErKMtjkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CEWS5O6NICxLw6C5QXAFqTMWmsO+xhOgA5e6wxAsh5I=;
	b=YvqyHSs6INGgbg3KW+YuYX5ozZzpZ4/uvObGRxrqxQDjJIiJswILRewvZ7Ms1ogOtFHZ
	 MlrfHvoQlK+ZH0bq/oOe1I9+g76soCdU/2S1i9d337xnV7o/KlyAU4w1fQrm+kvW1f4kx
	 e1+bH5ZFTMgiiSXD0NmKIIhY7Kwhn8oyOzmUU0bqYrHIY2dzS3FApi3gekgrofGWnEKGJ
	 chuAnxJibImJ6h02GfV7OLyQzc69APLqHri/Z0LCKHHm+soLI7bo4cWclGj+W0YGZsEKH
	 oW6eqV3k7JoyXWj3lhFIwjtwShxmrEtauP+AQlOATieVjznpc4r+P2Aa9Ym87x9vq5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJhMxTyc;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA8606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FBA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJhMxTyc
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso91276f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793755705; x=1794360505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEWS5O6NICxLw6C5QXAFqTMWmsO+xhOgA5e6wxAsh5I=;
        b=HJhMxTycCUfqPBAbNdRZq0fbvxLcBFVmpm5hNmv4XI85OBDknpn28HOhjyn6y+wipA
         7ZaleVLYsbr/Q3fg8neLy8Wg/iPAKLxTRUr6Akl9CY8JgJ8YdrZX2tpVyILH66KhQUDJ
         v7fw3y9y4flULZb3UJ+zvN7Pr9mH5UNIylfOsVNm5gUfoekVspPGrVbyquiLfqp1gkbm
         xxE6PjWSQWBpZfQm3eZ9RhEehwjYoZhYIC7mgyQnLRk8ZmziAWC2FcC3rV5e26YXNtT2
         fEddyhh6+d0MYJLF5GWE9ngWw7oEAW7+uMOaYUEZSK82fsJO8rsWgUa0hEK36NRW1Pdb
         t45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755705; x=1794360505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEWS5O6NICxLw6C5QXAFqTMWmsO+xhOgA5e6wxAsh5I=;
        b=QgjrbCkVIL5SAHPP8Bu7JG1GWyyjLJo0TKTU9Zsf/avKp16Fn2decj0HAJEWhNm3Ga
         QXPKEoWu0D+poPyhoxxlFI2ZuTOJF493EUGpaApPLPQiDpLf8hAp4CGvx8/t+wjGY209
         hWd4sMt71+tPXM9+ytcoQI1+XRyrudnUpx87peqGZpMt1FwOsOeztN0m0mzQQGWIfQOl
         q4aTlaK/ZOCFgew3sZjccqXnVJUpaCTEFVmEQOaRdXe+NptiYYRRA+YmTehAVdVKfqDz
         I847w5LDLNvoJ5f2WomVssprdzobxsFGYvuBMXWh1O+/gvKj6Vr/ru1wKGBctvuo9t1v
         pJbQ==
X-Forwarded-Encrypted: i=1; AKwUvByQTdfI9XSqLZeoMs1EdDMFD2WOX1F6lb1fQMnjZ8+HQDtnXxVyebCAAeEeHwecOCXmATW4neLES+NMi2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/feYfQHn+DnUsjix7tGlwICKtt0OGls0Edk5F00/vED9EFBw3f
	QbuErKF8CbJjC+RCgRzjE2lacvBYA68BBLGrIL6koh7vCjFJyTnG4To=
X-Gm-Gg: AYBFou0WxqG10P8VP+gEztrwwlIfIGiSLm5GTOHeNcKq2K62A05FU/qPp6UKHC1dFoq
	1wnAMSTOr1f7o3U9FruouZpetz1dMW4tpVNHMFtfCTeUiWwaIO0iLhPYIY656pGSJyO4DXhCwi8
	+JNDF+Ddm5hEbtgsQH8fjnVk1n6+M1SxtANbLBU3VxVJMDtgPAyjsy1qUcuwjBPFIhCmXB+Bsum
	8a06mT48DSn5Ow87BRPje3vjBxb8IfrjhdAKe0bdrpk566P+m77doVh2WV2sd4+2xaEtU3Xrt4S
	M1L5jiO+e7APiQZkDt0bPIwsaaxsHPhMEd+iY51tN5h5IxW8ZXRB8QOVsOHFbU4xapU8XgGftwT
	SeQrlDvr89btXmKdrnZwqtXtHbfSMmVoGD8/g0NUHi7VNWEysc/Xsi/u1zioCuA3fnGV+egK7yd
	KftTvR98oLnrYWVDBBDzN3Sff2LMaDUE/xKtW6YgDEru29+IDEwMrdSS+ZxWWpzOxm5pF/vo4RO
	cOqrDPXAHEKBZ020uVU4v0mpqLY3P/L9DYcZbDbeu49ybtZAgghzJx84penW4bMzAzlKGAo9g==
X-Received: by 2002:a05:6000:41c8:b0:48d:faa6:cedf with SMTP id ffacd0b85a97d-48e6e50645dmr33085390f8f.56.1793755704707;
        Tue, 03 Nov 2026 17:28:24 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda2007esm898557f8f.47.2026.11.03.17.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:28:23 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan Wu <cooloney@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2] usb: gadget: f_uac1_legacy: cancel playback_work and drain buffers on free
Date: Wed,  4 Nov 2026 01:28:21 +0000
Message-ID: <20261104012821.3253258-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

f_audio_free() calls kfree(audio) without cancelling playback_work or
freeing the queued audio buffers.  If a playback work item is pending
or running when the function is freed, the work handler references
the already-freed audio structure via container_of.  Additionally, any
f_audio_buf entries remaining on play_queue and the partially filled
copy_buf are not freed.

Cancel the pending work, drain all queued buffers from play_queue, and
free copy_buf before cleaning up the ALSA card and freeing the audio
structure.

Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Drain queued f_audio_buf entries from play_queue and free copy_buf
  before kfree, addressing sashiko-bot [Medium] buffer leak concern

 drivers/usb/gadget/function/f_uac1_legacy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c7e87d1..9fab3f9c8b9d6 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -942,7 +942,15 @@ static void f_audio_free(struct usb_function *f)
 {
 	struct f_audio *audio = func_to_audio(f);
 	struct f_uac1_legacy_opts *opts;
+	struct f_audio_buf *buf, *tmp;
 
+	cancel_work_sync(&audio->playback_work);
+	list_for_each_entry_safe(buf, tmp, &audio->play_queue, list) {
+		list_del(&buf->list);
+		f_audio_buffer_free(buf);
+	}
+	if (audio->copy_buf)
+		f_audio_buffer_free(audio->copy_buf);
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	kfree(audio);
-- 
2.47.3

