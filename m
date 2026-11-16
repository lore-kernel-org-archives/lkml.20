Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815167;
	b=4Bw7BeoDYMqpN3dB9lK1LHHWkmD2Wl3iOAZF/LvF0tasPAcnSnL8C1n+onTZqZan/63E
	 McoWhg53gSmQ36aeEBSqK0Yg7ETonmEUeHGqfo09xlKQzVqgbGLBSHmCs+U46o/1vnNd2
	 1iHZpECgedMXNeFKOVCckcc9AthB1riUhtwAmQhEEFGvO+BwrvvldL5a1UWpgP/Bs0zKO
	 uYmcCaDeaYSHlV7EOqQnT8jY+ARZmmuCIgpkeeBEPMkyriLQICCTv+fX8hf1z5a0g8yom
	 vcTuzrM1ca4rCP4Ixj6khvFmzgDYAvPfpR0raJ37TdcLctr6He0hBaUtuMnI8pXGSyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FSln3GJdyilcSJoNNwMauSr6iNLe8w//JR+9QfO7bhg=;
	b=lTBcoiL28CES5VQUMwyzdNsjYp6eEJLEuidWPkAgszaKTJMVU42KgqT06iIqf9q7WwWC
	 3o2pluzMxDAYPN/lK5UKHDfDjJFJqXQx/HKkXhetUAsZOToeF5pfL0DEEJ9XVWxKGaWIs
	 WjTk0nKTqqxrPlfXyojJzUjiY3Dq81Zn1iyU1IHQBD4PVj0/vs+Dkvdik+KnJpoeVSv4J
	 2NrRtVxsryPHaebboaVLAxI79y4skMbnG80+IwUubfix6rOBG5aBXBKFTqjcTm3Q2O/ZA
	 RxS33EaXPrfMFAaxe9q3L/1LmYm1SQL9HTPPNbs0KM9zWV9fnEInUNOXAtEjJYRWVHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9ebPlG0;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61714606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61714606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9ebPlG0
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e987a2ba0cso16939825ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815167; x=1795419967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSln3GJdyilcSJoNNwMauSr6iNLe8w//JR+9QfO7bhg=;
        b=O9ebPlG0Ls7i+E5Gm6i+9CQPALSK0CP62IX+8iRnrZXehTO3K1ciRUFmv/l56ogw5x
         G8/dr58UAY/4mlTAhUO9Mlrzluf3bWofaL41Y/Kz0LLkkLCbPWoNB3IklpJKNUd+5oUV
         r/fKLW+MQyX8BvynueVDi9b80lfHKHlz27s8otIDRwl4b1Xu8mc86irlndZ5oj/VVXfd
         00QVC4MucxHF/JRgU6wxNH9nb75udF6rhWDtPPVpCjixLkEuqvM4I0xGG4Gi6+GNVcay
         8L/wsIhT8okv/gmnAn5qCBoymH5SUs37mvbLaQDLCO6cI6wtyD6ZlqXPtX+H1ZQxZ7yl
         30eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815167; x=1795419967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSln3GJdyilcSJoNNwMauSr6iNLe8w//JR+9QfO7bhg=;
        b=iVgQFNQrwj1Yp1Ku9SNL+vSTAbsmm5Ib0+3fgpTTFk6la/ilcQVUGvoq/oToLCl7Lv
         UB1y9gaO2lfygB2hWTqfCNuaq26t7PiEaoGV9ShTtfFKPPbrZF2FcanMkWfvR57grWUV
         mA7UCOJe2wN5/kX4SGR4riXk5WUZ7XNbDTs9AiihGtwRnoaVXJCPBaVFbe8rKoFjGlhE
         pGpEFGw+XjDqZl5lOq0sut8hU5heNQ3aQJIupNkcS1PfByLUebA4wkl2hxw8IaTUwFK+
         yWeMm5CGTTaqDeMY2NzWMqelSkKGZ4I2RS0tBXgfbP5UBmjsn+AyFGaUrFONzQwmLOPj
         Mgew==
X-Forwarded-Encrypted: i=1; AL+hErGS3NBIc5sEalVsOMkp0Qp2hArUmhlCukPTF9sLzCrYb8kjq96wOK/PMJp54YC/4y75TnuvizeEbNTpRDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6N3lOxqFq1zha/QzWHkN9F6xDzeyp1jLnZHgJHnDbmYIMQ5dC
	3dr5ruzWRhmq4mufZ3cGe9qrJ2WC9P0o6VDosTjwjVKFUfe1GEZc6r/t
X-Gm-Gg: AYBFou0iiu1zMBuVMiLtCptsaQa2kkEECYEH2rLOyZo7Opfrx3FdTNBn2re17GI6K0p
	foEaAptNGBwGuqA7NxfrAZ/5rj+cqDwboNrqailNdHkgUwJ+OKGb6cvmdUb7Uebf5dXjOycQvPP
	Lw8X1oKfJBeKt4fSprEMXdHhvZC4cL74E5Li+KarZe+n5maWOpx+7vrJCXZeVebVWM08OK1nF3f
	qGgYOHlIsBu9i4FT/b977Eak/V+KfTwft5ZxjjLQiWpg9qZfw0/sBLyJt82LqDBOA0HR6+LnlpG
	OlLN8x7ozOeCClaulD47f2KrsEzSfjBpuUp1sUN2vy7m+ZxiEYjUllOimhtN3p1Cklmotfm8yaF
	9heqAdfdS7rEWCgnJJpjO0Uo0jay9flLSZbJhntOCjUr0uaa96ubx3nbnONC+bNjbem6SpB8XYS
	rT4tUNdtGxLAxveu0MKwd8h8e1NIBkVRQ+wqDHowBbvHtsu5cWKQZ/DofzYKt68Lp9InPfeVfQU
	mi15lA/b1v+SziaWUv2H5WvBelP1iJ57x9bJGxxYRgjzV7Ch+sAwbxTCtfkE6CS3WcjbRUMXBGL
	MJejSELXY+HF4pbihcswlxowQc3iyWlZvq36Ejh08tWlEaLoR7ALXFsS
X-Received: by 2002:a17:903:22d2:b0:2ed:1df2:8b36 with SMTP id d9443c01a7336-2ee0dbe68ecmr99007235ad.33.1794815166560;
        Sun, 15 Nov 2026 23:46:06 -0800 (PST)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868231sm32620695ad.50.2026.11.15.23.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:46:06 -0800 (PST)
From: Kaixuan Li <kaixuanli0131@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jan Kara <jack@suse.cz>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ext4: stop verify_reserved_gdb() one entry short of the block
Date: Mon, 16 Nov 2026 15:45:44 +0800
Message-Id: <20261116074544.2497315-1-kaixuanli0131@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <mlx7il3nok35qeppdkafrqgztvazj3fc44xrp2umziye5ox24m@xwg43blfi3jn>
References: <20260919113940.1823559-1-kaixuanli0131@gmail.com> <mlx7il3nok35qeppdkafrqgztvazj3fc44xrp2umziye5ox24m@xwg43blfi3jn>
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

Hi Ted,

Gentle ping on this one. Jan reviewed it on Oct 21:

Reviewed-by: Jan Kara <jack@suse.cz>

It still applies cleanly to v7.4-rc3. Would you take it through the
ext4 tree, or should I resend it with the tag folded in?

Thanks,
Kaixuan
