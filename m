Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EFE3D8122
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286631; cv=pass; b=mCznJpMnaXLOiWySA0RbL028pLqR7gJcQHtq75wEl/OqoLL8hYPYHtWD5mDeVGYFWKvGb75UCkiuj8NIyvaBDiV/8ZMYFUUBITw6gTWxNpP0ffN62NyS7IduUREoVTOnTz8CcK82FfmQpGMZU3454/2WhW9AJkz7WKPWINJG5R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286631; c=relaxed/simple;
	bh=clHezw7lNcTBnAgv3tP/vBGWmKfAk8upqO3gMWmQtoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Opbg3RskReQUL7I2uwrlf5MfqDHKAyvc8stm/7jQOdj5TRFMVPW0DaOG5cyapuNlmfn+FyIZd8DQA2Z84NmLYG8Qd4Q7G5XlpQk8CZI/iKk9PviyRbOugFf2T2YjYa9QekclTdWy4829YfC5rKFDHAOY4Or9+DPWoDPGA+EZJ/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxViz/GN; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxViz/GN"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-7f4f0d298caso157563a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286629; cv=none;
        d=google.com; s=arc-20260327;
        b=DrTW4qTvtWa40BE4qytYYx7FhJOk8Mq4ziNoiDAa2D9N9EKakLlRK5mEg1Wsp0btGO
         it+bPj5ipuTctTbiU0CH8Tm361nfXF1I+jHtv3Oz226LgsZMOxG3VGoS9ciAq3jZXplS
         S6O/GEaGhuXw0clUbK1BTwrr7dD15QK05+VE/GjEtRsatSqWIpwXIOcay2VUDtwYw71A
         BVX+hriRH03ekfsX7k40+KxMDaiYZ/BRM2IsiGMxyghhx2h39s5VPuorSyzbFeDl4E8A
         dHgsZcTvZGhYQkA0WRh2ZeJcyt8ox9yKMNPQD9VrBpfvuDY42Cnp3dNOo82cVFYzXqFt
         MsTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vVXM0TTLAF09LIzVmTXQ/UKWy6xS4wCg51jRPUVpoQQ=;
        fh=93D6oFgdnM/FValry0C9fhYq1Oj5VR6vJX7RIrRfXy0=;
        b=Fh4cKMIFybzABk90FiHx57PuJ67DprUntmreHc++sMo/BRUEMBGkopEtkCvHuG3pjF
         /1CQFnDCGHnVXQwOzQuEWrysegFML9TnU9M3OhW5IfNBb7TTJIr8eIcheD+sS0AlMx3T
         nXPmJD6k+Sd7EybR6Hytfe0uGiyH+iJC0g2vS1sqkrXKRcAnSNyXkQNCMLieq45Vlf+s
         RP9bgZRtHg4ii4zXv5UR73TRjX7QridUgKb0aVS8m+vqsLPlQMZIEJOV6obqCRuCWBU5
         akUPvggaiQ2Q1xijrAGArrFuTZEeclbtqMjt/YlGcRq5hTqm9Kz4TkKikdLnqr7LgSIC
         7+kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286629; x=1790891429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVXM0TTLAF09LIzVmTXQ/UKWy6xS4wCg51jRPUVpoQQ=;
        b=qxViz/GN3NiseiwrCfMK9Keu0OUM5CA8tbHjOW5lU3jYQfveiVB7tJ03L1RkOEGYPe
         Ld35VcJZAFrDQZuUk3SrAItfUdkKMXXZCAlW9L5BIhfM732iKOyYzJ920zWY0nG850w+
         rJA6PRA3x5Ww+vtDIrfllBHtS05+DaO4U5RnR4wlE1r4H+ojPklZsg6drO2l9TssV18i
         Q5PR65rppKmPOCt197El/AR1/qgZ9WSv184YRn7R5pAbpmLS4KKUqXtdTVHfdbQJ7ePg
         /ThfbwlqJ5smtVxpYBvQnAYYBtbonKbBRz8WK8fUOel5iAheZyXvE49UR7ZyGn+G8696
         9o8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286629; x=1790891429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVXM0TTLAF09LIzVmTXQ/UKWy6xS4wCg51jRPUVpoQQ=;
        b=uoWSL3szELWQQYm3hUj3OqpzSnonx7oFkbiXt5mqYsgj2YhzL8DNl33+jAdcNdEHi9
         /95rolfRvkwsoNp038625AWfkRimyklAzbTj/sGRZkK66Ae0WA6dT1ysvxbo+DT2TPGe
         aXviEMNNHYu63n5DASTaYKR2eMzcMtc5WLc0aRHbhOeAsM1wE01aHtKKJ4maF4EnXQFh
         gEsdTjWR8yt5dEwHTW1SvAwZq9cy/SZMDagZJF1zP6GY9cybghnZv+fz0EA0UYmOi055
         6ohGKlVOkNc+PSNXpFuQmb1LdrjNH2hPcmK+dj2E6XF4/w/JzQwa/G1yPmTl8gAYJD+t
         wE+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzLDdewPCHxiFvN/L7qUGhyqDv+TuThNZW1GdKl8bFkuWSAQA4PziQ+7/P81PfRfSJw1zRu2ME843UZ2eA=@vger.kernel.org
