Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF90F49B1EE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143208; cv=pass; b=BHJ0cXWblWY78H4kbFElgd6y0v08mXOVCAojGcOq7JjpEH4hvrOpTt8U/gdMmAo7DkArKCjH1lpofgCyyylgiuj4qQFiVIjAwpkw9cU2kMOdgRwXz4Z4nFJ91Svr141i8vMkxGN7dDz6SlTRQVOYah5VYoEFGtXXZfnkdXO8ZBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143208; c=relaxed/simple;
	bh=o17OeanR+f8874fxRxAb9yjoao/cmBs3eLzTOvMjtJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hU97g4WYxfhUkbk0//exo8kYK7gmUDX6JevVRqcsftpAqUVCDFGzhWaspf8EpppHw5CMiAqJ1ZhLmanhZA+kJd0kzX1rwgF0vEJ2ewOJ+r7MYWfUfuEy96E4PbeMSZWamdkE0sl0lAuzA8KgyIxxdPQjG7EVR38xlbjqvorM5g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=RouS9B6D; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="RouS9B6D"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-779d18ef706so740889137.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789143206; cv=none;
        d=google.com; s=arc-20260327;
        b=SVcn+KyHNi29Ci6WtBvUxS5ft25lgdYY0QAmMM6w00aO75REw0RDTqCVPRQoLiGsK5
         o1N1lDdUGQB/VJaKiJQ9CMEOOPfT5oqxGNhPnhUbLtc4rxXOUqHye9c+yaxSeEBreFWH
         tuXaQ98tEVi2zv6B66O2SJmP4ssPTJ/pOT/xHHYk1Zc0niOQErLe6cka+ecOg0z+/LRm
         0+81geYxJ4xQfJhNeRg7HweDrZV13w1EfSJ8bSsZRMqK3b0i//6yQ4xYHSYRO/yKEjUa
         iyO/P4vWcbttyVklYcFK9xbdr6vcGkfUcvr8Vhb6aYbofk5888tXvngZhzyZw8zBJi92
         ooiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o17OeanR+f8874fxRxAb9yjoao/cmBs3eLzTOvMjtJY=;
        fh=Zg4lCEaukJfyiN39pzjI1xPCiCk4ovB8D+5tjeW8vKE=;
        b=rs1nEDjqjxqRvrLgsra9ANnUDuEH3YNSq6bBU1QVb/IPOOiV98AtC7I5uv11vP0j6j
         o594Lnrsh/IViwJH1lxO3WhZ2/ndKlcpP2HD0enDAA/cOLvY2FkElvCHDAVVCqZARmnd
         SaaIlNCpI+4U3eZ6dc8lvypvjMW8Zi5V9+VztGvfuDt9cjjuN8aw+9KwEC8ePClS6PVK
         AJQ9MG7uhzUQ2B2wxVQ9MNKJoiRUtxI3SOh3bIOAasazFjVi9btZeuTDiVC0oRL0StmF
         x9SLi86KfiDnEZ4oGIE8NXw8sUm8CbXsbeTV0L/aEjCgfVwoobx6weaiMYQcVxC0I+gz
         S/gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1789143206; x=1789748006; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o17OeanR+f8874fxRxAb9yjoao/cmBs3eLzTOvMjtJY=;
        b=RouS9B6DFEUaKzfWu2e8eLfl3WhQoJmYHtf9Baul7Z5mnvxjKCyR7XdW65dc5AxDl6
         ivgb4GF0+J2Z8gxYbt/T+OaDZFYCsf9Zemw+lUanxgQhtJORECxSbnzNDMQMRDz2QmQu
         kKIrqJuJq6lzVhLhDVdZnqKfVen/lbn42JUx/jdcTsBbXy37xFtUeCqvnuyvYQz9urKf
         vT7lCDopn8BqAw7y4yEQLc65f8lY/yv0EubwDGZa4Mf81kzDuCNAQ/7Ib2s87N9Op4Gt
         2UIfrc07Z+oDqSldAlsM2eqhDNH5ngXhQIqL+cs5/CAbvu8Vzf0UR0bOA5rZcq/0Xc+g
         mtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789143206; x=1789748006;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o17OeanR+f8874fxRxAb9yjoao/cmBs3eLzTOvMjtJY=;
        b=kI0MMttiKp5HPxO/GZ28DrJIHsGwg4irSyVORpc675DmXqscOo5x+3UbfaqUF6FYN6
         GtTzSJQqppkClyR7LS4lvltpm4+RlSQcjtwxUt8ZNYKkeDDg3nox0XSSWKwvMKY6oSN2
         gN16lIw5U3QI46PjtbidBgj+f7TYn3z66g7lfGHTk17vDlAat3mhgTzCH2P2zp7O61Hg
         KYxpNooVgPu55TkL4cLfDVLv9qzIc+gKRDQ1j6o1vXMlOKiZ2fxwNHq/YLTSIzt2rqB6
         i4ZG7H4FstRH5RfT4XzwbMLf/fscLUicgg9ay/gIcnKpLFpCpHzHxjL1UaKI4IMaCUJc
         oecQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwIoKaBJGpnojuNqbcmEihQCJbBzEuAD9XaAJnukdsrcWGgAHUx6rZmwpzI/pyMt2BbX3ziQ323xMrTfA=@vger.kernel.org
