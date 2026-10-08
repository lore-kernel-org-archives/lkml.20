Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1043CC9EA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494928; cv=pass; b=dlwGISjmrBRbyX+LAcX5hzRTdmHLtPdqrtR3+R63b05nnUsMtduZJmXFd9lVHkLD5c4VRpdIWPRXJtc4arsVKhOPA3lnSoXmN0HKpMloY5C8TXMYfy1yZoO9VZ0FVK48HbMlQSmgxlVT3/IyIueCwm+bzznnFWzIE8WoBXQK4V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494928; c=relaxed/simple;
	bh=fUZzaM1SKbqdW3JJHyHXI4KVGCOzVMsele/HgdjkKFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9eLRDzaYggcEDkqpwOm6oc42YOlNgHiml8epRPc5/k2SmHnQWAMxOS8TDxbrefat/O2+AcdaEYONyOXjs+0LJs68ElkMgt+KgkfQueEX9Ew9bQx/aoX4ZD2irSdTvUQUfEWKne5L2yke017NV0YHWRt3gG797Xo0Uun2ZNnHOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boMZ8f53; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boMZ8f53"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b52ba422cso2352786d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494926; cv=none;
        d=google.com; s=arc-20260327;
        b=CBtLhGUOi6IFVQNSO4ocw8AB44JMQe27o+CQYZhUuknMK1/qck7Qu+mqBVLqRFimOC
         DmqmfKTK36jc0lGKZ4t+8QiL3UpXIfFMw5ZUoCjJt4b9SowQWJyuALDAUbzdrK75E7/T
         XGI/Ij4GduMgHD1/cIOJVfhxq7dWN1PBuf9P053qKTHzbgRLOkZIVhSz0/PqWNqj3JHJ
         xnWOzTfDGa+gV4gBSmvfZf3HDr5tMYMOAis7Uhow+jP4nYnH1GpB3Pd8rl3z/JKodXOy
         P+Z1kjRnhY+6VIznhNyQAmb3HWIUA+gP3HXyPWjjMTt4Qulj1qBqYnC+GFKVkSnF/xCq
         4JVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fUZzaM1SKbqdW3JJHyHXI4KVGCOzVMsele/HgdjkKFk=;
        fh=xPommP+LDsGmQjqklslcwtEmNEMZVz3MPRjrHXSM6kc=;
        b=RArtxBGqx8wfmXFqPN9BwiUGn0yuvHcjRW3UmruVRbzSxChMjDzbEW/RZ6ni6uDI58
         kguBg0kRsUHzdTmYCKgepFP2RNgJ8psM4+7NsviSrrN+azFxgjkeFN7HBn6sBLM0ExOU
         PVlz0E5lHHC0AXyMCkFWM8KA0bbGQwXL7InbBjvyMaxrDy4oYUPsSBFCpetR4k+EFtYf
         9w5pM0hflU38MnxsnZafqjFfGDBJHPJOCA92OgpMXzwOFRc4fF002et2qMt4kW6NAmaX
         /G4uFKeQbUhggCDq+E+PMjSqigdB02+JXPYmTzUDkYyhKPKjRQ4+P/cpUIcwxX0QQ4VO
         b4NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494926; x=1792099726; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUZzaM1SKbqdW3JJHyHXI4KVGCOzVMsele/HgdjkKFk=;
        b=boMZ8f53+xBhpSoVelH00iqF8x10h4+meXcCUWzBHey8LjNmIfIVbqZmmEexbcTvFG
         he446YJcgGPHFugkGuT+roTmak2ktCciJDrvpot1x4uFeglIt5J51H2kVJr6dNjYh8i5
         waL2C81DMo+uWA4Y9xJ8oB6HoZDVO/v9z7g6gEgQ34I1GhC3xgITDexMZcsg6JpfDvms
         oW9iR0m4gngNXJdKONDh86YLKQiehEjEwd4FR2hevPc1K4zNDMShkzfzitIOyzUS36SJ
         7pXGO79LLqfEyk8KtRfUicykue68ch1AanFvcdGVPhJYB7o++Mqq1aLlj5LjIFgB1mqI
         k3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494926; x=1792099726;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fUZzaM1SKbqdW3JJHyHXI4KVGCOzVMsele/HgdjkKFk=;
        b=YaQT/YwBQfBY30je6LqgwRAqOOK7+3ETg7Tb00LSOl8T/f5XQ5IAj6ju1eTCXwhw5I
         T4LLfVGW+98HzS3jN6NG44XcWYFqR9Cw5PUO/WuGudCuoQqAu59yh4F4xiitr2kw4r2p
         B3li9IG8b0f5PVQFBm3N1n/ifrV8dhW6mJcdFE6qJ+u7ytWKNs8uEjg1S2DZZ/aeGB58
         v3uZuyRAzhCv8jEj1D+paqpfZWx8oSf/AvJ477bO3lNF+up5ww8fu8IbaFAEqW8c8pSv
         I9IBbsJvd9V5XUIXNS7FM+gMN892Be8H6PKTSbSJbhcd1WUnT9Zm8oSv3QyOqYRXmU4z
         H3tg==
