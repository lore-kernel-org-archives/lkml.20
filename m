Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244473;
	b=PVUCJWVK6LkrNGXK/TjygqXEXGQf0CzOQyoPQQkKrlLlVzwVdlaAxcqPk1X1pkLTj8yX
	 e1JQX5hFJoK4OEw+Djd+2ztx73z3eIv4iGfr6vnNM4CNbqWcRhrLp8DkAD9QyGy4lJEOY
	 4ghUALGky4I9i6OvmBAmKw5drtNGYZUJkwGsYDEkMpudzHCnNLhMysRHmOgX2hc3P6i5T
	 5GXZNqg2jtjDsbNNv2VrzGClbRhbUvFDOJWfETSeDXan6i+Upq9W+EfehhNs8Q1qUyecK
	 VNJBvhWtEvdlYjL5BvxcCgXIgP1bPAMo78st81xufOLN7z7feKWIuxl/qJkRJ5q4yTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8jtvppWK1r44koRv7kGc410EeXeuVJn2yevktxLuiSM=;
	b=XX3wQbkKcyYehp9VMf234xM80w34HRXHUprjjZbHLYd5M19sBoPfWtvvztNxpk4glsh9
	 NJQyMT2pEX2tHWHfAVteGK/uvP/yEkSz/X+aVyuSRsF50axiNikZOh7RvMlNd+pRLJUas
	 Vn7omHM8BtaBEs6vL8lbi9eEl/C37e8F0ywaOnvbcqqkNeryw4fzuMNaRfgpsj+rncLwj
	 aWCGQJ4c9u1nC9w1RkARqB8zSfgu4/ZTgyu9lvxi8mMg2RiRvlUJgnXhNa/x18EFdPxtD
	 BtIp3v7Tmm03j8CdZBPnKtFJdF/H7rlBELc78GXt9guSI++W+1DkNzs8vhirrMjpBSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cfDEwHnA;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE9606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AE9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cfDEwHnA
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8b260bb4so636187a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794244472; x=1794849272; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jtvppWK1r44koRv7kGc410EeXeuVJn2yevktxLuiSM=;
        b=cfDEwHnAjkjINNuQSEBYfr0VIaSnYuojPe6iCL31rE0vyVH5GIT2jhbSgw8IDBC78e
         wIlcf6SwizR1c1qu3vw2OYVzKuIo52iHw4FnsT37VFxdZWCPURCQXMcEhfdFz+E/u5F1
         2xnGoTxB6pLW9nPiLT4XN+8NzE34TkcSNrqWb25HTRAT4Q0NOzrb4nPWEQivO6uvaN7X
         ecHZzVDFEYTGF/opFS0vjbueL7N2WqIRseAx9W1t8JWNYSq8JXYQibM64QfPx1f3n+A9
         wQ4zQAMAbiLBWGkMrrE6ApMlGXh1xG39Ai8yHnOCiNYhjwNX9Ye/a/UZSoWINnr5mO0f
         8/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244472; x=1794849272;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jtvppWK1r44koRv7kGc410EeXeuVJn2yevktxLuiSM=;
        b=z/rcuAPX+PpHm9qJ7piVPq+BsRzWaR+R7FRzWu38p8MVpqZut2X6pc0QHkZrRgEs2V
         hxaI4938N44iE0VKolUWEhyyc5K1/CGOHQAbDjoytPN1FUbRlRHI8h/L13TXZLO+PO7u
         gKj9ujPnS1QSm5cd4gDKYm1XKDtmvdcXqT14GEYE2KFY7Gx4vRfmvZH0BaHIeUDMWVc6
         vz+i8UeMVBIFASQlgySG+GUvlc22weBtsXrMZPiP0xWiLHzhUGYohNqY1aj/0/Pl2ywG
         93y8mUQBDTWR/l0YZwLgC5HJEDb56FaQ3G+/yy43EY5wB88/3ffbAb6a0PWELowidO3X
         FSNg==
X-Forwarded-Encrypted: i=1; AL+hErEBYBmkT9q4tT7Y3HsBMCRpCHGVa7mze1zSEv+ox31xDjJzjHwnG0oIOze+7qd1Mz1uHLPKhKLIwzRA+yI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G/j7891/Ckus2OP7b8wSXZmgXfQYI2Ow8KreqxAN9VP4ZwYyt
	V2RLZUxf9T8hUnT3PnZ114moIiCvUNpk22ORCC2VPVTqkE3j7BJ1vj4AzxCgCrH3fLy8XYuwpFK
	JUOIEkw==
X-Received: from pgac19.prod.google.com ([2002:a05:6a02:2953:b0:cdb:932c:948b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8b0f:b0:3e1:1e99:9463
 with SMTP id adf61e73a8af0-3eed2b02236mr5016786637.38.1794244472001; Mon, 09
 Nov 2026 09:14:32 -0800 (PST)
Date: Mon, 9 Nov 2026 17:14:31 +0000
In-Reply-To: <avFfFqotCajjCzTf@stanley.mountain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <dab486f129c36ba1cfb322ceb56ec6fdef020ca3.1793959700.git.dan@cryspen.com>
 <avFfFqotCajjCzTf@stanley.mountain>
Message-ID: <avH_dx3-8qshOXvT@google.com>
Subject: Re: [PATCH] KVM: nVMX: Prevent potential user space corruption
From: Sean Christopherson <seanjc@google.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Karthik Bhargavan <karthik@pereq.eu>, "=?utf-8?Q?Cl=C3=A9ment?= Blaudeau" <clement@cryspen.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 09, 2026, Dan Carpenter wrote:
> Oops.  I sent this from the wrong mailbox so the From: header doesn't
> match.  I'll resend.

No need to resend, already posted: https://lore.kernel.org/all/20261022021820.298886-2-seanjc@google.com
