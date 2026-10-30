Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325339;
	b=wGK0ZCcxc6uYiWzj6b6LfF3+lNpyzq3MxtLkRu2AncAQ3R5VpXttUygSOXcgKhEObopt
	 7YKimBUauYD9rXUnW2tHFRl99D2fBRUxEk6Qwd9Dw/M5E89aZou60V8GWZCT3bO1LM7Rz
	 OURekyQckB7t/qn3ONX6iMKpMy3P1EyBZEA3SrrtdmBSfAJa5mmFWuFgi3L9CVnWLMFuS
	 NcxNpCQHBuvixOsJ7gi/2g1M5lRxFSUJCcNdJ4W77hCKb5hb2jewjnJ+C5fBWNT1lCBkF
	 0F3or8iO671pTqR6qGNAeBD2/vz+3Ckauwm1Zjerb75sY4Y2FLJGjwc3jxTZVCWmedw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Td2Xd1tYhRh3obhb+/yK2U8VEYj+IqVYRyJ5LgiIIoc=;
	b=OfMYy6OODzAaPfXyGoP86WBSkq3Rk6KyMA6DRjiyum4+JUxFU/D8bDw+3W/yVf4vK9kJ
	 j1sYIdsu8yO1txWxPr8SlzYlTlHU2v+gfNBdUR2LbLkj5F9ebyAB4NAJ5v2ynHXXBheJC
	 XnYq9I54umu1AjJKsYBh/x7GTlwV1OVEt48l4to30qFMpy7DZQbRk710xSgj+H34weDN7
	 WbjPer6ImGKENjXRcghHex+bPgIGM/rQYW1TSEsotmViEwNRvfsLrcAYC6e8QVYhOKUTL
	 EaTI6NvTnRSn19Gh+9K5kJo8gZ6tAQ/UcocIN2RyD8OgyCudwF3WSsTShYJYxFZJzhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gimoRIzU;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72E606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A72E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gimoRIzU
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so450367eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793325338; x=1793930138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td2Xd1tYhRh3obhb+/yK2U8VEYj+IqVYRyJ5LgiIIoc=;
        b=gimoRIzUXqrXtudQIPocREKIIJ4yFyqIzbKXjFc3wftzte7ZPzk3FVopOuo8s8/vim
         N5gOHVO8AJ3xex1Uk0NxIEFRdxyzqP8P7oInr1iSv0SSPsKTX6y3v+eab8mXkxjLeZKJ
         WQwuuqs4GxjZkip133ZE2UdJoCHAak4YXnufs9lyiM6x7dnvfhBQTkdG6OSJzbHTtPRg
         uUUFSEZWphWoZl6Pw4emh5E5krBoTeaxb/+py5pdstYKtYcJCjOwVvfMs3c0Rres4rYm
         wVJqq/ZcE9O75HiZaf+xL8cqF7lXMEsi5EoGW66dMG7ot9V8kuWVDjxI5hnz0MvdS9xK
         dRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793325338; x=1793930138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td2Xd1tYhRh3obhb+/yK2U8VEYj+IqVYRyJ5LgiIIoc=;
        b=kLdEgo0MSw6IDa9Y5mYfZIXR5LlPnXfI5B5s0Klyfn3fjkiZzbRUWKFMjfi0IhAiGZ
         MZHh4EyikEsw0zwRTXCJZ5iYkrE4Am9211nD8LdVciKzaGJbNpdgwkRUNbzrCcN9wqZE
         2EngpuYf6yu35f8ywT2G8ScmCxYnTJBxxB4FjKCu+4pFsaf2x7fbcgHyDfJt8SKgOJHj
         MYc0b0RekJXos/HF0ZQGNznbeFPwnRJwJf59tHT5hZ12QbZXFxqOSAmD2l5BL0vKgR++
         G8QtHCM4v6Yib5je+x0x8YBG4kidsOzfmgrs/oHAvDnjmZ18uT4gB9JGksJmjeH1vHTc
         DRNg==
X-Forwarded-Encrypted: i=1; AKwUvBwDk79ARyLRTCwJnqIyOD51J5bNpyeDY0IqtjxTI8LfpYtE2DuRmlxBRInXY4QY6VITBgP/Xi3oV3xYch4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRRiMyFjEF/yuIR/OGvd041b9CT5eMDkPJsIkvE9v+FMF7d4Vq
	KQk498GElZeyx++YCrlKcYKX6EHN87mpzZgeFrJK4pI5tJGX/ouFdpE=
X-Gm-Gg: AYBFou08lkQ0a3/2N+/RXRj2Ar1owexzNuf6rF+14TZjzaf0PEoF7wq2jEHeQrFjNYY
	Fkg70JJvxROnW3m70m+u6Qwcd7vilelziU67GyQRr6MmL8fcmCxR/U5owN8VUlGVOmStOei87gK
	x5ITCQzi9gAxp5RUfKe7BS5SrH6s3cVyV8PV1Pht5Y5jj+as8lw+PN5wbFboWaN7jXYAT2Rg3It
	8tv7/9uJTEpOnvE7bGry1gvCYD2YvmM2mGWCsidEDMO7RQjuZnNSVOsBCVr585Tly6/di0IqSiy
	n0rJqStHIg+VRqL4fvGTbunD+411EXyUihAED1CqSfkzE8a/PMgDxVlGUt3hTYSedcEG069ABM9
	MgH2FKQeRvfI/zJfHfE5HwgaJN26Dcv6u8JBB+FfXherUWE9a2LOJgEUh/WhU7EpF+aidK6qP30
	tyyM8pZbrqfEiLrOmjGuwneYnmL4NMIX5VUfFnQZh9tjE72QidcMPvTp799QCGzuJ3/K24sOmdE
	pvTVDWiYlh5FYW343xZOZgaNkgp2TNmayFXNssRZ9/RMyySXQ113XrRK5TqdODOo4JblxSo3ziT
	Tp2qNh7i2w00QgQEKI82efxywKLWHeGmsQ6fkl6qy3w92OEWrp7owyqG+Btt6+Yqlso=
X-Received: by 2002:a05:693c:895b:20b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-36a42389038mr1533637eec.18.1793325337872;
        Thu, 29 Oct 2026 18:55:37 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.112.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm2730757eec.26.2026.10.29.18.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:55:37 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	christian.koenig@amd.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	ed@aicharmers.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	simona@ffwll.ch
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
Date: Thu, 29 Oct 2026 21:55:29 -0400
Message-ID: <20261030015529.1686-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_MsaUDm8rcxr3_0wuEAXywxziAofOO9w-dUxYS9PUoasw@mail.gmail.com>
References: <CADnq5_MsaUDm8rcxr3_0wuEAXywxziAofOO9w-dUxYS9PUoasw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> @Andre Eikmeyer I think this patch should fix your system as well.
> @Atharva Tiwari are you ok with this patch?
> 
> Thanks,
> 
> Alex

No, as i said this is not the reason, and we've already fixed it properly
You can see it here:
https://github.com/t2linux/linux-t2-patches/blob/main/7003-amdgpu-add-support-for-5K.patch
(Adds 5K support and fixes the boot issue).

And for the 16,1 issue (i assume), the only fix is
https://lore.kernel.org/all/20261024162109.307247-1-dev@deq.rocks/

The PPTables provided uclk clock speeds is wrong, thats what causes the issue,
initializing UCLK in post_init wont solve that.
