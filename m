Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151463;
	b=RM10n8PXaTZjk7Yi9rcub29xvTwKN2rQfNjLcdmvyEHC2MU619776TKaKvMqNqISzTzE
	 zPRa3Af9ZjklMJvQVH8hDEB5yHZRMJC3dv22Q53YeIQxJQo5vHFt3rUNODt00qOlh8kUw
	 d5BJ5M+ynmB2yXA6pRK64DynCDaZQ9fsomomEyjNl7PbynIy3aeHJ8rw5O4lwjulHimBv
	 jXuE1VBIog0erlb3xexvj7gZQlI0A5qR5+sp+wzkGV9mWc1y9tZ6pXe6NMOIKYCbVyKMl
	 WtZtyN8do988rweUy1sVdAcaZ4dQiiEi3H+Z6pRAy579ac1vrRTSrW9zI3ZPoQzHGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wks6IuPqWWMlFcHqYGHAoryyAYjkkjwfVtcF5N3uln4=;
	b=V5YvMeSTHGdy7YPqTVZRH08wVSgMoZ7Iox4BfQak4zg3mLdxxQIABqVPxL0HGPkcb01r
	 uINQOsOf0Jykfq7Lsxk/5SNGajmfAsyFQnpt+JUmz7djVZIK9/O8WdabmmnOWmJLbVrnt
	 XgipxTOkRD3CRz7wf/wCKZXJxD+8EnOWcDl9S8elNY183BhbHY5y9zyjr6T7PqtYR3n0i
	 yiznLLkTrTvMyp3L60BJWn48g9CNMCKRUVU7Tb5xGU3rYQ00mqKXgMtBpeA/3aF0gSU9i
	 ZOTcE4cRSuQQjQb4kcOKtTH6Bu2+97IWB2H5nRwZQgJV1lem9ux3AgvlABzZkf/qkXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lBw386D+;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B6B606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lBw386D+
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-99c042cee7dso50670241.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794151462; x=1794756262; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wks6IuPqWWMlFcHqYGHAoryyAYjkkjwfVtcF5N3uln4=;
        b=lBw386D+vewbW7OrViIvxr0rUJW2cI19b0gR9b2azf0K8wME1yhtAjo4TZCfSL1zAS
         eBrssG5ikBUOtqILkR3WHV1iBJAFr3+VIGDOY0tylZPtmuHTN3RR0ZsJz2sEmaNW8skW
         Iu7P26Tte6bnSPWO9JpHLcBfm+LCEfJRB7Epbc/PkflK3iU83kgXl1fjwWSp7nGQ/j7C
         lFjzDMWPh4dAZzUZQTLxOlRHPjckUD4gFDI0aJVtiohs6PeuupoKosp9yuQhpo0Qo+Wl
         jyZrWlK691C2SFSiw5tUMA11rksxwbJ8X5XTS2/v6kQCUkqP+0NuVLD8PaarI4HlxJVM
         uaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151462; x=1794756262;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wks6IuPqWWMlFcHqYGHAoryyAYjkkjwfVtcF5N3uln4=;
        b=Yzs2wmdbscU4RrT0dLeiRgkyd8kiF2VGy+Sh2zfbxa3AK+4+eKcDBcN+bcLFkr1fV+
         hUT6bBB1Q2nZ3OW2MnlrZ7nku8/syW2S3A3fIKuDrYkCb4NZcpeXQ3P87jroPX0a/svv
         25WfH6HfLJ54sw/eSQTP4awBFo4t0NKBJWqQh0RH7v3pwv6yZhj0Xl99cr/78K+axg7n
         4QbBbCjoRPf11M8ZDiWOlFP1u3EGf0FAoxbrSOCYsDqDPV6Rf4DYk9HyMeY3QDwuTplz
         Dnc+GqSMSqCm3X2aeO2CejSS0qrytnUa/q56onOYnl+Li3tE2rhctUGLWUBEx6cBsCJm
         4CeQ==
X-Forwarded-Encrypted: i=1; AL+hErGvs9rgAlFb/HJBrLZGlFpAUWSt9KBmxRqTOx3stIjlX10ZQd2RiXLcy46zneIrB+kCaDe4mJMLTABXnzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+YhgmiIGiEMg0T8BMlWuNhEm9nvBvRxCjRFELUa/TsuixnTE0
	rjz8dLbEei8f4CYXWGY9P1WPrFqXL6Dv1CN8YwXphU75qbY+KDmf8IMp54xlOnb8P9Y=
