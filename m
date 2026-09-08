Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E14A2A79
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863494; cv=none; b=TyPiQgZXT+LzweozsrDPruHcAqQGr4gRBtJ4OcFMWynNTZa8dfmUk9nlMFCO6BsNNla46gatYTTxclZnR2ugA6CnsmhrR2TBaT3lUUavBumLFe2ZRebV0KuIUzPlD/qrXC1Yxu82a0nmKAFIMd+q9clij7stwp7nEc5T9tPqW0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863494; c=relaxed/simple;
	bh=A6304mBG6FGQ/fDwUs64kFcv0me8rAoRLEcQnUU7XNI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCLzCczXQoQqukIHq0voIRxrGG70hIpgBFN5G+mXI1l9VE+IykB4mrCQc+218LRJwrAEb+Z+fI1wixlcebTiAih+fC9bFSskg3c8nVpMVNstrXYX2HS9VULwX9voH3TZTYtr627F/4qArogfp1H7qtK/a1Jrwhhf+z20159ZVzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXMnl04J; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXMnl04J"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d71ae3455aso70331565ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788863493; x=1789468293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qn71u/aHB6JMlwJXjbL0v7QfP4FTsu1/7iGvG4jLTdM=;
        b=SXMnl04Jt7GS4VlhXGFe8jlWIVwqk6OYJAc6J1gIs4m5+/alQ+PV5fTkbhdtVm6EWU
         9ZzXsN5hnZ7SgByvA1E7w2fVwaebQsSTwuCtFAqRS+/E8+LnpvlNs9RGrufL5Jlkv+6C
         y2GELT8u2IPgO5gwVSr9Q4YPvufMnsBZ1QNPvLK8R9E1r33yFcIkXOHT3z+fNZeTk9gb
         aSW5idlOuCsquafCAW/mBktvjoRtRxH1fSojTVMpK4+wgrP9L3R7oo3k5IYTvaRHkCVw
         e7ckUISqv/1ZIzRrScrcJ0ijz1di95V0cDVST/qw150+GwDjtIAAlRUGQDGTheuBnPEX
         h7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863493; x=1789468293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qn71u/aHB6JMlwJXjbL0v7QfP4FTsu1/7iGvG4jLTdM=;
        b=ZgO05cN9SyE7kwJoVb19gOMRjRj57YzuD7Ec01A7wLoqDUPQ3JHJe53j6Qwi4ulRkq
         4FHIqcIimd99+S1Dn7jINsO1jL4MryojZT+aTcdMUJcqLWMqXPcNDWQ9nwNFmT+D30ZY
         epVLNDfdgwmcYQnZnLja9Jp3prveS0eXeFQN7nLargkREUm83znl7AynjNLZIe1Qm6kC
         8cnJcytFcoKCj6CJ8vJ6IdLJUuYsrUz+illPpEmD3VDRGqfBRI1Pg8HR6uPDi56CGOC6
         saon+Zki/9ID3IHy2lTWAju6kzCE3n9nNgOsb4IHKkeSsjPHgPJsvuE+TD/Y2cs4MefS
         rsKw==
X-Forwarded-Encrypted: i=1; AKwUvBxHi8F7nGGbW37uiucGpdTg6PCgbiDLlKyw6Iw9IsqqhTCb1rDsSBESRQEc930aR4ArUUAASuUnJrKr6Ec=@vger.kernel.org
X-Gm-Message-State: AFuF++l2hVyCW28tQjpOlz6AC2xCwd3DS3KycpM3e1IieE4tGZUjbD9a
	dNLG0MNVRhQcOAKh4nankh+HeB/+nYJRn3BE/iWfmv7jDG6gPl4Rco9y
X-Gm-Gg: AYBFou0g2QD/17ATA3OVvYaGd1D7g2fX0WDpc5+89mHoi9i+CFw5iHz2A074/2hgBK5
	m7nN28YskmyJ9H7DbNg6JezJRoBXRtSQdNGpi9vMAE469RpwCuA3jOaq89vjXM4NnqXeFTqYf2o
	hYCF4x4YivHpTq/2Ki98XJeLSB5+1TnMqdzSF0idnx/NGPYufEDBwwgXMBvNiKK8Q7lzqS7PDwF
	+7b/tBMm5+TUuk9y3D0gzXGFmKgx+MDjE3ZVNYstUgrKCJuagdDwe2cSetlRh396MqKWVO3wFSn
	qRXdTtEiVTbBGfJL0Q0cR6UvruqcxFWUJ9OqMJiI9TeVp8Pc9otyxY59i9AfOkGj1JTsoQTw7oh
	9Xdpi0xjgVNed9/+QrVMbiY9TgOQP35K67HVNtM0OxhWZw6+WbsE++n9DSAsJIequUPNMR/M+Vz
	ze+oVmjVRTyt6TwpYty6S376HOeEnyRta/M7W8Nzi3v3/Rdv60pXRRnZGxJF7DVff5gmki8fkYz
	XBYIERyPEBxJ5D7B3J3mwqgsAR18U8jSyOmzVI/oyvgS8F5h2E=
X-Received: by 2002:a17:90b:5344:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39b261e0f14mr42744964a91.15.1788863493014;
        Tue, 08 Sep 2026 03:31:33 -0700 (PDT)
Received: from nxpwireless-Inspiron-14-Plus-7440 (114-25-99-144.dynamic-ip.hinet.net. [114.25.99.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0b2sm55767935ad.28.2026.09.08.03.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:31:32 -0700 (PDT)
From: Jeff Chen <chunfan.chen@gmail.com>
X-Google-Original-From: Jeff Chen <jeff.chen_1@nxp.com>
Date: Tue, 8 Sep 2026 18:31:27 +0800
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 3/3] wifi: nxpwifi: zero the channel
 statistics array
Message-ID: <ap/j/0/eVoq3E1nl@nxpwireless-Inspiron-14-Plus-7440>
References: <20260813082315.1390321-1-lilinmao@kylinos.cn>
 <20260813082315.1390321-4-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813082315.1390321-4-lilinmao@kylinos.cn>

On Thu, Aug 13, 2026 at 04:23:15 PM +0800, Linmao Li wrote:
> adapter->chan_stats comes from vmalloc(), which does not clear the
> memory, and nxpwifi_cfg80211_dump_survey() reads it as soon as user
> space asks for survey data.  For the entries no scan has filled in, a
> non-zero cca_scan_dur passes the validity check and stale bytes are
> reported to user space as noise, time and time_busy.
> 
> Use kcalloc() instead.  The array holds two entries per supported
> channel, small enough not to need vmalloc(), and the two callers change
> to kfree() accordingly.
 
Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>
