Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDB451C05E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995313; cv=none; b=Ivc9MjQHZ4jSu+e+JJ16jtUQEjmqD+vaeQB3taDcIG6J1m7voTM8WvoiSbinXWNKs8nB6S1ywNCwN2b1focYohVeO0+575P96sAXNZAIWEEqyOXATImfsEDxDu0SdSzC8FQpZx7mB7ue8nUvWgSUHRhbK3v71S6Sup3fp3+xVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995313; c=relaxed/simple;
	bh=yPehagrcDiSo/RPxpFDGlChD/sFaJFFXbcf24P4/SZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDyV6jRW9+iNQyv/nMCrlUQk5PaUtWNxh8pPA69jjav9e7Qp+u23X0SCwnwKSQvFo9IDFUcrPx/E36KPhYMbTBfNd5/aGIKEMMcvBuYOdC70do08gC6oJLUHXod+JUw2Bb8Y31s0I4LBahpbrWB2T80+fxhiBf0EqpHVLZhCdsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=lIRYVvwC; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="lIRYVvwC"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so456624a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791995312; x=1792600112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yPehagrcDiSo/RPxpFDGlChD/sFaJFFXbcf24P4/SZQ=;
        b=lIRYVvwCOSB2o6vXGaZ8hE9lYCM4YxgmSpYD5ifRiWsoLelYQcOxudtPE+/Z377njL
         Hd9H/tzcAJSFxeaHTH0wgE/KIZi43UDkWF15h86S3hhYPa2CgVbzgxw/GAWcRfaO0Q8b
         +KUr/5aKFIS/uQtXGj3ATpC9ZdRjGv3qhYKtb2TqWqI435vBuLmYGkpqrwMzDVUIossl
         PHg4KbXiroeZq5+jctCfPUaR/uH6dGpN2b2Kqw0UVdLuQInviKgdBxv0zwR6tb5vzO8x
         hLjZC2DH2VvXIv4Q/sKnJEkcAd8szuwpDpr7qth8Dq3ItVM0H/qH0PwWxk7HvijAsb6x
         nqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995312; x=1792600112;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPehagrcDiSo/RPxpFDGlChD/sFaJFFXbcf24P4/SZQ=;
        b=tbe18JyvdVNPtXGFOM7jl9u37qw7g7DoHzi6cWoHYhkacp2ElS0KbxiHuC3sMzCd+6
         pRi7QOqKAFKSmw3FaVGGI7jD+fdKX/Etq/UuTRHYi4uSRRFSWa+hcrXc7nNayZY7VY20
         okxLorni6qf7x0b/Qd3TJIRRNeYBj+ihHlU74zmUQRfdJAzVa6BPM4P7F6VeL4i8fAFL
         h39goqLoF3ciKe2x0rzCHlvFqJDffzEjqFtT3RIRPx71Xcl7AKwKvLxuLJObDaQi9WVO
         8o72Q+aWVbZdvXSuYP1Rmg7an+J5pFh1hlmcSQKtl47O+A/xXZ8yVIuitlP41o2+nU8N
         eclA==
X-Forwarded-Encrypted: i=1; AKwUvBzdKNWZMVU4Yb7O3czBJQv7Xd+qB62VpIfau+idaNR+LT6Ejf5AwAgjXHQFArgYVN7c+7lSWQapNzyM7fM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVt8ALFeoGZJxVuHrCeKTq/efZTfGM5qwmJZy0d2y3gzhE0ck+
	HMEJDMUcmYcDkTSQafTKaW9ndWkpE0i+Ll5uykIifHsHVGHHJtH3699fzDf9dAWhahpVmiLVtY2
	kvW37
X-Gm-Gg: AYBFou3XQEVKPqtwYZB+TdkrBk2WtfTCnnNa6qAET4D1M1a5fdpm6KGxgekd+uMvYi+
	LqKxuhdI+OY5uZc9uwtea9vYTsDKp32qsM1RVMOKZXCge7WGYfoqtOAZuLQJiq0JiLTrovLKmve
	UBAXbCiUenMLxDc7MVIT1DgkZDUjmeTJ9pOVt3/9m0O066cbsMZUHAfhjYoscbspk4ALpNleR5G
	LbJBi1sDVrmsmEm9sBigPwTshWoH2dztZwFiUwmVFoyCJ7OMrn0kQPdeTtCQx6TQfXWdL3xccvi
	0zu+eswztlTy2ohyzGxH6vDri6r4iOKtxq3e3qY6gyhtAHPv7zE+eFE0zYhIODtexuebH7tTZmT
	X4bIsvW3McvzfqJg5RXjdXxBykPPzaNKcR7rInXT/w4LHis+NubMfzotPwA2KbWF0yEU5kQoPxp
	6BmX37seT6eiXSUektTDS+97vqvSofXeaD84OJ8hEGDs6Hb+XYOlv7biAOabVdzqEe/oVez0hqn
	qYMmyxW+2QcBxotyFPJ
X-Received: by 2002:a17:90b:2681:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ab3a9127f1mr12794263a91.20.1791995311706;
        Wed, 14 Oct 2026 09:28:31 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:1c49:61ee:8c8:3f4c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm114910a91.14.2026.10.14.09.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:28:31 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v5 0/6] scsi: mvumi: bound the values the firmware supplies
Date: Thu, 15 Oct 2026 01:28:18 +0900
Message-ID: <20261014162818.3650987-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014151914.3632701-1-yhlee@isslab.korea.ac.kr>
References: <20261014151914.3632701-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Superseded by [PATCH v6 0/5],
<20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>.

The real defects the reviews on this series found are fixed there: the
target/LUN alias from 6/6 is now a device-count bound in 4/5, the shift
counts 4/5 checks are read with READ_ONCE() so the checked value is the
shifted one, the hotplug bitmap is bounded by the transfer length rather
than the buffer, and the response frame tag is validated where it is used.

The rest I did not change, and the v6 cover letter says why: the driver has
no device-to-host endianness conversion anywhere, so converting one field
would be inconsistent; the bitmap alignment, the size >> 3 overlap and the
truncating shift in mvumi_delete_internal_cmd() are pre-existing and want
their own patches; keeping the sizes across a shrinking reset is correct
because the driver is what publishes them; and there is no ordering pair
for a dma_rmb() to protect.
