Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6FB4B3CA5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403188; cv=pass; b=HAU9d/xzbfKZH5Xt7OUqRk52enT5zRT7uo5UD3HsIDI5hycZyeEbEGcghwWp+8wwo2VyycMrjoSmbQOT1jSs5S+soG0IGeNZvdgcmPhKjzoF5aapFsTFU86iTDw2HwbFUx/7snUAMxeGksGR8+JzxX0F05luLe558gfMYZmgQ0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403188; c=relaxed/simple;
	bh=SmLex32CfN0i1QL4gh5elS6PvTSOZDSeNkGgujocXKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sjqtu/O4RDbLhi5DVWr0bBGIIlvd2v1aHhzpZHOG0QiouklB69bn/9vBoeSoQzGGaeoOdjDVS0X/iDRN8OBT0znyQiFNhB6IGeWLXwVCUG4NvwXcXlwLZ3g7U1fOXZwO6x9d933heUrrMrtvjXUqesA6qeFbwWgYx/Gd1Z0irpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AcTWPhus; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V1ARUBtL; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AcTWPhus";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V1ARUBtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792403186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmLex32CfN0i1QL4gh5elS6PvTSOZDSeNkGgujocXKw=;
	b=AcTWPhus6Bmr2mdwl7BLw4Xd3s4ZUI4nOf+W74LcsBEEZrwFnucJePgIvJFqTqvxQhg8b+
	uTSZ7JCEqI34Cj26mwY831wNMmO/Oa4s1F7M1PitxlNUOzTB5HBS12rDL+Aui1gvV5b00U
	/nUny8pWFDGZ0ZSipWt4rXWCTQyWhw4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-cdh-RMwlOMSekihYrG9IaQ-1; Mon, 19 Oct 2026 09:46:25 +0000
X-MC-Unique: cdh-RMwlOMSekihYrG9IaQ-1
X-Mimecast-MFC-AGG-ID: cdh-RMwlOMSekihYrG9IaQ_1792403184
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c3f8e149ccfso172568166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792403184; cv=none;
        d=google.com; s=arc-20260327;
        b=DAy0eyaNchcHM3RXyyM5bMWcm9JjAPjPliIo4jiD42tj3z+Z7S+xsoq0kp/y7SqadH
         WutVFqRB7m9i1epOnHg87y5x/OvHwKGyGvrsSfgBus3PY/G79Q3ChWLXrB1UN26muFTe
         +GwtQBzV8B2HK6Zvm/KzlMi86zn/B80SX1ZRtNn8PMxq2iOl05HKodzc3sCMRXk6x3nJ
         GZWLpxx8XCV+A5C4+tuXLe0V4pL9waBazFKlLLkTfbG7BObilJRMS3MOn10PxcBto12R
         bL8j52Mt4zVIBAVhxo6SN7hGrFnaF6NwFy+j4cHJ15M4tGQWdKScm5n20pjYNaV/tayO
         kq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SmLex32CfN0i1QL4gh5elS6PvTSOZDSeNkGgujocXKw=;
        fh=nb0fDxyGugwD4YODyPcxxM59sJ8r+UKp6LwJHCpXhjg=;
        b=DdXv5GnqI2Gzjxn/EUSZH5auvP5gQ7hQsJ0D/YSYkhG8ZXxh0tXJOk+KYxwWYCh/Q/
         EDeq0JA7OkEhBNWnPl58I0LaQFVLez60NwS7uwefkivzQGXV3xAwqid2e3EgptXRnXyG
         iWBoJyo/46tqgXOZ/j2jE1bpzqNlWjFTeZf6zpRmzwTjOiGJWUIPrj0aSHZjYCQoVR5M
         qWlG/wDAb0ow47IxIHj0tCNdAQYsTwxlyBhK3shnAIBMtibMeluwYvhQ82JrGj3vYr0K
         QOFC3ZuEzcpZPi9PwYmyFdsDsXbjWdN7OxzMpe/H/Z48nCm/VwfyEfKPmD/kysp+XMVL
         M2GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792403184; x=1793007984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmLex32CfN0i1QL4gh5elS6PvTSOZDSeNkGgujocXKw=;
        b=V1ARUBtL96GNFwCUUT9Lx3zGqMkQOLF3X5NbQgHRqyLhYNrW2WyPNNDGtw4YVZqU+U
         SYyjRU24Eqn/I07vJvLcOzGTTBqswZann2YtUiVUOWzjr9Qtk5aD6Qv24d/q1K1Mp93z
         7ClKbp5aKvlQlZq0t3a8b2sODA4K//+ILo9dRxTFyalfUAaYZ1xOjAde4jFlkpK/9u7P
         ROpUehn5z+tPQbJ8gWv04BS/MCqjj39vxscMgvlYYkHbJj4fPfeE6DLiaH00gLKhTI6I
         Kf4ovFHG8Id9UvXcmVmul4LjtOtBZ/0yDkFD2vH6yf3yxg0dmlk3H1ZN78TLvB2obJV9
         VPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403184; x=1793007984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmLex32CfN0i1QL4gh5elS6PvTSOZDSeNkGgujocXKw=;
        b=BXus5YMUAzUletUthhF/Hb8eu/JFTpludjFbRy0v5g3YgOmvqAkB5pDNK+VwhDTT4V
         pIzrZSZTPssyO1VJK+8WW+PWdGfrA1kgz8IMPtPBz/xmtImEMDpT6UhhPoqI0vW5TFee
         ujbQ2+/oV7bE+2eXPCjAUiRhiUwfNpX5d3wrDSFr/N1UKBajedNpgAmAgrtzrrEN62ap
         +Zs81oSQhnK23qmznVOPzRS0F8OjHfPSr9MKEqKzg+k/jn93FoOuVZVTyM+pMot3QYRT
         q/rxQ6iQTKYXe0TgcO9Sj87f+sWWaakOeYJ70jKRxtu4rCceyWuT24RreKf79ueq9eCF
         MghQ==
