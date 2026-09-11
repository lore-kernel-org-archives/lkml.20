Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857A63EC2E3;
	Fri, 11 Sep 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123495; cv=none; b=sKPrpnEvyoqppgLF0AsJF1SgE8dyAoIVYNBYaURHwY2ZDvtaSs/vGP3Tj73xCupUbL6LA05remrM76KYTEysW4/XFGTmOzJXS+0H4FmXA7M3TKt3VpsslbV4RSg6lO6NfGinPrHVZ7bZ0yIWMgezl/nmy87rQuNxX58qqO9CdU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123495; c=relaxed/simple;
	bh=sBl7unFdQaDQe34bxkdWGY36+h6A/0xyc3GNRSRhcpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nj1QNM1NfBUui1u61nskv3nJd4v0XzLurG42Dw/1+pjH9dcED1euLpNvBwozfXyHKPdffsGW/Xk9qvJZw+CCAVTBg31dBqh4qLg7xtQ8Tr3H2ot2HPwkByQfi8MBp8KPb0vDgE2jtpXjT1XRz9j91uMVQC0lBIlzuoU83qEDp04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cY1sQBIL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cY1sQBIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE69C1F000FF;
	Fri, 11 Sep 2026 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789123494;
	bh=diuK0ZP38Rx8cZSyKuN6MESmWCfs5CGaCBGSDXyaI38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cY1sQBILgEdxgearVStLHjHCydE1WTIQ7zZwTKinoMii4duugpKor2YZo5A7OKYBR
	 Pq3bvZRLs/BW4Y6LN7/ZeeGlZFt4d1w7SE50Zk3aHJk4DQJJcqNqxncM7JA9wOS2Gm
	 jfnHjsw+32WPRie+JRp6x1O0oaQ58YlMATWNDc1K/SFz1/6Whob4CBia/qdUh1kRdA
	 ysjROH12rqlFa6rqQe59aadW0boReV6eYd6yKKRztDfkG+CebUtFbWruu/Vm/P3kNN
	 IDm8rMThjy6NVeCpFY7GOzd6/ayEV/Lrv9Dski1WXhDg6tWfpXszDN5OoKSKOYCH9Z
	 OkX1penzgGvyQ==
Date: Fri, 11 Sep 2026 12:44:46 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Daniel J Blueman <daniel@quora.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
Message-ID: <hcr4woicsnz3pbhzlguuwjlego7yli3znhjmsx4cdz66xa74zd@wjtle2yslc4b>
References: <20260909055846.16539-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909055846.16539-1-daniel@quora.org>

On Wed, Sep 09, 2026 at 01:58:44PM +0800, Daniel J Blueman wrote:
> Since the MHI HELLO exchange was relocated, it is sent only at device
> registration. During a suspend-resume cycle, the firmware in WiFi
> cards such as WCN7850 indefinitely waits for another HELLO,
> triggering:
> 
>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
> 
> Fix this by triggering the handshake from resume_early in the MHI
> transport.
> 
> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
> suspend-resume cycles.
> 
> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>  net/qrtr/mhi.c     | 10 +++++++++-
>  net/qrtr/qrtr.h    |  2 ++
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index 78347c937af7..2ffcfc2fdb4a 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>  	qrtr_port_put(ctrl);
>  }
>  
> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */

Use proper kernel-doc please.

Rest LGTM, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
