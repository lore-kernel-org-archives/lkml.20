Received: from mta0.migadu.com (out-75.mta0.migadu.com [91.218.175.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD2D2F3C10
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791732459; cv=none; b=bbat62Wii6000LE3rSaHADs1tHwVDM4km/fUbPETUmEotYyQznWkyxHUIt/T4NmHIbgl6yJ+kNe3A+EM7dfHlIb4nbUcQotE/OX0FZqWroQH4tOefdWdTdoWvP/SJpVwz22jz4kvk8aa9nzCi6iOX8cgMIr+3LB7WlQgyl9Qyls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791732459; c=relaxed/simple;
	bh=suXI9TweIJ9OgvYGDH8vL0MpTp8HpvwFkmEvYZ5Q21c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1jooHw6JdQ4cmEboPFYaR2YrFHTt5/iht3HsXbrVwYsccMCiE6/rosDU1GTv9nB8h3z+lPynCO0MEIayWg3eJ7AqlFhX1yGRTdwhe1j4OsOu41g03rmBOo7gpc8By1tAimyMXLuSzEnJvhxS/YECvekKsc165z9A4daB7TBL7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P18CFpNn; arc=none smtp.client-ip=91.218.175.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P18CFpNn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=suXI9TweIJ9OgvYGDH8vL0MpTp8HpvwFkmEvYZ5Q21c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791732453; v=1; x=1792337253;
 b=P18CFpNnABRkvvSvZLpB5WBPqb3C1Gy0xH7TyrM/bE6d5D+EabA+/tUOJ6WdYe8JylnlFtsg
 ldCXcxPa2d44Seta2rOu8MorP3L70f8Pkewz97uF3aW05w3SQvetvV4z6ZUpTs/9294HOqlwYmV
 Gq1ycQR36ua2ds3lMKhm8MyI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd0817c970917564;
	Sun, 11 Oct 2026 15:27:33 +0000
X-Mizu-Trace-ID: cd0817c970917564
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcf03d95b8so1028e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxiJB8liM0EtJhciearuKNbobOtMynAiEoO8Vbk9t8AneThuoRKQy77Kg+j/urGFc7H4Lnmx+gy+P7Ne+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK97inDLLbIE5BB5cZOlY98nFIqqgGYc3bO/Cu+MPaH1uLiJdFT
	q/XuO9y+OGaVpP42X4CB5sJhwt/p/mz/ycF+J+1L/XSWeJbuuteFyARFQZ5wVjs4/hS34i/uhb9
	ANGeIyDLNjPDTeUF6LLG51J0Y3u4aiu1e/Copf8wF
X-Received: by 2002:a05:6512:238d:b0:5b8:ebf3:3370 with SMTP id
 2adb3069b0e04-5bce9d8696fmr69006e87.5.1791732452056; Sun, 11 Oct 2026
 08:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011143648.211337-1-fuad.tabba@linux.dev> <20261011143648.211337-5-fuad.tabba@linux.dev>
 <87zewk8e90.wl-maz@kernel.org>
In-Reply-To: <87zewk8e90.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 11 Oct 2026 16:26:55 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwQzWTQd83ybB7xyhzVZctre0Nn5_Smg8dA7QusNMve3w@mail.gmail.com>
X-Gm-Features: AclHuK_rIOwStTCG2fxSnbJUVb7MyinGSk7pAOJvFzysPaQbzGjG5f9VtEekiws
Message-ID: <CA+EHjTwQzWTQd83ybB7xyhzVZctre0Nn5_Smg8dA7QusNMve3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] KVM: arm64: vgic: Do not access the GICv5 CPU
 interface from EL1
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, vdonnefort@google.com, qperret@google.com, 
	Sascha.Bischoff@arm.com, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Sun, 11 Oct 2026 16:10:19 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> This really is perpetuating the wrong model. The rule is simple:
> anything that requires system instructions or system registers cannot
> be accessed from EL1, and therefore GICv2 is the only one that can be
> accessed from EL1. So the whole thing should read:
>
>      return has_vhe() || kvm_vgic_global_state.type == VGIC_V2;

Ack, I'll respin it that way.

> Ultimately, we should static keys for all of the vgic types.

I'll do that as a follow-up once the merge window is over.

Cheers,
/fuad
