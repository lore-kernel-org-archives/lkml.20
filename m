Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A848DB46
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175182; cv=none; b=W9aSYjdxTlKTiIsRns3/1+1DRvyO0v5rxzFW7gZ/bD+swG8TOjwot/xGFvxstUciM8JfU06HB+GhfPygPHC5WHWsKzbyqZroR7VZ8KG2aN1ANUD/Hla28yKjQpHHpMpT3i5go9bGObrxQGlip09dM9vJIURjgF4JyQDBVek/XxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175182; c=relaxed/simple;
	bh=jkFOu7HnMRYPfDwUq4qbWlULVS0j3powUY361JQlms4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8pFaveHz94xsYEt/sRxo60bMu01yif3ZD+z+fNQPQpdFfSMmvy+DUhtBp6aKHTFPun32iF4hmVDR62OETM+EJpkPbMLSdzcVLxR8ujXZIAFhjzWn7hRdpd/vklCDy6qSu1IgKKUkHHpVe1G3V8AQ3aaFfOm+rGs8lSN2skz8EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=n+DuZRUF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="n+DuZRUF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso229582a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792175179; x=1792779979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkFOu7HnMRYPfDwUq4qbWlULVS0j3powUY361JQlms4=;
        b=n+DuZRUFf1W7l4I5AOagXYU2sSV+p6s8N3Gsta+sjvuaQdKlOujnt/ffhTFJSSPoFx
         uGbdG3BGNFKfluo/+JzJ2Zp6rIzDPV0osM0RVm8Lwz/dr8Hz+Xtak7FmoXjfy0hgQgEx
         Z0BiG7H4xHl3M9YLswz3/XC5L5Vb6A7OJDl5pm6Z6ovnYuqIjJmOdPLpv75vI+XcAVqd
         wqxMDhkPYRwTEQtSL+xRCvPQbXROTJHPRuhJE6yJv9kgRhhmdKwcwJPjHTl1NpBSwMGL
         zKgTLTeC85CHR2jnhpJYT68Xu/v0Y0GtU0GGPicS+BMtpU25FisJlnfWtboAMl4az54y
         MJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175179; x=1792779979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkFOu7HnMRYPfDwUq4qbWlULVS0j3powUY361JQlms4=;
        b=pEWglc3nd0RDYU+BZa5pihOa5yCYymYJB/SPjMsIBlCrLD3nefOxb3rnq0E+k2zYbJ
         cWJdyu05KxEwRWon83hdEMSwOwbP5Y2BQNMda0WSDFXJCBGTCzgjT0Sektl27K2dE2oF
         ejr/KZunqltv2kYu9tO/5thLQw9rfFkhk0uMlol7620UX/OLbz4V6LNmfDcdlNW5gTW/
         Ga5bxA+feBr8oq/9kj0wIEGd5c0lH04x/UYqAa0vRM046+qbEkcip58PE9FnKG8HeFlx
         sA/tkOtKYFoWwbR2a3db6mMij84uZ3NY3F8EruOlwe8HWxW/4/6DLMMSW2IrwxOUv6lf
         2wqA==
X-Forwarded-Encrypted: i=1; AKwUvBxUb0o2BSErBwcptFYKbOTW2cZf2zY3qlkNGuOTS2Uyvv/ZIa9vzxMpCntVtRigiqRKVmnQ3ziuBAfIrgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnaDlE8csoU0s4KFtTAzDBrfc9niLnOyDp/MwNvMQTdAJSNrFo
	kKt4UGl+R9GMglZb0q4uYKv7R4oFmaA1xrN3Ul5MIgAPqUC/BZJKVHXVlfN+BHN9VGk=
X-Gm-Gg: AYBFou0C1FAqjyGZfRlnpH94jQwVEJIsmxno4IwFqzAs3SiiUf5oKRnmRVEj6s+3e4G
	ZtxZ9OqfT2b3jQKyQlRODU0+7lJY9hYrTspc5zIDxvFmfL/9AkkWilEpY3IHnJ3fwLSXt6P8esa
	/1skG1/CVgr6GN5AWWZXbha3pSHsddHwc2I6j9ynIIonH3GcBWUj1rFAGUNB4Pmrth/zNM1oB2K
	gjJec8BiOoUCG/4wp2om+T2pvpuasS846ZkMPjxrS2h9YfGiPadvBQhafI9Kzgn03LpWf2RzrlW
	HtW9B1J6qyzciVj0P7Tyx0/R6viXfk4wUQW/eT/Cw3LRHzxMH2xkRJ6rMvsgTx3VxlVS1JxWous
	aMcxIaMd+RnZeiUUsl7e4nXIBmdorrJt1TbompIAPwcxbopxlZx6RCs18TMVgOaON5/FgwK44vl
	YXkJba7b7FalTqluKQL4MRfku7hhmfpC/FOmxHSOBJYpXSY1CMl3CEqWOnrnKha0cACK8YjCz4P
	DE6+PjbS/R9GgdFlGlw1w==
X-Received: by 2002:a17:90b:4c4f:b0:3ac:450a:fa46 with SMTP id 98e67ed59e1d1-3aceefbfc80mr546654a91.10.1792175178620;
        Fri, 16 Oct 2026 11:26:18 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:5e7a:332f:f584:a3d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm5203744a91.3.2026.10.16.11.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:26:16 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v5 2/3] scsi: bfa: drop unsolicited frames shorter than the headers they must hold
Date: Sat, 17 Oct 2026 03:25:59 +0900
Message-ID: <20261016182559.1750179-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016155441.1607196-3-yhlee@isslab.korea.ac.kr>
References: <20261016155441.1607196-1-yhlee@isslab.korea.ac.kr> <20261016155441.1607196-3-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the 24-byte case: a frame of exactly sizeof(struct fchs_s) passes the new
guard, and the dispatch then reads els_cmd->els_code at offset 24. For such a
frame that byte is past the frame, but it is still inside the unsolicited-frame
buffer, which is a fixed sizeof(struct bfa_uf_buf_s) that claim_uf_post_msgs()
posts and patch 1 clamps the length to -- so this is a stale in-buffer read,
not an out-of-bounds access. The two handlers that use the length,
bfa_fcs_lport_echo() and bfa_fcs_lport_scn_process_rscn(), are both bounded at
24 bytes (pyld_len == 0, so the memcpy does not run; max_entries == 0, so the
walk does not run).

The minimum cannot be raised to also cover the ELS command word, because a
24-byte header-only frame is legitimate: ABTS is a Basic Link Service frame
with no payload and is dispatched from bfa_fcs_lport_uf_recv() at exactly
sizeof(struct fchs_s). Requiring more would drop valid ABTS frames.

Checking each ELS/BLS against its own minimum payload length is a separate
change; this series bounds the frame length itself -- the FC header below, the
posted buffer above -- and the two handlers that consume it.

Yehyeong
