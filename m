Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.136.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779070;
	b=AYgPY+tCyGTc4Kg20PFrhMXh0LoZTa5ke/8t+xPFy1FB8aHHwCzVzo/7mspBaGni+3t2
	 CMhrN5N7l0OS5cXY3jXcg5eXt4PCcK8WAms3hfIOIg0SjAWG7olBueA2oPpObgQePtyr+
	 u1DOsed5udzmmv2HI8uGGmVKshdE306v2ZP/H7O4jhzdI4nlK7IqEN5QK+YfZd4aRXCR+
	 Hnr/uAoD1TzRnNohhhHC0EozdT3qQx0/FrG2V5HcfFT2OgxcAdQNrOjHVCLMiHCOv947D
	 cVZ5Q6jkV+olkntnL4lbSGTDJFyS43S3WBEMLZyyDCzfvbMRqX1jHAe/vtgLprFI6+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779070;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=zlEllQdCadh5nXVHVJnB7CN9QmI16Id0COUP94sX/Rk=;
	b=rsslLBlnu/ET6fZbW/K4zEU+ikKubjqQw5qE282792x0tIMC8o8wdSrzEqAoibxnDR4y
	 42TuRM/Fxhwm0b5OXS98oMlSn53rUM1LR4bWMaZ+NyGrxrdeciNWFD/fbDrD9DYXfoxa/
	 JuZ7C77dVf2bk81aKd0qy2OnBbETF9ah/WFMl5oby0CHyiCiFjhlA/YTx1fYZ24t3V3P2
	 AtRqqvqROSCGdBRO652Dao3jLEDIBc/rbebIIiYLo1TTGS9usGR1yjjRBxGN1PwnnnKEO
	 luxTmd2Ik6ac/OAijECh53GOBgw6o8NagsTkxO9lyvUOYsJz8PvYqJ4vf8pUKkZcIbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unibo.it;
	spf=pass smtp.mailfrom=cs.unibo.it;
	dkim=pass header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=hpk797rV;
	arc=none smtp.remote-ip=130.136.161.50
Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84761606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84761606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=hpk797rV
Received: from cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPSA id 7C4571C006E;
	Fri, 23 Oct 2026 20:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1792779066;
	bh=JfVJ1oL2SMfCGS/dFNT2nuayN9wuQODynfmtelBWhQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hpk797rVa3EWeiVAfgkCmEPotFp0QqRfyurHxPhScpC5kuYSR++oxf3VkSF/slYhL
	 HaCacal9U9YQkL92aqbNuvl+I2LnpPBBvMB/XFL8JY1pRvcK7C/fN7Ub/6rDDAKmd/
	 L/m07oDHuUmoTINS+ztraCMj9juXUBaSr7qgnrxM=
Date: Fri, 23 Oct 2026 20:11:05 +0200
From: Renzo Davoli <renzo@cs.unibo.it>
To: samir <samir@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Davide Berardi <berardi.dav@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
	"Dmitry V . Levin" <ldv@strace.io>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] powerpc/syscall: Return the preset value of skipped
 syscalls
Message-ID: <atujOWJNfMZPVD0q@cs.unibo.it>
References: <20261018151539.440213-1-renzo@cs.unibo.it>
 <49f43f66-f516-413a-9842-bf6d8cef5fb1@linux.ibm.com>
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
In-Reply-To: <49f43f66-f516-413a-9842-bf6d8cef5fb1@linux.ibm.com>

On Fri, Oct 23, 2026 at 02:28:09PM +0530, samir wrote:
> Hi Renzo,
> 
> 
> I tried applying the patches to the latest upstream kernel (master branch),
> but the patch fails to apply with the following errors:
> 
> error: patch failed: arch/powerpc/include/asm/syscall.h:98
> error: arch/powerpc/include/asm/syscall.h: patch does not apply
> error: patch failed: arch/powerpc/kernel/syscall.c:18
> error: arch/powerpc/kernel/syscall.c: patch does not apply
> 
> The latest commit on the master branch:
> commit 734bef548a96e8774d6eef5dfa2026c6edc4e80b
> (HEAD -> master, origin/master, origin/HEAD)
> 
> 
> Could you please take a look and suggest how to resolve these conflicts?
> Does the patch need to be rebased against the latest upstream kernel?
> 
> Thanks for your help.
> 
> Best regards,
> Samir

fixed in v2:
https://lore.kernel.org/lkml/20261023180735.853655-1-renzo@cs.unibo.it/

Best Regards,
		 renzo
