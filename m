Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347305;
	b=y3bRhL9yI80XL4LeGqusoIEPBFbj83FsZBjlN7yE7AhXTINiNLTpC5w45TasR9sMWC6A
	 8801VasNaRR7X/nHp316MubXVSRW4MiOoudRf5uPPZPdhY59dXTggmeinf1yVphDSveZ8
	 HZhmdG1zsxbF2/qN1Yo2rpUN2wg6kj+JHt86wfStQrKJ8UcNKJmYK9+mB8KH9MoaMwoJM
	 DtUsi7AvzJqO13IASfP3LJIUuRxpna0/N+O17THRSL1lkiASZ1hVjvGbN0zMJfOTbEW23
	 cJquWWaY3JOdfQa9lFNZx49JpceTh0jHFVZdI/zATXogLeO/g6RRv/sKYkbXsG8XrRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=HiU9Iq5r3yO8oH6bAiojsX3njTbymprPTokhTTBOSLg=;
	b=k/azhgR1ClpG1AY64b3pqmtgR7e/FC2wej2XaeJSiZdnYh0uh1FfMkY55HdkUzSHgFH2
	 Mp0YXVXtHm4xWzaPkg8W9uQtXWgCv8bQzW8BjMWHvZkALb7CjKc9D7Ijjbd/EGpBHRL0K
	 Wl7rInwfOg8RRP0x9znxXymmeUSFGt8ORpOtVt7xdX+7IECfjgjrnDpt8wN8jj1i2dSa+
	 4qvwFII2f0ozhcl9jhTZdIB/JXZVv6x+WBZ+7q4bgSQw0UhPEPTLvSifiy7Jg4IE2uHMv
	 inJJix8hFzVstnAbZgVAh1OF07+CwRMaZkq6hjopEAKrNdYxDDH0aIpcYx182zTU8Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="l7A40H/3";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0850A606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0850A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7A40H/3
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so790113eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347304; x=1793952104; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HiU9Iq5r3yO8oH6bAiojsX3njTbymprPTokhTTBOSLg=;
        b=l7A40H/3mw4H8PJvOVyEBo+icUvOSFRiRii1OOeBadfhHqOm4hZr9z0JcggwX2eC1S
         piuUTA5k7Qpu2WMjzqCdOGBP7+xSpKeME13i8ZfWsKi467a9r5IP8MYfJhfLiRmXy6Bn
         lvqrNiC7+W4JPuk16QRc67Zg4veU8hWZVf8IvlcNhl6pnlHru46ThUa86vvcRcpqDciH
         ZLALuf91pCVZzSbq4Svq8rRlzpkTJSr4cka5vh2uHahnP9iIyIdC5XGtJUTyB7m5ycWB
         qfW1T8A8BCxLsvbfuAZixgKA5qP1mJ4wYJgh/TgcxQhSxlGlmdVXsQhuLoMn57YNsUCA
         gFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347304; x=1793952104;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HiU9Iq5r3yO8oH6bAiojsX3njTbymprPTokhTTBOSLg=;
        b=ycVZziSvakbT8m/hytjk/x9GVhu8bHdmk53kXR5EK8ftBBP2bL2zvj7K8sV6+MndOQ
         H6aJt1Lj2RI9R2mFTh0+UEmC5m/iJ9rQZQKR3s8TpwuWXdhH8LphwvjRAFdq1lmQ48bC
         PR6SGVjk7nwepdU22RGR++7T9I9ak50fsgFc33HP+nBPpOB0DW22I9DzofD9GxhJmIRT
         cqLnSitGbSfplZPLzgdiNuF74VYwISfOoo8SJMc75tTjHugPt6fo2GW30g1s31ANd1lr
         J580LVgbmhAj0rZ68QWLUncof2uBT9xhL3SCK4UUv62lZc3I2tzc2UeP/geSRYd4N6Xt
         9K8A==
X-Forwarded-Encrypted: i=1; AKwUvBw8C81Ocl+ky3I2qHqju/OvxWKtj/7PF6zUDx0oQNXSF+Y/ipsi0JyIML8pUbyCMwrznM4lJ1FxMekbN8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkXDk6OZxnJ2KNvsZphshpcahQyGD36rQZZHYfBDFjZ9X9YpP3
	+ITHYJegEnK2hcxRBsj6jtljtqDSjgjxspPgKKhVck8MYz5kuSTTYwP8
X-Gm-Gg: AYBFou0ASvNa4SNvs0UXiRgPrDT73EmVZAxutsoGPW2zNujifOurEqX6iaUHdS/2H6+
	3ffp7CLggqOpPlUySOAYFtAvwvm6aiayATLJqZXNxAA9kH5LUjshjzAioI31jqLtWiVsMCbkRps
	QMltjQXsZXu1HiYuhkDCifkeqxomN2KS5/gegeNcL2UCunXuhMC0f91YCTiewOkF0rFSxs87M/z
	7hCbW/4PM8DzlOkDWoWV0PIg5++sFIcSdTYtHTWyElr1eGVPPdF3BNOxdQ4vCSl4EkNgFDQjwd5
	3A6rWSp8/xd8NtDCF1Unzqs234RgTvOaSEwOebnRLSe8LBgxsahckl0F6Ms1GLgOuwgW9sW4rYS
	eNCWhdbIXfR4v7SJwhYPf/Sths99+iPYQ6DGg7Z3xGGMULsyk7otpoZFjB1BNPogGPKxj0vk1OB
	k7DLFFrrRMtp60zp3EJj/GmMo5wNBEgXB7C7etNEHOq6Op82RAyDF5oqjrMaxRbUck7OYgEvifZ
	NYekidF29ppusdfB4FKHEOJMJcs/mxQ04eHRRkhxcwTAq2slKZAvD3rD3cNLO1FA0OP54ogE0O1
	JlJlEZJDMPm1E9vHDh3R5dg37KN4k33zmz9LMCU42evcu6Z+lxYqRmc=
X-Received: by 2002:a05:7301:e118:b0:36a:1cbc:108e with SMTP id 5a478bee46e88-36a423f84femr2568934eec.31.1793347304094;
        Fri, 30 Oct 2026 01:01:44 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm4883097eec.28.2026.10.30.01.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:01:43 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Filipe Manana <fdmanana@kernel.org>
Cc: David Sterba <dsterba@suse.com>,
    Chris Mason <mason@kernel.org>,
    linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: reject zero num_stripes in the system chunk array
In-Reply-To:
 <CAL3q7H6tz-YXxtTk3MVm7cLAQh1coBAkcF7KkH+GUwZnznnFrQ@mail.gmail.com>
References: <179328314071.648427.12527832319954042748@gmail.com>           
 <CAL3q7H6tz-YXxtTk3MVm7cLAQh1coBAkcF7KkH+GUwZnznnFrQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Fri, 30 Oct 2026 01:01:37 -0700
Message-ID: <179334729777.2353588.17578956930431099360@gmail.com>

Hi Filipe,

Thanks for the review.  I'll simplify the comment as you suggested and
drop the "represent"/"remapped" wording.

Thanks,
Cheng Yongkang
