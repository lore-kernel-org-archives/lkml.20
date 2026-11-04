Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833072;
	b=t3RgKHottfbqRH7TA1Io2APXfrJ91/CpWZ8+QCoKivSVlmZ1DdGHQnhLrWVOJrN18Q72
	 Wj0NeYquZ7cmk6hdNiNACxwrED8pjjiuixshDZnKXe9Ur5KP0IjNTVaHLhaBbAr+6aChW
	 9JF3eeqKsURY9tgaP8y51Kp+f5IzGF6KfLB9dmkvFWpv3RKz2gA8zwRd/hEjiD4WsI0Bj
	 Nubzp1xYxAwzVynFuWtlObebMCY9aqv5fKylGiEY6OLeLDnrO0TGhvgjdgfe+VALuvntQ
	 gtr/dFcbSlXcA0NlDuCWVwyVmQu1DtEh1s4CE9BGKAZKoyLFWTM8RMApubWirQto87Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bZmm/fjciQHFDsHygF6gqzElYGHv0HpumcgfM0NGUjo=;
	b=cRNH8KvjQeQ+AJXfVjzLlXtYs58j/SJcaHwrwQAIojpfFhrxDVRGEm+hjSl+aLgwaErx
	 b8jPhDvR+o01I/zMn8JY3Ic9vAyi3Zat8cC7t8A6dvGS8q0fU5iwnX+LHsYUElmdYem82
	 dBSzlcVhRgXcdEnwyuDisPYxj3PKUqbRIetua2EeH1VjZfcQjyECAGu9UVlHoTvlmbU4p
	 k2zGLRrnfm4BCuFd3C7rx5vHWlDE+r4SLB1FJG2iydZDhyNO8NFGEiCZmpkOQRzwxw3AM
	 YUoIUK6KTFFQanV8sTHZ6XoS12gec2kXPNI2FLhwoX+tUGyNMSFoKcU1D2hc8D+tTeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDfTc7XW;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6D8606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE6D8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDfTc7XW
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214af2076so8994405e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833070; x=1794437870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZmm/fjciQHFDsHygF6gqzElYGHv0HpumcgfM0NGUjo=;
        b=cDfTc7XW0ifae+8M1LuPWAwdIdNKakZkFWFnJt6KL55fGa37RQmqkq2uRmhEY7B1n3
         CaBTcgavNgfBak+NIwaNa3H5fTfJ9PIT5PgZQgH2MazyhDmo4aFllXX0SMasXGEEM9Fl
         p/51Tb9ZeDWq1NeJnxB9QMyf1cDUO3GXJQBRKRgploH8Le81bwbGb+y13nOzQrXCWpNq
         F42HKXSHEzc0A6bpTaknb/yOiq64kB0H1wCLiqtk4d1YdokCcUVaxOjocfuDaznMEOXl
         BFMxyeOdRQgLkukh4xswNJohIqsIMfXRyH1cjs8NbBnWvzJr4LA0LYjw3tAYWNzSjLvS
         MNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833070; x=1794437870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZmm/fjciQHFDsHygF6gqzElYGHv0HpumcgfM0NGUjo=;
        b=1rSC17g9QY7+25xwsbQYRgGvoxeUvj7Ki5687NATRVpQoWGX6bbqkJUZ0KbLCojZEH
         jyV510ZVdXJWFAnr6dScCVjSHNCViTp5qoBDSY0KMNnCVDOrqQnwr5AVeoLSVtL/ANOf
         Yx2UXvkS3npAcDdTUvDcYQQc81oImcKRX8kZHiQzXfc1teKvFPjTrPVa2zL345H1ZOjn
         262EXq5VFQAsb/es4W/MPWJfFT2ucXdYa2KDWnAElEb7Ba4R7hwoplLDDOZIOtLR+OnX
         b3Qko1rEsjHm98Uyjn9DG1BLBtVuIZiyn4MgHDpXD4qQfvT2NDtHRSrAKoJIRTd2LW8v
         ZXfg==
X-Forwarded-Encrypted: i=1; AKwUvBxrSKT0sXI+UwXBWGMkx8RArNlGSgffFuAAM6ck+ILIPI9Oku1TVPra7+pUfODDWww4HTtIHGXAR5/n/5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RM+sZ3MNYMuJiyuiFw2hGlzZCilvpj3tjwW2p6waQab9LE2oZ
	HnRnqUhfne7E2K7/HEbDnIQxf7hcCFSJGBMPMRZxrTiyyFPBLL6Limh8
X-Gm-Gg: AYBFou2XM970QoYad0RMJlDb3Ra0PslyPOma0xuVvaHGR8KiJwy6Z99+wmUeJGa6FTE
	TlMRNRka1bVALuYs7YxVc1Fqae3qExlOHPiDR1/vy8DtAINpElIPQeM72ZuIAz7MODbjN3dJWFO
	hH97lK/tSHsYME+jESeXa2ws7kiprNiUPwpEshYd+uDH79lL3Fqhl6OclsrmNJFZnOcmIfdud8V
	QNpSsur40i0WIMUr0HpSJmMs1VCRND8Fu+JQZ1xjkOMrdvkt2Naoku2Q2V0+is7LTeeAk4OElob
	PGy1A/B/NbbQ80TthGkZahrgZpkBMudihpimXmAuaXhFWGpe1wX52JKknAf6nb5MOXc3KmZhqxn
	eyDFgb2D8TebglPO68yb/tiqZKi2OYHZWqXg2UTPgskq4pS4Rk1QYtHajYzejAwyxGL0rXPMjHQ
	SsN86Vgea4L3KbJiSgPStH1Y6qscEWkyb2RSJXM25LVaVm/BtmtYKc54PYN/k59TsnKxZMWD7Sx
	KL45JdYEU1CntI7PqySYKCfgzqCrWgbaNxFU5jA7qvI+vXqOBRJI0ElcGQdhZ5WC9/SpKCl6Gfe
	LlIhWn/r4QVa6cx9XqfTSr4=
X-Received: by 2002:a05:600c:6212:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b0a7aa0a54mr222825565e9.25.1793833070285;
        Wed, 04 Nov 2026 14:57:50 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725061e1sm17756545e9.7.2026.11.04.14.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:57:49 -0800 (PST)
Message-ID: <93d13781-0c37-4a3c-8fca-6f8108eff35a@gmail.com>
Date: Wed, 4 Nov 2026 23:57:47 +0100
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
Subject: Re: [PATCH v5 1/4] mm/rmap: duplicate a PMD mapping as one in
 folio_dup_file_rmap_pmd()
To: Konstantin Khorenko <khorenko@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Peter Xu <peterx@redhat.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 stable@vger.kernel.org
References: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-0-c56d0d26f970@virtuozzo.com>
 <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-1-c56d0d26f970@virtuozzo.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-1-c56d0d26f970@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 9:40 PM, Konstantin Khorenko wrote:
> folio_dup_file_rmap_pmd() passes PGTABLE_LEVEL_PTE to
> __folio_dup_file_rmap() for HPAGE_PMD_NR pages, so it adds HPAGE_PMD_NR
> PTE mappings to the folio instead of one PMD mapping.
> 
> The helper has no caller yet, the next patch adds the first one. Pass
> PGTABLE_LEVEL_PMD, as folio_try_dup_anon_rmap_pmd() does.
> 
> Fixes: d8ef5e311d7b ("mm/rmap: convert page_dup_file_rmap() to folio_dup_file_rmap_[pte|ptes|pmd]()")
> Cc: stable@vger.kernel.org
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
