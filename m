Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E27C3DD86C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567631; cv=none; b=CUoAgrw65cUYeTTf3omzvLY2cJVsl4mA9zOHH+zqZwdPp6DnEKfhgFe8fNobpP0OEDQqEdILxhOmKmnUCRyY46Gj4Ff+3NGaVTPT1bOaP6llbpX94es3BGb5AnyYQbBTzpdRpgKY+eJmy6g7P6sy+YLxURBXyd9Wev3AwaP2MN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567631; c=relaxed/simple;
	bh=Snbn5c5QxnFMnYmtk+1+uVBQ2tmnh0qgUgwDmcynQCk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kwgo2rsBwjkDSwlw/pfk0bkZEf+DRkLT8N8CKLU+utqd5+x/FaNhljmhrg2SH6Ce4Uy229WWDw/CtVKoA7ZSbFVGk6tTgonT9zvZ764VLspNh1lzPvPROrfOq5leXjgpVVdSJoD7DkEwRUP5k8NwNCo8ES+FXN2BXqYW+ru8ZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sergiiushakov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QYIuhG5A; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sergiiushakov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QYIuhG5A"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so45974265e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789567627; x=1790172427; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Snbn5c5QxnFMnYmtk+1+uVBQ2tmnh0qgUgwDmcynQCk=;
        b=QYIuhG5AcC3oLKPFTT2d21R/M/h9mZkibSswWMSMoqoxgf5HXqLfYtx0C8yIitMh4L
         fAdTiN+FS0YXM6cYBepu7TuwrTxLgX2584wjtDNyl9xqE8bKZup0XexpNxfhMh3TLvDj
         +leSteRTDquIm4JlCvRAzL9NVWBP1s7IfnEgk4bEohKppGXd+p7xlO16i3+ITWC92Da4
         qyJHKn6Aj9r9lYSiQAHQSGH5dJL09/WZbr2fdn1hSBbBRPd44QWa47gTXgE+WqHGDtQI
         WTe4I+L3U+TK0/NynwO2XItYcZiK7+nPPO5nq/q66ETqrmFjklFCmTLc2pEzV58nnwI8
         /7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567627; x=1790172427;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Snbn5c5QxnFMnYmtk+1+uVBQ2tmnh0qgUgwDmcynQCk=;
        b=O8iY493DyYtyDvONZ7hI8/EtXzu7McfyHRU6Xy1efbX37JXinHNmuU7FU98td+5P78
         O26GUUmZcqL5rRKeFq4WbUMF558ADy6jSasNhPKUbXs1E5kn0NW1KE+Vw/+h7MY4gu8P
         7b0DLlK1fYfhEJFkNDZtUixCmFsCwmldlVOPE90OWrGhOno25zlVBRuX34tTUUxLhY1E
         iupH/1YqUulvvl/jDhsdumaFyCg9yAjxWJYdbxdTL15A2DgOjr5U4fiADR9EAz0vVS2l
         AWu5y2t7yMxdGgh0bvKPQ/wN+yLGctmoDkbdKAIvnzkt5fji/3kRxoLzwfLJmncvaHfY
         lZEA==
X-Forwarded-Encrypted: i=1; AKwUvBwfl6ItIcr/ErJEIBy3hubw3AuoWdIOGIg8qZheU2YGZ97XyjjsPl/InAAd2KycDrwMtIbBvYb7nu5Vzqg=@vger.kernel.org
X-Gm-Message-State: AFuF++maR/BsbKqq6O4FdrnqzoPjBWirsS0ua5S4ffeC3b9tCHOjo6Qx
	GntNlEni80YtLqMkm75xyKkeEOe7Bi4YbOiCAbhcvovmZRUOyTHFmlGfqj+gkC5pmd8fFEyZxJX
	V3CRmCMKQnloo+TY5UhIzwk361Klb8ElAXw==
X-Received: from wmbju17.prod.google.com ([2002:a05:600c:56d1:b0:49f:5465:6f37])
 (user=sergiiushakov job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6097:b0:49e:6e94:7cae with SMTP id 5b1f17b1804b1-49eb734096dmr28885925e9.28.1789567627026;
 Wed, 16 Sep 2026 07:07:07 -0700 (PDT)
Date: Wed, 16 Sep 2026 16:07:04 +0200
In-Reply-To: <20260817134202.160669-1-sergiiushakov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260817134202.160669-1-sergiiushakov@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916140704.2839472-1-sergiiushakov@google.com>
Subject: Re: [PATCH v2] virtio-blk: clamp max_segments when indirect
 descriptors are disabled
From: Sergii Ushakov <sergiiushakov@google.com>
To: mst@redhat.com, axboe@kernel.dk
Cc: virtualization@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stefanha@redhat.com, hch@infradead.org, 
	jasowangio@gmail.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	pbonzini@redhat.com, Sergii Ushakov <sergiiushakov@google.com>, 
	Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"

Hi Michael, Jens,

Gentle ping on this v2 patch. It has Reviewed-by tags from Stefan and
Christoph:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>

Could this be picked up for the next cycle?

Thanks,
Sergii
