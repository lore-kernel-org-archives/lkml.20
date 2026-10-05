Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB924DEC3D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231327; cv=none; b=qsKpSjWDZg7J0kLsXMWVPz9P5H0uKIPdQN6LzSICNLi7n2SywKU9Uhh7aplaAYr04wj3Uk9E66Nf2bmoiza/h6clBVEqpHyFCF+yv2wVQq2z8+HCHTcBoCcdZwIoKEe6+OCc2vI9XuWCy8jC3PwkM8/DuVr909TDf5FxEVDnAJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231327; c=relaxed/simple;
	bh=PsxZfXvHhjPTT7xVmNsmNg17aOdYlA6JQ4QoJ8wnTfo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=kxrICqkCxzT3Bkow8pBi7UqIHrkcnzq+VejBB4YQONwjgPynRkAQTmFuh29nQVqqQefr3ETMWcnbMso5JgVrIekwqeAZn10yeMM2hnukIf7VKjHVvcUxkpBGXSw3TjI8Wk7DpbixrTd8/Oy1rrOft5xhwiwxcrr+eZjY49ib2Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FHv4h20S; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FHv4h20S"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so958405a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231321; x=1791836121;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PsxZfXvHhjPTT7xVmNsmNg17aOdYlA6JQ4QoJ8wnTfo=;
        b=HyIT0vfKgwdvIyd17X+lJapZ0FtXKL0M0ivUGcpsIEhHbRLXEf5Wdzav/1ZGl8sDSC
         /YqnfnCufefsV/tP1t6t9MCjqPCXk9x1evENXx+OcbuBMHZSRqOzGJvOtPIZ/dgr/opA
         gZOGBtf/AIq1RtJ+5ZJrdOxJSr3kBaq6SFiACxfV1k7sDz+Q3BD/W93P5htAGxRMEWiN
         q4J8W88gy9u56G8Lls3Lv3rlK2BGXOAQ6buukRkDi3qJPuM1c7H4dYtAhpfMordhqZP+
         I42Eg7QEDpFeQ7TJVa9qT945W+YPSnBeIfGnhW8o54UDlPvVrLAs9xd/vEh/KqbpwBjp
         kNJA==
X-Forwarded-Encrypted: i=1; AKwUvBwRnlz9yllKCfcL5uYcX9IaVIjI8dIBbV9VyFzRqNjsy7QSakcM+Ou7yFi6Z9RUXZTwT9PIeL1lkGt5ejg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjFvDX6D1vrJG8uhE+eTiPCN7iD8LyVGa3Fpit1RqsFMQn8jRX
	L1v/ABSAzj42Eg17ikdyzat342dLpY/BmFzOJTi0RdeYWjk1lb7G6YCO+upDkDATAZ07as3CeLe
	d8+dOoNTmtFXmt7hNPX7urv8C7UyNuOkBG6tQYlZ0dX8h98RaYiKSlZHh/yFjXu4UlqY9TAWUaR
	Z9fd0XalALlpXd61xoK9NgN0OeWT7S2LoQKQIZKF0jktlOw+P01tq6sUTQIBb1FNCFpkWwsmE2p
	++Vl5hYK5aYJuKGPafQxGan
X-Gm-Gg: AYBFou1Iu7EpevgBbR+aYKI3TvrZXy+ws7AmAZJuoiXjoZyO+0xRscqouTQggH5GlVN
	k9FsywI+YloAcFgD+ePRz7YQMUQ4YiJJdjo6nZ7LSKBZTCZLvoeqwKwWcJYUp1O6sCvdxNrivbW
	b4RlSp5kmoKYkwRsnNUwXIWLNu35C9+6g+QZeqq6ZaQyTt4jz/TW4hiqDN7l+5twLMnjd4Ui+7o
	lQUXTTZy/PPZ7vRwafIm9IuAuTi+Oqi7PfLPf0bAwPcRF6unmKOQH9sKId6MFW8WAeqA77wYpFp
	SnLpAxbfu7FIey5lAj2Jt1weSmrN4MzlscQIK6U+usyZgk1GjK0u+yPMh/AWV2j9/Vpq7ZzOGZm
	hAv26sBnl/h7eU7g1TstXQnaMTfTKpzF9pMcR1stxPp/RrvaWivlqk1SEjJxbNliO4oowRJj2MN
	aaYcelj7Ct4f+5BEl5izTTiAMxccPU83dQyf5a+eHs5Wk=
X-Received: by 2002:a17:90b:4ecd:b0:3a5:25e:85fc with SMTP id 98e67ed59e1d1-3a787750979mr6710096a91.63.1791231320492;
        Mon, 05 Oct 2026 13:15:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a85133a023sm296132a91.0.2026.10.05.13.15.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 13:15:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93be1861d2dso360755585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791231319; x=1791836119; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PsxZfXvHhjPTT7xVmNsmNg17aOdYlA6JQ4QoJ8wnTfo=;
        b=FHv4h20SKzQAxQrtpj+ZS71JXQxYtCHoFsEEnbk9QkL4JBjYdEOnWfcfuxwuA/4bZ+
         7UEpdmNLtDOTOi1fdhciMFqFmxacRlc+2Gq1utQ7mGgEZprzgDsk2jrpknyLSv4U+OF0
         FpEJDtKHnntCSkUG9Y4d6FQv23mT+ZKLJEDPM=
X-Forwarded-Encrypted: i=1; AKwUvBwQ4JWADXDDiyxfbmGgj9ZCjCK0LnMTTd88xvTboCZKp7CPKm84a0ySGP6Nu/mGIRNe00XvU7fuTbDgzGc=@vger.kernel.org
X-Received: by 2002:a05:620a:4413:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-93e510fc7admr1406613485a.66.1791231319120;
        Mon, 05 Oct 2026 13:15:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4413:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-93e510fc7admr1406606785a.66.1791231318460;
        Mon, 05 Oct 2026 13:15:18 -0700 (PDT)
Received: from localhost ([192.19.50.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2c96f4sm949911185a.43.2026.10.05.13.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 13:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 13:16:18 -0700
Message-Id: <DLX6J39ZERYJ.377I7R20BGISX@broadcom.com>
To: "Aldo Ariel Panzardo" <qwe.aldo@gmail.com>, <zack.rusin@broadcom.com>
Cc: <bcm-kernel-feedback-list@broadcom.com>,
 <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/vmwgfx: do not hand the embedded sg_table to the
 PRIME core
From: "Maaz Mombasawala <maaz.mombasawala@broadcom.com>"
 <maaz.mombasawala@broadcom.com>
X-Mailer: aerc 0.17.0
References: <DLUS51Y9OLMS.UQR4UY71TFUP@broadcom.com>
 <20261003163851.2257947-1-qwe.aldo@gmail.com>
In-Reply-To: <20261003163851.2257947-1-qwe.aldo@gmail.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,
I see you are using qemu for virtualization. That is not something we test =
and
support, can you recreate this bug and do the fix on vmware workstation
instead?
Also please do an igt run to make sure there are no regressions with your f=
ix.

--=20
Maaz Mombasawala <maaz.mombasawala@broadcom.com>=20

