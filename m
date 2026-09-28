Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A23644C9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564068; cv=pass; b=KWeB2ADqp+YoK+wXP/UAii41ieWTHn2UKoJ12RAGokH6qYxWn5uCIN0Ru9Jo4QFh7CwSUX0URIwz/wSL19ruCj4bNC/MGp7rZZQi1XBPmDLw67XPNBvjLB64wfGdtgIePgjF996ObVJQVAtddxOxRS2g4qSXcee9T62vlB349e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564068; c=relaxed/simple;
	bh=b5TXDuYo7Sg6BEFdqqSCFhdBoDD1ttufzjg1FLnBJmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQkGWVdHknzuZ32j3fvae6Pl6Ct4lO0Z1FhKxzQ4qse9Hp8eGPMDeG39AdF2dfkrIRsCYhsc+CXiTR8jNS3qd2mH0PPzR+R2uCseyJ9YLcWysNchSIRjbS7qb5dAeX3C1u52OfimyDUTp1Mt2MyyaPE9KxXnbHOkG7HL7ElRtHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UragofS5; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UragofS5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso27486625e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790564065; cv=none;
        d=google.com; s=arc-20260327;
        b=Iyf0VwVEdzxOaHjim9fmPS59wXHJNn1LTkT1/+idQoidueTV2IJ6izZNvN6qnXDcTy
         3cx95m9enFwBdBIWzUpovx5xKJqVbjQdwTcsqqnqzgNJX0Vsxt2zckBmf3spH8SPJX29
         dx9H44oF/Ie6VM8UCNHX/jETn76h862rvfYxz9Zp/6XM4v8YxJERb/p/J/BlUqMVEiJx
         BfvaAbsPc+fgAvdDhSK8IC7meUUnEQYL+7u97cM8tB1JT2bL1sxRUpkFP5VR0ixdr+tN
         NS2XbSSzzWc58/lf1PzLcOmo9VI6leECrev7WiRYxLnJMogh7TuINJOAyNkMTv+w2GJh
         x95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxSV4vyNJBxBq3nFqrv4BdTyhQ8t7NPAkYwT/z/Lexg=;
        fh=R7xY7GYNfhu0kw93o0XCjN+IKrs8N3zj1HjGmFSzeuU=;
        b=bKGuE/PGpAH3+2F0I5jR2iFUF+6Bf9M+lj4ZqEgMgLsUHEuZi7XTbLFBNY3rtW4EOR
         D1/Hc7jED7xf/CEKEqH4JC/adcjeYWkBpCopV4mZElOIUPZoQFfnZaCp7GlX+JLnovC5
         Ofadz8JNPu2/xwBDRMdcWU59AEIvo7P9sPODrKfl/3slIAKblBVQgpwC8ldWo/azTJBQ
         0gzPRjxu2ALcdfhaj/hG1DLonWbIIwK+EkOwK/afDmg90lfY2oPeKB3q1GOr+YhUC1OG
         iREFR3Dag2dvJWFKRO56/Z+pv2Z4LOAAUhorPENC8Ky90Ja5C4V/gVRH3Ouhi0LtCntR
         FkiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790564065; x=1791168865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nxSV4vyNJBxBq3nFqrv4BdTyhQ8t7NPAkYwT/z/Lexg=;
        b=UragofS5xLZUFCwGXgBlyF2l3fZG9DWCTIcq3+8Pyi4m+WBNJNdCUUIORCh9UJ7iCP
         2GGMAb5SCezF6Swyb7Uxmw8hNb6DP85cN9XIGpmk9KRT0tVCjMahguUgorPdAxqxEhz4
         bxNnQUPwRepwn1pMnkO3ie9rIEG3hbIExYopPvPbZxS3mdQFcJbn5nazaQMIGZbhS5UW
         102qT6zLzgDu5ck/+ildgKcWBW+pX4omwByIFLztOyjMnRe/f3oXNsr6WbkVZsvjwAAE
         RMEqq/HUVR1MLeWRReNVuOq5hpcLLck3jaKHvbjSJ/9hogSzRvtv+lNkxlp5hZzuxupk
         VuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790564065; x=1791168865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxSV4vyNJBxBq3nFqrv4BdTyhQ8t7NPAkYwT/z/Lexg=;
        b=DL8bwoPRFGPCs88nTDfMMmI6XhCSS/0zbi8zJAaDBUx45xftipCLlRwuGR62/nmIVD
         VG+oosgKlD7eEOAIxmeiGIfg+JiYhWMr2iHGh0GFnShoZSC7GNZsceidPLOBZb9hp2gT
         SdqsDVAambD61f7kNDnv+BZ2eyOsDzRz4LaJsNL3lqWvmd9VH1Sq+JAtCOaTaMUcp7yC
         K0jjwa2BqLom9U0kQ0HjvV7NKjcaiBeAGwNisUKaWni+9MwNXIJj1JZqy1tWODMi1zbT
         WUtdYJGtPvR6c8LrZ7ez1ELfE9CYAjJljD9jwf5heSavIFfTXQw/8QTVhx4KshnOTW+I
         aQ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwImedIid1EtHbe5LAhK8zMC+JjitMd6+KB3A8vNY1Kyc0YhFHVD9OPGn8gj2xTN+74r7E9wqvgXIoUwOY=@vger.kernel.org
