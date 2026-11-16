Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825322;
	b=WmiIDV7D88mQJOEVyPi1ypQKQ0qja2G42wcwFPSekCWYEWFaGOEMPf9F44/wGWYFYc7y
	 JnddB52A6Y2bAIAk/VYqflZ3RQMjJg57ljfdF7BrO5wb1IK11zqTN4pyrj60RBk8TPfxX
	 Au1aquiONEccguasuu6WKaf5HlT0Lxw8MQ3ozZoivbrj0O7W6qwsj+5ebXlM4tNlZ0tMk
	 0M7JuPwU++PZJMhjzF08D4KKbd9tcHTOpOQZ9BUGeL26aiVACWI4g6EbidpqMNYiyA0/S
	 zlmV5THTvHEDpm5RtErMYzEz7apibFVm2Wm3FbaRibPMUAqz0iGyXxYUIgCacB25Xpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iyaQZx4YaB2JOzxstluIUEtBMcc33AW6Ym2vysf33mM=;
	b=qettT/1f7atLgIShRP4Chj4LlSa2rpS+SEGbDodqOuF8gnwVFS9gMZml0tb7dfEPVwSV
	 W4ND60wfDlu0Xey+Ks1szJ16/WL44QM16+9/leLadqmKJwejEoO6ibv8a3Wnops/Glw0i
	 BjhEHz5oFF3uJ9SbVDUgH2t4eJ037lOeNXoKnUbm5Mhvk/gCUIWDzXtv8xL3QHNhskhvA
	 PZMWnuvKHtY4YM2nbB9Zado2ZvsqpXGrqmxr8lf3640Ugmw37MK6yaKH1R1wd5kZS+pQm
	 VAaalt1iqctT/LwLxK9kQY8lRsj0SBDnXvhJqXMaPbd162XfGtbQwSBMSwNnZHVLWzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPBhVP3o;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C8606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPBhVP3o
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4910b863b84so2365451f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825321; x=1795430121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyaQZx4YaB2JOzxstluIUEtBMcc33AW6Ym2vysf33mM=;
        b=HPBhVP3opbkndZbX/Njn+mhPHqIItUqxsBMit4KhMA7OxLH9lvreIW6onmS0+qbsFZ
         qo6ic04s2pX1PpDsHyk8Ryzhsl09JF5tbU7BvwHPN6X7RNbmE+sydbvmFCazqA3wizZ5
         8MlrMaFC00CNNoJY8Zf9QY7fG+zrAnQeopEJrL7vLiKU05gOadWRDbkR80JvwPQHKXD1
         vvnPbRiFagghTyBYC5VFRim1WBxUGE2YXmlDACBgNm9+BQsBHLfxLCGcK887RJNgGWt1
         Xi/v06icK3D/0RvVfndeM5GgGfU3sEeM6PdHMWuVMviXpmW0Y7p2DjayIvrtg6NP9TxF
         C4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825321; x=1795430121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyaQZx4YaB2JOzxstluIUEtBMcc33AW6Ym2vysf33mM=;
        b=SLYJskU83cnZRkFGYq2e/DuChO3ESusrbju42WU4nQUI6qaPQ6L/tz1djG83ex7SGR
         xCEgqK2h8M8k2F5PuG9+wa6kC6HTZwjUvo85f9dlXR50xpCMlxYLLSDYdSSvMNxPWRZ7
         SR0VtHLkDRwpaoehU281ZMZ51JzN/J259zigDvDhABHfxF/1i8hpSfz/XtMc01oRvSdz
         fSAWAbNrZtCZ4ru8IsZvsXJytsfU6vrbtJzwKN1rTA5qTeZpnCgHg0RAzbjKp3ARFUXc
         /irTR9hgg8nz4Z4Gd1tyDwQCtfP/QFuSYUzRmvXrTLGcXaKPcuNtJ71CLuqGqQTDsyAb
         r6bQ==
