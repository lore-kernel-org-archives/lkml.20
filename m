Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908957;
	b=sjz6nZSH00kFZApxOz+DOe7ljkKibM5XHh64DFzVHi+sGMzB2Wt4Rc6LbnwJWMMV8+qi
	 jEqZirkRqHsryLta8qNwStWop5e/KWnz8KADSONmIhfwGtlM5BFNIBUlf9IFevSZ1XFCf
	 ZEJjusEzCMaVXZUkkylBRI/KJ5R96PcjgPlyvmvdGNDcthSTw6DEAmzHJWOKF6nte3tck
	 3eBezjeyg8OxyKvxuxRaYdgMzQeZyyPe14MxiSHAGIJP0lIWmlcLNKffiJ1+PE2uD+ncF
	 sxb9FG2zP4jLio8V66Nk7Ga9gvhj3Yrhk+0/H5FXvK8D3NvKnnZIEqG8oyb00fUewpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=uUk3sA9aIJBcJMhjXoYzgYu+JPE3gi1flMqsb1Ts5PA=;
	b=wj9HENgJcmGwoKVYhWdbbgYXm7B/43LX5ToN/Z942L6zqYIWSxhxETLSoOcyH9Q8pTs+
	 vYYlSo63658SsAWEYHCSX/aTFePXw0bUCMQystco5EPHXyDg14KsPzmim+vaNaw4/E9kp
	 Xp4EjqGqNowu5lFfUKxp82n+pNpWf+VlreLxmL77h8znEG4JYF9VDUVWdGklQ8I02uNRR
	 UQLqJadT90ckUh2p/Iwuv8XHc0OL2k6ohPEjkWHNSSBFfVjEB7iLjSfbdmP0EeqvAN9aB
	 Vhi4PXvkqpmwoc2UUp9USKEYawf1sazBgcJmbtJSGaPzmPdlHs1Dg+4QXR7mbLRVu1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWp6841t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05007606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05007606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWp6841t
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so716135466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:49:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794908955; cv=none;
        d=google.com; s=arc-20260327;
        b=RhdxLF/aJa+p2VbV1plZjKQcZhJtV8B1qX+ewWMiR3HwT9fmfORTIENfMzvcZjTLbK
         B+ihK8fxO96Y7y7nTvzaSa5Lte6IXdmCTncU+pgqS8q6hA9XFVIJtTCxekj3U0O3uksL
         A0slZQBWYpyYQoYKP7a7tsIt6D4Ez3hfm1KWic+qKShf4KW20atcOQPof5N2AAwViltW
         1L97ztgw/XJBL5B041y6X/ph0KjE2mmMJ0tkCmoThA8Eegs8uWo+/7UId3MWaq+V8D6S
         SOj87dCDTT9iA2k0ebgEYZFB3ShtGw8LnzzmM8aoHRHO0021DcZRRx6UHBtSeIoEXdVv
         ya7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=uUk3sA9aIJBcJMhjXoYzgYu+JPE3gi1flMqsb1Ts5PA=;
        fh=uDxjA2rMIGnXPX0ZU1LV3Jeein3CU1cR5FdJ7FN1YoU=;
        b=eAXqxhdEXvAqPY76QcGvneCSaFs3iQUvAnpD9L9E/60UVqDJtwIdoP9XX6hoij55Vc
         cQBwHqkmjUy9LGL8pbJAQbFI/5InY4xCzaSD0vyysfZyVLJrevl/Fma8TwgjptNUD5+6
         Zbl0oUubnMkar7J7Bj/zYt3uqpGnEHKKGDEetfewy5MlwtJbjhWWTOx7xX1o+ZTWM4lY
         DqcsmhKVzIxFfLOtCWe1rl/HW9I7H6Q8rdAPwGb5PJt2Y+WHJ4T7bwgsYdUO1ID93+Ie
         C6kFwS0YC3Gl8B1uIK3T7yPFZeP8ypFK34vwgYvcbfuj3vfuISGVz0BEz4osFIdewyea
         n98w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908955; x=1795513755; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uUk3sA9aIJBcJMhjXoYzgYu+JPE3gi1flMqsb1Ts5PA=;
        b=XWp6841t2tBg+AcIvD9nkKqxKkWYAFCMZ6gPyP8JvKmEkhgmpMwz3P6BLPYrl4mRgu
         bOns8Wnx77TKmPFmpC6pv8sK005a9Ok/KmoEgZ1W2ssavUVhf8kIZkV3eHySmkxSua/k
         m7sV16MVo5FidkYaoFSE7XfHv66NSn8SJe9LOLPfx3eqnR4B+DHQ8BLvwFDLbMTA9SJf
         sMR0VHP/o9ADWySLYO9k780Aj4jsE+yresY+BY9XJlzL3cYP8FEudRF4RRk6sNsRsQTb
         wOtnu4ElrPAIUFfIvAQ6ftLt2XufaK12q99Y2+bwonBsSNwi1RSRPFU27xPsM+AOi0lG
         q9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908955; x=1795513755;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUk3sA9aIJBcJMhjXoYzgYu+JPE3gi1flMqsb1Ts5PA=;
        b=fqqVbGHFzMv88cb7rZO5qWzucC1vqNYBuYnVTMU+sbf3whjriW7KYbm2VjywGuo7U7
         avqYf1mOHv0dLauWOyQsyvP3LxZnrzecAyx33M7k0Nbsk7AqmiIRI+gvShwReQ8H05sH
         kmRksBow5uwdVwWGAPk8KNKC71OwTbyNzrZRzt2Dw7bqmIKN911j1UXUDOlAi2D82W1l
         qMVeoyqujyfnl1fcyzCG9VdpmK3WoR9Zr6WMwVH7IMs4rtV2ExwOOwiVRKRTJPnplM7y
         5x2+SJwk+F6qSyadK04lORm4+3Cy7bzMR3Gcmy6X6uH4fwqaQyR0uk7LxFNKPA+C1/Z7
         J0tQ==
