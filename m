Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6395A3E0092
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581803; cv=none; b=tW2qiQzVrlu6oTjHVp8XxHohBHoSBUFtmMgem2QYGx4UHgspllvetB9B+BPUt9IRi3gEEp4rZrGRSvaoihckToaRr/JcEu5iLrr7KFhlXQxO+xyO9cxCulKD7Fz9G1u1JzANwSuggE1to4oc1zQIJF8+uuHaWp3w/7S50Jo7RpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581803; c=relaxed/simple;
	bh=27Obz6IWJZjv81xNpwFQV3Q4Yjfl5dy4rzmGKCz63H8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=B46xu93oo7E0kPkZHvhQZNROPrN2nRQynCJT/rfsQDS6LEUy4qj/lAtVEqhKQykWzkjKgvRbztI84iivJamkAYOB9Or7aRZkYPvwYCkcI+dGYzyn3jGR0XnSdDC/84h8zH2FE6T+V0SaZH29df3X915ou457MbaipLzd7F/riXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+sAOHGB; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+sAOHGB"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b35611so813349b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789581788; x=1790186588; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=27Obz6IWJZjv81xNpwFQV3Q4Yjfl5dy4rzmGKCz63H8=;
        b=o+sAOHGBaFpCkUp26vPBRhRdN5EdplagagWcXxG4M8mrCd2faQwpYBETBLwSmURvvR
         XtF7rVpqfdCYVDTkyOjTtEdXTh5h9LWyfgZWE6rqRJU5I4wXZVfhSrFSOXE4R17IIBRr
         3RiS3XiLLYrxhGwJXsufbfkafrYCZ3fjGA9jcBbVOPH5+BSMwCKtQM/V3ITqCBGtEWBW
         2QGluxV9lJyKRHMCCDKaNQT+mNInrmw0sRmmcpYsxchIiVvAf1FwPYYzTmbNIo5zn/mL
         iumcyIXjAP5jisguclj08tU5yilsWJolq/LZX/WtGGMOfAhoEY5AY4NdsqoTRqCNuMgq
         gTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789581788; x=1790186588;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27Obz6IWJZjv81xNpwFQV3Q4Yjfl5dy4rzmGKCz63H8=;
        b=Kcew5l+QNZrmIKd3DrbX0WFmFRWv2ZkUEp/LEtW6kFZT2nbskqP378cvqrG/yqvshp
         RRc0JqKAoX1Gm4lflm1SDBx5YDY65SMrvUBkFDzMnlJHedVDx83pWKNdRlV5a+EfFsfL
         xy1gm/m5y56AsfDJBzXFD4y0z96QfcUhznDMg/FEKyxoB8gV3yrAHJ5zkfIfszcOWGCg
         hqJlLVVlJppt1hMhJlY2U2BzjzCbwkMbQVMJCeFQ4WW0OVI6UtXBDz1qo9bd/hryx0TR
         UUcy+XuCeh2Wy6FqLwWS53Z/sT9BFudwo3yE1SMNTtqfTygFLwSePA2qiTDNQZk00Klz
         Gf0A==
X-Forwarded-Encrypted: i=1; AKwUvByAhj6JDuaUFy3gMaSQRKQtgJVKEaHK8Z0HNRX2oPUIg24SqjJtumMQGtNrfAtoQ4/thMfSzjsbP63vpkE=@vger.kernel.org
X-Gm-Message-State: AFuF++k9tA0/ZEATNTbdU9iEUjlT2HEKUYfqmwBuw2j9TeFioVT8dBqo
	vRTUx+Xl0fpQg4oQB/qo2J2PW0d12YkULuVG/9UbzXmlDbYjUMeb9qMQ
X-Gm-Gg: AYBFou2tXMROd1k6XdOvvVn6/Ekmo06hmhDpHZK09n7Dq2ZLrcBQLW0YlfPh7Z7cyBk
	SZjjibGJD2DbCscUCQR7GAmVjEC9fQLvyzJVcetpm7O6QPb02B94sk+ofv0MX3El5lNLKoCsfFE
	Hvd2XxRqWJ+xndaEWS69OJ7HF2o7iARc8vEETkwbw2IJWsekZ6s3KSIzs5seYJBIgySemtyyv7x
	QQGrHBihbJYqOD0O1b9AJUofAb3oCMukAFJtrQ+4XRDJhbPN23A2XoSs8uRh7skQy+YKjz0iCFk
	vGe5d08+GHnMJ5O8pPt3xmTGOqlN6nGle/lBBdWKbR+ZnvuBndPpvvu91bTKihvfL9jVEGsBkHT
	HnilaUMYdV20aPl+7723zj0eVt8ZE7AWXeJ/+GATwZvNVGqcBPkVBjbCJrjzfU+UdXrn6xpE5un
	kDIPbnwPkOil7anpvEm2svNwBp84wB4NLQ/AmjUDf5iTMbpe/OtprLsV+BMKxt68Bym2t57q5FY
	ETLo8BmjSv5Zy20AfoWB8h0U6g2xWq1UI1Qw2qDYIW1qQf39yNibw3sYPmdnp5lZkFF/EeuXcuA
	3k/QiFt4REa0oks4uz2ZhTWiUQ59qQXI46aBYafKxlmJKhsAzJiB6pRizAlQVogkeMw=
