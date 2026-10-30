Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365696;
	b=bRvROvmp5Ct2EvON9+cBLq8+Mhc+2btxEuq31aVOpyw8wKipD1ISLkdKcxPijUhEFJ8w
	 IVtNMu+I05oSwCFn/deJOnlVz7nzPS6cFZ/AXJvOz54v93Z2e6Dx7Gj8ZpegGqtGgVqSl
	 +NhfGIptFhx0MBt2GUHXo+0n1ci4SoMlX6qZ6YjNu/8b5CB+swHKWlPPr/GBTfbrPAZ1g
	 maChcSHSoSGPrr9iYCUYwBP+Tqg7esAkyYvL8Tr2mI2UjPfzNyLuoE/Ll19WnvCr3hMJn
	 DYipyUhu+xB1O554Cz1+U6935hWzfXvf98kS5oI7yT+1weXEiZPmZiQTSb7geqRCoFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=tbKkDfSrsNI3XHQAy/Crl7KwhoEpqjXNtSdtk80lCW8=;
	b=Hy+fi6adWO47AKsNsmhd/tnH/rSB+UQX/dF+dmZgXArSBZR7XJL6bSsBLOT+ro02KtcV
	 abLjkyYC2jCbvwtNaGpOTJr+vCd0UcSFfSN45B8M6tn48aLZVUTf5D9Ka4668h2PDnCa3
	 I2t437DTd5ZqvvWBYh7tyt/lywsqs7BSWRI7w6fvOtpB2p/yJX2Azjt/QUxGmH4uolpZO
	 vGcz4TvPh5Y+HoJU2mpBd1OoIAboR8qZ9q5+2sjojLnfBwk8Vjg500VQZcKGiTlcT78OE
	 rO0A33sViB4n9cugjv2m4o7WeceNGdBKqHlkXcWQ4h3bCunlqLSMkwxj+s8GwPAbr1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=qglcOBdl;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39BD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=qglcOBdl
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8565d77c277so5581907b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793365694; x=1793970494; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tbKkDfSrsNI3XHQAy/Crl7KwhoEpqjXNtSdtk80lCW8=;
        b=qglcOBdlxqExNnKNr9WJQFtaTi7hDrTa2j8FfXnoY6QXcAb7NSQHHQOEXtAntspqSq
         DV0NnbNmPi8XS5+LqmgdE0gUDFtekniCIyp7pF38uwA3xxDkTeEZIeY5g1FswYmwVbsw
         d1lP343ABe/ITAxcoU+yDsz9sn7ps2rQ0OpO0Dz6yJ1CNuDyyGCAcSz/VjKEv85NnRK5
         gFbQj3Erf+Pf2vJGXNcihtGbZxZ9YX5SleJUTE9omUFiPV0gIPwjIYrJJxnYGTESz8L8
         NG7Z+2pcEz9YduJaHwBOzLaRNcNsX2GC64gi2IPjcs3n364i8Tp94Wzjh2cBfzaXT/Hk
         Ehbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365694; x=1793970494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbKkDfSrsNI3XHQAy/Crl7KwhoEpqjXNtSdtk80lCW8=;
        b=gCqI2F68CbR+H6KCOb0LYe4oXZQCdKCNfi/ZR4z5h5Bixje/rgViyBoToSBsKohrv4
         0W7sa2vCZ7ksxX+amykvc217B1nuN8DYSvs1NbQfoeHyTN6aZFFUZ7T9wLUPUWPa0PZk
         b3qxfd/tLwrxIa5HEheEJ1+zbPKS/S9jJX0gX0vf+CTyJ3gkUAlbFXGfp3qMNUL811O8
         u9JuctVX9gwZsZbeEw+ubu/pdYigUq8ALz3yesPjavDNApXQ4gkTrLrENYSOhZSJFF2k
         BCVHs/vh2bhY8g4nmcRjhN7hvt3qUWPZ+mYLCTnKlRVROGrLjv1ISayTbCY1grsaqS7I
         lE2A==
X-Forwarded-Encrypted: i=1; AKwUvByDqA4JuvYpq/ym+f1GsE6uNNmq93Jsb+oLGBfLb0Z3PZi9M57eb1platm1AZbTfdwJsYmKlnB18olPh4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZfTv7w1OLy5jrJd6V4RQJNuv9lHW96UjbXEtPRhma0skc+CAe
	MxjHP2SgXSPVmL8QvAyekHW60jrb7GBfQspw6dp0k0QXe0qxs07DySYg+hcpnm5uKhY=
