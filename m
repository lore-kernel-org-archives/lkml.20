Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D3391505
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258506; cv=none; b=oM9VLbs3APkra8+0Sd6G4mgo7TWnWsMe49/ZMlsULCA7Dr0zLIFQwdtxw1yxTiI+ep9YeSurS0Mau2GcFOFnteV/BXI2F9yUrGVWusnD65Zz1dAk9mkxQJw37Y+mIlDjhBg/JpyPVEvqxfT0CgXp2hzVlAt7z+bmfWlJT/EbfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258506; c=relaxed/simple;
	bh=E9JLwgOzTTYUp//gOVT2Yw38SwLKuhS7cNx4LwO6IoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Injbx/73r/ZQ8VC0kRSqcMqDrJikIGRYzVaezS/SkI/VvPjZJvXvdwc4uMp1+aZFH77GwOwBEzprPOPGSdA+ijtHb1H/8IAxlTl8dRIDB8NFGebt9eMuXUzyP4tZG2QcqerMR1IMq8wfaOjAjN2SlYYKZcfUPoBDvJrtswkha8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Vd1I4utP; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Vd1I4utP"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so61004f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790258502; x=1790863302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVHqdIp5mN/SlCXCBlhMf/YG37Cfm8kONNXB9WYe688=;
        b=Vd1I4utPRpO5MQoYJd3BImbAbRTCvbofJtrjc4WaGK+9FanDKYNU3Ioi+4GgF0D6W2
         Wphfxr0MdpNjLvoJfKs6P7eLeLt3pUh6UUDEFkhePlIQgI0r6dEnuNdXWTila0ss56ys
         GNYppMAhsKa9oxQih0hAf62lPXxUbOzqpxjXvckFUMn5uOjbpxCt+GbsrXR+DrK1857M
         ZX4IkqmRGgWeJcZbquD8b9qVG6rqHn4KQhBALdVwWSgCuIzu9D1QkPcgUcIuGGi+4zHg
         FKs4on01N97sWB3Lffah38b9kvRGHGg10rIYtslH4mQntdasFEISpVdVwiYc41c4LYmL
         E3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258502; x=1790863302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVHqdIp5mN/SlCXCBlhMf/YG37Cfm8kONNXB9WYe688=;
        b=nCejtNR5NBkaWKvEpgO+QIrpBLjIX1YVE4dQ9LFdcgoQwjL8ljN+j2IYERDlu72GWN
         EEc+z79GBzeV7JJC8AQxw+cXGUDY15bRbkDnjDdKMk1iOVUEacXViQthiNFK012NtIVH
         HrceeVE0cN74B9PB36gVGRUJZJzz/QUiXuuBfJRJkqFI0Fh/91cHf7O2/s4JgkZRmtV+
         ml110Zz+reTAYn9ARlsXQ6wYThiYSRvODHjSD1PQcBeQmZH0guiZt372vYFWW9H2GcPx
         sY+cJfNZd9OhAsiRBOZ6qBXbCwVWBP8eN7JE5LWFnCJgJKwy2AKXA60fDq1nkYoIVrwo
         BGfg==
X-Forwarded-Encrypted: i=1; AKwUvBypG3PaPbCbceUqdWr+/IT5oNIKgBwysqtLRwzkgBIbUFDYmj/Y8mahTNZRPi+5I4DCjfTNr15+1LqF7E4=@vger.kernel.org
X-Gm-Message-State: AFuF++nIrkD7qf835R7EfepyXe72oL9vVILui57oboseCRaFoNqfQriy
	Q+pCBtAClVPmTIp3NOtQOh6nqs0We46zjZlM2xo/O7O1jZw73r2l8vgf/PCwblBmFQA=
X-Gm-Gg: AYBFou2kNHI9/mWqQdw1iBEgtwurKCKc9bQZG9YtY8XnKqnb/gXe8Yqcb8I2U717aiT
	N/NnwfcyR/lHcFzigHtB5/x1eLd+kMS2A0aKNbGKR6kZfGQdXzwZ3+WMxA8fjpSvDpPW2C2fBj6
	BZHejD3Aw05CVdBHQ9gmZYR43jrXIWyiovjXi0QhO/1dVtkUiPRGpt7J0n49mDzNpgoQsiy0NWq
	2jBoGl8FZ4MWQU8zUjwF3l8e9yFiT6dDhQ9DPHfW70T9Ko5nrFQq7V0iHbGCQ8m5GFccBOKGci2
	8ght8005HsKt5Pkn1Aqfyx818YFtbBOCMfnXGuIUN7MHH6t8+k2R+iAEwo12s3MMqfwWV4Ms6Uh
	yF1a6qcxEFqHUr7fbSJ0Vju0IaaZSzKV7jx9/0t9DAc0sT5KVfNmDWXh9Z0KTiRLtRAGKALtWiP
	dvkn9WP9HaBFkmTu9OgBlJHGvrlJT9PterBuviEoz0QwAnC0ratU23Mbkh8UEk0tE141XJiFJky
	205UEcSKRgZIBiR//cg6q9FtbZaHo9H+2M5Qhd6M5YrAbvjuYCCEkcMhU3amSlYQY4gvft+T3RY
X-Received: by 2002:a05:600c:4e8f:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fe66d062bmr44815485e9.7.1790258501429;
        Thu, 24 Sep 2026 07:01:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49febb20146sm2518575e9.2.2026.09.24.07.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:01:40 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:01:35 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 01/10] selftests/mm: exercise MADV_COLD and MADV_PAGEOUT
Message-ID: <arUsvfwbYjdcUp3Y@gourry-fedora-PF4VCD3F>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-2-gourry@gourry.net>
 <arPgwegm8XgbEUrO@gremlin>
 <arPjwPwVxdvdR5S0@gourry-fedora-PF4VCD3F>
 <arPl6UhNDbwds4uR@gremlin>
 <e459d3c9-ad60-47bb-8b02-bed3819e8067@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e459d3c9-ad60-47bb-8b02-bed3819e8067@kernel.org>

On Thu, Sep 24, 2026 at 01:32:25PM +0200, David Hildenbrand (Arm) wrote:
> On 9/23/26 16:46, Lorenzo Stoakes (ARM) wrote:
> >>
> >> I'm working on a solution.  Need better hosting.
> > 
> > Thanks! But yeah damn indeed you do! :)
> > 
> > Though larger series can scare people off so maybe better to send the tests
> > separately?
> 
> In any case, we have to break this down into reviewable pieces. We neglected
> selftests for too long.
> 
> ... and there are some schlopped tests in there that we really shouldn't have as
> they are way too special and hard to maintain.
> 
> Like this monstrosity:
> 
> +/*
> + * A folio faulted on another CPU can remain in that CPU's pending LRU batch.
> + * MADV_COLD drains only the calling CPU and must safely skip the non-LRU
> + * folio without changing the mapping.
> + */
> +static void test_madvise_cold_remote_lru_batch(void)
> +{
>

Yeah the intent of these particular tests was to ensure I capture ever
weird branch in the code before i went refactoring it so I ensured there
was no loss of fidelity.

I think we can reasonably delete ~15-20 of these tests.  That said, the
code itself is not schlopp, but I believe in showing the work.

~Gregory
