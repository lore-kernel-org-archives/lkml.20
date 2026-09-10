Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7B4825B2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048090; cv=pass; b=BsxnfnHmIH3a+h2N/4mW56UQKO5KTy73+pQsfWlTKBYJS3B/2RtA/lGePOICmv/iftpy5+Exn9FTtz8686FUGG0JRDVCjSbPnEeopaR1lEa0WQ9w+t8UpVqb4pCKor4Np+hBaKn4p8KyQ1fjQX4HmZ9oNgDrNKxnZFymgfaLwGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048090; c=relaxed/simple;
	bh=FxLs2vs/J2uylK62rLnK+7N5L66TpTnceqzDX1Jt2Z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UM8xi+LKVkl+tPLh+skQD6HKKw5VNQlcOZoygd0BeiRMOoDt7aTlmrYdMDMLmfYPwagpCme1ycA2JO+OK9UTRpDkbvBUx6DqZCdvIf9AFToL5XkZkMbMKKYa2/eSqmtgt4FC9WjQfDVzHUVqDVZqyE0eyDk96O4fU7oTjI5uUNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRB2mlx0; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRB2mlx0"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8557c3f270eso4742610b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789048088; cv=none;
        d=google.com; s=arc-20260327;
        b=NJQSqJ9+wh0BaK8z7ZbtyeWcgvZcjZzOHTQb2gU/Z8NIMZep2P2ljWuOLFDDgZvU4M
         xKq6yl9TdS0TE2ct9+soXqwAx81EDamE7kt8EHhSKUIvUJXBI+gN5lwl/9z/Xl7ckePe
         em5RKx0QAbpUBnYo9VYuYnfkYJvnkhXulz3awixFrlutrvYmGpjG9h6XIPrymIoswgR4
         SrCJLfZJQtfp8IJLIrfGK+oNlQA7cNXefp1yer9I/B383TZyhUyrc0frGFcsFKnkj0MD
         4KkbCV0Vp3GOohzj6UpqV8Jqzhhrm9caXRr0+6LGES+SsNysSDqx+ZRPTwqHsF7NwoPb
         YovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FxLs2vs/J2uylK62rLnK+7N5L66TpTnceqzDX1Jt2Z0=;
        fh=7XYHhq7SLT017uNXPimQGDY3GCwUi5YbGDX6tvXlz2s=;
        b=Fz3gWbNu66oa47mkDC0PK3pijRS3EdjntvBg3PIyGhQoC3AWfszkxmJCZiSuLW+ZtY
         WUJIqfHgVE8SGSiCcWxsyiy/xD5tNE0hpf8GtOiCjPCt3xrRwKMXRmyDnl7YKYjg69TP
         NGaid/zjzl1tb2AAyCOSWli60UGMy3RaqI+u5t2xWIi3JK+dvMdDY+zP+QHRQcjg4Pub
         ywI8akYG1b41hDUXcalrqWZ3W+VJlqx/iNOJzlDaUmAyLhemT8dP98b+k+04M3wIh5cK
         yvKNP+plhhVEmrKbCmauIkKv/PsunCRtSGZ7yJiTwbAc00LmzOifD20oc2KZCNCTQX5D
         Dkgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789048088; x=1789652888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FxLs2vs/J2uylK62rLnK+7N5L66TpTnceqzDX1Jt2Z0=;
        b=rRB2mlx0lMjhbda3ADle1Okrab0/BJMgO+TvIq9letyyruGzERKDKSc1CaDRbVKPJN
         m57pxE6+7GkLMIuzTjA118c3ktnZX5KyN37I9hLuK4U+CLOv8s6o/NxLyCQGpuxWeKin
         bomxeCgwVhhJAzfXDAeqfYd4C8kw9JWSpAfRHV2iXmy7QVGG7lCzy8Y28G08aXnWiJJI
         /OOq6SxdiWxc1FpeDbL8FIut7pwTJY61GcULqa9I6CfR3kUHYQ5JLslfnmHyh31kN57y
         evtrUbrp+J42Egaxq58lcSOZLCfWnVWB3C3EO+XaatLGh7zBQJ1urvX0KDo/TJZ0kVtP
         kCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048088; x=1789652888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxLs2vs/J2uylK62rLnK+7N5L66TpTnceqzDX1Jt2Z0=;
        b=bECkRlPsRcYEzIjemMIq8vc2jS+qNRU7ucgYKKvpDbPpIRpCZdCiO1rpniCsPfIbol
         nwW806aKDL8yS1i4Tfm4uv9HyuAzWN2ZhUBQXuJ2M77q8Hzt8WuXs97JRGP+f7j5zB91
         p0F8b1oJ6Ub4eSy5q4su+R3oej0AWJSK6ln4cDCTG0Xw7/y2qdIeNOvKBdWsU4EecLfU
         NTerz5j6Uvw4YE0vsTlC7U8/qsl2s12eHxU+JrYjCZZaRhHOTyocZLOF6OK2nttmb/I9
         0E8jtal/he0EkceJseSBPZA2csNczdRGgTynD+L2fhzL7K8ueqvRTpPmeXUic7q5+SMd
         WheQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4t19vw/4GSLt5x2UDUlEEfYNmmv/HoozHIyUEhTA/Y4EEXqEGhExnSLrRG9hnIxNsLecpPhxhIOLs7wE=@vger.kernel.org
