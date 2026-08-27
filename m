Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E070F33F5BE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814441; cv=none; b=OMQ6/XromQ+DZAaYbqaiuEfQfsuI2yd9LPqto2Fe2xc8eYDgShmWi6W1rVFMA7FXkjV3+vn5r7FEWOBdvTu/AXqK+d1mjqc0wwYKz04PKgjDGngNI11SN96Ny5vc42cW1JDj44A+QoGy4VNT4Dx2JGeB9KokEArj2kGLJ31Muko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814441; c=relaxed/simple;
	bh=frSre1v5Om1Mt9PRWv9NljklK2QQii8E839jlKyf2es=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XwguHAGB52qqs9y3bEsMVfpHUbzndgQryvq1bNsVbUZ0sRtcmTBNmuJKEEmnlU2m18ykq1++7T+WMj7C9/wiVXKMbUUOeG5zRFV4fPR/7jR9DVhbDRp//YaLjqsrhFfo2cdO/8CFEmFCo2f6OMgrmVfA505ujcMMGm6DqjKjeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SN6o4TFh; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SN6o4TFh"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495569acf8dso7373605e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787814438; x=1788419238; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdBlfvNYe443u9na/jxTiwQT1qyXEmR9O5lMoXJvQMg=;
        b=SN6o4TFh+jKAKYstRJWDqEIVK19slEQZ2ixpUz+CIPm8dTWB8F7GiE8Q4UwJ4z4e4C
         rGoxHDQr9h2RG4Cko+DUgZ6sOhNRSuiRp/USGAZ+lAnqkHhYnZLx21ltBFUeRhmnXEcA
         QU9LGnWWzz1Wn5kNskJIpHyLPM4vsA1W7x4cVr4Rei1Y3/Ub/5hE49+CU/7yCOgQoOJR
         On/v4aHYw5n74maflCi2voKtm0GLTvasVP7Y7Wtk/Lv5XeTTYR72kkvxia2QWsGjMdc1
         Y3SX5UQxA9cViwgtH/dNUeRknElloXhUo51Tl4mKjaYrguFVTQ6osCyzXoAZ0KOOJlxy
         8ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814438; x=1788419238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdBlfvNYe443u9na/jxTiwQT1qyXEmR9O5lMoXJvQMg=;
        b=oOtV8d8reh4QaWSoWIMLJwnw1KDXskS/VPxQYNeMLBMoReIjGBu/YAyBFG6RaVQR7g
         qUDShO9mAlrJ/5cWPe0toaEXQgEYZEn0hJeRa+KHQd2HLm43/qTQMHqmqeAaytQ8QJiL
         wYZ+wpWBdQjZq3eOz6lLYziRrJbrLcs5/s/OB2zqgbyiNxRQC05EfpRZufqWVhQix9+l
         haZZmHjC8FFLfyyeqDRM2HgPeZDPh5DJyLq0prd8gmo7+b1aeIjtW4CHwdH5z5tDeKXl
         zOmneDufaX4Pl5ccXScNuAf78xyRyZ309ha9nx2JFWTwPSoQTko1fCXvVicO2fDchL/L
         wZ6A==
X-Gm-Message-State: AFuF++kPN9vTN8qytLTMnA3SUznIXezGIiiMnU0Bnj04DUpWvg+SdRBi
	NHXGh+OG06skbr1lJIvaLY5o2lVESn1bu75BYs+T830gyMXPhwGmaicW8Vz9+BpYGRiUUhGXTuQ
	QYrR27Cp689t7KuhUwQ==
X-Received: from wmdp22.prod.google.com ([2002:a05:600c:5d6:b0:49b:1255:efaf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b5b:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-499dc703474mr121726535e9.7.1787814437822;
 Thu, 27 Aug 2026 00:07:17 -0700 (PDT)
Date: Thu, 27 Aug 2026 07:07:16 +0000
In-Reply-To: <20260825161712.41471-1-scadastrangelove@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260825161712.41471-1-scadastrangelove@gmail.com>
Message-ID: <ao_iJG-f8707OjL9@google.com>
Subject: Re: rust_binder: use KVVec for files_to_translate
From: Alice Ryhl <aliceryhl@google.com>
To: scadastrangelove <scadastrangelove@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 25, 2026 at 07:17:12PM +0300, scadastrangelove wrote:
> From: Sergey Gordeychik <scadastrangelove@gmail.com>
> 
> The num_fds value in a binder_fd_array_object is bounded by the
> transaction buffer. However, its in-kernel metadata is larger than the
> u32 array on the wire.
> 
> On 64-bit systems, FileEntry occupies 24 bytes. About 900,000 entries
> therefore make files_to_translate request roughly 20.6 MiB of
> physically contiguous memory, triggering a warning in
> __alloc_frozen_pages_noprof.
> 
> translate_fds() later allocates Reservation entries from the same
> count. At 16 bytes per entry, this requires another 13.7 MiB contiguous
> allocation.
> 
> Neither vector requires physical contiguity. Use KVVec for both so
> large allocations can fall back to vmalloc.
> 
> Keep close_on_free as KVec because its u32 storage matches the wire
> representation and does not reach the allocation sizes above.
> 
> Tested under QEMU/KVM. The 900,000-entry reproducer no longer triggers
> a page allocator warning, and a 300,000-entry transaction that repeats
> one valid fd reaches translate_fds() without WARN or BUG.
> 
> Suggested-by: rust-in-peace agentic pipeline
> Signed-off-by: Sergey Gordeychik <scadastrangelove@gmail.com>

A few things. One it looks like you're missing [PATCH] in the email
title. Also, as checkpatch points out, Suggested-by must be an email
address.

Also, should the close_on_free vector also be a KVVec?

Otherwise this looks good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
