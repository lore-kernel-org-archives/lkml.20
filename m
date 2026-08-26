Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E2391842
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743740; cv=none; b=ta6HIfnb28tRjgb84kepYerB+CGs61pEvkf/CvFa6JkTh36ctooO5LVPaaE3a4aYySvTjy9utsEeE/7OrLEGxemTgzXHCrH9fFuxv4OUoguQg8BgviyvwAIYkweddQES0tOPMTL5/IjIfxTZwddCFlLqKbNWSoES01LOOMg4JR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743740; c=relaxed/simple;
	bh=hBELgs6oLnJv6ZedX2AgStFlAi3b94Q9z+VxuI2xPeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFcL8QFdHegWlp9gXiEvK9FDK+AjN+HSqKeEdR23StLlFJBQVv6SMSx6etPlK0TV7QmhQl/v8kt4omIhAT0RQu6ZgK3umJvCwqCpiiN5ib9bFZl+Y1l7uOCGBWmCP/+TEyBf22d+9DQ2SNaGgppY4J46pitEEKab4XE/lHdfq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OEXNZRBU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OEXNZRBU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6b5aa7535so8635725ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787743738; x=1788348538; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt0ASMSpg+qP5hSMqnRIF71XeawcwG7hVoAWpM6hV7c=;
        b=OEXNZRBUpZh75crT2KjpS3Fs2/KL2dPmVf2fHMvlzvNccKd2CQsRK2e2uV5V7OnEHG
         JaXumRkmfXeDrt9FBaf0UkaQPotXd4oDI2HNLBjvSi+PP4n9XewjAAvrHeFSo9akEhS6
         Bfd2JjKjQErVFZ/CeqM8p1niIxm51/vTMHk30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743738; x=1788348538;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pt0ASMSpg+qP5hSMqnRIF71XeawcwG7hVoAWpM6hV7c=;
        b=GriLc3i3tva9Fq7TkXM0BzSs0P8BWi6RRzJGeX6CqrrLS76FNIB+oFf2GnqDKOBEzQ
         ot7t/RMR3dNvUvk6hlhcEb3WMOLCD9ISx1c2IlzMwHIdY9btuv/iBBQgaSuSISuaKitc
         GkXu5Wh6PlCMZ2BEZgDGS0cUjU04OtnuXeVjs4bHM5PEY4gGcINhIw68ZFUzpkavvqKd
         BCf2iFE7JoomNPPnVfZAz31B8mEEfdCoqdgpV+LYc60+hMFS2vlX8UW7pVp9Iqy36Itp
         5ANpNyR5nn1ijVuual6WqKjmN43EQ0SAhQu7sf7SVxAUT6PsxKR+2y5wDn9WWq0qQmi/
         jo5g==
X-Forwarded-Encrypted: i=1; AHgh+Rpj1TNJjoFl97XWC7dPtYnt5+5lZQqzOWg2z2cY8rt/OcGX2qXDr/J7e9UCWADO+xbmanBD3XfY6U5dquA=@vger.kernel.org
X-Gm-Message-State: AFuF++macOegInBwp8KDo9xWDRRhX5MP2C9078pylaVEkwVp0ujsO9Zv
	CpDqVs+pnl1gtugCfb273yOYroBnIw6kSEXoSYm69MvOBHJWMBp6z+ou2iny6Ti+3o6xV8p9eVm
	UgAvmB0wR
X-Gm-Gg: AR+sD11IG00C6YoKS9TDfy0vuywO9uGirCUPXiW5TgZABPUrfCPCGe+tgwQYskq+Eld
	ZEJIi/IpetMrPRTE5yjkC1q8apisBZLcKRadK/zhIODHsK20DjB1u/UVRqke3E0nnmYEJdfCfTs
	eUZR9Wx5CERNHxFFM6LiYzQe6w5+32kNorblnoymjpB8FH9BKrfj8xEb7ADvpORTIV+Xx+fDO/d
	XAQuvEIKGmG9vN0opjPZ8/AtIOQJlNz7txgMHWvAOXASenuu7yMMZUfEcipI3hn4rRQ/DXUhINj
	O9xIaTuHFZ/eJmyCTJLDxAHz1SRYjN7lunaWtV1pDUpZUWlS4078t4xIZkGeWznbkwD0TJPK5F0
	zkq4s7UqhAPr+VyoWd/7q753/dtoa88bfzXNrSLao0hifIrUfFm6wIo6w7+iPBfFLLyr5hUx+OX
	snYIRSYjtQ7Vb4Bn+heYZE+S1cESVClIxva9lKEDRcjyBFULJK+Cwsf7d9c8MKMTpwk+Z+Myl0H
	Obz/TgJPBfzz6Y84YCU67XSCw==
