Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663057;
	b=NEBPQXtrzLwhaSzsyu/yCrmmHyfIuwpeD25M4FvKKsOon4ozBZeqHSp+DSH83F37tj/G
	 J33npQAqeT3AnsPhs4JOee00PRiHLk9UoEIcWPs1etqc98gKVeYFkgMx5MDD8ms54dvD3
	 fuwyZ0NQxWAASsLp5+a0Bg8pLItbN0O3X4XHnU0n0Kne/2ULhfpo+EsWxpOkZ31bfnUhw
	 E+rWesd+pRzaJ2hp6PyLP/1ZR558k7y5yW0wVdlIoSDO0tmhkA3bEZhLOZr0xIg4ex0Nh
	 D1WKoFYc5JcNdPZBSdF49M96JG0fnF1TkkuJOIu3SkQ6kU0v4UrRQpN3+n/vE2VTg9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663057;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=su0kxsaFnNvjoRtYbofrvseaIgbmxyoofBQNCPb7Pn8=;
	b=BZxTKm8afKHyafcAbhEidb5jlbrsJEd98iRRK6bpiRdmD8ArmmZN67NyeG0IhMfrh8a5
	 qwfn5hJN4ETUF2x98veRMZEV9M/Vc1m2lN5QhYket1boGESbG07wIxsaIKKm+8bOKBvig
	 yWurNU6URKrEX0YJEOBusA8DWg/SZk/JBPk+XnUfNZbzaT/PdTUDI7sHFG3mp9vKgvK/A
	 FQ0r+QrqBIqVe7j5jFkH5uzLBnARMBKjf3ctJDBGttsoidLM5xOABo7WpDX1ACZ6mD8IN
	 a9dTEv9C2cdaAaVUaakuy9HvjiQx77wrVe+fIBlYN7T4U5pUzPm6gGdpk9RcIJAiUJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="jfq5ob//";
	arc=none smtp.remote-ip=91.218.175.61
Received: from mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813B606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A813B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jfq5ob//
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9e4WbqCUI/2DEZ2f29OfqwHYvgamdHtvS2zLpcL1H4k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792663053; v=1; x=1793267853;
 b=jfq5ob//lKe8mnDwkDU3CXUJhLQSW/skqKreLuS+fpiGmRIuxHz8nibBcMCOVd2FrGIe8OkI
 fMR82BXJV3uVg5KKffBwj+hNQnSY3dUv4B15DMZJVJpuRLGbAgq3cC3NORD9aO5O6xzWc35/9R1
 FkJ/fYXE80WGzP8tI+/bKdMs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6e7ca210cf23f8e6;
	Thu, 22 Oct 2026 09:57:33 +0000
X-Mizu-Trace-ID: 6e7ca210cf23f8e6
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 2/5] mm: hugetlb: group CMA pool and reservation state
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <ff8e96b68fc725981bdcd65c1c6e3cff2c0798a4.1792651104.git.zhengqi.arch@bytedance.com>
Date: Thu, 22 Oct 2026 17:57:16 +0800
Cc: david@kernel.org,
 osalvador@suse.de,
 akpm@linux-foundation.org,
 azpijr@gmail.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
Content-Transfer-Encoding: 7bit
Message-Id: <C1CB437F-A2C4-4804-87C6-325C6FFD87EF@linux.dev>
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
 <ff8e96b68fc725981bdcd65c1c6e3cff2c0798a4.1792651104.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 22, 2026, at 15:31, Qi Zheng <qi.zheng@linux.dev> wrote:
> 
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> The HugeTLB CMA areas, total size, per-node sizes and percentages are
> stored in separate singleton variables. Group the runtime areas and
> size into a pool, and the temporary reservation inputs into a separate
> configuration structure.
> 
> Keep one instance of each structure and preserve the existing parsing,
> reservation and allocation behavior. This separates the mechanical state
> conversion from adding support for multiple page orders.
> 
> Assisted-by: LLM
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

THanks.

