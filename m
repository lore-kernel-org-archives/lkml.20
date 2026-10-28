Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793151775;
	b=nAh2z7zUkJxIFwghqSloFM+xOVhOeOwQOhEeYZOOM7MXXb2DMpYf0z/u/cXvDv2l6Pm8
	 sW/5tgtAtZ0vxbc87y4EqS7X0Rfmn5unbwDi6PeUFmPqJX6TkLxVEwpf4BdBzm1A/FzKk
	 SETNo7MzNbeeRWm46lrZ0v1NFojhRxEugu5CCQgJxNIqqLqUzOblC6DEDFQyNz0fn0FJ6
	 EkXB5LH17/cl4Fv/MFZLvxUw/JN6jNvYJtaGTeOSJ1tY5mJysoFUGTfJuS9s+W8ZS/Qu+
	 Lv7d2OTdtBCdJnItErB+exopXiyP7dnu495RAZs8YBvDrEGZ5AKg2Kz6xs4aAHdCCxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793151775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=F2b/C//SFL1IpqmZ4dlyGzFHOKnAQfZ+yoE8clPtWLc=;
	b=JnHfQRUtnvr6cah/mcOBMAd7Ka7wPVmMNWoQdBZ/e0lNI2zQkYs13LWYKrjHbRt7tAbC
	 md+cQwXoKyhHTzfvx7PGaFVAtuhCjRmfdWaX5jegmSFLzkE7cnT7NVFSAQwP190UxtVIA
	 WFnBS2MoIShB6ZOedEmDaJLMFbEi8xUPzF/zxV1R3cGbh8BHD1sDVUY0Oj3SRlZnFIFdp
	 m5ObrHqfL1Q5SaZTtj9nYWz06olypNreqHwc8euejI5km7QZ5ADssI7bN+zAu8YEKF7/W
	 dpH/Hq9J5bYg7Hp4WCjX/pD5SKhmMLvGjRIFF7X2UMIrLLHXEnePW4lZdz3DNMhlQLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCMyzx2f;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70069606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70069606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCMyzx2f
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c414e5d282eso55115666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793151774; x=1793756574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2b/C//SFL1IpqmZ4dlyGzFHOKnAQfZ+yoE8clPtWLc=;
        b=MCMyzx2f0O00kIhRhwK1oGv7GzOGM3BLrIKelATcKFUe4QwLqj7MiA8Q/EnhpSe6Vr
         EHS/TnDyRCP8uH71IajLTDSYGUBp/FTsCTQVtV28oysp77bX9vzw10IrhG2nIOfdTQ5K
         8pjhKSSPSrVDS0lS1ipyWioAQ3/BsKkcKIE7VyoZyqeJ+9qZ/wDCP2D3oqpkUTVEuZFg
         0+S3lX4RdVHPnQgZrf8vtTWRvWHMJiVnD+nl3POTGLJohGZDJ2f/CXrqwtAYe0qb0we7
         pqRD4xj8sLpBFdBLnyjUnpHefy+IiU1w9ZTy/vYZOZ2D+srGLO3+h1N2j7eqHdRrimM0
         ngSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793151774; x=1793756574;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2b/C//SFL1IpqmZ4dlyGzFHOKnAQfZ+yoE8clPtWLc=;
        b=W+GFGDwNnB3LbDjHE9ZgcRrlKTsnbT2thjOQJ5j6l1xL8pXQcSEVOOcC9DQam0L7XY
         Fqdu4TJLGnjuHWoMfcyrrjAPfSooqV7KehoZF9oaKvArd6tts8LQiGNMmqAsG+Mln1UA
         WyESiOvpidmHr4+Uwd4V0a1h4wYaAcdAI75ix5FpRSF+k5GIS3nwo1NAymUvk5Pr8+Em
         ke4UIaJ0bmezGmO7HzlToQBrgMX3KX87+PCRteyQ3OxHadvm2Zv/3PR32DQs6+CuIjCB
         Yg6ufenunfGLvBjLWmIaSHF2ZZ5BOqYhYjDPerJ0Zl0pdPwTLO9rmWPY4/nsvUsGo41Z
         sF/g==
X-Forwarded-Encrypted: i=1; AKwUvByX3IA22HITU46KAxLQgmrEQoKd1a/oqgEQ2PKxq4Ax1hb6k8IhihbnYmQevrHaQgdyVO2avKm2GZnuNQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqEkQOp8k4pwDE1/4l1uLtoONOBVH0fcuYOQWrD6T8q5z76p14
	+8jHjd0lVnFXhJZ9vXFkw/5s8X3Igp9+Py8BcLdTtpgTKc8LBfsBcolO
