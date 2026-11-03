Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667301;
	b=rzD/TzkwxySNsuZYqWnhNp+s/k4FgMcPDXJt47vBErsvtaT8bpx1dvDQLZ4HognQhC2P
	 YFnR97j7hmcbqFirRUgo79qw7+XTAVgFLre3iMfYlyjHkzrGn+NGaox2C+T1b/DFkhFLO
	 IU3mh3YLvGi9ue/Vepbk99eDyrUcex5yBZtW6yZQHn8TU1uy+OKKp/kjkW2DJbkOWErqg
	 rh2WvpDj5OBGz+F/GQtDc2HunOiKcsvsk3H5UdslO4jRSpwK2FRvcrUD4/Ev38vFXPha5
	 oSwVczsaZhuG9WdifJG89Y+4Fzy7fudpVypdRnJKJOGvAnOICsxgSkFht6+nVoB24Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=utYETJ5rHiqNuCeYbazrvQTxJbHnffVJ+WGLRhPpEcM=;
	b=b55aKsU4O1VDJVImR+MP6OvG1YwN9p88F8d+tZ0HL7/0/H0I8vrCOq0T0trtgFQNLnmJ
	 8wphAW8whnSknrMlQUIWplwzGk0swvvJ6hsM9NhBln0A91iCOOxqlaSD54uOXwzqRLkwc
	 3OquHRo6k90vt6H5Ok/PmR3ygoZ7RhOYbrVrMSshv6ZgYWfPY2k0JYZNgdC2mVREPUCDQ
	 tRHbpRvw586AqsQ9yJ3vZBS9UmThSA0LYlooI0ejuUGxx2pCxEXezO5x+m4FWXeh8CNZg
	 Oo378T/vjoyAg4NHFzCh4G17HndSYl9PSw2fZOZY7TZavVEmPPUBK12CeUf9eDT0EwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bd9EZMML;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50436606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50436606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bd9EZMML
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987a2ba0cso20773985ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667301; x=1794272101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=utYETJ5rHiqNuCeYbazrvQTxJbHnffVJ+WGLRhPpEcM=;
        b=bd9EZMML14wYf0UyH1KfDmLzXItlV4cSJ947/8NxS9Eusjh/IQIGNIIfYHDILhJR/G
         5ZfpxoRhau49tYdjKwHNMJ36pkJPl94vOIUVOfNfs4qTIbjcE1ZY+IXO6M53Y0Sn2B87
         H96/g6GCOC3xff49Aw8BQGKJ51bbUNEgx9opdi+XVftnkBfS1ZvXQf2l/DLHcwy+Nm2W
         ZTQkgRLEGv6EcLNQkhcmnQSiBwW6XADp0wi9TAsFGTcJS4/FL3fqZLJ1CtkuadgHhV6t
         s/VdBhrfngckZ1fvvydgrSMCmM20I7YfqmelVsRWvgwqWahmoEWPOQbMhwYXr79wyMbt
         W1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667301; x=1794272101;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utYETJ5rHiqNuCeYbazrvQTxJbHnffVJ+WGLRhPpEcM=;
        b=QyQ1+HNo3nSGMqVV5e5FTKiWXTNyWqGZ5mrR3oU1XgeyhdIsPOpuseEq/n3OxdoKjW
         I9Ulls5Jk7kB1xLvT7KRylkUAL9H8sJ+ygJv6H5yAejjkZ+/69z6815Gp0AWSY5QcpnU
         H4hySg9nmut56v0YWrUEffTaKf868c9bRdH7eLxO49ZAquiQMzRDwfnUXVGNJq9QiXIJ
         T1oZzgRikxg97j6baswYhDGYhxgLWGrHNyYNvplsRgi8m1GcEm0Kmkt4OxY+yz3JlQ3a
         5iRg6Mt/gus+YrgOfsu6slkpAXJAEbaBbQvCKDe7bIIPSTaIrLWxmjbEwlUVEVyER7fV
         AWKg==
