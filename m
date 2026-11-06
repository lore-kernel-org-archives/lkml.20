Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793982905;
	b=LbteUHX/ANnc03UmAL2sx6SB1tv71FowTR2a4VEFxkRCPJT2NZu+Eihm93MpqoNiOr8E
	 unLAZUXHdGQiBTJI4XMfvbeB1zqnvmx6K/Rh1iNa4xHZj8ODW40yEnvkUCurpwXVchtH+
	 Wv8pgRHWbLEC7uQqjMi0cLIXzXsG/cW7IQwjpfj/6BeUk7zAftOE4L0FQsp2hbebC6MN2
	 ng2OJhC8Iz5zXIqd9DkswglSbu/qql+sJDADremX1aRnKiKCUjqzyyI2mEe4W3rxhEfmN
	 gvuHLckJLdGUKbbXKg5jkyOOfmShAgZxV7cJmNCqnL1un2db7NxVJkPkjBsKYZUjCUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8CVOtjuY7d2VzQ4Z2Zf3KQsMmbUtgWXk/lvdZGEh5Z4=;
	b=foLv+MDJtqeFqbjj+uVfJgz6EzNakiKHOSUOT2n0py52cx8o+a5FE5iSonjqZbqWK3Hf
	 3NUuA8AKMc+nhwcYZQ04RLAulkXHsvffUrOT+ruFTMnnbhxqrcFzxw2CKuarh/OGHR1Ih
	 yJZDEvYqzNTRMsw6/rdCxw2JukNTR1T/ntaI6pqMimNtlUT8DJgceHPnWiOdQQ5GYgYIC
	 nfMbxAzCZdE1JmS3T/hbwLi8XDKBOsy8t4jqg/N86GTRoKEP8u8erGWXI/YOc08wTU0hw
	 jn2mkfNNPjHyVYGs0PIFvSLYVo0mADyz9nasxu/M34DggMvP3kxspH7FnX3SF5hxmdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QqgtdqNV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A796E606A33C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A796E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QqgtdqNV
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so659282e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793982903; cv=none;
        d=google.com; s=arc-20260327;
        b=MfmJ+ZYxRKPAC5+9KMgTDWUbtcBz91JC2abUs2vtd6jkfjWeKh2sDPfae8JU91c4zW
         RxfrE7C/Uf4dz7SkX78/TW/VW9vYcg0ZeA/Ks51JmCh0aiqisJ1TezJO6BjKgo6+FJje
         FMezTta/NtlqEx6wrfDKYtM9JMtGLeNUggIvcmceIIFouAwiE8im50c4HMwXYRFvV9XT
         ibw1SNDUFX6OWR81cpLOuRYYf9c2xIQmDIRDw2BsD5tlWFEJBhW2HUjPz4/9duUXowtL
         xgPdeMWGlTHj73spHqMKhUoXrFaOwh59uZjzpLU0AkUb+2BkEp6Q4Da+B6FDuBWmAZ9q
         23UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8CVOtjuY7d2VzQ4Z2Zf3KQsMmbUtgWXk/lvdZGEh5Z4=;
        fh=7aWGqlZVYUqPxgI+uGRus7erSPnuI3ocX3RrKBNQ+1g=;
        b=qd/XTuK1SWqvxVwJAhhQgATTTWYYIhuXa6YYnen394fK4eYRziYSVhKhYlMQ0Rlg5q
         OLEqTsLWkdt3qettNpkmQLFyV0tS82d7nhO61bBUdAcfCm4FXXRji80Xr7vAWs6HAjHR
         5mtA35CyFyk9ghqNt5HSKX6HWRpgNXAxxoRmS1XHyR8mUY6N7h86+1k8ESxmjEEmInXF
         V7gszynB7Nu1vhb5A6XsrH2NNpFXiuyxNGyYvHPP2UKPlRu5qdkAJHo/XnfzOq2Sq/aV
         8hDMfs9TI1A7qFuDT3jAkMV9h+B0zVS3uxptsCEzSl87O4toqcbsS3wu00dPo1uxVdzp
         veSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982903; x=1794587703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8CVOtjuY7d2VzQ4Z2Zf3KQsMmbUtgWXk/lvdZGEh5Z4=;
        b=QqgtdqNVzy2wCLu9jnzrmY5brlkpB0KFVfgtGnfjqeGueDKupQB9ItrFXco7PaOAt/
         /KRpbrCJngm3D+Dnaz8RQzG28Yw9uLqysf4xf0V2F+F8GKu032joCyOI0aY+kqidpCfm
         WDYdaUKxUn1V3lT7mcEg0yFV+yIC/Lv1WhM8BPP57ZTLuX3ZZ3w62Lx3Pc/d9VPNdqhT
         QlDr+ypPC0MgXQvMK4QTLJzHqvxSZraANnhBkr57StHgvz/WQXJ6sJG1q9JZ5FRDoWe1
         8FY4kbuhwvxzkrZp3j05cKtN0RinGluUOLBGdeLl2XKSMrjJFbW7olWNEzkFyAGf82TN
         BNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982903; x=1794587703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8CVOtjuY7d2VzQ4Z2Zf3KQsMmbUtgWXk/lvdZGEh5Z4=;
        b=QQ5ROnwQ2UJtpP1arYp5P1epnqTJjpBuxu075SZblAoXlmON1MWyu5qJVxYZc3WCZY
         9qTxyAvW3qJzP7QXrNl5Y5QXqvXnUc7M/duRFiLJuaFHEffXStPxqNKuR/MnM/02RJ8d
         0cJhL+E6l4vbHAD3ohNJlc/pOqHN0i7rMpuQSCjMMX+kV2kScqQa1ePTYo7QKIejpVF7
         QeBY7QfHH+0NAH37n49w5mCX28/4FFmnBkcT5BLQFpOg0ucpFJJ9xfexxkOQpmU9XgB+
         nh9/UH83WYWzqBTSL/nQwhCJUZwC2Df35kPiXtqHfg3J7wKk0xqyJHsLNDLWDenszBqL
         fzjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpIw6xak90qrsOpeFqEfx/HZ1CREkau0TNg9QotQm6D5u/V9PfZbNHSz+h3Z/vXR1SGgjlgxMQ3GKomtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BiMNo1LyqBcmgKSwrCKvR0FTBjEEZOVuxoH7KYPPoCZWIUiG5
	yUkVMge6FI4D+MqfZDW1oZnU31h4sB1Dt5zgM8hZERXyhx9+EKk5Bh1gK4CY/RKS/qiuUu4t+JQ
	j5+LECmRUtVuYWbTkqdlfgBs/tCC0AV0=
