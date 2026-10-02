Received: from mta0.migadu.com (out-252.mta0.migadu.com [91.218.175.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4753F4CB8C0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954693; cv=none; b=mstwTCtAGHcXtf1eGYWtqpsm+IqG3hb8m51F/C/IRGz05us44G/43PfkvWwYtJibO7yyMkB/v3gw1viaWI+VR09AXHE8zHHljzW6Vtv7JnPw/C84Q8s85fEIzDxBUtacoR+3tDB2ziyNsrjIWpHbVtKvjHSyRpnxp+u1/urB91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954693; c=relaxed/simple;
	bh=hYyvJwonwfCGOBqxkCTnI3TF2uBM9Q39BNu7gbnNaxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPyyWOukwaG7uWfTlNU0MyPzez7SQxBugtMq/dRxcjnINpXv0o29aapqZYYzf1KXrf/SyBolTSUvNSeb9Th+9odkTob4wW+mRqUew9m55vWMD+uZACGoz3HgjYmhcO8PV16BhWjwCH1YRh6NbyTyTy6zNhOiD+QHd3OMlcxcdmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rVw9C2C+; arc=none smtp.client-ip=91.218.175.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rVw9C2C+"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hYyvJwonwfCGOBqxkCTnI3TF2uBM9Q39BNu7gbnNaxg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790954688; v=1; x=1791559488;
 b=rVw9C2C+mYobpdTbeWGnt85VtmelDxcp/9G9NrivROzdt9FEpOpui/PPXtEVvWp5t04dcOhX
 ysaptzVSSPrdtPDA7+zTAceoC2vD6Wo+EmRSavLFmLmBB3c4T3a1zlqXG+gveH+F6CcVBrBXnfq
 Ze/O+v8N60E+U6ler7ELz7n4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9b5b90bf9d35bc83;
	Fri, 02 Oct 2026 15:24:48 +0000
X-Mizu-Trace-ID: 9b5b90bf9d35bc83
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so7227e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByaSoeDxDCaTcf6YIolfaOSmDgNJJtABQY1FYOgK2U4fnWcYLi3ZkeK7fkTC569Pk9VZK/U6S3Wo7aSrOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbav1bHpHCUv9QxFRcFS5sxyyWZ/m7Bv3QjGMskz1HPIpqXEwU
	UNjKS+liv5nRqk/IP2cUyjF+4ymEivrtCoJFTgDA6dGtP+pvdlh4umMTbRRGBTsVVDTBcfvNwIV
	FNgmz8nl56uunJLqyhk0br7S4/aO5QJLu4vAryVU7
X-Received: by 2002:a05:6512:3b26:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5bb7c91a8a0mr181872e87.2.1790954682993; Fri, 02 Oct 2026
 08:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck> <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck> <ar_E5HUSTxMSRZhL@arm.com>
In-Reply-To: <ar_E5HUSTxMSRZhL@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 2 Oct 2026 16:24:06 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
X-Gm-Features: AclHuK8y7NoaOBtAtTR_MzPpGP3lTRFskNsPTGCg5jv7b0-WVHrMhud2cJRGSNA
Message-ID: <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 02, 2026 at 03:51:16PM +0100, Catalin Marinas wrote:
> I couldn't figure out the #8 either. I wonder whether it's more readable
> as (untested):
>
>     sub    x1, x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
>     cmp    x1, #(ID_AA64DFR0_EL1_PMUVer_IMP_DEF - ID_AA64DFR0_EL1_PMUVer_V3P9)
>     b.hs    .Lskip_pmuv3p9_\@    // Skip unless V3P9 <= PMUVer < IMP_DEF

This looks correct to me.

That said, if readability is the goal, I think the plainest is two
compares and two branches. It's one more instruction, but this runs
once at boot:

      cmp     x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
      b.eq    .Lskip_pmuv3p9_\@
      cmp     x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
      b.lt    .Lskip_pmuv3p9_\@

I used ccmp to match __init_el2_debug in the same file, which does the
same NI/IMP_DEF check with a raw #4, as does reset_pmuserenr_el0 in
assembler.h (and hyp-entry.S uses the same pattern for HVC64/HVC32).

Cheers,
/fuad
