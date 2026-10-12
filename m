Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3159737F72E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812077; cv=none; b=pvQ4MqcZFk+Uj0ftAECpbPcSE/zRvBdXpS3uz2qQTDVsjkoMHCPQJ6r69pKTdof5ZiSARaDb8y9WAuM/McYoBLju3wGIl2SdH3lxUGNJAl8RHUkrjerjrRWeranCQ+BFYuaJTg42ocSMLfKmBKoGEfbCLVo9TPU9Fr0mSNld25g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812077; c=relaxed/simple;
	bh=NHu/K0xZgZFW3d5lgMZbXzllHDi8ib7YEEBd+KLWdQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saqCHubLAoSDcfRDCFBfVmjCm5bnxEena+agKj53U8pdz3AkV6m2CHgDqzSX2jS1TYRWzkTHbG16hFxVK9yiyof5VjllZUCsVV+a80IHmQrZNn1B0jfdQNGTJkv3UD8sChB/gasHN/oPYujrdHxkTyFgpcR/paxyNWc0wipUVMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ovhYm19f; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ovhYm19f"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e441e14a1so130591085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791812074; x=1792416874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=APyi0iRUPZWOwHWtuxjyWmMEyDkcX7OsLaOURKQenfI=;
        b=ovhYm19fWlbH4Gx3QoctXZ3HOxKr5tdK8ZplGhzth+5XWGKtBcCUcGMJv1v/QAMAvi
         GShOiLvHUH9myo8RA8EKUhcrq8U8RfDINUVm66tgJAPVJJLguk0jbNO0hON0jhI0uafD
         mBXsXqjMq3c2PPy6DkYd1Ai15ZlX8BQorPZACX7xbVfe4qbL7q3c6/sZNc9KLULv7U+j
         bHqOLNFRq8SABYIP5r1npRp+vRr3n4S3KfAaxtRgNDsHP2pWQht+/bsMiZreyRwcnVa+
         wxdRNQNhR2RAdb2ws+hQ9GiMkEXUoc9ssRoBaJAhkRnLI06Ww1WLAyw5/8tMNmzrV8r+
         Ua+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812074; x=1792416874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APyi0iRUPZWOwHWtuxjyWmMEyDkcX7OsLaOURKQenfI=;
        b=BkBqSsAI5gOjvFvMn62jef27DE4Cd+R5QT4wFmnIAr0H+P2QXC3dCtkH3GwGY62cgR
         gf2xXiyLhK65IfNSC85Bq6MQk7fiY7niWy0SHD5+AKKDcUU8Aw/o6T1M4i9Qbgql6mmk
         zESkPBfH1tlHL0Eao44oHZcyTMSgq5nYv2TIABvhu62QK0lmPR0SHY7Ccz47FFEnIRYs
         F94T3ZhYZkbTZ+VWPGi38apnSaTOz0Qhbl9K0/zZhqy2PdOuouJaYevZw8UlDodwsVTE
         9Co/z7Kp0d2/P2tFrAfEVUxLePSKif+HywaF/8J8wzmxy8QYnb3LQgeUCrDWx1xjPdeH
         N+pA==
X-Forwarded-Encrypted: i=1; AKwUvBzd22PxKLvJbC2jpfO78Ya8EH7OKZOFF+kBZar5fzIhLD7uH30vcKT7EMIfOo358YwlrdCNjzHxE3+/x7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKoDHNnKsVo5j3l6hKyVZgxjw8yTFuf9PnwrIreW80u4CZqJHk
	/DDhaxPcdabUBQDlw/4pj0r34BXKVV02m2vtml7zOlj4f/8/tQT0oOWo3mg/KqIyU9c=
X-Gm-Gg: AYBFou246ifLr+9RMXYAbk0tgD4g1UzabzGN2azfiQpCJ5cBgwm+e0QLytcBu/08Igw
	Tcf2aPm/fGlSUdh+CkSyddBF4PZ+/GtQ7Lx5G1PpCFwKx9af+NzBpjxqHV/3h3daaV3tqT1+mY1
	ALb4847VasVkuK1fnhVyrG0syCsZcZFToRghkgHD1iO3XBtQZpC5V9pvqRX796B/Rc2GsbGMRuZ
	yvpZZ9Mj7p3TdcEt1PYoTtok7ELayRuS3D0ViE+Y66JwGKH7VMBtcpJ5ePIh2d0CzNc7u+uvEJt
	rNnC8Nc+GMS9rxmO65l2LfNA+ngQGhKD/3CI3uHqKgZYooYHMLt3cBAmHzmnl/541dC/UIUzXsG
	v8erbSxpCf7v716QSJ2QuMV98lqG27Mpo3tWQyOIEgl47Baqi9kExZXhALDRO44H9/xJYEDloC6
	7vTq5owtNzI+mPWT5x6hbZjNsHbn9CL5PR/Kpis81agUdahffNUwV5DvrdVpxWjLFKjuQhqYEw0
	qlwCSDw7von3MdIw+zmQKqtFDb+ttw+IgZ2OZcjw4hJp2Gvolmd7LI=
X-Received: by 2002:a05:620a:371b:b0:912:1206:ddd1 with SMTP id af79cd13be357-93ebd0e4d43mr1584355485a.1.1791812074159;
        Mon, 12 Oct 2026 06:34:34 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c6b4bsm855300385a.34.2026.10.12.06.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:34:33 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:34:31 -0400
From: Gregory Price <gourry@gourry.net>
To: Anisa Su <anisa.su887@gmail.com>
Cc: linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Ira Weiny <iweiny@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Fan Ni <nifan.cxl@gmail.com>, Li Ming <ming.li@zohomail.com>, 
	Benjamin Cheatham <benjamin.cheatham@amd.com>, Richard Cheng <icheng@nvidia.com>, 
	Anisa Su <anisa.su@samsung.com>
Subject: Re: [PATCH v16 8/8] Documentation/cxl: Document DPA partition layout
 and ordering rules
Message-ID: <aszhulUhlzXn4njl@gourry-fedora-PF4VCD3F>
References: <20261010225852.10727-1-anisa.su@samsung.com>
 <20261010225852.10727-9-anisa.su@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010225852.10727-9-anisa.su@samsung.com>

On Sun, Oct 11, 2026 at 07:54:59AM +0900, Anisa Su wrote:
> DC Partitions complicate DPA ordering. Add a DPA Partitions section to
> cxl-driver.rst describing spec-mandated and Linux requirements for the
> layout.
> 
> maturity-map.rst breaks the DCD entry into sub-items so the map shows
> what this series lands: partition enumeration is [1], event handling
> and DC-backed DAX regions remain [0] until the follow-on series enables
> them. The parent stays [0]; nothing is usable yet.
> 
> Suggested-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Anisa Su <anisa.su@samsung.com>
> Tested-by: Wonjae Lee <wj28.lee@samsung.com>
> Tested-by: Junhee Park <jh9934.park@samsung.com>
> Tested-by: Heesoo Kim <habil.kim@samsung.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>


Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

