Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825765;
	b=K2DGonSaOf8vVqaBJ+bn5qgnpx4KapGpAqNWxwLo0C2ZtzqEXb0OFhfTi9gUINwcfEYI
	 ry09lgJFZEfeKV7DDZWf8blWEUpul14WEyKGoaK2Kglp71ojvOhQzcga4d9wCBIyXoPFR
	 JZa7OsCdwPM84B3xQLaClYRy2+rJZpwVDCOqOtEW2I7UEHAkCFllZoXzPhjqmd9Q/S7EN
	 SxWQ2+l0C+HQqyEG7OhvjfTgIitkeFJ59yA5lMNoXUjx54mBK/bw+LlQdLDggEDixklAN
	 WUQRx8Fa5dKfAi4o1YILuMF4xZnK0Or9/YEwZslDuNtZpxu9xx1TumRIpKdF1wxUlFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dr9af4pJ/8zWS6vI+oqg5r0KIFPMXaVucU+qa3+/eLg=;
	b=HLkkGSLOq2NSMLcjxy9/Ma19xYdVXIJn6rMeCNhHkh6Xyh67kY97u1UnL7hIVyu1B6kn
	 K7Z4nv7Wj1yK/c9oZ8sLxIbQajp2O476hDKqH8Ps0MgAGneMWcJflbpK1KSWWsQOAgdy4
	 zB4K0qVVl6Hr/pAzmQXJDU9vxTjPmk8gwIUjZgOzvmmDM71Hi30/cOxJMy6at+dCq3OgU
	 poKprsqxfQnOsmZ7lSX0RPaBDHem8MryuQCcTaWHE4EZYhJaaMtJbn/Yn2RaMGwaDSAGO
	 CgTeCNBbiWKVYCEgcH/6ZUOiVDAoL2UK7N8Eduk7Cn/9F67sNjtU4wFAN7Q/sUPjedQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YenkOKLI;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195FA606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195FA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YenkOKLI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb61185057so12171745e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825763; x=1795430563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dr9af4pJ/8zWS6vI+oqg5r0KIFPMXaVucU+qa3+/eLg=;
        b=YenkOKLIFDKLP3cCNEy4Hp/r6gDzM/GjbkhFzLf8CBUszKeCmVtYIbLtD3GBdQZ776
         1yvC13/hqndudAnYs+824ilyG3T2v1yOobdqSF5pNwVhkhdfU1jzU27mlwr1qmkOjnXn
         YCeQKTn4V/X9p3F749zjFS1aWwakQZBCmURI7c50hPNfcfk3Y6CyUlzJLSgBPpBiYv8R
         OjhIKQd+b6bhpieLNPqNpOEpyp70kjRHI2WCC5dcVblCnuOQgu0PRbIAz8sWR+N2OFnB
         Dyd7ORKRElowHiTewwCNqa8vLBn3cZKe/cGvAvfUzs4KOcvDPO2x7z58CywlFI3gXQ+M
         3zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825763; x=1795430563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dr9af4pJ/8zWS6vI+oqg5r0KIFPMXaVucU+qa3+/eLg=;
        b=ebwe15Na6FESWmvFCfjhrE7CEiy3Q55hWILCQ5yIQxH2UxmHUzCaUDTMMmRCuYmBGC
         RT11S5DDC5HZfW/p8gAK01pTZq/NMRM/CNaeYbfw47opIC7+XOIipwaH0TNuVZh7+F2P
         h/JcuIONn+BEodQw4crEFQ08NHAoG43DSPXj6iYRkbz+oKvE/QLMUsDHdxB7tnRqgbIS
         dlLz0rs5HjnrmXq6A/NwS1/S01VHdmhLA8jXMEPD54zs/eTivY1EEUXo4urRI4e1bwzw
         iurH5D+WW9w4WSxWp7arwYSVP2yEvdT3oMekn2hKXpIxw6ydU999IR7X50VFWe0CfWBR
         4AaQ==
X-Forwarded-Encrypted: i=1; AL+hErF3m2XgVG1vBCBes13sASXZMgQq936yY8H90Ag51275s9N290k+l6DZ90CVL9VcMNbgrERpLCBiTrD+Gzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S9+Ab/ZcYwWN06TJJU2Utp3uhDvk4dGjuQ1vRCQSYFtNtUXRO
	5BJPKMZ/mrSlL6qP56GaF4f0KvgCutbpObyMqjRXeT+FB3IoWbYrRzKq
