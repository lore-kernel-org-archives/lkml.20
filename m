Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659B3472061
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791859172; cv=pass; b=KySOO+qSNaBUsjUtVScK+C2R5YfIt4b4bWipWKF2sEZV5kS6X78YANlmYp2CZLsSrM2ap4DLZvD3RVhsZlEuxrAKMFl4XPs9NV/szHXOqENm10ZuuTUydbK7SPTCtjZ4TKjn1QX13eDjQZCd0vWOcNQvkzwh5DO1j+2+OWL0n1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791859172; c=relaxed/simple;
	bh=gzXA6CNU+k9d2IxL5fmb2DOWkaxNeeHPWD5KYocup94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKqUYkh2w89IJaK4B0cBacmQzuuMvW3fBOm84Wa+UD0h4pIhD8gqxmJAtPrGMdhkl87HFRi8mHq8XII2Oa6YMPizfcYnXR/3LdJDEq92yzINnwf+YCu96o+vjqrI4SRfPZKUl9VwVha0ImCmNHvjYKIG74CRUIS1A6qOCArvEFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwjDts44; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwjDts44"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2acc1e170cso397153666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791859170; cv=none;
        d=google.com; s=arc-20260327;
        b=ZIsDG6GSTJ/QP80TnZg+8rCR6WNj3V3qPlX9K3NzH+33Hqz8ldGkk6YhAlTWYdpd5Z
         0l/BCGkj1PljcUie+GC1+fmXp6LetfZ+7E3genJtnMzns4AxAewXD3uYDbCvuqAcAB87
         xju/iKYzHlDv6rS92DOfu2CdFPeuvQr9U62jscIGqTZqJdKfYKk2q6HlTj3FjQE3pCB8
         X5zyMz4ySR1BlnVNn1eqD/iFCC4C3nLzE7xdwWqAlMq/JR8e0H01sXAyzbWsIXkEIkTf
         +jfZtZct1TPpDYql6ozEaLywg80PWlSH9iocbHxAaLMYfafCh3LoTtNBwjsOH0PLNIsZ
         28Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=trPoqfxmlP55z6YJqls3af+YQEmGNS6JcpIVYqWD4sI=;
        fh=govMELC104qEWqEsMdQDNqntslKrdLJXzuBxjdZ1dl0=;
        b=T7CzKLKH2Ykbm8r3k0MeV8scN9jzSufZme0U8cXQJEdi93Tm1tp+U5DQOlrv6X6Bd6
         D7Tfme4ZwRuB0E2tolOd7UKybfwMWoesosaoFtlfx3qlQIicR55ogNh/uXzmej5Mcvec
         TQsGzt6MFed8YmcmXv+NN/hdGv1GLt3FFw5UYrLZ0wzf5TN5yGXUZzVAet9x30+pDGVJ
         cE6wtCus1GnSp0gaSZ+kbLIur5WMrMyE607f+phk/X6abij0r/iVXvG/JHn5GY2r6u0m
         wv9kjLvfVGj5s02ciF8v1+6Mg7VvF+Y9NnkiaESgXS1przcCiAyhc5NHyrYjhOxxuC5E
         7hZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791859170; x=1792463970; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trPoqfxmlP55z6YJqls3af+YQEmGNS6JcpIVYqWD4sI=;
        b=JwjDts44C89wohQ5rAdzehpXtC6MaZojhR2nsbkxz7aE3A5JglMxf3uGOLwWeeILFv
         6j2PU5Ljs5kQ8uSVp58t3ZkCOQIPtwczlExu0Kk+HH4Vvnpk+OlQ/FD7eERA11oZ3UMR
         4G2DjLTvlmL0wGqG9MUgQdxkR8y++oi+lbJhb3sSU4loQtkn7JNA6rAd1D4hDGdJYBkC
         e6amYkK+Ud7ga1ZwtOXnOHUWDkPMxtM1CrfO/5ws+jR4w5wVq41byQTaWnocQ/utHA7s
         /F1lgUDN/V7bhueS7+hivMnIZRmhI/j89qjsrxJv4rd7ok6Ay/vC/fkw6lxtcPCgMytR
         3QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791859170; x=1792463970;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=trPoqfxmlP55z6YJqls3af+YQEmGNS6JcpIVYqWD4sI=;
        b=v4s2YnRdCwBnrvWRPFQDnAPvRj10jErVoUUwPE89VpuVoA7x4aBCt1OfkogHk+NRO9
         +hTDSGafks2mJGLDrXqqzGqRli7wEYvjkrmKHSAEX7svwUxgWLjCPYIILq3wAtIx4L9a
         i4ImM0lk1kRBBFsNSrtJY1WSs5ZlefLcUbbTIyaCknbQ4TNe9446ke5kg51iv62RNta9
         gBZDcmYkiPZkGghWfNnsTubifJXeNK/LAiRB3uL4vA3pQ+jZssbjYwF7lvEd0FcHX2wA
         FMuVqC6baJWuvW+mpdX7Ug266yMMUMygcDAX/gl0jNB67bkykkhGe4ObnQBLTrfASV/S
         D7Kg==
