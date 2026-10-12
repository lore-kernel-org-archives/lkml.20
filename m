Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEAE47143B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814102; cv=pass; b=Kh0pQ/p/M7dUolJppaWD5JF30PX3QDbUF1aNQLn1cDBSkuX9b+Fu51LR6w3BWJOKRuLzh6S/w45UYk/ccaNH60dZ/MC+XSkB5kATG1g4mSpwtA8i+R9Hk9RMGXnbp21wB3xHgMKuWBluHXHNiqx35kjANMt8fEzKrXihz249lCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814102; c=relaxed/simple;
	bh=Ds1RsGrXdYNa+VIUsNtvM0HHuJhu03SNmjfL4ZgCOaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzBxKsmPri9lZhD6CW27HLWcW5hl2X/cIyjWZjvMGzNLYuWmKQ8HiIKevc38ySVKzluMAT8smQj7Ad+jZk5nf49S1aj4Beg1triYZtJucVwoukwpNh1TOf4tU2A1xTdWAQGC0GfAasJG6Zu+J3ePTGXTiE37u4lQPWSHwLMxkKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPVYZgPD; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPVYZgPD"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53584e7c349so389751cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814100; cv=none;
        d=google.com; s=arc-20260327;
        b=oPNFqpp6b/F4qb/mJXh1UgrkyYQ16902mpxWBMftMwolpzC18rwgMg9oO9g/E7ghb6
         E+xWcIhHDTxG/7UAURADVBLQTk+bxCgvxGCFX3ASriZbgPPl7rdQMXkxF7c9jy1QoXbN
         eWWKOnqfkX1QNSmlh7pemztTv5ZiGi51ic20ZqClvc6dXqaNzRtceplZPwet+FFw2wTY
         REz13KA+pxUg7lzHbyhRydAHWnmAspzwzAC37DnnV1yeT24iphxtkBx4ngTY3ahEvfLD
         upzBwAFazU51tcZahb87ni63bSKf14T+ggkBiGCeSMkbJVRvj2gIPXVTQ5DyDakaJo8w
         HQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ds1RsGrXdYNa+VIUsNtvM0HHuJhu03SNmjfL4ZgCOaA=;
        fh=LuDSq2OKisxZo+CWzBY6Q+JY79LBfZptv79btVOs+Ss=;
        b=TmFzKRHm3r1lTCTIQLBwjzgfz1lcrWzYnXjwO94W/GEGEPAMCKwSkX+GWKh2icnAlZ
         IOv11i3c5l2dLiUCgu0LeynG+7SaYLi0vJ+0kFXmALWBqT+7c03YNC+14f9EbOz4OoQh
         eFluKzz7OzxoM2DP57CxyWwf1jHWsOVzZCVj63u2ezwzr4C9UIU32CoYd8vgYoKB6rnl
         5W4psAbDgPblRsgdB5Du+LI/geuEh1sqpXklatSNK+eJzU6o3UobqtEyjsD1yXddVs7/
         s3QQZl+KIluMV9xsOSU+L6p3DYVpmKhBiEfWmVNQLvbMlJOxMPLVqLg0OYLp4u5dvvSq
         pNZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791814100; x=1792418900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ds1RsGrXdYNa+VIUsNtvM0HHuJhu03SNmjfL4ZgCOaA=;
        b=tPVYZgPDO3maEImsDRyVJf6N7ezrlrEpzV7H0nUFUrvZON8vVPHJdA1N1E1oGHANxm
         dddNPzPx43eeazjaw2SZ6prv+MubwLIIHDWp2wSHYizVcbGXiHuKG1+kBW1ZK5k9ie4r
         bC2WpAi6EYr/8UHrUNI7X0Ll4kNi3IaKMFPopJDI1CPkUVEp9MJeYmlxPeDEpqv8SzMf
         iyaS/7scXE/IkVm123dFxnuNYblmTWhltgFepuUyR9iIuDn77YfhJ7gIGyXgRjSyq3VR
         y6kN44xQ5f6P0Y6AdWuXZ71lOp1lc0ymOTY3h11v8cUpT7nrkjezl7j8ONy4TohReAL5
         8l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814100; x=1792418900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ds1RsGrXdYNa+VIUsNtvM0HHuJhu03SNmjfL4ZgCOaA=;
        b=yt0uuUgvjkDzcSM82NyJAQZajR6qRVZwR45kLVALV4GUOItlwkiJyxUY2F3PRHm46l
         g4cjIxr6Suk3WZrq0JpXAUUURRugwvR8DHST4+FVsxXsacLe5MqmEOmf4oWzZrcpfIG6
         qcouVq2jcuU/nwT6QfcQJh2NkcancF8mOeYzY7Yqa3P/c/n75/rtZnNZQFyNag4MYs7k
         t573rDwPRXrMtNq3VpKlHbawf/lpVX8l8JcpOMQayBJ/r2pNwjFCzpd3ndwSq85elYVs
         TCR1OBPKx9kP6kPWWYHHC3aAcIXmZjSVO1acWWe7C5rSIOkvZ/CA77FXkovbG/TCDVKV
         yNjw==
