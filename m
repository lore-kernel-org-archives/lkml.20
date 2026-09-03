Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB76449ED7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424726; cv=none; b=rXxRCDXnZYG0cgITxzpIf/ksn/h8H94qdDTB1zzfRZiYyGAE12FFp+obEIichJr7ahhlw9kXHa/Vkl63cqQ2EJPOZ0c4jBruhNqP2tyi9N+LXwN/UOVyv1YlX6suU7+ZDD+oiaOrniXDlErcLO/A6mdui5tW2xMo8/ZtJSMPrSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424726; c=relaxed/simple;
	bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usp1eiz6W/G6w9dbOAhQMwLzSlmXAd6BbKBuarvpFvw8lpUPCh5B9uhxI+NzKwxb9zYz6D3aU04d5QZRF6FyN5SctHa24E3Imh21Hixs7qMfn2SO2oQT+T4/F2Xd0zh2PWOCXSjgPCBTCeSrUR5IxLA2B6KsvX4evtPB2ptjVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxpTWpBp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxpTWpBp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1333649f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424723; x=1789029523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
        b=KxpTWpBp2z9O0bZlfiiCrfDE33AeDdsLj55sul/OKLPWoq2t2us6hR0wA/oYmrnBKj
         PncWq0OgiKTca4aN2FF+MTniEjUVb+t99On0ptlaYCniXNkFSXkMP2ZK+HemnuHaHPd2
         b+R/LAHCharc0trFSVIP/KKPCcJ7fuMc+Ex/ykNLUmmmvHzB0oufkYhh9Ikqbc0wiFGC
         oLed1GbjzXECGAsZvxunY4iVxgN5I7PSYUBdZkz623z+/AOWIrF8MYq7hp+uENkkaXYw
         wz9Y0qUw/p028AFWgto/J9i8VvgkCXWt1IVhopBh8y4WzRLbWKlDnJFs/3GaZ4uo4ZWF
         pvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424723; x=1789029523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
        b=C5xCyY6pO833+A843olzZgBqXvEMDe5AOY/DvEQJEgye6+AAbfuYASNhNTuoNUPXPM
         eUnnrj1BMzLeDeMv/d/VOBmmYAbRty4HHxlE//RYaaCRqJJ+fOXKO2wdyBGDcZVazdGT
         o7KJUR8zho+WBU2QfAPS+d0macNVg44khXH9YCsUYD1163kVjGpSbO7joRR1vsvJmuSy
         YPSslYnt3vRctWG3Mr23QEj4fe9lxpuIDR77UpFbtxZayPT6T+afudJSpT2A9MFS8ZLN
         0iR7KaVfDSSjNfpsxTKmo4I1c1gr0qqwFpXKRbpZuo3h06IoVlcUl9A1JEw0OY9F0d6S
         1F2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwvOI6U5qCgGwQQyW4fu69IEManGixgdGKbUdnfy5Jm5ILlCjqQEqQy9gtmJjiGXnzhJWiy7EUjP4V75bg=@vger.kernel.org
X-Gm-Message-State: AFuF++k2WNrbk9beO19IwcywAIUSGrpQ8At2TquzxBeMTV6gwCuTEN3t
	FXcjo2I7Ex3QjFeSvmd1jcfLEh+Niofuj6hjheXBoJ0UVFffaHW6KDJL
X-Gm-Gg: AYBFou1PtgsY+C4zGdE0DjWMuuX3DOxPxFjWyxhJ61xX/1HYXMw8uuNYKXONJMu1KQG
	7BTj1N7IDtGJKNA/EfJRkgkKwC0VxJ+Vea6elHhx6d3WAweAxUGBCuEY7VxpF52UQ01te2aSSeH
	Js2I8fdEcwSmaj9+ORqAwBOkWHx+zyfp0y/HxyZULTcYuZvTBgHAuKTho2flw93HSKtKrsTQJYj
	CVucqe0nSH/oKgODenge0GETJKVnn1+35G2GdsAARWusfHOyfSXcHjZgADODWV4RFwFpjtjYoZL
	C8QdssBrcHLBrXxUFO3B/mEEYMi6TcCyO6V4y0LpEdNqT/pkl8hqkMkcWuWAu2M/UYLpKiM8JBy
	zaLxKA45SQtjJEhgnELm+fyaGXm1y8a5MC3xEXYhx5Qx3EZVe6eR8P2XM5E+BgUTATrHkZCv7c7
	/pMp2ya0ncpWSpP5MTGSRRidc1kgOtzWY20hMfkOBHKWgRwpYyNAGyDi8thLThq7k6coIfJyxd1
	SdE
X-Received: by 2002:a5d:64c9:0:b0:482:fa3c:3e95 with SMTP id ffacd0b85a97d-48488f07dd0mr17932547f8f.8.1788424723044;
        Thu, 03 Sep 2026 01:38:43 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm13075059f8f.32.2026.09.03.01.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:38:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 0/3] gpio: mmio: report the line direction on chips without direction registers
Date: Thu,  3 Sep 2026 10:38:41 +0200
Message-ID: <20260903083841.2114833-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com> <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> Why are you spamming the list with multiple versions per day? You're sending
> a v5 as I'm looking at v4 and I really don't like to have my time wasted like
> this. Please limit yourself to one iteration a week unless you get a set of
> comments in which case try to stay at two iterations a week at most.

Sorry, that was wrong of me. v5 is v4 with only the get_config()
documentation corrected (it said the answer comes back packed, it is the
bare argument), no code change, so please review v5 and ignore v4. No
further version from me until you and Linus have had your say, and I
will keep to one iteration a week from now on.

Mehmet
