Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398994;
	b=ND6kF2fn8ijk2UWlEavI8h1X7StB8m5dIaOcDQWfgDzgP5z3E+BZULSvFdueORL1N4oM
	 bzIiF9jsOEJtZ+vWmJTErpIKVpQzy90BwVcPRXkyd258aplB1Fsz95YilPfyBQcwvK8NX
	 INiYB2e6qh9ppuCZ6VVspy2gfwjDHZABNgqOIT2OnzQih48QiwxBpaY5FJCrBpEAbk23A
	 Bw+wJtNJ6Yt9qA/3nxoVQ+aMkB3VlsgpBcNhUXJs4M52fOumSRK/IBGRZpJje+stGRIy8
	 e/PyGrhcpX2g0OvboymnvR0waNu3d5uDwU7SImTiAspvXGR69fBxFc1pVnhDP8DdXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
	b=yVcDe3AEOGMgANuaX7FOWbj0V/vjvZCARKGc5KKIjkNl1I3gxwwxSnAqpNA2dnrN7I70
	 Htg7pcWdJckZCvw01w9i/nVXRbMRMpvDmnzosXpBJolnYThUNmeZdJdQJFvSEbt8a+/h1
	 zO0qpj8vxepSI7491X8uNi1/f+k052IB67M1ypTWUty92TSCqHs/EK0mtPzzNv7bFlcdD
	 PbQ3pRg3q8ujynkhToAMKU3mJ75Xhyp466tKwGxNp8NR5J2v2UGG1I6pK5+V3GV9Lv/sf
	 fV5VM9mATdpZIKB/Ky2QWuzLKtNE/6dYj7IEGnY0VaM2M0FdbI/r838NaUiPke59xFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzQgpPq3;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D051606A894
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D051606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzQgpPq3
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-82109f51565so1356839a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398993; x=1795003793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
        b=NzQgpPq3wUl1i3FkFxZ5E4mkj9nQ/Kty6du7nwjR+DbkrZWWhFf9Am+gxOfno3pmNC
         ufRqkQsZs2L9PePy2dgVEohJv2/tffYzvJ/Zka7wR7NRp74XVmgCIRmBAdJPrRXNaGJ6
         wHXIdlqyE/z575W3jia2OhOzq8f+qxTdyfC0OIcHD5/VkKgv5d/9oDy2qFhdNnoTkxDB
         YeJLeZANeJI7zdDDTkGT4v8SQUu8U0kDIrwzSd0QLGaKdEtw7sPZTU5yplO2Tzizcp+E
         BfixZzdaZjdOB4e2BmuJ6UkTHTtUrcwmWZXZuYeDZwOExXSw7yC7bPCQkhxbB97OXVGB
         gRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398993; x=1795003793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0NJ0Tjdg/pYbIbqMZNbeV94Mj/dKmq8NmNovao9J/o=;
        b=THs+yRYKrWeltLteodG5SgcJBT17jjeqPC6mQhun0PNoEOZAiPxf5OWOEd7fcJWJdr
         kmdZTMlNIkm1cPbIvF+To2Dtpdb/9PP0VA7g66Pzqc/pntGma/y23LndSqM4hQZESHzS
         I8ILjL60CKXzLURI1iVtgTcCQrM20w7GxBVoUD9B+BvTdeN4AMv1AZyk6FzBTZo+32rB
         oXRu2FdJVKmNYdw8z3eOI/R1sGCrynBLPH1A1kW6qrzY60aZPcKEIufLPbIBp1iPKW/P
         mFzIJ+pUBenXY7hfA398Rhc1iLr08w7+G1QZuzSyuj8+2bsJGqFV8uEoizCYtDN+fZX5
         HDJQ==
X-Forwarded-Encrypted: i=1; AL+hErG6E7UA64LkXzTefitsBwL0AhOScHFEEMyLbIhtc86U2JhINYC2X4VGvcLjHywe+hLaQppdGX2+qvK2eYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NgvfdXbB1QfyJlhhsFSFodb3GnRT1DgjkVZ/TMz+ytXInZfp1
	vMR8Ap+Va6VFpd+pyQuG3VTmnqFXwGbxaSKiRQKDW4ysIdE0imM6q99T
X-Gm-Gg: AYBFou3hllIKDQBu1pQxO6Y48YVwY48pycUNUgE0FdRhELVfMG1CkV8U1orE/KpNbLu
	b9IyxmgVnwZZR+XjtflNbbBcbAZTaKgtlpdZLfJtPvtpVhD6Z6zv7zq+TY48qSwzAXLeim7zNP1
	s/7Sx/arZAtyoGLEFRnUBlbhs7SQ0RKllLwfhoHTtaVC/U1NnKIBCCrRhcCoPY5ZgHx6msVwgnr
	M0gVjiTpuWBG0LPdaFjbydf3hfydviamjFzisajvty5nYwpqRGJrBimTXUCoPB9OXNKmrkFjfzL
	DFYwt/Q6bV2AYIdDWTKYua4XH1Y9FKMCRgtGdJi+ev/go7J+Gion7QwtrZXHM0FvHmdk3Z9Cc9h
	qY/7qQ3yGmpgxHS9gy45pyk5F6xZ7oyoyJBJUNFZpIg8hHTgYN5CeOgMKkmCG7PldBnwc27seXZ
	xvs11GtIGcBi98qm1P0E6YGXOGpWbnw5SuHB0fpA25cLYbcN3d1vx8Om2nt4lWzjiTi1ktOkpvo
	NonI81Jwh2R/320RHcYtms7LFs8I97KLYwxnSC6xy7lLOPh2oIKFe00IpVvZEO923NS2xcqUiWM
	zd+07RSeD4vhv2voInvdpvvkxfcqIX5y4SHOlPf0kGWWl4rN7hWINZx69RCLrWF3+gOzN81JnYr
	t8cRA9cYjwDKxlS/+GSDdjBIzGQ==
X-Received: by 2002:a05:6830:25c6:b0:829:8a9b:de79 with SMTP id 46e09a7af769-860f268b747mr1620889a34.4.1794398993361;
        Wed, 11 Nov 2026 04:09:53 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dc85a9e8sm4218356a34.0.2026.11.11.04.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:09:52 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Wed, 11 Nov 2026 07:09:50 -0500
Message-ID: <20261110-a7s-dt-v3-deps-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

> [4] A733 8250_dw v2, patches 2-4:
> https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

Correction: the runtime dependency is patches 1-4, the complete posted v2
series. Patch 2/4 needs context introduced by 1/4, which is absent from
v7.4-rc1 and the checked tty-next and next-20261109 snapshots; all four
applied cleanly together.

AXP318W PMIC v8 5/5 also needs a context-only change on v7.4-rc1 from
sizeof(*desc) to sizeof(*new_desc), introduced by b53a09c957b68.
After IRQ-bank v3, pinctrl voltage-mode v3 needs its hunk context adjusted
to the IRQ-bank map; its voltage-mode change is unchanged.
The older clock helpers are already in v7.4-rc1; no other input adaptation
was needed, and DT v3 itself applied with ordinary git am.

> Untested: boot with pinctrl v3, card writes, hotplug, 1.8 V switching,

DT v3 with pinctrl v3 reached an initramfs shell on one Cubie A7S with
vendor firmware. In these boots, warm reboot returned to vendor Linux only
with bus-r-riscv and bus-r-msgbox marked critical (firmware-clock patch [5]).
No card-write, hotplug, 1.8 V switching or other functional coverage was
added, and no new schema check was run.

Thanks,
Enzo
