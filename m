Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09AE54788
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123876; cv=none; b=XKFYcLZraW16jDDEis5T/Xt9ELnWXfPKSoTtkkvsjfu34aPaCugUfzSYokTWxHNNCrRvlmQJQms0VunpPF83ZHcSyuGzGX+5+sEheuO0/6cbFEe3LS9T94CngYf3QvHBAL14/e5tX43F7hzd0X305SVCz9BHWD9mv1zTHdlAtG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123876; c=relaxed/simple;
	bh=mLB37Exj08/433G+3BazeafnfFxR6CqGB3+a9cQSS5g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=YpEwsDphprTdLbrZ1TbVn8iFeMCI2pfyCWecsdBZfNYP7Xa3klr5OFkdQSz2/MEkE59xZhVNJHJ7F0+kj9BX/JunvlN8PB7LcihhGDujqx5rUJIy6XNW9v4byWMxchHtfiulshhoI2iADRXZ5fx8ZjMAYBR22IrXhtUl/XUony4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzfhNqVr; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzfhNqVr"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so351525b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123874; x=1790728674; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IwcZc6dV/wJdORGfLDctznTgTbvt9ax2XJYGP2ZitOo=;
        b=kzfhNqVrrobPRdQM8WhVaBsRcdEmk5WmiapAxAXfiiXVwJ8Lt90vavG/0JT3wnIu8Y
         cnEPsMMo0ylXmuyRusSJyEGyaQ0OybkbQpxDjtt4wsEvqS1mnm4RrD5R2v9aUGA6boHL
         Pb5v1haeofXhPZ7svjFUsGLRayw2Jon4UOkzWZI+scCqmQO7+LTxT0Ibh8CdggLTB3jy
         2kLYHg6boHTHMV4ApithnA3o3FGrRwivI/uBr0wPQOm3etzp5QtsUMw9qMSVwVFWZM+3
         dAG+mdQhJM45zRdVqzbJehBwkzHmaTt2OKBgNGVaY8HkRribkZeDEsLvycrVL+ZXlTj8
         amvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123874; x=1790728674;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwcZc6dV/wJdORGfLDctznTgTbvt9ax2XJYGP2ZitOo=;
        b=TH+lHIAI7FOCrSAxqB5PNbJY5JFIbmdHWECWFsx1wOwjcvwjt2f04jKfLepDpCXPQy
         ziqkFKtR557x3uHJshDub4iKGiAt+lxAl5vVGwsfRVN2H1LP0V7/I6fWZAbOx10u7Evt
         pCBBzPg08DN8R8R07Y5KxDmmHj1HfMi8a68f3U2H5opX51M8phhne0g0tIgT3G1a2KLh
         U3Qsp8qK+sYyDY96uG+DAs8LSID7Qp0w3LmyV+84VlBRoNLnZaaTk77dbin1cbesJ1fI
         2cq9anuj+eE6gJa4ah2hmF8sbcuWz2C77ERmLLHA1dvwLabSmDOaX0Nb3bOg7VTO6FaG
         rXmw==
X-Forwarded-Encrypted: i=1; AKwUvBy8GvdEEosTw7MWfDdlue6szX5vE0XayQsjY7yacJ3FviEI5TGd1sS1GNaGghNf6fbwY9pzXwWRXGigyZk=@vger.kernel.org
X-Gm-Message-State: AFuF++nMiYMmd+DzOLQXf0GeEoPYIj6a078ogpW0v1QJ/dYYhnZot70J
	T+t+9/4maFQieheTY7RpDM9ISklusaiJkqRlqMYX8k/1tg+HREB0pTbQ
