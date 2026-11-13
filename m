Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569313;
	b=MgwZSjG5G+o0uYfQ+vWQsmeDje+t2+2rUdP6lrcwVUnRUp2IDu88ig5X4GJEzTOxo61Q
	 4eLQN4r95ziMsLUOZHYfq2o4YvaG7xQcJKDuztZ5RN6bUGm5QFNHzsvicf+MjYS/7wbcd
	 sNEdZXOFGgfbtLa7+jktIMY1i51UJEGrwaKlnnzDe8L0r49Fj8LCWNMw4IlBbPXof8X5u
	 FlgZHasNECeFpQx6SKg3XUSkeCtFujba839vU3AHRG/PDVmdsFqSPj0YTcO/dBUqdMatO
	 H1yPZgRGkjnn1VQFtI9DjCT/1noE+L7sv/gAPHYyqGA46XftcFOq+xa1AQtrJkhO5NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Sb+fCAcXvYMXke6iLBRIj8JRjkfV6/2OJrQ8O5LVpDE=;
	b=b1Qjjkmj5boGnctQqPVD77lpe4I1BuB4lCjFyXjNYXNkJAnouChF0fugpqK9fI6YyPTx
	 PfGny0HuGXUAY0W0KiT3SqnFl8DuSR74Nl3RM33IGanNxuufkZHjOQq53qzpltTHlNbP5
	 f/lBF7Xpcy3EGLtJHX9WwXTuGzQKAgCBDWOulGp+tq9NEwjX2yfuTp+Ntu49GCL3ObXSe
	 sDj/ns/Fs+vvREjaPTSWCAK/oTzzidr/28sEAADcztXwVGaNpw8NBNAOvBsbBNviSH6NU
	 mHo1UYu9TIvWs3NgOG6DVOW1qUWwWOr+4MFltv5LjDHcwOp1p8mqfAAkUhkycOxvcdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ISMcD/SJ";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBAB606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BBAB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ISMcD/SJ
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso954731c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794569312; x=1795174112; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sb+fCAcXvYMXke6iLBRIj8JRjkfV6/2OJrQ8O5LVpDE=;
        b=ISMcD/SJdXZBW/k6cWD2EF6D0ymJKCsImzpO6GZAUuGqBuxtv62pSOCGuyUfApOTkr
         4YggTxbk5WvtI3XYooVrNFlEtLxI8s4VaMwMX90k8FfDZLUoPxyQk9i0TVr9ZOEXMGTc
         6l6nMcl8kP4qSkn/fFkOHGH0cTL9giZkIkFWr6zP6XxvbKjR20Ab+JguplocQsUOOSUi
         WuqPlbP5HqeNAzRdQZA7WLWOhhr1RkCGMZY0isEarUKlFpHrjVYNKTxUnFCcCLPHoK7u
         i1y8pcTJ0t0Vol006t6O6ZEdFhtH55Mdtf2StkxeqcWO8I6+W30j/wehIs9vX4/F7gbI
         M89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569312; x=1795174112;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sb+fCAcXvYMXke6iLBRIj8JRjkfV6/2OJrQ8O5LVpDE=;
        b=tjR2k/yacfVu5WAMhTVQyG1L9AV2InpzF3alQ7ZqJBzEUT0+1P0b7EHcwNAIrUd7Wq
         4PaUzAof4+fYFzieR2u25rX3uCiiqW3TxZOl3G1WG0qnyuCUKOVKEihQ9JCM1gP8hUOI
         ESwN8ICd5LsL2lxmniXCFYKy0c+tjpyudHtJZWHnYh/87V1q307HGT3S63cnjUpg8uiG
         JZCm24yt5BqeIMMHAtrEqCQmoCq47vgeWuANPcoojulUR1yfNviY908zFMV0PWRx0NHA
         pHhlMF996SOhkGAYnnaWqgt3oWAq6+jjfapDAY4eIPeX/EBbvjyXrmVRHKFarkXiWtQG
         YK2w==
X-Forwarded-Encrypted: i=1; AL+hErH79R2PkapIQKZgQG66yQg7OyhRbTnnHkvsHzAHlBmPSl1wpEmXdoJgeo4w1rYM9CyorsUdJ/USqXWeE04=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k/ScsKwDHzRaykrUGguLbZ6ETaudtNKeHWOD0syGI2j6FT9Qy
	7NXl4pjnoniberpQiPeQznx/Qr3xZ+VvbLLWiwMJ4yM+14Nz1KLBKpzkNZu4f//HQ5M34u86WEz
	C/WrYPGPEgBxYSyPggLeN9w==
X-Received: from dldz8-n2.prod.google.com ([2002:a05:701b:4188:20b0:1a7:c918:186f])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:21c3:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1b503055090mr2164922c88.5.1794569311740;
 Fri, 13 Nov 2026 03:28:31 -0800 (PST)
Date: Fri, 13 Nov 2026 19:28:29 +0800
In-Reply-To: <20261104112744.1630864-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104112744.1630864-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113112829.3683667-1-stanleyjhu@google.com>
Subject: Re: [PATCH v2] block: Keep RPM_ACTIVE in blk_pre_runtime_resume()
 when already active
From: Stanley Jhu <stanleyjhu@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Bart Van Assche <bvanassche@acm.org>, Brian Norris <briannorris@chromium.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Stanley Jhu <stanleyjhu@google.com>, 
	linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2026 at 07:27:44PM +0800, Stanley Jhu wrote:
> Transition q->rpm_status to RPM_RESUMING in blk_pre_runtime_resume()
> only when it is RPM_SUSPENDED, and call blk_clear_pm_only() in
> blk_post_runtime_resume() only when old_status is RPM_RESUMING,
> pairing each clear with a completed runtime suspend.

Gentle ping on this fix for 7.4. It carries Bart's Reviewed-by and
Rafael's Acked-by, and the blktests-ci report on this thread was
retracted as a false positive. Please let me know if any changes are
needed.
