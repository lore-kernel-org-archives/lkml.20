Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872924E4C4E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730871; cv=pass; b=bhcRt/Mbgq86JjJM0oN7SbfwrG7PswQ4/oUR82S6KnK61axL8w5ND05L8htHzXnE76XUeEwONUC6+dTnRusrO/8sA7vE3K/+kCsqgP5371ZpuI2E2V/6bc5gyDJYeUijHUu3DplyfTnXQY08jm70qGonJWuUm9qvduBwJVAg/ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730871; c=relaxed/simple;
	bh=1T4Ypx73b49lIoEeXBKDKWASxqKm0qUZYs1hZl9y4gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9E8ikniL2s/ommJMZp1Ry8BmOzVfLNfP57aKNZTH2gp47lZOLOIig/shcBhp1hjxjgPOy4ixsvvY/Yd9HmC+JkVRkAADLdns0hIi8lCFZ6xsShRpqDkbbQtHWV9l2PwVZo+vyjcb1XmZxFIwdJNT6VFaIl0sz5IyQorPbK2TSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bnicj358; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bnicj358"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so6586a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789730866; cv=none;
        d=google.com; s=arc-20260327;
        b=EM8073rvXsRTxvfdheX75Fa0VgoiAqAoYURwbRquZ4N1si7QlNcvA58YPEpLOZuEdz
         bSySJdO0iKr/Jk5OAvEo8NHwFim8jNTL9K/4h38HStWnotWPw+gRmM4JWP1Tgml3Laxh
         0OGWBFe1IyMuNeUqAqzwJf42Itj0PjKwK6QYwU2m9DgWCj+FSZqqw1jW0P61T/J84HPM
         4LwPAuxJEGT7f4Nb94vwr+/8UjGruRzz2yBnHQkpFkKxwZKonAo1n/yqdgv5fg9GYdNR
         br/Oib/t7EOGeR2GL2arcrNk/lGY42VixqbpuS5S5jjjl+7BomIcPOBI15mjm3QeuAeu
         VGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2zkFlHoWQ2AWCYz/XBKFNT4MlZs4AcmAdTGygjovBbU=;
        fh=MNhIxkk/82etVljXpDVsV6US0sOzfJ1dTiLZzbt9Sxc=;
        b=B/bBnrIkTmtwpfPzVKctzKXAm5cVYa95JG/ndY7MkFjl3cz9S9QHhIoJYXVDH1A994
         xj1A1SU1M1dU6IRaOI81gs+NFNjPqLddWO6RRTW71V1FpOw7HeKaHzn76qYwpCyE6BY/
         +jNxTpcZZU5fWGvS44XhfMjEpGGYzEG8B4NaoJAXynqg9MJNxR3X3hl5UG3qTpKtCHzU
         ZnUodvY/x2snr8KAkDunBohZLjg3q5tuSGBi7x+R6N7O4xbubJKwpVBHDnfztueudYr3
         sC10ZrUTDWCCxDHGNAb8HA+jppfkG/oKldW07VOWzraKqXNN/BJxE2oj0MHe/+P7GheY
         y5Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789730866; x=1790335666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zkFlHoWQ2AWCYz/XBKFNT4MlZs4AcmAdTGygjovBbU=;
        b=bnicj358p8BvR+0cPsy7nSRI+syhPcD8q9t1kzH/MM7jD3Ex2AgecRNFRaIh2hoD12
         t69llh4Gd79xFNGgrtRQqTucY8HzpYZPkiePEQvpXaaU8L8B6vuctbaMv3j7t2O9Ulyg
         DiBifT7wFrrd8V7NIOZMz36SDefcD0ExuZmo5B6UeU6MQSLwhUINU0tQ03hQsFspBqPl
         cJ9yoiFMNZR7Soz591jRZzlMG4yr/651O4S2Bz3yZoTMWjRHQo0FbxuNxeXOteLlQZ37
         +7/+dO2nFfXN2gatJZt3WwO/AMmDtcVXhxc8N+bcdTHovBGad+zyhtC7YwAbu1P2BYKT
         K3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789730866; x=1790335666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zkFlHoWQ2AWCYz/XBKFNT4MlZs4AcmAdTGygjovBbU=;
        b=YfFTY9l/kaA8cFHjvI7L4CzmGnQc/62tY/kEL0dLgAUSSg2dvKf7T4ud3BDlI82tax
         1LlByk1XFKyxEMwWcn0YqzwKECXq8CO117a3VEFJ2Wtwvr1qbgd/o5Z0I/m1yt1UaVjO
         g94o3hiXBWnun+/rPxPFvkCiMHe8oGZ49COTpVRqSfkEY4Bl1jaFexFjfcD5ikq5pzvu
         mE9wXOy11EjFvOshAmX3vqgiV7r6X8FcvNhLtwsH1JUJSoqui0nDfzeLPlJRcr4XdHxn
         aThiSdtKP0CiqubXWC5wTLU+g2VjAyFuJIaMJX83bNIAYtr79mV1eiNd9CmR5R+udtPM
         P3Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxgQwm63gcLIoXZP17XMCQNVqJiYWETe7vg72Q2UQ6dZEeTe8kW+tgnL1jA48FnnjvMyZ41bC3jWOAAIn8=@vger.kernel.org