X-Forwarded-Encrypted: i=1; AL+hErFXA8kTitmxNLdjuw726F2nMPRvhL6mVyR0wR6+St2XYCOCe4SBDNvKQ1h28oSGBNAOolc/SlabeLihXmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uAlb5J+GyPCibxZkPV1q8jIMmXEok2LxZunWi/MSzvUw4DeKH
	FC2Zefj22Rv/sXHqBMRSyNTVOox1S+sogJDqu7JqdLf8On9X3iIwyZ4jY6h3tnV0+ztPvYVDV8w
	U94RySs85UrRtZP2WY6KTdUIeMP9zS0A=
X-Gm-Gg: AYBFou27UBQ3gsZ90DtcKSkvsUgLZhqQD4e8Gdn5OozLTofFlUx/1EZ3Y8RFMN602Ui
	xL0HGFRtaJdYGmrJIPivADxBFm/nGegzaXSAmw54eXUCnelela7UhDyvAHYGJ7avuQv4omKqib2
	RkhxfZ/wgoXsf73on9KE9Ii/BgEHX4l3KygDKfePqh5r7/tjNCBusoW1gPeKup3y+s/2gc32Fkz
	zUb8ZVNleGKNdrZ0AlP9BEve45QO4sbV/c79XDihIpa2Q8qkz5UTZHvt8faBBiZsIE3NjRKCVs4
	lW/SPF6yt2fB6EJJNOHanKMgBZD2nPwlctcq0MqNWIeg8MBea2NfD+7NLbjKos22fwAxbGSbR8J
	ZUXQOLVi7C3tCXN0qMHNgUmkT/n9lJQIQYgO6
X-Received: by 2002:a17:907:9605:b0:c4d:31c5:cda with SMTP id
 a640c23a62f3a-c50963afc72mr1091209666b.21.1794908955013; Tue, 17 Nov 2026
 01:49:15 -0800 (PST)
Received: from 118528743069 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Nov 2026 01:49:14 -0800
From: Christian <servidorjarvis1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 01:49:14 -0800
X-Gm-Features: AclHuK9N-vqPsY0Ts34Lvuo6XImgGfYr8a292qKiik_W9v-CPxQUC0mkuRPMmBA
Message-ID: <CAMas6S2z+9-TyTfFTRDM+Qk2rKpRoYAUJSvmMxEwG6eAnQQn-w@mail.gmail.com>
Subject: [PATCH 0/2] x86/mm/pat: HIGHMEM pages in set_pages_array_*()
To: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On i386 without PAE nearly all memory is HIGHMEM, and a DRM driver that
keeps its shmem buffers there (drm_gem_shmem_get_pages_locked() ->
set_pages_array_wc()) hits two problems in the page-array CPA paths:

1. The CPA walk takes __cpa_addr()'s 0 for a HIGHMEM page as a virtual
   address and oopses in __cpa_process_fault()'s warning path, with the
   CPA lock held, so every later CPA user hangs.

2. _set_pages_array() and set_pages_array_wb() skip HIGHMEM pages when
   they reserve and free the memory type, so a write-combined user mapping
   of such a page is left write-back by PAT. A device that does not snoop
   the CPU's caches then reads stale data.

Patch 1 skips HIGHMEM pages in the CPA walk, as there is nothing there for
it to change. Patch 2 reserves and frees their memory type like any other
page's.

Found and tested on an HP ElitePad 900 G1 (Atom Z2760, Clover Trail, i386
without PAE, 2 GB) running an out-of-tree PowerVR SGX545 DRM driver with
its buffers in HIGHMEM. Before: an oops in set_pages_array_wc() on the
first buffer and an unreachable machine (patch 1), then continuous GPU page
faults and firmware resets until the GPU wedged (patch 2). With both: no
GPU faults or kernel warnings through the driver's uAPI tests (50/50), 100
rendered frames checked against a reference, glmark2 and video playback.
Written and tested on 7.3.4; this series is rebased on v7.4-rc3, where it
builds for i386.

Christian (2):
  x86/mm/pat: skip HIGHMEM pages in a page array
  x86/mm/pat: track the memory type of HIGHMEM pages in a page array

 arch/x86/mm/pat/set_memory.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

-- 
2.47.3