X-Received: by 2002:a17:90a:d2c6:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-3966d866cc8mr13718185a91.11.1787743738226;
        Wed, 26 Aug 2026 04:28:58 -0700 (PDT)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com. [209.85.216.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3965d119724sm5603116a91.2.2026.08.26.04.28.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:28:57 -0700 (PDT)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1090203a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:28:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrgnOqcwTF+WY0nTMuj3Y7Q194/ribMsF94w1AGz6rXqF9s04qOHZtF/M3Ov6JW5Q1cayGYIGhnbUH3MrI=@vger.kernel.org
X-Received: by 2002:a17:90b:4c4c:b0:37f:e326:6557 with SMTP id
 98e67ed59e1d1-3966d43edbamr12169733a91.4.1787743736546; Wed, 26 Aug 2026
 04:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-unqual-v1-0-7024fb81b4f9@chromium.org>
 <20260825-unqual-v1-1-7024fb81b4f9@chromium.org> <20260826105527.7ebbb4b1@pumpkin>
In-Reply-To: <20260826105527.7ebbb4b1@pumpkin>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 26 Aug 2026 13:28:42 +0200
X-Gmail-Original-Message-ID: <CANiDSCtKVT9fnkx=-d2-aOd=uqODERFw-fAm6bg2eX=RXGMaXw@mail.gmail.com>
X-Gm-Features: AcwNN1UB7EM_dUNSy2wAOwSUuHUNku7hqUwMzvFGHVMir2-Vyi6RHy6W32JN7ac
Message-ID: <CANiDSCtKVT9fnkx=-d2-aOd=uqODERFw-fAm6bg2eX=RXGMaXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rcu: Fix casting while dereferencing rcu pointers
To: David Laight <david.laight.linux@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Dan Carpenter <error27@gmail.com>, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David

On Wed, 26 Aug 2026 at 11:55, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Tue, 25 Aug 2026 20:02:10 +0000
> Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> > index 44c07a66edff..80276cedda80 100644
> > --- a/include/linux/rcupdate.h
> > +++ b/include/linux/rcupdate.h
> > @@ -488,7 +488,7 @@ static __always_inline bool lockdep_assert_rcu_helper(bool c, const struct __ctx
> >  context_unsafe(                                                              \
> >       typeof(*p) *local = (typeof(*p) *__force)(p);                   \
> >       rcu_check_sparse(p, __rcu);                                     \
> > -     ((typeof(*p) __force __kernel *)(local))                        \
> > +     ((TYPEOF_UNQUAL(*p) __force __kernel *)(local))                 \
>
> Ugg... TYPEOF_UNQUAL() is absolutely horrid...
> When __CHECKER__ is undefined the whole thing is just (p).

About using __CHECKER__: Are you suggesting using #ifdef __CHECKER__
to use TYPEOF_UNQUAL or the current code?

I am open to doing that, but I would like to hear from Paul if he
favors adding the (also horrid) #ifdef to save some CPU cycles on
older compilers.

>
> I suspect reducing all the definitions would measurably improve
> kernel compile time (even before these changes).

When I checked earlier in the other patch in this patchset, with my
compiler I can hardly see any difference in compilation times [1].
This is probably because GCC15 direclty maps TYPEOF_UNQUAL to the
built-in __typeof_unqual__.


Thanks!


[1] https://lore.kernel.org/all/CANiDSCsMrULsrGQg76x28GRXLg+HSKFWhhA14Zcn8hdm4KyOVw@mail.gmail.com/

>
> David
