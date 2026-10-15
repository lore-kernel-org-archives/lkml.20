Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBC13D9665
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031205; cv=none; b=lnD5QDA1TYKzXiHYgjNhkOh1kGgTaSoZwM5LvVmlD1O6V5ZuluAYsosVA4Avst78dvbtV901IaN0jb3afx3eohj8Ws5y/NE/C9lGOKb81JGYQMfDA/VuCIyrw81frDiH9JOX4xnaMFzNlPtzU/4m+ATSW/g4S5pCyFJPWI3LUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031205; c=relaxed/simple;
	bh=pB0CzFh1OxIhoI/N6npvw572wNyV+5zApH4ssHS6nMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W6ZsiQ685mxh8A42JWJWhNX5N/hiFHscJNbiEYdY4YLu+hwk1qRtfG9GefoDP70wdUiLxHi7YJ2SqrEiBwIlakkACUFMfhsUpd4vDvgoU3RK0cOSm34WsYiVtTl6tOmP5pWG71pGckDm5lA119tnYNCXLGumUJOpzMnuWb26360=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWpKJ1PT; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWpKJ1PT"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30b6dad2382so11115455eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792031203; x=1792636003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NejG+5JyG9OO9DJ+h8rryWQnudULVYDC/K2dIN4KJ7I=;
        b=lWpKJ1PToJvRJ/Zm7EsPaYzc6H5Nr817+sT7c/vKhNvdZKHIbh1Fc4ZW0/7+5eXH2d
         RVihvRdY6RPZ0kSIbDjSEntbCzPHSzV+1Wj6mo1KAeV6xQM3H5clmImETyh8IH5FcPXl
         6fdLadaDh3faqasX4g6CUVsjavKcAMyYQpsIf5lbRnlkPupYGaFuovlFj/1tSJMu+qk7
         dJmiKixPTDYtgY1NPXlv/i9TW8lY92P4foxQ9uPpgyLXprlj3EiuemD97KvgSmQe7LR3
         6GbbqOcvpYZRD1mJBV7DgApzyFlMcpzkyO3cCa4sbWzdxgjWyJDhdR3HjRww1uvD73no
         3EAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031203; x=1792636003;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NejG+5JyG9OO9DJ+h8rryWQnudULVYDC/K2dIN4KJ7I=;
        b=c13ITH9zITvliLlJtkSR2eNI/05gMzCwohvks9V55sdfJdR8wLRjjshlbJ9ka4JoL8
         d8wNvjd+JpUNIpQN94Li/e2vpgtl/ZJD+6j8kw+gP7ptFhQG6SSmlrD4FH/H3+MPJvQC
         nwBA//0Vbd9fjI6nqTMKwQbnJmZIncVvaV/SWPY6YWfzFP5vZhsrBsmfFikIeAo1CPhH
         C+STlbhMqoHmrFLu3tjyp68L+VGpGBuaiGaqD3yXBXE12gj90llNJpdwxiLJ3qM+s48i
         rHOLsTQNoIfO9/Sry1tLGwsld+48/eYBp8ZDPYCQw+cHGtUZL91tSdnVw0IrdoZwohxN
         N2CA==
X-Forwarded-Encrypted: i=1; AKwUvBxF/kZTi13zIK0KEPHTcv2mzI6eG6KRPLgRIb/8C6N1WnZjA/6YtRc79a6aj4nL94Us4MZSpLqSjYfsxJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYht7Cs1i4BgjFFN3czEDvkXEG/sfXeTvKM1d3voPMT62zmxv7
	r2K8jl96EU3qDw+NDswvzE1o15PC+vuO/zJ/aHXUutfqUe57vdL3fXjW
X-Gm-Gg: AYBFou1qCSC3vUDiQnDdrOL1TD36Q+eqxQ4R0uvnJr5XKBm1qOXUVsxl5cpSV6Vo2oV
	s3gDFwQuHd6EkcHZN5t7uhM3QqrCNWEp4oOoskTtShkVzcIx8FDIohHtqYJHRo/2goVxtoAe9Gj
	Yeew5dEL7o4WeFfA6+YmfrdaaCLoxUGRxe15H8H8CUip2OXcEn5MaZuUqDNdy3OtpYuUicXNGfp
	YgtE8eMuC7S7jEUZ1suh+lPovSCNEmsPwmUPlT6w+HboU128y0GjQu4HeRDwDrVNbUpvTiFGBqG
	ZMZTbCIiuoLL4uIz5TbwQ90jgwg5z5++TKeZTCKQZkbm0n0vQboa2HhmMH6PtkkQCNrlvqxWL2N
	7hsqI2Ikz5Rvqt83FXMmSRzETNMaQmWBoRk9pjYeFH0BmmrAi0obDtRR0YRmjpVSRucg27xarmB
	DszI52diLsOY4/uGdJfU3FutEsBoR7b0iAVaRx+SoEDcMiQrN8NZdmW1USjx0KHg==
X-Received: by 2002:a05:693c:41cf:20b0:353:5d0a:dba4 with SMTP id 5a478bee46e88-35bcb7aef5cmr11890595eec.36.1792031203347;
        Wed, 14 Oct 2026 19:26:43 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm21186597eec.23.2026.10.14.19.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:26:42 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Ming Lei <tom.leiming@gmail.com>
Cc: Yu Kuai <yukuai@fygo.io>,
	Hannes Reinecke <hare@suse.de>,
	"Martin K. Petersen" <mkp@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] blk-mq: stop waiting for an SRCU grace period when freeing a tag set
Date: Thu, 15 Oct 2026 10:26:37 +0800
Message-ID: <20261015022637.2973447-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001-bug-blk-mq-global-tags-srcu-v1-0-e8415da10d1b@gmail.com>
References: <20261001-bug-blk-mq-global-tags-srcu-v1-0-e8415da10d1b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jens, Ming,

Gentle ping on this series. Paul acked it from the RCU side, and it
still needs a look from the block side.

Since I sent it, "ublk: drop the device reference outside
ublk_ctl_mutex in DEL_DEV" has been applied to for-7.4/block, so ublk
no longer frees tag sets under a global lock and the 19 s figure in
the cover letter is out of date. The SRCU grace period that every
blk_mq_free_tag_set() waits for is still there. With 4000 single-queue
ublk devices on 7.3-rc5 plus that commit, median of 3 runs:

                                 without      with this series
  DEL_DEV p50, serial             3.41ms           0.17ms
  deletion with 16 threads         4.17s            2.87s

Thanks,
Qiliang
