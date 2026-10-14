Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21AA4A8A18
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017157; cv=pass; b=N6nf5pOkxIH13tXX2veKJZs6wIoXgue/aSFf/Fo26SNLhAyi9lkx5OoW1qYKTRGS9ZwSIbxLTYZ7XqPm2cJUSh7rVsqkWeCACabVezDLf78LzUI3PA9yz5sh18f/kpqGtaCJniJL9vts6kYi/Bk3M5me05Ju52Y8qH3knuF6vQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017157; c=relaxed/simple;
	bh=4+84p/RrrdzZmA9eMDawKM5I6T2GTBD+KG/Q+hsl6kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQ3FK7NtkHlT0kkBHUhgG1tupSFxdujhxDAr7clZ11CmBosAUQmYV/FtViv9nU1eeTkrT4Yy5ucjIPylFmqYAuPH+m6HJpiBBz0u+lwS90FNKX5HQYFP78dJuuqK9lhLZZX0Nptaa2bwVKnnhShq7qJoHJ3hRPoEiOQ6NT6YWtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YO7Q3Q8y; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YO7Q3Q8y"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso698a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792017154; cv=none;
        d=google.com; s=arc-20260327;
        b=c5mtn5+J7KTj9NYI0pyrRkLGoMRa3zbucft4HDTpijbU+pOuVQ1l2sDAEMy91h93Ej
         8lFpiCV194DpL0NpUa1z8rjSf42A5TU6i4swrbF/Z5XH4GcwdEp940bd4DvKR2HJGxX5
         NfVKjffoUXgbFAjphNibPRxs/Me+dLEcdnR+41mu0uvosR67BAyOwAX3fbItqPZVVggQ
         GqgYYCBjQwm6ahc2rrE+VKe+wgNcKE8w/chLHi8ONYzMkCEJ6/E3OUjImVbvcRZdoHSs
         gWWMnwWosJksdPjDefSuz36zvttRPdyHCgAuLS2Y9SHgYfd+OWWDd1cBYeK1jk397NoK
         lsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4+84p/RrrdzZmA9eMDawKM5I6T2GTBD+KG/Q+hsl6kM=;
        fh=F1IovP5j4eCiJxi5mnSIg4tGWIER9epmW9BOSO3HE5g=;
        b=h9RjGOD6+ZGgmJNaLq5WgGRJpXu1kPR+5ayMfDn6uYMsiBmf6N+bOjV/viMhWd66oW
         3k//Esd3e9i35b1qc6Y1Yov54ehJnsfar7GPKnZ6U/FrQ8UJsqUcpNuprEwrbH0FG0Pq
         e6KfLgC4ASV5APtC6rP92QOTO7fIAkgDSrI0FfvUOZ10rckJaRe5UAA4GY4jIqDratdk
         VHRH2sYQoGqpGdQrEmsQ2iy1nfjXvb1bCpzCfLBnN6OZ0rLlpvNWzFFU3sj7RnaZUp6T
         0QyvF5o1hSgjHyJPq32/4LObUNjFTAJYedC94s+P1oD4Sx+/KCQZsjm1h/FsvSCE5F3i
         qROA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792017154; x=1792621954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4+84p/RrrdzZmA9eMDawKM5I6T2GTBD+KG/Q+hsl6kM=;
        b=YO7Q3Q8ypaRb+MU4PObCrJGi3EfLi/wDAr+yhPepMXqp4hgVEysmioMT2R3N2ROyFg
         pJg6jPQK88gA0RH1Eiu+HbbRvDtmXhTG8Al3LIdqPOPCxFeVYjXSODySOhiv4XhLp3YV
         qcJMz/FWjJoT8o0I0KzONRNyNTXxUEGkRoLDROMqCAhW2oH9GpDmS7KulxhbfoLgIpIS
         HE983Z5K5vYliffvb+xW8WFV0KeEigkXeYTr+zFnyw+Z+580D2eUwxp2Yd621Xkq1ElK
         wVX/X4EY/umm8YQSucvCJuDmLJmZN63d5HGXlEJTHBLlp6uiLDiUd4WqaxuxBveHmzV9
         NEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017154; x=1792621954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+84p/RrrdzZmA9eMDawKM5I6T2GTBD+KG/Q+hsl6kM=;
        b=yByjESf/qfSV6tEGgLxt9U3bR9UFLsvO1K7J+jBK6sJglEg/jhdvlsEDEUkzBviBmj
         IKm121i565to+xzJHdbfakvDTkzCFB6JE9oDT6FZw5rwe24kH+rEAPjOUkpsfPZJVgBS
         6MsEQgGU1X2/KvpCRdDSJUFGPlDINoAzahI33v6tqr577X/JWq0TiesIkAwAsX1ArTnZ
         UTdjgcfx087NbP79pWmFdf94Wjf6XdqRXADAFRMeyNdQSHwFV2fivoBEZIgSMU1Mc+Kr
         BkadUajOA/P0fo254PVmlBhrd7ofsNlMCd9sG6zQr8DlpB6fY5R/NhgwyVY15UPS3XKc
         XCqg==
