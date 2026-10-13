Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0F72F7F00
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910092; cv=none; b=IknFnf5z3HPCmXkKoLVuHaFP4GiLEW0isNv39S3FI9zFGr/CMTk2Mje+u+GPQIlXQxE6L4Lh7W6LXx1Fw4SB2S5tHxAGlYLjz7VHiUubcgEllNgWEi8CVAapPlvMNu9IruAk62WhD34wSy7yDkS1nTWTxjx9DmO+4B8Ff8HbgrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910092; c=relaxed/simple;
	bh=9KUDlykEh6C5KpXDh9ru042VdpWhJXyoMeTtwyXifSI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRblw+Ufjlk+r58xaWrM5hQW0308Ek8DYJxC2PuSUISxA1AdjpjejyGd/lq9LNozjo6K16K/BD3WykY9Ikir6uMGFDyeMoBkV3eU9EZVsQr1NzlrqQnMvxskSJQKEEWaBwy/Z6dMN0DPC7FI8oPivmqeDQXx09jmteK5sj7JaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6KjUDHh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6KjUDHh"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so2491252e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791910089; x=1792514889; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JrdkhjVWS0paU+Qy/xA3FUiCVMdE6viTRALFdsJ0zOM=;
        b=U6KjUDHh9KTz2HLsuhUQPdGYQj19g7gqbvzx1i4glcRbwE1ByUrKoz9iz4X8Kz6VjD
         7Bu/lbH+7yWTYADv1Iz4trtPZVAA58NblCXLjSa4Kir8rMog+GLvgAdM0yO6olUzw8W4
         EhGPmZZ3u2gWVoCj9zTxHhK+4XqviSdnv+MnwCxwiVp8Tz4Eq1s1iuf2BMrM5oIXipsT
         oc7anWNOJc3UUdPtjDiz/+OZcnX8ZL3lK3U69oELD9RfPDBbqRxjBJ9Q5sjZzxGriw/u
         xuvB8QkehoyvcQ4CDjpx7Yp9CqzUTzs2tlFoNSxiCcWjL6YtdwZWx6fhZTLVIH2rS4j4
         XaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910089; x=1792514889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JrdkhjVWS0paU+Qy/xA3FUiCVMdE6viTRALFdsJ0zOM=;
        b=HF8ZSgNgzb5v65v5YKNXqGGbwRV1sY5m2KRh1L6+YoQ8hL4bJNi12a5AjXsIMkarc5
         gA8k+pwNfF0+PWOssW2aeJlcPITq4TNsZZt+/cMuPuE1dhp1zPoesZJKxcPcOPdHRSxe
         KKGM9dYRAcvP6m6cW+JSpi1qA38goIywI2PtRW/LB4kASmHbKtfA05H4gbcfEI3e2joA
         xfQhIvXx4VzzgtxIC0aQogOcghb/74zGVpriCrJwoAKjGyWugMV2qFfxIAwUbtv7rbro
         lwFuM9k0X1SXy6CIHu9HTvT+s0UnXPn+J8pSyl/yMcAEDULPq3RL4MYkMx8DyR/i6/nd
         Rp1A==
X-Forwarded-Encrypted: i=1; AKwUvBzmID6qyNy4OT5mT8qc6PjZaS0p2SdNOZNIWh9xtZzSSdKzeR1ZGr8B8Nk3xSSa6vbKG9OUctc/56Ja2Ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9rs2AJwxjuh4KLvmXggO0wYGIJCxEVjOOide57DFyiZE5nMWK
	KcHSAzR/MtzBMgG+0kqUJX7GGKO0LKuBF/3BCKNXl1p//FOBd9g6v1i8
X-Gm-Gg: AYBFou3AzvAWznKkD6ThqZnz9uhkbwZWwXzIUfAnHP4PLy+0pTEqIIweiBk56Ha1JJs
	SRd8z/MY0fWbJCjQO4Pl6NGZTCFBDZz7eC6yfKGpi4eWm4AHX3FCW0/izQxpd031oavls4DaxPN
	LdmhXbVRbFDEdv15FUYGXTEMAiMMPEnzhffgwJUO+W0LwxcVQ9NaHU7QGFxI5WCT/UUza+WQN3b
	mPgvOrLZ5LM7mbdbtGddYvFaewTdVdgd/HnEK2ZklY30NLaCxUElk/S6VOBe5chHISFGNa+1oAg
	LnjFRapEY8ADImBsEdGsPbINW2Fed+MjW/fJdlcS1ZvGJr/PXRi+EWf9Dd511NB/sNWvf02+6Vl
	+bxdpOanh4HJmaYrVKYaYweKGxeHGSrbTdTFh2kv9iuK1t/+/WvgIhUZtYHs2WggRxn2rmPCN5K
	RZxtfj3Eh2voUL6CfwJ+xiwfkQYmNOlKnh1FiAYpNSp1ZOgFowZYD1rG2GYcGfZ3JcgNeGK6Xl0
	rC2Oi9zCjdMsJbDH5zOJXBq
X-Received: by 2002:a05:6512:3d0c:b0:5b8:f309:f275 with SMTP id 2adb3069b0e04-5bcde8cea91mr4857257e87.58.1791910089239;
        Tue, 13 Oct 2026 09:48:09 -0700 (PDT)
Received: from pc636 (host-95-203-22-87.mobileonline.telia.com. [95.203.22.87])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd2f24sm37276021fa.28.2026.10.13.09.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:48:08 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 13 Oct 2026 18:48:06 +0200
To: Suren Baghdasaryan <surenb@google.com>, Hao Ge <hao.ge@linux.dev>
Cc: Hao Ge <hao.ge@linux.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 4/4] mm/percpu: stop unmapping the CPU that failed to
 map
Message-ID: <as5gxn6i2DD0iprj@pc636>
References: <20261009063619.112313-1-hao.ge@linux.dev>
 <20261009063619.112313-5-hao.ge@linux.dev>
 <CAJuCfpGEgTocqrdpOtkOfks-geU0vVMZudNEG5+XWi3sxQdymQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpGEgTocqrdpOtkOfks-geU0vVMZudNEG5+XWi3sxQdymQ@mail.gmail.com>

On Tue, Oct 13, 2026 at 03:46:43PM +0400, Suren Baghdasaryan wrote:
> On Fri, Oct 9, 2026 at 10:36 AM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > __pcpu_map_pages() clears the PTEs it installed when it fails, so
> > pcpu_map_pages() only has to tear down the CPUs it mapped before
> > the failing one.
> >
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> 
> 
> > ---
> >  mm/percpu-vm.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
> > index 509d8901835c..59d3a336a6bd 100644
> > --- a/mm/percpu-vm.c
> > +++ b/mm/percpu-vm.c
> > @@ -252,10 +252,11 @@ static int pcpu_map_pages(struct pcpu_chunk *chunk, struct page **pages,
> >         return 0;
> >  err:
> >         for_each_possible_cpu(tcpu) {
> > -               __pcpu_unmap_pages(pcpu_chunk_addr(chunk, tcpu, page_start),
> > -                                  page_end - page_start);
> > +               /* The failing CPU's partial mapping undoes itself */
> >                 if (tcpu == cpu)
> >                         break;
> > +               __pcpu_unmap_pages(pcpu_chunk_addr(chunk, tcpu, page_start),
> > +                                  page_end - page_start);
> >         }
> >         pcpu_post_unmap_tlb_flush(chunk, page_start, page_end);
> >         return err;
> > --
> > 2.25.1
> >
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
