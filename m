Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924024;
	b=N2I6a3AEcSoCVn6X/Qe8EN2lKdT3qxw9nTYNnZESIq0VHLWkLOu7iiD9Y8vrPVKlOI2N
	 0c60uhuRePzBy5LwVPLCTF612N0K5MhIaIQHo45WiS9WEMsf6TWVhYaFfynR/s3RLAgEW
	 VI+8qlWNPagEMk+nzMvosWtMqxEZO3x+ZzC/JcqHbVptY4pPpfVHPZhS86DUUEfHB3sUE
	 f+yNbNy68BqcV2i1k7x4Grna+NVsYTJNCvANGCmh+uk7ZHu63ncdAG5J5fvb/PCyK5Osq
	 PzQ4D6MVwVzmJwZab/qgDhllYIuTGkH9Pnvhc710XHhnLQzbhGH4OLmb1axkrlHm5+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924024;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=QAKEKUUgAktJKHEVX7KI7OTga21H38xwimtePgaRsRg=;
	b=Zu2LeutkhZm3gQsdxw6AA8l1LX3XWMsL6u8PIiEQ0TAvaAtYgAJ0LatJpHrp1g9ArASk
	 0xrD5wU6PQhQIDpKsCYSFQqFOPzRth/pwFilxffR2DFeXyymfYy7Hi0A013RVqlAWpHMf
	 9aiYmvlvSB6kp/KxRT0iSYnqle0aMkrpLRl9J/PEcn3/YLfq6Hiwg2IVu7xvKDSXQ6yh7
	 GCkBkQQiyI2OrVh2U0HgfW8zB6D9Trj8y0lfBFd359ie3ad513xlnDnNSB/C7ptt5IrI9
	 2vinTZZQKrzxxPor8S1gYseIQnMIKi4QS6UddBA9mWaZ41pci06VKU7/k9Z/DwZygmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hQv4ULh/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQv4ULh/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD12F1F000C5;
	Tue, 17 Nov 2026 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924024;
	bh=QAKEKUUgAktJKHEVX7KI7OTga21H38xwimtePgaRsRg=;
	h=From:Subject:Date:To:Cc;
	b=hQv4ULh/2quRo1tcUh32wYacvtu6Sr7S73HF1zlVZXA0Kzb9MKlu7C6qkdnXUJQtR
	 kfG/PLK8vU2ntfIpLupbjBFmGgC7kyvQOEnGyekTQqD18lX1micAOSOsRAbs/WIQJ3
	 r6yhib/od8zo4eKcpjqeMJZoaZ0CyKTHdx4sIF7ru9rcEpB/L8lwQqtr92ToGB31og
	 mrlGCuaPrOhraNzVhdRu7sKf17+u/9aYIPqgQmgKnGCm+4YoKashCjqejb4plSTpGG
	 TvpbLUAeREeRpAmoOGa6lHKT1iL377Aj+bQD5//EygMaGUWR6Y+pNLcI2O8uIGmT1H
	 p8t0kb0znU2Hg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH v2 0/2] riscv: mm: fix set_memory_x() and
 kernel_page_present()
Date: Tue, 17 Nov 2026 16:00:19 +0200
Message-Id: <20261117-fixes-riscv-v2-0-5edc9bdc54fd@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OyxKCMAxFf8Xp2iqtIsWV/+GwaGuA+GidBBkdh
 n+3xa3Lk5v7mAQDIbA4riZBMCJjDAn0eiV8b0MHEi+JhS70QSmlZYtvYEnIfpQ72JvKmLY0LYj
 keBIscjKcmx/zy13BDzkifzjLIB3Z4Pt8ioQdhu3D8gCU9R55iPRZ5owq5/xvHpUspPLWelWbu
 nLl6QYU4L6J1IlmnucvN5aG6NkAAAA=
X-Change-ID: 20261112-fixes-riscv-3e48788f58fe
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev

These are two riscv fixes I found while working on a generic
implementation of the set_memory APIs.

The first one stops set_memory_x() from making the linear map alias of
module and BPF text executable.

The second one makes kernel_page_present() report the pages removed from
the linear map as not present. Today it says they are mapped, and
hibernation could copy them without mapping them first.

---
Changes in v2:
- read the PMD entry once in kernel_page_present() (Jisheng)
- Link to v1: https://patch.msgid.link/20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org

---
Mike Rapoport (Microsoft) (2):
      riscv: mm: do not make the linear map alias executable in set_memory_*()
      riscv: mm: check the valid bit in kernel_page_present()

 arch/riscv/mm/pageattr.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-fixes-riscv-3e48788f58fe

--
Sincerely yours,
Mike.

