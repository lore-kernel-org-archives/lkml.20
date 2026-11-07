Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794071110;
	b=GO/CDKmgWJzqRX5ANjxM1FOjQSSJmA4Y0AarxQiFgTGWldpbWU7HafTObetlO849ppw9
	 keDLrJqIx/wGbnwzS8/1dKn4cxF+5DgGYOm7cx1h3cBvpXTnmuV25voFhc+3LilrPscvR
	 eLBunoS2+mC2QEJPXD8EeQ1mmsy5k60yqNDTogNNCEAWPS8vWZs2k47v/3Fb8MxaSxuBy
	 Z8Yb5/d5VP12v/2WqC9+FJg44zNL2X2hIyWYamcH+lvXFCVUGE54/BsNh6YTl3e+TTpCK
	 n8O2R2pogA4m9OovUlRlU+FB0xpk0RE/pHrx2kQIvY5C4lVioKLNFlWSg2zSWqhLScQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794071110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TsrMgj6bLCNF471e8BX5RjLkU1AefdOx5U9fzWvZrc4=;
	b=fp5S39LWY2UB54bAfRqFgjO6Xg4SMlt0OIJPSOBf9KHJQXV+n86Cfkr44kKJs8oucvbF
	 cTZkmkAtpYZQEYv7t/9pmY8h5afSa/giCzy2uBKVOH4d7F978hPIMUzHc2O/r1+SgGRvq
	 kahWCeoHEVigIDIR+jlsj78AmzsTx8WSMdtuqzVwK4d38WzJo1eLtN56x+Sgw8IVRKMlh
	 GpfVhDjsfpOG0gwdwEFUqaAFwIKVI2u+bdCkpVhXD8q+B2rAISpI2YiHk2vcJwd8mTUZh
	 30XFA6TgV3iqdMKRnQw2xGjRgMK6/WEsWZ1b6M8YmVpkYuiG4AaeAPxoKCYN7JFZ64w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rCG/Y3xW";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D21606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D21606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rCG/Y3xW
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15869925e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794071109; x=1794675909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TsrMgj6bLCNF471e8BX5RjLkU1AefdOx5U9fzWvZrc4=;
        b=rCG/Y3xWsXwF3I7/WqmNdD2VWITaJ7zv82Ec+WkPrhN/Q2HaVvHUxVY/JRnNWwp2gG
         t2IM3nP2WVJb/5tRx4UhNOl6sUqH6f46/8hnutnn1utJwNeb5mANRYu5xglM7K8u1gZr
         S1N3CWKnC9LKfCD8uixV/BONkwInAg04IPve8V5MAkSY0H/9IkG82BNKg+SOVgrvxThV
         hp9qOCAPZakhUMKT6HUSHF200IB34nBhFo32E2Yk7nDdJErj4LWu0iDb9uIbRpxtp0h6
         hUDQ5I19byCZGT3HCxay66tKC1QL9KiiVgLEqqWDmX163jYh2Aa/P/AbMhjVWU9NLo2p
         LuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794071109; x=1794675909;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsrMgj6bLCNF471e8BX5RjLkU1AefdOx5U9fzWvZrc4=;
        b=dhaBxsot40Eu6YlTe0lfBUsEey8wXTsexLtqVqp4fer4QrjWeCn3QdFdUTWWLBMvGt
         OBqSf2XeUhY+kRvrcHSWEWoi4fioY14u73Qsq7f+xGZbWvdiwjdL2nSsF/WkwbB3bAAP
         1MUxwW6MZn80kQCsfBu+VT7cQMTNssSFD/nIMcmrtMAFKZm8feVQaq0InwYM9kXIt4Il
         2jmp4zH3xoFkXDR12qAcDKKszS0PsplRNBk6oINo0bzTb+QXdzsFaQJxbT4B8BashTrs
         l0Ft4+/QWiQbd7usmPllZIiqKoTEdcWk4r/0UWfXu4sA6yqwPPoyDUxfzQuHQ++9/hnh
         YV/w==
