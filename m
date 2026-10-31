Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793481298;
	b=jrjMt5rVKhuGlJMkgWdlY8L8zUd+X1Cu4pezjrHCQqlFeZfNmq2B5+y/ThxrHfM2z/aH
	 pYZ6Jy8g0xaApEZPEAsnmctfmPih3bdPiPPHGyLgXx8MTOQLK8ajT8JEnmS5WzGwM0pfG
	 hZ3hCjVlVxvlis/iVD7Qcz75EzsKaJbiQkRA92FRZWBAlxHCzcgzjhxSeILARDVCPZBut
	 Nit4x35zXyyeuk1wjXtX8Rjb0XC4deGmndrZZsGgAOGx3jBTCK2tmaflOHyWJFxhkhdqB
	 SRbZ66RbzIKxl0S6fqDmk8ew14FxKklvPVneEFr29tJLZWB2FW0lS6gpkEZoQXM0+6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793481298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UT8zOBBGoDfTpj3pNsjdxxy8ejhTH0diBHKOBMAZTYg=;
	b=OlvnjzXgDabfcH1ANMqLhB6oytUv4Tud971OBosEKRTCF8qH6j4LxdKYTaVVlNYDBq4u
	 M86aRS/QckSQOT52VGmAWh+oNK/330rwJvCA1MuhgGfx+l7scfdprEghHIXkbVKgcZKJJ
	 pKj3LEc5RmA6Hadq2TXsnJaDHWrKweXr+sjAjW5326giE9AY8c9rSQvykqFS1+3iRnpvm
	 2W/bgELqbgMi5z5H553WuUNJ8bLSO91R/4Kp57h51p9zC2fgfxfLSgVgyFQuba+Vzt/hc
	 Wd+H+zFGtERELACoXKYE6i6deA8NsWGZd5PfeKuWGuYgWddwYVOqpi+HMytYDJs+ooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gfD9o9cW;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B3606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212B3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gfD9o9cW
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c49b431f022so253212566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793481295; x=1794086095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UT8zOBBGoDfTpj3pNsjdxxy8ejhTH0diBHKOBMAZTYg=;
        b=gfD9o9cWqelHNkIggrnXJWdFNCnWZ2LsKAihXy5PKo9lKZgRIiDnzUWbxOZ5MOTRTN
         KgM1zTdStZxFnE/MCWhAVdb35FjLfa4hwfrEyqFmFr+FqlMZnVYSyoYQrt53UZkn7fOG
         Cy7IwdwVIS+PbsFrm+yKoMA0gF3SHP7isgcAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793481295; x=1794086095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UT8zOBBGoDfTpj3pNsjdxxy8ejhTH0diBHKOBMAZTYg=;
        b=s9QCcT39gfp6bERguUa+YG94b1eI64WYiuyQHk/pfQCiQj/v0OsaZ+be4OnaiscpgL
         Uo332MYC9UX39Tnfsc+kEAHihui5y46YBR/d1fMSmGNaGivvhPZSh3iU4AwLOgE2roEz
         Yelujn4B9dbL5N2Yih7cJbshHVDVESkVgYoc87dAoL/XHYhXtrhC69r2ASr470AFp5BF
         fudlldjdSJyeZeDXY5qazTiT/CX3iwFQQlEAZkEfMfy6g4BIyIyjhkgdO3fVQi1FEWCe
         g5fp8UyD78HJCnK6H92TbCQAR+RWYcHYJsqLIBdMqhkH0xeAg1R5vy3qLLzENZjdk6+s
         6HAg==
X-Forwarded-Encrypted: i=1; AKwUvBzKWe9JC/HTPXouVYQELvaxmapes3U+KiLkZM71l79mUBC+SiSCeMd2C4OB+s18x14sBaZ1CjRApO+8CZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZCSqgDFm+mwd8gEgIkzdOLDJrqo6AKl+9j7O26HjSvUWV7Bww
	n6bwF2I4upB/rZlWniG45zWKFrz3LKu07VLj7jxsGpvZqWvuEdLyPzwcBFyR861B3ypk0mNaiGc
	IGYJMwJ0=