X-Forwarded-Encrypted: i=1; AKwUvBwpRUoaFVSJa+6rrjPhK6Fxj9esviGU3G5O6bTQNZbsWqQxsWBiiEtam6EKt88htdAAq5kkkvWU1hBcQ4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYILhsDhE6/OSoSAkmzVjvrHPXHVBf1GTG/FqbtqAT4sqVvrcmWw
	ldF0rPnTQyxaBwxnSV/6zvUZqFVOnIhyfBn+OGKUpnPduQI7poOHVToglwPqtpXEkWa1O5fsWgK
	MyebE5oWOP+H2Ls0ZhYL5VXW3lBfF2mwImN7XzcfN
X-Gm-Gg: AYBFou12q4KgUSpA25u/hS8yZ8rkexGmBvA4cha1W3JZV8u3EAU3QmOsql7KQsV3NXS
	abtPr3/ZAnEWKG54QloMulKuL/m+D/8QDks23xT4I8QS9Tg9rFf6B+e4IFK/2jv13VnaslBERah
	UsgJYthKz2wMIityn+/HFZLOEdfAUGAYxYiUrjejEz8nrMekKKhbPmKKBQ+jeFkNwJ3GcIfOsbU
	ZzlCiKNEml9J3A2Di2xEtiHfGdkrgQlMtNhWtftr3e12ZbD8xx6glphHirhw5IfXzJIIyuurPb2
	iNTa6HDAl9vUl1rICENIb83+OLDBoCq0r0UG2oFqCzyC5rEVpyh0XkXZg+GHw6l82i64iyj7q4K
	GgytgHafL1PU=
X-Received: by 2002:a05:622a:413:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-535b325f8d9mr32241681cf.5.1791814096393; Mon, 12 Oct 2026
 07:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011223358.2327625-10-sashal@kernel.org>
In-Reply-To: <20261011223358.2327625-10-sashal@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 12 Oct 2026 07:08:02 -0700
X-Gm-Features: AclHuK84WqMsyxy-I57pRe8rAHj6B83pUNBHs476hJrJgTGppN2WMc_WLWeA8KM
Message-ID: <CABdmKX2D1obDASTm+exAtrZSfkLikUxmzKxjsj8avyfUbEcsFg@mail.gmail.com>
Subject: Re: [PATCH] selftests/cgroup: free the paths returned by cg_control()
To: Sasha Levin <sashal@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Amir Goldstein <amir73il@gmail.com>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:34=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> cg_control() returns a path allocated with malloc(). The two callers
> that pass it straight to inotify_add_watch() never free it, and pass
> NULL to it if the allocation fails.
>
> Keep the path in a local variable, check it, and free it when done.
>
> Fixes: 5313bfe425c8a ("kselftests: cgroup: add freezer controller self-te=
sts")
> Fixes: 2de27980e1d46 ("selftests: memcg: Add tests for IN_DELETE_SELF and=
 IN_IGNORED")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
