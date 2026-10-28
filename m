Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793196221;
	b=0N3uH0wcg7kGKXBSFg8Esx3FV4cNYKMr3FfrDDJI8Tpvp91vbKSuSVym5/14K2qNu6yR
	 uTIvUziOwNBgkUqwAg6ZJEGKsRhyoCi0MOjSa/4m04WyUI95cuwDrO6BTQ3BW7AvvzKhh
	 ci1ROed2iq4n7aHdzMOmm9DpAQjkaRmFh/4YpWVlSbH73M+0gDdxw1yh0AQ89UHbFjQrS
	 HG55WLSG1iXAOTchoPbQU4WtRXi9b4n/GWskEjw6dUUWUK6F1XxaLCq2Y4TcrG6Rw0rBu
	 b6Uova/LuJlKFbWToAjc+Q9yi/Rfr1h4k6NVdwE1tqY1NjQFpFystF7wX68aV0tpxWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cpfmEgae6k5vFKgQGlkHKShN8Dis45x4arKxMEWCmng=;
	b=fhkau8yB6RLJEi8mzTMohn3zNCH4OhpL05GSiIlo9yhCd8p9buzpB9ydGSdWi4Uf4on1
	 GRbTQA9Rn8PyqWB6uXhB+NXYnbpnUnED8XqkYLcoD1RU/n3eVWJneP1MpirPkGlu1Euii
	 Jo+FpfbgK5TmKmhtuSTQUrqjPTXAjhUHsyJdMyAtLc0X9sqsnwQa1Movy+o3La7CWcSze
	 LaHdNkLu2xwNmN0RHIJKP06ADsBnVgvVktC7HOcsadcXsU8ouB0axnaTbsx2sgBGVyMs3
	 9UsuvooXRZ5y45sdvnO1BefyMTgH4+MovPmiRIuIX7k9aQH/9utJ2ZQeRzopIDr/iTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AasyhHij;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF64606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AF64606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AasyhHij
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so12581a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793196219; cv=none;
        d=google.com; s=arc-20260327;
        b=GMAC6OT3m4/dx81jKsn7+vVHw9QMdM8Zy+iE3E0JVtrLRxYFYDFwrRWk8CGx3hV0GL
         S0qyhfEhVudYjAGPbA+UKuZdc0hR6eO7XJLBtjACXhfsOkOY0Ebk65/5J1PRHVHfCsSu
         wnArZe8Bkqpq9YsTuqp5M/IkEjlZ9r2wkNGY8rWO6svF5kJbfykYKnhljHVaORdW2H0S
         kI9/R1NfcB/wuFHcWEnVREIrdH5hMhjUMd0yw/rpuBPiGFbQIWIvcD1NywEyQoh6IoU+
         GKyCXFn7synVtyquSVnvqG0x1sTNYF2OoAS7S56Y9eZ0xuOCvGvs6YcAP7D5+uup0XRB
         huGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpfmEgae6k5vFKgQGlkHKShN8Dis45x4arKxMEWCmng=;
        fh=BUjTU3EDQHUuaF6O+EyLCof/mCn3a6b5MP0wVgTJM6A=;
        b=huJxVmPPqoiuXxs/DuRBxL6frVY2PasyfQMoviM+q1es+nRhqHDcOYNE9oH+Agy0AA
         euAqIRcO1Cbssq2rSpjXd9+1vT9JNEv49g2LUBeomyVOZ14ix6FMBOQsyQQ1jFMKIVJ/
         WeK2zGWc+dXMulkxlII07f+2rj2nL2QmrBk+Mn75pwtCvMF9o+S4b2+mxmXi/R1xGRb4
         6TeasxpjXzNDXjmP0RHiq3Zn5TGHCQsc2oKjTZin5Pp/76ceUDeZqWNVo2urhtpFCMWx
         9TwGnC44vqFJMmHkt13+rCWLMPqQETU+NoyHkB/zLnvjEVA/wVUrb30+K98Gk+v2/YXx
         oOWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793196219; x=1793801019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpfmEgae6k5vFKgQGlkHKShN8Dis45x4arKxMEWCmng=;
        b=AasyhHijWVk27KSw4bkqXndC0Gp7CW1gh1AhPX2N92gr2mrkRmJuGDb0L7bVj8b64e
         wT0EotOdOLXslQlqgiJpmeBBFVY5t6M+EtSu0V+TNCuBfD/cmznWrh1hpPEevRmmuMGZ
         7NIEvPfg0vmawLiM/PrwrCOF7w1WQgIMbMkJgWcDoKSV8eygtbko2vPGoSFoWhlDczUa
         RpOF8Jxh63Rb6NFfYp3xzrxLQ3n5SQgyhO9wkyy0HhQf5m0Y1ybVtZxAVFyoBoJFSKIU
         hWJ59SW4mWNysqYSTGEs+1TVvmecn7CJev96N0Umq4zX01pKKvnY7vKCa4PZGpiKv+zn
         fFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196219; x=1793801019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpfmEgae6k5vFKgQGlkHKShN8Dis45x4arKxMEWCmng=;
        b=FIl91TKrsIyXrkHLaR6B+WFdw8k4CkfF04tJHHqbbCNSSym0jLrz2vt+m3OWlaAOKk
         EpbDSfBj5AK47GjN9x7dk5OHOsTDuipxR1RD+WJGCDKuh1Kd+iT5ibGqSaUMXmEikWo/
         QKw8k1oSOgw6FIP7wOCo+excWRp0Gru8dw8zoUihm3EBF0Pc3wIYqniu9wGTdfvqZtOD
         SDFpesjT4mc8trbECCyXezHwG+jfNiCHuqH3Z/mIIJeJQiZCvSp/eVsmcT4rcDNZXIk+
         d2JAXRd9J7z6CkKYAVamDwt3YaPDrZ6gzWRPcrn86bJ6Tzh874yKN+qfDw50VjpONMyd
         +4uA==
