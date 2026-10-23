Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723681;
	b=H8C9hciGHr90gN8KLH3BGKgYLCviwlMpphkR4gueQzJm9MmL5r7eFmVmlTauw1AxYpYa
	 RUMJv3ufejgqTnHu78jEene3+3Utz4IyXV/wygSFWHVAeSgFzG7eyPD5xD8zVSneHRsyf
	 OypIuGXIoZhZjPOhHIXCTSsmB5MKtNSGLhuaSEvT7Fgbw1nO5EONMDPRMf4fWFPtEhrTt
	 M6TobbUAnOdSWpTaKdUqvFAqg+C43hsA5Xw5JujTmQV8pMkFQbyV+xdQoE87/2JO4h1+0
	 x4DUN1n2Id8QGHEZ54weEcNGef9OA91BPs8D48l0X6S2uRY49xc/H4pk1tp5z0RZYAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723681;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=waGF8VthxuGr2cf9AIuvHuwULN2Uj1gYJg+7Hv15GnE=;
	b=VIrEDKYLuFij0h4dwABnWk6OtOtOdqKchts4UMEBwgYHMTaYkjmfE0VqfyM6EYri0XT9
	 ohqEJB7bdTNhDvu24zzdQ90WODjupnM/GSIiOxfI5Ez0R16cigLK5FnrwktAcoZUTN+R6
	 yquES/XV6HcObekH6ETCPT8dkSE72sZn+FREA54/PlZrhgP5CPY7gK19tVOyeTSbs3gi8
	 Kpuawj2xob8MeXggLY2reVY7Duqb6edl0+e8nRaCEqyyDdUbTj+QBb+zyrUnEDacAePcL
	 pWV74QRXl4FpROHC3wnyzA/Kp7jSenyju3Bx9sRRuQbL1WYU2a2oUwwOHvoPpCnU12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z1WvDcxE;
	arc=none smtp.remote-ip=91.218.175.224
Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A336606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A336606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z1WvDcxE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=waGF8VthxuGr2cf9AIuvHuwULN2Uj1gYJg+7Hv15GnE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792723678; v=1; x=1793328478;
 b=Z1WvDcxEZIoKaKFWzQsDJQ3hNk2osq09+g+LsdI9P67ej0GzjsQw7KKTCvHdiKgKcBFW4tbC
 Wx9/7k3tyx/DC+298g+YxsxhTWw+6BoqdFNTytfmDHY8BXvGX1vVH3NJ0CXCn5INaQ9yfpqc1oe
 CeGeSMubO7h3adC7o5CjwB/8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2cb42ed3f8acdf14;
	Fri, 23 Oct 2026 02:47:58 +0000
X-Mizu-Trace-ID: 2cb42ed3f8acdf14
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/12] mm: hugetlb_vmemmap: move alloc_vmemmap_page_list() next to its free helper
Date: Fri, 23 Oct 2026 10:47:48 +0800
Message-ID: <20261023024748.28413-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-7-songmuchun@bytedance.com>
References: <20261020115824.823278-7-songmuchun@bytedance.com>
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


On Tue, Oct 20, 2026 at 07:58:20PM +0800, Muchun Song wrote:
>Keep alloc_vmemmap_page_list() together with
>free_vmemmap_page_list(). This also allows the folio-oriented
>optimization helper introduced in a subsequent change to reuse the
>allocator without a forward declaration.
>
>No functional change intended.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
