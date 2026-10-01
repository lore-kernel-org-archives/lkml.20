Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304C6475344
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878212; cv=pass; b=K9glHHYVs94i2oWcGoXcPfTe/BTyTwXp7WFHmcpTffzTcXpfPTbpW0aI9I0/5bluTpXNXyEHkzcsgY9L3gYaMZOEj9YvaoJ5TkLrWyd9BE+Dg3adY/67vkqL9D6w0i4W8IPJXslsrpcS6BT5v2Me2Ljgy9Bs5lN247T28HhNoPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878212; c=relaxed/simple;
	bh=sLULirKGu5UiHsC0fEW6eH+OQcCaxDjewHwvgT5RAsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYZWxFnilPNNMs75vgU+6jwROMIUBlt3HxcXN8RmlIiGBpdDD0M3pwYpFh9e30pZWWbIWsuhltl0Ay4BvtM+ffPAKdtHtvw1mboHL6OLPOmNacHNY0bbvZwYPcQqPuI6WJHa/CiSxzlc1eDsag19PYy7N9z9J/fCIQdQVCRAhJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oF/5PrSy; arc=pass smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oF/5PrSy"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e402001e8so137916366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790878206; cv=none;
        d=google.com; s=arc-20260327;
        b=dmb/iTndNYvfrjIRYCfRXHJNnMp0hR/mYr2tuBhVBtFcTxp0crPTCm8+23eqX7v7bg
         EUWBpUh7zQV1AvDOUuFurak10iiywvMQZnCkS+Hg2KWl00XoWz/QUqlm++hmst4gACr+
         EJ9B7+iWomHNeLBytrq5e0DYY6VUq8ptY0KBsg7UcSrRRdk/g7pIYGMGTfGcNbSvIFP6
         LMJQczddztUh3WKUbm9lSrGDTqq6cMd+UxYKyopKHlsJ75lOpe/eBMIn40nSgITIlOMi
         0GH3bc1jSN/4+pnAAHIOir2VlOOu9fnQLIAawi/x3WLsi/UIosmtPUc67Kb4YitjbC7R
         Psrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4I2Vz+ergA4RSskvAHqukolmbBD3+Bn9X7EL+PvL96M=;
        fh=qGrwZxPq3uVd5s6GMK01B9qvJP6iuUasnn41XQmg5e4=;
        b=fKjc9p6F7by+ZAvgPgPkXoq3DnJEHgQCXcqFY321N9SrAQitXwp8uWVUwKQ+YLh4Xm
         nT5McXDS1N+JBP63A3NqEBKUOtyV1cX8vCOGScvezqoCb9GR1hIr0imBv03Ovzd6melo
         Oc1SKpU2TQXkmtq1xWMnpo/FzaTIXaBFgmZIrBqMXmeUO2l/+tjNYQvJB0FNiQTfyTPi
         V4XAOGLKFF/UxwEp1vMlnGvf5a1MdfAWW+IsHphlmt1loO9uV0ZzXFDls7zmDLC8oxK2
         ZvCg92VpSydUtUwogRYvVTSWkcgsAIgtccEH2hxFUbsnNy/yqBryYQLLDy5if115SMVD
         6NAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790878206; x=1791483006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4I2Vz+ergA4RSskvAHqukolmbBD3+Bn9X7EL+PvL96M=;
        b=oF/5PrSyHEDiggGO2CHySqiZFf1dRX3zSK2hXPc076/3NpEX3kU+q448Xx1sLnEXs/
         2lKqLvY9MIeoayewq/1+0T3gx8IyW335aUNdzSK22lrNp46kRNMl8NCgV9/iU/MioGiV
         TUj5FxX6gL0uXkajSrxS7l7y6TYASo9yz8C2Ui2zSKwRukKQcr6wg3lHKai4Q26B6+/U
         SI0tebQ7WLownLeJhLJf0Dz9yMuYvvefHDsM+njKSsvUtG635nvQkdODmhNQN7ctoyEx
         b9jk+/UIwdxGU+Qz9I7r0QFroF+3JZaabP6Bw4V51hvjnlLF0DNki0Ox8qTgrT6Iq4u8
         O15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878206; x=1791483006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4I2Vz+ergA4RSskvAHqukolmbBD3+Bn9X7EL+PvL96M=;
        b=XCmTLI8UOrU1cNG4nXJxsvJFC8bY76PAUUCg0I6mBqVDmj2xn3PgTfJMYaWx+DL2fC
         uI4TbxHfgD3ut84BkDKgfGgedSIY7s35Vm9zVkiifBJVu+ZiQMLRlIzxqc3W3sQdYHo7
         kmR1JuvlNemOtEAUvwS+OF1F/L+hnK7fmCO47Db3ox0OPVZFlZwDnwLCheikWD/vki48
         rhSa9R5Q8OJNuTwjIZEPq8HSWHVBRbtvk+fd07crLKXaZtukBiiyx4xjrxObwH3Sx5xw
         N2O3S5bBwr4DuB36qyugVEqK9bQhs5vimpERorACgWPzCvtqwBBeLHUrvvvuvYP8Hfzf
         V9Eg==
