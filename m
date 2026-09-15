Received: from mta0.migadu.com (out-211.mta0.migadu.com [91.218.175.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D5E3955C7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470101; cv=none; b=PsxMo8CruqmFVI+wYz0GrXJ0GW49W5HBLUccZDZDPAh+VZ2avadxaqkrZyZV0/a3Hpfdn9wyYmWsswR7y0gBy5wmL1MJ/MXtkfugMNh0llGY8l43sGW6wNOtYn+IN6bDBzTLjV94+tJdKh26RXhxiivGUGmZomRuE7y642jD3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470101; c=relaxed/simple;
	bh=gNab9UB/dOuP7n3fh4ySHoj+tcM0Z+lxV3y78kbdIaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqcmWZB6iPKK5kX4rxcoynL/rotKFY0r8bs8w3yVxrHZGtmAc78+UJWFkO85dfIEeACCugFTjq85GpOIntGgxiwJPiU6QUHk94lew89Qh1u4LoXWdqEMbSbtURGli+Kt4W/Vu6OpZvhGeqdCdrO/o0W7FGKdd+NWC2kPoQlmxKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jb3hY2eB; arc=none smtp.client-ip=91.218.175.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jb3hY2eB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gNab9UB/dOuP7n3fh4ySHoj+tcM0Z+lxV3y78kbdIaM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789470096; v=1; x=1790074896;
 b=Jb3hY2eB38SeOUu3m5dTk/Qzs7VWRcrT8/SG9HEDy22a2K+p6FyGEIr9ljPToxkLnSjqU6GP
 grSmPrZ744/zlvVPo3zVESHMYJbjAU6HYj13b35KO4sFCM9y6w9p1TPZgdXk/p0BXkGcp7Os4Wk
 S6ehxCua4J60YtPQuIshqoY8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 728f970219607c75;
	Tue, 15 Sep 2026 11:01:36 +0000
X-Mizu-Trace-ID: 728f970219607c75
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so4173e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:01:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxrcs59eHibH1Zypad61yWgyXLGPOrHV8gY5qkHeu9yVzc8FxumTj4TihCfoEa9o+8AEzFYhSMSmnxMfPE=@vger.kernel.org
X-Gm-Message-State: AFuF++kylKaHkEcRQD/BFv82ryXv0rtgnGSynYXYvfQCkKfPD/OnuHqZ
	yOoVf/2Qq4jWjDmOQuHcBGXNw0zKqCAn8k/NXAJ9Ql8m1lZ5rzok/MKqGGFJUu/7Cwn1V+Cj1iJ
	xpZvsn4E6qHWIQVQjimo9rHekR0lGjBhjwO30vOfC
X-Received: by 2002:a05:6512:ad0:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8b2d4e62emr154752e87.8.1789470091337; Tue, 15 Sep 2026
 04:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-3-fuad.tabba@linux.dev> <aqkiXqjSZyyqHZ5y@e143914.arm.com>
In-Reply-To: <aqkiXqjSZyyqHZ5y@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 12:00:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx14bh8nPQnNUwsk_hxES2xW7bs9H1MXFHdFKU3Xfgjqw@mail.gmail.com>
X-Gm-Features: AcwNN1Wt3ZBrIQYAxXdUQmdQ9vDJcACZrVELsbuq48nV4nCYU-mL2MgXk9sesGM
Message-ID: <CA+EHjTx14bh8nPQnNUwsk_hxES2xW7bs9H1MXFHdFKU3Xfgjqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Pin the host vCPU before adjusting its
 PC under pKVM
To: Joey Gouly <joey.gouly@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Joey,

On Tue, 15 Sept 2026 at 11:48, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> * A pin only fails if the memory was never shared, drop the request if
> * it is a bad host pointer.
>
> Or something like the commit message says.

Ack.


> > +      */
> > +     host_vcpu = kern_hyp_va(vcpu);
> > +     if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> > +             return;
> > +
> > +     __kvm_adjust_pc(host_vcpu);
> > +     hyp_unpin_shared_mem(host_vcpu, host_vcpu + 1);
> >  }
> >
> >  static void handle___kvm_flush_vm_context(struct kvm_cpu_context *host_ctxt)
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks!
/fuad

>
> Thanks,
> Joey
