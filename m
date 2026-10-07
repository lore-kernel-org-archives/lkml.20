Received: from mta1.migadu.com (out-101.mta1.migadu.com [95.215.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2EB3B774D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355558; cv=none; b=sNi144EEIxe8xs8jAvu06wYh2LlVvAnZKZATbYP67Jvignu0ziRfOomW8CuzXcX5EIGKuj+Dl57uVp6zCAYmOYCShkJ3MlWYpHV819ftuXO+Urj+ZrgesslW1d+UEV16gnxRVOwjXUBfPwK7CU263Xn6pw0fcD7AaIXMtrduXvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355558; c=relaxed/simple;
	bh=VPGN+t64IBvFdkHANdn3m+qys3d57vxK5dztlkdO85Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGEmhuvEljupRUroisH0c2gJab3vTwvCwd3wTk2lAP+GcQAfUFLyHyicZmzEvF766rNYBn6AOQrTamX5FPtl9u062o0V2UyKX1XGZRKLlkU4X+JAqqlxsW6YFJm6wHEWcyu6gwp1n3wCeWjC5oxHSpD+31iT92Hn92O6/+VayX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Rtgt7twX; arc=none smtp.client-ip=95.215.58.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Rtgt7twX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VPGN+t64IBvFdkHANdn3m+qys3d57vxK5dztlkdO85Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355554; v=1; x=1791960354;
 b=Rtgt7twX/Rh0o/TU6DHLRWLO1tNqSRc+sZFIcDB8L+bPAs1rGA2ZRuyp6CXbfUbdlO85bjMR
 drHMuWHnQGPUg6CRZv/3aRQAzhnbibjKU7fMz1L/xqJgdh28HuqCFnqNfIfIs8/UEj7CqoioV7N
 2EwKilTwCJyLDpFm9GM2IeMk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b9a3c069d3f74c1d;
	Wed, 07 Oct 2026 03:22:49 +0000
X-Mizu-Trace-ID: b9a3c069d3f74c1d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so4605e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:22:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgg/WiHigoJnWa5c7y3QFtgJoPim367Hr95otU8fzVS/lBn5hqN4j69Wmkuw4n44Yj4kDBI2wnw3vxBkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbpCy7kcwqudt6cphhYDRu5ptOuzPvgKeQfrM8REBk1hyCFhf1
	eh4rpT4/4ZMWE+8dJUDfj4S04CJSlU8KpyAMHzrTJnTNw3u+Iy1Boqlulo1y4E7whxPSyr4PqX2
	k10cgDB1zIrskPdOM0nIE1fWyCv+qtGIJNZr+jEvn
X-Received: by 2002:a05:6512:33d3:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcca66e395mr244039e87.14.1791343364546; Tue, 06 Oct 2026
 20:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917162020.1612577-1-fuad.tabba@linux.dev>
In-Reply-To: <20260917162020.1612577-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:22:07 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwDaaPCN0=pGJ89bGA0N5URZAK+eqTokvkHmft4qAtCmQ@mail.gmail.com>
X-Gm-Features: AclHuK-0Udk3UkUYFCVMAQPB6nZiw27oXOAJk7rq0N4zkCuJTUndM-riXQ1es2E
Message-ID: <CA+EHjTwDaaPCN0=pGJ89bGA0N5URZAK+eqTokvkHmft4qAtCmQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: vgic-its: Update GITS_CTLR.Enabled under its_lock
To: Oliver Upton <oupton@kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, Eric Auger <eauger@redhat.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Will Deacon <will@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Sebastian Ene <sebastianene@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

Gentle ping on this one, the GITS_CTLR half of Hyunwoo's translation cache race.

Cheers,
/fuad