X-Forwarded-Encrypted: i=1; AKwUvBz7SISC/xEzfyPJOCzQ2zLSoVEhsLXLrDWve72fPddej027mxKux3oEY1MXjUQOxBYpoQ4Xshb7qW1OWJw=@vger.kernel.org
X-Gm-Message-State: AFuF++mBiNM3iu8SfEk3xDpIA8WV/4PKh0cpTFt+p09wmmArfCa6TXbA
	bFsNsPB1z8gwUsn4UyLghuQT2FmkzoHtit4CxL8yR0VtW5vif0Y5mpHKAArhDUYWMbWe/33GibS
	L6YY+5cZBZVVTeBHsBYLf5dqHUp/EDk4=
X-Gm-Gg: AYBFou0NQlz4Z1xVUte/4zYUvW2GVmXF2yE/HikUji9ZOTgeR7Mh170Z7DeOaIT9Zb8
	tTMdxZiZETD5OisBZykGia+JhAordVB2QGORp7ftJ0z81wpKtZQM9X0sdomMTLPFIjgVwLX4dON
	nkBC1LZTVqx36kTqRC/vYMasVRfu+vj7Y59jCn7aHVf1lGSi4AuSMh0Ze8WIojf2VKjncf87xxr
	sXKnWF7lysvJOpX4tD3YkxM/Ho0Dpuakd8ohtJIRnzgfUPjqIhBB03yNiZ5RaTcyDPxvyUbj6gB
	vrTBPp5dBVfnTpsZJJ1tcvtOg0urVcj8+pVjgHkGJGrOFLIAHpa3a/HQHsalGTVm+sfXk/Lz/Tk
	wg80hJFfT6zsj
X-Received: by 2002:a17:907:3e93:b0:c2e:40d6:25e2 with SMTP id
 a640c23a62f3a-c2e4ade8986mr33476066b.12.1790878206125; Thu, 01 Oct 2026
 11:10:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apcVhWzEwkwHYjB1@KASONG-MC4> <20260901220430.79810-1-baohua@kernel.org>
 <SJ1PR11MB61051CC2791B67C97BEB2D4B8CB72@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <CAGsJ_4yRJnr4xXdokVHu85b7XPe0p6rZ+Lzv4sE_gCWdOF4YAw@mail.gmail.com>
 <SJ1PR11MB6105505CAF620B23978FBEF18CB72@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <SJ1PR11MB61057EF65B62E06E2C2049008C812@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <CAGsJ_4yHZ5ck1hk+Lo-7aQudApm0Nx=4yssUDrRTz681PuW=tw@mail.gmail.com>
 <SJ1PR11MB610584E71CD980C9F85952F38C812@SJ1PR11MB6105.namprd11.prod.outlook.com>
 <CAMgjq7CMd7v=kYwWGSyt2LmMep6tQcFFsdyBpwc_X+s_Km=rZQ@mail.gmail.com> <SJ1PR11MB6105221B1EC807109A380C6A8C8A2@SJ1PR11MB6105.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6105221B1EC807109A380C6A8C8A2@SJ1PR11MB6105.namprd11.prod.outlook.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 2 Oct 2026 02:09:29 +0800
