Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9ED4A4981
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999561; cv=none; b=cZpNieLQTL5Zzr5QoH3JhHzrc6yS+OC7UXBnVoUYq+vfw86xZmqLbsnHEyZ4PIHtUdsgRDYIkJ/sURVUXgTH/kcHKBra/E//Kx3qnj6c+700Y+FIni5RxoFsxUFpQ368ReeTPoZygqNljjECwwjH+bGv+TQI6684JWD5XK1HDkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999561; c=relaxed/simple;
	bh=YCLS+GpysQVlR+Gg9J8dCevTLbKjdQeJbJnZ1IUK5DY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PHWlqwgOVf4nYPRscYSUggXFJ2UAOmkYlof+K/hpzF3I7/WVS7FEOU4zpwQm90eo+W6sr+EeBvUDIAjiGdDDjSX9yDsPHyFT6Qi8U0N+NDS82ViSGP/R5PtIvodjPW3++RyrW1nHl4maq4LltPUFQ2cu3lvsqm3jduLZ6pjPnJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nT/GhguN; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nT/GhguN"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc51591102fso4397367a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999559; x=1790604359; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2Nhmlqu7ytTbKiYkM8wQ0H/blwuXmMtC635O5Am7vU=;
        b=nT/GhguN083dggGi7fyo7f1Xzerr0Y7cRRxRLJ1nQZzuqTeIdGcJQZ2c+fw/XP9d41
         YYDyreZRzRnbQNdMhC9ER/DDtr9vZThkrGVA6B9uonl65lK4Qst07XYvtb/9F99EXGpO
         YfeA/YNz7ivHQo3hyFNkUC2XmtPX6Vt/anksW06xH1lJUN328hSF/sdFl6qDhCLG1m1J
         dBSOthrdNrA3JEgKBJPXTH/8W1aRem9LWv9SdnEaypuDDc3/hedhFb9/E/8BykI09UKi
         kvvaRNis6HOMUtR/tbO3bgbdUXsdgLHJZNyaMoRjfXe3WvBLZ3m/apPPT4UXXz2eQ55F
         1maQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999559; x=1790604359;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2Nhmlqu7ytTbKiYkM8wQ0H/blwuXmMtC635O5Am7vU=;
        b=KRfanICANAhWrYvre/3fCxowUHEIdoPme7q/L1JdOOpfi2qZTroFDAEe37TjIBP4CE
         Uvnyk64DC1RdArkHtSV21BW0LCislT+0ghZ/xwaww1kFEax5Y+dDvmgdWA2uxy3OelSU
         QJGXFZ0/zKWcLqZ4js5CJK+4TPTNs0pXbOHQRo52K4Lz7ZDEekO3Fh04MMlPsvLpYU54
         mB9fAILTKSFp9yemNue4BhO3X0wQlhVuxYXQPYpo2QTj4EVrav/B3IvcOVUaVSdBHo/A
         sgHt//9rarIhFaFcdBew7pHnNK+9AnjRitA1KLkEw66BRarSYl99Y12/JP7HSCU/mtpH
         /UQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRUNqljcvrp/c7OSUISQ/MEGdlhGT05SoiUbhZs3KTK6wZ/W9z96lY058R43Dn9d7ip1+4xAV/53uiAFo=@vger.kernel.org
X-Gm-Message-State: AFuF++nt+wtjBA1o627hMmL+6VxuSM19KqQ7821g1Zgg0Tlj8MM3mj/d
	38e55Bj1IQi5/cTMobdVAnE9KvecxJZfE/8rYL0G0747bgxHMkEpxbxNAMSdRUasP4cMCVPgM+1
	mdw2ruA==
X-Received: from pgvm9.prod.google.com ([2002:a65:62c9:0:b0:cc5:284c:de35])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9086:b0:3dd:a196:9077
 with SMTP id adf61e73a8af0-3dda196af91mr11271682637.65.1789999559066; Mon, 21
 Sep 2026 07:05:59 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:04 -0700
In-Reply-To: <20260826161430.714316-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826161430.714316-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999853712.734513.7564161913562650394.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: Use __GLIBC__, not _GNU_SOURCE, to detect
 actual glibc
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, Hisam Mehboob <hisamshar@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 26 Aug 2026 09:14:30 -0700, Sean Christopherson wrote:
> Use __GLIBC__ in the hardware disable test to detect when selftests are
> being built/linked against glibc and thus pthread_attr_setaffinity_np() is
> (hopefully) available.  As pointed out by Sashiko and Hisam, _GNU_SOURCE is
> effectively a "request" macro to enable functionality, whereas __GLIBC__ is
> an announcement of support and selftests' idiomatic way of guarding code
> that's specific to glibc.
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: selftests: Use __GLIBC__, not _GNU_SOURCE, to detect actual glibc
      https://github.com/kvm-x86/linux/commit/f13368e0acff

--
https://github.com/kvm-x86/linux/tree/next
