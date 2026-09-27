Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EB83B2FFB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790528693; cv=none; b=UoT6NaZG16CFbA7hIpWy5OQlu55kk3qJ2uWJhzqX5wlNijsFUpdcyuH+NNLAYr4yw1MaqrAbZbYjhwDE5A7etTY9qCLWpf2GTPcYxCX1HGvji8YdLRsKZRVmuuQ2jdnMIXeBqb8GIwguI30x55ZyYXhrIy2J3UwtjRWE7Kyn4kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790528693; c=relaxed/simple;
	bh=umRg6sHE8xI2v8/ZCPno6hVT+lkxJZtpfs6Jv9z2WGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WYiNPiFruveeNEomMKiYUE7tLbHBizkw2JQtlsLPPIQxjrIfrpTo+VbLnf4lbr/e/NrkX3C8yGD0i8SGDbDalk33hWeejw/mpqfGmBePltPOAGkc9qrdLhFV945eZMXdwJjZ23hGuwBfVNamf41AvQ93jfN8l/n8nM8kaeMOyt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpNpPbyN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpNpPbyN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so12027915e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790528689; x=1791133489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYOA6wzNnhspYLPBWaqZitj5w8g5poC+csBPNVU7geQ=;
        b=FpNpPbyNtgIlkiRspvNsikihdo8f9cmp59oqH3NMQHDbbNkZlRlxYfK7+xaPu1rJva
         sNkjrGpOvOdXBjNuW3xLP5Qx+KW8tOazwPyiaKSBN4gOhjNk0YTJn/bkekBKHSmzoOj4
         GpZOH87x+BrMERvjXyNlaIc0aLYMAXeA5vB+UySaVcbUtgLWeEzemxITsP/4kCeE1EaG
         M34K1o/FEVB5uNzBFvWTxscs2yXdPliDmASAQ7Fdz6gxZvEzTVLSdnBl13plk9vI7spg
         eKZGkRlDmY1I8/aAuoK17A6TSThJv1q/TWl52rX1wq9nYKDtuTHZ0WTCYGSe8PvQ3b84
         8s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790528689; x=1791133489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYOA6wzNnhspYLPBWaqZitj5w8g5poC+csBPNVU7geQ=;
        b=adxBdfH7chgudIFLn79h1c6k0OVEm47RtUadnfHA1/xxYDFGM4aq8nQwJVTaQH27JE
         o4W7MtzsqvsU/g9Rkqn0pjiRYiOTFwhQTXVQmZVaaBj8t9Y7HJNBGgrNy8ACo5TxethW
         NDWTJZgvpdYaGo8MZ+o7nQkO6Qi3MzzkYbNe4ixqu2huzpUwGv1aL4QzZL2Rmue23W7V
         U38Tf/vNQ3ErDxSda3SqIHVn5YtpiXX5RntCzxik0qbLqigKTVHB4G4ea1Ipofe67SrX
         H98SKEYci8q4Mq+MS4iNrJBHIKmELMFU/LgfYiQvqqWEPM11/Hcd75SKhPG42WNu/ML6
         V7fw==
X-Forwarded-Encrypted: i=1; AKwUvBxiy3Lzse3ARFXr9xQMkYLsbjlghPGrpQ6TLTuLmFSiWWWvfeXoRMRYaMYuL6u3sDJA3mbRSR8Ebe9821Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lo6xntnDvZXa4/9odW5WoQC8Z+DIPR/Clv+E2DTKMIM4Kce/Uz
	SYpkvFY7XfD3hqNCAhRE5sLclZnKz8cW06EUzck6ypFnbnOQgaDkLiaR
