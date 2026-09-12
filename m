Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BAE3D6493
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789252041; cv=pass; b=rTWOmrDa0EMa/AGfK4c8/r+ZEI9Z7SUrgka4dDy4Z05JVAik4ajXV82TDw5f1qxEqLdtLDwhMGZSMAa/nQ0rkRkN98QCFwPNHXfZmAOPwxWgtfUerOb2CU99a300tGu1jkwgic3i7yC2bg9OfADTf8qvedIGNM4vH9u9eO2UdIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789252041; c=relaxed/simple;
	bh=s1NoDAASJu12CTH1pP05uATarRtW42V8k/Pmv15QtlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7ZsD9SCP2WpPQW0UFpo2ucYsvWF4eEodVcViqdExiU6Vim4SDRrPhrCsSCptdtgrd67mmnCXHLFygtQhIkrzfkMNh+N4Y1QbN+BRei/kHP32ooaC4ATxId+CyX2b2uiz+zY/zslkRcMWR1qd0lACSZpvR1f6TYffXmrciGUaz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5BY09Ek; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5BY09Ek"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c299de66a99so30022366b.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789252038; cv=none;
        d=google.com; s=arc-20260327;
        b=WbtNtst3hpEMI3RLljYrJZ1w0bM3JJgEzwIQ4tSsWdiufVjHd8Z82KMw+/Lx8g39Pn
         vCdKGQAuoXtsYEzler/10wfMYXdSh1Q34QJLxyUchSj7IyCsNU/1rzEed7KbfWe1ihQ1
         p+BmBHex13PL1FXpjSwm8r+QPuip/8N/0jJg9tmR7L5WG7msbOYAw/pEEEZpIFX674HF
         ngSj2UamkIf/lCMY08KHsVhNH5QJHxos406YAdiVd04giVKhk6QFKUCIrJtm4Wg9iorK
         QBT0nPAfZ9xZEegia/jv994Ye/jocrhsYQDstCaq28IDff/+zROcfHc7R2GIcvuy7wpR
         4pVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s1NoDAASJu12CTH1pP05uATarRtW42V8k/Pmv15QtlA=;
        fh=K6vx2ZPR7yjq9OXpjFkV+zU0IUA+ilXxKXzHDCn1Lgo=;
        b=F0lOZa/AGSF9KjrmSeiHPO/thm9spFPNiIpVqM4Gq01C2rsu8LxnBKpEddFUJcBaiH
         80DVq9X8NKWpFVEHIDtyJNMmDqaK+U3Zs5zVtwEczYF8jlD0VRoPpbtujY9LI9PsXoTR
         osmNApgMUlWeI93WKnhIR/2HMimJlYLS2oxbe5AsAkWhdcA5z7Uacc1PvVeztTPAYdCy
         yjgl30ZNtneaNow66bPmeBW+2ahqjHaCalhcJZ/qvtLDVw6rAkv9QSTzHJ4/U/RZJSxf
         phWKdLxZdkzwU43LomUmLLIjvjMERMoASCcvnU9U22EkXVhoGr8AsTPYpWAPuCR7EFYw
         ZtCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789252038; x=1789856838; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1NoDAASJu12CTH1pP05uATarRtW42V8k/Pmv15QtlA=;
        b=a5BY09Ekq5mJNpcdv0VJkGxoqqfySN6Y24UDsQOTy7yJoyUREL5ZDwbbXG6/742ney
         Q3Rz33g9/8aAxwwAHmVdeFXOvcvsewk3qcUzJ/TO09yJ2eh1xwLwtWLQxtP5xLEXYYUp
         rZUcbysVeJDNNy5SlrUJO97TfJs1XCm9Qex0/Dkbgpnr5jT1xQUnlZ6mmABUYQhN9qi3
         MYmR0MT5qiaK+plTUv9LASDAf//F910l1Dq0jA2qEDB2bzw7fPUfzLCNnZtsAi2vGOvC
         QcyAlWYdwiatbM/VS7Dl+5/9VTdp3RE4EKf8Up0eUiMyRxKaFeXD5et/A/8mHSEmU8Dr
         3i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789252038; x=1789856838;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s1NoDAASJu12CTH1pP05uATarRtW42V8k/Pmv15QtlA=;
        b=FCugcC0UDsjOqSgLcpe16fl1WpnjFb6O+I18a5UQ23mE4dm/DZms8niI7wX0/2h96B
         lAmGCEIl+GnULuL5y4jqEYKWqnl8aMV9V1z8lVs2hWXh21sMHK5TFQROUSXdrIvrDUNm
         tLOYo+/2TzLpGF4BTAVAS6s+Nn21X/tFpUIe0JjyOuY8rdFl0NMCyv/SI57E+ggXhaaE
         yOoOzT99/9NA+6u3gAUpUmvDwOwBft2GXmECEBvCLC9pglpzMRJn0VM1fnjYdvjeDSh6
         iQNxQwRY6CEajY0q3RtAkFOsbRcEw0LfY6A1c/5NTc73TaEGmTbLlPUz3FxK4PewL9MF
         BSRw==
