Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A0B1FBEA8
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983653; cv=none; b=Zdr9K+fx1WDHY4Uz8y2QtTxDdqDiSlhgkzL2D2efeVuoWMcpdV0RaKoNAjYmEelcCdpTiEZs5LjNd0iPBgbbkhJJ9eyyuP7bJyGWHunQdigGrGKtw7NTWiz9suQI5YoiB3jVBtQNPkPcMyGbBoUPnAZqMeHHeDea2Q09T9msn1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983653; c=relaxed/simple;
	bh=GPuxmifIgDDwJZd/SBO1euENzZKqws9a+V2RPHqyjdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=raA0UGOyCUHr+4wgb76OPGWRIeptwEa0Z6Su42g+RaPvFJ/c1WL1Rytke4PHzMQumyiOsh/JL5skiOL0MWkcGBRzRlSrNgDTZp0zRr7VTEykjziUuZ75MyBrYy8Y6cI2d41RB0m+yRztUMMpK/A/eHyqbOnbLO40O0p27lA/OQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h99MzU1Y; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h99MzU1Y"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84830c774a0so2039529b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787983651; x=1788588451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPuxmifIgDDwJZd/SBO1euENzZKqws9a+V2RPHqyjdQ=;
        b=h99MzU1YAOFD1cOaiLoafJ9F3ro1sFaybw2iMkLKVbcJ2sTv0Gz61zP7SemQwcuk7N
         bTpvH73VUvO6jrqMEU7da1GnmLbcrqOe9BiRWX4O+zFiHekIZm5eBBOYpl2bk1RtOgpn
         gKc2wNynnnD+MwEIStF+TtOAvZ9nJt0lIoJ/2wtR46LQrN2P8mlHI1Vs0pvlMxpz4CQF
         rsIhre4NJPjH8K+LWDSvSug1Fko0O6SkTOkVmfSzHs8YGPuwOq3u8DSOuj7AVYvMigdj
         NV6pcP6EGseNUcSjhUWzKcUHx23hp0vePx895H8mL+d1UOd+cA2jDKVErHnM0sB0ibLn
         2wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787983651; x=1788588451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPuxmifIgDDwJZd/SBO1euENzZKqws9a+V2RPHqyjdQ=;
        b=nHqPVZjmCSaTj2V+ycVowzyUD82NupGZXGLVIqhlx6hmPbmHheGAjYDTjqt8svurpW
         ZPqm9Okc5O5YNkx47pxa0Xb0i3bbCiJps30jRDKZ9+m0XRygPGpy0b1n/u4APQwZmDy1
         CACXqb6lyxliDDkPPj/cLhVEKGbnNyJBLN32TcAjHpluDYQg2/TD8x+s7URp+7GSRbOu
         RAUPZ3F7pzZaUfFJyTsKktKxjsLs4kzhNs24eHcwKKIV54XpKLYNTmSQszsKTQf0BzpN
         veRSN33Xhyx7mssNhPcXUcDfNdZKMb21UgyyPo+AoSmt94nePLmuA/PpK9xKmtrfZ0v5
         Q16g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Uwx5zDutL0jlUBUcxYxaQuI0IVQIL1U/TXtCSJPFXO8SrpQguQxv8npgfwk8caYW3HSHXgol37X162Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mriSS06t+UuNufhD51930Dzjbh/oWOpBluJ5bILs9072/GgW6/
	4oDiAvMXSkBbmJeRQV+tb85JE480VjkGeEso34JjQTcN6EiPFK6NOK7Up7t6vm8S
X-Gm-Gg: AR+sD10Bdx5T9eqWOfCvPh+XTOzDMUpbvgYdnweLzuo1ima6Ipynx+Ji18ZOJrgsczx
	VO111tdSbXqWnb4WSnrOAChkF/9mrPHnk4GEboQvl6oIqARaDymk2i4f15n9HTNHpRTsuM6SaG8
	ioOWhe/QhnUdotycivOGkO0sIwxi9V80UalFTGOdc+KMFx/lH5fIH8h4dP2laL5bNhBRaxnij5z
	zl6vxXplf5WiU1Wtgg9Eqde8jODyn3IsszcpLfi7aqAPiRIXFLUmqUWtS9khgMoRUNWTVmGNniH
	0ICmFdC9iTKOz54R6IVop9uhUb1m2q8qnrlnhh6Yz74kQ4Q/P6Yn9r1z7ggZyHiypixfY5X1KDR
	GphUfAVQUJC7eBN/psW0uW457d9iUq9uyHPeVgpC9Grnwc9KnBlWjO8JrDIVB+4PFc2fBCeeo+k
	5N2HLSCJJT+rUzg642vW0qNE58RR/TcVLnNtVvDssV1buluZb7hQm4mNzomwteaQ2qXho0/DB8r
	GLU5X9x2m38zgtTP7sEw3+n
X-Received: by 2002:a05:6a00:3692:b0:848:5f4f:289d with SMTP id d2e1a72fcca58-856277dba33mr24011291b3a.4.1787983651209;
        Fri, 28 Aug 2026 23:07:31 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea6fbbsm1230035b3a.38.2026.08.28.23.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:07:30 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: daeho43@gmail.com
Cc: daehojeong@google.com,
	jaegeuk@kernel.org,
	chao@kernel.org,
	sunqiuyang@huawei.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH 2/2] f2fs: refresh pinned allocation boundary after resize
Date: Sat, 29 Aug 2026 14:07:24 +0800
Message-ID: <20260829060724.2657266-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_x47vsdmPnYD1seCRjXMktocfcbAjPk7RMQEoPPJHLNiA@mail.gmail.com>
References: <20260828141240.2391915-1-qiwenjie@xiaomi.com> <20260828141240.2391915-2-qiwenjie@xiaomi.com> <CACOAw_x47vsdmPnYD1seCRjXMktocfcbAjPk7RMQEoPPJHLNiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daeho,

I incorporated the review in v2:

- Simplified the incompatible-tail condition.
- Added an error message with the main, shrink, and tail section counts.
- Moved the check before mnt_want_write_file().
- Restored the compact formatting in the shared boundary helper.
- Added a post-freeze recheck for a concurrent remount option change.

The complete v2 series was sent separately.

Thanks,
Wenjie
