Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB054252AB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234603; cv=none; b=AET2CEEzv0BPABQtOqW/17Rl9p1L17mCtim+sOWfkNmdYckghXUHY6j90546vpaW+fOv09hjrxAExnxz3Z0X6O3Cu0b2+sLCPmT6ElWxvlBnwYuMDrjCcguLgi4qIgg6U11iNbAWYuZr/Lh2WFQ+ZFuU0DNtaL5oVo1xtHIoqyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234603; c=relaxed/simple;
	bh=i5+zAkGDOBVIXpAM6CUlVLeJJ5L7kU7DB08PjMuDu6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shez1K7Z0LTpvr4yZjBOPPqOLc8jS0dzprsHF73DjZ9FxmWPqg9lrMATSfQD+ovD2AoxujbmxqX//dlRPKdecLLd2AItmXuD4eA0Vaf6b8l3yO/0ibpaIj7KnX1Ep+SuTL7J2UApDoSClgFQ5zB1/3G+IVfJAttktaHudp4XrcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDQmYNa2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDQmYNa2"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso922930a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234601; x=1790839401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75FWx2B+/jj4qiq6OD4xfGZ+KktqHogQjCI/kBevvfw=;
        b=DDQmYNa2D4nJgEEoHMD7zqymCHP+N08oixJw972cYGQ8eVoz4sngNe2DtniRP+w6LA
         MiRD0R6Cjfc/XiVRtAtQv2XBrBU53V3T0EbeSQND1jsqmez1I/7T7UePmqH7NsUGSEuw
         og/pYD5lhfILzjB0ITd157Jre6YI1FDVSIqCT44RS2cQ+riP90XUXt2dNBUIhhUZxDvi
         7KcuQvNsU0r/jKcPbdSGgxOM66IiXJCQ/XwaJxAR4uRrRYXh2oEj1iJ/3yB+pIs6QQ1Q
         CEiHrQzMT6Vmvty85l3NSY7ae5nFmF6dSBWwyBfX4ZZZe8jCKyVGpulvhSNUI43Ns1mO
         jWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234601; x=1790839401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75FWx2B+/jj4qiq6OD4xfGZ+KktqHogQjCI/kBevvfw=;
        b=dDIl/dfZqYqJH7n03MjaLkTlpZ1XVXMHTE4h0wvp23NX7zqLprNuZZrGGDZ7L+5EDe
         dLkXxiyI6NghVZY6OUuqCHgBO5p3aankEWQFh0MBz5KWk80qFdLHZIZIEtL13AUggODe
         g/2XRCZH9V1oVxl82lhd5ig1KS0wcncN6b5oTEnLxJFdb2TLjOk1AMAFCYaxGsWiSU3E
         3sxLyoEJdlG8NN14xjlLtfw3DshXLPxPfBlCB7TEUcJfLBsa6ZPBxmZf2qXwIhlSX7sj
         BSk/d+BVlpgNdvdMn/f6DSS/TUWXZ+4UwqpUyCrotFJyKHiSmT+3g3b2hXjMTaawe1/E
         ju2A==
X-Forwarded-Encrypted: i=1; AKwUvBw5Hhkf9yWiKwAiuOjIsndghZPGoAxAg1awjZuSbB1UVIKzNaHCkZ7yFDPNSifjpY1PGDKP92InZo8lwJY=@vger.kernel.org
X-Gm-Message-State: AFuF++kR4keJQkQnANsJscDLkWLWXmbpbcjA74V8jJRZocICs/m7uLEw
	DFE4MklpeQ6I6WwD//wT6ZLGuaeig4nOg7aDKH766RBTnlThNQGe2pSd
X-Gm-Gg: AYBFou3QmVdqrnmpjSubRjfYU+6OLCkQo14TpputJAAuVZdPDzd6/apMDlEu6qt3XtF
	SGvuNivShPIG8sAffnbcyf5ef5MyQnfBJ70gPfDSa8HDRszjIq/3Gvd5FuPKyH0T3yADMImZN3o
	uJfdtrvHJmJ/67ZqRznJ0bQI32CLLR+eqkt8ueyNsqd3LoztP/oL37nGGepep7in5G2W7fjUyCR
	IivNeSYDou4nqTzvgbg+zlSU1vJhRVyGpHlGvxy4Q14KJHtnKdydo+Ow3kRGqg3yCD02VCG3Mjm
	qBoWXKyWfvDoPa55WZJoQ8sehS3t7dy3gS2eFVWLKQ3nXODHHOZfZ2czlxKF3IVSfxi/Z2DgnW3
	DF+teXDZKax2ApgLUCUl2nd/aB0FYsPTSJEtsDzLf3q1n8R3XtpTY0aVfdAX6HxJMhie3s+inKY
	yoosErpahZVxDHt7btOREqo+4gqXhoYYVYFqegsywkDpUd5Ey5J25ZcfLXbuF4FWP0YlMCZZxJ+
	sLyXNUCPcqwoZ4CCMJS4A==
X-Received: by 2002:a17:90b:3888:b0:39e:d2a:e25a with SMTP id 98e67ed59e1d1-3a098b98d91mr1482989a91.13.1790234601510;
        Thu, 24 Sep 2026 00:23:21 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f111csm3219520a91.2.2026.09.24.00.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:23:21 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	jaegeuk@kernel.org,
	chao@kernel.org,
	ke.wang@unisoc.com,
	niuzhiguo84@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH 1/2] f2fs: simplify node footer check in f2fs_cache_write_end_io
Date: Thu, 24 Sep 2026 15:23:13 +0800
Message-ID: <20260924072315.57755-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924015213.1196491-1-zhiguo.niu@unisoc.com>
References: <20260924015213.1196491-1-zhiguo.niu@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 09:52:12AM +0800, Zhiguo Niu wrote:
> -		f2fs_bug_on(sbi, entry->index != nid_of_node(sbi, entry));
> +		f2fs_bug_on(sbi, f2fs_sanity_check_node_footer(sbi,
> +			entry, entry->index, NODE_TYPE_REGULAR, true));

This also promotes every other footer inconsistency to an assertion.
Before, only a nid mismatch reached f2fs_bug_on(); the rest went through
the helper's own path, which sets SBI_NEED_FSCK, warns and calls
f2fs_handle_error().  After, any of them BUG() under CONFIG_F2FS_CHECK_FS.

The other two callers went the other way.  __write_node_cache():

	if (f2fs_sanity_check_node_footer(sbi, entry, entry->index,
					NODE_TYPE_REGULAR, false)) {
		fserror_report_metadata(sbi->sb, -EFSCORRUPTED, GFP_NOFS);
		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_CORRUPTED_NID);
		goto redirty_out;
	}

and the read completion turns it into BLK_STS_IOERR.  Worth a line in the
changelog either way.

FAULT_INCONSISTENT_FOOTER is injected inside that helper, so with
CONFIG_F2FS_CHECK_FS=y injecting it now panics instead of exercising the
error path.  Deliberate?
