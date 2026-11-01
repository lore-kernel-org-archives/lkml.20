Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514051;
	b=SLqFpUWnAZKvFL50UScJmsuF/uHFdthmnaEyJuC2x/1adgw028xDHn7LH4gPG1l3b+ck
	 gaVA5zxsB46L68TkXS2PjFdudBOnuWY1zXG1OqD07bJ5emphLCVP4G5KrDtGmQ76C8wF9
	 mw0V1krUaDF61LkQ0bOL2qBWKIIKprCom2yjqMVXXKPX92qlJiblF0AHx6SWRpaGMWisU
	 SZ2Uw15j19SWUsNsexK2/bDZaqD0z2n/XcpJaiitfBX5Q3M8OJcenoe0BHu5g/57DOY+n
	 tdexb0O/pblPuEpjq+UcctgFrDUc9CvnftNwfg0BU0ctH/NjftM1Rk/poPSWz9TYlzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=oaPJYRLQOnUXY3GkH7jTJTAE7Wl3NuOEbtsp4Z/SUgc=;
	b=hb/VrczdfGON8ExuWR8VTKmlxAT+G+0CehwClm+n3X74GdFD5iVax0/WZh2l9z9iAaKp
	 +5jcEELHs0PO7AFABTj3UDqT2MIz/pznhHbyoStpqywzKs79XNKhSb7l0kkUmuDODThIN
	 pXjQqj/oqxEMZL5hXzZu6gGs06VakIp6OCx7Dp/buSefmRXyQbjHoaNbpVn8qu3BPfmBZ
	 OeJOBFmXaUfA7HIg/67CeuXkh+PIFq9ggPMBUhNeVLWC7Fp0Key2N1YQ1XS99mF3Vq0R9
	 x1U0+NtZcPMgm+RPPFxlym6B+GAOGGk+Wq04SfSKD3Ru1bTN6utIEqQeVRUI20jW4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BuQzGhTZ;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C94606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C94606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BuQzGhTZ
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3698bd5392cso1775346eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793514050; x=1794118850; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaPJYRLQOnUXY3GkH7jTJTAE7Wl3NuOEbtsp4Z/SUgc=;
        b=BuQzGhTZI+KMKd3AqJd6tbk+GDDIKP+orSREe1lCsOFmj8e48N8Y9Bekm8LL28stEz
         jyQeNR07S3Tvvmxp324XlNxfmn109Gi4srlgUu5TBQ2bDryrhHvqUP7b2nChw5lHDEY9
         5Sq2eYfcmNn5nxp2/mdG2JmSQIrl8BdnDlchxIkfDjUS3ZFerQt+qN+cBONcQea9/eiU
         Lm82dTsu20HN1G6dPMDjADLzFt5QDU7yVavVfKVf6W218D6DhEbpryzM4KHZG7c7baOi
         MVXZYNGCSwC/evPXhieRFIxV1vOhKLQxEvfuavDyvg3oJ3wxqYWlHn5DTRCKmPsc67Jc
         YwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514050; x=1794118850;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oaPJYRLQOnUXY3GkH7jTJTAE7Wl3NuOEbtsp4Z/SUgc=;
        b=o9Yi9iIJrdvncVfQDsr2jg7JOvnigRSDp18+hgxJm2XI4wBlglKI9uWMS9Bxw4IsxU
         WaBDOasX23OFULGb1J9Cihjl0sfVilHPh+HrZBb76gNJbKTV5MxRQxThXU1z76xPViS0
         eM4qKjrvIzE5Dkyj+UDE2Rxeexkjl5kOdbwMnjiKAUbFsOUk87jzFKShmduWoWAYl5D3
         s7yU3aYY+hCotXwH+LSeAgP7cOrvWGuzEPF7DYtLgN+qdj32w1CkyNlpyUHn/nC0RRev
         dHPnsc2oIKukJ/dAnCGe2HMG5AVHDiiOmBHATRWDOKzH6WtBWqWYV1b1xwUL5uJh1+FD
         PvdA==
X-Forwarded-Encrypted: i=1; AKwUvBwkTEdTKaictcdAKzP+LgxfW2/ly7dAN73kbDH3pzdVEdNw+HZlsTfS+J95mMCBUl2+hblgNCTqAMTf4ps=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN4SloSccmzuSQgz92ro+Aw9HUqVkGPzzcBC+b9cVXvqdPnh4G
	+GXkPrItmYHtSiNh9upNi34xwmFur59asnOBX62bpunAIIP0mMmPQHbBRJD4n3htiNZlXZgG0m8
	CrLVUK6AcQpWPdFzgN5clWNhQPg==
X-Received: from dybsq12.prod.google.com ([2002:a05:7301:710c:b0:366:233a:49c7])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4715:b0:369:f17d:efb with SMTP id 5a478bee46e88-36a3002dfe5mr13291921eec.10.1793514049730;
 Sat, 31 Oct 2026 23:20:49 -0700 (PDT)
Date: Sun,  1 Nov 2026 06:20:47 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261101062049.998160-1-almasrymina@google.com>
Subject: [PATCH v2 0/2] vfio/pci: fix huge_fault write handling and add selftest
From: Mina Almasry <almasrymina@google.com>
To: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, David Matlack <dmatlack@google.com>, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"

Fix vfio_pci_vmf_insert_pfn() passing write=false to
vmf_insert_pfn_pmd() and vmf_insert_pfn_pud(), which causes an infinite
write page-fault loop when vma->vm_page_prot starts read-only (such as
after soft-dirty clearing via /proc/<pid>/clear_refs in CRIU or live
migration, or on arm64 without hardware DBM), and add a companion VFIO
PCI selftest covering both read-then-write upgrade and initial write
faults after clear_refs.

Changes in v2:
- Expand Patch 1/2 commit log with practical trigger scenarios (CRIU /
  clear_refs soft-dirty clearing and arm64 software dirty tracking) for
  stable backport evaluation, per Alex Williamson.
- Drop the Assisted-by tag from Patch 1/2.
- Add Patch 2/2 selftest in vfio_pci_device_test (bar_write_fault_after_clear_refs),
  as suggested by Alex Williamson.
- Link to v1: https://lore.kernel.org/all/20261024015540.538758-1-almasrymina@google.com/

Mina Almasry (2):
  vfio/pci: pass FAULT_FLAG_WRITE to vmf_insert_pfn_pmd/pud()
  vfio: selftests: Test BAR write faults after clear_refs

 drivers/vfio/pci/vfio_pci_core.c              |  6 +-
 .../selftests/vfio/vfio_pci_device_test.c     | 83 +++++++++++++++++++
 2 files changed, 87 insertions(+), 2 deletions(-)


base-commit: 076d7e989cb69f6ded7d60f2a080eb909930061b
-- 
2.56.0.385.gac671c819a-goog

