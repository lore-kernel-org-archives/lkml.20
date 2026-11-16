Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859471;
	b=2XiNSwUf18kAL4GOkLe6KWOnK0qGiIxFI61PY4Fpc84ihuzhCv/53YGbISd/03cjcURj
	 5EYAew2Pipgl3zEENMaLTxI8HGwLNIpRmUngw2ES40+2xrmweY+eOQ8lm2MZ8/gfP9gR3
	 0Xg4cCnG2vqNiP3mf6fxHxmIvfySRrN0lnBwMnCLOfu6bGmHE0SFaU1uw1Mo48V/HMKpt
	 Axjy1ZraZ6r/4zl89xD2Qx3qHZ6fw/nfz1AHOJ494TbIyU3u9Rz9oiZkbWRh2E86teqs6
	 HatWPFtv89dKaQyEjeK0GbaezEhXJdVsKsqbSKPidmygxhGurQCwcLGXKD6pTgKx51g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RP1wf1hEuo72YiQL0ApBaCY3IcmJDKYfBXmWsofzDvU=;
	b=ntLnZvAvJpEWJ+9H+NEwcfHbIKZrBhYi9PkVqCMsBV1lWucpn2ZXXz2pbJAwNOFue2kx
	 BsWGN7jCWHDZnV/k6utw4Pc7d5OWzhnNYInqBoGfNDIM2EDf83qsI+llq0Jg5aQUJ8RFe
	 zrd8Xes6fdXmLO1jCJAg8VHAQfl0CzIarA93xy5QPFRg5yhXtAvQa2ecqYvduLrYPHhdh
	 ypQitZHujsdL5pNrvGOF3JHvb3nmIiikV52j8t+03LWjOg0+LrNVoiCXzBs5vaB9PHwQn
	 zkA/g5PxtgXDml0Etimtmts5rEKoGStXLFMuE8E5vzxMzAYiWWFV+0tOCImsx0OnTPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=NeXkZ2oS;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=gWXWluD5;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614B160A2639
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 614B160A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=NeXkZ2oS;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=gWXWluD5
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXQvv2979152
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=RP1w
	f1hEuo72YiQL0ApBaCY3IcmJDKYfBXmWsofzDvU=; b=NeXkZ2oSCUmIAaaLYlgD
	uI0urTFRReiqOS0PvsckuTfbI6O7HzwGF99O13+Ri3hvgUi04VyxO/eE/d+9Q0rv
	VBcdlKKP9zpqDVJIsDK6v0hi4ZGLRkpfxN0r2Z26rQfS7wWQY3Q6m8jDuLNA+tgt
	jar/IbiMngx/UXHys2m9quPZl1HFs9ujU6TIAXHJAPANcOmNwjzw+JzZL14wGO49
	jBf/4XOtLGZUY88++QHpxYrcktVlaBRwCsVOJj3d3jj+GFBd/Jtei0DpLMEmlDae
	IDzJhFjzLEkuKdedu13llpY3cU6zUGvCHSXMgTXWNe8d9T/IreVwKLXITU+rBxgg
	cw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059sa2jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:30 -0500 (EST)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d65ae19133so2554843137.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859469; x=1795464269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RP1wf1hEuo72YiQL0ApBaCY3IcmJDKYfBXmWsofzDvU=;
        b=gWXWluD52V1zgifzKn3jbElRec2xVq+r6J8mZ/weZCHsOWArhEkRKK+sSZfPKyyWaC
         mYj4ZwjhL/Arp0WOf9BN1UTfjL9ooi6My1n6IbRWeJkbC6TJepHlKNx5/GRQTAiQqW2+
         7vBKhSGe5pe79y9G2VCm3kmAe3BRBRSLYkAFSrndXYQY7REmnXpzfuJCU+IQkF5cqrr8
         WdeL6JLMnN6SN9ZntGjhZdKFpx7y+Y2rqCqRvQMtITCL0qngBEsHQxNcxlRA8zpFK3fh
         eXP+M1/bVIs8Ws6kkbg+S/+xz9yJmS0kOAgIY5ogyHzqXtiW7xDe4pxpNGXA6q4/i5ox
         Nzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859469; x=1795464269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RP1wf1hEuo72YiQL0ApBaCY3IcmJDKYfBXmWsofzDvU=;
        b=LZujNlqRQ7v+xUQu5RX4eVu9XWtJZ0Pbgr+id8Ha+PbFOAn/J5aScTu4IWqMLtGW+3
         rGADSaXt8b2O55rPZciKjsq3otv9gaLqH2O5IiACBrFBIdVVffnqux1CxNqMxUVAEETX
         U+2gZCfUJT9I2eTU2YK/OMfsUlt3/Zi8t2DHbgQEXFrlRlUmpKC1MZEXxPr1Y5g6x0I0
         TRZ+iXmJd7OfSTlgNTCLmUNW0x2UwjP161ykT2eaCYDSbm/veu0REDlz+zskkw8CfOm0
         CROq3cq4e3Tty/7o28CAzGCyRDlar60cZASYJQieIicinYz8jhlTOwZYop5FcXC8DzIi
         TsZg==