X-Gm-Message-State: AFuF++nTF39J2ukX4bZ24dYyqW7iSXZBvaUwC/vz66V0Uo6JvOtN/zld
	7lQ5Uw40ffONn7jJT4T1lYAKIMu9XocpL6l06C9nD4KTlbbpdd+m35d+VWt9J2S1/b1RMrd09Ie
	P0vVSIGyJeZK47sU2F2WiNXnwvvPvJw0=
X-Gm-Gg: AYBFou2yVgoxO6/bP9gi80GnrOKjljaIRdLAVsXCIwjoOP0dWk2V1jpsfLUIamS0/S6
	VWWcrgkjiAwoYSAcbsZc7cpITPZG4IUzbaXmxnkMlJeFlQF3bJ/wnDB+vFM6uJJx1xJ3bJ/1fFD
	dKQDrI4jo7fYaYSdao4jKTN4/J80cq9Rg68NJw6hEdHGiXkPkGbBuVYLVPyOh+gPasbCu7FDWdb
	ZjEtcisWRg4K2Kz8aIdAnZosGWlUYyCpos83A2M3wsSkE+pGbHYcY1nk79AzdQNdlf/yEZs0qCD
	bd4f2xiimL/xZG1mwLKvbquX2Bug+ibkvLFCQKCaKbv7KYtTRHAS87J5Rvo8GqP029AaRexXmoo
	Pq33XLtjEt2lA
X-Received: by 2002:a05:600c:37c4:b0:4a0:37a:10de with SMTP id
 5b1f17b1804b1-4a0037a12fdmr33868805e9.24.1790564064338; Sun, 27 Sep 2026
 19:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925133922.1356404-1-arnd@kernel.org>
In-Reply-To: <20260925133922.1356404-1-arnd@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 28 Sep 2026 10:54:13 +0800
X-Gm-Features: AclHuK-ou0kN-TRU45zS6iIgo2YpHfgWbBR4MR9NL98Ver5TOLd1c-E0Rut4bh8
Message-ID: <CAN_Opa8F+vKAAckVi0+qi_yXrav7Dop5brpS=zr7Hw-XaAUL2w@mail.gmail.com>
Subject: Re: [PATCH] rcu: include rtmutex_common.h in tree_stall.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Thomas Gleixner <tglx@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Andrea Righi <arighi@nvidia.com>, Cheng-Yang Chou <yphbchou0911@gmail.com>, 
	Gustavo Luiz Duarte <gustavold@gmail.com>, rcu@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Arnd.

Tested on top of 1eccf02fb8d5 with CONFIG_PREEMPT_RCU=3Dy:

CONFIG_RT_MUTEXES=3Dy: build passes
CONFIG_RT_MUTEXES=3Dn: fails without this patch, passes with it

The failure is in tree_stall.h, where rt_mutex_owner() is used
before tree_plugin.h includes rtmutex_common.h. This matches the
reported failure, and the added include fixes it.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

On Fri, Sep 25, 2026 at 9:39=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The added call to rt_mutex_owner() makes this fail to build in
> some configurations:
>
> In file included from kernel/rcu/tree.c:5121:
> kernel/rcu/tree_stall.h:333:8: error: call to undeclared function 'rt_mut=
ex_owner'; ISO C99 and later do not support implicit function declarations =
[-Wimplicit-function-declaration]
>   333 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmute=
x) =3D=3D t)
>       |                             ^
> kernel/rcu/tree_stall.h:333:48: error: comparison between pointer and int=
eger ('int' and 'struct task_struct *') [-Werror,-Wpointer-integer-compare]
>   333 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmute=
x) =3D=3D t)
>       |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~ ^  ~
> In file included from kernel/rcu/tree.c:5124:
> In file included from kernel/rcu/tree_plugin.h:14:
> kernel/rcu/../locking/rtmutex_common.h:231:35: error: conflicting types f=
or 'rt_mutex_owner'
>   231 | static inline struct task_struct *rt_mutex_owner(struct rt_mutex_=
base *lock)
>       |                                   ^
> kernel/rcu/tree_stall.h:333:8: note: previous implicit declaration is her=
e
>   333 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmute=
x) =3D=3D t)
>       |                             ^
>
> There are already a couple of inclusions of "../locking/rtmutex_common.h"=
,
> so assume this is safe to do here.
>
> Fixes: 1eccf02fb8d5 ("rcu: Add running and boosted indications to RCU tas=
k stall dump")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I wonder if it would be better to either move the rt_mutex_owner()
> definition into a global header like include/linux/rtmutex.h, or to
> move the code out of tree_stall.h into a .c file, as this feels like a
> layering violation.
> ---
>  kernel/rcu/tree_stall.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
> index 5dded1e89197..803a56af3259 100644
> --- a/kernel/rcu/tree_stall.h
> +++ b/kernel/rcu/tree_stall.h
> @@ -12,6 +12,7 @@
>  #include <linux/rcu_notifier.h>
>  #include <linux/smp.h>
>  #include <linux/rtmutex.h>
> +#include "../locking/rtmutex_common.h"
>
>  ////////////////////////////////////////////////////////////////////////=
//////
>  //
> --
> 2.53.0
>
