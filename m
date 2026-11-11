Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378586;
	b=oGEXXraqVMDaTvNLT/kk9eIRy15uR58jZKUaoCTVWI12nSt73PdNgp+c7XtfwyzIANUG
	 AOJBpi2scN2C/HOYzIGlLQ5RlDYmtncdsU5hBAnW+PKBokOp2UnCFUX2ZkdHn5OjXYlM8
	 TZ9kTFz0qF65wDhojG3979dNdK3/qsOnea/ztW5dOvHhPC46gVB7EIM8/Cs9T6bXUuF6w
	 lEpGiCcs6JcB1ao3mxkwmzmWMVpPhEOO6kqOQBZM35qsG8mzaZgf7kG7PRjkFNSyYLqqZ
	 GDA8AFoTOaN4DYbBlsxhksuXcutTGtH3TlwpzkRxHs0E6JNFDwZ5P/p49fSECrbZ7fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=982skjmQWlVWeCR0dvMpkvy4QcIduHPcJMkY3lSuKFM=;
	b=Ippj0V51bMcDL7ZlF9f+l7Ig3XEZTW/7mREibYXN75xYssU8mp3Mam2GqV29RkAR8Wx1
	 gNbSLSOzEAS7cwfUy/6ZPTHWoffMsBDLv6LYJ8b0qKCJNBZ24x9PCT2UA9bxDI9CAt14M
	 YDjw/kaXr94SQPKGbrZ4+IhSdPMy3YTw4CQt/Bi2KBlPM48ZAFGnE4uPs6EfxpJjelZN2
	 sb8iIQx+qwyujQ4qT0L0Yb23nW9S2EVSGKptudU2qb0KaxbAHzgIy/geYhIl9tp/Uemi2
	 e1vPd35Ml/AtuG05Ax3btpCoLMI1Ux9zoWdtGayIjoToX7QMMtHoUHzvABx5io1AYRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcGrU7AJ;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE91606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE91606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcGrU7AJ
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b904d10882so1274321b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378585; x=1794983385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=982skjmQWlVWeCR0dvMpkvy4QcIduHPcJMkY3lSuKFM=;
        b=rcGrU7AJZ3TRwLxUVeh9SZu6G7z3Wc5rpfM3PG1/5MlZKLWZKgUvDi5n/3XZ286nHt
         QXztxMQgJG6fjXgy23xxlv7srj+3uMgioYvgKHhFj4vBlMwfGh0aCS/qinuKzS2Sip4i
         vNMFBtM0c/iaERTORa7SiSECAI+Do/24rzSbAQ9zg0mKPU/WpOXjbrcHFvHX79j8ERVc
         gT66+DBO48fwF40KLU1poVQOsTfHuTEPKmIWohfbMcXNOmGQ79IPgWQpROsMDsEd+ztX
         PrhlumJwpM3pQt3PSOLMQeQ6yimeXzFfJngh8XwVjtn+kyFI/Gfr42g3+T5V/pTdzoBu
         U2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378585; x=1794983385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=982skjmQWlVWeCR0dvMpkvy4QcIduHPcJMkY3lSuKFM=;
        b=bL/DOXcC2hUZ5B+a54990X/CqpRr/rwGAslUfNac22PzFryazjbUa0vu7Fh362FxHn
         9Al6OYH2vVD2LW16AJGexDqy/bcw58BKF/bx2Kdd53kL6HBtH4b9qUI1J7cbaNXba29x
         NLcDZ+l7E2EiS4dW+GtHJN17fKjR8LKhA4vHNLlDNoU51ZnL7E6zb46du+WK6WRKbu0X
         F/X8u/CPmph5Bx897wgeJA4TTtE0o2RI7rNT5FgBHQRyN2dwt2sHwh4YZX9/slc8MMAg
         aYrZCvK448QJ+06HTGcYHJ6/BLTnkGqvD81PEPPTwbIgoze+qP0OweepGHvU/jZmSZ3V
         BJwQ==