X-Forwarded-Encrypted: i=1; AL+hErFSRnjJ03xcxbn+DOqSLERn8CBzCKwLjL94IPIFf4rJjkys/zXGgfUUGOnCLpX9iFNwy23yjv3prcQWjVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xHuNk/8b+sKcn7LgKgBFdL4maXrGXWoKwnZaUoH72jHSqIfPm
	SlUpVhslG81O3Sm1lW0DsoBsjZU1ZXbbohjHL7cJQGp6mBLheVfepqnz
X-Gm-Gg: AYBFou0h178ffSWH9myiArs9xQCQ8NWacdtk7IcbqQGdCXeuThY0BHCqpmGHmWmjzfY
	CI1QhjQp4gZ6v3RJkLT91pdxUaezbblTOADK8QDyFNrawdSQ3PG3vNJvmm0nTaB6UA7pYLTKWJV
	sZBOXiRl+70ukEqMSqUueVmtgE7ORoX9BpTjXZwT5gRqw/aNl7Q3ZSPStHGPfnI6LhphoadwXw3
	3eS4gRgAIDzLRpShNSf25lO49QB8EP+PS3uvzwHVs4CBvE4lM3unJO1hODHQYv3cBZbPSFvyIvQ
	9uIM2P+emm9ytHukyB4vrmOeydIduHg6mL1c96gIrqWfGGV7MOoD5oW231dnti3pRepVBDox/Jg
	bZlk2DuUcFo6Z8D5HpK+XkdsrV59mTgmBwv9WD3K/JTL3NfFr5cnaUItNpsa5fKYvG9b70FLjBP
	etPSNVm7d7QkMC+/ewW5TMj2JLf1WJzseu3HbuPXvdlYu6/WMhpvx4bCXtatvWLopTySivYBVwp
	w+BAdh8q+48MXZubxC48b6VH29Em5FS9eEU2eq6jVv5qAe/q5lYqSMi6VJJV8i2qUmlHq8WeUOp
	eNC9QzQ4eH4DEhALWi82A5lMcg==
X-Received: by 2002:a05:600c:4f86:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb5fd19428mr160740475e9.15.1794825320590;
        Mon, 16 Nov 2026 02:35:20 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb675200e4sm118113715e9.0.2026.11.16.02.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:35:20 -0800 (PST)
Message-ID: <b3183fe8-5e7f-40c2-a534-c643d0fd2bed@gmail.com>
Date: Mon, 16 Nov 2026 11:35:18 +0100
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
Subject: Re: [PATCH 1/3] mm/memory: remove racy huge PMD assertion from
 walk_to_pmd()
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
 <20261115-huge-pfnmap-fault-races-v1-1-537605643f6f@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261115-huge-pfnmap-fault-races-v1-1-537605643f6f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 9:58 PM, Lorenzo Stoakes (ARM) wrote:
> From: Eliav Farber <farbere@amazon.com>
> 
> walk_to_pmd() asserts that the PMD entry it returns is not huge, but does
> so without holding the PMD lock, so the assertion is only valid if nothing
> can concurrently install a huge PMD entry in the range.
> 
> This is not the case for a VMA whose driver implements both ->fault and
> ->huge_fault and which invokes vmf_insert_pfn() from the former.
> 
> The existence of prctl(PR_SET_THP_DISABLE) is problematic here, as it only
> takes the mmap write lock and faults taken under the VMA lock are
> unaffected by this.
> 
> This can result in two concurrent threads faulting the same thing
> disagreeing as to whether to attempt a huge fault and thus ->fault and
> ->huge_fault running at the same time and triggering this assertion.
> 
> So just remove the assert.
> 
> Target the commit which introduced the first driver able to do this for the
> fix - vfio-pci. DAX also mixes fault orders within a VMA, but serialises
> them using its own mapping entry lock.
> 
> Link: https://lore.kernel.org/all/20261112051440.16140-2-farbere@amazon.com/
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> [ ljs: rewrote commit message ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
