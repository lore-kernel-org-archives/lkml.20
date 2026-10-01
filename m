Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1B54FDA40
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890010; cv=pass; b=qPuL113ktLusx1BLmrfTuD0vqIZPKBRsCw1qHGhm4bcgrv2U8HHojA5oXW6Z9dEhB0rlFdj0+f8bj5Krp+lr99Wc47cOiu5HTSOMq71qOsWTCL/hEIxVgzj8hpMp4ri0yzqNPjRVVRomYWD/2cEcaP8N/lO1pq33wUzzv1UwOfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890010; c=relaxed/simple;
	bh=5kJj/YjPUElaHpBdhAwAfjGyCSehJ25YvJQ9doQuCbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D24PPi0NwPpQykGFlQerd9TuCWGlpkVtv9qXI/xZdFp4agUbP7nyM/6aAUvENT/e/+oeFT/qioRUrDIb6+Fp8uiZgNyD7bYxqYgl3jasBMEhNJco6IMZoL2u4cQNc2wHyFah3bj50eJZ+B3Z5b/KyltUjZtYaG0c3s31hwxJogk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OAhQsoxK; arc=pass smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OAhQsoxK"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e7b5de66d0so3490544b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790890008; cv=none;
        d=google.com; s=arc-20260327;
        b=aN5QCLRmUk/Il1kn3AXgJG/Ts98Su2xKMLySIyQrL3AW8LYAWKpoLnH/SrMJ9jagbD
         hMPEnDDKqBsR+wKL56BC0ArD6Laq9CJH/L0d3ScfbB+ubq9mVynY9t3zsy4eaLIBUDjg
         sfzMDNzssOYUcTpq1g1tYkBYXfrLy1wdCleebiirq9VbfawlZPEigTbD+8/LdwIJSEGo
         gW9VmBaR+YbSHtZrYVWM3LxkuAAmhmZAAy08K43ljsjaXQilLRIWff2BoIiR8LAfdpIO
         kFP0qSW3JWepPAWpugCbRPZG4rCEPrxNSaTu2OZ0JF8QW/AqR12bh5Vwk+eCeQnjq2oC
         WNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EEJI5AmWq9kvDrvN7+gLxoAcIdEGS6uwkzuVRjJJ5qI=;
        fh=Q0wudUIi/3cLWLnCUu3SOxCxLnesdFr3o0q8JZuIonU=;
        b=sth6gmD6Vtmj0KaxxP0Ot8s5OTI9qA4yFZK9yEaHYch2h9qAyMN1W29co0gQdJyREC
         Asg6mwVhx/t6sv+byqKDJtqB+rz4Q6eeengVILmNJbjTjHKFxioZLk8oaVx3ITUqjsNt
         QQGoF7hS5f2uiJFAd23tFGVxGaSjrTuiiw7TTgJqODsB+lRU9k5xwqqwUVdqezUQyOQ9
         GXjodgDxO0Z//P98niisMLCRG4G5Jb3b0ITcO4LNtwdY0MokTViMB+2tj8Anlc+NmYPF
         Ifes3dimgO80HfuCS65mJjfXgKAAhxYX/iPSvda+XlMHA8pAofF2o2wdP0+7k8rkAiLo
         arHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790890008; x=1791494808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EEJI5AmWq9kvDrvN7+gLxoAcIdEGS6uwkzuVRjJJ5qI=;
        b=OAhQsoxKfV3Mo+gL1r3yRXef578BjWpFmTrEw/TUt4XZBEA2eqHq47mPBJ9ZS0qtKL
         JMfW3N/SEqEp57XkdANuKqNr/lWXtxxDpdOjrlHAfCrc25sitQovuFd78/Y4tgCicDlp
         0gIEOJ8DxKHnKFPs0EudO0KfIuJLCCyVvVNHZKRsQgZMQQ/27ca+LZsSY8qEnNttsTrO
         bNNzue0To7TBgqHgSLPpfeQ0Utsd6HZIZYm3Y+i3Ww+CRZmxI1Hpc36jezcsNKDLyOck
         ntTakoC8JRXtj+7tbfCpvapp7iAQIadmnX8T2LybfhZs5wKDOiXvHvRo7N6ZhXciqEOj
         uA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890008; x=1791494808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEJI5AmWq9kvDrvN7+gLxoAcIdEGS6uwkzuVRjJJ5qI=;
        b=pxnG7hj5BNSMMrzgHl3zg47KxabkuaRX7gJ6lqGXkD/1a3kk5ERNaJxDtnTTvb0nxJ
         vTyK2dEUx4HldtuT9OxQJejmj7X7HNH0U0oDDOOSDlvOnNvSi7iJokJVRAS+7k3jalhx
         /CHljqrgWPbTzyty3kmE4bA857kG74g6yocy71ZDc+1hXvhkpIFOpPFDEqazcahuTDe0
         Du8+wuxjiX2dUXhULmUB861g2KA00xRtqx582DgrxPeVVJMjQIpneNcwbm3rXFguKARG
         N0qTMz3Qk0TBdShDHyihL6Ew2WWHt345pkXqx9qJgtsmXMm2r1GIYrjsWC+oxrvRMi5G
         XdxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhE9f3fd/evZsqdoEhV01SMF+KBRsqHujm44YgIkqRaYg42jOlnUtFuW4OoBvqTbz5tR6PcIrXFY9e5fY=@vger.kernel.org
