Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBB83E557C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751780; cv=none; b=f7e3aavNH7o9PoYA8daf/fmb4Vz9BIH313SyhGwXjze6hVwbTc2XT8ARNMVQEqQVW/Ghr4+7Me19JkB4tbq9y9xlFL46nZwNIBDz384F49JCdCnM8Fx7gmrs4rA21/06XP2KYnW+s/zNuEuFcnVABUJk+XJNWHi8nE1lVITbdI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751780; c=relaxed/simple;
	bh=4Ckj7yFMx95H0KCiSg2hcbOFSkLKQLaM1kR53aZiEHE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=MSp+TI3WhTqk7NTQepmJetMeytlDguJVkDHvUt70L0fiAhKoQlKc0BiMKhIQySrPF4Xrg3GLg1M7LSMury5EAnk1d6VOz5RtAq8si3BlFiwQJZ8TB2Ssgeiegzb7Uf+PXOiCGmBaMi/iXxlrh0XeIYnT08ZKFe+bg8teQ5H0ANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg18rsmM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg18rsmM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6f9e2f681so33674175ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788751779; x=1789356579; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tp0aJukw+a3PhmBQFaWxFKW7LFV2YBDjGrDn04/gkFg=;
        b=Jg18rsmMNVbmVr1LugX8rWYlu2FQpdkSB2wuT67xjhX3SkNDOcshABjJiKjWS5reeC
         g6osAXPF8/XsqZXrDcqOwLsMU38bfGljk1Rcv+HHkEA/nGJBUChgw04yyN16CnGAGhvq
         yz5gT9V/yEeNWiQLB2DProA9EXu+MTfuz4rJaTyRmTsckd8Ebj59zXuTbzI+DrYA2wV4
         wrbYA0xrLmJp+iQTEoXOv0CFjedKWGvygCCqi5of7f+GvhPfP1aqKCJvuu3xk+jVk3c1
         yYlxUKvE+yqke7qtNwpaClQgVuBiGWMP8MVYqX5gIrNzOFW5ZkuECXqg9uhEZTfLAJA7
         7+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788751779; x=1789356579;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tp0aJukw+a3PhmBQFaWxFKW7LFV2YBDjGrDn04/gkFg=;
        b=B+8kOVkUVvTnJg4gzZy6AGBRF753VQ8EnO87148tdJSNESqilpGMcynr3AxnHagONe
         D4PN77qUfM8gzWYOUTUgteOF1paXuSmPbSv1ek2tX2O7NdgiSj7neWvJX8dEcL3R1upF
         J6ER9PhC9EscehHeqW7T1RW3a6GUWEQLVSxaI2fXlwxNVbEvaIUoA2cHr2s+pAxomteT
         J1k5BcI9Xi5N/za3aSLD2TT6cA5YRF4a/4AIgU9cKGkcShnqwiSwFP3Uksn+clI1ZRR0
         VZ+RHVDnPWmyfjfYqr+Hg6IuTRPKB1tgQNjvYyBdRube8iCOsIUbSCpNMEEjCSUWfPji
         PbpA==
X-Forwarded-Encrypted: i=1; AKwUvBxxcLOqXjHglP3giX/ruLn+Vb1EJ5tKl/EQfOaxZtd/x7Qwb0qp0e2rgYNXcJTdhjPTegiK5LVAg8YIVlU=@vger.kernel.org
X-Gm-Message-State: AFuF++lOGL04WKtlztF3x3daKuV2n4f0tvIxuauOrbHjENV8Gz/IMzBJ
	t9lOiZV6FIzGyKvDjCmaqt75ssab4QSgt5tDE20IrDOHbGaLQ3m1LS6DuyHWESZv
X-Gm-Gg: AYBFou01GgvjIlCmBp4pSH8D3SMp8YZgDFP3VhksBhqWROgGNktJIrXYNHm/rpAZjvp
	zCREebc75dJAN0t7FsRYZDevzU9oOvg/mO+Hc+/rceBdZwhdGZ8I5zZAEBoLsZGJDE5jiSHeO31
	h11RpSWVH5x7RV69ullkjJ0JMRvzZBk5NUlWEjsKWR/s4y0DSNLtgHqAPtFxTk4m2vd2BoU9rGN
	q7YA0YrKHxcDIUj3ADDci1myxJA+Wqn4SP4+00prCJCTdrjLnwKqVCdQTjp3u4Tiy2lWjwryVKZ
	xCUTIQvl9SppRhcXpWNCZQ58YIPBdijOpXbUviNvPtm6uh8IesBn2qhjy1M6FafsssmJgbK0NUw
	eof5d0rblGkGWwV5HEsDVKBAZHR6gkGE3zlugjZUJGzQEeUN8DYAazvFom0QPSWTbcRO6ud9YHL
	nxx0tksn9lpYieRw6Ku1tw3wRe0qdJk/eRnbVCn2y3cQg6P7nZnBk5luKse44f4wpvM1B0PQXq7
	t335ezw6Z/AxhFjgtVhRFU+MYvFvSBQwnTlZlomzBADIA==
X-Received: by 2002:a17:90a:d44b:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-39b26203f11mr32745749a91.16.1788751778701;
        Sun, 06 Sep 2026 20:29:38 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm6717453eec.5.2026.09.06.20.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 20:29:38 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: powernv_flash: fix kernel-doc for powernv_flash_release
In-Reply-To: <20260907004821.225576-1-rosenp@gmail.com>
Date: Mon, 07 Sep 2026 08:58:19 +0530
Message-ID: <ik4h210s.ritesh.list@gmail.com>
References: <20260907004821.225576-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Rosen Penev <rosenp@gmail.com> writes:

> The function is powernv_flash_release, not op_release. Update the
> kernel-doc comment to match.
>
> Fixes W=1 warning:
>
> Warning: drivers/mtd/devices/powernv_flash.c:271 expecting prototype for op_release(). Prototype was for powernv_flash_release() instead
>
> Assisted-by: Opencode:BigPickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/mtd/devices/powernv_flash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

