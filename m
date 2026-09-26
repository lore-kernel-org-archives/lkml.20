Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C00F322C73
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412257; cv=none; b=p7FmGWZrpm+pEHvk1IEq7b8bB5cNyqTOVeykN1eevjGBei3shjLu/0Da8+aPnlXOKktX34KaEXaHtjRZ46kPLNdwXz0pKlmm3DIv8KHzFoSNA8oDJQm/RLWnWuvjst/cbbBl31ZfuVfAdvCJruByxZXNxB/f/lgVFx6P8kspUpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412257; c=relaxed/simple;
	bh=357Ky0nTuRm/ryxTVFvvXIsESqKMl6UKRo2AemrEjso=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=X8GmUgjMUYFIlA5Vir2l28Ix5XCF5FgLxQ+n/Bea8F/HSPzYKM3GtC7f5UcCNPK3M2v0T9XPAaOdfQGE1OR90rUSDxnDerKUVfwf24FXF7w8wKSXvLMzbcClplTLaKcwlhbnIggFjpx/KMKIlUlciQNOCr0rX3PruZP11wYiUGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mas/7Xjd; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mas/7Xjd"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc7979d1dedso362346a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790412256; x=1791017056; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpE+f047+1AeIBfIFik5jfpCl92Uu0imNFmaxvJId70=;
        b=Mas/7Xjd1UQUnz84T1Tf3pf/boSVJH44uQ+tp42u0B1BDDviXXx1zsD0M9kI93zevQ
         yfAC6VboBxq0WvrTnEsKvDNISjJ+kG0puPEsBqH18oUeJQMJMsqyDbT+jCdCTUyUtTMo
         SKLnm7hfRpT6eIO+l0mf6FN8uK0Btkh+SgEgadt1kuR4yz067kf8B45WWgq1OtSzgi+4
         fgW8BKD/u4aElvwYHypbKueZooSR3q+xiK671Ykv50wrztzkJtV4IbC7559UCnDG9zTQ
         dmFFt+5A3LaJwJ5b/NXKnm8Z+YdSOEHrZgcoUJV0L51GfT+LdO9U26dzEQ2vhsqoAVOh
         i5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790412256; x=1791017056;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpE+f047+1AeIBfIFik5jfpCl92Uu0imNFmaxvJId70=;
        b=R1SqK3/KJICym/m+xYxUfJYQwDFMX69M9ZsRCVZdi0tsSF+20sYEBspZh1L5e0AQQh
         DGlEUlbm8OLI1JVT9bhQfhRFIR4siaZJVgqizr99q1nugObbLhbLygEhts5ir0rmmNg5
         URfkZhs6bLq13jlKdyzmH/Rt9zAzJrFQIV58HsXzsIyXJsR+qaNPInrCsV/qY1R/MQbK
         6qm1h7j8CyXJ4CX+TDuXbYbSQdMUy5Fw6oAE5ooJ9ONE/oMt3SaZh3kO9dASdXl5kZat
         rmhujnTHytx+L6izVTwsivmXQMdbfSjK0b54EHTy/leBWHcKHm+xkSlmJSbmLesCPaTJ
         7rPA==
X-Forwarded-Encrypted: i=1; AKwUvBzuzl6p/XZWZhKjKkuJGGv53qUlK0nlyQbGHlh1beejPlWgjqVMSpfFq2tUFiVSJxAYVl9kwVNrH194yyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEYR7LyrBxeXBxYqVwfN4mrBVUn7dv5XRe7/rSQU6ZrsvcRP//
	aKzlVZw6VMxw8hKMFoGg9BLOKDARhim4IDQD7Q9xFxUFbIJz+A5/NWHX
