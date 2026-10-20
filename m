Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477776;
	b=NPfRZ813xYbsMFPrvckgcMDmJMMJlDvHP6IVaNbctbgMmrJY3MHjrDUoBwsWzy1J+29e
	 /xxEEWCZ6gK7Lw7465d6BIl21ywspt0wNkkafgXCIrLeY5du8zQQaJYMpTteUNePc+U7B
	 +MoHSuIZMBMsGrXQc2t+E9msDEQpIKAxJ8jRDoXi4V0FEN3u2jUIxT38LHSmwf7wEBSPT
	 +iJlpYAesjP26MzcaH1negvPgDVh91vfo8N7TAuCqfuyAAVkgPuGNvYo1YHoAIDLBHPh0
	 bsYn9Orhg7eQFNbXR4YSVE8mRqnP4O47hFh7WXvYBpF0WzxhySC4ibueQLSdzVy8SgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7mkrcGya/k9xPQHP1kLMQ9K/TBFMnTEolY10HA2nCkE=;
	b=KXqPkBIIH7cKCLwV6ZQv7aZ8wq5M3S/V9EhAhLDjV1ERbeC8VNn6Pz6uPZAoPv90xjOw
	 t2z5aOooF+5U8eeOq6WiFVmT+giAGzO/v+G0hIeVBXzUeW4hiTarxRwlP80LcV5R/dCQL
	 NLMcB7LNJ4HrlMRhdXWZz3Ved5RKJwVvnNNnx9IVUZ4xLCb898N6Rz/t/G4XdlIJueK7l
	 3mff/+gTAtaVj4gPdNw/wtlBJC5aERaIv5ZJ1wfjMWwx3X2LnRFJjRVRv4aNUYiPJKpko
	 ETC3OZzAJuY+B6RWjP22uqdjEWvcznKSr71rsGMQ1dO0+GSwIoczRZvg9G7mTbhJAYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elxf+78x;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FC2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elxf+78x
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso199972f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792477774; x=1793082574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7mkrcGya/k9xPQHP1kLMQ9K/TBFMnTEolY10HA2nCkE=;
        b=elxf+78xlaN2+qBalzGsO3OM9GsMJcfqAFceAUiMP7K0mNd8dmkJOJ1zW5+JYF4X/J
         504zjvb7Hv6ECN77kmPFPKyZQ/mWyW2KfWmxH+ZBVVxOf9vqrnOFz6DNPFCOLTfq6fln
         iiFckYDAELsvpzXTqW1IBovXl7qRaTidqmcOkPN7CoYGkNkGOf9jWXTvY36/nCMKlFun
         ulT7M3Y7xD0wLpl9WWjwUKE0DYqnmwuIR5H1TSUAx6mityFxreNIVd21bK0FTROpCyLa
         aYbtwFQur8V1eRS454QxpLWvGh4UoPqQGEIqA1KP33Nc8QfbNBNlieMiOntd3r1oC0v7
         DRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477774; x=1793082574;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7mkrcGya/k9xPQHP1kLMQ9K/TBFMnTEolY10HA2nCkE=;
        b=lPNmV0Yneu8koD9hLvn9pmmI1Lw3bd1217q19J3HPjQntR/vQJhwR13jdAk1GEK1LB
         eS++brnArJpUIdtai3XqtE9C0NaqZF8zpw14r26ilJvDCnSkrlelI39N52ALGn+yLm4/
         39NBznor6C/8TPktvl7NnATvgb9THgJmBvDMcTZRDBtmPc92Oujp+Zwv8d2YerqOfTjS
         HWGDcZdfjV99TIvhu3a0zZueFgTHqHfL1IfSmvmrEVb4nrIOa1NJ8BGdEm5e5ZV3likM
         RR+aCN8hqrvfds2Bf9DCTOvJRe8uHVW/2f4CdUT55EBq7EDOT1/BdgS5n/us4d4JseFK
         lFRA==
