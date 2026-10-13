Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A9A54281E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920787; cv=none; b=ddrqmuJtQI9ARdbXtNKB2W5btcl4HTfiBr7QXh9pwl6PEEiZL8A6+4c405UCKKIhwgWfabLUBAuWmueok5iUprKAAR82lTRqV4oJ5UocLNQyAgS2YQBKbfbHRMzIdODEJTDX9xj1Cy+5wsvQbEh6AuLGXPHfAFkce/qJwTbaCGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920787; c=relaxed/simple;
	bh=Mi5Spotq/q6JPnED+QIVXXlvyUgIubnCNvFDYYLo5aQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eu8aZOzqx5lDELfndbP5pt4iTOEsU9GaI5f1ldqkAWG14qANgcanZ+MDwuLs50baiNpJgcGW6cGyYf/q1jJ2wCcTyPbdfE4wDiXhbRNS30E1ElquvNOLEQxdXv175ZP3aZXDLJ87VshbcVLtz7eXmT0X3K4VEcztL3+iy7RTKwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PgJXICVX; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PgJXICVX"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88cd731cf24so2418959b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791920785; x=1792525585; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LeOkNArJ14T449fGvcCB00uvB/PZ25DWOhBo0IuHU3o=;
        b=PgJXICVXh0VrfEEbV+ECtfIr5HAHFNfrJncaYuXPrRBWXsghdPeCq032A3zeFI03tj
         NlPFtRAxv0FkffYnyEH9vOrirDIPRVG5TZk8ERyc0aGcKOh0jNoQyb8TI+E4ns6tLAwi
         S1DS5eE/atG9WbWvOIWV7KzGxrrbN20d1X7CWcY8UhszNUAl2xeO8uq4XMlAxWczE3fy
         kUPWIixfLcrR0TDFRZHON5I5saUSuTeCPHp3efzggsjsSWrcNsvHaTtSWTbWO+Vp/aq6
         VokPvgoz7iPxoHHUx6UGzN+JaVN/ph7Bg8UcV+HT1hsNtP3Nv9DE2Rh26LjntQr48GW/
         jjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920785; x=1792525585;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeOkNArJ14T449fGvcCB00uvB/PZ25DWOhBo0IuHU3o=;
        b=LkJEQvmrljwZ6ch/+QNjcbrweTZFgc0cUu88/zJKvDMGRkUAvEmb/mdxTV08el0Jyg
         i06lmA3mvwA58B50WApcZRDJtkL/+cuw9EmwrkuGkAXldxgP2BXqFcfnVRS3m5ry4GDj
         HTBCCnwQ91GO9yDv3xQk6o42ZlLji3V8nvi8fxoUH2z9Gc8mC4x3VcwSIUP5a2ULOZEd
         JXfaju6Nc7rHk899zS4zxC7ORJwiBt5aUquRvXKATUCzneh3quCJcItMyki4ed1TBmH4
         YiqlnPYACmR7LYW5U2UgVrzLjpIf3SdOOwHzTeYJ1rugwops5YiZ9ywNH3q8UrL3QcXK
         jgXQ==
X-Forwarded-Encrypted: i=1; AKwUvByl/Wtp+qF/Ic0zr/F2diELJwEor7qoReA8gDiij3HGhqky41T6tyG8OQV2n9is3FrTu6H6CdGkNZiN1+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCsHIW9dgin6j/oJPEA3Vw4SSY+t6wTzS4m7YQ6SRV6T6OX+WO
	g1HPTIaaQ+RcAm1BHoVJ4GNMZRval7ZNcP0TJWPVb8kIMonSqc8v9/wEkHnzEKJNu3Zu9g1K8sH
	CkSAkTA==
X-Received: from pfbdw16.prod.google.com ([2002:a05:6a00:3690:b0:893:3763:ceda])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:94f2:b0:874:705d:f659
 with SMTP id d2e1a72fcca58-897c6d1e526mr11766098b3a.39.1791920785216; Tue, 13
 Oct 2026 12:46:25 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:46:24 -0700
In-Reply-To: <94cd4203-1be8-4f8d-b015-0c02760e5770@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1791280439.git.ritesh.list@gmail.com> <94cd4203-1be8-4f8d-b015-0c02760e5770@linux.ibm.com>
Message-ID: <as6KkH-MnbfDeuAi@google.com>
Subject: Re: [PATCH v7 0/8] KVM: selftests: add powerpc support
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, 
	Anushree Mathur <anushree.mathur@linux.ibm.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Oct 12, 2026, Madhavan Srinivasan wrote:
> On 10/6/26 3:58 PM, Ritesh Harjani (IBM) wrote:
> > This series primarly adds KVM selftests support for powerpc (64-bit, BookS,
> > radix MMU).
> > 
> > This patch series is originally Nick's work. I have mainly only rebased it on
> > the latest upstream tree. Since the rebase required few changes to all the four
> > patches (Patch 1-4), I have dropped the earlier Acked-by from Michael Ellerman.
> > 
> > Since the last series was posted three years ago [1], I am resetting the version
> > to RFC. This rebase was done as part of a larger effort to improve the selftests
> > infrastructure for Linux on PowerPC tree. Thanks to Harsh and Maddy for their
> > help on this.
> > 
> Sean/Paolo, hope you take this via your tree.

I've pushed this to kvm-x86/ppc_selftests, and to kvm-x86/next.  It should show
up in tomorrow's build of linux-next.  If all goes well, I'll send "official"
thanks in a few days (I'll be offline for the next ~48 hours), and include
ppc_selftests in my pull requests for 7.4.
