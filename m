Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758804;
	b=j/coQZuECYBxFZsGbX7WD7DfNosSLWGAXMLYCKP5DSaHvDCS0cMBQ9qhspMbGEC9c3vk
	 Gkm5IzhufYZrI3DEBPlLd1O+j/g76M7/DrCEJ2rrUoXDmcZSvnhptWHD3CxuRaHtYNYyw
	 NyuPP1pWYyP8IlvKUCFoq6XEb4njuHF8z8kWoMNG4LQXWnSTbU3+hSWrsS1+NFMZ8Vr9B
	 PBVP1fU11fJGy1t0eZe6rJ6GPN5nlFYFDSeJZnhiLEhqQdnHYhJZxLPXWpag7m8XyO0kR
	 U614SejHDbp+VGQikVAT5Qpng8FdL9IDcqU6vdaZPgCoF322WrBA3m0V+0R3GS2bDQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=rXti7mY5F0P/rsGwIECfqLmvwSGUaMqT4P5dq57Cx/E=;
	b=sS50VPbYMeHuagWqlJXhTwAPagLTUHyHF+r9/Jssbu2FJ0i7fW38oo8iWeA3qGIjtH+0
	 oTfEBDmoqBD5VSyePHwrJQUHDHIyosz/Knw91fv0MLkXmcsrw9rs1s0G8m1Srv/jvXlPP
	 5dhvwQzLNBD9LEyuHSvL5AlGbp2fsX1cKq6OrdeZdMK1VTaJqF0SwsnNG6M73PeSbQiJY
	 H6c1n6hU24vZRuCmy1UlolXF2ZB1Qv2rbfwdWRiWatSNM4BVGLJU7ItMCdsIk3usZGd+E
	 nJv/gosjniXYVivgY9KR5HMxdJZUsy5Zs0zPZQbjQ6cYWAd5t8szVFR4pzU1VpMYEiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PBzi9TIP;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F42606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F42606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PBzi9TIP
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so132214e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793758802; x=1794363602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXti7mY5F0P/rsGwIECfqLmvwSGUaMqT4P5dq57Cx/E=;
        b=PBzi9TIPsFLl2TMl7s8o/VQCNOJaYL9ZQIfaatArXX0Yipg0kgF/Q22Qxg0e3TPsPj
         G7J5AJvAyRg+QuPemaLMBmz6UI38bZuLnlIfZYYpFqa5YR1W6GxX+JipDVu1Xaryz7Jp
         k2+Gl5Ck3VPZOS86WtvarxWRgseghf/K5zcs1wx8wzvPIWVHkTsFgg2rCb90zdrXX5i8
         Ds3R7tBrV4eXU4udYmaeWPJijUI4+OoqZkO1SCRkivf4ScPXBZaw7j5L9EvUJv4VQsk4
         2ntuTVc8jkaDg/zQ90kByToA9Q/IyV3j59zMBVNp6RnNa3aOIQnzIXfu3Vcq26X2VFqq
         usRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758802; x=1794363602;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXti7mY5F0P/rsGwIECfqLmvwSGUaMqT4P5dq57Cx/E=;
        b=RxVFIGgQK1fqbgGQdxL/7fe6GWYiv8hKpJKXmVUX5lvwtufc3yFiBAgtjJsGDY9RKv
         MAeJoKniiXZmBdw6FfqohyHC96GjeXKLhjZZvX75P7bKaFr/FP0GP+GSoBp65nvhqKub
         hushM7Tp5/TgFDdcIXWjfSQQvPIbQHJQfv7wW+BnzdLj2fFOICRr0ixKMKIsSZJYL5f3
         2v6PZbs8IFXpo7VEqJT5sokSpnK4/i8H0rAVi3GxJcCkrRX0Fa3xJ65JILD8uWgZw0gZ
         yQ2rtvm7HXZr1nHxJ8KaD1JXQ9CPMy2Li140jRhy12bo+nocZHCcJkUaN+Pf1ii2243M
         DQVw==
