Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6530F958
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395814; cv=pass; b=aGp8kgjr9yJO67z4WqQB2zlI10dsaSoJTgokwrTDRmshMsOGobrxe9bzlpmjLTAZv5JS5xNU0ZeHXnrIHURh1hm+BQX1JLI0zoDoctbXgJxkFJTJ1fMYYcAZqW0jU6dZSBWN9Gk2YnbUB5nunAww57CAcZDA0S6jpQxKw8oiMLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395814; c=relaxed/simple;
	bh=m8tk5KdgyZdkzaLmWpyk0A8uMzZSGMtaK5eFUbislS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqXkVl4daYQMdX9vF20M0JftmcuAiMBuRU0cZo+rMNPCH7+guC26Q2RDmITeptTwaQ083pgQmKiBMoR8jcsGsteV78tNqQ2TKamVtV6P4MCTq8b/v4T/N02lZgOir4GMk1ZbJQuJorKEdZhfrzgtc2DNnE3f/pu7sf/Sv3+Subw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIJrNXla; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIJrNXla"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f65ebea805so1259735a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789395812; cv=none;
        d=google.com; s=arc-20260327;
        b=sLeO+ioDdZEKKROXa6xvmghXGw/+neOixm2VwthJlRpyvZwayQP3RrWNWoewJvCxmh
         nkzfgBF6XenMTt2hX7/cV+K6XZis7mQFZ4kNHEviTzNABRPTRvNQXl6hwIgQU1Q3aEJL
         MUV1jlyNOtu2jkAHdMirvw8o6Keq5MZQ5swrFYH6xur/l67FCdZNnrhXGpbSYbelcqa2
         NZma9PM9dTEneegBz/9CAfhMzZ88rkvIhOojslAKnsmTTQY51Kjysw4KBYwA1f4xfOvK
         rQ+vfw/CBn3fPT1mzOgzXCja4AOb2Eur/8r891+hYK9P8ZbccxZ7Qfcw7dJP9ay58nHx
         RMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EaUvQas+F9VKTGDwtMRQb6aKoVCt5uH38B+Wid/fBbQ=;
        fh=sOk+sSvjMk3W0mOdHgzFEuBWb7g2s2AZfG8wmZxqQpY=;
        b=ZMnT+9jTxsvb+WEth+/t1FVZVrQsOsezXFiI2VNbh2HrITfa7ibqyYoGBuviyh814h
         U2y6KHy4SqKN7OHKkghtJoF2unWfOW5KnvISDTEqt4rhoV9HpqEh59vkV1wuKJxCzsSr
         tw3AhdFDAYmSLi3F/qk2Ye9zgV48PthSOA4U+v4dg0+dQQzxaPtZQTsP42EvTO1Mapns
         PTEm4WtHaUyZFVkAMaq2tRholv3HsKYd2OLK16bPj6V0betl5M19Lv4eNXdCVvZb3+aM
         jNqc11ohofRohK7JUdfELnD4hLH5X6mo5daCQUHCFhh6bMYOV5xUIblpVYAuq5pGIofS
         TCuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395812; x=1790000612; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaUvQas+F9VKTGDwtMRQb6aKoVCt5uH38B+Wid/fBbQ=;
        b=RIJrNXladGxhpQRVeAdVhpNJrqnUMHzpPH6YHY+cNnLBWdj+jqxM48+l16x44J3jiD
         xbvczD2GDG8eoT7Btyj61BFk7UNi0cKc1eRKnB0L9UhFbpUu1Ud64LCSfRxQXKLlgilV
         rMC//TwHVb3GQ92eM+UttngAe3XND5SGMCZPIcGV/eZdYALxjJbSmKwEC9msAXichAA8
         DzbP11mE12y5vBgqPCZ/JHnAXbqQYmJNRMHDIx6fOMzlcGKX0me8FCDMjnOztRBKZSiI
         pVoIkxGTMzLCsXENk9ALoP9aB2vwau8O4RnkuanHHRKNnAb3TE4I7eFPFYtCOfGrR3RY
         1mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395812; x=1790000612;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EaUvQas+F9VKTGDwtMRQb6aKoVCt5uH38B+Wid/fBbQ=;
        b=YmkRKN+llJn3lmeAGGqv8mj+uumKoNGYvaIYC3nD8ZDbVltr/ozXGmFGNFSuD1pVdN
         dzJisxgap4zKSUQWKIYF/o/rDH8j9IQCqVKHv/hRr9LaLLmY0Jnnm/v5yKY1GSkL0xtw
         eiIAx0EsadW/lJmBOx3Nzv9svnUsGWwMvLchpHL4QYLVrqUIXGELJoDP4DXLbqWMcvmJ
         390qAMCPJDy4rLU0XYRQGpYTDIVhJqSAJGetRhQwmcOl0l58kmzs64NCx8ETXdzfAYOx
         zthiWRwGUSVSIKTb0jt1SCRhmfyRkVlW/PxILQ5zig9Whohf3Ug87yh/M+st4oS/p+Wk
         58dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWFRyj+ZDe6rwHDQ6t4ImizNngHanXLlKkuy6ZAobqxa5rjsJ70rFm6lHSGOZ4lLx58C5MM6OhBCTedtA=@vger.kernel.org
