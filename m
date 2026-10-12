Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66484B0E32
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819858; cv=none; b=pmp+DB8BAhoRPpdR36Hafi8kLmdHX5HoU//LsROLNvxnXSCnPBctChb4cq65cfSAY6zUzjaKxjocIrwvJqT70p3apmov1lzPCPAqhixhOLveksctrkLPiEpctfTMH48aq9OgYcSMEEQEFX5VYbtR8NjUmJLsq7MWJZ8X/5USX2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819858; c=relaxed/simple;
	bh=Q6ojckRBjYD3QiFvyFjmdXI4hG8QuqSOEgoyfAWTMMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXTcnXQGLVZqD7icdgkkHciPuFEcMhFP7QaGDpofYhyPg0Ah3oVfvxvmnqW6LNEa9PpOzVx0p5yn1hOnmFa7Yh4IPuLCAZNkv6QRBaKYRgMupysGo+yVQ49IcOniaNzOQja2Ab8YC5IHr1Ncakgz6KQT8hLqFdDzwm54F3ahd4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=x/s24oNx; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="x/s24oNx"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ccca948203aso664293a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791819857; x=1792424657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhzmDkyNi5tXfQXog831HLqTAGZf7SGBLNEnHb+ghbA=;
        b=x/s24oNxvroLDDLAfp60YmQuPRLo1FIUJqN9c1HmGA5rKvWVm2VBbtuReZykyaxpzl
         gHjE3uJYVmtrjreKLo2B0f3VXz+UBJddpig53TRZG06+eFhnGIF9Q9zn7DGLb5n8+bvX
         jzhfa3XYnSRTNp1dw+Qd7vDhCG3xxgYUxlzASKZuIrtmm7DZMsB4LaWkvqpqEYGZSgOS
         ghrNoZdSJ6SpNmGnjyYxg/WIe3URGDtmItBhBlJbfn0WMQvMlga5lNkgF7NPxswTK0T+
         ZBBMJyDcGtleueDM4L8NncXH73dHu7RDDpkchWgVsRYrCifafj9D6pCRww+rXFXBSXc0
         bvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819857; x=1792424657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhzmDkyNi5tXfQXog831HLqTAGZf7SGBLNEnHb+ghbA=;
        b=Tf4T7LcUGu0IaGoZW+o5+TLNS0RGbUAdwS/Qf75ja0qE9FQKiqR0FIXpSmbnjLWs66
         Xh5uG0zMZFeiyvIeGJ28w1Li2tfyZ/RTcEnJ3PeDSTIahIl91qvhHRVTHT4R0Zn/O9Vd
         HhmFetZxq7E7KnA5gd+vpNIMIYMoSw8GPWIJwyOjMopXUvUV/0Hyv8vtcyRtBfcTvl9n
         UeYSjGdGN2QrsScTPPC4gd0IQU09WKEpgHVQf9XqnfjH3FObH783Am7Hux5atFr8vedn
         R6a8ISZ+ixnlCRpzIsG0ENQYhbzjLcxtHk/E62wMIXdhSnlhUuPxsmbCV202gCxAIS8f
         qMoA==
X-Forwarded-Encrypted: i=1; AKwUvBzt8kSrNVulGZJz33ebGKQ2q74LxYIWMa+lYbHOVQSdB/S9Dq0ocQoik/T+p347IJICJHOYdHgIvFKhJT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOaUxVNbWQs6D3y1IVxSjrb5WkSZguSQ+Jr83k7YqU3/HXy5Ho
	RjfPTwBcw7zvZdB/Flf+HcpkB5WFXmOO+ELkNGxMOC1T60VZowqivjHbAfNogAfEGrA=
X-Gm-Gg: AYBFou3E+fHE1R39sCz0oVU7+RAbKntlbmX0b+E7PJD1HD62A7P0LcZuocNxvEQunca
	dHBkkNxt7VZ70nf9d2jMxf5ujvbPJ7AOAeyF+bDMMw9p3fSXJGuCacfI6VuvKbDDOOnu8DDhr3X
	UVXNfMYQW/gA1yV55JCfxGyKoHvPYyrZyVh4QOyUWpfMDWoLQe+O7A/ioQtye23M3wBDHrpLfy5
	JlgGWpjbSrvg+OfU4ItGPVjsejbEvVRZ81Hg1wsqmk6cJGFvPVh3iC3luKpI9iLdHZv7e9EXgkT
	vYi8QCrHiN8F2SA0mjhDIo7Hi0qXbCADmYFUHzHr6sP8sXW1LfTIC1NpNJ8aJPb/COivcSgXVCy
	wYm98XE+ohGSS1eowsKnz600Di8VJwJxiC8Qe2wBgIcTN6XS4vwx9GQ7niAM6EfT/1JhM9NhH8W
	Q4eb2N7VsPNwvNoLaK3So26TThJ74zKf6nAFlA0ljc6Gx/z4U0iGK+MeXx3/IsVOFmrZdQ1WljE
	vt9YyqUchGuG3NmBIai+A==
X-Received: by 2002:a05:6300:68c8:20b0:3e1:7199:2309 with SMTP id adf61e73a8af0-3e171995951mr4822949637.64.1791819856742;
        Mon, 12 Oct 2026 08:44:16 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:7bd2:1202:246d:44ce])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dc37c2c1sm3342938a12.6.2026.10.12.08.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:44:16 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org
Cc: mkp@kernel.org,
	sashiko-reviews@lists.linux.dev,
	Hannes Reinecke <hare@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: target: tcm_fc: reject overlapping write-data frames
Date: Tue, 13 Oct 2026 00:44:03 +0900
Message-ID: <20261012154403.2436121-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168243@kernel.org>
References: <506886f3051941899c26b3dd4d2a32a3c0cf9846.1791812937.git.yhlee@isslab.korea.ac.kr> <sashiko-outbox-168243@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks.  You are right - v1 extended a tracked range but didn't re-check
whether it had become adjacent to another, so a reordered write could fill
the small array with ranges that were really contiguous and then reject a
later frame as a repeat.  v2 coalesces adjacent ranges after each frame, so
that no longer happens; I reproduced the spurious drop with a reordered
16-frame write and confirmed v2 accepts it.  A write split into more
simultaneous gaps than the array holds is still dropped, but that is a
misbehaving initiator and the exchange just aborts.

v2: https://lore.kernel.org/linux-scsi/20261012153502.2435483-1-yhlee@isslab.korea.ac.kr/

Thanks,
Yehyeong