X-Gm-Message-State: AFuF++kZKS4UiL6rWyswsz8NQMvHxoQ8izrhC09QgRgW9aZJM6y4pmnL
	nhpRi46nnjMlWL4aPJhwXLYFtvQgtjHkOW5LR/aAv0e1ssdphxpriLIsA8/03ym9qZB/SoxKtED
	mdCC/3ywBWD7e2oZNkp1qpuYMLRLe+kUOxnQzh+LJ
X-Gm-Gg: AYBFou2flBqcuanDJiCmuWSR+UEGhgrxHQEeEy7q2DwGEED4vYJB1Pt9JJA5reGi1/W
	U5UNWFBNxItfa8YLIF4WMWT79+FthYgZhyC7F0hY2Wfo3kQ9243xlkbsjmzojW2gMofmxF5/F4Q
	z2iwLqowf6ySqC1o0/AAVKDH25/LcaopuxUFoLce1HyoByGDC0/iSr6wwY3Bem/sTPzFuOXRd5w
	nLXtS9XG6E3AYZ/KCXdGQMRmz4rsoJL/FZuZZCozKdkEcE0jVqMnG7RB8ZAdurB5WfAhdknuNym
	l6hK5BuQfNjeYwM89r3hKozImOEdc34jHXXzsZBXj0vLMfdsaAZ5AV4=
X-Received: by 2002:a05:6402:a588:20b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aa4df2139bmr25284a12.4.1789730866074; Fri, 18 Sep 2026
 04:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <2b30c180a7ec1fb22033cc1b89debc36c9f569d0.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <2b30c180a7ec1fb22033cc1b89debc36c9f569d0.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:27:34 -0700
X-Gm-Features: AcwNN1XiB8HFa2Js9NBlTZk2TxW38UVMUVZNntIOccJ00GWuWntEdr41p3Y9JBA
Message-ID: <CALMp9eT0RjVUYbcHbhd-phmaXs1yPsh25j+qkfmizqp+DCV=fA@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] KVM: nSVM: Synthesize DecodeAssists EXITINFO for
 emulated intercepts
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> When the x86 emulator encounters an instruction intercepted by L1,
> svm_check_intercept() synthesizes a nested VM-Exit without fresh hardware
> DecodeAssist state.  Populate the architectural EXITINFO1 field when
> DecodeAssists is exposed to L1.
>
> Provide the GPR number for MOV CR/DR, the interrupt vector for INTn, and
> the linear address for INVLPG.  Preserve the MOV-to-CR0 decode informatio=
n
> when a selective CR0 write intercept is triggered.  Leave EXITINFO1 clear
> for CLTS, LMSW, SMSW, and INVLPGA; the INVLPGA address remains in guest
> rAX.  Leave EXITINFO1 unchanged when DecodeAssists is not exposed, and
> leave unrelated intercepts unchanged.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>

I think Sashiko is hallucinating.

Reviewed-by: Jim Mattson <jmattson@google.com>
