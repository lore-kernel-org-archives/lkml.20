Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389297;
	b=S5+lnremNLz49z5HWAy6w6uFwLicsC8tUd6qHudKr5sk8Xow0gwKqlO8eedxQWFNIXud
	 kASIgGia6Hu09e5zhcgHz34w98VYv97STxtfRcWzEloYuzk64X6nx9y/dsGAxvDfmHtur
	 rCX7DzTU7AH2H3cuDs7dFG0c/lOFp45LRKA3MGohj8mtsXB9eXGIBMBsd6lgcb2LB8qAO
	 hD7ct3eDzBkdRyodpfeYulg/JgwiSfIoOQB31r+43fi6ozngvwtuIIJUpCCCooLLoWuwX
	 r3Y07sKlhy88GCVxgb1uBbjlPyUx+VgtQhYW/qDrnSIJXRm+x3spFohCivB0wx36fng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Qy2W2pvIFm5oV+ggmretEdYl4r1/nuoo7/fZPnbNE0I=;
	b=YK0UsIWw8FeaHE+9JekyvkljF1cV1dU968QeZC+5cXzjhXTx3X4QH5NxGpNlewlBfKUE
	 yH6prLeTeVm+mOGTyCg9wCELLM1JJDks3/F5zShDFTmQCI1pZ9Z4dwdrS97nW00lo+lVl
	 sJ3Cz/KOjPTPFKOvpDCwXExZlCtNOv0ziGk3qXSmIBIMgh8TfA2edESjMcJNAZmJP4EMS
	 FAgRLv4R1LEjDw8/nEqdMd/kii4usmB6u5Y+qhHEo6k9WSIAangxlALQIcPLcjyifiAkL
	 IoRAjPJoD2mbEG/PPOWErgf97iUhPyOKaw0l3nxBQDPVuDPBNRD1JWYQ33SZpdcJIEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kV71Ije8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED41606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kV71Ije8
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be58ad9600so3240e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794389295; cv=none;
        d=google.com; s=arc-20260327;
        b=QVojSVB4pBM8SnNEns7pmuMlwonflnxyA8pOWUrMiCoY7ZofhwvbokIoimEIcXnJDY
         CtKF0JddjgGkI3mmMi2Qi5Ki4Gq+cgtlCl0G0O8QqNp8w7G2fcDog3TuiLl5Bz5tl5eX
         h4OUzwzH7X3HkoOyzwj5ixvS2OnskCecaxNkxc0cejnWy2aQD2QlDGQck4Ipj07AuMeY
         gkc7tI0olrU0FefKNPwV6xfHakqLIG4/mR5muMGtwHP+ZrY6C8nyzEwoHeIgJlSa2AlJ
         u8EFOG3jgwLJo6SonVf+TX+6oHty0vcL7+SVJYx6mqbqejlkUlGHjVPyluoVZ2AtdM56
         LqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Qy2W2pvIFm5oV+ggmretEdYl4r1/nuoo7/fZPnbNE0I=;
        fh=Xmlwyg7n0ikPwDZWDeUnN30+kwZt7jcE1KHj6y230wg=;
        b=kR/ETYexUZ/v4LXOYOSbeCQ9b6Kh3ei0FAY0UwtPzXgUpX5Eghbvt8m/Gipxscpvim
         8VpcrvFpNyINgiOaNaE3xZx8KcN8B9BRRYiSb91zvDeu5yFprBbF+6sa1Yxaa3E8ERBy
         XEEhEhPwuo0BpkLGgLEvFKDSmyD+nN/vlo8fKaXBTDHWoPDh3gy4o51XKrsdtJ4swZUi
         hkYb6GGj8a2oTdI+NT9RJgRSZ/4wP0KGAQxF4VrmFQfmGliYnbVwTiuYtA+WuZ2+BH0k
         Egi7+DESaGbjA8AwRophsbdzCh8AvoEBhpDuatE+F0gvQWwMxK/MoIAeS2RA/BurAThe
         7E1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794389295; x=1794994095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy2W2pvIFm5oV+ggmretEdYl4r1/nuoo7/fZPnbNE0I=;
        b=kV71Ije8U0Br4BETc89FcF6rlO+xwDPFZ6fMVjLdOXVxHY7uZU67Z7Go19uLfbOI3i
         HtUDIiEZtfT+a4CNV7cHNxMZWVpad2F1f/BmFdcxTyHJqQ9rhOwtCHt/H3Y+UdL+R85J
         lbJWEKQAs/fJOwQmd9qTXQ6dmmRH+pfHtbofkEkeuSlKWD8vDnLpq5qEOJf7qHwXVvs6
         WRbQd/H85NKuABa0huqm4rH6MLvwdBbAOnYNadL4eLGJEIAgi829Zk2t0qMp9qvs8QO7
         PJWFUuUNp9STnTltxBLJVYE/SAWEQ2zfgXYiEM8aXck42c3H7A8+CN/kp1t1yT0aI2sn
         bXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389295; x=1794994095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qy2W2pvIFm5oV+ggmretEdYl4r1/nuoo7/fZPnbNE0I=;
        b=EF+IuMWFsvGeBJ4GIANGyBaRMxBXJsePNmrvLbrt8ozmzSyYxm/7+zBridzgQtVqWh
         gccqC5dj4MSTM6dVh2fuhAp5x4YXgCEvav6iqDZ+i6LQKKwyn/P/hiOHml6rWW0y8+gW
         4HegP4n4XdddaHYg2L9WXb38DW0B/t47Z37lxknSq26d2WIXvCdT/6baVZwZDXMGmVgN
         KN9/+8nO4sRI3jC20W81hm3U6GRVUbRGs9ld6YbkxVJn35Px6cg2jxiZBXN4SgJI/vsO
         OWTIHCza+QyWY7ba6zhm+wCZpazzHFhmJjWAhZ9ZYHb42OhUtwogOgVg28Kd+8p2QQeh
         8+LQ==