X-Forwarded-Encrypted: i=1; AL+hErHfg/dTTPJV5SijOKda4D+5t89gep5JijriD7R1lKaB2Fq0y9z9j3shnCIgUfNrMyFyGAL/O//7AisJFBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7D9uownoX6vOexEgYNiJQ/SpxcBtgaTH2EZrFfnpEKCUs58S3
	ENl/ekAYiFADdg0HwTclAjfkbZbTbsmk934CVZKqTjY7uXr+UNET75W5KqLVYHigGbeAMLgJa4U
	c8m1Tg4pW5ztpNkvCg78/+Dz7Umenk18dPmxYwzOErWA/zIpdyD2RYNvOiEE/Sg==
X-Gm-Gg: AYBFou2NlIoFnsMSnBDXxJFDVWWztHNQN+Ndnw8qm742dxnDrKQfhsWV+4da8bdFGqV
	ToOPWxjuw0ZyjmkBrG40vVpJUY9/DDt1h5aJ4nfqvqa/vjzeMbEnUiHtZk1Q7Y73kzJAmhZAXQY
	jT8li/HceHCEFl+oMc4LMtOt7TVJaHO1kHr3HE7/tqtjz0u17PUjKD20zysunGQhWQMuKcfoOTx
	9r/PJ8j2GaTew37CgGpgtj3RdfScBJZZmfLApcHxsOthnbgdxDY4RT5dCp4gZXU9kqzK0EGifjV
	jKIS/cOolgVmNulvmMKVg6oD+67NKR2a/ASXnPQQ3VfRRqB4dcWGm6oEKVg1VolIXPRcDcOYdCq
	jqtObGeIZHJ84x2aNyufLxzrkBKhdKF4ftA8kE9Z6F673ITHHCn/5Icrv6XLn5MgGu2+aaQRT5I
	i+/e4FtCWGFHoBfUgoCmKj
X-Received: by 2002:a05:6102:6051:b0:7bf:74c1:b607 with SMTP id ada2fe7eead31-7d64daf59f9mr3933590137.34.1794859468241;
        Mon, 16 Nov 2026 12:04:28 -0800 (PST)
X-Received: by 2002:a05:6102:6051:b0:7bf:74c1:b607 with SMTP id ada2fe7eead31-7d64daf59f9mr3933565137.34.1794859467689;
        Mon, 16 Nov 2026 12:04:27 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:27 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 15:02:45 -0500
Subject: [PATCH v2 3/9] fs/proc/task_mmu: downgrade writable migration
 entries in PAGEMAP_SCAN write-protect
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-uffd-state-fixes-v2-3-4397a0196479@columbia.edu>
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
In-Reply-To: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Breno Leitao <leitao@debian.org>,
        stable@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=6344;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hGDNR/WqM/YeXKLh1H2S+/S9/vDNdjLF5ztTsvussOE=;
 b=QTpWpJnwJIh+mIuTvkIO3+HUHJtrN24GfR7wSh+FX2cPRK20cyW4QzZaaZbm1LdVowblm2J1W
 y50qXyD7ao0CafbW2U7VPMkfpKDGgMVpA5rsNKJ42d4IZB+tSvUSyUX
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfXwzv0JAHCvJPu
 dolOvE0LTpj1p3Hr3SPXC97p/IYaLxb7TYmNilOiAPrQKECYbOQK/V/+PxmlGHcCO47YFVn5fNn
 mIgo+3L5CAoBhmxWDSCqrnF3a5XoN+AqRC2zSuKrACCsRUqmHJCTyhVQTMsYU3YL1i53HxKw9is
 JpN+pRYP9VnInMmnw3p0PC/r1hkLB0P3mAeUZDtb5bnGRKwElT7dX7YQJj4CIylwR5GEnl7RmP5
 b9Z0pUApG3mRA1nEdZCiHJ9CHYWxzzIuN8hINLhqRxG4zo7bnEOXOAsSTSY+2/pmThsxg5TLKzS
 jZai4eEdxMO5qSj2JrSR8D+PT2cNqJ5NB4VUavCRh6iVtj8LfJ+EqCLnB5XMtJ6Jlk0qZMF3aRl
 w4tYPvbwf+t45ZyJPGwK2PWjOH7NFGGHZ0Cm+RrdW/QfCQAyg4O80qrwV3ZceiC7349fINaYGPm
 xg0gbOqFdbQbYR9LhaA==
