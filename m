Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039401;
	b=gTpdvFbazXZFCLqThsLCleiDSf0lk9+Ab4Mh2T8h7+dEOt7mkdsNdz5um/CVKeSG26nv
	 qhFo0tOoB2/h8NFcL6OFXWJQtsrNlKQgjbrikxdGGTVmtYMdZZHec1UXOGKhPgLlKV0Iw
	 4e7VqiYgmT3wX6J2SNM4RRuzdpk7i0sYsUuWmENDqADTPXSogjcUVpRhfgJUr972nOv/5
	 ZBULHhBpeCObkEqZcNyeOPHGngyXxLkMMT724Jp3CIQiPnyDpZy2k9YpbEwJATEhw8UhS
	 ksSFL9Be7kDaQvDvNZ0xD2cGiVr3YPmuBReXkeBsf2BMsqV+wmSY0aKQw7WBZaYtoKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vs9LuEmOJIRjKHitt6arG6kgt+6AcDLvJQuIwetBo3k=;
	b=2F17mHna8UJBDMKDq1TzkXXAKZ1y9Cg5ju3HMq8bkycYrikR7u2Iew1eIj2vr1Zk7hpF
	 0dUcWuG6SlgxAVLWXl4VgxZTjcwIYs02VidSkPOLWxE/y1t02IkyG9wpMAjVd2y5Y46Oe
	 gzEByZB9wkL5j8xTpekQqrh43mxk6K7z3I81iW0sugb5CnKdglfpwLybjvEhOfjmEeZgZ
	 hp26VyfibRSSoMMmvQs21XDYPLiZknwmn5mRCOnFqqOZTfVJ21K7d4l8EPnfkMxYBVtyL
	 ACXSamzUhX/wVqGGlCbvNiv7XzhLhw0gcgRwY+yimAFoQS6wD2jD2n35GEsVw9mho8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGajsjfa;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95BC606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A95BC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HGajsjfa
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so1962942c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039400; x=1794644200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vs9LuEmOJIRjKHitt6arG6kgt+6AcDLvJQuIwetBo3k=;
        b=HGajsjfaqJRkMwIvubMUNZvD4uHOHCAs0ojUWigKK+bnf8QzaMFqytw03FAGF580h2
         cQa9ZiieVKOqNBZgzo8oRTO9fxSoqHGeKBqTNrvNDJNdGcGakRUwDekiIBofzgCL2MCH
         n7TfWcUmjb3stuNaIvGZ+HvNbvMSwtg9sAvo8XjYV9ofY5sfdrw0PG4RBzvac/8NwrSs
         svqv9ZhcWtKSsR6LSeS/U0aAryEUOS/NDVgt5Gk1V5M4ohM/BbXquPcbL/PQWWEi+K6n
         ArFvuOglbrjj1CLjvMVCIol/Lb3xgjkPpn3czM8zMOSzq5hvMcFAsPHw2hqDda9yipoR
         /0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039400; x=1794644200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vs9LuEmOJIRjKHitt6arG6kgt+6AcDLvJQuIwetBo3k=;
        b=q4OL8wxpg8+Ti7ikw2o3JdH0lCO+HkVIqwwZHiv6ZEVqPn7zUghlTwZqJiB36/crJ/
         x7c2JbmXMR5pf+Jv811vWiBnmwIAikeT7Z1m82o4Foh/Fz4cLerxsTUfXvqBjEie8rlT
         yDB+hVER8+j3vF1BATg4TUIRIpR+GeCFnFZllFzmLaQxt9DnoJzNXIXUGXlr681HLrho
         yfVDVp3+YEgo1St8FdgX8MdhSdeoS0Ru+T5wHtydedcqABVCRMcVbVm9+L79djhvChKt
         u2oTMzBQ+gRX0m204qPtuVegcbfVf/8JXzv8AoMLD8vRgs4UNSwVTBKmsR/8onrtmicp
         iJCw==
