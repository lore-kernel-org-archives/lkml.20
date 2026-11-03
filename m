Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793704746;
	b=Lp2MYb/b20H2DO/NHuIPvpk4EVvNC1StDwRAp9fASWSzsyVJlE1ZKl1S3qsJufcMRTTs
	 Hy5aBSW6b4X0EPx/yZat4PwhREiY1UUlcIc2ui9UPwM5O7L0ngkQxMjWOhGaPcK70Y/Fe
	 7x8xlTtt2qUDLCpdCw9e6PE0nPvhk47ZljTTnBc0axJ/xPuK3Gk1E+Me28FoyyzRcLfC+
	 i7C2gQm6IrbRYE21qnI4meUbyzmWJIkPf/dRiRTYEgRreN4izDv6tHM8IXv6EF/n+h7yr
	 +7GnXGuT7KGPP7Sop0vRpRRVQOpgkMDP8vAdF0n4BQgzgfKPYtPV4qpYJA7bDqHJ3Hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704746;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=GoGPgCpYCXIZ2TVcCltrAuHOCg1Xoc0aHaKBD0ahpDY=;
	b=XgXE47E2LRgQhk5p/r1sW5wRjbMnn19AZPLNSJIacNsn3Yp1XYhwahhNrV4NpM8mZkS+
	 MAN1CfigQu0pbNKuIlAtlz2K2lUJPDg6d+VStDbo0F6bbAmL9QWPCtSh8wyaCraNLTA8m
	 /hY7JJ+CMDo4R26gKc2F0mTiB1ZlXYbpj0dCPfzYzWAZ9JyNqEmqz5x/LEvCSu778xlR5
	 yCyThImOVvKwoxhVW9Tn7ukgR7WUWnO2cRgacHzaXyCCaqu+U0+qxF7lV/YGj3rEUTKZk
	 JVATcITI3w/85Pc2z9SF6OfNZl15vA/zKTr4yfAIlO3f/HiyPcBvJUVCOumOduN6jyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JUJ4cqvg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SnJgLk0D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F8606BF96
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7F8606BF96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JUJ4cqvg;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SnJgLk0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793704745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GoGPgCpYCXIZ2TVcCltrAuHOCg1Xoc0aHaKBD0ahpDY=;
	b=JUJ4cqvg7HIxCd1RC5B4xEyWu5aBvq6keFe4Xvk50F1l1aVZuibSrLf8HMQ2a7WjLljRo2
	b5G1vwTLHUEJxa7Ybp0QRRw3kKP8N52kIc5a0XaHn6kqqun6j2WeLsNN8tDfXz7Ehd2SV+
	IVtfr5GsHCsWrVGSO/ZbeVySJ15V274=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-pDjEIQpBOkivEW5GTsaMBQ-1; Tue, 03 Nov 2026 06:19:04 -0500
X-MC-Unique: pDjEIQpBOkivEW5GTsaMBQ-1
X-Mimecast-MFC-AGG-ID: pDjEIQpBOkivEW5GTsaMBQ_1793704743
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48dff112136so2644798f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704743; cv=none;
        d=google.com; s=arc-20260327;
        b=mPIM2QR4xyxfMWzsvcSC00wjGcVkriFLiysSOu/MTpjxE9HMfyiiwvAz7XXkE0U98c
         AVBRTWJJvcp2tmFXvUtCDmnc56/3LdcwMsbfzcWvtYC6RM8erwm0b7TyfuK6N/gB/eso
         Ma0Q+fxtTIxM5qGFKCJvrkQGRLZLoR232k7NbI1LBzFQyO5Debr30vMRoiQRXWS7XcC+
         tSLKWbOX3oL/PNthyLSyHRk6JKu2UAubxP9+DuawZhtLvvWi00lNs253MfQVQE5t3iFi
         ho3ob2dlR/86oZ4PNukv9zRHn4JSNKRPDR7OhT2Dg6BQq8GyC0FZ7aTGzFi1rq4WvW+U
         u3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GoGPgCpYCXIZ2TVcCltrAuHOCg1Xoc0aHaKBD0ahpDY=;
        fh=FvvXgelG9sGIzLL+52qbD3A0gGibOi2AlZIn++dYbQk=;
        b=ne5zHY3hGAxALCrsf1HWHUTDqjpTMu6NUSG+WtVxd5SE6GU0yn3fp+pwzFh3sr6s81
         2wON8myb1ogVDFFxwDzpzGomBjSe1rguCgRHgQssbdY5uGVbfMWoerg1ZmTiefZCTuaU
         NkSzCCMGSBX/TRE9i1yLlr1AleuNAxqm/EHgNG9t2UeTYLob8htcie1GWyWSesWMJwZ8
         tNGsyvnpbbwf7Dil7ARSUWH+elwJpGmo8kvFbT6K0rCpR6KdJ318ryG350slnNnqaf7o
         bg+q97yzYHkYY4ys5UBHLDNYsBzevozg99hNQBQJT0v11okOFi84Wc4YhmkkH5nKiGDN
         grPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793704743; x=1794309543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GoGPgCpYCXIZ2TVcCltrAuHOCg1Xoc0aHaKBD0ahpDY=;
        b=SnJgLk0DGMT/nVwT1Q+Xp55G0e+t9TTD8b3sE5b6/KVMciUxNSqZVxQY2GCxCgjvpF
         TPlLpGcUDzhoNZdR/rHgpk3ZirH4n4N1a2W8q2bKG+EqZrK7mlJtayK3T+JzU/JSF5PH
         otKrybmqSSYMG0gEpunrCnPSmLQsC0WE8glx1amR3gLmdCMI64IrxHQo3dFjeL24sUD3
         MPVo1Y24NsjSQAVIV2L1OtpGEJk94ap/8UewTJfvasG1VvLSVtwgvb5VFt9KZIfo/V4M
         YzZVpgdbuCqG+3FP49f15GPAUhoQHvHI6PKWtoB1q6BnEOdDUZgoz+Ny4hiH6J+jJTEg
         hWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704743; x=1794309543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoGPgCpYCXIZ2TVcCltrAuHOCg1Xoc0aHaKBD0ahpDY=;
        b=wTvTNtvl36wLa5+EHfo1qJXl3eNHPInkL9tqlWS7OyzFaD5Z9D+dgM1zzdmn03e2/C
         lMuVJNA/HWRrL5Psq+/dT3epjthjtVcYt3woe99wcMntKWOqepqLVQXpHBmP8qKMPXTl
         jjsIIqnGTFrnhX3ddCUcpJNy0d5NdNdFqBJzVnJ6hB9Mf6wE31exLPlHSKrPnd/YI+0e
         EbZEuVnkpWvS9ycwl1jpre/MEvrVNTcX3lAX/TKRyqIhhLkG/fCKAB2s7JCJyTqnaO2W
         ed8duW4sFjZoDT0GuOetB3e01oe/DeQ0kXf5aaDBfJhFm/EnC+9MadOHUdhZBfI6KxnM
         gAdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMgJxjLBLSm70TzUul+8UbmmMqmyv0CojBmpJPIUkqgWFZsVmKDYPYvcWmxeu09F3V/Z8JNyqEfo0J60E=@vger.kernel.org
