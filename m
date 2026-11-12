Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794496999;
	b=YwYuKVYdnBwq6ewsAmB1xjqSgkHzqToLPP6171ipyyPTBFeoNiFtgIFZXl++JP8C/YGz
	 CI140QDHJtfWfAs16v/gdjSahlgcH7J+z14zkxL6dGRbhpbiNZfmNCf4gDOmSA9kdxwN1
	 rkpDLNwhwMS1GxEfTImGIYpTN7jy6ciQAXOoGud5iWYu/kQFV4RZTxo1ctrF8bI88EDcm
	 M751MeMn/gxWGef2wLl/vH6II0tAnfnkqAl/p3knuhKKStf+JQX+bAsDc7My/q6LYOLVr
	 O0q1oCXw/ytqBQKyJXQBwY7Nq1O8gQIElqXL0NDEhmao1r4UOAbN4qhXuO+kqtW9pfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
	b=F5ibu6lcwLQN+Zn+dZ2n6o1SXO0w0eajiJYZReKyW7zqnZhvIisMfaNuaz/nERnjOSTK
	 lvIBMTvFEYERmNtsGyoBmZNkL+w3E1PJEoqZGn2rWrFz3KcxpZagLUY4zTUmTJCrWHc3C
	 KQjxaqmAULMNPz8JkDjd24NZBPl7K1k+o08sRIQ0pXUpKRybhPKysoAJqfXR3PS4Ynx54
	 4BQsm/2WVkMp9SU92PLNVJLYFO+NbftrN7XE9N68m5gctMWLp5oyIABeEAkqdBevTU5Xl
	 +5h44cOYJpzAeB0+WK+J0aHH1uSMiVYrMxyVTZGAZ9nxcELTyxUb/UoQPxDFGZl/xmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdHySA5y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA16860A3837
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA16860A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdHySA5y
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so47993555e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794496997; cv=none;
        d=google.com; s=arc-20260327;
        b=qdGJu3IQLuybm8cZETON6RmXGBMiefPos3ibPeaI6KIrN6w5jE7tMHTRDYMZDwrI0W
         68iKTI9jx6+hldqSQVbiN+RuiM6ZdOv+h0a6PrLrJsKWvKCtGmaRQgm2XcoLlWeUgpDT
         pXOCgfXdTkkq5xEcL4mADN7unH1nOe1Eb8EwRVx0PLO1YsnbhitN0qF0duSTC3SOznFQ
         lAtduYmcsASo8YXJa/3Enm+js4a0BfTmjN1yfeQoQgIKjcvrgbSapBk1PIh+3gFBdOsn
         1HSNHryXy57PcKZc1fFmTiR8scTLN0uFgNbRSLH0Xm/qX/DQDCfehIrKSNJsM/sqxfJT
         N05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        fh=q8rR87AIZy6mA5GNlBMTJwpM6WVd2jyy3h/AIlhUUmA=;
        b=Rdr7NF6IyS7rGP4Niv/uS/o/4mpBNhQxVd11H+ikOkR7TQdNtRO9+2XiqO5B2HUuKi
         nujA0sMYXYTHbezCFhn2seOr7c5BlvUBHbjGTgpu+ouoW5O+sELVNf58AY26RbJuzZQ3
         RLUmp6EO2gQaYLCeYgY+Cxb2I7QSJIMt7qmZH/wa3EJtcEqqQxnUZK2kyAyuXG2WEYJm
         sLqmPsq3trDZdH5MBK3hptA3optXoL6EpVDooF5VEe0xViYpwd3cJJSQbZTGTK6NrT++
         +SNGh60ErD2MzJwcbmFKw6Xpq5/9wf8ThtcLLvpj74KFrceNJBcjr8n7q4jkQPpTaAML
         35fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496997; x=1795101797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        b=xdHySA5yJr8R3v1bJTdVJvaIGdetLFfLzfjuM+o7syK/yGeAzwWzFMxbWd/Ct+6rMK
         MVANAOQwCJNG35jAUcUyz4qb96VvSdxfmtWqtOhL07JUGI5YDqKmQrWanxsYe0RUh4zA
         h/f/rDCpmTn4mbz57neFPhvuuBN/Tq6CJYzLaR1BKKzGinJoy41is6MxKy1i9f9xSrkJ
         Eh+N8FqElCwLLQdbDMED3VH/oMYEJIZfp3JDX38AozVHqv61qQEQ8tJnfedJbuyUQKf3
         2G72UmsyJWQGEErAwHvQG+tY7G0eeC/0puJ2E95E1nXfJyAsX9FNegJ6m2ZoHeIHGgXM
         AMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496997; x=1795101797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        b=lQ+4BXGWL0iSnxKGtarSmJt8Y8/0LVBLIE+fEBjQBn7qK7T5fdK9E4+kU3VjNSkItg
         CmCmHg1/ZOPJsSTY/goRu3P6ZCWyxOgc++SsAmibc3cVzMMGvzB+8zkWkr1ysd6dvobV
         AuhRhT6YofUHtEPAIBfYTCcxyubP0sI7tmCh8KoTbQKar6BKSek+FDj2rF+9KSIboPVd
         D3hQ/w4AyQsB7KObWfOdOP5kjmHaDxUUaG3efd4qumtkOXlwZGFOVbXtyyExkst7CxlF
         jKpOKyLA8GOJmnCFNFRTsRwyy2SM+XsGwCgD8dTvbXgT+0tkTgQVck9JH6jVz2b+6eC9
         oKxA==
