Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793208830;
	b=yYy205276/pV46PoW0wzHJ5w2xQKYXkvPc+Z+v5OUEBotMRllubyWLec7YPxWKdD7/wC
	 He3y14/7VO8VidRYVOxe/SkawtbNBLWBj4ERN1r0DKCBCn27KxXdBlxgGvs3oNbO+BeVA
	 IUzRQO/S/Sb+kwFH+H6K3q2vO1BtWj+rmLtz9em3On+WKbGRozery+YYJpqOSfD0JC5O1
	 4leYjg7i01+O/VjMj7xINM9NmAwNyEsEics1le+wylbG1fdpimWAyetNEV62UAqOyc6Gr
	 Ap1O2sqBSQhwUA4T6NwgVaLQ5sJfMI/xNYijp1wEkS6r171Vt0BU7MXIRLt53CDaJJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4x4ogCcrIz3iULJj4AUcmCmwpvZhGjnxniSpLhEijJA=;
	b=G7CkB3LTf6xS0Q5TCht/Sa7IIeOSFb1zy2gxqpVLXIKrMSdTRO9V28hwJcujxv5LvUHI
	 Ue4WP+rOcHlR/8aY/uWNF2S7CscpoBSr9EOwnrodn8A/4scickQpeUIhTTKyvX7I9drf9
	 lgr9jXYVEdA/Agnho2FC7lLvIwRArjLSpp7gmDNMMfqG6WTHxKk5rbfzesehjaF7p3vC7
	 vGCGbn26yxUPCfIt3BtDLakxNFd6Elxo6/1ByfjJhz4JKL3rJnK+6BXeuxFxKuhccVSnn
	 KVEW5j1EZs4f9e8vzR/fIlMdGn25cYaMZDFL32WnWQae9ip5BNYoHfEOB8HZJvjSjcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hHWgMcjy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8724606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8724606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hHWgMcjy
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso943a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793208828; cv=none;
        d=google.com; s=arc-20260327;
        b=dfOBhqp7uPMxw5CKalYHF6juD8z+czXgJWv17TF8a96+wd8JmjNz0UwCi/7aQHl+LE
         FFaRqIherskQw8t6EM9IUA+hxlJPe6YBU1cKeAvrMgAepfj7qXGfBCDrrhdDi0aog6CN
         o9C0/91v+lv3RyEJwXuk14r8GiYHDVOZ9a3tcA9JuKzO/+fvMro1oK7j5rBfLqrtScNm
         731tgPRDRytDUFEcXIFHCZUp8HUOhTs90fIsQhmmG3aNNipgAXoj5qIjzIkU7EQSso+K
         1XB48v5CwegUD3OCERG8YKlGIcNYZFntgpiUwOa6HQqlR/bPWybby0B0MNQ0XZZrp1Vr
         07bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4x4ogCcrIz3iULJj4AUcmCmwpvZhGjnxniSpLhEijJA=;
        fh=9bCgr+WQwAb6yCOEHneQhmWijvmydC4pRXx/H6niqTo=;
        b=MiPdBodoEG7yr1ge7ebbRHo+zLMx+cPLZ8P4QEsdHRzxntgSRPLVEYdAPGi+4Z+alv
         cPHvoZVTpOEpGd2pzlpqrNZH4Wm3hDpWtmMW1yU4TUsm2ym1szH7HwB4X6NuQJvAlk2I
         7wHDHm4rQ5iiBafBG91V/1k9wTBUBVXf4do8ufF2uA2qpg/2WkRgDbUu9vQyDgMolllI
         DO0ClhK2VY2UiWExWVfDAmg86ZS153lBA94RBScETawZylK1+s0V9Av82hM758ic02qO
         9tUMp/dM6S9HBtfARKtRQo51tIbpJLzrpyWOv/eTI08F7BpVKk19+6teZVr9X6JSQC39
         rjlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793208828; x=1793813628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4x4ogCcrIz3iULJj4AUcmCmwpvZhGjnxniSpLhEijJA=;
        b=hHWgMcjyEXEFs94F0opmrR2osT29gnRS0Wcbon1pb9d0qNq2KamffAiJQABDUWT+t+
         bs1tvpNgwt5Ay4A2BPCuvL+699P5FICIWki9EUnEg6NFcXvWyyhjassWjYurneMOLorv
         632UmjTXENyTpYhAJUOFyvfZEYGE2B0txXFIubn5n+MSPMn96EzmvgP9rpnchfyYONCx
         hSpZLCfLyOG28ATlnQ6uP83+tZLAq+GjSvG1ozkh1OMVWY1W36x/yfZIaFMd4pKdZffZ
         YOxnluTIs1peo/YCOQPxwu3qvKsu+upCyvRTaj72DRybLzdZLSKN9qwvGvz7i6TD2Ogf
         vrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208828; x=1793813628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4x4ogCcrIz3iULJj4AUcmCmwpvZhGjnxniSpLhEijJA=;
        b=1UkbfzVJIqwUw0bIT1p4mL5yR2Vgv0jLaZi6a250tkcJhV7bCB5OgWhz1nzU9Fimm7
         CNNprtJBZIH6mgfLvsj/oATS+JcIOdBl/MNszszvTE5AXaZw9PzzVqq1yCROusQca6x7
         Gi2zCdNavMHdBnq2XfctGxmGAt/s8tsKXgXm2v2gOruKZJcwfp4GJHoC6qCBaqL0FuuH
         2L1Wiy4wGgAz5ciYLhKk/0ciRKUrsXBRcQkgKyRTKCxaOispqrl9L+mga0CuRO8Igabl
         DytUGzu87TGO5dNOaOzcsNBT5tGyxv0GmrouYjnM1YqnJBTVJ7kR2v7FJcnbISYlFpMC
         NbpA==
