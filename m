Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7953ABD88
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092772; cv=pass; b=BARHlXaKExcrCJvyeBQRxTclLcq7TMacOBv+YNB8IyxEP1jty9rxM0nuhrXrFU/i3xB7wCCoQNVmoPcwz2wHYS71tL8adgcz8Zd9JkirhTAF7P+daqDRARM9Hjp9JJgpDZSO2HsWoiDpvlC2vh0c08Bz4VKWKr12oJOV2A9UWIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092772; c=relaxed/simple;
	bh=W8TGsM/T9bEot6PcFlfqO+Xuq7MZR+MtW3iaazVspZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIyBmmxKsPLKdWxcfgMkAW2xbeZ3eGgDR8H65l3CWldYuSW8eDzq+Su7hGDulrVUPRbs0NOmdn9zmWFvxUJB7AKXi5Inn4Fnbl6EMru7AEcp10I+VZnNv1XIB55FjGBLMuSbD/9tEcaaTxz4zmrgzSYYRtE1COgHNC4hGZaqXyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4OKw39c; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4OKw39c"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso3988985e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789092770; cv=none;
        d=google.com; s=arc-20260327;
        b=q+/6YkMSdoJyp+/gN4swLMRMM6XYHNj7rj30ypk0YXgOLt7ks2Ar7sNOzvr4FYjWm6
         +JP0oZU2kTMRrWCuDPO1lq6sLykDbj6TTmXVZWw4aKIJStv2wdUuscFihRJ/Hug98vBy
         hrM4KIx2dmfZAlCULa3e4C1rIIgkXbVMPEMxDNuj/5Eh4lXXKiDrzFdzpCyTCsH/K5vX
         5HyFrGjk3piQWSr/0GiPGN/QyjV5E1p2aMzGJZaCV9vExl/7s6jf0O4hz3xPAR6XFK66
         IPDRzBH55x3vO0aHk7L74aJ0eQQZvQePZgWU9E/wVc47yN75KY4prqkw8jymGqMhb7UZ
         vVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8mOo+6Yi+Vdbpiw8piBG3s4SxJcYL8u3WjZfAF02iRQ=;
        fh=Cz+2vGBrui/AnfPOVPOJ0wFlFXzA2vaLg2sPe7euhvg=;
        b=PkNQcLaeeNhuxGnSElR5x8VmrSIvyGMzN37owR6Ule/KxCIZXcSnD1Fe+PkuMwSi0y
         RLKCyljh+QJb9VRQVGRh353M/popy9Ux+oDutb7XwvziTMh/pt0/JMzkTXQIHc28U3YE
         081G2oYAwl1Z1rK6RW3omAko/kp4qTDpWLlGvt53npzECoSKDH13bAco9aQx65ADKjOy
         a0jprO8XYNuHTPeR+H4XgL1C96bKKpfSbmWbMunwnlZF689VNCjnL04dmGiR/KYnlTQP
         RiWM2+NPBBl06tDIq0jjTtar6FKzT386c5Pe82m07owE0C1RPNErS3G6xUUhWLp0aIYw
         pUzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789092770; x=1789697570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8mOo+6Yi+Vdbpiw8piBG3s4SxJcYL8u3WjZfAF02iRQ=;
        b=s4OKw39cO7ThIstQ/RUpBdz5fAzXES5IB9EKfXWknP+tL2gZgUTMl2xJ+vm5y3OD8b
         KPkZ9HGcfrcKPXS5RnLcTeDaQpRhATaQgYMUYUtXmjEJXDFjJMZFNR5HhwoEnBcv2wIz
         b7qqfxReTsfusE2A+PmFaxCyQu0ZkjQdkGn0jewXgO+xUPI3Apy2NU0Y+FKPCXLGN4Hp
         jndQpS/XdmbXJHNhiC7vkyaM2AB5YUh6bfadBonj+ouyCDLFqR43H7N15+UydLyTngIT
         D0gNmDQ/A/sLL3D8ODjRqbgqL5dizAMThEw6oYh+DLvb/+qmKu0T3yRpdyvfF3lL6LA9
         S+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789092770; x=1789697570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mOo+6Yi+Vdbpiw8piBG3s4SxJcYL8u3WjZfAF02iRQ=;
        b=d9moYZKofTHixpJkz3JNhPQtNltEuBVWrpfd6dLZoM07hxTQKcLj6bWsdoFZNMGJDl
         N8yxGWtD06IMx3dWcyiAyfDY3rEmo/JCGRRhZW6qNxgT0T+zkShkIaLYgouHn4UVBt+E
         VhPdpvzJwDKVlgz7h9cKAxMeMCNo1uXmGsvp6Sxvy6+QyzRJNgE3GxDJApGftUH1Uvxs
         tKeeMMIHN07pgOgJWfLCJtjYrRrYgFGObBpmi6ZPeb9Hos17wLhpIv8qQqZRvvtFawZi
         zh2iwvqz9JBCZjvLVxC9lQ3oZ368hWiaTFsbwaphnHsQvRH7JwP144F8dEXIk+rNkL6x
         oTFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdRWZaX8QeLcRvrOwi25+qTp8xyKOSAa6yPfsddqNIAJTHlust1SB+tLd0ZorNLXcUyYHxIkXX+wBlSdo=@vger.kernel.org
