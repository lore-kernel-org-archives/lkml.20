Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979534;
	b=WQef1a9jKK9Lt/rzVgZ9p81mp61OfZ1PPtGxjZjhGCHhYOTXvOCNG1SHowGpsICCbpQW
	 Tl/J5gHj7hpSvbPbGJpYL2YpMRPt5ujjAElsW1HUB+cllyjNQZ5Jhp9b4ZhTncVjR1Y+N
	 +iTa6DE+boMuxzxldYiA8Bx01CH2e3BDcUkh1Qbxhy8xXTo6xwIidZUuEJMOK/9nyv11p
	 ziA3vbD4C7Z5JjjcMTm7XT/R1iQXtns5X9CNo9+Og7oOQ0cnIhCPQfJePlghQWntW0Vlh
	 knqh/IDrcdfZ0L5ENfBsbIyVWPrPn3MGotTM0sJO0J7gJIYOIzemFB5W+vwGpFKXH3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=Q4By7A8PZiT0yThEZVJLfPkmZwSfEFs737xPwhq6ne4=;
	b=jBEr/hb1QIlY5yxZw6h+vhzuOP+p50CNxwrtk6l1x1CRyg3OKHpEKDbc0yAzDUQZeVc3
	 JlN/eSijHdB9t8zaE97eiF9e3an3Evw+lMoJwS9gcWBIHNOt4yEYUW2fX/9eaoEtQOtij
	 JSmwSDVwbNd9BP/xNqyepOb/ekjEsj0wg9MIktkTa8BjmAWvqGZE+8xAhpQ+t685f5gCi
	 cn1L12wP1wLTBFHAbCtMEFM5SPaUQLZdtfFkfYK3vcnpROInYsRCj2naN/dMTwD+YgywG
	 53mAUco2QNnOgAlLahZNoi6Ml7Pz8ojo1a3CMZinVexvDG+EUeIe8hFUR6JdquvOtJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UtkBMVMv;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38EF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D38EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UtkBMVMv
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea7987517aso13574555ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979532; x=1793584332; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4By7A8PZiT0yThEZVJLfPkmZwSfEFs737xPwhq6ne4=;
        b=UtkBMVMvBtbVrci62/kzwIGaPc2J2tO+kZZDPz1fc3l8Qs3y7MS9zPOH2b1mE3KGRm
         scQrFHYljGRnnFVBIhSufy7u8slHM2X40/IN9/E8fswsLyuqRrTgvbTlN3nV1CsYQjTb
         dZ2ROPTrPag4JSsfHm4ww0B4qPPPtguUnYO4FT2Yeai6tTS/u8rcRQaR0PbjkZmIvEt3
         uW9Iswl7lk2PuaPu526yIL8/hlo+jN/oqWhdL0idiMjJZR1120aqA3k9cBPhj/TwSSPg
         xYQnah0d0lY+KUShShsnNYnB30Le6aEHZ+DS/Gy/KCiKxFsyluRW9aQG6TyY5nbunxVR
         qEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979532; x=1793584332;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4By7A8PZiT0yThEZVJLfPkmZwSfEFs737xPwhq6ne4=;
        b=cjzLHamHiKhelEyVXx62SHM3hQQ5FbR3Ivo2sR5WDDQ3bwhZ3gW6RZEmxvUdaeZQXi
         UPzTjxZmMluRASzl2P97e0iPfj2q2pyN4D4EAkst7ECafGMArquXWE0O+oh/3a+XRzW6
         t5TXcH3uzBZZou6hQFND+0uQXFa3Bsvdb2vutNutPb7Z+rF4z1gqQlsMnS6+Bl3ZqF3m
         q/kyEExadasM899qe3paseQggbEdumQWeaz1J0/GLOUHIzZVq2YpuacKma4ksOYWbEHJ
         w0uw39ycKCgq8gjnuFj2D0gxHbKH7AbATUxx+QU6ps45iFgKyTKr4nTU2FL+GKndWyUa
         ZXKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwei2rxpBRwCv+59a9Ye85OnMmznJtR/KMsSg6k25mtgUf/g7epfKSQa25pU04i+C6sJT61yVNEeQwG5lA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrjJSpBHVurqlBJ0MgcxHD6zphmQGCNpLcojgDMfUmHxaggcrz
	AuMqv91cRXBalRbTtzZ3430iKKg9C4hX9T6Cp2zd4Flms5zWka9sXGu5uv3eiw==
X-Gm-Gg: AYBFou2wopTe3GXavPN1m4n/Xi404f5/UQvhysM5rQHmV3MNNAgve0gEvz17Wnkw+yk
	/U9/6dtG13wgcFhtZZDAwKFlSQ5pwBK47bljol6feIe1b+ed0Fjg6yhxZtrg7CiElO9Oi/q3a/f
	Ho3z71CQKZHqieFkoWFZ1w+Ht5YJbVzgONOIl+sNuViag1dPZUay4BywX3pzWzg6rZ+rnCiKv2g
	IigLChFo5m8wSXmeSTvKZVzo6CrHDb2nYcpevCTyiq0N/ojRG8F/8MedeXRERozcOcEEKby/Vh3
	jVW9YXlVC+EJqWfQs+AQDqmvMTgdytMbfZ++0cNCxbqdckwhjtpNq+N9W6v9LCWtecnI6jLcf0x
	G48vKI4D2IzscTXtsISsfgxQlSH+bJcd3LsRq6v+A8Jn81Ie0KqMOqlz+SfgvraCTnqIu2oQ8Ja
	6IhLNXksfcw6fkoTpXtzOXAk0zZgtJl6WaHPQv8fTCTM0QAXd1ODdwScLhkQ9msGxxpaR7wsilr
	X2bO73V15ziu/r1N61oEGY8WxdGxkIrg+MPpVc7dW4hll9XNU32J65JqP1eBlJw3FgN/S144BsJ
	uwyydjUtydTSZDwvIO1ukI64pEBGFsjenAZ6gmgp8YDx4zOiOWe/6iZIKCXX6g==
X-Received: by 2002:a17:90b:4e8c:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3adeac07c4fmr4703213a91.18.1792979532216;
        Sun, 25 Oct 2026 18:52:12 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc90d74sm947223a12.20.2026.10.25.18.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 18:52:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 01:52:11 +0000
Message-Id: <DMEE75PI8G2P.1AKZRLWQKYJ4C@gmail.com>
Subject: Re: vmlinux.o: error: objtool: do_jit+0x4f77: relocation to !ENDBR:
 .text+0x24c3b5
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "kernel test robot" <lkp@intel.com>, "Alexei Starovoitov"
 <ast@kernel.org>
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <202610252131.3Wl3JYJ5-lkp@intel.com>
In-Reply-To: <202610252131.3Wl3JYJ5-lkp@intel.com>

On Sun Oct 25, 2026 at 8:17 PM UTC, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   21a7f44fd0765fcc5194130b28767786eba1d1e7
> commit: cff94a3d78d8cc12ceaf60aa9272aac422b1dc39 bpf, x86: Support unwind=
_goto and unwind_exit
> date:   5 days ago
> config: x86_64-randconfig-r2107-20261025 (https://download.01.org/0day-ci=
/archive/20261025/202610252131.3Wl3JYJ5-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261025/202610252131.3Wl3JYJ5-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: cff94a3d78d8 ("bpf, x86: Support unwind_goto and unwind_exit")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610252131.3Wl3JYJ5-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> vmlinux.o: error: objtool: do_jit+0x4f77: relocation to !ENDBR: .text+0=
x24c3b5

already fixed in bpf tree.
