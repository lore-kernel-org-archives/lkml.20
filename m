Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502653;
	b=iyq8Xzo3/z0SjnGP64L16O7/MD2qp1H7yiIBQXZhmvr4sP/QUWTi3pBCwY9LUMv3K8KG
	 lHSyop2Fx+UxZocSNvxjLqRPL+R4o5QdfMUsGj3KndkKer1zn6xNUoNl2I4Mkv+2+Yt8u
	 VPRuetNQYMkNnOy9deYaoKDcpRvy9RaUbhbcJVrOX1nNL/jMxfDX1JQ0ahOtSmYCUyohL
	 ct7P1DR9qK5T4O+HIZii8swcwqgjNZ0XO7FgFDXB6KVF6aEFemAuo5GJP7rB+IZu1Ic4G
	 xUD15PqmKkOVYYvmYddoPTaFF/WtT9IbDVYDc0nq+1FSGriHraD2TzC7nrLY4xGznpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRtR/3LEKCT96Cn332o020ioqbbOJSAYNYdI1pf8JNI=;
	b=MlQbL/+MQJ3aJH5wLouqNIFtwpQAbc5FVIoObVj5txVwJ4gQ7Xw9FD2ydr2JtIIEl5BA
	 HWhfjmqsHouHhtTlo6M16jnTjA6dNdcIkG3FEmaXI8j0dyFiG5RFSDVKt8snaJUjUviY0
	 Shlwb8CIn5kzftITHRXeLUDEgR2qGZoLyegEfLuCS0PsmMQNk5MKuW7WjyleDAK99aanZ
	 f39wykAXS2tt6zp+r7xrgioECYvuHM+yGK456G9Ns7cf9DJcGD0rF846ekathBugWxn26
	 pZzzkVvwQW2djD4GmEneOLJ9YXo/4HUDIozgtw3955LZu0vqRwwN+JAbzJ6HP6+0DSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWJBmoPi;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B59606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B59606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EWJBmoPi
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso2950987a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502653; x=1793107453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRtR/3LEKCT96Cn332o020ioqbbOJSAYNYdI1pf8JNI=;
        b=EWJBmoPiTzgM6kfVEl+EtqoPCzocUVxgwjVlaA9tBeRdOEyfbSlWaNCHaymhCC7hm9
         NNAwloBqdpuX2iRcQvH8EPAUjQix3RolaxQ9KYXKNvACAg2VaeOKy2DMg9FENftE/PCG
         UoCnA5vpsfMfL3G0dO9R7pGOCb5m2tulus4DHYsvrYFcuFOh6E4PFEh/WX5OhgOm7fLj
         M3YveFmIqZ5mvjjh26FdsZBGx0o6t0RcIz7IboKGT0ccfIsh8zSQBimMVjQ28glI4sSC
         riAyJ/C+tcb85fiNGCNlmlht+s6OH97nSzoe3ih8jTP19629AfQ2wV+wzsTOjNHfXJQS
         kv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502653; x=1793107453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRtR/3LEKCT96Cn332o020ioqbbOJSAYNYdI1pf8JNI=;
        b=x4YOd4JSd4D0w2Y3aGMovW7H63lBb6DY9Te8ZI6Xas5gaZxN5qG5ty8SeTPrNGXlac
         GnU5f+rhFtcpXkKYdilNXrtHUejk6M28oyU9QXkVdNNXjhr4YDZXQAJuFJwlDEnKBugl
         yu+IvPXhQWT4Jr0SDuX+y2bQnZKq8I5WKIK9JWPd5TdAq4pbrb5nYp/2xPQcuojXAEmS
         fgw1w6TMPH+FCJQOKDG/O/lXkLComc62XlN8ZJZfJLAq72hyK0X+5S2LdYQn7bDFg8CF
         xKz5jic4WLUeyW1qPWWskj4muB37ICgvNH0eJpWnksiX1zCeeZlyTj6xAz+0i2vnmgHi
         dcpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+q5QjDxHzIGGIVSyNSepCPk9LUxvRBBGHNucxgbBBsHBEu6Q6LntxeQj5q959rpYd7U2HjTY5ESBUu38=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFwduRCIj5GIoC2T/Q8ep75z7LGjGE/Ac6FHTxiadlt+hlLSPx
	NGgM7XhARJwPe2++js40zf2nHAMK3rnU/wJIa3mYCa/dQmb67fJydj/1
X-Gm-Gg: AYBFou12P6sW7QGHiHcDCHXFdKqhrKv1DaPuYnTOuyzawcoAEoXN1LDdDiB7Wz8eUU2
	stpGL14BnDinBmlDjOyHrnWcHqElRmQeNLUFjoop6BbHEBhClPBeZx1Fm0+7L5aPodBKbSSjhLX
	BPTc2co1musOivZBN62LbMCGolbir0MRVkB+cgGRv+SQroXBUaXHb5fHTFYn2WWD+HdJrHHm0e3
	WuSqClXN3kol2lHZZfa5sl6KaGmzvi2pM8hDBQWVm9fm0FLK7Dx1HWgLtTJWydpM4nY5vu/bW+o
	sbaFYZywe1qFOW8q7lXwwdFjr8Cr46N3vKRoZPSe16JanTP5pwnmniIAS9tCrZk9GqTCN1+rGjJ
	9G5cwudK+Stic7Mr/YuvuyvzWRaz8b+Bmsqvc5k2fvyx3oI7c9Jj2zqNKbHJfxd/9UZHGYHfx1F
	iUPJ6FLOH83c5bT6TTiyOeiXpnfs6dKev/c0g/oCmr7JieU0su1oMdyMZ3/3FiJtvoQfrAYE7PX
	UU6QeuiPVnXhG0=
X-Received: by 2002:a17:90b:4fc2:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3acef5700abmr10872896a91.49.1792502652945;
        Tue, 20 Oct 2026 06:24:12 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60be992dsm3550434a91.2.2026.10.20.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:24:12 -0700 (PDT)
From: joonhoekim <26rote@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Joonhoe Kim <26rote@gmail.com>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Tue, 20 Oct 2026 22:23:58 +0900
Message-ID: <20261020132407.968-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <atLkH_D2JrYdzacx@debian>
References: <20261016124600.31-1-26rote@gmail.com> <atLkH_D2JrYdzacx@debian>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joonhoe Kim <26rote@gmail.com>

On Sat, Oct 17, 2026 at 09:24:38AM +0530, Manivannan Sadhasivam wrote:
> This loop is going to block other nodes. announce_servers() is called from
> ordered workqueue which only executes atmost one work item at any point of time.
> So if any other node queues command while this loop is running, it will get
> blocked.

Right, the loop holds the ordered workqueue for up to 10 s.

For v2 I'll drop the loop and retry from a delayed work on
qrtr_ns.workqueue, requeued every 100 ms while the announcement still
gets -EAGAIN. I'm thinking of keeping a time limit like the 10 s in
v1 and cancelling the retry when the node says BYE, but the details
may change once I test it with rmtfs started before the modem. I'll
post it as a new thread.

Thanks,
Joonhoe Kim
