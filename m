Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429935;
	b=W2LrtoP2Leur6snFl8K2y0yYPgbtzhiD0VrcWLu7I2/0IaKoo4zJ1Efq70+BabxA/cus
	 aDZGCL/Ptr928tkZt6Tb+KHydcgzghvI6Z/awcE2abHPILjmK5+1I3ZYsYNe0JrZfNmq2
	 bTTzwt2kwq72T/+nQ/lg/6g4XXna5VSgZpxsV5fFSzlYiAuJjHT5uKVF68dUzf8oO8fhK
	 8TAM5gv274er1Az6nEtVKbFy1vlIn8B4bkOgJw7Tow53kqnojAa8eWsoeRhPbSK2meHot
	 mFxn6OXzSspHELB4dRRkeDSTJkjksVO01PZb/FZC8WY8cxUy/fIybsJUEWJ7g82rSKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bz4HIGdHrbzH5B04ukJiXoFVbLAu333X7PHNoO6ecQs=;
	b=kFD0PlJb/nCVIVm+bkOsEAZzYlbEXIeQdGekA6FzNdJUGeLRy+tOY8OHl6R3PYoYfUEs
	 7X6qoIT4MeFM0/hfp+FTWpbf19xhMzzMBLyoDFo9AwenDKl6unv52GC5mnCbf86UvraF/
	 sjk40+Y4gh5Pqf0SSb+RRtTWabrhhkXibIcV1yZTohR8JpVRdPTDt/awkqRqWr6bo+jY7
	 iRz6SvrGGohmAGeEQfkblvVDRjQ1GfB0FnnW5g73Y2Ouza+SL2wg2HdU4iAttOwgVyKI4
	 5z3ojrRlktQVAnGPRfDr232prOCu3UuzeWjrRtl5yNcsqggi5AatWWptjzfraNlV/1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PyFTpwlo;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C97606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C97606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PyFTpwlo
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5365d725440so13046591cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429934; x=1793034734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bz4HIGdHrbzH5B04ukJiXoFVbLAu333X7PHNoO6ecQs=;
        b=PyFTpwloOkXK5za1FQptmH+fWmci+DXmyJN1c9qTpOg5cmKP1epyMvWht8hqDsonMd
         sAzzWKSbt8N5/EHrlOhV0TOBeqbru2A5kbmqz2cXA2wqSBVFuJUw8i7//sgKmeA/7q4r
         dGnqDUc8j2oufejwGw7t9b/83jTLykyR88SKrsVydYxZG4RFh15s+54wJs4amGeyKBW0
         nJBu6D6FnW6yr0bigYj/mA+99ImJVuMWpMOYWWOElqQdfqJ5dVlhP4djdKnQHqtyqoTb
         aPFfLmzTo37AP1KwpZ+YDamtmdWyXwkJ/+YrlRIwzdVMJbQm/nkHphncicbZsPtPiKTV
         Fadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429934; x=1793034734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bz4HIGdHrbzH5B04ukJiXoFVbLAu333X7PHNoO6ecQs=;
        b=zeDT3RIT/WvTFObn/MBE2Vr2D3npVRCWEFMllDjkonPr96xeYFLNMqM0b0fXQixrqj
         qGk77hAk7gx8G5MoMInDotXD9E8BUB4iAZHEYYa3MzmwEKgBHqQpkjPYwX4J4x0NMp9S
         EeJtevDjNC2h/OFwbhcMvNfNA4UkmEWzSFNHYPWBYcoryhQOlEOHFN1Odxf4ZnpO7EVG
         bitsskSTwjNFBcwxsfm2onqAhwFPMqG/HnsltEBH4O2SSIzoQSwlFmg0G7to7uHoaxhl
         mRuXObma9cj7ztVEKw/CNU1nazj2Py7FGjBg4MLt6mQwaaxxwHLXCi/lc/Nk+gfb/dWc
         NQ4g==
X-Forwarded-Encrypted: i=1; AKwUvBwZp44W2UZjLZIgC9scskhUZCJt2UDzwQisx9C+1aIcg1JA3bQpzl9+ZECrYfcKzPzfAvfzMC8zLmaJFzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMfsAEM0YskFgiP699NO8Ev3F5BabPxG4X0131NkvfJvcSURSD
	Kd7CmxaVRFhHuTXYdtDi+4XuoLZCr+U0DxixIsK76Vss8Juzs4kMIBM8GTHhmuxp7ZI=
