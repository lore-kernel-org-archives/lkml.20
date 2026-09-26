Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2DE36DA1A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393388; cv=none; b=QzU6zxc7Zr5UwJP2i0QF2kEta2RR2uRy3V1IpVgia1ymz9h6FQEk2aHLsbSoCSc2pi/m5J0/uG9Pi/h0t/Hx9K+UcyqC7gv1W2Lq9+uLYlcoRjMxbsFyV8/P45jMMRXi1LNYy9axDd91m/w6YKoIE3hLMfT9oDVWoNcz5H9r274=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393388; c=relaxed/simple;
	bh=h9PxQncYBLh3youqxgEia4ZTQ8uVglHXzoWmBgb9eiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJn9gOzwLnHxx4mF56U15LOyX0U4o6TFyITM59bKPkstGi1gUlnYoW1SVvumJmFjCpgg4PWnu1DtN3Te6HC/e1rYquQzZ8u7RmH0g1ZOi0IRfl56RLEnEScXVh1fN2IDmBOrXu1Rfc6IVE14vBaiIUz2cr1JP7/S8oVSuJxjrZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEvOuKUo; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEvOuKUo"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso6419135ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790393382; x=1790998182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1b7Xj/vB3OGygIglTW5p4IiMWkGrQYonjQ+99wVq5Rg=;
        b=jEvOuKUo2XLi2xxmmQhs29NlRRK5d5bdlLIodxW99rypmn5WhWMaVIxzDRw7l5gJ2e
         pl9CX0jtau5tn3hlThMw6AqgCJw0xKLJi3Tw0fgLfy0oIsDuZMsh/NGqgiyDiq2S5A8/
         RpnyQTT4sC8DzCICbhlXXEenoTlkZzY0Pwt1v0owjecVRAw5Tyht8UC1HV2O9SwMVwnv
         UAyXnaoKgoT/6oPmHTMPGmEmONkPGjpN2gGc9mKJqQwTe0JTD0p1i+okLr35/35aq89e
         UIjzfRbL7oZ84SpktFfLwmM2+8xDi3qTq9dHABQiE07tNNfI58Y3Zq85QkgRjPB1t/pg
         CJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393382; x=1790998182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b7Xj/vB3OGygIglTW5p4IiMWkGrQYonjQ+99wVq5Rg=;
        b=pe6aXGYqt7hQprzok5eKP6Bb3GITuM1Dx//FeoxzyqmPMBzlRmpXgk158L2D2DfXpO
         SZFR4xpFdPrUCajB7iDvoqJh16R+RM8FOLYw9GvPRgwxvHjdtT0RxQHpZhmt2VChNneG
         vg7Vfhdguq9g8ERO+W/vFWDIzltgqt3raSU7oJqNh+surkfj4cMIp96i/cUh1v+GUgYf
         ODSOOpIywb9JCjy7IB9qFWwIrmI1YCo9WaFYJkJrCv9UNo2q8x8v1xpuysdEbh3bB6vS
         jPpi9g+5mj2uzg+jBlGYnd+JgRHLgw/eAnrzNdvZb4TVxBXEcNrT0uFXyt3xaF9HgGLD
         9TtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVWazKnQX+R+sdHlZ8lT9EuZBbkScsU8lYVUROXLyoUUecUB5oWS5cC+ewB70qGK4eKoOgX7ERTSpjqO0=@vger.kernel.org
X-Gm-Message-State: AFuF++kOoX5VhWRbLmj143bGE1m3B/XQfOZstXBqGatP7iaRF3mgQ9Cj
	kscxGFczu6qRrgeY1Ns9QMTcC32M5jQvN5zDOsS+M0QE//ztMzjQLWmJ
X-Gm-Gg: AYBFou09I4E/9FR5KheEFDQWHo5FiRe5L0LqsVQKaMDsYLTZngb2dhd9Wp+LlVAWmVc
	I28fMmb8FuaxViVS2NdpEPsH/05Ucj3w6Fdm4mgxsmUXL/PP7Wc1UWjAVJSN+Eo59sR1R7TLJF3
	Q0RM6t5bsrvJBhhoMn5ggOTz56Z93v8sGvEfsPkgCPvuiKya+SvHEeItz3pxNau3O4EWquQvoYq
	Z2cMhJfYjYD3sA36SGV8s97U8gA9qNTb00TnETe77VI+uozhYYqIr514yYsWjpbq817W2GAi0vq
	eGQIfkm92HhhAkPGSlLxhE6+g1G3Vzd96TPJ5Ci28Oo9pVyKV/708El/iBH530g9n93Tiv6KZCG
	KvWQ3yiSeJhtbbKfpYQqbuiv1QBoc0ntyANJMpMef9CPPoHZnlWnLOlNgUo1626c/1Ti3BgbXhs
	jgxY4wmxw5pgd7BFy5XgvUKWPuk/awuOAQd0cKZx0MZj1NER6SIPQBUlDTfq91z4R/dIqfyeIvi
	YVwcqh6pyHe
X-Received: by 2002:a17:903:17ce:b0:2dd:8b0f:70ba with SMTP id d9443c01a7336-2df7e267763mr60112075ad.7.1790393382425;
        Fri, 25 Sep 2026 20:29:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fede2sm18554725ad.33.2026.09.25.20.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:29:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 20:29:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH 2/2] hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c
 controller
Message-ID: <46a43ee9-7d2b-45f6-9751-9436fd69f7ff@roeck-us.net>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <20260921065702.93196-3-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921065702.93196-3-Ashish.Yadav@infineon.com>

On Mon, Sep 21, 2026 at 12:27:02PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Extend xdpe1a2g7b driver to support xdpe1a2g7c model.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter
