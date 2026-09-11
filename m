Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5204AE127
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150219; cv=none; b=PuBbFdwauyzj9foepURLmhXr5iiaNZI6RSygfqK1xJDM/uvdGNm/SoKFnKcgtV7JwFnCUBW7RWHDNLbZX/Iq+idZ9FuJz4fmSGbvoReyTwHfHI68MpcQSRavfwMdx/GUh6ZjjcNJvqqK18Pp2A9qu5Dl72aiXbR1Wcj1QC0Rxco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150219; c=relaxed/simple;
	bh=FqHBH3yUjUwLliGv8euxKjP+FOXAgy510XdF6pA1DJY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2VpoM85e7QPbfN7oV9mphW8qIGnkGw1og5yBXtb6UQWGjcSRqHmLrYNXRkZxmarbOEeCH9vet+115vsCq+T1VtWz5hkkWywfDTKQrbLL3D70+f58tQ5aNYME8D2mh0hSDGCFWZJeIfUs8+0ncl3J/ytU9Vw21z+fEGCj6yVN6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa6QhGHT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa6QhGHT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso1506135e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150213; x=1789755013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ffqets+HvH5I0kwPYh49VlE0nCF5YvdKVtOON6cm9Cs=;
        b=Fa6QhGHTGO83JQrpLoGlc4kcGKZeFSUEkYoTvM5X+zgnCv7w8fRxDnPaYJbWtAKRK1
         tEQllAXfi9gf6uc2mdL/EL8Vsj7eXNLAAgHq0LkmGdwV/wDB92h132ySakbkDgwHM4Of
         dO0pum49vsPv454jR7xtYuHSdYCUL47YE0uMlwwDqTTSNn5sEF7NbJXwpWmA/cLKit0d
         DZ/ZbBjDSHBw+0YQ+rfzhsUgLZM29P+TXGauf5UBDAnw7vAOkTrZSAgmLo01a1nECDVW
         gSOlcBkcLb72bZDSOb995SR4+wrE/4TzjYG1REvm/njBLVXFQ3+wsH4sBgfmnbfoTfTG
         cuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150213; x=1789755013;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ffqets+HvH5I0kwPYh49VlE0nCF5YvdKVtOON6cm9Cs=;
        b=gT0SIftbY9gTGvgXjCm8QoaoCm3wL3Enj0rAwwiSgIKIMrmplskTTFn/WWXcmYZ4zu
         eHXZWmnEWPRgWO2RrkoBFxWe/L5Myd6rJfLpc6Dfy5egCgV5PKopxBFTVA55m6N48qek
         m13QJp8r4mV/NXNjGpZh1ODDmPS6iGZSfhAWBhbj+3U2x8rm2Fr1yMxM1FJkw5bemUU2
         cJG2SR+/u+qiVI50jBPU18TcpuIx+2zKvcNMJjQIvUz16fC1HE3r6/SgFjJH5HU69JvQ
         QOFZcjvQDV+b+tnnZsK5SBXgP00Zds7qJzXlKkavNXttFgauhRJUQKehPAIhCYr2TRKn
         2Pgg==
X-Forwarded-Encrypted: i=1; AKwUvBwbKcYipqQp4eQ6klZH74O3OKAwwoIbOkYxjUA8B2JtlQYOwFVAwfAa+SifI91j71sDa3g/RDbZDeOyI1A=@vger.kernel.org
X-Gm-Message-State: AFuF++kW5IGgLWont3++6mJNBwJQFoV+E6ght0yQ8X7AgbGN45Qiym7T
	djN8TSl/f/8bDEFklr1pA5sQ26k6OW6wdL+YOcEehDoqz3y+WAhDCSp1
X-Gm-Gg: AYBFou2fMLd4TSDoMqun5nDtGS1/pY+3QVg9vg8KvkK4FAq/DdFAGnevuODgpZfLdTC
	LuCtG6u/yDfmjgH7wtv3vpxMYFXX8A3pyJV7EUpKjPuM2se8nv9zfM5IsvVNN9E8TRkE6edCFM2
	C1ejrPWiz4rfNPBO/N83fc26m9XtfZRhfc4OcpsV6oEh4FQvCttQOxuE/lYbmqWTwcdhtOUcnTD
	8wZd4dYFDfkzBFy6RL75P+/6xuftcnJKCFKV86fSQXqADRX8wkuFkleiyzw7lzh5932zHEWjdEu
	LxCUDTLYmYnC3TCFndCKi3iXEbkIX23cOGdstmmxgvhtO5rw+K0vUyPLK3FJ1rql05H87dPkujH
	gNxUg/4yR5Mn9dgtnSd16sHPfM+68SMpLqSEvtJ0lmyvm2Oe9wtWTCcrzfHhbDUrEqNHydlRYrL
	Wu1kJvYqrfvcxN3vr3TZV+woqponX7MQ6AKTe3yNU2XxL/nFgam8YHtHNlp/nSk/hWbLO5U0r+N
	Xn1qf9Mfjuqoqb7v6hIIqKM9wmWanRiWZvkisCqYgUA7sQ=
X-Received: by 2002:a05:600c:4693:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49e619bec89mr121022345e9.6.1789150212949;
        Fri, 11 Sep 2026 11:10:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm19905195e9.5.2026.09.11.11.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:10:12 -0700 (PDT)
Date: Fri, 11 Sep 2026 19:10:11 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn
 <willemb@google.com>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH net-next 1/2] net: add sockopt_expand_out()
Message-ID: <20260911191011.5d218782@pumpkin>
In-Reply-To: <aqQnF9vWKVk3GkTp@gmail.com>
References: <20260910-getsockopt_phase6-v1-0-e681e102d5b8@debian.org>
	<20260910-getsockopt_phase6-v1-1-e681e102d5b8@debian.org>
	<aqQkImqiHPorszOY@devvm7509.cco0.facebook.com>
	<aqQnF9vWKVk3GkTp@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 09:09:22 -0700
Breno Leitao <leitao@debian.org> wrote:

> On Fri, Sep 11, 2026 at 08:56:23AM -0700, Stanislav Fomichev wrote:
> > On 09/10, Breno Leitao wrote:  
> > >
> > > +	if (size <= iov_iter_count(&opt->iter_out))
> > > +		return 0;
> > > +
> > > +	if (WARN_ON_ONCE(!iter_is_ubuf(&opt->iter_out)))
> > > +		return -EINVAL;  
> > 
> > nit: if you end up re-spinning for some reason, maybe swap these two?  
> 
> I am not sure we want to swap these two. This is the reason:
> 
> 1) The first check (size <= iov_iter_count(&opt->iter_out)), check if we
>    need the "hack" or not.
> 
>    a) If we don't need the tack, then we are fine and this could be called
>       from user or kernel.
>    
>    b) for the hack (which happens in the next line -- iov_iter_ubuf()), it
>       needs to be ubuf.
> 
> So, this force kernel callers to use the right optlen, avoiding hitting
> the same issue as userspace.
> 

kernel users might need to specify both lengths.
That is the value of optlen and the length of the buffer.
For 99.9% of the calls they will be the same.

David
