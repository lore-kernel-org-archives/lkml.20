Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77043CE489
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814491; cv=none; b=FCWRyDttU5xOJnaptlZhpKy23/XblTWUUpfONP14ZsL30aMwknScdiiwVb95WUBObRsoHWtAk5RbPNcbraF559zmNZXdkFTvO65+vonHkp+WPvEVi0y6TTb50jd2YQ25ObyDdBZYvdjr/sbvL81oMzQx8Xl+LgEemydMSaTPIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814491; c=relaxed/simple;
	bh=cum+47r16b68MtM6VnR2vZxJVMDw9iNibIPc0nbZVi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyTfrijPyrGYzRL/p2n7uCxr8WsOuzWVOG0YWWQtt9Cws0Ym1bj8AWAiADL9f+hydGXBs/GthYFFrXNDnFWkDaBcmZI16ZfR0v69kBnqyWuK40K3MDSeY1buss+6780Ra/s7HkPdnlpHguZO+prn0H1gq6UI/E7hl3yqtp+PV2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRIpg4+c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRIpg4+c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63AC1F00A3A;
	Mon,  7 Sep 2026 20:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788814490;
	bh=xd5tQKQxHFRGotFcOXdpLOZw0W1C2jHEVuOQdyASEiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dRIpg4+cjz/LJPp8MxUEYl3ZCRk1kb+/hn7o8I3Rc1wGT/1J2IDbk56aw2K+lcBac
	 yafINQoKso2O6Q/7xNS4cbMVeKmgKpR3qfHSPYrxL/4/+TsLwDUiw3lU5lZdf+FQSZ
	 TKZnGZDqoaY9J8/k/mYa9qHtG71FFF0iDyH9O9gH0LKfTVdRET2SUkCn5mhuzKDJ6K
	 0SnAmUCtjFC/VxPqlUrqMpAH8Znz1bVd4yCuA9BnM2FyQy0loCHmm+j48ko7R2MRTw
	 LMnx/hVUyDicyrMmJODphzbjIwSoN8rGjkzUGA4CuCM74CRBxnXyeOij3pfIqHFlT7
	 Lsd0SKDWI2ilg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] soc: fsl: qe: Fix sparse warnings in GPIO
Date: Mon,  7 Sep 2026 22:54:35 +0200
Message-ID: <178881446326.32908.2707847448430333820.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6a84b38e766729676b375c93bf54c67ea455288d.1786080840.git.chleroy@kernel.org>
References: <6a84b38e766729676b375c93bf54c67ea455288d.1786080840.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=2343; i=chleroy@kernel.org; h=from:subject:message-id; bh=6z7FgiQsA83jfG1X90ruIg/3wydjhrS28CflV2+zQjk=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTNV+n3Z41iYHt67/Gh932K3ulPhB07Lqy7cM195tIEM U3/3+8udpSyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJvF7G8FcuXuXU+Ve+axhf 63c8L41hj42PT376i7mr7Z+DbHfVFS9GhinVXzsvdkidUdg9aVGx7K4Sjalf53MeLXHd5mFqEj3 /Nj8A
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Fri, 07 Aug 2026 07:35:52 +0200, Christophe Leroy (CS GROUP) wrote:
> A C=2 build on mpc83xx_defconfig provides following warnings:
> 
>   drivers/soc/fsl/qe/gpio.c:44:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:44:34:    expected restricted __be32 [usertype] cpdata
>   drivers/soc/fsl/qe/gpio.c:44:34:    got unsigned int [usertype] cpdata
>   drivers/soc/fsl/qe/gpio.c:45:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:45:34:    expected restricted __be32 [usertype] cpdir1
>   drivers/soc/fsl/qe/gpio.c:45:34:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:46:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:46:34:    expected restricted __be32 [usertype] cpdir2
>   drivers/soc/fsl/qe/gpio.c:46:34:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:47:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:47:34:    expected restricted __be32 [usertype] cppar1
>   drivers/soc/fsl/qe/gpio.c:47:34:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:48:34: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:48:34:    expected restricted __be32 [usertype] cppar2
>   drivers/soc/fsl/qe/gpio.c:48:34:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:49:33: warning: incorrect type in assignment (different base types)
>   drivers/soc/fsl/qe/gpio.c:49:33:    expected restricted __be32 [usertype] cpodr
>   drivers/soc/fsl/qe/gpio.c:49:33:    got unsigned int
>   drivers/soc/fsl/qe/gpio.c:297:17: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:299:17: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:302:17: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:304:17: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:308:18: warning: restricted __be32 degrades to integer
>   drivers/soc/fsl/qe/gpio.c:314:9: warning: restricted __be32 degrades to integer
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qe: Fix sparse warnings in GPIO
      commit: 5af2ccc8ec749d98d3d0bed4b9df25781d7f2d46

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
