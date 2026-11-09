Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794261782;
	b=2owGESCCwt0RpuZ5uP5/PfYBRbWDzC0SGB0Tn+5qHpXUfWnLw7ion8zTxvzl/4vvss2R
	 z73oj4cycib1+dgl5FSHse5lsFkVOKBelG7mSeSeZFt4+CFQ5FZtJtaKBclyzz+XFLNql
	 pxPZAmVR02tRRkJy+dNVoilZH7dHkYntbeLzIgVP5N0A7amC6ewXBBBJkKSTOzTog3TI/
	 DDdc1U1GHn48UvOecCqrK+UrfGwgXHZY59MYQxA7aqxInBB1X5x743tVGuHW0LwzUVKcm
	 EPqGTG9jEi0vkPixeN3o/i3bAnpKGwfcPhrKAn6VEANNXaDXFmOEh5yciB5w1aa4JKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
	b=jbg0lyVF+Mi6lY/Zj5/DVhTmn6HQMqu87DCDqJropjyLLDHrwqL+3d/z9MaGVCKFC4OI
	 XsAyCg0sC44RlLfXdYIsRxdrEP1hQPUlxfJiORF3p75yRy2iITHCcYYtDfw7uqqgbxWQD
	 81hHPyn1RFURGXpCOp3vN01D0a6Kp86g9KRWj23jnCqLbf/xHjk2DCEgggEZXxtDrBKNc
	 kTtBizH5AiWHlS4s+13ap8ld2Ht0PCFV3eAQ25Ug68BOMQs1GA/T4RLmfIq5400r3aARX
	 SToji8gTAKPf/zzxzmqitHAjibhCtooCi/M62qpq0oNlf7s2J18DgiXYHQfF1fbG8kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=BSUTlFht;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A81606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A81606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=BSUTlFht
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so139513a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:03:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794261781; cv=none;
        d=google.com; s=arc-20260327;
        b=FdtjFqca9SVnl8PhVfO0bf9R6IsfmDx0dMtYOry9px5He0PGjX9aeZfW3DEfJIJE1G
         oBcGJ7Zr3492a2Kjij70RZo0NRG0Qice9bfZDYn3jGBs6NBVhIVWu0nXbk1dwm/Yf2om
         /9sA48VqTUQToYxm2eV0WmpXQz/+WKGrrtOvMXWBQtDH/QaM5Ied9qIs3SdDva3dGKpi
         K/bWJtoArmHzlZKht9+POW9Bj8UeDTGDEox6Om6jVlcHMSlz/4sBM5f2YoFpDbXzk7Zr
         ixvUfdufE1LYbQuo/WrS3YHOiu0rgZuuQ7pxcnQd4azy7Gab3tcARvvdLLpNO8w76Tmd
         pJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
        fh=Up+0Xg/ICP3od7/kUJWP943zjnDxZAZ0NGaKYSHZGGM=;
        b=jc30rZDEakDoCpcZ+giQO9DpXaKP2skgkKHzqHkHGcdBKOzYzFAZUxtYoNEQAdLJ92
         HSbr7/OQ0I7lWX5fHzRmVMz/SHc9WCGV5nkvHXx7Mfhtg6hDm7aUIzoAUZmqM6pq9nES
         ZnOrxnsxdUmRpgVP2XhstZABt11xM41mF0J1h8sjC+oaUHA2W5ijEsBQ53LkhK9YAynd
         5arKc/lCD346+JnOyLRhdmBTKVRzcTbNnhzoL85T31UlhZve1Uo9WTc6zKLdjOmNVNjD
         AuYNmuyW2h1P3bimIRwrBmxkiZrA/HuTYoRE3qYP/qtZC2qXY+m2GvjmQDiKZ/Qpwk1m
         nWmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1794261781; x=1794866581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
        b=BSUTlFht39VNuJ/f2J56X1s7bZ7V2SNgiXfLZnVcGiL1jIU4NznY9fE2HkjZmULok1
         x60Vf3QAfEuCA1jvHmnHu1CC9AcJp08kuvVT8l5qpx4T4NU4ylgNZf25JIwR3YHhAKQd
         Qn0z40snzSs1+K11hpetvZMTri1kDGLdQ9Pmb6pGGbbcBhaE0eUIspki2qJK0xwomhJY
         Rq/8cEG+xuhEWuV8g+0jDwvIqDpq26NFGtV+XemcHnqOwpN6iQVJ7qI59pGoQpyzGKeA
         +f14gx25gOszOrAfXaYBcvorgkduohNMqwnYMIgQYPwprPWNiBPoveI/vOSv0NZUaed7
         dfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261781; x=1794866581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/4B+HMYQGdeNoawaC8nb2MBw5WMuUhGF+veGWpIt95w=;
        b=HTocK+eX1lqL2mCsrAaSX2oCTg1aYBlVG/xTUiv0LlvAXIqhZk1z9pxt/CoCiZzgIK
         vYW7/7/vyrdzH0Kpcm9YbBy9jMIzrTXmFcmpK8WRxIsvhp7qyxW6ZOb5dr03ZWauXKAB
         wbYy14ZIH5PZq8Tzp0alOCRv+55rg6jR6hSp4l0jP+s790cIJK5j5sVuaHiIf/wF5Qj0
         39qWboRt8rnDdHFft5ykfVHHlW7zuir7HR4Lh/X6QnzWwscAHduv1gJeerD7pgKIIKpT
         amPjXJqCUTXDBldB7yD4gcWfuHHHMTRAV60M9UBpXnYMIY4jdOh2FHMWDr5FkgJaofWC
         rmJg==
