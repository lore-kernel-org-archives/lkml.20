Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792711;
	b=dVetR8hEB1OHXTxwMg2zMxSaWEaSo87wkwDmOQhZn/IJ08sVBDxXUsAiV31VkO7yfnxy
	 SeiTKixym07focqSz/JUIwOZ7eaoVx/Sj4Jg7QhKl+u3xvKGQGJZwpNSXexhDMN8/27Xw
	 fle+RlmcHG6595217R5Qh9Zd68lyBJzQKtwXTZbP+5cxDMZ0bgVRsjSoj4Cv6HcYt+Weo
	 kglEXAUkiJWmHc1mD6OwJvUew0NadX0Y5Xipx8QLKUv+DDDRi8vvw/Z332bH/P/E8/GFE
	 CIxO+bR/LLGUuQKAU798Numjy3g+qvIdKH3TDYq80u7ltYRZrFsUsIjNHC8EiEOu7MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fwmi2BanXdLKK6Q5fiHKOWwPdRJTU6INzhuG9S9OW0U=;
	b=zKZU335mJa6YiexcoHR9iX/xJQMfff3EEodqRrIvRfEAV1sh7vwVkgB8PPbLtxh1aXhu
	 o++wwx8frWr5CvobAIUC/EO+dih9xcESzTJytR5Qp6p5Otc66m0lCjczyTvTNW8xdhQdt
	 7hhq31KIE4Z4EXxalOuw7/lXQrlgfYwWYXHv3mt9TgpEuwA7I9L1oWc3aw5gF5uNe4fif
	 3c4HK6JS5CpGFAjzwBOTOQ885GnKnlr0NEecn3AB3x+svJ8Ct1KYOOWqKUinGTyxQrHua
	 zjSqLb9XmYMhPUmH4MfQ45U6QmUmO7uYCCXe3OfqtSrgNYw/CyPEmtsVvE3UlkUodZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxJzikPN;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5673606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5673606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxJzikPN
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0759so335618f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792709; x=1794397509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fwmi2BanXdLKK6Q5fiHKOWwPdRJTU6INzhuG9S9OW0U=;
        b=mxJzikPNMzjmoiEyvS16txFYybRJZhTlonxyZaPZM6I6X8xGByAxGrWpT/B6UGGNAF
         /RSQ+jU1/C8iqEkea+iGqkHBXthsI1ASf+0RcfVFeCb81OelVQh55ah0ForS/wFZQ2SN
         ECQVB6u0GMGDTK3fbdujGGBLfWxnePTp9gQ/8oKw6M6ifXEldpj84HSWBLP43029q/uj
         9DiKo8CM3si6aOXO+zfJkZXA2SNHFC4tCK8rCbL8mD8R2Pk8D3kXDKcPe11IlNymP+zJ
         z4PGDmfrMEZDpCJgjiqEG6DUZYh28Aaa5+W3K7e+ijgM+yafLesL4to9d3RQrVr4CH9l
         m4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792709; x=1794397509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fwmi2BanXdLKK6Q5fiHKOWwPdRJTU6INzhuG9S9OW0U=;
        b=LuNdelMV3f17nDUj+l1gvom8mPCLzuf7Y8siD8YD/kKRs0wHf7KBVXjwPfWjmyexDh
         bV3iMPYRX1VpGez3J1bq2bVYVsHBX2sOMyX8bNU7fcwhd1A73qkmLw4hqV0eqSbkr0dE
         raIr1MV+lkeDIKasSzotvm0wUdhqwtvxKgabg7PhH1WMV3bHa8J2b/fVcLOeEOd++ixg
         vS29xm47xGVdgVVF7YUtcYBRmQKyJ4zmxU2Eu5rHSxd1NN27ZBlVqjKp/PdC1RCoBUw6
         PL8PpZB8EgU65rhO5QooRF/9E8zlcglUpjCFbG1VIx3IUzqP6gkwmXaSGGMfoomGD2+U
         WuAw==
X-Forwarded-Encrypted: i=1; AKwUvBzWHE7r4uDWj9zRhluWgZNr1N9HgfB2tnvTIaYQK6OEf7tHK1/JQ26pNhwCfdybxfBMPyl0jsOVKH2OvQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kb2hLZy5FffwZcFXGalv7D4lBROpJoRTbR9EdR1feyQwVKpr4
	9QhN4dZYoJunlwZhhqwLfz1bywfoz/0NjcdnUrvSkZ8lTTnNz7ML4gM=
