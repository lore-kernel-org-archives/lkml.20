Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823297;
	b=nV2+3MAE/cxRUfgv8vKnzOKZZ0VXXRmVXTTCostc6hPVlqUvHoDHqSk89d6v1kWx/sx0
	 4UGcJ+houZQSxdCSV9szrUcHDx2Et3XEaUVdVUaiWrg+TgI0bV+72Xdn/6RLccDhg1Bgx
	 gPXIT7wCeGg3mV4bc2fw9PdnMf/9JY2UEU240U0kv63YK13qJO0dZgCr3uC2/0/+ouZjG
	 wIU1Iucpx+t6nONi+iFkpMLRiS84ejNOGbWG2lWYInEf7Q611i8eBNhIjpOUenOZ9CDc4
	 Xq8blrjJz54taZ9QBEsGaAPn8I+aam64Gj/htuEUaxkTo3ClS2yCAJJfbBy/22pTpcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:
	 In-Reply-To:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=AS/luxCxZZ4IKfwOyJu4Ue765u+vBG+6P6QAZr4AiP8=;
	b=EllsIsvOAlHrZUh7VTlvtOuzEAxi4MDSrRrjlWC13l1CpRF0ZQDCggdJZxOwI8V6S1o9
	 ZBvQQYly0Z4ZD9zGCROoM29vq/OcecWGyzqzMgt3EtDKnMOiJOKHTgvRWGqKLORZtIIEL
	 xknpeQF5MjjXTsI3q1QWkzRTbG8I8eRBf6k8eapGWk1ZPh0nriZwcFKqn2O97ECP24t7W
	 ePjl/hAIcf/VlzyM+VvdDpaAU3ckeXXmb4ujbH2/FT7WurIm/1WJRpAQViJNJVjDPF5L0
	 F17MYgbYUt87RfAJM7YVMUK1knEJLHtT9BV6ax1S7MfpbmjeSV6oxWATbe9y5/gNWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jeffxu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WOmd94Mh;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3579960841B4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3579960841B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jeffxu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WOmd94Mh
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so1961051eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793823296; x=1794428096; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AS/luxCxZZ4IKfwOyJu4Ue765u+vBG+6P6QAZr4AiP8=;
        b=WOmd94Mh+1IsHCPkayZDec6JPAxqUizBUQICw7d1GTvFYhvGyIcRDUYVGA4mrhJ2Gw
         LlwBfvWxf6C/dkbd/wYeCVyGFNqSQNTNemKeHNozM+B3thODy6YTQUG8zPI+Zc0fLAsc
         ywPjVR6u2U7pkPrIYEEEE7pR/Fv2GUmpGF5C6hZYbFhN+xzjvjlTlZgt1yXCOuMk8ZV8
         7dgvN0RspKuuDt9X8QL4OxxBptYW7RdbVtxUU3AipSC6ioGA6dVwnv5HTegyIPEZQbol
         lNJjqnZui4CPRajfzE+ydyWOkaI+BYJB/fWwmMyfr6ch4/bN/0JzLGDra0aJW3LNaEPF
         9UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823296; x=1794428096;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AS/luxCxZZ4IKfwOyJu4Ue765u+vBG+6P6QAZr4AiP8=;
        b=Q8RooP8VnxDHBTUUimoST7PQpXCR/z8fMHbwjmaa2f0xtMw5ywndlMKpnHvqPsqSvB
         pDpoK4zYYAxQf+ZxHSOtRQDieVoFY/GDOHJSaRlTLJ5pfesLumJbDf+X84RSFJ14B5VG
         909Xbh1zzA78l5stCOuG12WzQhTN2FWn9NI6VANjwZfw/7KgNUXbA/1uQC1trnveL4iD
         T57c1SDh+Tr4zY/ZA4sA2SjH20BJ2t3hAwJppsNkKckqh6T9SvyOP74q9gYWohOetJtJ
         j7yFtw9mxILAWarG+3GIUDVknyNEYamh867q0iOsWu67wbCVZwVWnA4HgeWsqbeH3xTR
         HQHw==
X-Forwarded-Encrypted: i=1; AKwUvBy7TMXmsbSV1lGPEntSEK0EyK0eJMHmGHhMvltmD8PlqA/ZitfVlKMqrTGza2xEDNWOLvPzlvJbLAD+n9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XoSgASwwz2/ac6TRF71LFsO3idoI5KuFlrzcTtIfNIfogKonW
	9H0eqcxsRxscmNvPI/vgudxxVtcovfx8FcfqBNgmrGnVqTrr+6NK6zTnC5wfOn9I0bcfHMRWDTq
	Xlpj9Zw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dybkf8.prod.google.com ([2002:a05:7301:3a88:b0:36a:e67:fbc2])
 (user=jeffxu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1608:b0:185:4ad4:3d15
 with SMTP id a92af1059eb24-1ac56302329mr19203878c88.1.1793823295901; Wed, 04
 Nov 2026 12:14:55 -0800 (PST)
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
Message-ID: <18e4f0c895c8d2ed.3137322e32382e342e3434.27cc5b.0000sendgmr@google.com>
Date: Wed, 04 Nov 2026 20:14:55 +0000
Subject: Re: [PATCH v2 0/8] mseal sysmap: Choose system mapping sealing at boot
From: Jeff Xu <jeffxu@google.com>
To: Chris Down <chris@chrisdown.name>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Kees Cook <kees@kernel.org>, Andrey Vagin <avagin@gmail.com>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Shuah Khan <shuah@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-mm@kvack.org, linux-hardening@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On Tue, Nov 3, 2026 at 11:17:43PM +0800, Chris Down wrote:
> System mapping sealing is currently a build time choice. Hosts which
> want it and hosts which need to move or unmap these mappings therefore
> need separate kernels, which is not ideal. Let's allow the administrator
> to choose at boot time.

Thanks Chris for the updates and for adding the unsealed boot parameter
test coverage! The v2 series looks good to me.

Reviewed-by: Jeff Xu <jeffxu@google.com>
