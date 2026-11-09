Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794257705;
	b=O8Y1SuPwVmtK74k+nidOuZlFuWiMsmBc8BEdcTMGib+ErCp6xPpt70id6Jsw0uVq/72h
	 abe52kkxppG/2lwUMYi0TcYWafbnT8VnkaGSDmATmqM5BWyizcDue+ndb7GkMbgFrN7oS
	 3ZQZErG2sq1jU46ZIaqeHFsud7lLIdbqNxR17yco2tV4t3OhqtRZOvrQuXdqB9T9ymrzU
	 mjTn4oUgn7E58CgscOr2ii50kbaKZbczFQmP//aGxUJgPrMEI3eeAUw5UK35zqwzWygbP
	 M0AVykAbh6mrd2iN3PI3jgySMgIhNXAR14+9Y/ljHPU/CvZ5ZYv8UjWf9DHY75Jb3JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y1VTS0UpwTi7iGDm58nlPTAXVAo5zOfjQYIrVOnYmzI=;
	b=OGIswPsxpeDefWeS587bKi6/BWIPbQNZhT4RTuD+9UDAznn5dv8nJFT0zS+iP7l7o6O1
	 o6/fAxJcoacCP+qRy2a16/Wx378n3zNyw+xZWSNP81g5mD6YNlr3ApvYaasb8kbVrm0ty
	 o0B1WFrO+mTMCqa7h2Ho/WVsmolaheEJzE6BfIJU7DUQCFqZVsjplpPicloyNb2AIaqPn
	 Vg8S4b08vF1dE/xOxwOS2ag9jUhU/qiDzoYphTQ2e+czHg8fW2arepU8FGU/tBodzIgav
	 xCywGndcfefaJ7eChnsVtqV78F2ImrJoekw19jau1f2EYD5+EZfaA2XQwLaBpBAOfgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d8MErA6a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB8A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d8MErA6a
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so664a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794257704; cv=none;
        d=google.com; s=arc-20260327;
        b=Nb9XOlOgZl8liL5xn1bUJpO+r4Nr0wMfo5v/ZIK27yPisbx9aXrParhNaYhPm7lQnv
         ErIbPDH/4g+eMxHP8NfFvQsyqR9HFKM4i57SWAf/dQ2eBsc6mLf8o3DkozbWflXqzWa3
         LoB0dfoJ1mo+naIY1DBAcX2j7xAdZS0wG1Y5QYk9g4dL8LhvDHxRN8TR/EPpDZ9CEZDf
         JGqFZwE2BGZCHcqYfdkadVqv8Eb4QafS9ZPMxeqNPPcl6VqncceKWBiCNSC6/zkHJuyt
         CU2X0nDX/I2j4pWmb/lOYuphmYFlre2V/qUmytGZdMxiPyCUK4is4q5oM6O6JcGqaBLZ
         MJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1VTS0UpwTi7iGDm58nlPTAXVAo5zOfjQYIrVOnYmzI=;
        fh=Xfs5IjVoAWfNTy8EQFYA7qSHGH/hPZsRYww5qMqVbCI=;
        b=d+jzd8/I+KWoXnhr0zxM4UFT+By/iVmDjiu4TWTh7Z9qhg+BKThf+cCVR0aNGuhoLG
         hOb2xbNjEdhpTa4N/jeV4PFLwXaJkVPzM8ETDjaWkFhdN/RKalSdxx4q1CRGhhTa1gkh
         OaoX8Fesm62V90Pdo5qsPZHX6YWn7yg6bP9Zjz6ceG77l8lEXku/i/mcIQjlGQB49X88
         Bn+JD7FPa/3KmoTIOnj4e48mclPHgqm0ZcgeHG2EfXWTjDQWgzzZXJ2FnP76andDF7BA
         RDLHF8D0Tjb5DtOAZbV2PiquqPBOe32VfNfPpERGgx+cqlqPY7c9hfZWwmyOGodjNqN0
         Ozsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794257704; x=1794862504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y1VTS0UpwTi7iGDm58nlPTAXVAo5zOfjQYIrVOnYmzI=;
        b=d8MErA6aqpZN3ltM/9izwfImOK3J34lAFY7OkGWDXXtoN/UO0qzBxnyFLxX7uhgIpM
         QfoR55t7G706xABzrnQLgA2MNeFAgLNhoo+vk1ONKfNpVWwT/5ExOy4TgQ7vmUFvEs1b
         irBSL1f6gyOQJCinu6YfH9i9NF2Nfri6O22srAsDlncVyuJjNMwrS4KZ4s1zvt0bo78s
         F+R+fVib7cb+KBpjg4GHPpSWLCkTO2StsloEiLGxYzFwnroLyE2NyiMIYlz8QSLpfB6F
         FHS0yJ+Vj8mRFGt+ATOxkODnspZ4I16AQzE7/jn4ui89AZzqE2qh7+q/HO6JCfYnlkcJ
         raEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257704; x=1794862504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1VTS0UpwTi7iGDm58nlPTAXVAo5zOfjQYIrVOnYmzI=;
        b=v/Dyo+XheeNP0PUstWcP9kN9q8+gZWeDQcX+tc94/MOF4puGLFoskvpgKJYriW2R+A
         WeBNPhpEdSHril0SjaMhuvLU6Wl5po87UB6NKkB2QhZ14NOQNwRCR5yOO2ByxMrRm77Z
         V+Y3O+SY4wB8QakbKY1+3DCwq2B2A7/gLJjqjXaGNNxCUxY2N7RkIbuzvBUrwGeSsU8C
         zQqTLVdR56g2XLltT8EBy0WVrT5DSM0taE08CfAmQB0ZZONk3PdcdpmNyO1269G3wXS0
         4xNXBJNttJ90CfqXLzhTxPWZ4f61T39GX/OgbM/UfgZMtLXym4hzs0zR7YIKeZsURWka
         G/6Q==