X-Forwarded-Encrypted: i=1; AKwUvBz87x69M6WpVcp5/82Iwj34T2B7jw1KzezSXZefbiEsM7VwKecKowEToutoaUd/NUSKc4mMAzwRA+A6Ick=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh9PdNUeH2wkOuvg4kyp+ZYo1ZAkv13NNXdHtWu+PmIoNzmVrB
	iC6mId0ieUVrMSwUjwLQevlpvBHuuLaQzmTgFpC7BbdeMiP43aGNsgAM3rSo/iYaOS1dFhrMg5L
	XHUGg5SjhnwfTuEo/vi2oqfCeB22n/t8=
X-Gm-Gg: AYBFou1rYi6xMCUZ+6aa6Uo5EYpWGfRz8KT+Om3JPMFWwEs9tRY380Hoszj8NwmBXks
	jycp/IdUcVCR28n7nmMVAM+uRJ/vJOxEg8NBtbCc5T/40NXxxSkI7Qz4tpAxMF42em4epgMzblM
	YiBrd73coh+X+6jLgQhmnRsRKi1G/Rmu9Kdh+aO9+DytaljwkudMWh7l2kOZIBdaAxjmpMVpvK9
	b58sS6wEi3LFD5ShiMTi4o9c59vHLil8hN1n3L/j5ixVNxqkkr9NMnO94TQuP57c/+LdlCAtmxe
	ojrSXw4C3CXDD2kgq9rIQ7CJki7QU1pJCP5tNIKnfb3gDQMxQiSTgYzxLw==
X-Received: by 2002:a17:907:7b8a:b0:c2e:855:3375 with SMTP id
 a640c23a62f3a-c31aa05d48dmr1080401166b.30.1791859169505; Mon, 12 Oct 2026
 19:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ip-core-objects-candidate-0001-v2-efc0e8a00d4f22c36ab8@gmail.com>
 <CAAVpQUAHHZS+NyXwtc8z2TGVUDJvC23JCrY9ghvwzqOw6ZYzxQ@mail.gmail.com>
In-Reply-To: <CAAVpQUAHHZS+NyXwtc8z2TGVUDJvC23JCrY9ghvwzqOw6ZYzxQ@mail.gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Tue, 13 Oct 2026 10:39:16 +0800
X-Gm-Features: AclHuK-sGRZ1hQB0kHvHlB9caNiz5uUG_1Nu9jnfxdc4tGlcqZWirQdd16j0dEg
Message-ID: <CAFRLqsULj3wvDpL6V5EzRAq2buezS19pZtgRjMs7HXb+k-eV2A@mail.gmail.com>
Subject: Re: [PATCH net] ipv6: Keep the SCTP provider alive through socket allocation
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, fmancera@suse.de, willemb@google.com, 
	kees@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com, 
	Chengfeng Ye <nicoyip.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi  Kuniyuki,

>
> Chengfeng Ye is working on the same issue, and this is not limited to sctp.
> (see v3 for sctp)
> https://lore.kernel.org/netdev/20261002173844.3537111-1-nicoyip.dev@gmail.com/
>

Thanks for the review and pointer.

Best regards,
Cen Zhang