X-Gm-Message-State: AFuF++moPs3XrAJ/19PTvOqEL0UnqctInfYuw2v+/VSl/6kN3+RpBtqI
	HO72sD0KxGYs4NBHMumaDYX4hURAqJAeJEBr2UxAMhUM0UjbMItdqz2ZCwuedRjf00dK5V/fUEV
	wySUo0EOWNmzSuU64DYU53HcfnwBlQIsqo8yDnhKFmw==
X-Gm-Gg: AYBFou3PFdz0Ek9pjBkT9FXVj+811sDj2z1f0OgMEBo1fkl4IS+lLH/geQK7F/V76LX
	5+UK7vG9piK+7dcAbkOvv+eu2nFLpYtWN+goRGnKGl2aP1Da4xqPV8lVVVXK4b4nvEpFeqQI6dk
	dxP3Q2ktINakZEaQ2cwDiNgRHaC7CwOm7MERqp8Fm3tETPlXE19KgQlkf8+y+a7yZN1xyK3hOTC
	2VeQd2YSkDvxhUa7mQlm0uqkUPqFSWZzVTREwKKM8xOfLeG5wFF11maFEE8+bNsTJ2+xBtoOX0o
	E8mONmNkY3LD0oXfVPa47+x/S4QLzROPAnQ1R2QBfPHIgNMklsv0Pv4=
X-Received: by 2002:a05:6102:2906:b0:792:6eff:ef5d with SMTP id
 ada2fe7eead31-792a7720e44mr6095657137.2.1789143205847; Fri, 11 Sep 2026
 09:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904111731.673341-1-main.kalliope@gmail.com> <20260904111731.673341-3-main.kalliope@gmail.com>
In-Reply-To: <20260904111731.673341-3-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Fri, 11 Sep 2026 18:13:15 +0200
X-Gm-Features: AcwNN1VbHRZ6nj8HZW_zIRxsgv26adD5RCqJN375Skj_Q_o6IqWmWlOZFQd_XPE
Message-ID: <CAM1=_QTN3JJ6jtckf32F8wxBzLDbHSrzUttyMBWNqZKmRe=2rg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, mips: Add support for BPF_MOVSX in
 the JITs
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicholas,

Thank you for the updated patch set. It looks good, with one remark below.

> Use shift pairs rather than seb/seh so the lowering works on every CPU
> supported by these JITs. seb/seh would save one instruction on
> R2-or-newer CPUs but would require adding those opcodes to uasm.

I would suggest that we do this optimization. There are other examples
where the JIT can use fewer instructions on newer ISA revisions, for
example BPF_MUL (emitted as mul vs multu+mflo). You can add the
missing opcodes to your previous uasm patch. Then add ISA-specific
handling in the BPF_MOV emittors, in the same way as it is done in
BPF_MUL for example. When you have the full patch set, I can run
through test_bpf on all my QEMU mips targets.

Thanks,
Johan
