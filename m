Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FAA3F5BDB;
	Mon, 14 Sep 2026 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373259; cv=none; b=oSWf4kMvR/F1wwxnfelVHfUtDgvb7pLQ+i63thWicFPRQJx7jVVmBIKL1NQXeBkfxvQox/bmKVuGsnWZ45cuiAyA64F16logBsyd+AVF4CXFLRkrFPev5mWikX7sxSHEcKsTLFo1PeyCoE0FKcHlTTSxiXLI9uxAOkGM3L1xI2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373259; c=relaxed/simple;
	bh=eb4FmjjzjXF/tt+M0I62Y2AZklF9toP6QuR/nump9bk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dzwswPIcoi4hWgsu1tZgGexps3vPg1d+NzGDAfehFnH1FWqV/wuu3fD2pYn8BVbnOflfremeS6fmNm+qNS8EDeL7zXGH+m++sQRrGvCtS2Pcx9cCugSO8Ssn+3mwy0HgIT3xzt1gK3coUSFpv097rMIt9ttb9oH/QpSh18C1jlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncXo7CHY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncXo7CHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038FB1F000FF;
	Mon, 14 Sep 2026 08:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789373257;
	bh=jVifJ45NiGh/UkfA5CUOlUG1aFVFPbEnUx9LB4glQZE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ncXo7CHYZGAJ3Q0U7Lry+mBUIPPRRV8AEXwniSpVtFeS6KTJRqlSAwzLy3gAiglw3
	 V64/D+KAIzCLWIv+e4q4KsBRRKwX4/FHikee8iVv6bjTSBmFvqri6XCiULzJvdBoOc
	 6R7zG0GKaAAdwzGIlbOReW6lx+N7HJhcZuc8b+P7bKDXHknGQGcT3OTdlHb7263s+7
	 ZAIqtnDf0caoXY5tSzfWphm1BTANDrpPPQFF8hR9CniFDj4AczFodQsxWNehg2g1JF
	 NY9PSaw3MrnUB/fmtNOcOd6I9JvdWRrqzMNvkyMcLVBA29jPtroaO6lL4lBgFqNUvA
	 DADfv853TbxMw==
From: Srinivas Kandagatla <srini@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <20260826033803.475-1-jianping.li@oss.qualcomm.com>
References: <20260826033803.475-1-jianping.li@oss.qualcomm.com>
Subject: Re: [PATCH v13] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
Message-Id: <178937325582.257763.3545375214126322609.b4-ty@kernel.org>
Date: Mon, 14 Sep 2026 09:07:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 26 Aug 2026 11:38:03 +0800, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Additionally, the current implementation allows userspace to repeatedly
> grow the Audio PD heap, but does not support shrinking it. This can lead
> to unbounded memory usage over time, effectively causing a memory leak.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Allocate entire reserved memory for Audio PD in probe
      commit: 9981fbe599e80d0fa264b714ebf14d8d80d9790a

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

