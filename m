Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1BB331ECE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778958; cv=none; b=nAYsLmpK9n8JdhNTMWRbM/eGft1DoEiHowhjgoBT0UwKSBh40svCyR+/RdzcKJFhZCdzBsUMOuSiMaSUbPGyn0ON4SPWgz4Hqhf/iOBESXRN6+2IaTIn6uFZO3elwqjKhSsZTZ5+ypYtg5du6a0iezPfC9iXNWtenSAECgeC3Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778958; c=relaxed/simple;
	bh=cgA5xtiTah00EI8VPV5MgX5nPkycfXvIic65XlPW51k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sru1eQ6u4YHnpiyBy6CbilU8wnqR7b99ECJ0NB1rR8t9KvJNmoXoyIZ0isVHwgIp0xTMtNCODoeD6/vNXYm65V4WfXvTivCXWyhqJK9U96/GISumVOEtOHSatEYAaE7XalWF+RkboMJAp4+VZsN3r/Nq4B9/NN/syAPQJgaQ3gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1452jYh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1452jYh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044FC1F000FF;
	Sat, 19 Sep 2026 00:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778945;
	bh=eojZnvOcSsz8LvMhoUSOyuMtKiOL0VubQ9yJAzFiREQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Z1452jYhpo+Z+sNqjAFdqu3auX7mTqJcsOMMzCz8MaXJKlgoTqOvu5k+6o2p0kHST
	 4vNVoqDYwi6617OP9l9SwN6zIK4sRuWRDz89kS75Y5bbYzEYVOdaxOMZoB7zZKFjJ7
	 o+pjiMwvSvbbglMvyPVXLbUU6fg6HwUu2f5vASLh+GQfAujpTKTTWO5G911rP0iopQ
	 sfBnS+JHy4im5nPuZT/ijpaiozrb94iZYdwWM4u/L6lEOjPyBRdlhqaWDg4vxf+E8o
	 LSPP/8sW3tXEBt/VrJgCHZeQjBLSCOi0BAqX8D3fMtGrCbLhtth6GF+QM/P/t9FuXr
	 uE7FIhMaImWSA==
Date: Fri, 18 Sep 2026 18:49:04 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
    Charlie Jenkins <thecharlesjenkins@gmail.com>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: vector: Fix output operands in context save
In-Reply-To: <20260911194218.3379486-1-aurelien@aurel32.net>
Message-ID: <d925bd35-2b26-a0c6-6a81-3a886b5f368e@kernel.org>
References: <20260911194218.3379486-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Sep 2026, Aurelien Jarno wrote:

> The __vstate_csr_save() inline assembly declares vcsr as an output
> operand while the assembly only writes vstart, vtype, and vl. Remove it
> as it is later saved by the C code.
> 
> Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks, queued for v7.3-rc.


- Paul
