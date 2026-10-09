Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D614E0209
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552492; cv=none; b=WGtK4RG6qdjACh8zJaqDlB1IZy0AqdFk+i8SpDTy+VXvhJb/3Xq+1PvT7Pn4+VFFgWBVFfHTQf4qmTtMBme1YkrHGht8wWpU6CoxmAZfwsd7EDkBxOJQb9mzir0FDa3xJsbBpUuvXsog29FA4ZxEjiEaNtc4mIePklsNFhuVxkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552492; c=relaxed/simple;
	bh=pCExuXxs2juJDgOffh/1mFcLPGhM9NfXkks0pqF4CIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k4FIqSfbYLypU9WI/QRGbwmH61VOVL+ScDp3jzcva//U6+xfEvW/O0V9/j/uP/hhj0WtfJILnI98XNcPvWlEXX2BoOVp+NPuRax8FtoV+aI49tIw1fVIrB80L0gG05/SdeTRxaHlTuQ/TlEjajtrk6B894NtKtXMgsgR4QpPVGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dj5WjoqW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pNq7oWP6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dj5WjoqW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pNq7oWP6"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791552489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pCExuXxs2juJDgOffh/1mFcLPGhM9NfXkks0pqF4CIM=;
	b=dj5WjoqWu1McyjdLTr0i4ogVoPh6o+1dxROajgfhJqIrFGzFl0NLZ862jZr+QftDSVye74
	bT4ZLSmRBuWiWfFNSkf6VfwT4pB0h9nRh2JIGgGBEuoXERmQCGUljF1tfyvr8zWUcOFute
	PhXtbJ2ZUR1a0fnyxDGysRQ9wXOSrLPm9wZ7UEwZwkVrOyhF1vq7GN/UbycgR98cDscSfQ
	5tKU+zA/VRPHAxC0yyKOnEXvqYJneHsBh5eSN6d7kIG8STZe+RpTUm/TKtkXa+OJY3rupN
	YQBUjj+SLTGEdPXvCTqEi5xGS7Fr5xSRdeZapJz9UP/2HsiRAPeBNYnMymIxog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791552489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pCExuXxs2juJDgOffh/1mFcLPGhM9NfXkks0pqF4CIM=;
	b=pNq7oWP6LzbYXw+/N1r9k3pT8webHbFJcga499IUxY9OIADZzwJCEbhc6/M+T7cVyaR+t/
	w8u7d/2fVuePvwDg==
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] riscv: word-at-a-time: improve find_zero() for RV32
In-Reply-To: <20260930124052.21986-3-jszhang@kernel.org>
References: <20260930124052.21986-1-jszhang@kernel.org>
 <20260930124052.21986-3-jszhang@kernel.org>
Date: Fri, 09 Oct 2026 15:28:09 +0200
Message-ID: <87pkxj2ec6.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jisheng Zhang <jszhang@kernel.org> writes:
> To remove non-necessary zero bits couting on RV32, replace the
> 'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Nam Cao <namcao@linutronix.de>
