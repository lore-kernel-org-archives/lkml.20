Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5A44C667
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349320; cv=none; b=NVpxTt5MLs3fzQysfQdiFS+74ym7SHJRnnnxaECN9SQpKz9E6q+kzRjaWVPFD/yNpgFjOOrrG7sIWvkgnSreMsyReQJKk5xQewkf7GZ433bmbSpoWlHgpzzogmrcNc3/l+4CJ5D86RQJpyo2DX11Vd0/4WnNXmgHO3DMMg2gv+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349320; c=relaxed/simple;
	bh=NUkzXPlE/P1i9PbYqLhd+wbxgU8sziMrTnTMVFhWLQY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H0Def2Yiz3ULO/ldbX6RTfyd5alZaca9qL+H2jF+WGhJ0AeBMFId7m5dIS5IMaEpJKNtDXo6nTpzqWNiL29q9vuZVKdFK1RnIQb6fssKqFg5rJQungctZQNEzmoWm2OXoNrKaqvH4e3RIFYTmHLDHG+hmsdo2ujg0jwb2MMqYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+fmQ1FK; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+fmQ1FK"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a65e66555cso1297675a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349316; x=1788954116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z8Dfh++0Ud+IxXdfXwfXS9P60ggh+Cfx9Hb6zf15cRc=;
        b=L+fmQ1FKp5i9mb2xp8Evq6IBJqFzNRK6szBkU6lbvzSmPSjrnVO/ghk3B+Qbvu45vO
         32JEz8yqGBXkdYDnk64jcd7HGEdBWq1ceMrdSwicy+TsPVSRu4HotKmVel8O3Gd5RE5K
         Av5fbQf1pycraHAZmWEHIkLrPhvqhc5jI066iNx/1snRnBSGAX3eGTs19kuU04EMMHfg
         BM5O0vZM71G3oW7FPCi43KBm6bfsl+5D0Jg2jfLOn0sLrV+jEwNM73QfkcAoGHfG6Y5M
         TqhWwftuyTs6LBe26OjDeILfgmbFZlLT3ZMW5H8S3mSiyQ7iImQ7s7rERTe+eq4ei2iu
         fJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349316; x=1788954116;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8Dfh++0Ud+IxXdfXwfXS9P60ggh+Cfx9Hb6zf15cRc=;
        b=soe/GxtGG2DccjZTA6epyedTbXom3U44L/yX+UzbcdN/lyQuTyPObKeQ7JJdiJQeqz
         /3GAPzmJdwKsO7p8SaHIFrnA9eILKgcx8JL3WZQ31M5rRU6/kzZ27IU08sU6MS/tH4Li
         kCrKTvsn4xV+Bb71z3sLoBbwvyubs55db2O8GPTfIB9zmJHnJKjIAgBk+OPNtFVcWt49
         VOz/LF88VzMi+NArAR8ypavHK+WYVpS4vtA7bIn/RN3CTXrRi7C2zypUSfIigZn95sUa
         Or9HLOQaZ+1+6AhMaqwfcjnhBiCw04OkSda43P5nyjSmAgVpAAqFPpwuFy8fWcVp+NT3
         y+OA==
X-Forwarded-Encrypted: i=1; AKwUvBxawMj7H4c0lT41ExE6zp7SWA4hywLvsChFZ8mlygrg6+isw/u6YXzw3Y8jC1ZaOEZpNm1OreKhLQaKD3U=@vger.kernel.org
X-Gm-Message-State: AFuF++n4uDCY6pfBZ3lKtAJB661ibxB4xMlM+ci6piNTNaE0bjMi9RG0
	2rlEck3OHubr34HFBNAr7Yqpr4NIk4Sj+4t1j1vyYlEk4ZrWF0MCe8yb
X-Gm-Gg: AYBFou3pr8Up32UEsraGZ9H/bfEXP1TlNYkG4aJeede8wtxMOaXS5EkujKw5l+8B9ln
	aL3Ey/XxGuggr4rweVu3XjhVIguqk76TLVc5EG02iEAtkIOxiDTtnK73U/var4TZCQlJsUYnTri
	0Q4hZCa7iNZhs55LaoOVHO8kGOQSbG4uKmt4gL3/Iz44S9JtP/1wmJDMgsq6obAMulW0YeNGWlR
	xPi98rX9fmeorY04QUj+GeXnDM71koDaPkc9XRY9UMznPbSgN2lKF7wlGPl6CiQZiDS9HBqQd/P
	tiC1UWwl8FkT+PxPUa/z5e9/0f1oc+XF3yCZKAhfqu0v8pMjgYJNdvNtM2/y29VBvBzBqhNC6+b
	f85X04H3pdmvvnxqYnkdlBDZS575R8FhSa8IKUs7v2/kgMIjUO9Mh9tdRYmc5jQwy+/WH4OkJO7
	K5bqi3d9vrOZfsGV5fWZfLy+UYinrDEICdvQsgKlM7yOMYGPH5f0Y2KGE7h15dLbFfXSvDoi6pJ
	ttCN+cwBtNXLuS6n8F1kow=
X-Received: by 2002:a05:6402:3608:b0:6a6:32f5:556f with SMTP id 4fb4d7f45d1cf-6a682ac0a4amr2806106a12.17.1788349316334;
        Wed, 02 Sep 2026 04:41:56 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d044d776sm117567566b.62.2026.09.02.04.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:41:55 -0700 (PDT)
Message-ID: <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
Date: Wed, 2 Sep 2026 13:41:54 +0200
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
To: Mike Rapoport <rppt@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin> <apaF1HUtJnstuUN4@kernel.org>
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
Content-Language: en-US
In-Reply-To: <apcPg_y-HsMki7we@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2026 19:46, Mike Rapoport wrote:
>> * Does vmalloc() guarantee that non-pageable physical RAM is allocated when
>> it returns?
> It's not pageable in the sense of demand paging. Some architectures lazily
> synchronize vmalloc page tables and this can cause page faults that will
> take care of the page table synchronization.
> 

Thanks for this clarification.

This sounds like a showstopper to me. Immediately after the allocation 
of these buffers, data from the USB device can arrive at 400 MB/s. If 
the data flow is throttled as a result of handling page faults while 
trying to write the data to these buffers, this could lead to an 
overflow in the USB device's own RAM buffers. This is because the USB 
device is an FPGA, where RAM is an expensive resource.

So using vmalloc() may result in a malfunction in the data transport 
where the __get_free_pages() would have been successful. This outweighs 
the benefit of a somewhat higher probability of success in allocating 
very large buffers, and surely the improved aesthetics of the kernel code.

Regards,
    Eli