X-Gm-Gg: AYBFou3p1ubl8r12PLwRwtnGJFrEqpJ4kiLg3hIPUknY8OMJbj6JGy6dRvoeIl+FFNI
	5/XNlMw4Z+IdXw+Tp3PKYPGYcoPd+P5AUXvkNjs1oV5bmPEGQaZXd1k6Nps7F72/dub7Cu5wbwp
	RHsAlTvFXsZdJepoMkjgW80BGwk0EeyHYjhsmWo5JbIaUIRpFQuqtii0o9sSNjpWsZtSxSGoD7H
	gD3v3pa2K5ANOiOOEAep+7V0aC2bTyz7/joz+GjKefoBkCGAwXWN/qsIFZTYD/JCfh0uJy37c2t
	WfVWBt7pvn5OhcjVDZQep/smlEDoVcqpSlptSBON+h2fNCc3GcCMC/6trHNEnBHqc7nkarFHmgW
	EUbcfxXCk0RQebe7GXd9F5ROeJVQnj/VKy+uuVIoc98volOkd6YdKEszSaKlpSlBjm9jAX9pJtA
	U4+Uqygkj5hCnL5vIRT/k8DUYx4qls13kKUj9cFJ2eq0mESdUdcwk3RWB4r5ZKh/UBmWfDzkxdK
	nzQils40HKwKlgcmhmdPAleq07d4HoFFlwWbRV+aH0DDkxsOT3VOTAOrzQTCqEcJ1cUEVPphSdk
	9HyPpf9Aoa4y7Q==
X-Received: by 2002:a17:90b:3143:b0:3a0:d42a:e22d with SMTP id 98e67ed59e1d1-3a0d42ae4dbmr2114046a91.56.1790412255695;
        Sat, 26 Sep 2026 01:44:15 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c719f86fsm6408824a91.7.2026.09.26.01.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 01:44:14 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 08:44:13 +0000
Message-Id: <DLP46AE97EYD.1I2HDPGBR8GME@gmail.com>
Subject: Re: [PATCH bpf v4 2/3] bpf: Skip detached progs in trampoline
 images that are still in use
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <bot+bpf-ci@kernel.org>, <florent.revest@linux.dev>,
 <bpf@vger.kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>
Cc: <martin.lau@linux.dev>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <kpsingh@kernel.org>, <john.fastabend@gmail.com>, <leon.hwang@linux.dev>,
 <zirajs7@gmail.com>, <rhkrqnwk98@gmail.com>, <puranjay@kernel.org>,
 <xukuohai@huaweicloud.com>, <iii@linux.ibm.com>, <hbathini@linux.ibm.com>,
 <chleroy@kernel.org>, <naveen@kernel.org>, <bjorn@kernel.org>,
 <pulehui@huawei.com>, <yangtiezhu@loongson.cn>, <hengqi.chen@gmail.com>,
 <linux-kernel@vger.kernel.org>, <martin.lau@kernel.org>,
 <mason@kernel.org>, <ihor.solodrai@linux.dev>
In-Reply-To: <6a6d43e6bada7a1433cd525c9ec31780ed9b2401c8834894defdf671601b2f1d@mail.kernel.org>
References: <20260925100342.481242-3-florent.revest@linux.dev> <6a6d43e6bada7a1433cd525c9ec31780ed9b2401c8834894defdf671601b2f1d@mail.kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Sep 25, 2026 at 10:47 AM bot+bpf-ci@kernel.org <bot+bpf-ci@kernel.org> wrote:
>> +	/* nops for move_imm+jirl, patched to skip this prog when it is detached */
>> +	for (i = 0; i < LOONGARCH_LONG_JUMP_NINSNS; i++)
>> +		emit_insn(ctx, nop);
>
> Can a task preempted inside the skip sled resume into half of the new jump
> sequence and jump to a garbage address?

[...]

> Could the LoongArch skip site use a single instruction instead? For
> example, a 'b' to the skip target, which is always within the +/-128MB
> range of the same image, patched from nop to 'b'. The rest of the sled
> would then be unnecessary.

Seems like a real bug. Same issue on riscv.

ip_after_call was patched in bpf_tramp_image_put() when the image was
already unreachable. Now bpf_trampoline_remove_prog() patches cur_image
before bpf_trampoline_update() replaces it, so every call of the traced
function goes through the sled while it is rewritten. stop_machine
doesn't help the task that it preempted in the middle of the sled.

Pls fix and respin.
Everything else looks good.

pw-bot: cr

