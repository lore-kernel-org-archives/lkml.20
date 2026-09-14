Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA1420897
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388171; cv=none; b=VhH1vG72Lk5mkRVK0VNite+eTmpytc+uPV00TVuvT8vR8TYZyB/IEoZThBH+7EEziyhTRNqXNf9ifqKHGiWFzU0qdfP5Ebbz3bZxVcsIgwMWHRqIV2r+SWOjFgEvIMbijZY6VB7IM6KZc1kbUboVUm9JqoVLiNXPFYGFkgBjrp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388171; c=relaxed/simple;
	bh=Se7NkzKRBbstIWMyWUOVe+AMD6O75GbMwW/t+1YRS3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJZINu6SakYWb5S20FAphctSmbPSGuhQSuU5W0vYqBS/5+3lR6uonOD3TKOSHMuYFiBe3XvPaOFBHjBZMVWTlFaqf3vT7Js0T+1lkYajifXf8ef/MuCmxJHt9rPEa6kze5NPPEu5YBOpxl6mWYQMRoG8+7WDxzHMguyW1M48AIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZSET/PbO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZSET/PbO"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so21526585ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789388169; x=1789992969; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=ZSET/PbO5TaBzhzoc9dtiLUIUco0rqAHcdoA2EHS++og9LJqO3Jnxwu+KwV2tiwoJf
         1TcggeyWwJDEXaHyH47/1DhRIWTGZoPb53hSPlrNisbf1GHiGNgjfo0sOCYnnwg/QprR
         smlqKgHUbvZiZat0RYcKayl07YLwDf08axwkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388169; x=1789992969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=fCHvfwc4Mq0pdS1o5MQTFc1KhXkc3jRXYtQ1U29P1hbzAePOKaDzSmi15fOlQ2QS53
         a1d3Lg1nqfv/zPjNLN5ya7LIOIBCg8wArf4xNDN/2i02lseckT0BxjZknpwSOoXB14oY
         an5CngfU8gjRlpvrTdqkMq0x9eSWnHAQF1ZkfWri54njSwYKZC20v016IHh19urPblAu
         sMFTdKVa0fgtOSq0INdYKsxZsYc1K/oJtWJF4YRMvfz9dbWXhhgZ7T2be7IYdkvxlxDU
         lhkl/YJWZzsp3NJ5Za2ztIg3vU3+5nvHnifHbY2Mat7U6H5jKAkD+pbVzD+GY9t+SMr2
         3Xog==
X-Forwarded-Encrypted: i=1; AKwUvBwn3gKSUAu2dz86yXHQfUmnJexZnXP2blNwdaS8VKtkOLhMJ5VgnI/ApQ5S80V/eVF2n8sEuQad1KZ1nA0=@vger.kernel.org
X-Gm-Message-State: AFuF++kXNiUxdp3eprsKk0iE9aWya+1SxB79VREXeUkWamI3Aw3830Vj
	OcQLbJOVpSFG++TGyL205xYB3SYkQhshbyZD7Qd/FOTMuYXmcnlS4Vx5AVqTjX3Z2hVDUJAJDNl
	CXDEtDA==
X-Gm-Gg: AYBFou0yFuzUIg65vedqjz0Oe6P+/j3isLMeLQZLb1LK6I47jUZMDLnUZQEMVNtBlH/
	ll949GJs0p/6m33zjcdwO2tQ8/cNs/quZWg4KVBoLFw09MsdcNZaWZ5f95nvzvjJrqkAumjeZwM
	Zu/o+9hNT5k4N7sTyZtN6zgtXbQ19Rx3opua2XEtn2F3xIA3H80sL6Gs0hEs6Xju6dfREuUoi0r
	H/PHBjHDMj8le+qH1NCR3AGgyEI9QWXuDFWo329rVEuUTjVFHInKD88XHpy90BEA1Q2E0cMxNrN
	QY91MrpGbf8pOcQ53y6XroB3ucgJgexETKa8PPPX3a1tZFsS1SGZy/WNvNPFSwImdRtfnBzfOZM
	xXIw+9zfcGPeY5Q5mBJ/SkGOwH1/uCYtW9/TQsDqFtxpRXWQnoiKfdCXKUoQ73v1KDqUcUyfSCg
	YYMSmpORoKfIUtNJ7N6YULvBXI7SWKkjiDQSlTDJD22rWhlhZ6C1muPLVoHNmCQUckdq23iz/oV
	T5MuAhaW/Evb0/iH1QjjtaurkiYT3g4y5XyIw==
X-Received: by 2002:a17:902:ce91:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2dd6c5b0008mr47422475ad.5.1789388168600;
        Mon, 14 Sep 2026 05:16:08 -0700 (PDT)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com. [74.125.227.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd69745cb5sm11755635ad.43.2026.09.14.05.16.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:16:08 -0700 (PDT)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so21526465ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:16:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHsM1XnC5p1GCMckzthsZ2WCVcfwalgsrHxwme3RLjd0irgsQuYI5iEA9eODqgvNFKU2EfhcR982TvzY0=@vger.kernel.org
X-Received: by 2002:a05:6820:1f10:b0:6bd:cd33:b885 with SMTP id
 006d021491bc7-6c541b4585amr1031566eaf.42.1789387826624; Mon, 14 Sep 2026
 05:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
In-Reply-To: <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Sep 2026 14:10:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
X-Gm-Features: AcwNN1WrtThLwvG4t-JyEDTnuDjJJzAFO-QYuNebGgduCRp--_WjKNF02oVq8vc
Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ceclan Dumitru <mitrutzceclan@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dumitru, Dan, Ricardo,
>
> On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > Can you check this
> > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > please? If there's a single patch that needs to be modified, I can squash a
> > > patch into that, otherwise v17 it is.
> > >
> >
> > These are the same warns reported by Niklas in V13. Dan fixed them in
> > smatch in devel branch but fix is not in master. Testing with smatch on
> > that branch yields no warnings.
>
> Dan: any plans to merge these things to master some time soon? Or:
>
> Ricardo: could we use devel branch of smatch for some time?

Do you know what patch fixes it? If it is easy to cherry pick I can
add it to our list of smatch patches
https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads

>
> This driver has been waiting to be merged for quite some time so it'd be
> nice to get it to 7.4
>
> >
> > https://lore.kernel.org/all/ai_txjwLPHsSKsJI@stanley.mountain
> > https://repo.or.cz/smatch.git/commit/d12183645a31b737d7fb39cbefa589e34615e8f7
> >
> > v17 is still needed to revert one breaking change introduced in v16 and
> > fix more findings from Sashiko.
>
> Ack.
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
