Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814937;
	b=j2VqNoZtwaKDDE9ZnxSC6ne1ezupZ32H6l3UM+RZV5hE80PRnIWcyslzBO/xhK2g0V45
	 7mtPSF5gSS4tdBJ10ioJZ+xkqzZs/fP34vqdJoAS3NtwNaOqyXomzBZQ5ryaf4mdWzt+U
	 kqDfgq7wfmcOLFWQPCI9ATLKtN9NwWksIe3hCNm4eHLHxxv524B6RqVwc62inXahD8rKb
	 pNtYERMbuvfU3okvTXRhgdSov07vaEauVbc3HdxiX+9KZlXXRjFMkhoTBm6f2ie29UQHs
	 QMZK21+h3B1JtRg/sBVMFmeg+DCFHUDnwAcW1xN1nSoaFVVAExmNDhpqUYM0e8+WHVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814937;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Sqeef6VWXCGPSprL2sUdbvrAz/Iy/oSXdyGiMisPWE4=;
	b=kCAIoqr5vXOKX9uhDoTlsMrSlwcNc87wCOebJI8of+vonHNl8r53aW3n3LABs2bqLA2h
	 wunyOilSOxSCXPHrHTBbjzl310Dj3VnMMmEJYvqvAjoI4O7b/vYWuMcgjRXhgMQotU3RI
	 jgtV0QvOkkqKhS5K0ouxL23nH6ZIxwk0kuLyE2Be9e0jgzYcwi4KfW7PWnbH2zjerTWoF
	 TCWaG3R1BLeXBkeVkOXu0ZLhz4/I+zVSdMPlRaJxv8Yb980N0/ECzORKyNILfNto331Fw
	 dBwxZuwJAKQsUhXAq+u+K01o6xi5Mq1hGkRNjgmBbOaCtFcqYRhMc5KZstGCgraEUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="c518v/TU";
	arc=none smtp.remote-ip=91.218.175.184
Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF17606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF17606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c518v/TU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4boBAffMzoVHjAgWiSv2kJlP8mtRBwtsuJLv1o8lqGk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794814934; v=1; x=1795419734;
 b=c518v/TU7jVZjDmOKMSNl7Ykynmu1UJbTntblR8m9AncgyptDjrlDf3ugSI4hkQvQeVBliN2
 6/+DuCcyTLr17nQv5kgO0mxzIRZ9HlzWJ2fu5znSV9ywTZqwAwtBHnyo2vEu5Qf5IdFxHUhXf0o
 Rl61T1mKidfpjq/ApzfstEjE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7666abdcef59c6be;
	Mon, 16 Nov 2026 07:42:14 +0000
X-Mizu-Trace-ID: 7666abdcef59c6be
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso5601e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:42:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEE6rdwhV3YPywwPLN3T2YU3Jw9QgveFocdQ+oxhAXsD2xM/a/FV8J1SZPmXgPoQaEkP3bvicF+3LktNiE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VoPeu6ykbYwQSOhSp0vnS+lLDOhdQTVA81Kspx93yvujg9PZM
	vlj9Q1UmUixwV30S7aGVCW36HWwAL21BbVOsTqQ5FTiSfNim4/sZW4oBhZYIFTllsCBE89HOOYY
	vqVf8D5OZAfZsPJ0kj2jzhJ/tY0iA3ixsxwJ1ucza
X-Received: by 2002:a05:6512:1244:b0:5c1:4bd2:df42 with SMTP id
 2adb3069b0e04-5c17e452300mr135874e87.12.1794814932262; Sun, 15 Nov 2026
 23:42:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113081934.1715497-1-fuad.tabba@linux.dev> <87jymf8m1z.wl-maz@kernel.org>
In-Reply-To: <87jymf8m1z.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 07:41:35 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyhBd1rNqr2DV7kAdbtonEW8a+euJHMMsD-UsD9_-5S8g@mail.gmail.com>
X-Gm-Features: Aa3M54o6cnejirjhEwUOGDdCwRplzokz4vB083Z4FAIDONp5f_S3HfgryjrtL68
Message-ID: <CA+EHjTyhBd1rNqr2DV7kAdbtonEW8a+euJHMMsD-UsD9_-5S8g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Keep firmware Spectre-v4 mitigation on for
 protected guests
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, vdonnefort@google.com, ryan.roberts@arm.com, 
	qperret@google.com, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Sat, 14 Nov 2026 15:33:44 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
[...]
> > @@ -30,6 +31,8 @@
> >
> >  DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
> >
> > +static DEFINE_PER_CPU(bool, host_ssbd_disabled);
> > +
>
> Why do we need yet another set of per-CPU booleans to track the host
> state that is supposed to be stored in kvm_host_data? We already have
> a metric bazillion of flags for any odd state tracking, and I really
> can't see why this should be an exception.

I'll use a kvm_host_data flag in v2.

[...]
> > @@ -940,6 +943,17 @@ DEFINE_KVM_HOST_HCALL(int, __kvm_vcpu_run, struct kvm_vcpu __kern *, vcpu)
> >                          return ret;
> >                  }
> >
> > +                /*
> > +                 * Firmware Spectre-v4 mitigation can be advertised to a
> > +                 * protected guest as permanent. The host kernel runs with it
> > +                 * enabled, so nothing is restored on exit.
>
> I don't understand this. If the host is supposed to run with the
> mitigation enabled, how did we get here with the mitigation disabled?
> It's not like we can get here directly from userspace...
>
> So either the reasoning in the comment is wrong (and therefore needs
> fixing), or this is a buggy (malicious?) host that tries to trick the
> hypervisor (and then I question whether we should even try to continue
> running the guest).

It's the second. The host kernel enables the mitigation on every entry
from userspace, so only a misbehaving host gets here with it disabled.
I'll say so in the comment.

I had EL2 enable it again so that the NOT_REQUIRED it returns to the
guest holds whatever the host does, but failing the run does that too.
I'll do that in v2, like the SVCR check above.

[...]
> > @@ -1671,6 +1685,12 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
> >                  goto exit_skip_instr;
> >          }
> >
> > +        if (func_id == ARM_SMCCC_ARCH_WORKAROUND_2) {
> > +                /* Drop the hints, so that the firmware decodes the ID as EL2 did. */
> > +                cpu_reg(host_ctxt, 0) = func_id;
> > +                __this_cpu_write(host_ssbd_disabled, !lower_32_bits(cpu_reg(host_ctxt, 1)));
> > +        }
> > +
>
> This should be pushed into default_host_smc_handler() rather than left
> dangling here (it is pretty obvious that it has nothing to do with
> PSCI or FFA).

I put it there since that's where the function ID is decoded, but I'll
move it into default_host_smc_handler() and pass the ID in.

Cheers,
/fuad
