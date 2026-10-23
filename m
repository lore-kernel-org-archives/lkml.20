Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792784662;
	b=s9rTaljJdG2K0uIuhTGy059bnfpHWut6cCHU23HMqhkpwOk67JDRk+pT7MY3Wta3kiJq
	 rWtqzwR8EhZRZ0RHlqjSvWPo0q8IRrKCLSRwhEciK4vQKPqJ1rL3C1mhaDujbPIQUWLaW
	 IJEisZqcCo2cn1uadAA63jvma/VeId18GVscHQQs30ryar+GqAUFiJJbm7a3rdLXawoDX
	 vE192FemnYLtOMnMPc3etpxjyHwjrJ2iQe/lDncxSnq35im781AxwhpI78VIwNnaBzmGI
	 fgtNxbPN47r11QamUGpQjebZNzxn0DLjrp8p+lcy309g+bZUtMyw5GM4TNu2OqwktgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792784662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mVbXnBjxDzKYkZPvUUkhvSfwmh7lftHOpNhLPwW39UM=;
	b=c2gpmpPBwl+VaLDwbKAE25fAZN+KjmUlaOIZ4QXpp3/ulfbdMDnZLGTOvTJK4SiWUEGh
	 YHpQ6XYGe4dc4wv+VB4BwdvA4UX/CfY7jhuPkSMMReoXakCpUSl3lPZ1w8mm/rjIQdn9r
	 vNsfM4tQiNcAjuBH5D0ZUdAC368BFByn3obrZCCLyiWpv3pFgbxU3jZjrJimCtmUIsfGm
	 p+hmi99St0VtuvM5i7bJb4/Nw+xlAETGvesMCX+EcbIDwqUNFKKWsPCwQ3ScmHUtm03mW
	 Dw0ESIzSVqg5UrVD+cngqzgaxouIb5an3BxxA1I2iT0cdGNwOHd2Lnl5bfA3SmyLgZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fxevVrmN;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC49606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC49606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fxevVrmN
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso176579466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792784660; x=1793389460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVbXnBjxDzKYkZPvUUkhvSfwmh7lftHOpNhLPwW39UM=;
        b=fxevVrmN+qQk6z4wdz+jRQcpYg24sj0t+ofO8nLsLeiFi+DqBI1COHGX69UHrqwohA
         9O1JFU+0OJd2Zlr2r5F/zVdQDbNx9DiiEpEuRENw9os04R0OsG90xF9KnONZXxUpM0NG
         lspPLsuq0W3lLyFJ5Zj7hAMvOoR7NsDDudPac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792784660; x=1793389460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mVbXnBjxDzKYkZPvUUkhvSfwmh7lftHOpNhLPwW39UM=;
        b=wikamaz94SWby4qtxeTOHj3KhzYZgJW9HSC1eZ5zVHHX0G7nkfzqg3MRNZX+UcY+VG
         plJ1AlchNF7zxO3PnJpiyiKCjDIGBvQtMNpsSK95ozF9bij2227unfv2AGq3fX3dX/MA
         hS+pLblDnQF+hQS/L8ff+05QBh9yLprQzB4t/5vKjS5HGFznG0uucGbs71KL3VCuWTIr
         JoejKgBhx45PfipJlCOT/JBaoqn79cBYu52aHwCaQI7W0IUNnjIeY8/+cPi9c9B27Yma
         IuuaZi8fKnXN/XHAAgwza50rJvCwcEoMhmjYar+gdrX7NwG/SN1wpGS6o1+wQcT0Ssiy
         Im3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8JSTq94MKTZsM580n1ayQMJWkH6YnliERNy5V7K8a/UlhFU82i8dFwj1+Rp+H/+8Yxcc7K/aTcr3FhUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxII7SdaL9tL9YSj7XezgJ+04/jJipGTKbaJo6DznK0WA6qlQH
	fxbUhlRYr7+FWFGa4OJHPsFmBqzAo8LniIMiWnyz7RDKjbQrz88iq2Q492nw0+oJz03WXze71ny
	9gbF8/7A=
