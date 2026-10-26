Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039165;
	b=gU4KOiJcUglM0fNjv+9QdcELmzs/Qwek9dCLI4NtA+34iyS4e8DyfEZdzvc8r7+7LQGT
	 gUyHkUJlErVx1bBLUaWmCDmqK+H3wlj6G/tUP7U6GGTxQ4QePUv+qA8CtZCNLvmEXnjjH
	 73tgZfAb0Eg+Z38Yeh+J/5RmWJIloqunO7RmKuAn6yKGEhCE2qBHKuFlzYwN4XBwub+oZ
	 tVDvxmZV0BGZiZB6glpONzuTte3WBSTNURXh7QrC1w7fErVMKov+cMP8Ax9tYAapDxazX
	 RkR9TgxzCVhrvu6SLDfjdFvedLgQqxYG8hEu2iKzqOdrbJbx65eDXooxCyUujcq3FLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039165;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lmSjBt381Int/979ff0RAowhu9l70G3Kq3clcNSHU84=;
	b=KmmJddPJaSSCcG+MSfRyzVvjCnXDyIbM4a80bft8am4C7xSZPOVjdPJoy4PUDqk96+LF
	 gtVIQ78Otxe1bHeBiPWrMkvvH3pEMkTFisssFNyhycU8JgkaOK5pyiwN+8keYjYyuKKji
	 hZn3lB5lvOfmIBtCMbxzXM54Z85ITwuBMEUH5gDWWr6LvKGmLY8qjAA2d5RCOG8C8wPAu
	 JzElJD4TuUVEoNgS3kmdMxMJImZvgudBoBOKbG2jTZTIpItFvsPEt4200SEB17z2f+gyK
	 B5Cx46shYm0azx+N/mDrRlxBHxdvg/nxhKdaZwKrlISJmkiFltntoWln2hZYU8+MyYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQqp+g++;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97366606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QQqp+g++
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24901F01829;
	Mon, 26 Oct 2026 18:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793039165;
	bh=lmSjBt381Int/979ff0RAowhu9l70G3Kq3clcNSHU84=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QQqp+g++O1bKmavNmd55njjBhmcKagv2ZzK1sNGbbhozamyB3LOisD62kqljerZLF
	 dEOIDkQvEcDWYq/9HYB3z3MqG54A1sQTKD2+cYDBujCUcXpq7hghKMjIdRBZ93WO78
	 CqfIRTsgivTM3NLp/8PkFrVC4EJajLO1DXKEoDVh5H/sOl4QhzTf/Pdg29ZC8UVDhd
	 SIzw9SOfh2gSsiUyPtw+7icWDF4p4QYgJFfEztNALlP8E1p2BQ/LGuRycpCb6gHSem
	 3u6DN+Nt/yCHinFebWkVNhSQeRYVxmrHzg41GUzKlwJoc9NgJtx+sgNCcK+exCaexa
	 Bm/Ud+6fVx4qw==
Date: Mon, 26 Oct 2026 08:26:04 -1000
Message-ID: <b2a7765f41d7ae72347ca49ecbfd238d@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: Breno Leitao <leitao@debian.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] tools/workqueue/wq_dump.py: Add busy worker
 inspection and BH pool states
In-Reply-To: <20261026155037.557670-1-atomlin@atomlin.com>
References: <20261026155037.557670-1-atomlin@atomlin.com>
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
Content-Transfer-Encoding: 7bit

Applied to wq/for-7.5.

Thanks.

--
tejun
