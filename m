Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A0B39D6E8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896956; cv=none; b=nW1IW8s7NWay+wP15gnLAbaz8eKaj8BcfvXn0kmzainsmGN84YctoKfs5u+cwchYjnPJ4hCjr3ABeBQgy8aU8gzVU46KutUkxlJ0FpxWRMaHiYMWjH+wGBZp/1bRjzERs7Ua9ZWlefVkEVeHwl3hJafogipnSuf/fSeEQ8TmNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896956; c=relaxed/simple;
	bh=nPSLAw4dDFRQB8/GppYQJplsDn5fKUicYHTIt8XvrIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFzmZlntUxQ4iRRMZiTKr9VVGOFWewK1AU4C+EFyrhxTfJNR8FtWybJ2Xh8V/XTt7wvCs71YhAJWXX7gwvCSGqTdVFFVwobDIW42lvL8/YCFtj9Lv2zdQvG1Se8rQgVA7i7bvxz0QbRX3+WiwUFqQdsXfO9EtWwvIxAiJ9H6ClA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVgOc6cN; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVgOc6cN"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9aea40d799so2830757a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788896951; x=1789501751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nPSLAw4dDFRQB8/GppYQJplsDn5fKUicYHTIt8XvrIg=;
        b=HVgOc6cNeNWYayUiwf8iG10+cAmV50sTPLVqzYwrsbl0eKjaS1AjG1fq3LOaUr80d/
         8GJgLDFCOKwjQatv7nwrO+bVFnbzeIx67kVMKEi+HzcHa7nKPWHHJM5CShG7wJ8d+Zbt
         +cU7xidet0ayXU1Il3sB/eYGui3zKurDcMP4Z+iNvILCjMgJ+42MeSfzTZwYMMrl+If5
         WqJRn3SLVrtQMftjcG/vX4Vpf1+CA8J0a8X/wjkCIlvXky3OQgCHxs6qaTO4ETKde1pj
         nz+aNOAMkeQWj3ZUNQLghY5h0wToSBd2gUo1Nn9YUt40ie7f2so+fuPfF8zw5jlgTTgn
         3yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788896951; x=1789501751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPSLAw4dDFRQB8/GppYQJplsDn5fKUicYHTIt8XvrIg=;
        b=TNCWLaR2m3aDjn6qo1gAS1fiqB53ABtb89MY2l+CftqKLLlL+8LfIW6hTFk45Afq97
         X50K+Qa/9pzddm+KBLfI2Il/nvMS3THrCzSjV2JpXnyStqDgx3TNLWnKH+4H/zTrsI2K
         Mw6UZUkFqPPr9Zsb74/G3R/D8xZz4m+jZGvrqLyuedAypb3pY1LTf/Dp5XE4E4KoY4Bp
         wZn02m2cfbiEhVvANqjfsrGse4DsyYu8YHx6etAJwjiohFlYD5jSvoweKMO06u7RavBY
         QkSLpLXXyUCsa23AQoykpUd3WUc9sImHh95kebUIAgdNpoJAxorq3fSNkRP6DclruVna
         nWAA==
X-Gm-Message-State: AFuF++manFDiJuyVAHUseuOw58xQrMQ5yYdbpRlX+i70HtPeE1K4p0Hs
	cqRcZfC/9HNZ/YpGp1MXzzLtTtAwkiysVDBx2be3FsX5GJl3EkGuE0AR
X-Gm-Gg: AYBFou16T6D/ImPBDBqB9SCS28IH1KEIfNQMQ+E39/IG8hEigUpu/A9PBtd+QdEdR4m
	RPSqT710I+42d7uI7ozpLRHdpEqBE/N0/GYxlLVbFt1glFw3O/d3jZvJAlXOnS5myrwka8a+Czb
	lWLNtYKDhnsSqr52c0wwRbaXhDzg/IW5jgkmqyuvG0otpHv2ttZzuQOQ+MqyQRhEoPDA2+oilFi
	FNFUSjt+Ch8LlhsWqJRPLsKE2OKI+TmxiBZp9yMaU69CbvXvxOnC6yP3zcHooWcTl0rP80kf6un
	9d46dBmpmkLH4vuB/8w+jKlvCAhOJJkg3TtWYK8A0La9YMwbDk6nPzZEMSO5d7ESjQO5ZjRIMqc
	kyLLJ4XLDYQk1H+hmrvkY3xJbLuLIJgMfTuwVGCdr5yOzIHFlDpFYenExcO4sxkqL5AdMFatfgJ
	2/ECQbW/mq0WqwaQOcSLJvm3Igl61P3UjKuCI8dBrtbAoZq9Oi4qCZydLRyHgCskeYHQ==
X-Received: by 2002:a17:90b:4fc5:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39b26190c25mr45385141a91.6.1788896950843;
        Tue, 08 Sep 2026 12:49:10 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:4b36:fe93:5f92:db19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm35534183a91.16.2026.09.08.12.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:49:10 -0700 (PDT)
Date: Wed, 9 Sep 2026 01:18:48 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: david@ixit.cz
Cc: linux-kernel@vger.kernel.org, johan@kernel.org, xujialu@vimux.org,
	bartosz.golaszewski@oss.qualcomm.com, kuba@kernel.org,
	u.kleine-koenig@baylibre.com, skhan@linuxfoundation.org,
	syzkaller-bugs@googlegroups.com, bzhao@marvell.com,
	oe-linux-nfc@lists.linux.dev,
	syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Subject: Re: [PATCH] nfc: nfcmrvl: fix memory leak in nfcmrvl_usb_nci_send()
Message-ID: <aqBmoOA5A5lvWfps@user>
References: <20260830181136.165395-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830181136.165395-1-pavankumaryalagada@gmail.com>

Hi David,

Could you please review this patch when you get a chance?

Thanks,
Pavan
