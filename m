Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26BD415B8A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199881; cv=none; b=NnR8+BAhxOSRTFhHVmmlqnkUjTHKcmOvEi+4jloReXcAHcdJAf240VLmDOHEkgrc6LNK+jTbmWJgq0VoD1sl1iaD/Lc2xlYF787xs/B6tpr3pXy13h1Ebt2bb3pDW0BWIBmpEV3cq3pxcojax+JwKMkTaPWaCB0biN89U/rbP9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199881; c=relaxed/simple;
	bh=degjQC+zjZgSfRxP9sOwOQK5Cf9llwpDDwc6foUp9Rw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mHJSBuNBh04BAWWhJ7uxhGqbU3K8h28wH1+76JhwWXqfoRKbU9Ke8WKKgIsMfTmUW4DGR4TExDv/x+P2OSpDmUfyvff/f9uvDR5sEBoKQsGT4rTLQnfrmWBSWQO86FMhQ9EMkixXbHFsZ/FCq6TBrQJtb8BqueFi/1kDFeA1B/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LozW1NON; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LozW1NON"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d71a50caa9so48362385ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199879; x=1788804679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auz+mSkwNmUJblKIK/SlZzO4mv+o8fMJykvfsBMXi1U=;
        b=LozW1NONM4DwW+QwagEX73asol810NEGPGl9L7R53qvFyqRksJeEMlLjwJF9xstCry
         b2VgKfqyo8UqsMfzLNM58HLFfRj5rnzZYxp9RQvBCAssXH40FeGr/KoZTxtCzAF7gwrD
         gBRxgDYwEyMP7Wa9BTa66ciCwsV1fuEcXWVLZIGIlq6ifeE4hBc9aLrHrOJV9kJQHUQQ
         5eGVtDmdQdxkDMhT4fuPWFGtcTHcOgCSM9HyGqWVw/QPb6M8snzfOECeBDj8qYsBROna
         Lg6FU2CIeCslLnUCd3FoIFm8+d+UTZOOlo+ys/RzKX34ap41iV4TC6CrmW5qckaYLNqk
         bhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199879; x=1788804679;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auz+mSkwNmUJblKIK/SlZzO4mv+o8fMJykvfsBMXi1U=;
        b=ITFtgHl3Ihqtyc3CbvfGVeuuLQUIquGab7U0jwqqibJJQHZL4G4pPxyTHX4r4Phlhh
         X5wdVG3VbtJBPfzUxPUZIjcjy47UrHh7X2OU1aIgr2O18B6c4FzR1srb7K9yT3U7su/U
         YV1nMKOVc/dLdfRqZPgLNfdM5/3LG2JwIoXLvykXjJO0vYJsUTQt7cV0FLT87S7j5aMI
         bScBb1mpeYyfaO9cJFt3O53PGNTocL5e71Y7Xt/hZef6GnNdbSLAdJFNNcSQ1oF/QcOx
         GQssGnH4tiu/VXW+8fB6U243p6FPmU9d3NkrLJI7/Q0LX4CoDkxsSErQgQbinSghCSls
         7J/Q==
X-Forwarded-Encrypted: i=1; AKwUvByA44H3oDlxfre9kBa+m1PEqKoDNsi0eAPmc9whMyhCA2X1Xrj5NZBDCrgifvFOgkGJtXZskqHynHncxuo=@vger.kernel.org
X-Gm-Message-State: AFuF++nHms07lGQqMMIScKeTf2pH0smaAXAezrzZ7jUKEYfus1kWnGYK
	zPr0ae0TRYFNasJJGe/ytULtRtXTfZSPZN5vxek6WeyDz5t+mc8E03IqmEVBLYIx0s3/OGqyvSw
	gLlnj
X-Gm-Gg: AYBFou2JjsDfDhl2JE4cQcBTi9Mf0AKb6epdbHXvZXr+6sqqD6aAf00rHvYOBQXvsu7
	kLv+Qtv5tP/vYRpl3s9t21gpueHguTnxCEDGNQb0+oKfJUGxrV5dC+/BJjChjP3LNJjo6esBQsv
	8RJ5viSR9Sysj83q3E7OuVFul9E2xfumwXNYbolC+bxavjWNcE68XlC2IBPCQiPluNFqzjqT6Dd
	sKgqJ7v6NeymfhN04gPBon0EGu6bqU2LDHAhl/R7HyucEHRJhpmIIJMF4AM0bWUWvuDy/t0xbPb
	wfVJZBYFKz0vgjB0mcOvpc8gcpG8Tnhg/QVJNLvLDQm0WfCvJABiBAtI508zf742oKEIXSOnD+i
	rS/9dlYcD4Y4WTe20P/QfbJeCaqPEtH44w78kBnFW2+AYspX6GzQ2gETYacYw78/qy4XYSUFUTY
	JFXpXBUXdboLykEnm5xVSGdATNFDIulnVorjHJUMPst17rqOug8HtBqAtVJA==
X-Received: by 2002:a17:902:e74c:b0:2d8:d4cc:5bb2 with SMTP id d9443c01a7336-2d8d4cc5dacmr273920805ad.18.1788199879349;
        Mon, 31 Aug 2026 11:11:19 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d7594ffc94sm39417335ad.5.2026.08.31.11.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
 m-chawdhry@ti.com
In-Reply-To: <20260719133730.3551691-1-egbostina@gmail.com>
References: <20260719133730.3551691-1-egbostina@gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: input: Convert TI Keypad
 Controller to DT schema
Message-Id: <178819987834.2869653.4643547927480344616.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Sun, 19 Jul 2026 13:37:28 +0000, Eduard Bostina wrote:
> The first patch converts the TI Keypad Controller binding to DT schema.
> The second patch updates the OMAP4 and OMAP5 device trees, which is
> needed because the schema requires the matrix properties.
> 
> Changes in v2:
> - Added 'interrupts', 'keypad,num-rows', 'keypad,num-columns' and
>   'linux,keymap' to the required list.
> - Dropped the '|' from the description.
> - Added the DTS patch, so the OMAP4 and OMAP5 boards still pass
>   dtbs_check with the required properties in place.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: input: Convert TI Keypad Controller to DT schema
      commit: 6980da9a69f59b3d061c317ed12d11fe4aa90386
[2/2] ARM: dts: ti: omap: Disable keypad and enable it on the boards that use it
      commit: 8d36324171f982c8e1d7f2df428faa5b05e7b1d4

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

