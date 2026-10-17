Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC344CF497
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792277185; cv=none; b=n7GnrQqjGSOLK3gSQPExgKwRPJzpyNrP7G9elUpxP45i3HEn7Snv7TMrfIuFl9gCieFENZ+oEz2efOFCPCWtOQBgTF10JJAt2xDwaZG25+/uxG7hdIVLdFmmhfh/lATldYYKNlYO/c/xjA1nPEkqv30JEAIyun9MFSiyvEGbQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792277185; c=relaxed/simple;
	bh=C8m61NFf8DV0HdCB6VR2Qlt6ovIESt7TWheyDFaimvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXoqI4fl/ad9UbalwTZXXpIg8ucdcw1B6xxUKBHoDa4GdHBpQclF29LVpm2fjSf9lC2OAdfZ7o+PDBacyO6EXwgWXX2S+CGs+MrKQBsUZkTiDNwqMNHvaViPrhQtzxS7VIzfbjZkdTwZIkAyP/F1QSiSmyARWq4rRHw9LbBpRfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQXlom57; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQXlom57"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3aafa3e23e8so5013871fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792277182; x=1792881982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8m61NFf8DV0HdCB6VR2Qlt6ovIESt7TWheyDFaimvk=;
        b=pQXlom57F9xgWExabl30DX2RdB92r3gPnAc0aQJp/sEd6EQSgei+gz8aPgQVlyPPaP
         2tnvoc+xjvkIkt/lTsrzXKUWsFEUkQSLnKjOgEZHzsElPYSa7vGRhkxeU3vqsPWufsJV
         MX/HPjqGbLyZGA4Cg4KId+MJZURAZrR2JeWQB7GLshcy8INfeOYXCE3EQ/RRbYyqWpr7
         kfoUyzOty7m30EEITQui16/0PfO9SuqdmFQEv7qFyDoVh65RBHAzn+2sqSDiLVq3TlQV
         y0wXGny83ozhT4hDWuTo+ks+ZGWFUl7om3BzsGpIenRz+jS2aeyRrt6J0bioA5hPEbHK
         3QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792277182; x=1792881982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8m61NFf8DV0HdCB6VR2Qlt6ovIESt7TWheyDFaimvk=;
        b=nj6A6A9sWUh7BI8/7cYGoCS+b1BCbIJw3imzL+7O4vHyWSygqfsKb8ItUr2M04bryE
         oBW+g6gRTvJ/sjUDbp56ntdkydPMYIgAMkzAr2GGN0dpLGoG9aL3lzmOtzGvHZ0+kerL
         047m5HLnhuseGvWmUWInyFOmkEgtBLGFy33Pee2p4yEsrkXtY3vNaXURZ+SarK3dfciY
         OAT5DEc+S8xdTbWxNiCO1PgriyflFW1iqY88gVC/+lJjkQC2EnXeWhbFr9xaVlbRffkq
         MRmU5l5tbtUBbNxPsV7E82QN419wl69cm/NdyL8v0bQZZH9tUNbizthCVM+UoUKaYJjH
         DXRg==
X-Forwarded-Encrypted: i=1; AKwUvBwaPEL35xjHpmZqs+sMMF4ytoJicokAuG/7tF4gsd0s36k/jwizEC+7TsXXq7gK7MGoDSAaOLuRia6Hbjo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeejE33DLOJH4lsy2EOvnfVhaz1wPl9hAx/ejaZ4N4Up0sv+d4
	cTPb7KrQogtZlKkZrjEzrXnV9z4J4Ro1CIaPZfq/9aLH6B6ET6Ve26RD
X-Gm-Gg: AYBFou1MUlgeFKdnu4dCw9wjguTqoFb86fRnGLaIH6+XgoTvk5avMOAq1bbQNyJL2Hf
	XB8/JbRPDXDnl16hjchhmEQSAdDS+0SjDAYB0VmObi2bEH3IAujeaiTomWO4WaUEJlKbgwaDRAc
	g+zABgC9EzfC6ro/edtYYdYnwZkPrco8W31Q1mVascIVf8M1axXuYaUkxR8WaRQuP+xcVvKTvNJ
	avZrecvrWXPZMgEGGH14JivaFt/MJuth7C5xUe5OMnKe/KKYLUcU4T7ro7swf4t1hyNcAeJ1LDH
	0kqw5jF4/w4YlSB2TvV3DmdxoFuzdRs8/1uOwXzEVFy73RfFa49jNvpnaqejDLzlsui86isslgJ
	nLH5tLSoTlP9QL+DNClxQgu0w1GNdR7ymw8adIWtgXsGuTCCYcRug0gfUn5dTppgj/tokAJD676
	6yqcJQcVdfF6+mtPqaMB0Kl4MyrVHbClwvjZuE1uOFEC3bACP3RHhEVxZfbzfmhAA=
X-Received: by 2002:a05:651c:1986:b0:3a7:812b:cec with SMTP id 38308e7fff4ca-3ab28e59f8emr9041711fa.0.1792277182044;
        Sat, 17 Oct 2026 15:46:22 -0700 (PDT)
Received: from quietus ([107.189.24.213])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16e43b79sm16786741fa.11.2026.10.17.15.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 15:46:21 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org,
	rillian.grant@gmail.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: flash: lm3643: Return to standby when the last output is switched off
Date: Sun, 18 Oct 2026 01:46:16 +0300
Message-ID: <20261017224617.430992-1-koreev.r@gmail.com>
In-Reply-To: <179198511712.839288.17752967041610699661@kernel.org>
References: <20260821083620.68324-1-rillian.grant@gmail.com> <20260924172040.1185688-1-koreev.r@gmail.com> <20260924172040.1185688-2-koreev.r@gmail.com> <179198511712.839288.17752967041610699661@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lee,

On Wed, Oct 14, 2026 at 04:21:51PM +0100, Lee Jones wrote:
> Given that the base series hasn't been merged yet, please coordinate with
> Rillian to fold these fixes directly into the next version of the original
> series rather than sending fix-up patches on top of an unapplied RFC.

Rillian already folded the standby fix into the driver in patch 2/4 and
included the ACPI LED description as patch 3/4. Both were included in v2
and carried forward into v3, posted on October 11:

https://lore.kernel.org/linux-leds/20261011191026.149338-1-rillian.grant@gmail.com/

Please treat my original two-patch series as superseded.

Thanks,
Ruslan
