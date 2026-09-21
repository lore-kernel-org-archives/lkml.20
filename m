Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1852A29BD8C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790031756; cv=pass; b=NQ3df9neblC5qY69KnwZ0ID01FU0x66BeRbvaA0oRfSxtEKUyHyq6OZQEdI+Owo1V/k3NkfP/w1L9yb99Z8LIFYAoGxDAD6El7anlEXUroclf+c3EJhdl4kVftz32nu+s+KhGmLZXB0LlxbEb/Rwl2mOmv3PHzyq9fiEKjTRC08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790031756; c=relaxed/simple;
	bh=8hnO3vaj19TugZkQX8EIHSZJpsMlJhW3HowugLastxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjM+IQODTIpe5ICKE8nZlRplB3A43iyHi56w6ZkxBMPro2nUUtBuWBbDC1WYSoyisYUN9WI28WccPRvyt+iPbPB+XF8IMgJup0eiG/hMWr1qQTQqfclqOAzqwQwRuLAAi/PuVka/2cD8lEyHJuo/iRxmYhE49v8pdAv4wtvLoGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=feEm7pH7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=d4faWWJ+; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="feEm7pH7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="d4faWWJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790031754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiEeb39VuHCSEip6FWcapchdU3R3BfbzPibDVrVefRo=;
	b=feEm7pH7GpjoIBi9SvrCRR2+8LOZoT2Yf5OX8HagPAZ/sd5vvJoudxrW8eqnU+TNs3vr+P
	N8Vww18shr8YQKNPaHnB50D++Wb3ul54EJad+xw/57yghUsWNqP034HKcHk9sE72AOoqqw
	kKbQwYiSzickgjAkfQPZeYFa2c2UIJ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-QBmO-zJtOKyl1luToJE1oA-1; Mon, 21 Sep 2026 19:02:32 -0400
X-MC-Unique: QBmO-zJtOKyl1luToJE1oA-1
X-Mimecast-MFC-AGG-ID: QBmO-zJtOKyl1luToJE1oA_1790031752
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49fcd86b8d3so23474315e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790031751; cv=none;
        d=google.com; s=arc-20260327;
        b=MfWrdjXq9YVy9r5QWYvVIocokXBURhUwHeqZkOizU9S4tyZHoIt4XrDaCyVEjsNDgm
         BzgYTDZWJaWwvRzmC0H4xsuOTrjqWty4yOPNiBESKsLeu6M5+o9NyWE7rm/Mj9ox96Kv
         jaWa8Zroc4PADG43EVxIyY9RdXYFj4peGnda7LrG3x0Vx5bI13agNUKykjezriq4HL1l
         BV6xJWuRWezdGw9l8YSLsZnDQdgkhN6dtEhYWVfOYr8aQiBB781Zfh8JF48k23BDrtbt
         xQvKgWJ0DkmOjQNJJyucUnC1K6LapcDn+JByXnBjKFb5VK9OmLlp3MYvYDUnwEHcAvtS
         fZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YiEeb39VuHCSEip6FWcapchdU3R3BfbzPibDVrVefRo=;
        fh=oglDtd8CDTBc9Nvt3XSRFkVDo7GMoKQ6CGmh2MyLSCE=;
        b=UlWVGArKFOhQ/xH7AqShKRm7ewdDbkewQJmZ/qX0rEFNHII7hIF4nkeBmFrRwV404W
         90RlaIZ2D9hqFwaMqRP3MzxhyMSeRpDwC3TWjQ+fPz+rUchYmEAsAlIsVog1wnwjGb0O
         wA+F3YtzVLLOmMEA3+CN5j6/m0FNoFl3y1r4652mKM31/OoX7ZAsr2FssC5EWd8BSQVX
         P4PV68g+45E5RCgLnBqgmbgmUovm4r0LpnDOIJpJuUzGUuJQabui4LVH/VXpMhRblUSh
         dXh/1IJuDbyxtKXbmRrizHjQTBwRqpY+AHM5Djxxm+ZRK6inraCCNhlXvbdiduPbvBhK
         1jlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790031751; x=1790636551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YiEeb39VuHCSEip6FWcapchdU3R3BfbzPibDVrVefRo=;
        b=d4faWWJ+IYkCUpOjZib2NVmSEeakO+ZGprnHBUVPwJQakkOnPH4W/fg7/f//b6w6l9
         SqKklAb57hNoHsFXL5PreeFxVY/AuyIq0dnQKfKy8Gh90N/gjPnZrlkw64TNkc4Va2is
         be8C7P97aGYVMxnb9aqanJ5QLWn0b4gH1QQYNkDlo8MBE+iHvJ/6KHRIyKrULmpIRMuX
         xnMNMacCT/x390gfZlsDEpLshQYM1IgTeP05tCigxGl4Mkb+Ubg5UqQTZQOz375kovUF
         PZIhikVW06BSAnYtwmojUJR69d4Q7PbUEukxNnvIoms6CZ1VtR5+CoSpqGRcEEg3OLIT
         UNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790031751; x=1790636551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiEeb39VuHCSEip6FWcapchdU3R3BfbzPibDVrVefRo=;
        b=lpup1Owok2lXzT9LctDoLk1QVvXBI6h1DmA5RCAy6TPkyjpwkhIkCJ8u4H4gT+duep
         reSrklpI8RuOsjmIN6zSDz+joZdhqsRRcz1YMqkQ+RBY1JnEfU05K2iCe9SIRX/+pPFv
         nXYH05pimpyfoSw5U57JK7PG+03E8eTEY3YMINFN9YzujpOZw5fZyK2S+lPSjf+7H7+H
         Bcn6dIHy4y4KCYyjNHoWLQjwnFAVVnhU0aDPRPkkUiAGtlKtMirP9wT/vf0CpWKdS2rb
         ODKGBGWL4S6TTEMnRLyMLY3d4epKu+kuOSYaVxoOeTIo8IUjbT8pEE+Hq57xYCW2bPbm
         iQ3Q==
