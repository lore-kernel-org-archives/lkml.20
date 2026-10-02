Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E391361DCB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974114; cv=none; b=kQjcbl3IY7HU1UFih0yUBRjZ8u4EcWVw4cdPXdcTpkgh5kDd+IDJrXu0qVT++ztSKQO21uglkuDVaKv6DBUHtn+UuEz25gWu6uXDu3eFjSowADRiegnMdxQY8PZW3FOGCZy0owUgoI2PQDKNoKoavPKGFnRZ04kPZdBaRVvR0o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974114; c=relaxed/simple;
	bh=Xn8v821wbWVD9E8elR4jk6DR05TUKT+raE3vBfYoiWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tWgjZSBoOas+b3RYAGK89gefwEhplYoO1SvlvnvZ4pHSvjHNjI8vJTXHnapBi3R9X8xCf+b4mSI0tCG4NwYrgjRfzk/e3Ux+EbMKnOLBNIkN6GS4z9SdashJX8BRA0Vzlro53/HJkf08lxMuGVUuM3F0jytrrz0eF7xAzDxmGI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3yDgnh4; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3yDgnh4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a16747813aso71665e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790974111; x=1791578911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xn8v821wbWVD9E8elR4jk6DR05TUKT+raE3vBfYoiWk=;
        b=W3yDgnh4EBKl3QI7sjCfiOrEXK1iXL0bYzdLzcM+gVqWycAdgRj4vAH+ZPbuU3Q1S3
         DD/dWZbIPtSzshcJ5TCK2eedmcrt784I5RocLHf8oIAPOGVYaIIwlXOqV/ljhssxT2EB
         k4hStBPnO/F2+ivizZ6Dx1tKtBhi63+f1sJOoPa4pMwa3RWjTMLLKkGg/i2+mcMxYTUW
         /HN9Cg2lO09zKgdW8M2abtMuqJPzukBiOimWM3u/Hbh6iZhdkR57F9Lr5zsgtA1xq7PX
         +K3g+0v6/mDBYkl5hppKMtKPEQmRaQOElk/DdkkcSN3t8XsOzM6+PR8SvZ+NRZRkvVYU
         cjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790974111; x=1791578911;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xn8v821wbWVD9E8elR4jk6DR05TUKT+raE3vBfYoiWk=;
        b=pv7YruEugvuXEnkDUOkKp3/NCyQCZ62yNqth60+fB9NgYNv0gD0UaR7M3SOYreo/nM
         W4eH09C4ccfrzd9w7cB2cap+NM48wNPJ2S1RyY6nSsfxUnsBwB7jB1MkpNSDQm2sHz9b
         Ttbd2E3DP4CXjgR89gUanrXOqV7wwR+kQ9d5P28wuFpmGsWsuxeQp7IGwIYR4ClbaCnq
         nnYzZTygMrjQNko2ubwVLRI5F7DcW9zELyTK6tMtuLdGWhnp+mt+0YmZrjTWFwGAQ+Ke
         h6nli2kmeK+1zc2VtCrisG7OppsoFZM5GRLTA4OOGvJ0QGB6puWgmsiU8Z0XkCeJhL4+
         cpjw==
X-Forwarded-Encrypted: i=1; AKwUvBxvJiyRsN6UJDrR4cX58AvjBt9Zqha9P8XMCZbLgac4v3tsx088Fct5D/sp2keQkdy1HwnqIuhdp4ooOS0=@vger.kernel.org
X-Gm-Message-State: AFuF++kE/GbKVbWqfMN6Bz1PvPlj8lZvZoqYNSZMRDpLWPihGo+mRvbP
	HV+Iyvmv11M8N7WRDj+4Fu4aTORW3mQ+ca5YC8U9njg787e0Dr6gLkQS
X-Gm-Gg: AYBFou3z1BaQuwm11JV4lVpp1+2JlYkQ7AALKSTF4GK171XOfoZfRl812lu4R7DiQNV
	C0tAKxTCHt1dQKvML07R+4Bj4nCZa2t1EFIMJu4hP2ufTTpxnvSAxz8+Z0ri+B4qnjOlYKoZ6JA
	lq8vUmWTyVIhmKKs2pqeYqjOVSkdZVQAC5JLDRlqMc7dKa4RpK5bofkMkw9DEZ6/d/hQHx48eul
	9OiFVCuBZSpuBRDLsJbkOOR/OZEMFJvnYIqGtsQ1Yzkv2Lt7sRWuMKvHdZXFirfNpopVn961WkT
	xWdcUgDBDGtuyty6zYmREokBaEiNTvRI3AMMzigjDa048jFfCbsTpmSOfyjXB6RuXi3adCYB59J
	D2ivqwR8fFlqHYgYrdPGdiig8BctZ4OjLv/uHYkiEQipfTfRG3TQMT14FqlKRyNsPvYIKhOlHLw
	fkfrvposArIoI94Wq+DxpuODKm/1O1WqtMXWK7zjb8eBS3y3vu5AF5tHfUsSQ0dAOEoXNNVWSAS
	iqqjmCiOWs3MRG+dqz2KVB+xgJMkq5YFg==
X-Received: by 2002:a05:600c:609a:b0:4a0:1c98:de52 with SMTP id 5b1f17b1804b1-4a02755c4d1mr65627725e9.1.1790974110562;
        Fri, 02 Oct 2026 13:48:30 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.71.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm39343925e9.2.2026.10.02.13.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:48:29 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	alexander.deucher@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix kernel-doc warnings for cgs register typedefs
Date: Fri,  2 Oct 2026 21:46:40 +0100
Message-ID: <20261002204803.27695-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <981f01e1-0c3b-4854-9d72-8bf22af9fc64@amd.com>
References: <981f01e1-0c3b-4854-9d72-8bf22af9fc64@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Christian,

On 10/2/26 13:38, Christian König wrote:
> We should potentially just completely nuke those typedefs since they
> are actually an unnecessarily layer of indirection.

Yes, the cleanup is necessary, but the four comments don't just name the typedefs, they're the only prose describing the operations (MMIO vs indirect access, offset/space/index semantics, return values). Should i relocated onto the struct cgs_ops members or the cgs_read_register macros?

Thanks,
Omokefe
