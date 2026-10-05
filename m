Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F0282F29
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791176291; cv=pass; b=TLbsqRLNlgObuRJSYAnNy3i8QlJtwHZgJqEa0QuXmatRT6QqnrQ3bohSTjDTf7mWc7z8w/4iRSOdCqTFS043SWjoMRksySpUAHrg87okDV0F4lv6gZeIUf3QXeem1za6u/l1ZE0s4gXj6WO6CjPRSPWPeOIjiOrvIi5aVV7OSPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791176291; c=relaxed/simple;
	bh=k8QhU0CgxteoVSnG2ChBJ+4Z+ni9b7jo7/wYqwD+m1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tu4bWHXq2YhHoGNyeUu1WCK2zZKYmyilz6JtscY8Lp5N2uAYZuXww39BPd4JRWAtZPb/QjTG4Ibxv9dU01JiMTrADZL2A10JH7XwfXmrdafP82KdrzF+E09yQmb3xUoYolslZRRi8qNmu7vjK7rTT1xlQDMMgjp4eYSgaai3jrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=HfmeeVb+; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="HfmeeVb+"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2df40380aeso7229866b.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791176288; cv=none;
        d=google.com; s=arc-20260327;
        b=j26HGcCh9MnmL7sItYJq+1Wn9XAstFvvlcu6/zs5NuzZmAQW0+Vsr0NsJsz0OYw1jE
         9SfVzSMUE1NRPOIXi91GGnbIELt5VVFzZvTQi4/0FSRuMplAbvJ5P8h045xF4EuHX6zU
         8wmW5wGiPlIiMNRPbv/UPpZRl2BM/w8mPiZRrXBZA9vnhdTlFRvo0dT8T2ooEM1rqRuv
         SkTMQ0N9poRoKJuyKx5xXfKfe1cydzbcRjQHjx0Z+XyS4EPWYpUPUU3+feIWtYG+mVM3
         POzhvggQKpIUuq6v0ZnyTSe3I5sD63LDze3vn7CzIGUGk0eEWNaIg16/xgzP0nrHtltP
         WLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yb8J5ooNOneYN3yeLjRDUS+cu9SC1W2gX1QlAxi98Ro=;
        fh=fXhaiEU+eFjFD2nE3o0TKqK03VPxKDUX/eT1Qy0S2Hc=;
        b=AJYt4m/C2jCoWXK2ccQQAwGjvb5aGoDcDOselUG5z6xISjSZCMYSuV+cPq5YdRs2vF
         +Q8NzmMpO5JBMIKGcXDbRspf6zSZOzszoTd0J1E/j2sjSDmOpMOyId9m0OVNEGxWpEMd
         7DYMkmTOo9ujj+wFu3dsPrai5YfJDfZ+oZr1w/ST+bn6JDufQnRfM0SypV4SNiY8EQhR
         IyZXZ+LL7TeibgHJK0CGqAFlAGMHc9gdj9HCiyQuRqnw8DA6Q+8pxzrsLGWuMq6p9k0N
         L6JW2+9XRqqh32Cnx1GFBVEscuqSlvWhaH9q1hh+p2vDSPsN19IEKIiC7FdAhXp6kWWl
         xldA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1791176288; x=1791781088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yb8J5ooNOneYN3yeLjRDUS+cu9SC1W2gX1QlAxi98Ro=;
        b=HfmeeVb+gRHEJT/vobjNzTnfPqgXprm0Qg0J9QuoBDR3Pi0XGT/ff1ZcQT4pe8Zj5B
         sl54pjARAZMooXepwOU1gNjFAKfyWrjZJEas2k7GVxK7jU2j7/4pNrQZ+xaGPrFLqtyP
         baMKr+RNwdZh460yQGNKRO07zOXWptDnUrnexNLl/bwbCpRV0hxuSqWm8JxfWf03rc1s
         XlZLIcRzK0sOuSoW/af7v2R1umZymuw3VD47gA66weSVmsU0Du+huHY9yRX5YMVSoMHc
         a1BxfGWzvgZ0BwNs4W5kZ9ia4giqqMx+lSO255WRvAA6K495WJiRjTQtzVce8LedRL2f
         M9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791176288; x=1791781088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yb8J5ooNOneYN3yeLjRDUS+cu9SC1W2gX1QlAxi98Ro=;
        b=GPVYrfMxaua/llzk5UNiawI8jW8/8vUddZoG2yXYQ2aAWFRXEbDaTw0g5ro7pW4Pex
         IvUJbq2uUlElZmTq3U3LDjV7CmMMlCr4+WZneFtwv0ZvRxQGGBFA+G9jJO6TqTu3rhlJ
         KPdHUuuOH7g03e36inZ3dmx5a98r/+7Bk+eIikAePOqwq14b2xXJuKeF7REmRauHF5z8
         1FPfQU/1lxSFufHXHHRn8Msz22FjQ7rB5AY13lY9buMXLJoOpqkYHS8AXuFNMAQ+fl2w
         vszavbC843J3lDC+jDt7gM2AQAf+uc335DpxB9Rc5GietD0ejt7JcO9I7iZCVbNO+9pR
         N0oQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9fZhVIFrKf0sLf2gCVyPaDJKK90wTkB/Y8Cxz42LSW/NFjsvf0oZeuUM1O6ZJbp88yyZ29qFlgIyha+0=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ1n4uaHtKkZrKvKidwPHjYUrGNKxUJNqdmk4HqQihD8RBJU5O
	cmFrfLhmuJTcBVcB/dUS2vR5NS2DFyfv7W3SqMnUwrQa3GltfkaRIl3E6XFcxw0G7ly6acJc8Xt
	3G3Q3/qr6njqBrEDyCOt6GdE3cX4wfmgor/QSOT7Frg==
