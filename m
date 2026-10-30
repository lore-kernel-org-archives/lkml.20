Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346196;
	b=OLIi/Qio2KM026Avi0kvfQwXoddgFcVtNIwVGYndjEcYT2Im/o7ya6WHnzvYMvTGXfdN
	 s8kBsq2YTSTRylpEQTZzD0n4y68SYqFjl7wkpHqCy4nq19VBWEtlmEd78JQJiYTKCm8c1
	 bgJODChyfveG7gm9jc+APfUIUvsc/6jL7JADgpLOeekobLLB77OCkvaeFdjyT9Q9Pg6gu
	 nZ71LPp6g5gcsax+dJW53zOIMVAVVXZ40nWI9YQ8kboUh0CNadZrm50c/Pka51+ntl3Bm
	 J3Ih2juV/7DY1ljxwuspqU4h+WEQqT/REkqb6sby10Q9+s0Q8oXLIYDcUI8PUkqRyLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346196;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Ic/DznHWY6qYKyiKcZAzEYcjT1Csqaqbv7FtlV+91D8=;
	b=IW4Ex60G2l65uzIy1myydk3WTkeaoqiNGy/tGcbrYt9UIBynClovvRuJNIsgXt0xyLkL
	 PzS0RGkMth9QNgSPeBBItzRBjPOwDmoysGiCR7+JnIwdBuPDtrbjMJtbeqlF/BuiUaouB
	 xGROvumhr0kPY0jq8mZCb7N6Pnj/BaFB+BQ/ktE+DPuefcMnRYeYIG+Bw/hqkEv7PXXCy
	 MC7kk/rUrItzZAV50ZeOT+kT3UmB8JLhuat+HtMXgTKO+eyuABIINc34iSOEeQS5LucKo
	 7cwFV2GXXNCL+m5PlV1nKa4A1jjDrKWrym7+mQ2AhsLGDCBqQ/Eh4sSngfqd+9FJpPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UAZJq5bQ;
	arc=none smtp.remote-ip=91.218.175.244
Received: from mta0.migadu.com (out-244.mta0.migadu.com [91.218.175.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B8A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62B8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UAZJq5bQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ic/DznHWY6qYKyiKcZAzEYcjT1Csqaqbv7FtlV+91D8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793346190; v=1; x=1793950990;
 b=UAZJq5bQIWQcWogRotT3m9Fcp2toczLF3zLK4Jw6KpBT/l1dNgIOXYqpJUKrOZJ0jql8q064
 IhNxFrTt0b/ds2xGUWvJtEd3Hr0f2xabJ6DEz5RzuPkEhnMPjGKQGrL+rahlIFHyhr7VdZEZ2/q
 p24RlmK8mhysuh09UnGXijLE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c261683fd1f00c76;
	Fri, 30 Oct 2026 07:43:10 +0000
X-Mizu-Trace-ID: c261683fd1f00c76
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so5995e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuh/+zQcJcEKFhSDKahxsFiw2oTrUwe5QlyyvOoQq2Yiq7eCTMdDz8LY7TRo7GK0EIhWNYOaLnxYskJ2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBCX+Qtt/FBYp2UcmYfeOAzr3beed3h38gNs4dYQBRcTwbRCBc
	LyBGjA4Tgp8qD4zBhuEWXjbNl+salLCdb0QaU7ZHGh/UabyzWPJpgwpYzDOyMAPWC9BBbJiX+IT
	yxfB7prGm6pFSlI7rj7nsbsVKxnrBiQ71k9Fnn5zD
X-Received: by 2002:a05:6512:39ce:b0:5bf:dcd7:86d9 with SMTP id
 2adb3069b0e04-5bfdcd78993mr28332e87.16.1793346189429; Fri, 30 Oct 2026
 00:43:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-2-fuad.tabba@linux.dev> <auO3Kiykovvs279e@arm.com>
In-Reply-To: <auO3Kiykovvs279e@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 30 Oct 2026 07:42:33 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzvCAStFp4TOBJZ2dEi9GT_S0CW0i7HzB4Q_+qLbv5Uew@mail.gmail.com>
X-Gm-Features: AclHuK-iAV_pLdWc4hp6CdmUshGwwfxe2S4f_ErlrqMD7iHGLjhkPDfxfT1tlNg
Message-ID: <CA+EHjTzvCAStFp4TOBJZ2dEi9GT_S0CW0i7HzB4Q_+qLbv5Uew@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: Add override for ID_AA64ISAR1_EL1.LS64
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Zhou Wang <wangzhou1@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Catalin,

On Thu, 29 Oct 2026 21:14:18 +0000, Catalin Marinas
<catalin.marinas@arm.com> wrote:
[...]
> However, does this need a plain cc stable? I assume you want it to go in
> with patch 3 but that one only goes as far as 7.0. Same cc stable in
> patch 2 which you may want to limit (or add both as dependencies to the
> cc stable in patch 3 when committing).

No, it doesn't. Patches 1, 2 and 5 are only there for patches 3 and 4,
so none of them need to go further back than 7.0.

Marc, Oliver, could the tag on all five patches become "Cc:
stable@vger.kernel.org # 7.0.x" when you apply them? I'll respin if
that's easier.

Thanks!
/fuad
