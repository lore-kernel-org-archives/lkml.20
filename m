Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348388;
	b=yztvVBBBMBxH7+0dW0aihyxbmqxrk7T0w0YK/tOaenljcRiN3jfjYl9P9IkmqfFWXBIe
	 ItWhNd7SjP9n30XpTASl2Sus2P398b8hXcKHdq+gtHADIvRRSBFGsBowJ8l1yP6hZ5b5e
	 qC4jbweLcq4jHyaCbKpu0P0GknvyoS9RvSbQlIwGIOlTy2XIh/H656FOKYszw2B0gGR+u
	 wrIHWZCQwqshrFPddjGuYSB21MxEXaGdo2wG7nR1HG640bo0s+JtQIWpxGTQBlx9LZRpg
	 voID7/1HZRt+DOVkTI5lAkScl5KmNNl5dhoqqlSVNLKGu02EHMHpZ+peRpBwGADc09A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348388;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=5k5+smRzBG/D3lDOFAkhMGxxPi4SQrohRh0tT4R9GYY=;
	b=pTo8ixTOoGkkQ/Xn24Q0iolrQArJ921Z8dAvoqnWOK+z+zmhpzh0m4NKONRbEKjGvmCV
	 6j+lJ9lcWed+NPE51FaynwDAlflTf+t0YEZoQalIWWhJn0nJRGeXoAe1OBikW6bKIipzP
	 wdEjD5hqBlm+vRmf2hNAB27hvQEAuB1BZnW+7w++g07K9FUyILFax+8NjlV4NZNPz3m5E
	 T6dQV+oZYcUo7VAXZF0dkzsSRiRA1gtcH9JuYb5ztS92htOmhLi6NQDfa/7ZiRJg/0nPz
	 g9CaGA85mCFaQOHTDAem8WNT0PGpauA4Ly2plH6A+WNV9zNLymFKwyhLvUW/jvX6bTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287FA606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070781f63so151310b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348386; x=1793953186;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5k5+smRzBG/D3lDOFAkhMGxxPi4SQrohRh0tT4R9GYY=;
        b=fv7e6DJ2VBQf8gq8hrdERC8k6M7Zpr426fFuENjMVJr/f5caxG+QTLB8h197tdHOGn
         noJs7pm9YP5wOf6Q2MYT4VssUJTha6cKetl8Qk0J8x6ZVeK1i0uXvJcBntAcnwRwDrJv
         ZJD5H69nJ5ZpqoR8pFCVy8bE0d3oHHzj36RKKfiV62G3V4IWwEJYErav+rWHAWHADKWW
         euTWG4Ga+6F1TgAHMRF5fC4oqsgqLfyUI/Rxmz3uKeZ3nL463TzPL74TQJnQiPBdvbfz
         TxXwzgVjmvM01E5LUnmy7EnRjzMXHaHA4eR4nI1V/wKcQfpTjhCEsAW8j953Ixk39HDc
         l4pw==
X-Forwarded-Encrypted: i=1; AKwUvBzV/EWngjRZgi06LwIasbtF+1D5ebICW6RHE1KcsbbAAyVuK2j9tf8beuqZUkAHHR0cqvfIK9ncg+AG7i8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoy/QEF9qZKPHIukCq2KHBXdghFhnmvpwgordafNUFZ25ABfHU
	b2kL7Wkyay+x2449VO9DY0Hv9CAQf6kICx7kLgosAtVDFeJwGhgy8xxE
X-Gm-Gg: AYBFou1+OHlKpawg94pkiO+9u8untmJ78hjdVQyPK4rvEP0dSF89oNtQC/mmoXgDUOV
	84C81U3MTqBB6ZXu3yOgWsGJL9QR9kISnc+OOyw0ZSve2o0fgniHBv+FgQKTXWzMyfdNg2Kkhd+
	otepWyYxLrn2LOUjJrKXPQ60dnYSvOPCMqNHlt4IfOqUOWMa5+cSZQUQ73L+W2RIpF0Hysqjrnk
	rL9aZeZ0y36OLdzQYw3/tXo3o465gL53MUBrVBf60O/KYK4CmAe2O4M9EqOsab1bjjpmcOGj0QW
	uztKgkMHy555fJTs4Jd1U7OFBzyA9u7ouvAZa9s0HGGBUdFuTGvHqdBFfCSA6AlcNNpUGRWNa2x
	ErlG9mOAjXpfh1FBP/jV/aJwgW1u2f5yrSc1cVFY4gUTrMR8cLJ9rDxdtX5GBXNRjb+d1MWCMNa
	JDJRRbZ4ZfIfXSdSl+4Fl06m5RhOHo9vbhrcKlfEGYYPukw5YGZrXfSCYjZqLO7Lg0Ikoe4s4zi
	qLXvkKBjGVczKZ84eQen5FsyOk2yE6mhfCDO8XsmIa+6v9KnAOH6qq/dlRIQJgLWAdsJ3w0nbBY
	IrD0wihZ3rS7f3U8z4Ald/v++0jzYg+MNMXihHzPOIgIEw==
X-Received: by 2002:a05:6a21:7309:b0:3e2:a0a4:8ab2 with SMTP id adf61e73a8af0-3e928aaf470mr1560461637.2.1793348386408;
        Fri, 30 Oct 2026 01:19:46 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096d3827sm417269a12.12.2026.10.30.01.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:19:45 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance.
Date: Fri, 30 Oct 2026 16:19:41 +0800
Message-Id: <20261030081941.652055-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260901120908.14386-4-ingo.rohloff@lauterbach.com>
References: <20260901120908.14386-1-ingo.rohloff@lauterbach.com> <20260901120908.14386-4-ingo.rohloff@lauterbach.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Ingo,

I ran into the same imbalance while carrying a backport of 5eb5c72c72fe in
a 5.10-based product tree, and your analysis matches what I see.

mmgrab() is taken in both ffs_epfile_read_iter() and ffs_epfile_write_iter()
when the request is queued for AIO, but ffs_user_copy_worker() drops the
reference only inside

	if (io_data->read && ret > 0)

so the reference is lost on every completed AIO write, and also on an AIO
read that completes with ret <= 0. Moving mmdrop() out of the block fixes
both cases, and it stays balanced with the mmgrab() in the iter functions.

The released stable trees carry the same code: 6.6.160, 6.12.111, 7.2.y and
rolling-lts (6.18.y) all still have mmdrop() inside the if. 5.10.y and
5.15.y are not affected, they still use the older kthread_use_mm() code
without mmgrab().

It would help to add

	Fixes: 5eb5c72c72fe ("USB: gadget: ffs: fix mm lifetime handling")
	Cc: stable@vger.kernel.org

so the stable trees pick it up; the change itself applies there with only
offset differences.

Reviewed-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Thanks,
Hongyu
