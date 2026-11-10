Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292819;
	b=sacfhufEL+9J6G5D/O0zTa2Fk9ow3pAzbivVbCYws89BRuq/fixd7cZFJEV2oczqwoVE
	 QLuQm9lid4pxSJMv5wnUbehH6GbKTqGIWv0dsRbI1lbpgjfHTt9eCGWTODAuU0hW/bjrM
	 ClbmiUliQI6CVAw0pLn2zuFInZU2D/9XP5Fq+tQw48ef4ofyYLBNQjY2OkKlWcPf+agxY
	 AdbxtsIjntZlzAzUEf1kPnUnu2FtQQCrxb4qKBN2u7aqnJtOGlWBLKpLFGP8EniI1kpUv
	 pfURkNgRUdvxrLr268UVVjNEbASl9Jt7jSfCcs+VtF0LRAsarRuzesFnhWlbPb9lUeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=30Y3+K4f1eGRVFoUBblLntMtWkSSsaPfJrriyA8Q1b4=;
	b=eLbSOoXn4NCa5IGn8HZzUJwy/h73/hogd5wuWIdpjaTHikYH9IifO/6GanEiCTrXVb3+
	 1iZifOOOXtJj5iuUv5ZKwPgOR2aAGvG8m5itJNqbldBEyQrLNdgglVRVr9lPhw9zwSGNh
	 6PHKPl3o5OJweWf7emMNEbPStF3/hrv0LNnv5hrd32k/ns6/UwExjKKfa7h0ISn2wwtyS
	 KnWiAjmrWF1/uRls8X7eflzfjzDu+kiIKXDpLvbgMSWz0GoXITieShzrCeS7o82w4JqiR
	 NZizg+wRoh+bhZM36MsPMbU7N6GgCCDew5+RnaesYysfsBqGPPv9/7vM/h4dwoBbGLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ju1LXvaL;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CA0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CA0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ju1LXvaL
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e987a2ba0cso9674365ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794292818; x=1794897618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=30Y3+K4f1eGRVFoUBblLntMtWkSSsaPfJrriyA8Q1b4=;
        b=ju1LXvaLqBO5kgzybhsbv3zRgCGu8niOwIDhEXiGbLiUasjW+BBbiBvEr02X3zBkXy
         5k+Dllxj8Zim/zlv/qvEAiAlTS9UPoddJpxd5i3sCYJ8/S8Vqc0cM46mlokO4TLTeFov
         dyGfkFuCNuAy0dLC/g3M3DKMtzFoYBvle/qQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292818; x=1794897618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30Y3+K4f1eGRVFoUBblLntMtWkSSsaPfJrriyA8Q1b4=;
        b=xiA/h04wUydUvaIH4E+1UCSRws8UpUi+zAH+pyfu/dks+kKaH/uMpZnP/H5g6AKLSG
         jLPIVxtMidZwx3idps6RrPEFtMY06AzOEXTIySNCBtHQSdAbEAAE8bJ4eBFAv+I7WSqE
         A0+TRICBHuvC+2HpSbCS/6S4FKQt5KFuGSIF0IaiITeZ5AwE3JjbFUl1H/Oatx/3MAq8
         /PNo7axPMravNbFxyiDCRtGd3GJD9elbP/eNwJ6lqrYLUtL06FhQ4OoiipC0iKdqIJZn
         q13a1PND5JKWc9cocG91b/seZEe3q4PMpIlJ7xYtDeyjKDC3SUCnMpxI8Do5vcbkIc0l
         fsCw==
X-Forwarded-Encrypted: i=1; AL+hErHaQdn3ceJzSbO2cP0uwECrsbiPqpM70DUrxbBaz3kbGPpmgSrq0l7p24h9EotYtDLXtRL6SHfo85zP0GY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ivJFjFfIOj8qxKEGs1E1ZJXPcWWhy6IT/pFZav63yebR6e4H6
	yKMjR9eDn8mi4mcUs5iWHe4Ff4MyEmZi2J3rDAn+oQ82TuyNaDi1TLLUwnws5NA7Aw==
X-Gm-Gg: AYBFou18xcW1xug/UHtrQ3GEyffYxn+W613QMslq2pfnIfBUNUvdjcAo5Ymja17r1k/
	BrD6qSxQh1k3NHJKZ91OphbNstusgP8oqY+YskHpaPgKkjEQ+Udy3+q7uLBLsx3tYfcKnIDq156
	9vU2sG3bmoAgCUh3znbee2JT5+RNzjS2EsnY3A90mzl0aMYUd4wqkipOfXDGN4ob3IiVe6gVS84
	ocAdUEeCWjNZuqcz0deiFn42i9LOl5Hzqi3UikUQxueFmzNfG1SjpbdFyed0/xKFwZ7Pc0CZ//4
	dNnNgG6lugho5SUpYQcJlBTDa5qUKZwrlELfNW20rRtJn8EfGV+Ll2BrJFz3Hw9pQf3VS+aaJY0
	Alhnigr85b3vyS8IX96YzC03481ZRbxtRZRxnK+Nvxl63u5ww8cIAuwnemxuyIRpe28rW/bH7UA
	qqeWKsXW3QLUU5ptiSv2OY7dp6ZcC0yD6Cmtaad8DLiwvwpO6hDbZU4RZsQMQh7fTwQoioe5w0c
	j0K7Qrd+4tvszGws4auwRBXVBVkZDcN10P+cGxom5oABjaV0/MG3wmlM/1n4rTTQp3FR8G2eL3X
	ABaTHdErYJ6EqU7oisAO6u5ULmqD4ApoOR2Rso+UFXs99jGO0FeaoAxc2H0M7Hf0pgWrwQ==
X-Received: by 2002:a17:90b:224f:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b166d0512cmr2059326a91.41.1794292817853;
        Mon, 09 Nov 2026 22:40:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm595945a91.14.2026.11.09.22.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:17 -0800 (PST)
Date: Tue, 10 Nov 2026 15:40:13 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Jens Axboe <axboe@kernel.dk>, raoxu <raoxu@uniontech.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH] zram: Avoid duplicate slots in batched writeback
Message-ID: <avK6Y1VmIYIBrorl@google.com>
References: <F24EF6333964B482+20261110061830.272091-1-raoxu@uniontech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F24EF6333964B482+20261110061830.272091-1-raoxu@uniontech.com>

On (26/11/10 14:18), raoxu wrote:
> The writeback interface accepts multiple page_index and page_indexes
> parameters in one operation. Their ranges can overlap, but
> scan_slots_for_writeback() only excludes slots that are already being
> written back or marked as same-filled.
> 
> A slot selected by an earlier range is placed on the post-processing list
> and marked with ZRAM_PP_SLOT. Without checking that flag, an overlapping
> range can enqueue the same slot again and submit it for writeback more
> than once.
> 
> Skip slots already marked ZRAM_PP_SLOT while holding the slot lock. This
> keeps each slot in a writeback scan session represented by at most one
> post-processing entry and leaves the existing release and reuse paths
> unchanged.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

LGTM.
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Jens, do you want to pick it up and route via block tree or should
we route via "more traditional" tree (Andrew's tree)?
