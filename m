Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B742049D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689264; cv=none; b=BmW/4os04yA0fGKuc+qwXcuKQq7hkkETD/uScHUrkcBeJ3i7nwlpRqc8qkvsymE1EMul9joSaoeCa3As/ePw2QSnHw1xwY9aoX04i6l9xloQBHhufRYHljKTAktImjqUBuWcjqHuPcZvpz3VFdZQ1SeWncDRzg/7kRD9hkRH+zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689264; c=relaxed/simple;
	bh=RnAEc+I+Cqq4lUTdx0Q5kkcBBZ8MAk4TasWgEbgmbEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIASyM7avVdUuy77BFghOtqZBAEFsnNy+DWfIVPw2LMwbFBl+/QrLbFi5Da6oI/Hfms+s27alfXv9sqMprUjabkEy2V6aFULAi3dPY7PlziCl1cI6lEQmK2M4qxefMKDI0i7ibyqUw4f3K8c6geSkHdZdN9ayTB6IQtFKj80lxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nwAJhsK5; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nwAJhsK5"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a2e985245eso18674411fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788689258; x=1789294058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mv5PZ/MVDDOKzC7mTafEfq3SK5tNJ8cn62CE8cNiWXg=;
        b=nwAJhsK5Wez74zvpOpUj/YJeAaHDQYQHYt0BZzS+u8Q5dAREwsDSHbALeHxflrAu7m
         wN8zPE44HP2KaVpGvjW8gxhBzzv4/2j7l8rLXmT44+yH7q0qu6XHls46LLuCP1ZwefM4
         j5DtDUHfxb8kJZxfF6Ggi1k+6js0WG0R6RPvs9mSpsf9U6Sky2jh6y7ILs4+J3ihzHbh
         GjrjZgZuLuQCeFZNs4gA4TJ7WOkEe4caqY9hEKJpE51RsWclf2V8+h6wjwkloiRV/YWc
         UuwUU8MT/rw004s09vW3IolddvdXA8teKIGEfo4sTdui1oTGnZMOSBuLeBeIf6oHxiSR
         WPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788689258; x=1789294058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mv5PZ/MVDDOKzC7mTafEfq3SK5tNJ8cn62CE8cNiWXg=;
        b=IlDZDz0BXPwTdPBHFCzTSlCYS9BRQvNh1SyezXMT54BJsIaDQvV6kgnSz5Keptm98u
         7VSB8MslzzA9dz2WJaoaP1WGh3XkHHZTgyE2XQmlPWkT2Im2zAWOImIZEQNknqqxgHFY
         okX+qnR33XHLblAhaSyyb8CjI2zrj3Y1TBjSremgU90bmCd/6anKgh7SfSN8ih42/zHC
         cNThwJ6tOER/3R5NtaHxKWEcS1C8DkScuMeiNvPIH6b2ZW2Dhiab9x9mft0tIZmZ8WXx
         bFaiIHC7whiEblsjBr3d1qv2UO58du/bThic0tz3VjfDsMGnWqx1CjvXdML10kE4pi+Q
         5gOQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+I/svAYyQCcAh8dMDc5kf+TywDnP9j+4tkdHxiwbcmUCy2iC4CXw6O64JxitRr5JPXVK3le2XoMK7Ad8=@vger.kernel.org
X-Gm-Message-State: AFuF++kECjtCh9BDcJERRONyr6x3LvzXDqWn9z61Dz5CJfv+w2FXlO95
	YwsX+hA1u5nMgwTSY6DSmI3Hk3hiAxcUtDRSj4CTEYNAtiJ1sZFfupkt
X-Gm-Gg: AYBFou1NKrucnsyf1pMd8eX4mVaAm1wOUsvWbQ/Wr1Ptse2q9amPdpt9u8soIqRtBQ7
	HqUxvDE+oNbqsx3YnUZn4gr58HkP3mux275lUAbGZPEJ/C8evFja8Zz9MbkoEXT0E2nIFfilelA
	KsM+whDPIvvVcYI3a29MGJB7IJpufgtYbC9ppzRpPb0kqZU7iRmAFL1kfDvT5cxOJiUDoQsyrKW
	mJ4t9ydW6xlybqKtav03P7y5say0axtc41d3SxErhAfzqxRsF63Di2dcCpOIRPfeBQa5zZMw7kJ
	2C9cvVVwNA1zgVS666x/MGOmX6qOPSDmVXmV3icBj+PfmFuRwrON7UELGBi9ZAvJukFWvWc8zOf
	CifAmA0WI5QNqb/DkyIHTNmR5JChu0F//3duAXBVT0EV++b8zCuzLULparSitVWqumMqXxFNT3I
	7pHxObmG1eMA/p0i4xO8Vo13egDCV5gabKyU4qUyQcsiF+WtYkvxBo18F6niVLEV93LR2Z2WzKA
	ENkV4Zfz6/3ZDoxdP/30emGl9Foa7Sk9hTlVjwIFATd7IeY5mROC1IgLSE=
X-Received: by 2002:a05:651c:552:b0:3a3:74b9:8a78 with SMTP id 38308e7fff4ca-3a374b98afamr15556071fa.17.1788689257905;
        Sun, 06 Sep 2026 03:07:37 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705a9b4asm21482421fa.31.2026.09.06.03.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:07:36 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 5/6] iio: pressure: dps310: add hardware FIFO support
Date: Sun,  6 Sep 2026 13:07:29 +0300
Message-ID: <20260906100733.435411-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ao1i3hKEpAgHLICz@ashevche-desk.local>
References: <20260824201203.396651-6-zoone.rupert@gmail.com> <ao1i3hKEpAgHLICz@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 12:39:42 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> I stopped here, I think you should understand what this code is all doing. Now
> it's an AI mess. Split this patch to a few smaller ones each of them you understand.

v7 splits this one into three:

  read buffered samples from the hardware FIFO
  derive the drain interval from the watermark
  implement .hwfifo_flush_to_buffer()

The timestamp estimation goes entirely, which Jonathan asked for. With 3/6
split as you asked, v7 is nine patches.

Retesting on the BeagleBone turned up a bug here: the drain discards the
compensation temperature when a batch pushes nothing, so a capture can fail
to start at all. 4 of 6 buffer enables produced nothing in 3 s at 32 Hz
pressure and 1 Hz temperature. Numbers in my reply to Jonathan on this
patch.

> Can _rate:s be negative?

No, both getters return BIT() of a three-bit field, so 1 to 128. Errors
come back through the return value.

> 30 * USEC_PER_MSEC

Pre-existing, like the min_t(s64, ...) from July. Both are in the cleanup
series rather than here.

Rupesh
