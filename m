Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F99B4F4CFC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109774; cv=pass; b=lBOMtL686uaERvO9px+LpNaH8aEQQ8tlDVhlqS8MWyZO4lBF5i3h68zTvWBlpL09I/VzI5u4SvlOViBL8+fT3BoUiVj5fVMq+G6vu3dfK4Pd9A2RYxIquDgpHD9mzT1ZtQhvYHSNcj7G3gWtLTlXgkl7+dHKz0VX/EFN1sYjBDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109774; c=relaxed/simple;
	bh=clPJAFG+iMbMZ/1lfY4k/HPrMduY365VF1hYyyaPXaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FRa3p5jyFREMadPJ4ElfJG6vMh3sEzIpbUhGCZK9I4kCeM619eMCDqVBeTAmsmcp0NWxmcyrCPfbYbeZC5qBW+shLWgt44r4fOKQl1lboOSIr0uwXTScorgR1iIz8BMNrpU7ZisxwYEIj/GVu9fk+zGfl5AYcVUpYP4JJMvcZro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inf/3MjU; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inf/3MjU"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a8568e9so181357b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790109766; cv=none;
        d=google.com; s=arc-20260327;
        b=gTEbwlWBHa5L7lvN8/zPpprSWR+rz9ndsvTokSlV4E+xUsSu3i4e4OJPjldyFLtUpb
         RqnGiEZKL8LlVTVuEDRTDqjPpERCLQNjzhg5T5SwSgDotFoVBYLvZyRnXO9lRw2VhBmw
         Rx2HtCc6EPVdzX39EwdvIqDmRpo5S0ShiVXf5IVJE24lf/48OcplVsTmYVIAAqcedjb/
         ihd7OFofQhHH1JoNrtuDtR3LSwH9Li4EwUC+67KROGbZ/fJEb7L6+ElPaUOv450hiR+v
         Hmgp0rLLKpuQ7EpeB+MCyDKYK7LzjeoWiV14FFKQrghgfpNqIY0evCLDNsQRdzHzV+3c
         R2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bTYsFeY7zUNSIttKIg2dRq22CcfMNDzj+vWdXla++ts=;
        fh=LTBb56HNijxgwoWSiO0Hgsp7HK+TJgYSQIuqaIFGL+I=;
        b=esu0BhtQJoOyMpntBeL33bWuFCLcb1W5LK/KNYbQPwkWiwNJGoYN7Hqc7ozb9zLk8w
         ss4oP+krZwhIp96XKPL1H8hhyyEakYw0esVfverYZ4379xT5pcWDQ1ds4T57rd27dU3u
         CMZ/XL6ljHHAhN9hYEC9d0whjLX9d52ZBCw04EinlWoqDLvNLwL+39ktnokO9mFVqavl
         9Ni6Y4PgPRjoLDmRmLQhacNT8iTZ3ft89PJCgWIxsCuJYZDHF8Qt3l3Udp4Bq6zHS3gO
         /5eDmLxFh4m7pn/pMn+sOSe9h91KNNCRLUO5hAHdUeHqSjUFBLs2yllWQzoqqqeQsT7q
         7BCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109766; x=1790714566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTYsFeY7zUNSIttKIg2dRq22CcfMNDzj+vWdXla++ts=;
        b=inf/3MjU3tYDi+cWapNhF1EoZf/mH0nOYitrbEjpBEGiLHx5FWQOsL1le8T6YHHUJG
         NF4lDKYrgZjYl0Vejgf3crLJqwrnFudfYtvfu2ISayISMrFFkdk6McmFT/ess3qZS64K
         hioG6XKtifIwiOh97uy/s7wXJKrK3/thMqhtEZ0emawrDkhdO2Poz0mSleYbuXYOmbU6
         T4IIhE2xjWDyGlIuzQZae2cW8ArS87lOk3olvK/g2a4zvoTpJLOhRfNKFxi4DWEmiyXn
         saHU6e3nJ1q57XLC299hEtsrrz4MYzqDN2t4JwTJdN9C2FVoSt1wpKjwhIzIt/AlrzrB
         3+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109766; x=1790714566;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTYsFeY7zUNSIttKIg2dRq22CcfMNDzj+vWdXla++ts=;
        b=dNIJCqO3MpaIH+8FbhZ4Cms8kfBsikyWKAt2Sp5T0w9+sMDYKFhz1UmymOUgGeQscu
         uzfsTbKUjACtm04stO84S60V2xDhfItvnApfeUS6CW5XnxVLUdKCqmeq0YfdLB2Mr4k1
         hHwo82ztlPnKkVglsKlcRTZgM9zrcSr/PL0yQ9PWfVOLKhU7m9OWEJCF3I0QTIotATSH
         mBl+84KTKZ7ZdDknMHE/3ythPvqiexnKxB4UpfwQVRD5AsNH42Il2MzhcTKcxdsLqQML
         QPpeC3ZhBL2c3RIY6fdSh+66mtIqOOCWtrrd4DfpwirvBU9bYPhb8fQ7vstvDA2w/SGL
         350g==
