Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C83E1692
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235023; cv=none; b=MIGQyg2LJLrN+bhSgYrPdzDD+IzcmwQmqCSoi1UZebwWEq+7nI4jF6XnkmMFHalgD1i5XvqQVsBB4NmcVz9lNyyqWluRTSDBvJHe5sCNTGX/WgO3SrcDWcWMl2p31ehO1x7UIsg7gp1e3WpKbBDsNGNrNRGX9v5P1j7mDKSJAtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235023; c=relaxed/simple;
	bh=oSHhfe/3BMYwK1VKmmdxm9bRYofruDGD3Z9oNPFvSP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f80zntiABzkTdygdDkVuH7yIzewM62DApkBFdXRTRAsXzCr73yMSLOml6KbZ2jHTkGS8dt0adKURIMuLAfUyEN+mzCeS/yPMZAiRlZRZFkEfRzfNunJdrjH9cDYXv1exD7fdB18ID3Vh/zFMownoMzVZvRD8984mIwtNHw6UmBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7YSzZUi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7YSzZUi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so9586895e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235020; x=1792839820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaMI/trTcfwmLC2pSab0mIrGT4oZ42vsgle4U84qwIM=;
        b=i7YSzZUim1HHB2Uiv7hGUrccsYeU3PDacktdd4rCxP+yU+i7t8dDCwf6w2hna6VNuy
         JxDCBYjc73qX7j6VDsWc9oo5RmOO65gmLmtn1i2EQ0AsRMSNWzSLeO1p2iETazJ5F238
         L0IwFo5devdrupi/GdsaI/d6v1wrsm/qJOTgiA2E/MZQcRW4Tg+RUdx5IYNpopP5rJC3
         zeaP2Yt4dYAylEm5HW2goF5SbPF/ajkIER538DTJ8KU7mbQKN86nB+ObSND9slPBB9EN
         wsbY37QzHUVTTcVb//2tFisVq1meITW26ukOZ2EsP12BKb5tNM+pqv9it51fuaFl8Rtg
         SJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235020; x=1792839820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaMI/trTcfwmLC2pSab0mIrGT4oZ42vsgle4U84qwIM=;
        b=yPHk4so3ZbsvHxYb3U+kEhtMF4eSeGP9OjJoQcxyvgjAgHGepnaPmKWbOgmveAizsn
         kIglNzIy2/nOorm6qlLPJYoxfrGiR5AbI0JVAv84G0AezC2G/t1dQDbUPxPM3m7ry2Hc
         FFHFe381ZEmSiGeDHO0+W4oD0z9LBWtUCEywsdIoYFrO7827IzlCCzO2eZ2f7QRvAoNe
         5FbLGil5RbwuyY0xBQ7FRXv3BiMy+VHRCujdHBi67lmHiAROnef+4NWl6juGHBLcELnV
         x+zcEBkDpHIFW9Mwl+xi/N+0wqBwEwobOf0MPGNeWeRVJyrg85ajDnwDMs4RUu2uGMKl
         MHIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy91GxDUGcUjyhIbRAhMdkbkmg4EqOxADNfy4G5s4LbHwIdHR4HOkk3pELNkA1PPVH6BKPrR50e4OUpbHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcAxVXMSNgpJT2j7nQRhOnIKZDdQgHJU67fYPXSBiXANjiJfxr
	Wm9H3Jn4hJEMPUAuvraZ9vplpyHoPloNBGSw4ezGjgTecP3mCBYERE7X
X-Gm-Gg: AYBFou18nqZ9pMhEBt5DTjcNF6pszIe4E3dpb6uz5adwN2z3GUqYMJC5kAkXyYrDNAJ
	so1iWyHICQOBnRR2nFHn2AnbDpbGUSFJlqzFy5LwxImb0uWjw+LJQ7XXfNFDgPgsdfcrZdnlBKP
	aQs0BYXaOy804WBT5k8tXOfkxvmh21lZ/abfOTUNuHSzClBGPsPwzZ0OAeq6pHEx6eL+VbspVpc
	OzWum75PJIzYs/QW9BoVueZzE7a+yh7ri2R17gWk6sLEQLz6OHrWP2KIuVg9pr38W24dIyLoSjn
	a/7jd1bWDaoAGuMOUIRYUhhWknaLgxEewtRkCihSUVHY6/heqsCpDYgn/4qIYnDk/+J3NpCzaCH
	x6aiaCMhKy16QSbbVH0+XNvugv+0pGDjOVtShgXucsXhxetTqMbPpTP3XGNs1EmxqotKrj3bGST
	eLW/2T6Dw1t7V4yAfScJ0X2i+FzbqUJoPAV5Kyky2AG/otWPIy3HIfkIoM64peuq5N/XI=
X-Received: by 2002:a05:600c:34c3:b0:4a1:df11:45a9 with SMTP id 5b1f17b1804b1-4a1df11472emr13188475e9.4.1792235019771;
        Sat, 17 Oct 2026 04:03:39 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca26dc8sm87804825e9.3.2026.10.17.04.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:38 -0700 (PDT)
Date: Sat, 17 Oct 2026 14:03:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Feiyu Wang <wangfeiyu_mc_code@163.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix logical continuation style
Message-ID: <atNWBx-Nr9jw_-sC@stanley.mountain>
References: <20261007102212.112463-1-wangfeiyu_mc_code@163.com>
 <20261017103525.6203-1-wangfeiyu_mc_code@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017103525.6203-1-wangfeiyu_mc_code@163.com>

On Sat, Oct 17, 2026 at 06:34:44PM +0800, Feiyu Wang wrote:
> Hi Greg,
> 
> A gentle ping on this patch. Please let me know if there is
> anything that needs to be changed.
> 

The driver was deleted and no longer exists in linux-next.

regards,
dan carpenter

