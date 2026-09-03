Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1404139281B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422981; cv=none; b=H0zTimjXtQ09z3IDF3ULGUXRuo7m20n16crPO+gSooHVvxHIVKKA1oQJMikxSjct4jzDd5yeFS+slh2q+EN2WqqGPylMDvS2yMP8ObttSYFkQg5J+3nNEqlYPNQqtvMpFOB36i70k6aCsT761f0Co/3sNFfuYuQ0tj3m2vNcGa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422981; c=relaxed/simple;
	bh=wddQWovUxe2uKJyvwdvKzdgZhQJpx+9myOGJmM3ZFx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AfmLmRSUhqvAJ4sacbJ0inDPgp1mBhLhqFHnTG7MxwaCPzvOjXzNiM6p2udiBDbCh6xMwoYjwkM10aVLTcandIJqrBat9unHOmciUPcLCRlnu8/xpGRlgUNOqWgBGujfrON2nPxTRwZ0e53v0S7ce502UOht6swTJpt1Y+UuYJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQga4iYN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQga4iYN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6d28aa26cso13350895ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422979; x=1789027779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wddQWovUxe2uKJyvwdvKzdgZhQJpx+9myOGJmM3ZFx4=;
        b=YQga4iYNatyLZQjJHgBJzVK0jpXBhAFsGsc4tFC/2UpSo2cZi09jPMGO5YbwniO7Rg
         62iUyWA9BLCoozK/yDQNhecoNINgh4Aed4+4JMgPs/WYjQ03/NMA+/1yi9YWyJpp8uA9
         icspvsiZ6ZIz36xylflmddcZ3galj7v1gGDiObSn0adgPv62PsxUWwNyr7llxS+Ys8Be
         mpRzaT8MUUk2fpuMBsJRvNkqf7bqi4z/NxbNSATall4k+wndGQyp0FMi0KZiubM7eEZS
         aIVeA16HbmqoTML9FtmiW4uOMu+J3ipcTNiM/uvJf5kdjZ0qTcHwKzgaV4k0fI1Sk/NN
         KJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422979; x=1789027779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wddQWovUxe2uKJyvwdvKzdgZhQJpx+9myOGJmM3ZFx4=;
        b=G/6Ju8K8Lc7bE9DsjjskSmy/fQjPdguIhsBQihmo8KenSXWbYXOJfFlzsI/NE1LeQY
         M3y8D+hfaQqEWn+8/Orvz7SXvRbWZrtynnJwB+dcK/aR+ey+9jg5j1yyB3x5fK66pasD
         wp2/X7ONDLcOtjtomGn9uvmxT5X1N4WIq102taZaxFN4e/50BEkfdPB3tMnWm0usySHr
         xHuwkXkIl3Iunlrn4X9W/XMlnxYbJmusq0I60KPrYq0Wkyc4KwsWI1YXiQN5jri/z+Kn
         QA642bgB7SgjSTQUQRcF0u2mkpJhuI0Z6ZAdGPnjliiMJ3cEszc3k0Ip22p01bLlt8gT
         p+mg==
X-Forwarded-Encrypted: i=1; AKwUvByb4D3M0Ss/1s/b+1SsLKSNSBg3ZvsLqLbMMgKiGZS9uaOEpJh532Z2PjSp/q/HYiJYyHosauDeLOJXdV4=@vger.kernel.org
X-Gm-Message-State: AFuF++nRFEqzTyf9EnS3GBOa3Fhth2sjRcl74C12fu1QFKCV3pKe82wA
	KPu5CVv3xFTNEdsD63hKY3ITMCrZc0a4S9M7UCsqDUWWU7FppGJ0/ZdR
X-Gm-Gg: AYBFou3hxdadzBxC0CALRPGkj7PYUmtnehHWgWZuAsMu50Jbp6LuLAr6j+uaShJhtdO
	IdD0e7fw6N8f95I7mIxHDFcJGz0P5QJSJgCUTDS5Da/6L8rvk8BwKkyTG50W3nMuqPkD9di/UxZ
	OwHA8xYuoPAdW4GnkvxX9mlbTpDvG+m7Xzr7TQBg6KwtCFJkoIgVALFFWCGnf4+NvQ/yC6KalIt
	vlsu4cuJ78j6VGVrbU/jH7mh7aPVl9Z4wFA11E/a9/dD9Ghz5ZflLDEI1b1edz0goin3PR/wX8G
	pQtLYOxgQNhEjNjHn9BecxVN/mH+ueMNSqJfDHevjdeqQVekDzeGjiiv5hxmdJhiyYPqy4YV0Hq
	sznUO98AMluh5ip/Gb0dUypQgm5uIFngmXEtUDDczu3hUVfXdRZTjRJpxIOMEMPhyW9Rh9kWU8D
	Puf5Z2rEWucLA1LVNvresOzlEzXi12so3mJrxhw8vyAzoYbDuoDQ+IUpDp4fjl1+oiPDkEva1S7
	brPRzkVyyoCIysFhVC84jzhH4lvUf/FX0VOzX+dhAhNG9V6nw==
X-Received: by 2002:a17:90b:3f84:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39aedf1922dmr16176799a91.6.1788422979169;
        Thu, 03 Sep 2026 01:09:39 -0700 (PDT)
Received: from WR5220G5-Peking-BMC.labs.lenovo.com ([103.244.59.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b087b59a0sm4004345a91.17.2026.09.03.01.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:09:38 -0700 (PDT)
From: Yuqi Xu <xuyuqiabc@gmail.com>
To: Sasha Levin <sashal@kernel.org>,
	patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Yifan Wu <yifanwucs@gmail.com>,
	Juefei Pu <tomapufckgml@gmail.com>,
	Yuan Tan <yuantan098@gmail.com>,
	Xin Liu <bird@lzu.edu.cn>,
	Ren Wei <n05ec@lzu.edu.cn>,
	Johannes Berg <johannes.berg@intel.com>,
	johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.12] wifi: cfg80211: reject duplicate wiphy cipher suite entries
Date: Thu,  3 Sep 2026 16:09:32 +0800
Message-ID: <20260903080932.92286-1-xuyuqiabc@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831133314.4125787-367-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org> <20260831133314.4125787-367-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 31, 2026 at 09:26:35AM -0400, Sasha Levin wrote:
> [PATCH AUTOSEL 6.18-6.12] wifi: cfg80211: reject duplicate wiphy cipher suite entries

ACK for 6.18.y and 6.12.y.

I'm the author of the upstream commit. This AUTOSEL backport matches
7187d145d904, which has been in mainline since v7.2-rc1.

The change is a small wiphy_register() sanity check: reject duplicate
cipher suite entries, and reject n_cipher_suites > 0 with a NULL
cipher_suites pointer. Duplicate WEP entries can overflow the fixed
iw_range::encoding_size array in cfg80211_wext_giwrange(). In-tree
drivers already advertise unique cipher lists, so this should not
affect legitimate hardware.

Johannes preferred this over adding a bounds check in the WEXT compat
path, which is why the fix lives in core.c rather than wext-compat.c.

Acked-by: Yuqi Xu <xuyuqiabc@gmail.com>
