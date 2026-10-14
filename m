Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DF452FE32
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990165; cv=pass; b=n9O2Hbtc0meSbIPH8ZwI3gznm/UottQgIbgzAnFSSH6L19sq/JSDKFYtpLiVbrs2x5LoaMHs7G4H57QqLxJcxZhmtT3C49RuSM3AMoKGKur2sPVKCsPDvex0pcQeNau6MuLtMWof7MGIEe7CSeMkAw0IbejUsHCxWkAHOjXqJfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990165; c=relaxed/simple;
	bh=peUQ9Y2a5XEmnKO7ViaOJtAdf4c17RcSOD9PNqTPBgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgQ4tjJzu+j7k0ZvxBWCAo6bY3loU0KLowdMuhA6pBFZGWBflpbI2jVPLNh+rmO7izn69BN0HnJwq763+YWTcDcxZhYnarr8DtGxNLn9qkXsWAs6Ri6SFTitflRkuBS7YomCHio8WlT0vki/FLEtGgf/JZq9NcZEe7hooOWGJMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nMB+WnaT; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nMB+WnaT"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so43603a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791990162; cv=none;
        d=google.com; s=arc-20260327;
        b=CDx3ZaCeU2lBeWn2L0xs0/NYFTOpuAcK6bDJqnFRx8BGTcQh5ER45NE/C8mk9QRz+B
         IAp9wAaV4i1nVz///0M75/dvRmJtfrSOUAcYJqtSueOA5sHik+LSBIkL1qYWdva+F/Xp
         gGw9O5zIvDZPMIuSBefgfJZl6BQrvB+MDWd+gkMvicn4YRHHJrSarjarQKdV1+LPXoec
         UescuLtu3z/09RzAG7CpdDjjuyHnyfyOl0FO0vUcl0kB5MG/1sR8InreOINNy1jtU4v+
         D4qNv5xOL+QTxu48ATzeACEOFNoDtTopGAcGiuM+Kbk6CU6PIQG/9fb6KX452H32ufoq
         xGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=peUQ9Y2a5XEmnKO7ViaOJtAdf4c17RcSOD9PNqTPBgI=;
        fh=agCpvr38bArO8V7d+UCpdaOXu6QQ1iSSUN/3ftYxoEU=;
        b=rVHBYpeG7CQUYDH40GuJHqyAW1Rb9yH63LTXl1+Do9KWE++n7f8s5qL7QGAR/8Gq8a
         Y4BDzWt30I3sfmoXrD4rtEuzUVWR7wME0hcrAQzE9jjLXdAJnQQ8dEOzZsU9XzNmk+sK
         pjISphjRiDpM4kY+K9LjFZciIpbKbXPjN709/nZ+aBGd1CMM5oJ1rQi9eeK35d3VhwGX
         +cJvNRA0/la4QnW7BmtidEKvIHcjBwnAR6VWK/iMupN1ZfClx5JxktkWPV2usERXDJCb
         l8FpE1EpZsQcNV2ff+nfiodR2HY9ypMomuU3j3RNAXLNc6UcH/SuoA7Zu4uxBhIevk7/
         kT8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791990162; x=1792594962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=peUQ9Y2a5XEmnKO7ViaOJtAdf4c17RcSOD9PNqTPBgI=;
        b=nMB+WnaTXoFFghnw3y+ZLz2ymntwqyozoB1+GuCz13Sd4tNMIktmzoMTniQuYBCuYQ
         9nK5h+c4kzs6KTpDtMSj/R6zsSRvwaWIfHXJl3RnMCqmWDeGXRzWsTCzhgeyAOV1mdp/
         g7RA3KXwg0f6yq72zmR+8dNw3PdiSzxVoaO0CVufThA8X55e2uK7Ey5BRAG+nBUg8i/E
         nz/Z2IiGZrQCFs9boJ8jMKBH2Whqpf/iZMCEreB+00AvfJhpiu+iNejxaEpr5mWJDWxc
         0vvzZTVEETfE2Z1j6ekgqD+Jy09+t2y6LJJCg9C0jkWaR/i7cCYkTNM5f101sQqMUfkw
         UNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990162; x=1792594962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peUQ9Y2a5XEmnKO7ViaOJtAdf4c17RcSOD9PNqTPBgI=;
        b=MLPKKs5J4vSfmlP5Q0rUuNA18wDX9P8+XsKodMpCsFTyarNrPwheeIhPWzG1Xlflyx
         hvgeGqfr5eJVMy7pa3hHpvQrBSSqbw2k1bKqxalMc5MwsVNDQgD2uUsqx8rbDStItzVd
         dJ2k+TX8Helb6n0gob5gRHxTWwZnq3QDv2WjHuM7V5l9zMZQaXraLSroEq8zgTjh0Bf0
         tKW+6lZZ+RDzHw1woqLW5WU9ez0VkB6rSOyGjX1h81zH9+q+VD8Mr2MQ2IcMAGRGm+7p
         ye9yTTa0EFR9/uS00fm8IRgXO4m0RX2g4Ws3d8GF9PzNt31i5FavhuogTKR7Nl6ZqLIt
         WKLA==
