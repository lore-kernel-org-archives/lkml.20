Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A800B47D921
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430840; cv=none; b=Ohntj6jwguFzz62NKIRIFDdCa74sHUVF9s5E88DjX2Zwa016hWBFcDHPTI9vd4kRSN9TJo+BFoaY5joIQHIuaAEtV6hyHb3Nzh7QZHoZushha/dv95RqXJreHJZGtVjqKH6STN/sheGkON/FRBF41lUvCNCg+ppi3y2PS86O1IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430840; c=relaxed/simple;
	bh=EsSRrnuW4lrNA2Dsn/qpIL4GI+lvK8U/RlMjuUfbYB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qOauqqJsRNmqufWxTnJAlODz5/n6vnrn+gt0A8lXWzRVt/wli0EjbSR7a3llSI6zwFT591Pcqp6d53JdglZKiQJgRvmO1vtuYHS1S3q9iKIesItq33v9P3lMcotaXJbaXDdZ5UKq28iGgzIh8e1aza4oGIXFXuWSpd4BfFScSlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KO1UbZDU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KO1UbZDU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-85c9a79590aso2505588b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788430830; x=1789035630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxUm4ZQJrtfkrx3pEPYjqMmcKIBAx5z/23Hv92CULW0=;
        b=KO1UbZDUwphdmpWTaNzMptIFJQpcLPs97b6KuBP2bG92T7gu7jnKSegeZYjAVHHWGF
         SSpnG5X3zJV+zwU+Cr9VGl5LeoRg7YZxYLvTdLc31BrWJSB1I7avL32fgNgtH+J7fCUQ
         1b2AYFsJthC9XPziZKKdyvhou9l+7OX+KnDwvcefHm2X7y8jC3x7/7K99Gjriey7epL7
         b17RZtwMM/o+vU+V6+p2pFA8ljzi8YMoS7gVsmt3xpLmEDLtFGWklGaL8EGPULxasq9Z
         w0z/BOaYaokQtLfMHzYidTJOTZ2dlJbOrHTsTV7LCwfowk0aR2qykVIi9R5rrtxZlpjg
         A+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430830; x=1789035630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxUm4ZQJrtfkrx3pEPYjqMmcKIBAx5z/23Hv92CULW0=;
        b=F07y1QqCCcphSM/3aUYewB2yKH2wk4caevjC7suKNl+O3HSI4Hg6qQp1KVWzfo2jgw
         aRhEhduln4/GiextbwUyxSCX6ss7ZhhxNrT84A4hV//tHILmN/4sf9MTXpHI2Tk4WkIV
         ST2EsFpWHnDZAP4eo1yO0xCc1PXlF4OplE5usBsFiidkVPBHPRP76a6ASbMnf543isgD
         WnDWSVAq4re8WgJLF6NohszKKmaxX0f629NSEDYlD2if2WkmVbDjMbzMeQ67C5VWowJR
         tmIDy5gTZ1gPryEH4Yqt6GB+pk90gpoICt/0y1IMfcmrHli3Zb9itRkJ8wW3Mi/+0YqS
         tXvA==
X-Forwarded-Encrypted: i=1; AKwUvByE6rrXe29N0XBwMO3Dz0EyYAxCcoq4+0hplDVzcTerJGCs2HVRq5GPjvWyRXKR2UdS/NexmYI4XY91N40=@vger.kernel.org
X-Gm-Message-State: AFuF++lDnqzEb5X3Vbq1LGCp5s+Rnj/8lEPu31FRYA26faYAPKdka9uB
	xzBpejNM1S4h0hjmWFxxPvmdz+XDbIYkcoitLVCtXa9bhHl1lOVONyrR
X-Gm-Gg: AYBFou2kzRipVH/zbRRwbPQzx2wcr6D7o7RlHzkB5oPgFMsmTtdTPkY/1YmClMDGM8U
	dzmco69HGwpV+44w6/lzON5lDyY746xXQN9vbW18nE9nKyk+ppDH9vrzGEXW8dEteWCbjDCc52R
	e+bRDphaDBVjrpl3XFunVvaLJTE8Jbm7rYjWrM+FjwQbpw3F+2z6MnKqpujs6kS1GAawvKhZgNK
	m4jmVOmh530c82xd8lvPjKP4dm9xcyUsBx/4sh3vQXA9HnpKumyCxH2fGCJPc7nBtDU2oWn6UZU
	WOuEKTQBFwfeFIm5wrdM6ucruo9iC0KzPOKizCpNElm82mw4ccijvERhZ1kZxK3HSBb+xXWuwQL
	1hM4ykDt/HNkkR8sHvqrtq6xDWQZnwJJU7OSFrzf6tIkJpdbyVy3+x81dOJJaU0JGflnn9QYfxp
	991KFlpmp04gvvj+iXPOVKr+owjop9UMc0Sag8sYoq/2FGGen2vIrisP+Ot+Jvo1i4m6cLZvs4R
	VzZFckY75gCSStO
X-Received: by 2002:a05:6a00:3403:b0:857:7337:5db8 with SMTP id d2e1a72fcca58-85ed9dad118mr17592494b3a.22.1788430829665;
        Thu, 03 Sep 2026 03:20:29 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2ae0308sm2593322b3a.21.2026.09.03.03.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:20:29 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: aliceryhl@google.com,
	gregkh@linuxfoundation.org,
	cmllamas@google.com
Cc: arve@android.com,
	tkjos@android.com,
	christian@brauner.io,
	surenb@google.com,
	baohua@kernel.org,
	zhanghongru06@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] binder: switch alloc->mutex to spinlock for buffer metadata
Date: Thu,  3 Sep 2026 18:20:00 +0800
Message-Id: <20260903102000.4048448-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831123545.3655557-2-zhangbo56@xiaomi.com>
References: <20260831123545.3655557-2-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 31, 2026 at 08:35:44PM +0800, Bo Zhang wrote:
> @@ -967,7 +967,7 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
>  	struct binder_buffer *buffer;
>
>  	buffers = 0;
> -	mutex_lock(&alloc->mutex);
> +	spin_lock(&alloc->lock);
>  	BUG_ON(alloc->mapped);
>
>  	while ((n = rb_first(&alloc->allocated_buffers))) {

Sashiko says

"Does this conversion to a spinlock introduce an unbounded preemption
latency regression during binder teardown?

Inside this spinlock-protected section, if a buffer is marked
clear_on_free, binder_alloc_clear_buf() uses memset_page() to zero out
up to 4MB of memory. Subsequently, the function also iterates over up to
1024 pages in the same locked section, calling binder_free_page() for
each.

Could performing massive memory zeroing and over a thousand page frees
while holding a spinlock disable preemption for multiple milliseconds,
creating a latency spike on exit or crash?"

This behavior is not introduced by this series. It matches the original
spinlock implementation in commit 7710e2cca32e ("binder: switch
alloc->mutex to spinlock_t"), which was reviewed and merged upstream
(later reverted for unrelated reasons in commit 8b52c7261e04).

binder_alloc_deferred_release() is a cold teardown path, executed only
once when the binder proc is released (from binder_free_proc(), right
before kfree(proc)). It is not the hot transaction path this series
optimizes. At that point the proc has been detached and alloc->mapped is
false, so there are no concurrent binder transactions.

I've kept it aligned with the previously-accepted spinlock version to
keep this series focused on the lock split. Reducing teardown preemption
latency, if desired, would be better addressed as a separate patch.

Bo