X-Forwarded-Encrypted: i=1; AL+hErHEIXhQPmqpPflMuxH2wlmc1h9kB/qXclvnrF10nU2wklZf9Q/NRHTsr9tjTx5kmBVP9vs62Gq08JEZELI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hOVMzQWxMQCUVS160oteT3LzRmnOgMB0u6accDGWkvXn1cAh3
	H4B91wts+yVgdrmvswVRiXW0ifryQCtNgrTyJjMW8DhlmcdKp0/094mbr4e259PFIOkqI37Jr7B
	ePtHW7xg1EJzTLU4NTHT/nE9COZqaB0c=
X-Gm-Gg: AYBFou2wQbsAOvwgF/xJsq6oBDbQaNzI9jfKsa+ZOOEdj7czJMXNcoO7xZvfQTmP+R0
	ktJMZAlumRsF1yRbZbXVW1FxffUBqj3am5lvyLYm+bSy+dP7msc/il7SUXGk7VhAdLt0I99MTM8
	xIdoZp4psOVP8Bwn4l1Zk8ngXZ10Ym78vFYa8OHAKMWF9BAicRDxOaKBeoz7phvBtclcM2hMlq1
	bRfNT/PtmL3N50jMqJ6pThY3pKPsqMVDfnnmHkuCI0yF/SHuQ7927gIuF5TEISb8EQFfOwJ7TIm
	ARIvA0KTvNotXvRKyEUd4gR3W4zRj/7aytx0x5e3w4w5cvRL6DP/mqXzdqEOgz9OIBQKNJBZuZ2
	9kGILDo19G0FOu9ZjbPQ0FEmshzasdzhtJ4Jej4n2TSWxa6jxqsP/J3LcTdasnOB9Mmk9k7e8wG
	aZVAEUFr/g9aKlnoPh
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7ced with SMTP id
 5b1f17b1804b1-4ba0937a886mr110753845e9.17.1794496996738; Thu, 12 Nov 2026
 07:23:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
 <20261104165504.2430480-27-kunwu.chan@gmail.com> <444c9bb1-fccc-44ff-8bcb-a04dd36eeecb@paulmck-laptop>
In-Reply-To: <444c9bb1-fccc-44ff-8bcb-a04dd36eeecb@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 23:23:05 +0800
X-Gm-Features: AclHuK-Vxw-TWlfdg2rnJncie6E1-Z5rOKezLCml8xvtMgG1OEVJSy5iWLiq3yg
Message-ID: <CAN_Opa8-macEL323Tw3JUai3ETmq0CCt93ddCZ+Xqd1RF1Q5nA@mail.gmail.com>
Subject: Re: [PATCH 26/28] hazptrtorture: Add torture_type=none clean skip for
 rcuscale coexistence
To: paulmck@kernel.org
Cc: boqun@kernel.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:31=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:44AM +0800, Kunwu Chan wrote:
> > When both HAZPTR_TORTURE_TEST and RCU_SCALE_TEST are built into
> > the same kernel, hazptrtorture calls torture_init_begin() first
> > and rcuscale fails with -EBUSY.  torture_type=3Dnone makes
> > hazptrtorture return early without registering, allowing the
> > rcuscale hazptr scale type to run in the same boot.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>

 Thanks Paul for the detailed reply.

> You are only supposed to build one of them into the kernel at a time,
> so the intent of the torture_init_begin() failure paths is to enforce
> this rule.  If you want to run both in the same kernel, the way to do
> that is to build both as kernel modules, then do modprobe and then rmmod
> of the first one, followed by modprobe and rmmod of the second one.
>
> So please help me out here.  Why do we need to allow both rcuscale and
> hazptrtorture to be built into the same kernel?
>

You're right. I had incorrectly made rcuscale's hazptr scale ops
depend on CONFIG_HAZPTR_TORTURE_TEST.
That led me to enable both tests in the same kernel and add
torture_type=3Dnone to keep hazptrtorture from registering.

> If your desire is simply better handling of an error condition, an
> alternative is to force either a Kconfig or build failure when more than
> one of the modules invoking torture_init_begin() is built into the same
> kernel at the same time.
>

The hazptr core is available independently, so that dependency is
unnecessary. I'll remove the guard from patch 23, leave
HAZPTR_TORTURE_TEST disabled in the rcuscale configuration, and
drop the torture_type=3Dnone workaround.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > ---
> >  .../selftests/rcutorture/configs/rcuscale/HAZPTR    | 13 +++++++++++++
> >  .../rcutorture/configs/rcuscale/HAZPTR.boot         |  1 +
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale=
/HAZPTR
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale=
/HAZPTR.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR=
 b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
> > new file mode 100644
> > index 000000000000..c5e9cf0184ae
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
> > @@ -0,0 +1,13 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D128
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_TORTURE_TEST=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > +CONFIG_HAZPTR_STALL_DETECTOR=3Dy
> > +CONFIG_HAZPTR_STALL_TIMEOUT=3D1000
> > +CONFIG_HAZPTR_DRAIN_ASSIST=3Dy
> > +CONFIG_RCU_SCALE_TEST=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR=
.boot b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
> > new file mode 100644
> > index 000000000000..e9cca4cf453b
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dnone
> > --
> > 2.43.0
> >
