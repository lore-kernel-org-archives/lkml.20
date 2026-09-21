Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D282D4FC35E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015835; cv=pass; b=RBKbXTHwUNtbtADuf9O1eL6iBsAubR90ZK4A6jalWOouTOcmyTycrWygPJ6wOyMeg+jluH3zgihzHQAyQjYjSH/jOy9TXoe6mP2dQBzunpal810zIM4btpHDfH8jbQ7k40fsR5PhUgits68MOeGahNucZiH9aB8bspg7yIQEDf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015835; c=relaxed/simple;
	bh=/UwEhuRdNe3bBwEXnnITz3ioli/gSo/Xo8Gbi2dTHhM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZkCcZONd+y4WRxAO/0W05UW2+PZZ7YFQS9mKhYlyabINRncQT+Ack10HYhhEKUIpYbI+f3U0FEcIE2ug7KUbI1pdPrZ37/35dWr3P9uDM5zkjyQW8SDQZbqo387DCoE1yYeY9hEqul2sXd29JZS86OQJTGn4336boBk3jKf8r5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQFKKxHT; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQFKKxHT"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso5495392a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790015831; cv=none;
        d=google.com; s=arc-20260327;
        b=Zze3vpySgyfk3UzySwktMwPvW/0N9Krm8kysvqIFSUrTu7TGuJCdi0d9+u3zrHPMCn
         rJuzKfS4D1czm3PJLSi0NPJKp6qkBau2PJyxadmb3hlWraDZKTAFFr3EuRwJOuUj1L5a
         4xmxFJzwlcDQcypCmJD24ismBQc4FJ2x/n6JR/YuZF6p1tqa12uoiSqJ8o14A4YAUNr/
         4YcqEccEbQ6Mi5bV4mm5Hce8eaCzmlP4EbPZ7xeM4SfHNZeagIk8Z5ZQ3Krv+v7NkYFr
         1OUhUOq2U2rFJBLVYdARxVFfpMbIQElMQ6lqjlEJEQIHWz0iZ8manG+NKAI2dA/rxeHd
         CRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=/UwEhuRdNe3bBwEXnnITz3ioli/gSo/Xo8Gbi2dTHhM=;
        fh=XUcpLnzrOMQfDdnHVRWP2SCQhsneURKDc0UQ6Bo8kx4=;
        b=SUu7fkC6kD5FPA3XNcTJNquDqgn3euq6wUNjVojlamzOGFxQjLfI2nSLqo3BnNkSwh
         N4tAcvPNE07rXOYp+GiglLE547iVbD4vK41PsOkn+znnkZj3Mpna1i243JI5MJooDJEY
         8U3D4+29WzbID2mOzbKygMGsMj0sSVqe6Y73lTzH347boyX4964a/5gOiCC0bvHGupZ5
         bQCPvMLmxFJ2Nr+qPKZe1oMMZUNaYUx2SQhpk2fWQvvFTiCU4kuzcEkkvoiGT3GGGgMN
         iaQ+oJ9w6XtranOZLmWv7P1NFT+mHblKELCUYs93ABaJyAsKq+0/05oKCwzmvQ0EToW6
         i9NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015831; x=1790620631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/UwEhuRdNe3bBwEXnnITz3ioli/gSo/Xo8Gbi2dTHhM=;
        b=eQFKKxHTX9qv5LrRgYPyEwKY3p15J5WvADmxZH+MYjFjwxY5XFjV3N+fMQPwqPyi//
         x+HjvAQV6QsDA/WrrItwRlPue5DZpP3/mIeefLTA+Yn5QC2TggThii55JhnxoxrCK0Rc
         uikqtqp345ijMZ3tevho5bXPNZEgmFnXVbnoK6opBs2d1p8U1NiwbEsxKiNf+NURXfr1
         TppDAJZq9n7wH+RMdHupApcP94Eulwsb8Jm932rgSws6JrXsK8JK6H6IhrAd2NbDYadM
         Khu21b3wJRKeVaVa/1Tm+Xr1Uy97hRw4t5WezGhtpGZi3RXyexBlvntf2MFOYkYuytHH
         wwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015831; x=1790620631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/UwEhuRdNe3bBwEXnnITz3ioli/gSo/Xo8Gbi2dTHhM=;
        b=rblVA11ealzrH+SKQSxPqtJxFFwLMjLhNn0M+YGjCIjIfRP9gQujW0hb0ZxEXlWG3T
         oLlwT7GbFYU6wsRXxxYIZca5KBGNyspwlzucuPCRWFA66HoU5dsuPt9tig+86ZmqNz7G
         ppHIB06tHonQkoNzhgRpAgX0djGBCX54Pq0m4KwM7F+bN657KWQQHZ24NMPoBSLUyG4O
         2vp1ofrBStK0ODEmM43z893zVe2rlrFE6FWuO+++pFyLxbuycdOS2mpEPX6nfjdAJ/uW
         kDEJh4l62mJ3mDG2jmIZOFOPuWjGrpi31IJUisO7v4SBiUZf6C9cyI9Sw2kM8KPBqPTX
         TzkA==