X-Forwarded-Encrypted: i=1; AKwUvBzttiOQDyqORBczAPt9G0wPAIvAKJaesrL/W388uuEOlETMzwMQKGE3+Fk7ij/D5g/DuJMDSA49XeDby+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQG8y3mDxAzp/8dodiN6JTVdVluw8NJo567Lz3+I1Yw9MV8wEw
	pVV5t6JdQT+f28ThxNQkJ5hCK3UDUe1pXL+ks4YFD67tse5XMQa5AXD+4J5fAPkJ+XmPikYdeGC
	pj545rVNk5ZnbaMwdDLo+gyYycBEkmSNSwvED0CYH
X-Gm-Gg: AYBFou2PVch+kPC3mgQuOY+ww/mai8vpqYIPAjM5IT6DUPEJUWfDBYZDPyhACsxxDku
	mqLxHRDTLF1de9HIyw4o5b2/ofYJIOsN1/nStzJLzChqWkmAQXDMX+BzJTtcqOFfeyYqkw2+xWs
	Kef9wTbNTs2QT/EDvnekYCS4/2LePnOBkaBDTL3qr6CqPKl/g6Ose7XAtl2GOSZ+0wiJvnFiWA5
	/Yj6ol6gPNJJPMs4VvMIwROn8B1Gq0+iJJyI5I7BS+BhXkO9fcEe3WFkC0WQIZfvfjbEtAdEHRZ
	gzj/rkCclJk5ZGsPS4BDmxGO/zMXmy5hoQnEithO+5eJPD8CCewJqc5Q0Sppq4KU01pBbEenzm6
	6c7TZ7R0yJDeF4imA5iwjsnPxEhRkhiS57uvCNvdaMtylVdiddEboLpaUUQ==
X-Received: by 2002:a05:6402:a204:10b0:6b4:9221:8932 with SMTP id
 4fb4d7f45d1cf-6b4b10d3756mr7408a12.10.1793208827782; Wed, 28 Oct 2026
 10:33:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-8-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-8-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 10:33:35 -0700
X-Gm-Features: AclHuK-cshc-ua1x23QeiEhM2iv4YfYaUSv2c6vItBjWJCU_Q1Z7ZQY_OtyF72s
Message-ID: <CALMp9eRrgBXxFtNLOw0KAjFu_L9ofar_oiJA9WSJk82w75w+bw@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] KVM: x86/pmu: Expose kvm_host_pmu to vendor modules
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
> kvm_host_pmu holds the unadulterated host PMU capabilities, which
> can be used to compare against guest capabilities to determine whether
> certain MSRs should be intercepted by KVM.
>
> Exposing it directly avoids the need to introduce per-field accessors,
> which would add boilerplate without hiding any implementation detail
> worth encapsulating.
>
> Opportunistically, fix typo "Unadultered" in the comment.
>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
