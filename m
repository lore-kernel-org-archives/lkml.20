Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDED3D5246
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997205; cv=none; b=hArOZUsZX1KEYGes3ToE4vlQ5MWdmUw6OJtRecWozZrIU4TEl6JXqD64Ry6huXE5YK8px8AulzPijVBw4yOSM5hT38q0M+VOfeLg6lkfjdHVcIPAAd96PNVLEs7HrqEc4yYSKzVakgH8mEa3aLyNfhGXguIfKGHc83Hw9BbNb08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997205; c=relaxed/simple;
	bh=t7rn/xMzKIsrLaNS2xHgKqX+l7m1C+f5u4M2lUXhfIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDRY1o5OObhueZV6Qjo9NwzPvikrGDCiqDlpYFzVUIQwbiOjcPu7kmOvamUP3vaAI91ziCqa5q2a/03jLGYtew2PDibuudO0XeaYNViQ6AYhi/OSd5f45ujlYkB6y1zvs6mUl8z9DQPxDKMVaNTOPM9IwLEZc7bMbmunWvvlrf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ME5lA6vp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ME5lA6vp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e5e801487so663752966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1791997200; x=1792602000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkE0Z2/i0i7EFZjNtTFKeqi6fbMm7UzE8UbD0jLuu9c=;
        b=ME5lA6vpue9KF3xjJZCjgBcn5WOaTRvMqdh74d0zLxKUPcA8N/V5+opxViFRb5BFJw
         61nS9wMIrV4umkGWahrjFwE3atnqO5jVxYTBRy+Wt8kNu2TKNxHtAYVYT+1mWGStepxf
         n/ZKaqE1M8XBwYg/KMR33eT8NgdHZhUxsFA7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791997200; x=1792602000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OkE0Z2/i0i7EFZjNtTFKeqi6fbMm7UzE8UbD0jLuu9c=;
        b=KvnWJrg4IxAXYmfT2yGvWi38NBojsBi0iQTjMKXRIDlcBUbcYdONK5r1qLWWTgAQsf
         LS8Wb9LG8lBwuzON0MYxdNR58xMfGPpq9Zk00S59MSBnwCvCdcEnqJ4Twpu5gxOvCyLF
         CIVmKigRdBLMpsxZzR/3SQpMsRs38/8TOrOzPCYqOUEEgbsnKGJIYyL2LpaLGs9PizT7
         K58R51JOZytTwEPR5SrpbDqmnXJOf6weaBH0I0EtOMOpft8MAWpmcwhcwhoD5jj5+HyG
         4JgFpv17iLHzY/LUsaR3wKXswz8BD//JdHTduGHeQO3hytkrpOWtylXzuo3h0ExABabY
         pmDw==
X-Forwarded-Encrypted: i=1; AKwUvBycAkoGcxfpzVyeFyCr06nSy8dNsI7Z2XL2O8RbfapLO11RfGjt8JuGSwTjWXyyni8kCKyQdWK8vOLAikk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYCVgukEAzUUNeYMLJ/0f4zmO70rMY21Xsbh7Vn5dHIMCzOBdB
	DZa0irEnlL8nVfe4/suSNA2ACmMtrqASPDGJpt49msLVuVxuuSQYI7opn8Xv6GSvaUwnUVVFo4/
	1ma5hWp0=
