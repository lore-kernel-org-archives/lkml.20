Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BAB55D893
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092492; cv=none; b=L1cPewe2DKb6bUmUroFKhtdZ7kLteLe9Fyh9DROk8OnHtZYDCuhfO6ZbNk/JDy3FMo9D5h8qkuY1UO3fKQu0ESz8Ii5KMHLycXPyYzKK1B4Z36vc3EftT9j7magwpaDqxVWUBI6h01dutnzfXQeJMQoR1sSaM07ULzkp+0Inw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092492; c=relaxed/simple;
	bh=ePs2dgVNu990/RdOsOFHVYBsJZidaGimnQNxUffXzD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMffqHUotv4rJoDC5mqCjziFDjAcZIycKzWmXXuXyzEpDP1IqXkYzty68GAgOrvgH6SFgxlsp9HSh+5z9jK6FQRl1+rzgyStwtSq6p8aYANjQGF1dEoAHo26C+GV2a4HXXo6DjAOEh//Dsmu31+L3dnik4XbzgMpt3gDZHHrvHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e7b06acb8so16112505e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092489; x=1790697289;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ou7RXgdpVNWLI+ozw/bBmPEO1nYVgTeR75Rde89LsiM=;
        b=Vn9+6QiKiIIWhMRWj40Htgak4FYcvJJdxtPdyGqHUNXWSuEmSft1OXUYNJU7MrbtPn
         7XFOSr36Uw699ZWJl4DiYoY/UjbsnRvK5FBEhSzbiZ76HB89MOhb97ldr68b7BQ4zv7K
         Lm0l0uaHHHajKgieEIgU3omxS1SSkYy5fY1177jZFDaxDYRetVhgZjFZV8Sz4YfWHXP4
         xVKQVuyRgyJlwTEH6uGCSnNf36ofJ5VL/KeZ4qt+d/tC3HXe/KB2yb9Ya4wV0iPLUK53
         CK54x4CDKdM4YRlzkwHNlAnhLeM1RsINDeo4/4mL20mCAPDEFHJIfITVISv175x6VHXX
         UbTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsLLDOu8/JUl2fBfqBQW6gADwWS3z/NJ88M59J+UhacwZ1aJ+4MxYdyCoqjKWgX02DkplSZA0/PK5W/NM=@vger.kernel.org
X-Gm-Message-State: AFuF++k7P673rZuJOWmiM9t43DPomdDt3tAdAKrWsT2uktlI8QQk6dqc
	XrJoG3SClDiUS0xskfhiQ41jDxGnVsnCEscvu7a1oT/dNjaEr+kFX85v
X-Gm-Gg: AYBFou044kV6JaaGgssvRE6VFh24emAodYS6nonmdxlBIuon55gW+a1YbR7fbUjJbl7
	JR/cv8I19c8phEZEGdEMBZOXiLVqXuckoo6ChYNlCZ9Cz4Gj7ZFNDVCLEyJfCKaMnTlCLyQY/kP
	fExaPxXtzKNechT+gVD79bR6jbXN7BYHj4wdUwvzOUCotdHLSA2F58rdFubVhSWseVt6yUr0EBz
	QZqh1RQYPSWH6FZ3g6lWuCZJWrN9pfLLi7x881h+3y28kHuyB54EyT80XsdCq4cWMHpjIJBtkwn
	wy8MhwjPzImkel66YzLUgl9Un5mQyK958eC90EqezWuUBgfIp8td4jfbZC+NMsmx4rVg9FUeOoU
	0k51nwjfh3dhEHzboAjEsWZYi2T0RVOqGu+egH0BdhkQqEdMhRjV1Yo21SD+Vx+x1gWUCNf5EUI
	SYeDWGnT9MzB2wt2GVpHAOA9ACZDdVPDb6yecTNuxfHMnnPmYDQMiTjs3tGdoXflGs1Z6lMNHs9
	Gozrr9OWA1UDw5zXIbKb5w44AmcsGYr4Oo+L2e6m/8LHMg=
X-Received: by 2002:a05:600c:3585:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49fc5734ef6mr262140235e9.16.1790092489386;
        Tue, 22 Sep 2026 08:54:49 -0700 (PDT)
Received: from [192.168.88.241] (78-80-107-225.customers.tmcz.cz. [78.80.107.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862731a53sm6067611f8f.4.2026.09.22.08.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:54:49 -0700 (PDT)
Message-ID: <3a838a30-9a1f-4d76-90ef-ee17ed188f7a@ovn.org>
Date: Tue, 22 Sep 2026 17:54:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 6/6] net/sched: act_ct: fix helper UAF due to
 extensions realloc
To: netdev-bot+sashiko@kernel.org, i.maximets@ovn.org
Cc: netdev@vger.kernel.org, pablo@netfilter.org, fw@strlen.de, phil@nwl.cc,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, aconole@redhat.com,
 echaudro@redhat.com, jhs@mojatatu.com, jiri@resnulli.us,
 lucien.xin@gmail.com, marcelo.leitner@gmail.com,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-kernel@vger.kernel.org, dev@openvswitch.org, stable@vger.kernel.org
References: <20260921145655.3167436-7-i.maximets@ovn.org>
 <179008912273.2160803.18168154192973334378@kernel.org>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <179008912273.2160803.18168154192973334378@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/26 4:58 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] Comment vs. code mismatch introduced by this patch in
>   tcf_ct_act() (net/sched/act_ct.c:1113-1117).

Same thing as for the previous patches.  Comments do not need to
spell out everything that happens in the code.

Best regards, Ilya Maximets.
