Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2DD49B216
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354159; cv=pass; b=uRGELd036aARXjiOGGRH0n8o+8UcuolqMgfOt0yWuBUUyaF+5yv0ap+gIoiov/grpqqJkVj8K8JLSb12PYSLq4cR/kZGyA5muGE882pQFl7s2OVc3C8hkDROhcO354QzdhIZrgO9XlKuNRnBMkJNgF4zq4VtsihWZ/4tJdhek8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354159; c=relaxed/simple;
	bh=2IimJgpWco8Ido6/kuXcNwOq4ais6YquXn+nJDg20ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBBy3A5rPw0U+dpAxHM2J6ODmScbXf1/I/TmwsuINJgLiyzGLkvWk9kjJ6q6p8BphS8TLnX5uA/vTPY/+Zzj8nKiOcJ359KhLqxfjxa7rkqIUZ1ZlE0CYLA+DNvzwHMxJ1nr+hHadYo/1SHL+qE3AoBY6upciRu9mdhidxAKFQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LnR5h1Uc; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LnR5h1Uc"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca80d708489so774819a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788354157; cv=none;
        d=google.com; s=arc-20260327;
        b=kic1mHAJNWnuF3mIYmjnUaJAAwvFSakdJzrhTq7kGlSzBasykO38yEFuVYH/wIXc35
         YVzLVbKATYoreKaoYhlGEfPhPXG5MqAFRToR6xr/Kqiy3nz6dPUBGjr7zekJoQmNSmRu
         bZJSGyAb68J3246ML9FdfAyR82Hz+S8optxKy/qhaqRRtRgzQ0wfEtgaai1NgcdhZCHI
         FcntNDOhc8gY4ub05usaK9JI/lISMh4Lk/46Zbul9Em4HTdfz9Tpd6oud3ADZQV4IUim
         Yyux8+liGbocrdyLvuNUCE4HUCkMRbWU5hWKXLG9Oj2gCdpR3Ncun+o1/1dofGz/fv6J
         3YNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tZ7hMm+JsrbyLw5rJV9QF2bd+yWe5jIr9Rjm13SbtbU=;
        fh=ebj7s7727mqLxA/Sr/bg1sWyjYerQdRSj8UbEjb3JBM=;
        b=fauMEsxPLho3EaEFFagUrcuxGW9EWEPCbH/0ppCVQhorAlxi3Igp/n8HWBUFK7r4NN
         YaZqJwV5OBwPPl0oFHnVl07OfszaswkZVWVHVxIrl+F3ainMt0CNd0PVpuj1tHC2abJl
         xL/s4GSwoL7jY3ZkxdNAXJgs/J2TUC8kci9zWc2XPWazSGBTFdsZWQQ/GOcPTYWeDhnr
         AcLx+q37B8lH+YJOsgCpKfUuzydsOO88g0Gyme3rotFbR9q8eJ/g4gXn4F4W6Yr9GiWR
         Nu8bIeAwUTy5NlDHFiLIdcTyF2ZEfbHQK34M2b6Elfcgc5L/CmtUnJ9Hxq4yTxyD2252
         /J5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788354157; x=1788958957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZ7hMm+JsrbyLw5rJV9QF2bd+yWe5jIr9Rjm13SbtbU=;
        b=LnR5h1UcpIVClUcm+pIJQLokU7vpFi/pY0YuDLHhIQF7Ul7fHisjVXgo/QMPsN4zNA
         qvUjHvCGblWlTl+FWtWkLV2l1cODp3AeRnqhru5LUlfDB5gx/Bh0zGpJfe+dehW6+ipy
         mMst1+CnHmzauGYI+AeSaY4F1/i1fDsEoQbdXEcPrwjSpJtly1w53TuoP266cXZ15WAb
         DgdFaBxSR14MkiEHQ/sbNIvlGZOTew8vOGN8vFmi+9InhOP7+mh7ipdOBwq8cXx8mOld
         T8+Ht68DVP0pobxYKtf0yEula3Bt77QUp/vVVFR5AIUsP+zd6Fq5LssxTKHs8v5qEyCz
         lxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354157; x=1788958957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZ7hMm+JsrbyLw5rJV9QF2bd+yWe5jIr9Rjm13SbtbU=;
        b=D8PRHSX6ubGa2n8o4cjib+UU8IvByRBMkRZOUPZIzw5UgkcpStgJOJt4gE0J1+oANe
         PF8n5c2WZJWqy2O8o+qrO6WqXXQMC+8UIxidvd/Hd3X+BPxw4oP30wMBA1YENCR/FehT
         qF32BlS/9/5m43weEL7yqZDuhytXkLyDHwwN/lz4Jer9NWew1pAgEvqR10zQ4ukirQ8A
         dEOu6iGAXuwsdRBAVrlnJDdQ/WR/g/A/4sjcCK378HLkY4UhOEIOnwl/8l0v0XVcaPuI
         cdb12WOau6YiEN9rzcsry/8iqWMbawklHHZkZnIWRcmJUXFUJzqXqqIkcDFv0CbreGtb
         2g6g==