X-Gm-Message-State: APuU4Z99WGGGzfV5QyHZ55EJOZjQhMbah3MDlpWQqPrRJWvNa0Kbwl2l
	eLXS4saHgZTvq/n+8xE945vD6Z0Iu+fqSQZudz5nXxJtVFDPncGuTmpR5zo1TaHWuiHchyYKIxW
	tEBjcKY9g/O1KpZMYJLIPlB8R/AR789n/srUEPbXw5YzkoqbQCiFyMMawRbtpAj5eixRqJAD5aq
	eLQ3sYxExa/VoRhHN+ojJZv3wQnVCr2XkPwl5PYYNN
X-Gm-Gg: AYBFou0aHBR04aDLKmjFt325lGFbHyTyri9RQXa7clSooO7cxQ3cOCTP2Fpm6jg6zoE
	OtpZlKxhlgtJQUAC+H1vzNQqHOmoapnr0ruQYZhDfJ6knMSo4GTdbWnzin4CAlmkAdUahcaarQv
	c6thdBfT1sJRVlNj9HfFizHJHSXdGQ/WvKsQAuiRPlm833vIzmgdN94ObW/iis3QnZKirF3s9Sb
	heyIXZvkXSPL9+02PUdGXsr46nf4FNJ9ON0ML10jETtNsJHgsT9meSme5wK
X-Received: by 2002:a05:6000:41c2:b0:48e:6f76:de9d with SMTP id ffacd0b85a97d-48e6f76f5e8mr28351841f8f.46.1793704742877;
        Tue, 03 Nov 2026 03:19:02 -0800 (PST)
X-Received: by 2002:a05:6000:41c2:b0:48e:6f76:de9d with SMTP id
 ffacd0b85a97d-48e6f76f5e8mr28351800f8f.46.1793704742539; Tue, 03 Nov 2026
 03:19:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6adf2939.67317f00.38c4bc.00ae.GAE@google.com> <20261026224305.1254-1-hdanton@sina.com>
 <auCucDdZb8mig7UZ@google.com> <auDvUyfzg6nLtVox@thinkstation>
 <20261027163929.2bb28d5b@gandalf.local.home> <aujLx1FOc12E72rF@google.com>
In-Reply-To: <aujLx1FOc12E72rF@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 3 Nov 2026 12:18:50 +0100
X-Gm-Features: AclHuK9TCKz_SldDuFHKUBahl0dpObHDrm8b0qWMqlbehXg4DMpHhR2Dfu-OUko
Message-ID: <CABgObfZ9mHj7Fsq7Z2S5vFy8R2Gkh2tHBATGJN2BpH=6Waks9w@mail.gmail.com>
Subject: Re: [syzbot] [kvm?] WARNING: locking bug in __refill_objects_node
To: Sean Christopherson <seanjc@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Harry Yoo <harry@kernel.org>, 
	Hillf Danton <hdanton@sina.com>, Boqun Feng <boqun@kernel.org>, 
	syzbot <syzbot+f11512d1e5878ba5e60e@syzkaller.appspotmail.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, syzkaller-bugs@googlegroups.com, 
	Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:43=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
> > If so, we need to make that a thread for RT kernels if you want to call
> > kzalloc_obj().
>
> Eww.  I can't imagine there's a sane usecase for memory overcommitting a =
real-time
> guest.

While I agree with the feeling, the dummy allocation path should be
mostly dead, because page fault should never (?) enable interrupts
before waiting:

#PF interrupt gate
  exc_page_fault()
    kvm_handle_async_pf()
      __kvm_handle_async_pf()
        irqentry_enter()
        kvm_async_pf_task_wait_schedule()
          kvm_async_pf_queue_task() <- registers waiter
          prepare_to_swait_exclusive()
          local_irq_enable()

The dummy allocation path is only reachable if it's an L1 hypervisor
that is getting an async page fault while L2 is running, because it
enables irq before the call to kvm_async_pf_task_wait_schedule(). I
think we can drop the dummy allocation for good, which would be even
better.

Whether you would still want to disable APF for RT kernels is up to you.

Paolo