X-Gm-Gg: AYBFou2PqTEdZK3cfQBNzBIapk3Tfw7z7sitA1GGCp9xZrJTlwCGLZ5TnyfytH9cmuA
	TudxPZxs0H1/ho9NUBSXa2jJNWXZAKngO7uQGBp8gm4PUr2l13UeFhq3AjONRHBZ/xSOOSolRl1
	YX2FCvfsTtKlSl9MKg95+DLFx5Zjxq9aMJMGaQsdzqKaehasOgwDdh9vlqcqogX/EgtyZyH7Uvz
	37Zfpw2XgFSTK+FC9DCNtplymgyh6dhOlR1rWUtNaas9E8PB/ji19PBo1er6Pjc574snYdUVvsJ
	ui43nKk15XtEpCB5NTkk0wGVU8lGyXU7Pw0zDmbA3aTw3XPdr4fgZIWysDqopC5AnfbQ11cO1Lt
	urq+qFgGEZGcOiU2VPGLM2q5Cd4tyPbAqOckw5ua84DZpg9Z0zn/sMKO9JuaibljHg8CQ3DLY5r
	jI2i0Di148uBrhnJkzTr2HHOq9089VnthB2Gq8TWcYKnjwpLkufjYFr4A2Dh++YxrvsHzezd61c
	F3Hi8E/L61j2E3P3OxqEF+PzHRL1/aB0stKN5mBIc4CJj8r9f22c9KB6oXM0usjqAUQaPaDvA==
X-Received: by 2002:a05:6000:25c3:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-48e6e517f2bmr32360828f8f.50.1793792709001;
        Wed, 04 Nov 2026 03:45:09 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm3265405f8f.52.2026.11.04.03.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:45:07 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: gadget: f_uac1_legacy: cancel playback work and drain buffers on free
Date: Wed,  4 Nov 2026 11:45:05 +0000
Message-ID: <20261104114506.1596023-1-tristmd@gmail.com>
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

f_audio_free() tears down the f_audio structure without cancelling
playback_work or draining the play_queue.  The pending work can fire
after the structure is freed, and queued audio buffers leak.

Cancel the work, walk the play_queue to free every queued buffer, and
free copy_buf when it was not already queued.  When f_audio_set_alt()
is called with alt 0 it queues copy_buf to play_queue without clearing
audio->copy_buf, so the drain detects this and clears the pointer to
prevent a double free.  Use IS_ERR_OR_NULL for the final copy_buf check
because f_audio_buffer_alloc() returns ERR_PTR on failure and
f_audio_set_alt() stores the result directly in audio->copy_buf.

Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes in v3:
- Fix double-free of copy_buf: when f_audio_set_alt(alt=0) queues
  copy_buf to play_queue without clearing audio->copy_buf, the drain
  now detects this and clears the pointer before freeing
- Change copy_buf NULL check to IS_ERR_OR_NULL because
  f_audio_buffer_alloc() returns ERR_PTR(-ENOMEM) on failure

Changes in v2:
- Drain play_queue and free copy_buf in addition to cancelling work

 drivers/usb/gadget/function/f_uac1_legacy.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c7e87d1..88c816b4ba119 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/err.h>
 #include <linux/device.h>
 #include <linux/atomic.h>
 
@@ -942,7 +943,17 @@ static void f_audio_free(struct usb_function *f)
 {
 	struct f_audio *audio = func_to_audio(f);
 	struct f_uac1_legacy_opts *opts;
-
+	struct f_audio_buf *buf, *tmp;
+
+	cancel_work_sync(&audio->playback_work);
+	list_for_each_entry_safe(buf, tmp, &audio->play_queue, list) {
+		list_del(&buf->list);
+		if (buf == audio->copy_buf)
+			audio->copy_buf = NULL;
+		f_audio_buffer_free(buf);
+	}
+	if (!IS_ERR_OR_NULL(audio->copy_buf))
+		f_audio_buffer_free(audio->copy_buf);
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	kfree(audio);
-- 
2.47.3

