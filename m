Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9359F31326A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122499; cv=pass; b=cx3GBy/MBkJT90bxJ4AcVUkt9R2JsGhtT8V/lpsiuTiHMhfTtgWBckmvduQComwhEkSsInp4cBqFACpiFUh/JU925U1jNMdSd3gaN9ovKo3A6uzFISVEE49jwvLVl42a72kY10CWFLTQ8fwnCY5pe5YZHjohlLvUp7Orv6Q1w8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122499; c=relaxed/simple;
	bh=WDhfqi9KVGdv84+1ic9hTc/O7+GDjdOl7MkC6oMvKIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlzVOTGFloYgJgkrtApsDLDiMOFmxUe1eGClNRqj4rUBXL4efYzlTR7FLHVAxfSYb6ocGtLmFlufmdRU+NNxuu9zBLEtDqpCa1D7wqEGrGhAq9/c+tfJ5W4KU54AxyIZm5tNnJst5sIFmPFu7iBRXAhArNNeYVOs/XFo5o6XQNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MFUnJYMq; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MFUnJYMq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so3558a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792122496; cv=none;
        d=google.com; s=arc-20260327;
        b=k97imCbASp//+ylNNsS3gt1LQVcANu1DIO91zvi4PizWVtFVdlsDE6iGYUHwwittd+
         HiVoUrCoHzikncyAR9bpPJwZbaW23lMyYE08nFwhagWIjKK0s0KOWcfiyaenajBFjyPm
         vjsz6AtCPsvULC7K/94BA7dRmalAuzfsmldi/4n5fGZZ+cgW3i1ibSCMe9JewhIVPanT
         cD8LqRWddcCRZZktlByHaWko8J+fAj2RaFJRFLNppYnBwk26u99LnHgTGoG1u5PnsJR/
         O2ulaLYOPRdA97LYoU/w1QvZiUPrvObWRPTj/LM8gQTW4/S0gYpLd+oYlKt+RpzUa0t+
         Ywgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cHwmVcL3Ea2QJiHo6JwLvdH2j4OcK78NhenhdrCZCWk=;
        fh=5liBUrvpGf3Kg/HTLvBsXSRdxfs+ziOiF/00q2UO2h0=;
        b=Idp3a5PuxYcqlwpksE+8rn3b2Dj7h3oNrDUe+vKkFmwI/TINjVeR1k46MvHf9ftViT
         vFdMMR0704Mb7q9RHuSKapvh1W/Twfyyqa3wej8USvoF2LmPs2sqxEGcEzuPWX2YqWst
         Q+0M5q8TfTc978b0f6FANUudSF35JY5gEsU4fNGZC3hnupi41HMoyXoMRO26UMYMVV+h
         QghszJqq/OAMTp6bIH+HNEZmoPwgmuup52F20XXcudltIZ4U6KotGI6xRv03eqk+mrgI
         wKnUx90iiVIvEuNwD11UOQYhZkKL8/OmKcw3ie9DUe/N3JPpWvzbq+W+ivEPY+7349tw
         zFwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792122496; x=1792727296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHwmVcL3Ea2QJiHo6JwLvdH2j4OcK78NhenhdrCZCWk=;
        b=MFUnJYMqeRN8pn5oS/fx7Cd7aYGZTuAmL2OPtbvk0h3AtusqHufhUy/9R6we1FzGNn
         bBiaEt0IoROvODwpQgTngVSOBgbPr3GOWyKRzCSfikrMcdUKGd0EziFzmIUG00VCAETh
         GcF95UW2KmEWCHa4jPsDafHok/nbbXBUu5l4cFYA73wuuyQl1nvwkiiyQqZngE4O17V9
         ZTY095u1puHUkVdeCxOdqk+UQTLkUeao3SXccnbw6t2YW6/4qw8Yyc5EHtrT4/gFylU1
         9QHOTqyYD5w+XTG1uqls1Fi7QAXNy3HD7iLDB9Nqi0L0HcPN7mWIcD2UnifQm39korJ+
         dJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122496; x=1792727296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHwmVcL3Ea2QJiHo6JwLvdH2j4OcK78NhenhdrCZCWk=;
        b=wUKerOI0AlluqtBRsqQiHrr1tifuRItH2pVrCk/EYptzoBOki1GOomv6RvQAM38BSY
         aO75nW3RZKrFtBp5iRzplxx+0hGXW9biNUxDtyAZn4/DKkbka8L3sN4jZVEqQTy4QVdj
         PyQ7k8iz86k4tUk26Fkimc4l+e2wzlPqnRSNXLlEdkYxRL2C6qJ/oRsGcPvCOdQob+Ho
         xEeLjH5MpaKKl/XypGWfl5g3gkzI3bABaHmWHQn5OlIjhJk/gnec2iSnyhmbzDohS71D
         gA+17CQlMjXm9hvNOA0UBuSEtm64XqGi2z0JuUvxfiZcPmdEikknlrpTBdy1+mTZF8c2
         nhMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ7mRkNPAGh7Ft3kxazboM3Yy7F6NKb0svxBKMVuRCvd2qoOlke8UArMzQ6A/xEB9g/cm0tq82sL2bH+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8l9WLN/T/HyscraOufyoCuiuA5QshtnePEZ5Jvjtf2JcHsQS2
	J/s3O3Y81OH7UF0v3ImWLJhba98X1WX0VSk0En2rjq9wc+f1ZMH/LDPJrNnYCDLffW1ZKzB9e5e
	O+YK6MYftkK9knDWvzf/lg1owjvUHur6W2fFGtT/P
