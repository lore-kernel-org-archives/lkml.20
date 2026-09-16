Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F14A7CBC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577636; cv=none; b=q+AmkbEBnqVK0Ml1UG80o8mB+HKWG9noyO2prHu3HuBVEyv69POGymX7mbyaHyBCOVFl0LxxuaY25EHFtuVPNtH2OrNpIXtNNiP+a8s3WNp8oq+iMhEJlKnraPPuxpEManPtKM10eM04ZE93HsxU3hD68VaORefDzhd48Hcw9/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577636; c=relaxed/simple;
	bh=EM7CE+WdCTpAe7xOGaTErjOkfP5tYkgIqeyCvMsIy14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ob+9ClfczwumE49VX6ZhHU+CerzGzAkP1L0M90XkFzuz8MBfKb+vNAAPv0jKrBO8DtHASssWUQ/D5jPeC/F6Fcl3TFPHlmqlAOvvMh8xh0LsgPU+dpd7FQuO7Ly56cUFvOMBU0i3aJ31GRig2O648P+xzLUskUWRcVJg22K4HUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APOYAFfI; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APOYAFfI"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae6f1637so470164eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577625; x=1790182425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qiMEGCD9dITrWSfnCr0MqfmzsfjQT2aA9fOLt9oXWrQ=;
        b=APOYAFfIbWCVrGQuRaTBLCgMSL1JCI7tgh9x8gmAONSADgnCnY12/vJ2wxHvfAcHOW
         39Fj6c3KHR5m2Jcz69T4SqWjX9DQYqJDTr7ot55Zp8XUHGESrq/4xkGK7VnuH3EtDebL
         h55MLPATOrJm4deRVrHgE8HmFAme7AQ6CHOloGdP5khJbuKvGCqymGAjMwn6JvE06ShE
         0mIIbLjn5OcYETtXDd2WxchroRZICEL8jKAScxjUxhasSL1S62YNq92kJeJ1jN69M38Y
         k66ReB/Hy7AfKBWs/CxKyQjJ22T9iO0wWaImNmtIz51UTqkKDhxM7vfIzGwgS4VBhzU2
         051A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577625; x=1790182425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiMEGCD9dITrWSfnCr0MqfmzsfjQT2aA9fOLt9oXWrQ=;
        b=MoMxzAnW2ylwwaRWqDeFzmiu1CJNwNxHZNOT4jKF2TAoWHY764go8TtHFtDiYNEz6B
         YDNc0RMVCuJLRbww+wRAW2jrvJRDxj0V+z4AZGxXGlaScBFOCJFHdyQPZUKR0TJhNZ3N
         caDCz0JSs5U6wxK4cxts0C7TbrcAaUeyX2adKFaIi7wPb+XWGXjUfx27GuGPbQDn6OmB
         asgaQLWDPZM2rrDM2u6CyZmUXek5tQ1c6kqkgrcjGw6b4suR/zQTMJC7ahb00jvSACDs
         IDKC8lveu8NG9MgglrW1eEdOW302WFFl1TBj+dGxC4LpN5G+8mC3e4qZ6bB+kETeho9q
         cqkg==
X-Forwarded-Encrypted: i=1; AKwUvBzxtkSsKxLcFPyeGcBFJ52Ces0itdXUgU90szgByWk17nPVGZtrj6uQRVvkRbVUUM5CG4dBdRkHnvqW1b8=@vger.kernel.org
X-Gm-Message-State: AFuF++mAZVvrPUskpwAnLRZX8acPbqPv7sh22lVukcyOE+kwHAFCbHzm
	nVRJ+Owzq8FNzc1sTfI0DW2ye+GyKwDomzA174kqWHS6cVOl7fXuDkG5
X-Gm-Gg: AYBFou2XQIZ+bRSYhe+t2Gug06e0Hzfmhy+il8YEePOwJ6PDWaics8yqwgtcQjk4KBO
	P3D0d3zIUqvUXUmISWJ4FY2Ftfp8xGc0HhJwkPQMZuCdNs/R2F0z+FwDjvyNTNWxcHCvI/tV4ob
	jiv1Q6mm5cDa28FFry/E52VF/VvIPTTcrImljgRzBOV+zP0HddLf3c0A5W8+Q3xrdUXzopn/ZUR
	/ZA5gnzZKPWfGaCqsZoU090ed05KnSlejAm1yQlSL+uYB8mpecMNiywktwigBeGDyiWJcsqqqL7
	3YF9m9vLOBEYUYMxg35AVHGhbsPOm0LGTy9a4L5LJUEqZYMmFpUw9jQLyLP2PNOjwOQBVnMavLb
	3/F+lYbzKvfAVkqBOn+C6W0mEE1IZLbEd5kuIy8dobVwMvPJpPdtORlDOrhMUMEmol9NPP6SXkW
	Lq3j+5LpYW02Ke233BXnpmTLDs+BPHzUDQ6te2p6Sd6IdijHUQNj19JwDVOKjJVCqS9IZm5HCdK
	2eACzSUzDCmkhNsrWaC
X-Received: by 2002:a05:6820:827:b0:6b7:46e9:96fe with SMTP id 006d021491bc7-6c7d3fe8d67mr3338481eaf.46.1789577625513;
        Wed, 16 Sep 2026 09:53:45 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:5b::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842a786574sm2835261fac.16.2026.09.16.09.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:53:45 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:53:33 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Luigi Leonardi <leonardi@redhat.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] vsock: ignore empty child namespace mode writes
Message-ID: <aqrJjfJHWXJafehx@devvm29614.prn0.facebook.com>
References: <20260915141547.3010692-1-qwe.aldo@gmail.com>
 <20260915173050.3176344-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915173050.3176344-1-qwe.aldo@gmail.com>

On Tue, Sep 15, 2026 at 02:30:50PM -0300, Aldo Ariel Panzardo wrote:
> __vsock_net_mode_string() returns success without updating new_mode when
> the transfer length is zero. Its caller then reads the uninitialized enum
> and may permanently store a stack-derived value in the write-once child
> mode.
> 
> Return before calling __vsock_net_mode_string() when *lenp is zero so
> that the helper is never invoked with nothing to parse and new_mode is
> never read uninitialized. This also prevents an empty write from
> locking the current mode.
> 
> Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luigi Leonardi <leonardi@redhat.com>
> Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> ---
> 
> Changes in v3:
>   - Move the !*lenp early return before __vsock_net_mode_string()
>     instead of after it, as suggested by Stefano Garzarella.
>   - Add missing maintainer CCs per get_maintainer.pl.
>   - Add Luigi's Reviewed-by.
> 
> Changes in v2:
>   - Return early instead of initializing new_mode to the current
>     value, which would silently consume the write-once transition.
> 
>  net/vmw_vsock/af_vsock.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index 622dbd0467..XXXXXXX 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -2879,6 +2879,9 @@ static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
> 
>  	net = container_of(table->data, struct net, vsock.child_ns_mode);
> 
> +	if (!*lenp)
> +		return 0;
> +
>  	ret = __vsock_net_mode_string(table, write, buffer, lenp, ppos,
>  				      vsock_net_child_mode(net), &new_mode);
>  	if (ret)
> 
> --
> 2.43.0

Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
