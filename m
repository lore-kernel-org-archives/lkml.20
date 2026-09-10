Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80843471276
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039086; cv=none; b=VEfapzDfOiHZKJIOiAOM8piDHRaNI1n2AZwh07JOy6xaRvjU+FYD0bFxgTJBQqoxd9PduOm9SUdR7GU52BnQolEX+auWCc0YkJ6B6sWqLUHwr/ZcLFnrAnm5ssxSOyCWoGYhFPxB9z8RpglBX3sfk0Jlal7ZRYyH0SCYz6a8mhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039086; c=relaxed/simple;
	bh=fTXI9XeDkoiRYKraIpQnpSaQthAuR3nEbNOkNYs+NaM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IQuSH6m4zSMb0LqNSfczuROF0fbjclnK92wtoVnaeqEnQlzzn5mDOSSZI0PRgW1wUA2+Bv9CLxDY6et5Wu0kcw1nYmITR0fDHQS3JK135ju1sqtDDvNOa69StHImkpRAE1u7hhRMBxOf2CiiHp+rQAEfH47ktsS3cq5DEB61I28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UEFMFxTw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kUlUPlYZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UEFMFxTw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kUlUPlYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789039082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FZ/vaABJSYubFY5BrcerrZEm/i8qZMA36SfngBUQr7w=;
	b=UEFMFxTw4ST2Ld6eIz9pUvdmAuT46NqrMDjsIePNGixpBT4XcadMpTSUZedZJa37LBCGei
	TO49DLqlUNZ2swm7LtDYUqSz6NUW2OeJfs1WyyPiQRYG78t9kf+57gKAT+V4ix3ohQwF6c
	3NkfkGNO2lkfBT+5zXTHb6q75Xy2u20=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-iJGviaj3P2m4wRISS8wdAQ-1; Thu, 10 Sep 2026 07:18:01 -0400
X-MC-Unique: iJGviaj3P2m4wRISS8wdAQ-1
X-Mimecast-MFC-AGG-ID: iJGviaj3P2m4wRISS8wdAQ_1789039080
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4859233a9a4so3705499f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789039080; x=1789643880; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZ/vaABJSYubFY5BrcerrZEm/i8qZMA36SfngBUQr7w=;
        b=kUlUPlYZpu44TPJzH+FMWNGmjk4kEJk4op7MT+n8TkRa8sRh8BjgHkdHJ3Kc8cG3f+
         sUhZ7xkCcXabzn5W0GqSCUVGoGxYqbMgUCnCqMNw/AiLmcNA/1vKpBOGGtDAaM9VkPdB
         Zp+O8IGp4WPA5kdzTbvYXxeipfcRTe51vceoP3t0rXW/A57MaKas67x4fnJ3dWkdsnS7
         knLyK0f7raKsGDJrYYJns68SAQHtcd5ITKesavY/zPY8c2ivXT2okC4lwnUyGjuN4TOl
         VqqjgynitLbZ8R2k6j8dl+qHFk9qS3O6gR65ZQknOtMu2Am8luoNnwwBPwodu1qtWmkM
         6D5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039080; x=1789643880;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZ/vaABJSYubFY5BrcerrZEm/i8qZMA36SfngBUQr7w=;
        b=NK+hnyjKZhTK4wKHHv63EDLcBqQduCdNSshWHWoQ4z1CecDfwSvmXrsCaRyvEGCJMK
         rhSHIT3MqvuH1tS+6561/z+cIMV6CVQ9EUy6NGWeneo7mfgPeyKTsmXT0RsP3U5+qISs
         br1GcdVu+OusVQtzDplDLRYVQZ8kJSUL3ZOekuWamdkrZE5Si8lhRIa/uhfuvSEKI21C
         4vuI1gVQXnd4Gjj29RpFGI02MzdK5s/lcqExeb+LWPlPSgSvw8tNqFkZggjd/WdnmcsF
         W0GSOctH27Zx9PF1h58Xge8lLRvV42UmEICMg/2YGLqWFeLy8KIrus+fh1wSYjRNOH3y
         Po0A==
X-Forwarded-Encrypted: i=1; AKwUvBwob7h4zmPth2Q2+iTNZaSBtaoKx2KRYGaprBGD8rd37E/XGU5h2fPsvWoN+Jr1YmUmNyxXDJJntgqbLaA=@vger.kernel.org
X-Gm-Message-State: AFuF++lHMNMLy4bg9RurWaKufvZ2z7RkfZHTzcYPklxZEjm+QoSyPh4d
	Ttxz95XngS7R4mDo1GQAUMP0TRk1dl098huz3Q3FT5tUhgTMfoFLAq7CpmG7CtmFxPCeg+6rHQE
	atsG8fACh63O28A+zZdoAVplv2PEycYGaBAEItby3SDXZsDM/ta4PEmvYwGG763NMHA==
X-Gm-Gg: AYBFou0/OnyPbeU/Nz+eAzlvqhkfn6rWEDK1+VBk/DyklFibheFBoBKkLBs1J5U7Yhm
	NFCe3qbXL4w1Y3oIGUwS/y70ISRejeJ6O/o7MyW6h9JENqr/zHAN4HGs8MYoBsd8w/YuVaF4QMI
	lUcfjSlxb0rlarFSVLAOwCxTgoi2qmdHryWZPW7l9KzZxh1sMcY9U5Ge7+A0wHkVxD9MWnfad+7
	0VdfnPUDHsjKXZM+rTW+ti9mJhOoLi8f3dyRDp4E2oUAwWBeOItSRp820GbRxqqFUcvn5qgEy58
	xSmsehy67c85+kS5dVVUOqXLjwBRXG9rYRHbEXwnym9csIpv66mQxw+LNP4UO1tdYuScqgYoDcR
	Qx1oP3u3oJ5Zn00bArZNlUrFOiDYu7ATix3YSgC+kieMBnvzYzBAi/FFKZw==
X-Received: by 2002:a05:6000:4911:b0:484:3310:710c with SMTP id ffacd0b85a97d-485aae0e2d0mr24817293f8f.24.1789039079827;
        Thu, 10 Sep 2026 04:17:59 -0700 (PDT)
X-Received: by 2002:a05:6000:4911:b0:484:3310:710c with SMTP id ffacd0b85a97d-485aae0e2d0mr24817200f8f.24.1789039079463;
        Thu, 10 Sep 2026 04:17:59 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm52829680f8f.30.2026.09.10.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:17:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com, holofermes@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v5 4/6] drm/ssd130x: Replace positional ssd130x_spi_id[]
 initialization with C99
In-Reply-To: <20260823111959.17029-5-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-5-amit.barzilai22@gmail.com>
Date: Thu, 10 Sep 2026 13:17:58 +0200
Message-ID: <87zexpl5i1.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

> ssd130x_spi_id[] is initialized with positional initializers, which
> easily create easy-to-miss bugs when changing the members of the target
> struct (struct spi_device_id in this example).
>
> Change this to C99 initializers to guarantee each member is initialized
> with the correct value.
>
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