X-Received: by 2002:a05:6a21:7d01:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3dd5f73c983mr8648332637.19.1789581787395;
        Wed, 16 Sep 2026 11:03:07 -0700 (PDT)
Received: from localhost (ec2-35-83-186-167.us-west-2.compute.amazonaws.com. [35.83.186.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720123e374sm1634714b3a.24.2026.09.16.11.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 11:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 18:03:06 +0000
Message-Id: <DLGXSR1YQPQS.3SMAU8ECAYUW1@gmail.com>
To: "Florent Revest" <florent.revest@linux.dev>
Cc: "bpf" <bpf@vger.kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "KP Singh"
 <kpsingh@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>, "Leon
 Hwang" <leon.hwang@linux.dev>, "Junseo Lim" <zirajs7@gmail.com>, "Sechang
 Lim" <rhkrqnwk98@gmail.com>, "Puranjay Mohan" <puranjay@kernel.org>, "Xu
 Kuohai" <xukuohai@huaweicloud.com>, "Ilya Leoshkevich" <iii@linux.ibm.com>,
 "Hari Bathini" <hbathini@linux.ibm.com>, "Christophe Leroy"
 <chleroy@kernel.org>, "Naveen N Rao" <naveen@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Pu Lehui"
 <pulehui@huawei.com>, "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Hengqi Chen"
 <hengqi.chen@gmail.com>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf v2 1/2] bpf: Skip detached progs in trampoline
 images that are still in use
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260912095924.866254-1-florent.revest@linux.dev>
 <20260912095924.866254-2-florent.revest@linux.dev>
 <DLDHKKLCOAVR.3PHQ832S121Q2@gmail.com>
 <DLG3Y32QQ9JU.3LNSYXLJIGH17@linux.dev>
 <CAADnVQL=sW1-UOUbP_j98G2eY4MPzQd=HbP-7q5-sjqFQya=Rw@mail.gmail.com>
 <DLGKT6Z7ULBJ.3SKG7CYVTUAJF@linux.dev>
In-Reply-To: <DLGKT6Z7ULBJ.3SKG7CYVTUAJF@linux.dev>

On Wed Sep 16, 2026 at 7:52 AM UTC, Florent Revest wrote:
> On Wed Sep 16, 2026 at 5:29 AM UTC, Alexei Starovoitov wrote:
> > On Tue, Sep 15, 2026 at 11:39=E2=80=AFAM Florent Revest
> > <florent.revest@linux.dev> wrote:
> > >
> > >
> > > Ah yeah, I tried to address that in the cover letter. Basically, if w=
e patch
> > > all the nops, tasks running in the old image could skip some progs th=
at are
> > > still attached. For fexit, that's already what happens with ip_after_=
call but
> > > for fmod_ret it would be new and this would cause for example an LSM =
prog's
> > > verdict to get skipped when another prog gets attached to the same ho=
ok. That's
> > > why I thought that patching only the detached prog's nop would be bet=
ter and
> > > needed these extra pointers. But it's a bit of an edge case and I don=
't have a
> > > strong opinion on it.
> >
> > Hmm. Not sure I agree with your reasoning.
> > fmod_ret progs are called _before_ orig_call.
> > So fentry+fmod_ret are in the same category.
> > Adding/removing a prog to the trampoline causes regeneration
> > of the trampoline.
> > So cpus may execute different numbers of progs already.
> > The race is inevitable.
> > With 'patch all nops in old tramp' approach the only
> > additional race is some of the fentry/fmod_ret progs
> > will get skipped in old tramp.
> >
> > If the concern of a tiny window where old tramp is started
> > to be destroyed, then fentry prog is called and we patched
> > another fentry, but tramp will continue and execute orig_call,
> > then, yes, I see the issue, but it's a lot more subtle.
> > If I understood the concern correctly then let's add
> > another 'jump over the call' nop in addition to
> > 'patch nops in front of all progs' and
> > let's patch 'jump over the call' _first_.
> > This way fentry/fmod_ret progs can never miss
> > execution of orig_call. They can be invoked "unncessarily".
> > They may execute though orig_call will not fire.
> > but that's an acceptable race. Better than not executing
> > fmod_ret while letting orig_call to go through.
> >
> > This is still simpler implementation than link-list all all extra book =
keeping.
>
> My concern wasn't orig_call running but rather progs that are still attac=
hed
> getting skipped. Say, fentry progs A and B are attached to a function and=
 a
> task is sleeping in A. Someone attaches C, the old image gets all its nop=
s
> patched, the task wakes up and skips B even though B was never detached.

so ? the orig call will also be patched and will be skipped.
So no observable difference from B pov.

> But it's a narrow window and it needs an attach/detach on that function t=
o race
> with, so if you're OK with that behavior I'll respin v3 with your simpler
> version.

I don't think above scenario is anything to be concerned about.
So yeah. let's go with simpler solution.
