Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5E44BCB8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782524; cv=none; b=okVEC9QjWqjk01hGXLn8LdAY/h+7s/Q72VOAyAkhNHEg9euPlttSAEZ+XxqrbK14vGj4CpxLLVR8HkMt5ABD6vdd7suZ6xUf4qLXmYFkToHSCY2BIQHgG/1oQ8oSQ05lk009XaWqYjxU3AJknfER+6nV21s8+9I6x8KxELDmLRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782524; c=relaxed/simple;
	bh=e+LcscX4l8bSIJhRp6pj21O+RxjEFrIGAmY61xbEojg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnxxKbJIiOI+T5sdoIJG7iRaIwPZ/4UZkbK5p7txevXuS9d3ffm31ElO4OmtMTa5vF2XavGFzB6HLG3bci/DkuVbN2llOKs7TI4jJBxONtAP9F9iqmKEHLK5Fy95wlzSd+B9BjKKlAeLynQG7Aq9cB+wF8j/bydyW9WweUFE6b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvdCMj5h; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvdCMj5h"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2780155a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782523; x=1789387323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWeanejvZj9bixBLqbHSIOUPluNyoy6AbNIxqL5gJ7A=;
        b=bvdCMj5ho3+J4yrk1YCw1vP4VDJSNx/XSxEOa2jN+rpxzdklCFIwvzq95L1KWgNNK+
         VDW/kDCKjm2KRLpexdRkYkLTkxJoCZ4VIzztI97excSB4dYpenCTkpKAiQGxR7m5tCXR
         aLko0mFNXwSii7trpxil9P9xV6JI3L8TYb5hQUf+dX/cGMSR7i8rHxXnFfk6IDgWnnwH
         OdrqG9vUC9ENBHRNT5Gg0V00b4eIybUubPfFXyg5+z4+3EEWLU1+Ofx5sjqCYNelZ/9z
         yzHRKREDjc1MeEgJ2GFh65bzH/vMV61jA+CdDPMPs3hQS4qNgbauwg8DJWYZeeUgtMsl
         drbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782523; x=1789387323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWeanejvZj9bixBLqbHSIOUPluNyoy6AbNIxqL5gJ7A=;
        b=A948Bt223sIxjOe3ZadWAGFHQLVHoMuIvDYmPyA77fBxKwvb8vbUoRSrD7CLUoP97C
         gMyIygytOm7Ei2D+l+po2dAy1xO72+dv4aGyL3GfiN8e6teUX+ZOkFdfmT7zvpGN3n/1
         xtNMbvwOsDj2hm/3IiF66X0hxCprYlh6jUjxZ17eTpEReFLwAcF0lLlLjcCHKddP0NJj
         9QAa19ahLmJZaSY6DtEu1vX8TNVWaW9kMA+8T/iBxYYWGUA/j8FHhRtukqP5jBQnGZ3J
         7BAkMgNVNVk3BpUeRcv7/qaMJzbuSv5+hzFRY9FSvkp1aGiRvqdne4/6ofRiF6OTfZiR
         66VQ==
X-Forwarded-Encrypted: i=1; AKwUvByC8WWwhy2Vbqkqp4ObkrogK75RSuzV/XjU4FwG14aLp5snJUdUawqmTfMcccbPtjG8FQaUbLO5WdFasV4=@vger.kernel.org
X-Gm-Message-State: AFuF++lAPYG0Hu6lNgOF8NsYgvUIfC4Vj0zJom0o34XhiBwYvucvrMY5
	rKnz1OiZI5FPaM6/1VRtbwnOVwySRTwxx8Tz8KQq0MDD6YhBpZzk2Gc=
X-Gm-Gg: AYBFou0ZNa13V2aVcvFmaIQUZIloZAZaU+ByKk3G49dWQIkJcCw5cJl+bJ49qcNx8QU
	OA+SjdXJe5NUosbeXkPOQtXEza477NPSbkmjNP+Sx6jexnyT8ifR+IcZeWx9HGu4B/AkpJXurri
	IMx/mi0hGmw8SORpx8zuVGh9pqW/1TxZV2MYkeEcSSfZpUGsQULwWyNUVF39FHjY5hHOln3aDw6
	aMhqQHVbi5qVavmfHBRHKku007NL+Uwym4Y3vXo529ndC+2A3hferBAP6GlAiIv37VyRIVffnwK
	PF/9jhvnaBth8fmFHfIImIc/ehfZKr+N4Dpjv9Q4hqugrZfPdxERitIG0NyPg2VnDWm3pVF1VSF
	FZ4SYPEeOfDrBP9tgLABrwsn+L//lKgo75ptzYWXCRedGTeKsP7XTvUnxWFUn7ddwm0P48Rg+sV
	qThrQoJWOBxYQYLT9q6zs6mpVuZiSL8FoxkMviOd+ijiy1hGu+pKahzBT3o4/0wLv2JG61inX9D
	8NFrGo7vRQBl7B8
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr35866634a91.9.1788782522669;
        Mon, 07 Sep 2026 05:02:02 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm26976118a91.9.2026.09.07.05.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:02:01 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] dma-mapping: don't trace the DMA address when the allocation fails
Date: Mon,  7 Sep 2026 21:01:56 +0900
Message-ID: <20260907120156.603600-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ff20483d-c701-4cdb-8db8-15aa79bc32cf@samsung.com>
References: <20260905071919.30784-1-donggeunyoo.kernel@gmail.com> <ff20483d-c701-4cdb-8db8-15aa79bc32cf@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 01:05:20PM +0200, Marek Szyprowski wrote:
> Frankly speaking I would prefer to fix this in include/trace/events/dma.h with
> __entry->dma_addr = virt_addr ? dma_addr : 0;

Agreed, that is better. It also covers dma_alloc_pages() and
dma_alloc_sgt_err(), which share dma_alloc_class, and any caller added
later.

> Here You remove the debug_dma_alloc call for the failed case. Right, it
> is a noop now for the allocation failure, but it might be extended with
> some kind of debugging in the future, so I prefer to keep the current
> code here.

Fair enough. kernel/dma/mapping.c is untouched in v2.

include/trace/events/dma.h is not covered by the DMA MAINTAINERS entry,
only by TRACING, so v2 has Steven and Masami on To as well.

v2, tested this time rather than compile-tested only:

  https://lore.kernel.org/linux-iommu/20260907120124.603373-1-donggeunyoo.kernel@gmail.com/