X-Forwarded-Encrypted: i=1; AKwUvBzUexOS503axge+2Bb3rt1+O8r3yH7ryfKtkJiSxt36GpDivTH2MWh+FFmJgcuQHrC+u3FVFBOEp1JavNI=@vger.kernel.org
X-Gm-Message-State: AFuF++n1lKQo6OEESr2FwlZLMDW0+qUvl1tPl5HyNEK5Cje0NRua7boV
	FOSk1tLtoBcbeMwvVmiT6cKmXOe2XOVarGP1Ql/CrH2UXmT+w19zRlhCj47s+m3qVxPYnzb47bE
	ig+9+lDVL3HsUnA/UeQBWJktdkTrYPRo=
X-Gm-Gg: AYBFou3vT4N+pEYkrEBwO+2EwPjW/t83YGJUoIdVmcTo5/8FF2YpskVML87/3k4xrfe
	7t71fbtLSGnPXRIWKFZeDMY01vf1SuRGGgsWAHGQmaTrnnftKN5bYnaI0RUs+TztpCnSOJLf/w4
	VqY/ozI1uTThYJRm6GU7mCSWZFPuT/hQhNscf0i2NmeB/FDcIZYGmT6Vq+mCEc02cV+3qrkRfLP
	7SvkI89BruzY/pv3PkA+GW9WH4Rj52V4B7YEupTJmrtmOqgs+hJaOUdEFkRMsyr5iJkjaHEhm4A
	Q0QSOW0QXI35r1wY45k6sMffF11b8VFGSJQA/OjlNSgIk3KhQq3RPJfK3deBqFUg2wNT2hVo2Iv
	h4lWemNYQQg==
X-Received: by 2002:a05:6402:4009:b0:6aa:97b4:31d1 with SMTP id
 4fb4d7f45d1cf-6aa97b432e7mr1749490a12.38.1790015830530; Mon, 21 Sep 2026
 11:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 21 Sep 2026 20:36:58 +0200
X-Gm-Features: AcwNN1XLVeCc91wnyYbvordEaS_e6fGgkAMPJk-LkXtdZ5AtBm2rTGn-YIM63Zo
Message-ID: <CAKSQd8V28WjMcsfh05P5SNfXXvtafBH6fyiyqMzQ9GtU8fQGSA@mail.gmail.com>
Subject: x86 CPUID mutable return values
To: Borislav Petkov <bp@alien8.de>, "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>, 
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org, x86-cpuid@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Back in May I wrote...

> https://lore.kernel.org/lkml/CAKSQd8XM6p7TTVih9fg9fmUAkzNchPCT7B-6qzVuja=
=3D3hg_u+A@mail.gmail.com/
>
> When deciding what the code shall do for mutable CPUID bits,
> you really want to have an exhaustive list of events that trigger
> changes =E2=80=93 think Intel SDM vol1 21.1.5 as a starting point; then
> made exhaustive for all events, for Intel and the other vendors.

I annotated https://www.sandpile.org/x86/cpuid.htm =E2=80=93 you can
search for "mutable", to get a little over 70 hits.

I can mark AES and PCLMUL as well... pending confirmation:

Q for Intel: is MSR FEATURE_CONFIG 0x13C bit 1 expected
to affect CPUID 1.ECX.25 and 7.0.ECX.9 and 19.EBX.0/2, or
just just a subset of them? Also, what about PCLMUL?

Q for AMD: is MSR DE_CFG 0xC001_1029 bit 16 expected to
affect just CPUID 1.ECX.25/1 and 7.0.ECX.10/9?

If there are more mutable bits or fields, then please speak up.

Ahmed =E2=80=93 is there a proper way to reflect "mutable" in the db?

> (Besides on/off bits spread all over the place, microcode loads
> at runtime come to mind as... uhm... interesting...)

Presumably ucode loads should trigger a full CPUID re-read?

Last but not least, there was the case of the Rise mP6 config
leaves, i.e. CPUID, abused for applying config settings. Look
at https://www.sandpile.org/x86/cpuid.htm#leaf_6363_4523h
for basic information =E2=80=93 it's unclear what effect these had... for
all we know, it could have been CPUID... affecting... itself...?

Ahmed =E2=80=93 I don't know how you want to reflect that in the db?

--
C.
