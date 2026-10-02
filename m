Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BEA332EBC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968248; cv=none; b=aIHXZSmpYB8KuI+Sz5wfh6isFg47M2tY012mYHDd5yEZFQjO5DMPFwSL7AnQJaCD8KwYlkE9M+qe3ukL1z+vrmd7OQWl/otGoif7BKxU8aNEosMcbc4ObJByVWD6HH7syuAUytl7oTwaALo8P9KUKvwvwFXPCr9kP3Q54fxpOjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968248; c=relaxed/simple;
	bh=38O0AiYv7sXZCfgiUvA0Jw+V6OPDeMpifWbiiyBPEcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gYqLzP1dJbKYZaEok8L9Jzp9fqoo6Isbsy09njtL+liEbYM0wjhd6JGc8N459sffMzlCQDr4aODxgeTv4Dzu0zbDqNcv3tIO7g8PSkJ25Mt/GV+0xhSte32crTAUBvhz6Xh8Hn7/SHukffk5Dz+IDrjZHm4Loh3GxbL98TP8FU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O1s8x/Wb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i9tukCWK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O1s8x/Wb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i9tukCWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790968243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SqOef5FaraL1edtYgsKupndEumwwwfe19d9XZdXNw+I=;
	b=O1s8x/WbHLcJT6nmwv0KDAgyJw9/yYj7aTCHTPt5rFcx8UUf4oPmbM1+O5OOoZkBAPjtIC
	UjZ/IyWoDOQL9GCUSBD1EdZ7EPQn0h9BgkS6iWJ08r8A82VdcEBpw0+tJoE+ulYjF+QXqn
	EMFV3oOq5JmpIpCaZbJSrwRToaRk3Fc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-Df6B1ONBPOCJuvVHW_X0tA-1; Fri, 02 Oct 2026 15:10:42 -0400
X-MC-Unique: Df6B1ONBPOCJuvVHW_X0tA-1
X-Mimecast-MFC-AGG-ID: Df6B1ONBPOCJuvVHW_X0tA_1790968242
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so448133185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790968242; x=1791573042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqOef5FaraL1edtYgsKupndEumwwwfe19d9XZdXNw+I=;
        b=i9tukCWK8tTrAx3Eq7Gidiyg3HaP9rWy6Q+eoK4pCmG8TeZNn3vwWqkiemcK9JDZKj
         hWzXRXGsOwNR4wFxebn7mrUwvMvzDphDsEZyK1CaSW7YWGEZUSa80r4kI/efX8NNzy+l
         pjVFa4b18gBkFtY3ayeJynx5JO747j7BPHYMeKP4fch+zDDvinwSgml1RNiyBFVXLsmm
         o8Z0TMMSBbLUjeR6K47GfHmCw1z0KBHBbEQ7iDT73u95Z8L3YfkoO3guQ0KoJmwXEmlf
         Zmwi6hpO9BrLB7h1EXnygrb9ycKxNSpIQ44VZWz9LDdYvKKLy1FDK6moFiypnSlZZrSW
         Z6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968242; x=1791573042;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqOef5FaraL1edtYgsKupndEumwwwfe19d9XZdXNw+I=;
        b=UvwL7/tF61PN0ihuxlU5scZMpFj53Yh0kC4kWnLINvRO4JS8rowXUAIyFSroamffXI
         Fd95v3tOazrHV3/HjPnxANAo3PXyjXQCQRW6WkSPUqqcgOdpyijwM98ZUp2L2LPZyxN/
         jQXG8mxchA4bUgVVekgk1VGLezxGTzGce96bwowMWy60hsjDJfC+V5nuUVGd/8MiB6d6
         d2Qf1nmc+gRmeh/GgQCKQLRANlSdNWBMJJdhVH3LRSGi/GRWIkFBo9ToVtD0sjeEZA7A
         vYrZQMw0mLQ7uakS8goLelFvBJnkit4CG1pkWpkzvTyFKrQXQc2JiJ1AtLRccLA0fBpO
         IVUg==
X-Forwarded-Encrypted: i=1; AKwUvByNwdecgpvAjb7M/SWJVl4syE17pYNibbVQMueE2E0pszcQWHYKCczkaxwwc3LH/y+Am2igFVYuwmoWG8E=@vger.kernel.org
X-Gm-Message-State: AFuF++kgh6qNP4oqcaG+S3rUe8+L0Lnm8uJSKBDUM7HY9ZGdP0sap9AX
	hWe5p0S7aJzXlrpxdVF2q5IyPonMdWuh+YtooT7bAUmt8y9R4N8RCez4Q0evyyizLZCvxT6qp0z
	iUo8xWSj1BausEV2+my4+DfMmn1bnY4cJepNYaBj3+O0RY4zoNRhQirl3FDgoH3BG9w==
X-Gm-Gg: AYBFou0dxuVbyUUW6SvkGW7CwKpkMOVr5kJwegql2O2jrKwZViXYZSxjAG+XGta+qOR
	bTsP3C9ZkyG2nzNrPdpWwi3HxL/Xf7f5b8nXhtkXifuiUAIc4sghFZGkRDA/7NHh6A7J5jX41Yb
	QYqYOMPREwLufUwCqJjNfVdZP7kY38kDIsmKd57LiurCth7fmfu83SfG/dEyGzbRB/vXVYba9Jz
	cuaxCF2of56tnvzvvkTbMGJZ7cTJ65wWh/YQRrNa2LEMcKwahM5A6EdYn/RpJROkRmotlV7daDt
	baYzEn5l62S7nNz4lLdOf6a/9xME89AMx6DFGhbwahuFhPq+5zSNBo90pAiBgLe19JD8hiJu2mT
	B0nKaDxsHu8FyAw==
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr663874985a.65.1790968241785;
        Fri, 02 Oct 2026 12:10:41 -0700 (PDT)
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr663869285a.65.1790968241277;
        Fri, 02 Oct 2026 12:10:41 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e457a4e20sm177796785a.40.2026.10.02.12.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:10:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
Subject: Re: (subset) [PATCH v2 0/2] riscv: dts: anlogic: dr1v90: fix clock
 dtbs_check errors
Message-Id: <179096822701.834873.13625187278784966753.b4-ty@b4>
Date: Fri, 02 Oct 2026 15:10:27 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=638; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CgnHm+pOx1EqQqkPIiwdM7WFpAfZXzamTaQBTcq0Abw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIOMK67m3Ay+Nfj4xaHN4q8WRyRc17z+nwBXWfeqNKTg
 S/i4v5HdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRnzwMf/g6Vd3Fj0zZvYw5
 59vrz2JdzDF6dxfteFI0a+OuPs7sxhpGhusXj6rYutcsk9M9XGoSrvh16X6Tc91XZQUFWH/3ipZ
 KcwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sat, 03 Oct 2026 00:28:38 +0800, Junhui Liu wrote:
> riscv: dts: anlogic: dr1v90: fix clock dtbs_check errors
> 
> The external CAN and watchdog clocks are optional board-level inputs to
> the DR1V90 CRU. The current binding requires both inputs, causing the
> common SoC device tree to provide fixed-clock placeholders without the
> required clock-frequency property. Consequently, dtbs_check reports:
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: anlogic,dr1v90-cru: make external clocks optional
      commit: ca4983a301063d9cf8d0ef556883f90a94a0bd32

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

