Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF784908C2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550967; cv=pass; b=NnPoWXbHCz0YsiXXqCvBrQIDdtZHvwQ52ZYeeQtC9zga7lQOzrRVHAHcoGYImqUqp5+H0bjh0lWkxcTbD6mvLGjLbOyNJwMG/oPiGggfWuzepeDvUD5Buefo/sz7q7mZYlD6r17cy1iWnEjnNEzfjdAYV0TrYOKKZ8FqgUMPIBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550967; c=relaxed/simple;
	bh=44no+aTwDcnd4uzLysjOT/27sdbnt+n4OvN8AGUiCEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxiXEa1PDC4FowbGvI5NFSffkY+53xWsC40B8N8L1soFaxwb7sskw93FJqPHfqb76kwxq1ly8zS1qWoxAzB+lHzRw/IYGGcF43fTBriUC/wbL8/LqeayUepMlDTSlOxjF8ydAhMhR8IphyinjH46iC4uUzHor9MCVntWoJ2/eVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ooeE9GU6; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ooeE9GU6"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76ef19aso6977581cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789550958; cv=none;
        d=google.com; s=arc-20260327;
        b=pGZqgFLooDeuTcPjVI4mwfYbAJxNULbFnFm7/S4s55+mBP2fC7PEU+W2IQjYiVIe7p
         AvZnFY/v2L8RNvDAWdXWfiCVYgdJxge+anmEZY3eZkpRHYXBaJApq1ADD68c21RlODh6
         Z1lRS4EEQPSqSkO0v69QP66DJreT3oQVB+UyemMhZaRqkXv5gVqaOdG9BVKyN5xBbUk4
         ffavPO+NW+a+b93XX/5M93quLYgdPKKexQ+gtBKsRQ9OjgvoPLhukJYHwUcDOxVCLvzB
         cnbyeuFoSl5E7ZqOZKxtjzjZ4tlUHMFlKGEcdj2OMh6vk5+sNpDiHCfwV51d49vCmoGg
         7WPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=44no+aTwDcnd4uzLysjOT/27sdbnt+n4OvN8AGUiCEg=;
        fh=HYbRtiuQoEQ7ItsCK7G1txFIg9h/JYYJrRvcdFkno6U=;
        b=LUcRqJNVwh2uorLJa3wCVjo6GnZR+QZhaU0/nmMFXrZTQdPo3BhqfIQuiIaOCKk/X5
         kbmtiLlsha30T5VOVwetqsKlXBz8/+REmGFTvS3BsFPSMVvp/bttlYGzS2FFxIZu2qAE
         bcc82xWEjpoxiLeMkV8Wrqphfhgwl6fFjZohD1TBMyW06udROszMTzIL9edVJVLdDOOd
         ncGcrkFqhoGQ8l+IqPWHHt/OjYVKennde6TNgGmILFM4g2m4+ev2r/53ppEfuhgJaGWy
         gCM0Q41rLYWQLX/7jEJlL5e4mRTZ+UMWv8JV3n7k7U4uiJIvQDlUB/TyiwHfbV/TumgX
         gnVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789550958; x=1790155758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44no+aTwDcnd4uzLysjOT/27sdbnt+n4OvN8AGUiCEg=;
        b=ooeE9GU6C3I/fNb4xQYC/8uaS5odbtBTtoXI9r5SPvyKoGLwva7UUHyMPY7e/4L6BD
         y/B1jW+UiTS51GyIoQAJFhGyucz5t5D758S+3Kc93gQPWBcLH1SXn34GIBANLFaqK+Ez
         0trHGMT6xFsJAcea/y0+ttwi8R7Ryz90bF/p7g8CzsjNMiYSuK62IFeInOFtEvHTu780
         VFiJSYBZr+v0MQPBqdraBAWk/Nkpisa/MjEu9EhbkoH8GgHraPA4hVCsB5blhQdOKbf6
         Nfbg6XUtvZKyFBol9mQ1Dijy2xPpiW1W5w8ADBZDAwKr2gXGpKZ8U0tRiSgjljP0Cfoa
         cCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550958; x=1790155758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44no+aTwDcnd4uzLysjOT/27sdbnt+n4OvN8AGUiCEg=;
        b=vEy9p9CYnPSmeuHWNKbnVPqnqN2LWpFbzUyvMIkHKLJyiboGea/FLvHXG+zgGooZnN
         v26IId7p089uoIczEKBAQgzzthTIucXxyHVs9xlGGVT4wHt/kqBX9E6JYbhHOTLB3C9W
         +MSZGKxCn93yydQxs8Mg0DK2b3IYt5h/mbu56TQ4bqg0lvk5R7L6ldiL2FSGC+jc1joI
         bsWX1ivOq4yhvM13e9sagpclwAFfM8XZToi1Lx0Z72u5PjHfu361QzOo87V6ojqgTGrK
         2/+woEXol9KWabiM0JDH7CQ2v7eTvCLIw2LCwhioPUCdyGT3ilxaH+brcI8iuXECpBzZ
         TQJA==
