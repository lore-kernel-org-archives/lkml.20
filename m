Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A817D3E6394
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659804; cv=none; b=EF6NX9zmf/XWcWrhdBTDmBGEirRYGHxeDS3EkyHobewxq/GaL5hYk/lFTlmT2HE+9iKrA0JNA37pgZrFLYyLd44LOF+8mvK34A1gbOJds59QLutScyxNk6+ClU8ZUpKj317eHtrL52oSEf5xYnn3ZVLMNHlhaEuKmLohUNTnK4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659804; c=relaxed/simple;
	bh=OFQ9g4YmqmcYV4IgtSRWbgsHc2tYbB9Crf6QRaEQy90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq0fPtPLm28sGKh/ymfm+jgNT0/VSY/+eFLkGFjtHpXRLQcDgvVnCsj5RypydZPt3+Baf3HqkoT/ZLO7yWtsMpz2B8gZXwnP+t6ODmBQRMgsA3ZTFC75K4JPhwnf7wLnwfBId22yKPJCP7Br2wYOdUOAEVHVb57nUtkewmN8aOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqXqzm/l; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqXqzm/l"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so1356568f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790659801; x=1791264601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BVOepdOfPEyiNSVVvqp0aGX28y7CZpdIoy1AiCbrI8=;
        b=BqXqzm/lZkusFhlRR3QChDI3QM2Knepo2ZlSXZnQFOnoMlTtVbkWZkIDKdj3OyzjHk
         Tb5HGPjfFI2NkE+4zeszqdGq21pNdjjpavfrM6HabiCqMEvzNSvJDXhIAHJki/l+aeig
         SnxrXiM70vtNBHaxOIoSIY+UVtWNBsdVnDLbDMFkvE0v31pYslMkkfIXfptEnKT431RY
         MT1RH3eWa2FiYeS8mnOQSuLVSXPIn7Buu6ULACCUXy/qTGOd5xTEcum0qSmB0QsKwwOV
         b8t6lUt9qkP16r0Z49YI+EUdzHOxczynZssX5dnNyIjfaTud8kE+m6pS5jefnFKEFDdG
         rETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790659801; x=1791264601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BVOepdOfPEyiNSVVvqp0aGX28y7CZpdIoy1AiCbrI8=;
        b=tnHOkQ7qtwgn2nIXG+pE0j1Rq/wZ1ZArJBoXgcCpPN+zyNNOSL06wNtuwEv38Z0xid
         oJy+jemCQn+EV60NYtFOgkFgNAQYt1wmiaXO2LtzR8PiuTb+V/TTNOpkei3TPeFNzfUC
         74OHhMiUkvJLFM0DAKswzZY19oS1jRleib0SDKwGAslGP+Ti3FJLjTqgBtoXbc5s9Ddt
         08if7G88ULCaJZG4vM5Btw3tVRj0JyuKUP1HF8uQpjujlADkkymsIwVMiH57nibX15ox
         sVQyW4Artaj8Qvx0tpjhx1RHBJGBd7z6psjvHIATRBardfJynY4bWZiz/szGtJvbTgS9
         rmxg==
X-Forwarded-Encrypted: i=1; AKwUvBzKKguzImQ+cxzHV1DcjYCg9nzzERMK1ns0ydDtehvBFSunXEOTdISmoYyIhktNUesfteQQSLbkKavCfEY=@vger.kernel.org
X-Gm-Message-State: AFuF++mSCaiSailD3DHA35yYGfmqQT9qfSmo/dHHMwK9DSZNYS2VVkJv
	u8op1yGQ7PVhio2dzBI8AieIWt7olA84j0Xu0Ns9WtgzFYcI0XLW6QLz
X-Gm-Gg: AYBFou3Rp/Wlf2hogQ2bn7cRqicI7uZ7OqcQk5i6q/WK6BYwELJK85wkxVpuJBEaaxP
	tMbsxUzZIE0W2kWuQrdBFeQS/7cseKBVco1S7p9f0c0xaoGFQfIGa4IsY/p2F+cLXdYyiiuoI5z
	S0uXUqKwzE2Wj3tqvMht891NRfS1pSu0Qi6aQeMco/dcetrw3ie4BsizSH9Qp/OqTK4bwkjlZyU
	7+Fp9CKEYs+CZDrjAzoO5OXxmFX4cpYoQD2zFLKImDy5COsM5TFSwgtSzKFrlkDiTqvkN69iiJL
	3c3e3AHeIvjzbWVRc70zN4/sp9VXt0Uazyk5H6Z9dllAxj5mCIQoR4J7IRN5m4sYnJJ39zE/NWo
	9EXo6GhipXnv/LEhdMIcnjOY09BRT5/wxaceR5+1BZh/SiaILLUg/DUWEihPfQuGERwnW0xKORm
	4oI837DB5UmTDybTzJgyY0corlnbbcD1+WrwW8LeTMvxtB1RDvgaGPeMIiSpKs217dewgUTXsRi
	FQ8UQ==
X-Received: by 2002:a05:600c:3548:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a00d76700emr18743925e9.5.1790659800613;
        Mon, 28 Sep 2026 22:30:00 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm47614325e9.15.2026.09.28.22.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:29:59 -0700 (PDT)
Date: Tue, 29 Sep 2026 08:29:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <artM1Kqi41JfNSGg@stanley.mountain>
References: <aq0siVcghDe6x9cs@stanley.mountain>
 <20260928203105.GJ4406@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928203105.GJ4406@killaraus.ideasonboard.com>

On Mon, Sep 28, 2026 at 11:31:05PM +0300, Laurent Pinchart wrote:
> On Fri, Sep 18, 2026 at 03:20:25PM +0300, Dan Carpenter wrote:
> > The "idx" value is a user controlled u32 so we have to bounds check it
> > before calling test_bit() to avoid reading beyond the end of the bitmap.
> > 
> > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> What's the status of this patch ? The issue is a false positive, do you
> still think there's value in this redundant test ?
> 

No, it's a false positive.

With how Smatch works, I don't have an easy way to silence it in Smatch,
but I'm going to publish my AI skills file for reviewing static checker
warnings.  Also I've started writing a new tool to help filter false
positives.

regards,
dan carpenter

