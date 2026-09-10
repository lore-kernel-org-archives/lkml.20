Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2038BF76
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055622; cv=pass; b=qOLo4Kn/COOOy4eCrafs/lylumRxlFGROt0Jcsz7gqrl8+mu/E4yp7Eztm0UGqaGkWw75fmbZdy47ExRFtuL6yYGsv0LFpI853nZ32zKUaP4u5bi6lKwbcMoS7C/YButPaqrtgaVYP70vYAla8mnSecgFdvAfjKNQ2cgWkUaMWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055622; c=relaxed/simple;
	bh=9VQjJt6a+185GkYjPMQmDeyCxl5xt0e29jz5LgzWiBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJArg1M3c3ehSXDJdu2Iv5Z1lcHM04952vRa1Xv66bYf6IIfOvajWMwhj0sprKaddND9me9uk3QNcxFjAh8EQZLqEPYZxQEQd0TMTcHK0V4AgDfunVyUOfoEDwnKGzawUyK/THaXbRcciP44VEzOuT6XdSd1yJ5f+8vqJlYh9QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oVRm1+9y; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oVRm1+9y"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso2574347a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789055619; cv=none;
        d=google.com; s=arc-20260327;
        b=SI6tuR2kelXW3rcP0mFaUE7WO4xfl7gZ7ei/cIXSirGMVaNMhl+HjhRa2Z3+z9BEz0
         BiyiLG/xS8KrrkJFmsJmtx1S/eWCocsucw8BS+3xTIZHgp7fnMrVT+svzESJZu0CkOmp
         e2OniKf4/PMjnuC8Mx13NrzjYVVXovSfH4qafbxOvB5bGhpSYJCKlwxVm5Mz05fqQysc
         pK4byAA76It0uqC5R5HAbfQfskeUPQ4c9qWDYfhwBQIITzojpRpWGz/+HwM+fXSeSCAd
         zPcCclZZfEyPLxMjd+lV6UZzHPEbzV6wEIvDH97d1v90A3NDU3JsSfq5tKrTPEgzHk8d
         Xlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W02XYVTB0Nl5fojAG5hBMBTOksfDYePfH5xC6TePd8A=;
        fh=JO3ctQLaQaaBkgAEHkT4x0nkmcOflfF2h5ipd5GQpuo=;
        b=fZDHZkhF/tB2hAON5HCZU4EloM+I4PYCojHBoTy99z4jtqJFlr+2TvyfwBh359DT0p
         iCaR351Rb2KvCBQB+yJpXi6xa2XTTKJkRHomTeu3mXO/MfGEZOklFlIWYAT6yCf9PNRo
         PbWq3I5uCNqv5gqnceRGYIDkBpDmvkTubWPkUdhEw3+Lozbg18O7zKLfdWLCUzFOK92w
         WUcimPkEG+6nJerV8RHyVNMJiJe4g/GE2B4LQSSVY/zIL3cQiTgjG60mu4NfdwwdJVvn
         68xGCSfUUfZDSA0X1yP07kFfIIqnydvbYZfvpdZnTfWw0OwecmOCFjj9tB4jl5Q6ZGnJ
         ++lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789055619; x=1789660419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W02XYVTB0Nl5fojAG5hBMBTOksfDYePfH5xC6TePd8A=;
        b=oVRm1+9yHA3RQkFJXGfi+TTzgPSY/PRosh0abJ2Rs1/PAauPt/6k6bi1wzgiBYGyvo
         QWRsFNlq2ZxRcXCh8lmHPQh794CKdEJHa5iIK06/61AvoL10ThJM0GUaX6NQLk7u+0p4
         26sYZEa6Xc4hOJUtJEChQQXMMJkS040MjQCrnrrNq2TOhXZ4S8Q+GhfsEJ9QF3YqajyF
         CtjXw1lFXp+FBLIZ3Shhvg2JBVHmEUIu2ztoXxYi3diXkGCv9GvpuQU1vfm4ONJ96sGV
         ICT1Cq2Hsh1hBUcqWFGzoBIsV5tYkdeC9jd6z07vhX0rH0gXu5oWZvKoHpG0wk6pBfJI
         OXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789055619; x=1789660419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W02XYVTB0Nl5fojAG5hBMBTOksfDYePfH5xC6TePd8A=;
        b=i+iom2rl3nC41Ttuu+DxsDmeIj2BqrOLauslSn2uWLlKonR1vMVVJs5i/vuvQ+tsTT
         60uMHnO6zcSv0ZufrYMJuFCnKdkNJF0ac/ELnEuZ96ZfyUoJXaxHOp+KnxDw5rkJTiMo
         b2jJGxsXsCE15ZVFj9JuLdr+/pQyhtzJbrWLja03lWYWZPilNZZuiw07oFY/LqY/kAdJ
         sjVD5svWnLGGOj/Rd96QlUNLd5auE6o0ATJRNjsWswS+Del+OVNGILdStSLtG8E0kInM
         8sgtBABjL7lkv/P8diV+2oq0ZXI8ZCCkpfwK7468dsjtiOk9vS8vzc1sBPmIIB5fI2OB
         /PfA==
