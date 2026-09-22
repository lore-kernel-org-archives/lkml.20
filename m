Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7F54938D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085028; cv=none; b=fydn8Y6W+QDn7+MLi9JyEoppQfyj3l1qVkBt5M2+w8dclNBuNC6sCpjH7753c0G4JWsQZ71FQJZfVbHK2wHQeh69SSEH2IU27h7wMLBprE+SmF6uTHX9WvIhVgAiF6ofm4/7Va0SU7MJloG2+vvuSnoZukGxljH7QxyflKai7tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085028; c=relaxed/simple;
	bh=LD4Dt1VUowZxVym8KcVqrFzWA9GmmHGYh/uLDgQnS14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aLu+zRNR6xT5kE3SVNYyWMM6PGXDC0dhWGPIKxB1hDjzc4T9syixfaoYKfVGhO9fq1uRpGzWJugR8UUHLQ7gi9hxdYxV0l+sG6nrH4mTHoswtJHRQe51Zs+zzH54YnQhqdmwTLrCAH7lKXc4Ag/C++1k1bpKIPD30oq4lZhu0SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NY/Z972E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qk23kcZi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NY/Z972E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qk23kcZi"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790085024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LD4Dt1VUowZxVym8KcVqrFzWA9GmmHGYh/uLDgQnS14=;
	b=NY/Z972E8io5RKYuLLWT4laqvmc7zfb/pkzogbdqmbPBDLTuyagus4/xOri9jYXR81fT1g
	nLBtkj2zwmiEXI/9FQ5wVrFQrEDs2ZUf7187TMD7llJrIe3ynavsL9uH7gR1rt8ZjZCHVd
	VXDEQYmQXKdVVn9jQDZclayKxdSZehAg+146YApOF5dOF+T2UTDHuT1pyqYTe2DeLgUcRG
	41yup6LLbyBbaykYqQ+3sNmXmhHmFByPWxlTWbbN4KLIBYZRpeqOYBz7MQ2LdhwUHrY0ft
	8AfyRiwgI3csBtQftyvJl2DK3ofb6UdWfmLWYVfQSnxO5d1b2MAkNwUO0y0ERQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790085024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LD4Dt1VUowZxVym8KcVqrFzWA9GmmHGYh/uLDgQnS14=;
	b=Qk23kcZip5Cfoen/tLRwu5rBgruubDgq/l4i8elkpnVTnRsPlPy1F8wJHJXQ3tb5E0g082
	xz5TpahA4l3mONCQ==
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] riscv: word-at-a-time: improve find_zero()
 without Zbb
In-Reply-To: <20260908235312.8440-3-jszhang@kernel.org>
References: <20260908235312.8440-1-jszhang@kernel.org>
 <20260908235312.8440-3-jszhang@kernel.org>
Date: Tue, 22 Sep 2026 15:50:24 +0200
Message-ID: <87pky5e6ov.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jisheng Zhang <jszhang@kernel.org> writes:
> Previous commit improved the find_zero() performance for !RISCV_ISA_ZBB.
> What about RISCV_ISA_ZBB=y but the HW doesn't support Zbb? We have the
> same heavy generic fls64() issue.

This patch separation makes sense in your first version. Now it makes
more sense to squash this part to the first patch.

...
> To remove non-necessary zero bits couting on RV32, we also replace the
> 'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'

This should be its own patch.

Nam
