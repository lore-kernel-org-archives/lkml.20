Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794332238;
	b=0xO3OrO3W9Nk0oML+4926R8xYlKYSdNDx26PqWVuEky2JMLsW8oDCkHQogPU0UYVedRX
	 vYMuKGrpCLDv2RrpB/ScFfB4+wHuAVjIYmXA/IEWSfkE+GGQ2sBl60B3QV2QXqNp9NY7J
	 ll12BEIl/SZaJP75xxfXu9h/Utu7jSUwTMZedDaSwQbzWgzo7NL24jOaYrnJRUZxChfUK
	 KTXFTjwnlCSSjJPNNGa9UWUxVrg2T58LJw7GVLeNN3L1cYS2GGI//1u+iJK9VIWwQKPi+
	 vEqwojtMrXxAowSfPch62j2YM363AUvY08W4bpB9eI9Sv0KsnfDBOwBrvvMLykkbIhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aTj3qd6Vt1MRZaASDWxaes19J99UpofFOdzQAHbhsTI=;
	b=I/SgD/N+hIYGDo0Qph0hNCGorFOyg0RHXf+CdGkwAk4kSW+t5AkrQ9X6SuqqC58YHOWl
	 XCkXCHn0YJ/l4A85f/gRAxuzYA3EL+zfnEWu/CSMVJkJm5+K7XTOUn4dA5iTb3XyWCnZS
	 kqRseXnaymYrOSoJzRU9G10xkMs8ECbD2OB6ku6k2veekl2gGKDNc1p5vLxhSQAMpL8rh
	 7bHWB3OzJrQk7XimhTYhp4Cu7efZJbPCe6gkBdLvUBc52jj4W3PbOC8zYgJUGKeoYdAKP
	 /gXN6Dp7gjYBCfqfZ7Fn39DSIxMbrInfux6w1n1CJZVIMgfD4KVWQWikv50UkNZke1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IALzEI6U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99A606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C99A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IALzEI6U
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2058368e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794332237; cv=none;
        d=google.com; s=arc-20260327;
        b=F45i9qvh8Xe+iJJ2yfRclcuJkd+YhGeBdvryksTVTm4TUb+P33IB+acByKnek2zRsZ
         9L/mkidtMppHl6wCCZPcbseYigguFZXCv+XcBGFzmv4fanjbMOgnpGzeVZRcqxB6x3Ia
         ziTKJtCqPBwlSckxeiSpaAeeynCVK/dqWW7QjvODhoCz6ReJgYPSJhpN82hEDEhnoSWm
         MtMcFxvKKzv5svZoANZSp9GfWLS8yo6TJWmQwb5RZRQ8ioq71m0YFB2PmZ9PpltfKZXB
         w0rVQ2pn6l1gJrcI+roDu/INz+qfCck6Gb6ZS86GPTl+nDn8guZYchijgcNzzfsV2aqf
         nT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aTj3qd6Vt1MRZaASDWxaes19J99UpofFOdzQAHbhsTI=;
        fh=9I0BytsWWzEo8FQhxpEieJoojP89c1YA3id9Ra6bDF0=;
        b=ruq66YyYACNotmFF5QX5t/ivZeRvPbPT40ablrDLKU/CANaLkmevpp36S3TbmRE/Mi
         ICNB5HjSWGLAI+nc3W9K8PmWw/5wnw7zQlH9cKTzossKLliREjfDKaOOLMNolnvYee/n
         h6ihQweup7afsE7fm/fZh55eZZcSkm/SoPOXiXqbNnTqIfSi7Qk7MvhUIop5SfOCjoNU
         0MB4Dhkz48p6max6Q6FjLCc9i2+EMssbmNlzV8VnVDr0jiXdJR5umT2+aviLgXNq4oc+
         N5Kr4U0Dbut6J0uSQ4EPqQzgxEaSn09p46WrV43ZN+t45AnwmTahGU7RhMXOGbwrgVU+
         pjuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332237; x=1794937037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aTj3qd6Vt1MRZaASDWxaes19J99UpofFOdzQAHbhsTI=;
        b=IALzEI6U9cts48X2+tWtXmvjKgMvF5xWHwrbRtgsrZ8/yQd9AzRsTBHK6GBRTB9V2Z
         TB7KRiyhzAIfOASyMGLyElUeCHPztvFDKxfYo8pdZv+AdUH6C1zSjsdXds3cS68RnmFo
         EasI+pOD/DYYWg51m1D+Qx+pSRU71B6nDD9LQNtKZfBtuD6hmFcXb/lzK/zaFPtEJrn5
         a4S7SzWDlPf2aA3+zfwi3KaIdonbqmwIcFtGO7OsyIq8NQPcNU8CEfuMJ8yX7LB9kO/N
         1TZpD75ylGMmOSTIoSvEnmyCZEaafUFiyHojb3BZ5MjxdZ/7hJf9LpEpG/HeVWHoS02Q
         VQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332237; x=1794937037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTj3qd6Vt1MRZaASDWxaes19J99UpofFOdzQAHbhsTI=;
        b=rxZ3VuztOkI1qwkhGgudWD0NBfSc6qsFjflpaaSCB9R8Uc9qylKwB3UK8Vg8MQjUNV
         EHf4TxQrqaHvDRkqiM44snBw8pSEiPcN7D6Wm+UvdX/v0wK0k5ZK8+gtKgL6PmZB8Adv
         HcS3tqJbRo8kUr1zNVMV+zGpWHSc0pDC1P+OoYwN4RDERuPjn73BZBp90LbJUVyZtaIO
         0TnO4bA0vDMWdynUBLmrN3dOmlG4vKJdmPfK3/CpbNl4SBJuPeqJFa4f9sffwHmXb25U
         UI07r7nH9b9ANtEwKD2PP4uMsqQk0k58bgTh4mwMUB8WcWioBxNFR27BGR02lkhHMkdQ
         TI1Q==
