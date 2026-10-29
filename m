Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245083;
	b=feYPc1SKDJpwCU207sNwwPL9BUZ7VOKd7i7drXJ//MvDR2IeyFdxTGhMsfWEzRfyUapi
	 tZmz0/UdqSXiCLa7u/r7YaMZFIxrBCfDbfD8YmRIc6C5SID7U8DlXCke7DOlsZtiB7DmO
	 g48MkVGQbu3bXM2H5ZwAqdBwQDrQ4+swdyQgB1+kwVjeqAAyt7cwPLYXyKYwYWqgZYEHQ
	 eqjq6/aXxCL2lu4oE6+6yR3fmR+Ve4ecTlLm/Az77L/exuTh6wr97J7b+MYsCyt4AynzW
	 5iypW2vQv4N6X0QneR7EQiLOJ5V80hm47Lic2Jd9GdTQFC9DBMqu1Z9uaovMck8PncA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xO9Nyz7qNv6/W8x13yiKzl4aUpp1maF5hp5hkOon6bI=;
	b=W5k3UbIQqPtYi0t3YQWUihM39R7avHQ/wLg0yUmLR4qxbRcr6I5/ygdnto1exCm49Agz
	 0OEh/S1j/gYPOqY9CTS3JTUH+Ur1hsym1ShK8oNsKH3NpSuamn8yd0y3aj26ook9l2FKa
	 /GfeW+7l5F+8ATGIiN5UXLwGHTAxrobZa/Lyg86FIo41Qwm4/hYvqDcz+fVamUmdKfPNw
	 yZrbovfNaaToQeTSk+Frat5ecYLzRpBCKuGnuTY82RV/3r/EVaq6V49dBDYnc7ngi/WDP
	 ERa41hvikNzCbftS6ekguVPl39sQWXuab88njOV+CUqTI1zkYqz+OjthD/zPZtJDitA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WFLmRQ7/";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B130A606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B130A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WFLmRQ7/
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so2462122eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793245082; x=1793849882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xO9Nyz7qNv6/W8x13yiKzl4aUpp1maF5hp5hkOon6bI=;
        b=WFLmRQ7/qaxPbNl/TuSOqkTHrpNTYj7NZxvnoYJUb4bgXxt0QJDfVE76lbtQLu6Qt4
         QHwJa1MIS1cppWBM36DCc/w9XcteBY8Qebu7GoSNkh0p+XExprGcc6oca+9+76pMf+q/
         2kWY7Bm76jSvcgE4/4c7hwPZBNb3R3bqEWAFH8iK8a+J9gL6NufXvLRkcUFyVvhIwtlk
         q2lJdj0UbiE/aClIfswY8YU7AB//IeRtbd/anFJogxUdcqmZ357N/A5xDuVBg0sgq72m
         +WWgq4yFuhuEN03RC+X6k6wwnglXlwY7ARwVDb41cQ8c3ORhd035LfgAqLO3oopj9NEL
         4ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245082; x=1793849882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xO9Nyz7qNv6/W8x13yiKzl4aUpp1maF5hp5hkOon6bI=;
        b=mknIaS7KgbNyr0H7d/wS/ox8yJ+XumRq0KOb7EO6CC2++5KDrdwvqhMO8z1gqZ2B2T
         edy6aVlhBBULW/P43R0Z032mCKwOJPW5x/hRz/HHwLvH0enuPLHzoRkyNmzFmS851U3N
         +eoAoJ0d/JQJ9lqEiOH51XpYw7++oUNVn7Gmf5RYrdQtHnRiuI/3VT54LnOmM06AN0VR
         p5vhDs+R+0JI1I8Mac3bcKQETAB42VNSoLzb7j6Go5X1YvVEXstBhjj05a5soQLZm5N0
         gmW6D6YUJ0X32jz+X8AgwMOESOJAorZXsEKyrBPHNNM4YkqDDERi7sPEMGYnjrgFId0F
         IehA==
X-Forwarded-Encrypted: i=1; AKwUvBzyPT4gLHbXe6KROuqiOZmJ+a5JeTr6qq2ftsvOfCCdTsGpeGLDT31UcKCmOLSJ0yB1dnHwKajiTsCD3C4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2zKoXDqzY9zTb0gilE/3aFfSAz3hsjIxkhhZ+TLhp9vS9icIp
	QDXvmlMhGcyzQ2R/48+fI0QqFm2Zls5hasiz02moJOYQLD9u5M18wwKa
X-Gm-Gg: AYBFou1Je9vC9NVOEoH/V34Xkfb2JYSSCldI0Xk4rpaWSk9pY5IUYlLtgvXuIKEN9vF
	N547hLtHhHTadfD0ews2oeS86zclj6dubwML1MLCNaOX5Omxux4SrBf6Xj6iBAf4KYTUDlBfZo9
	qmJQ/eea+DQSD13ZjU1LGyrC/NkNQaEQv+bVKP9KZu3Auwb1wui727qqP6lVKMu9hMBm4Tm4Wot
	zhb/inYICPwNppawDnz24+UVglgJ27Wj3SNx2584dmS5lsWvDOtw6g1JY1BcTKGOBj5sOyOJw1L
	p44iW1v1lNCmTK8iopZFSdOg36dX3X1ueAql3sUbunfBnKzcc0Z+1vqgiLY8rklmEj2hdPQJh09
	hRbhFgi96ZlEuvFt2zxh7JaXqMZwvHows5TlF65uCFeRYDsVwTRkfIqw+JfA4KwGVEsxULdqWM9
	i5bCB9X1rQumENwj5+Zr1O1bCyPaYsD8mEy6LqdAVXgHHZQTeWBaAQzjNB5GUcvATW+rUjpyKr8
	mJvC7p0vtovTixS8BT/166bv+B+ESpIjdstTG+a9jrHF89Wtnf6RCeZI14uewgSouS/3vsz5D+c
	93/CPgX8atbDQjiU/GEGGGcrQB07hzATm+SgIdZinvvGzQ==
X-Received: by 2002:a05:701b:4288:10b0:136:b50c:c0e9 with SMTP id a92af1059eb24-1a6ce9bba59mr5791183c88.21.1793245081698;
        Wed, 28 Oct 2026 20:38:01 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e0098basm10196922c88.12.2026.10.28.20.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:38:01 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: wdhh6@aliyun.com
Cc: syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com,
	dwmw2@infradead.org,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	syzkaller-bugs@googlegroups.com,
	brauner@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] jffs2: don't start the GC thread on a read-only superblock
Date: Thu, 29 Oct 2026 11:37:56 +0800
Message-ID: <20261029033756.3959915-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028080955.290774-1-wdhh6@aliyun.com>
References: <20261028080955.290774-1-wdhh6@aliyun.com>
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

Hi Chaohai,

On Wed, Oct 28, 2026 at 04:09:55PM +0800, Chaohai Chen wrote:
> fspick() builds its fs_context with sb_flags=0 and sb_flags_mask=0,
> which means "leave every superblock flag alone"; JFFS2 misreads that
> as "the filesystem is becoming read-write" and starts jffs2_gcd_mtdX
> although the superblock stays read-only, and reconfigure_super()
> then leaves sb->s_flags untouched.

This is fixed for all filesystems by fa6c71988168 ("super: keep the
read-only state if a reconfiguration doesn't change it") in
vfs-7.5.super, tagged for stable.  With it, the steps from the syzbot
log (read-only mount, fspick(), FSCONFIG_CMD_RECONFIGURE, umount) no
longer start the GC thread; on mainline they hit the use-after-free.

Thanks,
Zhan Xusheng
