Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F040F4C9DEC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404130; cv=pass; b=IRq7HHLvzOMy9MkUpqI844jgKk+2rxgQC1bbneg9q+qEoyTzk7Dn8fjLSv888eM7BswtIghRa0cqZUlOt5jtCtJ8dgmlMC195nWnlariJB+Qwz2f1kgubrrjZn/4D/cRJT66FrEqz4W59TnZX3cuVEmMeBf9oK1hgE49ATOaquI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404130; c=relaxed/simple;
	bh=vpWpmb3YDa75S+dGCCi7peYWMhttJoCHOLpxALx7pic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uo17gcjhzTxBgRPVKLTdra0TmHAuF9OEcY02W3eqw/lAXKIoLClwzRnim78qNYfx/gF90ICt/Oe0exGmvg1F0NbOHJX3RkkMErdvXP/TeSHU8p3+FKTbdIMLrSfyt9yAtpfeuLnF456ferUAapGlSVWiDWyZJeD3tdq6Hw9zEt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PE8h4Syn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2hfNfew; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PE8h4Syn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2hfNfew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792404128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpWpmb3YDa75S+dGCCi7peYWMhttJoCHOLpxALx7pic=;
	b=PE8h4Syn7fcVff4360KKeGmn9N3z463/JATIHJjViNxj6YmKhKje8QXX/zwu5p72FWCwPl
	19XNdLYoIZj+BhJS4xNJTu1k+0wSqVs3pdOu+q94VbjoJO7S66MiEp3irwd97DZo7Ty/t6
	mJH7FeWbAepp6GiRn7AQnlZej/hhkJI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Mdk8wnRuPXuly9LzBg2g-w-1; Mon, 19 Oct 2026 10:02:06 +0000
X-MC-Unique: Mdk8wnRuPXuly9LzBg2g-w-1
X-Mimecast-MFC-AGG-ID: Mdk8wnRuPXuly9LzBg2g-w_1792404125
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c210c66672eso227954166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792404125; cv=none;
        d=google.com; s=arc-20260327;
        b=cAspQftqjfgG/avcsuABtc1Vu9RJnGiyEBcCi1G5HsZ1b4zHD0pJ7gs+qGQPK5QKn3
         FSPH5SCmRRA0RgImO/NZcNat8ZtzBiWw3NzwHpR3OvZ9vdvTseUHz8GS7p1XTvFj54jm
         pjLF+WsU3pbGmae83J80OXasln9e36Nq6awOfIjY9ORIGRKX2lcRBo7Y43vo+A9yP6j4
         rPU0TmTJ5/HWhqj8d7uh8+RSD5L0rsPFQnnoe95Ck8ebVleRj7Lc42hGyqu2eSgJid+a
         ndIvUGmR6DXQcXXEG9vB7O0F3aR62oOjxpPwA+1HDcGMJOK7EYqhUMlMJseYCmCmR/Qr
         WQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vpWpmb3YDa75S+dGCCi7peYWMhttJoCHOLpxALx7pic=;
        fh=gtKYzILaB0LR1L2rfXIb8R4O9Sdhnmovu39j1QGiIJg=;
        b=HWJUMVT7Nxoi2xD9iqhBiFS7EPaa+X60d5u/jsZEjYdkd1VxKzULCUllLFVVKhlPcZ
         DLXFLtD3O5elEo3axsE9ft6Yl/t2ivQtuUl2XeHes9QpIqQCXcu/K+OacV79cqYcACAi
         JX+XBf3UyntfyZMfLo6q8Nyv0VbT43ujM21x4vSIFKJLXSOIxfmQDqJE5AAOym+wuwuy
         Hna0ydlVsrUBxZrrHrKo4CApwgHo2tHuC+DpL3VCkVO6ZxghQz9EI1V7OrTuZPPGgU+9
         Ur8m7qQlZ/i61/pt64QU/KXr+o+JT5XExtvpSVa6ejpduZim3l8k7BkchMnkaXLjn18l
         Nv8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792404125; x=1793008925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpWpmb3YDa75S+dGCCi7peYWMhttJoCHOLpxALx7pic=;
        b=U2hfNfewy1hD8UOmqJUmLOdTyhkIfqYpBwI2KYmpBzMC2tCUzM7WFlfR0glfsjUb2v
         K3iy0790fb2N8k6qlJWHMYi2bIoWVh1jF2G5Pj54lXN9devsmZfHmTZlLdNJlCBAkY0c
         j26wZRlT+ZWhOrR1oGeKtw3cDOpEVBP0CfVPq1gqopLLo18hmNBWmaLvNbVg+hPus6ye
         9pXKqabYTgWrrEEOupUDzrMIgFq9P/P20niiJ0YsWkxIrce/3CVg2tExyVtGk6yAP59D
         mXYRgNjHxUFZPMi+d4WPV96idnixAN6HxT6QJzj+7rOaPTlcKlkBOiCHrJc3z3nHQKxO
         /dXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404125; x=1793008925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpWpmb3YDa75S+dGCCi7peYWMhttJoCHOLpxALx7pic=;
        b=AAUy+l+3zGewiL7fi9NVid1gxZtuf5hftoZGNzr05+l9ljh9wcsyhIxyyxNAXW3EIi
         v1hlRVDzzZB9qlTGOeJ2LLwBojYqnt8shXVUuYGuGzIUvSgE/ABhE95guX+oNTT3Sk3k
         Mppjtz4qtdPsbbavaBrzcd76liMeA31HfWJIjdithW1dFQbIzP7TtgIlPZxyl6Mb3i2O
         Dm+e8LxZSb7Z9UOV27kDVVl9lO/FevXwmBvy0oWNjMXXgniYrxl6/Zfe3PuyeLXaWSR+
         zPY31ytelZql957/79gT2lEFUQyM6DLjMC054F3EpcMHIoijH4mOpcbmgr8LR5himYIE
         myxA==