X-Gm-Gg: AYBFou11J0nvfiHWzfxZL+8HoJx6+DIKtvdLr9FjXl3y+fiREYmden7RhRcCn2dMXqf
	J1uoABKKhBSf56ejXAr9BpACSOxiU4QxIM/Yt0EkEKg5owDuoymdHhDi42CsLBkrIZ89hnntFyA
	QD6AK76R4Y0IgAt+JV5xADhHNRmYdqom8GiUm40CoS+JH9fDa2gQBMN6DVaH2/JZxIpjZoWDZcK
	r9YMLuFKLpurZVFiAXbTbw69PNmv/PXdo8n2y2fEan/KlISLfVplGdjIhV/E0T1zDzv9USfflBx
	+1hXkqgZVJKyAliPlHYLnsBUKgM1vN8SFei/pLb60CSS+IBPqsvPYC4VnHNWbSotDO1r/HCXKGW
	ytbQPv77gTejmJluEYjDoxwa9Hr9+XOVYR9qp8OMPfv2J8YgBdkciAdM/j/gRYEWYZ3mZqnoni1
	PHtqA/6zG3PO2N6xvbYYqXeHjmcUzPaFyJnTmFfJXJJHD9RzwEavJise/P+i7F64z7PJNUTP/6H
	au4FxTJ9CRY6QyqhHyy/OJngb745/UJeqW/VTiMApKk9dwNm8M816oCYRRCP5oTVi1PDOCP2Zx/
	bydINsgoxpv+X8MXI7YB/37Jzb5L0rZJWAtCZlLSOD27Byjl1YxlOzPrWopUGHOr9Gy5jMY9eXW
	SLl0lFLQZNwo=
X-Received: by 2002:a05:600c:3b98:b0:49f:ce78:3564 with SMTP id 5b1f17b1804b1-49fe66f187cmr214606745e9.21.1790528688718;
        Sun, 27 Sep 2026 10:04:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e6-5301-2072-0420-f831-ed4e.310.pool.telefonica.de. [2a02:3100:b2e6:5301:2072:420:f831:ed4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5f876esm149241385e9.2.2026.09.27.10.04.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 10:04:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Zhao Li <enderaoelyther@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mm: hugetlb: Fix subpool usage leak on allocation failure
Date: Sun, 27 Sep 2026 19:04:26 +0200
Message-Id: <20260927170426.2467-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260916-hugetlb-subpool-always-track-used-v3-3-38aae9b5ccdd@google.com>
References: <20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com> <20260916-hugetlb-subpool-always-track-used-v3-3-38aae9b5ccdd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 16:39:03 -0700, Ackerley Tng wrote:
>  out_subpool_put:
> +	if (map_chg) {
> +		long gbl_resv_put = hugepage_subpool_put_pages(spool, 1);
> +
> +		hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
>  	}

I reproduced the same fallible-positive-adjustment problem in this
calculation.

The complete subpool put is locally correct, but it can expose capacity
which another operation consumes before this call tries to restore the
corresponding global reservation. A positive hugetlb_acct_memory() can
then fail with -ENOMEM, and its return value is ignored.

I tested the exact patch prefixes on v7.3-rc3 in x86-64 QEMU with 2 MiB
huge pages, at both one and four vCPUs. A default-off test hook enforced
this ordering:

1. A shared MAP_NORESERVE fault acquires one page from a four-page
   minimum subpool while the global pool has no spare capacity.
2. Folio allocation fails.
3. Before rollback, an existing reservation is released and a competing
   reservation consumes that newly available capacity.
4. The subpool put restores the local minimum state, but its required +1
   global correction fails with -ENOMEM.

Both CPU counts produced the same result:

  Source state  Cleanup result  After file removal / after unmount
  ------------  --------------  ---------------------------------
  v7.3-rc3      old cleanup     4 / 0
  patches 1-2   old local leak  3 / 3
  patches 1-3   +1, -ENOMEM     3 / ULONG_MAX
  patches 1-4   +1, -ENOMEM     3 / ULONG_MAX

The expected values are 4 after file removal and 0 after unmount. Patch 3
removes the local usage leak, but the failed positive correction replaces
it with globally unbacked subpool reservations and the unmount underflow.
Patch 4 does not cover this earlier allocation-failure path.

As in the reservation case, the base remains balanced in this controlled
interleaving. Patch 1 makes the path observable on the minimum-only mount,
and patch 3 changes the local leak into globally unbacked reservations.

As for 2/4, I think the subpool get must remain provisional until the
allocation commits or aborts.

A LLM agent helped me with the tests.

Thanks,
Karl
