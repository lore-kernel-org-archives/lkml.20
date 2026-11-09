Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236737;
	b=U3hljQRTH9M0SiipkrUQQ7/y66qcgkUhYnIankCfBXYzolRG6LZJcgM/ylx/ppMhBUB0
	 Oa7qaZ/FVCdhmKU6NjudC+3bXP3q2r+t0bLghXNSxaDDmKldKINsLir78v1lQj7ygZBEV
	 g0NAXb4euIo3s7S671llGQKKKNnnWDtjnYUO8Rk9Q09hE+SXtvjzrmI8TNY0Ly6Eg+VX1
	 ZSFYW5CH9ry30YaaI2N6N5GCYmfRI8O7+b3gtPWu3hEh+oOq2KlYigNDIbp0P03f4KTow
	 iBd9qjDueXVm2otekjZRcxdp8VEfpqiR4FWn3uMvnC58eI2beds6iuUQuLkbpFIwVfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bm4n8PR4Zol2r2UflU7BTBKbLsaJuu5hjO5epKs7b7I=;
	b=kUu/eiR3MqmN4UfV8akciMSviol1Dh9r5dZl1/cv0/zPqsGYb5qka6WrUQmwmgoBhYOp
	 o96y9F5/+VPNCPPph3f7MDU7ZemdSkUmin8JTGHxn7FpHnHy7FxPlGOxO6MIkDZPmnQFk
	 cBGYxxnf08p2wD864ZYcvZFmjlUjJ8+sxOoBGoozM++Pf+z7q6QG9j5GJEK5j3wAzPtiX
	 g96XkAE4thT7urD7kD7lqKmDWNnTW14pzGsRed6ZcHR4+0RyWcjsiA031RfyiUfOuUqhP
	 CXqJpquAk8SNgyCGCaIOMGEK8k1+1QgmjfPpV88GT7CxBIwbcJ6hfYe/XGXRmIeon3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="yN8/eHBt";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02454606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02454606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yN8/eHBt
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso546348a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794236735; x=1794841535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bm4n8PR4Zol2r2UflU7BTBKbLsaJuu5hjO5epKs7b7I=;
        b=yN8/eHBtFUZSIk36y9X8io9EEFQsVcyLgUpXMZ2OA5iZkku/XLPHO5HhSUcwUSye+U
         zPMz2QbINcFoWF2T0uSx2o1gj3h77oP9a0nDzhwxC/X6VwCBPPMSa+tQSOkSUbaTm6XK
         fxu2r0F5Ne7Z6lVM8K+ykH5J9MEoLzEUiTstRj7LH86Kgo69L2ZzXcPXH2miPwqHUOFS
         8sJjON2PmfHu1MFlXiXzWfQc/8gJL48vPozdUfO9sLtjBsGWQkxWBgs8PMsJIviUznMX
         6J5fPn/KG8p06ohHuqcBrmQgWdTFAsrxLtmfN4pQWNRanpsaMGMMBjpbwVMHGZ7GIliH
         53gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236735; x=1794841535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bm4n8PR4Zol2r2UflU7BTBKbLsaJuu5hjO5epKs7b7I=;
        b=ZiPK2tSQ+Ow6W8dlt85+YdEwGCzWqKmnG9+bxdR7NcWcdktCj2t/5zdl5vCzisChAq
         IapWF7aCiPqAjePVA7IDycNXbZlcRApkUaSOEJw7SR2Fb89vaZ+VCKWiGoQKgRdZGt/R
         NPe2reftNik9rPnO99tZ9AchqonFukVTdLrzvO2HpZLgIOiRnZAQbAFRPoEMndgHMRjN
         2Lu48vz9L8kfOGxTgflDDlPhLfbIJo4BarBLEvb+ebr+TuZ4mN8LiZUIv2MKg2JDzdWD
         tl5mVPHUudAOH6u7Qqlj10WlyPDOjRCID4e7/IvPpkTQo+X9/zpQz73hB1i0ATbsuVv5
         rT4Q==
X-Forwarded-Encrypted: i=1; AL+hErGvOPKH40ISNRYKbIr7+89AHxDco1rZkifWPPg5oVQiDPACwxjOJ0RZs6H+3j5XoOAysVfIqMnAV5eTcvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x3a+Ymz2fpx5RwBf85V/wjQqM6iRp0gExDlA2rRT9t5yBEqhv
	IHMVr3H7dmOHzAQE5fsvgyZJ3B0htbFZ8yhogqfDBWpRrydArJuNdXwRTH55eHCYTGM=
