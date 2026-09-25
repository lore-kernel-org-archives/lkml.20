Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2552649B5A2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332991; cv=pass; b=i+N/fiHCx5P5mLs4vuVtPAW1KW8ObifPS2828opzH6WyrAlq23Exe2fvhw3jo4wsAXmnuDxa+JBh2cFSMd3d1TtW7ZUJUWIZJjEPOb+1qVGzwVdGsp6VR2Hel2KV4DN6vv2xiOKrnHqiCO5/GyhPHbX0pppoYruO/nUl+juclMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332991; c=relaxed/simple;
	bh=0jhBtxezo/BnEPs8cPVGYM+CZTI3dvgcBUXFhUlmG60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLhrjjCJMJVPD9OUCQwDacXaZERAs66pgOEEqtyHUwv6lqNsZHsyRZQJDBeGOciZla8DO7eHCj0pCZqZpOpb0Ya3bIl6Eqb7veHfeIwDKJwG749R2VMKp37lec+x+K4wVZjVI6c1O3f9x7uFRcjf8egAkzsfsu8GhYypL1Y352Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=CAe8qvdw; arc=pass smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="CAe8qvdw"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0c52f9a45so197547a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790332988; cv=none;
        d=google.com; s=arc-20260327;
        b=qRRG7jFClopzXIwdeVGu284uLTIU8xOcAKeVNKqStDLK0mVAJDujN6hY2XklgFPkdI
         gxXcDJv6a1wnnVnW6OtGpSt+OClbKB2durfUlwLHSIihLwwDfUAapAZFdJPVulkTuncN
         8L3r+Aw9oM/sSU7pB3/TsCGi1g/ftzDdXskOFmTHD13Jui6U8c9Wivx/xo3/t9xO0qBl
         WjFBBIR0C+zLt8AsQSosBedHXmZAk8fg9TxrNAwvRN12gVeKz55wPEuG88qgWYbh8YwU
         uKrkyG/RcPwwIZhbr132gEtw/NK7foxaumvFrtwfPj8rM/oWrSiFtknViMDhySWXeAEg
         vSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BRpIuFoFTSYDMCEFJGiUusnifNbms8g6CYYPzdMnXGI=;
        fh=mfMxR6KY7eNHT7Qsp5myDv+G6t7AGkw/oF9rsLAmsfw=;
        b=Y1FGP9la/LnoDxppnXxSD41fJIqJ0bem/Yvqehz7doqbowz30+YuaBFExnw8SKySUV
         MU5nxPXEzqhSnuFV/rY1Ipyc7w6jf7obFtnkZHGcVVZVlSLmXrCpqUpDcyAIOi0h6d+1
         KfiudtZPui9QkDQ6bBkroj9bODC8Oic2DrbjVeia+eprBkTc4/HcVbHOGzUjttBm1Zxw
         UslitudVbsdQwfADixdsZ3+xauUTM+qnV35qYWrTHd0Ms/lQBadfUfpQkUyx9mrcdonM
         cND82ENviK96fOdJCTXBU7A/KzeKoMMDz0cMq6OhD0DwUa8ZDO03w09oK9DFXfCRu9fO
         N5Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1790332988; x=1790937788; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRpIuFoFTSYDMCEFJGiUusnifNbms8g6CYYPzdMnXGI=;
        b=CAe8qvdwdzWqIl8B+zTwTKPTXHI3B8qlX4wRv9GHGvAw6JAGZ8qiqkEqss+nXd9p17
         6oKTMoc/FaJPssk5tgVORNnk7wz3mnDICZlslwMGqiJfXRnJBxGfrw3wCXSPUaFZCr5N
         1P2MuGxaI+qc3USBlc0/Ur6pffC+KhBht5NqMdLuUsi9c7Jxn/ovQX8k9Rw+sOHiGMOV
         3D+x3N1O75s2Hi6En08OzX/CWdyutShl0inQNEFDMuZyxVMTNgSCYYnVm3q1An2cFxtq
         V3H1aQTC5m5l1703m/+tys8WF1iigtzh3dQkrIul8NUMVrucud08BjpuJVlFMxDmUdNs
         U5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790332988; x=1790937788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BRpIuFoFTSYDMCEFJGiUusnifNbms8g6CYYPzdMnXGI=;
        b=NZT1QCo7Cu/z/3O+PL5k/N0Os5m+qILrcXv89GbERwckBAFnqbWF+tyI9P7ERrjjQf
         y4etx7MS630MVvRT+Nv+PvoSd4kWS/k3EzUf5QVnfNKuNDN0C0SGmzxW6eNsFNxEedFv
         BX5kWn0z23NUNpc5nIVCkSQ44YpicqKql/Gjz5h0a7bBRCQGGTdKUIV++rfTwDowiEQ6
         JORAdrMNkeoqjZQhhhgSRUgrk+SIdKIe9OTgwEBU4NatfhFPgeiBfYYDuasDtOJsMFGt
         MdPm4/1D67H/cObSaKWBUBw40RvTk9uqhIHo27cCbYfSPC5yYEWCXsuwtcfNYpl2eXNV
         3AYw==