X-Gm-Gg: AYBFou0jhwuF3hWCQAP3gQF5B8a61vxhY33A5aFSOMV0FEc1xHJejITj+oV+8b9rPVb
	hDXseNZNPhJp1bi8nR5ugtF5lqDPXnDXMhhXae6YXNeja2JunU+zAQbuR0xMcIv5UqBsjrPBCzw
	z1qOiHXJYegGMRjYDhMjdD+FQimM2xLXqJXHaifEZoPTuJ8gFdEoCppXWbn5raSq3wYKY6vqd9g
	AutV8XnxFHMvLu8nR5aEyn9o2u5RSVc0KVUWYicNkDyW1FleZF3BtCY1enW55tOTyoSn+6EcaWP
	QUkxkPf0Fx661ZC6IDFP8Oqi9T90Vm29moy149War7MKr4Rozw+nbFJQDUUG4/gh5+2euVycPkc
	qsQuhrKM5KOk7E9cGHx8ELRIhkaXTsUjEiW44Ib8eI72NU3E4i2MkFBHW7cywIQH+uQ7u5StV7a
	v73N18uI8CS+vjWou5pVBiCiWTI62f25k29vbt2wwrL6lt0370TcPtAaOphf+Z5SGCYqqkn8V+s
	hYn0VYJGMiC398g8FBJbXgqqbvHdzOo/2Eck9ALpTt+pMWCx5sBEwYQB+ytOlZ478P0f0SCSyF3
	eBkOq+CQIt0tCI7SkrqEyoSXYosGtgSrhbyVUZqCJkJJglaRzfy/3FTsxiVTtxzEu85k3fGHbXc
	1FUF3vs/VvAgISGCf289FYkxGbuasr2s+WqKXrcuULADWkWWl
X-Received: by 2002:a05:6102:d92:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7d2daa685bbmr485125137.5.1794151462168;
        Sun, 08 Nov 2026 07:24:22 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece60c1adfsm2166205e0c.8.2026.11.08.07.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:24:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/4] selftests: kho: Add riscv support
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
 shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261106071459.2003-4-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-4-cp0613@linux.alibaba.com>
Date: Sun, 08 Nov 2026 10:24:13 -0500
Message-Id: <179415145358.358073.2579925146371313024.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=279;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=2foYgeRjtLhgriBAFewI3QB5zsYy+0XWNuIAF3mfsnE=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JQhKpBPG9CWddYheCPGKD+kNOAaT7Q0REO8/
 X0Xg5z+ESOJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCUIQAKCRC7dyhM23N6
 3is6D/0UINh3QpPKiI0oOOWcH4They0T6KUWUtHH8paLMyiZTEZkaScs0phm5xLc845Ic9LxgmV
 Ob9G+SV8Wxahy4a/rO74Z83XKMVJDWYIpisVHoHivOtAWR+j/G79uLhwjA8WzmN5yO47Bk2nvkh
 ZzBpJEvC9rwTiftW3gZFajEGLRiM49GUVyVv//8qqXJ9Ikppz4DVWRb5Ym4oX6AGzPcIAbONe1A
 nh4nvYGHDQ8lBVPB66a6NO3U6WyIEfh6uZgSQ/++97wJ9wqMTtCfxkBkGLmKL0Yk1AOYpy90QwL
 CDTFSiHMVtve/xrQqdf0EWmvioVf5R+GdmTUyZYuD7pGWDiWkeuLrx8Fp9X79izbp51wQNuYxdM
 JdUKLm2Yg50CclKLaZ1Kfbx5gj3v9DkMLC70EqXxhq5F043Wk9G+Eja6C5cARA3buxzkWeBKNcT
 Ucgnb2XSQM/ctZe6Hg7U78wNzRetTB3KrvVsXeS8Bs4gsKjqptzAokRR3Ta5gTl3eFhb78CfB+0
 0xjt0yhEuEToGjrrg9yY6+cQe1olAah0ZoAIy3V59Ld0EoWxxy3a6V1KwMfNYvm1seTYH704eJi
 iPUZenreJsXOKLLBV3GO4GQh7ruky0RLLEMmdisjXOsYgfKc8xta8jxJJBAUKw1MxbYd41s0ZpX
 dEAw+5VN3pA4i9Q==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 06 Nov 2026 15:14:58 +0800, Chen Pei <cp0613@linux.alibaba.com> wrote:
> Describe the machine the KHO vmtest runner needs to boot riscv64, so the
> test stops being skipped on this architecture.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

