Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB3559CA0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090826; cv=none; b=hwvNYSfv81MncjDrAliQL2lV/RTAIOiK5y/UZGMwUMepiAh0dQTbNvWsfL4acm2M/aoMsAp8qslb6kJXRJt53r8yQ/jaNQ31h9UUu4Y4eP1FVYTBWKrG8X+cRxXh6oWZZEdCsH6n9tP06Gw132esu8mhraL7kLrhMBBlvPFmtoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090826; c=relaxed/simple;
	bh=/bLyKypnNwfGX2WH2jEoAUwwNIROKLlCEg6+ySEJI08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i2TDW2aR9xggO+3FEUtNZNgploiioMt2ImUgM6pFZVA3pNDtK62K2Ebse/bfsDQRps966h0iJa1H2nfk7dQcqPBKwMOVzU7MKE/mR44O/gIohJQb/kM44rxeNxBcWesKAx/Y/205Imr4Awt7+WI/JR2a8jSBK2aPFvzjQSmod+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S3MtHOrh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EvUly7dY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S3MtHOrh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EvUly7dY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790090823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Htkt20pVczBoadvUlOct83zLwipczk5AidQ8VvN0o0=;
	b=S3MtHOrhJPPK0ahF4AWHv6bmULD33f5YWq0yMcPOLQkr8SfsSjSX/Gnwdc+tQRuWQ9+7B0
	Yp9d7r48+AryMb0RcAF5b77XhBGDjrStwhZwNfu9XwvfjxL38sbGxTkTT6Knje9q2Bpn05
	LSM2w2aosPOX4nGlYA5mXbOqe037ucM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-KhoBKdSANfasxWN_YPdsEQ-1; Tue, 22 Sep 2026 11:27:02 -0400
X-MC-Unique: KhoBKdSANfasxWN_YPdsEQ-1
X-Mimecast-MFC-AGG-ID: KhoBKdSANfasxWN_YPdsEQ_1790090821
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49ccfbe060aso32248835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790090821; x=1790695621; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0Htkt20pVczBoadvUlOct83zLwipczk5AidQ8VvN0o0=;
        b=EvUly7dYqavQqfq1jXf1ADamLFgaWspaM0f9f9a6J07ar2GatdkBBX2YyerClV28S6
         vSXvbmSR4JhiDl5QPRGmDjLQLGWYV+Yl+DBt9/LZvEcGiIAkK79vcSZX7+ci5uZD9qH4
         S0DzDOtF8TT1AOet2Z+NBpdHhVqJM5iJEFNOtvtPRnwNzwD5we0siL9R3WbQqYcjADAG
         r8F49JDath0Cs8u1kUCjK3v1pmmiun7NktSWBV4iakhx4Vy+R2dQuHEuFA4tsBM2CHWp
         mh9z4FnlSkEkSG8Ai8PoQdePwM6wjtfsUT5oR34RKPojmfEZspkk1EI9dIIrSYK2RrJY
         7nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090821; x=1790695621;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0Htkt20pVczBoadvUlOct83zLwipczk5AidQ8VvN0o0=;
        b=EDEssm31oOLdt1H/09rP6dKJE3vhczRf8e6TEZM/+e+KwEfeC5kMouOCaJRCyNwR7K
         gt548B+DmIZHucYkppHlz+e+IuSHJYgTSwqe+ruBHB+luBzlHOgbGy4nbb2t4elWaUXn
         33CpSjTzq/ACqdx8KcZBzddRn1my3OOdCYivzjdtjOqLHwB7eDF91L+TPXHlv4cL/ATz
         dLIaOQ0a8jHyI1v2zongtwP6aNIFpCjOk2cH6AimsuZfP0BU4krH3OLOni2IUUzUfLB1
         lzJcXXzdklhfYuOfmhnzcRPcbPfSh5Jb1qPFpiDbh7pUL3TqTW4B6Hp4UkSetYllymkV
         uZpA==
X-Forwarded-Encrypted: i=1; AKwUvBzF5/txUQXYivr/GdTWB3Y22I7j+gxmaAmyXxPljY4/D5F1DW1EYmxTHvgt0LEX6JmBmVC+TCTikjdrygk=@vger.kernel.org
X-Gm-Message-State: AFuF++kTx5ISh6m1oPG9YCnVqQ+iaHWX2FfuexYligtw7tilLDekKvkX
	TATyv03TDvQYhYapLZvyCh6GijRGGlQLKxlH4gZJ6BcU6zMcoKRk6PLenfGdmBRjgnog85lzGse
	VYGr4HIqhPY3gxoVbppB20OAfHM5n2Hd/rWakn0fWhntOsXIirKovB4HN9+OmOOG45w==