X-Gm-Gg: AYBFou2KFevhdkXyo+V1cdGKbk9pYkiuLUyl2uZXcOprtPkLGCcgsp0vWl1Sb3MmAKj
	SbjnCleqTLhbrQLGEbdPtbqeXVOQDEDH+TJePzMaEhW71K4SBxbOM1WXEBI4suSqkp1H2kdySHT
	4SDxQ73gK3Eff6LuWPLxkOjOANLM3LXro9BlBhk/7B3UNo91m3rmGLIcqhVKm1PbbqdJzXkit9L
	wYk0D97rah77P5mHq42fHly2+moiJ4KFp2p1fZxluYkhy9LGN6mV4KRjKPJOnHXacV7gMdoM0aT
	ctoewb0e71ghmbYfYk1GwENPA1+2/1OWmdItfVCw5AsIeUEh5IuDqSU=
X-Received: by 2002:a17:907:1ca4:b0:c25:3ec4:9e43 with SMTP id
 a640c23a62f3a-c2e4a7f48b0mr805405466b.0.1791176287731; Sun, 04 Oct 2026
 21:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920103705.23191-1-jinpu.wang@ionos.com>
In-Reply-To: <20260920103705.23191-1-jinpu.wang@ionos.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Mon, 5 Oct 2026 06:57:55 +0200
X-Gm-Features: AclHuK9F6bDW0nS2vy3QRjl6tjhB0B-9YTim3Rc-1xgPDX9Z9hWewK_66u3Qn2w
Message-ID: <CAMGffE=Vz19wLqdECCc3G47oZVRkQ=RuYFzZt8A1m7jxHUeV7A@mail.gmail.com>
Subject: Re: [PATCH] md: fix mddev_unlock() called without holding lock in lbs_store()
To: Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>, 
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 12:37=E2=80=AFPM Jack Wang <jinpu.wang@ionos.com> w=
rote:
>
> From: Jack Wang <jinpu.wang@cloud.ionos.com>
>
> lbs_store() jumped to the unlock label on mddev_lock() failure,
> calling mddev_unlock() on a mutex that was never acquired. Return
> directly instead.
>
> Fixes: 62ed1b582246 ("md: allow configuring logical block size")
> Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>

ping?
> ---
>  drivers/md/md.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 680b34a63cb3..41fbe5d9961a 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -6048,11 +6048,10 @@ lbs_store(struct mddev *mddev, const char *buf, s=
ize_t len)
>
>         err =3D mddev_lock(mddev);
>         if (err)
> -               goto unlock;
> +               return err;
>
>         err =3D mddev_set_logical_block_size(mddev, lbs);
>
> -unlock:
>         mddev_unlock(mddev);
>         return err ?: len;
>  }
> --
> 2.43.0
>
