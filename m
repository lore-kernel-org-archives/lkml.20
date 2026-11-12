Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496083;
	b=PGGOGge944FSx0BdebTpkcYTwlOMGNf97zi/ks0zLXtlqZAH5UVrBTaSJGtRjaFgRJ7Y
	 C2PyUxuiVH54sGepnSWJpd6DqRLkx/r+/RFOvkUV58TTRt0caIyB+H6iMlznR/bcC9IoY
	 wIy/hzPYmPYm3kPyjTuv821rE81J3fW8OHuOStxHa1C0Z8dR0ObUuOBj+q2ocJkIAE87o
	 CF4xkgSlKSj0A0vTDCNdumxQ05vEJDLaKZ/BrT2wPUnpomF/+Doj9M4YgTd5EcJ2NvKQZ
	 hinh7D0d92sa7eAuMK9a/uE+Y/KsXWWNdA/EcUvKevn0Fy2/hpVGANEuFUZSZHcSQPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0swBWFYpLWCv2uk3fIn9LxiScTlQdREOnp7Y0vqdXqw=;
	b=2EV/qr5rSF++Fkwp3TPIDTthJJH3fVUDZrUI5jLqaNN5aAO3JBnZHFBRMlu1HHAiROXy
	 Kcy9AP3x1YMCQL1/M6d9+OHwUZwUOPROaOqAk+cN1Zf3+Zin+L2coBk7976+V75xhPPF0
	 zbbwwLBOLtky3QArustIZydc0xASzGaiYdWqNRzke931PYZC+JnGLwNvwpbJHdafdeUHg
	 BFj7tZdWmH4KGiRBYMZaTjR4I3q8By8IvZVKYY57n9XtaYQwDPdptH/mDKrQ4FZXTaqTv
	 aVfjp7AVPQxW3UFAM1g3sUj4IuBrtLmZ8C1D0ghAXjtwDYtPIg+YL8wrMUecO05zkww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9884606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9884606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53634b8328eso36569401cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794496072; x=1795100872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0swBWFYpLWCv2uk3fIn9LxiScTlQdREOnp7Y0vqdXqw=;
        b=TOcm2Ed1M3LHQEU0niXvBE4+c3wTGmU7AdtpGS9H7bFvh6gX69rn3aXTdoHmGzgbUQ
         PyiPs9IoUUiEz0lzSBlRajf3Pgrancg7K7nQQBL1iX1iBguiXwUpxEtH0vGtIBZUR8KS
         SCK0yGKpHtvC4efFykqqHlTAiqZZUbc+j4PZ6roA11BSq363ZsVbhRCKZvN+RShcoT9A
         JnQqR8vlGhV0yBhdVEHmOKGVdM9xmxOBLvmRQIFm5HtFHDRT5/s8T9bI/iI5ZZulrAAg
         cnATcz9J8VQZJFVUhiEqXoy/Hd1Gldp83I+Na4H0lbIHMjTvu0nbcTqsPm0G34SYeLXX
         ei1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496072; x=1795100872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0swBWFYpLWCv2uk3fIn9LxiScTlQdREOnp7Y0vqdXqw=;
        b=E8wh2mteWSxrhfe2ict04HFogfd+/3UZ/6cJoHUab0WI0/JlnlNPtYDir3aYBAfrDp
         1kUwG5DckInULTcsfvGM+b8flTPDgjGmlymvRy1oqT6FQAfBXdUIMdWzWPjWrOD6ubW6
         mhlGf8dtTcKBhGXjq3ZAiDCuFlyng9tuJ6xwR4YccOVwgxNeUIxRm5aCxi+omlJiEImR
         1VQRJxpWS1MeKX6wfseW/ON4Sz5SSyeShAFgCCQoj4MuBaNVQd9Nco33a9NsW+96+Did
         YKK0Rur/8l6ZIK8VI3t/q7DhtLDuI5g8jnPmmWXpHfL4Ejp4Iy0azG89NV/9b7vhyMCQ
         cFTg==
X-Forwarded-Encrypted: i=1; AL+hErGRg6bu4IoomDEfo/Q5hY54VmQWdE/sXA3e0bhcN8lpZrgISF+oizILoxjKHPrFWJvWO7wGmv3mUznBIfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TpZK+3lXA0oLDn2qRaE/m2UCm/Tt9aQXxQVfrNBo3UOT2waI9
	euCDwfmJLVZgkJrcjkWT2+wJVXSseoJsswnJ7npk7KZJxcA+hnG90l7H4XQ7GQZb5w==
X-Gm-Gg: AYBFou14INS39pMEzd/OeWgj47emg4tjkA0y0ZjuwsCrz4G+ZxKwMu5x3N1L6lbaSoo
	ioKI4deSmSogN24dbNFIHgk3MjIIHvrR9fHoP0/pH5/jTEgthVwdHCshXgP77BZGdhzFgkIEZ28
	Qhm/vAIY9LYqhnT+kuhLIiBh5QFDVZ671p2MqXDrHW7CfNCYE2w4ZaDLS6CNtONkl6EZik8t7js
	kjwA2FLgnDP601JY54Z6WJ/6v62NGAuL98B6AsuKmqju7rCLFZSqUDVzpeP/vFx8eMoZYF0YK5t
	yZYVws1+I2N3rYB6ikqyyyGS37Rel56o5UYAKI5MZ7sQDGcupst1aOquzKgcdEfgMYzjorqL4En
	acldFFT9+9CwaWoSHUmtWkaTCwJO3MFAo21e1Sm5JduJtToooatWTbeuozJ8PnnPdWYe4WvP2Ow
	iOMTlotSrBpBqmXKZBXc/g5Tm0g2QcaWU3VzLbw3fa09aaT0DEokyKF8o1jQXGyjIkEwnKqd6Qz
	apqSmwW5pplaLk9iGUNyDFLfyHx22zR4ag1RCULDtBqfVWSYQWp8ISvfI7QHwbHaNJPN0NlrWkA
	yjfuIYlql6OyPw/BI0HIEVMGHEqIxHjNiyqGE60C3dy1CVbCpNknLl7EPTN5d3DTkVsQEclK
X-Received: by 2002:ac8:5a05:0:b0:535:6cc1:5890 with SMTP id d75a77b69052e-556c119bff4mr98545471cf.51.1794496071835;
        Thu, 12 Nov 2026 07:07:51 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c40ffecsm75896761cf.29.2026.11.12.07.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:07:51 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Christoph Hellwig <hch@lst.de>
Cc: Carlos Maiolino <cem@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] xfs: fix f_bfree underflow in statfs()
Date: Thu, 12 Nov 2026 10:07:43 -0500
Message-ID: <20261112150743.241738-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112134434.GA23459@lst.de>
References: <20261112134434.GA23459@lst.de>
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

On Thu, Nov 12, 2026 at 02:44:34PM +0100, Christoph Hellwig wrote:
> On Thu, Nov 12, 2026 at 05:20:18AM -0500, Hengyu Liang wrote:
> > The issue can be reproduced on a new 2 GiB filesystem mounted on /mnt:
> > 
> >     for i in $(seq 3000); do head -c 65536 /dev/zero > /mnt/s$i; done
> >     dd if=/dev/zero of=/mnt/big bs=1M
> >     xfs_io -x -c 'resblks 100000000' /mnt
> >     for i in $(seq 1 2 3000); do rm /mnt/s$i; done
> >     sync
> >     df -h /mnt
> 
> Can you add this to xfstests?

Sure, I will send a test case to fstests.

Thanks!
