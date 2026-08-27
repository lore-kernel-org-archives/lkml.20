Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1BF38737B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804319; cv=pass; b=Z5oEfWMUDzS+Br8JpKUgFeK/iknZsnm1MuhgDAPVvpNATgp4vhMtgeY9bA05IuJ1slZEwSYtNpvjB1SuWovkHMtj9OgCchEtSHGrT4Hnd5c0C+cclRxhoIiIGzCYeyaTStNON+JerHqwd2MZWIzyJJUTVnetbOQ7NQuZnXOKMvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804319; c=relaxed/simple;
	bh=vAkpENEL+aCJBuN6dUSQpHeziG23/MMgcrkzCZbrvzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4bvCQIkVfd+g+xuRuoZk7AviJ/t2nW4bTsrYY4fBi1w4vnt59W1v0ehkOWynwy1wzNeciMmYsbl6m6x2rJ8JjnOEquTapcgtleL0LuRgIkDiIXGVwQY4ONvr7z1ZhqBzGYiuRFFR/S7DuiKLyCX+GIchaJM2P1Auw0WOC9zuPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZqajruhA; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZqajruhA"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-73720e58dafso959603137.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787804315; cv=none;
        d=google.com; s=arc-20260327;
        b=jy4LoT0FDyyQV6dVfct97tOQLo2o6OvRXmsLh51D5jWKie384eMM3DRmSYR9E4hd5n
         ySsuoN/OphWFB2+1KiACup/J7GrIgS+EK8rZE87qnVSqPToQgPUZMj/UOPgpxx3CK1qi
         20fo+UPpMkKaXgSQm6lnzd/xzK7WoFZ6jfDGKTLd5V38t1VeynJmxdNQ/uYOWs/cVB6T
         y26uoeqZDloX2OHC8/qzVCbOPbawBvdR9QKz+wmfBD8fX9j2PmEHxezHQcYEVVzqS6y4
         pHWDa5oN9KXde8o4zBfaL0H8X9Syn5d42+As3KlLnF0vNFBr3Pvqnzt9jnls885+1G07
         NCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tdkvt93wxjyIEopPoQNCDcgWpKE+IyMU/m+EhcZoeq8=;
        fh=PwxCk89ySqUTYn2+uu5QizB/ixTWjY6nTGIY+VxnPrc=;
        b=Y1fvsGT1mOVbD3w+VFUEEZP2sTova7ovi4q4+DetoGdIqPOAuCixCpNE9W4LatrY5V
         0ufACvX+KkESskqraz7hUvpE/AI3o7RQgtsn3wkz9FLf8m9v/l7IWbaYi2m2ccAlm04L
         d7cxDK+DD5Ap+RN1AAFEMg6DdJuRS36ZT2y2mzBVfihA1knP+ddf9X9lpgTBUlYRMGto
         sAIXXmmb5Pjs3nHpYCVI5U7XGgzGbTwP5CEiewzGdpmWzHNDxDQHGmzBZf9pjoNifaCV
         xlmOavrNSMyb7rVa3HLoH/r+fZXX2fJbDZTLjMym8uWhEiFeFDcH3cS3dD13zTMIh3cO
         I19w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787804315; x=1788409115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tdkvt93wxjyIEopPoQNCDcgWpKE+IyMU/m+EhcZoeq8=;
        b=ZqajruhAAWYYYQhMXzyhdyG+si8j3ZjzLPNpHv2Gym4Qzb8APtcj1L1VHDVXvgdJ7Z
         kY6lKx6FDw9/o9EqV4eQKJ/C2P0LoaI9Nk7dGd69MxwbCvfvv84f7Y9UTguNRjdC53p5
         RnGJL1uNIbZomZJNDlG7VTtG0B64QV2rqcfMstCAhaQO/4URwy76MncEmbn/tuX5peNw
         aix2Mm9S18vsUK+cvCkGffXpYkz2Y+Tvd9jzTb3E15cQP0htXsfaMrwJuCVMu5fbP9ID
         ae0Xm4S5GGm+KJ7VKOKyXeqmbfsH+ngbI5ztE4mhpihqoFoQHu3p7015mqVQrNtmdIo9
         Rb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804315; x=1788409115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdkvt93wxjyIEopPoQNCDcgWpKE+IyMU/m+EhcZoeq8=;
        b=ZnFn/A47wETUdj1jjIq05gVY1ncvr0C/RHuAoPyL5naNWGDqzpAMgEaDRiieNVCTVF
         5CJIILUdFAcc8flcJfOI3F6F5QpUhbwIzTc2QvDeOQABdcp8VDxttDVaePePIJDA1qXl
         7DofEAk7tQrwE30w2lrYzZe7yChzxhLehtvNmMWYWRz7AcOqA6E2puDHstbquMyt4ZbL
         U1CE3Kf4hj4t77K9t7IKFExdvj9VHpmU6TAfxpmd6qXzwfdavuO1IDgkt0Haihs8EZs7
         h2gA04QiQ7n2MFs8+qgs6opDPRM1wrjp5G3hPA+CqU7bublF5o+dRQocX7xGiimVMxRf
         5sIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTr1GhWLH+F99waT1J881OSbsTPnYosovKwY0jiRCmlJVcIIVNZE3+F2u6oZVHsYv+b/kgYNwjvjPsQM8=@vger.kernel.org
