Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A2855C1C5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090843; cv=none; b=JVjMfy5gGCLLQ5M72nCWoMxGoSsX5sxt9nFzD6KVgHn95nx9Kh1xMSN2DGIhXkSXpucSGQo0zdJHsBsgymJF1ZHlxoGbYwG+B162gF4cPDgLyT6r8Lm8r1zarIDPZdJFXldDwnQBKh66gxEjj4KOtRVZxMtYUUawnsWlJ64FdP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090843; c=relaxed/simple;
	bh=0AumlRwlWfNJNnKw4BdPtTBb/Y9n3FIbSvp1JQRP+Ws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o5F2VPz6X2ix64yflqsUrrUNzTO/m0frDpPNNkxWcvJYBgRlbrXDITy3AOFFjOI3fUWq4PRL+ab1vhsG3i4xJDsMTmwbk8wiIO3YBCMFj1Kt2F4wu06wyT37DfydLyhAms+CTFwJYZiXaKa9p0GfrClPzKfZ42giUv6HLClCEQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Chux5DDb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TsA4e4TA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Chux5DDb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TsA4e4TA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790090840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PiMRQI9uNvgikrTB+A1HHyTYpeJRXwwSNICkcWjdkhM=;
	b=Chux5DDbWvTIn1i6QKO9GqrwlvE8Twrw3KvjtmbNYCmf3+WQS2qjMSe22yzaTwV51PYm+r
	mNWzKvLiAoh9dgQr0m+OtJuzB/TUsPs2JyJnZBTQbTxZCtqTeGWZ3f/Vtl5CGFt3cbX/8D
	zpXb0snoUqbVAxc4E1NrJt+6cA6zmcA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-BqT0OS78PqmVvW_KqXI4iA-1; Tue, 22 Sep 2026 11:27:19 -0400
X-MC-Unique: BqT0OS78PqmVvW_KqXI4iA-1
X-Mimecast-MFC-AGG-ID: BqT0OS78PqmVvW_KqXI4iA_1790090838
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6c17ec1dso55265895e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790090838; x=1790695638; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PiMRQI9uNvgikrTB+A1HHyTYpeJRXwwSNICkcWjdkhM=;
        b=TsA4e4TAbMfzwf64rTF3v0cacn/b7zgMB2lTGMdXusbenBgvY7XFcb8LFRknXl4320
         4cUdSum9AePsiJrhlTz+qcK141s+GcwyKvi+hVEuDvDak0hO6MRK+feuUfZ9qa/eWOPh
         R+BuxSrBIsuDPk9iJfqyaTrEfjp6sNmWnhepJ17nbS/E1WATAfZi2cwxp6flwZXnRb2g
         1F+tHfMIkVllcepOzo/Nk7Kn4MuR21edjVF8wTWzlCUAq/sWoe8elJH/pmF0HqbtPHir
         mRnYb8iBkxLMsVr863rChTS7W9M5qa4uJSvP9oeHXBzYU3m62al6938BFFQJJoskZ2SB
         hGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090838; x=1790695638;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PiMRQI9uNvgikrTB+A1HHyTYpeJRXwwSNICkcWjdkhM=;
        b=G9A/heQs5lQY3qW60M1d6bARmzin/bH1UIdDPfnovD9ZIqj0XnuTxR38k25C4nvH1E
         NFy8AD7AFYcRIdxeOMkz9qBLM2q48DuSh0a/OxHFDjdTZoI6mCSC1Uwo+TkQUxP1DaaQ
         zwfMbo6UPaug6gdB17RBsn0KFYW8FQcFmz2nKut/dJTJTzD9t5e05oRUIe2WhPScW5Hj
         BLU1QrG/gcpxVHavb7W38Xe2it+9gfCspeSmSzwqV4WNwJKY91KBcEY5Qc0GXemwZQQm
         xjzhblOADeaUeiPPdNIK7U+6pRPvtQV3ENSN6dQM1Km60aUxKn9mpEgbAWyV8cali/d5
         +mTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzi9cF6+D+rBJoYOp2lpe+t6aIYirG2R2xsLgVFPvSYpK584Bj7pq8dNEZUb679TpbmPoWpCjBMDa3hCoY=@vger.kernel.org
X-Gm-Message-State: AFuF++kwd3Z/rNl23hSlJrpi/vMqZY8RJnhx8LFikq2KdbM8wvMErTgI
	A2ot7SMvBSU8yeh6u6z5NvNOp4hAMKdKpe2oKVoW9+kPQa6KJNDc1KJM7u3A8N5LYoN2eeQD3kZ
	ium8+SiE+SXhBLScr8JGsprXYap0JKb0ILjgYjEhlCqitdQOhOfetbwhz3f1c6UFoAQ==
X-Gm-Gg: AYBFou0adO8GkBqRcbBgYpNb/OkJlpjm4U+mF+I77INB5LhsRFfuaORI4ZRrtSsthgX
	oRYsnNXbTN3YQxRcqgdvLRXcB3PN+tw36uB6tf3AB1jazIZmGgFkp14bwhAQLoqL21YRHNnd1xG
	/sZzDcjgAWedBO7BZM/MGM5GVVqOVQ+b95/2dP4YDieb/5YK8OgN/VwksV7QWrF2SGQlScY+71H
	bg+mkI9vT0ZCvbMsfh0kc24/g+/Tmrj20qInDhRlOwZxY/+KmvhcHkI4znt7/gyLK3cadtStRoh
	WOtmoc8TwOGjUSEg1t4WLNC1wLQeU1ynd7KAB8Ss9ZhPazgma0epvHHeqjs0Se81p7vrRH9GepQ
	gIGxInURZzVoYIpxMNJqgocdICLom
X-Received: by 2002:a05:600d:6413:10b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fdcc8c74dmr17236955e9.18.1790090838127;
        Tue, 22 Sep 2026 08:27:18 -0700 (PDT)
X-Received: by 2002:a05:600d:6413:10b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fdcc8c74dmr17236665e9.18.1790090837791;
        Tue, 22 Sep 2026 08:27:17 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde064a64sm972975e9.1.2026.09.22.08.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:27:17 -0700 (PDT)
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
Subject: Re: [PATCH net 4/6] net/sched: act_ct: avoid modifying shared
 unconfirmed ct entry
In-Reply-To: <20260921145655.3167436-5-i.maximets@ovn.org> (Ilya Maximets's
	message of "Mon, 21 Sep 2026 16:55:46 +0200")
References: <20260921145655.3167436-1-i.maximets@ovn.org>
	<20260921145655.3167436-5-i.maximets@ovn.org>
Date: Tue, 22 Sep 2026 11:27:13 -0400
Message-ID: <f7ta4p9b92m.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ilya Maximets <i.maximets@ovn.org> writes:

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
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

