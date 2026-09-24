Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA534749D8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248385; cv=none; b=Jvl/56U7lYfDkYSsDJfAGY0xkF/sRVLUIsu1Ksjv4/nRYO8OFjzG6qYdAxrKyy3VeEttvIZbgg3WLTt3nG473FCgUColp0d8zu3fAo3W4g8kMzODTIfO4YQ6PeF79FUatLje4kZEemXEwRDnDl+THEmZZBAEzGkfLh9daBbx4nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248385; c=relaxed/simple;
	bh=NqIuQ4YWrHMEt+JOeSh5y6YMSISYq9XBflrASMSrEaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XywK/aiI6r9aPWJ1N9ViwU7mZYoK5YmszA2LzGE1spSe8nHrcd8j0Kw+1I3d0k4D7bvqjJdC9IsO4t0Fg70X/syHtF6syBXTL/lkfWgphOf4qZjsXsydHQhcHZVVKO1dkzXgQVSam3PW9t+OPk9596DBaVYVRHK1l74Tx3N/C7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VetLI3IZ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VetLI3IZ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1348765a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248383; x=1790853183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xajPQk8GjdXK5kaUdC9KQJ19YcliIXFOaF4kzScKofU=;
        b=VetLI3IZ+yBOGXsBmOpn7kZajcrhs+usBl5BRtrvBBXz/Xav/zV2sSbwBKXLswWsk9
         sHShrRM2dQFjWFk+x/2QnMRbUhMdQlI3rn7n53xQBl2ThEwYb9OjUoV4e2ZQSuLcDbQY
         0+ytgRQcZsASrkArcwbTpK5r/2L8gIZYk3BMeGZNVuKhZW1DQvgdutifzP2aQSIooId5
         6A41r46Gd8GryrRRQJ3uYPbiuDJqV3ZQHeJlT6rEAQAZTyULgyjvUowiOq0iw5NqOWOc
         VLObAWYPKw4zwGnnpX19dIopUk5yn5Fh6DHkGT2g8IX6QbdSw5AV65jPzO+4TcIsj6JK
         aDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248383; x=1790853183;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xajPQk8GjdXK5kaUdC9KQJ19YcliIXFOaF4kzScKofU=;
        b=jxTyvt2SzqjYGraohnWsLuZQv361Mh4h2/cWOaGFXJWAaq9cX9uL446+DHLjtwOkmZ
         xp0rQARQ7toCTV2MuAJL/VhrrCNyD8Cowl5SuzvDXL35fHPI20Bb/HVpQXq12YTtzBvW
         w0wJEYgoSLEmP0BCpbT4gtY9ddYH5QJSx+2LjHx2T86Se49eQkzRj7pq0JSvU7nc8J7o
         D1PH9xyc2HwQRKyKMjzzsfario6wgqtjBxr7+UFY4KYzq2eTVANCqVkGlgTsqfdgbTDx
         3mehTfuGZEupEr0RpBD75DvbiLUk5P6rvA4h9F3WNSWjelV4gsXZrx9N/7n5jb7YDAmK
         lgzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0JdRge0gKU3KQOoDKu481bcoeL+D9/79/bT4zA0GT4bxugBt+CcNaf88mOE8c/oaCqIyx27rEZoWv+F8=@vger.kernel.org
X-Gm-Message-State: AFuF++mljq71Zptt7trAzLc8aJKC/u7Z8f73YelGg9q0ImJGPSXo8hFe
	ELNLCcooPsVcPmKivuaxN8V7pZ0YqfbRFgPb0WG+AcE5pp534F+MUhu+
