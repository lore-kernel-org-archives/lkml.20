Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0347534A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932559; cv=none; b=ldwm+qBVrrX72c8Lg8Y4ROcSf5Ilp985RQUM36HyysNunTbabzrvIIvb6a1FrZfHLfXOBPeNJz0k1qDo9nr5Soy6yp5MHDgif3b9WHN3nRswwYLRlQ3D8LwXqxrrI80+o8djbgonDrjgb8XCOnkVG9gRCtwIa7ua6hQt3YgAI84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932559; c=relaxed/simple;
	bh=RVJuTH9dQx8sPj2A0T/4W/YMqBB1eS42ftDLNOb4H8E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G2yOFvZ/Q34O0Gb51AnqmS+YeI/WfgPrYViA9Z3GIVnmNon0utDotThhPUSpBrM1vLhyNy2CcXenGliNoHLnAgeZwDUilRm+nEgufLk2RLf0gQgWb04wV2UYKXpel/q8jrp80HMa1m46TQkbpOtNGEiG+7uJVPe1yweuFpQZpKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+92Yi7h; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+92Yi7h"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af929e59dso2722010f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932556; x=1791537356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jRPrTGUlYlRMvJF+ftPXWXm2emGl+fkBUfXA6bf3Pvw=;
        b=H+92Yi7hVudwQRM/kXkv8j9Um0hz/nUEC7552OqPS+oUYhSotJdckR3vg+ioBISYZv
         0MQplvrETbFoMPm2yGtfbiha3WQ5CDIeVkUcLjjgCNZjx3ut+FpEwRLJkWx3NY2veS1e
         Ukxdbc7/5lMiUVHcUFTtsTvjeg1Sb+y8KCz6eeAFYfoH3YThHja+Y2mb7aeIefzh2kpj
         eRsoLsoUcZKGSFbALtzCbwDF5dD/Zo+Ac9sUUBC1p5OtyPriHRUHvLpsTOo3u/GeqfR8
         7bS4vjTCYPiGolRwMKFilxIkFE9KxxMau1oDMOquLQGJDGd+0jL83cgv+y2pV5zeGOyX
         Pj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932556; x=1791537356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRPrTGUlYlRMvJF+ftPXWXm2emGl+fkBUfXA6bf3Pvw=;
        b=SUzUvkf8iX1UIOqyBmxL726aQaesvdGFUXPzCfIYdlLdo7UNR9HsvwHBB3F7WaEqzY
         TQiWgUm6bz5TPaH+xJBNYLCQutQoyNlhw4mcz1uXddCTM/KwUR8XMr6dJv7K9/H9SK45
         UOdkqJcPz50+Y1UR+cxyTaz5hQpTRvYm10OpsHKphy5IqDBS/aQA7UWj4oQb8Yq8TZVc
         +TMwGfAgjYs3i0u+uV+zjEDy5XuuF/7Gpohpq3dDEXoTqCCys15UA1YFLd318B3C5Ug3
         PzkxDRzzJOs87ft8vSUr4GJDr/NYimbrGFFqx8lbcUrBH2wTDCxpzJsb+GH95dIv+cUx
         CUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8tJiWSq4Bgeo/016LZkajhx88Se7VNeNi+FhJ1lJYMpPFvD1/i3bAp5AUni0N8+q3T+7br0dlYPs8HwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGqv195mKkQCRAi4HIGTML1NDK107Fx79QgDQyDsW7Faw6JQnN
	MP84wENIggatQjs9uIno1OUasS7Onl5hv+sCpwUGEtntNEft8hNBBxe5
X-Gm-Gg: AYBFou0dxt0r64I3U+mlQsx92ZzqqGfkOoC6u9SXfB0kQLI6iSWqN2zQUwVibAK9hVx
	wiUoS4johwdaU1Bp8EH8vBYkctr0SWMCTMOA4KAtfMWG9CPlwOCgXNPFiD4v5jmVvoGWOErNfly
	6uXFJgx6eRcYDT1P+0k9Twxz0XIx0YfI+rrfJKe62ogiW7dviQYOw+H5n/KPvImwwOJZoYItJaK
	CI+3FqmPQFG5Tv4hga7ms9bSGJN2jB1u+TqsJMLgSURP/fTVxLiFGToRJk/kFO8FgmcRk5VZehd
	JKC7g0+qVbqzklNJIMy67rmj3fVZglYgOS77axcTjB/ne7gF3gLfKdgoCt5bkx7OS3jlFIgXcGs
	fMl0Qy2gskOoH/kSNldfe9h7YQz/KCfJhtkZEs4sQmgB5LnRyParwHqZqWY0TfUO0o5Cc1MTyE/
	7LcoXJOKrleEtCVOlCvdQsOFZAzWzXTnOB2OzIyOrrtK+O9A6ZVrRrN6mLnwVXGQ7nm5rKCo68x
	fMIYfDx56hozosY8GS4wSZgD0HOrbpfBmoCDEN6CIFyhEPdSYVpoAp5B+KLYM6tm0kbKoGSAxWf
	1cMKVgeqhnOrDBZJm0WOF6TWTdTAAhBrxrCFhe2BhRJR8wLD+Kv/kn5rDzcTYj1bFAk5Y9yf7Gv
	X2JvKO0Gv8c0591Qs7VTfFMCHmyK+Qyca60YQuyVnx3Vz3Y0cdEMejOfI0LuQj1AlIdYA6AcPkY
	YbiTk3
X-Received: by 2002:a05:6000:4809:b0:48a:fcec:2a29 with SMTP id ffacd0b85a97d-48b1273b029mr4027458f8f.20.1790932555893;
        Fri, 02 Oct 2026 02:15:55 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f89c3sm3966667f8f.34.2026.10.02.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:15:55 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:15:52 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: Add syscon property for
 multi-SCU SoCs
Message-ID: <20261002111552.000049d3@gmail.com>
In-Reply-To: <20261002-succinct-voracious-orangutan-fdac5e@quoll>
References: <20261001-ast27xx-adc-upstream-v2-0-2f9c15cc0064@aspeedtech.com>
	<20261001-ast27xx-adc-upstream-v2-1-2f9c15cc0064@aspeedtech.com>
	<20261002-succinct-voracious-orangutan-fdac5e@quoll>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Oct 2026 11:03:33 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Oct 01, 2026 at 05:50:36PM +0800, Billy Tsai wrote:
> > The ADC's reference-voltage trimming data lives in a System Control
> > Unit (SCU) register. SoCs with a single SCU instance let the driver
> > locate it without any additional information, but SoCs such as AST2700
> > that expose more than one SCU node need an explicit phandle to
> > disambiguate which one holds the trimming data.
> > 
> > Add an "aspeed,trim-syscon" phandle property, and require it for the
> > AST2700 compatibles since they are the first multi-SCU SoCs supported
> > by this driver.
> > 
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > Assisted-by: Claude:claude-sonnet-5  
> 
> Your SoB is the last one.
> 

And the Assisted-by should have just "LLM" instead of "Claude:claude-sonnet-5".

-- 
Kind regards,
Joshua Crofts
