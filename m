Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792435992;
	b=Ko6hY1+Eu0GYBBy+75HZ8SJM9BXym2aj4/tHvpiRddmi5t7+uaREMQJbSUCJyv/vWAIj
	 DrgjJVV0ZruRDNZv1zogMiP3C3B+5pKRH8/Cvi6rG2m8bAmEC4bvHZBq2P8vyjxFxVZzm
	 B1QDQv04ZqH+ezpHYCY5QgD7UXK26CDXBDKH8zFRoqw2ayP7xbsGyy0W9cHVxM62A61aQ
	 9qh0j0pK9Wetb0Mnfx5YXJC2vF8EKgI5InW2GWDUcpc+RME1gp6f/hG+5y/cUscaQXziR
	 W75lWIMPvnrMuG/Dl5QY9KupapN6sKCYehKiXQAxDp6y/MEEwiDGZ4+DdIhG7/qAFWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U0OPXpDCVqLBQpzhnWrzkRzYhRBBjTJwu5vXYqV+PdU=;
	b=cBxcmWnjhMQ1hB6+F+Aa1i1hYqStRzYXJQ5/XYnJn2IUm62dYF2rM2sRNjMKn6mO+9io
	 n3vunnwaKBe7qQg8ica3O6i7OYXbqKltbBtpvvfD5UIdL9ZCvI2OZp0DF344MBAyZb/bv
	 TSrK14Piw8Gi045+ty+ugLxh5Hxz2DXzcM2QezLN2amxDJvOio/HYH85rkNJtyz3jnu8N
	 dXcPws/Xe7O8QVrlqFNGlC5xINavvnwAVuo8CyoRGo+H/Fg6f6E0JqRixaL/dLy+i0Auw
	 CiARF7dYkYQw+zPFUghI7C/XoOkmry2ZgYrIvPcd3tTs3NCWS3C1/WyzUhs2yHdq8lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DOsT1NNS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BABB606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BABB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DOsT1NNS
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1478275a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792435992; cv=none;
        d=google.com; s=arc-20260327;
        b=aROko6iZxA0va46VZFjC/SPmUki5EiWR1CuZ1QJpQ30+hr26oBWcLZewwEVub9Beps
         IHHMzLcdjFD48BWcHmmy4gJbQ43gp+LASC4b1zUoEJUipf1xb5LyN/wo0xqrTu/+3Ka2
         Jif4h01SYswVWwV3xiAQ3CbdX9X28zFS+71+QffXJK2b5FkS/G5AtCsBAfDlRoq+umx1
         5TXjHHX7RWg5vH/ssCmAl/uvoM64QbrqL75z12gx5Ybitmw/8dLWWdEDYwi6GUmFQlPb
         cy6esWsGQzh4TCYZPUgZ9NXJQQC0zrJMZlT/mSEujTZTnhHDfhxA+3+5NosapAigftrH
         R7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U0OPXpDCVqLBQpzhnWrzkRzYhRBBjTJwu5vXYqV+PdU=;
        fh=Hzr00tPq0bTM+lgpt2shNv2+/qmLrsTBGD7PrYDItfg=;
        b=Gz0m1jERgCloBCbH5P303GvV8w4gPVe6AcLnFaWxpSzBif7ySA9x4wb5+V4LKVY5YC
         9SDgJHN58YL1OQ8ELcM2uOgwQjQqYw6tNpSXdqsxykPrUDBj84bSmBUAwpY9JX460a2a
         fdYx+IyeGNDAkRPvm9jf0Vc1T3jStmiG/lAY5ayvHFUMRZbQgs4IugAdtt+ssh/yGOcR
         KW2101l8Wm19rpCHBLBumltgaoA+sIb9O+Wsi0GiEVangrDxWX6/1HkPDnfLcYnWzbEY
         CqBXGxd9gQSX6vT09HqyLTqL2523q9CUAHlW7xex1ovfRF4MpISU7bGgVQ9ZIDzulct7
         8KQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792435992; x=1793040792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U0OPXpDCVqLBQpzhnWrzkRzYhRBBjTJwu5vXYqV+PdU=;
        b=DOsT1NNSJKlA/uY2lImfOMWlM2PpdpUfyChND1lpSPqVsgMsk1pqU/rY8ral8PHrbW
         lofgdd2YHUQfG3pK/1GbMc6xWMLdGiT+Bt7mK5shbNnRna/Ot8SuE95csawvabM/Czut
         e8Zn79YeiiCo6l3bpwSdnKuX0YSzzvx4Q7m9HpxpqTKUO7H8jRFbBzrAeT1bfqwQKRM5
         HKLVX8lUh91v+Xulae5VuAr9lMgBw1a/jM+II6bU9LeLbqfWStJtvu7tmQKdoJfeJQin
         CIumq+YZKWqjbjgj9DtSYzuThRhcvpe/v84fLWXI034/2pDO2py143GDXS9JFnZxzlya
         VPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435992; x=1793040792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0OPXpDCVqLBQpzhnWrzkRzYhRBBjTJwu5vXYqV+PdU=;
        b=FRqHkmIRsu2PzDPAYFtim/ITvMKQRbfSRroIRxXSrrqKGLx/ipgFj9JQse5JXqECeM
         NJrTQQvWoftxxsb53S0G1oE6F7oKn3HXaM1WthHRW2mM+b/7xoYZVOpC7XwbaexqL8Sr
         QfUINk0hmlVQtnIYJSr23BUlZ6ITmGP/H3w8LoWHKS9HiZD4KOpLR1K9t/EJSsCPHTYs
         X14pQDc+x54jcqFmIh/zmCrvSPQSrc8+5NJJ0DSIzt0IYPJx1b+b4nHauT70ScJ+2O87
         ODCeE6pyc8gUBw2RJAkY5/4jFScTxiCqWm68SOP43yEoXxKotiKYhYjlUKiILhHA0Bqu
         LBNA==
