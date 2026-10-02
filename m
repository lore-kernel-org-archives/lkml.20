Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61FD4E01EB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953720; cv=none; b=oMb8VtXSe8wjHFxtPvGXKxNlH1VpkYv+FNZH/4YY1pXg/58trp2KT0DMVtDFKPj86a4ayqstyAQtL7ArSPyBNtvEaCy24dC3HXrxSOTTjdkdJ+b7xTRhJTRltV+GHdGgHLHHVpFy8IX2ssAr/THlIWbv3ukBpZ2RoQAREoiLQEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953720; c=relaxed/simple;
	bh=nzzaG++30e7eP7gzQKASjcC/CQNsfJv4ueyQSdSfHAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J5bHukZvkzPq9wvqxNeoeQQAHMd/Psy9QYt3DrvcSRDr6HWpaRhvaCQD1kmQOl+B9LvOd1Kqa5u01tdPqw919mrxKB94cScucghhbIGV7hK2NrU5M62yqoDNl2FeeJ3HDWu6OwhFvhdIOtWC5TGgYuBd3Fhe2ENtxAKCEa5L1bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hcjNzQyv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pxalEcfV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hcjNzQyv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pxalEcfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790953715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LD/A3nglaC31jBIMtUDrqXBiepN73OFs6DJpCa6dtO4=;
	b=hcjNzQyvwZ9C8YvtW9BjAHysd6TJC2aKMmAt0nemkhqbbFihs8FP3vOuVT4YzjDFTO5+lT
	gj4U+eVEKihypyn675/+IDDtnVpNQl5gp0SwyJ3hPORx4RXp0d7qicAoFd4PVn6V7tzEJT
	tCuCkYiyFmwvs7DAVUJu5KZXrHoUm9w=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-jq1WDEodM2Whtx_c1rlDZw-1; Fri, 02 Oct 2026 11:08:34 -0400
X-MC-Unique: jq1WDEodM2Whtx_c1rlDZw-1
X-Mimecast-MFC-AGG-ID: jq1WDEodM2Whtx_c1rlDZw_1790953714
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so154314321cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790953714; x=1791558514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD/A3nglaC31jBIMtUDrqXBiepN73OFs6DJpCa6dtO4=;
        b=pxalEcfVm3yGOi25gW2CcXzbBeRIeAPEiDSMAhlUHO22Yk7FY9wUlTFHCsC4SLzp4S
         LuMoX/5ivXPdLdWJzh9HlrT+m5pm+Rd+VtD0R358zXsAqzsFGw/15Abbp735wiVQX2jc
         e/+5hCSEeMp+JyTcmJqcRrE03fw3fUmAjnjDX/0iV1WTfqQi+eg3FB7HL5qBXvMJVy7Z
         71avtjq5ZJmMWqDPEvdxlsVl1jEjsLYp7VdkVVvJM3zyTtLmdCn9v+t+neosZEXoohgG
         COD5m6GRVIwnXR0Qhx0RggWz0kI0tEXJjvzQbnWQxhfIChnIOXV/5MlPnZDQFoWxKlmQ
         edTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953714; x=1791558514;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LD/A3nglaC31jBIMtUDrqXBiepN73OFs6DJpCa6dtO4=;
        b=TwvtYA2dkWz5VvJxhURftZOrwq0/qoEl5gFk9AfxaUAjoe6cLzuoRuB3rbwldTT8kl
         N4pcnw5Ui7OtuJXaD5cQm7sSZYjTfIQ0hkQJcPZHu6yfcL/7gWBazPSQX3QSCOvmGxg0
         568I2hVndFiQn/3gyiDwYiK03kh4vS6PhSONwx0UazKi80LuN4HhexhIwQdEjrvPNs9C
         s5RJnbeN1zNSw5lMA6YEBBZNWUTsFXkAVOnEdilJyjAljOfJylAMGqKGLTAjwKhcJQ89
         HuQKHG3E5NNhoR1jqZPxUZN7m0hXy6jijeYD7D9ggBAVWUq2R587QgxJK1exfR5cUA7U
         bhxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxND7gQ/KCDFPXLI0aSPpCNgt6s3+poK/TEvm5f4vzVm9LTV6u2Ftw8HynbVrFSuj8T8zjm3Er5NJOLcVI=@vger.kernel.org
