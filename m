Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A4F4E3252
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010234; cv=pass; b=Ejgw4OdXkHo3X1s4s6AoISH9YXwJwrNlcUgoj9mrdEDYynKFYLLx5VfT8VXG5bhwc9xoIpXUQd3DWQd6xTf1oNASmeMNTLiB5XkcF48HItrPiFceuZAAgCmtlBPF03SkYaX5hui4xKpBtkpwRidzaOlBiwyW9C7wLF2P79Z3SPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010234; c=relaxed/simple;
	bh=Fr1ZvC7M7B70D/Guh4gyfXeRrqKCYWm0W5RzyZFxBt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OR9ftCKJ3k7SEBLgvfyOozkCBf39O7zmBqJii2+xcS5z/B51cQy0ZJK34CYkF14TFQlYMspQBMQYT46v9m+QefpQIJiz9JrXqbmhhQHFokNJ2czYXjqfyt1xZx8TpknimIfyj9Ckgg8E07eCmcbqBxDhX2FduMwjFbZ3IpqDWS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zf1penEb; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zf1penEb"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666ee9b3bso21176267b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790010231; cv=none;
        d=google.com; s=arc-20260327;
        b=c+pY1gSi5H9mw7tt0rjuuMLrNpolqU4k8DVZJfZexC6nMQzsbBxtvdSZ5SagooHL35
         2wCaXYj15NR3bx3c/bktFB0gypLxk/h4u6gmlKfwo1Sj+IjExAFDGPZfJPOVz6Y+tmrv
         dX4exiIXiU/FVDlM26fg0ajVLscQTZWgeN1/dO33UotNFZOY/2IHIUjXeWPKQGyaVd7s
         aCVeGcc2pHHZ3KKqoybveoM8ZpB4pCtfRcQqF74oiElE40AThhhQSH6ATgOM5YPuUaO/
         qGqtULpxxSe+0/PwJfbKJ0gg8VpmiOUkg3Bb2wCGGYUNFEG0qshSjq2LU6umFGOlbxmD
         IyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fr1ZvC7M7B70D/Guh4gyfXeRrqKCYWm0W5RzyZFxBt4=;
        fh=8aFQxgbLgk3wlie+ENn4psq+9/aZ2xeJHlLjJ6ldXRg=;
        b=m20RqOW9QFSpM0rx5SUFr0S+wmHEq2rbTPgXzPWoUQEpZkLVxZkPtT2G3wnWiaBQD2
         bAEgWBL+5VxjMlE09sJuPX0PQFLaM6tQjka0VzQcq8NnNLlsGm39din7jHzouY+wW3M3
         fNlfJ+Nlcf54Fs14IWEkh22B6FpmMFVLLRmbTjzMjvct6ClXgHO+h2VQNwviX2ZuNDmR
         Mp62quLgYtXI3B6oXW7ZHs6KxHpzPIV/ttZvw+5vNFKMGgpzHs2q59qKGQXAQvMxqKhB
         YrmItJHuxRoNKZS3ol/oCJRrh0VZ0/BAkmqrGgLCr+tSEUedgbMVh5UKlao4JHvTYoKb
         CLSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790010231; x=1790615031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fr1ZvC7M7B70D/Guh4gyfXeRrqKCYWm0W5RzyZFxBt4=;
        b=Zf1penEbJMWHysoHnUaIszXQqXws+faFFp3X2pyTa7bmzev9Kjl/lJ0ieGkW6CRDzE
         kE9mI1oKwhLrbpZDWyPtRNNc2amMaLXCTwVujBJ4TF2h2TkFhEKKGGB74wsQ+WFDzOHd
         TujOZ+NH9lRhY+CQ7U8NB8qvsLpn3BY6guobSCRnt1wi3/mUc3JBuR1fxEHLW5oOrZsY
         dyUzm/mfQ1mHWGQuuhf+Bl7WFVQNGsx0I4nkBA+DBBkfAXgrcT11sbe1/+a3z+jYNVQ/
         N8KsAyTwtrh60FUCzLvD1nNZ1JegikpM537yHs0QllJG5Z2S0hBU5Vgg8V6K9c1h/MCT
         dbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010231; x=1790615031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fr1ZvC7M7B70D/Guh4gyfXeRrqKCYWm0W5RzyZFxBt4=;
        b=kIw8BfH5/06ewEDQ6aCcxUIaGZPV5WlU7MNHZTUxa5C7rdRZ2K17cM9KxlD7IDkq5z
         +fHjtP+neQVS7epKnVKqgBBroGgdM67nfo3CP0m85T3fBqCvMfZVgYTXgU/B+xoTt6XP
         xN7ByUwY/+8QBhzEQBDUD9bLCNUK169jdjQLd0ttU6+lUXwmIgHUgO6j7gCOd0ZX5cZW
         YxY7ZZ/Yf4tU3g6Kf5ctJeD75iOaXI+2ID78lBcLnikDyilv5e6iXiQrs3/PRZUKIpHG
         CSQfv/TQQZOuLpRKHTOutM3+9X+B81cx23OcFRMMqjOzEHjczlxgTq3Fj6ETXnjeJEyJ
         RmbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZR9y617bLFwXSJytYCxfz2353rtpQhnEUCq8uCuVbX/+FBqVfiyxZfbY8aqHiDWxYqCNzHm6J6kCujbs=@vger.kernel.org
