Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412017;
	b=was916ei2dPUudcj895QEyjlMTxKNIRNwMl+LSj+Jx+agmtS8uoYnSoEsFVnNYpa82Ze
	 PEtM1GZXz7xBv1TUD5cMK8Dzk3EUvcN1EncmYF/U3PuwwcEgH4ltpiLeoh+P+AE3iqw/2
	 UY9yK3eb3zHhoQ0wauMgpk5U8UHIaxy6fHMGrGZHi2lrlmnL1Yhb4A/vlQl41zWaVmqD5
	 hZ/1IoOvLZBinouM4LihpNw3YgsJUFZ6b684o7Sr+3wGH85t/lPEOayomEFDcn1IJszC/
	 hmZZr2t7RiMD/aoTerjRJ5kgzIlvJoI+5vXFj4xqGO9ootJMFKdbs6gCYk3A2n5ATXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=wQKRbkibDLGyy8037Dj5AspxGYwDtlAwEFieE15dtAI=;
	b=onnVnr6lCx4xA+vYhkbiUBEiyyIKBGS39KdEkC4xLxxrwGDYxRD+R27oFa7YDuiW/Gxg
	 LSCSnwxcyFdX3hxfHLVPCCIwjZmZQXE0fbDEvkehCbSZLS+2KTITDpd/ZNfeVxnZU+Xb3
	 cE39TyE/UZtPnObKKshaHkmo68AB0WqnE9exE7fUlQCe1DZXglas8e2B51NUBfYvBb0lz
	 wK1JbTH7PQH/vabTHDdt5xNucv3uqJiPc8NjxKpCEDXhmIRgBZWGh7urgxy3W032xpt8e
	 IxwjsFyhWXdIix1D/2KobgP7pu70l97XnzUSOYPvNKvU54JhuBFx7q0gcixJ5/4s8hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vc1xSdt4;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2865606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2865606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vc1xSdt4
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070781f63so1493153b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794412016; x=1795016816; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wQKRbkibDLGyy8037Dj5AspxGYwDtlAwEFieE15dtAI=;
        b=Vc1xSdt4cebm4rMu5+0OB509uCTBmt2Rxt5nC6VpC9wA9OsUtrQdWNdvltU5JLltcJ
         4BRbLKV/GU5khpkhtyxpZPtUmuCW6J/sE1prp8NTe1OJIzH7mIPSKltLHk9sQ9bDbVfF
         dRFpUEJdYLCdRjAALSwLFHoWTFTBI7IM0t9ABZ6urb/oQ4nW56XDulIEB7YHD+MQ+rQa
         jWPJNJ6MCeFUYvmiGxBCxqaxEkMOqU1onw+zBpB0PKmWRXf0wzH8YI2rzBcCQsYCVFre
         l3tXSLyDqfTSyaNqz1GSztwlfrVzDGoMsDeWcAmVCMx7UuguAKaImjAEOOewXJF+Mdq9
         dCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412016; x=1795016816;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQKRbkibDLGyy8037Dj5AspxGYwDtlAwEFieE15dtAI=;
        b=hzL4ZccY3K2DgeM+jCak84aAp0m1FgCUz7E8Pch7MdK5QD97OpWq3o/nfxKDMhrRjv
         Y/yMP4TyksFEz8K1pQ2EosfmW+ljQn856NVoKUMBNW4BYWYzPyAS1gREVdsx4fwt+lna
         G+AClKNtQdLVd4Ef3hcn0lGiTpHvTo3MXwSu62oV4khyqt1t4KIemCYs48PQNinyLvUh
         hfDbCV0aSDEE3rJ9f9fGtksHNLlKjB9SxCAIzNXXkXBQE1K9t8WZH/fQpSuvBAYDVFwv
         UozaEX6UFcphfQ/uZ8nDIRkoCg2piyJ2n1jVNNQy8bDVXfyVSaqmR9l+U6pkWSQqa44N
         JhJg==
X-Forwarded-Encrypted: i=1; AL+hErGLIx/4z7sLzTdFnAKD53MlMmxQiMR4/1rMW459V6+fbLRImDSIvMT/e8MdJfv5qxAcQVgn/1Ox/4zIPb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E+BJL7NAtisM6HsF0KBti4lVxrkSOMXCl/2CBqDwyL945PzhG
	4ybvh8kfA/yTCfM2l1OM2VSlEMjswWxhtS0+C8s8U2lJXGSUBhyQhz82
X-Gm-Gg: AYBFou0txCGIc2FaHm5y58JVU9CmCgvkmM31kK9MAzhkNgW610Hw4tkvpBPkoWvMcZb
	g7okw7jHnpDYr/YaENvfpjHalMhE0FHf/gqfpTqjslqRPRAL5t4DqkynZgYopv441jxvCW8q9+G
	XGJGe8Mx4Pa4+qac8+f3+r6M3J7RAzKRFmiLsmMvjt8TQMEUf8WRBw/LhDuizgS4mSI7+YA2JUY
	dEbuNJS611Qeo5EkFdzycS1Xm76lAeKXRV9n6LM9N61FQfw4YItC5TnIOxBrkNxAB542g/T9I6z
	TQZZ6ZX5DvD1rFHAcqjXnRWe7g7ihjr417hMLxCX8qMvPabMEcFPZ7WWkaKBUrFYI2ADMgcVmNQ
	MK5+vAlVf7kXmu9Ft8NI+0Ad+xGIceSRh3lSs/WdYt7vnrxBHCmw9fk7RavjX387/Tq5/d/hdJE
	JFu23wvbn+d2Zxyw7ptgxA0GLxHdi0TFNICCl6ik+20zvLVcu+W+efgPWWDecpB5VvhvLlMUs5U
	XPqRltRIav0FEGb0TXvks4x4ZeQkL28YCgcLWzmdgQYSzlQ6g2Zmqc79398EwBWAa0H966Z9Hx7
	44Cc1XeBIy9+nvk0u2Ro7PXGn16b9p2SNepqPTMBX6QaAwoO0tXRy6k0eGixd6/VI6pbdug5CQT
	CS+N907+rehehpO+ufChQq0YHIxtPSpNJyvPupZBVl+fMrgPgltHJhJGm
X-Received: by 2002:a05:6a00:21c8:b0:8a0:3ed7:939b with SMTP id d2e1a72fcca58-8bc1d913140mr3244215b3a.29.1794412015861;
        Wed, 11 Nov 2026 07:46:55 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b1bf1sm2278182b3a.12.2026.11.11.07.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:46:55 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 15:46:54 +0000
Message-Id: <DMSHYZIRPY2U.1XX05ZPV3IA7G@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] libbpf: Fix incorrect module BTF fd index in
 warning
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Rahad Bhuiya" <rahadbhuiya2021@gmail.com>, <bpf@vger.kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>
In-Reply-To: <20261111064428.1902-1-rahadbhuiya2021@gmail.com>
References: <20261111064428.1902-1-rahadbhuiya2021@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 10:44 PM Rahad Bhuiya <rahadbhuiya2021@gmail.com> wrote:
> Fixes: 9dbe6015636c ("libbpf: Support kernel module function calls")

That's not a fix. Nothing is broken.
One object has to call kfuncs from more than 32766 modules to see
this message.

pw-bot: cr
