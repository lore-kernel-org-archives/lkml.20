Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793941051;
	b=ptgV26jHyYhSfYe8SwouRU/Rvfeyr9KENCn3Oo2Be+mIDpegYDb0zoJVvrESSftbRy0n
	 0qdcNs4G+418tpth8pH/B18jUwI4A9Gg7nUd/z5Qy6D6LEzssEOHSleV7hG8ZlFIKA6bh
	 5FP0AoB+R/TYBH86ZDPkq3NtMTivJfvnIbwFgmK5QUrTO34yXXdZIVecB4BxrfDSFX6mM
	 Z8kaOAmm/ZJGXWLVi2LohKPteWcn5/opsIdmqCIGuFbXZ3AmZihPgWuTr19eWXWPnZ98R
	 G/6YSMfx5Y8jGjvRGfaMnYEemeKo7/r1g8K7ADwHpR4447EltcpnRfaoq+Vkjvdb5Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6NWM9VuPZ6/E/oWJvm69QVGVJxdjPEsFNw978dAXWSo=;
	b=F4fLaHImcNGL2wYKQoskoWfmXA7r37FY4Y5GghLUahzX1GnbqbRYHlrz6TQA8ItWqQKm
	 uyrOrxPu34alwG4BFiUBPCaH6VGpbWhKJMQDoXaEOX46liysHVRnmWcjw5y22suVXy0rM
	 6T9379XUiqcyHHnQw/b3wg1fXypJ2ox/2YHb29T0GfpZ2FVoLF6k8s7eK4Aap5TPq6boK
	 vkTrh20oCyA8wdn7Vn6QtHR9wpFsYJS6ZtT2HlUqgSouBYQXrcsoVttoOLAoo/gD2Tdyn
	 SquXN0Zm35ecG9jdqgnViCpO0ubZhaOs9tFlks/oUYiE8hZbsGVnyWnA+jR6Jd2fXEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvw6WtMx;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF5606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26AF5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvw6WtMx
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a8cc11ac42so281677c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793941050; x=1794545850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NWM9VuPZ6/E/oWJvm69QVGVJxdjPEsFNw978dAXWSo=;
        b=rvw6WtMxWWbI43iYkCPuB4gJ9Eus8dYNAEit8OMLwGh+KLXKkzWWwj3hsdnw50H9nv
         jXBUOqR+Dg9RGu73NqaRWns5sgwb5wu81MPis2oFA9f1g4lNviT8C17JrSbYWwR6r9it
         05W1Vi+ieojnOVxNxVSSpmPa9fHCNpkd6b8B6c6q8IoOr33GfZCx6qLjT3D5NjZffHcO
         +diaV7lUEmhxBIi9a33yA/tU7HyLdIeUb5+CKprTjcIaJYd2XJ2SMaTQyTX61YOPGzBB
         8kcIZFEYXW5kglaeqfq5ojUe08iQjF6io2AdJRh6xpqgThLabca7pjoLAjSgyoRY/eFn
         /mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941050; x=1794545850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NWM9VuPZ6/E/oWJvm69QVGVJxdjPEsFNw978dAXWSo=;
        b=GmInI9dx6Ev/5EcYf3L01S2tqzXUUGj1shAq+h8433joJGDhBdozMz2ZvNtnFTx/ta
         JkqDJov0O94rWcCYRgJwIQAsC9Lb7UUiBBsIn+d0jwVSrVs/h/R/yQaI0CqY7cx3nfK9
         D41NONR8/vtIFDyeTy7Ph2hkJGPHTv4eUI969KBqSfRictyedzbEFjETRk8pKr0CPZBo
         cmr5Kf902fw0KQVc5ykxXwhqrt4Hqig8TkY1sA09PMUim3JoL0ZzMkNcHbEWEa+O9zwo
         6S5qxGThR4eC0QZ7Pb3s0gpzieZIyLrJI2PUhvI83WYUcgu1vmFE2xoDE4XIQHMg5WBe
         HKDA==
X-Forwarded-Encrypted: i=1; AKwUvByEfzTMI4QGKSy9fL3k54eH4G7RviRkyRWbCWO1rfkFCpL/y62gN1PtjNedG1EN8198bu8YOePlN+QXWag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UEg0bpMhRgMPv81V0Mnilh7Ll5k6+osRUOc3U2Nwuk2PL64sj
	giW5Zsiqr2Etnw1Ir82uPSga+3juKEXeYnfQY8P9DeNGlyyTrjjD6N8P
X-Gm-Gg: AYBFou2n6ah+x2u2fZaMlsYBO61gi2TS8HjM7IAvnej/qvuo4ObdJvFqmF4o43q2qP2
	zFoX+pi8QVa2UO11BLyE3PP+0B5iFTC23FEhdFHH4vCpN89JdhREkvFO3ww5eG1azN2XlDPd5/Z
	jRBRHTumjbgAbSVRgdocJZv/SgtpcsopqEFHm0uuAAuKnKoLNs0sq69G80lSpbQ6v9bfPlZN65H
	ZJFNWV3X8vRH9zF49KUiF8MaNxGYMM18mflYB119lCqqeUYBAyc7nu/45apscN3uUhEj7fg6AJp
	Z2mpoNxDwuRLZsNjrCi/FAT0KGZEGJGOh1Kw0DlKUaJZlNGKQwgfHmcIkIv8QDIqxc55JleT6uM
	1Z45cxNyF4Mys3G7kH+Zc9YMn1VLCi2EsPZV/YsJ9730vFhbfTGaD6s3ZCobzpEE45E2cH5azIe
	E5575heCtJjs813lLlQXM3P3+fJNwk1w37SYPVdpueimCYCBKQy4UGGDOvGjegxVPaQX/vxO1tQ
	q5YGrOl782VySpGK9AYRGt5fw0G4n0T69v3kjoKLY0Z05KxwDUoOkRlSx+++iizRLir0+9vhEw2
	sPtiwrD2F8MrItGPfGyTljMJ4W1me/czeiruBbHQXVY1WA==
X-Received: by 2002:a05:7022:f51c:b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b25d3153femr1419262c88.9.1793941050171;
        Thu, 05 Nov 2026 20:57:30 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c41eesm3038969c88.15.2026.11.05.20.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:57:29 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [PATCH 1/2] ntfs: don't write a compression block after a short copy
Date: Fri,  6 Nov 2026 12:57:25 +0800
Message-ID: <20261106045725.3047943-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <au0zsi-oLfcprQxI@hyunchul-PC02>
References: <au0zsi-oLfcprQxI@hyunchul-PC02>
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

Hi Hyunchul,

> This patch looks good to me. But the second patch in this series
> appears to be missing.

Thanks. My mistake, I dropped 2/2 before sending; this patch stands
on its own.

Thanks,
Zhan Xusheng