X-Forwarded-Encrypted: i=1; AKwUvBzhCGBI2szhXOC9dbCqizLAE8vjQh0jbVuCgO5ghCCv27hPfoYkcs09QfKHfqtEridVr0QAD+y89SLmWWs=@vger.kernel.org
X-Gm-Message-State: AFuF++nyfYWiHZZ3yj9Ri4sPGdueapEdCWpidWmVv9RpB3yhBA3IRTsA
	VH6jRbnSFy3drcZ4/z7+km4LmQmiCTQ5HIowuHDJBnDfJ0OSIsbppw6PLjUFPL+vq0lZpkim47S
	YlqpkhrpW9CViT+ZrkohcBsTWlHi7Qt0=
X-Gm-Gg: AYBFou3y87iNd8vwC1wiXx8rl95dP9eHVt5z5fYUNPLzJvM3hmTesT1EsNsg0/uCPhw
	EbzHgHMMO6WJPZq8q82sGGedjXctEoYF8n9fD/ZVV3iojgnkOqWrwG/v28g5b4rVsup3Txo7nrp
	SjEdAybqBSVLT/KxeSdPoLurVqYCCjdedO9ctryPpAWrppmFkvmyyQZ88AOMPtFYPWrk5C7VNLz
	ziG+iNRR1qaUTBqMqEZqJSIsafUzcPuIbqDInSzEz7Bn9KGpaGryZjVjHspWFDCaVE567PzMpqi
	0AWL1ULBhha2RRI/6WYxXHooluhR/pY7B+1U55u0nIrc4KWbBj0khPfi1B/CB1BXjP9vjbYnK0m
	LhfCMA1joHclb7GQSkf4u0mz+47+yprN+I1qGbprHF3AB9wkTQVUYze64Uak2vWoFcw==
X-Received: by 2002:a05:6a21:6b0f:b0:3d3:ae40:51e3 with SMTP id
 adf61e73a8af0-3ddf7eb5f73mr622092637.23.1790109766026; Tue, 22 Sep 2026
 13:42:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921145655.3167436-1-i.maximets@ovn.org> <20260921145655.3167436-5-i.maximets@ovn.org>
In-Reply-To: <20260921145655.3167436-5-i.maximets@ovn.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 22 Sep 2026 16:42:34 -0400
X-Gm-Features: AcwNN1W-iOgtFaeoFgTSVoi0VfumM0YOE87MwjOUfMe1Y7AltETdUhTGgq3CSe4
Message-ID: <CADvbK_c7dS27Vip8OO6vonG89MWTP3PwN_y-YP1TrH0du6HS5g@mail.gmail.com>
Subject: Re: [PATCH net 4/6] net/sched: act_ct: avoid modifying shared
 unconfirmed ct entry
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Aaron Conole <aconole@redhat.com>, 
	Eelco Chaudron <echaudro@redhat.com>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, 
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, linux-kernel@vger.kernel.org, dev@openvswitch.org, 
	stable@vger.kernel.org, Axel Mierczuk <axel.mierczuk@1password.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 10:57=E2=80=AFAM Ilya Maximets <i.maximets@ovn.org>=
 wrote:
>
> In a case where skb with an unconfirmed ct entry gets cloned, we may
> end up processing both again but with different sets of extensions.
>
> The series of events:
>
>  1. The first clone wants to commit and runs the helpers wiring up
>     the extension pointer into the expectation list.
>  2. Then it looses the confirmation keeping the entry unconfirmed.
>  3. Second clone now wants to commit labels or run NAT and adds the
>     new extension for that breaking the pointer in the expectation
>     list causing UAF on the destruction path later.
>
> While this is possible to trigger, there should be no practical
> network pipeline where we need to process both clones without
> modifications in the same zone.  So, let's just reset the entry in
> case for some reason we got an skb with a shared one.  This doesn't
> affect any known use cases, but avoids any potential problems with
> sharing and modification of the unconfirmed ct entry.
>
> Unlike openvswitch module, act_ct allows for NAT without commit.
> Changing that would be a uAPI break.  So, act_ct needs to reset on NAT
> regardless of the commit flag to avoid reallocation of the extension
> space.  This, however, doesn't really change the picture for sensible
> networking cases as there should be no need to run the same packet
> twice (before and after the clone) through conntrack without packet
> header or zone changes and without commit.
>
> The fixes tag points to the introduction of helpers, since that's the
> main UAF trigger for the sharing.
>
> Fixes: a21b06e73191 ("net: sched: add helper support in act_ct")
> Cc: stable@vger.kernel.org
> Reported-by: Axel Mierczuk <axel.mierczuk@1password.com>
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>

Reviewed-by: Xin Long <lucien.xin@gmail.com>
