Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618017;
	b=jHez8Au0YhM0D6iUP9PCwMvoBlyhJDY0Z27j/Wwfrrvb0jZJqR1pZw/zObHzsaWnA8Kz
	 JWOFYhTmxUvrJxo8rRe1kKG+/G+P8WczflRdibqsbCAVMoiAvmux+ms+51/VZmFd4z3/5
	 hXxffufIuk6kSttuXyOCDZjP0wJbS22LACZJtiFSZ1u3biTtQrGuwSOrI2wQ0xi+oUSja
	 z5gsno9iQP8RtjL+5DSIX541eWGngqYGWI49POBdHXKAnE4mN8E1GkpYY+5BkgMqqAixZ
	 lHnO35+dmWgNPhfCd/MXGRy1DrgDEqSRIISw85ugpdKYV9GFiGt4BgIcvWbz3uEZIGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=a8Rvs+APlES4o/Y+QNKx+Wsj0zsjMwsSLTHZLYdVhZI=;
	b=p4ru0rordXKX8sfpQZ1avQwCTdjNJtZ6z0wZhY/Q87WptRCfHcwNDFYhzxftbQUVc66z
	 v8jyPe64uJHbGAOCP39+irvwe5moEecl7tnLHIdIlw6wi6QkKPjoiVoQf95vbvjOE4AyK
	 vZ+7fvDdjYqfP62kwT3ugq6Hb091k+SFc7qypDP3oxLKH06y4mq9fbXewN+jvfvCiZplj
	 OATIbQqvUVC9OUteaA11tbV/xBi8Qc3rP9P/OvrVhFtS4V9FCNqPjl5VFUnZ5UdxH04eT
	 5ddjsZoGlcIQfOdRqSYn2jpsDz1Li14rBdHTHkRbe4xlsk1DSWKBvO8mZe2Iuq2yzCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrH6aB6V;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C092606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C092606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrH6aB6V
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a1947498bso1070857eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618016; x=1794222816; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a8Rvs+APlES4o/Y+QNKx+Wsj0zsjMwsSLTHZLYdVhZI=;
        b=NrH6aB6V18WdvAaTOTYu2ib/o3fJ3G04pmguQH+yPdqTn82Eo9//qh9iYqXbBLisDx
         CMU3fG0f7a1PTXKTWI1ryI+9KqeGmtILbHEzpfk9PGQ8M4k7bgMvRWiglac5kEgNrizu
         ITizSUknar3bqCMxA15U+b3wAE7H1E8/6mh6Zd186ILeujGUFTzblfL8010uYcnAq5gQ
         FYwmkTxWmZrsUXvjH/0JvXCyLvWITeNPWjt3vBl1zd7RzaA+KgtM9R2nH+JIgxWsg7VJ
         U+ymX5bkZDPRoUYS/kpqj/lNx+XVzqlWvJo/RTKNKWgXYCFeIhSx+EysUSeT/MXSiLHf
         XuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618016; x=1794222816;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a8Rvs+APlES4o/Y+QNKx+Wsj0zsjMwsSLTHZLYdVhZI=;
        b=ZMLH0zOymMpf+jYpZcKW1w1GwFOk/lAjofbYhOYTCkvbXlZGJZ4CQ3uv3DSDAzg7E+
         477f33aKVYq8N6SqDJ3ekGqivSr6TGWD+JsqxI3Emn0Wwkk6XTkIATYGuh0/AJrHy3hd
         tRCwteLTn3wx/Lx4SmEqAEUbN3dDyqvQv4ctbRlxEDJIKBevdmOLsJMnN5caQG4g7JZm
         T+pG0IsZ+2L5o5NUa5bDG+eTe1lSEoCCxAJ4ZUoa0p12qV6ERSfYb7E73gapbQYL5K1A
         i3l6afMvowU6Q0OzIk6LdjcnjtN3y5uMbPrpx69aHl7fmjQt0tpRWyNmgaAfuVB1rdVi
         0fxg==
X-Forwarded-Encrypted: i=1; AKwUvBzTzNnqBjvZZH28g0SiMxdt/aNqdKjh3wn+rBkq1kG9p4HFAgg6QW9/ELrTBH1CNoCb9bjo05qhVYtfEyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aTizoWRH0rgSYrK/+MWONWIaWFRMhooV9pQU8I6rloyKURUWb
	Raui73DmBTBwEsUDOassCmw0sTieK+/HsDohdESf9OblmBycEy6neqLr29H11w==
