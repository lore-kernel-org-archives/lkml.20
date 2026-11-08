Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794124291;
	b=T7UOedWtM75JLrJ9MBp/0TWv4ZXsFYLOpYSJ5lkXj0iAcCX1Wr5K7o3SHZBsgPHZc1ZT
	 oPYVIDGAUcPylzCLdNM4t+2QVMv4VfWoVTwRaOgtWR07BChrCDDRz6bLWQbJoLVqKuBnq
	 5S8x54uHU3AzeQAe28utfpIy0IzL444rouX5ulGhSCPXLRc7LkpL6j9OXHsp7cXST9YVt
	 zgj8B1KUFDZO20BB4WTEaRi046KIB1MSjjlG8IV0+oDy/XjESTH5gh1JopI89bIOvB7zU
	 r5sh8n6oZKGSBgDFnMespOHG/K4AMZBxL4eoGc5UPcsMJPIW3mRH25ZG9S3zOURvHxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nAolJ4zrHlGn8Rop6XJv9YeUU1fj1l2rVCM3Mny8M7I=;
	b=VAHFLhHzHeOwItufZMVummf+V4yrduuTnBvzPyZ4e8Z/HMiWM8UWSONKZUslgBTQLfqg
	 Y5uGUBGqTraofJGiYUHJMLQFgvXV5YHDi/Pa3+aoPI48daLb6EFtEc7XEJPeMuR0R5eLg
	 Nds0v90ltrvKcZrgCDJBjbCxkcksO1UOZE7pfNUoWyYR3kwPOC0xhdkINJnw8WVkdSIjB
	 RvjUUBpM+QZvEpTWY9YH3vSpbDpcBylReCudNK5lmBbA//5vfEx+cpZYtWmgf3/Hh0h7h
	 wKP72M/PaZQ0ifxf7OTkmoSzGzw2DRA+RytrXh6fuB5h18/NTJdWrvaDk2EiIxErERA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/5/dbHb";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EEA606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EEA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/5/dbHb
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so701936eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124290; x=1794729090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAolJ4zrHlGn8Rop6XJv9YeUU1fj1l2rVCM3Mny8M7I=;
        b=x/5/dbHbTtV3HzASC0mSTL6DCkKTqJmhN0woh9gHzab72ecWApO97cGLZbtOzsx5Wq
         Drdpr33yCVYl3pf5qHuHgHHxIsWAzuW5gd39HtpPd35teYSnYvdvp3TvP9NDICzy1YhR
         94U9qWczgdFTmaqEAue9gSPLqTeMUia+qAiWIZUANv2f/A0Bc3P+FbfTwTNW2JKOHv8X
         G2UbdtG+OaFou3O4xCQPRzN3poPeWy7zMVjbUfMsOQNCdxDPaYpuxrJZyS7uZhI9Zmzr
         ITBQU7XLcgNpqNXJj7pV/XDmFZD4wbLFwIlT5OlZjmfSJ/Ii+3m/Vq5l2JsH95yThOnG
         Jqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124290; x=1794729090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAolJ4zrHlGn8Rop6XJv9YeUU1fj1l2rVCM3Mny8M7I=;
        b=XnXHPpSuRMt7xEf0FZkskX0LgQ0GXB4BzdnIl0/IHVYxRmY4ojMEuBjmGrx0YFdPMS
         Y4mM7JdgGpK09XQ3mfZ7PvT7p1bMgijb410Kx77UepQwcJVrsXGqc4YUHZQd8ZDq1nHN
         WXfslOj9uxt4kd60im0nFvPnchoAnbgiIdNSRdNvLYC55p/zlH14P0mBYVKRIylNrEwI
         ZjnqMF2GXX6cRDXySnjyN+90EKwunyXfq1whzVxN2WzscwvYyX91TSpu5Piu9peSi/xB
         fjHAAqECB6ExJ7qac0IJ1BzocrXqL+tjFdLS94Nk62oOisYQpbfqNW2Zw+Jo5UMxBlEC
         Cn7A==
