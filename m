Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9D751CF79
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663591; cv=pass; b=uMPHA7tvJ1tcys1tEiQlg1xREE37auMollu2UqsrcwUo2MShPlLGjgktO8tTNiTtzDT69S4ogxCNIisilohMqwaeO7uBozy5CirWwguE5gW9zcE1xP7Pu8QjoWRi58doOHe1ojRGBmeKEjpHK1DV9mmCOEj77GaxMZLUMc+JFFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663591; c=relaxed/simple;
	bh=eYYWM3K0Z9Uro9HwA9hQ8je2naly/JqA+zNhzp9DrpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAASJWPZDBWuU79tZ2BXC3K4ANFODbarYF50cgHW0oaB7qfCBpRy+7cKQsBX1PzTLnA0MoEMUpSBl/+qgwTaY3GYn9Mk7lcL2M8kkLZCXPs7/Y3rFu3wMptQNZrtcyzvqiXPbrca0qWneV7HZ0Q9/G6dyKs+1e3zK13Ky7hnN3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTTX6g4m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H200DWtJ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTTX6g4m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H200DWtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
	b=ZTTX6g4mYj0vlRM1lqShOllZvQyzIx2owUz//QT3uX3LDPwvQ13gLfFul3EjOEEnhQRL8+
	IgQ/7XdL20/z2P4kFnyzkp7ERWfZuLKKKkUCSaqJIXTrE/hkbCg/FbDPz+nqS3uMZjRKFl
	rRIN2A0cBVjwRsvMvG/YvP3IE3QaPqs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-_biktBNkMUKnN78ev1dirA-1; Thu, 17 Sep 2026 12:46:26 -0400
X-MC-Unique: _biktBNkMUKnN78ev1dirA-1
X-Mimecast-MFC-AGG-ID: _biktBNkMUKnN78ev1dirA_1789663585
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c29bc25836fso139656266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663585; cv=none;
        d=google.com; s=arc-20260327;
        b=ZftGcjQoHh2W7voDXJ60k9RyDZ3i6C64k4nSP0ClssbsmssY99ktzNPcrAIrdmx953
         jTtPnkXZoYYBeEv6B3DzsENczWC7CaNm75RNarKIUG43Pj9LvVtkF/nnRMOYEpxxQVVV
         a+abiRYdNmFapRqjfHpKe8xSRqC8VA0AN/JTQ+4yMSPsfFYejhI5/WuAnsT7BieBNJrW
         6Gry17bCkORArp04hek14lIm2FJ0owZ5qRLAGQbToujt+pysYvhgPKbaWkwN1cvbvJFc
         rqlAUXeF2ReVYTNLp+nB6hv8tvc/pPQRFL+W6YCk+ANX/yVoxx44V6iwo3EM4Z9c6lIy
         uFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        fh=YWlXEUbBDmrTbcwAL4szVh5YYHemwpSHlgjXyytwIoY=;
        b=q1OTFc0cJivRobRHknm9EmhnCPeSfA3WgceZ7z0e0+UQRCEpU1gUwpz0L2qJf5b00Z
         X5R4vnBRpkeme5EhwCG/6Go2Jm2FNCEhx/zZ5F+1sxixxlln0BBcMumYhy/dB2rqolRm
         6pmSKlJcuU7m0MO7oMgRj9VWXbXdiiEp4+3uz1nTXowsXWJYFDNjszbyl7bRHhD1Kt/o
         RA0BlK8LsXkWpnFvEBSji3+rZecBbyucd8S4C587Y0SlMcLW3qZe6BDJKH4cFv/hrkAf
         /3yUADP4hjqn1AI3MT2NtwLhDiVGEB2kjXeeAjDjf/w6y2SIb7mAK8NYTLV34Mwz8w8C
         Rovw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789663585; x=1790268385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        b=H200DWtJICF9QH6JHKN/nmm5tV86eiUouPYi7aafDRycxl6U169OnOUHb3rKCENsez
         +0RXYTDalsgbqK5ghOadRO1Q8ILIs3srTU1f8QjOTFAsX6a0xyq2jTukvLaLDFgK2T3X
         nqWiLKjVhJUi1FY9XS2W+MFSI/Yfh90CWlNqT5+QBG5KUeK+wYo2J2lpSvjs9TNMBe+y
         xQ+ptvfiXIvmOWzzcDpd4BoaAXwTWRZRRuQ6ZGdvEVm7fpOJRHQ6Y+CSZnj1bU6AMMRf
         3uQUC6XuxCuwpCc07yBmfv3xF+IN8gmARl5UVfqxlHr6om+vwq01CYDReMmqjLfntZU/
         SgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663585; x=1790268385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJkyJ4XReVojvgclcE9i/BeATq3QWWN8a1a2t1DdhcM=;
        b=KHPwS1e0iwnPuAgkBLw40x1PM7Wazoyl7G2L7wYjtTflkAtlzKgDJdM06fMkWegVb+
         gnhvfijunAjUeakqozl3xX95OFRFi9GwvWi4O7Tf0peLIrNsdntuBaxIVmgw3sep8WJs
         gT0mu69Vtbg9ZaZgOU8IpMWN6dqxFzZ8EggLLTZbu/agK3Nif3gix9pp/rSBRM7dY6l7
         UmfvpgLP4Si2JeaJ8+RbqmXvEdtZQnfZE3uxEJ3mQcGbfW7yKWFX9VMVWYtHCmP/6Bkk
         6vKWVnS8s6fcVh3/WHRFVimNO5/kQyiRbxVui0xpjon7xGOSbI0kuCVL6oA/AuOxuBq7
         +/wQ==