X-Forwarded-Encrypted: i=1; AL+hErGxuYQDnBjo7usvuvAr9LiFcES8TrlHlu0VKptEmg1DvBbtStzrREpzAbVGgamk9ba/Lzv+D0mQr9tTCUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Kce4KXvW0HHHFI5R5RTZ3r9gss2ojwEUhf5gopUHRPC5PoT2C
	cK0+Fm7mXPxxjGXfZusBbrLkqXOBy4fBG9SrzQrWInCQdV03edvH2EuE
X-Gm-Gg: AYBFou3DzThjKAbYahwQij5S7AWo52xVWi5twELr/9xWz5pGlfJahgEjWSfFZzXxo6g
	DHudiRoA/n7moslySkLB3RNtle4oSfYCUot5bGlbyVt/KbofmbaftuOjHMMw+kK06GXPPGrmDEj
	0x0sGafjVLpvyyd2fTeWLetAr8Cu68NLqBlBw9tQzGvqi58Gm3HKFQsbDUeVKF+aixEH5K83Zc/
	iKMleF7AhKOUL6yV3gympp1HDwlExDrtw2t+Enlv0HCN199dBtOPUhIYvCwRR+zLmWe6hdmBzzm
	HAEU0utZXjZ/r8JxMiI1fPRjrVF7OgTjoVkk30d/ZfJe2zSl9xnyvgrFtYdrRJ+rbShkohWovui
	ylJSTAhx2osnd2wJ1XkugrbICKEX3igNBUZNZo/J60c756+8kPaWbB1sfedyIS1WeKHyf86/lIb
	ZVHRB3EmD8KwKAcKlvZMKJ7+mOWIKVrKaRvaVKjHf1PO1QecSoLQkydVoR7ZHhv1CBx+W8ygG8C
	9K4x7hoC3n8OSxy9C1XRvWada2jziH/iQn0YOrBtz63REVZ5EQDfTNDkJMiFXB/EJYu+feF4rBa
	Ji6iIBhG7ipOtGHfnlJ8O+yw39lejETFUq6Qfo2EtQ==
X-Received: by 2002:a05:6a00:2343:b0:8a0:3336:4b45 with SMTP id d2e1a72fcca58-8bc1c594810mr1681640b3a.12.1794378584851;
        Tue, 10 Nov 2026 22:29:44 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e25esm1768266b3a.37.2026.11.10.22.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:29:44 -0800 (PST)
From: liuyong <pkfxxxing@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: [PATCH v2] RDMA/srpt: Limit read data transfers to the command length
Date: Wed, 11 Nov 2026 14:28:50 +0800
Message-ID: <20261111062852.1279950-1-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2e748067-f733-4edc-b71b-540de4bc3d26@acm.org>
References: <20261110030809.913063-1-pkfxxxing@gmail.com> <20261110030809.913063-2-pkfxxxing@gmail.com> <20261110052827.963143-1-pkfxxxing@gmail.com> <2e748067-f733-4edc-b71b-540de4bc3d26@acm.org>
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

Hi Bart,

> For the second case,
> srpt_get_desc_tbl() should reject SRP_CMD requests for which the sum
> of the direct descriptor lengths does not match the total length in
> the indirect buffer descriptor instead of building RDMA contexts for
> an inconsistent descriptor table.

Agreed. In v3, srpt_get_desc_tbl() sums the direct descriptor lengths in
u64 and rejects a total that differs from idb->len before allocating
RDMA contexts. The existing descriptor-count check is preserved.
I also initialize the command before returning BUSY for a parsing error,
so the response and completion paths have a valid command reference.

> - In srpt_queue_response(), zero the part of the data buffer beyond
>   cmd->data_length, e.g. with sg_zero_buffer(), if the data buffer is
>   larger than cmd->data_length.

I have replaced the WR/SGE modification loop with tail zeroing using
sg_zero_buffer(). v3 saves the original buffer length and clears the
unused tail before posting the existing RDMA transfers. Each separately
mapped SG list is synchronized for device access after zeroing. The work
requests and SGEs returned by the RDMA R/W API are left unchanged.

Thanks for the review and suggestions.

Regards,
liuyong
360 Vulnerability Research Institute
