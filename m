Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916569;
	b=XVbaqoWsJ2egsgAE2xXwsHm9wW2XZAt9BoP3ILYdqth92cAvWHkL1IRYFM6kjkOZPkI+
	 2Gq8XY+3Ls/uoVD3UBUGLZKM/FNPEG4kCUISsyUBmPOqzrRq59gkD6Z5IUbBiMBJfTE/M
	 z8/afkx6e44DNFmrrLvL5mhRzQQX2kIZF+BgMNpeeNvF7cnsgVXGVcaoASQiI9bOkKN9s
	 uSgGJjdmxyM2xgIZWF+l/X7v7NBmJzwc2TUPtb/utJthP+ZhSGoem0dQr+7wIqbZf4Q40
	 SL2b9I8wh4Xj1riWHgHhmRa1cI5ZmvoWpH/0Jw6ue+24pRr2CG6hUaPUettW1tkD/NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=q/I6mqklwR3W3ZG0TlgIFqv/lt7q8A458PettktwdYM=;
	b=doM0x8tfgCRh3wQCmZcsuKx8AB4bmAH3BnCgIiGoEV1HEHQrbNgxGkd1IrjTCLXOrdyK
	 O0bZj6lTIgqwFqIbZ0K0DRA/4mwO3biRR/qSI08m0hc0GeGPM1o+w4bdx2q6EgVtOq3Hb
	 sYqRdxtdhgtTD7gtmtLm/1yCaTGWPrBOuM+zRD3RaWD/CMp/1KFcbt7unYXJT/N4M2lGt
	 w04EcnXVKXl9uk42Lcnvkcxm29zrSnmmMuXOJ8f1mOynv0qM9e+xeB04Vgx/0YDmeToOt
	 ftqTFVv2hxCRV6O3zndba8+PhlXbrN3s5w/TK+1cJppydIb61x163KvfiVBiJagxZkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LwI/58U3";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCB2606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCB2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwI/58U3
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4922523d1afso36297f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793916567; x=1794521367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/I6mqklwR3W3ZG0TlgIFqv/lt7q8A458PettktwdYM=;
        b=LwI/58U3DtC0cRi/BdqiXk9yvs+EhyumBbNJqAZmcygFh7/Vuw2gSIry2Y9zTijjyq
         Fzvz/q9ofo+bqDGe3V3Xkq/iRiscX7fA+SrH28332GiaRnw9k6QGnfBZZTFFhAHiLOCh
         YfPw/YeFmZD/oSNMEF1YmYtiLUyHHSJKWsGHqUfRiTWW2RgTJ1KJkJV2HVbansNlqKFL
         AfjLuZN/lFfK5kKtAmTJ5UYSj3jtZUxL361Y/hHCUBmdZrUl8cuMSzZWSc7BXo+gqUoA
         ifBTzk3Cd70czbLyh1qtLNqqvyIEJU+0tpnXN5t2vtZQZufCvaVPxWvS2L2TKaPIYXhj
         qkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916567; x=1794521367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/I6mqklwR3W3ZG0TlgIFqv/lt7q8A458PettktwdYM=;
        b=RS4RcAHJwzjvJCfkq1ojrHqMW31Y2ysBFXHYPgj7U2RHYFmrz6GPKx1GK29JceLnGU
         2vmDbPUR+PEh5BGk6uy+BbypV46BZruslBd9KY3btvcZacyqYE8+RncuypggoRnIh+Y5
         BdMX4QCWgqH6eqQ8KI/U7khbfWWGCBAaaLWf2oZFtWW73TBuJlbcetDttjryLOVIa7zd
         DhsLopX12ed/ccv9mdarGlyWWfmbz1ziMDGlXYMtDQPK9/EaVKZQVIy5anT3rsgJxr8Y
         /j7paDhAxrcVjbfEA3Mkld38w7c8tHhXEhp6tmvzLehowC5iPS+dnjbrhY1CNPhV7bD/
         lscw==