X-Gm-Message-State: AFuF++kZTA3NGB0sj5dh9XOVNRgRirbbhzVK1lOZMwRl4VMftkuwR225
	5VCy15dtP81zMGJ6FZoLREx2VrFBw1tWoSUhKKRFCfjv/I4nZE7Dc2FBiGgTW1cF+b8sBQEcfIg
	l/GFAwQC5wUXFJl/dn1i7cezs7R1EWRCmOBcCms5OQK1bVwdi7UF2SJzNWLCFKxNXr2s1BREgYR
	yXvby1j+f+3mpLL5ZWcJA6M1pXcvC9azfNc49jjXLiGHW2MFok
X-Gm-Gg: AYBFou3PoY9Ry91eqX5PvQs/JW4uzj6zZLJF4GG9VAOIPrdQ6YziqYxHKoMdbufMKxI
	JhPwtF/rM9jllaJ1eXWZcB6xsorlqaE68+j51aJGDpdoLGfrmbj3J2bFYm284Obpi9rO8qeQ0Dz
	oYDDTTwetqd0M7JUk+KQyTYt6sPunvDnA8dIX0c4h6GbOqu/GV7p7AMUtwgaU29IMXj6Chps/hg
	2KuoTKpzLONNEaKou6jDm5RRoQ8D851d6Qwxis9ouvB+2aCa7Z5tuHqa2pnPg==
X-Received: by 2002:a05:600c:34d2:b0:49e:6838:c813 with SMTP id 5b1f17b1804b1-49fc5865314mr133493395e9.33.1790031751779;
        Mon, 21 Sep 2026 16:02:31 -0700 (PDT)
X-Received: by 2002:a05:600c:34d2:b0:49e:6838:c813 with SMTP id
 5b1f17b1804b1-49fc5865314mr133493135e9.33.1790031751438; Mon, 21 Sep 2026
 16:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918094322.152817-1-pbonzini@redhat.com> <arG1Nh2yuMQyAdhV@google.com>
 <CABgObfatLAp3AsPktQVtVq0MgeJV1Bw+54i5LKye5KzjVPqbyQ@mail.gmail.com> <arG3L3TL5_xCBtc9@google.com>
In-Reply-To: <arG3L3TL5_xCBtc9@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 22 Sep 2026 01:02:16 +0200
X-Gm-Features: AcwNN1WSstdLw8s658Gdk9JRK-z4AglKofqztxWi96AE_NjSyXS6cZYk_BJ65RQ
Message-ID: <CABgObfZTbj7cSUdGEcA2xgGkSgFqZ2NnNrHJ7+uYAHP3_9idqg@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86/hyperv: do not overwrite hc->ingpa for slow
 SIGNAL_EVENT hypercall
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:01=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> +James
>
> On Tue, Sep 22, 2026, Paolo Bonzini wrote:
> > (BTW, I would like to talk about memory attributes and kvm-userfault
> > next Wednesday... and whether those are two different things at all).
>
> By "next" Wednesday, do you mean the 23rd or the 30th?  I want to make su=
re James
> is pulled into the discussion as he know a lot more than I do with respec=
t to
> Google's use cases for KVM Userfault.

Either is fine, of course 23rd is better if there are no other topics plann=
ed.

Paolo

