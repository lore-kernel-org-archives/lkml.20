Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F8C3AA9D8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792190120; cv=none; b=ay3d4dbr+MtSoDpnjk411UhWEOCG61YH0x+BZr9RtqzMcFRXP2bX6ABMTYS+pSiC/h3C81RPZzeJ94QyxmRHRPujCTKiExJ2Ge66xwtAEYDHf5UUwg2Xt2UzsdBce0Y83b1xPb9T1PG6D1uJY2KJx/hSowjkP4O5GmFRr9pmKNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792190120; c=relaxed/simple;
	bh=MZ2Rq4/80Q7iGewMisCrHrq9so+ss6+rUrfgmY5SqJM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Nknvxvh40axu3onWfQyLCUUi8xd68jGS6kpPie8vo93R1e21QpnA2wZ/fYMWIJjCbJRutsCUuZ+81rcNt0UF1GU/Bh5ILRGTdWSL4dv2C4Fyp79q9QB2nssDP4WblyywHl+nBaFqIGK4PPamSoyjC6nRZz2LbULQJjmJ6YzifNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g54s9TNW; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g54s9TNW"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67999045530so575577d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792190118; x=1792794918; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MZ2Rq4/80Q7iGewMisCrHrq9so+ss6+rUrfgmY5SqJM=;
        b=g54s9TNWzspavQGAp9HpzwRgGUrHO5/UgOy5mJzAO6JM32XsqgPzwNiDQk2TFKskxt
         6tzVVmMZm8ZUaTKMGFTlDIqZ6PDL/Gzvkx7yVv4zOuHLRnorajvgPK9hJgRPuNS3aRL5
         pSO+cnYAHVqMVW6sU6y9rbKYc8XONBkwQkW4XXLYnd8fwlqAbiV7lZ4xHlZONEe1M1bw
         oq5w6cSzJPQA6zY4hefiSAVxXMjcZoDCKeVOgUFKScF2VDpzb8GVUadWH2c5ItayiZGJ
         l3H1G+XSM0w1ZqE/OZ7zFj6cRQfSz7CR6w4znQInYtj8KScXJmFlYQ0H7wKnmEPjm7LP
         tfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792190118; x=1792794918;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZ2Rq4/80Q7iGewMisCrHrq9so+ss6+rUrfgmY5SqJM=;
        b=inn+bRYHibJ6SG29GZPQ1+kjK/9E37VeoqCrtX8Yp5EdJPpr7BPyZAjr4Zwpc+m3pN
         Ndsr3q17Q90JAQPezw8IfYx8A26f3w9QMv/zsTBQ7Y5/srpagOGuyhBT7UZ8ZNThVrP4
         WDdq3EfWUVzlu9cLRDQQjYpLlBTMbXv9OscXmZRjUOSZIrY5cBj1sr8RKB77BBJrvUBA
         tVzrbAV/6eyDRRy8dUcnfXR7HGQT/qyPDiNlMRyb1MDoETx/j9v5nm6iQEEXjsGKA3dn
         JUCHblolqOlv1Ysp2AtMqdp20wD24fuX7Hr6+D5jwb8NuhprzgB4hd6mWgJZd0sqGluC
         MskA==
X-Forwarded-Encrypted: i=1; AKwUvBwDj89iisAeeIHw0gcG4p1NWCSNtCS+E6mDeXLOb/pcgvEa2p24dp1ET1cPyUMK8L2T0pUfaorKSbqnbw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWPnd9lg3I0OitNRGTrq69RPwV7b9xtbLnFnzUOAdmtR6/a/Uf
	kQukTUal/eAzQPltlehiA4zKxYg+SOa1OO5FaCO6kp9mBDlWmc6kkorE
X-Gm-Gg: AYBFou2S5kqb7NxtesstR1GIGrIHDjcSvrDK7VPtDGl7egQJ8OvTrzkXnLU2zGpXaWH
	3q+LY0rrVxNaWn8Fra+XRpaP0pjwYDA7sym5mYYrB8EcNYGfx6eSlDOeKwQycQzOFOL8AMBttlk
	y8M3RnSpRVmX6sxkKhfI8GP5CA3d7GuJG3usNhuFFJ+x2rt07fx0zosZ8Kl3kdDSpQ4sXSly1f9
	c/GW7rFtL5m79oFhCy+8cYcU5Nfju+aWp8nLXWSQmVaf5UMN2Xn4p57p3I/+4cEZf+twCukeCZI
	3ZLlLivHl2pdjkAQMnlh31JSJdhdPRDO9XdMTHMcI3slvbHW1vvlnKAuaGSPCzxqyPU7hcZXlJo
	NPgnDV3M6tuD0fJhtN0h/6AnY1N5pa4AJ3zRzNLzDErfCoHgIl6AvZ2W5CZp+Ncv++tk3lZ0EQm
	u71li6C3CQ90WaVucSc3oMdH/fb+MLzmRIlibYbSPxpHBaifZVN3qYhiwez1qTV65CYXeGBSCBS
	CK8kQkARWm8CtgQg/J3CrqIspBtdUquLP2qzCa2VtR7SdxETNGB/lULlyoMkpKOJmYGfgWv7PFq
	qsM=
X-Received: by 2002:a05:690e:d85:b0:671:70d1:d6cb with SMTP id 956f58d0204a3-679ca7f922emr229592d50.61.1792190117971;
        Fri, 16 Oct 2026 15:35:17 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1eb0b6dsm1651282d50.13.2026.10.16.15.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 15:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 17:34:44 -0500
Message-Id: <DM6MD2KJ8KS8.33P7OXVDIFUEP@gmail.com>
Subject: Re: [PATCH] staging: greybus: Align function arguments
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <pavankumaryalagada@gmail.com>, <pure.logic@nexus-software.ie>
Cc: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>,
 <rmfrfs@gmail.com>, <vireshk@kernel.org>, <greybus-dev@lists.linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <outreachy@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016063648.22795-1-pavankumaryalagada@gmail.com>
In-Reply-To: <20261016063648.22795-1-pavankumaryalagada@gmail.com>

On Fri Oct 16, 2026 at 1:36 AM CDT, pavankumaryalagada wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>
> Align the function arguments to follow the coding style and
> improve readability, addressing the alignment warning reported by
> checkpatch.pl
>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> ---

This doesn't apply. Are you using staging-next?

Thanks,
ET