X-Gm-Gg: AYBFou0cdQ3YYgmh6+0l9r+It2ZqUiFo1eXsKs8aCDG4d6ZsByNVCZiKGZsqfMAhRMq
	GpizUGC92AiaRVfORv46UxDCjrD6Pvn5rOi7J7dD/qdDv4eKDEvOWQNZZLEEJjdWenyWyKzbOiY
	zXCx3/guDnof2loh/Nq5s3WznVX7MuZ0mM1kLM044N/YbLPqLn8/7PGdsJnlZY8R3fzXzmo9shy
	akm8siHnyu3JcvzyMT9cCSGPUzyx0aPe0SZq1ouRKFUqRXpGGIXCmrioATkxmBX1vyQMrYNgJ5V
	vHKA/Op4u5geeO3or6Fvj0d3ZsRs4ZbUKkZxtJs6BjBrIQpX9/NCQDtHPs2llN1nJnCO83TNi6e
	pdh4S794uMdQbJ5brzNEPNdMBB3uuEmgiOkNJaa757x665gBeeZLMWBGZHkR9cpDn48pUxPxiem
	TCYMgxnRW/5VhElYSZmdRVaUVAEPDrDKYG6M3q4rMCP9su++ORvVoes77HCHBg5VEj8q4+sUVZP
	1ypm0kxomUqPX4Yb+Nhg25Vv3kxqI90lnv3qX2QZf5l9q3KbnY0s+jSjfBBVzCwUS1+YlaZC2UB
	6OCazI5cCONDuFleY82unkyQg3w=
X-Received: by 2002:a05:7300:3b1a:b0:351:52ec:60ee with SMTP id 5a478bee46e88-36a423f04b7mr23743030eec.28.1793618015928;
        Mon, 02 Nov 2026 03:13:35 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm42099651eec.11.2026.11.02.03.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:13:35 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, sshegde@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH v5] KVM: PPC: Book3S HV: Avoid spurious interrupts caused by LPCR_MER bit
In-Reply-To: <20261102091700.253381-1-gautam@linux.ibm.com>
Date: Mon, 02 Nov 2026 16:42:12 +0530
Message-ID: <y0bb5vxv.ritesh.list@gmail.com>
References: <20261102091700.253381-1-gautam@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Gautam Menghani <gautam@linux.ibm.com> writes:

> A huge number of spurious interrupts can be seen immediately after a KVM
> on PowerNV guest boots up in XIVE mode.
>
> $ cat /proc/interrupts  | grep SPU
> SPU:     223705     192439     273526     147623   Spurious interrupts
>
> This bug was introduced by commit ecd10702baae5 ("KVM: PPC: Book3S HV:
> Handle pending exceptions on guest entry with MSR_EE"). The root cause
> is that once LPCR_MER bit is set, it is supposed to be reset by
> software. But when a vCPU starts running with LPCR_MER set, the vCPU does
> not exit back to the host until the decrementer expires or there is an
> hcall, etc. This is because KVM on PowerNV guests have support for
> native XIVE, so they are not dependent on host for interrupt emulation.
> Due to this behaviour, a huge number of spurious interrupts are seen
> since LPCR_MER continues to be set and LPCR_MER cannot be reset until the
> vCPU exits to the host.
>
> Fix this behaviour by not using the LPCR_MER bit whenever native XIVE is
> available (currently in case of KVM on PowerNV only), as the XIVE hardware
> can present interrupts to the KVM guest vCPU directly. So the LPCR_MER
> functionality is not required. This reduces the number of spurious
> interrupts drastically.
>
> Fixes: ecd10702baae5 ("KVM: PPC: Book3S HV: Handle pending exceptions on guest entry with MSR_EE")
> Cc: stable@vger.kernel.org # 6.8+
> Reported-by: Timothy Pearson <tpearson@raptorengineering.com>
> Closes: https://lore.kernel.org/linuxppc-dev/582904882.11159.1786719390349.JavaMail.zimbra@raptorengineeringinc.com
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v5:
> 1. Drop the redundant check for the presence of the native XIVE
> device. (Ritesh)
>

Thanks Gautam for confirming that.

The patch looks good to me. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