X-Forwarded-Encrypted: i=1; AKwUvBwMvI4U8djGNRyoJA0hm3Uh7Mtug4G3WYCqP1cKl1eHk/DaC166QbyriPp926iFbW+jy7CxPfn4VkSuxJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r4gah0HPpbtbhVvPfCFYl1Y3UrnMfpM3F1uaOo2x3ER2XKwPX
	2AyurOCcODToSWjdWtjRfzMJXS6MXWpXiXq6etaWGVzO+PQ/KpA3Eh9M
X-Gm-Gg: AYBFou3Mh3M9PBkM5noPlyhIOwCbMppk5duy89tev7GfyzhbGuL3QdeJTOGNq/To9mB
	i51FaEL4Q/gjvfNfGGuf09gGwwftmB8M9jlPDqsOmLV8KBSe6VwHHb14pV3c5SHsaIh8QPqu/Tr
	+1Y8jwUhepiCRaKlETgNvMj/MRpd2z1CJA01ywHv68mkYGRmCSwCeUwSYlQQ4BDkD0fKFJglii9
	O4Yt8XMkxvS+j+ychHZIj4evGnu9YK/g8rcmyI6zsA6KBlohNAC2A0cvmZeb/aY/CbJWKeQW17L
	A95UOidfVvMzuuZ1NhVKuiI1k5RRAJFse5WtirpXU9r7ImYcKbF4Ob0iUxfjb8NbjHn7u3/axyn
	BULcOZUm/5rQHU/eFmHLHVhhLgLHtr/kShWm1pECZZcRyNmaqJ8fipY0CxzhktW4wYtySb7Bx0L
	wvRPL0f4GIU8ZzUWyXEes9WeJnvwb/A8jgbyQGOsbbxVVuMUBNQ/SrhLhMSPVkqyjnhIiZslpoR
	0ugyQrKGuicLJOHMeDSqkGJ585nYS+DW/5oGHk6sbRWIDcaFRfbUoQLRPoMwO6W8tbvZAVS/MCk
	uS84Es9RSGx5qS5n6vhPg4I=
X-Received: by 2002:a05:6000:46cc:b0:48d:f6d2:9c88 with SMTP id ffacd0b85a97d-492784553b2mr1033560f8f.47.1793916567243;
        Thu, 05 Nov 2026 14:09:27 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm12845499f8f.19.2026.11.05.14.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 14:09:26 -0800 (PST)
Message-ID: <9e98a961-fb45-4e61-a08b-d8d7f8e9894b@gmail.com>
Date: Thu, 5 Nov 2026 23:09:24 +0100
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
Subject: Re: [PATCH v2] x86/mm: Remove the zapped-entry checks
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Xu <peterx@redhat.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Donnellan <andrew+kernel@donnellan.id.au>,
 Rohan McLure <rmclure@linux.ibm.com>, Tejun Heo <tj@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261105120322.3319301-1-kirill@shutemov.name>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261105120322.3319301-1-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 1:03 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> Zapping a range calls arch_check_zapped_pte() for every batch of PTEs,
> which is every page for small folios, and arch_check_zapped_pmd() or
> arch_check_zapped_pud() for every huge leaf. Only x86 implements them, as
> out-of-line functions that warn about a shadow stack entry (Write=0,
> Dirty=1) in a VMA without VM_SHADOW_STACK.
> 
> The warning is a VM_WARN_ON_ONCE(), so without CONFIG_DEBUG_VM the
> functions are empty, but the calls remain. With the SRSO "Safe RET"
> mitigation the return of every such call mispredicts.
> 
> The x86 helpers already keep such entries out of other VMAs.
> pte_wrprotect(), pte_mkdirty(), pte_modify() and their PMD versions go
> through SavedDirty, and only pte_mkwrite() and pmd_mkwrite() on a
> VM_SHADOW_STACK VMA create the combination.

makes sense to me.

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