X-Forwarded-Encrypted: i=1; AKwUvBxW3O1vk4uFBZd15ahEz6J/WhymmDut0tNdwEjqtDRjwEe2vDA471AEDFjmZkSvVjj4aa1er+RJYHidtpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL1I10DtjZ1pqoFRWBTgwrQNcXLzCUKYnU8VSX/WWw7F66z5/H
	0XejmuUQSVzjDXouey+HO5SDnqQJDYjoeEY+OxMvFUWuLijgJsh9tPp74Bp5SXshRcPmOOiKMSQ
	/XXsIeTPxyVHTI2c6TtctgPUg76s2jpJ0MQt2aCILmChLXfeiieUKtyndSGJP8AUbUIMaNSJe3g
	q07XMsh/CATZeUm9XRHH2YdrNVexPtwSY0MQIiTHBD
X-Gm-Gg: AYBFou0jtWdEwlGFAiQu5hjuidbIqYU/B9tNPakIH0JoTenGjPCSVFqiSm011gsaQcT
	+kEVhnCY82a4oSy7JXfU5OKytvXZwoqdioKTGVKfgIYlmS6aMmO7PnCeLujGCu5rxtNYkwqRVZL
	k2xI311Obs5v4u88nzNcAw+zp6s53+At7PBHVCkEJWjatj6X+YVWwByX1bvOg559oSBmXLYxHla
	zUhID64HXfJiLo=
X-Received: by 2002:a17:907:9725:b0:c41:8e21:4d58 with SMTP id a640c23a62f3a-c419a256eb9mr501680466b.5.1792403183870;
        Mon, 19 Oct 2026 02:46:23 -0700 (PDT)
X-Received: by 2002:a17:907:9725:b0:c41:8e21:4d58 with SMTP id
 a640c23a62f3a-c419a256eb9mr501677766b.5.1792403183439; Mon, 19 Oct 2026
 02:46:23 -0700 (PDT)
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
 <DM7I2PYHNKXE.3AYY3N1HATXLW@gmail.com> <87ik2zryzo.fsf@jogness.linutronix.de>
 <0055967d4571e7c8549dfa476fa6b15b93013701.camel@redhat.com> <87y0buox9f.fsf@jogness.linutronix.de>
In-Reply-To: <87y0buox9f.fsf@jogness.linutronix.de>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 19 Oct 2026 11:46:12 +0200
X-Gm-Features: AclHuK_NXeaiajImg7lC8SzWuELhdtiOXhAgcdN_7Skq7dYerLf6JAXl0TbAm20
Message-ID: <CAP4=nvRXYieOtqLuE6SypkKHf1gtEjUbegb=wYiLtmAM9SHuYg@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
To: John Ogness <john.ogness@linutronix.de>
Cc: Gabriele Monaco <gmonaco@redhat.com>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Nam Cao <namcao@linutronix.de>, 
	Wen Yang <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
	Viktor Malik <vmalik@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:34=E2=80=AFAM John Ogness <john.ogness@linutroni=
x.de> wrote:
>
> For production environments, I expect that trace_printk's are only
> occurring for violations, in which case the cost of a string compare
> will probably be irrelevant.
>
> Are these trace_printk's available without getting the scary kernel
> warning when kernel code uses trace_printk()? We do want RV support to
> be enabled in production kernels.
>
> John
>

Since commit ac5a72ea5c89 ("bpf: Use dedicated bpf_trace_printk event
instead of trace_printk()"), bpf_trace_printk() does not use
trace_printk(). Rather, it is recorded as a separate ftrace event that
has to be enabled, in
/sys/kernel/tracing/events/bpf_trace/bpf_trace_printk, for each
instance that wants to trace it, and using it does not print any
warnings into dmesg.

The BPF documentation says otherwise [1]:

"bpf_trace_printk() is slow, and should only be used for debugging
purposes. For this reason, a notice block (spanning several lines) is
printed to kernel logs and states that the helper should not be used
"for production use" the first time this helper is used (or more
precisely, when trace_printk() buffers are allocated). For passing
values to user space, perf events should be preferred."

[1] https://docs.ebpf.io/linux/helper-function/bpf_trace_printk/

but that is clearly outdated.

Tomas

