Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727618;
	b=jhvbG39lPdcjdu+G1SnmM2qC3tY/2X0Zxz7R5AdhWuQ7M9T10CgS/iyGW+rxx7c9T1rS
	 3bcoCQCyNO33Yau28SWtQnNiVGS1Bw+4g0wO8nqacy/XzRinMoTggVCHQbzOz1wAJ72Ow
	 uYYSiaSCr1SrRkWeGtfLXRfc0Jh8kMNauE6CKEg6+6Ypf9VBwEJMifjC878yrVssImw13
	 ORfMh66Dhu8e+lOQjGTsFfB599kQh+Eq3PGchO6oGfp2yRGKSxnNzLKBQezCI+WA2BRG7
	 nbASsjSXjqQtHYfLuUmavlITUwBtymBhRfnNn6gmPD+shT0C3gl8Dfz0N5vYKpzOVjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727618;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bglu3u7en283y3XVSrlLm6xOphhUHwmHGXBU+AfaEn8=;
	b=EgFio9vuIMheJ3dwGiXzTZx4MMCerXMHfX5Xf8A3zP3Oesum572Vx+5Zk9+bBOiSa+zc
	 mfmSAqf1Rrn3bFOfhXKSBn2iMDsMM/7SXlAnXWyPL6P5rcVJ6rMd5CO1nF/rhJ7EZYfZA
	 H0lZAgNX+HDVcNTuOcLpzNM9dG5QlPMB55t5+fE8u5OEJNhsRDxar5jSY77LBPfPyi+vM
	 rx32TRiuYcUt8aUOR236sRiKa1jRsz6ywjqVQSLVmbr4tZwZNvROZHXCsZqRwyFDpDgya
	 VHmJBeTkgsrhxv20byuI2BuEQPyldZ8CrDpvowzdImin8uk3MgKOwxlSD9KzjS7XBNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M62yPZcP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE1F606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M62yPZcP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23571F00A18;
	Tue,  3 Nov 2026 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793727618;
	bh=bglu3u7en283y3XVSrlLm6xOphhUHwmHGXBU+AfaEn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M62yPZcPFnRGyHQH5pb9F8GAecetpIbkhYIyEhi6RbaEGPDqQ/6UVN4Y8PDDbd8Kg
	 xj9h9mxJN32Jj+eN/FxD76ZB8zwpHYphXnprBZcApdX/KLvuIcUkzNVwaBTij8f8g8
	 R3aJNNuTTJX402tq20LbadATKTah/INAS367wlTqLuonj+bCzx3E2pYeClE6GemRLJ
	 qalmWAHDfnONuY3Y0Lap61xLnPkf1PhRJ3CGOhy5SUSej+66Ym5jRmyqYR+RP7YFl+
	 1Cn2F/KcYDnW9067C9/zW/YqvfLnvVwFMd4L8io5xdcAPTSFmqsCKbVux7uWB6P0VB
	 Nhcs9TEzl3g9g==
Date: Tue, 03 Nov 2026 07:40:17 -1000
Message-ID: <8f882fa5afd3d5504f01a6bb026b1554@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>, Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>, Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>, Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v7 2/4] workqueue: Separate sysfs mutable vs immutable wq attribute sanitizing
In-Reply-To: <ab160c52-1645-4ec9-9ea2-5b8bc36d9284@igalia.com>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com> <20261022093848.5727-3-tvrtko.ursulin@igalia.com> <91711e517792f2e607258d75b633898e@kernel.org> <ab160c52-1645-4ec9-9ea2-5b8bc36d9284@igalia.com>
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

Hello, Tvrtko.

On Mon, Nov 02, 2026 at 06:01:10PM +0000, Tvrtko Ursulin wrote:
> Would these comments work:

Yes, those work.

Thanks.

--
tejun