X-Forwarded-Encrypted: i=1; AKwUvBwUyT85N7tKKUTRQVDGzCatqn2XTbHXjj4ZNJLRr+sLZIH83WBHWSs4qFqz8k2NJOey1ch0JhKC3kXCqn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dCDpUkUSEAs8Cmwug6VsHLiEPwWkaIOiJ24uv/DxIYIwILuMb
	O5vZKVfbW+wWk+WnQB2FZq92KLJZyUQ4R/ovAro6jrhj1esdZKWioFI/6DVKI4fLag==
X-Gm-Gg: AYBFou0Yy68I3m5FlbRKo8QivLHY6Xpxe1j/c0el4FRHfgxzy19rZIllL6Wrur5/eD5
	1RjGnggk6v7BuaekdIYaE4RSnyCxi3QpjX9HhhkPDt/8ZPQUXapyNyRD836ttjKHuuM9w5QWRUa
	Hpzq2x5Ad1ny8IrvkD4AQjWz6fYSlogC1w34HwqNArDLTiELTKVlN/qRWRvdteIPsfBFSNX9YK9
	kRfeD+Ag9Pgmitr24DhClhMHzvDM0cPCUDXYUyuJi/XkHMArQe5aTv0nJo50wXD3gb5S2q/LL73
	bEG4hNzKpRzxs01BAE4noDipHn5hpSThliqBlqdgPt/UDLQywNbSDXABEt6Thbtgc3cPM0qVi59
	kNDe4zYqFcMwwBHiR2Bv4BA6TFmddEpJtyzU0AsQTMGWulAspcby7luUHCTCrKtwkIO5gBTP6E/
	D5WHO8VS2Ly/gcqal6hdOJp6T46fjpPD/YIWROiu4SF93pzVbqHw/Xqahv1+2fbgIEf8A7ojz5E
	BfrwtWDshhMUdWPAHuZ8RfpbtmZSigYymTR7ND3KKJ71Gvg5jFkFtT/CqZ4Xerotk6EQL98/ixV
	B3XPHYpneOVpc1E105YI6KK5QZaRKAA6D6SE3HlO2Ip69gqEWHNKn5TSyzRJTOJs
X-Received: by 2002:a17:90b:4b12:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3ae89173bedmr9255823a91.0.1793667299847;
        Mon, 02 Nov 2026 16:54:59 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm10138264a91.4.2026.11.02.16.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:54:59 -0800 (PST)
Date: Tue, 3 Nov 2026 00:54:54 +0000
From: David Matlack <dmatlack@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Peter Xu <peterx@redhat.com>, Alex Williamson <alex@shazbot.org>,
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>,
	Matt Evans <matt@ozlabs.org>
Subject: Re: [PATCH v3 3/3] vfio: selftests: Test BAR write faults after
 clear_refs
Message-ID: <aukw3s0IR689RYYG@google.com>
References: <20261102230445.3993629-1-almasrymina@google.com>
 <20261102230445.3993629-4-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102230445.3993629-4-almasrymina@google.com>

On 2026-11-02 11:04 PM, Mina Almasry wrote:
> Add a regression test in vfio_pci_device_test to verify that huge_fault
> on writable MAP_SHARED VFIO PCI BAR mappings handles write faults after
> soft-dirty tracking clears VM_SOFTDIRTY and downgrades vma->vm_page_prot
> to read-only via /proc/self/clear_refs ("4").
> 
> Use vfio_pci_find_mem_bar() to locate a memory-backed BAR of at least
> 2 MiB that is safe to read and write, and zap existing BAR mappings via
> PCI_COMMAND_MEMORY before each sub-test to verify both:
> 
> 1. Read-then-write fault sequence after clear_refs, exercising in-place
>    huge PMD/PUD write-protection upgrade via wp_huge_pmd()/wp_huge_pud().
> 2. Direct initial write fault on an unpopulated BAR VMA after clear_refs,
>    exercising vmf_insert_pfn_pmd()/vmf_insert_pfn_pud() with
>    FAULT_FLAG_WRITE set.
> 
> Skip gracefully when the device has no known memory-backed BAR >= 2 MiB
> or when /proc/self/clear_refs soft-dirty tracking (CONFIG_MEM_SOFT_DIRTY)
> is unavailable.
> 
> Suggested-by: Alex Williamson <alex@shazbot.org>
> Cc: David Matlack <dmatlack@google.com>
> Cc: Matt Evans <matt@ozlabs.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: David Matlack <dmatlack@google.com>