X-Forwarded-Encrypted: i=1; AKwUvBxXp5/1Db7ViJ8/XT4TN8Ayjt1WQEVNNLgl0KUq0QFfvNLo24H6L0oSpeqyX1WMcFsfrEPcCPXbo+XLe9M=@vger.kernel.org
X-Gm-Message-State: AFuF++mCAdBMYOwmx37YJBszK2FQb4Frpgq+DVeEuSR2mtppF65HjmNo
	4adcMUXc5+RoPMpaNOVmGMF+RW8wEmbTmxXXUPE2/hKiAWAU+vl8riQvecMjy6+EYFa65GP0yfY
	4QjdxilarREn4TWnFA/hVyvsQidIbbwI9a+AQJbj8
X-Gm-Gg: AYBFou2r1kMOXYBvgtVGTq5c6K/MLqqRP0ot246J7ZlhE/BRJkTFqhnVVBx+2F/KF8l
	kutRKzHLhnwngIvJz4OTx0bXWfEAYwFoS9mTh5JlCxj/thTkZi6CZodOw6cw00IfWci1MTyWVh6
	wBGoktGKXL9Em5YL1t2u6m1TVZXk/5lgN4/apgdbxuHEw4n78LI+hplWEaZ42h21cHb2UKKkxFr
	ICSqjZIkxiI3UgaJc9dHRrTJlJWXWx66zN49kFCrPdiORgcrqzqWOf4rneap5j17j8ma5YBYi0r
	ycz4FoNXw17Talk9U4Y2R0ZzqDQnZ9DJSWxLVOQYdL+LMdCt5gVyqYgTbSyEhdlDoRq0NPtQ+Xc
	=
X-Received: by 2002:a17:90b:562e:b0:380:8bb9:aba9 with SMTP id
 98e67ed59e1d1-39af57ba71dmr3908216a91.3.1788354156489; Wed, 02 Sep 2026
 06:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901124013.1098560-1-xiangzao@linux.alibaba.com> <20260901124013.1098560-2-xiangzao@linux.alibaba.com>
In-Reply-To: <20260901124013.1098560-2-xiangzao@linux.alibaba.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 2 Sep 2026 15:01:59 +0200
X-Gm-Features: AcwNN1VGxJFpmL-lU0OnRAVUYxIl406whc4Ms3oZN7-dYh4VYCv_375yVerTGPI
Message-ID: <CAG_fn=UNF=BDJ1mFgMc6Tu0Xwi6c7Gu6Q6RHaugR2ii+nLM+aw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] stacktrace: Provide arch_in_event_entry_text() hook
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, xin@zytor.com, 
	luto@kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	rostedt@goodmis.org, akpm@linux-foundation.org, rdunlap@infradead.org, 
	elver@google.com, andreyknvl@gmail.com, gor@linux.ibm.com, 
	brads@mainlining.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 2:40=E2=80=AFPM Yuanhe Shu <xiangzao@linux.alibaba.c=
om> wrote:

> The first user is the FRED fix in the follow-up patch.  Both carry the
> same Fixes: tag and are Cc'ed to stable so that they are picked up as a
> pair.
>
> Fixes: 14619d912b65 ("x86/fred: FRED entry/exit and dispatch code")
> Cc: stable@vger.kernel.org # v6.9+
> Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
Acked-by: Alexander Potapenko <glider@google.com>