X-Gm-Gg: AYBFou3Fb6QhX9F7d0Z6PxhPBWO/CXQ7O8R4MqGcJw7s3+DheaztGT3FZK+7zXvxHKp
	eD3xkK0hs1m2p7v7YMfiNLSQW5J+/CL/YLVI76Rt0NbPmdvVludOeuPxGK0nybdknzQS25ztFSF
	xCNOwBMxyyFRjvNuUL1ytbE363Siedpx21ABTMFVL8JbzTPNmaGtUs3SzSsnRqq5774O3g1uHQr
	HUhz0VPSplVNb3oKqgA59cc+8l2NuggsKXhM8cxOOo9fJRCZM8+i+NFgP8F3IW0eb+UxB+JvDWc
	7wJclRnIuJk4o/+kYjw4/2zHwD4BDG2bL5FbLaqltzE/GMvHsrtRlyWuDv52P8D1XekfygxbiTL
	1G4LBLeKd6DJcRPD4M0CrIADz1rZ77C0PKnG7fu4Ag4sCBiT8+LZlkdiILoQoqm1dGFWYFxyuLS
	ypv5Pj7piclw76L/loGTWtTF0r/iTCeFy+SAIRi44DHPDxJDq5GOyiPe+ISx2rnm6Ip5A85gY8m
	UDagqrOGTznUniaB5Bl/QV12xdd87/R7kPvyHUG171ReZ9PbS0Mg31bqp6udnxYlnbQgh13iT9Y
	+LA8R02IcvYlzKIJypjhMPNmuBGeqA==
X-Received: by 2002:a17:90b:4a09:b0:3b0:78c8:d56e with SMTP id 98e67ed59e1d1-3b12d441cbdmr4126098a91.27.1794236735128;
        Mon, 09 Nov 2026 07:05:35 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm11249661a91.6.2026.11.09.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:05:34 -0800 (PST)
Date: Mon, 9 Nov 2026 09:05:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: virtio: Reject a message shorter than its
 header
Message-ID: <avHhPI5btZcuhKsZ@p14s>
References: <20261106232322.1093165-1-lian@is.s.u-tokyo.ac.jp>
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
Content-Disposition: inline
In-Reply-To: <20261106232322.1093165-1-lian@is.s.u-tokyo.ac.jp>

On Sat, Nov 07, 2026 at 08:23:22AM +0900, Lianjie Wang wrote:
> rpmsg_recv_single() checks the msg_len field of a message header against
> the used length with an unsigned subtraction, so every msg_len passes
> the check with a used length shorter than the header. The rx callback of
> the destination endpoint can receive a message of up to 65535 bytes,
> longer than the default receive buffer of 512 bytes, so rpmsg_char can
> copy the whole message into an skb and read past the buffer:
> 
>   BUG: KASAN: slab-out-of-bounds in rpmsg_ept_cb+0x4d/0xb0
>   Read of size 65535 at addr ffff888002484010 by task rpmsg_echo/140
>   Call Trace:
>    rpmsg_ept_cb+0x4d/0xb0
>    rpmsg_recv_done+0x29f/0x840
>    vring_interrupt+0x32a/0x540
>    vp_interrupt+0x146/0x180
> 
> Compare the sum of the header size and msg_len with the used length, so
> no subtraction wraps.
> 
> This patch is assisted by Claude Opus 5.5.
> 
> Fixes: 9648224e564a ("rpmsg: validate incoming message length before propagating")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
> ---
> v2:
> - Leave the check after the dynamic_hex_dump statement.
> v1: https://lore.kernel.org/all/20261102221504.175116-1-lian@is.s.u-tokyo.ac.jp/
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 23ff6c8b7a20b..3d58bb19e9297 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -676,7 +676,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	 * the reported payload length.
>  	 */
>  	if (len > vrp->rx_buf_size ||
> -	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
> +	    sizeof(struct rpmsg_hdr) + msg_len > len) {

Applied.

Thanks,
Mathieu

>  		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>  		return -EINVAL;
>  	}
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.56.0
> 
