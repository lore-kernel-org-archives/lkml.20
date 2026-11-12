Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511425;
	b=bzhSV7ln2RXmXBKEllc7iNFrTXrQfgbDfzkFZkF9DFVoDCI3sd6XYkVGgrPkijZrIIb1
	 ca9O4OKQ2jAMu+N5SWnHby0GduTS+bcuPNauAtPC/621J74fhNEIWDfjEOwyOjmfw4YWg
	 AlGZI3fU2aNH3d5JXXl/MKsKUiZfZ9Wx9aRp61rsGNhPkxNfCqjKC8nGgzC8rjU+VGG3z
	 XjVTClOUMT9WiwIuSekiz5hTqLjNZNjwfxTrAs3nAwoxDgMyZ/pc8dtrTJlvgI3+3EtGz
	 v93xXCvRAU1LVBnwL5QU+274OimhCFEOBKohNrBNPOI6hYLBH8vV6uWlF1QJnHHKwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/4AacCwXyjEM4aiyhOWViwFiZiWmZmzTtz1jPZz02aw=;
	b=fyAAuVv8P427xD6nHzjrjweAn80H/txTNTM8jBC9bb5yEo9Fk7KG2O8HUsPj4JcjjaxM
	 WsySKcGYc0rWnirvRlVTaUqbrGHfxZcfxXiO1+AJo4O6At8UPVxNDjFkiogeOk2z/9FoV
	 DEM41kJvJFVoSXCVFdK4II+L30VT1ekZ5wiyGuNF596bkCqYxS5VRYh92E1EOv1CfLzRP
	 QyvOln2dxXWJcD00aVgJAjDlaLtiA9te6Tb3QQ5/7tPMLmCziV/UVyTJfe+03HX4nt5K3
	 6jtqLYX2uH7wjZx8+1ivV9qgrtia9RnB7mIg8vInbwR97+ZTv//yA8KHcWwLIDNXI/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9B5TVgz;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E06606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9B5TVgz
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91ea3f6a506so1719746d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511424; x=1795116224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4AacCwXyjEM4aiyhOWViwFiZiWmZmzTtz1jPZz02aw=;
        b=D9B5TVgz8Jd7oaBGVGeBqm0Wg/G+OfkjJ8YALUnsRwbRAt5U+uv5wEdAMiTvt6CF0d
         mcCPF5k5JqUAnI/J0BhG4kgJpHFXRfLv4BxyqETtnkNMEedoezAkeaeSyyDBS5J4Jqex
         U97CVjR7Pmg503v72rDM7fn0E98SABlEgwocDhw6Iv4vUswSYANH44HatL2S8NlQQqcV
         q0uSvMBAZj6qut3wYcY8dwx1xCUscO7erZgHbcLDYtFZcG4s1Vpa1szP0a0jlskbMRV9
         Xrnlgohyq7Aj9U9pTgh64EvslpuDD3V0EzFWFZSfVuDaDy/j4hF2ZUyAnMjc1UUJ05pK
         Igyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511424; x=1795116224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4AacCwXyjEM4aiyhOWViwFiZiWmZmzTtz1jPZz02aw=;
        b=oeiTqZbsKdRa6ERNH4zY7CJ8ucgJz/Cu9HbA1Qs0D5t4PKGtGCPu87HFLPi4cMty4Q
         APrDwKdwYdaMWJOnmkrlq3T33ysMV/AAUj3+U1PlgO1tXlVnULn6JN+LbX280n1wti/O
         KCYGJGFQnI6OjQ9FOogPSOZXk5ZFl3kk9T1PtgzOBfKg15t2Ss7qh2mfwMI2f+ICbZVx
         /FtlRLD45SX1GMZNeNZcpB/o3Ppay1L8fXjpRBQTbMs21kMi6SEm0rRK05ISXDa9xw4K
         l8RkEIsVVooWH21AUn76x42vDdjsEjlRDBJ/VTrnDyxcGeKsGsV03ycn16mOpDPofhLi
         H3xg==
