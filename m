Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201264AAC5D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157473; cv=pass; b=tsjrm+iC2yJaYzAQObUCCiMGg32Mes4IWE4n538CgyItPeshKCwGX8U0h7PkKHBhTaWEQu8f8BkdFrBkNLnuSqquoHYUniTHipKnZrCiSjYrJ8BhVKPpIkqNYkC0+IbqxSE3hsz1f81Gx3s/zhqUAeZyl5CJTsl5qgpiUvXTosQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157473; c=relaxed/simple;
	bh=7vSGrATw8OiP1xs9dIzVyOW/1pb8qSe4yANpRII4cbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvsINYPLmh83wTL97LkjiILHgr0ASKiOUOrrSZrcQyMUntKkNCCjsApPc3jmy0sIBAAzoN5Rcf8RvlEOWuqb+xBNjtjbo0l9CmvszUFlOBepL3DjBbYeB5+OuxR8UgOYqJLNJ9gi8EpUxy+he2RXLIVgKbq4fgg9DMM/kGkQNBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmhiU3iT; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmhiU3iT"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a772ec8389so50149051fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792157470; cv=none;
        d=google.com; s=arc-20260327;
        b=ABGXikAX/wufg1419ATNiRYfDj75BrU5ZErGaj/lcVnOAYfGiZPkIeQgbNJ/f3wYD1
         exDJUSgZfT6/aPXnxcKmVkKeCBVRFvlyvXWObk6YAI28227fQwarvIIOavoBClHMVfF8
         UHLE9cU/xUaVbrGrmYOPbyR/HZIakPrNlmxmqccrOmB/dqwW8BNwYWGiQb9rW6MH+qXr
         SOLJMnmGy1FGt2nfpZqLHuteKTRnPx7WKDwQt7fZxvCyzv0vvkkj5SbJP5OD34AiUsIf
         FJLSjN0jbIcWmsvUJEYyZpVTYbNFySfv5B1moS/sV/iERUjl1cmMI1v7kjltXqVT8ha3
         PdvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7vSGrATw8OiP1xs9dIzVyOW/1pb8qSe4yANpRII4cbI=;
        fh=mTdCgJsA8cwNQOIbwnertlhFVkG0hz7i3/WwTgjGMf0=;
        b=EhtSicL04X5PiMbKxq4O2fwgVYmhLANxQMU21GdeVFLVx6oeiYOPqXOUklxpDnYooC
         EvfssadZMI7gPUnU5RklDjCNW1Uw9Ef2+mYlk2RY60UxKHZVw8Ignw8lDdsNnnQId1ZQ
         0GBbRPxo4ZH1P3CY++0HewvYYXbJAvBrKjQ7xfGuv1iCwmjHudPU5s5gOYl152fGzvYU
         pXR2geA6lJNxJLIRWSuukrUOhbBaqN3/V/Tmwi5I3Z+Assg9V6PhrlEzFlx/92Gq5A25
         2Oxy4QnGl4XjJZnTvCYb7GH6qs4l4sOWPE6kBPvZDjc4aLckK5RTTR3fIMiFULSSXaAk
         76Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157470; x=1792762270; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vSGrATw8OiP1xs9dIzVyOW/1pb8qSe4yANpRII4cbI=;
        b=SmhiU3iTtEO8oyTs+3mydLekqmQlUF+n7S2VcttqUDTu2PUoXpIcte1+33rzh42U3r
         Uyv2lyBGZUykP1y4Y8QsAJsw4Ral8iry48n/mWYmufIaB1qiAtnbAGSxVGHuquabPeBt
         yBNUoIxF8ole1DpUbKwZZ+KFvu8ghBvAaCFdjzMU4UPrzYOPjAtZmlrYk2ggoJGRs0bd
         TfcKDOwF2KLjMX+OUWFksev66U5nLJ0rkrZCOPLSItAfmYBf290g8WwM+oppNlWKvxLN
         adbJ4ojUCxF2JnvXrZtkrkBDebZ3qbE8GKp6bPzRFSXNEfV29U4ubsio7rMrQBg8od2o
         nItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157470; x=1792762270;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7vSGrATw8OiP1xs9dIzVyOW/1pb8qSe4yANpRII4cbI=;
        b=wLDh+O+RN2+TwIXGfwpxAA07ZGx1APCcW1sjmRBXDV68WhG/19EEaTyWcSV3VDlITN
         1eOzwtQLo9zZ36+dP+dZ/EdUy+jokgi9WZcrMaDluEIJ1p6N3YUJGysVfXBLLrDo0o4G
         mwjbKYioKRGw0iR69Ow/dtJWV6DDk57puX6z7OJga0TUagMkTDDXraXSZJuU9e0IJmVx
         TT9Bj3ACaPk78OHy4t6yvFD3C3DDzT7nKR1dYfFhXSEifpQ5nT5qWPwNEI5IgwBNn1i0
         hcB5HQA/+URhWYcUelRNPbAj7lvZf2/D/bvaIMa+M8qvWopvnO70TkSyyQDcgV5wwYhW
         aP6A==