X-Gm-Message-State: AFuF++muQ/h4VO0EPM8Ye9qMK4/V9ZeYL1maouvgigzTDf6LFPEc3Gui
	glSPFBuaRKTGnr5LRdAQ7SOiizqfKAV7auMcVaQ992OpnhKEKLMETYxkgerwI97EqIXrjdOoEzw
	rT+vylSgH/NfD0gmNHMKFtnktUoAtAhWGYlRJuR7eW1uUz2rnv/Z+ShhqF8y2bodUxw==
X-Gm-Gg: AYBFou0IDZs8GhbvLds7RsU2etMTMW/kEEMGlfYFOZBncVge/l57j2eZdUatzKBVi6Y
	p3Q9mzKTSQUeiD8PNnMlbphycQVbQvWy+9ITJDj++VVZEWqshcdIApSFYOzT5a6XgafPe6oCOAw
	SMITsmYGiOeSvtgRfVl2hRIWJdMUvlIcE5zi2N/PLgsNGGIvEXqcXxpS7sTRr50pOHWa0qqrAqk
	SIJi0AWNJhCEsaHF1nz10n5JtfqZleWq9Xwzwtwvc69VL1HJguF+T/YGxHWbU0ZNO9YDbZGq9n3
	7+075z8JO+duDg7Z1TOzc7QK/GzKs+iohIz9lYAMtkMjmHaec3DgoIuCL9ZcwFfZDpSeGp3fi2L
	lrJmzN5OWuXv5wIH1jxpbSdAEYVLdSgIftXNI6z//sZvhKUqEQnA=
X-Received: by 2002:a05:622a:1353:b0:533:3610:c5eb with SMTP id d75a77b69052e-533d96b6966mr49792561cf.53.1790953713805;
        Fri, 02 Oct 2026 08:08:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:533:3610:c5eb with SMTP id d75a77b69052e-533d96b6966mr49791681cf.53.1790953713259;
        Fri, 02 Oct 2026 08:08:33 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d128ccsm27596841cf.24.2026.10.02.08.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:08:32 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
Subject: Re: (subset) [PATCH v13 00/13] ZTE zx297520v3 clock bindings and
 driver
Message-Id: <179095369547.791677.11922932020340915175.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:08:15 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=LWMTx7OVyEurkrK8gxvgvVLf0aBDX7nOCsHhfPnuLAk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2n3j1sCJv/pFzhTZJnIp6XLMW1T+Zsn17zf5NPhp2l
 nuniVRzdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARdn2GP5ylRUdjm2eldZ5u
 XD5jQ+j9xzleR9dJh/49fXhFlVPSDB9Ght0/fk9fsCKpqrNG5anMU3n7TWp/uuXyZ0pIxLpUpGv
 P4wMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 27 Sep 2026 23:13:28 +0300, Stefan Dösinger wrote:
> ZTE zx297520v3 clock bindings and driver
> 
> Hi,
> 
> I am sending version 13 of my zx297520v3 clock patch. It addresses review
> comments for the MFD driver but has no other substantial changes
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
        commit: 9b9e5daaea8febcdf67a656e76b3a7e1d0f2290a
[02/13] dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
        commit: 3847bc94d1746c1448c984338fcfdf1216db0827
[03/13] dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
        commit: 4500e2e361ecba42cb1abd6f6891a45d99f57741
[06/13] clk: zte: Add Clock registration infrastructure
        commit: ad5107a88e993b576b01761c6560e157519e0f84
[07/13] clk: zte: Add regmap-based clocks
        commit: 0f973ffd1038e2bca5ad89279412a508df62f44f
[08/13] clk: zte: Add zx PLL support infrastructure
        commit: 77732e66cd47e849031e4fc8999cbff0ec958deb
[09/13] clk: zte: Introduce a driver for zx297520v3 top clocks
        commit: 392a4957db5c2f2c37bf0191d9531710b3080dbf
[10/13] clk: zte: Introduce a driver for zx297520v3 matrix clocks
        commit: 4ea299afff42c6a09eb1aea1d29c678c3374b824
[11/13] clk: zte: Introduce a driver for zx297520v3 LSP clocks
        commit: f8a3cbf8678ab80d3aba5918f2f5e1acc1e7287d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

