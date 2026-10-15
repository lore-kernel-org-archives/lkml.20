Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8582243CE56
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093956; cv=none; b=H7p27Nbk06dMlbrtHmgNY9WQYxxY+meyfmi2OAyEwjErLIW5fCt0fPIHieG8FNw200qJ/Vaa5532WJNZku7mQVm4+ZQCgvNem7GKJkED1quvFw/c9anGlvoLSZivUGG3axwkHIhQ635GH77DGb8nqLdBcBhynWqM0o4Q/P1skJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093956; c=relaxed/simple;
	bh=MqKN/CyXnBvEKRa6clswxFGseTzXpp45r4fPRwkp/jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1mF32EqzO1eXhNWG0HknA+Q5Yp7JRaFlmxplaiZX5M4itAgP+G9cbwbt2/p3OMFKXTe9k7eABFIh6m6XZRZzCbE/RShumdtirqEcW/SV09hPBQR+P25j3y1O4ExxnkGByuiYUCNuxIfpkFOCGf3s8n58AHZyYUREbZWyknlSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpa1BMTr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpa1BMTr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49e73611928so2061155e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093954; x=1792698754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbKrV9ZS+HqAjoNdBqIayYDFqYJtJKhvPtbhxsnDTLc=;
        b=mpa1BMTrdNDDaS+9h0GJVDgX/G3nIByT98KDKRPBCEVgA5DMJ+HYpInzKdMAJ0EuvK
         /DLuGL3LIVxi1xgiAU49YKm5izavVGLn+jjhIbXcbhAcJGro16JBovcZZTjRuHfU98Qb
         XnGIhA6EKpmT07ubUDR7+WAXfPP+K6qkhfttmHrk5TN/H+aeJHMAhl9XrpV+2YdMCW3u
         nCVUCZoBjLuZt7mCkcFT3o4lNdyaZqQBmD0ZtA7aq708brJZMLxqAojEk/tSJB3UiSBK
         fgJP1XgVUK9tMn+MTYBvIfT5gw7u2LpE7r1wfs1lxuN9kFjl0cNH4NjLL0BlS2Fl7Z5b
         mmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093954; x=1792698754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbKrV9ZS+HqAjoNdBqIayYDFqYJtJKhvPtbhxsnDTLc=;
        b=uaG5q3dPDtF1rsuG9LBNe+vVai5wl6mdAcUa6ThrybiCR0sYelwXNr2Uzqwb308JCj
         wPJP1QqlVafrxpatL0siENUOs/fgtlikDQAnuKL4R/D8Ao4m6nraJvbNUipay0ePKHXu
         7yGXxQCGBmfIk7wTK9bQq/XkC2ngGRffBx0a8qa2Wvl/NUZDiDnFgFW2aSK/lxLD4mG2
         WyKbbQdrp/8kk9/7JhXEjwpTTsCs/Je2XJdrHLPAHOf5R7+rnlfkVa6wfSwaW/hDnmUE
         YYmnpZ85osAJmNRMC6yR1BrXFKvTTEN0/iPSZWn6ka5D1O6cI3r3L9podupGVLhrEuxD
         fAaw==
X-Forwarded-Encrypted: i=1; AKwUvBzz6ZDw+UpgtW2d600gPJKFcK1Z+LBwBWBZazRSfHjKbcWT4MiV1gOHHUEbtcu6OQZPwgeBkGlMnPnrLAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwlYlqmru1t7FdxpCgd6i5TMj5hwMAxgAAdERZ/Ky0I45OMsIL
	ArQk+I+0j2Ew4ymlHpwYFqezR7AIV9Fc5KTC/rZUZu/9Sp8HAMWin72w
X-Gm-Gg: AYBFou1Gkt0By6HgxYHnJxmoPILveSkB//WyBJWlSsSYVgxNBkybuO90ZXSuuBXQKV/
	QlWlTpMUKOVLk79luNmly/tkEJx04cyaJ9yzdnZJeNcHOjwJCS6sVFeB57mLCG+UHCPG3EU5s1I
	GLQdpIjyQHDBYqvcyxi7xNEp4/PQErSbdLxKqSSuY2vetG7PFcV8zYcSQx5zJrbUPNbvUS/voTB
	mDYXPzBLniu2FWF+rlsIDlgF3LEI2LKwTbKRd0egzQ0MO9Mb7OJo4cCVqW43VXtHAEAO1aOHIAo
	EdN/epSEVjs8kpPncGITt0FMHpGSv3NIWVyvL52+a3oppFZ6zT4aFUtLo5lS++kZUMDHTTpePgp
	w/zOVqhmK3YaFwhrB6heYPFrVJ+gQUHuLPs+8trtNpjl1fnlOVt+Chj6KARES/ZpTob+0Y3UB5X
	5+n+zCj+1iouaA+kKI94PFh61pH8PpIcZtSrK6Pr1RML/yTBo06fy7isiDIUWDNIaJ2p0=
X-Received: by 2002:a05:600c:c0d4:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a1c664db70mr23088045e9.6.1792093953504;
        Thu, 15 Oct 2026 12:52:33 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a1b377sm6156275e9.0.2026.10.15.12.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:52:32 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:52:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>, pavankumaryalagada@gmail.com,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	dennylin0707@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atEu_ZAyNVxyfbMr@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
 <5f06793dbe846865b7d86f656d27caa1c65732b5@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f06793dbe846865b7d86f656d27caa1c65732b5@linux.dev>

Ah.  In staging, patches are merged on a first come first serve basis
so you are free to ignore any patches which are sent after you sent your
deletion patch.  Obviously we're not going to merge fixups to a driver
which has been deleted.  If there are patches in the list that were sent
earlier and haven't been reviewed then reply to those.

The rule here is that it's a good idea to search lore before sending
a patch.
https://lore.kernel.org/all/?q=rtw_generate_ie

regards,
dan carpenter
