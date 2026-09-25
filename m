Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE93309EF9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790298458; cv=none; b=OZaMO2Kac6L/3+dHOOi9LnRsRn4jwnKzjojJGp0odYUUK4ABBc4ittK7FeueHgGukRrZjfu9cHZZYbZmPuNUdYZ+SO6iQP2RhAmnVGx7c0RODUJc36GItQqs67XEDOWpch+q1lTL55V2cqOvF8skCl+wJbDS9LrW9Xhhqiv+cN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790298458; c=relaxed/simple;
	bh=JIwdeMpMCwvovsCH3fXlKqHUZkIvLyR993CMQw3C1sk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=q7aJOsgkNo2gSjbTcWoHeKna0kFy2lkWgv4rcr9ureyBsBBT7YlyaL/L5YnZr6z0Sv/ByrA/zIjHyqaSRFhdxM2h+osuwJtTU9HtHbWsuvwAzwsZsJWRz/fQvJRUSIPeAIaxT/i1nW4phAvwXBYbMSY3sOwMh175CmidXLuioto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I732Gea0; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I732Gea0"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a856865so213013b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790298457; x=1790903257; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r7tV3eZL9fiGKnU0k30bM1I0LnKjdpqO+bOlebOYHtE=;
        b=I732Gea0dtmXKd1SyvRIcjnaKAOZW4CrQ54NDPQnhJeVMiBpdZZLkf/enBrsJDDTeg
         WvqMZXDsZ8m1BFreu8P1sLGnZeOUOOD31gN2D3dWUeSceLAziC7z+JDITxi39rP72uqo
         OiCsS/tNPz+M00qjbx4IZeZDH8fj7Z1uM6E3HCZIL6b0db4qw95MWUqOokpTwFBFNeNc
         HPjBp89Ig/HTLmKPLU6Fi/BjOXzGU1BjD3nY8xVVdZgFKcCj9QlPkrG7BYzSZv/Mdusz
         PB+E3RxVyKOeQd2G+rP/LZcypFwrufzG25VuKuhbgZ6kGaMef/9IEv2WcChpZHVuzF2w
         6XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790298457; x=1790903257;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7tV3eZL9fiGKnU0k30bM1I0LnKjdpqO+bOlebOYHtE=;
        b=2tCUh8eLahpGd2i21oxJDxaeIdJomHF+YQW3h6lpNIMIBWoK5lqbk4XFVDyzMis1Aw
         tA9v87dgViiCTcNvKJmV4/1VMenBtYM1rl94CbML0JDqCcmbF5KeMVr196PkNmFi2LAK
         EHrSLLaluWPggv8gtR9z2f/6l7A/f6VU+PxktU88uOD1S49+sk0ks08etcRAVY66VPu7
         6l64g9brdPuf0vCx5DPMlvnpO10S8fbKL58LwUq2743k9ZnrznRjfJoifk0lOkVSGDLo
         lXil+6CZQoGJxkExcu7vGtjA1cgRReYEzvAgRoWbgQ1BYgcLXV9eEfDrQVcOZ6UNZHU9
         JSIw==
X-Forwarded-Encrypted: i=1; AKwUvBwDBSLCs3tAqDomXXXVJ/YdtRx1+5XieU9vjx77ol7V7qhwZQptzmw8SYZFTNZYfS1fOSYS/DovKhcDkT0=@vger.kernel.org
X-Gm-Message-State: AFuF++mKeRlCjBtNcTRGbmR9CZ1/oxMhfMgjgwMQvXICgXC+CpMP06wH
	AHobdHR7XurukRgD+8y3cm4xfhGJa8Cg4fAXax3FeDaMjdPtyPZ2VSmH
X-Gm-Gg: AYBFou2WalvqH6YN/d44qzH3RFiqCW9BTNm/s/hsqbczcX8ihdLhswSC6KJ/8KJQj05
	4So5yxkWsg+ymfBvR9YEOMRO0D6LWl4esw3WB4X5We6bzbdS6CbdptXb070LKR1XheVeylHKB4Q
	IftG4TIy6AnbG/c9P9BX9a4ltqCcIZ0AYibf/T2tHr6Pw8vYG+/4Tn2vPIDa+UowLA3yPEhwK4u
	gOaqhxwSiorcEVbByXri0PvqnXGY+/c56BR8Ubr88EO5j8d1F139iWkJyxidgB+Td+heZJlbCmS
	jCFcFrTUMDNDcY/2A+Go7n373RN3Cqq9NCchXR1vEOtm3BZz8lqtcYuc4ixgnrmD8mIX8aOAiYw
	//fFU1SNkevO0MwtznrH/J5E7I12GINkUkzAWLP/JojQ78ctTd2jj3F8WPfF9v2y1TvJkfGTgQD
	91f/zdJuIUIPgmgXQsfYUSIxnT2LnVjf/T4merPHpmtbNdp0radvmW0SI5FzpJcFSNCRhDtXpe
X-Received: by 2002:a05:6a00:4519:b0:871:41fa:d1c6 with SMTP id d2e1a72fcca58-87e98998abdmr3377299b3a.3.1790298456401;
        Thu, 24 Sep 2026 18:07:36 -0700 (PDT)
Received: from localhost ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fead95ebesm313239b3a.34.2026.09.24.18.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 18:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 10:07:33 +0900
Message-Id: <DLNZU3AQ6BPI.3HCOHX5HXVIAN@gmail.com>
To: "Nick Rogers" <nick@getfieldwork.ai>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil"
 <hverkuil@xs4all.nl>, "Brian Daniels" <briandaniels@google.com>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: v4l2-ioctl: zero the ext control built for
 VIDIOC_{G,S}_CTRL
From: "Alexandre Courbot" <gnurou@gmail.com>
References: <20260923160936.33445-1-nick@getfieldwork.ai>
In-Reply-To: <20260923160936.33445-1-nick@getfieldwork.ai>

On Thu Sep 24, 2026 at 1:09 AM JST, Nick Rogers wrote:
> When a driver implements the extended control ioctls but has no control
> handler, v4l_g_ctrl() and v4l_s_ctrl() pass VIDIOC_G_CTRL and
> VIDIOC_S_CTRL on as a single struct v4l2_ext_control built on the stack.
> Only its id and value are set, and check_ext_ctrls() clears reserved[0]
> and reserved2[0]; the control's size and the rest of both structures are
> left uninitialized.
>
> A driver that forwards the controls rather than handling them through
> the control framework sees that stack garbage. The virtio-media driver
> under review takes a nonzero size as a payload to copy from userspace,
> so VIDIOC_G_CTRL and VIDIOC_S_CTRL fail with -EINVAL through it whenever
> the stack is dirty. GStreamer's V4L2 encoders set their profile with
> VIDIOC_S_CTRL, and cannot negotiate against such a device.
>
> Zero-initialize both structures.
>
> Assisted-by: Claude:claude-opus-5-5

nit: per the kernel guidelines [1], this should be

  Assisted-by: LLM

[1] https://docs.kernel.org/process/coding-assistants.html#attribution
