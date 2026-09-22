Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE6B559CB8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090813; cv=none; b=eSV2u+FNODRiAjDtgVwDjP8Uu0Hr0nJ/ID5OkWHUEXO+xhxxJrcGceTuDTSxCszoMceb4TeN7yZ9e11vsmkMDhiGoyjQW87z6wHRecF0R1jjsa92MRxn5Q1mlbz9MO29XvlFF8x0ssDgxQ1eouDHJh30rwATzY1FZIeo167Z7B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090813; c=relaxed/simple;
	bh=Nfpo/PElH+hUuXM1DSN+liBKZMn7dhMb01zv1lmNiYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dVn1wmgOeiKm//Kyw03TVCOaWJNeJOIBxy+t4/gr/57ddgKmwWTgB9KlXUzRTLOUZ8Lfd9lQmizRTinFf4xrUUZgGewLHIW0XIU5yq1+LKci2TY3N4vSRxa1p71zDBg3OGq7uoRkwxwjCfvhsW0zlFq6r2xlhDKD/2czxN82Ea0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JqI68iqg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oXaaBbG7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JqI68iqg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oXaaBbG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790090811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HgF1fYWmdweGa6Ay1VNB6tjKEcFrxVON/LrrH3c8qA=;
	b=JqI68iqgF+zS4G2qrlW8d/0CADhMsqpRQZsOdrAnBgiyiDkvsl0jFR0/V/3Wm4cwKoEYk8
	n9lZOAZLJG/s/9mg7qhCKp7HW0scuAAkofgfwvur56/oJo1mNZgKRKaLeAmRj12vleSqFb
	sTKqcSIJDCGcZALZI2+KA8rfwu7l8/g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-ITqenakxPp-utHV1KjWPyw-1; Tue, 22 Sep 2026 11:26:49 -0400
X-MC-Unique: ITqenakxPp-utHV1KjWPyw-1
X-Mimecast-MFC-AGG-ID: ITqenakxPp-utHV1KjWPyw_1790090808
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e76a80fe5so59533355e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790090808; x=1790695608; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8HgF1fYWmdweGa6Ay1VNB6tjKEcFrxVON/LrrH3c8qA=;
        b=oXaaBbG7WAP9r1MbYOMcGTNVKChT1lAE7nadpflx1TcbKnUgT5XTwW62XVrNHXHaAc
         AF6QoVlv+IKaXiGx7KQLEmCUlJU2XvLT6uialFii+WzEFLq5hHb2L8nx1Qzx6ZA0GdTg
         rLAiDIsHLCqtuQ3+nqP7sCi17oDsDSim7K9CIPVVOx5KQiPoLJYqR5t+VFCt+jYAG3DH
         auU+ELt/hMQJjraTCkBCJcqZ0Ug1iIyZR38BoIgVes0srr9YPJ02lXAE6spJthIzmPmt
         Pqzf/GT0SfuII4XAIj0FGsA7kG8J4LryHESJDYorkNk7zrzieRv44zlz4CHE4v+O8eP2
         e+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090808; x=1790695608;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8HgF1fYWmdweGa6Ay1VNB6tjKEcFrxVON/LrrH3c8qA=;
        b=xZh3xGy16SzTp5Hne9kCJyBb+anNXDlnWorpg05ItHopRN5iCwOIScCUrXqsA8Gqr8
         78GpTWY0Jxv+pnNxxKI3eq3CTtB1wmlWpy1EuQ1wxtzUPZXtGqhd9OOdXsGkhXfL5vRD
         /ccZoFe/AYZ/0WoSdR2MZ4dOjaxMc9zLdzLbn1jJITPSbE27YP4NhVoFPNwwEVwo+z9t
         ZFv86BPy21luwDUVKHZ4tNr9KBzwtyiD4gr7xpLN1LISbQI+lbjBPjRXFNTf7PedXk6k
         4twhJxytNuZ+asjTyBn92gUiYcBrpeOPFxanhuFVX061a3EohaqayLGvMvl6ONGtIVw2
         aCKw==
