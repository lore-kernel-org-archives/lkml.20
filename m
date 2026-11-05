Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906336;
	b=Pi5D9OEX6GHSH+fcneuGANcRRbsIoay34H4M88gt8dAhFyNYLpGjagmhsInJk5GLVlIk
	 20I7JaFe0l1QELQTVtUK9jHNatU/39j3gDdBplpbYbfUluDYAHe8j+3QJpY6ilwIBYLMz
	 3rYoRvljg0qbgVivyxrZI2EpKl9MyZR9us1wXRhNNjjR6AQD7FDFzuCsJEOZ5/QoqzZrQ
	 D8V5dMZN7pIOZ7XkB58dPpy9ZcFRN9gXsuW6N5S7+YqY9lD3RNw17zMs2M7+AHXcOMUbE
	 hlWZUBeEumXMs3KfXe8aHYMQ8hWCmJnbDHk4D0vbTPGV6YrhyoXU+Ypz2T4sb2nQ1gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906336;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=HcpaF0G9ToYbpr+jXpjPp1HVmtfMgE3+2rZcXIbLRvU=;
	b=DillmhsaC7DbfFVtyzN4ZPbk0NOO7CY1xGuXzBZJSVxbgDdUENyFLeN0WbfPQ/gjnrGs
	 b9uSOOK+IZwE8XTAJrn4QoWaqADlhgprn70cb+5H02d6Fx5dpfXPYi/8Pft+O/uySGYMQ
	 07qyOu1PxOtiu8tbvB15f0YV52bPyMewt9ycWgyDyjtLZNeET00cdeFUZM7WQMuXPZxGm
	 OP90EzqdpWrdKPRGC5+DHzNI3PfIyacQSSoOTVTcMTdpRBRy0I6EiIYibn/mkYrKBW0oR
	 UXHezuoDT3zP1pdVN169vQtEKcsAPLm6JioUHL3Qg0WvlLFhe90GwW3iOnNVZQE8M9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=ayWAlRiQ;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=YNEt6fct;
	arc=none smtp.remote-ip=23.251.234.55
Received: from e234-55.smtp-out.ap-northeast-1.amazonses.com (e234-55.smtp-out.ap-northeast-1.amazonses.com [23.251.234.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069CC606A328;
	Thu,  5 Nov 2026 19:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 069CC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=ayWAlRiQ;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=YNEt6fct
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1793906334;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=HcpaF0G9ToYbpr+jXpjPp1HVmtfMgE3+2rZcXIbLRvU=;
	b=ayWAlRiQTdJWU/4Tp32HxqPWLsYsca8y3IFmemMftk0k0mxK8Z4ALgpo7CnrnQv4
	xRyOeBPiz0NxWxCGD8LEjyD3Kly5ixXun1jtNbXHa6bCNDrDCUZjnosuimSXuDe5VKJ
	1z7M0V7EJBP+QvTkjpj6TS5tQwL7FBbXBJqbqSgg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1793906334;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=HcpaF0G9ToYbpr+jXpjPp1HVmtfMgE3+2rZcXIbLRvU=;
	b=YNEt6fctKf2AOZHB63LXUH+174ObsgTBtMSDp5tBFVkr8wpU4SBlkXMhoYDrqk2h
	Mz60NO31W1qLvSx/8tk9vcQ6ZhZii6M58Rz/zl/e+gzokKyS/MTNVbgFDQUZgno0fIa
	sTCiNbK8uO3yemhv9DQh+BYR/UMiwzTY9xw0jcTg=
In-Reply-To:
 <010601a0f11c4762-f4775077-f8b1-4000-bdd2-d36d7658c606-000000@ap-northeast-1.amazonses.com>
References:
 <010601a0f11c4762-f4775077-f8b1-4000-bdd2-d36d7658c606-000000@ap-northeast-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: hverkuil@kernel.org, todor.too@gmail.com, 
	gjorgji.rosikopulos@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
	loic.poulain@oss.qualcomm.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: camss: stop started subdevices when
 stream-on fails
Message-ID: <010601a1ad265b72-97c3eac1-cb56-49fc-a50d-c5339e11e9d9-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Thu, 5 Nov 2026 19:18:54 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.05-23.251.234.55

Hi Bryan,

Could you take a look at this stream-start cleanup patch when you have a
chance? It stops the subdevices that started successfully before a later
subdevice failed, preserving the original error and unwinding the pipeline.

I checked media-committers next at 6628e7d4c6b2; this cleanup is still
missing. The original posting includes the SL7/OV02C10 failure case and
the fault-injection harness. Please let me know if you would prefer any
changes or a rebase.

Best regards,
Jizhou Tong
