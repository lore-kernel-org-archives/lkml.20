Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016394;
	b=sZTAorYoG8KZVD5rSaNEv3Lvk7voaCBLiwhILyDMFtQShUJ5xpCwhf2mx61jV7Gb4nAE
	 zHqPKl6B/j4DIw5lwYxdaNDZ+S8HlnHd43C5+0XEEm6fY2qEFN+FkKHAeLUM630Hgp98z
	 WTfvfi3/5p/+UrpqIEfOMsOKGDUZOmcaVhMj7X983vpVW0R9XwNYg5+lcRYSykW/D6Imp
	 2+iMqgdnvTUB/AwwTpElBDkt/iJPkDs0WgdYY0EbsC+hfqLW2lTVqweKjQ1WxgAHEI6SA
	 b3eV08+368+WTmkNO76FySNRDz3HnlYQcCCU3TjbdSLw/HObINv2aDSXBl6km0sNGbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
	b=YCYOmGVpkNgFuAtOvzSlbfVhh9ACWe5Tz41lhTdXo3WaBa09ei1r72Gg/hOYfCb9JXs9
	 XAeW9HFC40E1HMGIZrjbxpc8K8m7+QaOhGkR1fFwSuikvAoGLIb24ZZJpHDey/7VFXbv/
	 9u0vamAVynQybWG/DsRpTuAR1cckzU1hSOiRZK/MB7ATH6bTa1NybzZRPVUbHucJ+pcoX
	 1XUDP6c89rSnYusyh6YG7N3sv2eZwxrBtomZ5lAvAV+xGU4D3K7FdYEUvHkMxP4ZJ+H5S
	 eVT2UpP4xOdAlUrWQ0i6XFrRbCCWDNjdf2JTUE48SZ3JcTPXZoqqYdnpH/nrtdBk6Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ei416voR;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A0606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ei416voR
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso1065244a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016392; x=1793621192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=Ei416voR85Y4wg4V5S7yAdpAFhy4iFvnnScN2xR7zmwc9QrWpM8gYXv75zVhHuj/xj
         FJqsZNVa0PBuv6rufuAkmAsDA2F1f65d+4bdEd1lAOqmqW2YUdCMeRaNhWVGEpXIBCNN
         MzukNPXr9JXNOll3kn4Y0KU2x4hKUPfJbn41ejY6zCXlt3Phk5f8AzB5gdX3qZ4ZroIe
         BhpS/pPORgnsn8wYNqYMoODOy/qi2itMtU5yTOdS7zzYkGlPUyeqv0pHIyW/NvVy7tbq
         bRhk0nuKKLMgqZ2Hw8ywkFkndgrc+Q6M0/H+D2H5rosK/UR2cNIf1EUQiZ5H8NVMGwyn
         T4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016392; x=1793621192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=v1oRNjulF8tKrpodzZLeDebUiqwghBgZ6S5FvBigtKLUGhQiEuRLnTGp4M83vWutGt
         yjH3WtQ7Sc3tef7O7RYkGkHvBOfHVqGjZzr6EKqGXRQPE2se/bnc/h3rfjVj3QnB5K1a
         NhXq8EY8fKMr2qEXvosr9CjN9kFenobbzc6ULnWMDf9PKLgHuUUjMBnREYhxei7TAsUp
         DWdiv6PzHZNTt+TDIoVv0cm9iTSbU4P2gh5p40cmLriUopgaQC4p8l1L+d8k2f6aNitk
         bZarCNgRiSD3WjAH++cijc+n0rpvzd2xGVqLd+bwHvT2ZHyXYkQCH8kKcK16wc1cFWn3
         GPoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5AkSSRRlSZyvupHtyq1uyIw8zWUNpp+aSdZzxjtdAUGsspuHHe8+oKf8ttF97YAxAu6iYFFPd0TBwrCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoe3/y68Cpwcsyobk4kzKtU66McqStDlT/rcmP6jWnsfj4g0Gd
	gnBekGsc221z8sqADvn3SAs+S06Gg6wFTyufh/haqTufiFY9eCAWbn0W
X-Gm-Gg: AYBFou2mu5m1UEJhq9ZaF0PrcxzHjvTcvnBVDJXRAKQN6eCYE96bx5NNG28BKij08ug
	O105umJudxSqw+M/O3DCU6aKisSG8gIViPa9Y+VI28sIaQGfuLXkCjaLANqlOjX/lueAilYrjhx
	BeWL2t/DJ0zp4H4pxTvZi14s7VNiJ3MG+rceKe0UQFvqenpAPHQ340mCprmb+VmTnAE/2ecfBDl
	k3hz6efQknJnSkfQIxPAka6RAvjZWLmE5sm2tUYobxfUcYMSmz7sx4w3fOTFKxRACZebEjYRcCj
	qnHm5UDWfOKOTuCn+JaIsrvdEYq1cdb7+mC2i7a34MGrP0vKq7G1vOJW0W4DOXYNM+dl1mhWPEO
	vpY5V5wP4rlRsnu9BJMSw5YZUAMmtK4a9IKUFEtT32b8L+oSjyBoozBgmZ9w8N4GKjNe1cj1+/m
	J2QCqAfaujlKm89/hCPeZl3tVJSY9ZSIk+/pC1uh/5UbF/4SLc651UV0UKfvXT4cn/7fCuefrim
	khdgxFYX1sipNv/Jc7B4RQ8f86I62pRAjXRyeacQY2OPSQD
X-Received: by 2002:a05:6402:a519:20b0:6a9:a362:4646 with SMTP id 4fb4d7f45d1cf-6b442fe1314mr5274732a12.14.1793016392015;
        Mon, 26 Oct 2026 05:06:32 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd11dsm3666492a12.5.2026.10.26.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:06:31 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>,
	Kuen-Han Tsai <khtsai@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: f_ecm: do not notify from ecm_set_alt()
Date: Mon, 26 Oct 2026 09:06:14 -0300
Message-ID: <20261026120614.39338-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023-ncm-ecm-lpm-v1-2-d01e81fbf460@leica-geosystems.com>
References: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com> <20261023-ncm-ecm-lpm-v1-2-d01e81fbf460@leica-geosystems.com>
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

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