X-Forwarded-Encrypted: i=1; AKwUvByK1zaD76O2aHuQ3RpldWOoodWAZL//Ngmp52FegG6Nr4n/3qkufUwQi1LREUNxGFbzeJVeV6y/ujLAxZg=@vger.kernel.org
X-Gm-Message-State: AFuF++ntfvBy8CPhZyuxHtF4f494MDctB3v44B/GbYSKm96bJYolmSqO
	ySPM+IvYt0/xfBqtdq9k2fARj7M/Or0gzNVhkx/c0n3G+NSwCsmBLqYxT9Wx5tl3YCvHcVLi/Tq
	RRi5Urpk+pKtXFgRw34uFflmNT9mqiDJriD5yXT0=
X-Gm-Gg: AYBFou2y4QOtueFVH/uD7GcnMWEE9GTmxcf0ShNZ1Y2yCuy9KQGxTz4mT4fhR5hHbCe
	Fg9casJREzke0fnKYnMReZalOU68Vtz7TPKa89zDnPyZ5/4PWbcvJEm2raExVASxGorAmF+PchU
	9NVCSbUPKX+QQjYM5xwbrgsMbMzUJr5VK9fklf3pHcguDe3IAAj+r1O+205sUfcxN8xxODIpqyw
	DW6uJqJO2UkshZ8/Amsu3o6M31fguY819VaGPRX1eIYKkfs+cZdMjHoRac2i3sGf0SIDBBufcP3
	3kOMeO22b6MnbjTdhQvMbVVTtfizPKzsnDmY40EQiFtZSp58b4SZdBg=
X-Received: by 2002:a05:6402:3512:b0:6a8:451:32b4 with SMTP id
 4fb4d7f45d1cf-6a99ccf0837mr3371397a12.23.1789053870395; Thu, 10 Sep 2026
 08:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9CC2EE8A-9F67-408A-87A1-62AF671B4BFB@linux.ibm.com> <20260910141524.12362-1-spasswolf@web.de>
In-Reply-To: <20260910141524.12362-1-spasswolf@web.de>
From: Chris S <coshi036@gmail.com>
Date: Thu, 10 Sep 2026 11:24:19 -0400
X-Gm-Features: AcwNN1XO9GRsWlKpqFSX7PpQbLAxVz7EBaLMtD1MZCmQjL9KwHLULMUzhoKDyzc
Message-ID: <CACd_6n2cPqmqs=Ao6yKGSzW8WxUPPsHaLJBOHGeMtKPkk6aR_Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] jbd2: point the shadow buffer at the frozen data directly
To: Bert Karwatzki <spasswolf@web.de>
Cc: Joseph Qi <jiangqi903@gmail.com>, Jan Kara <jack@suse.cz>, Venkat <venkat88@linux.ibm.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Matthew Wilcox <willy@infradead.org>, 
	linux-fsdevel@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Baokun Li <libaokun@linux.alibaba.com>, 
	Ojaswin Mujoo <ojaswin@linux.ibm.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Zhang Yi <yi.zhang@huawei.com>, Zhang Yi <yi.zhang@huaweicloud.com>, 
	Bob Copeland <me@bobcopeland.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, linux-ext4@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Weidong Zhu <weizhu@fiu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are right - I checked rather than taking my own word for it,
next-20260909 still has the unguarded dereference.

The fix is in, just not where linux-next takes its vfs branch from yet.
Christian folded the b_folio check into the commit that introduces the
folio-less buffer rather than carrying a separate patch, so on vfs.git's
vfs-7.4.bh branch 781bf9c7e307 ("buffer: allow a buffer_head to point at
memory outside the page cache") now reads

if (bh->b_folio && folio_test_dropbehind(bh->b_folio) &&
   op_is_write(opf))

That finished this morning.  linux-next merges vfs.all with tip is still
2026-09-02, so it carries the series without the fix - which is exactly
what you are hitting.  Should go away once vfs.all is regenerated.

Thanks,
Chao

On Thu, Sep 10, 2026 at 10:16=E2=80=AFAM Bert Karwatzki <spasswolf@web.de> =
wrote:
>
> Just a quick reminder, in linux next-20260909 this has not been
> fixed, yet.
>
> Bert Karwatzki