X-Forwarded-Encrypted: i=1; AL+hErFIxuUExWzXnYnBsV/dNV6m7uLrwBGHh8liquJGwvbRSzswkgUAfGJjre3E8l3zfb+TwM96X8OcN61grgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8koPHrLo6+cCSEXQnmy9EVKa42sdP2sOtI1r99QeZxNJitCsBT
	c2GgaHkgfThe904mxqLxBfZG2mL/tpTVgSQHeplN0xLrnGYOMM+jIQQz
X-Gm-Gg: AYBFou2SkaPjgxWmCKfeJV1uAzJjzZkuOqxnK33+hjVeuBb/sb+syqXDkjd6gcE9Pgs
	8gtOwHIrECQ84kVglflwTW0bNLsIvLJe9k6tcWNLY2EnIV2JMRLhA/WvF+KBbGxwmwe3e0pVqOo
	IIN/49ORX03xXyzyEelcopYTHrUHuLq6OKxdguS/fXqaR22Zy1BgqsrENOG56maC1PPgjfJs7t7
	5oIFXHzbVOzaoRYFe76gw37JqOh1sEuVtY+UzYRu5z5F+dv3gRZ8cgtYy1zJS0wH5ouwaoUEVNq
	DhsH04MjCpKjat6Z2+8hgebTah0ATCnrEuOumhUiOyEhYDROWZN8+KlNKvjY9fy74a40u+HNXHS
	qk7F440C+9lZE6ZhbKJ02km1TrvnE180nRpEg9T83+Nv6LCIZp/R7i5KbHaviSic4caAgWV/mYn
	D9B7nfKbXzG8nBErs+kbHGPg83Hp6KnJg93Y8b95zapsWWjiQ4PC53rKt1RyUIPnIIYNbsn9uQL
	IzGfoNXKLqOGImONaMI6bdbuZ8lU+O65kvzvpuU59E0GS6Z2QfZpOsmCbMdBI8YhayHQzD07aLw
	yY39BFXbycEhYSyXnieGhteFpafwFOwiWILxPrZortOEKv+2AyubyOGn3gFTlRwZheb3cg==
X-Received: by 2002:a05:7300:ce93:b0:369:f18f:34ab with SMTP id 5a478bee46e88-3725d77f97emr2096920eec.11.1794124290231;
        Sat, 07 Nov 2026 23:51:30 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372632d7d62sm5627672eec.3.2026.11.07.23.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:51:29 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: gadget: f_uac1_legacy: cancel playback_work before freeing f_audio
Date: Sun,  8 Nov 2026 16:51:15 +0900
Message-ID: <20261108075116.251501-1-hj351016@gmail.com>
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

The OUT endpoint completion (f_audio_out_ep_complete) and the set_alt path
schedule audio->playback_work, whose handler (f_audio_playback_work)
dereferences the f_audio (audio->lock, audio->play_queue, audio->card).
On teardown f_audio_free() frees the f_audio with kfree(audio) but never
cancels playback_work -- f_audio_disable() is empty and nothing else
drains it. A playback_work still pending when the function is freed runs
against freed memory, a use-after-free.

Cancel playback_work in f_audio_free() before kfree(audio). By then the
function is unbound and the OUT endpoint is disabled, so the work cannot
be re-queued and cancel_work_sync() is sufficient.

This was reproduced with KASAN as a slab-use-after-free in
u_audio_playback(), reached from f_audio_playback_work(), under dummy_hcd:
with a UAC1 playback stream active, unlinking the configfs function frees
the f_audio in f_audio_free() while the work is still in flight. A delay
was added to the gadget streaming path to make the schedule-vs-free race
land deterministically; the missing cancel is present regardless. With
this patch applied the splat no longer occurs.

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 7c8d60c..2dca5cd 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -945,6 +945,12 @@ static void f_audio_free(struct usb_function *f)
 
 	gaudio_cleanup(&audio->card);
 	opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
+	/*
+	 * The function is already unbound, so the OUT endpoint can no longer
+	 * queue playback_work. Drain any work still pending before the
+	 * containing f_audio is freed, otherwise it runs against freed memory.
+	 */
+	cancel_work_sync(&audio->playback_work);
 	kfree(audio);
 	mutex_lock(&opts->lock);
 	--opts->refcnt;
-- 
2.43.0

