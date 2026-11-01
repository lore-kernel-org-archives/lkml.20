Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793576246;
	b=vuyOi21LuH0+vA7q7mcHqHwYiNBGM/RzuWWs1a5dJyy7WVrQnicyJnP1YcA9HFQZJBWR
	 vx4HHYeWY0wUBIXLJR3+gJOzNYjtpb+IQKQn391bZ26ILXRm6XCNEudASoft0tyDW53UZ
	 5t8BFmjixphEiWWqZniwYT9DYEkKIpN6osHCjNv7J5ERHma5b8qbjzHX+QSvlJdDLBpJR
	 r8/KjgntWclqb9prNi5eOZLDLD8zixQ21G3koFH4mDcCO+1/CPgTxGC6u8d2CZies0wqJ
	 Blq8tVZe+OHxCkUxPZqB1eTHZYlgGH0RcImig8rS8zDdiFDjKSH2ktNo9TfnVJQMwMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793576246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=uycyJS0DpZnW8iPJ9gPVOdKwEEcjN0iqSHG3ZEmJNDY=;
	b=onB3Hz11hW5L5ebkdJvDBwYXt1e8+ijYDoP8EJt2y8JlMRXWOJmFfi0WEIN6I0mdn/Xi
	 WqP7s/loA3shqY6L5ROERP0nZhCI/5D75QvlrUEQxgV/cTww5aHSt+KLSq5JuARuCZkUQ
	 yD3RS4u48UsaiMzZDyXZ3OkBmJkystcl1oImaSAOfEQBXsbpolSAAH6sH9lCvRfOao7t/
	 zueTb+uFwQfbNje1PxwCml+06hNhc5da8j8v3XP6GNvGD3/VD4skXTG/ElU0r/xbY4GuZ
	 RgCuN+ZjiPjdYf2Se5qCKp9sVQ0Gz4DJlKWfnQu3JEPAifnJJfY1NhWspDmG2Iv2eNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJPwvw9V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944D1606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944D1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJPwvw9V
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so19196525e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793576244; cv=none;
        d=google.com; s=arc-20260327;
        b=QABEKHN2RHqb4qfq9DGjGhNSU5D49d3pStbyiHa4fPedS5+qeIt0GWnBzUTaE5Tx2Y
         /zm9OMz4qkXjwh0TtYzmKDNOAB1AEVmb6LCnZWqx/Cenf4Z1ZUarffIL9Pj5NP5OVBMG
         D2q5HEvQToxqQKw/5n466bTr4s+HzUUm3KRZwKCIKWFmiwF4yG75hNNSrYA8WuQOCEqb
         zPijMpBRYf35V7o9ngUb3t10/UCgA6qCuuNPvnOMh7+wl06Og225RtemdOL6yY8xYynP
         digHiaPTY15lj15XhctdLOAT+j8c9/BwCXC+cS1xFcOa3EhbuICkvS4/I3uC5hTScf4L
         CjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uycyJS0DpZnW8iPJ9gPVOdKwEEcjN0iqSHG3ZEmJNDY=;
        fh=A/XxdB04QYCFBKvSXtRtCIp9jD8sq0Is1nLyB2xKxqM=;
        b=V7eGJpk4VYxC1hXuVCrneitn/rQQ8yNPdG6PiCtQeThJ4gFx7x+7NfHbhP+5jy55cd
         vx1QnH2vPPZOTmtNv0e1w/x4Z1dYy/kT/Z89w0LIcA8Gx9LqdT+L7PzKKiOdqmSenC2g
         42Bjam/l6um9Q9flmUwoM2Gjl1sKb270X4Guk0KC9zE8RruzV5kgZpjk9PMxHDLXNEzT
         MMB+jAzvkdwKNz/MDLIkO8zLHNrhRMtLwaD5aKFutPDacqTy3CggHKvNA3rGOrAa5is6
         Z2YYKT8F+bEuppPE8ngdadKLqtihr7XrMqO3TuN6Bzp6SR0tAcFH61Bs6UlukboVNoHb
         SDvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793576244; x=1794181044; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uycyJS0DpZnW8iPJ9gPVOdKwEEcjN0iqSHG3ZEmJNDY=;
        b=DJPwvw9VWxxXEXg3Omwq4faWUuDWM7CUUkqqbhabswF4sHSOOeuGf1V/01sXtHVqIp
         bE7aDIwkZCO/VSC8aDt+vGUroWNpCAUeXrJyb8uP+x1V9nhuzO7fR0np7OXR+aB3+c65
         pY64O4qW0OVn5s5PdqkEFTW68ssjLquL/lA1TBupexIn1J9LQWo0SNH5NnOzFXi2yWqd
         +Kp9JjL2Vwia9KrDFVZDX4MifFNEegTw44tw18BFvdOJ3ZHcsjSWOviF8+BVTjP3FtW3
         LgD6IQEgVP8GNflseWTcXmFDtvi8kRwEOYYcSchpRem0lIBeqLuY2BS82ftzZVybwhQh
         7AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793576244; x=1794181044;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uycyJS0DpZnW8iPJ9gPVOdKwEEcjN0iqSHG3ZEmJNDY=;
        b=AREWEwTost1aZHkUzP4IhoJDtVw6Oj9Ma3UNliHOtrkDhcaOYPPZVJP0NaiJBRVzHH
         7piU1mHOHZA1NCPReS8D5T5Untky49ZIi64OHt23OgcaKF5RrL7zoEFQzDWVdVDBaVwZ
         YoDt5gMuDzDgN0FEy90WJOkah6zw/UNkB6KWtPE8KR7M5lLi/sSqMzxlMSqjiagqvsdu
         v8sMrIKf98MrbNTp1Segkkj6cynhsSIfbDfz2VoSlD9rKH5qlmxaNB2SGpnTZrpGb4pG
         P4Hxwh7UFLMrnIkNwsCCUCuaTfuFU6gLjpUFEPBDYiseic867TvHZLJEvUxGk9Bemje/
         4QOg==
