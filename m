Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793320085;
	b=mCEFz1Ms4UlUH8wu4S6sScMNslqDOS8GdcmCjqmNGOp3ZJ5m2kSf2hVCjpYxwLSIl7A+
	 7SDDuIZyr2kV3zHXqfMZr7TgK/pJqDgF7Jv3YXr7SlyaK9qy3nQecY25BKZv/200Tk5m2
	 gLBYefiyCXUqfwNjmspJS+L5aN/hx29BUUvpatQ1Ov9XIavWD29Mce+6ypXMeSGEdLBRG
	 UWm8dqsMc5a0jtp3i3+hh3krpr/oBxsaByVYlVYq8U647gesbnX/jwa26FxAprMdhmZ4J
	 MSDJ0VJtkP/t7CwhSUxzjJiFepB4eM7Jtt2GPQ8HVtSCU/kcopJXXqlsXhS2BEhWnKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=ux1Gd4wJ4i6CbO5kAuUr+fRClS71fFbOF44xw5i7O6M=;
	b=OHEH/fgQbeuhH33oeK0cUb8ip8mA3dFbrpNAcjD/26Pj7VHvWiPetppjrrdxO8uqaKlm
	 cZgh6IIDDcfTwShN/Sm9kVxlHKSpvR7xz0kZ5qjPll/abHMiAeD2xdBmTdN5wbCO4Iqk8
	 JbujNv33WYesCamPqyjVPAZXCbpMgx9dmtG5D3aInDhMXf9yhhiDhUh9H696OA5ygdu8i
	 Z5TcHea8JrtxNnFWECwPqP1WBVceafhzxhQgy8zLQ2ZublUpwpL9Xe9poWznevbvzaSjX
	 Bi14e3VEdyZs40un0EAM1AOlLFWoGLQM67IU6eE4J/8KAkNI7HY4VNom5t4eccKu/2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3+GOBRP;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4AD606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3+GOBRP
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a315ed211so237892eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793320084; x=1793924884; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ux1Gd4wJ4i6CbO5kAuUr+fRClS71fFbOF44xw5i7O6M=;
        b=L3+GOBRPTYRzjFBeLhfr170NmUzssfs5NiKPaDyA7W0VzQOvDy6EneHxWu7dx5UZM6
         Vd76mGp6zpdGPMOWyytLUcjxhWAQxnc/mr88KiN2S6H9hjCLMgZQnDZbJVZsU/yPh/Wk
         Y7t3XRVlZa9QwZhlS6tRojs3JYLCO37ZRjBn48oOqwUv6R1FY149WhynsS0KISfAUKKC
         hi+iqmRBoQ6Ounxl+scBgcdvE+9BaLP5iua0pqY3ZboOVfDOxrTQIBfYqmu+0Zs/EWaW
         corrJwYSotZi8BW/t9TQ6pvXdBrXT+V6oufqTC4cDTyn/fuYuFB3Kg+RgN6OWM8aYhUE
         mEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320084; x=1793924884;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux1Gd4wJ4i6CbO5kAuUr+fRClS71fFbOF44xw5i7O6M=;
        b=S0SBmzONWGvrc2mqRI+jF5QfkbBrjSmju3SK/yp0OqZjuTHnlwOPWOBAad9L9tH2G3
         dYonMo81hfO+dbtYc6DtW+BZ51rX8Uy95UcVtvD24fVRqsgpI9DciybjzhWjFFsMpFmF
         Sw6HPtd19tBIZcF44L8vtGzEeDCs7Vc70UcJEFRemT/rnYYBJwzaaGoZgN7G4LFy77lW
         SUMiNCycUk4YEsKeaLY/PkKe4b2py3+v5okiPicxLMXcObb8ojCqrmFTnsBwhMsxd6Ki
         +xFqDKGTD1qDWwsz7VOxOWWdyMNUar6hLwwaN8SWhVdrWKzo+FYiAkw2ptN60gDxHi4k
         QPGA==
X-Forwarded-Encrypted: i=1; AKwUvBzvkd3qV7RZ58ggyF2+dc/9xVXoz9o6ECkEizP/lYQPDCuWbJE3IoxGy38SXqAzIIQUJru/aNCeWRybLA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxwnUvf6h9v6BRXulGGt5NafBrbJ4uLMgPp/NmsWonpQK5G+Aa
	f7cXJ0d/Wlj1R8GAC1eZb5vONR+b/Ml85nGW4jZG+NCuwCo4zkig2emg
X-Gm-Gg: AYBFou3ChitIvYJ0Ki8VN8mTMXjjBQ1rsk6mYKqLzqAmi7+yBeSM31Jo22Nci1OTSr1
	zwtzKwFv3MY1csPRgGZrEWaZpUdn6NCUwfUKWcaZ4v2b7rYd0nxsYhe3V2eNJHXjwQkz4eOkziL
	MC/wgtXI+0RLx/LUZLxLWXF0VK/QXxrywmBqrfx2Awh7IZn2ev9xl4WzWmgLJaleYAHMHnK+tGE
	TKp1eWrvBjbmfgWEkzAnFTiY80RaXwncBuD+MWocci3wEI2Dg0vkkewqr/NryMMKDWS8xhPOcaw
	dM34zj0zfwCMsnN2BHzys+iFe0avUv/ZCivbTahHtU9x0uqMa3d/nMeQ8euKVFV4LfHSydRSLEw
	R/g8ndC0cSII+2as2FsE4KaE2heAkobgHnzi9fUxy/6PN7nZPPVvDWh8hugl7cN5h4KrItSDQ02
	SF/USNF4BuABVO3Aj03yPCHV4TgQ0UHdRM2TQiZp8EYBbFP9AVLt0tzjG9JxYbEOyCCYFprVBBU
	QlqOqig4IAXLCai1hRAe9hS7ZJJUkvJD86d0Y3Hly0XMf1Z0nfmg98HOTN/0Av5lLrNxT0y+Sal
	dfsN8BNn2cLBxfrU4x0ffLwKv6pUW0KzoG2a9oxg+NiQJ9+V
X-Received: by 2002:a05:7300:d20f:b0:353:5d7a:cabe with SMTP id 5a478bee46e88-36a3002ea6amr5283586eec.13.1793320083521;
        Thu, 29 Oct 2026 17:28:03 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm1883940eec.5.2026.10.29.17.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:28:02 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Muchun Song <muchun.song@linux.dev>, Lance Yang <lance.yang@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH 2/4] powerpc/mm: map shared vmemmap tail pages as read-only
In-Reply-To: <20261019090830.1917657-3-songmuchun@bytedance.com>
Date: Fri, 30 Oct 2026 05:56:16 +0530
Message-ID: <fqxovxsn.ritesh.list@gmail.com>
References: <20261019090830.1917657-1-songmuchun@bytedance.com> <20261019090830.1917657-3-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Muchun Song <songmuchun@bytedance.com> writes:

> PowerPC radix uses an architecture-specific vmemmap population path for
> shared tail mappings, so it does not inherit the read-only protection added
> to the common path.
>
> Protect these mappings as well so illegal writes fault instead of
> corrupting metadata shared by multiple tail pages.
>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 3 +++
>  1 file changed, 3 insertions(+)

Looks good to me. Thanks for taking care of powerpc path as well.
Feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

