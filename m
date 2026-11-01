Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793511118;
	b=nUnS4CrJhL5HLtlSCyL1YS+48SK4t4QmPZBtGbc+xP4476tPJmbuW1fGfRZQ8CqFPMH4
	 WZP9cGW68Wgwj29awS6FUlx5C+BRJlCyw8untrXRsmRXbnksrlSWdtOpFgIhG5xz/s/mJ
	 WvuCZMasCnNLr1o/C1eCV1yXvDeJi8Py62DJG/td151qhhfSOkSWjbDFZ4S10gU2wa+w5
	 vQmGAxyOfWmy+kodt0cptAtxsnCIMJ4Yw8GBNrDMqpwNLtd4mEcFW8fNgpihSC2VRPLU+
	 EYS6kgSB3LvfqgNPRj7VdPWSJxRuSiuy2H/A7nMor+sRmvIdq3Ay16DHHVjMQCzwpoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793511118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=XVwPKoe9RjiKHmMO6/+ENKIpPwM8V1vN0DPm5EJ76mY=;
	b=IN482XFxOOGM/nlCjU9DYAY4N6uUQ7LoNRfGkJsLq/++/N3ZbVbD7GhNsXEeGZaMFoFj
	 5a9ScXkXbBwWKWfTtCQynD7yCTUvERUskxaPwi8x0CFTp4ozIkkNmwJ8u0LqIaIhpE1bR
	 EfzoV6jpNlg6pF+X+QrBdtXpUKK1lBBS36RwbuhW8zBg/SMtkxfu6o6e23bN4vgTcYKrd
	 K6o7ou3x4ekcOaa7IPuxFstF/Nn84CA8QTbpIJ87JGQByLGEzRClhlL5jqgS0gP6xf8Rg
	 fwbUpvsdQ2wx4RF3dsOq4rtcP3QifHCn77iD9Ykwv1n5BCXkMyNUuSxNWqQwh/Ko9aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jgUlSuHf;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9775E606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 05:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9775E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jgUlSuHf
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so34005ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793511117; x=1794115917; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XVwPKoe9RjiKHmMO6/+ENKIpPwM8V1vN0DPm5EJ76mY=;
        b=jgUlSuHf06M9uujyWqNHLI95zdxW32DG/F/8axwNdb1iGXk0FccdSCqQKnnEwKqotp
         R5h9wJe50JXq8pHTbJOkmAK1O7aHoXHWcK2c4ihZsbQ9exo+ZGPoJKWq4JWRVqymFvBW
         tjl7ohbXSWNMNzoz7rl4ZS+jMwjYpT4DBiyXlNqGEWinD41+cf5pp+jbjqGpRalxQshA
         YgWUb0WWkE3YMh+CIcDOanCEP4VdIYE8mGI7/RrPHVtsFTSFuCUK/s4PHsjuYfK6Ey4E
         K+FfNaSj4cTENyP4AT3Xp96Lkiv/G5fn8k8dwkaN628PAEWvfQ6uBUqx85UTTHHYRNoy
         qiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793511117; x=1794115917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XVwPKoe9RjiKHmMO6/+ENKIpPwM8V1vN0DPm5EJ76mY=;
        b=PtMaQQWXWfH1gLk/RslRGDNl8FBu/JkfAKKnbxXYWfD8XHedZbl/3dLirZb86hqy0m
         UQy4voWw0bPXsDNA7uYPDI9ShcfiBYRf+rHu0f84q0hlTqfLJu0k6UYHcPT4sKbh52TC
         i1IgjnUGpM3yUFc/bLQRE6wxxECpMQ/rk1slBdyc86WI/62broVGFO3DSNhIPDp3l8/s
         0nYODn3HziTbLLbgRIr/SQwgVDDsBPw8n6sJp+PzWoCLJ1lMtuh9BkE6wiOeICIhzDBH
         0qUtdUTmhBewBSJSXFL92UPiCKniIaR2YKHz8C9nz7BBmDr9ttYJb86tbOy/8B5Z/3lN
         1Itw==
X-Forwarded-Encrypted: i=1; AKwUvByJa7ApSHqQ/NqQhujN8CbPeECsZ7ZJsULCSE699MzQz+4LrCmg1NMIXHO9KAaFjSjdzUr6p9I/e3NVoWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5uG9SDSkj4nexdV/Yw7PeiLwSUhVrbAAyz2AetMqqh5nYHS/a
	FNZnrjBWcXtVZejBJukEQ9Dme6I7FhFNAYTAJtdF4TDwJcQupSFRsP+drVF8K16now==
