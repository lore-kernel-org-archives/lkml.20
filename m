Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D5B42C4FC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860081; cv=none; b=C2LTl+g3Vch2gHOXEOa+SRgJx1fI3nxBO4ysbSBxEeSDukBJJNaURruVwmPTxBkIIfWjElweTT3JgXHoS+25pzvbc80L+Xm3cwT0eV5topOZ+mIu+KFrHyo1QbO8ekMRTKZ64H2CgI2D3GyCp0x7XX3xru9A/84A5wWR+hCcD8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860081; c=relaxed/simple;
	bh=oisPNWwi0y+XLUx/I8PdbNLKALbOvIz3N/myw7Fs0xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3F3gzZqpkeDaYWI1bvRF0trVWZ3Gk5cx0F3lsoDHlKWKt/zVP/eN1V4rjtguedTLGryEs/sWnHsYTiaFGYm7dzdFW2ix/IHFGzFvWXOzwblsJP8QIK9VgqjW/ByFAMCvfvrASRz5nHZ/V3UllnWSkh2dxhDqKU8jo2INbzn9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HI0XnY0t; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HI0XnY0t"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0b486d91so327712766b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860078; x=1791464878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ECwzGbNnNrgef66dzn9kOOKdrN08mp1GM1Y4L86hu+E=;
        b=HI0XnY0tgDitAtsl6jyIujFdZQoNcPu12UVpwq0ysYvAHZGy8p4e7II7VQC+ZdCoFd
         Pi295Iq8y2gp6TveTb8KBaGuaJ+Xh3HI0PDleNQWCKNjb1z9rsgTKGUK75V97lvXiugY
         Fuw/9j0TrufOS0cNvRu3dAP6LXFG8AyhReYwpfAeUmRAYN/6VnIPejjCFW1s1QH3O1+y
         ZsljxvJcHdYfGy/cIrO4oY10972EmQOhPnEhZjtLRmI9vOjIaqZzhecLhu7RV3+fW57Y
         mu1uy5q2k9EsXLnYfdSiWix9/lRpLtH4pCzmsYrwVf3fKQiEhmC+CpxZPIwLyVmeklku
         47HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860078; x=1791464878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECwzGbNnNrgef66dzn9kOOKdrN08mp1GM1Y4L86hu+E=;
        b=DbaKb8t2DS9Oh6i0R+VoDlmCngRwZFT5wuFHvWYHbdqKwHlPY2c8rPZnZbGKmQpRDP
         FscgFmzEATmSruSvkL3YkLRqU6E+hMGq1bdyga4hJO9NT/W5afnMZxBVBeR0n72c7BDb
         /IV2cTiU0ICLwkT97Mx8AT81x9tghfBK9n25MBewVlqHWfCTX49hYjAgphwMTo5awmNZ
         T+s5CgA/XTT/M2ZiLr0kg0neJRxmpl7lCbILkjGUo2VTMzeZt9/w1ZBoglYwu2rzhjAc
         33CmpuphLnowcXLmV/SwDsqBpXN2Ae4uym6k1b5r5wW71pMnVOr2v2bDtOGBdYLm/znr
         1sIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6CllZU4RsYbrLXjMk87EDPV2R1Z/Aa/PhLCFuEq8la/eknF3hUBMJuYc5TLGRoG8oUbR6UHeRXFlAaoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nhVekR09X3lAZ9cx3ZoypXRNRQ5lkVwq2upH3fh7p9gCOdksbx
	QuLJutxCHgNTxxRTlh0c0EeYp6yxMHw93i/yFETW0t+c7ZB9UkHiV2j8
X-Gm-Gg: AYBFou37VAcLVpKCb4KI/hboj3cqrKRleAl8O7IgjFBGUBomV58cR0SK64NytOjB3Po
	RIVBCVNYfTrQ7u6n+j78yIgs3l7H3cEv71D8pdUr3pw2ntvx8q+ve4cbbUVyeDTbpD/p1SXO3E5
	ls/Z/BXeJrOlgfhWRCdV8p2wbMy9y36LQXrgTuvLQWFULv9h3nVQXurnUnEwyxZHGqJTFjmMXlm
	9SbCXKzteGIJr7GRenSqxuY8VnW3VheJXO5NYdDwJeNJvzZYwPvzvA32jtl1VShxaq0eDA9QSKz
	VBKI4DDJmVmmVSkkvF45zr47S00LbJsd3MxO/aWxtswDNjt+qK2BlHXoMN1awyvD8NmHhG6bOsH
	budi6+zTbT0n+MS1xDjiJPXlyTiVRckFS0O3vc9BYM/McsWZiIO6kc4KPeT4KyyGX52zO+RaQ/f
	d6I03Elpg484u4+XtdK7fhlZT8AS3krsgfhKNcd5Py4+UW1LE8T+wzwrdb84Q8S69cNOc=
X-Received: by 2002:a17:907:3f18:b0:c20:3402:bd35 with SMTP id a640c23a62f3a-c2e23caaaa0mr396166766b.12.1790860077735;
        Thu, 01 Oct 2026 06:07:57 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce9e4fsm153318266b.31.2026.10.01.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:07:57 -0700 (PDT)
Date: Thu, 1 Oct 2026 16:07:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ronit Gupta <ronitgupta138@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: Add missing
 newlines to sysfs_emit() formats
Message-ID: <ar5bKXI9R-RuAux0@stanley.mountain>
References: <6abe5570.5b65f4c6.2632fe.6f95@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6abe5570.5b65f4c6.2632fe.6f95@mx.google.com>

On Thu, Oct 01, 2026 at 05:43:28AM -0700, Ronit Gupta wrote:
> According to Documentation/filesystems/sysfs.rst, sysfs attribute values
> should terminate with a single newline character.
> 
> Add missing trailing '\n' characters to the format strings of all
> sysfs_emit() calls in gb_audio_module_*_show() attribute callbacks.
> 
> Signed-off-by: Ronit Gupta <ronitgupta138@gmail.com>
> ---

Please slow down...

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Anyway, see my previous response.  This potentially breaks the API
so we can't do it.  Search lore.kernel.org for the function name for
more details.

regards,
dan carpenter

