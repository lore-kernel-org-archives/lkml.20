Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675B03EC808
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293370; cv=none; b=Z1ewKERolHVqzPIB/Rb6C70P7HBfZlXMTSKICWZzeLrhGgrww4NzcToxjF/+yh7YAGBYSZsrX6n9zVGeyE/JfRu/Pm5YcRFxK7Ut9eOcfaFO82xA1qDfGw7rzE4TEaYnqiRetkjIeIuE6JU5ZU7GKUbEvHixAwZwAXIr2AZKMF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293370; c=relaxed/simple;
	bh=Jd9JtVPsfeTOoO3gMKQ1tUTrmD8+wav6j6ck+BCGZGY=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version; b=Hlj1RMbJ75W12yfnBqReuxsUwRWQdXhdHCYU7mYYuxEsg76CgoD61UrjJg6+pEEXcooaw8wMojfMW2zAZzG6at1IPxwaCLC/WklOtWCTZmy64pIuEhp6WIy5x4kC92YmXZoQyAzEjl471lyModOdsMENfUMo29dMx4CgmwmXJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc3znzuP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hc3znzuP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2dd76b1361dso19154965ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791293369; x=1791898169; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZIuf2SgMEBmvnAUyRYToawlWCUpnefJ0N51oaV1vfS8=;
        b=Hc3znzuPKQ/mwixmIQP2ycX4J/cOUH7DraEc+sktZOe9jRKPPs6YMTouF9E4VMRVqm
         7LWng5g/bGwCwTSv3VFvrQctNypjYu9UO8RIf0Pd5pIqTBJwtFyLWRiYGhMN0fi9MHIn
         1urvLWWsYJdD55WEwFP6ORXTWawEBByNUzEQPdvXrMqHEzDqM7bYVtT2V1uxnHKJvl+I
         F6uDcAK4vu/HmRaaKkaBqS89WZjsetiwDibFmQOxKNAzpQSoXyK4c3ASxLeK3AfVe2fk
         MK0swa8XlJr6WYakGexByrteLw3c2r55Sv3+QfevEBla1ErvxC8OVjkb8//7z7T4JB9H
         ZmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791293369; x=1791898169;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIuf2SgMEBmvnAUyRYToawlWCUpnefJ0N51oaV1vfS8=;
        b=s2Tw90Cixlr9rrA6F1JdN26ZcRfu7KYT6subsUj9QjoaQ2TBMdub2KSflgkA57WAXQ
         z8Sg/+58Ou2c7Zkgk7f+NUsXzaD31QVg50SIFJAS4IXsfclQ3W/mUsv54oN/n8feM5YR
         eVyUIVFxeaSaYuT7GyIDZcjNB+gYA/CSB027FrTTsE4CfSoygxBIpj9IK0RPIRzs6ErH
         5X9r7fhmzV+1XS11Z+/Fkw2nUGTLRuavvmsU1WJQypUwA3OaURNZPy38oZWc2xBvw/t5
         qubuEhfkz0q9E+6TcKnjXAhseQk3ooyg5tOVwb4/8nqk0tfO1+3CHtPAQRHjdRVxCK2L
         XqEg==
X-Forwarded-Encrypted: i=1; AKwUvBxuBy1xjwqfDPY2yyKM8sDF75Av8sTsRuSNtJOGFOJT9bl/HczFWM8gnxsXOrjAwDFwwiKFhmuCw6UT3Uw=@vger.kernel.org
X-Gm-Message-State: AFuF++nHUfbhc2jPPjt6cnM9dIyMlO35d6CGnvBhYD1qUC2rovd+5QjO
	ompwJ7zjjMGz+OS0Cbb7RQwPhDIPP9ZUpQ6He2uVGRyqDVYE4Cjc6N1c
