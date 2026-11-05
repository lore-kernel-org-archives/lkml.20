Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904648;
	b=RF4KKCmdidogvKKTaIDinGireQMsansweArt6r+GkdetREkybs4eGt2zgQ4leHyAdXev
	 IIUKxskFxndTC4I4fePnATkVnUEnTkH+YAnGm5pXcP6BWt/j1KaXh3sIJYvC0OeYCzmCp
	 O/36AMNqm7LMpcMxWrMVwYm6hGqyu/hE9hdzXoZV9oHyQMToUo+Qvf/4UqRGsI10tvucl
	 vxqoO71MOqrXbhKLG52dJP6x2jS+j5ZJCTa+KGnIaQxnVdmahttBFPpsnHsLMsrccim/R
	 MOYdPqq7jbyE2tVa/NSPFi+QVlXDjjlrUBuLjJoJpAhHqOKpiXZHVMM8iCB6Nx/wpzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904648;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xg2H2JbSaNt4G+nLKOWCl18uepzGTAp2Ue28h4Ezewo=;
	b=CGmU+8CscytLbZxqvhA/ZOtfHIMRKoW78ue2v1XRAO6Qz81JErmgIXn583y/HLJ0VnE9
	 mps/TxjjZLqEQ0BOXJ92UAk0q4Tj5flUAA31M6rOGDy/MW0q1OCLBVhuTdYFnSG8/fyOF
	 i0KZfHJnE/5t1FP8huf46iw4o4CAGO6zVEclDQHtfv2sEWP9+5Vjj2ugzXzTlmVwJpCH6
	 fFaerjafAEUCutBPDIWwC7T1OXYexEkrH24BiCT63quaTjv4ETEfMIC0XYFlEwHxYYrjF
	 T29DWM+5oXl4TSR/X2qgyDN44+yJ9SSqGnFq4xdVSmFEbBrr0u/8xcVhdFu4ayerASA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCZheR5f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD700606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCZheR5f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4328A1F000C1;
	Thu,  5 Nov 2026 18:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904647;
	bh=Xg2H2JbSaNt4G+nLKOWCl18uepzGTAp2Ue28h4Ezewo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OCZheR5fEydX8GegsAf/Wbjwxh7nD5KwrEXxHD5+kCz5Yl+2GkPBZu0dVuFBo2nE2
	 IcMR6lD9OBPQSXDK5pcjJ3uTgSZPX/c8e/ndzssJ8LYFCfA6Up5BEYfjJy3gvuJGQd
	 XeKP6+UFUzxddE7yBtMLpllJnCpY3XPxS1OoRuRmjRHs/VGDcAMxn3SzqVVXBimQjm
	 d05sBvebvdD2szbftzMY79fCdv8dJSMtDKvIxF0fKVJS2VM43RPCLiG7zkIcRak6Ye
	 7PatMhG/ma1hHL/rZQYY36Zkf4u9wCVx1cPXIqN0Co++Cw/+2WhKXdeUpjJT7IiIRD
	 8ffKBooZ7Fj4w==
Date: Thu, 05 Nov 2026 08:50:46 -1000
Message-ID: <5582fb8a609eb8a2348811ecb6f539a7@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>, Chia-I Wu <olv@google.com>, Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v8 4/6] workqueue: Add support for real-time workers
In-Reply-To: <20261104095225.32654-5-tvrtko.ursulin@igalia.com>
References: <20261104095225.32654-1-tvrtko.ursulin@igalia.com> <20261104095225.32654-5-tvrtko.ursulin@igalia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Applied 1-4 to wq/for-7.5 with the code refilled to avoid unnecessary line
breaks, HIGHPRI_PRIORITY renamed to HIGHPRI_PRIO and RT_PRIORITY renamed to
RT_PRIO.

Thanks.

--
tejun