X-Proofpoint-ORIG-GUID: RCJdTrfI1VZsgm8PFiA9Z5rqoCIBxH83
X-Proofpoint-GUID: RCJdTrfI1VZsgm8PFiA9Z5rqoCIBxH83
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6afb61ce cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=tHa68p0SAAAA:8
 a=lA3VTUfxpHkutY0wpvIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfXyntlEPyLirwM
 ZnUn3jBTY/7VJbxJaqqcI7UDkC8QORJ3NeHS4PL4X9nBEHFs9gIHT6hTJxSfK0O0k6vbFtwO8SO
 ovPzBXfnEDmRa4wbmBGQ33Kz0t+z8/7ou/pHFCsKZGAJrQfbjWv0
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 priorityscore=1501 clxscore=1015 lowpriorityscore=10
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160080

PAGEMAP_SCAN with PM_SCAN_WP_MATCHING write-protects pages in a VMA
registered for async uffd-wp, and sets the uffd bit on non-present
entries as they are. An entry with the uffd bit set must not be
writable, so that the page is write-protected once it is mapped again.
change_protection() therefore downgrades writable migration and
device-private entries to readable ones first, but PAGEMAP_SCAN does
not.

For a writable migration entry at the PTE level,
remove_migration_pte() restores a writable PTE without the uffd bit. So
if a page is under migration while PAGEMAP_SCAN write-protects it, the
write protection is lost. A user tracking writes with async uffd-wp
sees the page reported as written on the next scan although nothing
wrote to it.

With CONFIG_PAGE_TABLE_CHECK, setting the uffd bit on a writable
non-present PTE or PMD also triggers a warning.

To fix it, downgrade writable migration and device-private entries
before setting the uffd bit, as change_protection() does, at the PTE,
PMD, and hugetlb levels.

Add softleaf_is_writable() and softleaf_mkreadable() to leafops.h for
the downgrade. The open-coded copies in change_protection() can be
converted to them separately.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
Reported-by: Breno Leitao <leitao@debian.org>
Closes: https://lore.kernel.org/all/avNEgmvYdoukt6MS@gmail.com/
Cc: stable@vger.kernel.org
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/proc/task_mmu.c      | 40 +++++++++++++++++++++++++++++++++++---
 include/linux/leafops.h | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 164b4efc5e09..ee7f509d376e 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2405,6 +2405,25 @@ static unsigned long pagemap_page_category(struct pagemap_scan_private *p,
 	return categories;
 }
 
+/*
+ * An armed entry must not come back writable, so downgrade a writable
+ * migration or device-private entry before giving it the bit, as
+ * change_softleaf_pte() does.
+ */
+static pte_t set_uffd_wp_softleaf_pte(pte_t pte)
+{
+	softleaf_t entry = softleaf_from_pte(pte);
+	pte_t newpte;
+
+	if (!softleaf_is_writable(entry))
+		return pte_swp_mkuffd(pte);
+
+	newpte = softleaf_to_pte(softleaf_mkreadable(entry));
+	if (pte_swp_soft_dirty(pte))
+		newpte = pte_swp_mksoft_dirty(newpte);
+	return pte_swp_mkuffd(newpte);
+}
+
 static void make_uffd_wp_pte(struct vm_area_struct *vma,
 			     unsigned long addr, pte_t *pte, pte_t ptent)
 {
@@ -2418,7 +2437,7 @@ static void make_uffd_wp_pte(struct vm_area_struct *vma,
 		set_pte_at(vma->vm_mm, addr, pte,
 			   make_pte_marker(PTE_MARKER_UFFD_WP));
 	} else {
-		ptent = pte_swp_mkuffd(ptent);
+		ptent = set_uffd_wp_softleaf_pte(ptent);
 		set_pte_at(vma->vm_mm, addr, pte, ptent);
 	}
 }