X-Gm-Gg: AYBFou31UjlyjbXOf2fXv46EwLa/+Hw/3VM9us0eiJ39NrAX7GSQpkWemBek8FOVcOC
	5Pnet8U6jdZHP5WEJqrijhGItAlUdZ8qPppPoNW60xgCZqZQi+kJPgTF5oeVmYBx6J1G7jKk+xV
	zNeLprSpsvdGiV8LKrO1fNSc8ek6khagZVAAAgytdO4b5KYUijepLhbbVaqvIdfnzsXarO+1YTJ
	IUjIxjQXgh3I9OuJtlBVtPOfx20x9DKn99OFj9oYesGSFX4Dv5L0WUD0RLOWcx7Iz/7d7Tk/YmA
	6Jk+h5TtJr3ZD03q14VEs3luYa51squ28SmaiqKOUHyfqdw9EJEXfcOdGarmCbLPoKPvXjgaKIR
	0Z2PedQWb0nHLFW5zobW/qG9gDkDG/3vDGuYFFQD55Iiug1s4TQSFE7qvCAujADz7iTWmn4ppuY
	kLZw+fh29s3hW2+Bd5btzvlgAMB46WdKfljbrE7PaD9OXsQ17+zVSDWaPvKoYXMmfmV2lsjmKIp
	WD8Q4ZCma4a0FHRwZG4RWVJAi3XYFbZ9jZOs9QHw04YhiOEJBiPlezEyz7XmyDBMP0olVs+e9/i
	mvWgrnepRVkQh4QUbzAzR3mFdEQpsXTelh/CMjWyOAXCJAECsQ==
X-Received: by 2002:a05:690c:9e:b0:8b0:9e38:f407 with SMTP id 00721157ae682-8b2b672f790mr14821957b3.32.1793365693838;
        Fri, 30 Oct 2026 06:08:13 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7198c65sm7731727b3.36.2026.10.30.06.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:08:12 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:08:04 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>,
	Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH 2/3] mm/swap: account synchronous swap reads as memory
 stall
Message-ID: <auSWtJzFQ7KdElKL@cmpxchg.org>
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com>
 <20261030-swap-fixes-v1-2-73f73a59f2fc@tencent.com>
 <auOz00OGB_8dgniC@cmpxchg.org>
 <CAMgjq7BYgXLheXDyc=p2mNgxdP3+92v2WHGiXiweDrsiYQ0u2g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7BYgXLheXDyc=p2mNgxdP3+92v2WHGiXiweDrsiYQ0u2g@mail.gmail.com>

On Fri, Oct 30, 2026 at 07:16:51PM +0800, Kairui Song wrote:
> On Fri, Oct 30, 2026 at 5:00 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Fri, Oct 30, 2026 at 02:31:42AM +0800, Kairui Song via B4 Relay wrote:
> > > From: Josef Bacik <josef@toxicpanda.com>
> > >
> > > Swap-ins from SWP_SYNCHRONOUS_IO devices such as zram are no longer
> > > counted in PSI memory pressure or in the swapin and thrashing delays of
> > > delay accounting.  Refaults of the workingset from zram, the main input
> > > to userspace OOM handlers like lmkd and systemd-oomd on zram systems,
> > > become invisible in /proc/pressure/memory.
> > >
> > > swap_read_folio() opens the accounting window with
> > > psi_memstall_enter() and delayacct_swapin_start() and, per its comment,
> > > means to count the submission time.  For synchronous devices the
> > > submission is the entire read: swap_bdev_submit_read() does
> > > submit_bio_wait() and completes the folio.  Since reads are batched in
> > > a swap_iocb, swap_read_folio() only queues the folio with
> > > swap_add_folio(), and the bio is submitted later by swap_read_submit()
> > > in the caller, e.g. swapin_sync(), after the window has been closed.
> > > By then the folio is uptodate and unlocked, so the fault does not wait
> > > on the folio lock either and the read time is not counted anywhere.
> > >
> > > Found by code inspection; not reproduced.
> > >
> > > Fix by submitting synchronous reads from within swap_read_folio(), as
> > > was done before the batching, rather than from the caller.  This gives
> > > up batching of readahead for synchronous devices, which do their I/O
> > > inline anyway, in exchange for keeping the accounting simple and in one
> > > place.
> > >
> > > Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")
> > > Assisted-by: LLM
> > > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> > > Signed-off-by: Kairui Song <kasong@tencent.com>
> >
> > Hm, this isn't a complete fix to the problem described. IO throttling
> > happens at submission time, so there can be significant delays on
> > async devices too that are no longer tracked since the culprit change.
> 
> Yeah you are right! Thanks for the heads up, not only a sync isssue
> indeed, async devices are affected too :(, throttled swap fault also
> went unaccounted.
> 
> > How about keeping the accounting window open across the batch? Opens
> > on first read, closes on submission. A batch with at least one
> > workingset folio is "contaminated" and the whole sequence and
> > submission becomes a stall. Would need to pull the !can_merge flush
> > out of the batch-add function to get the accounting window right but
> > that seems reasonable.
> 
> Won't this cause an amplified PSI reading if only one folio in a batch
> is workingset? Maybe not a big issue though.

Hm, I think the only option to avoid this would be to split the batch
and flush more frequently, which I'm not sure is worth it. The batch
size is only 32 folios...

diff --git a/mm/page_io.c b/mm/page_io.c
index 22e5ac1d298f..806cfe633a95 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -207,6 +207,8 @@ static bool swap_can_merge(struct swap_io_ctx *ctx, struct folio *folio,
 
 	if (ctx->sis != sis)
 		return false;
+	if (rw == READ && ctx->workingset != folio_test_workingset(folio))
+		return false;
 	return sis->ops->can_merge(folio, prev_folio, prev_folio_size, rw);
 }
 
