Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422E33D512
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788819494; cv=pass; b=UamHrXgXbavaKsN98qdUYa0CNT/7SdeNmasrk7RQu2r4KsR9Abqwe5B6Isls8UZ2zl2o9cBEFUrNPGI31/L0vaXctqfKz/+PknNoToEmzQlN3JRz43z8GZ1EIp6BNcDwlMwGp6T3HJQ9a6cq7Q1+26eNEi/KwgOCtzdT7luRGxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788819494; c=relaxed/simple;
	bh=ZdQ3JbGEBj66Iri9bXPFZvgMyN/PybvpINhIicFF/EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaFT5AsbajYRvDZ1xz8sK5GO203CTL6Ah9XMozGxEDfg5n2vSQhD1K9TEE7dlglS/Rb8so4G+iK6Ccroi1F8BMuixkQ0x9WaB4BpOw5ycytUrTveoosWcxqR4kyF4VMKLo4G1uGcJi9ZbmeB7pu6ZvMx/ss0Smk7JnkvejANsDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gpyxuA40; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gpyxuA40"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3163935a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788819492; cv=none;
        d=google.com; s=arc-20260327;
        b=KYOicjnhQ905j/NqueocXc9DbF681jY6YhNvloj6Nawahmfv7W389CFcojcObbRIPD
         nrp2RfS0Ww9Lmda5XtJTT7JHW7k86KG06RZAfzX46jQ/i7Z8ldUd9Qr/RvIWKrTds6mn
         W3a9pSfAb1FJrID3+f1e1QHBNwFgdLJNtYCHU2s8q4x1zr8Z+gynU5pc2jK8njDqphBy
         DGrbB6U2y96Lh2pY0gpnKAcr0qsdxUT3DYrsgJGUDLtAToaLmffRbhZi/a9ihrJOYAyu
         uNJWU7/paT+EZ82CISsZfa71/2p1ynCWFZblkBkaRDpi0C/VPkJtvENDQAXCZbpoOFQ8
         Zh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jNlTXyDPKBggEGyMwYYgjcO9kU30dwD9XLhdPez1l84=;
        fh=Mx7pGur4vqYpOaY1ELG2KX8IF1Kbf2CSeIkxqZJO6tM=;
        b=S3TrE5ZTGlugloTTIgSv+gO36dcr4IVe3BD413/ejPMFWFGjKsW31w7l588frzRGXL
         CkPF6MyU7WC784EaWE/WiYW/MbM2kjuZmEgpbkKX8IEvZPjrB7miFReCA8PIzCK1J/k4
         sda2VBYPkxuk/AwzFQ0IxGD7rmHS4Dxz63751ffCJEzPjFZgYVrMZdwhBD81FFp7c5gp
         wCksGz4IKaxECxpL9bJ657x+af5KF5hEsiB0eEyZ2Z4qApbPT9SRRBNeXRHxfdp4s2l5
         vO2e2h0cU5yaRTvKVEli33TRTQXElzi3pD6cV6t0MJ33/B+kKJ10ubz0lMB0yHWJ3l20
         ygLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788819492; x=1789424292; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNlTXyDPKBggEGyMwYYgjcO9kU30dwD9XLhdPez1l84=;
        b=gpyxuA405pfhfXiGIMx1EziqMPmw5k+AfeoYjX6GWiJH5nXMvUufy17ErKzQJdrJsP
         YFLCQSh/he5lOnjY28WA1eM0VzjJG2HizQf7b53oZ8R9y7JB74tr6RZyRrza90vyuOjp
         niYC8FCUDSsjr5cuJcDL2or9TLjVncQLrnGD3kkqs476rd/txfpJMCDsdgqp8ygpTC6I
         /IaP/YXo/3wecobtyAW/kcfNJA8HOqbWTSeZGfnpZ3SnceW1wX7/M4+levpUiiX666ci
         caCQTir3leVBQ4+QCPkG6zo4zVM1T5kFuwNs0BjykEPUaTFp2333tnIDJWjlLwHrU+QD
         6aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788819492; x=1789424292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jNlTXyDPKBggEGyMwYYgjcO9kU30dwD9XLhdPez1l84=;
        b=CnPNJOpTMYbd9KEOHOlr3jYKnI8GXRsRnGMITt6KotOFHcQnkTTwByz62OlwdDNbQS
         va4xl8q03Z5p14WZkXeIWH/GZRULLLuaIs2348AnkytT+BNQVCDuPOjbg44tK8ObBT3N
         Z9cX2zWYJhuUrOuTXCn4V8rHi0ViMEEeQTNjZLqvAUV/4l74pwFP2rv5xLefIR0hWHVJ
         chy2An1Mn7vDyXS7rWiYcIw0ITn444AUlTL/bEJVT/Kc4Itba26IgbefGIRt/gGwP+Gd
         u+GXwnYRq9XVJC3TSDv9sQzrn6GwcJDOTufBcGxYkrm6+DSaU0RcqZvV+Y39DPgtb99N
         iaQw==