X-Gm-Message-State: AFuF++kCOxCE5HyzRo8O+9Al6QfQq1cDQud8pe0KZWmL3j/S9xtDtGUn
	brO99kcp98zvMpkHZDi6364aJcAzyOylncIS0B1/cZKpweIDqDOsp7eCM7wbWDjRcaaCSnbKMOU
	GSUIj5iA+eonCJwwKt5Vm7D1oJDR1O8A=
X-Gm-Gg: AYBFou3jNTf2nEGDnmT1FPVdjozpGwwJFQ9rnovGU0iyBAzPlFwFq1RUaii0i5d36xE
	WA+8ix3j27gzd+i6eynsWPaaoRX4h64lM9sxiT3/ZRdH7eWfJQg0gSCFJa0O9G9XPUAppZNEHl6
	w3nDXLYHSK9g89vcIsSYmwn+cFf+DmG6pSQzLizVCzWs+UYPlcm6bW+B9YiqsPFUFFdWdHxocaf
	Pei6wqudygZhP7DXE1J1+dijsmeINUIgFleviUdAqay27c1ZUIui7Lncf0MvR9bSTO+IQRbO/IE
	nDFgaDKjav1jD1dWEN3KnaJT1sZ/mc9Vg4jI13DqUUK2rsVRLBg3F55w6k8/F/e41HTxPADJXKP
	yhHqTYfb7BzH6Vw==
X-Received: by 2002:a05:600c:b96:b0:49d:1916:59c7 with SMTP id
 5b1f17b1804b1-49e619831a9mr19159215e9.7.1789092768884; Thu, 10 Sep 2026
 19:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910041427.3579817-1-kunwu.chan@gmail.com> <8d55847a-9e4d-4f1e-95bc-4dc77bea73c3@paulmck-laptop>
In-Reply-To: <8d55847a-9e4d-4f1e-95bc-4dc77bea73c3@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 11 Sep 2026 10:12:37 +0800
X-Gm-Features: AcwNN1V14Y3VGCOr55XZJ1Ue8Iw5GojN4B1xvmAJNoEM2UoU3zWAXHkGGTlTvRo
Message-ID: <CAN_Opa-jjwUOds2QqCbgozKjzYT=wzQV+k7ak0Wpk3Un78aq3g@mail.gmail.com>
Subject: Re: [PATCH] srcutree: Skip torture to-big transition for atomic SRCU
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:53=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> On Thu, Sep 10, 2026 at 12:14:27PM +0800, Kunwu Chan wrote:
> > Atomic SRCU does not use the srcu_node combining tree.  Exclude it
> > from the SRCU_SIZING_IS_TORTURE() transition in
> > srcu_torture_stats_print().
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/rcu/srcutree.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > index d462102c6bb6..99d11fb4123a 100644
> > --- a/kernel/rcu/srcutree.c
> > +++ b/kernel/rcu/srcutree.c
> > @@ -2421,7 +2421,7 @@ void srcu_torture_stats_print(struct srcu_struct =
*ssp, char *tt, char *tf)
> >               }
> >               pr_cont(" T(%ld,%ld)\n", s0, s1);
> >       }
> > -     if (SRCU_SIZING_IS_TORTURE())
> > +     if (SRCU_SIZING_IS_TORTURE() && ssp->srcu_reader_flavor !=3D SRCU=
_READ_FLAVOR_ATOMIC)
> >               srcu_transition_to_big(ssp);
> >  }
>
> Much better, thank you!
>
> Could you also please add an "else" clause with a WARN_ON_ONCE()
> for ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_ATOMIC?
>
> This is after all a user error where someone said to torture atomic SRCU
> but also said to transition to big.

Thanks, Paul.
Agreed. I'll add the warning in the next version:
if (SRCU_SIZING_IS_TORTURE()) {
        if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D
                         SRCU_READ_FLAVOR_ATOMIC))
                return;
        srcu_transition_to_big(ssp);
}

This keeps atomic SRCU out of the to-big transition while exposing
the invalid torture configuration.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> >  EXPORT_SYMBOL_GPL(srcu_torture_stats_print);
> > --
> > 2.43.0
> >