X-Forwarded-Encrypted: i=1; AKwUvBxqfnJwWdP+SR5R+/b1C4pLdESD5tyC0H3LCrz7umO7dBF8ytcUTWvLRM1L1NNH45aHL/CZi6OTwPBkvfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/9UTqkETt7rttuJz+l7PHPt79GrG5mLeJ59oheHzBcpcknD3O
	YU9iBXqxHxMKs9d+l+s7lzJMxHdsqwk4uzxhiB6k8C7TtwYUbqQhWnyqwE/CT2Ire9QdKrVdjhQ
	S0t7uIT0uInqbeEoaP1P/u0On5ja3MIeX0memmxf8
X-Gm-Gg: AYBFou2gu8o+FQlb8vOUuEfZK9l7UTj2qns45Tm0g0CY7efXNBo0NGutR5HG2+XRD39
	Ulw2FChB3PplSQ31mwcB47uU4dJAiyE5cT5r/rhtaDiG99EM6CqONAqpnsratyDFW/iOuArbY1Y
	w7gFi+eGLYEVFFyhCEFKv7ucHsd9WmBn4mE013pK1n77RGuU7qx4EZMoz1k12eZ5gq8qoKoUYTp
	YzKBCcFZgwC0AlWFaKzDH6Dmh4OtKKtUNA0J4BxMenqgH5bNv5AF6iJHJ8P/M7wQPpC+b0pn1RE
	QKO7vU4IEfBEzTGPggu1UCu6WBe8au7BtD3QH5ybweo3HfD/ta+4uUbjsl2XTIMSdDEjCgusCRG
	zlZT7OYGKLXn6gGYs14jXpl54od54N8ED3UuB
X-Received: by 2002:a05:6402:115a:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b49c132c7dmr60883a12.15.1793196218894; Wed, 28 Oct 2026
 07:03:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-2-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-2-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 07:03:26 -0700
X-Gm-Features: AclHuK_ME3QwLivxpHyWL8t1qkaUd-6BovWGILM73O3fpD9S6gvRlw9IFhopxcQ
Message-ID: <CALMp9eRwgCs9PGPbfC=WA7Jg9TQMZUU1V+2YbJE+XC9ndrR45g@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] KVM: x86/pmu: Remove redundant Perf Global
 Status MSR bit definitions
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:48=E2=80=AFPM Zide Chen <zide.chen@intel.com> wro=
te:
>
> IA32_PERF_GLOBAL_STATUS and its SET/RESET counterparts share bit
> definitions with perf_event.h, which is the canonical home for Intel
> PMU bit definitions (e.g., PERFEVTSEL, FIXED_CTR_CTRL, GLOBAL_STATUS).
> Drop the duplicate definitions from msr-index.h and update KVM code to
> use the macros from perf_event.h.
>
> Drop the comment as well, since the macros now match the MSR
> naming.
>
> No functional change intended.
>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
