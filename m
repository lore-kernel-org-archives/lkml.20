Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231279;
	b=BsRM3YynCuf2uPxCLQLWy3nRZFx7ccz3BNRMSoGiLnDoHbbyJ5RYJVT9RarHoEaKnyPv
	 sHHFtGHzXTe4iTmygsTIgmcI/xdxIQBBpHz9tYzvze5CgM8pKdtktCSDkpFbZmeNgSj8q
	 9O84N5y4U/ZFg/tGvWLiKnNmI6Uemb0cNTRpzAuB4JC+X4yxsYETK2wvSWsg1yeWd1epn
	 /644z+lZuSY1red4+GG9iK/4rKgdpTyu5QaoIVQo6LYpv12ghVCVhGwy54Huq6Bgn3sz0
	 dyZufPdNKwv+8aK3Pi1cpjR9jp/rJCYlgiA2spunUSHAO6pwbwwCdCdrEqfHB59ZpdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ORer9DhCnuaZoXr0bk+u3MIlDvmVjzbI7uxg7VutLSY=;
	b=KsallUmjW3zTI9qmDT+AVc5vEDtJrqX4KcdiVkDpGUe8M5f6ECDCxHusqcsv9ysQrhkE
	 RSfpYdvfEpXLfGXHXIpMOIhmu8gsaDtwvLySCmdXco/lGCMzd5Unn/TKM2ix+MSxR9aZK
	 QYtQUBn2REGNZ4AQMQsBn5CIDPaPgqL/vGYbLYg4JMHwMZ/gGVJsw2EbN/EVOu05QDdQ3
	 MpV4KKfpilevkCjP1od2bCnd4cgpZjtD7EchKcam6lMZUkd7ZlIhcTMEaQyZl1yt+sTkO
	 JCDzUW79OV8WOeYG6fmlwt+7beRl6kS0hgs8m34HwgdSYtFeS4XuuIm6e8BEts+5+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1BN38Ke;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9210A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1BN38Ke
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491aaed7565so538202f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231278; x=1794836078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORer9DhCnuaZoXr0bk+u3MIlDvmVjzbI7uxg7VutLSY=;
        b=a1BN38KebfREdtFfzHNXZ0os708gpmI4NBDfRZdDOsKrcNR/xjARvZ70Pp706/Ubaf
         5IMOjCRDXK76SDodnGixe9GuMdC82lfjzD45nkXfo/p5I/jlaGynwI5sFEPXdHDrGWwP
         LqlpfxevB9hvkzoPadhW1khTwIUh0tNjOth/q+vS/AVgABzNCPccX2e7Pjxq37uy9iqk
         sgmUT+s/k4fTS6SdbgF0zMTkOXF4BMIlpmFeAMB1qjsUn33I/iFgmiETXgouDq/sow5i
         /U2rTdYaFBFnFbGPnXt3DfeZIiiwakFzhECkLjxWQntgzr79Sb4X/OMOjD0IlQDd/KOB
         CXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231278; x=1794836078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORer9DhCnuaZoXr0bk+u3MIlDvmVjzbI7uxg7VutLSY=;
        b=bEuavR5voLlh3kIMb6szjaEp3VRWA8KBeEdyTYeawUId8pRDVDOpptJWQcd8vAOKqs
         B5bxbfrKRVr7s7sFVgtqfR1Mybg0/kX3ljI/Ea+tm5zmbHjmKPW5RNdCqY02UohNxHo/
         YKYMlJ1idZIhSvmgdnlS5Hv21mi4Tj1PY9rqoiEN22ub9hfouo2rGvMgW5jwktlRJcEC
         N+x0BFzox93pBULPXCd4iWdQWHSmnU0SffMKATnTu9Vl7PKpQgA2yR3oz9klLu4+VsN6
         9moTlOQ7fAXupJZp2V9AHitvJZs8bYxYIjvTYA/wlIV6x7t4eiby2IJePJTM6Y0LvTCW
         iuHg==
X-Forwarded-Encrypted: i=1; AL+hErEjt1HO3bwvK0OYNvo0FdyItzGg4aeHbY3KHl3hqvbtZ1bv/ZuQNqNO6FVxN0OVV6UECyguXCAfDBOI6Jc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PLVa+Gl82jnzjV+Ug8Z6c+yo8DnkZv+JBEdfyKzk7wNUR/eqs
	j7SxIUc3q+fccG3JRhT8OHmJ7/zaxwyNEeFqC9CLowrw8OenGpncQcMs/VQnUFdx
