Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22B1280CD5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090796; cv=none; b=OpUrHGHRrvVxYNidnbC3CY1t+2m0D/iFS+4H9RlSEEc5pM6i82+fDze6lxaNDzGJRPH0oWjO5om0z5GUOfXIYOeL0VqrakSdbu4RHGqWQxP+3cDNp7Rm7p0Bw2AiNZSWu5aAmEFSdZdjjmR98O3OkpcbbMwgr5ibZDq7echOtbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090796; c=relaxed/simple;
	bh=4tTfIyxQFrJO0eYjaziEFGFnUgNWltKT23dBmntSrLc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SPKHZAJBPX3zFjZqBkPGWT24m2ccS08p7pDtkhJYe0AtyJ1y3h0vY99FKuj3Bfp6pfxMi2+WZ+BooNwII0rdgL2go++iBha4wcGKJeehlBkITAIrdb5SqUxlzNNKE/hiR0qLTA+VPA+qF1iR9TQmk383TNaPiCe/w6Sufe1j6kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ChHlunaD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dg5AaW+c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ChHlunaD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dg5AaW+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790090793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/8zY26QjQrdL1DZs1bTzu+yz0u+JYpgALxi7/8nmtuE=;
	b=ChHlunaDOjWyPFNJx4AwLZdCWm8sZBKMB4wIJiUs58nDT63OVtBC7u7b3Pnc2Huu/REIIv
	Az7AeXN1XweIO8rCRCdi3y6unXoRq0qC26e4iZKl0UIiZaKi21E0oasvFbMsKqkh4opanb
	wkefm88DQx7JM5zNWzeuJ89aVuw6kM4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-5DIiHQsHPGSUyYWrtD8jQw-1; Tue, 22 Sep 2026 11:26:32 -0400
X-MC-Unique: 5DIiHQsHPGSUyYWrtD8jQw-1
X-Mimecast-MFC-AGG-ID: 5DIiHQsHPGSUyYWrtD8jQw_1790090790
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so33348925e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790090790; x=1790695590; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/8zY26QjQrdL1DZs1bTzu+yz0u+JYpgALxi7/8nmtuE=;
        b=Dg5AaW+cXOG3UCb117mUsmYWky0JYfwjukmhT5YrjX0uSYZufp9ySioGC6uY/T2kFb
         DpFVJGLVdmi06uE8stG2Ld/0ga5sLnuqZCErQAXV2UMz4EX59Au2kG1kY+OURt02g3V5
         Dek6VhkxEUsIsQFMXMVZ+Ae1ee5PUoq23nqvDKc/0xaY3LVDtHV30QzfctbT+BiVVrJx
         ua9/l6ZshDdrYI5msQrOyhR9hR/v+vzBIW1rSKIO/yGC6kkzjMc7W59F9SnM3utVpkcD
         QV4j61mq0upYvBhGfDGjeclKE5nMQWMyytTTZCzlqSmX+sW7hFUhR5xnWWU5FtJGwWd4
         79nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090790; x=1790695590;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/8zY26QjQrdL1DZs1bTzu+yz0u+JYpgALxi7/8nmtuE=;
        b=gH//vLSIviCogApxtP84FibvJI9ido1FHjFjIuihZwPthfcSyFZXgOoDOmKHhEonAI
         rfdA3hQ/Ke0uxFt7rENnvt1FZMSJ2LligN35yWBGQrKaWf7ipWKGdogEoyzQ/F1JQbSQ
         E3+xOWuySMCgOw8/QmFMr/AabhrJkjCZ821FxtQG+HNZ+5fRiojGCURAOG+Suia4zycm
         5IhaTn0foTn5ZlFOucNzGgkEpEG3acaKHGuYdDBiwBcXaLMkHhPDVCDa/EOJwWUUMroJ
         CEcm/XB6pFVWMAIwhlaYWR94iuUwQS02iK0WHXDe+nQ9NCKnHjAA6v0ADnc+3kKLw6AS
         NDqg==
