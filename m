Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768796;
	b=MPkaiUChm5ohw8poxzdUE+SKjX1DlzGgYQsebcKij27zgxyylluzMOk/0cFTMogySCOd
	 MBG02Xa54nX3krl+78U6cUSZ7RRRPJ39lZ71mV7FXA/2n0qnSvo94So+bUF+qT4O9g1o+
	 elTIu6nJ5kNFMHDb0goieiFF8lpx3s0THTSHyC2UJfQ0QD+wNywFYFKxu3kn6WFNR64z1
	 YV/weTqiE9C93KUscIpitaM26/q5ZTSQTBM0oV+s7ukgim1X9TYGYSikCvFCmUHyvgHmR
	 9hZlVL13QVhYuWfE/YXEv3PjBVYItRHq76dLJGDcbScumqHBPblXExnWZ27zg1DF/qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oPXMY7ljvQoOe/x0Rh6FHsqDnFNAF6TLNBIr0QtgRhc=;
	b=QuA44ghJcq8HUxfrBi6CtSXY4CLwoR4gvWUt7d9E8zacS4aRO+9InX3VL2BKPwMn5za6
	 FLq5gH0sV+TunOjh9uX/+fATr6IMNfyOJvbw/fVsbH1Cs1MKAWHERHa1e0ua0xftLCPwk
	 EXmaXBFIWyewrY0+vlQJSLd/Fs0SnEVlt64fcsZ4tJabX97rvAFNie6bg6UA4cAZuwLnE
	 hSZd0N7+RrLvYW5Aru1BOqrM7Q9tm0/kG+zCBMs/5mJCQiYa5lw2vc3sQK9d8gfXdVW6T
	 xW6LurHV/X2BoniBY0EEu/g4hXgXjoNFX2cdynOC8GqmBUr5SasVvNfB5t7Slw4M8LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q+0rIcC+;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EAE606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1EAE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q+0rIcC+
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso7740375e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792768794; x=1793373594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oPXMY7ljvQoOe/x0Rh6FHsqDnFNAF6TLNBIr0QtgRhc=;
        b=Q+0rIcC+9gfdAvdIsyHZh2HQLoo+0mT5pHgUsUZ1x7pKcD7aH2255csjurCnwZmPxM
         kOI0YGqmZls5nfFYRmKTcMtJJOM+7W9bXHDGyqOcX6RDLlzn4t+HjoZT0iUXlHeJZPtE
         kZX0PR+dPusqAdbqUKmJr+44kDRr4StsN+bFxsbxC+sGQC2XVwoaB9ugV82+qn92A7Lw
         EHbnRxgn5YlTbKNCD/IeGPgcXkANjBf2FSIrcEIex3Vbw69mX467G+vuUxtcFOOgbLx8
         MMynQ5mb5m+3UL9lDagDfnQV4xjfMfGeXBKHSLvqCUyC/ye1WuBJx0ifrwVAZSqu6TYu
         cjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768794; x=1793373594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPXMY7ljvQoOe/x0Rh6FHsqDnFNAF6TLNBIr0QtgRhc=;
        b=ln4eXA961obYOgC5XzaFNXj3cqTNP1cBedmMOlgF+ogu7dYNtQX9Yu/YYVxmsNkdC1
         onKk0f7KDlR16CQ3LdxViONDc6T8un7cY5nthsnC/EpbgBZFNNHro51ZmhpJKPoZUTtE
         O9A+1q29FxCvXlbV1fFmT7XQHByfIAh3nD3goXxZ4O8sHw8oflcGGMDOA+15LWReP4JB
         LTVdP52ZY3UROxM3ty+RgqTppLlgd3AOkU8v8r7u7vQ6ZCg39tTQjaXXCI+ym7fRCK1X
         z9RTpS41OaxTWgarlDSg3GCdlcCYKbjoD3RENjIRlvACAvNEB55YdI0rDoOe75TZJ9VX
         XC+A==
