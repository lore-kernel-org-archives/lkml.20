Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078F533F589
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849854; cv=none; b=X08L4Prf4opkwAFnoyWNGvTN2uxn8fWWFDF7AcNVpAU3v6alv2447zxCLqwSlw0AJ0sJft9UsO+rziDtMgfxSLFv5QezCpNT5Z0sC/ZsNF36Rpj/R34RJtjN07ZlXKbRovC/W0wazRX0bx3/y9EQLOpylfex9+ttMTMJ7vsK+q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849854; c=relaxed/simple;
	bh=iKNgjJoUHtFvUy8ZtbLXXy+sd19reNcRVpd1W4ZsCfM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GQ7+wPfEK6QbuhvZ0jc3JdejXrZ92Ae3Ea6j7CWjpvejDGgn5OP/mDPwjblxjHdavdYf4yBTzPmYHN2xTf0h7minU8mfmpoOCqcZflNbGKDzdsfL283ioYEuiPJLqfMdlHbUU8eFgp/CCvVAWumeFC4tVj/mYonx2jh3wSL5Sso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9lZEqDZ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9lZEqDZ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so4606399a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788849852; x=1789454652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKNgjJoUHtFvUy8ZtbLXXy+sd19reNcRVpd1W4ZsCfM=;
        b=M9lZEqDZ4ttThLELRwfE50i7wGwFXC7O1MlqcXm7Bkodp6XMjRnWg70VVFA5O5qPo6
         FD2Ud5dG5BEj+ckN1XxThYGdfb4wjTJ5SopNfUagwBx/0bq0aUw6ZORJfUPvtSEZfKcM
         CyS807SyW4LqPBM76RFjyMjet5LHQW+mQz3gKupYscuB600SMK25irWwP9/iSxFupMjT
         5B8r1lLbfTINtKxf7TrPjzr2Qrtz/vk0QcEkVbJFDRv9bCunC7e9lZtvq6dY6curYert
         8lfTcu2mGfgfl6HeDeVYPW2I5a1Y4418eDwIOx1TqB9+nCqzk2UCDsXBuiEEI69umCzm
         Cl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849852; x=1789454652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iKNgjJoUHtFvUy8ZtbLXXy+sd19reNcRVpd1W4ZsCfM=;
        b=ZxlZN1L6TrHFcaWUSeRn339WR7NWxIok3XRVijv+95c/VvqxTJmuOw9qtdjWVjYg+N
         DBFe3ZzrVY28PKUB4wQ8fGJ5Rp/vAAZ9U/HQZb3fD1eZCtcAKVQ4Q7R5Qs+QvZ2N/P9i
         LQz9K2WkFgIrfFU3tIiNHYhAMfG4xl/fCjIVrbU8OLgOPVC2Hf2IiVnvBq9SLEXfQd2V
         mnT/a40FOWtGrUbXq6IdGsggwssOX+JtvqW7oyG6TjYWbJbnAQuA1bXsTMbgiPrcM4yy
         9MgYM7FEvAZImZTqRexgdj7E8+VLrCtn0PuPzfilJjYtHc/F9Pm+StoS8LfYkdW+NB3V
         XH+g==
X-Forwarded-Encrypted: i=1; AKwUvBwuL1bzNTBvFmZSZ8jLvDcptA7s1R2VakyHpRKuGo5p9z5aMkhou3fHJRmYICECb7oAm5DTNO0uD9UBD5I=@vger.kernel.org
X-Gm-Message-State: AFuF++lgc33RXwDOQLm9i1ocsh0kbXs5SdDjOE/H04hdHtmB+ctxeaFS
	2IhHJmtptRi5vXcdUOMQ86IV6HcfGBiJRQtVrx0ttM6MYeV0edx4KrDc