X-Gm-Message-State: AFuF++mnlvjBGwyeX/SO2H4GLDbQ2O/NvfEJVahevja4fo8D9iE+3CWi
	ZIpqrEzuCY5zATgHOacY16zTQoJ8J4PMHrfmbvP3Xo6juEwHRlGvxc/bZT8JXAWEFR9c7V36W3s
	yqhfgA0+ZZHkcnmMJPbTO561Ofb3zh4OZykhmGPM=
X-Gm-Gg: AR+sD11JtsaNRFHIbdkLWX0+5itrhOSFq+R9OyLngtYacvLzoz9aKyhOK3o5VtwMU2P
	zbcfqqNZniZ/XM4g6HuZziEAh4u4D1KkPFosobETTQIlQdxDqNCDfgbVm0Vo10Jo9VaO/GU6TJ1
	F8X2vEVmA+nvNrRLqkNe2xhRAHyfIEJMVqDFFW1mgm48g89AF+wleIt+yhfWzdTQn4wX7tkgk9k
	yGOHIB5YaSashInZbrszIB0+wUhc8jwQJVY435DlC5sM4YoNJzvo25Pa6C3BFFUiIQA1gkf2Niu
	5GSfOW+yvqev6rj2FMsCM3u+m/Fbanl+laxYnRiTUcOWwaX2TxntIhsymTCYHqzNKuVDXAV9hy3
	m84AtpeNwdg==
X-Received: by 2002:a05:6102:848e:10b0:783:cba3:cf0c with SMTP id
 ada2fe7eead31-783cba3f1f3mr1743406137.6.1787804314889; Wed, 26 Aug 2026
 21:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810204118.1981755-1-morbo@google.com> <20260810204118.1981755-2-morbo@google.com>
 <202608101716.FB6205EA50@keescook>
In-Reply-To: <202608101716.FB6205EA50@keescook>
From: Bill Wendling <morbo@google.com>
Date: Wed, 26 Aug 2026 21:18:18 -0700
X-Gm-Features: AcwNN1VUOYfbScz7X7OOfAgR-_09E5r2bsRAMzD6g11t2BR6ucealC6FacdfVSY
Message-ID: <CAGG=3QWmzsUtO2NMy4d_=qpyEfmeaojt8mjZh63V4Ep5vGLmMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] vfs: Annotate struct fdtable's fd field with __counted_by_ptr
To: Kees Cook <kees@kernel.org>
Cc: codemender-patching+linux@google.com, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 5:18=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Aug 10, 2026 at 08:41:12PM +0000, Bill Wendling wrote:
> > The 'struct fdtable' holds the file descriptor table information,
> > including the current file descriptor array 'fd' and its size 'max_fds'=
.
> > To harden the kernel against out-of-bounds accesses, we can annotate th=
e
> > 'fd' pointer field with the '__counted_by_ptr' attribute, referencing
> > 'max_fds'.
> >
> > The compiler uses the '__counted_by_ptr' attribute to track the
> > size of the memory allocated for the pointer field, enabling
> > runtime bounds checks under KASAN and fortified functions. There are
> > three places where a 'struct fdtable' is initialized, and in all of
> > them, 'max_fds' is set before the 'fd' pointer is accessed or assigned
> > in all allocation and initialization places.
> >
> > No accesses to 'fd' occur before 'max_fds' is set, preventing any
> > potential runtime false-positives or panics due to uninitialized count
> > fields.
> >
> > This patch was generated by CodeMender and checked by submitter.
> >
> > Cc: codemender-patching+linux@google.com
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-fsdevel@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > ---
> >  include/linux/fdtable.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/fdtable.h b/include/linux/fdtable.h
> > index c45306a9f007..3a5c88291125 100644
> > --- a/include/linux/fdtable.h
> > +++ b/include/linux/fdtable.h
> > @@ -25,7 +25,7 @@
> >
> >  struct fdtable {
> >       unsigned int max_fds;
> > -     struct file __rcu **fd;      /* current fd array */
> > +     struct file __rcu **fd __counted_by_ptr(max_fds);      /* current=
 fd array */
> >       unsigned long *close_on_exec;
> >       unsigned long *open_fds;
> >       unsigned long *full_fds_bits;
>
> I see the alloc_fdtable test, that's one max_fds assignment, but I also
> see dup_fd(), which does the assignment after the newf allocation, so
> that looks safe too, but it might be nice to add that allocation path to
> the tests too?
>
Hi Kees,

I added a testcase for the 'dup_fd' path.

-bw