X-Gm-Message-State: AFuF++kloeqnELqJthrKDy/I1NDFQeM9PqEZR6YFvrDnhs/9783ZPFjk
	wjJRQ6Jz+Y4g1YPN5kZ1YVP3avzqpliyv7Cb6BFnDydTtO/b+/VvOAemwZFvu0wcTejYAL3SjUZ
	Jx9KxXG3mnSN1rczaBXAdIjPM/BW/ksZYZFFqygF5
X-Gm-Gg: AYBFou3Xi9eXzvZzbsm2Wx76NjSOhP/0zWsPHcuOxWLCtU5oonVoL4SP6CoA4OwruJV
	vZEhN0ANrg4p1Y19n4wxrWg0nfVw1Z+YY9xGvQR92YK2K69sxdrMmcUps1ok4K9DcXZpisZeTSP
	ZrIVQzmNyhgeZCq4eqD/82jDm8GIjWrZ0T2q6kE7Q2nmS42DMqEViupd70HDYUzRryUF4BxoFO/
	79qldR0vlbhwwEdgSxXL1FldYAjDYaD5/UFWIzj0tvnxdGPzZxLCUUOmzq3+yN35Nrhi799kfkG
	22BfPuJsmYA3carwMZBrvuru6VHN09GbAl749fdS2+YIF+P0SzPtg+6XFga/X9VuAIyXdsiNuMD
	sKQBVsa+xcPyJeE2mS8hxZpZ9e3WxwC66JBGtEl4c/NJnx/L/Dyfl57o1OA3u9TlgQgQYLE5FWk
	6pr5/gwoPHL/raRp43RPffYi0=
X-Received: by 2002:a05:6808:f0a:b0:4d6:93c3:1aef with SMTP id
 5614622812f47-4f52b1b8219mr550043b6e.58.1790890007278; Thu, 01 Oct 2026
 14:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com> <20261001202234.3794060-4-seanjc@google.com>
In-Reply-To: <20261001202234.3794060-4-seanjc@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 1 Oct 2026 14:26:08 -0700
X-Gm-Features: AclHuK_jD8_Az1NWQmBSP6uJu5bELGSPzh6zWF2qzLw4EN-s4elX5ThB-3dDs8g
Message-ID: <CADrL8HUeOETayLAeutN+8UHq+2eg_nBWf-PPMMsfoLei0HY04A@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] KVM: x86: Unmap VMAs for KVM-internal memslots
 when the memslot is freed
To: Sean Christopherson <seanjc@google.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:26=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> Unmap KVM-created VMAs for KVM-internal memslots when the associated
> memslot is freed instead of unmapping via x86's internal API.  This will
> allow deleting/freeing all memslots before kvm_arch_destroy_vm() without
> leaking VMAs, and in general is a net positive as it makes it far less
> likely that KVM will leak VMAs, e.g. in the unlikely scenario some other
> flow deletes KVM-internal memslots without going through
> __x86_set_memory_region().
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

LGTM; this code is so much better. Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>
