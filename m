Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797442;
	b=U72PVlmXtRUj5AyabKRJPpD01MKf0HgrfkU8T8Ei0aUr/8XaFWQBdE2T2TPDo/iOCTHM
	 ORgImjmY3b5n/wUOPpkx6kpIwrSiJGoilt2Gn4ZldH24Kel9vv0HcdEMilCkU1EoCGQah
	 bzJnzZbv588qn6yQSLhCVt7uWEweOQs6zih7TamMTLAkLAmi7zEsP4lqPAnm/YMj/ktg+
	 E30ensB+Kl0vBv8ZA2xxxe1QP+gwSFoTqgBNbq64RtLX1Y+yYIUnRPWMCWLctivc3WEcs
	 iw45rJOULoUhHCtzBtHXFaCGYUr55MNBnD7s4UJoZ9TGmHhD7ZBEmbstLnNuCQjzkoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797442;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=5wqcByMokzUv4fCjSIMdnvQbDxt2gfypxhoyh1IAlY8=;
	b=32pzlr+LfD2kNFzSweOGTBD2P3ojcAwmWy5T0Sq+czSN9QjJFjj6bla7iJoqY4WhfPr6
	 rqLGsmFE/EvtEdoPz5vUOKTxw7gw8T0Uy162zXr1w+Xr+qRCdFkuJ3n+YEyAuoKAqQKS+
	 tZm/DA6KOXYeZ5Zfi15aPK2y0FrS3f4vjqAhNh7QRbUhTSJ+jSezfrFmHu5A+1uEmfKDn
	 uztKbfchRXSkgLoyFrm+6xlU74liTbEJOLR5aQb8HzznmPmmfBY/n2CRI47H8/ULIuqhy
	 LVU3AZGWi+RTkfYdhVQ/WK8SSan3Kea9mcTVYc+VJF+xEpJpPqLNE7tWDmJ4GOzssWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zh9klX8i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63600606A32C;
	Wed,  4 Nov 2026 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zh9klX8i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7221F000C1;
	Wed,  4 Nov 2026 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793797442;
	bh=5wqcByMokzUv4fCjSIMdnvQbDxt2gfypxhoyh1IAlY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zh9klX8ioxgQD51sWSO7xAGVGg6YDvzBghmfEbo5vODnGn/xN6Qm/eSlzbIR2gSIX
	 nVFRNHk1gGgLQGM8rJ3xmxXSAHdViQn4DrpZlKBt0n9V6pq1UkUPZCwyRaZ6Lv0GZ7
	 sSqzoYvshZ/IB+nJloT3UUAtIfTESK/xCVZAcwLA=
Date: Wed, 4 Nov 2026 14:04:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: soc: qcom: pmic_glink_altmode: fix use-after-free on unbind  (no
 cancel_work_sync for port work and enable_work)
Message-ID: <2026110426-upward-straggler-fa66@gregkh>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <5eae64b0.1e583.1a1a6a030a4.Coremail.xuhx@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5eae64b0.1e583.1a1a6a030a4.Coremail.xuhx@hust.edu.cn>

On Wed, Nov 04, 2026 at 08:54:38PM +0800, 徐晗翔 wrote:
>   Please keep me in Cc; I am not subscribed to the lists.

Please just send a patch for this issue as obviously you have a
reproducer and can test that it works or not.

thanks,

greg k-h