X-Gm-Gg: AYBFou1rAsfv1bsiQYnm8gkjANbs94wg8P62MxRQbh44eu+Ky8n9vOkC3qm43DTu8sh
	dC5onEbOgmpXRNKemLlQ9VymOXi2YuEhgc8Z0Qz67PC55yEYrVcec7bv2r/JQOgSJASR2q1gJAn
	+LOExF5VHxRNIaq52ZS9u9nV5W2uNriEg24/VS4h9djMjpCfLVlAMFssBKCjL3KT08yL04/w5mp
	nKY/m7YD0rsQcctEdIvIAaKEODfMVraXJVe2NAIjh2yk6W6xw809/Zp1iapvgdgghjnGbe9Ewln
	zb7e2CBod9vo/3WEmITSgkDIkIw5HK0LMAqKQTxfDenV4oVLksjn/iI0/dVnxhS3RjzjCh5eRK0
	OMd0D5n/2PJrunkKD5TLfAHyVpPL4mo2VGzyAgBmH2cUofhkl8dYq7stV6mIxKECCHAPXIetSwm
	Yh0KT+sy+LaybCVnC+WbyhnyYhCh7L1KehYp231X6MGAsWCI1g6qvAD13mLm05JvwhNDXTsMN0+
	iYWTnOYMu8hDZJyEK1Sb0ybHTHTGoMJkpxvy1b5v94VUlqm
X-Received: by 2002:a17:906:c106:b0:c2d:bf61:24d1 with SMTP id a640c23a62f3a-c31a9a2919bmr1457743666b.1.1791997200464;
        Wed, 14 Oct 2026 10:00:00 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3db62sm6487766b.36.2026.10.14.09.59.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:00:00 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c350db5a761so567966666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:59:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6y+lLuRdEu215KZuRP2GyolGwKhMRkskcqgeHagZP8ab9iIcp/UGfOUe4l3sm/2YFmPqnIJpjDJoLYyQ=@vger.kernel.org
X-Received: by 2002:a17:907:c0b:b0:c29:5215:b2d2 with SMTP id
 a640c23a62f3a-c31aa016eb5mr1683734266b.23.1791997199620; Wed, 14 Oct 2026
 09:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad> <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
 <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net> <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
In-Reply-To: <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 14 Oct 2026 09:59:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com>
X-Gm-Features: AclHuK8rFSm3cd3995TX4NGfeXZ5GusuWKoXTlnl6-nGHAqR468IMtyKx0G31Q8
Message-ID: <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com>
Subject: Re: Improve page refcount scalability
To: Pedro Falcato <pfalcato@suse.de>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, Harry Yoo <harry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 09:25, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> > How many pages (as a %) are you seeing as marked PG_rcu_free across a boot/
> > realistic workload?
>
> I haven't actually checked outside of "a normal boot doesn't cause
> even a single accelerated RCU period". But I'll go reboot into a clean
> kernel and see what a kernel compile does.

So for me, after a boot into a full desktop environment and starting
google-chrome with my usual setup (18 tabs open), I have

  nr_free_rcu 0
  pgfree_rcu 73
  pgfree_rcu_done 70
  pgfree_rcu_mark 34038
  pgfree_rcu_kick 0
  pgfree_rcu_drain 0

IOW, I have 135MB marked for PG_rcu_free - sounds reasonable - but
zero actual expedited RCU events.

And then, after having done a full kernel allmodconfig build ("git
clean -dqfx" + "make allmodconfig" + "make -j60"), the numbers grow,
but:

  nr_free_rcu 0
  pgfree_rcu 32107
  pgfree_rcu_done 32107
  pgfree_rcu_mark 1395272
  pgfree_rcu_kick 0
  pgfree_rcu_drain 0

so a fair amount of activity, but this machine has obviously never
been under any memory pressure.

What do these numbers tell me? Not a lot. That pgfree_rcu_mark number
is cumulative and keeps growing forever - it's just the count of pages
that have ever been marked. And the best way to grow the
pgfree_rcu_done numbers is actually to then do a "git clean -dqfx",
because that will delete all the generated files - and that was a lot
of the RCU marked data, so now it will be free'd.

That actually makes me think I should go back and clear PG_rcu_free on
unlink - at that point the folio can no longer be read. I used to
treat unlink differently from truncate/hole punch because of this, but
that was in my first version where I marked the pages for freeing when
removing them from the address space. Now that I mark them at read
time when they are 'hot', unlink() is still going to pointlessly
rcu-delay their freeing.

Let me look at that.

But the short of it is: normal loads without any real memory pressure
simply don't cause a lot of actual RCU events at all.

          Linus
