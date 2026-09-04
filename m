Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0904F6469
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535763; cv=none; b=Xs5NlgnV0zzpfxLeAcjXcHJ3MG19f3dA+NJ/yd69AaL3i3DvuyuNya6MB8Ic+DifL1rNYfn8R3Im+rCKOU+NffIt3aq2f2+foNARgPo+gqB5DVSWEV9PGRL5Ss3WknwMrJktg/3HkBG/xkQUtjnxo74fd0krGiJBJCHNxCxr/Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535763; c=relaxed/simple;
	bh=NsYQOxgmuUEeWgsKPgP3rvcqrc4KtSibQN8aJRoHQTI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XlYpSpCwNbxUGVULb5J4kpqh7Kr+i01b7LdkOCMMqRPvTtZ8upiwMCtTZLyuuNnQuJu5Rf21DM4yM1MIsbR8QOOfVSuelFQTttCaILjvAGxPy35Szj5ebYGI0oH1qtYpg5A9Qzg40QHFAr6v8LmfpMxHWZk3NgaeUBQDhw4FIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1ea9TB0; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1ea9TB0"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso1514918a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535759; x=1789140559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3s2kh4gj1DOKMjmkcbmo31+xgIaWNFlf4UB372dsWc=;
        b=X1ea9TB06d4vYk+5HKczXLWeAYqPgB+gVMsJv59IgOnZKbeIokhtVsgjmkwmR28tQH
         JCyQWTBEQKUsEwRaf8sbMQVk43tmEw7FUxp49POOJWXXeOExVHEf7A81q28wgv7ZT6et
         i1bH2sCd9hgLn4cqbWOMHy8JcVxuDNIVZzmWyAfM56vEYPFCJeouI1uxjgR7WdnBoDfc
         DifRLZHYWa1fTstLLDv4hhM4mEpP2TR4uogWnL8/5I+qbOehu9NySk1RCyNXVqujBPJ4
         ftd0rr/HtHdawqPJblAu94wXYsAnNVi3GMlVLtaoOvRrLO0JnLUOJ3azod0BWcS7jqVs
         gifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535759; x=1789140559;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3s2kh4gj1DOKMjmkcbmo31+xgIaWNFlf4UB372dsWc=;
        b=GWBWixjb2m0NL8V/vjUnOhQGFb2A5Nctmdkn+lxwL+3o5X7PAw/w+ea58bxF/Kxu9Q
         NSFy9kenEYR7GMl14lEviol5MVHRl3/OYWyVpF4IYcTtz7qj10YZvevMcK6E4UwH+NLn
         wC9dEML4VTLj27qT3BgTh9RAyeoiOmOq1sXB7tNiswd/QtsqLjYoSir6ceT4SG4lHz+o
         Ly3E9OA9JQqBqPzMBA0Hq6HOzxRszqQoNkdC9oxq05n7RoGuOLitUzUtyT59AkWCudAk
         4qwNxC+onK7LOwpwaindowD7UdKotqVS81xLvOesLDFQsNUy3Oc3l/PmIP4/0fZF4DDg
         O4cQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+s6EJHR2rwdkCPka41CUzVueLDwOEuo6+fjTutWbIYLcdtIRG+OjYaBhq0pBfS6JvWuwmNf9ntXjk8uI=@vger.kernel.org
X-Gm-Message-State: AFuF++mWJVl0jwbtk5hWra6FClaeki1KA04mQsOuEtDu52ReEw5M2srR
	6qv+QfMBUrqKTfwN7CplGGAaQDLltsLDpt3JtocmdL+UFr+gNayovxo3
X-Gm-Gg: AYBFou0NyWh0r6Xuekhg3VFHUVd3GK/PQI2xIwJJQ+wh1k5BV4HeURFBwzKv2CNbnLG
	9W9hzgS+B54L0PVImVwqVKj+bcMUMu2wOPeZCgYO0MN9IFw0cvnEv4pjKftMnMS9hdt7c5XUJqO
	5FZdp7iRkKiog0ZXliOEg6Z+O1eN11Nx1Qdwy/5CrZZ1ZCrcIXFqZVV3OWI92J1ZnOln0BTF3OA
	fl83zbleVf2CeaQgu92tWErGU4V5b90owKIOPTemIvT8CQUzSEBcE/OgH11Eqj7bcSa+f6l4d7X
	48k0XqOGeXbY/PN09c5BAumNNY5NWEm75Fa/K4kjUT+dcRJz+gY54Ai74mOrOW7v9whq5LsDaqk
	0cMJHk2pWvV5gvyr8/zJaBjEAo3FLA3JaRaDobRpTMTNo2FiTThXzhAgURTHwlMXpswwXFd53ne
	st1o22nU3UdkQ1uGqWNNrzS3v1a7UBcnNQPKR3yHf0S81Lv4JfYBactSFnV1ui97Iy1MrOZzumj
	XujjbP+peyHk2pnUMljgo4=
X-Received: by 2002:a05:6402:24d0:b0:6a7:ea54:386 with SMTP id 4fb4d7f45d1cf-6a7ea541e6cmr1470990a12.23.1788535759252;
        Fri, 04 Sep 2026 08:29:19 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6bee8e8sm1460646a12.23.2026.09.04.08.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:29:18 -0700 (PDT)
Message-ID: <49245a34-cc56-736e-b2b4-168c2a0b1df7@outbound.gmail.com>
Date: Fri, 4 Sep 2026 17:29:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin> <apaF1HUtJnstuUN4@kernel.org>
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
 <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
 <apgSCyj-h2xVc2ss@kernel.org>
 <1d7f8806-f4a0-fda0-a361-a011460ef308@outbound.gmail.com>
 <3c19c24f-5036-4bbe-b3af-e5eae102f34a@kernel.org>
Content-Language: en-US
In-Reply-To: <3c19c24f-5036-4bbe-b3af-e5eae102f34a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2026 16:28, Vlastimil Babka (SUSE) wrote:
>> Replacing it with a kmalloc() is confusing in my opinion, and requires
>> that the reader is aware that kmalloc() falls back to __get_free_pages()
> Why? The reader has only to know that kmalloc() will provide such a buffer
> (up to sizes that the page allocator would) and whether it falls back to the
> page allocator or not is an implementation detail.

When I see __get_free_pages(), I automatically assume there is some ugly 
low-level memory management going on, which is exactly what fifo_init() 
does. kmalloc() feels like something you use more for allocating memory 
for a struct. There is no such rule, of course, but this is my 
subjective view on these two functions. As I wrote earlier, this is a 
matter of taste. Maybe it's only me thinking like that.

And as I'm not the one deciding whether this patch is applied or not, it 
doesn't matter so much what I think about this matter. I've humbly 
voiced my opinion, and that's about as much as I can do.

Regards,
    Eli