X-Gm-Gg: AYBFou3EzuuD6CON1q+UhYkknMxWl5VVHse10D9K02B+N/xCg0kX7LwPRnZlengsL+D
	UP0HLC+XgsqYPipZhWOLrM/mO1z2LjkqqxUn5U8S0OPkzS3dvUSHTGRwRQnbhYdsS005raIzs2u
	Kw+fu+gbne7uJ8DplRtFaj4eCzMCTv3YkELLCAAo/GZjl8/vWdKda1EGrmDmfm8ywMP6OgSchv2
	gSRO+Jxwx/3c1ipdlsBwZse6I6y5Djo8EEIMEvV4iheMNlM5SyYK+wz81MCjCCZI6mgzb3kMNHR
	pWyR31OqTEKWHQ/hNf2Mvtmym/R/VgBqwBgjwng8d4PI3ssWd7Anh9/6KP7FDpZI/cwyD/HU7D5
	DzlRP6VM9x5rr2PCMNlc8z8o889O0LeWTQu+6FdRxQczKfyxjLateRSx5QlhpVYphhFeVf7OXJV
	oh648DddC9urnrMIlSuDxvq9CdrYjocwncLXIdUiUagMFRVdDte3GgIi2on9lJqT3sDTYv5E5Bg
	bA/w5FFs65ZzB2eGdHQ7lxdwyWXbxeGQQ==
X-Received: by 2002:a17:90b:314e:b0:39e:5ade:f9de with SMTP id 98e67ed59e1d1-3a098b431dbmr1903170a91.26.1790248378423;
        Thu, 24 Sep 2026 04:12:58 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm4399478a91.3.2026.09.24.04.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:12:58 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: damon.ding@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH RSEND] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Thu, 24 Sep 2026 19:12:49 +0800
Message-ID: <20260924111251.936444-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a0754d11-d88b-4dda-972f-7c696a037bc2@rock-chips.com>
References: <a0754d11-d88b-4dda-972f-7c696a037bc2@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On 9/24/2026 11:24 AM, Damon Ding wrote:
> > Hi Jun,
> > 
> > On 9/24/2026 10:04 AM, Jun Yan wrote:
> >> The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
> >> internal eDP port) has no separate PHY device and relies on its built-in
> >> PHY, which is programmed directly through the GRF registers, so its DT
> >> node carries no "phys"/"phy-names" property.
> >>
> >> Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
> >> -ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
> >> misleading "no DP phy configured" error at probe time before falling back
> >> to a NULL phy.
> >>
> >> Use devm_phy_optional_get() instead, which returns NULL when the PHY is
> >> absent and otherwise behaves identically, and drop the manual -ENODEV/
> >> -ENOSYS handling. This also removes the spurious error message.
> >>
> >> Assisted-by: Claude:deepseek-v4-flash
> >> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> >> ---
> >>   .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++---------------
> >>   1 file changed, 3 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/ 
> >> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> index 18e76d1e78e1..28eb668d3e3f 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> @@ -1427,21 +1427,9 @@ analogix_dp_probe(struct device *dev, struct 
> >> analogix_dp_plat_data *plat_data)
> >>       if (ret)
> >>           return ERR_PTR(ret);
> >> -    dp->phy = devm_phy_get(dp->dev, "dp");
> >> -    if (IS_ERR(dp->phy)) {
> >> -        dev_err(dp->dev, "no DP phy configured\n");
> >> -        ret = PTR_ERR(dp->phy);
> >> -        if (ret) {
> >> -            /*
> >> -             * phy itself is not enabled, so we can move forward
> >> -             * assigning NULL to phy pointer.
> >> -             */
> >> -            if (ret == -ENOSYS || ret == -ENODEV)
> >> -                dp->phy = NULL;
> >> -            else
> >> -                return ERR_PTR(ret);
> >> -        }
> >> -    }
> > 
> > It should be better to add some comments here:
> > 
> > /*
> >   * Exynos5/RK3288/RK3399 use Analogix DP controller built-in PHY,
> >   * no separate PHY configuration is needed.
> >   */
> 
> Well, I think it should be fixed to:
> 
> /*
>   * RK3288/RK3399 use Analogix DP controller built-in PHY,
>   * no extra PHY configuration is required.
>   */
> 
> The Exynos5xxx case may be more complex.
> 

Thanks for the review. I will add the comments in the patch and send v2 soon.

> > 
> >> +    dp->phy = devm_phy_optional_get(dp->dev, "dp");
> >> +    if (IS_ERR(dp->phy))
> >> +        return ERR_CAST(dp->phy);
> >>       dp->clock = devm_clk_get(&pdev->dev, "dp");
> >>       if (IS_ERR(dp->clock)) {
> > 
> > With the comment added:
> > Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
> > 
> > Best regards,
> > Damon
> > 



