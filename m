Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B29260565
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311066; cv=none; b=c+a8Q92h0QajEML4Y2mtG2cnTk9Rs+rgGylDPFG4f1CmhU2j7IxQ2xnyIb4gHZbCbspR47H8cOEfOivurFAKSnIyx3y/e7+YODVdDYtunlB8FgTnYf1F6gV5GtWVzT5eQh9mg+Qho/FoLX4Zzh6u/c5XLhlPvZEFsNE75j4Xl9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311066; c=relaxed/simple;
	bh=0w14uU0L9w0RSlhqe4EwjyDn82UdTnD62jvdVeDf4M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cs7veMk9uKvjndYXVV4K2B+GaQNNrI99U+GBp45CQAKNThC/PvZ/nzuLyJ2fyTjDZRrxVV2ZljkBLK6AdrTd9xN1kmQAzPRWRJVIe+AiNvT1Y6g62tmQXnWGEjbYcuvdjrqimRd7vHVjJSWuslZCzlYC3J8Cs3i33WaLNaw/8RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaeaI3mA; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaeaI3mA"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78e1a94b8so42411a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311056; x=1790915856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+A2Ge7yyIYJgtfX/fpz/xgx25zdYkH52+JvJO6nACg=;
        b=kaeaI3mAZKymGZcxNam+2NKedngnmH0yPYv7fgSPOxsV8adI8oQb83XupdT7so2DjW
         U1z4qbamrGEIlEVthoURC6SfVua6SgSJmaw8BOPdnCUS5NTOA3YWkG5ulX7hF1KHKrTC
         lpF/bF+9uVkuhCHBYdfPrxI0oyz3A2oGbRK2zeCIee1bM7jrVohuZabWOEh28b0FmmkO
         GoLxckTWwY3s5rZO4jLNz6yWu3PcqWp2IegZAaeiQ5FbMDlHHBmdpuT/FZL+osNquioz
         xJatnqNf8BGEdQprTAbURZrlLap9cjM584+Tz0VFMqr5h7/HURLE8OYEu1oIpBmNT0pI
         u94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311056; x=1790915856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+A2Ge7yyIYJgtfX/fpz/xgx25zdYkH52+JvJO6nACg=;
        b=tpUPqkim2NBMHfe8dwjt5jFQbIs7+wCEJ3LGUfbVNdqY5pVECO0qK18HB7uLgzbpig
         y/NLGMUQH4VRSc/55lVQd9L32NcIcxIj8tjLUdI16UArI04nIPg1JpQuf6qgwl4hqttb
         edxK378Lj2hzE3WN/SlmTD3BrS66kaQCiMbqFhWZEwRAAn86+5gybkKrK7YxutfHovxk
         ahCK+nOwW7bh/n1jJqs0APLFpKbcrpZhGfBmjsLQFkDT1XFfQ9diKahkQ6sgD0HbtT60
         WtkuC2RlCg6WCYUYuKvplr+Vnz0PmVJ4Hd+AikTykSGJwepgLEpVNi8Et4Q7/ds3u8EX
         21Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxijDCNrJLCTFsTgwp65WAJ/W7EDbIQnXsmGDqMq8T1KNHf689kFh1Zu2w36pOittgCmYweL4DIKjuHiPE=@vger.kernel.org
X-Gm-Message-State: AFuF++k8g61rADU254wN/nPEQ3lfFPYICLXaauuqhxbhJSYgZCrsmrCs
	5QOHrU3ehaQWgyRbHdPyNlZPf6ElXs6hTlseFDHaLq8vCzLelfhokjk=
X-Gm-Gg: AYBFou00b78xzkDgoKzAG6N0J9t14+Z/CAmaHuX+2UeR8jz9FIY/ItDNRGkVpkOc3Dl
	qNO3qgwT9PcaCBdmcYuEC+2I+tc+MOBjII8684Ib7D04U7pxHnaq0S8k+3ld1BKFzcXhfPrLt+1
	c6RP8JXSamqB5w/J5BadBhsNtQ6/HffnrodUhu4Enpqkh3EMyEAACR2gOkMHOKe3GrcUR83esWa
	oOAa6pHi+6r3Lu7tZOogxpeSny+J44HtKAPTOOKf0tkcaJ4FDhRLfWFzoZ6Dzw3XZIctmOazyQI
	DKnziadio6QgY9Afzc+Q0jEcAzJqzAl6p+kvOnqh02/xFwZaa8CW795HmTafLEOfommfvWTYLrd
	PLpGMu6bHvoMcTu3LB5onSAfJ8P5WHz20otuS82ZQBzCP9aoTCJ31ht5V/6QTG5BFBhmy/uakrd
	rA841Ek9mb3H7kP+gh6/B/vMwrkY8gKuPyAPRD24tT6gEuT8hV9N/8A2nzdbr0+h2sHg2gQmtAW
	4MUL7qjhbtCF/HIWEJX2JNd
X-Received: by 2002:a17:90b:3e82:b0:39e:6c68:c779 with SMTP id 98e67ed59e1d1-3a098e054bemr4230964a91.47.1790311056420;
        Thu, 24 Sep 2026 21:37:36 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9357f64sm2006727a91.3.2026.09.24.21.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:37:36 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Fri, 25 Sep 2026 13:37:29 +0900
Message-ID: <20260925043729.2362287-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arO0a3CU_idyVsqQ@thinkstation>
References: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com> <20260919004630.1159895-2-donggeunyoo.kernel@gmail.com> <arO0a3CU_idyVsqQ@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 12:18:30PM +0100, Kiryl Shutsemau wrote:
> Putting it in the 'else' is wrong. Clear uffd on the source
> unconditionally and re-arm based on the target VMA:
>
> 	orig_src_pte = pte_swp_clear_uffd(orig_src_pte);
> 	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
> 	if (userfaultfd_rwp(dst_vma))
> 		orig_src_pte = pte_swp_mkuffd(orig_src_pte);
>
> That is what move_pages_huge_pmd() does with clear_uffd_wp_pmd() before
> its own re-arm, and it is the logically correct way to do this: the
> source's state is gone, the destination decides.

Done in v2:
https://lore.kernel.org/all/20260925042907.2330519-1-donggeunyoo.kernel@gmail.com/

Thanks,
Donggeun