X-Forwarded-Encrypted: i=1; AKwUvBzwydtgTwARiS8QFY308UYBCvR1q+k2Z1dhB0KcHIwi3MhU4QJTvX0rQK/dbkQYsJO4lJVr7acFMCbXANw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VmauVITNpJdpHF2ajm3a69nDRSHtS6O3fzcTxc5ghEqn4kfzM
	lheNcQpVGevifEAOgBuOaiUTHylyXWQWVwrw57CUxXfso9B+8NmuF56l
X-Gm-Gg: AYBFou3i4NvwlGQfd/Qc6Mn8N0ntxVFp61iariNie/JfcCLCb7i4BHkqaR036vFiKme
	uG3uI9x91DMSInybJTIO619oSrPCPO8K7fT5PlJi1AikxwFAfXozbNWIMC8I03yv7xLgag/ey12
	3m86IANGDOmACLRVsjZyOKwNtehsI3XrY67dYJuYouCF2PMO6ybIupECFdzmGNgRgWJiz0SSxnD
	wJy44b2q9SKEpp6HrHXCvI1JN3pk7Uc4j1renUXZwmduMymOnD6Y0yURRiFC4aI37GnlIzXagfy
	z9ko4JeNIrL/ASfAgJZjTK2l/rcgwVIkSsim4vv8HOd1xWUmMX2ZDH2BCOjwr+TDgBKtMMihC7K
	qoQeuZ5T4WGLEQiTht3oaj6nf7b/7AVa+9PiEh1zVnLqPqU9ZLirxxJaLp4PhwCYk19seNtOAoo
	irmbTDX5cNNujwWLGTXBlsaoKpHGfcu3WfF/pJZdH6iiLxrEX2j7IGlS9NiIFVjm8La1PGreexQ
	3nWVaJfAzuwdmjAX6YZ3Z066KJAC8jpHE5m4Vdq5eX/NuLT3/ljvnZ3xMQfyRHntQMtUxtjiFk4
	g5co0WxFAJbuXHc5NRXNdvBVZAPprKmtfVtEjyg=
X-Received: by 2002:a05:701b:4346:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1b25d286bb0mr3789790c88.2.1794039399566;
        Sat, 07 Nov 2026 00:16:39 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4c1df6sm12425640c88.14.2026.11.07.00.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:16:38 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: luka.gejak@linux.dev
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: rtw88: ps: Trigger firmware recovery when failing to leave LPS state
Date: Sat,  7 Nov 2026 13:46:09 +0530
Message-ID: <20261107081609.97212-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d7e20cc5e8a0489b9b22f13a9fe8a1b423d2f8f1@linux.dev>
References: <d7e20cc5e8a0489b9b22f13a9fe8a1b423d2f8f1@linux.dev>
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

Hi Luka,

Thanks for the clarification and the tip regarding --in-reply-to!

> That is fine for the flag, but I think the counter should be reset in
> rtw_core_start(), like rtw89 does. A normal recovery never calls
> rtw_ops_stop(), so the counter would stay at the limit and the next
> single timeout would recover again.

Good point. Putting rtwdev->ps_hang_cnt = 0 in rtw_core_start() ensures it gets
cleared after both normal starts and hw restarts. I'll place it there.

> The RESTARTING gap predates your patch, since 5c831644e1f4 ("rtw88:
> handle and recover when firmware crash"), so that one could go on its
> own with a Fixes: tag.

Makes sense. I'll send that as a standalone fix with the Fixes: tag.

> For the counter, maybe it is cleaner to revert 2/2 (or rebase and drop
> it since it is currently the HEAD commit of rtw-next) and send a new
> patch, since it replaces that line anyway and keeps the current
> behavior out of the next pull. 1/2 is fine as it is. Ping-Ke, would
> that work for you, or do you prefer a follow up?

Either way works for me. If Ping-Ke prefers to drop 2/2 from rtw-next, I can
send the updated patch with the consecutive counter directly. Otherwise I can
send it as a follow-up on top.

Thanks,
Kalpesh