X-Gm-Message-State: AFuF++kYU6umlb2vOwUOJrO1rz2Tn0jCHV9s/QY9iGojD994iq0ioXCh
	7mK7WIF24mHM+bA0dgydnD0+5S8PkGvROUtf5jj4wi7gTHT3dJNirHZOGqPofrFRNt/RyqADZ1G
	zW87LRhPZkxjQGGf9QNZVE0b4AayTNwE=
X-Gm-Gg: AYBFou3peqiwbHqaf+0/StEeln0KZc4ru4ThYWQd2PjGgX8T7jKnrZVYKSyQOU6Co0j
	suq/yzc2dTgBmRqshH7QluYItjCWB7gu0/4YU3pHsLRZX859VUMeNTcnK1Guc0ZpuaBaKlK2/jv
	GQkMQCfB+fINZ8avqW+Kx+72b0YZlAlTlbaqWRq46YREX0Zhqp1JrNIzHkUNunOsJ0fBaSkYqg0
	MQ6UdaEmfa5UrCmtnpb2097Vqorob4XSRTJHstH3T46gWS4hzNEQClVcocREimSBZ5q+5chvKVf
	ptofInetfQsCpNc7Ceo1FZcmQSoZ7oMIeH+IQfIvJQY51La6zK4RHsXbdjYQisjFQ0Alli3SeWY
	b/6KopowKmC3yqxTA+39U+dhN1/jlp5OsI8cUUvve7g==
X-Received: by 2002:a05:6830:438d:b0:805:b3e5:18d9 with SMTP id
 46e09a7af769-80899457cb5mr3276624a34.10.1789395811612; Mon, 14 Sep 2026
 07:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912100315.151674-1-mikhail.v.gavrilov@gmail.com> <CABBYNZKDMriYfGN_8hNmpDdhxdJXL8hzOzP+7LhsV_kwXcYTBw@mail.gmail.com>
In-Reply-To: <CABBYNZKDMriYfGN_8hNmpDdhxdJXL8hzOzP+7LhsV_kwXcYTBw@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 14 Sep 2026 19:23:20 +0500
X-Gm-Features: AcwNN1WphdiasEHCC986WGbnoeurVXFdsisLPD0AeIJ1IwaUJ851qa4o4JNWsZU
Message-ID: <CABXGCsPe5wykd8Aj-hm+SJ7SGQyb8yoGNnx3XDpPmBathj+EGg@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: RFCOMM: connect the session socket without rfcomm_mutex
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: marcel@holtmann.org, nicoyip.dev@gmail.com, pav@iki.fi, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Luiz,

> We might need to check if the sock hasn't been closed in the process:
>
> https://sashiko.dev/#/patchset/20260912100315.151674-1-mikhail.v.gavrilov%40gmail.com

You are right, and the review is right about where it goes wrong.

While the socket is being connected the DLC is not on any session yet, so
a concurrent close is a no-op: rfcomm_dlc_close() leaves without touching
it at all.

s = d->session;
if (!s)
    goto no_session;

d->state therefore stays BT_OPEN, the state check in __rfcomm_dlc_open()
passes when rfcomm_mutex is taken again, and the DLC gets linked to the
new session even though its socket is gone.

The window is not new - rfcomm_sock_connect() drops the sock lock before
calling rfcomm_dlc_open() - but it used to be as short as one mutex
acquisition, and this patch stretches it across a page attempt, so it is
seconds wide now.

The consequence the review points at looks real to me as well.  For an
orphaned DLC rfcomm_sk_data_ready() returns without freeing the skb:

struct sock *sk = d->owner;
if (!sk)
    return;

and rfcomm_recv_data() does not free it either - it calls d->data_ready()
and returns 0, while kfree_skb() sits on the drop: label it never
reaches.  So every data frame the remote sends on such a DLC leaks one
skb.  That leak is reachable whenever a DLC outlives its socket and is
not caused by this patch, but this patch makes it easy to reach, and it
may be worth fixing on its own.

For v4 I plan to make the close visible instead of inferring it from the
state:

 - rfcomm_dlc_close() sets a flag on the DLC in the no-session case, so
   that a close during the window leaves a trace;
 - rfcomm_dlc_open() clears that flag while it still holds rfcomm_mutex
   the first time, and checks it after re-acquiring the lock: if it is
   set, the socket is released and the DLC is not linked;
 - the state check cannot be used for this, since BT_CLOSED is a legal
   starting state for a DLC that is being reused.

Does that match what you had in mind, or would you rather see the owner
pinned for the duration of the connect?  For the socket path the caller
holds the fd across the syscall, but rfcomm_dev_add() in rfcomm/tty.c is
the other caller and I have not convinced myself that the same holds
there.

-- 
Thanks,
Mikhail Gavrilov.
