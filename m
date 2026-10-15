Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E03E8C77
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043851; cv=none; b=SCyAu55rXAFmyv6fcPV7x5BNlz3lTA6uwF+ouDiXaG0B4qRIZ0qf7GaLjU0hiWxIgWosUEELgHZUaspsOrlgjoZ68KAgZDWYStMbz0dqe1o1EHiDeU9opvOo46VB1cuPH17OkF2B/TQ1PxfMky4F4z7WYZBboX8qrAMYpHfcVjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043851; c=relaxed/simple;
	bh=Gu9fyWinAvgvqlFRdUdXuUAiYzPurMc/0XfPUDWQ9n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1IY7TUg8QXCPTkY0xVrd8zLX0Y7wnL25UvyC8cQjHR/kpn4AsLlOLtwzNpi1EuAilKw529kENGJk0uKzmPQ3famPB8pRArsTy5o8mGzbuf5z087n/472pkaXJspm8Ku4h1qnGHKCLFtQtMULH/0pm3zVOl6l4UN8MO0CESj50A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=fCx9vPQf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="fCx9vPQf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e915887d9dso17388745ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792043848; x=1792648648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gu9fyWinAvgvqlFRdUdXuUAiYzPurMc/0XfPUDWQ9n8=;
        b=fCx9vPQfVa2v/tHm0I3dRtjRxrpWeT3IHrXPRPQV1pbdhRuEeWYUJr5WY7DXTVRmgB
         +vt8UArJcyWQq7oepRF2ZI63pHEtvCnMBl3OEZAnSpSWmoyHkzMGzKWIBTi8o5oE1LTB
         20a/tj7x44soiNkFLtK9idgOZn+sFHNEBRtMjJOwqzS/4XbO1n2nfoxWPd15JjIqXNvc
         JltIZcrBrDCBNk8MqoOcCAe4iS4O9vU5BpZDxnfOTfs0vGrCqEHiLt+CF6TvnkCdkMF4
         QvLeXDfH0s8CPVh/s0yhRriuZQ0ThF+taSgXQrYGbUVwvWNqi8mqZ5vhP2czL58Q3WwM
         9LCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043848; x=1792648648;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gu9fyWinAvgvqlFRdUdXuUAiYzPurMc/0XfPUDWQ9n8=;
        b=z77n2OjSpcmnPkl4WTn3LgDJKjgBiLW6+WNqtvHrIOBYAeKJF5nnguPHO2AJJBifmx
         xRTnaHmwS9r18lM6/MUnBtVRFN9FG2jP4DL/mFIO8WtEwA/O0tbilZO9IbrObTHecFs4
         LykAxZKa5vu9BGHzZ2VJL1iSWqZByyASjrifdQzQEImkvyxWK3yyUPGIMJzkeq7kSQ6g
         vBbFjV+xHkAyWuEJabS5juEg7cnr61NWSjxjZuYD8NTzqqtXQ6cqvpu/VTLtlPyAgerI
         D62FY2dlr7GzI92QVcydlEu8RhSzFgPYrYrlM2bubVg8mosoSF+DIKYJ5WTyaATPdJvP
         eZ/g==
X-Forwarded-Encrypted: i=1; AKwUvBwIblni6uOVy+JC3tJR1Tx9663lG7M3s9SNhTAmJV6aRihRmLYV+4x4csBk5K8KbpPXV48d0OyTu1l9zl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDqxovQfo9NKXSW5Mk78lAIio/8vrwPFHaEg2ZWm9Me/Co6b1d
	asrT1tp/JplG/a2QUobKpd9jFLPGcsjyfgGLCk4MzhpsD+OU570eM/poY0w4kCG/PNY=
X-Gm-Gg: AYBFou10PR+AwYtXbqBV9DZRUf7rKHLzx8/jgSscAUIaHJSHK10bA0Lm0dT3V3Xu9dv
	+U1WO+G6O5X2ZJYDrvWm35vSdGy9DbtW8TRZVjw/hBdAgEcpRCojD7GA8kRaUuQR0+nZrSyGdmM
	5wngQYsZpC25Pxir+XOSumF+5B8uhBlm6SYRfCNlj1QGzW8vy/K973tGt+I4v3ICkdSUBid0Uk/
	qnULAUJZ5aoZs5WczN1y5N+OgZ8KySVtcEIUYYmggntZZcG1vKe0MuxLdkMyRDQnwu8+GrlSo1U
	kajcLfvd78iZTDUu/HdTEQb/GxMmi8ZmErG5dtmX0NaL/8ox2bRGSeXrH97y/FQnGx4+5zkw3Ej
	MRAHlrLMrYBo9/qaXsW8D/jFLX3hRpU2eG+e2CEtkfeHGBKv9kY5wOMSkTn+ZqukXZKdo3AbswF
	TuI3D00HN6K7z/E8y15ku/JKpYZkDDjh8K5Tp8Zaz2x/6ZzAKEjmbDUw1Q6hd11tWP4698PIW1m
	TSgoA==
X-Received: by 2002:a17:903:2f87:b0:2e2:dc54:3148 with SMTP id d9443c01a7336-2e842f18260mr133884255ad.66.1792043847931;
        Wed, 14 Oct 2026 22:57:27 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b78ecsm80232425ad.48.2026.10.14.22.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:57:27 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-scsi@vger.kernel.org
Cc: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v9 7/9] scsi: mvumi: free the internal command buffer by what was allocated
Date: Thu, 15 Oct 2026 14:57:19 +0900
Message-ID: <20261015055719.3992456-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-172292@kernel.org>
References: <sashiko-outbox-172292@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks. Two points across the v9 reviews.

7/9, the DMA use-after-free on an internal command timeout: this is real,
but it is pre-existing and this series neither introduces nor widens it.
Patch 7 only changes where mvumi_delete_internal_cmd() gets the address and
length it frees -- from the command frame, to fields kept in struct
mvumi_cmd; mvumi_issue_blocked_cmd() and the point at which the buffers are
freed are byte-for-byte what they were before the series. The window is
real: an internal command (scmd is NULL, so SCSI EH is not involved) that
the controller completes after the 45s timeout would have its frame and
data buffer already freed. Closing it needs either an abort of the
outstanding command, or freeing the timed-out buffer only once the
controller is no longer bus-mastering, which today happens only at
pci_disable_device() -- after the buffer is already freed. That is a
teardown-ordering change beyond this series, and I will follow up on it
separately.

3/9, the endianness of param->size: as in the cover letter, the driver does
no device-to-host endian conversion anywhere and uses these fields natively
throughout, so the check follows the existing convention; making the driver
big-endian-correct is the driver-wide __le series noted there.