X-Gm-Message-State: AFuF++lcDxZZNlXQVsWSZOIEgfjBwg9AUhRizqlOzPneDgyzgLKTdMvk
	qcbp5mgt55XmYlJ7kKI7dD33KbMN52gQFjZoyu07JjYKSt3PUTpy7CH7J0h5xyU6+q0G+7ABmH5
	Z4po5MbWGAAJqBius3J7c7/re5+G98ow=
X-Gm-Gg: AYBFou09bC8CT6EuTr//Fkmns/4N298XVz0Y+U9ClkSPRcni/bYT140XMmMYnnv0GCu
	sqO1dXLcEj3dkVrhGGQY2J9r/5g2nzdXGTRx7nck/eQ9v9TcDdc7bMoFgmLmfU+QLg4lvYycj3A
	XHRdsrzWG/p/oulPr+ZwRP8o9ibfAU7/mS+KIIoio8jyzgatsA/w/ICIs9z8wnsEmYbqQP1WYs6
	MbRdsn+l5RYjOx/1WoB5VPQUSR1Vy3FXQn8WOi28/1FSqxQtZhmRj27f3vTb/eSXwR+c8CFd7nh
	30JJbLRKcteCiMy2sz0fdqO/3aD8J8lp4hmixMZ017kOsfoeEzhi5Nk=
X-Received: by 2002:a05:6830:6ae7:b0:7e9:eb13:d042 with SMTP id
 46e09a7af769-81780f98346mr3972638a34.8.1790286629265; Thu, 24 Sep 2026
 14:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924210121.87032-1-avagin@google.com>
In-Reply-To: <20260924210121.87032-1-avagin@google.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Thu, 24 Sep 2026 14:50:17 -0700
X-Gm-Features: AclHuK_CXvl8UOd3XjKPautfeLtYEeast_Wrlhx5oTa4-IdhIApjUEZBzjtbrmY
Message-ID: <CANaxB-y9BBG6Dz3s9mqH4v+2g=6O-MHYW=AVFSkvcTNA9DnAeA@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] x86/fpu: Restore and reinforce signal frame portability
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org, 
	criu@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrei Vagin <avagin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:03=E2=80=AFPM Andrei Vagin <avagin@google.com> wr=
ote:
>
> The x86 signal frame is designed to be self-describing. The xstate_size
> field in the software-reserved bytes indicates the actual size of the
> xstate context and is used by the kernel to locate the FP_XSTATE_MAGIC2
> marker during signal return.
>
> This design is required to provide portability of signal frames across
> different machines. For example, a process checkpointed on a system with
> fewer xstate features and restored on a system with more features will
> have a signal frame on its stack that is smaller than the destination
> host's default. By relying on the frame's internal xstate_size, the
> kernel can correctly validate and restore such frames.
>
> This series restores and improves signal frame portability. The goal is
> to allow process migration across CPUs with heterogeneous FPU
> capabilities, as long as the process only uses features supported by
> both systems. This version addresses the original issues by pre-faulting
> only the required size of the xstate buffer (rather than the default
> task size), and includes cleanups requested by Ingo Molnar.
>
> v8: Address Sashiko's comments:
>   - Combine %ymm0 load/store and syscall into a single inline assembly
>     block.

Sashiko hasn't reported any issues:
https://sashiko.dev/#/patchset/20260924210121.87032-1-avagin%40google.com

--
Andrei
