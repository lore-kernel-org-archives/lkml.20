Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157240B11B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355570; cv=none; b=k6UpHqGpkt57QElzcy78j6RyiN1C9mGzEKNsw9O/MV/aWgccNVvKSNQzpYkDoixQMVP1dcAChSZBIEnY568RAnM1KB5PoO7A/sJnWnE3Mn57cFZDdxEKjZFuOHqAJq+daQopgZGICadt8L6pRo0NpGidemEOAgK7WXiwKF5gbQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355570; c=relaxed/simple;
	bh=nWznkk9Fjq/D6EuRqmF/M6hW1RRZAYuOo1VRXMA0j/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFbXkieTBjKAKni+xTmnC/6d79IkmNEAaV2+UINUR3Dt5SRoQJfqERjvHScLG7GAYgVOOaBChI8YtPVmqdyDyGTkBaUsNXCyzUDqT6uEfDZYkS4TsTPVWz5Eo/Q3EBkTw4VXzfJUoj15Gvs6l/FunSQ1O+Kh+8JhPmjcVGo9n8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=roTLmjL/; arc=none smtp.client-ip=91.218.175.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="roTLmjL/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nWznkk9Fjq/D6EuRqmF/M6hW1RRZAYuOo1VRXMA0j/o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355567; v=1; x=1791960367;
 b=roTLmjL/2s3BZnGZNwpWdKFbbSHvdZ4OT/RiOsDhki511TMgoYN/ViA6sFFzo9MqsnPfFtsC
 CSTOuCkLr1jJl1EWA4bJedtxHixqkTpy16q2SIl0thmVfIbl6Kcylt9vR4mDYPtkt4ftwCnm98M
 bmjc10OXwnPj99FgGhuDz7QA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd42921281fa4c7c;
	Wed, 07 Oct 2026 03:24:24 +0000
X-Mizu-Trace-ID: cd42921281fa4c7c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba40832934so2856e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:24:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzs694IEDEM+sLWp+/uMSTEubjUEjnK2sMDPKWChh6r+fhCUm5lff2Box0lTIvFXChfoAWTfykuddmFU5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZIp9/LJCl346Dlaqka1MzL8yiz+9oDVNhthZLhIAJ4mbSB0P/
	jvA4bReelVKPkLyB7Z4hHU3BsKZQqaw3hEFCpg1oe2H3M9blfCsjgFMFB8PxKvZzhPbDgz3UI/1
	AGllIOH95js0ZyUAFwfAH14IhBcuSJxhT2Emxq40B
X-Received: by 2002:a05:6512:33d3:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcca66e395mr244231e87.14.1791343458771; Tue, 06 Oct 2026
 20:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915084441.3846947-1-fuad.tabba@linux.dev>
In-Reply-To: <20260915084441.3846947-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:23:42 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwqmQrLz5aDsCo1JFE2H6mz_dWDf=fkLsNup0cgenMCbg@mail.gmail.com>
X-Gm-Features: AclHuK_KSLUhfLp6Pl2z-XBsxbeEyfCpN3TL9UgSgX_CqN7OtwApebc1PcGPn3k
Message-ID: <CA+EHjTwqmQrLz5aDsCo1JFE2H6mz_dWDf=fkLsNup0cgenMCbg@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: Replace VCPU_RUN with KVM_RUN in comments and docs
To: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Will Deacon <will@kernel.org>, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Gentle ping on this series.

Cheers,
/fuad
