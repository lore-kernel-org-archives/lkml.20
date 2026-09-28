Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DE94AA1F7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594555; cv=none; b=a2lucgKecfsFupP5SNqJYjl565Rith7ECRbD8vyy7vJ0+CTuECeXG6bdMIt7IEqbUwKZh/V5TOAzwkxy3rmBeHDHs+57kJ+MJAVGx6FfB2AlifVuDmpDrtGr4qlJOZienHgkM5ieI109ltpmwdY38/Ylyk2lPxtft6y0JjwkIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594555; c=relaxed/simple;
	bh=lJQz35lNLmHImQXDxRBBTx01nhhoR67A1rVNCsVep8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+2pGDs7f/4h6Zf7wRAPMRXnNx+VUWFsH20W5wpaIhynyAZK6EzhoQmURS5JdAqO8sBn6Ve3xD4t3NflK+AKZKWF1olenGivEocBuq5HjdGklVLf8+Z0xP9I/auuJH572/kXU7Jd1HlJ1W/Swle3JzWicGjZqgqYVpvDRokPw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VB6Sqw7/; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VB6Sqw7/"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343697ad877so117529eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790594547; x=1791199347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lJQz35lNLmHImQXDxRBBTx01nhhoR67A1rVNCsVep8I=;
        b=VB6Sqw7/Z8GTAJ4kFlLJPwzaUQU0aEfmiFRiB8Fd1HtHmAZWNQHTzJEOFHS1A3fFfz
         0XkA5w0i3P/oigOeczsctzo+3eRrYpfe0RyBekSt7JmbpLyylp6UnYzfFap0N+2mn90/
         7uDf71wCAvXjLFxSpt1JKUbgQ5GJ1Ejy81ztIDkJEhTFKgKZDI47wlXJHVpf8onPIHaG
         74sXtp0BzOOXT50F/yMwMMissMNgagu8fJmEVpFSm9xWCrvu7W8QPyUp7ycb3LB4UyKz
         Afi37QxraaYdQr1B22WR9nP2G9VTYU8pB68FRDLPFOhKCfly/45MZnfFhXkTvPzsIR+R
         hD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594547; x=1791199347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lJQz35lNLmHImQXDxRBBTx01nhhoR67A1rVNCsVep8I=;
        b=so79FjyYRVFKWxVwG4c1v86l9pUCRzDyxbqRxjgV8iY2MH2mOkp1ZbhnrepM1vaT5R
         6G6flaQIYSLgBRGu6Vh3KFs+XcbNKMD2M9mWzxPhnXqQMFbkpdqAmvvIwNVj3eTT1rtU
         G+XiEdRBlg5sXRxsDVXuHMEqw9KDn3pt5A+W3ppMkcVeotYjhvovYtFPJPPYZJO1nfdh
         kkGYLoBFMj9RK+z6UhlSO+SnCIi2lkUSsGAN5BwfXFCkIARfmefYELdy4kCcQACRaFNB
         TyJf/h4blCApaQppvNNULz5bXjMw2WwjZvUB4bEInVOoWxn1vYxJH0LEuOo0k6RTuGo+
         7OhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBHudYTO4bwxfuKe8dF+2+t+3MDgSIsN3bdX1AUGYn8pQsGzV4fP/wUulgLF/OsfZ/bwg1oXMkv1zBIgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n60i9X4fL+ttZANV0ZI+AkK7kzRwhW684Qq2WuuPHFzGJIBOWj
	XxGdcd8W58dSbNAen9Md0TZgb7WKUwsbpckXSyDkZhXCD21PiAFVXjCN5hNQtgHm
X-Gm-Gg: AYBFou2L958jAleuyXuC3OkNxaodorZ2vV9Y2Iy6gwWSOE+OaFET0Q8MllBvzd6MoNw
	cXcUVl0d7obIioAtiedo0bKlilqmQnNm26jYQp4Vz90XDARYp9iUGoiPgSs7F/sVROMGpsoOgKy
	uUhUK/ytxa7CsajGSup/xY4b9m7rhz1LdR2ZZeOO8rS+bEVTSJ1djN+0O8JaBYlQZY1p7lv2hgN
	Gv6hPKHsPxZtJWuFHc+CiCb4QjWQ4WeGmsqcpc9ushClyMPvITfVP2i5u6JMUKM6mcH22DK8qaF
	0wP+/1NfJz2MEi1HXFWkKicV/qVUSGn3qep0tpZQhrzGsYVakFXJ/koNZXlDibO26utpiee6y2k
	8a56MxXB2VqfQBxQsbXphMGGSHsjL+yNT0Hw8Gsn5MAm/9QMRV0FR/zJjsOdiU1umGbPm80H1Ql
	mVdOxyx7h04znKm1YP9BHfYvrUStHFE18F0kHF6rnnmtYkaLox4fQgZPOI/RP1VHjWM3+oddhtO
	TvDqqyr0oqtZ6mLOHqB/LrHyv0RBwch8mdJ/b4G6LF1TKnNP+5oVxOOFZrrQgQPmm6ErkAKOOLk
	O18UUVPtdpNKnS6fGc0=
X-Received: by 2002:a05:7022:29c:20b0:12d:c389:ae54 with SMTP id a92af1059eb24-146cfdd1a65mr15123488c88.2.1790594546278;
        Mon, 28 Sep 2026 04:22:26 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm20689853c88.17.2026.09.28.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:22:25 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: rf@opensource.cirrus.com,
	david.rhodes@cirrus.com,
	broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: hda/cs35l56: same calibration condition logged at dev_info() and dev_err()
Date: Mon, 28 Sep 2026 16:52:19 +0530
Message-ID: <20260928112219.713777-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87jyo57ifo.wl-tiwai@suse.de>
References: <20260914000308.108995-1-navonjohnlukose@gmail.com> <87jyo57ifo.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 12:56:43 +0200, Takashi Iwai wrote:
> The actual patch is missing?

Hi Takashi,

There is no patch, sorry for the confusion. This was a report about
the cs35l56 documentation rather than a code change, and I should have
made that clearer in the subject. Richard replied in this thread and
will reword the doc text.

Thanks,
Navon
