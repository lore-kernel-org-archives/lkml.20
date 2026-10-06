Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E7E35BDC7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266530; cv=none; b=uDLRCaEYEcP6V8gl/eODQ/yiaYbCEhFPSkWmN5VemhkTPp++womoWDgeCzSn5OrSaonSUBSJHk4Su7kxkpDb7eP5IyH0LLxij1Xg/wn3vklpiuxZ23+Jur9QOTujlKG5GVWsR0Yxpapm+GhhnYYcDiClAg+vA4avyO1nyUPtpjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266530; c=relaxed/simple;
	bh=dR8Qutpl2FyesqtcpPHIrzvBeE1WogkEGbe/5zasnK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leEiQ4fE6sXeOFy0UGyTzpNx4P1ppb3hs5ZolvHieove/g85BGK1zfRmaJOG05FFuMpMRWDWCEwq2NelZ6wNmf00RKQXBtG4CsN1ShtZ3GhwvIogo0bEspR9NjgBQ4shGTDS6zefBF5EokkP+OZ5CzKFJW8UGynw0kDtAQt16Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsBRq9EB; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsBRq9EB"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15756f82e8aso348117c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266528; x=1791871328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR8Qutpl2FyesqtcpPHIrzvBeE1WogkEGbe/5zasnK0=;
        b=GsBRq9EBlh+sIzt9KRSUZKSZWXAnJl0/haxyn/Jw7higFIWKPiaO/yFhfNyvIfnUV8
         rXB9QLzx6IA+BA4aosx58m+mOuLjJk8e5NHZIqZlHhS7wsv5qROY8zdm7/fT4TTmzuih
         SP+QmJvQg+E5ff/UlMPrKWqmLfZzyU/fiCRB/4fqTdQ3LqXiZ1NZYYvSqpK9GGiAzslZ
         rfKgsIxpNWNUvkWaMdGMK2UQImbX69OPS7Y/tDZZqNmCaVHBBQJ90kRAf1hIVPYHu/LB
         1U2RoUS1M154IcNNH7zpTELajRpcYIiP01VMEenKcrG/eKZlnpp1mrfxpI1q1glKWsmi
         UXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266528; x=1791871328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dR8Qutpl2FyesqtcpPHIrzvBeE1WogkEGbe/5zasnK0=;
        b=jLCCC4icdoJCPjrbEiASeVcn6snBfnmfDcLQ9+1SQjz9cpmf1lmlvJt2qADzAMrni+
         K/eFFnR+6EwwI6jk8a9sO67UfXRDlwNcBaiJggII4iZpP/Vsx5V1zPQhlUW0/D32veuz
         xLhBAo1neX3M3rZPG4S4FF0S+Nj1DARF1yf4ClsiBxl7MUmHK3cxF8u2c+zfzZzohLRY
         0d5TvHyHkmp9oqqxDbCTxNk1wH2gfCSp/hClgVw8HCMf/anGtj+4IyWNSJaz9Eazb4vy
         RUxWuJD9sETpGbD3iyisf55CyBdTASoSU9Cm7ER7RMONXiJIpzG1DdGpTr41LVJliJdI
         /iPw==
X-Forwarded-Encrypted: i=1; AKwUvBwB2ZSboRSzid7B9N72JFLP2wQ++j3O+8YFUhjnn2Ddi+AZnRDFOGqYJA4sX7KaqidXZZON+jcFsGHcv74=@vger.kernel.org
X-Gm-Message-State: AFq9FYID8Knfdr97TjWy3lG943vas2XKXA9bt88T0iDF9IijtuFxqyYd
	bYX/pjF1jpAgMP/AkuUaahYkNaW/UIcZFkCYiQNDTwaMjJ/Kpc8lTSLJ
X-Gm-Gg: AYBFou3Op2u3DIOv+2snPpVxyIMTQuqKUoduVA2KkX6sJBJTjeCkHeIZpE9tmVaXHpM
	AYUdcSLt0zpCgsXEpY0G7gUlQt/qdAvygnTt5OCbgUR2opVJhnu5GEy0Iujwc79XEpr8jyOcT+Z
	yA3NM0a6KLP/pPFHW20WTvuhYBa2qYcje9pNMZ/g4MUy9gIZlNSm4g+j9ChQiK17dAquDfGRVNu
	UySxypr6kCuEAm0RONDGeL/8JwwKxADfucfSxK0BODGvejU+9Dx7+mZFsty/u0D7BA52NHX3gyZ
	PYpnDPehi4PrQqza+csBWF8/OnnPMMPtkLlrdt2Q8o72/ycjvAOe+E8vqyR1rPakecRHFLx3qnT
	5OR7wWb/AMPMicaqd9hV3Lm94n4Hardq0e0Mo9zbI4cSX9lNt6kjdV+IZPjYwrMX22XV12KuLXV
	YOmN2JgTHQPia37Yluah1KJb5cq+TzUIIQVZujZzB5EbZc5CBKn0yq95QiAuq0rnTvlPeH98Sqq
	8b74O3N1EO2tKyqLzUg/mQ=
X-Received: by 2002:a05:7022:439a:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-15d302eb7d5mr2994502c88.20.1791266528379;
        Mon, 05 Oct 2026 23:02:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84523b6csm3799091c88.12.2026.10.05.23.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:02:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Frank Li <Frank.li@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: fix typos in comments
Date: Tue,  6 Oct 2026 11:32:02 +0530
Message-ID: <20261006060202.45817-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <asOtEhjOMXc9SVNP@parshuram>
References: <20260907063343.22255-1-hemanth.selam@gmail.com> <asOtEhjOMXc9SVNP@parshuram>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 05, 2026 at 07:28:42PM +0530, Vinod Koul wrote:
> This is bogus, pls drop these... If there are real typos pls fix those
> instead! This is not a language book, it is code, upto should be just
> fine!

Understood, dropping this one.

For what it is worth, one hunk in it was not an "upto" style change:
drivers/dma/ppc4xx/xor.h has "contoller" where "controller" is meant.
If you would still take that on its own I will send it as a separate
one-line patch; otherwise I will leave it be.

Sorry for the noise.

Thanks,
Hemanth