X-Forwarded-Encrypted: i=1; AKwUvBz+gCq71K/3EWu6UXjU49ZGMguCsUoNRZSDSD/n1IFrhPOEYqj/Fl41EVWMriUuYcqEyAKEYm53MzHFTyo=@vger.kernel.org
X-Gm-Message-State: AFuF++mEAvFyrcUYULIppexXWN4+CXx0CuYL4pfT4NginDBUWvQxSV96
	hMabHVjL85/n5xGuoH50SxPVXTiAmCj8juRbX7+5HJxN5FfEa9vC2ogf/Dh97lW4y1XX41IP/YZ
	DFOKwxs/MJ50zhN/rNw63e05roj+QbthltLeyM5abLQ==
X-Gm-Gg: AYBFou0nlD1JTisQ5WhFIOEsTyN8w4sYL/tnccGEI9OF3wv6v9Z+jD21ZbLl7u9PKTB
	CN8liAmHh1p1LtcgIQaexVaO+e5+P8KYhN2s0xCKvLMxxJwGOzyEkspGdoILVYtjw3CwMh52YLP
	XBftIVp4KUzpHHY/2YHesod0PkwxGxoe1Ob4h5bTSTTvHO3vkubD8tQuvUQpT32ydSLL2ayDk6k
	/a2vS72uDP6a1p6KolrUqyPPJFe597h9DPzCvLO69ptTIZwQVS1w0CYLy9sQf++6jwQvukhTqOc
	trnL1rW38mbu8Mti8aTH+yZUi9HGYdfDd3RgBADt2uJSrG2LAHizwK+bPGKKsUyKvg==
X-Received: by 2002:a17:90b:3d46:b0:39d:f317:44cd with SMTP id
 98e67ed59e1d1-3a09860dff2mr4452158a91.14.1790332988129; Fri, 25 Sep 2026
 03:43:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <20260921-vrr-limiter-uapi-v1-6-2fcd7d011646@collabora.com> <a5bc012a-9b9e-eb2b-d67e-a91f2d93d6bf@nvidia.com>
In-Reply-To: <a5bc012a-9b9e-eb2b-d67e-a91f2d93d6bf@nvidia.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 25 Sep 2026 11:42:56 +0100
X-Gm-Features: AclHuK-I3v9LGdL8IGkTOXDiWq73AU-KwLgPcsiWlNH5IITVHFCCiS3M3P2Jw5E
Message-ID: <CAPj87rO2+oSA7KtocG-M1hqgQTJO=3Qxmg-OMC5MmOLaja_kRg@mail.gmail.com>
Subject: Re: [PATCH RFC 06/25] drm/connector: hdmi: Add VTEM EMP generation
To: Vidith Madhu <vmadhu@nvidia.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Leo Li <sunpeng.li@amd.com>, 
	Daniel Stone <daniels@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, Derek Foreman <derek.foreman@collabora.com>, 
	wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Vidith,

On Fri, 25 Sept 2026 at 04:49, Vidith Madhu <vmadhu@nvidia.com> wrote:
> On Mon, 21 Sep 2026, Nicolas Frattaroli wrote:
> > +     if (!crtc_state->vrr_enabled) {
> I don't think we should use the vrr_enabled CRTC property to determine
> VRR_EN in the VTEM EMP. Transitioning the VRR mode sink-side typically causes
> blanking, and it was discussed in patch [03/25] that drivers should be
> free to handle vrr_enabled changes as a seamless switch since it only
> concerns source-side VRR state (this is how the NVIDIA driver handles it).
> Maybe it would make sense to extend the qms_enabled connector property
> introduced in this patchset to an enum of {Off, Gaming, QMS}? This would allow
> a standard path to control the VRR state on the sink, separately from
> vrr_enabled.

I remain cautious of putting this amount of policy inside the kernel
and/or left to individual IHV choices. It's relatively obvious for
NVIDIA and AMD to say 'we'll always enable FRL/VRR to smash the
maximum rate (unless it's contraindicated by USB-C bandwidth somehow)
because the power burn is inconsequential', but if you were MediaTek
or Rockchip you'd probably make a different decision. Then again, if
you were an MTK device living on AC power, maybe you'd make the same
decision. Or maybe AMD would want to make a different decision on
laptop parts because the bandwidth is noticeable then.

The point is that I don't think we should bury this down in implicit
kernel state. I'm with you on surfacing this as an explicit connector
property. Possibly a bitmask of modes the user will use? e.g. {
frr_only = 0, maybe_gaming_vrr = (1 << 0),  maybe_qms = (1 << 1), ...
}? Or perhaps just a flag for whether the link should be negotiated as
wide as possible or tight to the existing mode params?

Cheers,
Daniel
