Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11BA377AB3
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198214; cv=none; b=hKR3PRWmBlT/V9SzH6EEoPxkmt5l6OyYv7nULHZOoTnIFU2oJqXWNkT6nBTKFu3IMwg/+TxQzaLhgqIC8jiKfbPzp9dHgR2s+HORwyBeMi5tQ6wbbKFiZwBN2QOgKARWukRWrmHT3/zZj1PSZmZ17eItY+gURST/PIxaMWzebCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198214; c=relaxed/simple;
	bh=5poOTYRK8XflV87Vch8oYYnoehwzjqtlULOR32lZFfs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HL5ZHR653gIEH4ZA1iB7aSfq7dG1RuRLTyPHZgH2yeD9l7ao8kWig+nvwDjVqo3diu+rHxjing3zlTPJzB1rHxnB6V6tsMxO1VChEB+6K5wrMXmFLDq03/GwRcAuinJLtEKTtnYhDMW4ltyXwMC/fBlmLLStR3tzOrP/wp9gMzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K/4Y5J24; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K/4Y5J24"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so490980a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792198212; x=1792803012; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pX22oEuj1ux3k6B5hPPeFjVNRrWP4tKoJqnTGgcPB8=;
        b=K/4Y5J24yXig7+rgvkZzsjblnONrzK7R2rLktO2Cq8Ts1mU5xdxd4cbfeN6yPc84x5
         mT7Vvehi5RWn+6KcoYWK0tEA9ZYQiahTVFuKz6gFsWhgHZM0qnkwM2o7xjTE/vT0NIdg
         Yl1v1zedtEBzP7/FFuUI588Izki4iYrqJa82CATBqOFCczaypAye8x2h8nzN9To76BGm
         jeatLDSwQQeLEZ2tDONakJsjQbfFjaGhaZxPbdii/XjF/M7w9MTEdAgSroHH2u2bOrS3
         CqU4GTP618vyzCNt+ApY6bTUphwxGJPRLXpXsiNxxszcBn24KkvewuDUNypg40zaguFa
         Hm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792198212; x=1792803012;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pX22oEuj1ux3k6B5hPPeFjVNRrWP4tKoJqnTGgcPB8=;
        b=21mub6aOUux9L+LtJa2K43axPZUXHi3yYco3W+KBR+pq0erGNFlEqgdiEODYWZhQvn
         33MSiseU0hbk2BBzBHAASIY3BD9ZXw3jbqym4GJgX9YzomVeH/n7iaZKOtj0n8hAyb4z
         JLybjrHT43N9wT5dihzHi4CbWh2wH+nouSQv2QfoV0lYpsOUVi8K4/+O+Vk87U6WbRkn
         Wj5e9xxvYaNgfTJ2CHhWeC0heGAsCLhO7IWyBQUaiQWQJXrVi6hvd4oZpLqPVvkS9Ugm
         Cg54dornOa2uXDcQLad27d+SdqkKxXxUDzD6azcZBdru4MJdNcEjaBBDA2Ks/+mcWFih
         LnKA==
X-Forwarded-Encrypted: i=1; AKwUvBxzO+PNKH9Ownbh82+jeTUjW+tYkJ/cBhtFIoeVaeptmik7YyVabnf+QxXbUow0Gb+Y5oJGLCA5n8Ic9Ds=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHA/qp+veFwcDO4Sc7mfvaERa/tufZUb8gYjfOwZgLnaSNc6Rl
	TS4z+YdU7SyED7CDciG2zOFp/TrFnBhBuRvzaYjlvNs1qWHd5b2B8zXgmpdeIGnv4S7Li0Xrkvf
	7L7ccWQ==
X-Received: from plpw3.prod.google.com ([2002:a17:902:9a83:b0:2e5:e061:9fb3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a2b:b0:2e6:13b1:e196
 with SMTP id d9443c01a7336-2e9a73571b7mr12374825ad.74.1792198211956; Fri, 16
 Oct 2026 17:50:11 -0700 (PDT)
Date: Fri, 16 Oct 2026 17:50:09 -0700
In-Reply-To: <20261016235221.33726-5-amirmohammad.eftekhar@cispa.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016235221.33726-5-amirmohammad.eftekhar@cispa.de>
Message-ID: <atLGQQEuILMqkx8F@google.com>
Subject: Re: [BUG] KVM: x86: __set_regs() silently drops a pending nested
 exception destined to VM-exit to L1
From: Sean Christopherson <seanjc@google.com>
To: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Oct 17, 2026, Amirmohammad Eftekhar wrote:
> Hi,
> 
> __set_regs() (arch/x86/kvm/regs.c:102) unconditionally clears both pending
> exception queues:
> 
> 	vcpu->arch.exception.pending        = false;	/* regs.c:129 */
> 	vcpu->arch.exception_vmexit.pending = false;	/* regs.c:130 */

And?  It's an ioctl.  KVM can do whatever it wants, so long as it doesn't break
userspace.  Clearing the exception queue was deliberately added by commit
b4f14abd95cd ("KVM: Avoid spurious execeptions after setting registers") back in
2008.  Whether or not that was the best fix way back when, probably not.  But it
simply doesn't matter, this has been KVM's behavior for 18+ years.