X-Forwarded-Encrypted: i=1; AKwUvBw2TcP8llCIFI90TIOAc6fSNvZfmPxhE9Gu9LYI6zHsGl+3i9rEYd8muh41QmIUJxsY4INTUZ4OPIcpPjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3bN+1/zOPHWffPcf87OrK1wnmNqvCUrr+e6ZyUsh9APDgFo1c
	io8lbwHycwLD6UrGOezbO8DuJLl6bKC9pFyJLMtsmLBdWTKwlpGpzCeWxuA6/u4E3NqWkP/Qdng
	wT9+qz9K3Et6lOtIe0yJoYmPKyWdXuqiVfs1XyRiF
X-Gm-Gg: AYBFou2Qff2X93/fiscHNA5ld1WCqb5TyUcunV/qHGWoCJYctbY0suCu+nM5pvhXAfM
	P3ufExKkcmAFdHQaw702XVH86nJsy7S65auhbDFsQtsitYnKDAVDEgwDmj49voYARaZY175A71e
	UvsF35LAGtG9yOaUchw5hi52/BIMhg7CFD9PhL/YyJy0bOYuVLDN2Y5iKJF8Q/pkd5D/vN+Qebm
	HrPuhsl11c0y7CwduvZw8CXbsTbu7sQRTsb2N+60k3giDZDTtzK86gY/9WmOJuyCMsVIrdRT0Ux
	6QLS50IAXZLjiCf7qF3rwffkwUFBXgsx3mtrR84vq8R6iTPZOYdL1hk=
X-Received: by 2002:aa7:d407:0:b0:6b1:b607:a5db with SMTP id
 4fb4d7f45d1cf-6b20976e77emr47828a12.3.1791990160901; Wed, 14 Oct 2026
 08:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-2-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-2-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 08:02:28 -0700
X-Gm-Features: AclHuK_yhR3qanMwsfhsd_KJEDCodUKEAzljmDfv-F-Yz96nQUzINa-EzATGdNc
Message-ID: <CALMp9eSoidVrzHqTrq09LB1SCwsf5DuwAcys_q7o0TyrKM1Ciw@mail.gmail.com>
Subject: Re: [PATCH v3 01/27] KVM: nSVM: Flush the TLB after forcefully
 leaving nested
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> KVM flushes the TLB on nested VM-Enter and nested VM-Exit, but not when
> forcefully leaving nested. In this case, L2 TLB entries can leak into
> L1. Flush the TLB after forcefully exiting L2, similar to nested
> VM-Exits.
>
> Note that vmx_leave_nested() handles this correctly, as it reuses
> nested_vmx_vmexit(), which handles the necessary TLB flushes on an L2 ->
> L1 transition.

Fixes: ???
> Cc: stable@vger.kernel.org
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
