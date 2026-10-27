Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793118480;
	b=3HEzUUaD3b7NJTVqqp6KW0Tj88MkNOQbjpHW4wjtDvTQ3rYIqEei3+1q5YXQij398fYq
	 tQ9VJ6wIYwFAtOoCD6MrSzwi4FPTRW9r9wNgeir4oJ78CaoSCUZksZez72iz44mHIG1L7
	 MTjRhVQMJu7ocirLFcYTO6UVuXDkxcK0LzIx2tMgHqmGQxImaAAkcrmHR1TaicWM7hT7V
	 AALU/LsqwHHmW44DWCQQVYguZOd/t7jAl5yixVO72DZvtmSlWSRNRO8IFcVBGtd+0wObI
	 bb4btirgcn/3kDx7MDGmXNMUCOt13HRYhZx3jhZdboysoNfkLHY+hqewxBL0WvCyolg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3hqu+svzVd9ISmoYzAK4HexOUNRCnaJYNRkc+XMVyq0=;
	b=Br4fBo38xSQQXTQ8n4WoeiA6pp+SonNj1mV0yQBDA0TQGpmMSOHlXdl3i1FQ3bw8lJNb
	 RvfAIPPlz6kMSYwdVHf5FTN7+6Uu4b/xptq4C07sd7UTBhxCo2vLewzLCr31S7VGPslsn
	 90i8aCIkRssSfEfEj/vSHuodgyFChGAInQ4UWpXCErF6MBIw+KL05tPbkZR/+X27uZ4Vd
	 t5eyFboHrdJ9/eGg0A7+WscOqqVSFzezWl/gAUhD5gnrxX7byB/v3PCheLuh3iJilZ9ee
	 Mcvi6PxWpie8KpoAZANs6vHr2fnDZBOIyn8DM8UUbH6hGQCCyg6ex5BMRw5EMA/0N2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jwiM3DAC;
	arc=fail smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CCB606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60CCB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jwiM3DAC
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-188406bb948so3578051c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118479; cv=none;
        d=google.com; s=arc-20260327;
        b=lWxjNWM6q9v7LyftVXX/okYocWjP+5alYtL4nlSWT4PeWX2Dy5eDw5FwqRTnQeF5Lt
         P4Ylm1U+w5NC49koCmUe/pII6qAGOhsV+ftf05QMs38nW5Y+OtI7k2izJfwVmAm60BaF
         DTo6O+ewHdzzhUuhHhCRl76q1VQm2VWrNZwbJG6GXkUr/z6sGHW6J0R8LKz2FWr+Fdpz
         6M07TsDDqHzyc4rZX3svdCNoNgUXIqnvuA43MPjjdbYcRqxtQkgJpsAflqhZ6FR/kqf2
         rjJjZih0JuCYgaKt/sHiWKgGfslb8gd2KICU8BjHEuKqTLeayTqMxtMBfDMuzZlrLWOG
         0FBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3hqu+svzVd9ISmoYzAK4HexOUNRCnaJYNRkc+XMVyq0=;
        fh=j0DfUoG51yBygj0+haCnrdadNRh/nUQ+lvRImpOjRXw=;
        b=Bpwz0++jin071YwOXpOUdIBYyiEqKAY1mHwv8Js7w7Pgb9Qqtk5WvGqUPB1QGJqMXo
         uE6PYOSIXw+X54zBkwBmV18WY2xYx00NNLqPe0rXMpHsMlVHjIxyKch2kEu8B2JFqJQf
         6uS6dTS8lKNd9V+DSCte3QxlfHriOILkTbqZS5Ism/RlYLGbQiuBYq7EvYEp581X7KU2
         ddLXWyN5+6YLK5TqH/j66pzuVI+6WwZmr3C5Rya65z7h2tCoR1UwoK9nrIBRf0LcRHOL
         PDT5/hfiBakTWSGC8JZAxG8yH/1r9so1hRp/sxcWLenR4O3lAoNzgWB8TYjCZMZblXK9
         9T6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793118479; x=1793723279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3hqu+svzVd9ISmoYzAK4HexOUNRCnaJYNRkc+XMVyq0=;
        b=jwiM3DAC+hzebG0I9bJZcVu3LMVhP2QbElUaz8VKFPLMBFyKHJyLHkO5hK8hYcF3f/
         p8QkamNQRjQuhCfz9lKtX5rB9C6UFeASgyGvgnQJMEU9KkqidK99pUeJq73MGdztWCpq
         Xtt9vYT5ybj/pLaVKp9b7sFwFIawpgqX08IUcSLQIFrt6AsK4Qn+AZg6ozk//Q9f2RHR
         qxpqqlOFDcwIoIOTEkX/uMDCzV0YBAuoE2AGvZdrgPJIASz9rN2XQbjmE+fGk74bAs98
         f0ZO5O2/cDleMLV7/cUNyBDoRYxVu3wP6KCDHK3CrG50d7W6mmGxUx5DK0gpbbOu0ymR
         JTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118479; x=1793723279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hqu+svzVd9ISmoYzAK4HexOUNRCnaJYNRkc+XMVyq0=;
        b=uI/7O1Da4THSiKifzj3xNQQ+SD4s2Y24TZDPn7zT6cOlkya6q7JJhAb2aFpHt+2J2P
         c0aPFQhl90pMl86Ej65oGcyQ3faAgkKGG062kJfdN5xCurDwd0b9I+Yed17/0X1Qig1g
         p1ZOAzbG7HL3MKKGza7tIM/LkHnyfQ02ZSK906gOcPT+82U9jQ5SQcuwUnjlwYCDFLRz
         YHfoDyruwbYIkrms7LR0TMVVYWpJqFYfg0MZe1k1ol9q504FMnrt0vvX5hC1z+80aSOb
         xrx4tPB1X9hUTjv6I2fozZcrKtiqls6+3mrC+LcJtV8z2pyW+9YGpqPhMcNg6oy6fwd9
         9/9Q==