X-Gm-Gg: AYBFou1vTdXc5qj1zTTa5MVHFVSGmPAkbHuQ4wfvVzRwkU+CITNxiGBNFHTf9abE7ny
	nyF0lzQ2oUEEZoZ+N3FOuyUz8350YqUZTxX3GP1sCj3jNPz+KFD6mE1e1OnJXU45w7yZrkpgt/H
	38GBWJ9szssinqeAkIqnLyrmlXWZDrdjY8prBMUOVRigwJOiiMQ8TC6x+FnpbMdjkh4hpvAeR/i
	15E7Veg51+B/ihpJbRI2CjgJ6dTtOyf3KK+DIjtt13ZZEX1+iRoRfirvvdovSqvpGgemm2RMQuK
	q+BFghDZEi1eDqxgMopER2T7ftg4CV+RSCoe1BDmAGlUNA6wcWAzWDUuedDa2Hgqlu0+tLKp3T+
	fW38TDIKT+CW4XCAKEW9oCMQKACusrODfXz6BD1PJdvdcFPsH0qC1ZlP/VXns/awmFOBpLbqVKI
	9hWaIMBneow/4EnTER7Z4lertma3XpiDMZokL++wyq/NaUPfCOIPYooHuovhckx40pzohIPT7yl
	rnTbY97YHu0oc6ZwtoArcZGgvUxFKT3LK3mUfq3Odj9xq82Lh4GHRh0fMwLQKwA5Gp/8TxbAFqL
	culG8OMd/ZPj4Qgr8xMfW9rBXy999/J1iJQi8GxvqK+aj7T4zjAN76UyUloCsZIiOe0Gf2yfct6
	Ta97u0XrtWb+tdyyRnRq0
X-Received: by 2002:a17:902:f541:b0:2df:42af:2f9f with SMTP id d9443c01a7336-2eb1ec33fd5mr15542125ad.1.1793511116342;
        Sat, 31 Oct 2026 22:31:56 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09614e4bsm1987052a12.4.2026.10.31.22.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 22:31:54 -0700 (PDT)
Date: Sun, 1 Nov 2026 05:31:50 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Lutomirski <luto@amacapital.net>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Chris Mason <mason@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mm/gup: check folio->mapping under folio lock in
 memfd_pin_folios()
Message-ID: <aubLkqA-aWrcklwS@google.com>
References: <20261031203540.2282507-1-skhawaja@google.com>
 <20261031194058.d3bd25ed950e5340ab595f07@linux-foundation.org>
 <CALCETrU76ThzLDbUfpoota5=xcoOS4aZrwgK2B3ELkYcFOjGJQ@mail.gmail.com>
 <20261031212507.31609e7ed27de35253b226c3@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261031212507.31609e7ed27de35253b226c3@linux-foundation.org>

On Sat, Oct 31, 2026 at 09:25:07PM -0700, Andrew Morton wrote:
>On Sat, 31 Oct 2026 20:20:03 -0700 Andy Lutomirski <luto@amacapital.net> wrote:
>
>> On Sat, Oct 31, 2026 at 7:40 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>> >
>> > On Sat, 31 Oct 2026 20:35:40 +0000 Samiullah Khawaja <skhawaja@google.com> wrote:
>> >
>> > > memfd_pin_folios() pins folios from the page cache without taking the
>> > > folio lock. So khugepaged or MADV_COLLAPSE can replace the folio after
>> > > its refcount check while memfd_pin_folios() still pins the old folio,
>> > > and the caller ends up with a folio that is no longer part of the memfd.
>> > >
>> > > Lock the folio and recheck folio->mapping before pinning it, like other
>> > > page cache users do. If the folio was removed, retry the folio lookup
>> > > from the index that was removed.
>> >
>> > Can we please include a clear description of the userspace-visible
>> > runtime effects of the bug?
>>
>> It's straight-up data corruption if you manage to trigger it, no?  If
>> you manage to race a memfd_pin_folios() against collapse,
>> memfd_pin_folios() will pin the wrong folio.
>>
>> Fortunately, there are a whopping three callers in the whole tree.
>> You can hit it from udmabuf or iommufd or memfd LUO.
>>
>> The former two will direct DMA to the wrong folio.  Fortunately it's
>> not UAF as the DMA will be directed to a folio that is still pinned,
>> but it's the wrong one.  DMA reads will read potentially stale data
>> and DMA writes will overwrite that stale data but not update the live
>> copy.  (The DMA will not be directed to some other application's
>> memory, just to a leftover copy of the calling application's memory.)
>>
>> As far as I know, the effect with LUO would be for stale data to
>> reappear in the memfd after handover.  With the patchset that started
>> this whole discussion applied, I think it might result in misdirected
>> DMA to freed memory (I do not stand by that claim at all), but that
>> patchset is not applied.
>
>Thanks.  How's this for a changelog?
>
>: memfd_pin_folios() pins folios from the page cache without taking the
>: folio lock. khugepaged or MADV_COLLAPSE can therefore replace a folio
>: after checking its refcount while memfd_pin_folios() still pins the old
>: folio. The caller then receives a folio which is no longer part of the
>: memfd.
>:
>: For udmabuf and iommufd, this can cause data corruption: DMA accesses
>: the detached folio rather than the live memfd contents. DMA reads can
>: return stale data, while DMA writes update the detached copy and are
>: lost from the live memfd. The detached folio remains pinned, so these
>: accesses do not constitute a use-after-free or target another
>: application's memory. For memfd live update, the stale contents can
>: reappear in the memfd after handover.
>:
>: Lock the folio and recheck folio->mapping before pinning it, like other
>: page cache users do. If the folio was removed, retry the folio lookup
>: from the index that was removed.

This explanation sounds good to me.

Please let me know if you want me to send a v2 with this changelog.

Thanks,
Sami