X-Forwarded-Encrypted: i=1; AKwUvBxY+JQMoU0eOR8bo8qwNXZc8m8KAkYwVv0HijtG66uSCAo7+PiW6GpcrqEyuhtuhVpzYibRFs2eYTCPdHg=@vger.kernel.org
X-Gm-Message-State: AFuF++mLXPYzVCHM3ip6QRWI4Ex/FXnLedOWHnuuGJ2DtEwN5b8AS6cY
	it28heSc6ORnG0wfOPr+gl+9i43+SO+j9euS88y7F/3wtAq1XFEQDKW4t8/oDGBlLEWIJoVh9Hd
	SqTRNE+n0h3fut5Ju3hry4gK6F+vHrd4=
X-Gm-Gg: AYBFou0lqGwuMLJQUMD1pCXoYN5GcmPOGoolf6Le8rEuqp6f/nwfXxUxptpA3Zj+Yd0
	UKUBo96MOW3sllx/9rPu6cBoo8QpbAWyUnULiwUh98pmJ7hgGX2Fri4nbBHkw4a0F//mgE40NvD
	6AQQAVqQIFyxFvWpjYMCopdtqZY/j/eAetHRDa16LkgHNO52nOM0eVICWzW0MLdZ++obtt8ZMRf
	h4wH4o4VQ56dtLTtLxS2HapcU5Th0uWnWRMaSfytMcnqZeZzkcSkF6OqcYIMhjH/dL74EIAye7j
	x/oMrNkzTc1UqM4qCyRX23FBYMgriH4dqNv/nxaJ2vQVqEEkRKyCrg==
X-Received: by 2002:a17:907:3f15:b0:c26:19e3:e98d with SMTP id
 a640c23a62f3a-c29667b44bemr515837966b.45.1789252037884; Sat, 12 Sep 2026
 15:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731002950.179573-1-main.kalliope@gmail.com>
In-Reply-To: <20260731002950.179573-1-main.kalliope@gmail.com>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Sat, 12 Sep 2026 18:27:06 -0400
X-Gm-Features: AcwNN1UqgW-Opt4xQd9BdYy2ScqYUvtjx3sk3AD9u1sWDpZjldnDls8e5e9Ytzo
Message-ID: <CAJZwKkgrEjkKAHVcGxvnAGm0iJ+5+g+AzyV6GKtWoirbUzi20A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3] bpf, x86: Add support for BPF_SDIV and
 BPF_SMOD in the i386 JIT
To: bpf@vger.kernel.org, udknight@gmail.com, x86@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	visitorckw@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Following up on this patch. Patchwork marks it as "handled-elsewhere",
but doesn't list a commit. Is it queued in another tree, or is anything
further needed for bpf-next?

Thanks,
Nicholas
