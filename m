Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1C388385
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252173; cv=none; b=Uw1UndrbsQl6EhoqOme0bNu9e2xHVnSTX3EOQP/A+q+hb7+Rb0eZdqf5m8cFUdwnsdREYOf2YFJGEfqMKdxh2peLRZSdt9nc5drweBaSUdIpIeGq+Cl+qCjC/PBlwTmRAaol0cEGQmnF0b540ibUURQdwMo8OpZ5tKmsSL+J78A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252173; c=relaxed/simple;
	bh=oGkPR1QnpT7jvP6viqjnPE2CCJsLSIxAvBbZCAaHb94=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MkQ5Ulw7vSx277qWJ0t09vNRwjyauGoNOukypNrAvZHP3JkvQG8TvlryeOYuVSN60JeAFXJHjRIZzixPqOFTS3sMxTAQHtR/x5wzjENIRG8a4RrpAAZ2n+dVwqvSiOvW3Kyf93MbWwJWV/+HdWHlhuKPIOGg1ZXDpylnex6CBgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICfHLrU+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICfHLrU+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2529b3139fso88736666b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252170; x=1788856970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NB8kXEuSYL9KHpcK9ADFRjV/ISbKtGYd98joTGYzk0=;
        b=ICfHLrU+huU+qA/7Gb1SAw/9zcDuUPn5b0hax/P20FsqbbLeZXvKvyCVRVTUrnxGQF
         mMmiYM/F1UKdJ1FIcL8Nm/0n8NS1MybCp5kskhyrmxBh2oQiV3WEYGCU4geiBexn/sSk
         RQYwJWSfE2O4DvcoF86e7LaFgQD2sF48/DWPCzGS/0v7OY6F4JyA7k78E5mgoaPy+vP/
         PLy4zGcriHOqG1XhBLJLOP6PBCF5gZDmsi63JkOaiuZliIqdhp5qTt/jq3hCq9Q+hwv4
         +Ga6mxNNnromR+wXYyQcZ5gcZ+OCSgEPcPpaZGDQ3Q8DnxV+2kj0YZt5105wKTYO8VI3
         AiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252170; x=1788856970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NB8kXEuSYL9KHpcK9ADFRjV/ISbKtGYd98joTGYzk0=;
        b=VYqbN7aCCpxtSmhqC8LLsNROGAKitx8abPZ6Z7U4pmd4qGrP1U+jtxvzL3uae5T/LR
         LxQ7kGlsoctnBX+bwc8gUWe1ztKbkW1g5PaBYWhU3mV4KPAbXB/RUWC1/XniK/3qIowk
         a8fv4892Ed6yX5OP+sZCN8vlf8nuvFdlIysByI4LsdTf9QMS6OwCn/pfajeXIQEa8I31
         WKLwKz8T1bGDDfOLfSZ8KVwAo2/cIBrWP7OGEMDwbJygU7Io2NA6CQ2c7GlIbD88tZx0
         +w2Hi+o6HsKRym4Y5JlBUeVA+loan1bh5KdRqdnk8vU0EGkfACNI7pvsWKOqoHMjwcVf
         858A==
X-Forwarded-Encrypted: i=1; AHgh+Rpl4rBh0LH4kUbK1mtRGIXefKcZBrghybmBuimzIvqpFen4aKJD7FXnI1p7vKjgrefQddASpo/NGnQcSlI=@vger.kernel.org
X-Gm-Message-State: AFuF++nc7rfJHcTELLoOZLwM1aNdN+gbeGF9Ph6YKBxzUrMn1IctST6/
	fAqWQEn1zA4Nx/cwLbNBCKwdYN7hZMfWif1hth/MNaHjGBYv8h5zMb37
X-Gm-Gg: AR+sD112cW4RizhbCW4/01qqHa6d/rVxXuL2159zNn+gqwzTUB4LyUnxMl8A1VIewML
	jMmjJ64f/nwv8bCqiwAblFae/vgrSv4iz7oG7jXLpsj+yXCBghpml5FcB/u0EZcnau3VFA40BRd
	Nw5F0DDEp9w/N6fxBVkcJyrcJRTiU4jKQ/Ibxai07NAHmotNp2rKh9LdrUMnSqG/qfCc5n4NPL/
	BEVRZgr7c6F1QU0IntfWOJUuR5P3M2T9HnsXkLAXDrKkv0ltbuoOUMBYzhlyhNRql2CYov+CYSA
	z3gHOSbyr8OjI1MbKYhM1y8r1Q55ltBRIda6xOd+I/MndyhXJoNnxcS3Daxs2hWFzAY247Dy4Cr
	lEWD4CgcwV0NGzl8pKUV5kfK1+jXXlI4GQzg+ZcddmPm1etdw6re6K1ppfSN5+PuVkWGeAnmc1J
	WGtGym1rpfYiwxatWfm2rACHkAFdatOhMFAbV0CtmzaZCBWU+BgDhEGQbTayw/e3S7azjVhn7HC
	edXB+FSdjZFg1E11zwC/oo=
X-Received: by 2002:a17:907:c491:b0:c20:53c7:488d with SMTP id a640c23a62f3a-c25572036b9mr1872224266b.14.1788252169492;
        Tue, 01 Sep 2026 01:42:49 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f23cf9fsm543163366b.53.2026.09.01.01.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:42:49 -0700 (PDT)
Message-ID: <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>
Date: Tue, 1 Sep 2026 10:42:47 +0200
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
Cc: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
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
 <apVmYXlqsVr_p4Oc@kernel.org>
Content-Language: en-US
In-Reply-To: <apVmYXlqsVr_p4Oc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 13:32, Mike Rapoport wrote:
> For large sizes kmalloc falls back to page allocator anyway.
> 
> And the doc is out of date unfortunately.

I think it would be a good idea to update the doc first, and by doing so 
officially change the API. After getting this change approved, it's 
indeed safe to rely on kmalloc() even for larger memory allocations.

Regards,
    Eli
