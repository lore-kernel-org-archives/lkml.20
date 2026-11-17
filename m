Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891034;
	b=LbmAGHNbOkkahMv3GNR3o0Z6lNYMNUTGGS7DioU0sB3uG2ypPxPunnthEcv38/IZXzIA
	 5v2dNHvWRkfFl4WXPdmODtWnt+WRLrkqREhvtLb7VWBNtW4LPgwW/ifx+mqRkJxm0jEB2
	 M2X4gxS+wCZ2s9fUn4WbyNwbagPRCFK8QqTpRK2rZicnhK9X71ALYGVftHmhjZCstvQ8f
	 68z37OCUAnsiWL1V+aEQCqaLm+75cg8g1b9XBOlo0PzbsTlmZ2krLDrDcUNJkzIgUQQcG
	 oqtCuICSTYWW/d3VZKVxvta1k224VT9yNpXbPoWE82NZJkb8tDCeQiQt8KdSUkIfqXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=yUYUZ2LlOsiIpdrbhk1wJZRY3ayR3Noi9TQPGtDKtP8=;
	b=a5pAmRNmzxQlUPjGWfj29xD4BvzmNloLlf089duYnJJqS0jB8cgYZslBkzNUbMpL4J87
	 ogmTkzA8X35nz6JPTDH/HNQ9S+IHJF8dWR7LK/3DZCMFxFxCWUnZZWjnkuZgm2O6Vx5WT
	 xiLm0U1S9VOJW4tK+3hmB3Kwc2SX7mWsaBO/ehOnxNaduNF8KvzSkKxV9kUQZuq1FChHz
	 4pyrnvOFsWx+NOfxF2C0QYHtRpOdSc3inBb6i4A/SGHCZOyUYmhNv7kHNuKX8FTkNr7sa
	 lL+rsuw7gocEi3XkU0mDtV/m59Y65Gs4m/L+Zfq3t9GVRZ4p2DxceRWJm/4Wkbw6Dng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xGusYjGi;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345C606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4345C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xGusYjGi
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2200376eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794891033; x=1795495833; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yUYUZ2LlOsiIpdrbhk1wJZRY3ayR3Noi9TQPGtDKtP8=;
        b=xGusYjGiAdnGxncVaBVneIpjK1Ph9eHqEeeWt7lnJOkMFdfkTt1BtipRJ++rtd7axm
         TNY7mXokRzpdPDScm4nkTWyZVHSDCLj45TjHq4Sbviprep7R07QzTsdMPDa4KrXp2Rvn
         8lsnvqGG1oEchDAwidDM03GPkgBCly20w/qqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891033; x=1795495833;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUYUZ2LlOsiIpdrbhk1wJZRY3ayR3Noi9TQPGtDKtP8=;
        b=QkuOBZUHD1pvpBEkv6SRxz6ErpyW503ho/uNDyexVWTaNBCrUNT2HstgxGonwUiMAE
         fo4p0kchq7T16wGIkLzTStMB9oB9J7ndj6pRM9ak+tjdE05wtNKNi0bUuxhR80JuhVNI
         6YUjaqfwF9LIqAwTNfG2lQRYeWDEVPYX+m/9dwV6pKrchj7kf5v75ehi3oo19oWWOvX0
         89GLFqTsdbG+Kkus1U6e92ADZN91FCvY0PSfBMCuGc1p2cpK3DFbfXvkVOg6HrzI4HhJ
         QPJT75SQ2S6unQmVWFJ4JuMNe+cmVesSl/VolhPLu1R/BW+Eys45cz1uAfMfZ1x0cNYa
         mIgQ==
X-Forwarded-Encrypted: i=1; AL+hErHtrHTReDYNqgdAW5fqoEmM0E8VQYm/IeFwZpZ53m7ZAVOG7iyh4g9XSClOgzNnfXTWd/c/eX/nn7UP6m4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NcpkiZpwmqY21huMu28TvzWLxweSI9y7rWiyNTsfDbgBrzWNw
	RBhQPxSOSiWthLk9fvK4eFotx+qPsR3iVhlqOsv1saYg6hinaRCwXooJ1wxJxs9KSlY=