X-Gm-Gg: AYBFou0RZR99D3Bbc+RWVy9Bs+GrFCo4hvEcKiNZcEofUZXW3XR5m6i/8UISk/yVyee
	qyF8ANeK1bPVOC978V8B99fpmyTA3EqGUXwtr0jjGUukaXeYff8eiFaY/pW46qmdAV6X4waTXw/
	OqpRfTh4ncX80TLPQoWb7WHy1SX5VVvkYPZrt3MMhim6N9SJHACAontZgAOqNxSDr+tCQTrSuia
	7Q6V1WqIHJTKVHXiFwVVGTqhlUuOwkLIHiLRqF7hg/hG5ywu5QSDhh4lqjgeXpBjKOmbk4kxmav
	iYyHBaQGWHcK4cYnrKgah4Ek3jiRWe4lnMU+Y1iIzJ/WvUV8rVindVVOGbOAo2QJ4Bzy7JnKIBX
	+aeHDlIutxuty12iql54xPXR5ZiDcTIBnk4OBbXhFPDuEhioMW1Dm5KbLSTTNewJ49voL4CRwHa
	3mO6xW3m8RSYOqm2ATrLdlblPHYzhcPQGbcfNCrFrcvq9+uot6IWKPxTYhPmf8t0Ti+9n6JNj0D
	mv2w/EXcLugP8n0Dw==
X-Received: by 2002:a17:90a:d004:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39b2609f363mr47840731a91.2.1788849852197;
        Mon, 07 Sep 2026 23:44:12 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm24392766a91.11.2026.09.07.23.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:44:11 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
To: aliceryhl@google.com
Cc: gregkh@linuxfoundation.org,
	cmllamas@google.com,
	arve@android.com,
	tkjos@android.com,
	christian@brauner.io,
	surenb@google.com,
	baohua@kernel.org,
	zhanghongru06@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/2] binder: switch alloc->mutex to spinlock for buffer metadata
Date: Tue,  8 Sep 2026 14:44:06 +0800
Message-Id: <20260908064406.1048059-1-zhangbo0325@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907130028.807366-2-zhangbo0325@gmail.com>
References: <20260907130028.807366-2-zhangbo0325@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. Both are real regressions introduced by this
patch: the current tree uses a mutex here, and neither problem exists
under the mutex. Converting to a spinlock is what introduces them, so
they must be fixed rather than left as-is.

The root cause is that this patch (spinlock only) cannot fix either
problem on its own, because the fixes rely on the install_mutex added in
patch 2. I will therefore fold the two patches into one in v5, so the
spinlock and install_mutex land together and the intermediate state is
never reached.

1) Soft lockup holding the spinlock across cleanup

Sashiko says
"this loop iterates over all allocated buffers and pages, it can execute
up to 4MB of memset operations and 1024 calls to binder_free_page() while
preemption is disabled by alloc->lock."

Correct. Under the mutex this loop is preemptible; under the spinlock it
is not, so unprivileged userspace can keep a CPU with preemption disabled.
In v5, binder_alloc_deferred_release() drops alloc->lock around the
sleeping/long-running work: the clear-on-free memset and binder_free_page()
run outside the spinlock, while alloc->lock only covers the rb-tree and
LRU bookkeeping.

2) Use-after-free from the early spin_unlock() in the shrinker

Sashiko says
"By dropping alloc->lock here, the shrinker allows a concurrent
binder_alloc_deferred_release() ... to acquire the lock ... The release
function can then complete its cleanup ... and eventually free the
binder_alloc structure. When the shrinker resumes execution, it accesses
the freed alloc structure when calling trace_binder_unmap_user_end()."

Correct. Under the mutex the shrinker's zap and trace ran inside
alloc->mutex, which deferred_release() also took, so release waited for
the shrinker. Dropping the spinlock early breaks that. In v5 the shrinker
already holds install_mutex across the zap/trace (from the folded patch 2),
so binder_alloc_deferred_release() takes install_mutex too and waits for
the shrinker to finish before freeing the alloc.

Note that deferred_release() runs from binder_free_proc(), after all
threads are released and there are no in-flight transactions, so no page
install can run concurrently; the only concurrent writer to pages[] is the
shrinker, which install_mutex now serializes against.

v5 will fold the two patches and carry both fixes.

Bo