X-Forwarded-Encrypted: i=1; AKwUvBz+kM04QXwrM3p+ZNYdpWU4vd1m+Tc76b5uDYWLkRdfWaD/o+TddFDPI7Ljf+iEGJt/qF2iWbcMQgTxQZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZXnihb5OCQ5fMgQLvA8/bnf3ImQ8Ilmydd5fTvuTD61pgn5ex
	byVUrZc5aWnx7zV5s28TybsDfnjiHkV/4sdodNKM84U7sc+E7o2kZTy/zIdPE8RVLFo=
X-Gm-Gg: AYBFou2cpYod5SII27dqjgycgYvxveHF3Cd0wa8o+6kZH8jAkU4UaF6X+vJ0cyFoDYu
	JYtqHAcx2wruz6hWL6IASWqEGXdwfwYyIyoyjAmVLRIBoZKA9afQ/aQssTZj3dnqHAxuCcZAFT5
	lgL9AEHEHsvtEzBmzSOy4wjXRxAGPuWScZq34zbH+qSP0nSyWO8vcAEAtzwBzx40cU2BzcuDSt3
	hkXiblq1pLoacQ0jueFKep6jS19eeJ7A7h4SYD60UvV81JKCCpZMerp6QdFPAyIM/SEkLzWsNMa
	5V9egaJH92VTICVFLa/CYSn5dr/pfdXu39bSMLEv5+yHEJSjBaM06DDYnAsL/+N5HQaQuzUkkmk
	93ZVLYkt+y1rRMMn31a8z0do0TfZdWwYcD92pdarOzSMSaeuXmTkxELe92VDQuEzwX/YrHy8nts
	eQBqV1kN5tvDO49QRJ2PMDuJCHgSqX+fOVpq6cM1B6Yeuh0Ko2rjiIjTBLVqNZ2tw+WkRm6S+tE
	dSNDVAJcXWdUVAAbrKSZ+XaarzLm326Zb+LByjlLQ3H6/o02drNYvu0tQ==
X-Received: by 2002:a05:600c:818f:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4a312fb201dmr3737145e9.29.1792768794133;
        Fri, 23 Oct 2026 08:19:54 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2b061ceb7sm9707855e9.6.2026.10.23.08.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:19:53 -0700 (PDT)
Date: Fri, 23 Oct 2026 17:19:52 +0200
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>, jpoimboe@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com
Cc: jikos@kernel.org, live-patching@vger.kernel.org, shuah@kernel.org,
	song@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] livepatch: Fail object initialization on
 duplicate patched function
Message-ID: <att7GJXA7hK7Ic64@pathway.suse.cz>
References: <20260908120325.299649-1-pmladek@suse.com>
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
In-Reply-To: <20260908120325.299649-1-pmladek@suse.com>

On Tue 2026-09-08 14:03:20, Petr Mladek wrote:
> This is v4 of the patch failing object initialization when it patches
> the same underlying function twice through two aliased symbols
> (functions sharing one address) in the same object.

I wonder how to move forward with this patchset. There seems to be
three unresolved problems:

  1. How to handle aliased functions when replacing two livepatches
     with aliased symbols, aka two NOPs on the same stack [1].

     My take: I would fix this later on top of scoped atomic replace.
	      The aliased symbols should conflict.


  2. Fix the low-level __write_relocate_add() to clean its own
     mess on failure.

     My take: I would fix this a follow up patch.


  3. Better describe the purpose of klp_write_object_relocs_limited().
     Or clean its own mess a better way (code duplication)?

     My take:  This requires v5.


[1] https://lore.kernel.org/all/20260908121744.81D641F00A3A@smtp.kernel.org/
[2] https://lore.kernel.org/all/20260908121810.9577A1F00A3A@smtp.kernel.org/
[3] https://lore.kernel.org/all/att3oHvCpVDjDt-h@pathway.suse.cz/

Best Regards,
Petr
