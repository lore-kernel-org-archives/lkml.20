Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829408;
	b=rtBA/z17jk1NwofsYVZ/V9xrAdQqDseQP/y8al62YUykGJWL/fat0UhNpgZDOYg4ocCU
	 DK3ApYzXnllc3oKyvcCxlQfeYs/FT/gT6+VCeAd6S4+opRn3WJ5mQ92g8BkDOt8Hads8M
	 5rZvae907spn3Z7g05pDrY7p1SHXCidgOfLkZrIbCNtoDpyqxX4zs3K90O+MtDVZt2U5p
	 cy7GY8z6yOfNqP1+0OIgo76RJ7VTsO2DkC8VShKxfkYGl1KoPPNrx8NR5U5b2ssC+DIbH
	 uKq/qjUTuEWWnqjt4QP1GOrrPMSWsLlZftHeU3d3fh9RRfUo9mROy1imGM80ept7SUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KTQjOLscv7pBRUr3IFndTok2cp32yKjgkssaNhdisLI=;
	b=PJAGGcByxm0WEHt+yST8UQJS+q9BlNW5d7kJXGstj//lZVGdnvaIAHbfFx+OBEhUL3EA
	 quiT/EnoZLmShmrT1MR83r9gp5wY9X2mGgXOECj9euu3yhi4K2/ZqBCIFJ27Hry/ObtUg
	 +tOTaiJrS4ermx8WaaRHF9Qh2KFEnegckXf1Iw5jzmqh9aBgrlZkUaCdm892v83NZ4G01
	 OgGhqQtfP1S7jz1uiCovqm6qZVpRqEPXLzW6VCKacacNKEThYXR4xhRicosvMcgNDeiMj
	 atB/b+vGqbrSUBryBtNTra+R5VP17VX5vpOkmkQj6ZZlnDIc93SWZPBwiH0xLqPzxmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg23jUiE;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E0A606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E0A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sg23jUiE
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b1535be329so2460895a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829408; x=1795434208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTQjOLscv7pBRUr3IFndTok2cp32yKjgkssaNhdisLI=;
        b=Sg23jUiEtSUhNxETJE0Xvi1ElvGviFGzaUVdNxH50arx87z28doyXl7c88creDnFoI
         RehL4ICNvs2NxeSLF9mjDOJlC+anDPzczR4hWhFa70j/XfGpd4vyMaD4532rrj1IRZE6
         iyRwD+xFh17fD7ZDjuX5zrhB7Ptqmgbovqrcbup1K9FLRMSXkQ/oamJEQWc/jN0PAuar
         yAoyLI4b2zFDBDqhauhw1xmkQ/SV1BhGeVDFqOjQWllik1EvfAwlg+2wXc7nxUY5vpCw
         vDSvcfxPPp5nev4F800QhzTJqzgGZbISfGafkKZubaZ4zoIAaZ/TfjS92foHKkcCqt/4
         nvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829408; x=1795434208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTQjOLscv7pBRUr3IFndTok2cp32yKjgkssaNhdisLI=;
        b=HbUigzn8FaZXnbeI2ipYOK6LxpQLMCyG5QTuEutztfblF697k/RLtEpviLEEyqVZd6
         TJmTWphVwEQMR4e3aD1lnxhU7mdksIOE2nNnJQOVI8aOTqKqLDDKdsouDTDna4TIXN/Q
         1ZU/gph9YtQzPNXD76LgppMjzm+1Q/EwgELULOIBz6/wNUl3GDAJn3/0oJxCZkJTeChu
         lTJm5oLWZQeZnjhcC8cy5UOWRMYNfzGTnPMEFcn8xjmcD3CmnKAyUqblEVLYMuNZ7ePC
         PYoZL4fLtpcko32LgSCq7RTpzhW04uQpe2NpgFPLKHNMAiJGknjOLu70PnPq4u9C5b+2
         WbZA==
X-Forwarded-Encrypted: i=1; AL+hErHtI6bbuQSp32aw6SA0dZ+lz9xMj3Bh3L1NoPbBL/ljl7ROx/uEuy2fqKISDLojA+83NIEW3rYmCVPXskc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C272sFpRfobXkfnKet1IsEqK17aEySCRO1N3bXcT68pR2rsdy
	ZJZDx/5yD5JMeehxg/9M9JeiGy1rlJwHzhKKNqk1sfim/e4A3IhhHD4V
X-Gm-Gg: AZFdTZcJSY+V5VBLfV3bRe6PD9LAdn0XDoejHhEDfGQ4h1hrTPnZp/5B0r5OZKkugHH
	Vsn0OldOWmU8tjdPUoMzlTopOnJ0Q94JY7V1sTbBL5MFsBVlJ0LpfX9Xun+7pFuPZkLEXezi+BB
	b5cgQK7MpKOyRSBCI8/BhU5ARAJ3ygHW2SQPxUhEUEd+uXUpfLToa98u6ZkNgOx6TXKijrfEE76
	CE7+9QFbiamr308OsLrQVObMCo6nmU5yZVHIGtGDMBD+vQlBXVWZtHCRroUkNRh1mYSsv0SO60e
	7Fx0ALQCNfvG2yDdPWfGNsQmPVeXRg6FOFk9WcJtEpASeRIK30O5kmEZVV7SP/1kem8nFFcBnrK
	HFrSmKQZ+m0QEXtLUkXsTqbepKLxdk+fLZYjEOsjXWOgHE7eYvP/WN0jfk+QR71Lypj/NKPu8Hi
	khNFB6ZHOmrcIws5BgsWaZu+Cx3Ao54hFRnFgadLycZ69kuZShmijkyYA/JizM0qPe4NgXZYsHq
	w8e8EDWiOvPFTAndC/MEXH7jV70A06pgnJSAZF+wLIPDTCa3cLou0e/ihzMlZ696kHrLOX9Sbvt
	F/dg97re9Kq5kmxE7yVId0vkoul/DYh2BrhBH30HjH04hfVcw+koZTjsuiLPZ7ApLxJfDcFiCQ=
	=
X-Received: by 2002:a17:90b:49:b0:3ac:bfa7:b079 with SMTP id 98e67ed59e1d1-3b1b081bbd8mr9740865a91.7.1794829407614;
        Mon, 16 Nov 2026 03:43:27 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1baaafdadsm14089519a91.13.2026.11.16.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:43:27 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 0/3] media: atomisp: remove unused functions
Date: Mon, 16 Nov 2026 11:42:42 +0000
Message-ID: <20261116114250.6587-1-chaulagainavishek14@gmail.com>
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

These three functions have no callers anywhere in the tree. Remove
them along with their declarations.

Found via a tree-wide search for functions whose name appears only in
their definition and prototype, and compile-tested under allmodconfig.

Avishek Chaulagain (3):
  media: atomisp: Remove unused any_virq_signal()
  media: atomisp: Remove unused get_sp_code_addr()
  media: atomisp: Remove unused hmm_flush()

 drivers/staging/media/atomisp/include/hmm/hmm.h           | 1 -
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c               | 5 -----
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h  | 1 -
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c | 5 -----
 6 files changed, 21 deletions(-)

-- 
2.43.0