X-Forwarded-Encrypted: i=1; AKwUvBzpR1ICNxvhM4OMDSCqQoyc+B9mXIBrkdLVrvxwQBAMcxkPHbzu6I/Cht8pHHNLpWZCzfawmJXWQx11X7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9uAV6BroXAQRBVv1n3BnCvdfNIFdwrNnyLneZpC0JvYwWDB2J
	hl8QPw++mO/SW/VVcntRDbylCqtfWOfrD6LZrr6vRTLCThCNb9TrqacVpk3xwiwNKbE=
X-Gm-Gg: AYBFou2yEcTtxBxco/scmA8ZpA7OrYPL3aQDcUjIodKiQ07SInOJjuJRPrOLmMRTpnK
	QVdqU+XA1AO8Hy+CtwKkfPzH7ibO1E7DDVSkoAOdGv6TJ1fQL5xpCfXEMBu948lcJBrJjGDBuce
	2iP9xRqCY0QS3rTNHFNROgeJOyJBR4mYHvrahC4rBw0b1geqq0OAx9GQ8EW8T6e7phl6UeMSoT7
	QNJYSQgSj2VFyklLzWOndrcOZW6lVF0SoYLzGgxOxbDIb1p4pVvh+a2qMurh7ADFc8LoqTUBYym
	xyHU1JSqdLWtb1ohaaA+jDyS1bP8FlO+4FBKkiIlFQa0kxPMOwnO1ZqHkcZtluZtpPDLsnnxIon
	M6qH3rSx94UrvpWUSh40KGOpXlBpgqL49VJyfeeqxu23fcOR9r4Pt8vbBA6vtg3HbJmZVUaJHzV
	ooGr0D4vkwMdlVGTPzZinpJHw/dFTmO2bAZIGNxZeK7oQnpz+f64uke7+Wx3ZweuWuxoGaaUh+9
	1hWujiENXEtGoBaoV1ANngUo/jZyI9j+9OlLpIRvpLyH3jr7wCGegyxTtdOn32ySAf9HTYKEB07
	uLb9OjRxNDGcb7Xn2oKw63f90JVsDQrnzWLDOdOnPzkGEXGOMemXPUE+BrzSvMbJGdZsiIh6WcQ
	d2QGY31PV3qz1NDad+MCIVQgLBCk7pILClFStC+1vJOP6
X-Received: by 2002:a05:6122:130e:b0:5ca:f811:25ac with SMTP id 71dfb90a1353d-5ec6895c285mr6125913e0c.14.1793758802245;
        Tue, 03 Nov 2026 18:20:02 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b6568sm658959e0c.1.2026.11.03.18.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 18:20:01 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: rppt@kernel.org, pratyush@kernel.org, shuah@kernel.org, 
 George Guo <dongtai.guo@linux.dev>
Cc: guodongtai@kylinos.cn, kexec@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029090542.13283-1-dongtai.guo@linux.dev>
References: <20261029090542.13283-1-dongtai.guo@linux.dev>
Subject: Re: [PATCH] selftests/liveupdate: Preserve VM workspaces with
 run-vmtests.sh -k
Message-Id: <179375880152.1029434.132459394322366594.b4-ty@b4>
Date: Tue, 03 Nov 2026 21:20:01 -0500
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
X-Mailer: b4 0.16.0

On Thu, 29 Oct 2026 18:05:42 +0900, George Guo wrote:
> run-vmtests.sh -k keeps the test output logs, but vmtest.sh still
> removes its workspace and qemu.serial, losing the guest output needed
> to debug failures.
> 
> Forward -k to vmtest.sh when keeping logs and update the help texts to
> match.
> 
> [...]

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=fixes

[1/1] selftests/liveupdate: Preserve VM workspaces with run-vmtests.sh -k
      commit: 654efa9a6c4c455aca6f034f321c013f5b784157

Best regards,
-- 
Pasha


