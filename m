Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827462;
	b=ZlouBlyqwifJIig2bDrdJVZbbdK4C7VbzCmVc0+Ke4slZPEeeRCA0/AW4tq914oZo2x3
	 /d/huhThCtLmjelkt8cMGfnd+rSXC46Q2bkRsy5clhy0ZBibtFSpDDTy3jgt0Z+NfKnUa
	 wUYPLR/uA3yeXHFYwdJ/GzncgDO1iqns/fwH1I1R+LZP3dQTS4RYq8nZdW2u+OBD941j8
	 W/Qtu9JN15MHa6KuFcb2q+wT+2DcgM2ccHcfu2dlgmVmuH82sVKTuP3yYm+2VLNCLXGse
	 7WISgwDiT76BhRO7Ab/tppYNFgaDDcLEP3S/geW/9RHFgXt+IXstonIimzoWb+IRTUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rzDRDu7/JODZwbuavobSKTv49NxzFkRfd84aGaTT9+E=;
	b=dz2H7Oz54cNlNfJWW1LgWFOJDL92gvFRdVdgkZ0e+0ISw03E1uW4u96LLGuRLruG7/51
	 QIaZLgi5GnQD/ATAgqXcvGH+Ep8+8H/lOY95Jv4V7QfkbDq52uEcxm9flMbP1xoj6rvoK
	 M20Z11PeiSyNOA5vFTBpI9f6V0EHP/FIqQ+geT0O4fR9V8Q6JzZHD93Kkxxqa69I3e3XA
	 C4Ef/pdNfkkHTAd6AE6bhxEUIM/x8A70GQe8Go4zaEq7cWf/UwTV7a13qyD6uQUlS5E0K
	 LGkB8zBnCGVrxlzVGGCG55fjiVHsP23qniNILHg2pE+u8ili+QaK8I3FZOddMOUiURQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZtYDDyN;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA556083781
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA556083781
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZtYDDyN
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso34849a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827461; x=1795432261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzDRDu7/JODZwbuavobSKTv49NxzFkRfd84aGaTT9+E=;
        b=FZtYDDyNbIjuUUoA3QzBBqqfv8lLw3rZlhyluQN2H52/PSXZFPJPkFTfUMsWLpVcZB
         +/f7W3mjC8sThyJJEcQQ91j2NdvFAztL1ncVMMk6UXuT9opRL/PYqTvivGY0P89LqggE
         Y1/qTrI6JWRwkjMo5niHIqxeAFeDgJoU37ZmlzjAZF8T4v0I0JsCPwDaWCUdyOBoZxEq
         +HQY9SQaicWAwcUlZKP4H/glriZRjHz2Z8mMw6cahYt8YTsJF5t/75KMo9oWAD+f6PbF
         PFW+qoQp8ahdR1jTbstdRagOq1ph7sTAUAOrkMuQuTON7rNiDbqbs2cF9esIAzxWDE3w
         o8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827461; x=1795432261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzDRDu7/JODZwbuavobSKTv49NxzFkRfd84aGaTT9+E=;
        b=V6KF5busjDKlV7FybSIbRtXn+rvjG3UQ4LVEDb8rXxFaLUmKcKAn4sOTvO7zcIVJPO
         vEknUqB52zZRZSJZDO4VlDbJ9+bD3bkxETyADB+ObgoQuLrYbzHaYcRv81oRvNO9T8eQ
         12lZWX7fGbk9kqkuFt3VmrMmnW7J/gD3q9uqRagb1oiZkk6BvFQEtUi3QC2E0L8ZaUzc
         DUixBQb1En5RndOfJ+eAyAAd9E7xz+bCKELyoekZOnaSa60boGB+Nr5DkIrM90G+Stki
         DTOxdZBlsTmVWkIklZoe2dM97D6yNpXVufzmUa7HBhIZuALucZ0ernogxrnPAY+M269H
         MvSw==
X-Forwarded-Encrypted: i=1; AL+hErG/Ftf9HHwTLnB7iMgKdv2HRS6nDADrHjenQF8nTKmmtP1VtzhKSRiIK2r5Xv4wGLEf7wuXS20cBN0ssxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z86GODvL4fHA56hscZ6Kar/83cglKCE5BLqn+W+Uv7FsqhSGK4Q
	hvvFu/I6epfUFzdZAIdRbCVTPPiONCPbfHWUy5iV5K4tHPbGDXMHTmtD
X-Gm-Gg: AZFdTZd+7kffWdQ3hox3QYbU36Ucw2Vo9nQzQdmUdu40lGpzRuZ+ixmQch2g2vAk3oW
	BVXcy2kDxEeC6gxeo6RgRPu7tC41PSiNRduJKOxI0W8M22rqcExaDFN6kpqv2QR7hZlfXfEKZ8L
	lxo5bkbdcyZrijeIzgTPBHTqYJrizt4f+1sRx0SQkD/sxXJe6zLT6GsWdU16stZFbLUuSPt+6iH
	3WViRJsAJ5sKQqiRhjQoLkzHZuv/GBeRxAfnw/LBV+oV5UmpExzeB/xkQ9LIZWY/+5dLIm+9oP/
	pHM5FhXeZo/SqPBHFgK7Ku9WnyAeN9TU4k88St0vP9si5FabV7Js1k27DcpDGDGpzabLUjAuWqI
	dmgLuFX3oLubiGqrYYmf6A58bajA9War/I/UP7QJhhLvg8/DooNhQLX+9ogNC8qi6sqV1UlXglE
	3J/bnAXEt7SWzbAQmQXGiFAjU1zAESoJaxzADTXBSX4dcjYbJ8r6y7m9V2roFbdhn1dfgKqRN4j
	v4pQX9403sR667RUCscWMU5q6KkDuNi0SOkKF8prn/qfS5E+rDKHAhd2uLFBa66QCJF6zGI6Ban
	PIv882pbKj/uHi0XwQPe9LA3Q9UTeb3QePVW6h7Z9y0nb6S9Wt7R9zzHhLYVZXRsboTRQO6pH3U
	VQjbO0D+c9xpzAMY=
X-Received: by 2002:a17:90b:588b:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b1b09f37ccmr8454898a91.11.1794827461360;
        Mon, 16 Nov 2026 03:11:01 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm9162815a91.0.2026.11.16.03.10.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 03:11:00 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH v4 00/18] mm/swap: introduce priority queues for swap device allocation
Date: Mon, 16 Nov 2026 19:10:30 +0800
Message-ID: <20261116111044.28724-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMgjq7Cq5OQWdompBbEpyJTG3PhtdSLFUdb_Dtht3qH+u5HVhw@mail.gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com> <CAMgjq7Cq5OQWdompBbEpyJTG3PhtdSLFUdb_Dtht3qH+u5HVhw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Kairui,

On Mon, 16 Nov 2026 11:52:30 +0800 Kairui Song <ryncsn@gmail.com> wrote:

> Thanks for the updates!
> 
> Nice, but what does n/arm mean?
> 
> It's worth mentioning that the global cluster cache is gone, so tiered
> allocation will have a much better performance.
> 
> It seems the sashiko review is all green, which is great, let's hear
> what the others think about this.

Thanks for the feedback. By n/arm I meant the number of runs per kernel:
12 builds for each memory limit, and one BRD invocation. I'll use a
clearer table heading.

I'll tidy up the cover letter to make the motivation and scope clearer,
including how removing the global cluster cache helps tiered allocation.
Once I've collected the remaining feedback, I'll fold the changes into
the next version and drop the RFC tag.

Best regards,
Lian Wang

