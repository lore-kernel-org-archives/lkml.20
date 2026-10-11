Received: from mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06947370D79
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703585; cv=none; b=A1ztrFHLpZz7IwGRCLD932a15gu/V1l+PtBjlyNI0uBL4Ze0YgW1JBZdgw1Z3yZK8kTIMrX3u0eppPlFIs7twodrwsgthnZtsUbU5qnAWL+uTkouZX4KVOpje7D+yt508bOG4j7wXU+uTJuvzc5TyaGlIgpenP5olynDsPpKzxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703585; c=relaxed/simple;
	bh=zeYhOKLAEK6plYt1ei/97MDQNIKutEUyTKAyLEF+q9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHG44jIAnkL1ArL98gCUxdbuZW4AHNPAf2fem23vRUknCqB+3yHVhnyXrlb0XuO9V79i8ILj/TkqraWGdGh1Jhw3ai06BOemELA3xymWrzg5H2jMws9YWLfRVtp9GXGAA1fSWirQStmY0fM7qpPnk91Jrapx8s1q/fnpCRIPQtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GS5goXwf; arc=none smtp.client-ip=95.215.58.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GS5goXwf"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zeYhOKLAEK6plYt1ei/97MDQNIKutEUyTKAyLEF+q9o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791703579; v=1; x=1792308379;
 b=GS5goXwfn7r6xFwaxi2eDushgwFVF/UT+Dh/fgMzpQKjJ/waOlCutcC3jQ3JeVjsmBi2c9no
 GsvdO6A3DyQmtOpiXPn9pqXIRIxLRO7UDaP1hwvSB/iFoXNPqgS3b5jTpPx+ImQ2vqq6V1uUr5p
 kcMa4OvO+aPnKMEqgRxoGLbA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f0573254f704923d;
	Sun, 11 Oct 2026 07:26:19 +0000
X-Mizu-Trace-ID: f0573254f704923d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba40832934so2449e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:26:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByM6MJIJCqY+N8ZuR/nBsBlHBZVny/aqjSZCBPEOErvUrzT9j3gSRiI4rkbi+y7Nm3wLyxlvjThWj469Iw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpf8OmewL88afHwyHefasgOhEAtR3WJHYPV+bkx9yjd32wnUyD
	dDrOPqf+Br0t6AeX9lr0C05Ec4QHwEw0RJlRe2R8sOgibLk651QhAWkL9MoB/zhgu4qPneOzt6y
	sK4Xu8eG5GzBmdXsQsUbenJmIMfkP0IXD36APjtqY
X-Received: by 2002:a05:6512:3b11:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcea610359mr46362e87.14.1791703578480; Sun, 11 Oct 2026
 00:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-4-fuad.tabba@linux.dev> <k6hsxo35ou3b5bcdo5xiew56zo25c4dmxqocnxszjvuqd7ct44@owruwfstprrh>
In-Reply-To: <k6hsxo35ou3b5bcdo5xiew56zo25c4dmxqocnxszjvuqd7ct44@owruwfstprrh>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 11 Oct 2026 08:25:42 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwe73HZ5u3LWgeYjDC2t1n4aLdwF=r-on5hSzCeTg+WPA@mail.gmail.com>
X-Gm-Features: AclHuK-7n7d2SMrcaEI2aS0U2QLkxfWQsDtE5UfiVO1913-p3Vb7V7WrGlc9y-0
Message-ID: <CA+EHjTwe73HZ5u3LWgeYjDC2t1n4aLdwF=r-on5hSzCeTg+WPA@mail.gmail.com>
Subject: Re: [PATCH v1 03/10] KVM: arm64: nv: Don't loop on AT S12E{0,1}{R,W}
 with an invalid VTCR_EL2
To: Kajetan Puchalski <kajetan.puchalski@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

  Hi Kajetan,

  On Fri, 09 Oct 2026 17:30:59 +0100, Kajetan Puchalski
<kajetan.puchalski@arm.com> wrote:
  [...]
  > Currently we just clear out the upper bits of an address larger
than the IA size and proceed, but
  > the architecture requires that to cause a L0 translation fault.
Not that it's a particularly common case.
  > That is to say, I'm suggesting something like the following:
  >
  > + if (input_size > 48 || input_size < 25 || (ipa >> input_size) ||
  > +    check_base_s2_limits(vcpu, wi, level, input_size, stride)) {

  Thanks, I'll add this to v2 as its own patch, since it's a missing
check rather than the loop this patch fixes. I'll add
  an at.c test for it too.

  Cheers,
  /fuad