X-Gm-Gg: AYBFou36OSEAO29X8dH8T1lm0jKM1nEsRMX9Nn7pvyOEW2q1fK6vkQSR6nmsjJrAypv
	eGzNU+tZHju1nhstyvdSVpCdJwEVQQsn5qMsFPHOExp/5Qx2qVXQ9s2EW5yRz2PncZX7knG/0t0
	t8TvFwHTnwBB8zM5k14pddbK4j04IM20xjQaZ0fiKUIEveMCx+Q0g2qPeYdiZ8C1Qp+LoY9fRr/
	Ih48PzDahGvSItkeKbo7avv1tJYvB6uVdeGulOtwMMKCH1M1q4SE4Lo2jc0N4Uar31xEf9QQQIq
	Ae6AQIVuSUStEBSfyOCd23Z+5xQRCmlqdWuw2QpuS/mNdPeZZYRS8eynq85EZTTjLuiixByf3j2
	dyimU2Iv61QKvdvqZLhUR54yLHLT3rnwKXZRi1QtPYvkymZklZukrvNRb5lIztfseWRIws5New/
	94JepBH3V2aZqxlewaxzLMvsCegw8CLQZmfTYNt3ai/s4jeyrR9S5jxPKsl+bPuki8j94PLMi5p
	SS4SYh7564hsoQcLD2znpX1unRP01bA8nNidD6u0Lrc0Jvc7IyLKltz6QNidqfthnIJh5l7ruSe
	Pw1n1EczZLxGsiVrGJBzzG43J0pOo+LZ1Ok0U2EuFA6riHiXeqaI1lbkRwaukmgtq6xp0c7H8tF
	GcF9iJpuO3w/1txHx4ydF0MXA
X-Received: by 2002:a17:906:7308:b0:c40:a4f8:e036 with SMTP id a640c23a62f3a-c4ca7ad97a5mr492081266b.43.1793481295411;
        Sat, 31 Oct 2026 14:14:55 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f62esm211338466b.34.2026.10.31.14.14.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 14:14:54 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4322d310e7so296734966b.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwCbnZwZsAqN4ZArufMFbuCpZPzD6W8ZCXtHjZQgFQTmMjf7F68TunDMD0IdIfZVz9zGUGWZG/wAusnf/E=@vger.kernel.org
X-Received: by 2002:a17:907:6e8a:b0:c49:ca4e:b978 with SMTP id
 a640c23a62f3a-c4ca7aed610mr501988566b.49.1793481294514; Sat, 31 Oct 2026
 14:14:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan> <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
 <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
In-Reply-To: <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 Oct 2026 14:14:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com>
X-Gm-Features: AclHuK-PA9_OP2L-Ic2kc6kRoIyFKxv50uCSJqTU-oVYS2P3UYeuSSnYgVuW6eQ
Message-ID: <CAHk-=wixKLm5ahcYJ0tZNViP298RNJ_QwDcXN-AheH6uOfLZwA@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2026 at 00:47, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And if people are playing games with commit dates, they need to stop
> doing that. NOW. Because I'm not pulling the media tree until this is
> dealt with.

Note that this is more than "don't lie" (although that's the biggest
issue to me personally - I don't want to see people lying about what
is going on).

It actually broke git this merge window. See

   https://lore.kernel.org/all/20261031065525.19883-2-torvalds@kernel.org/

for a patch I sent to the git mailing list to make git-describe show
the right commit counts.

Git doesn't depend on commit dates for _correctness_, but they are
used for a few heuristics for quick history traversal.

So if you lie about commit times, or are committing on a broken
machine with dates completely off, the resulting repository data is
actively worse.

               Linus
