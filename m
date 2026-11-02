Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629704;
	b=HBXBtH5qQ9Kwh04K46kJw6ZBV6lH5fJ/+KtGvW+DnBnlZ9IIsf2hSAUJ8JfStWCKSFDM
	 yU3q/J6KrkqYL4jaYAWhw/PiFAkAu1DNBWnAjQl0XpUciYJ98aVPaKma+VGI9tcYZsLX8
	 sATOdiisFX6KyHYRVO4j8Ktbc9ixkw9BwmpjR/V0GeE+cJ5xXY3cq/IAG6Q1wNZqljw0a
	 k6vVw6XRPUbSPM84qx1qDhJW0Ia1qPmE89M3nUd0/DnSg57IQA+TcWUeq5BmUXh8BxwWk
	 DgNpuHlTz5qDaW3M3QJtwYuwNmnB04LRPEno1DTdCjaDUFeJp/XXe30iC/jHhgn2vdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629704;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=0pK5ommQQILhJiDusmehxqIo5bMBDGkmBkDJ10oCG08=;
	b=jNg5Piw+t566sirLvTXuphbg1dElGzQFA931xSrTHJajlpdHBPur4Bqn58GxmOx/K9L/
	 t10S/oRaaCV0WTBSuuY2Pl5hQqA03aC34W/JS80r9VoN7+3mVHXQs2uKlVBQelFiehWXa
	 /d5+jTme+VqB+uBxWgXZn9GdIsROVnfQUIPNUHmEHvJ4sP9jgiuy0ixnU+kzplmNec4Tj
	 Hxy9aXEwchtmK73zuBaCeoj5t0jBeRHX7KsiwLMW8tEC3Q/CH5IdiCjZcGiFvjywqBeST
	 ufaZxUMfoU4Pwng4o0O7M7fTMYEjqe2hSZvMtcGbfxsdJpr6alLndW36nNVsEu0RMlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=UWtE8HH7;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306566080A7B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 306566080A7B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=UWtE8HH7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0pK5ommQQILhJiDusmehxqIo5bMBDGkmBkDJ10oCG08=; b=UWtE8HH7eZ6iSZazPdkqJkDkIg
	cB50hz3vyI6tD7uicnv3+ep19TXlarSmv78cMQyCUgeL36Ii1DMKTXs4nngvBjtiVM6BvR8sZLCtQ
	uAH4PQs52SdmZD2okGbWOfIL/e8M6j5VhquxwLPJfA+XhZYfbp6UEqO04ViMp0aMXk+AQpjaWmCPS
	Up7Q+mHgFS0wH7IPIA80hewpdf/1jTUi9P/Yrrwj9IBWVo7Paq0T/8FIrWZv0FB4aEZ6GL7c9Y9lQ
	lgFpQL/NzFBoVg3hcRsiVb9WbK9rFiUidm9S2C0CWDnaBDpgE0vl9Vq5NOni509ue6gqDNZ5N0sTq
	APIDUVOA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xNt1H-006DcX-1R;
	Mon, 02 Nov 2026 14:28:19 +0000
Date: Mon, 2 Nov 2026 06:28:14 -0800
From: Breno Leitao <leitao@debian.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, jpoimboe@kernel.org, 
	keescook@chromium.org, hpa@zytor.com
Subject: Re: [PATCH 1/6] x86_64/entry: Unconditionally use -fno-jump-table
Message-ID: <auid5MjnGmbN4Iif@gmail.com>
References: <20261102112549.714541309@infradead.org>
 <20261102114000.436794287@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102114000.436794287@infradead.org>
X-Debian-User: leitao

On Mon, Nov 02, 2026 at 12:25:50PM +0100, Peter Zijlstra wrote:
> Currently we force -fno-jump-table for RETPOLINE=y || X86_KERNEL_IBT=y, which
> means that it is effectively disabled for most everyone these days.
> 
> Simply unconditionally disable jump tables for x86_64 to take away the edge
> case.
> 
> Doing so, allows removing the array_index_nospec() barrier in the syscall
> dispatch since it cannot be an array index anymore.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks for the patchset.

Tested-by: Breno Leitao <leitao@debian.org>
