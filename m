Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450652;
	b=ZdsP0w4bm4HmpJRF+bQM6+F/OVWuHAu27DpzTBtqOHzLE9wR0pxo9TU3RglkUeJ3UCLT
	 Sva9xDazin1AqqX6czCBkh8sRjhggKRGq7vVJ2PIItLN4GtkT9FowcxZmhw4GOtul4Bwz
	 ISpLBgSsevfFbiA7z/MIHttvHuGZl830Qk+WFNPbeD5079JQebw3+Q9ILgc/VpY7x/zQ2
	 4lcJbioEcV9kmchI5qGNNvhKZVOhOA4qvqbEnIBKcHyIVNNE0zQcEPiKZLvVc41Z63fiL
	 WlLgQhaZZ7I7eo1osODgYzEHUfYuRj0gyGXXVdr47b1B1X1kZLYaDMTaiIfgbTb+4hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qM0g5QCvuJGUtjqSB25y9Tm1UtAHR4vqLa/CLEokVL4=;
	b=Z3G91Yxn6Zpv9oPP58e+jF6m0xIxRA0hXuREIZUE7QMhbOmUHrYoedDmfeGrhxPRjim2
	 nxSmbNquL3rB6A3Ehc+DrIKr3dtSCXNQ1LyuxF5iq8RU4As0i1JPPjmKgn3ClcP5zFFfN
	 c6/QQffR1usErd0DlG+7Kavozab02TxPL0krzdURYVZfouQ5SvjlQ6i5OeD79TebLcdxM
	 2UQzkNY7t3MvqTsnJQZ+jNfxTBsXjZnARnVQKQ9XpLFX1SPG1fwi0TpwVQ1xAT9y3zLOY
	 cwA/bHVvZcaV7lccETljpRoZTHx2C6QsNCPaGap2CX5aMEziqHvN9dF4x2QwalipOWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5nbvypM;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EAE606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5nbvypM
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso13884275e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450650; x=1794055450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qM0g5QCvuJGUtjqSB25y9Tm1UtAHR4vqLa/CLEokVL4=;
        b=h5nbvypM+dxrbPhNFr1VY1VFje1G8a9lHnV2FF0TwZKM8Fg1+yP9mc+nV0FicvDPHW
         r7D2/WAt7eeH0bbk/OwSaRLBt9y42C4YyzUEMStwwg3EQmIRVuYtcQi7iSEXTBnQAHBD
         xxDRESwtmZ/vk7J2HDxuK0Wd3+70bUH7A+MFUGo6q+y9RuWtZ78XoRVsJRpFIeZa4x3G
         29xkGAKo+LdHSoVXTmfT4EY5DbznX1z5ZAAy2hpybtm5x7sreN0Rwl7cTPkUJYhAeZ0Q
         Tfcg5E17s3xGDp0CnMTxZPvpzKjnp3qzE3D5Rp6lILNemK1woweKiGY6X1YpJhHnpr/q
         Bhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450650; x=1794055450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qM0g5QCvuJGUtjqSB25y9Tm1UtAHR4vqLa/CLEokVL4=;
        b=pTBIipB5VOumYWjrKC3W34GqRxSPxCTmZz+3z7kdZHTZGijJrFo8YxJC/XSTbZCvUs
         RHH1DqTuCEIU0Y18f4z7gTLM5pQf8sQFRL1aYsYG3vmljkXBmNTXloCD1C1Q2zGMRIGs
         HcctRmAkivMu+eN520EUUfponXUaC82vo740M3dU1hUilXsz6XUGxMedZrwkTfYv3Mli
         6rS+rWZyZ8qJ+5iJ7eHezEicMha77JFXXsAmqyH25hbffVwPWioG3fZp2c2tJ6CNzEDG
         F5SdG1T10VqQrDQcz4xtYSKyiu2iLziEpvnHQG1Pd1Ca0io+xqMVtJzWwgItyHeoCJ1A
         nA8g==
X-Forwarded-Encrypted: i=1; AKwUvBzoc9foAMWCD8BcM5JRhPb6pafdY6n7/SvzAeHKCA+MtWqjkiZ25Rh6qoRxz0Uop9xX1GNNVQZwW/uSycI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHGTy5eQXzfBqYk8dE8Ev8jhxBU5XckucABTfji5MZ+f2gcdjt
	ta0Mg7uCTefVuA6io/eH2W0HGzS6w8kbKC6eKwFhGYmrGxp/KVI0Hjcv
X-Gm-Gg: AYBFou0H8PYjoHotUxmc7PQFYkndhrE1an7Ja37cr8vuHzPpZKYKthh+D5/RC5sX0Ds
	jP/WUlYGOeKev44++WNknedJg3yKIBcfuzk3vqn/3fyUSGOpOeVTEe0h6QSptw158P0uvto6An4
	mBnT3I2uum2OIGeM2lbGF0Kpx6477E2keOmaTzSqgSA3VzjEBal9NdtSU6TwIW3U2iuqsDN3DDT
	NLzlnILZ6G7nNHcmsXDxgfxJbCN3YzYxDZecKXKRGP53CgCIFxLPKZQxWICbZn5ZbPXYOaUl5Re
	/jdOuYsuhca+xYLreIhvc9+7pyk0EowHLjDv9CEtnBQyXV/j+WHgxAR1b6RgIVApYf6vzN9fI1L
	IoHu+7alJn3V4DYWJ5UtQECALXTKS3cn9fGyaWW2sd9ke5RXBjWvuISbWxe14h8rjN9RIUg7ch0
	j3YmWRC/UkZuYX02uN7GdscbmRRscxX6+zBXdrXD4gO+5iY9cFU3bpvk0oePDGBLnUhXkDlPBqp
	8YxZ9jA3mN/sfzQrx7KYPUXuTNoVVgID19tMzPBuUMj924ULZ7qbLfCGUbghZbQRHFVgmZ4U0x/
	PeTs6AumhEqTXhoVhvk03xuB
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr118043085e9.27.1793450649910;
        Sat, 31 Oct 2026 05:44:09 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm134704015e9.10.2026.10.31.05.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 05:44:09 -0700 (PDT)
Message-ID: <bb5eee33-fbdf-4382-83fb-4a8db33ce358@gmail.com>
Date: Sat, 31 Oct 2026 13:44:08 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/mm: add a uffd test for re-registering
 during UFFDIO_COPY
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>
References: <20261029221129.89068-1-azpijr@gmail.com>
 <20261029221129.89068-3-azpijr@gmail.com> <auW2RZNy4jgR-ZNU@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <auW2RZNy4jgR-ZNU@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/26 10:35 AM, Mike Rapoport wrote:
> On Thu, Oct 29, 2026 at 11:11:02PM +0100, Jose A. Perez de Azpillaga wrote:
>> Re-register the destination without WP while a UFFDIO_COPY_MODE_WP copy
>> waits for its source page, then check that the copy fails with -EINVAL
>> and leaves no uffd-wp bit behind. This covers both the hugetlb and the
>> non-hugetlb UFFDIO_COPY retry.
> 
> maybe "all memory types"?

yep, that reads better.

> 
>> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> ---
>>  tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
>>  1 file changed, 105 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
>> index 2a97ba1d6feb..8a7efaa7b3ac 100644
>> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
>> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
>> @@ -375,6 +375,104 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
>>  	uffd_test_pass();
>>  }
>>  
>> +struct wp_copy_args {
>> +	uffd_global_test_opts_t *gopts;
>> +	char *src;
>> +	__s64 copy;
> 
> maybe result?

sure, will rename it in v2.

-- 
cheers,
jose a. p-a
