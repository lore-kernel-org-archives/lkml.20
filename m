Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0451451599E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904420; cv=none; b=L70KL6vF77Uu6g/8KAxV9B/OFOg6EO7hQtZuxdr3+O/gkRDDKhAwwgntkjOwqMzVKTmiBwHmmKEoEGwAdgtsd2lJVVYK0tR8moRNjG066w8VgdUNVDUQQYIpU/dB2NWeuK93d+df21FGKG3Y7zveV8DhX9BvJyZ9Zh8+F+4AJ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904420; c=relaxed/simple;
	bh=fxKrLbuOEmB5AkcOmcb4Fp+IPQhQ9N+SgUmQy4QU0js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgGZeZWdI9n54QhB3Awqoa1w4YhcqlSjVcw7OYAgJ8USfR+dF3rvNaQyv/KsfsWNv28LX0fheFvirCF5k++1FzjKIH52WAUaRDDRwW7Z0oMt89M97Fz/pJipL4I4jeDy6r0aNnnIdzm9Ncz3thiCSbMpo2DeisLhTwFfYqYoCPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=JLx8teJm; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="JLx8teJm"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-892734ce7e6so1170894b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791904418; x=1792509218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdGTvBWv6RVTx72b2QrJCUkExOa8bBmrCbj+7tkLEbw=;
        b=JLx8teJmtyxOWy33mu11FtSCRxc6QYXqZDXf4zUkvR/S/K/H175g/8tmorAoWYIJYg
         dVP3I5KVOCJ4WkPIKFl5SuvkvuJlCOAZgsu6/8OiWvN12XIFGzzDqbRt0MsMZ5xrzbDE
         QVugQBMVVR+yKDo83z/AQjvebi6ZG/tfJz32HmyOnz+QiDWddwwRNI94H/NaivXv83tk
         +wyzoDw312RPWJ3gh124VOA1BvGU41VAoK+4n22dvOajrT+EehJczVEBIyFgY4BwaS0k
         k7HXuH9HBMIgLB1+P7PfvykbYFviqwtJoXHuY55pXATVKdIAg372qd6clTZremMCNqi0
         TD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904418; x=1792509218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdGTvBWv6RVTx72b2QrJCUkExOa8bBmrCbj+7tkLEbw=;
        b=z3j8EZra69Ir4QygCbi8T+Zvr2V6H56jcZ2WlorcR2QLwsZqn0dgKRDQSCkfq0BIXc
         QEnSecg3jQp83SrylSU3Kg/m2ZK7IWLGPNhs5qwNEq7vPoWIvW7R5Vzde/Od4WxR7dtV
         7xkus0KcCv0QUgTFeOYuExIgV1N25/xShYU8o2oBfy387B7kp+6UaB7OrN2L4ZfxLSjS
         XeqVSQEc4btmf/9GU/x6ByQ3YvVzXWpQIlSVnI+DnJw7ygNLKAu0tZUDMV3BYUOqpwJ4
         NkJKwHXgY5jKv48wRopBSCMRmsKmNjzPl8bbc2iCW8f1LN8cO6GdWn5PO5O33ehnidy/
         9Wjw==
X-Forwarded-Encrypted: i=1; AKwUvBziHzp3SYVTnSx3XW5MFby7mJzg9C28QdJiv4raAUmTuBDRV87Wz38ZD3wah+TkmSdzknpV/QHd8P8mh+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1N6R4grS0Uuqnjwe8/lmECaYc4J8/YsVQ45zUGujALiH6jtn8
	VxpIvHfAzpbkgDfrcBXhAXAcFsrUqhfN7kVUYM0AR7SpEDO+0ZjV7OexGOIpqthfm0k=
X-Gm-Gg: AYBFou0omJqHulaTXFCyMsnOAaU59kmB7ikmTYSQDLujxSs/s01RWjRLlYqi9IAVEZX
	elELLb8saRl2G1wrm5q6O0zglVjW+TxLI/HsVrAQ3Ly0YSdZAxZklssFUYzs5A5HddCGP/SFqfY
	WZnG/btEPck+GXCZpoLeNa9Tc6bOhAIh+xGabqMteZnk1bqNcoYcOy7z6FFaU0cIROCOOd9+/dt
	PHMTO+TEE+Kf8YJW4UtMIbV6vU73ULjgTCmfpQUMsg8o/fb5YJVgW1yTzRxLXT9usw5WqRwvyTl
	9L/nKU+M+GESdD0sXRPnXXmk55p7KnzwN1qST/tDEnZOEGoF2sd9SRLuLSW7NX2Lc6ckRLs9VQ0
	BH1j4a4JrzFEO572D5H/CR+AbLLus4tIo3cXy+MGnKa+WaHrh7buEXUyNDqMbjG22Dn5Ylbtvp7
	YbEQuioU1fZ2geOFE0PUgJrN8HHX9hPgiAQuPOTB8xtz1ClZSztE/DHJmInXlDRQVdzpdPXbBIc
	v64vI26bOX6L/K5LFho
X-Received: by 2002:a05:6a00:2e95:b0:874:708d:b620 with SMTP id d2e1a72fcca58-897c6e1be95mr10797802b3a.30.1791904418255;
        Tue, 13 Oct 2026 08:13:38 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c37e267csm5363547b3a.27.2026.10.13.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:13:36 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	aacraid@microsemi.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH 2/2] scsi: aacraid: bound the HBA sense response copy to the source buffer
Date: Wed, 14 Oct 2026 00:13:25 +0900
Message-ID: <20261013151325.3169759-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-169893@kernel.org>
References: <20261013140214.3156938-1-yhlee@isslab.korea.ac.kr> <20261013140214.3156938-3-yhlee@isslab.korea.ac.kr> <sashiko-outbox-169893@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You are right.  struct aac_native_hba backs err with a 512-byte union
(resp.err / resp_bytes[FW_ERROR_BUFFER_SIZE]), so the copy stayed within
that buffer -- it is not an out-of-bounds read -- and capping the length
to the 32-byte sense_response_buf would have truncated valid sense data.
I have dropped this patch; v2 keeps only the SRB bound:
https://lore.kernel.org/linux-scsi/20261013150420.3168223-1-yhlee@isslab.korea.ac.kr/