X-Gm-Gg: AYBFou3CMu+YWeaZgMXCOcuvy79tLo5qNTP26Dzqp1WfdVcUslNsdYjr3vU5Ca5riFO
	6JPav0zOdTwKmNg5kcgEGYk6tlBqv53bEy5Fe8EX+X24t/ECk+3FousDb0zjjkJlEES7OPJQwZC
	ZnCx6ERTDcSo9QVg4qU91DOXiVgFnQCApZIvmS6L4iOnsa5zHVgNRTcn/acQZ7P9UGO+izarT4q
	MzMijDIt1vfcdGy4HzP30rxOPk2Rarl9gt2G70aIQQUAfBPfZ6XfPJEoaIHQA5sNiB2EkAuEiUd
	wHv68qsiGvgzdJ+FYF3jfvPmBYZTcWFjhDqwokXKGMsis1wrLS8knc1jMG6LNPDbwcZ5qCmQrGB
	K3W6UYSE3tRGcFv8rrunBCHk01sApTvTnc05hSjH6sixmlUKdHF5wTVdVHW2ATUONs99XLE88zf
	fuTG3ZqsTQRAV8nSJPLnwXlBMV/x+4aT6D3OxpLc8pT1KvN/ZvLHGCwzZUchkAIOQAgcAO3nRqo
	jKwtQnK4omLPu9PaNdNVbw4aYE/2Q/+u4tyIhne8ptYb5HVPSofkyibPRc50ROA1p+YL0fDNzpk
	4zhaOKNNIM/agsXsi4AY5oEOIimIRjo3y+LbhSw1LyWixU3EypmbJoA/hM0VUis2aDkKCa6Wevd
	1UfLOkTceepFW4qjD3b+HZ6YMqarrc4X9GeutVA81zqyVNKHTEj9zlxofzR6RXHoiRcYBklg1pO
	Ebec3+U37ymLkgHfiMuJtBRQnFj+e069NmFoQ4Kt3EkMLXmtxK2XQMD2i3KPopgmsz
X-Received: by 2002:a17:907:2d10:b0:c3f:153a:8663 with SMTP id a640c23a62f3a-c49bdf3abbdmr75122166b.23.1793151773813;
        Tue, 27 Oct 2026 18:42:53 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm217876066b.23.2026.10.27.18.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 18:42:53 -0700 (PDT)
Message-ID: <096b2691-238e-4f43-b5b6-e1565b62664f@gmail.com>
Date: Wed, 28 Oct 2026 02:42:52 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: gadget: u_serial: pin ports while TTYs are
 installed
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neill Kapron <nkapron@google.com>, linux-usb@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mehmet Fide <mehmet.fide@gmail.com>, Brian Ellis
 <brianellis@gotenna.com>, Johan Hovold <johan@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Ai Chao <aichao@kylinos.cn>,
 Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
 syzbot@lists.linux.dev,
 syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com, stable@kernel.org,
 syzbot+bca09f5d8b843bbf7571@syzkaller.appspotmail.com
References: <6941beb7-8cae-4cc5-ba07-e1c8a8753fe1@mail.kernel.org>
 <20261022091359.1187468-1-krystianmkaniewski@gmail.com>
Content-Language: en-US
In-Reply-To: <20261022091359.1187468-1-krystianmkaniewski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This patch also fixes another syzbot report with the same cause,
"KASAN: slab-use-after-free Write in release_tty":
https://syzkaller.appspot.com/bug?extid=bca09f5d8b843bbf7571

It is the close side of the same lifetime bug. gs_close() drops
port->port.count to zero, gserial_free_line() frees the gs_port, and
release_tty() then writes tty->port->itty in the freed memory. The
tty_init_dev() report is the same race on the open side. With this
patch the TTY holds a tty_port reference from gs_install() to
gs_cleanup(), so the port outlives both paths.

Tested in QEMU on the base of this patch (usb-next bdf12cde3083) with
the syzbot configuration and C reproducer of that report. Without the
patch KASAN reported the use-after-free in release_tty() within a
second in each of five boots. With the patch five runs of 300 seconds
each (about 8,600 reproducer iterations) showed no reports.

If the patch is accepted, these tags would close that report as well:

Reported-by: syzbot+bca09f5d8b843bbf7571@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bca09f5d8b843bbf7571

Thanks,
--
Krystian Kaniewski
