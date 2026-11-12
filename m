Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490944;
	b=pgrcrIasCcKXkjqf2gGG+6qifvmzfxYd5XCW3KVle3VjAofStO0RyaJmJz39OqLtfDGo
	 dg/NDhujUpGmn47pfVpyyIRZqMUqaHFDSfJwFoHImwmVqbYXKAIJs7kuUCx4ng4zYrczH
	 iuU9LO2N3W5qchhKbTRYKcyU7tfJQW5nVHf8LgXqh98zPkvLL+3r3ILBC2KEbJuQbKjUt
	 RkQwoftN4KjVu1Yyy5ndweBsoUiT92k1exVJ9lz19Sej0Vs4tptKavWDVRfuuc3WMJbgn
	 F8zfrS1APW0sWVd0BYZtHUxhG6xkvhcYXFSNdGWxvp4meLeTsY6VwBmDKaUQBxGKGWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490944;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=GQHgVl+ihyM808NJI/QLfdnJArapHyJNzZCISd5OzbQ=;
	b=beXQMYBVqzTDIo05Lm99QS41I0CrirSz8PjixGfxSOjuCnh3qTHd0zJNEX+fqForlP64
	 hnoCmxp89CprFVQxe8OrYyBa8YOkLaP4NmnRGxxT8mUEqZfXy8zAL64+O0GHNSeIdyggg
	 Hiqtce95RaBl4VkXtB30nOfJujbFRbSoEYMLyoT3baE9cyZN7pYRh+Kgf+tkx1xcHWkvb
	 P4sI7C0BghegxI6Mt/6avHhfdAZtoJDCW2x8cIwTOWaHFdntYGtTRXMu1SKytQZ0fydvx
	 qhs3KeonzxH66I/T72Ijpjx655wdmE4Noa57LOfi1koPwIUs8Gujfrb13gojk3GzBFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhPbTrDF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E32606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhPbTrDF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599E61F00A05;
	Thu, 12 Nov 2026 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490944;
	bh=GQHgVl+ihyM808NJI/QLfdnJArapHyJNzZCISd5OzbQ=;
	h=From:Subject:Date:To:Cc;
	b=lhPbTrDFNBESSdw7RB77EgLeLRSKn5Am3YuXHmEbfAR+08//MYeB2W0em10nXm8eM
	 52cWEXS15V2hgIorhB9XNcgw6eHv78caUrV9hAJU2PwBVlELq2AF8iC/5rsCGkLX/+
	 SzvHZYq9GofFyxxXXI946+AUJaj50fnotH0lYUcnViLRONINxdSDUJqx9HKhwD4DjB
	 lF5C/c3fZRHeugZ8dNJEfoyRX4SNNqhN48KWJ76/VzldYJ/d7goChCbZHHUjpvwsqJ
	 ELHdHJcf8zgvLDS6QayI15+54pbWp5/RD3T5/5EeodBpbBvZ/fnrwfkCH3CTLHANK8
	 okZDqmTDsmSDQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH 0/2] riscv: mm: fix set_memory_x() and
 kernel_page_present()
Date: Thu, 12 Nov 2026 15:42:17 +0200
Message-Id: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSw7CMBBDr1LNmggSfhFXQSyS4LSDRIpmSoVU9
 e4ksHy2nxdSCEPp0i0kmFl5LBXspqM0hNLD8L0yuZ07WWudyfyBGmFNs9nj4M/e56PPoGq8BL+
 6Ctfbn/UdH0hTu2iLGBQmSihpaNEo3HPZPoNOEFrXLy+NU0aPAAAA
X-Change-ID: 20261112-fixes-riscv-3e48788f58fe
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev

These are two riscv fixes I found while working on a generic
implementation of the set_memory APIs.

The first one stops set_memory_x() from making the linear map alias of
module and BPF text executable.

The second one makes kernel_page_present() report the pages removed from
the direct map as not present. Today it says they are mapped, and
hibernation could copy them without mapping them first.

---
Mike Rapoport (Microsoft) (2):
      riscv: do not make the linear map alias executable in set_memory_*()
      riscv: mm: check the valid bit in kernel_page_present()

 arch/riscv/mm/pageattr.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-fixes-riscv-3e48788f58fe

--
Sincerely yours,
Mike.