X-Forwarded-Encrypted: i=1; AL+hErG8gQA6VoyQmIRKPygB6h+vef0DGEo9kBSkgvBYfZNfAU55/WLW/f091fgrQzJN5pGtDX16Q3jH52JBpgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+774LpXSm5bplXRDLT9+slWEsRxeoxeN02u+mj4vD0aYVueMHt
	5Rhxh+xpBLDfdjw18ebVHayaQKmPnRBA2hHxv/e2HCI8Vq2O48mbqH9TUAhmTjfZc85t8hX04gh
	Dmg0b0lij4L/4V56kquB1E9c+9bVMQD0UtEP3cQs8rw==
X-Gm-Gg: AYBFou1Q4d3wyrcpOVQIiXWXYYRBbpFt3GsA3j2O608xugr68Fs1Zq88zerFO/0c/Rh
	M6Hv86Q0vEb4AAQwYsparq+6WllPOjy4OfScq0y+HhoSeO33aV1yVt7kR+eshIV616o9w4V4xkU
	fxAwlII0zYrW5rkFMBAuQQTNFIAQLLrgiIb8Kxk/x8mOmmAKAaHrKwyDM+tZ1hiKIdXwTT7gix5
	VWuufV7puvr0MuGL7yEKdB5AfbxE1+NfMwPwWlmCFP7dyGi+ZrIyCuSFkS3+aHajMHvWAPbnY2P
	jQUI/e/in3xj60SyzO3p8tTGk1JrjD6Q04ocruL/S2G3LkDs18S1PdrLwn5LRKlLpTl0Y6I/OqK
	T8W771IwvOvw6309Lva49rMrbHMFG2WrBY9w=
X-Received: by 2002:a05:6402:c45:b0:6b3:e89b:126a with SMTP id
 4fb4d7f45d1cf-6b7565f7d6dmr640342a12.12.1794261780736; Mon, 09 Nov 2026
 14:03:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109175752.793130-1-jure.rebernik@luxonis.com> <25204208-5fcc-4b00-b359-86fc5f124700@packett.cool>
In-Reply-To: <25204208-5fcc-4b00-b359-86fc5f124700@packett.cool>
From: Jure Rebernik <jure.rebernik@luxonis.com>
Date: Mon, 9 Nov 2026 23:02:49 +0100
X-Gm-Features: AclHuK-cvftGYpN4mqto5HWIYSl8oeGTMovdxZCsAtUy9fF3sq2BZncPc5FuUyM
Message-ID: <CAD9jT+r2gBSbcO7CVu_YLhiJja4PDs6O=7v5g-VM_RYx07=4Jw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: pas: Request stop before tearing down
 GLINK and SMD
To: Val Packett <val@packett.cool>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	konrad.dybcio@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com, 
	linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Val,

Thank you for looking at the patch and for offering to test it.

On 11/9/26 10:40 PM, Val Packett wrote:
> I've been seeing crashes in sensorspd like
>
> qcom_q6v5_pas 3700000.remoteproc: fatal error received:
> EX:kernel:0x1:SNS_SEE_I_0:0x10000025:PC=0xf00280b8:LR=0xf001f>
>
> on a Kodiak device (sm7325-motorola-dubai) also cause a whole-SoC reset
> right after logging that, when trying to restart the ADSP.
>
> Those are somewhat random and not too frequent, like once every couple days.
>
> I'll test this patch and see if I no longer end up with my phone
> randomly showing the u-boot menu when I pull it out of my pocket :D

A test on Kodiak would be very welcome, thank you. I should say up
front that I don't expect this patch to change that case, though. Your
log shows a crash that the firmware reported itself:
q6v5_fatal_interrupt() clears the running flag before it reports the
crash, so qcom_q6v5_request_stop() does not send a stop request, with
or without this patch. The patch only moves the request that is sent
for a crash the host reports, such as one triggered through the
debugfs crash file. I could not inject a firmware-reported crash on my
boards, so I would be glad to hear how it behaves on your device
either way.

> Try not to provide the free advertisement right in the commit msg btw,
> and to make it sliiightly less verbose.

Thanks for the feedback, that's fair. I added the note because
generated-content.rst asks for tool use to be noted in the changelog.
I'll wait for comments from Bjorn and Mathieu, and then send a v2 that
cuts it down to one short sentence, moves the details below the ---,
and tightens the rest of the message.

> It looks a bit funny that "stop is a device" but well, it's not like I
> can think of a more elegant solution...

Agreed, it does read a bit oddly. The alternative I could see is a hook
in the remoteproc core that runs before rproc_stop() stops the
subdevices. That would change the core for every driver to fix an
ordering problem inside the qcom drivers, so I kept the change local.
I'm happy to rework it that way if Bjorn or Mathieu prefer it.

Thanks again,
Jure