X-Gm-Message-State: AFuF++kg88HCxjKrr0TQ9j+0rkdjb3AS1Tvldlr1QuWy9cYaf4LCjN8A
	kFP/Cd2ljX00pAZnhzKKhmYTNCNSr5RvHTygWjA7hMogG8Wb4aGSBVc4xeCZJye/tKKjfh+qLaz
	6vFIqEvC7Vus+6sz04YA2pYQTy3ss6/Q=
X-Gm-Gg: AYBFou0RqQJNpGLanMxMoBH7/cuhAbK2y6Cr1818vJtmC4KifO6GzXM/GwduH+vujYH
	8A774NxLfAMdw5QlJRS0PzRKgik5pr8XNl+Yjmxn/VBOQCFgejGoUcLWQIM8c922jqEntjBW6gQ
	6v4kmvT/eiNFPZbrJRx1s8YWQnZDIptbqxP+FZY0BZWhqqIviLMDKT1iyGR9Wi8EOdEbB12ACfR
	R+/p7X73SHt2TXBVOqB694g4JEDlIODfWTgN8ZsTngF8yP4PI+CYRPzcRH6eLBqkqrUj8woN5Lf
	5aJtgwwBkUUfKyUgGbLkyKe5Vf8kbeEG2H/EjOgGNMm+oxlFadC82vDN8a0QbMeufH6bJw032nO
	xVvZr2kr7sFPoQOax4dKhNEEN09A0N/jKR8hqmAT5+G9CMhJA7nPOGZk=
X-Received: by 2002:a05:6a00:32c4:b0:857:73e2:9107 with SMTP id
 d2e1a72fcca58-8616c8498dfmr51907934b3a.23.1789048087728; Thu, 10 Sep 2026
 06:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADvbK_dWeqUFR6XqC-BqjjwsWJpNjEeER-fJ2SVYKhUObkMm1A@mail.gmail.com>
 <20260910020748.3643902-1-scott_gzh@163.com>
In-Reply-To: <20260910020748.3643902-1-scott_gzh@163.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 10 Sep 2026 09:47:56 -0400
X-Gm-Features: AcwNN1XLYo9Tpctj6btW9Am1OvR1X4vsOSgww2ik4xoSX3FAmeg920CXO7UztCE
Message-ID: <CADvbK_dPtNmc=gaAy_u64JkV9_+nPHT-oniH=0vReKp=oJfJcg@mail.gmail.com>
Subject: Re: [PATCH] sctp: hold shkey across socket migration
To: scott_gzh@163.com
Cc: davem@davemloft.net, david.lee@trailofbits.com, 
	dominik.czarnota@trailofbits.com, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, kylebot@openai.com, linux-kernel@vger.kernel.org, 
	linux-sctp@vger.kernel.org, marcelo.leitner@gmail.com, netdev@vger.kernel.org, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:08=E2=80=AFPM <scott_gzh@163.com> wrote:
>
> Hi Xin Long,
>
> Is there any progress regarding this patch?
>

I think you need to post v2 with the tag issues addressed.

Thanks.