X-Gm-Gg: AYBFou2ikwJeEohw/nZEM19EUC/7qQc8nANPia1NTZ+ApdEFpYRukBLYgmdjpY6u28o
	UC5qyvGZe1WFGi0pIKOl55CpQwZPVFdYD0r0D3ZrMTVoPLq+kPZBm9I9cYAPgRoZx9/k86GtZSo
	M2fxHJhBbDp61H5OtIMe4+WdgiPH5pS7YxtbwJvm/1q/3tH7BkXEXBSu74ll3bCXG/ufUhurGZk
	Wcnd+X8MCSfNHb7shFAt2yIEQ35VdqmMT5Avsj5TbL61RWYqYd5qiaL4EKM2Og4sD6UpjYbq3HC
	qcOQcpj6foHp77ki6CZdniKlN9p2E3JmVjADUZjQYkJ7zOVw/VEvv1FLHIGQZjL3SOBPXp/ATwR
	IPnpU8VaayrclSNRncS08GPLjNIY/ekeUTos6cOVDJmwv2/27neRwzCDbeiuWBW3K6o5qk8QuEQ
	aU67MOrU+RZ/eNlUl0KG77mO93bnPBqbbdfBOW8kYR7yKAkkIIGaxqCrKC9kPGK6WBUbtXDoMRB
	gybMdXsmN3LzBjvc2307oU5GA8DxCr7dyaUPB7+iQq5gHdqy8mM9gE7I6riONYlI7WaGk7TlLhg
	HKYY
X-Received: by 2002:a17:902:d988:b0:2df:a64a:756d with SMTP id d9443c01a7336-2e51049827bmr86635015ad.33.1791293368596;
        Tue, 06 Oct 2026 06:29:28 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a55b6e01sm22625735ad.9.2026.10.06.06.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 06:29:27 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Oct 2026 13:29:26 +0000
Message-Id: <DLXSI4BSRE5F.1TLKCBUAGNDFQ@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Gabriele Monaco" <gmonaco@redhat.com>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>
Cc: "Nam Cao" <namcao@linutronix.de>, "Wen Yang" <wen.yang@linux.dev>,
 "Tobias Schaffner" <tobias.schaffner@siemens.com>, "Viktor Malik"
 <vmalik@redhat.com>
Subject: Re: [PATCH v2 10/15] tools/rv: Add BPF monitors
In-Reply-To: <20261001152042.124445-11-gmonaco@redhat.com>
References: <20261001152042.124445-1-gmonaco@redhat.com> <20261001152042.124445-11-gmonaco@redhat.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Oct 01, 2026 at 05:20 PM Gabriele Monaco <gmonaco@redhat.com> wrote:

Overall looks much better.
Some of the code reimplements bpftool, but it's user space.
It can be cleaned up later.

> +$(BPF_DIR)/%.o: $(BPF_DIR)/%.c $(VMLINUX_H)
> +	$(QUIET_CLANG)$(CLANG) $(BPF_CFLAGS) -c $< -o $@
> +	$(Q)$(LLVM_STRIP) -g $@
> +	$(Q)$(LLVM_OBJCOPY) --remove-section=.rel.rodata $@

What is this for?
Released libbpf ignores it with "skipping relo section" message.
Removing the section only hides that some pointer in .rodata is left
without relocation. What is it?
libbpf in bpf-next needs .rel.rodata to resolve pointers to functions.
See commit b223044a68d5 ("libbpf: Resolve pointers to functions in
read-only data").

> +struct {
> +	__uint(type, BPF_MAP_TYPE_HASH);
> +	__uint(max_entries, 10240);
> +	__type(key, da_id_type);
> +	__type(value, struct da_monitor_storage_bpf);
> +} rv_mon_map SEC(".maps");

Why hash by pid?
Use BPF_MAP_TYPE_TASK_STORAGE for per-task monitors.
Once there are 10240 tasks bpf_map_update_elem() in da_create_storage()
fails, the error is ignored, and the rest of the tasks are silently
not monitored.
Task storage is freed with the task. No need for handle_obj_cleanup,
id, target and PF_EXITING.

pw-bot: cr