X-Forwarded-Encrypted: i=1; AL+hErHJscMQv9jxZq2y5GzXZgf1bTUlBs2hQq5W0RQ5+X6p1t7mCpi3HT7EE4QzrtUYkym3DSwvPcYGffglNBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/+5xcqRqeFGLGVGDQKrYzG5yvlVQIjxnaltQFI405+EXc+ksp
	hi+UPLTT6bxboaJSJaePmLfZJWeM7kisdwG4YJjaQgEyvoN/NT1v8TtTGcpipjDQhFgWXMrdvLz
	CBRtpH+5weEBb4u49la0t9dQGAZCcO0A=
X-Gm-Gg: AYBFou2btuxeAWYz6Tj6vPdQy0em+xAhCfbTdMvHSZzSfU3Y7qMsOo/PrmRo64kcOQK
	Q7p49Gi5QfOXYxTY9qMnmE3XLplCsfwvDiabjf/JuVle3LY8NZf5+tOkauAwTKmm9TvPbEPiPjK
	vxhZCMsvZcWGPjggpoOxDOWg7sBvu9l/pyZwD+lcPP+SOwumqI4N09ThVGGeM23qOZrZuS2KFWR
	4I2jTOWwE53NlNXcIZgI5KScf5P6a+J75auwles4AdNi2e768l0seYbN8jCVEv8Ha1kST7LysLu
	qy+mEGHeDUlY9pBNOL8FuobE47m/pndsBzs9iLHSKVXmx+IytUcBDkULPN9o4SES/gL+41pm0Rl
	POrcYXfEZESTzW1SC119JH72IlkJ7i2qkt2UvDj5nZWQ2T7nZ1vcUoFpfdAYxXpyHC6I8LuTWy9
	BzNbgNsJbMKqJNlpMoxtMxRrgLHaxu+WA2dDwWo0EYLKWSBihJYpIe
X-Received: by 2002:a05:6512:3d1a:b0:5be:5dfc:864f with SMTP id
 2adb3069b0e04-5c156edbe56mr956551e87.50.1794332236347; Tue, 10 Nov 2026
 09:37:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110054836.1515030-1-senozhatsky@chromium.org> <20261110054836.1515030-4-senozhatsky@chromium.org>
In-Reply-To: <20261110054836.1515030-4-senozhatsky@chromium.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 10:37:03 -0700
X-Gm-Features: AclHuK9LQ0vxiDk2KIYMiT7GhqA-_skur47RligP3Oz7EqQzE4-EQhLXbRXuiB0
Message-ID: <CAKEwX=N44K-0d1KMV_iURtJU+xSuv-X_x2R=g1tBUt_QBEx1Fw@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] zsmalloc: return handle from obj_allocated()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:48=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Allocated handles are valid kernel addresses and never 0, so let
> obj_allocated() return the handle directly (or 0 if unallocated)
> instead of returning a bool.
>
> No functional change.
>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