X-Gm-Features: AclHuK-a-3wgazn7n0gz_axw0P3SCaylrim0PItrMHLbW1XzCPxBGTrFy0VtYgs
Message-ID: <CAMgjq7AsLfzgkCodhjD=rSoeOSmNqG3E_7qt0egvy_nnDNNYfw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/mglru: dynamically protect readahead fault folios
 under refault pressure
To: "Ababneh, Ehab" <ehab.ababneh@intel.com>
Cc: Barry Song <baohua@kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Lance Yang <lance.yang@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Wei Xu <weixugc@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 1:21=E2=80=AFAM Ababneh, Ehab <ehab.ababneh@intel.co=
m> wrote:
>
> Hi Kairui,

...

> > > > > Results with MGLRU-FG:
> > > > >   Op rate:                  55.0k - 56.5k op/s

...

> > > > >   Latency 99th percentile:  6.8 - 6.9 ms
> > > > >
> > > > > For reference, here's where the other variants landed on the same=
 setup:
> > > > >
> > > > >   Regression (6cbdd9726fb5, "mm/mglru: use folio_mark_accessed to
> > > > >   replace folio_set_active"):
> > > > >       p99 ~9.2-9.5 ms, throughput ~41.8k-43.6k op/s
> > > > >
> > > > >   Revert of 6cbdd9726fb5:
> > > > >       p99 ~5.5-5.6 ms, throughput ~51.9k-53.1k op/s
> > > > >
> > > > >   My dynamic readahead-credit fix:
> > > > >       p99 ~5.8 ms, throughput ~51.9k-52.7k op/s
> > > > >
> > > > > So MGLRU-FG recovers most of the latency regression, but the
> > > > > revert and my fix still recover more of it: p99 with MGLRU-FG is
> > > > > noticeably higher than with the revert and my fix (6.8-6.9 ms vs
> > > > > ~5.5-5.8 ms), though it's still a big improvement over the
> > > > > regression's 9.2-9.5 ms
> >
> > Did you test the V2 or V1 of MGLRU-FG? V2 includes Barry's aging
> > optimization; I'm not sure if this latency is caused by aging or maybe =
some
> > other change.
> >
> > And is there any swap device you used, or is the test using the same ba=
se
> > commit? MM also changes significantly between different baselines.
>
> My setup runs Cassandra 4.1.5 on Java 11. The host has two Intel Xeon
> Platinum 8468 sockets, 96 physical CPU cores (192 logical CPUs), two
> NUMA nodes, and 440 GiB of system-visible RAM. Cassandra instances
> use CPU affinity, with memory interleaved across NUMA nodes.
>
> I run four Cassandra instances, each backed by a dedicated 3.5 TB
> NVMe drive. Each drive has a separate mount, and holds its instance=E2=80=
=99s
> data files, commit log, and saved caches.
>
> The stress workload uses a pre-populated table. Its schema, partitioning,
> replication, compaction, and compression settings, along with the stress
> profile and concurrency, are recorded because they can affect performance=
.
>
> I used more than one kernel version across my test runs. The most recent
> was Linux 7.3.0-rc5. Within each set of setups being compared, I kept the
> kernel version consistent.
>
> For the MGLRU-FG tests, I used the ryncsn/b4/mglru-fg-v1.8 branch. The
> MGLRU-FG implementation is commit 6bcf4ae70b5e; the branch tip
> is a619ab0105d9.

Thanks for the info! That v1.8 is missing recent upstream changes
indeed, so aging could be a bit slower, causing the jitter. I also
found a few other minor improvements doable, I'll also try to run some
Cassandra benchmarks too. Higher throughput and worse P99 is an
interesting effect, I think it means the LRU is doing better at
protecting the working set and maybe spending a bit more effort on
reclaim / aging, which could be optimized away. I will try to
reproduce and optimize for that as well while keep the series updated.
