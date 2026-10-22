Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792630275;
	b=oCX2lZtmuuxiEpaxjauDai4IItLUffs9ANJPWey5TF+IrbIZEQSpcQnGLoKFGz6F/O1x
	 QKjvAzoH38dNM/OPsXqvERHbq+C2Qw28bb8BoIQ/7TEw5H25W2/kLZjBhHyfJyImlm7Iv
	 ZVYnSy4vJ5bOSwU6FnefTsIlHewP3q3A60gvdp/5ZXRvIz8wsk0ZCbDjQBRHPpDSsvAen
	 I4EZypKtgPDUn/jQ2COGkenyAfnNysH/rHbPm7r7MVuFN2ZrKNN0mTvXC8GJw8OKiBiMQ
	 2LCGIuxeSbS0nJlXPBUDAmL/yzjlF8i1TFWpr4E6NHDSFb4kj5pYSKF1xLKZ5DbhiTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792630275;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YnSPPvpmQOUJ4waeQ3xaQjMx8WMQI2DxpZDvU9ftVls=;
	b=IJO2j6Co+wn/XS0STL/D2uu8dhGUMz6GBv7kaKu1vTXsdwU4DLg0zd0t9PA2w19lG1Oo
	 H3zrruXa3GvZcD0mTaO95tUBLU6r9/V1tu/Q9ptlgD5abzQj9unIZYmlwfmPeg/1TiOMZ
	 u/cwvcZpBCOFIR+hKvh4Mq4VGCIdqcBFRu9LNzD8zjxuU1qzAHM0wE6b6aDCVE6fhRt5/
	 xRxphej3YvwnGMWYRf3yKJjOui4t2FMXqLKQiGQ8mlf3kQPzS/VSO1h40GJyMRN2yzDC1
	 7LG/ee3ZQ53aYmuVr+tGELn5+in21Lp3k/SPVPzVLiYoKZ+T3pWIAJABzAqER4394EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xamMX0f6;
	arc=none smtp.remote-ip=91.218.175.94
Received: from mta0.migadu.com (out-94.mta0.migadu.com [91.218.175.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB93606A327
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB93606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xamMX0f6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YnSPPvpmQOUJ4waeQ3xaQjMx8WMQI2DxpZDvU9ftVls=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792630272; v=1; x=1793235072;
 b=xamMX0f6ZQj1tvTfxXMnc0w8Rx8uQHBBVHJg3ITje8SNSY/cKSWjjn/RC0DHWaFpw4XbyUFD
 Zp9eT0ZhFypfDN9ICNGIklCZSBVU0EGruN6Nk5fzk7UoyKdAPKWULJOSJ4RL2f8bBYX6eL8lpVl
 iAeN0ENRLoAjyb72wUic1PAk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3fa99ff370979236;
	Thu, 22 Oct 2026 00:51:12 +0000
X-Mizu-Trace-ID: 3fa99ff370979236
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: samarth.colleges@gmail.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	peterx@redhat.com,
	kas@kernel.org,
	rppt@kernel.org,
	lance.yang@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] mm/ksm: keep soft-dirty when merging a page
Date: Thu, 22 Oct 2026 08:51:02 +0800
Message-ID: <20261022005102.29011-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261021182157.1873726-1-samarth.colleges@gmail.com>
References: <20261021182157.1873726-1-samarth.colleges@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Oct 21, 2026 at 11:21:57AM -0700, Samarth Narang wrote:
>replace_page() maps the KSM page with a PTE built from scratch, so the
>soft-dirty bit of the PTE it replaces is lost. A page written since
>"clear_refs 4" then no longer shows as soft-dirty once it is merged, and
>a soft-dirty based dumper treats it as unchanged.
>
>Copy the soft-dirty bit from the original PTE to the new PTE.
>
>Fixes: 0f8975ec4db2 ("mm: soft-dirty bits for user memory changes tracking")
>Cc: stable@vger.kernel.org
>Assisted-by: LLM
>Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
>---

LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
