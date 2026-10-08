Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1F246AA9A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453307; cv=none; b=eC3WUCqVIwwV4m0lEHiQMLReNWTr90w9DhiI143jHbY2NKa/GRgbQnVsD1z2qe1A3f1mOCq36KYUq/+2mBrgKz//TJrYDc9qFoOKZGh/zqkL3SVRsp9G6CCAHQ6PstiO++2C7BQli+hbEY2wk6hfMvNPx/R+POVXj2Pp07NhZ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453307; c=relaxed/simple;
	bh=6mKzhGDxxBQhe1L1c9AjcjAufrdgnU2foAeWHDXdGPo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cSqSBBS9/a4sM+7JL2krs5PHuO9JQ+6BR5iUQXGc1NhSRHtJ7bKCbSk5qxU5JVYXqjtsnPXswwFIdIQWcX/rCgdC9Xcp7uri5znKAnCS/IXmBKI9/guw8QeYoTLTMHxJqN1wx+YGRqZFdpb48faCVAk/yW8SkMdSOLYnXOKIw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SFrbjmrG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NxroKc7h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SFrbjmrG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NxroKc7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791453304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2rwd4c1hFdRk+8gic1oWg1e821LH97Si/hZy7R8ff64=;
	b=SFrbjmrGbOfxNABEf6Uk5vyt3c9AYHTLhzFeJY3s9/c8lyvssZG8EmgVSuvT0TkcF784CN
	iXGjjr+b8rdzXH368sZPF3DOFXDKWD8zIhqip7NBR+PQJb0E28jOgfK8Xupfid+2EoMftZ
	9Nisqi/KPt9Ke7gLzMMjOLVG//UMy7Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-ckQ1DwW8PemJOx_Eqmlc-w-1; Thu, 8 Oct 2026 09:55:03 +0000
X-MC-Unique: ckQ1DwW8PemJOx_Eqmlc-w-1
X-Mimecast-MFC-AGG-ID: ckQ1DwW8PemJOx_Eqmlc-w_1791453302
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a125f5b317so6827145a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791453302; x=1792058102; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rwd4c1hFdRk+8gic1oWg1e821LH97Si/hZy7R8ff64=;
        b=NxroKc7hvVzpBGkQmQFsufie5p5QKFsZI4tUtA8K7KdpsJkfXLnlh2FLfzqiIZA6J1
         +m0m+gwlK2ltmbNjw8emjWxtxJiJ9+622Qjoz8FcArXcB6iR+OG3Ipe6qi9Fj0IeAhlM
         j4psg8q0iwB/x2k2S/2dEiG8A7WU6JwQZpt0zDiBnMyhxEI5yMxSOw4XpquUSkpA3ZwZ
         bC+kWh826PNo1tHos5xw3akK4D3E8WAdPPz8yThnvYElB6ej54aSHQAhVDdxTkCXvONk
         yq8eKHEDhHlUsesuc3lHMeJECn0cFqCFSaXU/qjLSlkhN1siPkbU3/kjOpqvfeXsd/My
         Sm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453302; x=1792058102;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2rwd4c1hFdRk+8gic1oWg1e821LH97Si/hZy7R8ff64=;
        b=AO9bBTNjkbYA8+1HQLKK5xTERcxTWk/aQ7T2Q3hLrNtyOpBew65tDP5IlB9zemJtcT
         PmBypoHkAdWzTLfLIRMsYz3yaL02PBXovZqbx1w1xyGCbBHc8E+wimL+6iYeVEYGQknz
         LFMVvrGjBEvxDpfi7sYiJrtzf1Kbc+RYuhRBfzzGofhEHp2deLqbLVSYgUS8ghoJiHHI
         gP1eq+fBcztcQfEEz3+X5Cq99nZHDAK795EAxe/pw0pne3jIq1jlrChp32OOegzsDkJP
         UD+x23yCEXjsW3Txuqe7Cy2TaVidskX6/lmrHzGx2uqu1f76QpwCHGJMtTuXxnwAxIrM
         AH7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzJgpM/F29lv2j8dKUGCwQ8xYrGzhCMCvIKQNENfCTKrYIRwX+BWTf8zYVeyYwD+QildugCWBsa3Sjx3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lv47LCCABwTfqetiQbNtc/tXXS+nRMQDkDL7LWZxRpqOKnZ05O
	nZ4IJW+/A2pQOHH30EOeCL6ZP5cv/WXpBJTH+3qbF+b3bQPpMHOBmxGOvLpeAj7E133vhEbWsyH
	PwObk5KFxdpiI10eT+84LvhEgosvMXP8I417GWnf2VYbl8CKgUW1G8U0ecE4nzKW7/w==
