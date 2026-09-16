Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E424AAC4B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573788; cv=pass; b=agHe8wDaqu/ycfJEdJo4Exzdss4NqlGNx6Tv8BiVLnvleTDxHCQYw10Gz2wtY0Y/eYEZrCfqiemG5hzyJUZ5tpQN9bFDtq/pRoiImTGudJZbpF6zWxrlC3ilxEmOr7MaPpWS3VrEmZQcE4q94MS1086icKKu1vTNm0lHvuJEqKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573788; c=relaxed/simple;
	bh=fwqarN10NUClOZtA7yaqargVTx8zWL1mtttjSy8NhoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQQcVXxbpH6K3Nf69lhwY2KJyF/4UoI7BAc41asnWatNwXlVsFPT9EALhh178ULyBN8acMnToSu5eWGCykWk76U3h3jne32g6/1GXYzjEEdoxY9x8HL7HxOkwIoz56J+b72m8Ix1gbr1hHeq2P8qeY9p8E8DGHkseYejkYhCrR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmittU9B; arc=pass smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmittU9B"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so566236f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573784; cv=none;
        d=google.com; s=arc-20260327;
        b=A9RRcerQ/W6/pVRQStOntCWTV1QMBcpotSHWWgDRi++Oxz3+88RioTr2uqvc7Dr4zV
         SZYcHkoQiCwWl6Hb9Zammi8xQo1aDB+6o7KvLoxQKy26T5pMe+rUYNix4/1pfKB4X0kH
         qRBWZ+FsYTK1MwI9EzOkUBB9Eoy5gLi5FeNROV6xBUmEqwDzNaL1y4HLxhmgZ195ho+4
         suPZ5g+7KD3RF2UyrQqDCNEvDrEPIdPdkhMD2Ez3T1aKVoio9JdIScVL03h61ojeLsk8
         teDQxQ35X1mp7ugau2XEyl+yGEer6dk4H1sDl7I46CfdcghZpNzXjxEXhvvh8ZGZgS/Z
         BoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fwqarN10NUClOZtA7yaqargVTx8zWL1mtttjSy8NhoI=;
        fh=n0faOJMeBmvyMlbYcWwUT86Hz/88n5WOQVuyXU6YY5A=;
        b=UYKkY3sADv41HWQNE5K3RRGNVS+F9fql2EYKsOWn+wjgYbWnZwNK/soHFqhxZFfF64
         tyc5qHG9c4gQIItKSGD0Hfdp7gclzMGDya40rOSjsDTsdOUlLFN3xJ0iwOUuJam34bDy
         TRbc0jtOMAz16ppRS+w9OKFl7iHwHlVdcfrepMZDGJOqJBi2Xa3rIAzttNM98fJatC/u
         UHzWRcO4RKl0HJ0oJ/JtoYG/INdjsaUoU/ZlUSfU8nVDtdy1e7tbjE12uTUVtWdzsBu3
         Or90jAyQrlkWxb7nnB92dYyLzR6rrdY2IiPeluoQaRlfj36I4+30Z+E6TRN73lKkzWgK
         0Ivw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573784; x=1790178584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwqarN10NUClOZtA7yaqargVTx8zWL1mtttjSy8NhoI=;
        b=XmittU9BA6gPn54I8BeGRku+QMkRWRO35mHcQwvQHHMbAzXuWAzJS9AusPJOpy7+M8
         ULEcOtxpwZBv2xeB/Ii8IJ1xX6939S4xM9R9aXCQZC+5bpjR7Gl5ZZw0skJvLNqtZpTj
         T+P5HejGIuH89N5KIc2qyKy1DGge/h6RyjbpZua97KQpTlkhs9PRqP7In6qRdF/MSiFK
         ZFVLICCDbLYfqcPeJoerrSUlcXEQ0YvXJb2hc0mej1mvnIWJceawO7/dQsLSrvaaoTeM
         gvXFqAHkLlsToJZQNJZ4imPeoSS6/l73snygS4o9HZibBjrCy0gUU6h6KmICWcVFPQ92
         q75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573784; x=1790178584;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwqarN10NUClOZtA7yaqargVTx8zWL1mtttjSy8NhoI=;
        b=0FzgdeOp/bY8honOhXnc0C3RezNd4dDHh4iidDJMFr3eIhH+Ebb/suVOB3Vy7gWwWt
         5YJmoEDOz0nHKXKvE+xdM4KHbKNH4L02Yn+90ld5pIA2CVONKRBtxb9uTCUky+CM7ZeU
         OZo50vYjPH+pqJdByqtrvbkwGjL3G0ZizJ/jRlMz+60OG/drApcokUsPRI6t+28059yZ
         UOC8iGDf1UR07N/86bYmPatPwEv3sBrfFBeglY81jNSsiPKLI/IHY31u82VmP2ulBS9q
         88XBO41g9xnCuIthFlE079Jzav4qSpgUo+V0oRRRYri66xbiiV5nAX56KfH7DvEcdNxF
         /ZUg==