X-Forwarded-Encrypted: i=1; AKwUvBzaxYQffoFgg5X21yMDx5JIbiC/aTSyyq27WnFKMSjIgf7X8UG+YViEFZDqhksXSOcq/kASyRK3gg1TEJg=@vger.kernel.org
X-Gm-Message-State: AFuF++k7pJ5qBCPUbZlDC967w0ZLOht811oKLJr5Cx3aATHLN+8lQqw3
	GhocOIJVrpwYh6KwIDuKYvjlnMGzQ6DdqksMHBvnLLgd5S2vVVzjy1TKqiy3vcbogFJDksSUPu0
	P5bex9/zetdlA7SpEZzDJMzpxztEOiBhxjcXtLeQ5
X-Gm-Gg: AYBFou1GJriDQI/ln5NyP0TxGdBd5uiQIgrej9V4tk1H1n344j5Fr4ei7Z5nKLeczJb
	SXEZxduLVjF1PQV33JWYaNmComHByEa2ojBxSZwMt7CliqMBpSCdzsL/JpqZBCO4lExgUAlsN8s
	aOVviYj9R22dEBt2qIajcLgXFs/Z+MO1MVIHoY3j/unfD+e9zg/HIpPrHFwG3IR4xdLxWej0IqO
	OodAJ/F41qgPLUC+LkVs0fpJ1Axe3aCoMlLfEEydynS09+E7xhHqiY5JtFuwWKhXAjsgAyquO7Q
	k3oI6RvlyqXD9FLVOKLvXhJlSwkRPMhe0PIo5OSgWllBQ7P+Y+JwOQkjHqodRwMDCpmhkqjYxy6
	roR4pLFNwA3QAN+1OB5u38eGmmAfJhw0NMQM95ljU97cLKyv9uifwebPpHvAKzMOvyv8=
X-Received: by 2002:a05:622a:14c6:b0:531:175a:c008 with SMTP id
 d75a77b69052e-5327eeea255mr29425931cf.50.1789550957317; Wed, 16 Sep 2026
 02:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916091420.138170-1-xuanqiang.luo@linux.dev>
In-Reply-To: <20260916091420.138170-1-xuanqiang.luo@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 16 Sep 2026 02:29:05 -0700
X-Gm-Features: AcwNN1X1CWoh8b9feW9tVwJMRZULvvtYZyX4fVsbh7cVt5oUeAvTT5amUc0vIVY
Message-ID: <CANn89iJFRhGBt+XB19NYKUZQbVMfC20y5W_oPHHZjOTuemKKLw@mail.gmail.com>
Subject: Re: [PATCH net-next v1] net: gro_cells: add drop reasons to gro_cells_receive()
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dong Chenchen <dongchenchen2@huawei.com>, 
	David Ahern <dsahern@kernel.org>, Xuanqiang Luo <luoxuanqiang@kylinos.cn>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:14=E2=80=AFAM Xuanqiang Luo <xuanqiang.luo@linux.=
dev> wrote:
>
> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
>
> gro_cells_receive() reports SKB_DROP_REASON_NOT_SPECIFIED when the device
> is down or the GRO cell queue length exceeds max_backlog.
>
> Pass SKB_DROP_REASON_DEV_READY and SKB_DROP_REASON_CPU_BACKLOG to
> kfree_skb_reason() for these two cases, respectively.
>
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Signed-off-by: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

Reviewed-by: Eric Dumazet <edumazet@google.com>
Thanks!
