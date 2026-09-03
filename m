Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1AB4921BB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439008; cv=none; b=osJR+3DLeYcnvsxjiYGT8wShJjazhs5iitichJJ+yzCijLTYSWo9JWuKHEj6rBTM57Z/VK5abSwhiWTASSUogczY4bfB0gSSrd81qS1UmU2i5fexGjJPA0B0/fNPs5QVOwg96S50naJ3L+XsQ0uSQM5Ikmn/lh8Ww5FVZZO3zH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439008; c=relaxed/simple;
	bh=Fv0jj5bcuxEsIvZjyqFqSNgLYx8CZ5l6EULRDYLFhHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMnUX+pjGsaHh0wpHOIVobTNoGEtj8KbULoJK/O/n5JsEYixw/5Ltu4F5X9Dexn5Z1YupTe/Q2lCIujE0nRLePUd9xDQaMkwMTGAFt8DqTtMxQvB63A/o/blLZQ/R3aeUkap+pJWOQQ6ZSrjxCG3CLQhV9KzsUnwDsq/nr96k9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=DjggmBSq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="DjggmBSq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-484362f5c4aso2365105f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439004; x=1789043804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fv0jj5bcuxEsIvZjyqFqSNgLYx8CZ5l6EULRDYLFhHw=;
        b=DjggmBSqfEjor5fgztnvhO9V/ph5vfHOnBuf18jeX9Ru7MpOp64/dJDTUrnvmrV2uK
         whIs0VfyUG1FfIYiCrivwGcwhy2d8Z0heEs6L2d+/7svT6boCRltFKG2UHTvINfkZGvg
         MbdR8d96263xfp7hk+h18E0SITICwgYZPgJUL+rXFWlsa6sA99bo7IzSBfDaw5nKWPEl
         ErCqFafW2Q7Z+lzHnKlqPuKvxYSbMy+9GtDx9MytCMPqGKItc80d+js5FVeom08E7Ihi
         h2HV/BVHLMGaMw5qPxr5iyUhu8al0pFfRq9eyppX7+iSftaf115aK2TLWUrqOoml51OO
         Axlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439004; x=1789043804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fv0jj5bcuxEsIvZjyqFqSNgLYx8CZ5l6EULRDYLFhHw=;
        b=CBKWlq1Fuv6348/4eGWMnCa3mgH6tYapKiCwi5hUnaWcafUK77P8xoq3wwhSL3CKBy
         etXoJzi/zgNvTlWaO0rl9fFIolA1bqZ/QCqAry7kd3HLANGKYDg9NtYBGSjA1fK4vKvg
         IhtDbxOcrw9c7u9TA3JNGHeXdmvf+GKwd/lwAOsXtghM5Wky+V/PTiHWRRXBEUWw6072
         bNrW6k4qO/dwBvY/qZ6cNNaOAeNjdPHOa+bCDVforGTTlJHRgLeJV0U5so2iW4OdQnks
         +Zc2bFvchpVqQ0+SQyASKfPgDNUsoww1IWxqY9wzJcZFvzK1xTUUlHCDxxBLOcTdJgBR
         K4mw==
X-Forwarded-Encrypted: i=1; AKwUvBxwWrXeX0VlycNO4hLImWr5Ce7FDSUHSarV1bYBv25fC9LxOe1S2y0VcfMbgfCG0qmbSUXu7aFqI/LI/MY=@vger.kernel.org
X-Gm-Message-State: AFuF++kh9XcmAGButDpo0MAw65uf7yjumx6fER/qoqmOb+1uvkCkJGIH
	UrtZNO3q3oKHTAUtv9WOVgOsbRaafrazmeLYWx+dMKlqfFwCeqZW71yqFlNOEsYombM=
X-Gm-Gg: AYBFou25ih7GjyWGxb+yDnIVGKU0FvUjB4IUNBCskQA2zGiEofuGtUnlTuUB3RALhvZ
	DM+03TN/NHKavbCDEhpl+8GAIJ7GeQ1kFv25ROj4RHbb6+9pB9iRWaVPRD3G+/ipOHVO/LCMjUm
	Gkq2VYZuZ3Vmu1EL4QyzmiEaG9TjS8yFXp7CAr9zjE/Doy5eA4Mwma3O2HLX6jzzv07xpM8d+3C
	FH680J8zlls1iAxkQ1uQSLfWhCwyBdKkkeFG26Pb1E77eTomucKfHqX0+xCBJBFbMN0cnb0Fj/c
	db29U+GJGFZ0dpdRkXoc5/1PkW3PTLs4GQdi6esQXWdtR9BwWy8jaHc7sE8PSlRzBFoAkFEQcFE
	stSRp3OC4PyDP79xzJkOu9qFVcv5b0gyTfhJDa+jp9uKiFAHaH0wjcT7Mn4QGSn0cHVlI1kzCsC
	SRdNF8Zx1/WUcbzvQOONxeEMGCT4pJ4boQxD+xnxc=
X-Received: by 2002:a5d:5f92:0:b0:47f:8f8f:db74 with SMTP id ffacd0b85a97d-48488f06da6mr21869264f8f.12.1788439004237;
        Thu, 03 Sep 2026 05:36:44 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cf550sm13718528f8f.37.2026.09.03.05.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:43 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch
Cc: theo.lebrun@bootlin.com,
	conor.dooley@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	vineeth.karumanchi@amd.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: macb: reject an unknown link speed in the taprio setup
Date: Thu,  3 Sep 2026 12:36:38 +0000
Message-ID: <20260903123638.23712-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cb6da9c8-aea0-4740-9709-d718462481e9@lunn.ch>
References: <20260902080528.2211468-1-f@lex.la> <20260902080528.2211468-3-f@lex.la> <cb6da9c8-aea0-4740-9709-d718462481e9@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Can ethtool_validate_speed() be used?

No: it accepts SPEED_UNKNOWN by definition, and zero as well, so it
lets through exactly the values this check rejects.