X-Forwarded-Encrypted: i=1; AKwUvBx3PzTTucm3jkmJ9M/SXcVu/fnkMM2sryYD92k4rgxSRjsTo1Xgq+U5LGGuB4QaEEXc6kTUbetShIW/ZVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfk3/5MO5PQcULCW8gRasmWUMp4L0owmFnsBbTRBznrM6FhgTD
	O9JvxyBQoLV1STeY2tiiPPvjA1bT/puYjn/gvDVZUWp1z/yyqtaZKJoi4+AizysrA5OwIV4jT/h
	1+YOT2sHKtBO7l6gwiXf91ax4L9Q9LSN3gI1Mts9pnPbFJRyEnSJKVRzxviq2VdDMw6vcUSClVo
	YwWcz4dQy6Nf2GLBFy4Ckmzftf/YGVsd8lJ2cuhebC
X-Gm-Gg: AYBFou1RlEWuOAaxVMfXqMGoG7nYctPIk/OqpI0LP2RdmaeETQEsP1F6fiNllrQzt+4
	0fK0kEoRDMprHmX963FJM5Y2F0zUnlPBAZqzQ9gBsZhG0Tm1UJU7JsAAz5EfiPIleZVp9vhAbZ7
	KQHer8poGx4Yg15oOu5jEi0WQV/oKXEy6ynhXAfk2G6WXCR4OCii9GwEnO/zsr631seUZHSqq64
	OLmHit0wylGkw4=
X-Received: by 2002:a17:907:a2cd:b0:c2e:7e0a:572f with SMTP id a640c23a62f3a-c419de3d0f6mr427564066b.21.1792404125340;
        Mon, 19 Oct 2026 03:02:05 -0700 (PDT)
X-Received: by 2002:a17:907:a2cd:b0:c2e:7e0a:572f with SMTP id
 a640c23a62f3a-c419de3d0f6mr427557966b.21.1792404124608; Mon, 19 Oct 2026
 03:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001152042.124445-1-gmonaco@redhat.com> <20261001152042.124445-11-gmonaco@redhat.com>
 <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com> <b1fb01e1c58893795dd4be346f233d39fe653aaa.camel@redhat.com>
 <DM6H7SK4YZ7A.F0MM6C0I77OR@gmail.com> <878q3xtptq.fsf@jogness.linutronix.de>
 <8B3FF026-6159-48CF-8FEA-AF2FACD2E4EB@redhat.com> <87bj8s8ih9.fsf@jogness.linutronix.de>
 <DM78SVMBI2XW.2XHVC67VON48A@gmail.com> <87v770uuyr.fsf@jogness.linutronix.de>
 <DM7I2PYHNKXE.3AYY3N1HATXLW@gmail.com> <87ik2zryzo.fsf@jogness.linutronix.de> <0055967d4571e7c8549dfa476fa6b15b93013701.camel@redhat.com>
In-Reply-To: <0055967d4571e7c8549dfa476fa6b15b93013701.camel@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 19 Oct 2026 12:01:52 +0200
X-Gm-Features: AclHuK-g9NcQuSX2oEVaSkoEXxNQmoV5Ee9U7uVHOzoGFLemx-m8yG7uigcHu_s
Message-ID: <CAP4=nvR2i092924zszA8Qh0UUYnwXfAsa+7KjPe-NpwC+bbLXw@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Nam Cao <namcao@linutronix.de>, 
	Wen Yang <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
	Viktor Malik <vmalik@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:05=E2=80=AFAM Gabriele Monaco <gmonaco@redhat.co=
m> wrote:
>
> Alright, I'll focus on trace_printk for now. As I said, it's rather trivi=
al to
> add another reactor later.
>

One disadvantage of using bpf_trace_printk() for RV violation
reporting is that the event will be caught by every instance that
enables bpf_trace_printk() and does not explicitly filter rv out.

I can imagine an RV-specific trace event for that, however, it would
require a separate kfunc to generate it, and ideally also distinct
labeling of a BPF program eligible to call that kfunc. The "rv"
userspace tool could then iterate over these labels so the user knows
which violation events can be expected to occur on the system.

Tomas

