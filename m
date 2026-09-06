Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F238A729
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 06:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788677955; cv=none; b=n7cieS86e0CPqinZmo3xSBlV+VD26qZidfCTp0Cf66uHH0IaHpY5NMDuQPfuhLyPt9gBp4rs/IUHu0x2BBT0RaNPvif+3ismmAJDGAPxTIM+v25EK/7bKCFNPnuMnkwdVcTfev7iXD1seHEYLLhbS8sfsNVI6I14Go3++Ak+X8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788677955; c=relaxed/simple;
	bh=nmsAQww9dgWl/W5T2Mjb95A7HHO+Y3Vn0GUTxAd2cV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzopJ/hQSS6Lm1Z0rSH18548dpCKr2unE8YZD8wxlkrt5lBZZ/wn06TWK0wY1LKXs7z9H/Y7Mgk+Pimk5HNY1qfydJxkB4hFTqNFYZ6XbfjRnhFNCOidUlxWHj0J8yzV4XZRpEI99rn7CLl6QSwdekNINIbWqmWzYTf0+P3rdYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdlCVU3M; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdlCVU3M"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cace91f112so20003995ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 23:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788677953; x=1789282753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmsAQww9dgWl/W5T2Mjb95A7HHO+Y3Vn0GUTxAd2cV4=;
        b=AdlCVU3MYOgXK3/IvMbNZxahp9pbp0ZYAH6KcmBJPbUu4tp5FTll4wiKnl+lV5Edw5
         DcuMlOknZfQ2ID6WF2UttBtoU3wdysEcHAQ6tvCr3GryUOHDPX0mF59ZsxsYqTFAi7cb
         XDx0dUq7gTffiTzRIhPK3Ga5uxWsY2tIMFVdzpmhgOmM2BHc1mcYjbKoJNVNbC3gCEcu
         pUNw6YfL0dqCMGgZhYqO+E6KGHebg91rMOixtmJf3WHMirhNNki9PJJmtgAWaH7sxWBS
         m3a0ogbbkmtR2uLAOUYGUOL8ZDIDrOKytrlaxAs1pnewMJfptgvJKUSjpEdgtCrgHRJ7
         zMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788677953; x=1789282753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nmsAQww9dgWl/W5T2Mjb95A7HHO+Y3Vn0GUTxAd2cV4=;
        b=Ut5sVMdDXgWy/IBl68n+4waAMsJ8bdUmV+1YTRnnqueBk0Nr3JM2U8TeIpC8w4G93b
         Ry5lG28IcVeDh7kgt9ffJ0EiSq0jjh8EdiFb8iGlBLwA556SWP30Cv22fUlicB+wQT+S
         zBmxlosUVMmntpcOuHG742b7ZrAYjemA+SOdu1h9L0Ex1191lFtBFt8Jb1UuEkNj7imv
         STLed5ie97skaDyVewT0g3RRbqE4K/lTLUVZ2QKSziztjacviwiZ+M3N9c/0aB3/r3AT
         YQaBgMZ/5/NMLgAmkmNSMsXMdy8OO3E+HlTfMkJFtxa1eIuEmj7ETds+wg4SuwbZERXb
         5EPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPCgxP8m0s3Xyi3GcOuhGxqbfMDugM69p0kJplLZ3hC1oO5k91CDuBtX6DneoFC9RMFAehNy63W/hpHNs=@vger.kernel.org
X-Gm-Message-State: AFuF++n0B+DKFOVCFwNCmWnPv6zOKV8DksfV4Xczh9bknx7sxFJ9kMUo
	jFHEredLTjMflWJgThzf+vCD6ogVlP5JbPYEfZfbRHGxn6IlboJNnhk=
X-Gm-Gg: AYBFou0yUmTCNaboMNQgJcnWpzjE1SVrninCQ7MMUPd/bIz4gJArCvg3bzgBUNwn0VU
	9IXjhJDywomjdvXAFCxlhzLmVEvxpbtGA1EB8Dt8fquyQC+s7btrtnwSpjmVvOm4ij6tBJA7ZQz
	ebSTnJjiwdxmF29SUHwVJqDw10Ys5uQUDLzx76i8dbRmS0p9CT3KcpfUbGOChn6YWspRYUQMriA
	wO3TlraTdOXcksjVA/e+Xx+9h5Pg7VfM8qDRoJ9SAzRmtcjQ/rGecfCiIsCMg4uEuBPaTf/gfaJ
	Rt9mlu0G4lqwta6cJR/209LovH3rh4L8mTuT0Z52+mHKiHkuFwCblAvu++W7rlnOfLGrRiqB67L
	xlwxRVVVOh1QArQWYGo051bj6sKfdklx+s8sSBKKCEv/mSjVE6oiCZAh9GiTmLRkGrwxs9JohK1
	7GECvlzsbu5Y/pzdAsm6dn/R04NcOL/fNUawwq+sH9QD46qkSJV3tA8GGxTbLB7nBxDjXSD2E8F
	6JsP6e+m7axnfAYdsV2tGtIzQNM
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr23047016a91.10.1788677952877;
        Sat, 05 Sep 2026 23:59:12 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:2b14:fe4a:ab17:f236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm13604739a91.10.2026.09.05.23.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:59:12 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] function_graph: Use the saved entry's size when reprinting it
Date: Sun,  6 Sep 2026 15:59:07 +0900
Message-ID: <20260906065907.1495913-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906040248.3D46F1F00A3A@smtp.kernel.org>
References: <20260906034406.1335316-1-donggeunyoo.kernel@gmail.com> <20260906040248.3D46F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 06, 2026 at 04:02:47AM +0000, sashiko-bot@kernel.org wrote:
> - [High] This problem wasn't introduced by this patch, but state
> desynchronization when reprinting a previously failed trace entry causes
> the current entry in the ring buffer to be incorrectly consumed and
> permanently dropped.

print_graph_entry() does not always return TRACE_TYPE_HANDLED.
print_graph_entry_nested() returns TRACE_TYPE_NO_CONSUME, for the reason
given in the comment above it, so the quoted branch is not reached in the
nested case.

For a leaf, print_graph_entry_leaf() has printed the entry and its return
as one line, so the entry left at the head has already been shown and
consuming it is correct, as it is on the normal path. The iter->cpu != cpu
test is what separates the two: on another CPU the head is not the return
of the pair just reprinted, so it is left alone and ignore is set for it
instead.

The other two are pre-existing, and I looked at both while working on this
patch. get_return_for_leaf() returning at !event has already consumed the
entry, so failing there leaves data->failed set over a copy from an earlier
pass. I saw that once in about 30000 replays but could not pin any output
on it, so I have not sent a fix; say the word if you would rather have one
on the reachability argument alone. The static on ret in
print_graph_entry() has no reason to be there, though I found nothing that
misbehaves.

Thanks,
Donggeun