X-Forwarded-Encrypted: i=1; AKwUvBy0+Q2TjhzOUGGhXQXUVcyzzEMWFLf+splg06KSQ5CCcG+wmudHmNFOhS6JJgi3YU4xQMCIh3cKAvV7vWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdKGRYz7FP0qpngqOTaHwbW/3Otr+1p0abKxdodVUcfb2KMv4f
	tGmoqEK85F9nQlHQgQKlxuonE08iWI1DNypm+Fhg0HHDZ4boDpQZmM0v
X-Gm-Gg: AYBFou0I7hESN2er+QY9bgsxtvRvDhhq9ZKqWp5RUEUbaFb/PEOhdMkpahNugBBraiM
	4jPSPdQ6WgQNRVS3+hOpIl60FKoBPgCOrtnLLEpC4MC3K7uL1VJQLA4HU4UnmijNjRpZtHJyqHx
	UxXl6eWZ93DQUXNQxhdcHrJ6KTNx5L+zQYqV8h7IK40xmyMxGtcu0/ojr0rNanKV9L8GD9zkkPT
	5DHBwLAbNiNaN/3i1L4hYyc7iQnCzAFcRo2+Z1ZfiyMFoT2LBONCDE0FbYCv1U/KzmrGzQBpjV3
	umEUMoL9RdvUfzhfFFPMXPRFRS+yL+la7H6azBVdO2R71WJlwqYmTrDgJoGpHXZy7AhX8wzeePp
	rVBOf6KNiyUpwyxxJrmyMq36ll3FFJuW1sSTI49KpA9eq2hYlRM+sYcrs3eplrWh3recj8UGqd3
	81OdrWGuziYChO18/P4BMUwsZtj8VDO2pCrh/DZknsgk9ob4172SdrhSFzsRhqujPRKD00sNd0F
	xKProoWadQBTrKtM6+7AqoTB4SkdeZoJWs95Sx0ZV/OjONd5EVBALe0BQGFG4q33kIdjf3edvfM
	jIF33YVtQuOninmeRmb6+b41ZlvGQQ12JtVvJBnqvaY404X6ys4sW9BZZ4v/Ol9yo7P5GZG2tvD
	URwApEFvki00DwtOBVehFqgJNaK1eXu4JHmVEP65MfZF2VYVmSDa/Ni9cVOQ4AFuVlj4ubgmNpF
	XVR8jj
X-Received: by 2002:a05:6000:458a:b0:48d:ed0e:6bb4 with SMTP id ffacd0b85a97d-48e1e7550e5mr2034223f8f.4.1792477774042;
        Mon, 19 Oct 2026 23:29:34 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8314b0sm3948944f8f.55.2026.10.19.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:29:33 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:29:31 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wrmfwv@163.com, nuno.sa@analog.com, jic23@kernel.org, robh@kernel.org,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tenglong Guo <admin@micronull.cn>, Sashiko AI
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: iio: adc: add documentation for
 adi,ad7816
Message-ID: <20261020082931.00001c99@gmail.com>
In-Reply-To: <5d43ce8c-18a8-44df-afa3-d0d1d7b771b1@kernel.org>
References: <20261018110015.39497-1-wrmfwv@163.com>
	<5d43ce8c-18a8-44df-afa3-d0d1d7b771b1@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 07:58:44 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 18/10/2026 13:00, wrmfwv@163.com wrote:
> > From: Tenglong Guo <admin@micronull.cn>
> > 
> > Add a YAML binding document for the AD7816 family of ADCs.
> > This fixes the checkpatch.pl warning about un-documented
> > DT compatible strings in the staging driver.
> > 
> > Reviewed-by: Sashiko AI <sashiko-bot@kernel.org>  
> 
> Drop, never happened.

The entire patch can be dropped as the AD7816 driver has been
removed [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=f22c353859f3719ffb1f2528eb5be8415f680aa6

-- 
Kind regards,
Joshua Crofts