X-Gm-Gg: AYBFou0ob4r1EembzylBAfQFcTM+CjWnGiEcwbVHNMj81KblOd2vODnYRb5RPz2qUSB
	6yM8VFfQbnBLoLJ5+vxf8clM2KOqSDnICPugAWRM4DFOrLROTitqL2OsU+CqYSRA7QhHcJCNoMe
	GgRVPvzSW8V9TuxyyVI8KW2vyX37luZEOq+I+n2iA4yMTfaGTH/aJA3TCyvtYvH9Bmv1oEkK7h0
	ma5IxqyLJvTQQWeEp1ijiJ9gJG800IUzBGM3Yqr5hNR6+NyqecJp9NAtpazNBiSaCdpWSquvPe3
	1qssD2lix6dYF/H9ijHSwgtCcBo/bq5bqxFwW9MA7dsFu0r8T5KFV7rNZlvbxVxackUQCsrl3xP
	Lvyw1aRUJJMJ/V9wq2uHx3spuJl0rC2+V7jpOYIJg4mpVWy+Un8eP2Nwm5mcQNmxw/QncOA+NdB
	gRKFEsQzHxHHsTBFnDif8SZywizbvU8KnFCr4rZ00X8UrpRTFtH4H1jiu3Ud42DdmfWuzdwNOEK
	gIjrBooc7a2ugVsMR7dUT2rONDdEFfT0Nn10Nv8OFcnJDZ0hKlSXlr9KureHyHvOabXk4aCoU/W
	SPqON40IBpIGwI9gRdY0fjZU
X-Received: by 2002:a05:600c:468d:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb741d103amr31960235e9.17.1794825763460;
        Mon, 16 Nov 2026 02:42:43 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f77fc47sm21618424f8f.22.2026.11.16.02.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:42:43 -0800 (PST)
Message-ID: <9277a849-0cf1-4a49-922a-f35aa36f1dc1@gmail.com>
Date: Mon, 16 Nov 2026 11:42:41 +0100
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
Subject: Re: [PATCH 3/3] mm/huge_memory: only compare PFNs of huge entries on
 huge fault insert
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Alex Williamson <alex@shazbot.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Roman Kisel <romank@linux.microsoft.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>,
 Naman Jain <namjain@linux.microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Eliav Farber <farbere@amazon.com>, stable@vger.kernel.org
References: <20261115-huge-pfnmap-fault-races-v1-0-537605643f6f@kernel.org>
 <20261115-huge-pfnmap-fault-races-v1-3-537605643f6f@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261115-huge-pfnmap-fault-races-v1-3-537605643f6f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 9:58 PM, Lorenzo Stoakes (ARM) wrote:
> A driver that implements both ->fault and ->huge_fault must anticipate
> concurrent use of both.
> 
> This can happen, for example, if a user calls prctl(PR_SET_THP_DISABLE)
> concurrent with faulting, as that only holds the mmap write lock and thus
> does not exclude faulting threads stabilised by VMA lock.
> 
> insert_pmd() and insert_pud() have issues with this as they both assume
> that, if the page table entry being populated is not empty, it must a
> present huge entry.
> 
> This is problematic as if it is a write fault, it compares its PFN against
> the one being inserted, warning if they differ, on the assumption that the
> entry is a huge leaf.
> 
> Since the entry may be a page table, this is invalid and can result in
> spurious warnings.
> 
> Equally, the entry might be non-present. Nothing can install such an entry
> in the VMAs that reach this code today, but there is no reason to rely upon
> that.
> 
> Therefore only examine the PFN if the entry is both present and huge, and
> otherwise simply return VM_FAULT_NOPAGE so the fault is retried and handled
> at the appropriate level.
> 
> This is what already happens for a read fault, for which the existing entry
> is not examined at all.
> 
> Target the commit which introduced the first driver which both mixes fault
> orders and passes the write flag for the fix (since this commit, both
> drm_gem_shmem and panthor are prey to this issue).
> 
> Reported-by: Eliav Farber <farbere@amazon.com>
> Closes: https://lore.kernel.org/all/20261112051440.16140-4-farbere@amazon.com/
> Fixes: 7bfe3b8ea6e3 ("Drivers: hv: Introduce mshv_vtl driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
