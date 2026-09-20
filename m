Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F383B7B7F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789937710; cv=pass; b=BvjGQrQ7gjwYKMK2UVAXR3i8HNI2nFiT7vdrC5vaavCgKPK+jjKzlTa3wemBIVsapkFfkZNOZK3NnEyGN4dENIm036NprbFtgkOhPMTHaCC56IToDZpL+eKlbF8/6JS2XQISKCcGtxzgRVXMSZG57PGeJG45gpKqQqqKy5i2Gf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789937710; c=relaxed/simple;
	bh=2QAlJCHFO+aQprduHJPjOcvOedppk4oBX0krsjqwCpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bK2zDwqaKlFt41cZTYOkssMOzv89dsLy29CdTM8qxFOEAzc/ZbkqoOGrkbrb8p4ejiqa9migxUK5aT68j0r9vnKekt9c5ap6fUjF/O6luJojF0I59dpvxzS4QcFM1aQSGMaQc+GPgN4ggy+Yq0yZHvFAdmvk4+lfwspIA//7paQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkJLWtiz; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkJLWtiz"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39e57ee1cb0so219943a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789937709; cv=none;
        d=google.com; s=arc-20260327;
        b=DVAExFYnhv2qOTCFYfice2CI69gBwV6yzyrl7p9lD48W4I2CntRmjw+5tEpfWMW13G
         hJMdi2Yi4lmlDOtz7UWwkke1+vxr+10mx+aEu1s68lCRH/tdUh0fxekndrJ5q30uPzvc
         wWUAFDQ+RPySE6qOVrSEwXa/cIDZMKP7VHQ+yMVz5ut5yTDlls4WfArB/I8/J4cf0ID6
         LGrAW6lx4xbZVgrYxUK3quh+5cFNh/2OP2ouw3BiuX/jwEYvKKi6w+ErdTkBR0jvnJOk
         XJfhRyC2+5zS0pOhP1h37tFl9RY2+6BeyjHECYuQcw1gNA9MF1KfWRdsxbloP3VikY7d
         iIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2QAlJCHFO+aQprduHJPjOcvOedppk4oBX0krsjqwCpU=;
        fh=GzR2Elr1XyOlak0ird3csK4cX9/nJd4b34zls1X2CiY=;
        b=nITevenT4zWAFd8QVM3AwgPg63fkoEZuPrjpfbBEOsc1cN6gcZ3uIAs/3dC7FwSVfu
         2KVQz1WqYR3TwflGpZXcI3eXk5Ja54/FlEpTRzpv9A+yD5KGu9gWGe7sKVRRHQXg5Wdg
         24wMFwq/r8Xe2xg9U6JG2WDcSrrPFiT7hFJ53IHWIf6VDzRC3RAWq2ahFbZSvuHrTpSY
         I6zMBZmoww2buL6oAu7C94b225zCqkVpCCoGALgLJyMgIsNlJ0e4l1RpaHNuR1D5BfnK
         jWCrhBD1tlhmgifGWUfV9j7xhZ8oow/gTQH8CR+koLA8xfYQsXC2dM/Gd+hlCY5+SpEy
         NcLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789937709; x=1790542509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QAlJCHFO+aQprduHJPjOcvOedppk4oBX0krsjqwCpU=;
        b=KkJLWtiz6iymvuJ08v7i77GsglqkO8yC5Vd352W9us5ioHRdzLD4+L8ueVgHJy9myU
         aYi6LtQs+/hcEehTyxUylma2POVuvKkx/HsIz2ku/UaxC3WM12IdCZOq4Hu/2eqg4mF5
         HBzMhi9ixmbVAK4Jdywkj8KulMSBn72LJttbFxUZMEfCpSZHxqyfiXObNjT702VtZZYa
         pu5lyDjYhBz2ukIwlsLZmsdBElzNJZ0lkwVww6jyEMZR4T7XdDY2Q13wC+v4XDFenrmZ
         Iz1nPEcRKVlFHm7BOS7yceZ8dOtaRE0L5vDwmOHappEtJTZ7iBDYDjiLjxMTS2hWg+2R
         SXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789937709; x=1790542509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QAlJCHFO+aQprduHJPjOcvOedppk4oBX0krsjqwCpU=;
        b=YIh5f/VjWJ9pxMwXKJbgTa64OkGkHISvKlvLNLBybOOsNaN/sOtKZqBnpIyyfOpMZF
         tqPzXMnbo6Xs9SwGkijQFguNQwqprJWbxwTufhQhnHNyubNW3BMCj/gtPlTGW/ZBQOrl
         2me0rVK6kniiHuEiqX4cttj6JAP9LFKZSuYt1Dx774Muz548aYoE3EG/3aQCoUoEUMc/
         8m3Rgd6VAz7W4yq0O+oZAnz33zQfyuBqLyDANFYlE2Y744LVx8iQ7CDckehzlE1cl3DU
         i6lEEmv4xHycdlwOIk+X+4ErUdJyby9snqvo5OfvJ629pYDYAtYeZvl92vR7fTq13eSA
         EZow==
