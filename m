Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33790489FC9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932903; cv=none; b=k+tLNcXOC99E/ZNBFgy3DuKE6/Qzl8YWshvrTP1pGtPYjfgMUA2JrEjlEyefF3q3Xr98xUx9oVzdzDFKWiCnYnwHPpLIPGTHj+H1kOf1zS9aZId1UdGSmsL3sGPSv8VrStDHktgqgb35H5p3zd8yCilzw0EL2ExM57D+X12vBRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932903; c=relaxed/simple;
	bh=iz4G0JfeyhfEiK4Pr8aTSOcc82ATpgxlT7irZ/dtCiE=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=Sfv+Q5KM1nU40cj+0m1JIr+fPuLXk9UItBpdcMyZAv+/sDUZRqpChn7pO9bSdRyFxcHJK/28NrGwLk84pvB+26mi3N0K2asB7htVO3VZ/fc8xK2Qw1ZIkVQJG2B2f0oexeVc0H6fNJzPDs/Yzk7eaTdCkH2CuvMqSnJ5vCLxAZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=D0bYQWvX; arc=none smtp.client-ip=109.224.244.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="D0bYQWvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791932897; x=1792192097;
	bh=iz4G0JfeyhfEiK4Pr8aTSOcc82ATpgxlT7irZ/dtCiE=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=D0bYQWvXJ0hpLrY/Hjsx0ENqeUNU11q07xJ/rLyOWZyo8S8t4mShMSotnyidO6qPL
	 5VU2o2qzbR3eQ+k519yu6stP+R6X/0wPiegN/zJWxm80guMx9sL7oJwwJijPoQl1Gz
	 WBK5+sEZqX38zzyQSyDbnOCnU0n1GKX+uBDaY1iYMmNirbkmE94GfFNTghVq7mBlxh
	 XjxxSIiG1WSVwegQVJRe63suuXwKjyRdqClZ7CNfeGWAsI4bw33uREILDZ4x+OFMsY
	 YUNu9ZuRaoCw/GM3nYIRv5qcXzgGEmr9OYrbHPU5thDE42P6coPpYHnuboLQ3Y7HZv
	 fTtchPmJnFLcA==
Date: Tue, 13 Oct 2026 14:57:58 +0000
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "tkjos@android.com" <tkjos@android.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: kerhunt <kerhunt@proton.me>
Subject: [PATCH/report] binderfs: minor leaked in binderfs_binder_ctl_create() error path
Message-ID: <EfcKCYFZFr2LlmJSGpFxiQv77ehjbo1f3S703D_9lI10n6CGsc_Fs8D1toldbaCG5NU50SqHQ6jpWdo98iXI2F2sKoZ4FuC2BPsJR_iNc9A=@proton.me>
Feedback-ID: 227694322:user:proton
X-Pm-Message-ID: e29011ffffeffd7cef63defa488d1d78c7e9f725
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Greg, Todd,

binderfs_binder_ctl_create() (drivers/android/binderfs.c) leaks
the allocated minor if d_alloc_name() fails after the
ida_alloc_max() call: the error path frees the device and puts
the inode but never calls ida_free() on binderfs_minors, so the
minor is permanently lost from the global pool. The success path
releases it correctly via evict_inode() (binderfs.c:259-277).

Fix: ida_free(&binderfs_minors, minor) in the error path (or
restructure so the minor is freed on all failure exits after
allocation).

Confirmed on linux-6.12.112 (7aba70ab) and mainline HEAD.
Happy to send the formal patch. Please credit "kerhunt
<kerhunt@proton.me>".

Best regards,
kerhunt
