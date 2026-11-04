Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750565;
	b=UIsvSrhcF8J7xCskTjf9Mi7EyJVWUrdtsmzjbffPN8fdLfcbjWbnex5t4vgBMJXYtee6
	 Ps9+4msjpqYxWUuUT6xaTnManxz/ClYvo+1PPtjuAsv7rkAnddVhwy7YcAQZMVJOIxzFN
	 9iEHjFXu3uUAzD1kZWubou9mHgtBcbDDv80bKIpF4GJlUk0RqRLPz02EFnRH7pW7cDEqj
	 557o72h3j7H4xloBUa7pbTgl/iC987oJfF/0Le5CxFerL8x84VIgAUy1MlMYqmpihvzLc
	 YhU2PNdcRcLMxolKY//07pOfv+h9pjjBhTwb9extIbQFjnAan/J6VzNUkAR8ZkRrbuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kowKGEG8GhEeYbc52I9hqfYuIffCT+VKLMki4zsClrQ=;
	b=h2ZVkBfNQ73NuA0/amID7EgB+6NE6fKsmdNLr/AbXdtf8PHni3x2px/j7e1ncYf2+miI
	 lPOX//tnTf1VZKD3rm6s7Aw6JgNuuZnklkw4qj/wVCPgtpl0p6TErPHmsm7pUMT8FMawz
	 SElk7S+UzAnGtvzbkJHeJ7zp0Y71A+D7grcXWxJr8k9NYfpEGZqLsYUJbBg2PW11fZe8I
	 fd+Q3VdvZURLK4M56bKZOuzhHkaLpX+tvITrZcLEk3fZiFEPTbbWMgn9JPBvg/M9utHL5
	 V1LFi+mDCf8UEZktLPd3eqckV8Htp4FAqNVqUQgFn4IeHNvKlEsN2oA938peYf736Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S3Vw1Nu/";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05308606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05308606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3Vw1Nu/
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so64569f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793750563; x=1794355363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kowKGEG8GhEeYbc52I9hqfYuIffCT+VKLMki4zsClrQ=;
        b=S3Vw1Nu/FppcBaS3Qvw6U5JmHn0zhK/FM0VrI/JSwsDkFBT/vvY3vheYtkNv817LbK
         ciWppLK/mw4aILC1gksjwqYF7piGXHNWXbdiFg87w+YuoZrfWQmR0YbrXJYC5SO6RG/d
         4WjcNz+T4Z9V6J7edlkrnuU7fMqHMoca+sQdPW9d7oxfK8Ze6qyQeWPb2d7fVrLW6wfI
         sXe4Tgxo7ueuLhUE9izZ9XRvLIglpccZw3xXy8cbA886T+8ylxyN2/xmegLJEmBribBS
         j7Tr2BVnkiqAUd4vSeneRBOxv095k5O+XJRWCsWCjQTYhz0TzEMZvyXYNCWDYdvPbPpm
         anxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793750563; x=1794355363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kowKGEG8GhEeYbc52I9hqfYuIffCT+VKLMki4zsClrQ=;
        b=DrXqRpAeDY+B4s3Ke+AqkNXlW5Gqfc6OALr+9i9jpq5qM/vCsa4R6LgAFNI6saSOSp
         NIvhBUZBG5w2SYAXn8oYnUsmh7JQxhUGoFIqNICpGRqYm3zW9JrQqVIVjwYO6umqDYOT
         qSNCyP/T/m9HGY2I+O5z9felqyNg3JJN2TkJchKwARizaORWUJkCmPDauYfSVYv1hUDZ
         kK9oo+pkP5qJsVXbasKW1oDntZYwHjVelEVP10jbnp+XAIgPHZ8pZmTS7nRQUK5G/Dcq
         ikxG4GIaviiUxpBwGhy0+ChCt0ifebiGD0NdaJQYmpw+nzfgHqfJDr6V9jdRkqifdX0E
         TI2A==
X-Gm-Message-State: APuU4Z+5CihCrI0d9JgGke8TUNq7ddf4yylVkPkiwjsoQr0k4Q+OKQ+Z
	gRDXaNuuIZ4pqIoKu6Q9SvnDuuBV255Cq2J1qcmOSZ0tI5/7cS81dNg=
X-Gm-Gg: AYBFou14Iuf0M3aXVtcDFd2xlnOEZR9YOEaN/DlHcHkexgmXFfihohDpwXiXagkBuKE
	ByWsMrDqnB+rSULBUU94Cd0GLqppb/AsyyEED31H92yTHIe8dEhMNcGa2lb6CFFdz51ufnW42Tg
	9WyuLgGFe1nUr/EkzuNjT47UmfyO/Z2Hgw103baU2M6VySrBv8beKaze2psEV1vTsAdzG7exlCk
	Mn49acLY7CzKnHV3ATq4M+GOmIznWrD2CbktWVlVYBCerThtE4jqqTkk2XYQsIEotpD4Pin27KI
	R+LAa6TAKTCFc5EmOB78+p1Z/4t6Hr0wuenlBQ+Viqk4sg/3vA5Kv15nQPrjzF8aR+7rRPmnk91
	tcUi4rN71R3a4nvRBIEocLiImj+xZroCCXDGm8ayKGZx22YsBoaliMLqMeG7oSonNIMBpH6TJbx
	c7x+D1XnJfpePUmxeBM7t8QCoHNVEhi6m1GUE0vQ84LKsXScKNH+Xwgcs03vmSoHcmiyemPrG+3
	23hWV1DcmKuVYzCXT0dPuW1Nc2qWs4B6jrvIGLP6LgaeB02hDWNnyUWUhkf24Zu4ALsTX4phWL8
	PMnIlB4nmn46ti3Dp/E=
X-Received: by 2002:a05:6000:2410:b0:48e:6674:3b2f with SMTP id ffacd0b85a97d-48e6e5005c5mr34358784f8f.51.1793750563327;
        Tue, 03 Nov 2026 16:02:43 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm714193f8f.19.2026.11.03.16.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:02:41 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] usb: gadget: f_uac1_legacy: cancel playback_work before freeing audio
Date: Wed,  4 Nov 2026 00:02:39 +0000
Message-ID: <20261104000239.2798131-1-tristmd@gmail.com>
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

f_audio_free() frees the f_audio struct without first cancelling
playback_work. If the work function is still running or pending at the
time of the free, it will access freed memory via container_of.

Add cancel_work_sync() before cleanup and deallocation.

Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c7e87d1..a9807697265c5 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -943,6 +943,7 @@ static void f_audio_free(struct usb_function *f)
 	struct f_audio *audio = func_to_audio(f);
 	struct f_uac1_legacy_opts *opts;
 
+	cancel_work_sync(&audio->playback_work);
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	kfree(audio);
-- 
2.47.3

