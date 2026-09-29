Received: from mta1.migadu.com (out-110.mta1.migadu.com [95.215.58.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7078C53C3CE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694694; cv=none; b=sue9rpAilBDreKMgeZ0oHbmkJWvdon5I6J4x9gko7pbT1Z5QfWRo5AfiUURmrquMOoMC6c5rZ18iJHOp6kRxsDn7HFG9d82BHXqO9zoklMHFw7yfUR2tu/SkgtUt074NIcZVshSn8b/1j7/NseTjmTsE1b1LFKC62K341tmS4rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694694; c=relaxed/simple;
	bh=Guq7vvdBrs+2LAbftC06J/zCNpDu/2cevbftm5NnBUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tspsy4l9mUw2wdI9V3EO4WpvMyVNi2q/kfX3HBhF+NEx/80xRfNnCqHSOioyJoxQ11Num9yid8WuZWl5xBXQtKTG5O5Wz0R6CJfRmj6aKJboR/pQL7u4NeHfVTY9AJUU2sMs18LdpS1MW7l/R6wnAq/ZwL5VQswTyRS9rT204v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xZ4Fp5Jx; arc=none smtp.client-ip=95.215.58.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xZ4Fp5Jx"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Guq7vvdBrs+2LAbftC06J/zCNpDu/2cevbftm5NnBUc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790694682; v=1; x=1791299482;
 b=xZ4Fp5Jx19Vf4EL35G1UoKjFhmiS0lTJtkEjHRF0A+XtrwmYftKheSrramBuJmj2BJOUQhOu
 7nfLMOKkMN87pIqV7K6rOggY6DOOb9JurN4Vv4x8ddBEfz0LNUrNl1UA8kcP9XHU6Rj5OZcJdyM
 UHJXVS8vx7nh2vMFwF7lKSIs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae535aabe25c8bac;
	Tue, 29 Sep 2026 15:11:22 +0000
X-Mizu-Trace-ID: ae535aabe25c8bac
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b8f42bb8a9so8179e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:11:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxaugPHbpr0G7fLy/m4SAYbwYrtp5pKQofZaS5e2sa3Xg+2NPxLv+rkLNUx+Rl/jCm4Si4r4WVudihHIvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSqX99AODuhZ3OewK6NrKp2MG2QIb4EuizYlDkS/Tw0ejseQcW
	tiUROVlQjLU3wtS8zyjg+gaDNYWBy9TcuQjQs2FI6LfWQfoUYl9tnvnDxtHdEf39zygZqwVRCpE
	Hy9LjWJjAQSahymTaH6GiCB6liWvkP3rRttYSFqcH
X-Received: by 2002:a05:6512:39ca:b0:5b8:eb6b:2a62 with SMTP id
 2adb3069b0e04-5ba2e7e1189mr155370e87.4.1790694681036; Tue, 29 Sep 2026
 08:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929090031.3829185-1-fuad.tabba@linux.dev>
 <20260929090031.3829185-2-fuad.tabba@linux.dev> <lfkiqqw72uqjih442pozc3gsydxwmdj3kacgl7c2572kxzx3sf@vivqilohtwqn>
In-Reply-To: <lfkiqqw72uqjih442pozc3gsydxwmdj3kacgl7c2572kxzx3sf@vivqilohtwqn>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 29 Sep 2026 16:10:44 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwrOhVHQ+Kv2dbimsZknRttscwmr+nfurgyL31hzxVwwg@mail.gmail.com>
X-Gm-Features: AclHuK-bF-Gg2TRO1voI3bbJx08FqrvL74I7XxHF_wOtMWk4sUktlPjaZGhwxI4
Message-ID: <CA+EHjTwrOhVHQ+Kv2dbimsZknRttscwmr+nfurgyL31hzxVwwg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 15:54, Wei-Lin Chang <weilin.chang@arm.com> wrote:
[...]
> This reads a bit mechanical to me, can I suggest:
>
> ```
> FGUs don't actually require hardware support, so don't gate fgt trap
> config insertion on FGT. This is the only action required to allow FGUs
> always, as kvm_calculate_traps() already computes the FGU bits with or
> without FEAT_FGT.
>
> This also fixes a spurious WARN when a TLBI OS is run on a guest in vEL1
> without FEAT_TLBIOS on non FEAT_FGT hardware. In this configuration the
> course-grained HCR_EL2.TTLBOS trap reaches the handler handle_tlbi_el1(),
> which expects an EL1 TLBI only from vEL2. With FGUs enabled the UNDEF
> will be injected without needing the specific handler.
> ```

I cannot write commit messages! :) Thanks for the suggestion and the
review. I'll reword if I respin.

Cheers,
/fuad