X-Forwarded-Encrypted: i=1; AKwUvBwt5Ms0eOumwWzY37DEaSaqlqdcv/DClneWF2DTqWBNM4k9o8s0CMwS2EvmhPqkbYzsA7FaBfmzHMpZbbM=@vger.kernel.org
X-Gm-Message-State: AFuF++mVmXgsaj/rUQxeDchXFO0rQYvsUGyM+NC8C05UfEa6u8yJ4Sxb
	SRfWpwPu18EC3uPvWd3bXCQ/OpbUWAJc1YDA4xAUv42v/53RS7I05jgvtDRtk+M/HccW+55a+b7
	7/HwTNO+SbCbzg8du/pQc3mDjpPFbpls=
X-Gm-Gg: AYBFou1TcKEuJqhlnOWxDIVw94/o4C8WhrFnqosIluqpN2xzGWtQJpHLoff/DpUv9Bx
	UNrlOIkrnF+hCvBdCpH42D8n22SZnNdS8ki8XVg52Yc/0567fCTXAb4TnHLXO5OiG+T6ZwEly8k
	aQy2fqoeuef/lDXUVsHAnXejN2qa+uJW84Z45X5mNyX+dIlfpgKvFndIbGbVnHaBgPhaN+Q8lSZ
	Q7ODLEJhi/XG4egqe9f136vmYtg+ejOK8SFy1jx6bxkUM00un/NDRLMurhw8jqkO79F/twGxyUY
	x4I/288kJHI2rUZnfSTC/1WhUsFrvUiGDd8pySGWfHTm/DzeRjxrKqe62DYwCeSu38KEromQyMi
	DwuKMd3QavzTrfW0s51Ggp1cJOxXAAnyXl6tiEtybS7FJEWG4UWJleCLDTaGWqYROR3M/cUN+mJ
	Eaxh3qX0UM4XlLsionH+K8pbwI3z5q562xkHvioXg5TY4MMZBKDswx3Z3J4rl/c1VsSY+Ou8Cs8
	BrXjl3DwQHzD1PzBoY7Qruu+Q==
X-Received: by 2002:a05:6000:2506:b0:486:f18b:3cf8 with SMTP id
 ffacd0b85a97d-4870cf1abd1mr4010532f8f.22.1789573784237; Wed, 16 Sep 2026
 08:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-mcp47feb02_refactor-v6-0-285464651f89@microchip.com> <20260916-mcp47feb02_refactor-v6-7-285464651f89@microchip.com>
In-Reply-To: <20260916-mcp47feb02_refactor-v6-7-285464651f89@microchip.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 16 Sep 2026 17:49:33 +0200
X-Gm-Features: AcwNN1X2bljHln1P6cvv3RlFUVReGuhE23EsCuuOlpyh9vJw40krWIbRB4NBzJE
Message-ID: <CALoEA-wmUAtHjjWB4xOgZxPZyoHAhJ_nywoLjNTkkfCdkMrB7g@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] iio: dac: mcp47feb02: correct typo from a comment
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 16:19, Ariana Lazar <ariana.lazar@microchip.com> wrote:
>
> Typo corrected to 'Register' in the comment regarding defined masks for the
> gain register.
>
> Reported-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Link: https://lore.kernel.org/all/20260723231859.03f92ce6@systembl0wer/
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>

I agree with what Andy said on the cover letter, Suggested-by is better in these
cases.

--
Kind regards,
Joshua Crofts
