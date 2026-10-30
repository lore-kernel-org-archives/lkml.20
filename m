Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371929;
	b=qPv9u07g1n3sTNMOW2sBQvvvlyIS83BVANDkHCeiAv9KInM/b0CoQBz9p5EN0amZX3K8
	 MO9NYUF0RsRowHdFMWowolXZ9MJWR5YktmDjFbgS0DHRPv4O5jZMUM3oHLY18novKtakP
	 8dd/JuHxJy6uGC6yj+cNJlvK6Xj7kFcWNY3TW4lb7UP7nI5AxL1QXjHfms/O3AomLx+yf
	 p7A/ZMUlmiFiRYUBU2OrR7zeEMLWUDgpxoVzFqaeGT9Mh586hookugcR4ST8FI+Cjj68A
	 H2sIdQQBV0x2SQRf0D8t2IokvWhWb07G/XWnbn/ubJCSV7+nfFJqqo2Pl/ebkGC0pwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g163x61H9dII6XGwSWLDIAMGo8IaSJPWi60NAw+Xfto=;
	b=nQBGeRPOT06DwzjYDqFeu2e0CQSvoKPdk3vjmLjs1jYv1i0U/t5HVznNUMKwI7T8+qtY
	 bzgNV37+ASdorwxE5ge9k/twfIopRNbgJAhBgnN/XnJU750YhmSm/7qAxW+cHqP7VWZQC
	 A+e0bgXXKDa4dDOIJNXglBHsQz/oRQiHKIWLPafkAFyWgsgoyuOBNZuCzSDV74Fcs4ZIC
	 iwD2x9ChKUxPEGHDic044pl+HzFCOvfpDcqya3DUaDvUBmtVI4ZI/O2tp93Vtffq4DZ+S
	 ASU6OtauJd2+5OURWMuX5ul85wXRQ5G83Gb9vjDScBJ3Pyy1NNNc2kF7FZK4jpMLpmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tG9Xukrb;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5216606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5216606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tG9Xukrb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33c10faf6easo122075eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371928; x=1793976728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g163x61H9dII6XGwSWLDIAMGo8IaSJPWi60NAw+Xfto=;
        b=tG9XukrbQwU5DTAS7NjTIMife/zxYH6gpH9Wo47jaFcugMSDs19SfUGdL5IuTDg4Zm
         wN5TVX9yvQTe3m65ZfBZNvdCTncHBCQqBiFi8Dqbg794HMCEL6mmlU4t4DRbdb8fJXqC
         WTG+7jeEqjzWSLYl0bvxQwa2AgMaYjqP95n0cRzil1jOotsNQbVskYChyJc/2YSGSsMf
         Wxjx9chLvz22t3iJJ/uYSbilzXhW8ErRDgxpfab1hLUNU2CY2rEDe+4NzBx0fFiHsQt5
         VYhhJSHx3wnpvmxNpd8opHVA4oOqXWwYmxVR+U0Gx29cg21fuNGPBZcY1hhEZsfUnVH7
         9csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371928; x=1793976728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g163x61H9dII6XGwSWLDIAMGo8IaSJPWi60NAw+Xfto=;
        b=PXbVyplROWeZWCqXDN/0fABu4uXHZ9Q2b0g0bEnUkikJSt+Uca0V7yW8mxLMts2/fU
         pIBWupTCt2ntZimyDTaQH/xfyhMZ1USecOxSH/nwOajqtfx46MW38EV9kEZ7mazbD1zy
         ryAiP2oNeGmxBu9s8eCTztENKZnTlgy3DIezfEujsbIdpfwo9ddBffkatP6jLoBQNPEd
         DDp1+hnowhmCKzu8rYsRmFSc0yNwS2a8wrZudowHSe7QxvR9GIRM5LFU+EvAvyP/pFrw
         4i0Wr8NKxPVAdrpfpqDYqDDts8IPJYviyJG6m3XG/3vHZjgUzcOCOx4H9m79zAY56dba
         UmFA==
X-Gm-Message-State: AFq9FYJ1ummwNAHSY9+5kG04velT1p9a3pXHD1zLYFZPU3a1GtjnA7vf
	mVqbL0sn/N7213F+tC8+VUyfx8srEyx0m5PLxxp2aDuXShL4Q6U6AbCd
X-Gm-Gg: AYBFou3Hd3QoxxYba2ymjGw/KScatPUThFeTOHoJycPT0UOxfC4Iw8bZ15y7XWsZNFI
	wzCRejxNJQBw1svdWfxwNOkUQb33cdIN1SZkoz5JH0WeRS+ANrauLGNX/DZNlaUDgKJ4trZJjtH
	1I5EYWcH5ELYqXASbC8me/t/yiskzL6nSWIVpuduKe5ytNALFrZdJPSNKpgXvGKFCNqDbWR352k
	GCkghasQKyU4e1ZLcMZHTRKkz2ATu4n/VkAF6VvlTkqIn+jyCThCSEY5nPqcWxYgSZm1mgoPH0q
	N+GdF67naJ2SoqpNlkUWxGGgiHLQh0OqSZezkkGi1xzUj9EisBRYG8WTHDUrD9GeSQFno8sXinN
	3LSGwr+rL8sgtyVe2hfxiSl5Vjm85MUVQ3rSiskStmSt6y8Fdy7thcuYB6YDMdaK1YEo+fMwTnx
	/N31S2FJO59Q9TC0qPM48KSpB4QQOYT2aL16cbCszkd0DcJ8/mHdU/9+34HFSBeAJXLQ37JITVh
	Ie1y+/hsEXgJr03BzHLkje5Sf0T6qk0UmLNhbCwq6qzW+amawfBC3/75KYfNWhQ+4WgawbYT0vz
	JPwkNZUlRfWv1m9DSk2o6I3BqInYgGheBT5KU4q4W6RpjreIhqBIWSSgeQgs2z8VqWd0HrMtxDG
	hFg==
X-Received: by 2002:a05:7301:fa6:b0:369:f195:a5ff with SMTP id 5a478bee46e88-36a4231f8e3mr5828224eec.1.1793371927551;
        Fri, 30 Oct 2026 07:52:07 -0700 (PDT)
Received: from tacolabs ([72.251.220.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm9083876eec.20.2026.10.30.07.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:52:07 -0700 (PDT)
From: Reid Downing <skibletz@gmail.com>
To: krzk@kernel.org
Cc: linux-kernel@vger.kernel.org,
	skibletz@gmail.com
Subject: Re: [PATCH v3] memory: fsl_ifc: Clear global controller pointer on probe failure and remove
Date: Fri, 30 Oct 2026 10:51:35 -0400
Message-ID: <20261030145135.915500-1-skibletz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <987c08da-646d-4d34-82f4-da8c3afaed59@kernel.org>
References: <987c08da-646d-4d34-82f4-da8c3afaed59@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

I completely understand. I wasn't able to test the patch, so please feel free to disregard my submission and proceed with your fix.

Thank you for taking the time to review it.

Reid Downing
