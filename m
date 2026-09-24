Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9979141D641
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290069; cv=none; b=ai7XU6AwQ5y2b+XfYmUD5V3wXnejn+xiSalVW+Yd8mcrYU8T0mTpGR9PqSpNyN0cp1W6JfUFFpXTfEG1zQe2O7QV/44NtXIevJXnqYJPOBjNK4yBPaOCIA77Wh3QvqLLYlN40SrpzaTHDQbYabIAQ2IdgaKMtqSAjCOQzgb96UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290069; c=relaxed/simple;
	bh=7SCEEkuBWLZ4T8qu3VgLTnKuBPOEuVnxK68IIqaxVZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHbK5bDKUcdxI0pBtRVyDYzllEE898myhtjwJ9LKNbqGTqaPdSCYjMrn1Po+ZQRPqyaikrrrDWvS54tRy+l2v0ne/sBfgvfybG7tQHN1snoqXfm/uIx3DLA/rHYV9+HysNM23SjDloDfqFz0nPgcIjP7J5bAlv6favbCisRWQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=FQSuiEs8; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="FQSuiEs8"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93a40a9a01aso124731185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790290066; x=1790894866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9YuvIHbEaXAjwyRmrBnPzvZ0AzYrFC0d+yhFwM5Vvc=;
        b=FQSuiEs8yk20C3cgH+Uol14ljRLfcc7POmRtMmQZigymu8xU/aemuc/PLEretOlkpr
         pRJcISTV6fatfEXxbRj5EwUW2CSYIbR7U30nml9yd5Hmtyrt0gLSHctneWWoMVuTN7jt
         fkGk8QayFLortbs8rK2nrh5dD208Q/7VroKIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290066; x=1790894866;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9YuvIHbEaXAjwyRmrBnPzvZ0AzYrFC0d+yhFwM5Vvc=;
        b=MOsuCqEyrUN/kuvP0oPLmIHbzr4/ov/B0bCzte4hBATJhptRKEnd3hXndarCG8Sg2n
         oS4OLRcvOd+FH2H/zkRa7eiZOFC763lDccoYJbwYG8FI7FIrqpRd11XW9AUULMt87dA0
         0mhpEHHZmce8ihE3WO9Sf2aWnWbtLfTA0VQPhCuHkP9vDhUwAE9SIntzT6RyQxyKxsQq
         yhVHB6kVXU+7apdESnzKUm3y8DkydG3Dw1XAfEc08V+NYyIWBtizoJrRoxnqBdxCMdPL
         2jy+/hPuWn8x51DFwOEJAoNLtpO9J5ITLWlTrlKj6OSWTP8Jb7VnuRNGOszNZKvJTFzp
         ZlDw==
X-Forwarded-Encrypted: i=1; AKwUvBykt+sEqU72/ROljv3nVmbywn3fLlEkWVo4rieKi608FybDRtp7gTQKk6KNeym5c/bqtK85q99YWXrNrH4=@vger.kernel.org
X-Gm-Message-State: AFuF++mC/5YAV+lYeBGIapwvNwbXXHe4OLgQdYhZhQLyBy4iXjZ78/YR
	4qgMwOGHIWBEJ4r7IXL9fGo78riNIfukfdNqmTLAyw3zRWqbhOA16UO4RrUxTAJ/xlI=
X-Gm-Gg: AYBFou2tyImOjdHYf/r2CHXzpEhsOtGGRkKvG3zj4oYDIJuaI2znbtdVaCbZUo1+6Wk
	PzERwqWvWwrI0PJqxABlHyIPOVylSLyqAcAZVMqfoRCLPe9IUlUtliGSOmwYnk3kyVsSU1KPUMm
	pw0zssMtaYgaSq+KaKB11lHwHlL67PzXQ8BZIb79SDSjcjZtcoO3csUQqEqlNieQWSdUuAoIXI5
	Uhaqj12iPvYh5yFNnft2jGBLIoPlIsT2TGEdBeVvetpj/IgZkKIU4KMhzwj3OTMUHQQOheErUIP
	c3F7sB1OMImJ58DQyP3r2dM18FuCFtVzVNG2rcX4Dy/GyD/IaGz20CcNeH8uNtqIhjPKMktP2t6
	/UP+T9iFCOlz+VbUooO0WFWUJYh2chINk/ivTj2Tc4DI7HIz3QlEjEV8iZY6uiRTWF0ZN4C4+ws
	l0tsBfQHLZDB17Dl4lN2wC0MytneRMr7hILYtCmbti8vAOfWQQOek+WUZdK5udGG/rg2PYal54y
	Fu4m8pwxzkndSa2IBhmdwJVyedkzTcY/qJ7dgyrE4sPCthb6I0JgA==
X-Received: by 2002:a05:620a:271d:b0:939:b783:1748 with SMTP id af79cd13be357-93c43be8e87mr134440885a.7.1790290066467;
        Thu, 24 Sep 2026 15:47:46 -0700 (PDT)
Received: from com-94485 ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dd2858sm3966786d6.21.2026.09.24.15.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:47:46 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:47:42 -0700
From: Jeff Jo <jeffjo@openai.com>
To: Neal Cardwell <ncardwell@google.com>
Cc: Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	kuniyu@google.com, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an
 old ACK
Message-ID: <arWojplQqr0nRjcY@com-94485>
References: <20260921222609.50824-4-jeffjo@openai.com>
 <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>
 <arIE_i8Ysz5nOI2W@com-94485>
 <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>
 <arK0UmX8qJy3O-rS@com-94485>
 <CADVnQym70oFVCvcsGsf1PRcKX4cPK5N60uW3Masf9nNV3c+yrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADVnQym70oFVCvcsGsf1PRcKX4cPK5N60uW3Masf9nNV3c+yrA@mail.gmail.com>

> Jeff, if you could revise your tests, re-run both your tests and the
> existing packetdrill tests, ensure they pass, and then re-mail the
> patches to the list, I'd appreciate it.
> 
> Thanks,
> neal

I've resubmitted the patch with the proposed changes here
https://lore.kernel.org/netdev/20260924224456.55690-4-jeffjo@openai.com/T/#t.
Thanks for all your help!

Jeff
