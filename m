Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7EF38E135
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132392; cv=none; b=utS/O/tvaGk2WliAql/cgwxLWH4LZ8/x50FDkqprOi/MPvF1G+SFfej5JCd09wxBOMNAl5XKGFNga0zUJ5mdkkUxqt70IGslvhWMTwgtugXYx9kDmf40Hg2vwG9fVjPT/XT1V3lArjpV1+GsW/B5Zvsl/+M/g6pLeE8PbJpNfZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132392; c=relaxed/simple;
	bh=5pYBGJeLz4+tOOPCafuu9Zn/0MD382vkNaRMoh+JKVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIhGjRiYvL6CoCMgLdrQZ7WdRbqo3qhNwIElOBxc73S7TNIDld8nmGTF93iAJqtfVB2ZnIatsPvNUrh9V/Wk0ylV6eKDJsKpAwkhGCZFtkQ1AS97uFw/CSsqKniuz85NyrRqHRyGYCDLA7dEYX6zAiArVXmgeCtMrkFzjhWq/QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKy9RUyG; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKy9RUyG"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so4288462eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792132390; x=1792737190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pYBGJeLz4+tOOPCafuu9Zn/0MD382vkNaRMoh+JKVg=;
        b=YKy9RUyG4Tbj/oKKK2Jg3F0o8wa7gI/W72C8zXnuscFCFKigmokIZ4MEfhWxd1KF51
         e2jOpwb6A5WxcFN8VDRWCXVPwFRlbGvrmhx+ihEZsGmEXYGwIx3jbreaGsN9826tFqZm
         POlb2pYx3uuoohswSu4QZ4B+WQere59/0EqtJS+fuQ2MiGKlyBPdYy5JBacPLzT7L/Vg
         E4ZlxqVVBuyPIyOEX5R/6QCMYIZ0WsBihTVgVAw4NZWqTiMYwr4GvOyGk1yW5WEYiX37
         q+zTmAjzqgVKP8V2Srya1L+0AIECdpIafYFphBt/q3s/8M4GUrNxZ251nDfgZj0OHSFd
         blHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132390; x=1792737190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pYBGJeLz4+tOOPCafuu9Zn/0MD382vkNaRMoh+JKVg=;
        b=YepfUH7lUFEAU10Kmv19dh4WBpN0zBNUXbRXRMNvZYKGFTyzJBQRRk12RJKDB7o9bB
         9LYnWyfaryR1yNdXaPXGPxsYs46OImQRl6wgDHx9a0dgOZXc7WkoW6BOoQQqlKS7qlEM
         xcuIBu1f7RAKqV5/66zvBupkLb00cK8CzTEWr3AP/h0Lg4p6LAIq5vWbN//UI2vd5y3W
         lDkq0S9irIV8kVNdG8ubuxqXVS0Bz/tzfXetNVqN4u/xUVmGsZjOlqB6e9YRaoMmJl7s
         wigM+vI9KWsEoiI6xHkLxidqLi7i1QId9DyPnclficZU8xpflOU7noX72UcflxqhQZ1Y
         BTaw==
X-Forwarded-Encrypted: i=1; AKwUvBxkoqWzYwUSgau5+V0zbGIwQNllFmzKX+j3CfbN4QjJ1hwDV2mPL3BkA7CKMvJMjJNpMOEJAJq8Gw0HC9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8yp+ftuDn9fgHosi5EcXUA2T97P/Ijf5vFThJANZbM+39c6eW
	lddNKTlhD8TjqkoltYT1JE4TgdQGpt9E96l2swcgHlR2p9n35/tN7GBb
X-Gm-Gg: AYBFou3Bp8/JKXYOOvx2TpQQUwgtNpCxyfbcQLMxtMGPO+EbsgD94JnMqrJdNXd5e+C
	awzze2o66NAw02VDbCBdMluoUWV+Orj3rdWswG2FYfMh7R4ZN2abrBjdcdxGlT4ALACToKHO4tj
	7WMpTu307x9IX3wmggcd7OgHkKcfG5hAILN/3zF11pSoykLu3XJaQeedJAOznz+jCSZh8xGN0rx
	E2LXz2/QGPyiX5Lv8MWTIQAtcpwK7gWxEEgIsq9fAOfOTA0D+wt45CrgVWFfAr9f3CmK202a/8j
	Ivgmy456NnAE9k9EFiNNvIP40OcqRAkNKYDJJiO22iBEVS8aGiET3p+mwcTW3qWkBBZ3qwIYtq0
	ihDojMhedjd6H+oSThCvqFWM68yEwPx45tqVykumkIn7ZCN5K3YcJkPYZ5cfADG+ijympx8u7Xq
	LTEcUzu3O18acBuBjIjTC2gRml0shrGZl0gkq9ZmvxTnm0PP8wXPPrbB3rWkYka1DWOy0D0qhRi
	QCSSVOtGXFvNPgj8tYFKuJefkJaa+hWwd8=
X-Received: by 2002:a05:7022:170a:b0:15f:28e1:7c7d with SMTP id a92af1059eb24-16a61d5c4f6mr25527430c88.42.1792132390074;
        Thu, 15 Oct 2026 23:33:10 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831bd28789sm3027457c88.19.2026.10.15.23.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:33:09 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: daeho43@gmail.com
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com,
	sunqiuyang@huawei.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH v3 2/2] f2fs: refresh pinned allocation boundary after resize
Date: Fri, 16 Oct 2026 14:33:02 +0800
Message-ID: <20261016063302.426184-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_yFv9ht_Hbg5a3hdx0+-=L7YXqzx8NhddbZ0Vjj2tNJLw@mail.gmail.com>
References: <cover.1792050467.git.qiwenjie@xiaomi.com> <eaed01c69f5af16df36a6df9be3f6615e4818d29.1792050467.git.qiwenjie@xiaomi.com> <CACOAw_yFv9ht_Hbg5a3hdx0+-=L7YXqzx8NhddbZ0Vjj2tNJLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daeho,

> Could you bound it by MAIN_SECS() in get_new_segment()?

Thanks for pointing this out. I've sent v4 [1] with the suggested
min(sbi->pinned_area_max_secno, MAIN_SECS(sbi)) bound in
get_new_segment(). This prevents pinned curseg allocation from entering
the range being removed while MAIN_SECS() is temporarily reduced.

Patch 1 is unchanged.

[1] https://lore.kernel.org/linux-f2fs-devel/cover.1792116883.git.qiwenjie@xiaomi.com/T/#u

Best regards,
Wenjie