X-Forwarded-Encrypted: i=1; AL+hErHNnepCYZWnHibIJJBeYB65N6bHPDmRBvFIypWSdlRJqwaT1hKiDPlPZFJPSVReNIZrgF28C97QeJwFBO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V2aPqr3N3rWJarVqnEUMbAGVtsfziIugqqzU0fReJE/HiIhI1
	zYEQvEfDRB0Se9Am+GbKlQ0QknykvCCFWRmAEM50zScky+6bELEtKeo3
X-Gm-Gg: AYBFou3O98MolJma2hGamFaz9J+nOp5gorXEVivX67wgg/y3mW6kRxUw9eYXbt0ejwb
	e9Xy6O6LTRtJ2UIAK41LW69kserDfAlFsBJXfRzM3KrnXSdSRadHk+CiptuLi08B5Zuw2OGxNPM
	ghdDDYEwQsDkJgcZVh5XXxy8lDvZGrzThV6ApCT62jmqfX2HlxpkgQcGWFl8lt89tgMnk9XxaOs
	evIOK2UVfeakEUuFJih+mG/eBlD0/JP231/W/HmuDr12rxWquZSS6OvJ7iASrjfcVgduEu+4hX9
	K+Zf7nds0iTY2CCTdbkqpyxW97mc0xUlcwDL0vG18CkoPYigMn0fpBHvwkNCwjoyC7+LPgpc3LP
	vrpkh9cnDQirYrG+iFfF8fStW2k0YJKUvIgp49t9PbIWUpezEuYQtrXTc7uv3vjdcFEF061B/KC
	vsjPzIBmOeYp9lmMummNVo5h2bCsE78Egi6xC0LRkYpRew4tsegc/ylYrUCc4aHZRm3gUC/5pAJ
	ZMOHQWgQ9pW5zwZQEkjo+md+RdtNogdRGEs3EU+66PFV9SZeF4RnIoedm+4XYAFR1pa+Ez0Lwzo
	HGSNg4k6+nejUX58DC3suLiIsHQsH4H7fCh4rl0E/67bS5jfagUk
X-Received: by 2002:a05:6214:1c4e:b0:91f:1544:3eff with SMTP id 6a1803df08f44-91f24256486mr4682686d6.51.1794511424421;
        Thu, 12 Nov 2026 11:23:44 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d780e8sm2938026d6.27.2026.11.12.11.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:23:43 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Wei Liu <wei.liu@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [Question] mshv: unpopulated parts of a movable region after removal
Date: Thu, 12 Nov 2026 14:23:38 -0500
Message-ID: <20261112192341.1412177-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi,

I have a question about how a movable memory region is unmapped when it
is removed (mainline 067c5c24cef2), and would appreciate your view.

When a movable region is created, mshv_map_user_memory() maps its whole
GPA range with HV_MAP_GPA_NO_ACCESS. mshv_region_range_fault() later
fills in the page array and remaps the faulted pages with access, and
mshv_region_interval_invalidate() remaps invalidated pages with no
access again and clears their entries in the page array.

When the region is destroyed, mshv_region_destroy() calls
mshv_region_unmap(), which goes through mshv_region_process_range().
That walk skips the entries that have no page, so only the parts that
currently have pages are unmapped. The parts that were never faulted in,
or were invalidated, are not unmapped. Before commit abceb4297bf8
("mshv: Fix huge page handling in memory region traversal"), the whole
GPA range was unmapped with one hv_call_unmap_gpa_pages() call.

If I read this correctly, the hypervisor keeps those GPAs mapped with no
access after the region is removed. A guest access to them would then
come back as HVMSG_GPA_INTERCEPT rather than HVMSG_UNMAPPED_GPA, and the
mappings would stay until the GPAs are mapped again or the partition is
destroyed.

Is this intended, for example because the hypervisor treats a no-access
mapping like an unmapped GPA? Or should mshv_region_destroy() unmap
these parts as well? If so, does the unmap need to follow how they were
mapped: 4K pages when the region is created, and large pages when an
invalidated range covered a huge page?

I found this during in-house security research and have not reproduced it.

Thanks,
Yuho
