Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA16C1DF748
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690811; cv=pass; b=hkU5cCcO54QIanftlz/fY8F1BslpRyh10oc7XuTVfyd573D8T8ceDkD//y8AuHJMDvQiViYfpaOjd3FTVli0p0XR8HcYb7F5pmVsAfkhovUrGLd6N8uEhvhDRMQStt0omLIatKFoC7Gd9TgXlyPGk5XweKUoaG35IBMm74bjTNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690811; c=relaxed/simple;
	bh=rwBdK1wXdhnqC5rqC+CqcOIhT5t7NUEXcdV+4Bz8D78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cf30UJFuxU1O7mJnTzcHE5FH/mKes2a84HnL4ZzhAl/cvqrOApJN/XTn7/xLjwFigy7xLTYgTgNTDvtbKrhV2u+recfDqO7mh9Ui7dQZ9fh9hqxrFHvAF+KTfvrbB1B66Xu3QQsBykRHSGaxKD8M0cDKDLTvn018EiuiarxU5P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHJXXwmE; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHJXXwmE"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so91150f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789690808; cv=none;
        d=google.com; s=arc-20260327;
        b=rELUn/EEqn11mfGg6TSn2aw53jBwdJ6nuTzIKt93l3kJ0cB6kAgCPYFriZ47FKOj9V
         rg8Hx/v53g7+BdK9UII2zGjO0JBPIO+9jlFrCvxFKnoJyyyfJFsazHHM0ReJwXowq/Tx
         2c/JOMbS5VJy5GRVJdiz2loyboeCg/LW+OQRrd13AMrlUnqRuELYRWZJL1D/iiO3qMyH
         O3zpW+jffCcyMenmggE88Kw9vKUZw0851fxqHXS/JVw3mlFDMjaMFQ5MEEEFDcumiVTW
         RQTg60ZuHl6xG/ManEZKiFIPKvTB4Q0IyjM6q/ngI0QOIBfCkpyv+QzhVT9pTwo+X8+U
         D1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rwBdK1wXdhnqC5rqC+CqcOIhT5t7NUEXcdV+4Bz8D78=;
        fh=GgtnfHLF7ms52M6LA4c1Y1CeUOGtAUgOvnb1+7Z3Kb8=;
        b=PI4Pf68eu/UN5A1bfG2H9dOdZyt8e6nn8TQ10ZaTJ8jRo9rGpNK2e41ww9ac3zpKl8
         inZ7/6FwcspqbbH6Y2Ue2i87okQ37kZB2HkHjcCvaielBaAz9U4IKCRZKeveyu5oHpj1
         Z2bYQF6Lc9PORb5hfIJypUNkk3kRrEXbSxPIMTVtw5Zg5i+uQs+h8YqqTW8Wvyp+rglo
         UNUTdfXT8kRaEqLpRJ2TyG6YXbvfdYCcHLQtcVRRP7cs+pWd5Dmb85CWdTTf4KPfl0Uq
         XTsmT9NTe9FDJf3ZWoS0Wvx+bQnC/poyCBOq1S07rZeVL159+mgCyFKFxRie/1+TTngA
         gtsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789690808; x=1790295608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rwBdK1wXdhnqC5rqC+CqcOIhT5t7NUEXcdV+4Bz8D78=;
        b=QHJXXwmEVofqvpJFzCDAO8Fe2JdZycmhQNCQp5EtwnMV7zR2USjMhYZgg85MsBe90G
         686D6oae6SJQ29H3tH+nnfViKYAvTxd7qqvGGV77vG643cy4EgFKUpfqOpW0D4XZ0n1k
         fVctWv8K50/yVfWDH+81FnUrxhrxXVHDezAKkx4rEa1QxUi1sLyneuTeejy2mA9vuMYA
         1d2tpe4vPdRgq763ZOTqXz6xFYHHpB9nhKh4ONoj05bxqTC8uT1zGkICP7AjUo94JfEY
         John9kd0jC9PCiRiRHKKOx4fNMF3LHHyttCJ+vNdLBpklPWGFtzJkLMwZ/tjHxZjEmxM
         dpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690808; x=1790295608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwBdK1wXdhnqC5rqC+CqcOIhT5t7NUEXcdV+4Bz8D78=;
        b=QAPBen0cKC628BZqM29BhKl8acAnC5TMJ3bMgHi0L6O/so3RWhAdkH9YCjCXzrqx+d
         IXzw16qRmOpYIfvkdxIoBG09cebQb+VyjonhZO8gC/h2e2RGTeUCN9e0OMZMZKNs8UY1
         HZIMHfqaUJE6YgujUedLz01xGKXZmvOrPwljCSpYiM6NdI3qGlZTpwE4RrPNYFnaDdFw
         3qWUo8/zs0vnp1pwzaZhJdUgnMIeV+BwlPijzaKdz6VjkeFubyHUIJzN6OScPkc9QqW5
         ecTdpohBfUwc6Ixv7iAP61/zjNV5b9SaECcz0InRUc3pMLT3vogYQ2wZn31ADrxvjr9n
         ZIkw==