X-Forwarded-Encrypted: i=1; AKwUvBxagMcF1zkKdyUdIskJwisMK4y/D1CvlLnUw7jiRxjoKaZkZWQbjkPlErlfxAYbhk3hdk4GBQHVo2dXyRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcxQ3gvm8Cg6VOxlPErrv57+aeAE8Z2QlAy16Lr/nQsah0PFVM
	8Av0QtpRFUrGG38oAvDAmnaxSceQqmh/xm8VVAnfXcJg6MfR8aHlyAAivhasLEXHsgwWvMk4RQr
	Ynpykfsxd4jx5vObi8tZXHmLKjhIIgDA=
X-Gm-Gg: AYBFou2tpiAJUkzEs7Z8Hmpb2/w5isd4KzCAvZ6hpoh6NOKZwNVs3a4gxfbzP61Wf0X
	84SAwiCS+crUQiHiWKgEWFe4CjqzpbQd6hCA9OvmKNFR9xi31qVnZnZqUmcl469MbX8jYMCy5sT
	TkhBLeHJSlhe6oR0PI2orOmI3AES977ysdjLiowS1AAJyGzxMAsiUtNrNnHNBuKr2tmtPOKIxtw
	mmhPGd6WhHyxeXqP/c+gdC0oQmjVmD7oTj9t6KqukT2RL7xoEx58buo2KNw+B6xBMgmwFbx3F4A
	Dbb8bB9qSvzxoEgnXUZWrPRyrJcrdpx8zZYamQul6u3uQDGcDM6j+Rypc7X7kbp9zlphSV7fv+f
	KdEKNVFp6mqHTap+8R8SfGfPIgE4inavdz0KUBGTThNIMh4NNDhCn
X-Received: by 2002:a17:90b:4fc5:b0:3a4:a592:4cfa with SMTP id
 98e67ed59e1d1-3acef3d957bmr7542638a91.45.1792435991820; Mon, 19 Oct 2026
 11:53:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019080709.477548-1-18983559317@163.com> <atX2FsqHIkOvhrLy@redhat.com>
 <CAEf4BzbX7vmpd2da4eKphX1r8=QXGey_1m32-KP=-8FOkFk15Q@mail.gmail.com> <atZFvTrDIyBtzWbo@redhat.com>
In-Reply-To: <atZFvTrDIyBtzWbo@redhat.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 19 Oct 2026 11:52:59 -0700
X-Gm-Features: AclHuK_kIpsNmMuQwgIok0RUwcZKJw_O92TtNFcUdNT_GKShwZ_47p0XZYU5R4M
Message-ID: <CAEf4BzaxGie0JYKRLrEYHA5DdHjEFOERHU8_o3n4mxM+kN1x+w@mail.gmail.com>
Subject: Re: [PATCH v1] uprobe: Assign session ID before publishing consumer
To: Oleg Nesterov <oleg@redhat.com>
Cc: Binbin Deng <18983559317@163.com>, mhiramat@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, andrii@kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 9:31=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 10/19, Andrii Nakryiko wrote:
> >
> > On Mon, Oct 19, 2026 at 3:51=E2=80=AFAM Oleg Nesterov <oleg@redhat.com>=
 wrote:
> > >
> > > On 10/19, Binbin Deng wrote:
> > > >
> > > > consumer_add() publishes a consumer on uprobe->consumers
> > > > before assigning its session ID.  handler_chain() traverses the con=
sumer
> > > > list under the trace RCU read-side critical section and can therefo=
re
> > > > observe the new consumer while uc->id still contains its initial va=
lue.
> > > >
> > > > The race is reachable when an uprobe at the same inode:offset is al=
ready
> > > > active and a task hits its entry breakpoint while another CPU regis=
ters a
> > > > second session consumer.  handler_chain() may store the stale ID in=
 the
> > > > return_instance consumer array.  By the time the function returns,
> > > > uc->id has been assigned a nonzero value, so return_consumer_find()=
 fails
> > > > to match the saved ID and the session ret_handler is incorrectly sk=
ipped.
> > >
> > > I guess we don't really care, this doesn't differ from the case when
> > > consumer_add() is called right after list_for_each_entry_rcu() in
> > > handler_chain().
> >
> > that uc->id is important for "uprobe session" semantics,
>
> Yes, but
>
> > which seems a
> > bit different situation compared to barely missing consumer_add() in
> > handler_chain(),
>
> I must have missed something... If handler_chain() misses consumer_add()
> then push_consumer(uc->id) won't be called.  This means that then later
> handle_uretprobe_chain() -> return_consumer_find(uc->id) will equally fai=
l?

yes, you are right, and we are in violent agreement :)

>
> > but regardless, the fix looks good, we should apply it
> >
> > Acked-by: Andrii Nakryiko <andrii@kernel.org>
>
> Agreed, I have acked it too.
>
> Oleg.
>
