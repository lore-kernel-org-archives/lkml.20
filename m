Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A74E36CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066148; cv=pass; b=lg2Z2005yTN5nvUUTx1LscBK7x8lnsZfOJXu4Ta7SdZkzMma378PvoVIlprIBrvD26X8wk0Zg6y6jnS4cHkSD5bzusv5nUt/+PUbIFTwkcb4S4+Z+mF3d4BQqg6dpgo2sM6cD09PD3BZ1M8aQwgf3jdROwmXwaMWNov1nkl0iLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066148; c=relaxed/simple;
	bh=Tn4Bwf989zU+vfqBKp/1hHI1RbuQhdvNeZ4zj4a7kQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTA8ayBScqKt2+dF0LxDvUPymwl0bc2IxEftj/ddgDUH5lmQcm47WkJocqdRw5swWnD8VGFU+24UDRiFI10R2YxpSbEzZEovhZfOb8JaqmGNqQhXETDiK+qB+rOEK/EyN0Gq5QTNOES8JgQhzbJc6YRDg38/+I4n1vHMS85yXRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=HR9EQ6eY; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="HR9EQ6eY"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53506b44151so68144641cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792066146; cv=none;
        d=google.com; s=arc-20260327;
        b=ciC+sjJ5DElWHuRHhn5oPldeUsRgMzNG8VQoD5g4rd8QIZxBh4GT3Kk2Tz3AdHFqUi
         tKBkkIKVdMOLp4pDT6G6deMQ7FeLcfa0F7mREiD5+WWITMJeYMzLGny503p12F+2F2kS
         UhMj0sC1I5bAigeL5uVOo2S3mWVALON+5iCj30L6XHT+tC+JzeRTiksbq3sT7uETaH3Y
         ONcHLt75rerX8oCq4AHtbUv/VB3LXjTofMe4b9Sbt4D/OOsXVMQ+1mJEPDpLelnGibIG
         1IwiL34yvxkQqFnCMILItrBFdg6y5cSN9LvvB+VzI0YhU3BEVC5XG/aknWio62lhH0uS
         6DSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EuB4B7ZnWplYnhY+9ZiWZLsBoz1eFbqptmJoU4XkYXE=;
        fh=OUy6KkYFlx334KgoiVh/+ZNk84R0ubmV4juDrzFq9IY=;
        b=I1iQj/wm1SULccE9gBDTrnmyedJGpaSLFpkMkwuBYGEy0kCFvAUtlmUFcdlYXwKk9Y
         2byt6fHN9mw7VaKi/24eNd1eJY8S5gIeB/XWk4xr2J/n7Q9EAm1yt1l6hnNyZWmPWv8w
         xvrpGIouCH7tjzKfa7U4rig4OGqCY0bhJFMJUE3YL3WVWrw5z/4fmQP9Q+8U2jV5w8sm
         AbF52rgQLvubmZCNkMVh8Hbq6fs99hTaw+3H08F+LgkSjDVFXS6cEl03RQ7+kjGzrHfg
         yRKQUb2zKFf4a613DyYjKerTarQdFNbILdkpneNyKLIIhTd9D+zJ2/HbjIo3pcTu02Ze
         83Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792066146; x=1792670946; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuB4B7ZnWplYnhY+9ZiWZLsBoz1eFbqptmJoU4XkYXE=;
        b=HR9EQ6eYaIcqfwfjeVRwxz886QFNpWC4KdBYO+rfwJRCV/stF4kbDDSefzDtUTIwEt
         mFNJBgcFSeaj1UkHmUzl5Q5vDcoEy+OHMAykNXx87jyC3xCd/HuTZ46yK8jsi8dWVAkk
         mQP5Mpmh2lqQ9NTdRVA1rwBmaj7q6Y40JCK4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066146; x=1792670946;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EuB4B7ZnWplYnhY+9ZiWZLsBoz1eFbqptmJoU4XkYXE=;
        b=keFCOagIlrZArerDM67wnsDgBBOwZ02DBEtGrcYxMv2CfHGojlp3hqdQNqJ4NbWjZi
         Bf0DTG/atGfxsIEiEooYxvAGk0dezlx1DvWtd77MZCGfp+WBgsCrXiEL3JIQBFIX0RrN
         xbxrOnieACbLkhqk/KkkFNtcSf6NySSPrpyGBNN8qQUeRY+C6tFeQoYXOQEggdFsd+z6
         pEvfIKlJnEUfZbonxmft1M96pCHvRnmwBz5zkSg/ZXUsVYf8arH5CNpl7E1FmLBEaDHi
         2hiFAHwO31PoJrErH7LE4ETSznBDvs2UXrgzf9GL7wtU2p1vd7mWCSuyRICbIhwY0P4v
         dzpg==
X-Forwarded-Encrypted: i=1; AKwUvBwzlubH4/V1Wn15JhsVG8fM+sJeja/qxeiA9iJ3/zq27iDpNrP2R4Cz6pS5Z7I+2xhAihP47DYIZuTnuuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb1eIPMG1MCOqQT2DemzlU4+qL2h8cssDNJ4dX1tFcXHvI62fN
	IJFnYhoy2O8sEaSIEcf14rBGiidyhiy9QF9y8a01Erpdygs/EGfwzq1JAuHodnfJyHJgQtN7S57
	pZgbF61czyN5xaDxObwLfGukJOJGMwtzmgGLO/SbOHQ==
X-Gm-Gg: AYBFou3//KzwcwF/QSvDSe4ztgCsqXg08v2eqWiPunEayMD1hPGJyyYZiXnSzoS2M06
	OfQRUU6xHuItWqLz7LcZvT1WkjaKUFFOTFaXVTFXYIB9wg0Y45fYbk7DgeceTcdgJXG1ZOIrXh/
	/112EcmQVE9BNL0px4gpFxjgDNfdjZcFrdbhj0nViS9rFNkOg3VyM+ks7PQw6rJpkLhPKPLKkyL
	XssT8lJ9YUQq6DNKYUBKnTwlPc8O8l110ZKerD3owCs1qq6C37L0KfzZyFXNsIfhW1L2JvBrjPg
	WXoA4sgRkMmDc32JRtAdIXTcHMvwgLKOapGMd42kZO5H8OYH/vl4cCJFNme4e54yTCLEbC6OoKF
	64+amcpM794Of47sDVg==
X-Received: by 2002:a05:622a:a16:b0:535:942:4ed with SMTP id
 d75a77b69052e-5359fac5cbdmr286651061cf.21.1792066145745; Thu, 15 Oct 2026
 05:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904131838.15365-1-luis@igalia.com>
In-Reply-To: <20260904131838.15365-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 Oct 2026 14:08:53 +0200
X-Gm-Features: AclHuK82MH_mxYUUmp77R46slALlxKhYAwe10M4u0YwuKsLiUCLpMllctRlmFMI
Message-ID: <CAJfpegvdnPeyp8MYz9Y+v-nKNAj-J9N=nFyELfbB79nQJUiRQA@mail.gmail.com>
Subject: Re: [PATCH] fuse: rename fuse_direct_io() to fuse_sync_direct_io()
To: Luis Henriques <luis@igalia.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 15:17, Luis Henriques <luis@igalia.com> wrote:
>
> FUSE has two functions with very similar name: fuse_direct_io() and
> fuse_direct_IO().  Which is very confusing.  Rename one of them to remove
> the ambiguity.

Intention is good, but fuse_sync_direct_io() is not the best name,
because it's used for both sync and async direct IO.

How about fuse_do_direct_io()?

Thanks,
Miklos