X-Forwarded-Encrypted: i=1; AKwUvBzgvuupBe1FDQ5k9D8+gsQ+1DSrV9kvdKfC+DRs0Rbagsqv/4HIcCdV5ZMndGWuADa3GvMa5oC8ZCZ58ro=@vger.kernel.org
X-Gm-Message-State: AFuF++lMfQU/eRRspSQmE7B/aL9euDC4E1LSeexIkzUQk4aJyEsFscFj
	ELiRMrlj3+mfTIW9mGp8CbFXodMWweCMY2ZKj0vTx3JL6SHer19+jCupb5Bar+HdCzhXGysOkIK
	mJm2rx0SSzNJZfDt7KWXZch6LtNRSTgE=
X-Gm-Gg: AYBFou15fwKFt4SOQkqwXLd1EYanmuq/lG+dqddVr4Pdign3shUBLt2tvrN2lVSAvLW
	4VQRZTDZnwLiJth5Nceue6F0EOB/z2F5NKNT/Xs0ECRcTMiWFeu+XAx9g3uwqe8UUrgGqBh2qQM
	RKpEXBC/fYsaaOFe5cyu/I5BJiRTm5pmOlFfw5cNWzbTpT6pr3kNFjz7QWNVzCBhwZZHDEv4q8R
	JNcAagRESG9jpVp96pDGi+vHcJqB/Z1FycLmJIIyMxWbxVVBn4mTytiKd32M8jZQSfBmAEc8ToZ
	QS0PiZOI2o7sKXlEFhiuPdczX1xmbKRAhf34d8hY0wtfAdYf9nbOzX1BS02Yta6YFvNzjj7GRIn
	GtTa9lf5A3jw=
X-Received: by 2002:a5d:5f86:0:b0:487:a9f:4fa5 with SMTP id
 ffacd0b85a97d-4871e20f7camr1383464f8f.4.1789690807767; Thu, 17 Sep 2026
 17:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn> <CAKEwX=PEEkYiNRaVhCuM4E6mxB9huPKfkDa4m62VMTzedg1oYw@mail.gmail.com>
In-Reply-To: <CAKEwX=PEEkYiNRaVhCuM4E6mxB9huPKfkDa4m62VMTzedg1oYw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 17 Sep 2026 17:19:56 -0700
X-Gm-Features: AcwNN1WwGWSKeL4q_hpowjvaJHMaKB7C_L0Qi5i5SPZVgY5rRA1xq7ll_vyvmyo
Message-ID: <CAKEwX=Nuc1JyP32pXAScyOihL4nPz6qLpma9ZB6hb5Uxzs6XwA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 5:13=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> The other way you can get around it is checking if the folio being
> reclaimed belongs to a cgroup that allows for disk swap or zswap, and
> bypass xswap/vswap if so. But that brings me to my next point: since

s/if so/if the cgroup does not allow for zswap

(in case it was confusing).