X-Forwarded-Encrypted: i=1; AKwUvBwvLPLPhQC5bxhzWH8kaqEHGQzIrPqtDUmCcDBz3Xwi+SL9ubytJuJwGqyR6VBkSUGPhdEeZD0woLJwbYA=@vger.kernel.org
X-Gm-Message-State: AFuF++n+zfKndporYMDn3yhHj5PqOovt43uc1gHFX4UOd5x5lgTjJY4h
	8LZrft3iIokb/5MVtoYHTfRLooItP6b6zfEQ1XC9hiaFkeTxil7+hhCKd5OfS43RmEFGUg/D7HN
	S1jco/agA2/iLuwIUDpmobDaKmxVW/40=
X-Gm-Gg: AYBFou0ZunyGI8Ozb31plrY6PdvNvm9EVnkfXlTn33s5Rj+8uQiEcMoMOjOfIrGTDJS
	lCxJNmLf4DfCLSAwtuCQfoo/aGqOQA8aRTE+9ccGCcE7Mn/SuMKC74yH8OS40mZcfn+1kW1WPyP
	4Q5dicKLqJmn80AzCL1fkzjQae/pNGAs+qdd1mkWsQgGIAbMK4H7Q5eaFYjEkNF/naAjbav6tWp
	pCQI7awvi5ju1NG3DHfana9H2ULYkZi0Wk2uKOwRp5mHB0t2WgxPQuR6KTFbk65wq+f/1zHA6YT
	ui0XepI1g0AXI+MCQCKsPEDRyIHOkuF4cQI6D17Mvd5VvBcxvva3oBqvXKpcky2dOa+e/gm55u+
	Dt/TMi5KlsEdj/g==
X-Received: by 2002:a05:620a:1b82:b0:93c:88ab:3482 with SMTP id
 af79cd13be357-93e9b733306mr1312623185a.29.1791494926142; Thu, 08 Oct 2026
 14:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074903.862898-1-linmag7@gmail.com> <20260923074903.862898-7-linmag7@gmail.com>
In-Reply-To: <20260923074903.862898-7-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:28:07 -0400
X-Gm-Features: AclHuK92lc0jnVJwnxxG37gDnBiAxy_73BctfMhsZYZmEx4Gt4Oo78g8F0khWvc
Message-ID: <CAEdQ38EVzFdn49rBj9Et6JFGiE0amUFbxunqzP1qf4FGZLS=VQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] alpha: invalidate the local context in flush_tlb_mm()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2026 at 09:47:49AM +0200, Magnus Lindholm wrote:
> The uniprocessor implementation in asm/tlbflush.h already has the missing
> branch. Counted over a fork-heavy run, flush_tlb_mm() was entered with the
> mm not this CPU's active_mm 2934 times, and 632 times while otherwise idle.

With the hugetlb series applied this path gets busier: every hugetlb
flush there goes through flush_tlb_range(), so unmapping or migrating a
hugetlb folio from another context ends up here with a foreign mm.
That might also give you the reproducer this patch lacks: move_pages()
on another process's hugetlb mapping, with the caller pinned to the
CPU the target last ran on.

Reviewed-by: Matt Turner <mattst88@gmail.com>