X-Forwarded-Encrypted: i=1; AKwUvBy8SVS3hbCp1mC2vkpoYH7oSUNCrLdkjzJCQXYn1T4ojW9XYHOKXJ3ThgAzCSBqmAWYAlnxNcbLyjspfZM=@vger.kernel.org
X-Gm-Message-State: AFuF++ls8kmcpn/qyBivgQIXYVN89koQi/J74sWoDmSQ14JECvP6Xdtr
	baYFoPYc8zWHj6JB0ZgGvL0cHaSRh7Ifmo3JQQ/npNbnpq+iNNQm68qWSFyW6di3fGGjtgT6Lk1
	q9CAKgaxfNjbl28uRND7cWmGokqT5OeeFkAlm5wxFb4Pz87CzVDQ7YbNFmTsEjiHq8g==
X-Gm-Gg: AYBFou1OIpr2wQ+WYbvh4NuD5tiOCGqNuM4yZHulZof13C+XawErOtAQqbw+lpR70ix
	WLj3ynBjljSWmCOSbMMeyFRoF8MArJW7uDuQHZy9/yJtJqWqMiR6JkIMSXojLY2hgcqXC8MxwZe
	Q0N8GkPF2X1vVSQS2ZoHKo/6uBDw8xeLqnNHAH7PRVA2ZqVSgk8cPh2Ux9R/oVcKoBndunXlKub
	t/Yo3m05/vzaS34o8LdzBHiGyP32wQVnPW0032Ryr4BgVGz6yLQn+qEzqKXHqY6BlWWXGpaBEWz
	1DrnnV/4urJKoUiv8wGbL8xruGGawg0aqwhNGtxX2Q/Q4VZ9iYlLnfKGVVcO6Mj9ZGjrmTR44vm
	t+IY06YVbp2IUMINT9r8rKuvR0LoMiE++Atfa4no=
X-Received: by 2002:a05:600d:16:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-49fcbb0de51mr143310035e9.33.1790090790092;
        Tue, 22 Sep 2026 08:26:30 -0700 (PDT)
X-Received: by 2002:a05:600d:16:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-49fcbb0de51mr143309765e9.33.1790090789634;
        Tue, 22 Sep 2026 08:26:29 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde00473dsm3653365e9.0.2026.09.22.08.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:26:29 -0700 (PDT)
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
Subject: Re: [PATCH net 1/6] net: openvswitch: conntrack: avoid modifying
 shared unconfirmed ct entry
In-Reply-To: <20260921145655.3167436-2-i.maximets@ovn.org> (Ilya Maximets's
	message of "Mon, 21 Sep 2026 16:55:43 +0200")
References: <20260921145655.3167436-1-i.maximets@ovn.org>
	<20260921145655.3167436-2-i.maximets@ovn.org>
Date: Tue, 22 Sep 2026 11:26:25 -0400
Message-ID: <f7tecelb93y.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
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
> end up committing both but with different sets of extensions.
>
> The series of events:
>
>  1. The first clone wants to commit and runs the helpers wiring up
>     the extension pointer into the expectation list.
>  2. Then it looses the confirmation keeping the entry unconfirmed.
>  3. Second clone now wants to commit labels and adds the new extension
>     for that breaking the pointer in the expectation list causing
>     UAF on the destruction path later.
>
> While this is possible to trigger, there should be no practical
> network pipeline where committing both clones without modifications
> into the same zone is needed.  So, let's just reset the entry in case
> for some reason we got an skb with a shared one during commit.  This
> doesn't affect any known use cases, but avoids any potential problems
> with sharing and modification of the unconfirmed ct entry.
>
> The fixes tag points to the introduction of helpers, since that's the
> main UAF trigger for the sharing.
>
> Fixes: cae3a2627520 ("openvswitch: Allow attaching helpers to ct action")
> Cc: stable@vger.kernel.org
> Reported-by: Axel Mierczuk <axel.mierczuk@1password.com>
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