@@ -2477,6 +2496,21 @@ static unsigned long pagemap_thp_category(struct pagemap_scan_private *p,
 	return categories;
 }
 
+/* Same as set_uffd_wp_softleaf_pte(), for a PMD. */
+static pmd_t set_uffd_wp_softleaf_pmd(pmd_t pmd)
+{
+	softleaf_t entry = softleaf_from_pmd(pmd);
+	pmd_t newpmd;
+
+	if (!softleaf_is_writable(entry))
+		return pmd_swp_mkuffd(pmd);
+
+	newpmd = softleaf_to_pmd(softleaf_mkreadable(entry));
+	if (pmd_swp_soft_dirty(pmd))
+		newpmd = pmd_swp_mksoft_dirty(newpmd);
+	return pmd_swp_mkuffd(newpmd);
+}
+
 static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 			     unsigned long addr, pmd_t *pmdp)
 {
@@ -2487,7 +2521,7 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 		pmd = pmd_mkuffd(old);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	} else if (pmd_is_migration_entry(pmd)) {
-		pmd = pmd_swp_mkuffd(pmd);
+		pmd = set_uffd_wp_softleaf_pmd(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}
 }
@@ -2557,7 +2591,7 @@ static void make_uffd_wp_huge_pte(struct vm_area_struct *vma,
 
 	if (softleaf_is_migration(entry)) {
 		set_huge_pte_at(vma->vm_mm, addr, ptep,
-				pte_swp_mkuffd(ptent), psize);
+				set_uffd_wp_softleaf_pte(ptent), psize);
 	} else {
 		pte_t old_pte, new_pte;
 
diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 4c1476ae3234..4c016fc28690 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -434,6 +434,57 @@ static inline struct folio *softleaf_to_folio(softleaf_t entry)
 	return folio;
 }
 
+/**
+ * softleaf_is_writable() - Is this leaf entry writable?
+ * @entry: Leaf entry.
+ *
+ * Returns: true for a writable migration or device private entry.
+ */
+static inline bool softleaf_is_writable(softleaf_t entry)
+{
+	return softleaf_is_migration_write(entry) ||
+	       softleaf_is_device_private_write(entry);
+}
+
+/**
+ * softleaf_migration_mkreadable() - Downgrade a writable migration entry to a
+ * readable one.
+ * @entry: Leaf entry, softleaf_is_migration_write(@entry) must return true.
+ *
+ * Returns: A readable migration entry for the same PFN, which is exclusive if
+ * the folio is anonymous.
+ */
+static inline softleaf_t softleaf_migration_mkreadable(softleaf_t entry)
+{
+	const pgoff_t offset = swp_offset(entry);
+
+	VM_WARN_ON_ONCE(!softleaf_is_migration_write(entry));
+
+	/* A writable anon migration entry implies AnonExclusive. */
+	if (folio_test_anon(softleaf_to_folio(entry)))
+		return make_readable_exclusive_migration_entry(offset);
+	return make_readable_migration_entry(offset);
+}
+
+/**
+ * softleaf_mkreadable() - Downgrade a writable leaf entry to a readable one.
+ * @entry: Leaf entry.
+ *
+ * Returns: A readable entry if @entry is a writable migration or device
+ * private entry, otherwise @entry unchanged.
+ */
+static inline softleaf_t softleaf_mkreadable(softleaf_t entry)
+{
+	switch (softleaf_type(entry)) {
+	case SOFTLEAF_DEVICE_PRIVATE_WRITE:
+		return make_readable_device_private_entry(swp_offset(entry));
+	case SOFTLEAF_MIGRATION_WRITE:
+		return softleaf_migration_mkreadable(entry);
+	default:
+		return entry;
+	}
+}
+
 /**
  * softleaf_is_poison_marker() - Is this leaf entry a poison marker?
  * @entry: Leaf entry.

-- 
2.39.5