X-Gm-Gg: AYBFou2L1vUuGy+i3Tax4bm1eUnfCGUgczqBONBvOuQ1eA9v8w25PdgfCk6rIB+ElMT
	a11gutBBZyPYRZccrTbMXb6tObGTzdPKJ25SmvfTgN90oxpNp8Qfdoz79V4f8Ly+fzknHWV7jx3
	uzWhRCwccFSp/VH0t5LeKqkEnDcFMhNUzNLrx2S06SUyZbgaktNHfodPReMsda7vZSeOPBdQWzH
	Olkbg8l6FU5o1xq2eGd1ASTij3JjvGsCqcq9LKvtYRNEj19oVNr6NOZWBIeUKnPnduMTr5LhiER
	1Q7JsPlS8sJ3ywo0YgpvyzhTvSWUZB7CPk6wa4wUV5x3XEQAE6zdFx8fUjgoVUCU4x5e1J2d4P7
	0E6MUPG/FbJAoHnXQUG4H6IVdnS/txLAttcbx33hNsTmaaFmsRi+obyztrf0MNRoQSKrybRaTVn
	rN5V6j0giICLgw1q+gPvMDG17Ax3udgQy9cxtpBvFQm9lfUZq7oJ6c21PaPT18uVXN5Ldu+D8Hj
	j49lb125r3/oI8Ebwcj1DfIZ1wU1oE=
X-Received: by 2002:a05:6a20:748d:b0:3dd:a196:53a2 with SMTP id adf61e73a8af0-3ddf82f113fmr927824637.68.1790123873965;
        Tue, 22 Sep 2026 17:37:53 -0700 (PDT)
Received: from smtpclient.apple ([14.139.251.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfc0843sm449618b3a.12.2026.09.22.17.37.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2026 17:37:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] nfsd: prevent NFSv4.1 SEQUENCE reply-cache overflow
From: Mayank Jangid <mayank.jangid.moon@gmail.com>
In-Reply-To: <29830200-dcb0-452f-9e19-80a595b46fe7@slotpi15m67>
Date: Wed, 23 Sep 2026 06:07:38 +0530
Cc: jlayton@kernel.org,
 neil@brown.name,
 okorniev@redhat.com,
 Dai.Ngo@oracle.com,
 tom@talpey.com,
 linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 security@kernel.org,
 Kushal Khemka <kushalkhemka559@gmail.com>,
 Kkartik Aggarwal <aggarwalkkartik@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0CE2B28-0875-43AE-95A2-18AA7FB758B4@gmail.com>
References: <20260922112608.1256363-1-mayank.jangid.moon@gmail.com>
 <29830200-dcb0-452f-9e19-80a595b46fe7@slotpi15m67>
To: Chuck Lever <cel@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

Hi Chuck,

Thanks for pointing me to J=C3=A9r=C3=A9my's series.

I tested the queued fix against our reproducer, and it resolves the =
issue. I can no longer reproduce the reply buffer overflow with the two =
patches applied.

Please feel free to add:
Tested-by: Mayank Jangid (OpenSec Intelligence) =
mayank.jangid.moon@gmail.com <mailto:mayank.jangid.moon@gmail.com>

Thanks,
Mayank Jangid
OpenSec Intelligence

> On 22 Sep 2026, at 7:36=E2=80=AFPM, Chuck Lever <cel@kernel.org> =
wrote:
>=20
> On 9/22/26 7:26 AM, Mayank Jangid (OpenSec Intelligence) wrote:
>> nfsd4_sequence() narrows the reply buffer to the session =
cached-response
>> limit before accepting the slot sequence ID. A client can negotiate
>> ca_maxresponsesize_cached down to NFSD_MIN_HDR_SEQ_SZ, leaving no =
storage
>> in the slot trailing sl_data[] array.
>=20
> Thanks for the report and the patch. J=C3=A9r=C3=A9my Jean reported =
the same
> issue in August, and a fix for it is already queued in the =
nfsd-testing
> branch:
>=20
>  =
https://lore.kernel.org/linux-nfs/20260817-jean-v1-0-9e356596ab85@kernel.o=
rg/
>=20
> Patch 1/2 there adds the same pre-flight check of the SEQUENCE reply
> size before nfsd4_sequence() narrows the buffer and accepts the slot,
> and patch 2/2 sets op->status when an operation header cannot be
> encoded. Your patch does the same two things, so I won't apply it on
> top of that series.
>=20
> If you can test the queued fix against your reproducer and confirm it
> addresses the overflow you found, a Tested-by: on that thread would be
> welcome.
>=20
> --=20
> Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)

