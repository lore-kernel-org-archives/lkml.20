Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAFE463B89
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762065; cv=pass; b=gXFRyv3MUeJEzZTcVGblxbvsfpCAWyyiA/2t5VNkmT+JzES9NHrw/TnI0ks7uG15q7rtPUIkcSHCu1I3Mc2RFaI6ND7qcL65Ispd58dJJ1Z+aFxl2vPFbHgPqEM+GiN5vZzuqYYmE3t+FhJOVWm+5jdc8U810GJ9pphaDLNrCRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762065; c=relaxed/simple;
	bh=KG8W2VB8Y5BWld7Tj4eJg8MWZrNXZgw/t+C+8e4ulI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iorzQpR045MtEG3nCxJuEB5rk40HBb9ZhynyOLUfkbz+B0mqLGYU/0j5qBSVRFeBhLQJfzl8TZMXvToVspuSLqRiHTS2d0DqwE5q6fCdnOJtaiN1b33BNqSiHDpAsA2vE4a/W9yQvAV9x57sEurXnQkra//ZFP4q7M0nyWiXWq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2ao0fUl; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2ao0fUl"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4adb0e0fdso34104e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787762058; cv=none;
        d=google.com; s=arc-20260327;
        b=MN1eoQRKr61hItlX/czISyyY3Z2DL4VVKhV0KDcz1moNBv5JSjnsR32eUBf1HkaIj/
         rMqGqQLLAed4xZL63O6VVoEQDFLzRTbIVWuPwlMirgw352hyO5eqdCwi+5ZoiyQuZPRh
         CcICHGmKcA1XRPCwICIfkas5obXBd7u6e9XVHFzBBTGugtuLga1FR0xk+Vd9B3RuhpM6
         gFMRm1POqAXtrhMmIrKPwkMkD6rUWwNbZQeMJBe0ZWu+hFpdl7vGUtq0mZrJOlfFvXvV
         2IS3gcfbF+rL8Me4aj9nPMOGbFhNiAylbABS3QZfI8PXzsOPjJE/qexngn/j5D/VA8Vi
         mXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KG8W2VB8Y5BWld7Tj4eJg8MWZrNXZgw/t+C+8e4ulI8=;
        fh=JC/mNw8Scj2wW0mj3A/sFqGXtPIkJPu0kQJ20+Urp/k=;
        b=RrSD/Dadz4+nBS5P7Ipdn86P1+9fEVm+0wZniPG2a7bIzj7BlJ2yq0mIFd94+oWpGI
         N7bS/QQ/bjfJMaFoFdBlv31xBYMhXKXlSpEGyvp1/hq0maxMEPNRKjbkL5FEtYg54WnH
         4ii/HN+Afbq8RyRhPSqkLnAu0hgp9TcM7+iPmwGLrOQ0FPutCo4ZPMzkU4FfvryE37fB
         806pkycvQWSORzAU0F0UjgEIaTSHUkeA5AQLWX/kyOEADigZxU3y1468cI95YKjq6mTE
         iNs0ucKXPoBBWTrSFsnNvj0cmXa4OmdcR8oe0nZqODawEln73Q88rEa3/16dyke65UWj
         Q4KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787762058; x=1788366858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KG8W2VB8Y5BWld7Tj4eJg8MWZrNXZgw/t+C+8e4ulI8=;
        b=N2ao0fUlEblUNCxal32bPRYmU5H6Tiop9OuwrSH6WT/MactSHauX3tPg6hBbgpdrai
         X5uaHWC1YVaCSJJeZMvzkTwCdssFWhCqvUS5CGK6jQSrenyyuXafSH5h9b+TACqqrny3
         zXheJgUi1EmP18l9gGZ9PbC1qCpVnGUNCkNWap1wn/NpqDaCsS5NywiHfS5Etmr3Yeyb
         0JVxgvaQpKPn/oKtXIsz9nZdqpMRv9nWt8sTOyb5dG/eGFGJB/NuhHBVCDL+10cU009v
         lXpVe2O/gtL9tGf6nH/J6wLbCxx0jv13dwuzkOyf0KXawx+vb99Bfs2Gw656Zu+47lGR
         TucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762058; x=1788366858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KG8W2VB8Y5BWld7Tj4eJg8MWZrNXZgw/t+C+8e4ulI8=;
        b=FHcr8k5LSWUASqCsHipwUbbM8DOLc8jpsIyFJk9FaSGyj5paHyvrdhVxQCbnbDuahc
         8S4megu3ZrR9D3mSHGxMLospMQgdRWxPfT77iMfY2ThjVU0fWsRPBZYMjLWi5+R8FntJ
         Nr2rN+gDKgD+AfmiKO9JSBh66JKqh3XUaCHmozAXQsZl4sjMEYIJnWV6hbTx0LVo7gBq
         jEtORLtuAqO7GvHBbpehkLjp5bMsjSSCeiw0dQm7Dir/aYNaAjzdweK0LlyBDw0DkM8E
         uafR9WxxkdeTZys24Pap7DaCwt8MnMG0V3OgnFzBTb0W8AE0lFBWSbRA5phqgA8c9CGQ
         NEdA==