X-Forwarded-Encrypted: i=1; AKwUvBwO2ZjVq7Ovay5l5/mF95shFGLVa9NnieXHmt5eqvMAgTLIVhYha+Ip6KKYwTjvG0FlQ/r0J72zJBFvbic=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmLkzYZVLmcJ8fXzXE55VPGBxDi+CJtkj0YPm79FU3miYshBPo
	KXQmj+H3f6kIYpSWDbhR20WT0TQJwUmomxSnNNDLCCTpw0OdE19kLti0lBFowKRqCAk97M4UIGT
	mTh3uuWU9m7GFQkXhAvOWscn+Hcr6thk=
X-Gm-Gg: AYBFou1HGvsk2B+3QKhaj6zP6yUtcdhVplveMdmz1WudDTXNfAq/vbdPJgxF7i9t9fX
	v92O6oITFws+HWdpGS3niEGmVCEjGbQh75/LtGCGIQdYIa1nZJGmpEgGJ0yRujcXC4UteBg3fBc
	j+rRP+8q2Qxn2PDsGD0TrC5Iv56CCcOkmQ8BgVskxM5hv7vQlGArzqXq+j85NyVosUDzgZxbnw8
	f+B5e/QRJHBlMlDXA82+HHFq5kaNrw5KCLB6QMXF0zqTF0LCQ/4WMKla9e48K0YSiQUS/dG77/6
	cy0bu8KNO3DDJYtBlGDCm+NzOeAN6tVhyEvM+TZJy9kuqM572xf1pxI=
X-Received: by 2002:a05:651c:a10f:10b0:3a9:849c:b169 with SMTP id
 38308e7fff4ca-3a9c55cd2d5mr35171861fa.26.1792157469757; Fri, 16 Oct 2026
 06:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016045849.813696-6-oss.patchbox@gmail.com> <1ce84c99-7f55-a146-7333-4ad791434097@hisilicon.com>
In-Reply-To: <1ce84c99-7f55-a146-7333-4ad791434097@hisilicon.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Fri, 16 Oct 2026 09:30:58 -0400
X-Gm-Features: AclHuK92JpH6uH1vJ--axFEUId5jRlivHf0QixSYU0dCBZsoLZYYe7ajIOxpcAc
Message-ID: <CAGG=RgDgreAd+dSc=XwkuduLJZfJuR1AJr9pXSd35aQoLQdQTg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/4] net/mlx5: Don't free CQs whose destroy failed
To: Junxian Huang <huangjunxian6@hisilicon.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
	Mark Bloch <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ariel Levkovich <lariel@nvidia.com>, 
	Jianbo Liu <jianbol@nvidia.com>, Alex Vesker <valex@nvidia.com>, 
	Yevgeny Kliteynik <kliteyn@nvidia.com>, Itamar Gozlan <igozlan@nvidia.com>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 02:59, Junxian Huang <huangjunxian6@hisilicon.com> wrote:
>
> Are the buffer and object freed somewhere else later? Or are they
> leaked forever?

They are leaked; nothing frees them later. This only happens when the
firmware is alive but rejects DESTROY_CQ. A device in internal error
still frees everything as before.

Freeing them later would mean tracking them until the device is torn
down, which seemed like too much for this failure case. I can look into
reclaiming them if you think it is worth it.

Thanks,
Yuho