X-Gm-Gg: AYBFou0giRSXzl4mNOVNXLcWbNUpc0kIXubzVNkctWlKmuKVups+GaCGDgsYwV5uiL4
	XygkrwHyTxiTuYavl8HFnUWjqVSC5kw6Q7uK0pw/SRMWCEOW9ZiliGs2KJbQVEyki8YwFys7HZ1
	0NwtmQbXnO07yxb+jeVgDrVB5xnwT2Y8nCFjSuh8fNwwWMzWSibsue/WPGdS7KskcBZd5ZJpOL+
	IQNp/06XpRCjz2z+w6HlT39OZRO2oc1wscbGUW0zyLS83muB3ZmKRNKCRpNmKucmguNOgU09F5X
	7BRgHxo9bL/1W7JHYrrzS6lfPKZfpnHBabEG/YE0x2iUbFm3PEPHBoQiX8dELkjcfMTFRlqSQUx
	YT1qLsT4IF3Ikn+153TkBkMVsUROXY862j60mC1HrtKZAAmOPy/CYa5vkOKBrtSxbdotBNA==
X-Received: by 2002:a17:907:8688:b0:c2e:3f49:df04 with SMTP id a640c23a62f3a-c317bbdc08fmr523188466b.1.1791453302313;
        Thu, 08 Oct 2026 02:55:02 -0700 (PDT)
X-Received: by 2002:a17:907:8688:b0:c2e:3f49:df04 with SMTP id a640c23a62f3a-c317bbdc08fmr523186766b.1.1791453301931;
        Thu, 08 Oct 2026 02:55:01 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b00aa2b8aasm1188417a12.22.2026.10.08.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:55:01 -0700 (PDT)
Message-ID: <b1fb01e1c58893795dd4be346f233d39fe653aaa.camel@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Cc: Nam Cao <namcao@linutronix.de>, Wen Yang <wen.yang@linux.dev>, Tobias
 Schaffner <tobias.schaffner@siemens.com>, Viktor Malik <vmalik@redhat.com>,
 John Ogness	 <john.ogness@linutronix.de>
Date: Thu, 08 Oct 2026 11:54:59 +0200
In-Reply-To: <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com>
References: <20261001152042.124445-1-gmonaco@redhat.com>
	 <20261001152042.124445-11-gmonaco@redhat.com>
	 <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-10-06 at 13:29 +0000, Alexei Starovoitov wrote:
> On Thu, Oct 01, 2026 at 05:20 PM Gabriele Monaco <gmonaco@redhat.com> wro=
te:
>=20
> Overall looks much better.
> Some of the code reimplements bpftool, but it's user space.
> It can be cleaned up later.

Thanks for going through these.
Indeed I tried to reduce the code reimplementing these things but probably =
I can
do better.

> > +$(BPF_DIR)/%.o: $(BPF_DIR)/%.c $(VMLINUX_H)
> > +	$(QUIET_CLANG)$(CLANG) $(BPF_CFLAGS) -c $< -o $@
> > +	$(Q)$(LLVM_STRIP) -g $@
> > +	$(Q)$(LLVM_OBJCOPY) --remove-section=3D.rel.rodata $@
>=20
> What is this for?
> Released libbpf ignores it with "skipping relo section" message.
> Removing the section only hides that some pointer in .rodata is left
> without relocation. What is it? libbpf in bpf-next needs .rel.rodata to
> resolve pointers to functions. See commit b223044a68d5 ("libbpf: Resolve
> pointers to functions in read-only data").

Yeah indeed I used this to silence the warning. Apparently right now the wa=
rning
is gone (no relocation section even if I don't trim it), but I went back to=
 the
initial version and it was about a bunch of .rodata.str1.1

I'm going to test a bit more but I can probably remove this.

> > +struct {
> > +	__uint(type, BPF_MAP_TYPE_HASH);
> > +	__uint(max_entries, 10240);
> > +	__type(key, da_id_type);
> > +	__type(value, struct da_monitor_storage_bpf);
> > +} rv_mon_map SEC(".maps");
>=20
> Why hash by pid?
> Use BPF_MAP_TYPE_TASK_STORAGE for per-task monitors.
> Once there are 10240 tasks bpf_map_update_elem() in da_create_storage()
> fails, the error is ignored, and the rest of the tasks are silently
> not monitored.
> Task storage is freed with the task. No need for handle_obj_cleanup,
> id, target and PF_EXITING.

Great, I wasn't aware of it and looks much neater. Will use that.

I couldn't catch you yesterday at the conference, but I can summarise here =
what
I really wanted to ask you:

Reactors in this patch use bpf_printk(), which is in fact a trace_printk()
instead of a real printk, is there a technical limitation forbidding us to
create a kfunc using some flavour of printk_deferred()? Or am I missing an
existing one? (this need was brought up by John, Cc'd here)

Not needed in this patch but potentially required for more complex monitors=
. In
kernel, when timers are required, we allow monitors to use hrtimers (precis=
e but
heavy), or the timer_wheel (lightweight but less precise).
I'm not aware of any wrapper of the wheel in BPF, but I think a few kfuncs =
for
these could be useful, in general, also for other programs needing a lot of
timer instances or simply light timeouts.
What do you think?

Thanks,
Gabriele