X-Gm-Gg: AYBFou0XciSL8dXhTyv6B3eIPW+yr5LBcGbuL5cnHmCuVsh5EINWCSFPJTWR4xg4r2i
	Z0cvOJCjckFF4AbGLu5XZscSZLJ4rEfuaH3mMsDtG9tfR2TAxsfkEwkcjXx2YM/D6e4sIWalDpX
	fgBs8s2jcqGTh3joj+Buw1jIAi/qq2Dx2tSTuWNJfKdpxjzKINQJrNqrcBPZjaPXmdD+kfxhFWP
	dq0MlZuZvSkikpqyxt4ZWqRx76/ALDv4XK5cAGSSn5ZCyUUJtSwRU4loT/g+yiQPOel6e1cUWEJ
	j0YCf46AmHTj1JESw6gcx56orB6bTYaD8/58oLVDt1I4qEzXlyd9n4IVZiPdV4LT5Tcyd9s9yY4
	SesUJpdLfj18cViCsmKYjs26EI+M4OaCcPy0SxGtsgW1IX8+lqy+H0y7dLTLNAvGhPCmj8j8fZ+
	lqjNZQDzdz/c9snLzyMY3rooFNUoMtqUqHKpkouQ+qC1yAUIC7knnI+c7jy2oZZ+YWYCvpNtHr2
	oEOkGgG+rauFbo6FBBzaLChvUNEt+wQ0G6XuE+cxowhHVbWAKd0RMGESI7vYPLc0mtmfMM8Mj0D
	C2rH1fUTu25FAMvk05mHuAQYtSlGZnLz/UYVhAuKfxJZXjYTzgY=
X-Received: by 2002:a17:907:9703:b0:c46:7645:86e with SMTP id a640c23a62f3a-c46a9282556mr477790666b.42.1792784659745;
        Fri, 23 Oct 2026 12:44:19 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea351sm190866b.28.2026.10.23.12.44.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:44:18 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3fd91337baso172832066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:44:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzk32BeOdo5GRQ2yKYwFR1oK5NkWlmIFGEbFzochCwVL6P47SbMw0kR4OTgdv7SwghH26TJYGUtN4tQQdo=@vger.kernel.org
X-Received: by 2002:a17:906:c114:b0:c2e:5efe:f1cb with SMTP id
 a640c23a62f3a-c46a906cf08mr483222666b.8.1792784658608; Fri, 23 Oct 2026
 12:44:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atdn5xA9AZHAWNsM@hobbes>
In-Reply-To: <atdn5xA9AZHAWNsM@hobbes>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Oct 2026 09:44:01 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgjwxSCDQ7VhH5NgHSK2RG+9tDb=infbWbgQbWWHjVbow@mail.gmail.com>
X-Gm-Features: AclHuK9Mh6sUKYQ2dknAEL4P43JX1aGmqjH66ERkCdfbwvVpbQlUCwKUI7maYjg
Message-ID: <CAHk-=wgjwxSCDQ7VhH5NgHSK2RG+9tDb=infbWbgQbWWHjVbow@mail.gmail.com>
Subject: Re: [GIT PULL] sysctl changes for v7.4-rc1
To: Joel Granados <joel.granados@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, Yibo Tan <lhfff@tju.edu.cn>, 
	Zhan Xusheng <zhanxusheng@xiaomi.com>, Kees Cook <kees@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 03:09, Joel Granados <joel.granados@kernel.org> wrote:
>
> * Disallow partial vector updates
>
>   Stage sysctl vector writes before updating. Removes the chance of leaving a
>   sysctl vector partially updated due to erroneous input. This is not an atomic
>   write; a concurrent reader can still see a partially updated vector.

I've pulled this, but this feels like it could easily break any number
of random scripts.

We used to just update until we hit an error, and I would not be AT
ALL surprised if there are scripts around that echo some
not-entirely-cleaned-up string to /proc/sys.

Put another way: I do not understand why that commit claims that the
vector data should be unchanged just because the Nth element wasn't a
number.

What was the impetus for this change? Was there an actual problem it
fixes, or was it just a random decision to possibly break user space?

                  Linus
