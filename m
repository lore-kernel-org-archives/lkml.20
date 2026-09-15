Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE74F4A4EE2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507173; cv=none; b=hoaRE/YblCLIUyhteX/WduQP7MkxFXBNJY1Nuy23MoSY7fEc7PdssrdpCkwcDnIGyAVr+8nIL8BlG6JWd7IT28Cw8n7DzPrbNzSjbQkSE/2e5Ja616pCb1KSY82buql1unhmbZgYzjV1vFMZ9hkTWGkLgsb2l/Uep6FJAxtvJTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507173; c=relaxed/simple;
	bh=DFATj74VujMU8//zygZj+iFWMIlx/mGWnRaQ4jp2bvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUUN9vBsrkUozkgTX3LJERWAjNIfw/cKiOywQ9GjI0dmIqV5YhDj3QTTjUbTwFhL+/+0sZMgQthmxCyFw5YXCzkm1cxNx5gZj2SxlkJYwJeb4+IgIq5lfHx3BbwAAebTk4rkL+ULtgA+wN+LI3AwoaUyY/INwGGfQJd5yM3T6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lc6SKjLm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lc6SKjLm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so1984975e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789507170; x=1790111970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5wwx/Pk3zkVIRABUWvpOwMc3Rzh9znio31a5NcZ404=;
        b=Lc6SKjLmOS8GKtaoqfSMSU4VLMvWjzGUskhtGnM8e66h4+ERcJc3ILlp/0r02WdaHQ
         1S8jIID++nvrwUcjVp5lkIWRLHMs42gyKLFMYNQCh8Tiyo1sqVf6kte+6Gyd8R8tIX2i
         6+W/gS8FSA8hbgk5Il2D3UzNDC1vvrPcPjxPloNVmOoM+PsFBANXnA19ogGc77VlaibP
         3xHlAjSAjf7ORHSjPqAsTCmHO7faR33qfemaST8j9Wxh7mH0Y/pDygF8jZhsXJDhwVMC
         wPEdvAlyCj1mu/zmoF/eqUEEdXsul8jk/kuRJsMU5riNR2zu1sPnXUV2dGCnnWmL36UE
         yGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789507170; x=1790111970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5wwx/Pk3zkVIRABUWvpOwMc3Rzh9znio31a5NcZ404=;
        b=Q5603p0XD9t3TPPsO6V7cw1Cc1F2+3eF0Amuia102W/qWAclRo/76h8waWAq9HHStk
         tqqGaD3L/Tl7kGvSuxiwOKQKO10lSLD3lJZl7pUn7zs0tFdyoBdV8xs/yAVnKoY08Wg6
         Ul6YzZv8Ezr3dxTIpmXkrGka53XCkSt5S2Canb+WtWnq1gSPKu+VJdfj9D7YPhRrRfgM
         bb3EGRp+0BaUljrHvWZVnzya10m7CIi34BpXDChqAe0HOPQGkl2lJijk2DxM44Kdy7wy
         Zq5re8ArgXZm9PKAn/s7SFx3tPoFUdLzAZgGhTF5vbxmuVabfPoCvobvpgFBen5MJxLe
         RtBA==
X-Forwarded-Encrypted: i=1; AKwUvBxhXec4MAgXE34loTaHGFiwyujvsU5/0yAmjjMCmM5Te1ACQ/YGO8L187naj1r3T7PkNFbCVCsrQKZSP50=@vger.kernel.org
X-Gm-Message-State: AFuF++lw/CAPiIRdTceozeEn11AXLvf7clyxZdOKP3lGaaa5jl19BwZs
	DxKmfkTlBJKjV4lCJkBL2ZffYFlActegJQyyBXE2uZ7Y1KW/aZbOpjCA
X-Gm-Gg: AYBFou0tqJSXnxVOi77MCnYnEsLMvT3hBVOLoXIlFwdthIDiDPSw8/Cmnbn21qyxFQd
	t2rh3W9i7VKZ5yQQUoW9eFaodvaBumtuSvrKYi/eva/3py3iitfMlUMRED1wOhsZ6ZfNHVvGHM3
	fVa3CGt1uvvsEoIJlCQ/o84R+ETCq/fwmcZy4Sad9RxmG+MbWvzdPejBvHDskRiuCG9Kpiq/i/+
	/XJ/e3ZVuHVZltuF/ZPkUJrHv7/J23AmxRx/rDr5t3PcnfCZ7uOHTVgaejRpfztnopESHbKkM2u
	hLiYCypWvt/t5zwvSyj9dm/wtwAshl0PQY+IATRdJct5XJCamndZuwWzVYRaztuwLFyQv/MZ73p
	/dLc+V3wM/bEJICzKpFi2+6coE0dQDgr19jeh8dhgH+cEEf2yWB+CkIp2IZPPsusbfJVjROcSTy
	/prUALQAqbDYKF3p6uuz4Ov/IYJIH6DLIMRvlgrHx9BEAF5/Avze0+n1Ej9CHIOlnhz5yHdtNDn
	k978JWaH71Yzd+wy9nyMmUoBP+gkur70ZSg47mlTgnDuUe1t09IzXL1m7gOSrkRouDEvWZWg8R7
	DsCt592rWzK6r5sCeqerECkhbidqI8bULm2jowZuaLKhHbAOFsj5PQBsJRtQFifnDxkssjE=
X-Received: by 2002:a05:600c:1c0e:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49e8222a2aamr39456665e9.9.1789507169739;
        Tue, 15 Sep 2026 14:19:29 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-afd5-c801-ec9e-1a2a-2fc8-3f88.310.pool.telefonica.de. [2a02:3100:afd5:c801:ec9e:1a2a:2fc8:3f88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27198sm1671382f8f.15.2026.09.15.14.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:19:29 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:19:27 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lian Wang <lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/damon/core: score an unmeasured PSI goal as not
 achieved for the temporal tuner
Message-ID: <aqm1ZPUHiXf9PFWq@gmail.com>
References: <20260915060937.3423-2-kmehltretter@gmail.com>
 <20260915145054.92001-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915145054.92001-1-sj@kernel.org>

On Tue, Sep 15, 2026 at 07:50:54AM +0100, SJ Park wrote:
> 
> The intention is to make no effect this round.  Setting current_value to zero
> to temporal tuner means it will now have highest quota it could have.  If the
> effective quota before this was zero, it gets an effect.
> 
> Ideally, we should somehow remember what was the last esz and keep it.  I have
> no good idea for doing that with minimum change.  This is a corner case in my
> opinion (correct me if I'm wrong) so I want to keep the change as simple as
> possible.
> 
> If there is not easy way to do that, I think just keeping the behavior but
> making it explicitly explained might be better.
> 

Hello SJ,

I believe I have a version that addresses your concern without adding
too much complexity.

In short, it leaves the tuners as they are and instead keeps
last_psi_total across a commit of an existing PSI goal, as the code
did before a68878f83ae6. The U64_MAX round then happens only once per
new goal.

That also covers anything that commits before every tuning round,
like the user_input feedback path or "damo tune", which currently
never gets a measured round on either tuner.

I will test that and send it as v2.

Thanks,
Karl