X-Gm-Gg: AYBFou0lKlhfEnTWkWwlJrgNCPSD55R3eQkXjWQ0mxzqW/gX6fYWDvBdNljZAen6CHy
	eDsWddkqO3T2wL45Bu8fpI91m/e+brP4Ir7YkhQbnX4g9xCakRdk23hR1C2UHf4xveIYiOPWzjE
	AmGUGkJqTW8TAsRiD5ubNYqTi9Ft8M7vNA0nzyRIZJP99YnAMXMVcc69WZDYXCai/QFvRyxlQfD
	hj8arcDVK6aYpLvCW1L27vPVyQ5weUXnFZXuFN7yJJnzJwj624AxmwGSjTH8b+l+7IFGGiQ/Hsz
	bqXMImb3wN7OLc1i0gB8FkiyL/fpF3/t4pRp9lmh3xskNii8zRWOngjo/1sReD/If83Yp7TlUKR
	6MmtJbdIrP/fNusINa10xef7rMb/jpkEBOxm7ucaZNYmzz4JEwSm3Qn8k4y8+oOoiELAyl5eLk5
	7xdiqqovHnexEjYMvW01EJkhg1tXCbQ3A/fNk1yXt6bknhdvw6cvsnTr60h/djAD39njpMF2H3u
	EgNfY2lgY9ptSOdJvFUERXPcWBo/93tsckYYEP25S/ZPUVj/tHBchP4jA/tMin1s0u4IojRDcCq
	F93OTyeRLYlo+mhlwCpVgRmDwCpTUKU2V41jhRF5obIxPePAHN95I6rI/kGod/lNrYlJiCZIRjz
	+n98cXG5P6ZToNJqHitEyE1hrGQ==
X-Received: by 2002:a05:6000:1789:b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-495829c1025mr7989710f8f.9.1794231277701;
        Mon, 09 Nov 2026 05:34:37 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.57.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39899sm9140435f8f.3.2026.11.09.05.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:34:37 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: maz@kernel.org,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	fahad.arslan@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] KVM: arm64: nv: Skip empty spans when unmapping a shadow S2
Date: Mon,  9 Nov 2026 18:34:29 +0500
Message-ID: <20261109133431.185154-1-haseebashraf091@gmail.com>
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

Emulating TLBI VMALLS12E1IS, emulating TLBI ALLE1IS and recycling a
shadow stage-2 all unmap the whole nested IPA space in chunks of the
largest block size, even when the table is empty. With a 48-bit PARange
and 4kB pages that is 262144 unmap calls per shadow MMU, each ending in a
range TLBI when FEAT_TLBIRANGE and FWB are available.

Measured cost: one full-range unmap of a shadow MMU takes 0.87-1.06 s on
AmpereOne (Xen on KVM, 4kB pages, function_graph). On Graviton4
(Xen-on-KVM, 48-bit IPA) a single VMALLS12E1IS trap took 1.46-9.50 s over
twelve samples (median 3.09 s), all of it in stage2_apply_range().

Patch 1 adds kvm_stage2_unmap_all(), which skips spans covered by a zero
descriptor at least as large as an unmap chunk, keeps the tracked unmap
for everything else, removes the guest stage-2 records of skipped spans,
and ends with the VMID-wide TLBI that VMALLS12E1IS requires. It converts
the VMALLS12E1IS handler. Patch 2 converts kvm_nested_s2_unmap() (ALLE1IS,
whole-VM unmap) and the pending unmap of a recycled shadow MMU.

The series is based on master, which already has the guest stage-2
tracking. It overlaps with the unmerged kvm-arm64/unmap-vmall work, which
defines a kvm_stage2_unmap_all() with the same name and signature; if that
lands first, patch 1 becomes "skip empty spans in kvm_stage2_unmap_all()".
As far as I can tell, that WIP helper does not touch the guest stage-2
tracking records, which this series does.

All twelve Graviton4 samples, in ftrace order:

  22) $ 2278347 us  |  } /* handle_vmalls12e1is */
  21) $ 3229689 us  |  } /* handle_vmalls12e1is */
  13) $ 7244813 us  |  } /* handle_vmalls12e1is */
   1) $ 2950198 us  |  } /* handle_vmalls12e1is */
   6) $ 5785126 us  |  } /* handle_vmalls12e1is */
  25) $ 2484152 us  |  } /* handle_vmalls12e1is */
   4) $ 2505404 us  |  } /* handle_vmalls12e1is */
  16) $ 1464441 us  |  } /* handle_vmalls12e1is */
  28) $ 1935604 us  |  } /* handle_vmalls12e1is */
  19) $ 9495486 us  |  } /* handle_vmalls12e1is */
  14) $ 4151658 us  |  } /* handle_vmalls12e1is */
  18) $ 9223579 us  |  } /* handle_vmalls12e1is */

Tooling: the patches were drafted with AI assistance (SiemensGPT).

Testing: build-tested on the master branch and
boot-tested with Linux 6.18.29.
