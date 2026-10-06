Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADA13B47FF
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280771; cv=none; b=imtjrFntiDEfPPwcGbdREvRBrNHRvOjLQXB/u8wa1vFUwArreG4noE8CXlVTdJJ1nVk6oT6PMBIj1bDFoLxYQllBFJOWjwoDxXNqyrIkb6aHsvdm5VK+d2jfvHTDytpJ847vo+jy1YuOuQtSCNL4KJzcbqakKyjJ5epaPvFtwOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280771; c=relaxed/simple;
	bh=eNuM4KGxKoRIAj6/wApIWX52lkkRai8pY01pXSazkx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDPDck1mnua+xrZuOyFXXZZO+/0M1Qj84VOB8RZ5kmNfUBjDY8WkWc1DkWjmB7fHsmKr5bJ8AWN1xBrY6m8v+60wlz3dU1TfSFc3x0NEwCywG1Ds3WgXGZRgW/GwreShYleCwh/KxpfZ+sLqsaxbHOVgt0o6izUrpwsTzGM7KAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jt9hMbgv; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jt9hMbgv"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-34bb8b31647so4349732eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791280769; x=1791885569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzBNG15RNJWIVCxEfCEDNKw3ft0cluQEDOTAP62jMkk=;
        b=Jt9hMbgvsJINNmiSLYWdq4xWbQs6MTwbH8zznBnrkZwe4DACfWTo71JYL+zG7sC1xm
         lz7ee3v2MLjf6G56RvmQzCTCyRu29xK/ufQxDNdaha1dsnGxJW+jxIYEMKQLsP62XT0m
         h18hQz1CHwEoHMaRVZne+4rZ7gvvJ9TdXeVMOLS0/3/+8FspOlfadc6rYWRNrsnKCaq7
         qmILV6qoN1UHOYANM5R6DVMN4Ze8upuXhyoToIrsxt3PX0XQqTBEz5wZwTRN/2eCJWtp
         aQTsmSZQwvDcOYYI7BC1wHM+WA8OSwWkbBaMGoJLLNmgXnB6MU1XvPt7yiKQl2EYMz1A
         PHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280769; x=1791885569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzBNG15RNJWIVCxEfCEDNKw3ft0cluQEDOTAP62jMkk=;
        b=F8sEC3s1E9RMzp3RcH2JRLnXD0XX4uPnaDakjgpMZe2xjJxNabuU7HqJz/3N01tjvE
         F0rS6ygvKXDa4Qyu1Xfgiz9bReMKioQcZj7VNFLSqVMRMR8x3V/arjrSmUj0o8oXjG8y
         3/tgaVz6BoqxCsnhk3EiXqcOKy09NEWLy7xECP99rCtpH2dW0aXNdbfTuziYVDfgFEqH
         uujAar7W9qXyB9bVC2gWQj4VSyRTEQ/OB1FExYnc/kB1+PKEmV9uoQoSyrZAnDjBC2AM
         cDKRLbPeZzD36jFebNBqKjaUSHJPRDHCdsQouW9rEKMC7A75/1Yy+VBpvWMfQMqUH1Xo
         Xj2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxE+Ao6KFddVb4ZpfZ9xJnjdw5NJ7cDPJTCdaj3XzTF2ujuSv3vdknDZt88K/OBCcw3g76hD6uN52FR9GY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFJmAfSeZfvYAVFuOmeSvapYbuEkTKBrX91ph9LVBBYIieM4Jt
	cYWo37u8D+sKbhl6Epuf6zKQebPEOEpxDeggfSIJk+ATJ7YTVyiOL3mZ
X-Gm-Gg: AYBFou353vfcjNVABVN73LtbMon1l1caQMhxi1tUKhxAprCN4ciABqI4xt4O3Owo8B8
	bWR4rZI0PZdwZc3eVqfVZMMWvRk8qfd5fi2NaOQVS0xWCMZzcWfc6ETEKxGTbK/48mC6sLpxAV5
	hUDg5/xH6L3bAusog7XQYL+KaWuPllsaVC/uWHICEHr9Y4juFX7NmMLn3W7MptF40T5cwXQBzX2
	g7AlSlEKeb+8KEmy4amD3/oTHVUpdChtSiXVn8zVLR5xoyI6EbYovSVHHdsxwBC0d0tlGp1w0Uy
	kMl7QjivNBuXsfP2BM3wrxkVGPgxEL0rVJZ9Iez2k1bLzsROf3X5cl3VcR0z7+mFvHhfbnbYClC
	OyC+8rID+D3uwRoMwiLHJqJcMithhGUN8D4FmABgfmHVOv1+ZpXvBwLVbTGESVwfvX/k7JYPps4
	odonmj26VuDB89Vo4ZkULeQD8RMKM4D5yQcZsPjR7d5laFUE4B8VCQWDdJozNL4Z2KETGRaPxbY
	gkKGbH7K6+IW/M2ijEbcAThAsKGSbibo04OeXc=
X-Received: by 2002:a05:693c:62d9:10b0:340:e422:fd40 with SMTP id 5a478bee46e88-3514e2a5419mr1086417eec.16.1791280768761;
        Tue, 06 Oct 2026 02:59:28 -0700 (PDT)
Received: from DESKTOP-HOME ([2406:5900:111f:dc2a:3071:69c7:a4c4:6259])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351464fd465sm9305276eec.0.2026.10.06.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:59:28 -0700 (PDT)
From: Beomseok Kim <dilddream31@gmail.com>
To: emmanuel.fleury@u-bordeaux.fr
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dakr@kernel.org,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch
Subject: Re: [PATCH] drm/nouveau: Fix NULL pointer dereference in nouveau_fence_sync() when prev->cli == NULL
Date: Tue,  6 Oct 2026 18:58:41 +0900
Message-ID: <20261006095841.35167-1-dilddream31@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr>
References: <1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Emmanuel,

I have been looking into what appears to be the same NULL dereference in
nouveau_fence_sync(), and I found a path that may explain how prev->cli
ends up NULL.

In the failure I traced, nouveau_fence_no_signaling() removes the fence
from the pending list, but leaves fence->channel pointing to the channel.
The fence itself can remain alive through a BO reservation. After the
channel is torn down, the same fence can later be encountered again in
nouveau_fence_sync() through that stale channel association.

The normal nouveau_fence_signal() path clears fence->channel when removing
the fence from the pending list, so the no-signaling path appears
asymmetric here.

I also did not find a normal path that explicitly sets channel->cli to
NULL while keeping the channel valid. If this is the path leading to the
crash, checking prev->cli here would prevent the dereference, but the stale
fence->channel association would still remain.

The existing fence/channel lifetime handling seems to rely on clearing
fence->channel once the fence is detached from the channel. If that is the
intended invariant, preserving it in the no-signaling path seems preferable
to allowing a non-NULL fence->channel to refer to a torn-down channel.

I sent a separate patch that clears fence->channel in
nouveau_fence_no_signaling():

  [PATCH] drm/nouveau: Clear fence channel in no-signaling path
  https://lore.kernel.org/r/20260928081450.19340-1-dilddream31@gmail.com

Thanks,
Beomseok
