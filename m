Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469641F3B85
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 02:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791168002; cv=none; b=gscLRuVfq+W8M9ySJGnwtQDS+EmrpD+lOAZxgoS5kz9wOzJnI/EepoJWP3UVD8TjIQ/TTJWmVBjV4ezCFb4ULlFblW07Sq7XOUJEl8GIOJiaf17n3g9ODa3CT1Mxn7o397CRzlMBxOn5/MFF5foez+wKWH/b2rirdg+xyVM9ios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791168002; c=relaxed/simple;
	bh=VOGPZRYZ665kECnYosasWRGv4iW89S9j9spuV8erKuI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HQzC61nUCEUge2A5WcQU6aDn1TFa8l914fzpFoRCNle/0zok2+Uu7+1xxrF9PibtIiAJJ9+X//QLo7Y6jC3n1L+QfGiz2KLOD2LmBRGBL0rTtW//xWUDx47fhIQ2xzNyntsxFjKP41fmu//nDFeVGGcFOAIuWkq3hK666kUUfuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ivh3Dg5Y; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ivh3Dg5Y"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso2356184a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791168000; x=1791772800; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9HTQO2rUlDTOnGrtLyq1XH041/gAEdrB3b/I0PgRl8=;
        b=ivh3Dg5Y1m+NP02W3Skd74aSlF/vWfBhpKQ2j0vKXCsa4Bh6MVILkLepbu6dsU7qQh
         FgLuN71QtyG3IJQ0283aOknIqr8cnyBWKh8HTbOB0UGtw8oj8Ixl1UutvOFBT/byrprB
         f0z2dop1aV/pprw2Z6KfyCMvsz2nhqjnebCvKuxj2MreAyDHJRzwftjz4mAwYqVKUtDQ
         8tZl/rRZe5jbxHTPPUnPZfQf5uFVC8ibAi8wWfKi+LL25iHTWolb4IFxYa3yJsAzSNgx
         A8JQLkujYe+4WI2uHSxHJsY3hGtJlYN140BypHXMOrF0Cw2ggLetXW8yy2K/Yc6d4yA4
         L03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791168000; x=1791772800;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9HTQO2rUlDTOnGrtLyq1XH041/gAEdrB3b/I0PgRl8=;
        b=k5BromXKHC7H1qjssDCO784p3GMDJJKjvewHxY2nMfKhLohSwbYVqTtTk2TAMDTq7J
         SSK/f4tcXfSHP6U+qe+ezng1URil1iipwuc2o/2Gx01pF6qJxjQDDhxlFb6XMuKtEPC8
         48gppRcPdBn8laa9Vvu0zGZt8qvpgzu6fk7WNnpNqAoQAV69ZHVTSsYsgIygz30p0Z1s
         FNWL4vM5+y4yODzTimjEZDEJAvajqtNhdrs+T8xYiPTEzVbsj7bmRolwY8XOEaGBWSy4
         kmi+EdEDwtQ0O45RprhzT8kigxcC4d26luvxQqBQ+9rSOcG4qn/Xl8TpVWf9dwYJNA0f
         UY/w==
X-Forwarded-Encrypted: i=1; AKwUvBzjdgIqRn6m6R9ugg8BSZ1dvjzKisVQC/wxf+1l2Tfd447yJ6obLFLZ6FesueR2mOPdz/+YCWbwY2xLuV0=@vger.kernel.org
X-Gm-Message-State: AFuF++ndYYsYTV+EQjlU6h7bQyksAknBZ9vs2h4dcQfQ86oS/tfTiTZT
	K81aPJ7vGqB0A7LIhudtfsDaHyiblMzuJkY8rH0Q/ermTOiJYRUjQaYHO/PQHSGTFktrbVNtnYh
	wTojlog==
X-Received: from pfm17.prod.google.com ([2002:a05:6a00:731:b0:88f:62f8:bdbc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6e92:b0:3e0:651a:d150
 with SMTP id adf61e73a8af0-3e0d6b1e9damr5767266637.43.1791168000327; Sun, 04
 Oct 2026 19:40:00 -0700 (PDT)
Date: Sun, 4 Oct 2026 19:39:57 -0700
In-Reply-To: <h5j3jn86.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1790101179.git.ritesh.list@gmail.com> <pkxwkffc.ritesh.list@gmail.com>
 <asAydfQLscU6rXQL@google.com> <h5j3jn86.ritesh.list@gmail.com>
Message-ID: <asMN_TAX-1_J3jiP@google.com>
Subject: Re: [PATCH v5 0/9] KVM: selftests: add powerpc support
From: Sean Christopherson <seanjc@google.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, 
	Anushree Mathur <anushree.mathur@linux.ibm.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Oct 03, 2026, Ritesh Harjani wrote:
> Sean Christopherson <seanjc@google.com> writes:
> Also note - I will open code the TEST_GEN_PROGS_COMMON and will skip the
> kvm_create_max_vcpus

Oh, right, kvm_create_max_vcpus is a common test.  Can userspace detect that it's
running KVM-on-PowerVM (in a not completely unpleasant way)?  If so, an alternative
would be to keep the KVM_CAP_PPC_SMT change in v6 (patch 2) as a prep patch (before
adding PPC support to Makefile.kvm), and then add a
TEST_REQUIRE(!kvm_is_on_ppc_powervm()) or whatever.

I think I'd even prefer to take on an #ifdef (to scope it to PPC if necessary)
over open coding TEST_GEN_PROGS_COMMON.  LoongArch open coded its full test list
for some reason, and in less than a year it has started missing out on new common
tests.

> (& maybe few others like vm_types_test) from that in v6.

What's wrong with VM types test?  That one really should Just Work on all
architectures.  It doesn't run on LoongArch, but I assume that's oversight?