X-Forwarded-Encrypted: i=1; AL+hErEhDB1IO9RjgaZIBaep1i2AE15JJFBlQpxBvV1weBiWSjU5+VD355gdpQ3sEqK0wlkVyijTUXXx6Z+3AME=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jhEdcCBtoyqOoJC276qBGa2jlvV0DNXxWJ420XYKCQHewgHU9
	vO8VY8vqk8k55P2TTv0VaN1cuttxzbCbSsoSWDzGt5jYOQ0jAIvvMmVolSKlMEn/g0awhmePW/N
	CTYDldyz1zxWUpRZJcOQ0OuhCN6PbEr+hc2MngJEe5OvYPIx2y8tH/rOnvXA=
X-Gm-Gg: AYBFou36/Ju9ShlMVota73FEjpOjZ6OUegf2Ua4Iieo8EZdWayITO4hvZ1nbGfSmnUK
	Pnxn8Eik8l59zQwMRyNFyP7LHJ6DwwXRWiQHrMkHZWpT/DPX49lBjq0vhTf5QOYGkBQcnc5zKTH
	t+HjNQPnQj8lA4TSDoq8LMJH+x6Gf4tFytAeFiy4mdNm4+f8AKOo5XWcVMwBz4+nUuQhWnlhde4
	9bf7SAQI+jJsd6Jrb9WVJqmQolULWu5p0MEIWQFHkX3UNexwyOvEaMcA8E9015GdBnqybPow5cs
	LgnE5qZhhlaG8Df1PTLgIc5KQggqiahYcuhAyT9nFOuRCXLNmARMbBqQdicxZ/+YaoI4Ja12/iF
	mWf6Nd5M+kRhOVhz1maKfeBq6e9np/h1sIf6oILWkR4s4OZAhVLgsWlwFhA1Bb9judiRpZloM
X-Received: by 2002:a05:6402:a54d:10b0:6b4:18f4:94a0 with SMTP id
 4fb4d7f45d1cf-6b757764774mr18897a12.1.1794257703560; Mon, 09 Nov 2026
 12:55:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013927.166209-1-zide.chen@intel.com> <20261106013927.166209-13-zide.chen@intel.com>
In-Reply-To: <20261106013927.166209-13-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 9 Nov 2026 12:54:51 -0800
X-Gm-Features: AclHuK9VL9SJI6W8IBlFA0E771PuPYFu-UHiXMvW4iz27b7sgHB5YrbQONTlYQE
Message-ID: <CALMp9eQRfFV8=e2QbeiV-eFWHYtCqp_wr7=V6jwnqmzo8OzHRg@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] KVM: x86/pmu: Emulate IA32_PERF_GLOBAL_INUSE MSR
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:50=E2=80=AFPM Zide Chen <zide.chen@intel.com> wrot=
e:
>
> Intel PerfMon v4 introduces IA32_PERF_GLOBAL_INUSE (0x392) to track
> which counters and the PMI are currently claimed by software agents,
> allowing independent software agents to check counter availability
> without a shared scheduler arbitrating between them.
>
> IA32_PERF_GLOBAL_INUSE is a read-only MSR, and any write attempt
> results in a #GP. The MSR is not part of the VM state, so it does
> not need to be advertised to userspace, nor saved and restored during
> live migration.
>
> Always intercept IA32_PERF_GLOBAL_INUSE to prevent the guest from
> erroneously observing filtered fixed counters as idle.
>
> Originally-by: Yang Weijiang <weijiang.yang@intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
