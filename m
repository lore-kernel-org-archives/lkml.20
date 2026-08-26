Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D843BDB4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755283; cv=none; b=tUZG43aZWIFzC/z1gEolrqSIMmu415/E6VCPECKp25gl3DbGZEg++HkweRDKUpoQV/a+cIUVqUTZAxqwoyuIARA5owu+tMjIJacrZeHLxIf79prpJloAOVpcJBwKgQMQ6mx8bKE/LVM/ivbb35wF9tpfLfW6wrA/JGJEIX8QAmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755283; c=relaxed/simple;
	bh=38ulmt4xq+ksW8krj+T3oRElOAiMeGlxgJwWv/HNTLc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYGI+UOyzx7wJXyNnubClgnn/XBwLSnwEaVcIVMxxZQB1OeIKGfR09PIw1pNOT03fzQ9X8ZBNOfOGJ3cEVWTIUw/JDADDJ6vwRLAq+JBETXTTmF+mw15GkeWQ/8PUPyQq9hoyyVgCuFZhD5kvwiQc9yjp26SbTYV1jSz+HuJL+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqVQAoDy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqVQAoDy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45F91F00ACF
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787755277;
	bh=38ulmt4xq+ksW8krj+T3oRElOAiMeGlxgJwWv/HNTLc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UqVQAoDyZDO8mI++mRG2xy3bcO8OgKqQ6s5of54FWfl5qoQCv5N3V3HVGfccKvXt8
	 oU3o1X5BJueob9T/H1u+ZKVmdS6/X5GZZdNMbKjAI1ctZgTlOtc7hqPKpF0XwgIg2m
	 0e/oH5HtCIZun28Z1v5CQ8661xNVjtZxH4CXliE4TJqQ25ZPGz3m03WnLodBj6DE49
	 vZbb1OIrwBiAB+yC9N/U2LVuDQOoc/CWWYZnclc1n849igGhWNoBtlXjXz3XJegTBO
	 n3S7r3RNLoJHUgmCjs+wop2Fzdezuhj+XxKRCsA+9HYyqBODehNbn7g2ouVW0EmwEp
	 VSVdzKnVwMMdw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b4a95ab94fso852012e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpTSxLOTNw16o1tmWcP3tWnDnSwyOC+qDq5RmUpXl1ZAVWntFpe+uy5xxgztGz8NvEBhRfVDCQNpYm/4Nk=@vger.kernel.org
X-Gm-Message-State: AFuF++lA/iPSK2ABnQVNVDvhUD3UIUi6F8w1OWaf20gPEiCb1EKAH3S7
	KESOXkOItot2akWON7mS+OrJqWM5+Mxvr19VUB/KKZtHEayEsUT0xLx6tb9YFfjwN3g+JQq5guk
	NrbbbIS+am+fHvwI8FrDQVEa/ZN2+NR54ReoN2EAuqQ==
X-Received: by 2002:a05:6512:65c9:20b0:5b4:9d3b:9188 with SMTP id
 2adb3069b0e04-5b49d3b9499mr2279161e87.6.1787755276572; Wed, 26 Aug 2026
 07:41:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 07:41:15 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 07:41:15 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260820044258.1954272-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820044258.1954272-1-triet.hoang.dev@gmail.com>
Date: Wed, 26 Aug 2026 07:41:15 -0700
X-Gmail-Original-Message-ID: <CAMRc=McVLkVGQ6B_MF6GdV6EV4t3dVkuB2+Mnof41htRX8qdTg@mail.gmail.com>
X-Gm-Features: AcwNN1Wy6AKMKqiYa_2rmxei9FhG5QhdaCCzKF5MhaantZDU0Z0UkKucl3vG4F8
Message-ID: <CAMRc=McVLkVGQ6B_MF6GdV6EV4t3dVkuB2+Mnof41htRX8qdTg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: brgl@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marcel@holtmann.org, luiz.dentz@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 06:42:58 +0200, Triet Hoang
<triet.hoang.dev@gmail.com> said:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().
>
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
>
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
