Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F85C3C8182
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941135; cv=pass; b=XDo+LfMbqB7YY7vZhFpByHipdFKfDSu4WlEayOjqHuhvYVTv6CUg8v8GcXBU3KtOpiIzXgJlA0krpI9WA7Volsb8oUu8i8niWOD8T3Fv5DCnzRB5zwUvVUAV7FHf025L+U7tPonMT7keeZAyl34Wd7LtBj2bT4HNRUSoM+rDMj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941135; c=relaxed/simple;
	bh=PtrcaN2EICQuixSidXkdAeZUjbAr4kNZ4zmQ6EU6LkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTxSmQ3GGRp8q/u3i7EjYQ0U7UnJq23Z2Z1+t91BpGWa0qx4izrc7xYlnKnkPbM/GV5EQwbq8z2u02Ap/fGYXT8EN++ukEt+kadlVISrrp8EiB/RGDSFDAE2o3u+Q8067d/7m0MfT/8tmk4nYMtSqJX95uO/9ePCqDFdFdCeGGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hY5sHadW; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hY5sHadW"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab17a810so255717a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788941133; cv=none;
        d=google.com; s=arc-20260327;
        b=h2SLJTnI8jTDjh/3hrFuoxytdD8dn+2VRVUZV0Zsn5kNkBt4/bFfXOnmxdtyGWBWj5
         /Qk8ZACwieLK38qqGREHY2r71K7+ideKD7M2bEnsw0ITjarTpezw96Wp8rq0OjvjrwvD
         23faaCl6oC/XqVfUwwkHPAterXKOvjpFHpNHN+olKKZjB9lWOvEta6WC4da7Vcs7OhPq
         6Yz0eqO4uZl+mNDIwenU3Ad/NMbJ1JV5+3g1PsGIJCEdXFjGXTH18aG1z3VL97ZsigG3
         eThrhTz2doAkAwyUmdrCHaRl7b2jleARe0UzS4I2RVPemVFpgCMWGoWOVk9Bt5ocipzX
         nnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PFzJhTwC5v2xxJH8grG7O2UX6Uz5UZc0kMv7qk7w9wE=;
        fh=rZ4QB5sf61NgPvrEgs7RmZrEtJ4LaGY/5KOH5CmHe0c=;
        b=NT6qbXZ2RjO1fTF2gBcrkadyhYbf050i4ZqOAbvl+6RgVAZfSp6bAn3qio09rXrKtw
         Pocx2jEB2tErFxhqGbbHJUPV0Ft0gstLQVBLanYt94ElC79UapI70JVYNFZzdlvO8XL8
         QqwAJwkR3EIVAjp9/0r/0qEkTCeOyL/1/2lK8atHwXPt2rpp5+CXqwy4V652zX1pYNne
         bUE7oSF/2a+a57/E3mI7Mw1EGUlr48F2QzQv02+StvfmoD0tyfrq+j+Gwr9uUyVZkGDm
         La/Rmg52+DQHDrvIpNXc4sJEuKvmj3EOAJcRhU4SJo07d+Zvw1U20f5l+tSaz6V/SO9Y
         s86A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941133; x=1789545933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFzJhTwC5v2xxJH8grG7O2UX6Uz5UZc0kMv7qk7w9wE=;
        b=hY5sHadW1f1icTS/eighd6eMp6MkmV+m/QdByMEruXecmHQ2SOTTiff0FO2U3GmZt7
         qM//YbSxTjVC3BdJBIX6A7nR57+L4Xkdqykf4Rd/zZUpBK+sZOdinAJpAHmKTdTxn671
         QztQliUcpItem4H0N9ZJuWONsP3rXlJeJcSVmGU1S0fe2r5UHz6XoZI3atPRgmKR03d9
         SucIJUYI5krAlZPWRRisTEynAtMyFBs5g3aZuYGf+hgGU/4rym45wV7TbzRb+/tsfFW6
         edyivrcNPXcBBboBRQaOiRbbw7h2lVZYLhwsd+OKGXLcrW6OgTcbwYcY5G+T7PZFUOoE
         xyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941133; x=1789545933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFzJhTwC5v2xxJH8grG7O2UX6Uz5UZc0kMv7qk7w9wE=;
        b=Gr+1BadJgdgBbQ+caItcrkE1BLgScmCYOK4mE+4w62gs8oMUNHAmGYRBs5IvYxai2z
         vVwM1qRe/LVVGKNL2lQskgzkdh+w3QCSYwAmARpWRPtSPVGHXIv3p3Mq9M1lTaRROK/R
         4WBByPFgGknFubAHL7fQfuFZeYyLW0m5Qf1efUdbicRKaKSPuCA0wRjsA1uRppExCBgy
         iMRoDkDOOmVmeS7q1CTZw2ta+qfEO5UxmH0CZsAknptmMnVW199GF9JicudSNQ398N1G
         P9rG+Aqgx6sn1YN8Y1O2ug5/ctxFKcYqmTXa620CY0iYmXRhrvoKHQF2VG/l1p4J2ydT
         qhFA==