X-Forwarded-Encrypted: i=1; AKwUvBylnvakmPaD7DxQ57KubHiu+sZqRZoNMleWPovT0+ehuLg10z1FfrYk9xQj6fPuRgli+cKDiTE6JRBhpR0=@vger.kernel.org
X-Gm-Message-State: AFuF++la5aCtiYjyMAiRLDtrNwlrEdx5uadSauHNCadL991sySKuComk
	ZmF9/KHvqvjUEAc7JOBjOaP3pAI5GARiTZv3zfcQM38faJWK+ZOr1uoxYc31N2Ul9gMYS83i2Z9
	k/E91SDL9lUF7809UjSsHcroKf6NFPj3E9Q0CVa9NXxqSz8q5+/aCJPPPDrevnDMQgJOKryFOpr
	3KjHyt321f0fhfbpaE59HoBpSAKmidkrj1xAcfenE9aRuawDIsYHo=
X-Gm-Gg: AYBFou1GRsgwSl72z8Rk0pyjajcLus2bF++4xYyHEZy7ZhL2F9bGT84iY1BkY9ju75K
	beI5sepvkIhlwPd/yC/wmKoDMSNostR4DmkCDXP1v1uSFXJRUmLQAMJbDLEWE72MnYY3nFN6Apj
	hb4YC+fyN5lN4irdxOQTw99hs+dW+WQalnPvPkij4WsfwwK6HKDZY2bi5RmONW2B6kerZr096n7
	BxsVplIaGGtk3D/t684dj+st4VYyg5qfz8NzVH6u7KTDzF6ZSbP63bjubcLCH6txO6yhzkFrpL+
	xNA=
X-Received: by 2002:a17:906:4fc5:b0:c26:19de:9ad2 with SMTP id a640c23a62f3a-c29e53184f0mr504528566b.42.1789663585528;
        Thu, 17 Sep 2026 09:46:25 -0700 (PDT)
X-Received: by 2002:a17:906:4fc5:b0:c26:19de:9ad2 with SMTP id
 a640c23a62f3a-c29e53184f0mr504523266b.42.1789663585091; Thu, 17 Sep 2026
 09:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <b4ab47d2551d090520b4fa81a884b5988b9655c7.1788351089.git.rrobaina@redhat.com>
 <apkuNj1paR_GO3x9@willie-the-truck>
In-Reply-To: <apkuNj1paR_GO3x9@willie-the-truck>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:46:11 -0300
X-Gm-Features: AcwNN1UTQywdGW9xqj12KwNHAYLGfDNNso402GZvP3WcYYwXGdDJ7Oiz7qML_cg
Message-ID: <CAABTaaCoNztwDUA-HPp4LaikxL4dxk-1bvCCpoZEGD4rnds1oA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] arm64: pass pt_regs to audit_syscall_entry()
To: Will Deacon <will@kernel.org>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, guoren@kernel.org, 
	monstr@monstr.eu, tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:22=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Sep 02, 2026 at 11:43:37AM -0300, Ricardo Robaina wrote:
> > audit_syscall_entry() now takes a pointer to pt_regs and extracts
> > the syscall arguments itself via syscall_get_arguments(). Drop the
> > individual argument registers from the call and pass regs instead.
> >
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  arch/arm64/kernel/ptrace.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> > index f743cbec1c3a..65532b2a8cd4 100644
> > --- a/arch/arm64/kernel/ptrace.c
> > +++ b/arch/arm64/kernel/ptrace.c
> > @@ -2476,8 +2476,7 @@ int syscall_trace_enter(struct pt_regs *regs)
> >       if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> >               trace_sys_enter(regs, regs->syscallno);
> >
> > -     audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1]=
,
> > -                         regs->regs[2], regs->regs[3]);
> > +     audit_syscall_entry(regs->syscallno, regs);
>
> Acked-by: Will Deacon <will@kernel.org>
>
> Thanks for doing this.
>
> Will
>

Thanks, Will!

-Ricardo