X-Forwarded-Encrypted: i=1; AHgh+RrTJDMU2DGRohoR7TLj5a6HANc9Iu2tz8l8pucexfIpDTUxjRK+CCdvQrt/BhVUvzk1uRHZnoH1+kiv7Gw=@vger.kernel.org
X-Gm-Message-State: AFuF++lfVQyj2b+NfGEeog3arGy+iTg6/KjQ0msOq98km30jF/8nLHYa
	VlYruCbiy2FY/gaGepK7oKmNRpw1w57fkG41lUuCrYMOGLHvpqKh5UNd5/i2YL2MPQ/oW6ko7MH
	q3Hg/nwyzkHmdakWoQDPqL6vLu50OJvI=
X-Gm-Gg: AR+sD116zHQEO8Cqk1rciPMQ6iYe8LXP1V+Q3XyeXKT/6j++himkGFQwAaycwHbVnec
	RAWxm45AUs/WLAGSqLMzyVuGw/K7X9m9ZbO78pWjE1DCm5lePtgX5HNkmyXxJ1M6H11SKOeKKdY
	pYrjCflPLcZyYRVAWxGvz24wXMKOJ9rknKNhFGioF3xf/D+hHF+teS/bkD/LKzijsuD/h2r/pZS
	38P0GBbPFsq2hjFMJvml/2A200867fJDmuURRQe2CGVMrnXVx7Lv1NpPqOjqH3muDTwR/6m+7+y
	GfUf4goHDyrfJ6cH1QsjGf4Ib4AiivrHhLVeF5o5Yh/WtdDdLBcycx0Jr+/o7M+iLD03O2CtGSJ
	Rqs8oYgcSfFK3qO5AQ6GC+f/aRK7mLnWPWIYbmr8qAhR/kc+m/Z0O9EU17ce4
X-Received: by 2002:a05:6512:3a91:b0:5ae:b2df:c11a with SMTP id
 2adb3069b0e04-5b4af75f04cmr371598e87.0.1787762057780; Wed, 26 Aug 2026
 09:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826162851.2497-1-mike@fireburn.co.uk> <20260826162851.2497-9-mike@fireburn.co.uk>
In-Reply-To: <20260826162851.2497-9-mike@fireburn.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 18:34:03 +0200
X-Gm-Features: AcwNN1WtTQ_Rpj4PyUuNofpBE-QZJpt6zOpr7AELyOTFGtFlcqIP1G90kKDxBeQ
Message-ID: <CANiq72kTzdT3_jP+A5nD1+vvSHAptRDNvxkP23YiEKwBRjy55w@mail.gmail.com>
Subject: Re: [PATCH 8/9] rust: error: expose EPROTO
To: Mike Lothian <mike@fireburn.co.uk>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mirko Adzic <adzicmirko97@gmail.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:29=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk> =
wrote:
>
> Add the named protocol-error constant so Rust protocol drivers
> can return the same specific errno as their C counterparts without
> constructing it from a raw integer.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>

This is already in mainline, please see commit b93fb6e76ec1 ("rust:
error: add remaining error codes").

Cheers,
Miguel
