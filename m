Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A440154B1BF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992295; cv=none; b=C3Om5Hx9jUsRj/nl+rDR5mHIy6bVMNHaEBWHQTSycQTUnFUG14LFDfRFRi2loLR3E56QWBy4lfFhZtVky5iikKVrl3nUGz+RBLI5+XKAAdJWiBTgtUaw6D5pt+LGCNaxl3kghLtT8J3c0aI26uSrbr3T6UFTlhHm1OB1/1HtZ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992295; c=relaxed/simple;
	bh=PcMa6EAsrr3jvly/hU2WyQS01pilTlv/QvW8t2Acdms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frXT+tRs+LNYHp3+Pteb6FaUfZ+tAWekKA2kXrVcjMviko7E33VSozgFT0CV6xb/KP2cJD+ieYaN4UX2hD3ZpKwW/5WT2uz6IWMfpIFloLRHqkOMQFApbDANzdq6UsQVIOwiaWor7wWYLWEkmOd4wvvrMi+1+SOBl9R2Ag/ajiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wq48epxi; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wq48epxi"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e934449bb0so7776715ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791992293; x=1792597093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=;
        b=Wq48epxiQT4UxSJREDl0wKo2HFsiSSQDcXxgotDatMZbx4UxjtsEzWJLwLXfsBjI1e
         0WxTGjy8NYU8mLcLsNZOzO7Os7YsS9PU/IBqbpDjKshUaWFOtoE029x+gTFQEdrb0uaX
         d03HjBbzdEYeHYeDqUJvUs4r9By7wALQNQLw9T4yWIh77e10uyZkeeZ3wbvyLwafp0jP
         uSeFhHCQG0/GZFhGM0zl9iuBYjaF78nxqiHMS7d4EV/rab46D79mm2BXduF8hJ3xQmCV
         Pv+hhQJ3dc3cZubO8fwqQI2T5QrEHmwtIPmsyYfcwVYhXmYONP4qkh1kwjMoWSIomvRH
         j/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992293; x=1792597093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=;
        b=JYyZNKUxH7JdHSWXiXUyaEsuQUjeulacynfMjRV3p3fYJt1eNW6PW3cnieA3KXa31u
         Ko9qdLB9rWu7dZm551GYkws4dIxvtmcd7I4mRUU79iEvYQG5nEBK8nCUIkHkKI0xpYdR
         DowKCt29bn4ovQMhY3YuDg+RpGaPtP3j5B+IWMZSib5PQ4Z6MoieLkYDERmgn8aGJ01M
         3hDP+LYdKsVYNpnF/5EnD6zUf2MF27sDNvlr8I/1pvRZ4me37BBhmMVhx6dpkVhA2Wqw
         26HfVXEsPbmj6vH4kxalQhj+tWVg/IyB31aAXsY466H/rlDNX/hsI5SZ3da0ZdME4bSw
         CU5w==
X-Forwarded-Encrypted: i=1; AKwUvBx1K7ExudYajYDmB6y2c0tEnbEAozyzAvZyW6eOvJ+B4pP5MvKneaY3Yj8alBfWGNqF7yGHT/mQntt709s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvVSWsWo0m8lIIyCfC3A40eFMleXlQ/3TokKJONJ90gRmstM0w
	vRvUpQ79ct15selOR1RY1i6AMvz7H3Ze3Cv+eDsEw3ph8dhsIDBI71YRNFR3Jv0gPhcTKcne+ag
	uxMbb
X-Gm-Gg: AYBFou3HG9eTRTKTlQudsjKMykztDxYXgGaeqMwt8CoTa36TnENi/hdBGqbDB7XZgeW
	2mQl9zMfO1bbJyd7mQ5AN+0P6OH/P4yPDK4zPZs10s90HOymeTsQRxVeJyiE8cBrm5ivr+5Fc7B
	879aa+nw8IPoGsKEjcsT/0g1F5jR4m4QeBhP8t+7Irga4RTLroqUSkSlDXpoVI6OXlBpBy5SQnL
	q7AuVx8LKfi06VcJDa+eF7JkhCODh5w3oWv1dmydrWA32BZCBNmMlr+4+s+s5wspGGhvZJC0xdW
	HBwq42yEbg4xsMh2VLNsA/W16FIVoE38YESSReY3I7Hu3C+TwBVskgqpdFzwld50MzzymnY7mIf
	kNruR5IxQtVtwhErUxi6iewVILKuHAP3ZvTGiJHXpRZsV/Rv3TtV996m0M5f2uM9fgvfEtdOpFF
	8z11F7Ku0nkKVkI6xCmMBilXf9E0ED6Ku36p6ocwhkBG9kM1ktSIGwVujtePKWq6/oqJ62VeN6h
	6iQ+3Cyo4Ew
X-Received: by 2002:a17:902:74cc:b0:2e9:cb4:b345 with SMTP id d9443c01a7336-2e90cb4b71dmr35035725ad.55.1791992292750;
        Wed, 14 Oct 2026 08:38:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d009:9564:b54e:1fa2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16casm73740635ad.40.2026.10.14.08.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:38:12 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:38:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pi-Hsun Shih <pihsun@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: mtk: release channel OF node on device teardown
Message-ID: <as-h4Xg2KTvI7hiw@p14s>
References: <20261013074744.942560-1-thnkslprpt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013074744.942560-1-thnkslprpt@gmail.com>

On Tue, Oct 13, 2026 at 10:47:44AM +0300, Avi Weiss wrote:
> mtk_rpmsg_match_device_subnode() returns a referenced OF child
> node, which is stored in rpdev->dev.of_node.
> 
> mtk_rpmsg_release_device() later frees the containing allocation
> without dropping that ref.
> 
> Release the OF node when the RPMsg device is destroyed.
> 
> Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/rpmsg/mtk_rpmsg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 1b670ed54cfa2..430a9b2aa7bb9 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -168,6 +168,7 @@ static void mtk_rpmsg_release_device(struct device *dev)
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct mtk_rpmsg_device *mdev = to_mtk_rpmsg_device(rpdev);
>  
> +	of_node_put(dev->of_node);
>  	kfree(mdev);
>  }

Applied.

Thanks,
Mathieu

>  
> 
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> -- 
> 2.43.0
> 