X-Forwarded-Encrypted: i=1; AKwUvBxr3BK8u0eMf4kfSDT1kl7XFUi60ivQzs7QQMiPt+7peRYGU50Ezb110ifeHN1B42xUSPI4oVJziuLBs6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mrEXKAgt33gKB99TPJG83hW773UrObtT1MDhGQr8mmH+lAsx6D
	Sz1Bj96MR5AtC1K82pFIWsm572JqDGwVb0635vC/O3fAouUoC41KbjjIx9sq+JR+hsGrEcTmhFO
	baNjCZxCcxR+3hhGL4RHfuQYcCTm0E5ddWU2X+Ci7Kf1EfGzgrNQfQCptg4shh9FP2A==
X-Gm-Gg: AYBFou3M8yrouTSrPZ0E3R2kFQr5QRf9Qyx8AaCUUjv6UCRA7vFyZJvFdqwkx9LUQAP
	ABAGm5M7AYoPz7flcDOc7JFCKnxZGEjNCcZMdoemKuZ6Yg68fF/ZTSHTjf1ryhAzl8XHSiIohpa
	j2jHeOCVuIbMVtglHJbwW0B3XMrtaqlWn1YcxlTW/Sl9i7IXvdgDH9HRDoubpSfYyBzc55ZzOzB
	6j3n8ydgSE8Do684C/kvYpWrV8BpRGCYx9GQwBsBhHNbAlXvoeSBAkBab+mD8CmiLRbL0kabP0t
	rrkRyATT4GmSOt85Sr5zLp/by7+TCSZlAQIDUg87a3JrR/hc5JmTpfrWVvK140DTjtBYtDSXOTl
	pHc42AENhWyI9BAP5EkT0r0F4+FO+
X-Received: by 2002:a05:600c:310e:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49fc5681249mr210658275e9.5.1790090808280;
        Tue, 22 Sep 2026 08:26:48 -0700 (PDT)
X-Received: by 2002:a05:600c:310e:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49fc5681249mr210657815e9.5.1790090807714;
        Tue, 22 Sep 2026 08:26:47 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde071f85sm875605e9.4.2026.09.22.08.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:26:47 -0700 (PDT)
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
  dev@openvswitch.org,  stable@vger.kernel.org
Subject: Re: [PATCH net 2/6] net: openvswitch: conntrack: remove
 'add_helper' dead code
In-Reply-To: <20260921145655.3167436-3-i.maximets@ovn.org> (Ilya Maximets's
	message of "Mon, 21 Sep 2026 16:55:44 +0200")
References: <20260921145655.3167436-1-i.maximets@ovn.org>
	<20260921145655.3167436-3-i.maximets@ovn.org>
Date: Tue, 22 Sep 2026 11:26:43 -0400
Message-ID: <f7tcxu5b93g.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ilya Maximets <i.maximets@ovn.org> writes:

> This variable can only become 'true' when the connection is not
> confirmed, but it is only checked when it is confirmed.  So, it can be
> treated as being always false and just removed.
>
> Fixes: 3c1860543fcc ("openvswitch: add nf_ct_is_confirmed check before
> assigning the helper")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> ---
> @@ -821,13 +818,10 @@ static int __ovs_ct_lookup(struct net *net, struct sw_flow_key *key,
>  		}
>  
>  		/* Call the helper only if:
> -		 * - nf_conntrack_in() was executed above ("!cached") or a
> -		 *   helper was just attached ("add_helper") for a confirmed
> -		 *   connection, or
> +		 * - nf_conntrack_in() was executed above ("!cached"), or
>  		 * - When committing an unconfirmed connection.
>  		 */
> -		if ((nf_ct_is_confirmed(ct) ? !cached || add_helper :
> -					      info->commit)) {
> +		if ((nf_ct_is_confirmed(ct) ? !cached : info->commit)) {

This is already a good reason to apply - the existing construct wasn't
particularly friendly.  And the follow up in 3/6 is perfect.

>  			int err = nf_ct_helper(skb, ct, ctinfo, info->family);
>  
>  			err = verdict_to_errno(err);

Reviewed-by: Aaron Conole <aconole@redhat.com>