X-Forwarded-Encrypted: i=1; AKwUvByNp6gcppkK2xeYy9iznMWkElxD3gfeTjFJEEobbSH6fQ+EZ0Wl+SuYgY8a4XTQiiQPAfDTMsS0sWj4jHE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhGlZ2pZQW8Tf5IcNk9uj1lzljB84crQtMYjTvRyr8P6Aiqfc1
	Ysqk5YL7AYdclJqvuleksq+nkjIVTgKQpOe8QBwrDz4NQ1yM2hzls3DhlvZ/2F9nA+vZOBECe6Q
	mhe1I5oy67DTw7DIUiIPpV8WAgV5pHKbmQwviHgCr
X-Gm-Gg: AYBFou1xdNLt3lz0aVdM8cgkVltNr/PdjfT8RrrCmzLipoFa0LyVLJQdS1AqAFkRdx4
	9UHRvmxOlgIQmkTbYY77U+a8nVrtjwE4BGnDSLH1tYh/B61bN2+aaltHN1yMpaD3ybnYPRj2bxW
	2SHUVQJnBiuXplG6M9/VWcOs9o5Vy316a/5RYZ5snZq7yNeNL2YU68f2DFEO2pIN3n4RoVCUgpr
	mu3RReCVhPVrwSHZi721h0+WIzeIgDz/46o6kSCzAKXbP1wRBXyzCpFmpk3jLX/WSIL+9zbNBwH
	IQQsioAPD/cjSewagg4QnTNQdtbeTXZ/cbmd14i6RnRQ81V4PqMd/nlnhqMU9d3JCgETd/QFMOY
	3mjtHz3ybu66ATbibM8QAIwslI5tCLV5qAUs1tBEUmIqG8RqQVBQRJbg8j6ac+sIV1+0=
X-Received: by 2002:a05:7022:28f:b0:18a:8164:ce4 with SMTP id
 a92af1059eb24-1a093cd97d4mr8439457c88.0.1793118478203; Tue, 27 Oct 2026
 09:27:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006-kmsan-serie-v1-0-07fa860ef3de@gmail.com> <20261006-kmsan-serie-v1-2-07fa860ef3de@gmail.com>
In-Reply-To: <20261006-kmsan-serie-v1-2-07fa860ef3de@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 27 Oct 2026 17:27:21 +0100
X-Gm-Features: AclHuK9c8fE28gGKxDufq8O67Wv7DJr-iUBAsIf-87SKf9461Q62BbIKzKxVOkQ
Message-ID: <CAG_fn=XHDN_zuQxrPEO_-GJTZpgasvYssxfJnxuGh49=FHmCVg@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/kmsan: Don't call instrumented code from kmsan_virt_addr_valid()
To: vrilutza@gmail.com, Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, Borislav Petkov <bp@suse.de>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 8:10=E2=80=AFPM Viorel Cernateanu via B4 Relay
<devnull+vrilutza.gmail.com@kernel.org> wrote:
>
> From: Viorel Cernateanu <vrilutza@gmail.com>

CC Ilya, as s390 has a similar problem.

> With CONFIG_DEBUG_PREEMPT, a KMSAN kernel hangs silently right after
> KMSAN is enabled during boot.
>
> kmsan_virt_addr_valid() calls preempt_disable() and pfn_valid(), and
> pfn_valid() calls rcu_read_lock_sched(). With CONFIG_DEBUG_PREEMPT both
> end up in preempt_count_add(), which is instrumented. Its instrumentation
> looks up metadata, which calls kmsan_virt_addr_valid() again, and so on
> until the boot stack overflows.
>
> Use a copy of pfn_valid() that disables preemption with the notrace
> helpers instead. It is still an RCU-sched read-side critical section,
> and it avoids the instrumented preemption and RCU/lockdep helpers on
> this path.

Instead of forking pfn_valid(), can we factor out the non-locking part
from the original function?

        /* Caller must be in an RCU-sched read-side critical section. */
        static inline int __pfn_valid(unsigned long pfn) { ...body
minus RCU... }
        static inline int pfn_valid(unsigned long pfn)
        {
                int ret;
                rcu_read_lock_sched();
                ret =3D __pfn_valid(pfn);
                rcu_read_unlock_sched();
                return ret;
        }

Then we'll be able to call __pfn_valid() from KMSAN.
