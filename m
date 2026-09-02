Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8194A64E7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363321; cv=none; b=U1Rjr7TupE+j6GLHINT4xHFCed6jfRC5jmL/8wWSxECT1O8GiqGnxAKzWZsQCHnZFE6bNqQAvPHDnhAvmyRgYQ25qOrdGtR+tCz8jEI0TN1MmOY+a58sB2RIzCQbdTqr+HqzFj/QiNHV7E10U6tz1EhNHzA4IttLDwArlPlb/jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363321; c=relaxed/simple;
	bh=nnaE/lgaaxlW0qXC3erEuEvej+PS7uE+7YQNE8NWkpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E72i6EPoUM23ZHPXVkPW5iMvrFIFWEcTym7QDD2ifBRyJkrY/bvxN+JCtVNI8SZ7G7MD54Hxn4zjPX3dgaFCweUGksP78t+Aa6kO5yMLvYZYiIZpsKft04s/nzo7qojptNCfiiKZTbkIGA8JCmoBa6jfHOYu1h/NeM+qbB2PR8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uu7MTNqY; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uu7MTNqY"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so1038975b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363315; x=1788968115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSXsJ2pLDAqrsV6cZ8D03H1qT0HQeSfWzk4uY+cN5NQ=;
        b=Uu7MTNqY2p5Z4bGgEUJ47K6ULlk98MxeNa/qlvPg0e58JzRPsQuYyXEnSXRys3NWKn
         sde7rjKag1+nFzfRiW3aEosbBqpAOIP5oWjsjS+alw2d6oJ34TksJzrepy61GLqDt01B
         VZ1r1RIbCVhmonvM3qqq6NTn5rOvWYcWhF6RMXKoSV7RqEw/edEjlRsJilhZ4vpH9PRH
         ScJDxh0tExSF9gyXanp/7uBQVnEuZgCDnEPw/ZOb0LQvoaWvAKEsEOsl0YYKSNLt+5pZ
         JFjSF60wG68WZ4QO0AG1CHaHLmds+rzhu7m6/6PJyJC7R2VeeU/ZOZsGwyO9daGXVl1g
         BnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363315; x=1788968115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSXsJ2pLDAqrsV6cZ8D03H1qT0HQeSfWzk4uY+cN5NQ=;
        b=FUa+D+7hrxYlUq/iGJlN2wo0AHX2u8Q0OHJjBVp9cJdjFpdVT7z4ccwo3rrAZAuE4z
         1ZfaxKyf//K658KoPgut/QUlHsYS3yQ8FHMc0ICuiJiIEjMZAShAzwwtY2iIVTODyaki
         POr2yDgA8lu997KlWAtcesaGeYOJxLIUtbgA8ec0wHOlRvBdg0/aXtl7Caoh/f39pqeX
         I63hQs/mx3F/g6dl5OosjmFsxVzG/gj/G4khXuSLGLAirmZSvXgNDLSwfUql3YGfNOp6
         8mbFpX6WFKd2avE4IX/w3qUzXalTsAW3tBL1qbcZ1/cN+omFsg0d4WHfsisShIgcxApJ
         ZU2w==
X-Forwarded-Encrypted: i=1; AKwUvByxzV10PtJWlgV+0PeucwRDc/tw085xgjzgDu7oUe5nkAYP9zECrbEXTmqhurpFDbRfULbp/pI6cqWj48k=@vger.kernel.org
X-Gm-Message-State: AFuF++nsw10ad5r7//CUMArlFeh8uHybiGU5EOY4jatdozY53f+9rhPx
	LjRW3NMeqCxc7jAZ92JojW5kC0eOfuTuCvpsCzrjk5GHUl3x0mmRQz+O
X-Gm-Gg: AYBFou2MMotbJYU5DcqRgRG+F7EyqlAEHwX2eG1wLKEmujnNEGJ2uyvIdZO47I5iwx6
	6LOHCeihGF2slvDR55vtDx91CXDpWxCe7G6nnMoUxW6zalRRS2yTAAEltWAHW+em3ULV3ErAMZF
	CLfW3jr7qGF2+1FA7xaPiC5OZRrlXbVZ7kAN58Xhjgk8TE9OSGUDPVCV9j9oUmufyqVSOhxGyAu
	hVoMkevz6rJUPfvZfC+/L8Y+OfjzQMj5rIGftNnJXREXUd+u52WdIU5mLmPRzNd+ejuBcpUUiOz
	z+pGHZZzc8tA/OYevXdGcWi6tQVNwgGKn2S73MI+owxKuIFLLVjfYywElCkzorZbQ1boSDVXewu
	Py2tEqEsOewRNj3FDboR1Uir7XZ8Py19s/OEsoY7BTGlETCBsdJfDFRPmCOfiz/1SVBZ34M3SHS
	n2658qhJvwIAm1ikk8xmpQEMQ6/wgFj8lAwlLxVUSMXF9khffwaRDeVuhVLgdJs3MmX47RrUqR+
	K0=
X-Received: by 2002:a05:6a00:ac85:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-85ed21ed9ebmr9958248b3a.1.1788363315332;
        Wed, 02 Sep 2026 08:35:15 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2ad3eabsm1656147b3a.13.2026.09.02.08.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:35:15 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: chizhiling@163.com
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	linkinjeon@kernel.org,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v2] exfat: speed up file creation in large directories
Date: Wed,  2 Sep 2026 23:34:58 +0800
Message-Id: <20260902153458.1277254-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d112a566-eaf0-4db5-ad33-91208b98e82d@163.com>
References: <d112a566-eaf0-4db5-ad33-91208b98e82d@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 1 Sep 2026 15:45:24, Chi Zhiling wrote:

> This is a fairly large patch, which makes the review a bit more
> challenging. Perhaps next time you could consider splitting it into
> multiple patches in a patch series :)
> 
> Reviewed-by: Chi Zhiling <chizhiling@kylinos.cn>

Thank you very much for the review and the suggestion.

I agree that the current patch is too large and difficult to review. In
the next revision, I will split it into separate patches for the Bloom
filter, empty-entry hint, and shrinker changes.

Thanks again for your time and the Reviewed-by tag.
