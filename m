Received: from mta0.migadu.com (out-125.mta0.migadu.com [91.218.175.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769E04FDA7E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061029; cv=none; b=aJrMAWbIaliGdz3ShANeZ4uCEgz6mAZluIQbir3EG0I+6C1JTXz6YWiwOVXmXVbWzWZNe3lqoioy34FuWTygLYFbY4xDWxJRjo62obuZbjSt2eidNkRqIoH8izzmfFwVExiFDkMaTQBlpFfut6W84e3VX5duB/SYIhG3/n07K4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061029; c=relaxed/simple;
	bh=3MK+mM+3TL+vIpJDgBfEo1/4CmjZ/g4CLaacnDtPy8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aO6ys3i5ryVz5g3eeoBx0v+/oVImxXiqpO7lD1NY9npkB59pMP/+IiMLar4ymLXxAnwodF7fjmrWLKRg9D+yhORQvWop6CbXYjQXNjztyYVF/N3YHlZl/O9n4AkHxQCLeJ8C3kFpIgk1mFvwoL6rgqnd7vVKa8Yrk6eLxblL0+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XBYqe2yD; arc=none smtp.client-ip=91.218.175.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XBYqe2yD"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3MK+mM+3TL+vIpJDgBfEo1/4CmjZ/g4CLaacnDtPy8g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790061025; v=1; x=1790665825;
 b=XBYqe2yDyTCf7mHRUPZBLJmsAaHYBJhnha3cnVDLqtALLI7HZ5oS7LwW1AvZqmR74k+BIUA4
 U0xviaTvPJSXkMZkiEL9wf0ANVf5FaMOCh5Rq7wzz8jzZWz8TW/RphiF8jI9jl2aUUnGrWEqHtV
 /x985XnqXOTKJNgbf+s4xpxU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9289865c1d38f594;
	Tue, 22 Sep 2026 07:10:24 +0000
X-Mizu-Trace-ID: 9289865c1d38f594
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8c42da963so4172e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:10:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzThfGbhFWW19djHFDVkbzHtJWiY8lViJITxuOYN2FYDtvZMeYrV41cLnFYQFeW4qNyiWQ7UMqKjaNpds=@vger.kernel.org
X-Gm-Message-State: AFuF++mDjbqTvBLpntE11RL8NQJSypArW7LGesmK8vwYVPGnk9ZJN0gZ
	zpXf16jdxmPkwVrU/K4W31yWVkrvAjJ72vhBdllf1P4Nlcj6zqjkjqQuIKvy7rFj14HiaJ/0zLD
	eyVsBFb5KtTTlF6AzEfK3aFcbNdisPTPGrLrYnkrA
X-Received: by 2002:a05:6512:1394:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8d324c0a7mr113236e87.4.1790061019960; Tue, 22 Sep 2026
 00:10:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902134118.2718200-1-fuad.tabba@linux.dev> <arGRhHgP_izSwW4T@kernel.org>
In-Reply-To: <arGRhHgP_izSwW4T@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 22 Sep 2026 08:09:43 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy5saEDGkP-19n4L19AbSd+ZtjpDVsPABiZkek6D7AN5A@mail.gmail.com>
X-Gm-Features: AclHuK8I6JcWPH-f3J63av1v70AyMxgZAJlJPzSXAdNB-ZOaq8jKoUkgDKbDOTY
Message-ID: <CA+EHjTy5saEDGkP-19n4L19AbSd+ZtjpDVsPABiZkek6D7AN5A@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Fix arm64 sysreg header dependencies
To: Oliver Upton <oupton@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 21:20, Oliver Upton <oupton@kernel.org> wrote:
>
> Hey Fuad,
>
> Thanks for the fix here.
>
> On Wed, Sep 02, 2026 at 02:41:18PM +0100, Fuad Tabba wrote:
> > ---
> > Unlike the two existing sysreg-defs.h rules, this one's recipe is a recursive
> > make, so its prerequisites are not the recipe's arguments. They only decide
> > whether to recurse, which is a question tools/arch/arm64/tools/Makefile already
> > answers. An alternative is therefore to drop the two explicit inputs in favour
> > of:
> >
> >       $(GEN_SYSREG_DEFS): FORCE
> >
> > leaving that Makefile as the only place naming the generator's inputs. Both
> > forms regenerate the header and rebuild the dependents in the same invocation,
> > and neither rebuilds anything when nothing changed. I kept the explicit
> > prerequisites so that the recursion stays conditional, but I am happy to respin
> > with FORCE if you would rather.
>
> This might be the better approach at this point. In the unlikely event
> that new dependencies get added to the kernel side of this, I'll give it
> approximately a 0% chance that the author will update this rule :)

I'm on it!
/fuad

>
> Thanks,
> Oliver
