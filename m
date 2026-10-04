Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A1309EE6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122094; cv=none; b=p06KBS/JazhFM3nZarwTgtSL5DkkPk7vnGnB+DT2ZRcWBzplW75bvOduewQ4agdKdW+NZ/TfxTSwYkQzNS4VSqsMOW7aACMtVF3sBGHnZ3KrlqBFJFWgW4FsWB4pUfw9d76cgM0Qf4L4IX8EF0ravnhCW2EnzyBeZgGqKS4s05k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122094; c=relaxed/simple;
	bh=wq2H2AZFgBwp6QoY0qu3BCIDYFJu3Mfddy6mzbSl2yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k14yB6l2wK3hHDQs/Y3CwpsXI4CHc2RMj5uE735hJKOYpFi5wqY5xxUcuKSX4+LQeqCC/UFQmjfZgXCh2GaL4EMn/IxDwadd+OqzK9xMv9PshsTpJ4bgB/iXSKLtPVFfPba8eVtxHg5qz4O1uyFzGRbOUp4oV5OMHr1V2PJRKgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekz9XGMo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekz9XGMo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so9024735e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791122091; x=1791726891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fhp5DnkyxmIbQeMkb0zkaihvYpCxHKcLI/0AXytW/nE=;
        b=ekz9XGMogCYcDYJd9gHevRwonv2Rrvn84YwPRIXLAEsqmj3KCNH+fFlIIz4tFTpaLv
         VGFRq5G6em0PKt9X5Zzs+nM/2Rc+PfPVRS/qumH9Zb1Z9pUMd9IeDF9FYxJLhT7S/NVr
         Nypa4FJXjcKBd8DAnv1ymmvCvoS5dLyfOBGrN+FCitoIP3suHSGJK4URlfprv6APIoYl
         XViFgOYa2hSfhNhAMT9T2oxzXcP65326dx5xc6yQUYVjrXIRY4WF1Rf11GbuQrgTCMy2
         v6aw4PdUKuHVi33+RK/LViXwqNLe7BOJ5KE96kTQrtbiJOjbBdC4zrYddsooZsc83Fnb
         FgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122091; x=1791726891;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fhp5DnkyxmIbQeMkb0zkaihvYpCxHKcLI/0AXytW/nE=;
        b=qL18V2lrps+kGCuGTMiQSGd6GLZypD9pxxSmeIqhSgPsf/70yW4/hFu7fMRvn5dUJb
         6xjQ8SNLLo3JKFcGQ7jcJt7W+4Nft8EW0TOZB0P2KdKnA5tzDU8oTmK+CcVIfrGur96Q
         xC8ykAtMi7abVLT2i7mAxbOTq8iEiITvy0lTBtoAT5YUBVvfN9Pz+5MQHo7asW5CKN9v
         INdyFOpQ3LsP5aJFyKpUkigECq9FrC9iH5RY8BUTdnNUYY2rz+7J0dXEX0reobW3egB4
         m0AiVIotmJWfCH5h9zHKPeMxTrVCsbsh/2zmO4UnI4EeFw+2kk/kIfQkon7cYCHas2Zj
         hT9w==
X-Forwarded-Encrypted: i=1; AKwUvBz5Cb/iuVcX7iifV+I/94G7tYW5PsBD+h7M7rdg8y5Kz5QLdnDxn98a6Py6bbpITI2NlKiwnu9gin0xgGk=@vger.kernel.org
X-Gm-Message-State: AFuF++nhuGMUT2Lzd6QCjnw8LzfGijz671WpdDNORQwZQZ8hQmrvtVN7
	y3tgM6NJNqmUDmI67qOn1mEKXUWJuhx9JIkF8KDwVOJaP+aJue9vHpYH
X-Gm-Gg: AYBFou03WGcL2Ed3MXXibeW51T+f7dnzfCpwaM0CR/OCIq87X8VtaSSmsRQkBEmZ7sf
	Yr6r+w9axkMnRfauHRO2ECdT3cvyHF3MejyxE0tgc0eOdPVCvytZWkVbxJFKaSwS/RGHyVs8Ase
	BTI8QZAoQnHRTsvUB+RxzlVJgCmK3Ay3YTnlec/y65NhBhk4FG17uWBjAno4JeqBC0HVeCPJnNu
	/aMHOPeloXwCDL5YlQhrS/3Lrw+AtdGeh6gMkbD72qncA25MODz8+IGRtbrROz7sACcn7X9ND5z
	3VaZtF/5GUSC9cFH07mEAs+R8ftIONbJPm5WkM1es3t8V3tA9/jwwyz90nu12pi0Sj0l5Lw8l70
	gbl6UAabf6euo526VMMYhq3FfS2GC8/Z6o6LihnzmevN7W4dzPRH+/RjOite99S4lF8sxTiMGOw
	Qn9J+dIRY7xScSANecDjo22Z64r/l7SD0sM05m3N9G+Md543vUOiR69xSaJEfenIGhrxsVldDip
	txyimIetQII3NoNc6aqzra6knsXSaxRz3CEPS1/zL10DZWcZMiob+8fR2n5iF1wabphzzKWX8z1
	8CocHg==
X-Received: by 2002:a05:600c:1c08:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1722ad405mr478315e9.23.1791122091276;
        Sun, 04 Oct 2026 06:54:51 -0700 (PDT)
Received: from C422HJQPQG-Fractile ([185.143.37.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04e2sm16321311f8f.15.2026.10.04.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 06:54:50 -0700 (PDT)
Date: Sun, 4 Oct 2026 14:54:48 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, dev.jain@arm.com,
	baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: Re: [PATCH v2] mm/vmalloc: bail out early on invalid page_shift in
 __vmap_pages_range_noflush()
Message-ID: <asJaqCyt1T_j3FWU@C422HJQPQG-Fractile>
References: <20261004071639.119857-1-jiangwenxiaomi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004071639.119857-1-jiangwenxiaomi@gmail.com>

On Sun, Oct 04, 2026 at 03:16:39PM +0800, Wen Jiang wrote:
> From: Wen Jiang <jiangwen6@xiaomi.com>
> 
> __vmap_pages_range_noflush() currently only warns when page_shift is
> smaller than PAGE_SHIFT, then continues with the invalid shift. Return
> -EINVAL instead so the bogus argument is caught immediately.
> 
> Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