X-Gm-Gg: AYBFou1Yl+Lt4Ie/xyLYJkPTcrqbrbQrYFILCh/Hdhu5CgnF2T9rUACBLLqNQET3W3J
	Mi2ugRd1IVo+hSTWaT0EPj7SlqYVCP0YMIX1fyP2OcB0UZ69a4an8NJXmVs2vxPVHUn+Gq9+YIE
	nPLYHrkMWHCKhDDVv4E6kGhNQ5VedTn1mv0PCUlVfaBAxOCoMDaoRjnchkZzQrkFHLPanfWK/a7
	uWsbKMd7XzybGxaW2QOJhaALD5jlOwff8w2LI5Ik5xwc+R4BX3i5rjRCTlVFRueuxPVPuRvvM4b
	X4kNrR4pKPHcyK9Yp7lfbBPXqr9wg7z9BTzIGrhvnsH2DNUbyC6isHyUJDcLytRjv+lrRlHXTwR
	NmR4Nk6JbmhMbJhTb5mWANRPE3WJLIv4ygbbiN2W/JeLyw9tQ6len05QsyA69GbFH3C+VoLOMr9
	RUjeZXYrR8M16rZPIBmGaYRoXC5AZgZM4lo06aZU7OEoWs2cf3B77I48PSmRjPKbSDu+M4lUZsY
	E/UFSdQEBmEH6+1SFSMO50svFpK70TWfc2xz4IUSQghNThbpNItK5lVat0/
X-Received: by 2002:a05:622a:229c:b0:51c:fc4:a144 with SMTP id d75a77b69052e-53645bf1ad1mr120809701cf.4.1792429933560;
        Mon, 19 Oct 2026 10:12:13 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:13 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v3 3/7] selftests/mm: check that MADV_COLD and MADV_PAGEOUT reject hugetlb
Date: Mon, 19 Oct 2026 13:12:02 -0400
Message-ID: <20261019171206.3331374-4-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019171206.3331374-1-gourry@gourry.net>
References: <20261019171206.3331374-1-gourry@gourry.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neither hint may be applied to hugetlb memory, so madvise(2) must fail
with EINVAL for a hugetlb VMA. Locked VMAs are already checked here and
PFNMAP VMAs by the pfnmap test.

Check the hugetlb case for both hints. run_vmtests.sh does not reserve
hugetlb pages, so when run as root main() reserves the one page the test
needs, and restores the pool on exit. Otherwise the test skips if no
page is free.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
v3: Kept Sarthak's Reviewed-by, but only a couple minor changes,
    e.g. the hugetlb reservations / skips.
---
 .../testing/selftests/mm/madv_cold_pageout.c  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_cold_pageout.c b/tools/testing/selftests/mm/madv_cold_pageout.c
index 8cbbfd4c24c4..0874726ec141 100644
--- a/tools/testing/selftests/mm/madv_cold_pageout.c
+++ b/tools/testing/selftests/mm/madv_cold_pageout.c
@@ -141,6 +141,29 @@ TEST_F(madv_cold_pageout, locked_vma_is_rejected)
 	ASSERT_EQ(munmap(mapping, page_size), 0);
 }
 
+/* Neither hint may be applied to hugetlb memory. */
+TEST_F(madv_cold_pageout, hugetlb_vma_is_rejected)
+{
+	size_t size = default_huge_page_size();
+	char *mapping;
+
+	if (!size)
+		SKIP(return, "hugetlb is not supported");
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
+	if (mapping == MAP_FAILED)
+		SKIP(return, "no hugetlb pages are available");
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping, size, MADV_COLD), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(madvise(mapping, size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, size), 0);
+}
+
 /* A zero-length range is accepted. */
 TEST_F(madv_cold_pageout, zero_length_is_accepted)
 {
@@ -276,6 +299,9 @@ int main(int argc, char **argv)
 	page_size = getpagesize();
 	/* The harness forks each test, which inherits this. */
 	pin_to_current_cpu();
+	/* Only root can reserve the page that hugetlb_vma_is_rejected maps. */
+	if (!geteuid())
+		hugetlb_setup_default(1);
 
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	if (pagemap_fd < 0)
-- 
2.56.0