X-Gm-Gg: AYBFou3sGB2nJNThRGgx2qA8DCWD2Cur3KTe8OhKJw05HaHLbYSW0gL1aXeCsUfxtI7
	gHXj4SUq9/Y+8pKxIkBqXBcZOtmF9KP8D7v/nBQZkV8uTSQveqI3mQTNXJFQiOaBZTIs9ip9yW7
	SOaABqcNrU7aJfd8vnIUPcPyU3vkLBcIJBneZISNmM49+Ohtc7JUmJ8wsR9SZcDAnrPDgjMX5Ef
	oc7JsrPib37CR0N/zeRl4jni2JkCt0v8vjkNTAKtww8YdFXpNKmDjWwe/H5SbG7hsVY/uMx6rsA
	xWWJxgTw+El96+WHSJZGWDc/9GwdpSF29dmvZ/U4o7EwhfpFtqaAlDgDNoiO/D3QTzr1IgN/iUA
	zNDhEsQc28ETGHkgPToSt6VzgFpDP8O/P2hAsfwdAjiInNEp7IZu86wdcwmTez4cmH1bBsdsxY1
	4kVMFqQCbgWiJ5tMTSwWuOozgwQo37mwK6/1b32VM81z0t+dWz1GYzk0ZpUEjsOPAPPC68SVyPd
	ouGJvKZgYvWMyHHFaNFl9C1JD8xsLBNCTPWyoTm7YC/muMMXx7XNkqR5xfQb97M23Fdm8yf06r8
	MGAD7dyjd4pbGoG4pE2gLWMWRKyXLC/1ffGj3iDh1NHpLXnAIJJ2MYUVJ09uzYYI3a70UbB6FbJ
	XDv9lUdWl0z2exm6Jw6c+domfvC1PLEyRULZmYbobrU6rCWUpC4jcg7a4vAEU5I7UY0l/plG3iT
	U2sxVEymHlpR1N6RHHIWOA/FK9u1bP133R3eX7DVkOPEq0h/DBQhjuaHnXgKG9xJWQ
X-Received: by 2002:a05:7022:1583:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b503112a8cmr13989391c88.14.1794891033256;
        Mon, 16 Nov 2026 20:50:33 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm43375533c88.5.2026.11.16.20.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:50:32 -0800 (PST)
Date: Mon, 16 Nov 2026 20:50:28 -0800
From: Chris Down <chris@chrisdown.name>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: linmiaohe@huawei.com, muchun.song@linux.dev, nao.horiguchi@gmail.com,
	william.roche@oracle.com, ljs@kernel.org, vbabka@kernel.org,
	tony.luck@intel.com, wangkefeng.wang@huawei.com, willy@infradead.org,
	akpm@linux-foundation.org, osalvador@suse.de, rientjes@google.com,
	duenwen@google.com, jthoughton@google.com, jgg@nvidia.com, ankita@nvidia.com,
	peterx@redhat.com, sidhartha.kumar@oracle.com, ziy@nvidia.com,
	skhan@linuxfoundation.org, corbet@lwn.net, david@kernel.org,
	dave.hansen@linux.intel.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mm: memfd/hugetlb: memfd-based userspace HugeTLB
	MFR policy
In-Reply-To: <20261115160105.2507650-2-jiaqiyan@google.com>
References: <20261115160105.2507650-1-jiaqiyan@google.com>
	<20261115160105.2507650-2-jiaqiyan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avvdFHtnw2BlE5Vq@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Jiaqi,

This generally looks reasonable in principle, but some comments.

Jiaqi Yan writes:
>+			if (!mapping_mf_keep_ue_mapped(mapping)) {
>+				ret = VM_FAULT_HWPOISON_LARGE |
>+				      VM_FAULT_SET_HINDEX(hstate_index(h));
>+				goto backout_unlocked;
>+			}

This doesn't look right to me. For example, hugetlb_mfill_atomic_pte() also
checks folio_test_hwpoison(), so UFFDIO_CONTINUE on such a folio still fails
with -EIO. Also, do_migrate_range() calls unmap_poisoned_folio() on any
mapped folio with HWPoison set, so offlining the memory block unmaps the
hugepage after all.

>+	folio_put(folio);
>+
>+	/* Refcount now should be zero and ready to dissolve folio. */
>+	ret = dissolve_free_hugetlb_folio(folio);
>+	if (ret)
>+		pr_err("failed to dissolve hugetlb folio: %d\n", ret);

This isn't a good idea when somebody else still holds a reference, such as
a long term pin from io_uring or iommufd (Jason was asking about the latter
in [1]). dissolve_free_hugetlb_folio() returns -EBUSY, and when that last
reference goes away later, free_huge_folio() puts the folio on the free list
with HWPoison still set. Now, while this sketchy page may well never be
handed out again, it is nevertheless counted in free_huge_pages, so a later
mmap() can end up getting its reservation against it, and as a result, a
SIGBUS when it faults. That seems like a real problem for a VMM with
passthrough devices.

I didn't check in detail, but since the folio has to be dissolved when its
last reference goes, wherever that happens, perhaps one way to fix this
would be to do it from free_huge_folio() instead, and treat a HWPoison folio
there much like a surplus one? That would cover the pinned case, and I think
it would also let you drop filemap_offline_hwpoison_folio() and the
folio_batch changes in remove_inode_hugepages() entirely.

>+		if (hugetlb_should_keep_hwpoison_mapped(folio, mapping))
>+			/* A new raw HWPoison page in a still mapped hugepage. */
>+			ret = MF_HUGETLB_IN_USED;

This also looks a little wrong, because a 2nd error now gets past here and
reaches the hwpoison_filter() check in try_memory_failure_hugetlb(), which
calls folio_clear_hugetlb_hwpoison() when the page is filtered. That clears
HWPoison for the whole folio, earlier errors included. I'd suggest instead
that it only undoes what this call added.

Thanks!

Chris

[1] https://lore.kernel.org/r/20250120172626.GO5556@nvidia.com