X-Gm-Message-State: AFuF++l1Mq5OStnArf+AkZjn8fA0uiRJvupANoqweOsJS8kFS3GrFDm5
	9WRwLyrAqrz1BzMKb6XbmcrTpmezhLqOasLmFJ6nPtNDqVfctZpKu0nm6LQondKUby8vlvr0XH9
	NBNhEaAoT70BDLs396d9Mt7Zi4/DTYKlZn6psmYbB
X-Gm-Gg: AYBFou1fNDkNIrR0NDc/vz+SJLEg0psAMQsqMpp40v5NjNAqx+Zie6Z9aGX8pSDENfm
	1pdCR3EagyKcg3r7VFkTEpASXNm+fH0Ukm5minDiSC+t0DXg+FoOOVrUGPIWAbzZLXNyyN3/mVk
	tNniR9oPlRd7q6LvOpBfaX6q/sWxj6UenGTJXZneXqi15UtVqJRsWklqWSJgywFR/UW1ENZIgoQ
	O7rknt6OPura3kTcqCmJlY0CMYZ0Q/4joGByaSwtTRKDMItMXIWELz7GmbwVQoepkml98ThQC9P
	leEM4rcmT1KFpcw5gOXgQ9C2h3kLFFaUAlEjMB9JwAIkBYA/s3G6hhPmuV5nNqJDpcgolL6VVBq
	4SsEETNGXPA==
X-Received: by 2002:a17:90a:149:b0:39b:2b10:d05c with SMTP id
 98e67ed59e1d1-39b2b115ba1mr26085066a91.5.1788819491324; Mon, 07 Sep 2026
 15:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903101843.3462767-1-elver@google.com> <20260907221334.GA1619741@ax162>
In-Reply-To: <20260907221334.GA1619741@ax162>
From: Marco Elver <elver@google.com>
Date: Tue, 8 Sep 2026 00:17:34 +0200
X-Gm-Features: AcwNN1Ud8SWGdY6soyCDfiwuMYKmM_SUBGIs8OdKM5eZuw6s2ybWmhPNVxak0AA
Message-ID: <CANpmjNNuiX-rQFvn0GK1SxAbcxEUH7rKh69GPq+7u2tg63qbmQ@mail.gmail.com>
Subject: Re: [PATCH] once_lite: Simplify condition handling and fix context analysis
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Jan Kara <jack@suse.cz>, Timothy Day <timday@thelustrecollective.com>, 
	linux-ext4@vger.kernel.org, Theodore Tso <tytso@mit.edu>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 00:13, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Sep 03, 2026 at 10:16:38AM +0000, Marco Elver wrote:
> > When WARN_ON_ONCE() wraps a conditional lock acquisition (such as
> > down_write_trylock()) on architectures relying on DO_ONCE_LITE_IF()
> > (e.g. arm), Clang's context analysis (Thread Safety Analysis) failed
> > with a false positive:
> >
> >   fs/ext2/xattr.c:825:6: error: rw_semaphore 'EXT2_I().xattr_sem' is not held on every path through here [-Werror,-Wthread-safety-analysis]
> >     825 |         if (WARN_ON_ONCE(!down_write_trylock(&EXT2_I(inode)->xattr_sem)))
> >         |             ^
> >
> > This happens because DO_ONCE_LITE_IF() branches on __ONCE_LITE_IF()'s
> > return value (__ret_once), creating an intermediate branch merge point
> > where the lock may or may not be held depending on whether the once-flag
> > (__already_done) was already set. Because the merge branch condition is
> > __ret_once rather than the trylock predicate (__ret_do_once), Clang
> > cannot reconcile the lockset at the branch merge points.
> >
> > Fix it by refactoring __ONCE_LITE_IF() into an unconditional
> > __ONCE_LITE() primitive and redefining __ONCE_LITE_IF(condition) as:
> >
> >   (unlikely(condition) && __ONCE_LITE())
> >
> > This simplifies the implementation, short-circuits evaluation so that
> > __ONCE_LITE() is not called when the condition is false, and ensures
> > that DO_ONCE_LITE_IF() only enters __ONCE_LITE() when __ret_do_once is
> > true.
> >
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Link: https://lore.kernel.org/all/20260903072759.GA1750084@ax162/
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Thanks, this fixes that warning for me across all my builds.
>
> Tested-by: Nathan Chancellor <nathan@kernel.org> # build

Thanks! I think this is one of those orphaned files - which tree can
this go through? Can it go through your tree, unless Jan already
picked it up with the other fix?
