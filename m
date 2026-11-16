Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811435;
	b=nPxTLm8+CzEBKl28YUCinAyD29o4yviSKBA7CxUUeEmKp4oJqddG9JxL06GFbPb5Sw8m
	 4OmQpj1xIX5AMW3+s2dA7Nq8sbioTrTnrNJ1CtmG/Ok9B0Lk36xkanxdmc1a4unz0k8nM
	 U3KT6AtWdmEy3XvdWyoszrU2p8/cilHoOho+fZJFR4e5fmifzlv8gVLlg9yUc+Ua6cLmg
	 A85XyCx6eBkCIS8W2fIB4dzJ46NiuBS8qBT8B0ivWdeCXsKUjRAwZ7F7QHr3Kg+5s5GI4
	 AZzfSz/kul+ksMVJjaazi3z15pg9pDbTJCjIcRLCzEUUI4wuuEUj9DMMSh9u4TEn83w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g2W4hNeP0M6NWf4FvGzvDbkgId7WUHaeI44/sLdESzs=;
	b=5G3flK9vAtIY7VENhgw3zucvKDe0q8qmGkJrft4zUhnH32EKgGylKSYhAoGIon8vpbz5
	 cxty4vaKvYeweheqvsi+UYX+5YSbpFKJTE+r8nvBAcLG00J//7Oti4FcY4Hd8NbArYiLn
	 vgCYIF0+jf0ZNtNFKXk7NwHJxOdc0C9F+O4Zye8jT+ogTMtsmziBreO19e22nMHE2H9XP
	 7s6M5Wh7n3E2zo0KeHe25d4//7+WBmf+Do1rbMLlz7ecuJcXHJqY3u1uF5iOWkHrc3gLW
	 QoOYPhNTXdeY5tU9PJKUrIFWoQky7cVyacXTaZ/800uKoBeeER6NETZj5MKvelR4g9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DrGvFavz;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847D1606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DrGvFavz
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1389654a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1794811434; x=1795416234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2W4hNeP0M6NWf4FvGzvDbkgId7WUHaeI44/sLdESzs=;
        b=DrGvFavzN1FUDDGPxlZW0KLW4q4iucbgYTmif21v6YEMc7Hdkc5aLuwQLK1goOwbYC
         D5Fr9RrM/3QuBJL0djVaATxONXk3C+PT1A15P6dalLmqfWs9y3YdJsWZHMSzIJ7y8SOa
         r3JpIGJI8OOnvVEixf0nSeBVXbpiOZs9ejwWe3sO9bhv1wuZJ9ctztPgQIXiDDuHTOYa
         qL0fasGENXR9sC5/j/IkZyrfLz+RUGojXAkxtNzpTITxDFpApEcuuBZB7YLJFHSkltdv
         Tj7t1v18weRzfTYttWvg2URENaOflGDtbBzroFfT4infgZtJR7CVxe5WeNyQ8EXs8yKn
         epLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811434; x=1795416234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2W4hNeP0M6NWf4FvGzvDbkgId7WUHaeI44/sLdESzs=;
        b=x2CTD0wnZuLmiVsOXcw77M7znXRgFrauGl3D9Dk1A5wyysuCCDunX/P2gRYVt7dEL+
         GtfvVI/iYzNUIopk5YdYnYXk0MtkxjDOllRIFimgyK5pKN01fvOXmoQoOs+ZjMcMN8Ct
         HUVBZhzo0B9JEMML0eycWK0O6hILLrXyC1YGJOoW3hGZovSSxa4Nrt9LPntq79lrApvb
         xuuOGWMFU6M8R4e6EH8XCjAQcJyANyZZgyTnWWnYtY0EF0dGjXYrAz1G1ARAIw1dcTFj
         j+HfMfy6HVePve1h6EC90ZSsotPHpvgeHJ9/zXQFz0K0zh7x/cRMXfRtUreDzqDTPkpM
         E1hA==
X-Forwarded-Encrypted: i=1; AL+hErH3rdZhQJeTC9XrBvhRoN6MsRn7tZc3JorFh+eqM5WUMTK7mHusECFblpUKW5GbOmF6zdHjCYsbjWUE6YA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1/8u56U56rDje/qvZj3lnRlTBRBCNc43kSi/MpZH2Ej2OFbjS
	fMlOCtVFwfO2R3ds5AuIqJjfA2vwvyumz8eshaL/kaVBDjVZ20PdRA+PJ0/uLnvXiPc24C/MOkF
	2VE19
X-Gm-Gg: AZFdTZcMAIzJEUQ4Jr90iQIQnCtqRmaiDrtlP0RQDf+4/qstofjF+qZQMqMiRDCQcmL
	+cLH0O85cj1rCYUlrIual3V2G2+QzmeYvaaKluCeidx02G1rj7MsdOfLoGZf3KrY/nGOaN8c8kr
	ftY0ChLXv4nfqergZBs67NFXrLs4LD5OfVmVSWhsWcfQ+a6K4hwHGCFSFwf7k3XpCOfIi+e4XoE
	7dP5hPi7oX5GScKMXwPqal1vUnFT51y3oaKOsicBjEygl0se/RJKQepaSOOOTpWxqupXK5wvbZs
	oYhYvPY9BE9ZlGGzG6jjT+8TLZX99QWqSIwSWj8Yq+EY84X01YXeo/pDc3F3Nx179Zkxu7o5OPU
	kZqsHU1dM0X0DV+5/TaxMzNcOjEw7N3bRhSA3jL6pnvaKNd5qsqfsfJktTjSqj10CkV5goxtStn
	pyCW3wFaJ0zXl51CoEBXz2ZLcV9tshCQHZJJ4JkzMbsRdL+/jyFBjjGi5PfsJh0Wky8BTorIjfg
	8qv04feG1NncjulLtZcYX7LwqegvJJPwS8NtxfBwYg95aiEY4gzXBOoR3FtIdKIkzpJRDJmBBLH
	7yhF7cG61ksKpJRteLQxxpC3qWBa8+M5CyQFru5vnjHU4fmI/OMJhii9s8uU2997QpBO7xvpsgj
	aOoQEpYL3K0y+Gg==
X-Received: by 2002:a17:90b:528c:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3b1b0a4de36mr8224955a91.50.1794811433792;
        Sun, 15 Nov 2026 22:43:53 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm20841677a91.7.2026.11.15.22.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:43:53 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: "William A. Kennington III" <william@wkennington.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: skip companion handoff when no companion exists
Date: Mon, 16 Nov 2026 06:43:51 +0000
Message-ID: <20261116064351.1038057-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261115075359.39ec8f71.michal.pecio@gmail.com>
References: <20261114051653.1353346-1-william@wkennington.com> <20261115075359.39ec8f71.michal.pecio@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Nov 15, 2026 at 07:53:59AM +0100, Michal Pecio wrote:
> That's for Alan to decide, but it seems that whenever you use
> ehci->no_companion, you always add "|| ehci_is_TD(ehci)", and this
> is unlikely to change since HCs with TT don't need companions.
>
> So ehci_is_TDI() together with its associated comment could be
> moved to ehci_has_companion(). Then you no longer need those funny
> comments like "without companion there is no companion" and the
> code becomes somewhat simpler too.

Seems reasonable, let me just send out a v2.
