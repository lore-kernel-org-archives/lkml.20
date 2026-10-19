Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744827473
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792368346; cv=none; b=d+LJo4AzfINIkt7Lju2yOTUEO1a+hto+Fia0j459OSpe4obTKpnVm8+EPgs/zbhwjFRKO88RQM5bM/8GnArVQbTTH5XIfvgQwXfsCI9hcNpzJ5He78MaKET36VBEtSMTM4qVDERDmSDFvlh8aDKN3O7D+JU0WT1Tn+K2UYWq1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792368346; c=relaxed/simple;
	bh=ifjHrypS8OaIbgMtrNppOarqjtvx73eEWodHO2AKcL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1v229ADPGNVZqu3R8J5mHtSPCyR8ZTAWBbTHLyi67hHaz0NwY8rhWVTQIdRYDva7990GSYS/Rd/m3jK13CRVSFrm4PlkY6K97OjVwdLhVaIEnImxaRr40Ihfkc+UdDFA+9QyQmkI3svU5u+p+sfP3srxuby2g7AvUU1i718x0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDRiM2uW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDRiM2uW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b060ec084so932644f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792368343; x=1792973143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifjHrypS8OaIbgMtrNppOarqjtvx73eEWodHO2AKcL4=;
        b=EDRiM2uWmczAsjtiSfmillyQ9Q1n6zh0Y+u2vIAX8NEdaTJ0+Wmj+cPyKiuTueA7QR
         see+O6RV/pG/oUx6ZiRN23WOqjjuniDRGSypSaCN5qfhmCWBumyJsMYt4BvXgZnWDZG8
         BPRxVGxHFqV5T/z4O7+JfsjhDdZLu1OV0vFus542v7SI/NjFT1OeUZIL2O3Mrfe2niAs
         J/CXhln0TS0ycKEKPfV+XKEANpvuIwTRB0DNp3PePnzlnS8MpYu/cvQQ3X5JED5xNTsp
         Lix/omyHpgrw98MlLujZUuHBDHjTUFbn6Jqs8cFTha13U9hGRm0rAD7b1otRMGG8xuC5
         ZSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792368343; x=1792973143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifjHrypS8OaIbgMtrNppOarqjtvx73eEWodHO2AKcL4=;
        b=uZanh2tmAqX9xGEcH1hNHqgbv8T6SLs9j+G1JLLeEqWXAhAydOVg42LV5h7hAL8/HD
         DRDds76hXKuqyo4yNggLShPEtcpyP+KNpYI+ZNXhOCgpyUrLGPvaM1DyMO02ES6Hxam8
         1dzSkRgnEZbONusRfhZHQyK74GQDA4g/WzjvnS4QGe+ZjSYNPCgAZKxaQQLzQmT+HMsj
         m/cCZeufGpHIFuW4yQcA7zX40mN+PMp3Avzm7uumfpfGRs4BzM0SFS2VCnJTjPeWHzLO
         h5d+P+3IHQhn+TcgpdIf8oDjnHFBvG9/62B+704tVTA6M8AKmD3jQ7sGp2uW0KxhmtCg
         2PSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvivrhzTMUZRqVkYQy5Gbv+2tx+1bCoo6yQRe/RjRPiQ/wb2mKokHvjU9o9QRAviFoclrdk8aKYZ9XkzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIehYjen2baXZGO65o3HyYeRfx2GmfN87KejOiaIgOpAlBPVLNz
	JmsL4W5TzcuMpdBd4NCNsQDQlekQmrUGlD69j1m9j//LsSFxevkU+pdv
X-Gm-Gg: AYBFou3Stien6sXpyxujXlH9+HxmmABfN3ThmF7uIP0keJF6vqlOzXNDsUdtljTUEJ6
	Gtw/+IOEVqlNwNPTo15PyvM4Wgaoq5qEjLS4N0ag1izlRoEFFMQy5/ZgLHZQRCRjEF2GUi6IlHo
	OGd8MgWAAdb+Hp93AFuGtJ0mTLj7+A6kJQ/Yq+gUUGtJfiomPeWBNZ4JbZCnmKBtvJmYV1AklzP
	Xd9Tfs2ALoIdESjvmgotbD6WZwePa6ZqXYO6QWS7Y6i5vN6yIs/now7fckmZGoUr/nftf89PM2y
	QJzyFea+zuiBZjIuH1YknotC7HhAwhFiH5Ff6IY/DpY1wzJo8kzohe4GsC2MWob1alEo8G/lj4t
	/jAn7SGiPENi3L3jzXgi+QLZmWnqUmDN45ZDMPDchjXA5rRvmevpZBv4pxS9apJujvJ0rrOo38t
	vGjKG0yfRoYJjFKRTP93slL6o87vaKAMVOjjd0x8PsbqF2PJ1CeM3RXJxInQicwauSdEKvb1smB
	PrVWaQAUWETt9n1AtB1msCnkgU=
X-Received: by 2002:a05:6000:41cb:b0:48b:10c8:2181 with SMTP id ffacd0b85a97d-48e07f9a2b1mr10996069f8f.27.1792368343069;
        Sun, 18 Oct 2026 17:05:43 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.131.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm19923438f8f.48.2026.10.18.17.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:05:41 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Remove redundant zero assignments
Date: Mon, 19 Oct 2026 03:03:10 +0300
Message-ID: <20261019000443.753-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026101838-oaf-bobcat-efa0@gregkh>
References: <2026101838-oaf-bobcat-efa0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Thank you for the feedback. I understand that keeping the explicit
assignments is preferred, so I will drop this patch.

Thanks,
Temitope
