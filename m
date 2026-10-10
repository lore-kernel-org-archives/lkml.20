Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E3E3195FE
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629667; cv=none; b=YKeweTTYpNZfvqdOE73rpAJzUEUkrMVyx3YEOPVz8jWCui87swLtP6Zjsm+OOzOa7lXrxtgXuAxi2UzP6ecN0tQ8humwnDSxQDVGudvlgOF9PYt1+jlm/0SYGuLQiqZBmxRblRIDaLeNrOsuAmbpFN3H8kFAgmy1l3xe8quvVoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629667; c=relaxed/simple;
	bh=4W6Za8zSDAqEPJR7i+x9GYTAmuRutHQ2CObwAK+Xt9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=be2TwAAkANfM4lnDK0kVQdmt4tx1U3DFr346bNOqzmU70cef+Er/lLuy0WHb7jHMDTFBRM6wXtEyQbEqUtqqM8saANjaTfjtoTj0bfmEzXy2FYTBq9jnAe8jl+WXyhCCYQNsqxXdhoMVcrzlwj+dhOcr8WGUyqRBZ2+Hul/IUC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZaVbemD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZaVbemD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso200451b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629665; x=1792234465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=khKL+0SYs5dkK1+NiD4FsLQAnzmLgGQHJt1q1DjIuc8=;
        b=OZaVbemDAkhPiEJJHZpoS5nbWbMAjZmkEA4Dc7cpjANX+y2gy8ibUPFjV27Yw2Gqcr
         LG7ADy4XS9CF8RDvdKZG1lRkifDipHZv7ydwEJTq3bTuoV0Df19WkCcF0a1ErrCE86rL
         4e7pGe9KNtASyD//rFKVtKUOX+CFj2q2c47lBkL8Oz+AX8u1ij+kTy+ILUKyZaqsxbHS
         DBEOf+7CEMahRVXXZmOL7WYLn79jrnf/KJTqs++L5Z9pw6syV/zsB0ZlkR8jwfnGh9qg
         t9k9ZpWE90BIdsNSWKO8ecpwdzDLKkNX00xR2Yx6TNUUQCrNQE86cUnGiSbS2fTVwUkT
         WvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629665; x=1792234465;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khKL+0SYs5dkK1+NiD4FsLQAnzmLgGQHJt1q1DjIuc8=;
        b=oOJWtQ+VWy6ErVi1B2ArzxmBbEPtZDmqAxGb4Pn5EqU6izRJzeFsEshqwFCRdjEkRr
         cUcjcQPDcQS4tm4VO5c8Ci6m3tyQAH4neNLevzF6G9qaXeFhqLklHipfneP/OjzsKVTe
         aX4lTdFcg1LysAHMC6hwimX5z27EUOjY5+ZPyIpII6NzW2g66qXGPFpLwUS4xU97sNRG
         FhF0ZfVKzHaJkStBlY3FIDVvT2zdxh2qCt+9YZHqFMDHpFGwgv1lHn3DjiD+of4bPYNm
         745d+liEuE0SAnQLXv1hxm3vvmWGUc4enjkm5Y2b8lvEFUKWvPEMgVar8yy0cFIsebFW
         cMlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKTYy+I6Dc0SHTfxUQMZmPBMcD+Wf8v+fbKTnVS/zFiwqbvZwBoxzUUOG2CbE/fSNLJNfnf/4dggYrzhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVEOQdWuNOS5r0iSABC2YT0AyzyrfVWmLvUCKdm9JD0k9wh2nC
	Vt5oZ0jEQsFc76xh5Iv5ozNXnTtFA/W4X+Kdu52Mn7SzDV5kZdPgE4rd
X-Gm-Gg: AYBFou0606W50ed8MzMmuoXq6FOw0+ZN8ysYx/PHD+ifHBfa4ivSrbVg/QplRkGKTnp
	8chzWN8bbQsVrJ3rSFeR2JDF/dzjXL9LKj7anT2b8gBav6zrjauUgVc8ryOjBV/1HXLvp5lvZFE
	eWX2C6CmwTHGgemLZCJpFKlWAZtwi7XbMK8gNVn3vhj8GskjUCNqR7TjH36WIw8MeocnxYt3ia9
	693Cr0Ds37x3WtH+X11UCf7CV4wuBVHjC6hwKpZpO8XBTx2DdTxmPy7zYV53DkeMiOtkq1f+HyY
	HYucqMx1CJvKIMhmTqSCtvoINodzl72lm9gq3jWk9tz/V8BjGuaOQNK+udWeqOoC/tZ2vE/SBt4
	avOZ5hZsYmUJU8yEAkEFdY/2/0EslwMaEqDrQh7MzpzASZWxLIkala+BBAMAd0sEMirA590zD9p
	UugnJEqUHamHjpLHkwHdiAN8Nt4+sTqAcLbcnuR3MeO0yOL27YLdTnMjpjptONYOWSNCY23a1k7
	ufax9TVDI2TZWaxfBEtTk/Zb01MThAADRvshPvoGFpnfw==
X-Received: by 2002:a05:6a21:485:b0:3e0:de4c:71ef with SMTP id adf61e73a8af0-3e16bfcd468mr3602361637.58.1791629665376;
        Sat, 10 Oct 2026 03:54:25 -0700 (PDT)
Received: from macbookair (n114-72-148-25.mit21.act.optusnet.com.au. [114.72.148.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4996be6sm2203965b3a.58.2026.10.10.03.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:54:24 -0700 (PDT)
Date: Sat, 10 Oct 2026 21:54:16 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Michael Reeves <michael.reeves077@gmail.com>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: Apply existing Apple CPU workarounds to M3
 and M4
Message-ID: <asoZWBEEEsFD5Qrn@macbookair>
References: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
 <20261008-apple-m3-m4-kvm-v1-2-7bb4cbf3d63b@gmail.com>
 <86cxtk2utm.wl-maz@kernel.org>
 <CANpmGNv4uYRLALMLKZn-HJwTiqJO90Fx23DOO7K7d-PfSWn=2w@mail.gmail.com>
 <86bj932ssc.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bj932ssc.wl-maz@kernel.org>

Hi Marc,

(Resending because I forgot to reply all, sorry Marc)

On Fri, Oct 09, 2026 at 09:16:03AM +0100, Marc Zyngier wrote:
> On Fri, 09 Oct 2026 01:03:57 +0100,
> Michael Reeves <michael.reeves077@gmail.com> wrote:
> > 
> > > I can provide the binary (and a few scripts) to test this easily.
> > > Should they have been fixed, we can always create a second
> > > implementation list to cover the PMU.
> > 
> > Can you please send that so we can try? That would be much
> > appreciated, thank you.
> 
> I've sent you (and Yureka) details over IRC. If you need help with
> setting things up, let me know directly.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

I've tested the patches on my M3 Max (t6031-j514c), and without these
patches, it SErrors, and with them (and including the M3/M4 MIDRs in
the has_vgic_v3 list in arch/arm64/kernel/cpufeature.c) it doesn't
SError, and the iso boots correctly to a login getty.

