Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2A36DA15;
	Wed, 14 Oct 2026 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995808; cv=none; b=SDJ8Uw4jPbpTCj4HVFgc6uRQGIIcr36+2/tga7YSIBEvgCueHuXZXnNjnRhLisBNH2iiaH5yhsz5Kt4iykbW4i5XhT2mWBjgE8Nytz5OWOEnxDmScPDgmZICVPhrdMiBKr+O2CPnD1u+VbQYZ1wPgtLmMj8V40iqW7S+DTo681o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995808; c=relaxed/simple;
	bh=Fl9szVcyfwiSTFtAiR6lrQmJogBb9OyiHM5PVSBMQfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MVt2/9ZfHvmgCvge4dGn3DRZnuOTOE8xwt9uSuZaKIt4tfZzJc8mMX2g6e4EPePMK81xJ3bfpPh6VVD6oQoMWZXq08iVEStr3c9Q77IKotL1tPEMk3Mbln4Ge6atx9XaElR4M6yiO5G3/SkOJaCGiuigHUMx379uQvZay7IzHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xmgl2Lvl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xmgl2Lvl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6741F000C4;
	Wed, 14 Oct 2026 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791995807;
	bh=Fl9szVcyfwiSTFtAiR6lrQmJogBb9OyiHM5PVSBMQfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xmgl2Lvl2ZSkAsdcL0Z2u4LJ5PHMrzjpaXSyI6Tr/rElGGSeT1p/3qmBTAsOnuWre
	 lquNIx3DPWOQSsZTIMqDf2UprmB1ePU84dDCffAxP+dXB7q7M6o6IWZj8c5in1Wkyw
	 jMTP1pxj4Of6C+PlyxgcbhEWWUlvRTCSjvNzUFqjueEAD3vJrWV1xCLnKt8AM+8Ell
	 kvHlNMUsM5h5/M1tVpt+UNvO00p0cFDHdwk2oQ6J75s9CN5HqIQekLPozNUxkY2+JE
	 QUGcOhh3Rmc83sHMou+klIFby1YdXeK70uXaCimPmIy6d1XGn4JZzism42x7SvayG+
	 ItZw/fQayEaQA==
From: Miguel Ojeda <ojeda@kernel.org>
To: sashal@kernel.org
Cc: apw@canonical.com,
	axboe@kernel.dk,
	bfoster@redhat.com,
	brauner@kernel.org,
	broonie@kernel.org,
	cem@kernel.org,
	chenyou910331@gmail.com,
	corbet@lwn.net,
	danielmaraboo@gmail.com,
	david@kernel.org,
	ddiss@suse.de,
	dzm91@hust.edu.cn,
	federico.vaga@vaga.pv.it,
	gregkh@linuxfoundation.org,
	hch@infradead.org,
	jani.nikula@intel.com,
	jkoolstra@xs4all.nl,
	jlayton@kernel.org,
	joe@perches.com,
	justinstitt@google.com,
	kees@kernel.org,
	krzk@kernel.org,
	kuba@kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	skhan@linuxfoundation.org,
	torvalds@linux-foundation.org,
	vbabka@kernel.org,
	workflows@vger.kernel.org,
	wy@wyuan.org,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v2] docs: remove Assisted-by references
Date: Wed, 14 Oct 2026 18:36:06 +0200
Message-ID: <20261014163606.109478-1-ojeda@kernel.org>
In-Reply-To: <20261013121501.3738437-1-sashal@kernel.org>
References: <20261013121501.3738437-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Oct 2026 08:15:01 -0400 Sasha Levin <sashal@kernel.org> wrote:
>
> The tag came up again at the 2026 Maintainers Summit [2]. Roughly 10% of the
> 18,533 non-merge commits in 7.3 through -rc7 carry an Assisted-by tag, while
> actual LLM use is far more widespread. Some contributors do not know about the

I checked that number, and it matches what I see. It seems to be rising quite
a lot, e.g. for things in linux-next that are not in mainline, it is more than
16%, and for since -rc1, it is 19%.

Anyway, the patch looks fine of course: it is indeed part of what we discussed
in the Maintainers Summit, and there is no mention of "Assisted-by" after
applying the patch, even on top of `next/master`, so:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
