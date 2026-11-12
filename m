Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485377;
	b=5rUwWi21bidpUaD93gQRMQffDie/Rm4NDydp0njF4NQQGQShpwDEhQoeP7D5WQP0c1wW
	 c7DYhTCYfYHrs8Yd4DUnQSmExfnPAqy7UcEemMEo5U0o3G+gswg0c+NoCnrcNTRaFASt2
	 9X5raFsJLzImxdc6wcvikFm8f94U2AL9Xq8idwlek6NHVWCvTAvSd9/StiU81D7WRul/x
	 zAODP9SMgynNUmskKixJIoY1iiPRtqwTUPSn+XGKDfmH1nKwuWjJAYwDjcPEwivoJcXRy
	 5KhEW6g8fikIHtx0fI/V+pX0+Hkw0QOlYK+oOKOo2MWAg1qMh2ZLpOrExEVrjuWw1cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yVXFtg5uv6jmT0ohsABv7mNA4IYkbP/bTmshktkMt3c=;
	b=mnXbyxev9U0RmIY3wS6O0wsoX+YXwsS99sZtx9slCZSZ23c+lOUWZHDa+j7/krW46xoT
	 32I269pHRNkpOwXzQtXYk3xttxXGoii6VONTt+JGPhd92jhj9GOuITf+l6yf4l33PTKKE
	 Or7iUY5nu8rq/CnjWLJmhmNj1lAUYlq+fjuSeKwxCKqK7i7H0c09KoSnvbQOh5h54P8KG
	 XZ0oaKdd+5hY2K6jNDOlXGq3MKHEithhSe6Xd+NSsN5flcG04KcgbeKqz+xauoF3VN4yZ
	 66teZtuI7dxQ1NXJBtl6nr69Hq1bJFIRywwD7NTkwPIQd21+vwWRhAylgblDfaluB2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KnnbIB3F;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA08606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA08606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KnnbIB3F
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49412eb1474so2532335f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485375; x=1795090175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVXFtg5uv6jmT0ohsABv7mNA4IYkbP/bTmshktkMt3c=;
        b=KnnbIB3F7KMniAR3dO7X6IyBVbtVQ6tOUdE6/JoML7aE/4n6QZgGrSdiBwUSrQqMFf
         ImyIjubKr2EwQDMCrRkIPXg8JcPztoTDeMIE3QgtEeiOmzRIzrIccGTa2b+I6zMIp0n4
         fvtn6drlA/T/F5B/c7/+9SgcGZGyH9FytYNNC9gE3wSUqSrmT82pfUIE+tkxgKh4Nk1V
         xnlX22vuw2JT4GMm8rea8JCPhMS18lnX4VJg4oyIMZb5hmf32AdsKorEs7gr82QgPDdy
         NfphP+0IvId6gFdVVRgr6S0u3eFgeZV9CFpIiFvn/gjOkpEDIdf/a/ACxQ5nlvlibDE7
         sJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485375; x=1795090175;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVXFtg5uv6jmT0ohsABv7mNA4IYkbP/bTmshktkMt3c=;
        b=C6liRBk6MEYN27Yn3yWNfG7Qf6MM+C3oQ0sYvw/NUCBPVXT88yMrI4E6dvm6VqrTVr
         GO+AoYNXg9Cu8Gsx1afukR3ngqiPgPrGa6mRfumdHmbWdNgRweH5Va5efDbuTjxNV59s
         MtATh+fUf+X7x0cogAL1LGHmNsQ9KClsL6so54y3bi6aZczydZ21bNOAdWYZeQEQp/fs
         y62uoJ1BLvsoZv/1eqVDN4TG6UjdLHpnGjdYjMFrFpUVUnW5kfWOptNE7QyrT7DWGrpN
         VWGzUxLZncseeETPfxHM8SEuxX9tHTHve2ZtBx8l+XD01fzvXm9rdjnlEzf53oXOaDe4
         +/kg==
X-Forwarded-Encrypted: i=1; AL+hErEnWN5PrKFZKkjzSYklCxi9nuAmsPfnw9QDEwgfbAw/rEnIlUAarwQVlEKy22w3vucDbpDGki5XJJzy1nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JS6keWfia9scBDS5j5jI1nDTkTeeFVLwTG9uCe7V7TDTNFka+
	jLlBESZMrrk2X6JNMl/SBty77pw2sWQGtneYwtChr3MmXjW6Rx6DsAWU
X-Gm-Gg: AYBFou0zhTCvdcIVhY9iiX4u5QfrAO0wfdPqVZ5J360V7UyyFPV/aIwuwS3hj4mZHJp
	vOPJoF3TTSLrAjAE8jUO9qmR52ghtCJ1BtYQ1+UKuJ8iBFc4CB68tylimrhTwzVuZxdXi6ZsInt
	WXzfmgrqY45gFefDg/AAwiALwM2vL7h4ia+AjhOxuvGTtHSXu9Kk8LLx5QAqv0G0cPLh4tHal/h
	eVlbxJ8E176l9xZPhb08qK6vWzS90UHIGZDkGWQxI/aiHiy8TkJNQK4IrVgYXAp7fbV6AEQ1S8k
	7fivp6dFOPkHsCJ53Y7bO1+tHOPFpva8adPndmnPYijq4h1T/fZkc8sHwl/uQ9MOPVOTF1oGttd
	5kaW6bu5ZjZ8vcyo2GRME3xXdq308GkfA2+nqbiydqkekyzeNDlHwYvYiq1AOzjH2JOosOLsDOF
	B8rbZEe7VUbpJDDG+UkZ0/T13FC0h/EZOpXOQivrF0pFSExUfp+2+tPi/xnKtNvpBvaTbiF1m6c
	WAF65aL13jCIWwCw+7QLxqGbW+F6da4eUBwzjLXEhAmOpTX67WH+Ze7ZqrBD7XvxHZvtffxorDo
	WX+i6CEydtgnyhv/KRqpCgMb7zSc03KzuhQwM/NJTdhApOw5JW5j91rvAG/BYB/XIQ==
X-Received: by 2002:a05:6000:288b:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-499c3aaa3ecmr10258629f8f.8.1794485375130;
        Thu, 12 Nov 2026 04:09:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49895f4e6ffsm15149402f8f.16.2026.11.12.04.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:09:34 -0800 (PST)
Date: Thu, 12 Nov 2026 12:09:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 oleg@redhat.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, broonie@kernel.org, dave@stgolabs.net,
 jszhang@kernel.org, tglx@kernel.org, conor.dooley@microchip.com,
 thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com,
 debug@rivosinc.com, seanwascoding@gmail.com, andybnac@gmail.com,
 menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
 wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com,
 arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v10 5/9] riscv: implement preemptible this_cpu
 add_return operations
Message-ID: <20261112120928.24145d44@pumpkin>
In-Reply-To: <20261112104149.38589-6-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
	<20261112104149.38589-6-cuiyunhui@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Nov 2026 18:41:45 +0800
Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> Apply the recoverable per-CPU address handling to add-return operations.
> 
> Native-width AMOs return the old value, so derive the new value required
> by the percpu API from the operand. Use Zabha for subword operations when
> available, or a masked LR/SC sequence that returns the updated field.

I can't help feeling that some of this code is the same as that for
normal atomic accesses.
Can they me merged?

David
