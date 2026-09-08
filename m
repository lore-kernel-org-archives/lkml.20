Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F1F581236
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883513; cv=none; b=qzUL6nHunb1BdLCsdWpxR0miZtj8lh/QFPKR8m47nRPq/9tnK+0N14TMzmha99e/vWe0bkEvpim7rLQ5lK/XsQ8axOu8r4pbrecZ4C8XsSdMQXHZAAZN1/1rrZ4mvWog2sF6sHGR9PyGGez/NNaw9fzM5id4wxWmJH7A5c3KzsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883513; c=relaxed/simple;
	bh=fSR0OKhaAXzCGXCd+vmXfghPnZaUrM4xUQPA8J2O/tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lk4HWil5p713CMcEZKdM9xz5FL+6c6qkF/ZcYbTsjW50E2QEkFsC1dXSRgD2GKjGKisoxkSn0JRgJeCgUrvG4HrrmAsTnkzQ8b3QrYvC/ne5t75PDXHywBt+FvIKr5YSwUqEdmsgTgEU5nkkqSMuofFhVcyt0OQkqt2JviIQL+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwMeheS6; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwMeheS6"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so3034953a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883510; x=1789488310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hHrvMGywSx2AdPNWfAoWeJA674yVmyK7qs5cNnAxFf4=;
        b=LwMeheS65Ii/bw9/FGePjWy0hPF1cn2mr3aNuT2JIALFOsgBuOxpIwzHBJE05jQMAZ
         uPbX+JX+xjl7zjxbBN+lWMgq2Ezmk7rPlCR8yjAslXrOVtrGEy/cm2f/bWh88BTACczt
         44SDYKWvOKEorn8g2qZXUeWQgft6583Lyr93QQL0sKxHTMvQeufYTsy25457/MF6z3pB
         PXnxZV+J2jvCwKFd0mDsbpK9qftVQPuDMCR8OWOzKeqM54Pd+C3zZ25pOhVerFLIppT7
         tGuoVLgEiaB5Uh6uSm4SncE+vGqLAIxFns/GPpK5TrdSOPN+Y1YvXL4F4zeStlMaB1Ys
         8yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883510; x=1789488310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHrvMGywSx2AdPNWfAoWeJA674yVmyK7qs5cNnAxFf4=;
        b=K9+wKPI2AJdn0p64UZxaZjcx79vsnc2J4+5yQ4f/DTBar2+lL62jal8cI6ihtFbqBA
         YNLVE/d+xoP/Ikc32wOBfKJWu5lVhhi3A2YGTUhkwx8mi3LrWeEZVygLLfYUIitzuAuq
         XW5VYac3S1anVH5hUThDL7+8nsuSn3o91mFmzJrrCQ3PvVa9Tb5rG24nma2aXyslX3hF
         ZVuxICQ+xLhVL9H4vlHNcCOnGhLPHibdTVoMlR6wWyHfHRzhD7+uXF7fPi8xpy7KuGG9
         DAlV8hMDunE3q0mQxnVpU2QA4mS96XN8NptkOaYln3fCAFV8La7fAE/kTLwZDY9AnX+K
         IoPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxECeXhyY7T/Nbmyt3T0K5IPINei+whA9Y4n5+BCyPwETyO+psFH2suTfZzmojeE/0WNexQkE2Zh7Zbg0Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mplBThypNW4hid3lKZM1FY72TWwzCSYBmzNSzL0wegdnJk/LDQ
	zYYGdkmffDtFEEi9d/HKYVJDLdCDFarxsvV9N5CmPujXkLR5YqQDAnAXVAqmEA==
X-Gm-Gg: AYBFou0UUShbF9hSniLiOvtishe7IBbSR6FIpkrFV/nGIxSvEi7erkPM3yPz2xuwiK3
	rEcbs846+YZuLXPOcmossMjLo3ksK1rD44CJNlXnB3wbY3W5KnsQ4YBCmg2EuHjYzqmRZGT00k+
	N9mD23UCoBAlTRWOukBXRk1TZAmEMaLFOPoiW+O5xPbhcp7+aQnT1HcZNPwCv14Y+V0+XcDkdFx
	kfn5hBez+4OqqpaEVDKVse2T0GgGYt5g6b+0WzoYCUjBzfqGBOw0h3WTLNv+twa+oV2zef9lCMb
	2xxtJ1ewaRZkvazGi1eL0BsigkZP9CxyEKahTlQ1Vx7bSRRtRthihfe52qQVBRikucjwAfdr6fM
	CBYf9jXbCNbMmTjhObJnCoym3gIgK7CA8oi/SWahVJIWwGq+KpLzt/LGN6vm/io73s/DyUcBRgE
	8uEtW5Dd11cPoJrHp695W9rfhh3s5jFJubbiYQUmA89RvHmWgKM9/IkoS2M5ZZXq/W5p0eqVAGl
	A==
X-Received: by 2002:a17:90b:2884:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39b262ab44emr42903754a91.20.1788883510286;
        Tue, 08 Sep 2026 09:05:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm34225571a91.5.2026.09.08.09.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:05:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:05:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: sysfs-interface: Fix bracket
Message-ID: <897ec778-ed51-4698-80e4-25326d7828ad@roeck-us.net>
References: <20260903161204.735276-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903161204.735276-2-manuelebnerli@mailbox.org>

On Thu, Sep 03, 2026 at 06:12:03PM +0200, Manuel Ebner wrote:
> Add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
