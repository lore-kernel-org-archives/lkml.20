Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1808F4D4892
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008127; cv=none; b=t+kwKwnmcWfhLDpgxT7t6pvj9RHFPoLUbcw5FU/uhI+QDEYxDAW64He8dhBVorIXl8oplvtG6EvNW8xa3LipVp1lMP41jC3zm/V+pi1Ni4l/bwLRF8wFzSEFaW9rgjiBI50xvYbw3f9UxGZLMcjPOvBklO6FpVnPE4NHis7lBco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008127; c=relaxed/simple;
	bh=Qxbm4TfVjPREN88JmP56AonP5NndNnBy8FRaQjBPQ3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GlJfRmsDICiDxITqscrGx07ck+fx90DUODuEjt/AGQtYadrtXHoMjloHD98yzWlL+jJGpCsA9pDasQGcYVlWYEMQJ16nxRu1eKM+aXFlCsXq4f8C8z43IiOktrcTFDoPiZ+I4CGgmcfZp504VUqGlHIAIqT0F4vnfeFynBIITYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/1kgVD1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/1kgVD1"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so2270490a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790008125; x=1790612925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySNS+GwrhibfzjzLbLOnb295wmy2g2Ft16DvkrgaNXI=;
        b=P/1kgVD1NJRoIal3WQpTwAi5Kquz4M4NdC/RQCBWtp6ne7dxmzN8LadMYJIwz83WBn
         Ijmagv4g2glyLeMrG+ZdWrMaZjkM2YOuHX2p94z7zUtTGpaNy4wsswwU7cid4z241Lir
         /Ak9oWf9ShV6zv8ilfZfbYqGZG/NNy3ergGfIH29xL0HHnG6UWi9ikkkMi8MOPC8lsiM
         tysy2cInRlgcdDjHraoCFSnFZWwOU6tVQeGwK/DtZTeB8kHUZcrNQu11hpWD4mCJEJE6
         PYnFdU1SW/hbibL7vMruilr+7Yu99LXi3ccvVm0Ko5kUp/7t2FZbJyh0KRs8oMcVDVIK
         D2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008125; x=1790612925;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ySNS+GwrhibfzjzLbLOnb295wmy2g2Ft16DvkrgaNXI=;
        b=MbWDBoKco5SXZx6yhJHXcvzLtT4Q7VQzkfoxy94XkEGR+fJlzn/TmXjMjyEjOoAL2w
         ya/26gc0+Mpg+hBfT538i1k3p++v1cQDxrcGDEU0VC/5wsG9zFGuaDOTFTfSNv0ZFv6P
         SLPw2DeoGB+Ik8sBQI7ulfoG/wk2/8TfZc0Ly7Dqg7BBA7MOctpfm2QsMFk//dwy2/YC
         oPuHvt2+K9AhwdXluZ705UteZpauNg89OjySD4LA3LMweIVIj7QaQDdmBDaKlalPVoCK
         bW57JrReLeC1UrMltNIyL7DX7/H8a1KL/52KBF5D2diYlXri5uh5Z5WqbO3UJ/u8msC3
         Bstw==
X-Forwarded-Encrypted: i=1; AKwUvBzNrdKqnfFHqAmkaipcJBBuUvjiZRFdAXkJBcXlL9CJuW6gHeiktRSltAeHg87g/7HTRHciqsge6rqt2Fk=@vger.kernel.org
X-Gm-Message-State: AFuF++nK8m+7GqoLNfox37cGVxab+iHxNLzrY7qu+gDUoAAhm0+ew3r+
	R6+C5N3+tGWXiem5M0z9T0sLOk+dn4dYiySmECvGpm/MvtpsWeDJgie5
X-Gm-Gg: AYBFou35p6wvRaxvDqe+4ztWl7mKsg1Boo3aodNjrLgUQejRdhs1rwYfX954da4xiF+
	SSQOGHuQ6UlPKQWwIVkqbHQFKLqmHkCITstlZwiXOtmpWlqC4YssnGgrQKQY4MqUeVjTPhhn19y
	3aiE6JNSSavjeUaOfCQl1CQfWkL+HH4Q7Nobbpse/FhyK8HIiejqEF4uZJ8rS3gRV83Mj3El5IO
	kXeO7xMcaZjj9SkIZAUx+FgP38J6UQu4Dv1EuawUJbxJpKYq6GL/jITQqPGqWk8JBpByDC8h3qI
	2SZZt9gcMIsFBfGqt7h/vzyz5ScUNTlegvj+XRrv0e+dcnLJKCe4z2uYvY9NpxOMXHNjf2+EPZo
	fuOv+YEft+XMnk5lqXNPI6pzwr5VFSLtfy/PE2Gr1JfnTwZqlDOzWZQeWmoIrGeo9RoNWXWjqPW
	n+lA/P6a1f+2cfZdoz4/tOAzCIs01GAnni+MLuAzAEe0v1lxbDPMvqwgZBpaRMQTmi96hAUckyl
	/XmYOeJNESgPbyLqS53ALsB
X-Received: by 2002:a05:6a20:c90e:b0:3dd:a195:dd5f with SMTP id adf61e73a8af0-3dda195e43fmr11708071637.65.1790008125115;
        Mon, 21 Sep 2026 09:28:45 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aee0fbasm3746033a12.25.2026.09.21.09.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:28:44 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
To: Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
    Changyul Lee <lcy8047@gmail.com>
Subject: [RFC] xen/pvcalls: possible bind/disconnect mapping lifetime race
Date: Tue, 22 Sep 2026 01:28:34 +0900
Message-ID: <179000811428.1227592.17782105050930623388.idr-bug-82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I would like to report a possible race between pvcalls_back_bind() and
backend_disconnect(), found during source review.

The source reviewed is mainline commit
5dd1818b15d98d4a20806cd00b1b40320b06004f.

pvcalls_back_bind() inserts a new sockpass_mapping into
socketpass_mappings under socket_lock, then drops that lock before
installing the socket callbacks:

    radix_tree_insert(..., map);
    up(&fedata->socket_lock);
    write_lock_bh(&map->sock->sk->sk_callback_lock);
    map->saved_data_ready = map->sock->sk->sk_data_ready;
    map->sock->sk->sk_user_data = map;
    map->sock->sk->sk_data_ready = pvcalls_pass_sk_data_ready;

backend_disconnect() takes socket_lock, removes passive mappings, and
calls pvcalls_back_release_passive(). That function restores the socket
callback, releases the socket, destroys the workqueue, and frees the
mapping. The request IRQ is unbound only after this cleanup.

If disconnect overlaps the threaded request handler, this appears to
allow the mapping to be freed between insertion and callback setup:

    bind handler                    disconnect
    ------------                    ----------
    insert map
    drop socket_lock
                                    take socket_lock
                                    remove and release map
    access map->sock

A draft change holds socket_lock through callback setup. This preserves
the socket_lock -> sk_callback_lock order used during disconnect and
addresses the interval above. It is not a complete teardown fix: an
in-flight handler could still insert a mapping after disconnect has
finished walking the tree. Quiescing the request IRQ before freeing
mappings may be the better approach, but needs a separate teardown and
deadlock review.

The narrow draft was compile-checked as pvcalls-back.o with W=1 in an
x86 allmodconfig build at the commit above and passed checkpatch. It has
not been tested in a Xen frontend/backend setup. There is no runtime
reproducer or sanitizer trace, and no security impact has been established.
XEN_PVCALLS_BACKEND is marked experimental in Kconfig.

Is there synchronization outside these functions that prevents the
request handler from overlapping backend_disconnect()?

Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM

Thanks,
Sang-Hoon Choi
