Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DFD3DD537
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512025; cv=pass; b=pUwTB1vz5FBXGP4oyRL8mbLI1pt52ufv6QapMqX09v/7i5j2EUfy2ZfEQ26hHyEx3E0SxmERRBBwv3qec6MR3NXp7KyhPJ22K/+m8ov4vZUF5+ZybFBL3DiYv8ensWJ8rJU5BhUUb2YmAmGcN1bcJSs4+MGd07qWkqMZIjdvPV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512025; c=relaxed/simple;
	bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQZbKfFGX48PoAf98TCb28o4geZo12NRs5jvIy+87I+zD2iLMkkJcVFlgkOX36fC/s+36kHXyuxHR7Wi4mOUdYQtbPAzbr5bwbOHmgyVRXJhWrWa3oYZL48+YDIVh5DA9T67lYAlw7qaIGgFJD7rE/L/ByWXnUGQHi6l02Dd0ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZJulo9j; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZJulo9j"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so736769a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788512022; cv=none;
        d=google.com; s=arc-20260327;
        b=eA3lLgU0l6ZgE+TrgIwJQ+kFSAGmjY4L7ljLhD+kvcgvEFN5MHlpE3dEzGCE7hcgZE
         m14CYSosC6YEZBcgKZhIrH/cmfPeKjtp1+HTK/DHwoXRvCHqG06UmIOpbKKiX0P64qiu
         xZKiSMqLU6a8DLLnyHnRvcoKJ0l7fSW2r42oDoy/7rnAaOHIbSjObBTZYAPMrWnOCdJq
         e37WvX5f5YFoY4GaOwptTT4aCLo6gC581mT+pBuD7Pq6c1qKa9skRxgaE6hkLldVmuVK
         NOucQyXcfCN4TiA3x0APGVkLdtAOsUm9Jgbd5e1SwWSnB2/a7gC43FYGNyVMMWmnr/f7
         e61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
        fh=gEqmoUB6xEmXzjohLAFd9HxwSgVlGqK58fVDb3V6ZRI=;
        b=D00waEvZI/V0lcGDCmWqFLYCpJgXOPM34713q50VzeybK8mMdwc+lTDH95QUR29G0q
         rEHQvzoT8+UhJK0NO/wW8LFnCczMsgLMtpayn/LQj+7zXOQsKWAqtGqnkY5Zm+GSLXfb
         ThxIdjZPLv9IszsMBvCHOgYJXeSl1rEv7EcKA36i2VOcUMfaCxQme+OZLy3CmTsGk0Cv
         WZP7kAExTS5p04B43QXgJgnrYYTsCVrplnTPu5XP+DDTASp63Iqf4z93TvtTnleasd/U
         COa9i2c+i+DdzdcdDeY4U4U70MDxHXvgYZW3u9hTgJldtdF26Bu9UX9S5I0loGaNImpg
         +xxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788512022; x=1789116822; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
        b=BZJulo9jQqiYoxnm5Zm5YU/Jfpw4cSfSc72+jWkeVqaWiGQBQLd6+5KWCMZNJzwfFn
         hwT5m3yeuLwJ/pMcOXnHNH+JpHVuBxAU4y/Cz1hUM5W/8a/APGW9NdUBSm0OPDLocIsO
         cwvYdcHZqZv23Rrqo53E06UNywpha5Fnm2+r2dNVlmTBI9kM166BMVZYlCvuTT86h57K
         ki9J/TQqJXM8EWszs/CrMs5t6ozbthcuQZRh/wtuCQbXqPkvTFLwOPKTv9TsMUnvebvG
         zS7FY2hM6bDCEUccVs0LUsIE61bgwFlwAsf1T9hf1dDD7Zfhp9OKk+oaxksUrbE1TsQv
         iZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512022; x=1789116822;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
        b=B1PjbaUnHtE+0GHBt4XPsC4iwaKdU1Y+S0UKugckcxADm4E2m3Qht2jbDxoyMU8abg
         VKoLogUMR0NtdZMM8xXl4f7GfSwpBuSc2Bpg2Y9Cmikk8ne1lLSFxy0Wcx34GRR2RsYP
         mRI0YOXiTTaYXHSAz+lOH4mR6lHOkTGE26neAsTr6PAc0SZ/VKH88iJBTAbQWkU3Mf+8
         kds6Zu6C4luQNvhOTVUREaN3sgWHXipCiq7xxr7JiVbihlZyP4hcfjz4spFE3ErxolO+
         Nl1/eBh6beovuPbfukceNCr+AAaULJPwM9ih6pNcBfohzPK2dpKL1YJXrJoROgPmhZJl
         u5Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwtv0aB2VHd9yNyjwGKQkwm6JoKhGfRpBAh9UwfoxejlrMPgW9rc5+2OiREiIdryWdw/qY92TYC79gWUUI=@vger.kernel.org
X-Gm-Message-State: AFuF++nLPb/3iME6C+yK6OfqtfpXV+DkoaspAU7BsPTcghH4ea+qa99h
	WQLMEYK0T4ivrojOyQRAoz+WJSr66gJgdE3rZjhdrmJP8aqVSxWodJmCX0H/yXGJP2k2NWPiYZs
	YS9Gnf8WGPBUlQDk/kcp7Iwtf+u/SCeo=
X-Gm-Gg: AYBFou1/iX4k+5Rb6kLQ3BdB/ey+mY4Me8h72c8WN94h62BCocRL6z5rAsrlf+DROZ5
	eiQ4MI0U3we76FqDgAL/l2j4UAshg4IVc+k6EO7mZ0G1YqABT2Q+XN31nMGxfhcqQbGjGx8Hb21
	XZKLruhTxapRHwnAdPnEGDfpzmirmsT5p38AaHos8RFuFBUXf2YMyc40/4pWVJcqQ8YCtECm4jd
	9Wq1kNtue9ds06SlifHA4l03VxUODaf5pCJeMUz8uKS0dXqiQcW+5brv4lcBmLN6GKhp8snMEuN
	HYKjA4NCt9XitALyrCSWid2O+4vXssCVvxK41GpDyg2PqgVo7sa9l07oYgquFvUUEzt50vkV35T
	z/hfyXL1T86Pjwe+JCE0H7xJzLWTOFXqinLrxP7ltDdxqTVle40p8uHTT
X-Received: by 2002:a05:6a21:487:b0:3c3:9df0:2d66 with SMTP id
 adf61e73a8af0-3da39b71849mr6947233637.6.1788512022315; Fri, 04 Sep 2026
 01:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810051907.27136-1-phucduc.bui@gmail.com> <fe85bcab-0467-4cab-97e0-8427387358cc@foss.st.com>
In-Reply-To: <fe85bcab-0467-4cab-97e0-8427387358cc@foss.st.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 4 Sep 2026 15:53:29 +0700
X-Gm-Features: AcwNN1WTqdbmh2TSlvmQXAuzUgfnu8PThlxFIUq7F0eBJ6BcdpQVRvfvYmsXbIc
Message-ID: <CAABR9nFsV2dSbw1NSeVwoEPJ9YvNCLD9-D9vin+43LrCaKqWmg@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32_rproc: Propagate errors
 from optional IRQ lookup
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnaud,

Thank you for the Acked-by tag!

> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
>
> Acked-by: Arnaud Pouliquen arnaud.pouliquen@foss.st.com
>

I noticed that the tag is missing the angle brackets around your email address.
I'll fix that and send v2 shortly.

Best regards,
Phuc
