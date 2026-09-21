Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCF3B95E0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981184; cv=none; b=XAHyYIRTjESJRfrZ8Y2lINL8sdBEOFmYXqjd+ZGl121OHjWeIT6mf26Nt+aEHYha0WAftOH+L75bVMrrO26g1OGV4kjpl1FWTfCpGIbgwwZJdE/dEJrkiposh8BDNo07v3BBJ/FmIPjEwcfU5nQXLe8gTz+BnHBdjFHJ34hEQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981184; c=relaxed/simple;
	bh=g2PzXxo1nAfiLbbWF0TW7v6I7XOSfEg0vPe+YU/85Io=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofTNfPr+MNkld5JYNVV/td5FiFAcC4DqxVNccqDp2gEfoMPSvQ/knxZCJ/IhTeDXovpoz95nGKOM8O4vk7IeKGRxGexFakn3qG0oQyuab4ktcBx/zVvGgvcBe16DFHXBMrkmg6pge2JycTNMBbTzwRSRGGUmj6VgVmmvsNK90tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve67i/Jf; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve67i/Jf"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so2331160a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789981182; x=1790585982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1PMcAHhFfs+SSNmNZjsu4ds+YA4TIgtvu8dO0EmsxI=;
        b=Ve67i/Jfw4Y1v/OvHNhKATjTTr+mWvCWFPIjYEoag3bJVQH2Flx8Nc0np8yZG2If6r
         8hGRMi0F4GyX6qIhG1pl7Y9KyoDpVUs1ufQq7pmvgNzWMePDpoL4jKH29H1mvHgI/wYf
         sjTydgiJeJ5ydhdXQZZo7EHXMQsFrFik58pp5Zmb46pHeGk0fhrwsJ8dKrg8FPW6Pmek
         4ooPCkyRCO036wg9DosmfAbqP1uIpmhgJdlSyc70sUw4xgF0ImE2XLL04XksuatyLB8g
         E1R+HoBWmbXvXnit6QWMOIvqVHnQpwxCaU2tU3QjIipOu3mt+tEN1sStm8GI64EpYCZl
         t9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981182; x=1790585982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1PMcAHhFfs+SSNmNZjsu4ds+YA4TIgtvu8dO0EmsxI=;
        b=l47hhsrdXR9eFHcrcE0ytRSJk5D6UTA46I910NbaURJjx/l48yzfBJpGUAIP6oIkWU
         Z51QbT6o56MapTXHVkNJ9vH5OPMfI6lVO4pOEavyNRiApkNcx/Rr8Tk+BE32eeOzPlyY
         ekdoaABOHi0hMGjPdzvpQPoSjpfCH8tCfe0mgY7fvL7nw4Fvo6rGWTWQt9gT6QKQhrqx
         Lqm7uMaopHhWXm6Mdx0b9nJUgkddb/Ss78Fy2ywUist8N+UTgqv+Y64Ebaux+sejp5wQ
         2TJnBlNjOH8pD9g3KeDv/uAVeurCb5vgr3E8l/95mBE6DFV81Ghta2ylnC9Je2NkF5FI
         ZONg==
X-Forwarded-Encrypted: i=1; AKwUvBw7rxwR61zWfRpMugapEQbomMCizHJGvJJsTfp4n0lGp/QJHwn6LRkj76XeHhRqBzJPvRcfPlUozRakMtI=@vger.kernel.org
X-Gm-Message-State: AFuF++kM3rEcllnfqR93Dh9E670i4vTIGFj0rkTwrwgt6KMEExgEtL5q
	k5+sUAWDIvzJo+g6Ya7yiIITCnOVptdZNjxtBFdyQ5G7rQt7LUyr4WYa
X-Gm-Gg: AYBFou2jDO91r3+Y77XGeVrqkgTusQcD6XnAKvEeHH67D8JahimkUPZ2srj4kZLfrVr
	qSbffw4Whars1heVVxC1jUOSsiLdE0ixchQ/ObRekBoqyoU67QXl6Y1Sq0gRaa0rYtAYUBZk0ju
	ZYDCG8R0Jr9Ci8FK8/9VpdYT3tV+P4oMfjXRVy/7oxqGJJKUPFwCu1OoS0JKFwG0/31WfIKU1s0
	sa0CzVAnPdF44FwPQghXxh/2TXZxBhhB9E4qtn97IYyFwrITYwtiQnnqMMfmCc/5rT7eqdMSI2M
	dqIJtrRosr/jDOMtVDpUVt4K5YiITadfnfU+F4Js6VORBL6mLkCXU7dZ2ZevdzlQPUMy02ykVCP
	LSCv/ZlQdnlEVwQ3tHcfEnExnyztWswsvW5MIwlQjaz+A7Ju0YvFOMSJhAyP4idJKGO2aVhqJxT
	9mZmmmQFtQgi7gm7rXJNWfRv7ITMz6nIBCsAyMaXGgAj2Jc66GuEMjFweZ6JeERRxn7sDQ5z17q
	HQhGOmYI93jgbJRxer5afDO2XnVPoJ8voJkKTdbPufYjQcbKdSutFtxRdRSdEE5YIV5tUe9w7Qu
	dTwihQ1jUyU=
X-Received: by 2002:a17:90b:2584:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-39e6c68ca2emr9039676a91.61.1789981182536;
        Mon, 21 Sep 2026 01:59:42 -0700 (PDT)
Received: from nxpwireless-Inspiron-14-Plus-7440 (61-228-227-192.dynamic-ip.hinet.net. [61.228.227.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca50118sm13589453a91.4.2026.09.21.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:59:41 -0700 (PDT)
From: Jeff Chen <chunfan.chen@gmail.com>
X-Google-Original-From: Jeff Chen <jeff.chen_1@nxp.com>
Date: Mon, 21 Sep 2026 16:59:37 +0800
To: Heyang Tan <thy15333007817@163.com>
Cc: francesco@dolcini.it, johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] wifi: nxpwifi: bound debug info output
Message-ID: <arDx+VzL2IVXeZPx@nxpwireless-Inspiron-14-Plus-7440>
References: <20260919040253.590-1-thy15333007817@163.com>
 <20260919044439.1042-1-thy15333007817@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919044439.1042-1-thy15333007817@163.com>

On Sat, Sep 19, 2026 at 12:44:39 PM +0800, Heyang Tan wrote:
> nxpwifi_debug_read() provides a PAGE_SIZE buffer to
> nxpwifi_debug_info_to_buffer(), which formats debug state with
> unbounded sprintf() calls. The same helper is also used for the firmware
> dump.
> 
> Pass the output size to the helper and use scnprintf() while formatting.
> Clamp the debug table counts and window size to the backing array lengths
> before accessing them.
> 

Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