X-Gm-Gg: AYBFou1NGtrbiZJ4PUahgbWLrcHOFMszkF6NacWJGwpsGJOhORi9rwOv8BAuybJQ2Yw
	5CSAyuL5NQv/RcUEM5129uJkrs87hJ0HErSnSYFrVPxrvKjacWHorlyAUsBh0Q7y210hsbGL1Gd
	+ueV6T5O7GZk5ywa6iOSEUgI6tAp/G1g5dW6YuVjQBWc8y64UY8v+qkxeVlyzunYh53RKWZT2JY
	1toyAaUIIDYTBtGGPGdQh5GeYkz0VVH1p4407LvZySLouHe5UHmxr1zgPfSivAZvgFJb/eniYck
	hfkEQ2stwW20AFikLE7zph/FpPsembepMpDDL4okYc3Cf+76DDWVgk8isuVjgBGWuUvG/sTTnK2
	mUS6yH3V0TL8c8oZ0OnrHz6prMIWu
X-Received: by 2002:a05:600c:3b05:b0:49c:fa21:e746 with SMTP id 5b1f17b1804b1-49fc57570c8mr185474735e9.28.1790090821088;
        Tue, 22 Sep 2026 08:27:01 -0700 (PDT)
X-Received: by 2002:a05:600c:3b05:b0:49c:fa21:e746 with SMTP id 5b1f17b1804b1-49fc57570c8mr185474355e9.28.1790090820708;
        Tue, 22 Sep 2026 08:27:00 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fddfd164fsm2995925e9.7.2026.09.22.08.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:27:00 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org,  Pablo Neira Ayuso <pablo@netfilter.org>,
  Florian Westphal <fw@strlen.de>,  Phil Sutter <phil@nwl.cc>,  "David S.
 Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Eelco Chaudron <echaudro@redhat.com>,  Jamal
 Hadi Salim <jhs@mojatatu.com>,  Jiri Pirko <jiri@resnulli.us>,  Xin Long
 <lucien.xin@gmail.com>,  Marcelo Ricardo Leitner
 <marcelo.leitner@gmail.com>,  netfilter-devel@vger.kernel.org,
  coreteam@netfilter.org,  linux-kernel@vger.kernel.org,
  dev@openvswitch.org,  stable@vger.kernel.org,  Axel Mierczuk
 <axel.mierczuk@1password.com>
Subject: Re: [PATCH net 3/6] net: openvswitch: conntrack: fix helper UAF due
 to extensions realloc
In-Reply-To: <20260921145655.3167436-4-i.maximets@ovn.org> (Ilya Maximets's
	message of "Mon, 21 Sep 2026 16:55:45 +0200")
References: <20260921145655.3167436-1-i.maximets@ovn.org>
	<20260921145655.3167436-4-i.maximets@ovn.org>
Date: Tue, 22 Sep 2026 11:26:56 -0400
Message-ID: <f7tbj9pb933.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ilya Maximets <i.maximets@ovn.org> writes:

> While calling the helpers, a raw pointer to the extensions area is
> wired into expectations list:
>
>   -> nf_ct_helper()
>    -> helper->help()
>     -> nf_ct_expect_related_report()
>      -> nf_ct_expect_insert()
>       -> hlist_add_head_rcu(&exp->lnode, &master_help->expectations)
>
> In case the connection is not confirmed yet, more extensions can be
> added afterwards with *_ext_add() calls reallocating the extension
> space and leaving the now invalid pointer in the expectations list
> that is later accessed while removing the expectation.
>
> Make sure that helpers are called at the end after all the other
> extensions are already added.
>
> Note that the helper rejection now leaves the mark and labels set,
> but that's not different from how the NAT was handled before or how
> the mark and the labels were handled on confirmation failure.  And
> there are no atomicity guarantees provided by the API anyway.
>
> Fixes: cae3a2627520 ("openvswitch: Allow attaching helpers to ct action")
> Cc: stable@vger.kernel.org
> Reported-by: Axel Mierczuk <axel.mierczuk@1password.com>
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