X-Forwarded-Encrypted: i=1; AKwUvBwbGTmPQiV/A2kwNvOQfWzgCWY6WZUjTXXupGQN8umCVIwJZ9mAQdH1JGkl//pCSmJRLvDGvGYsxi8LR/4=@vger.kernel.org
X-Gm-Message-State: AFuF++lXhXVxH5G+z2JBN/+MwoPeG/sAKjytHQCuZC7jcP8ROqmRvIYA
	LSlOAPZRL4wBUrcZRTlDwiYwcBnDFSWHwvrIeJitrF4Uze8nQ3ETlW6LLKJjGcmYH5wMNAs0544
	APutkflk4CwL2HiLe9/1y7HeX1RFJPVs=
X-Gm-Gg: AYBFou2l2umw0LH2Lr6FC1+rSaNGNfnfufqjLaLvB0cKCNMKKQAt86ylHBI+jzjvfwr
	95IyNtDbUmaFZIbC5jmIzjdm/ld0U60nY+6jC9N72Tl7oiYAXxkVkGVAy8lYR1H8xQ5C0tDrOkG
	MK4zJEpWe9A3EbFlhqwjU+fV1XQhCQIlZdUD+O15nNiBbrbJZz6MSbrmDQbVHX9Vr0BQ4LKX4Rx
	tTWNoc7hNlS84vY0tnOuLbq05NsY4hEHg9oBtiBbjN8+FhGcLLHj6tYNFMTl98xNNTI++w0YthC
	mJETv34a9oa4XAVrlX7FPIOH573XP//McaF4/pC7R7T+DUGszFpCGt/8fARRoQBaozekzQfTbE1
	p3tX4eKTcY4imHZsA1Z4C2VHTdgd/+s4UvCtSOeArQBacw4EXnguujE+bJ595QoQnJLiKSLFQgN
	E0jP78HZE+KqMSCTGbd2N4DMdlQbHgnvpoeCW9EjMz69qElsjVewM=
X-Received: by 2002:a17:90b:58f0:b0:39e:261:4e13 with SMTP id
 98e67ed59e1d1-39e54f42eefmr18446151a91.3.1789937709019; Sun, 20 Sep 2026
 13:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com> <20260917041453.1029362-1-springbreeze@stu.pku.edu.cn>
In-Reply-To: <20260917041453.1029362-1-springbreeze@stu.pku.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Sep 2026 21:54:52 +0100
X-Gm-Features: AcwNN1WwUg6oLlLYr5RfTxBEgK72uNFH4WeptZmKGXejtsxmU-NlN2AjQDSh7lE
Message-ID: <CANiq72ko6sGmmUhN4bSfmmmnDjo966_D6ro8y=EGhAw11ZVCzQ@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
To: Chunfeng Song <springbreeze@stu.pku.edu.cn>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	wang lian <lianux.mm@gmail.com>, Chris Mason <clm@meta.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 6:15=E2=80=AFAM Chunfeng Song
<springbreeze@stu.pku.edu.cn> wrote:
>
> Since the fix already has three Reviewed-by tags, I assume it just fell
> through the cracks. Would a resend help? I am happy to send one -- I just=
 did
> not want to post a duplicate of your patch without checking with you firs=
t.

I am happy to pick it up as well.

Cheers,
Miguel
