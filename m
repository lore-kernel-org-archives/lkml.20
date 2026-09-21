Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960764FC328
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015537; cv=none; b=bXs5FwaBA4zAi2CIR9S98OUI/Sq0zU0BXrWoToEvEzFBeucqoBAjBCjya6Kenv7n4iLMrM+RVIBGfj+BdL/mMbtHlyvZHQ2k+cXpZGKvg4Zf5X6Xie/stxDYq4Sct/ql57xo0yfaLkqr2TjwpKMET2YZclAwF2uVzJd0D1bIbU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015537; c=relaxed/simple;
	bh=8BaAO/JTedLrIStDBlrZRjwux1WdgbCnv3+4CtQ+5po=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=nhWjiZx0ZDKUj+8cM+BBZ0/PDhwBswwFSVjdRSow09QOHnjHGKmXnet+dMGONh5xM7eNOPZe6bfKp2mBbRFb2pHJR7M35oKCvCla4CXu2805ElaEK041dqSFQJb8Uktn6+LbiBs8lK4JFwGQ3Xr5s5J7OrotdpnKsHRYsLSgkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QIgvXKP6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QIgvXKP6"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so3066568a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790015536; x=1790620336; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8BaAO/JTedLrIStDBlrZRjwux1WdgbCnv3+4CtQ+5po=;
        b=QIgvXKP6cjWgHpN8Ep1F31SfUVgSyF+QsAqzUSGF5VYyQD7nO5AL7oina2cyOvtYwc
         lYmSbsiRR/qjmGEFoj74RUGeIbffJrtApacxuNM1r36x9NExf03LyB4t0YcDgUU/msAU
         0TYJlagRORlFnlAMyrruqnC/5wnLTFV2h9POxsWCg9crYiM1oglukfM6Jl9IQBZcvDss
         2vl3wyRy389M34ACa4TeF94M0WSs3wiQJCcc76Z4qkQCzlrMiBscW7Ar2aImkKmXeYRB
         eOlI7ZM9aqAuU+m1pgt2PiqHrw+sTUstn45CECaCaVIfJR03ZC9O0PHqNmiVdjPGvnre
         /GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015536; x=1790620336;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BaAO/JTedLrIStDBlrZRjwux1WdgbCnv3+4CtQ+5po=;
        b=QoHvDjM9Bzq/QR0yU6Kdo+Y4jE4iQni6vz9RSu8UHAcXQc+y4FLqG0tKeKWoJoMTHS
         buQFKKwvxzkc2y8/ZgkacFaOReO+CWLutEh0T1nYmlgr565hLDckhucYPC70VaxSW/a6
         A3gNrM5TD/YoMl5FLO3KqJ6akIVHgtDfYsKYZqctrpQscVNrkAs1cN3c/95QMxld/CkK
         nyxd/nSn/x6RlOnvzjJOK2IQwZCw42HxfW1I+54SMw3mPhOZSlLwYi2uX/8XS9DpbmYX
         8QGnHbFskINezfuCSE3lZFcjflvreDTLiFbZaFSC43Ad27NC2iaesqo8SgZHT1u4kMXo
         gVpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzNnuD4hd57IoYB1MtOYgARnmFCnaYsyhRszEbm9uQS+HBn6dTi2s3k2i6EMdZbHL6VQgIlFjc2F48F0c=@vger.kernel.org
X-Gm-Message-State: AFuF++kbev1t4jjr3iyyyme8eqNmigzwcsMaa58+tyHsjd144f855d+H
	8OUmO8m+jo0E0lHrR1Wq59JGBGrYYoaWf/x1OmzB9xDJ3HjG1guD0EVsHyzFzk0jH2U=
X-Gm-Gg: AYBFou3Ya1pRhO37Bl/xCDy5HE1Tl2Q64NqsBbJaBix8hu3bbtAlRH1gvswQWM3w0Rs
	TSfQTJ1UH+hTUAyKRrBSWElxwHlyYm0wy0vL6Rxmc4S9gRffMwHHlvDePjzsbmKxHKRySojGEzL
	yhyfAilfAd9mQhyTkuS40ieZB90fhaC3j/UXl2RPOLC+0KTb4Ewvjc8x7SrkvF5XHBl94I7L/DT
	S9aiCSdDF7YpIEKFHleG/8waE9rdqfyT+mbIiCjguW5Cvu6M3eNfHHclGr7d39JIfTgtCkubFHl
	CG3CLTXsDIlKMPNjnptsv7t4/reaGsj9fW1bmaEeEZju6vZC0FqVRuCJ2WXP7VIjm/2vKQRgzrc
	9Xi4Q6VACK4DqxdbGLWJTpYw7g3gJIZ2R/ZSE8c7iHPIKF5YF48aAzQuw3ERq35Dmf0YZqTrlfq
	72EPhqVO7y0jW3IFu1idqrvQNbTsPT/G2TvwpE/XvyT0DN+8V5HLJlLUMmxgxweaSTAhDUy8A=
X-Received: by 2002:a17:90b:3a43:b0:39e:6c68:c778 with SMTP id 98e67ed59e1d1-39e6c68ca12mr11774403a91.46.1790015535822;
        Mon, 21 Sep 2026 11:32:15 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm32883863c88.5.2026.09.21.11.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 11:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 11:32:13 -0700
Message-Id: <DLL7JS0LKL6X.1F7SU76VO5XVK@nexthop.ai>
Subject: Re: [PATCH v7] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Andi Shyti"
 <andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260821-i2c-xiic-restore-runtime-pm-teardown-v7-1-954e06765144@nexthop.ai> <DLBBXHXIVHZL.BIOFL7T9OAM7@nexthop.ai> <aqJQ8Qm_nhBaWR-s@ashevche-desk.local>
In-Reply-To: <aqJQ8Qm_nhBaWR-s@ashevche-desk.local>

On Wed Sep 9, 2026 at 11:40 PM PDT, Andy Shevchenko wrote:
> On Wed, Sep 09, 2026 at 08:51:33PM -0700, Abdurrahman Hussain wrote:
>> On Fri Aug 21, 2026 at 6:12 PM PDT, Abdurrahman Hussain wrote:
>
>> Gentle ping on this one. It has been quiet since v7 went out on Aug 21.
>>
>> Andy, v4 onwards switched to request_threaded_irq()/free_irq() with the
>> explicit free in the probe error path and in remove(), per your comment =
on
>> v3. Does that address your concern, or is there anything else you would
>> like changed?
>
> Seems okay to me.
>
>> Andi, this is a regression fix for 50c63491ff26 (the devres conversion),
>> and the WARN fires on every unbind/rmmod of the driver, so it would be
>> good to get it into 7.2 or early 7.3 fixes if the patch looks OK to you.
>
> v7.2 is already released, so v7.3-rcX is the best you can get.
>
>> Happy to respin if anything is still open.

Andi, ping on this one.

It is a regression from my own 50c63491ff26 ("i2c: xiic: switch to
devres managed APIs"), which landed in v7.1, so both v7.1 and v7.2 WARN
on every unbind/rmmod of the driver. Andy was happy with v7 [1].

Could you take it for 7.3 fixes?

Abdurrahman