X-Forwarded-Encrypted: i=1; AKwUvByYUer65c0cksEC4F63tHNvdFj+y7zDN8lRfYLIKdi2Sl/QeLnK0e4AOSZoC36/n1AInJXcXdUoIfTEzqc=@vger.kernel.org
X-Gm-Message-State: AFuF++n5EfxbZNqSLcc/UHMHWLOHJhYJ18W9Tkk3WOjJVcvJm3RJaFO6
	IvkKao/kcvNxuQ/9Z8HghgWHBImEmNS9bqW/Qxf63/xBiuD2A37Y51HIOnP2k2jTRMQ9j+yeTaj
	VJ9yWrE7o6R8xCm22JwAXvjB92LcnD4U=
X-Gm-Gg: AYBFou34kJRjkXDYgxqtRmOrm2T2Ajo5HGBJjIF14lf9ftmlPEhzN+mqWFyDXzgzJFi
	0DAWBnjXlXVhAKI+HlWW/PqtOfQb5550ctzm+wL6N5j0K4OR7w6w4ZEn7u1knYItdaad+8sP/pH
	GNR538mAROims3hTm3VDKa2HBwZ0F6o0O99YTUH4hh3F9A/xq+b1E4Xut7uzIS/JPSbLx11nVCv
	WO95Z8z2yDF6js/5AbgZnlwTdEwQCiVlbFwTuCT7RBY/VG9ftoMuYvSSASNxfnGRTL/LvHQmSPh
	Z4lNYsauNyN35CwiwsLE/EI/GpTzbMRHjrABN0LUyvegvFIhCvdiMBs5rrQ00jcS2CullYFfJXT
	RRLpSSUhtKYqPT/0+CeIhCcojfruF6awvuVdcMU/njOQRtu3GCaJ26jtYKCKxlK/b0ulgV4FCGM
	AaxbFG8uSRsAjsFlqbVvfqfPaB6RqtDp8gLvKabyc0/KeELASjocY=
X-Received: by 2002:a17:90b:498c:b0:398:a2e4:c784 with SMTP id
 98e67ed59e1d1-39b3d5c4449mr23521825a91.1.1788941133232; Wed, 09 Sep 2026
 01:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908175427.47207-1-klarasmodin@gmail.com> <2642740a-b894-47bd-b26e-cabdaa14d8b8@suse.de>
In-Reply-To: <2642740a-b894-47bd-b26e-cabdaa14d8b8@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 10:05:20 +0200
X-Gm-Features: AcwNN1VaFSH3EyJDGBY_TKDiMWxaUjeqs441wwiCpqb3pVX1iCtXogyjN7rFa0g
Message-ID: <CANiq72ntt_2n03UReCt6zFD_AvTMvNE6O+v3E3sURTsqW6x4Ng@mail.gmail.com>
Subject: Re: [PATCH] rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Klara Modin <klarasmodin@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	Mukul Joshi <mukul.joshi@amd.com>, Felix Kuehling <felix.kuehling@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Manuel Ebner <manuelebner@mailbox.org>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:01=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Please see my bug report at [1].  This patch fixes half of it. I still ge=
t

I think fixing that is the respin that Klara meant in

  https://lore.kernel.org/rust-for-linux/aqBf1UYNR-Q3T-cs@soda.int.kasm.eu/

Cheers,
Miguel
