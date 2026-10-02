Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86222370A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944710; cv=none; b=NeGmMTNWtkHGFtjU+4vH7gJryu0fPGkn9Dzwu3AD2xlcx80ale0e50VjjeaNvtlDoQqpCdL3aYHatNWCWFcrrSsfgYUm1zzLA7ioMBYS6fyQwV4vNkV5/Olw1ct7erc137mQ+OOccK4xm9Uo7N8qhmTMVLiy2erQVprm7MpChTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944710; c=relaxed/simple;
	bh=tdudn8FwL73/QjaCpm/gp8xrl6jNLqAzbnCEEA/e7jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMEf8Hvd06qKOLumBDhjRFl7/7TAoLTnqOWhpQVsjvzvcUYxEU6WejOwIwjBtKs1DRaQddqDrfdisif5RogosAPA37dJBt8AHW+C35D/YSJDf/Ocpl1uZNiA+zkinlTiWoTOG9I4dckHf9jVHXJagsR4Rqx+7al5Bagy0G35NYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=TcmIeHvw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="TcmIeHvw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso78292795e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790944707; x=1791549507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdudn8FwL73/QjaCpm/gp8xrl6jNLqAzbnCEEA/e7jw=;
        b=TcmIeHvw1saZo1nXDd0gfMKLP9p8zcywwrL/mQrLwQJo1zMsR5koUcJqlaghPW5w7/
         FMuIokYuPIkOeBS2JUl31CwAtl2MmYGAgxxF0IxHAqEDKcnMwYeD9k2gUb9ISn/Ls8At
         OLX+KIRHsO7Y/LIiMk8kJKSPdd3JVXsMkIBekbBz2cxER8foimnLPF/37kw8a48RChQz
         buVJqtRfck6acT4NH5CD2NFrwiX6QlFiu2MwxuqVdvsCsL21IG6Ky4OjvD40Nnig3jci
         DfPPZe5dDeDU4CJWi07R1vYpnIQFtLIrv1lxqnaFfF9UYvooY78IcKuBtpoyK1FNmz5X
         X+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944707; x=1791549507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tdudn8FwL73/QjaCpm/gp8xrl6jNLqAzbnCEEA/e7jw=;
        b=ypvt1enjy4f4811Eanz5F9o8SVOicN0LvValaiWV/rlybL/+K7RkqhxlMmsKCq8SlV
         TFFdvMD9KtIgrQU4iquj9PkM830gJ7628NuvfyvehUXQcXjeceUxddRSLhW9Vza3ltXs
         ja/K940P7IBOVT13ReZIhHtd5NUxpz/nTm8qDRPxwyiFnAo9d7D1B/+QhKlzhM3X558G
         s/l7cEAanhsclJo7I6AvO8vPx9OmW0o2YmB+6Txv7xMjFfjz/OXIauY2mceLrxKOGmPe
         gjJHYbIV32ljewEWxDUi6hcdQ1ByJwoAdhmDlKGVVlQtHFc17368QNxiI/rUHtEGeRAD
         nspQ==
X-Forwarded-Encrypted: i=1; AKwUvBxob5bvmdZKU89b5PWi0aO3C0GhgOc8NJPFyRoO1ioFgzwLsb4zh0cHcCBSK7pwgHEJybJvVDhLVE9NoIw=@vger.kernel.org
X-Gm-Message-State: AFuF++lIxkir31EGL5/pifzYdgcO5YTpr+Y83LWyXECDbJSk9gOjaZ5n
	IuON9osKAfeLAwYWr7A+uNwRSPfhAnOkSPiXy2t6y6gnQeAbRNpHXEXz5/y/FzvYfwE=
X-Gm-Gg: AYBFou363zZKZCnCAs/U7T+/MlWzh+bo66lasUi//NCEcKT6gRv/IK5rzygSyl3xciC
	DUxL52Zlwd35F1zk/3lCLeAv67uvcxACuTZ7foHONP6AaiZ4Cz194FPk001+Ha5Ujau2Xe53Bj8
	8ACNhjf1OfqX3UdaiY9QnxcZkKk25rYyXehE3+VI60gkRk3J3y9gTWeaX5xXRTFBHSmwqylkdct
	UI++aUkQJRljX3NJGK2Ri8/rr2u2TtV5wmLljtGkbecTwMyy6BpOZJ0kK40ig/wiG46SW1Mkqbq
	LrMSJdDUz3ccJ455VoO2FnbdL+1BM2fZaaAQ6qFVNlTRR8fOtZbVHUtmKW5L5kahuezhvab+yhH
	JsRBSFeUB3573QawLvs7O8Ef8vwJez12dgz6U0AEnauu2WEwFOmjAYNH3OJys3/vrbn70w30zOl
	a5PG5/xg1MjIdAz00r1lQj+YQ6DxpOG2gQLnMtwhA1Fc5sJeaWmOi3K5/VHoGfx9MYD2JVc/kca
	z6B9oWRXsezfMlYnbsaaOw10LtpLWjstog=
X-Received: by 2002:a05:600c:b8d:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-4a0276b40a9mr42445835e9.33.1790944707389;
        Fri, 02 Oct 2026 05:38:27 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([83.71.242.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1662fbc9csm24415e9.3.2026.10.02.05.38.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 05:38:27 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: nilay@linux.ibm.com,
	hare@suse.de
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	saravanand@crusoe.ai,
	sjpark@crusoe.ai,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: Re: [PATCH v4 2/2] nvme-multipath: add fail_if_no_path sysfs attribute
Date: Fri,  2 Oct 2026 05:38:25 -0700
Message-ID: <20261002123825.32384-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <573b1136-7fb1-4457-b5a9-9ee07e0c07ce@linux.ibm.com>
References: <20261001094857.74567-1-kiyer@crusoe.ai> <20261001094857.74567-3-kiyer@crusoe.ai> <4a4e228f-7143-4d5a-b773-2c6238852503@suse.de> <20261002105612.25298-1-kiyer@crusoe.ai> <573b1136-7fb1-4457-b5a9-9ee07e0c07ce@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/2/26 5:22 PM, Nilay Shroff wrote:
> The earlier fail_if_no_path name came from the dm-multipath policy, which
> uses the same name for a similar use case. However, I agree that
> fail_if_no_path could be misleading here since it sounds like the inverse
> of QUEUE_IF_NO_PATH.
>
> So I'd vote for fail_on_ctrl_loss for this change.

Thanks both. We have consensus, so I'll send a v5 with the rename:
the attribute, the NVME_NSHEAD flag, the ABI entry, and all references
become fail_on_ctrl_loss / NVME_NSHEAD_FAIL_ON_CTRL_LOSS. No logic
changes otherwise, and I'll carry the Reviewed-by tags on patch 1.

Cheers,
Krishna
