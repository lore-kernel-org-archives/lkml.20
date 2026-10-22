Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680355;
	b=MfETUZlKgaknhgNa80Q951kC8Xmk8ZdJphMI4d0oSzvkXXdyiVzD7hRLt2aOVhzL3tG1
	 Z7wG3XPF6eJ0/TxfaxNWn8tcNfUlRySEGUuxKoQjrB/Ow0eoE7fMtfVWzOxKwVgOrEkS6
	 VNimBKs8lOSlTEOQoMQ6Fo32UYL1mJLbR0QZnObbtP/7xfH56TkmXc12DIUkc2Wid+Ika
	 HvGn99564I2dCzAaqrriQ2bJTy5uDmtLt7pDrWuUl+XF2y8Jg1IkrlLlan+rLsZrSpDoe
	 AqI28XU2dKouCqJtMCxdNgq4JrqYAIRBp4NCzuFHqyJbId2Q9+hhrKArMORDr/C6gBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HS2nYUP5ow9Zp0MfzPStFKFHiEiipsNUBE3EourQz5U=;
	b=i7YVt5k5NJcrKHf6UPCgATyGm2EyhFxXI0nJGcdrPQ3c2qDEcU9wgQwKdGBmQmi18EQf
	 B9uIhooJ5/sdn6f9YJ2G09/gqyrPdrz45xVYH4Euq4fwJmn3AR7EQuWPagdpXcwL2A50s
	 W6T48FaIkYmvpUmdcyfGYEjKlHCrAq1br2L7e0fdmo0WzOAYvT+C/wD8M1DRiEQPbFr/M
	 8ugUNE843nDuQbasewjbKe62LjpYtyDEBzXevYz1z/VKPQG+ncDQJ5dplSiW1q4Z6o1wH
	 9tujVhWoQig54RqCklwJgx1LgVPLiDN7Pc2uIGbgPtg8OuRtOpxIDGxDMV34k4etrTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qBNLJbzy;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64398606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64398606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qBNLJbzy
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso576637a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792680355; x=1793285155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HS2nYUP5ow9Zp0MfzPStFKFHiEiipsNUBE3EourQz5U=;
        b=qBNLJbzyQ2fv9FJJZOr8XO2+DYEM9XBI3CpfM2+b/SPLKiMsDlJZQrMSr++dmOT1LS
         OxzwP8FIXM5d/9mkVTFj6in4DKBcl8IsYD3pldGLfLoOYLfFv0zVF8+1oqWZVYLOHPh6
         z5KS1ApsTdd5TJFmv6N3bjVE/QZz4IDsrCRjFue/lWVRZPMjYWCzez7jjNwnQWZUfxyP
         bBA3zd4jd7iWBpgb24N62Cc7h/nlKVB8tMHrLZOk7D4ZVcUhtvsjhzkP2eFPWbe3vKnU
         glLIe/5+aQutul0CSUe+RWL4WB9TbRonzcS4ZMaAYffs7UOPI4Qt05s5PX98DtoF14Xp
         gtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680355; x=1793285155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HS2nYUP5ow9Zp0MfzPStFKFHiEiipsNUBE3EourQz5U=;
        b=bmMX9mo69f9z/Maulors4nClufsAqD8oOn0RrFS/PQW+RK7n5AQe4yu72INq1fbOqe
         kTP3nQLDnLl/4Gdak1E6vO4zj0SpMOAlIUFoc1WTmTshMmPZiROsIzXTEJ5kmmfnSN3Y
         ygmFQNxtK5qqZtu0uJkCM/Sr4fXpxb//vDHOmmy5Hhz7buCz6uorKB6Vk72M1NmthrlT
         uwACdt19VvbgGsqyWoxEvel8t8YoZwp/iTkx4stnX76dBFlzEHjZ2l5orpTTqWYTUW4a
         WE/fVfX1ZMXbzr8XPp7PIE9VJYwP+teCeBJ2Prjjbm7pfaxFkfDGuvT6eFoAp/3CyWtj
         WqhQ==
X-Forwarded-Encrypted: i=1; AKwUvByG39ZEFDSHfm4cn7VlaJicTGqmqFFX+LzykzmYuWroReToKTdKHTLTPE9+BjxbrpVq7klZF2TYBN/Chl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+Oe8aR7DoU+ePVSFB6Mpeq8Y5YdVX5T5tNTICl1sGzztTcA4U
	kR8fglVw6PS/q6VRGecVuSmaRTdMg4pAH57mDE/IZjFFXhFRK8amaxSwifP2VOlGHFs=
X-Gm-Gg: AYBFou18SXstVfGlxFgusrn8B/6xx96yZqyjL10L87wguiI/pu6WM1H3uXqqsK3TGKA
	RHfBAWhbwMhTgYFrr57L3UoVt5jz+QCIKNQEcSTkx8O8HQXwjPtlDhuTxnkBPH1Bqkd+8YxTr7L
	z4W8iD0LabVrq0DjnwX8Hw+r9MQfaqEDC6mCxh6wIWw/J8OFCrawR5/mOpMIe5ddL1l1qRqCT1s
	EtL3KHAZW4WTcJQ99tv7pkpfR+L+uEy0Exqt1sf1gTWzxcXa89qTkLfB04IcP1VdFVuWGlPZPR7
	fECuClpUT4WZzEm2XTXyxhCn6fUpL8ky34i7Y85NDmAh4I5/bB4kcXNC2wQDHxUn07wG6L6QQ7y
	pBFsv9KbNwYwo5qgEUyvsKIxzpnkzQtRLGth7TVkdrW2yiLecb2GOji4stWStVSF8TnKKtC1ZL+
	BRg9pV0ojiw3E77ZaKKWszhA/f0cgoHtU8ZO+J4DKcYsTVSEYr7PPxAe4xvT2zZ3KUASFB64X72
	qr+GyiTC/MlDRiGQHGoOYsDKLa/WLBgpfsv4P1ZgVoVNiC7v004vmz+ilFSWli/5rfQRpppWZLJ
	muY=
X-Received: by 2002:a17:90b:4d85:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ad86ccc8a6mr4599506a91.11.1792680354722;
        Thu, 22 Oct 2026 07:45:54 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:13e0:b266:5a7d:e119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48ed74bsm4551444a91.3.2026.10.22.07.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:45:54 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v2] RDMA/srpt: bound the indirect descriptor table and widen the counters
Date: Thu, 22 Oct 2026 23:45:18 +0900
Message-ID: <20261022144518.2991452-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021001854.2343027-1-yhlee@isslab.korea.ac.kr>
References: <20261021001854.2343027-1-yhlee@isslab.korea.ac.kr>
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

Thanks, all three are addressed in v3.

It is two patches now, the descriptor-table bound and the counter
widening, each with its own Fixes tag. The widening patch says that
n_rdma accumulates the rdma_rw_ctx_init() work request counts, so it can
pass 255 with a handful of descriptors rather than only at 256
descriptors. The separate header pre-check is gone, folded into the one
room test after the existing count guard, since the header never falls
outside the buffer.

v3 is at
https://lore.kernel.org/r/20261022143901.2991062-1-yhlee@isslab.korea.ac.kr