X-Gm-Message-State: AFuF++kXvMdoBn0iz08nvJi/JJYlpPp4ecYmtbu+iD0O9kjIxOFu39Di
	pEcCAJ5KD8D199VSrje3YtpXJMQ41IMfoGuZ9+kFC1PgsOKSG2eR2fpZdoJux+Gk0GoV89BZUR+
	ZypXIHFDEVrVXM1YPwPPDZwkqrjjcOj8=
X-Gm-Gg: AYBFou37Ixywbc969ygNvjk0cLi5w0kIfg/huNlaYwuBQOo3JQVPtgk5qzyFjh3hO31
	rw/pDMhYuGs/Wz7srDiU6UuJoX/EAHRuIhK2uHlaBuFYOkB1CllS/Tl3LC4S7uwogfhzsMSaBzY
	iXNrII3rXCYOLXCHBkvvSYtDqDar+L0qbucN6OBqc/TaxSv2HOxfmXIVX+2zSXlzWKQBcPcvGnK
	Qe9127E4/MB8Zv7ulMuPehWlgS8c/y1WnqpaxrDZAjYPRTIEDDQDsRAn5wkPvHTavXsRu1KYbh0
	EJ3VfBAUJi/1wyTnmj90tY77EkZciPIiRB8aXN8/XFWsBtqDxi7aDCaL
X-Received: by 2002:a05:690c:7:b0:88f:62ba:5121 with SMTP id
 00721157ae682-89736b3f13emr48785407b3.26.1790010230852; Mon, 21 Sep 2026
 10:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
 <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-2@gmail.com> <arFYa6WFbADfftCv@slm.duckdns.org>
In-Reply-To: <arFYa6WFbADfftCv@slm.duckdns.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Tue, 22 Sep 2026 01:03:39 +0800
X-Gm-Features: AcwNN1X3STP20vedJkuMz1Kg73-gRGHtkaX-0egPFfvOs6xthqlsoiSd4lYHEek
Message-ID: <CAFRLqsUaMS7S0AdAujF0W_45+25RN0QLMnKoOG8BOD2rR5Abig@mail.gmail.com>
Subject: Re: [PATCH 2/5] workqueue: add support for module-owned work
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Marco Elver <elver@google.com>, 
	Jukka Rissanen <jukka.rissanen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

Tejun Heo <tj@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8822=E6=97=A5=E5=91=
=A8=E4=BA=8C 00:16=E5=86=99=E9=81=93=EF=BC=9A
>
> Please provide justification on why this needs to be done this way when
> everyone else can flush delayed items before unloading.
>

Thank you for the review, and sorry for the extra noise.

I will revisit whether the 6LoWPAN unload path can use the existing workque=
ue
flush/cancellation primitives while preserving the required module lifetime=
,
rather than adding a new workqueue API.

Thanks again for your patience.

Best regards,
Cen Zhang
