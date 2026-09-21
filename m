Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BE1415F29
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006571; cv=none; b=S7AutDkpnMF60zVRURdgkJsvcI0fvN17htzZLLNfOKmMWof6yEvpNINjiLdm9FVQ6ojuLOv/zI6j7/2UENc7JGmFO+8AlZcdmi5eJmaDYRVDS4LwuESRqmjKu5Ut0H/oOr37cxIV2EHccVGvecL2Ik7jSIphBjF+7feL+daE+O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006571; c=relaxed/simple;
	bh=Ryakvez2AuPrHsciT1nsS1VZjsANZaRlT0oLyFD9r08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NqpkjpNrXWqDomHLchl9pLlcEtFSi+bSL9PYnKRkZd3ZtBr5EC4x7/0nzMnYjkCTTGCCBaF5Epwoaa2qBGYZHRqACogsSAYC+mUYp9WNtVK+T3ZYKGMY0CbyStSDB3l/C2xPGsk2eNeWZP85lhg+VeNe2XsPkCuTbdX6nZovGzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=L7bllr18; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="L7bllr18"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a856865so2901848b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790006569; x=1790611369; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKFRVCGIKTeJtMXkPmTO6NVYkX101OwB/yBvUY5h+ko=;
        b=L7bllr180MY+bK204YggwMGeo8DS4KcWI3LbqjGLDBRtpJ3HSzqmoR9SVVFL8BQoj6
         NfNNLx3sc0brurecgqfH+5PjSpl+ZEeKxl2cLBunbDgvZGX9CpqNxlgz1lpWIUMEa0gU
         xFhQI2l3AS0p47kpFmENPmycx+a6DhJeP3HzDGltZ8w9JkVOHIyTG/9gf/a3xDSjYdWm
         0EwX8hGTVEp27I99tF2Y8ms+eO7YIHqXJLju5P9wFI+oXcAThL6ZaiB4PRHiI/BBfIWX
         kicu0fA7urX19da4rUzJs2JIFh9Q+xaaEN2x1pIc9wnRfeXufZtmLrGuUGSuzQe4GYG9
         3U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006569; x=1790611369;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKFRVCGIKTeJtMXkPmTO6NVYkX101OwB/yBvUY5h+ko=;
        b=hZ0TqEaKXFJ0PpUyQ0Z7pGuL7iR84xqwzATn05pL1XYJGT+6TFuAkmouEv2t9dXG1W
         3y5ae5pubiJDpQ5HPE7oyKoQv/4kK1DuSiqjRGJQOXjXmBBx/L0bgEBqvRmed8I23n0P
         gNjGsNcQGFrTWAqAO45MyguirdHtDJ26A/MUSOm7r9ZgnmKqhLSuF94oe7AnFY+9dPGW
         2YnGdtFG3I9OE11uw+pQchh1fESZBiXaGEFHGxnd95dUlUmXDoSmo8qtWTZFd1WT6ZPp
         Yc5VKriDdXGFg+Vr7V2JWUmsQLecNOvF8VvaAr7nUKcA0pedpM+1f6MI95ZHWjaOG2nJ
         DWKQ==
X-Forwarded-Encrypted: i=1; AKwUvByxFc3Yswillo/5nfMupffKweUf7BZQlzPW/dj/YGNxjUQT1OsABuab8oOdPxZtgbv2bftQnkXsi+K5un4=@vger.kernel.org
X-Gm-Message-State: AFuF++kFtSUBkeiyo1WOfw2CQ8zarOLFE4NNqs5BgmGFTzsErE+0dE8m
	xClrCYxHCHPhVNyFIeSXTPYxP2Um6hdFRfSgefJp38URzoprlmis+X4/9EXn75Ehx/M=
X-Gm-Gg: AYBFou3OIZWHz5YTAhoRlyj13RMb9113ugc7FDxDTMUbbA8J8zJz/evUVcwjbOJDpt9
	NHfeSk7qxkUSq/fPG4/9V7F6k/ZPWVgox/ZGscrl/nqbi+xMwTXl0nWrQudYFsLSf5AHPpqkyzz
	DFbHdlqLRQEmF/e9fP3jAiGjVEARnwNa0QtQ83ZnSRVFt4M1iQEggkyXUrdWxFwERfjJE7ll2Cm
	ovzxTVv3sc33XJ6CO6i0wjVgOlHyMa2/BKpNy9rikqI298nsOVyz90Zmk4n/OmX163Hk+OJcJDv
	NIiDHPsFehoqPWfVKSj1rqzvzCMUFwzjLAL6lifabHc0lfHnJ+YltQiITZlhbkbTJFCGgn5n7y5
	tXxHWxUzfN622DSa+174E68ZgSeOHIAGM9KB5B3fwf3NcOy+AMCJonXi0ouL/tL/mna1foDnKy8
	YGTOwZHy4gmGxhKsxVUlekZ4FT9Sm7k7cPXo9uO3WWUUEIIxE1laRPvol5vieLfzSztfQ=
X-Received: by 2002:a05:6a00:7702:b0:877:b053:2e10 with SMTP id d2e1a72fcca58-877b053372dmr8630049b3a.9.1790006568844;
        Mon, 21 Sep 2026 09:02:48 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-877aa1099e5sm3480526b3a.49.2026.09.21.09.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:02:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones
 <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Kory Maincent
 (TI)" <kory.maincent@bootlin.com>
Subject: Re: [PATCH v6] ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by
 increasing vdd_mpu voltage
In-Reply-To: <20260917-fix_tps65219-v6-1-0544b735edb8@bootlin.com>
References: <20260917-fix_tps65219-v6-1-0544b735edb8@bootlin.com>
Date: Mon, 21 Sep 2026 09:02:47 -0700
Message-ID: <7hwlsed23c.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Kory Maincent (TI.com)" <kory.maincent@bootlin.com> writes:

> The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
> which prevented the CPU from reaching the 1GHz operating point. This
> limitation was put in place because voltage changes were not working
> correctly, causing the board to stall when attempting higher frequencies.
>
> With the recent TPS65219 PMIC driver fixes that properly implement the
> LOCK register handling, voltage transitions now work reliably. Increase
> the maximum voltage to 1.3515V to allow the full 1GHz OPP to be used.
>
> Reviewed-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
> ---
> I was pinged that the following series was not fully merged: the devicetree
> change did not land upstream.
> https://lore.kernel.org/r/20251218-fix_tps65219-v5-0-8bb511417f3a@bootlin.com

Thanks for the reminder.  Queuing for v7.4.

Kevin
