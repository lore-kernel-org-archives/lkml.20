Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC414A619
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790300546; cv=none; b=pxUOKxTjOOtMrchM5sKJOJnFkBk2hm93Zdyd3nbGeWdMSMVbDIAodtgQNAXVq/pUaJU+iNHwikm5HJjIqQ1bvid2dDT3rZpWNOyC8sQ9t/CLnE5Ei+cIJCr3lvh/O0HAA//JmORdQgsgQf9E5unXhVrxjNOBV0TWXl8CIfyUF6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790300546; c=relaxed/simple;
	bh=bpcSArP0BakjNpkYgiedGHQ7QoN4N0x72zQhrjcVA2g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=gZXyiYvYD4EdzfaHaqgiXJcBFPuZQXTJWLW9idKva/sXhK1/6tjkpK+QtPfbaPD77CjWxvnh9pX+FiVLRnfz9cLBwYdsLNxAU/4qcIKouomN7u3XobVqDTe2FVYrq49yBH7hz2u/82a7XgxuBnuB6lJjgJjcPqqdTkFVkaTRUiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfuqbQTN; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfuqbQTN"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so253200a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790300544; x=1790905344; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VZmHIVQt5MsqwcFSRkTf1mqGRLmUxrlijiy48OZpNkc=;
        b=kfuqbQTNSjtA99g6SjRyDWmshlv0EfPWvY6gOhLgkPtGczhLg5lhmM11dtxRUNHWFa
         lBIKGEXKxfd/3XTOI9RkbOgGUDc0WjE0MmlN0lyOUGOzisOLA9QSkYsNRR2dWOwhwcPw
         WNMM6dhYQsd19qajik60bQHj0xA/1zbNCFcgyAzNdcU7pjWcpVMYDBCJHX+TLAihJOqs
         i9puFM5HVQF7QK46DpC2GQGVdG/0lB0sfzejOPPt/CmmOOaDDqPCFDGrUEd0ucLoQT07
         iPko2xrzVmnlX1usyHC1E83iRJgcYdWEnT9YVutEq6Rco3ZK2Y+7tYVukWyfpco9oLeg
         i5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790300544; x=1790905344;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZmHIVQt5MsqwcFSRkTf1mqGRLmUxrlijiy48OZpNkc=;
        b=CSi0s0HPBPRyXLONksUmnBgBdyKsF54fCx88yuU8y/MnOpOOLvzgOubLZfVIVGyztV
         aeo4jrxgi/yxqbVcYYl3VNXFFWlds+RsBpFK0CWsNSUEbBODarPFoRQ3YfoRWY7LO0F/
         Jwv87V8nWAKM9vMCGb+pYBUBvyavouPIrJROBQW+PWHoXVmSAnOwf8d4HBs+js+79z/1
         RIAjaLgTLoJ9nVsHjPVFP8Vs1f26RxUS/eayH0m8yeVF5dJX7G4pW3BR+a36nLTBaH9l
         zCxktFp6N0K+HOIH97nQPnXiM/yLSvT2e6tU0zpf+zeen/fAZzvT1eX0UiXsYCiZIc6F
         2o7w==
X-Forwarded-Encrypted: i=1; AKwUvBzAToMbW2KP3jvY3CBkkhD+xIWvKo0Ms0V4a6ziLWgO3ZeyRpVDgAOoz55fnamKEeVVUFRnc/pc93qFADs=@vger.kernel.org
X-Gm-Message-State: AFuF++mko92SOkY72qAAJz7d464RBXsxtaS4PTErEztoOpYLOK5tL73N
	/SAbwb2iKxIef2k0/ESLW3TZ76hnTPniyncSYH+uUuQLtQMi11+2sUXD
X-Gm-Gg: AYBFou3ZViRIZINphHo8T3Fr2EszIy56cn3xSUh1ytThcAI750nKgK70rmF+7Hafxgn
	yhPLBxSLXrL5B/B04i8Pd+Y9CbStlb00F0cegnjFmvN8eWjL070Z5MYTL5sTiQ1D8Wxoconjcpy
	mX13ukpsGIrhm/cwZLdYbvfzCGshK6sv2ZnnLqjw8WqlZZoP1CQbdDQhyay9NmtbeIriHtEk+Ps
	KBvg5vbvpWouR6lvBJPKzO/RrwOtM4DHr5WbX87HIBYDoxkMu5tjhIf5SDhbnBk5Y/YCOA3v0/i
	vSnXRCIMBPn7WLXnP4WnGE4BLp5aL04TwfdWK+utCcpRWczMPlKkP02aevGTvPe3AxVGRz4G3ln
	0CeY9Zo5pIVWzYi3suvDSJ1aOjv/swGx2/B5kEihWrKzpZHQAHpX9+YZiaZjKjiaXd1ahCgg49C
	ux8TrgXkq0W7S/++NfSheAY8xJuZI5K/pUg+ta2/9iyr3p/WwZqD60YSXJTKFsdeRy5uecDR164
	FyY4emmQjd+g2u8GnqfIJuMYkn7lqfpve3MqBI/pAhC26TiPOX+zTl0VRIy9UEvMNW1qXflKS1u
	9XI=
X-Received: by 2002:a05:6a00:4208:b0:874:72b6:7da9 with SMTP id d2e1a72fcca58-87ea06d5f01mr2680271b3a.36.1790300544302;
        Thu, 24 Sep 2026 18:42:24 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea19800esm331255b3a.10.2026.09.24.18.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 18:42:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 01:42:23 +0000
Message-Id: <DLO0KRHXJ8QT.3EM3ED4EEZI0B@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf: add diagnostics for rejected memory and map
 accesses
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Suchit Karunakaran" <suchitkarunakaran@gmail.com>
In-Reply-To: <CAO9wTFjNX18eynH7EJGjzMeE+yXx9XesLSW9gJCYXTSqNJMavQ@mail.gmail.com>
References: <20260921154650.130677-1-suchitkarunakaran@gmail.com> <DLL5PFJLT64M.1W82K71YXNT3A@gmail.com> <CAO9wTFjK+oRT-maca6A1UDBrgYTGB0Zr48UiLm2Ees835POOFg@mail.gmail.com> <DLL8564LZU8N.16W933Z547TYI@gmail.com> <CAO9wTFjNX18eynH7EJGjzMeE+yXx9XesLSW9gJCYXTSqNJMavQ@mail.gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 11:19 AM Suchit Karunakaran <suchitkarunakaran@gmail.com> wrote:
> Hi Alexei, thanks for the review. After some research, I found that
> the sign extending load instruction was introduced in BPF ISA V4.
> Given that, would the following diagnostic message be more helpful for
> users?
> bpf_diag_policy(env, i + delta,
> "sign-extending load from arena memory",
> "the current JIT backend doesn't implement sign-extending loads from
> arena memory",
> "Recompile the BPF program with Clang's -mcpu=v3 to avoid generating
> sign-extending load instructions.");

Yes. That's something the user can do.

But look at what bpf_diag_policy() prints with these strings:

  The sign-extending load from arena memory is not allowed: the current
  JIT backend doesn't implement sign-extending loads from arena memory.

The same thing twice.

The other messages in the patch need the same treatment.
Read every report the way the user will see it before sending v2.