X-Gm-Gg: AYBFou3jrdRsgT9Ck3j4TDWvLltXDB9vH3DXDgzU9+q1oX+7Ke6Rd1TnsdstahvJVl1
	3mEh+ScalfTF/wHoPUEL19YZoWiFA2yyp/RWgsM5py39bURpcLxgJMG+LCv4kfMmZsAFw/AbrT4
	cTDTQDO1lCatKbHACpC1ZpdPXfZw3tRzfjM7W883J1d9SBJuyjhGHd/AImvgG7m6c5H7mF+09xo
	SD+OaFmoerFUAwsNxgRI22l6zrjnSZqrB/pYRnrFmTiGpYu8MD5UR4I6jG1DKl211QGK3IuK7na
	7V+d44GR7Ox6bPykOGj6MI/F48c9N2FC/hrhBaYvPALhK7RH8QYvaw==
X-Received: by 2002:a05:6402:a6c6:20b0:6b1:aa31:a627 with SMTP id
 4fb4d7f45d1cf-6b38ba0dfd0mr16268a12.4.1792122495231; Thu, 15 Oct 2026
 20:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014173945.373295-4-almasrymina@google.com> <179209666051.434549.2929683677785392178@kernel.org>
In-Reply-To: <179209666051.434549.2929683677785392178@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 15 Oct 2026 20:48:03 -0700
X-Gm-Features: AclHuK82vYjG9iaKBiwqWzObGCIoi3MxPyudlxUnlS3qJQCEAcDwsenVdF71kak
Message-ID: <CAHS8izPxoA6fU10fSNzKkZHFrWingOgduWOoD7ywii2058GABQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/6] net: skbuff: replace skb_page_unref() and
 __skb_frag_unref() with skb_netmem_unref()
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, ayush.sawal@chelsio.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, tariqt@nvidia.com, horms@kernel.org, 
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	ncardwell@google.com, kuniyu@google.com, john.fastabend@gmail.com, 
	sd@queasysnail.net, ebiggers@kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, petrm@nvidia.com, u.kleine-koenig@baylibre.com, 
	j.raczynski@samsung.com, wang.zhan@smartx.com, willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:37=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] This commit fixes a real refcount imbalance in
>   mlx4_en_complete_rx_desc()=E2=80=A6
> - [Low] The commit message describes the mlx4 RX error-path bug as
>   "underflowing the page refcount".
> - [Low] At this commit, the new kernel-doc in include/linux/skbuff_ref.h
>   names ref-side counterparts that do not match the code.
>

If it's OK with folks I'll just ignore low comments. Even if I
reworded the commit messages, the bot will find some other complaint
about how the commit message is worded I think.

--=20
Thanks,
Mina
