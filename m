Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279E03793DC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458409; cv=none; b=VT/LLDZZCL72ZEo468fbdqTPq3t8pcgW++Q14GATWL5PtQdWcqLzP8k8X2pp1qgZcL5iokVT6S7x/58VkhuXtDN3aExsM9wpUjQalmqtQPgDn8weKF49RfK74wOyr604hQC12Sclzhkcf996O9uM0MSYOQKbW0pfPz1PbOHnWbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458409; c=relaxed/simple;
	bh=nnwo2QXya9ol8RgKGeByWYeh7ZQyYF+wLDl4brAFLjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdreE5u77WNGiDuHl5hdy6Lkf0Kp8kAMHt7Zj5ZVTNlchZaH5mbgpMRdStX7LbRyv1avijnGtfWuVylAPvShBmwfFP/AGrga1hgCxJbNrbE5M1G8pMRav2rB+b6+TjtAE8TuK/ZTaAMNhcNNgMGVXCdI8W1TVKoWm1ysDeC96cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GVoAlPes; arc=none smtp.client-ip=95.215.58.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GVoAlPes"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nnwo2QXya9ol8RgKGeByWYeh7ZQyYF+wLDl4brAFLjg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458406; v=1; x=1792063206;
 b=GVoAlPesE82yjLPqg+hKptpcIu1e2ezhYwNydvEo1771JLJU2oELcbJykBvf1gX6bbh/zgvx
 Aksf7HbuMzbpkCe1f6Z7gtyR+mPQwPFN3kb1lUsbuhCpxQAVQ8MHbdboxBhFCSwaGDWP4mbBSck
 rJJQTH686Coj5Qlzhezto5eg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aee76b88c0b72ed7;
	Thu, 08 Oct 2026 11:20:05 +0000
X-Mizu-Trace-ID: aee76b88c0b72ed7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba40832934so5756e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:20:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwX5U3UW2pNW6O2tJ9kT6+66WWZCqShkbmx04TIgZqO5eCxAb6tkX6vDVbq6CdJrl/b7BvhqswcjDIM68g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk0JWrOutmUyU3CZt3nD/eJt77D53Rm4vFvBu5+8Ui5TQlaoPu
	ybZFcSCUGYhBXwgOkawovGfJlVdKT3wkzbkSmbn0AO9+Ge2mQjq+/TbZyPZl3/DG8J7OE2Bjmb0
	h4hVDO5ivgHYKMGPMysir8HNY5i+D5BMtJIjtp1wd
X-Received: by 2002:a05:6512:3d8a:b0:5ba:3797:2359 with SMTP id
 2adb3069b0e04-5bcd3d9881cmr122128e87.2.1791458402506; Thu, 08 Oct 2026
 04:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com> <20261007150255.1648849-3-vdonnefort@google.com>
In-Reply-To: <20261007150255.1648849-3-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:19:25 +0200
X-Gmail-Original-Message-ID: <CA+EHjTz3kBt+XXS-MS_=nkgTQW2dXq9N7aQaeiJMmwg6aSebjA@mail.gmail.com>
X-Gm-Features: AclHuK-2zoYWYiRP6KLr34LKbmiuJrlwhSwx-VfiG1DkwM_aMfNpTkUp_Nx-VSc
Message-ID: <CA+EHjTz3kBt+XXS-MS_=nkgTQW2dXq9N7aQaeiJMmwg6aSebjA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drivers/virt: pkvm: Make pkvm_granule __ro_after_init
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Wed, 07 Oct 2026 16:02:52 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
> pkvm_granule is only written once during init in
> pkvm_init_hyp_services(). Mark it as __ro_after_init.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
