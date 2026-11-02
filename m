Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627366;
	b=E4lvdXcNqp8l3L+1fdwho7IFbj+SNWybHFco1N4310nzxwpseVYgCZjJwES3zaEeuWXm
	 vjmAPbnQ2twv9KbNxcPmuW6rW6WAoQIcC2ii4XagdZ/7GejIXMc/1vj2lgEw+nhG6+4ZZ
	 Iy4Wp6Umrwu8z4kFuNPSF18Xxw9+Yl2j50/N5QqHier/oFpoSSkyzPz+wyPKV2Rwqxr+4
	 Ood7B8hgpz/qYTnJGn7I3v8LALCpEXZh8FtATNUmiV87s+MVckjSwQrKcq7+4rmqCVEoL
	 8s7Gb5vcOTJgJLW/z5X9wWUhhpvx4wk2UzOX38HuJGVohHguGsyS1rk739lxQrIv/Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627366;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZoNcFizH5dKOp0YIVYbtqblKUqnZk6xJRXp5BztCyQ0=;
	b=u3UkqlrBP8NUCznt0oOlKQrMWAMzLrHcjPAh92GC59LGobX1MgOSmHhy1Wmc0U+KdYe/
	 RoO5aKXMgbs3XNX4lZ0c1gBynfz1h/RL+zN22NxdlXYMmxu+4Zh9iVYN0s1aNumt+hv/h
	 wYESF1TsTOzhFlf0SF+hEMVr0SixG0WA2/BzMZ4YMq/pELpcXPh18xAdn2I42b2PLAWk0
	 V+AR+1o52rpMPW9yuCymOLQim+wdy+UGU0/680ZK66zsIOzXXEY1a7ELuPhSpaMQ62lvt
	 Vbg7+f7SC+aBPyOFKayy+di4AWGHCCP5nGP3FECiC7dS7qaQzIvDms4kSvFx/k2MnsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9PDVmLq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4DCA4606A327;
	Mon,  2 Nov 2026 13:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9PDVmLq
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 365901F00A16;
	Mon,  2 Nov 2026 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627366;
	bh=ZoNcFizH5dKOp0YIVYbtqblKUqnZk6xJRXp5BztCyQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G9PDVmLqB9i0K8RsTI7IF0b2yGRnhqx1N56d71vGUv58n/Gsth2uG711Y3+yAIBTm
	 Fn9yho5o/NpNT3Ns1zg6Axl/NVnih2WvH3wGhlxvAJo31A1cSecBI2LwXIqBEUh48d
	 BH/soBWS/TAlD6fprTjb9j8TWKHHeYxXzjU7yXWFGqkts9FYLC1u7L+1i1d/a5XaI5
	 S4ZejZ4PDzX19AaFCRt8rYeUsMW/sG5XDB8D7wvS6YwYm7F9Y37RdyfS0YXK6GHAvD
	 VN7/yFL5n/anjrzjNfVczdUXaetzP8w0JIm1QMwXFm6LAvc36xTfY42gH5RDThwPo1
	 2wmRqrONPJCBg==
Date: Mon, 2 Nov 2026 14:49:22 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
Message-ID: <q67ybbvm5emd5dhiwqso35ql3ekkt2kepfisy5mdo3haw37bxw@h5unxgcpcjfz>
References: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>

On Sat, Oct 31, 2026 at 04:23:18PM +0800, Shawn Guo wrote:
> Derive the backend channel count of TDM DAIs from the cpu DAI TDM
> slot mask in the DT, using the same DAI ID ranges and tx/rx mask
> selection as q6tdm_set_tdm_slot(), so the channel count always matches
> the number of slots programmed into the DSP. Each board then gets the
> channel count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on
> RIDE. Keep the default of two when the link has no TDM slot
> description, and fail the fixup on an invalid one.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
 
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