X-Forwarded-Encrypted: i=1; AKwUvBzG05Y9H1bvB7aJbBdIljAfDjKIvknXJeefi29utbPEnkBLjvxSWh4GxtL3PlyjJgsXJT5hNKt6YGGGfzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkovwR8q2twgHwS5tZq6AXvudNxhzWeV1x5ClkxsoTAX73w9vv
	O2XDq/LGXCLTNZtrYAA2akUxen3awgdeR5gDNUqT+hhvxJOkkOBdPGcd4h4rwt8R523Pdj1BYvV
	wWSBSDaV8mQisyv0wK0zg5pX/E/3KVRk=
X-Gm-Gg: AYBFou3Rsn4x0PHZ10jZ43NVs8x0bsKhTTyjWxFlAgwu7M+CuvDw/J8/MXlxAfB6esV
	VhDB5vpuGtsLtHmI9yI8SJ9ExGSlDG/stCf+2rlT2xerpX0g9KZQ7NtfXI7+G18N+trPUHOiuuj
	RiTpn5OsBRMoBp0se4W3qHtrXYeNNxOqrv+zKwFgsSxDbSNLE5vGA3j8EAS55u1FLlnz/EF/M8u
	20tRNeZlvmxEIM7gq/obLv+5V3s3pQqZfZTTXa0LcIWrsyyioYcGQcYZ/lLZV7VdtL0z4sce6Mg
	aHDhZBo8giLoX4jH5TiFYWbsvYo2E9V302ZszbkjXYjBZoxzPqum980hLg3qwe9KAKPUMnV8D9I
	93NaDXCbSjU98lXlZvNgdYaZCPtxWy1hOpkDJ6VY=
X-Received: by 2002:a05:600c:6089:b0:4a2:a8c:22b0 with SMTP id
 5b1f17b1804b1-4ac14ec75fbmr185544245e9.1.1793576243659; Sun, 01 Nov 2026
 15:37:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Arnaud BERTRAND <arnaud078@gmail.com>
Date: Mon, 2 Nov 2026 00:37:11 +0100
X-Gm-Features: AclHuK9ns4XBGZ7zNo5bqw4a_9l2SxlgD9VWWmJ9YT0QG78bE9OgwzMy8CJwXYU
Message-ID: <CAGxFSwnBDM93ouN6Aq2ppm5zF1h19XE6NJ92NT2UEhMP1P4xEg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: add firmware file fallback for APU VBIOS discovery
To: Oz Tiram <oz@shift-computing.de>
Cc: airlied@gmail.com, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"

Hello,

I have two dGPUs : a Radeon RX 6800
XT and a Radeon RX 6800. They both report the same PCI identity
1002:73bf and each has a different VBIOS.
I hit the same VFCT bus-number mismatch on 7.2.10, but with a different
outcome: on my machine the device-identity fallback actively breaks the second
dGPU.
I patched my kernel to remove the fallback, but I would like to have a
better solution for my use case.
Would it be possible to apply the patch only to APUs ? That would keep
Oz's APU case working but a dGPU with a stale bus number would fall
through to its own ROM, which is the source that is
guaranteed to match the card in the slot.
I can provide more details if needed, I am out of my depth here.
Thanks
Arnaud
