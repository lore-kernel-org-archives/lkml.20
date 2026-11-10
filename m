Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335712;
	b=VJi24IxVI5f0UFmOhoJmw7j33Mrj1Z+LQ3sTZbE+fRq3G7e7H6xC+26AXLk/vCAo7BkQ
	 YvurRvpwoYh8Zyjpj1AhCk/8N4CZ/a7mFM1ic/FvEYyB7g+79+bc58VvTIEMLrPCKoO2+
	 nqW054R5krNMW90y7c8N0idB+z6Sl6JBHcda10lOVBtABE5xyHP3gpUSQCCAxOlV/S9O9
	 FFVKCAjYDAWJjrLzcbfbo1uPw3T1S7v29tc8789AkomPHxEynfdsSn826/XOA2bp5oC/Z
	 h/bhbHVp/0zHn1gNeIZiSZwT8dp/v6gUJRa6Y1/asjK3NyZGsVb+jQ2Bt57NL9UVElA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dCp0Db26sWh4sAbqSPzWp1M0J6ydStL+IzHoLsVEdug=;
	b=0HU2xAlESywwAUiVyly2TY8be2Kf5FQH0WTix5jH6LII7hQYzQNwgaqq/V5kiUtS3NAc
	 B2rb/MygVMiemA2YnjXm+pho2qZffga4o7q8yAYOd8g2aEKU017tUeZ1tcK8iVBE8GUAU
	 zY/kr+UsC0ge7PqZgzUmC6ZFdCw4Ti+3xoIKUbt0ZHU9Q7eVfpU63qMoLcnwbvM8T31nh
	 lG9xKO/luZXgluuzuK9z2OuwDDLE/jOB0VVqo9E00/BKQx2wdiyFVuwpLMCuhuMtYoX+f
	 PWReJ+0sFwdbItL6htHl+v4O70ZQNOeICZkI6Rj5dLhHe1UnieUWx80kZcPn1fHtPvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ctx22OId;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255B5606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 255B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ctx22OId
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdba239d0easo2331666a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794335711; x=1794940511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCp0Db26sWh4sAbqSPzWp1M0J6ydStL+IzHoLsVEdug=;
        b=ctx22OId3b1A89h+/g0DLFFIvF1rE/LJiVCOg314dN1i0WsgjGNLUdr9g5ogDUofXQ
         iTytv8eWhKYvvAc1PGv3tO469SZSEgiiM8pzHozoBPZ+JLjj4U60kg4GE7ooJgxxgMLD
         yYkNR/2PgzAqsrdBgcDkGmqae2glgyxhphW8A59/68tE1XL5f9uZe+BYr1Q+iDODYe5d
         DYjN8zKbWgC5M1atPcdss9TOVd98YuPqehqpzIzO8IOUKFSKplq5o47oSsn2tnQxaxmm
         uT0VRNaOVvoGtA5U6P1PyJMJR89m+mn5fyW1gkyhmmAlacc90Jj+otaDm3KCwrVsse/H
         ntQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335711; x=1794940511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCp0Db26sWh4sAbqSPzWp1M0J6ydStL+IzHoLsVEdug=;
        b=UHlFokiF/+0D++sAo8Wc7mT1/MqX9YriHwQwJC1I2DfBfJM77M4X+GZAoK0eTEiiDO
         I7lZwwp22g7CnvXRMCkQ97LVUIAps5OHjgMaKTbbPsWpTAItqJgMLi2eN7VobmrZ1iqp
         DmY5WUakA6PUgc4fbAXZx4TArJD+XJbUldygOEDmFLEZqEG6Zh515QkPWXJnffDyqLQV
         ERieKXCmLXXTNwYNVKZ65g2lZF02My3HKvjI7jsxJLvXgcVzJuXBQTL0/u3WzbGR23Xa
         ClP7sP6AHBaA44OZJiVNrMofKcAN1dQYids3WV3cqSpKCuJYV0Ku7EvYqOJx8IA4iYI1
         U3cA==
X-Forwarded-Encrypted: i=1; AL+hErHrGvOLTH+ifMZmQ/q6WmbNwCPb/KuAlRbZPUVtH4AP9FJmE4JT3i9EFp5gh3oQAtBlLEMBnXTa/Xd7Dxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9DYaowvT6bp5VDtWRp2H99mP6JHJaGUB20cjXIW87VS5fWW/4
	mtEncAumnFmW4Lb9EqVnQl6sq0nt988YMcBOPz0qcjnIjJuj3QiTpIxlOwGHpDczSGgfYJGeUW9
	Z2qTghg==
X-Received: from pgbbo3.prod.google.com ([2002:a05:6a02:383:b0:cd8:ba74:813f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7907:b0:3e1:bcb:1d19
 with SMTP id adf61e73a8af0-3f1901885e4mr3216153637.67.1794335711215; Tue, 10
 Nov 2026 10:35:11 -0800 (PST)
Date: Tue, 10 Nov 2026 10:35:10 -0800
In-Reply-To: <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-2-fuad.tabba@linux.dev> <avM81YcTBTJ8zCMX@seanjc-mac.roam.internal>
 <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
Message-ID: <avNj3kdnvQiY_ity@seanjc-mac.roam.internal>
Subject: Re: [PATCH 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's dirty
 ring is full
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 10, 2026, Fuad Tabba wrote:
> Hi Sean,
> 
> On Tue, 10 Nov 2026 15:48:37 +0000, Sean Christopherson
> <seanjc@google.com> wrote:
> > On Tue, Nov 10, 2026, Fuad Tabba wrote:
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> [...]
> > > @@ -4461,6 +4461,12 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> > >                          break;
> > >                  }
> > >
> > > +                /* Like KVM_RUN: only the iteration crossing the soft limit uses the reserve. */
> >
> > Please don't include AI comments verbatim.
> 
> The series is LLM-assisted, but the comment was actually me.

LOL, I think all of us are getting a bit corrupted.  :-)
