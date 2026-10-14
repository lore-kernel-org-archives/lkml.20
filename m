Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87FB550DA3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991473; cv=none; b=mnGYUEhMAXHhvtY/HwGS8hPcuOVWjmo05KbrTRhAq7uqTevTIM0rVMHeawF24WUX7Gm3S12gSUT11yK6RffXELwc613C1KQ6C7KFhKHSIKSQF2zgNVvVPRhB4a1S+46aUm5/s7oV4Yhx1Mq9bDjK1zShk313+6U5yjRvmeJYWE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991473; c=relaxed/simple;
	bh=j7lxWLDV11oCPAd9zrLwY8YtZWMYkppFEMxTV68KR2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X5H9jdsUXL19mbf3PuDTibDPWCXPIhJCCV/Iue8ca49e/vB5qp7fJJsYAIb5Kn5s3xwrmb5SJuOm0N+TFpc5ZuXLZCyERk+mHgx8R808jlu/Nlp5dXRO7JbCbJcVPwHYGouwX7fta7PVSvY5wGR4ADMi0erwJ3qz/CCIpz5HnsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=DlPjgH+R; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="DlPjgH+R"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso2324011a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791991472; x=1792596272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+A8usko4cfoywAC26NwTGT/rqph25xWtjEIyd5GKa0=;
        b=DlPjgH+R4eVy0Q9DUapa12egNiHPhSBPBBtUFEwylIHo2+kQgJZFk8LDZsedaol2Gj
         xbw4MRAClT2NdIJVJEbZHI3at8c0HZzR2hEmvIXuHCRGjaCtalKV57gSfSGQ57MohQMT
         HMb59FqY8lrOqK5rzJEFk8JDpY3tlTV8VxLilPVl0tui3BTW6O6tXTbg0yGrCWHK1s1s
         6NJSJ3TnJkE4CMe0ZBWqNofomfYkNLUzmvWByY5iYwJD+UWtIV+w0A0Z5W4Wxoqsllzv
         fz6QWELI2ZhLUw6DJi1Yi+B9MfaiykbRIqg1nc+heDwrqi5GD1l5p+asIJsefUGOGXie
         WOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991472; x=1792596272;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+A8usko4cfoywAC26NwTGT/rqph25xWtjEIyd5GKa0=;
        b=vfrC6rR8U+F7TtaoUy4ubczjWQQbnegpdYxGJE+w4DYT9MzUDEUmyNzxYdJ7vFiWrL
         tK3OaQhHYB4RkhBSbxeFu3/exQoBTKvXGCj/hGJtwzwhU6JWT6AE4zofas1VEW2f7O6/
         tX8TU3ZWFWZbK7nrxtVORYSC2yOzk54JAt7z8xqL0sfHeIeZi9KLJDinTUHsbCQLjsAS
         fBIxLA9zeXFquc74W01ph9Le5LIzkWSZYgwvvV7crS00bGJL+7QLk+EHFhKqqazF9MVg
         5EN818MK5xU2f2LqWH7stpys8nyTev5g37jxylder1yXGuFKcQN9lH/+SFbVrYj0Irau
         Vb6w==
X-Forwarded-Encrypted: i=1; AKwUvByTVFFMqCP+r9TvBoLSdJkj1f6n6v7mwLcy18rlo3Bw/1RZN5eicqFkXN37ANssVn/RWKk4YasHw7LRtZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIInhiz9PeSXg60F11Rvq3USuAHZIVvVJLPuvW+qgy7JHsAuu+x
	uKBltqBWxcRlnEcsde3iYQ9U9g24cLMPTa+vYZK9h0RzFLixJ3KnAmrS0JMSvjeO2Bk=
X-Gm-Gg: AYBFou2XKZVZcl3WPwX007WTUwUTq758Tqmf/DHaXO/w/O+HFZvXiRviYnSPbK/MFb7
	hvELQ8tBsdw86BeNS/Lm31g0SD0oL1uran18K/SXLGZc1EcRr/x174hocQE+crZ4N3TRF/tfRkM
	e1A4TPFGkBTPKIyuY/WRckH8mU6c0GGYC8WycEkmzXs7T7ttd/A7n3WraXdhRmWj4NCfHrvq6IW
	kVgHDewL3fnqB43NzcqcflH5pfearB6Dboi6cAvSIUviUS+gkeNUvuvXdmInTfAQwOOtNG7ebtJ
	yARFtdyb+D9B4JctrU4Ic4CTGP1J+CuQlzOYlKPgkP96BXYuLEH/qZSjLjKMXPx2GjKyum3zdbZ
	qeU8Hy2fseBaTzyWtEOFXPrrIq98cpknFvJT6JIkqhOBjzg0QlzdZ8bVwORRFe2M49Zsw2BTGaq
	0rTBhp0L2k04Fz2WXAkcNzlpUmW/Myu1HrlADatdwwPqoIAd7V29lU8w7GYgYQZzt6p4Sv1C4tr
	H4GBo1onM9QIpPHre2e
X-Received: by 2002:a17:90b:3d82:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ab3ab3771fmr11573342a91.50.1791991472168;
        Wed, 14 Oct 2026 08:24:32 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:1c49:61ee:8c8:3f4c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9373f5c4sm58461a91.3.2026.10.14.08.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:24:31 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v4] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Thu, 15 Oct 2026 00:24:25 +0900
Message-ID: <20261014152425.3637406-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014134104.3528958-1-yhlee@isslab.korea.ac.kr>
References: <20261014134104.3528958-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please drop this patch.  It is superseded by

  [PATCH v5 0/6] scsi: mvumi: bound the values the firmware supplies
  <20261014151914.3632701-1-yhlee@isslab.korea.ac.kr>
  https://lore.kernel.org/linux-scsi/20261014151914.3632701-1-yhlee@isslab.korea.ac.kr/

where it is 4/6, with one addition: it also rejects an entry size too small
to hold the frames the driver puts in the entry.
mvumi_internal_cmd_sgl() writes one scatter-gather element at payload[0]
whatever host->sg_tablesize says, and the max_sg subtraction in
mvumi_io_attach() wraps when ib_max_size is below
sizeof(struct mvumi_msg_frame), so the lower bound was missing from this
version.

The series also folds in the two-patch length series I posted separately
and adds three more bounds from a full pass over the driver.
