Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631530;
	b=Dhi859egoOlpJykyWzLGmVNZxHxRxBShwrJi8XU3ZUhLFXleQL9oIOsJzuj5rldbREon
	 4wChLAEZZ2wV9nd3LZopeHFXQeJP8JtMIvzJknhHI36x7FWGx5PAXQm2a8YISdFby1S/d
	 KvK6yMElhqIv/WNA3EjtVGxxrjGfb6TAdVksP+R105U9WUEHHASDqnjABwQPtRSbw2r3o
	 cayfTQc/b5DCZGINHXjzgKRuKBAlyj4FEbKrXJilsfPN4QHs+B9J4uaJL3Xv5VjDp9usV
	 MocFvHdjqB7bh04GuF+nx11zLMAuYW0aNIk4Al3bE/lwiwLwUUHCs0gQlq1LLEy2jMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=BGZaLVl/bf+VQNDSvC9YaFRzMNQ+JkOw52QT0TU0FxI=;
	b=4aRACpa0Ss4rEdDPnG3TABT0Y5bxsytzFyEoBQIjwFukbGQffFN8XqxHS1mnMsBL6Z20
	 3g29i5F2aKu9A6EDnClySUkR3+zXvP5bIJHTB2+ALRBrvLTTeYsgWrR2ae5lFPUhdVuTn
	 Av9HFCPxyx61sJFAEcfj5qsW5lioZQ8Xf3R0VPhIWGjkTwGbhWbyqFsNBl7mkh4J9g28m
	 m1TPscAqlSgEaAtQbev7eO4noJ7y3zXTP4VnJopccTtbFX6lWCFnzFGUN0Tjuo04ywWxP
	 LeFBim4V12monFGPN1HSaNpenExydzPbd0egfr4Awmbc0LxgXUIOgkZStswlGKl9hgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TZywBXE3;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D774606C3D4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D774606C3D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TZywBXE3
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9821ca96fso50484655ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793631529; x=1794236329; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGZaLVl/bf+VQNDSvC9YaFRzMNQ+JkOw52QT0TU0FxI=;
        b=TZywBXE3oo1AuLBH7fBdMETQ/ZJUgYCO5nOgYZhMM2/RSWMHeOnBsVWpkN2kAt7KvD
         74dzAt9PIPbwp/6+RUsGUMXtWVUoMV3MdAigrrJIZiU/oT21l+cUq8atuQ+RAalmSlHk
         g3RJ7DyQkTdkIAvVBxgZUe0Sz810/Xb582RtJwJCvscY3ni5bJfSTeCbvv+C4vp62UV3
         an0957++A+LpFnNFNacx9MYI7lnZMrH8MOcXyiWyZ5j8n9FueDIB/nvRaAJodCsoUOg1
         oMXcKKC21ctT7VDibGCwQcUAZ00IKICYtJZusuhXMeMnt4qTZRFqLClfq3HFOkmznWQ7
         q4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631529; x=1794236329;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGZaLVl/bf+VQNDSvC9YaFRzMNQ+JkOw52QT0TU0FxI=;
        b=dgVNVx8zei8FazvARKOc3M3jL7HqQBboNOPbMzTOsl3Ff/F2tvhvOY27hMaHpU6i6K
         cOVcQQ8w7PD4ybWLyTSLEJliGPbdc245cXl+sAa+En64jFlBYoKTIhWYuoQgcETMBynm
         rfwvAYwCF0FJPOHdtgow/39bp1VQl4rQm00cZS8l0aJIlabtR2Jke1kxFSxJ+TQdPxuj
         HuBmwJAZ/6AKtp5TLdfRv2jrNUA/L+R0MxHY9BBuq8c9Yb+iDjyrnKiwRjqNSDi2pCpZ
         KGZ9eMgCyr5esRQaVDOag2K2WQ0JfRvhNI+B5dkvGKQP65GZTh7d1H/BAXD6S1X97Q4D
         D1Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxJnpM0ju3i66pCYz9QA3JMh37xJU2fihBdXuVJJ/cHwlMWb+QHOPwTrIHxN48OBW48Wa2YO288VH8ywPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cY8Fxtc9kR2CkmHQznB/DDzPWMUlXk/fTRxJ7KQMjh2YONHg/
	KRf520dNArtOhT0IWjeIn8fg+qrIQWGBbqXh0XepD/PTuOCMIKzris/bzgBHqzzGAbYjrc/cRt3
	9qItGxw==
X-Received: from plnl5.prod.google.com ([2002:a17:902:fd85:b0:2ea:44fa:2c44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f691:b0:2e2:d39f:182f
 with SMTP id d9443c01a7336-2eb3643d489mr99134825ad.28.1793631529137; Mon, 02
 Nov 2026 06:58:49 -0800 (PST)
Date: Mon, 2 Nov 2026 06:58:48 -0800
In-Reply-To: <20261102074657.27715-1-jtornosm@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029165845.GQ1685504@ziepe.ca> <20261102074657.27715-1-jtornosm@redhat.com>
Message-ID: <auilKFwKLjw-BnZM@google.com>
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
From: Sean Christopherson <seanjc@google.com>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jgg@ziepe.ca, alex@shazbot.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, bhelgaas@google.com, jjohnson@kernel.org, 
	johannes@sipsolutions.net, kevin.tian@intel.com, kvm@vger.kernel.org, 
	kwilczynski@kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, 
	lpieralisi@kernel.org, mani@kernel.org, pbonzini@redhat.com, robh@kernel.org, 
	vkuznets@redhat.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 02, 2026, Jose Ignacio Tornos Martinez wrote:
> > I probably would not have selected this, it is why I suggested
> > virtio-msi or something that could be optional and seperate from the
> > core KVM guest ABI.
> >
> > But maybe there is interest in doing it this way?
> 
> Since there was no feedback from KVM maintainers,

NAK to adding any KVM-handled hypercall, and probably NAK to any approach that
requires KVM changes.

With regard to timing, please show a little patience and awareness.  It's Monday.
You posted a fairly large series on a Thursday, during a merge window.  If you
change direction after ~2 days for a series of this natures (touchs multiple
subsystems and introduces guest/host ABI), you're likely going to end up with
severe whiplash.