X-Gm-Gg: AYBFou00Mial7kaorSUhvi5bxQOXbde11oe6SPMd9OtHDOoed2/sQSb8+ox56ZIQuk4
	T1aZCA1eK9+z0nduxPxnk2jkZpjp/lyPbHY78VHJapdn5Ch0oHBa6OHmccLL+bD7Zpa51EbkgM4
	7uuJdIwsVWmvPBYnvSHILonhSoZH8jLdgZEJ52R1KCnmg9K/f8BryYSgM5TO9AoVzZzz2Qjo2cz
	X0nFMKX6lnC8ewf1iskK6ERaVrJHccg6ayqDHahA8WqBK0jEX5TAkdGYvLfr8SF5BjXIsEJ59NY
	vio5jEL+WkTAmgII6RZ7vsytIgjUNOxFOZk6b4uVr55lrzQxY3G+PNjCwPyGFCn2F7sgMIW+uWZ
	Dxl3GjR3R3APh2HHxYXMZe8HyProPIUnKECXhgX+0FUHBIRQTDoCQXL332qeTdE6FltWKsT7MIx
	5/umFgumQ9oDwl9WSl29qql+iRji0LObjz9rq22JhRcOsOvwHdU6yieJlk9SCVPDhbQHBYzpRwB
	g==
X-Received: by 2002:a05:6512:2524:b0:5bf:a363:3392 with SMTP id
 2adb3069b0e04-5c0037c305cmr1026548e87.2.1793982902662; Fri, 06 Nov 2026
 08:35:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-zsmalloc_stat-v1-1-b574f4714adf@gmail.com>
In-Reply-To: <20261106-zsmalloc_stat-v1-1-b574f4714adf@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 6 Nov 2026 09:34:50 -0700
X-Gm-Features: AclHuK9bkduKRW_-rCB-rmHbL-N2hWHiB5NT8He7c1ja5_0IYw7qh2rihJItOYc
Message-ID: <CAKEwX=P+8AhOV-HQGHmtWftMs=if7LTk6K16Q39bJyF3DFFtdA@mail.gmail.com>
Subject: Re: [PATCH] mm/zsmalloc: keep fullness stats consistent with CONFIG_ZSMALLOC_STAT
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 2:56=E2=80=AFAM Xueyuan Chen <xueyuan.chen21@gmail.c=
om> wrote:
>
> The fullness-group counters are only used by the debugfs classes report,
> which is enabled by CONFIG_ZSMALLOC_STAT. However, these counters are
> stored and updated even when the option is disabled.
>
> Make the counter storage and updates conditional on CONFIG_ZSMALLOC_STAT.
> Keep ZS_OBJS_ALLOCATED and ZS_OBJS_INUSE, since zs_can_compact()
> still needs these counters.
>
> The behavior with CONFIG_ZSMALLOC_STAT=3Dy remains unchanged.

Do we need CONFIG_ZSMALLOC_STAT in the first place? Is the overhead that hi=
gh?

Also we already have a #ifdef CONFIG_ZSMALLOC_STAT section. Can we
just move these helpers inside it, and provide no-op skeletons in
!CONFIG_ZSMALLOC_STAT case?

And if we're going to have CONFIG_ZSMALLOC_STAT,  anything else can we
wrap in CONFIG_ZSMALLOC_STAT? stat field of struct size_class? struct
zs_size_stat's definition?