X-Forwarded-Encrypted: i=1; AKwUvBw4Xh8kXEIX1p0sjUQXcJrVKpO+sogGeeaWzHyYqF+OK/w5jS+Ar/FXUH/5lVUK/X35vd6MOcirbACjq1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K7bcrpKguBNhQiLWqAy8cdZdkkxOfu+Vghj4q5lYIl5gsF40G
	MosIr+66JFfnMcZSmrdSP5px8+4eCcCe73X8vN5gYWGMBdIP9u2C/AUy1meCfGm4
X-Gm-Gg: AYBFou1ibsYwC3JCDYg4cwiHHGl+jygc2xuNcPXOHkwB0Cqy3dOCgY+P1QvTW/meQqP
	RMDVHArIUKxlZgFi/RSHjMf5GTiUJOWy/xnLYAEmKSjp8Fr85asiOeDK/7l7vubBMv1DA3z1ZMe
	yjT8Wumj8aE9eeT9yuXeNBCbMD9v4Y+y5PJl73N1ojr2eI5nU3qBvrAnTTr43+P1PGKJLY/idXf
	fQIpQLsGRxC9k/W2QmhUJvZ131Pvern3d+ca176f7B3QSMxp7hEohWHHMy8VvXDvq3tW/rFd8M8
	89NI3tW8iwdvkkeJkPCdOeHyMG+T8drh/UnGTlk/ExblCzFdUA1Ajgxx8GiBfPI9R3kCaYOfrOY
	g/Cwsoe/jQZz8eznDzNRyQx8xeyfkBmLmUlXLwdKMtycEf8YxZqD07n81GjT4uVY6pL9NU64K9q
	KFtSdqpYBwpd7ZOHxEvcYJmk9GEl4LmhrD3LlgvB2//QLpDRTAn7bVxuYKsBoUrWe4G4n+C0jDH
	hdBgL0morIBn2PXnKofdeawmGykVnGdElZn/muF5q2q0rGMd9YK62ayCojpriiV/QQkljfV8L+I
	5PEX2O3glRG7MBJRnOutKo3ur89d8bXWQsWo6ABzVbmFutjhcNwhHJAPp0t8L8tW
X-Received: by 2002:a05:600c:3f0e:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4b6db0d060fmr107153375e9.2.1794071108761;
        Sat, 07 Nov 2026 09:05:08 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e329153esm94149515e9.14.2026.11.07.09.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:05:08 -0800 (PST)
Date: Sat, 7 Nov 2026 17:05:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/39] sysctl: replace overloaded extra pointers
 with typed bounds and context
Message-ID: <20261107170507.0d66cc2e@pumpkin>
In-Reply-To: <au85ISJ2qUsB7y-6@hobbes>
References: <cover.1793204511.git.wen.yang@linux.dev>
	<20261029105837.2f8bee67@pumpkin>
	<0316f664-d98c-43be-92af-13c30436727a@linux.dev>
	<au85ISJ2qUsB7y-6@hobbes>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 16:27:39 +0100
Joel Granados <joel.granados@kernel.org> wrote:

