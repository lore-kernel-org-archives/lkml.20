Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647817;
	b=2J1NZEniLDFLm5+zIqSkg+NJHJ+5EFG6wd60EHUijWKzZzmF9GMncUWOW5Ymg0vu9qZ/
	 SWdy0OJ371ckpCm9DNRz1SIyyamdfS0VRvv+YK7gVUs4Fx0rzYr4xypikrAu3WFS1LYUY
	 1N2SQ9qy3n+rKUEf4dtYvSOQjSWzEdi9iBXun9PyULuQA+6t/TvezRQmZ35YUuLUmPqYi
	 6ZnSgQvsqUq7vGYCgJuix6YQq/d32evmkF6UezhVAPqaYdoER8ZvIlxNvx5XQUu3a7hez
	 oOR15YLtajjrcoTKp6vuUMl0G0m4x3arAZ+pQD/AqQM2EjJlIdGhKsx4ykhLebw9uPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KMZG+Vonh2kG6IEXx5qekjJyTd7RpEVJ3Nhz9EIK9Q4=;
	b=ycwM6VsUztifyE0LPyh00I1dikMrNaieFNBaxxTSZkH/UqvnHu8xgb30ciAlo3l6qC9R
	 x1CYjYDJlx2qJf9xpAmnHHjHRbqpGrL9eAl+YHckrP+Mg3ed/lfeTzES8k2/lFhX4ZzrK
	 SMP9F8SVKEcM/H/Syj+dcEeWf6WiJM/IzkWmWV/XR53Y54yTa936sICQ7ub/HMkzZV5dL
	 2jTeUeHw9Z/O6Sbv7Xldz6zJfxYGt1Rc2GcBqxUj8mbfa6V2o2DOvD2iB/mYdI8Q3aZiT
	 1qIRBwvsY7iaWW0r6c5BCAgHxlMEcSA+ilMB6gDOrNaandYFnR0Rtp/Qn03rUX06dhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XHtO+pR7;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAB7606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFAB7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XHtO+pR7
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so2015723a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793647816; x=1794252616; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KMZG+Vonh2kG6IEXx5qekjJyTd7RpEVJ3Nhz9EIK9Q4=;
        b=XHtO+pR7W6UhdkRORPR0QLvu5lPna3DK4Qx+VZ5vIC7r76TVNkNdSWKxbifu1TXCdx
         8PxUJNOe3D3ncHXtfM9wZysK/YJ0SVWTFv8ivv1NljiqrmDc214IpNQGyVD7BKwXPU8G
         6Vjt7/i+/Lq5cex9CHjeHMU5GVc54fZwicUKFjJwZF8PQGNUqVTzEOt6f+fHBI9F85a7
         /0+6aJ/boiCgVEJeVuzGE4INcyjqglXDGwJzvDah31f5SMIabvtvTASt6DXzq7YuZJSe
         S02gSPhqjyeedI/ZWv5OkTbuTp2H3rtzQyC7vR8iGcfkQm0KYs3U99hZYanDlLz9pXYV
         V+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647816; x=1794252616;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMZG+Vonh2kG6IEXx5qekjJyTd7RpEVJ3Nhz9EIK9Q4=;
        b=ViPax4bh+fTFonPSsILFnCqpDY9+k2BopC/czWPx5rT6gwyIu8pek4/b9cnEeOS7P4
         qigi5nnj2c2AGEP3/8WlIkfUe4S0h50G8u/bBCW+S7n/v6bmm57zBHxyc0F+SkEqxuki
         M0SyuSgSgY1nd1z2IGlvYawh34mDUqZoNF/++OMXhln8Ihp7LYETp81ltmXdzX5OzSmI
         NvP1QQr9emXy5RR80eP1W/jvrhpD3YH01XlPYkojdDw9fp0RTNjTVnBJtdRArt0e0Tpg
         Y0qZ6hJ/cgjpNImX+LWzlIjmLftU/SindQWMsO6Whg48MpxDFpJl2U+6+ifuaNespXjs
         Q4+A==
X-Forwarded-Encrypted: i=1; AKwUvByqzOG4PMmk68MxC2Iw9mEdirx96EfyNeTh5az6O2TkrT+N8l5VBdCEC+qWIZJBLkan51ymcI0b+8LCEpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyOzTza+KsDvePuIvvunqHCZie5MF5us7UcN4vGvJxTB6WbkEC
	5MZd2zPTz2QK/jip1WDxnoeCyhsSmC26RjHBnfVwuAnc/5MmLZTVcPNQwXLBou7p0OEwwlsWYNn
	iu+HBMw==
X-Received: from pgfd13-n2.prod.google.com ([2002:a05:6a02:654d:20b0:cd6:1ef9:53db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1441:b0:3e1:a4ac:2d5b
 with SMTP id adf61e73a8af0-3e928dc6c6fmr8634625637.41.1793647815861; Mon, 02
 Nov 2026 11:30:15 -0800 (PST)
Date: Mon, 2 Nov 2026 11:30:15 -0800
In-Reply-To: <979f3d53-d4b8-411f-bc66-cf487ff76d42@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261031003309.3751-1-jason.andryuk@amd.com> <20261031032009.GIauVeaXTMNHgjYEiM@fat_crate.local>
 <979f3d53-d4b8-411f-bc66-cf487ff76d42@amd.com>
Message-ID: <aujkx3-YmRrWd6nX@google.com>
Subject: Re: [PATCH] x86/paravirt: Add ioremap_verify_range hook and implement
 it for Xen PV
From: Sean Christopherson <seanjc@google.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Yazen Ghannam <yazen.ghannam@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Ingo Molnar <mingo@kernel.org>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 02, 2026, Jason Andryuk wrote:
> On 2026-10-30 23:20, Borislav Petkov wrote:
> > And I know Sean doesn't like X86_FEATURE_HYPERVISOR but sorry, nothing beats
> > a oneliner at the beginning of print_s5_reset_status_mmio() vs this overkill.

Deleting Xen PV support would beat it :-D

Yeah, just go X86_FEATURE_HYPERVISOR, I don't care _that_ much.