X-Forwarded-Encrypted: i=1; AKwUvBw797TsjMhekW5utVwEmUFMABak20Rl9w/Mfv5zXfLJxRSvfJgjH5KGooTvbBa/8Iv3f+P2KPduahFZLqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcJZlBEyIf7mAK+g/0EhLIWvxZ82LX/2fZX1Tbdr0usxT0q7PO
	7TLmfsBD54r7nA2/9+d/TmNERitclduR0nOo7vDMzik5j/1EcEYV5eNRfK/k2gs2d9sEVfI4Mxj
	9yCyCD5UfuBtWhRP14LWC7pk02IydxWaCQ6fOCMUz
X-Gm-Gg: AYBFou2zP0uLay/34Men71I7/iOjCbTTcLnunPOjaKp6doPQfRLZ/f1VKrpadLqAnO8
	Zq/hS4AyM6XQQQ6UUMaCg9cm0Zc40N6Es2KmnMh04AvjpX1sCkknSszlYJnME0iB/0nmIc/Y7Pv
	8RIgzxqlN3bnwEQuSoFSxkyQFNufjb/41aOv0xwUNzKLMK1oZx/K4DfAxU6Qd817hRRAGBMYeom
	MSZDXMZUyWk4w/FJhQfJOgWbXodtvDlgqEVCIJdYmBAJH5DVXmp/x6R8z7ee5c+ZpSvcONLMonO
	t3TcfSTAtrM6YToarjINqGghUdzCvVmS53T4JFVsd0bGeXoAgVJg6vCZ/ekCEeJZ0g==
X-Received: by 2002:aa7:c74f:0:b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b20ab1840amr67168a12.16.1792017153710; Wed, 14 Oct 2026
 15:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-6-yosry@kernel.org>
 <CALMp9eSWazT=0tXKvGb9UNWBv62di33QgugQHOa+Bo2sq0qUCQ@mail.gmail.com>
 <CAO9r8zPPR9LMtcwhH=D8gJLjmC6800mJdyV+nKT83TnMti7wJw@mail.gmail.com>
 <CALMp9eTyzxwjKnWXem=dAGiwJsUsArssQTcQhg56HVd+js5pSQ@mail.gmail.com> <CAO9r8zNx-CUVeN8gfhnFxAUP9RBLnLV=eAFHhtW8FqTvhNEXFQ@mail.gmail.com>
In-Reply-To: <CAO9r8zNx-CUVeN8gfhnFxAUP9RBLnLV=eAFHhtW8FqTvhNEXFQ@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 15:32:20 -0700
X-Gm-Features: AclHuK-V-xCwiQ2XrkH5VqBxQlieInGerpdEGA-cb3DSm8FrVDltIDe8fdS4UGg
Message-ID: <CALMp9eSmXHbXx9Uov-Vx0=jrsmu-Tz0GYm6nPuaHWvZo3Bzxhg@mail.gmail.com>
Subject: Re: [PATCH v3 05/27] KVM: SVM: Add helpers to set/clear ASID flush in VMCB
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 3:25=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
> I would prefer vmcb_set_flush_asid() and vmcb_set_no_flush().

SGTM