X-Forwarded-Encrypted: i=1; AL+hErHhz7jMAnX0G5cxwVCb5tQk+KlMbq97Ori6KJSrzm41Ai5nNhB1YxD8+rn5FOU3hFYV/1u49wxNS14Bmu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7eOWHbYGUaA9ouhnUBeZMHpPA3gMtRl7djU2EesU99WV/Fn/+
	1XmVTB8fgqXGT50/gZk7HY55BLTcq2X+mbr+yXnv+NEML09CTXL4xpEaChSU7qrTHCX7IPErJxK
	4vjr5KNOr5Q9VCrsr1//Yta9Fh8QH/EkPOkfRspJZ
X-Gm-Gg: AYBFou1HTO4uKUTZLFjxuNYVypFB3TJB5e8RVFbem8MVit7+w2R/bdzxOzNBIooa20l
	ib889YQv9RR5RetpEtb//3bimYdIA+ymvzBbzkkS+i9heZnzahv36LxJSnhUX/DtHFaNSjz9uXI
	NozDLLp0275jdQeDkgzUlRK9BupQVtczg3U5XinaaEuA8usdfZF2hbskrYfe9AHzyEgKII815V6
	8kyu8NCT5AK1bQrlKjVx81MbzkFuuHpBsU3jix59Gn7ZRLlO8ZtuhO8sCFkkUJBQrYiQlxJP3Yp
	jbM2tp1lzL+j/cGWO3zYPx7KPUCqKb9p/jhC98JNKrbxB/7MTZ2KzS69/WuQGPaSnEUklh4OFd1
	BqjPhkmpi9HVx2mbe4FO/JnpiRxlF+FW+cSQ6yqwDT9xZC+wiA+7LtdCpIb7qD94DHX8eDSPhJB
	t71Z7/To7R9Vlebps/159JvBBB0FI=
X-Received: by 2002:a05:6512:3054:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5c15d3f5907mr122518e87.5.1794389294930; Wed, 11 Nov 2026
 01:28:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106120221.347309-1-fuad.tabba@linux.dev>
In-Reply-To: <20261106120221.347309-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Nov 2026 09:27:38 +0000
X-Gm-Features: AclHuK92SXm3ynhwC8hX4lWiOmRu9vrW6jGTgAJ483QcpwVLwRbURSz1gBkXer8
Message-ID: <CA+EHjTxFQ7GfTKhT1D5SYG6wyfqvifS-tNY_dSb1qWLcaR31UQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v3-its: Fix how zeroed table pages reach
 the GIC
To: maz@kernel.org, tglx@kernel.org
Cc: radu@rendec.net, lpieralisi@kernel.org, steven.price@arm.com, 
	suzuki.poulose@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,

I'll respin this series and the ITT pool fixes as one [1], so please
ignore this one.

Cheers,
/fuad

[1] https://lore.kernel.org/all/86se1720q9.wl-maz@kernel.org/
