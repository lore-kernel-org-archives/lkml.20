Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE333537F7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719940; cv=none; b=GLX5z3ZZrkdHxwL260RuBVJtFoDvI7fDkweWC5MsEf3x+2M6KUT1NAdljh9HsjX7i62ZdVP0GiylVWbYVmPTwpGfSmUURf1qD02CYr2uxrIiCozaMqmmByrdNQPvKeNlFP8BHtV521xUJ9FQwSsgbobbHW5K6OzpLPAERzN0vbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719940; c=relaxed/simple;
	bh=ooDqp28BSX8C4SXyppIAKvDz7sucljsaMY9GFgwSBFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YiHHGal78ET9IXNDNQUf1OqUYAODnnKem2xl/kyQVkwDlAM//LsVDKyPrAF9YIb1xG9fOmhraI1+Nmlxt7tPpo4eBVyYgZ6Xp9ftPq3znHcjPkWNmxcNOPhPhchSUzozFo4sjh0+77OJ5W5H1CF2q1gQi9KkEWmlgffMNZXY5EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gMRx/cPM; arc=none smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMRx/cPM"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so703581a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789719936; x=1790324736; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ooDqp28BSX8C4SXyppIAKvDz7sucljsaMY9GFgwSBFQ=;
        b=gMRx/cPMWcl1E+8YCuBm61yN3C7YYrWH768CxqTtnwm65LOk6az/NYCaQ2HOGgXCo1
         gOdwHdLqQvEQAGZqtevlKAUyXK5Nh/o+Zwt7a1le7A1H3HwIzlRUjO47vtu2nE0s77vk
         RXNE0WfhYFFJNSODGyFsF9Scq8rk+gzVdvxQPebw03Yj9gch6hI0HY4HKz8mcvdX6yc2
         Lq7EK0SEhOq+9OmdCXsydTp5wjlP1XFX43mIZM9s05AI53UEos9FbTa3K52m6PI+MlAc
         7wrKsW5lj9ybIcf3vXwvT4YvFfjKXfc2osDz82URcUj/CXJeD1aQ9wf55Su9e/YChLHy
         v12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719936; x=1790324736;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooDqp28BSX8C4SXyppIAKvDz7sucljsaMY9GFgwSBFQ=;
        b=ADBfWCIvYqYApS1TRDCcfdNvssNnzEf0SgFNa5DMFWhtVsNNDLbNOcEDGa4PHPt8yQ
         Fi6CLJjy3Bx/yF2KYhFZya/0mNv4+r/CDGCLteYVge+7C8HIVcC54IuwIrt5PAhvH+W/
         cGoO7kKuFyu8fnRnhJyZbwGPhVHB4FhdWV/K6cKDCP58y06njlM/aolcXvEHGa2+NUyM
         MZ2oYCw7O98Fjj2nFCPbjIqqnyVhK9ghmGuI7cyr/rUKD+QWhefEoEYYQsOCXSq/ZpmI
         ydwD9t4s/lWoNVAOz1lWcNffsn/RcwnAso/gVrr00jGe+q3Qsg7DZvTGOFiGflpWS3Wb
         sHsw==
X-Forwarded-Encrypted: i=1; AKwUvBzWIL0miStSKePA3Ee1WyfH4r+n/TDlnUFynrlTulvtn9iXQJiLxSLT7SyVH0EoLcrqvwUeAiPUA04nELY=@vger.kernel.org
X-Gm-Message-State: AFuF++lbEtP9jfRJ3DbsZfa7dUXDvSX7OEAy88u5KjYuvPjg+8xdC58b
	bFfIgeOvaiZVegJmqfLnxYYitWOnGlRd2llQrk/cTMuXy1yBqNygD8gqhD/y2IbjzDI=
X-Gm-Gg: AYBFou3kRFD7JKnDkfHHVi8qvJms9jnLbS4rHyAXyPi02naOBtpsfJ1YmFr0R9JtxQa
	Bw7/JvvpP6eY+ihkeF5/RSPxtGYdCEGhbgGsbSI8VXg4ms1MZe4iWQ8i98ZRXFjEVGoQcBfsHGY
	4osYDaf4jZPqTvk9iY7Y/6RF4vtXxstB4leJgjMQEmsptjmS72fkzylWF4ztgJn9p5OHmq6SUei
	/KthSVEcSli8rH9m2G7+A1uF6r3uDcey2s+FbZW5mA9GV7OyQqdFLYW+BHyX5dodm62fKLjgCDE
	AZAcXRG+VeOcOycWBFSFUb8bgo/QNqJOGpeW0fAYbWXSM2envxTo8jMGmZR4je+DEEv2F4RBijP
	WDYnQRAV6pvM9gjh41K7zR8bSDNHCtRZdRS3lprYLWUHDpO5+Dt9AIHRmyKk8G6XZi360TGoPT4
	3GUkZJPddeXV5KraDhY1nZoMPwpKOjDwmlefcskb3g7S9MkC3qMtVH6L0XFopx2JPWw5IUWCIvs
	qk=
X-Received: by 2002:a17:907:c318:b0:c29:5326:5a63 with SMTP id a640c23a62f3a-c2a159adca8mr151942066b.16.1789719936083;
        Fri, 18 Sep 2026 01:25:36 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb0715esm31148966b.20.2026.09.18.01.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:25:35 -0700 (PDT)
Message-ID: <45086d36bd16a3475f43be03f34b9d712ec8bff9.camel@linaro.org>
Subject: Re: [PATCH v5] mfd: Fix typos in comments
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Hemanth Selam <hemanth.selam@gmail.com>, Lee Jones <lee@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Botsz HUANG
 <huang.botsz@gmail.com>,  Nick Huang <sef1548@gmail.com>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Date: Fri, 18 Sep 2026 09:26:59 +0100
In-Reply-To: <20260917054045.15805-1-hemanth.selam@gmail.com>
References: <20260917054045.15805-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-17 at 11:10 +0530, Hemanth Selam wrote:
> Fix misspellings in comments across the MFD drivers and headers, found
> with scripts/checkpatch.pl using the list in scripts/spelling.txt.
>=20
> Only touches comments, no code changes.
>=20
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
