Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26164E3243
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850609; cv=none; b=SXH8yKsOWi5pnhn6lr8wWC6E5FDD+XsnLzwHNPMSV8oPwxy+xVGlNEVuiXOs0sqrJvojth34yviCDlQ+lsQ1+S0hSOchYayBGX4oBT12pBoXEVWezvi6V6SdoQbVXd1fSs3ujuEzZvSZOxApYdF+3ZKw9L+mMMBNWz/P/QcxKQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850609; c=relaxed/simple;
	bh=EXf96x2mt3+0rsT4YN/N66i4e7zxAljxAJ3P6tiYQCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rpsa+054fi1T9eJn8r/28hdkxnwY1TvujRZamU7s8q8oKTLAEojYK2ncJU37SyK+wam9/wX1qh0LMwz8DCtpQeFUigNrh7RwLx6/ZzfAIbtGMXU7FnGs4iMHqXd7OFOFO4NJsI1hvS7MW9gxIjlEWqKoTknKeiIOoaiaMY+nqCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8A4jqkV; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8A4jqkV"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2e0d89e58so11687925ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790850605; x=1791455405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3MX1SIOE23Q6Knq+G8g7lwc8PeLBc1oDxDbBbgHkhA=;
        b=c8A4jqkVpDA4WT+qhiz9NJzgA22yNOZYPL2Hz1MeujxNcI2tUfKFuV9gVzYU2u4OYi
         tFEw9N+f2NWXzUQPI49793UI5x91APT0H3GgZmxhmEbcElNo+AcURi1+xhpxNcY41GM0
         KT7sgGaD0U0aS7CiErDPcK63Co1ZbtuvOeTNmBcp3ykBx3U7r68hSEKifrbJgwzvvRkL
         uV69cQH0WIlhBFA0N43wiFrFRnDPU/zEgHuKEbV01dq5Xpz5bFN9tlrpIol4NROfMc97
         YTgRFG2lgSrTVoD5H3PMfruLiv2z7XtMVtDm1kXmKl1Xp0MgMm3qkgxQM4ondNjYjVsK
         hddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850605; x=1791455405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3MX1SIOE23Q6Knq+G8g7lwc8PeLBc1oDxDbBbgHkhA=;
        b=vPTjCdqxtiGesmfpjJs2NUplULpDAwIc/rVLCoevSG5ixPjRbV9Xcg2xLHlL8vP4Ks
         SqzgAdQgrmiFJpLN8dy2TdbA2DoSA4wAjL8PXE+kiqYzNeII81rcxp+bGBSoHu6nZG5X
         1tpaS5BFHE64R01xkDXpXR45oglufcQ9JjibNy7hpXATcFSZljqNa6DF3EHPOgJ8gIMj
         33OJJHKaRQbbUBV/umMKddrUuuZcVNcSJvSrrsfPzdqRj7OOMZfDPtebW5L0Uvuqi/LH
         pxtqgMmLwbJTUhKx+hzORSRgVhSg6IffB0ku/FaVkSDId4wT45rTE68LDtdbotncyjUd
         pVtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEGgx0PHDNoYMdqAlDvzfHRWx8KQsyBYw6c8+yFoEtJduXOJXyFpjw18pGxKlKvL1ctJKACECmzDxjZsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK16teZntocZ5QCndz+1rh5lxW+gfWfIyKuXMpFhXWhH+ctGIf4
	H9UTmqQLfGCcunXStseUaovYrQTI8Z+N2NtYrAQ370CxT748oUrvsM40
X-Gm-Gg: AYBFou2SY4CjSuCWsXSJAbgujRXOTE244KN5B+OGww4V7Ife9MYCe7ZQhHwpmrUpVho
	OoVXbXy1DW/zW005ie9/wxGyIrh6iFZpZb/pnuhKw6j8xvL0OpA1RLnB5dYGPhWHSWWs7G8q/Q0
	xz3aSuLDhB0McIq77edTSKx66pPWy0hiyIm9gBS+2fHK8v9JHc36OjbkmcFzSXCtun+p1d34hUo
	SToxaUCIFgwjiOsy6kHwXKksjaXao+wwqSrska1h7iJPPSNS4lLoOQeWsR5y4+ttI+vN6/s6tw3
	3SL5dPe3VlEkHFrMXyYrroeLKF+vKO8x1OMoDTKJ5fbLO8WdnB96ctBP1nTygvfhW7xfqyuGpLD
	vkT8NtGI4sqWsqYoir7v3tS+jjojEf7l9Z7fxIwzxo8iQC8OhIjJIRyouRp2MgN56NVeTl0nLAJ
	RUJMNm8d4oibMf3vLoAfJYG8993tdtPRYehNr4cUK/pVSM3m7IEb2FhbPBgk4WxBUwDYStNWvPg
	UOe6wqdke0URqbKb/vG98Z1dWdx+ymwLfA+ls9Qy0AsN37cTAiJMt78r2ZwQLhUSLcxy68CoZJ6
	PraPbHo6pRhnmFzmuoI6IpxeiyXifnEJwKsSV+uPswDZjEHeq82QyRI3lok=
X-Received: by 2002:a17:903:120b:b0:2dd:c054:197e with SMTP id d9443c01a7336-2e2e4b48161mr33671215ad.35.1790850605188;
        Thu, 01 Oct 2026 03:30:05 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b62f4esm8664475ad.73.2026.10.01.03.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:30:04 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Hui Peng <benquike@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isofs: bound empty directory blocks in isofs_read_level3_size()
Date: Thu,  1 Oct 2026 18:30:00 +0800
Message-ID: <20261001103000.3408032-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <xr6nxaat4f4zlmnk6dcn6fyiih336io2qaxm6lytxyb23oznw6@xcd4rjwpg4di>
References: <20260919222553.3792320-1-benquike@gmail.com> <20260923175215.1577791-1-matthias.goergens@gmail.com> <w3rnunloyshklgq4ocr4jsullzhaey6u7odstfoyhd4usbfppo@m33jyem5jgrf> <20260924151356.3287733-1-matthias.goergens@gmail.com> <20260925043804.2091174-1-matthias.goergens@gmail.com> <cmlro2xzle2aa7ebflvxhbcv74mea7p6qvxhin6egpdvyzyuxh@s45tpgxdal3n> <20260926083517.556576-1-matthias.goergens@gmail.com> <cm3n7vjwbdnafttuz5ftkzz5wdbalgews4dfs5zlwvkyuzotuq@jo2nhsplhstc> <20260930033940.175021-1-matthias.goergens@gmail.com> <xr6nxaat4f4zlmnk6dcn6fyiih336io2qaxm6lytxyb23oznw6@xcd4rjwpg4di>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Honza,

> Right, that needs a bit more care but still, something like the attached
> patch should work?

Yes, it does.  Testing the next-section link as "not yet set" instead
of "i == 1" is what was missing from the first variant.  I ran your
patch on top of v1, built in userspace with ASan and UBSan, against 67
test images: empty blocks between and after the section records,
three-section files, and the 100 bound from both sides.  i_size, the
recorded next section, the limit message and the file contents match
v1 on every image, including the split-gap one your first variant read
wrongly.  No sanitizer reports.

Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
Tested-by: Matthias Goergens <matthias.goergens@gmail.com>

Thanks,
Matthias
