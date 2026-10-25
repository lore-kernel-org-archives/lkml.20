Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792928310;
	b=akscGPhJcskBZmABf6c4EqG289HShkBgFta8wstiM4PYgvQEtvVYC0ppr79Ck0YSkOmP
	 XAO5RiJuGyYsVnUYY2Dl6LXAMbLKus4mqU9sKgsb5uOrCffI1GRWh2R9Zn28ReLN8Vy2T
	 6jSttqvVBR4XwN0CUBY85+d3+RjfAmNfybJ+0ENPLm54CVvcPVmaTeAsj4jfJ0x01zDsi
	 vO6dLei+hS+IcSXE8XZJKgY14w4O68SBzL42ybkjgi03CTBgYj5h+X+Uq5nv5mmJpFDz3
	 19uFKbPCBS/hlLWSEzkcvqRuIGFTdmVDD6vLf1rEF6Y1ATDrsOh6u2pw8ttQxkb/8rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928310;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=+vXtBsCA/nT+vEFGXKgr6NsohYPHl4LB9wCCdwBcVvg=;
	b=uFaoVAKy9QxG+BaId/o6eExw1rxlHwawX7WqKuSmDnAljAK+eL4sH4qpk5fokhpAVTkg
	 TIQgnDuZQCR1HLeWf+wbM1cqczBgCIr4dfHEmA7BEJj48ow+1AE6kmXpESO9jbESh5R+x
	 O6sVw60Re2BlQGuDzLKf8+uFsE1aUF+3QEe2MsdepVDcbb7oMf8YWT7xsISz+gXF4Y1fo
	 FtPPQXnNU+45YpS4OBn2FJhx283bQYeeJ+Xm24ovHZ4D9pThMX2V/+i/r1xObZyhwOEdB
	 vXCyUN817VbcSNHX3KW497sm8Df/8MKR63Bg6+qdM214VNRIY/osnmq1jwep1T3GhzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1p3OCtM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D123D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1p3OCtM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6C01F01825;
	Sun, 25 Oct 2026 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792928309;
	bh=+vXtBsCA/nT+vEFGXKgr6NsohYPHl4LB9wCCdwBcVvg=;
	h=Date:From:To:Cc:Subject;
	b=b1p3OCtMEYgWxXb/gr6uMUAhdgZZJfZFmunbgUR+xWjmr4tArOCfuGpC+O55Kwf1Y
	 MWSwC2O+xOMclvtxsicEuFH9brbMGbG/PNDhqZ/lkXMQqBmzUqIvP5MEJ09iYPwI27
	 FOZV3CxQuETQLglPvU03xK5tAM3f8zV8JcqW8dpUt5GtTeeDfYrEYAuMtar7lMoqPo
	 wo+0GJzmsCU7mNvevQJYcoDtAQLIM/jmOYG10JN3ADzbnXs/Z/H1qlEYHjmLxgHExa
	 uGTlWJCHwtRuz0QQIEwnECBaIvZnHWO96y4fZ52n+qGB4qjTHzOkEs6VG6zQ+Z6E+t
	 xj7BaBgfkU+Fg==
Date: Sun, 25 Oct 2026 12:38:25 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86 fix
Message-ID: <at3qMRdAdHcJt7Rv@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2026-10-25

for you to fetch changes up to 108775fa28fe04a16f19a828a779689f3d0ea9f0:

x86 fix:

 - Mark CPUID function 0x23 as being indexed - which bug could break
   VMs (Sean Christopherson)

 Thanks,

	Ingo

------------------>
Sean Christopherson (1):
      x86/cpuid: Mark CPUID function 0x23 as being indexed


 arch/x86/include/asm/cpuid/api.h | 1 +
 1 file changed, 1 insertion(+)