> On Mon, Nov 02, 2026 at 11:40:40PM +0800, Wen Yang wrote:
> > 
> > 
> > On 10/29/26 18:58, David Laight wrote:  
> > > On Thu, 29 Oct 2026 00:34:39 +0800
> > > wen.yang@linux.dev wrote:
> > >   
> > > > From: Wen Yang <wen.yang@linux.dev>
> > > > 
> > > > struct ctl_table describes an entry with data, maxlen and, until this
> > > > series, two untyped misc pointers in extra1 and extra2. Those two pointers
> > > > have accumulated at least seven unrelated jobs: a fixed bound, a bound read
> > > > through a pointer on every call, an object or namespace pointer, a small
> > > > integer cookie encoded into the pointer, a lock signal, NULL standing for
> > > > "no bound", and a value the core itself casts to unsigned int while
> > > > validating a u8 range. Nothing in the entry says which job applies, so
> > > > readers infer it from the handler, and the core gets it wrong where it
> > > > treats extra1 as an unsigned int.  
> <--- snip --->
> > > > (~574 new min/max initializers) instead of pointing at constants. The
> > > > sysctl ABI is unchanged; the parport spintime minimum is corrected as
> > > > described above.
> > > > 
> > > > The cost is 8 bytes per ctl_table entry on 64-bit (56 -> 64) and 4 bytes on
> > > > 32-bit, because priv is appended; the range read path gains no indirection
> > > > and the migrated entries no longer dereference a bound pointer.  
> > > 
> > > Can you remove the little-used 'priv' parameter by making the extra
> > > information just follow the table entry (nested structure) and have
> > > the relevant functions use container_of() to get the outer structure
> > > and extra values?
> > >   
> > 
> > 
> > Hi David, Hi Joel,
> > 
> > I reworked the context side of the series so that priv is gone entirely;
> > and the final tree has no per-entry context pointer.
> > A small helper recovers the enclosing object, but it needs the slot
> > index from the caller:
> > 
> >   #define sysctl_table_container(entry, type, member, index) ({       \
> >           static_assert(__same_type(*(entry),                         \
> >                                     typeof_member(type, member[0])),  \
> >                         "pointer type mismatch");                     \
> >           (type *)((void *)(entry) - offsetof(type, member) -         \
> >                    (size_t)(index) * sizeof(*(entry)));               \
> >   })
> > 
> > The reason plain container_of() is not enough is that the core keeps the
> > table as a contiguous array.  For
> > 
> >   struct addrconf_sysctl_table {
> >           struct addrconf_sysctl_ctx context;
> >           struct ctl_table table[];
> >   };
> > 
> > the handler receives an interior entry, and
> > 
> >   container_of(ctl, struct addrconf_sysctl_table, table)
> >       == (char *)outer + index * sizeof(struct ctl_table)
> > 
> > for ctl == &outer->table[index].  It only returns the outer object for
> > index 0.  Passing the index explicitly keeps the original registered
> > entry usable:
> > 
> >   static int addrconf_sysctl_forward(const struct ctl_table *ctl, ...)
> >   {
> >           struct addrconf_sysctl_table *t =
> >                   sysctl_table_container(ctl, struct addrconf_sysctl_table,
> >                                          table, ADDRCONF_SYSCTL_FORWARDING);
> >           const struct addrconf_sysctl_ctx *ctx = &t->context;
> >           ...
> >   }
> > 
> > Shared handlers get one wrapper per slot; the common body does not need
> > to know its position:
> > 
> >   #define DEVINET_CONF_WRAPPER(attr)                                  \
> >   static int devinet_conf_##attr(const struct ctl_table *ctl, ...)    \
> >   {                                                                   \
> >           struct devinet_sysctl_table *t =                            \
> >                   sysctl_table_container(ctl,                         \
> >                           struct devinet_sysctl_table, devinet_vars,  \
> >                           IPV4_DEVCONF_##attr - 1);                   \
> >           return devinet_conf_proc_common(ctl, &t->context, ...);     \
> >   }  
> 
> Two questions before seeing the actual implementation of this.
> 
> 1. This means that we will have to add more macros to the sysctl
>    callers? There is a clear signal in [1] against overuse of macros.
> 2. I understand that you are doing this to avoid having priv. Is it to
>    save memory?  Yes. priv is a void* and we are also trying to get rid
>    of these. But this changes removes the use of two void pointers and
>    replaces it with just one.

The idea behind removing the 'void *priv' is mostly to save memory.
There are a lot of systctl and hardly any need it.

This solution does look nasty.
I suggested another where the size of the array entries was passed in
by the caller.
If that works it would allow the per-value function use container_of()
to get extra fields.
That only really helps if only a few 'private' functions need it.

David

> 
> Best
> 
> [1] https://lore.kernel.org/CAHk-=wjUmLrJd4KM4xvJHUN4P0r8oSu5LyvG4JipnhxizBrE9Q@mail.gmail.com
> > 
> > Single-entry tables simply use slot 0:
> > 
> >   struct devinet_forward_table *t =
> >           sysctl_table_container(ctl, struct devinet_forward_table, table,
> > 0);
> > 
> > 
> > The series is 20 commits over 134 files, with no priv at any point.  If
> > you would prefer a different shape for the helper or the wrappers, I am
> > happy to adjust it.
> > 
> > 
> > Thanks,
> > Wen
> >   
> > > David
> > >   

