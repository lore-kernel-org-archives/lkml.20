Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222105;
	b=p+u0MLoznBFHqhTxmt/xDYJ5NyNGAeReNw953wCC/51R8k5UjhjF3XuO9mSlmFL6TaKN
	 Gjb4jvjahATjIdGsYtpUUoie4Srba8/9pFTYqTy1hf7uvuvCny/iYWF23OskM/QAFKbXg
	 MJ3R7dZypQafpxxODW170FGxwotIebsYGD9tspx6c1iijM6tFe+oxNlv6Zmc+DwuXQ6AZ
	 ebPj2aqS/Q7LLqJ4qlrvQInK0Rx6iDBiS6TvbmgAmA2lAlpYAxiE/XrcrBmy3tWNvUt3v
	 arDOUbb7fxDMAj6NErO1OQp8GADXte5V6uFaZTlVa8dubhh/u331kuQh1gf0dfAWL2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222105;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=S1FGdhZllrMjEm+POPzDgDYLMUR3eBpyJGxotFxGSLQ=;
	b=ev9hVaCQN36pz+DAcfAyCmO3WIHstcKGvaHXfVojxhm9z0al4MkPSpAPS2gbmx9qdXlg
	 6aNTFZ1KkDGGsz32rzCmoWGG489BEvmw3Npz4c/PAqJXnYgHA7wZD/6Jf7zOl1f27kDXE
	 LZe0BNGeH4Yo+yNEMvKWFeH8pmmR4e2P2iVdpkpfY3CtJzT+XktPDMALGdssDQP1IyQmO
	 PRajsV3nT2YlOko7xf7lO8sxLdZBlwZ8DBaVw6Gi1uftUpdGMRozcItfei3fcmcbeyRRs
	 4wXCCZ9Zoi8MeHdNepyN7WKCjW+AZKFnQkzxsSWkWYaFWksF/eTvvyDQdb0tqxVOyew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=FsI+0jWU;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E52A606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E52A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=FsI+0jWU
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id D6A0B20DDBC5;
	Mon,  9 Nov 2026 12:01:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id B8A5820DDAE3;
	Mon,  9 Nov 2026 12:01:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr B8A5820DDAE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794222095;
	bh=S1FGdhZllrMjEm+POPzDgDYLMUR3eBpyJGxotFxGSLQ=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=FsI+0jWUv/4iqCVTv5yZiD8sKZSgm4Th3SmP+5UAUFz/vsUot3xkKqxr/Fdoxw4UF
	 f5fuXlDHmzcgOk2056X11ZynLgICdRTX1KgpAsoLYCdLpEjtu9SQz8bkU67dYVOUCk
	 IB6mH5XXdBC8y+4pZhnES8Wb60DdLKZ9eHifl0s1HkI99DYGzhGSCXQtDvtJYz80ZP
	 DyybB57KeR7uLBzZzizx46gP0xxkhL0ovoKQToIAYD8HS/we9xm1UxAn1P/dS+xjWt
	 gEu6GDFKLDonucVkbkoTSQQEk+OP+VSqiN74wZQCklnd7AC6HksZ40zZAIqpwnKTX3
	 cswpiuzkq5Fbg==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id HLlD2-6wYjs1; Mon,  9 Nov 2026 12:01:35 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 00C9D20DDBC5;
	Mon,  9 Nov 2026 12:01:34 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anand Moon <linux.amoon@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: Re: [PATCH v5] riscv: disable local interrupts and stop other CPUs before reboot/shutdown
Date: Mon,  9 Nov 2026 12:00:43 +0100
Message-ID: <20261109110104.293157-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev>
References: <20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 07:05:40AM +0000, Troy Mitchell wrote:
> Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increm=
ent
> the preempt_count. If local interrupts remain enabled, the environment
> is not guaranteed to be atomic. This can lead to a context misidentific=
ation
> within generic kernel teardown code, causing it to incorrectly enter
> non-atomic paths (such as attempting to acquire sleeping locks), which
> results in fatal "scheduling while atomic" splats or system hangs.

On Banana Pi BPI-F3 (SpacemiT K1), v7.4-rc1 defconfig, every reboot warns=
:

  WARNING: kernel/rcu/tree_plugin.h:330 at rcu_note_context_switch+0x46a/=
0x48a
  ...
  spacemit_i2c_xfer_common+0x342/0x5f6
  ...
  spacemit_p1_restart_handler+0x24/0x5a
  do_kernel_restart+0x1e/0x26

With this patch the warning is gone (2/2 clean reboots, 2/2 warnings
without it). Testing done with the help of Claude (AI assistant).

Tested-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
