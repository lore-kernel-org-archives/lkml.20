Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD22F3D45EF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170376; cv=none; b=debbSVgAjCFHIPulvZ6nzBR063Zn2z8uHJFcitbKUTh933JzWJBcthr1YIs7TsDbL3o3DQKGcf511NwQ/vHcxl2knMDAXen2VbuMrZ4kn7CVNOCSH6LVdpZiZvu/pLj4tymZ5wNCfbiVU8iyGxHV07j3iOYvw/9p07F9UrsMzpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170376; c=relaxed/simple;
	bh=nzoFSX+R+AcRpDe3HpmAbT3nJT9qlA+q77afnM09pII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSQ/88DAYZuuQ/Z1B8TwIVUGk0l5fu45O9l66g6LV9pEl53757oqk70g8LTJzmiEBm4zWKb6hR0eVuE5uGhjnfbFpEnAJXf0XzNj2Ew+/6jbfMXLe8XvL8me/nyj8zl9mwoS5e9IeXS/eou49ycF9Tmvk1LntCzDWiIMj6l6qdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlApJuX2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlApJuX2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d01663d816so21714685ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788170374; x=1788775174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0B+PFs1Atg+wJEzTsWLUnHe9K7w0nLXn2hcclRFcU2Q=;
        b=HlApJuX2y/ZBz9tdpZWplwrvXGvLLkNDGEvnNLUz+yHQ8J8FvEC8LBfHcH9HRC8dY9
         yJnsxrRgiOS4Wn3GtJwN0MHYL/hBcz5j75A6CBselbbU5u9mDETh2hqs3SDauvWLYYlp
         l9dvLrEFx9oqdee/dvKHorj2AGgoJ22Ncy3rFFhoCxOwY1Jr7p1s2CXbdpVkwSx6g8Gf
         LIH/lRPCYkMcL9wf/g17KPqIMPeSpa+VzBqTizxbmFVrOH7p4wZVY2yo+S7gnpIR/IEx
         IcDrd2h5fmK5PVBivBxpOo1ytM34QnYz2+thsFiM1RtgGLhs9nFG1xAqxknSK5nA1OQJ
         Bh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170374; x=1788775174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0B+PFs1Atg+wJEzTsWLUnHe9K7w0nLXn2hcclRFcU2Q=;
        b=BMiEsf/qORGgeOaaFJdFUa9ujq8R17TyW1J+4PdNHOQykXECxBRi5VXWehdyt5s9QD
         yjiZURlGLjv5gZ8n33JRNzsc60lBJeggURLVsFoFsR2j2nrWRFzB79o0jrFiV4jdP5aS
         8z7sTFP/TkYV/I6hRYHv9LGEmLkabyJRFDTuaK9f+LHu6dB/MvUyPwDHZvPTuu2euEs5
         QwohQoKCHxPf226XqOoajWl6TQ1fvYuu82hcOgYOQ90MN2I92Y/Q8isIpKZJI9uCSBwK
         DOFNtKrucAVnVQg6edfNL3FRVb83wgiAELvvMsoBJnv3RB2CPV03yNyS6F8YiMv8xrMp
         yp5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzT2Jrj6RE9eDcT7AniTExgp8pYWziMLmowOynyKqngiPXqlLgCyCaWxAu1OkfoSBu794pnernU0OHhaok=@vger.kernel.org
X-Gm-Message-State: AFuF++m/hfzo/jZWsrev25eu3jG+rm0bL8MFetBfuFVCbBol84HO2/gi
	tbdSxfvjNpuLWFJvJI8rgPDeZp0U3tirJ977ikv9RUqK0XJGcI4gSc8C
X-Gm-Gg: AYBFou3un+bKNe5jdl22/F2VRc6kZbnMRwTlkRV+Ow4J8Q+542qpxDCfI7puaKl5kV6
	Xf1+3umRoxoXGjzjceob7DNAPpIbzkQja7sziYS6mDt7OTJfV5PuwbdoFl+ZEG/k8tNL89Xsdrh
	4Jr/i8de7zWpu2HNEibirk3LWLyi/te4t5iGY+DiXCqSmpG8vuQnNGT6zifkipcP/qRWeIua2Sg
	xvV4ot6W+41ysoNNkioPe3Ct49qhLje9BrGNzWCaD187IZaK9VWIg5q3QjfMqax+DrZ3QhD9W75
	d6WejS5ZYV7oHFcMOK4wUDI0kMnG6E2HQeQeUYDTgEYCUp5zhPR4kcDPno8niQnSyML+436faTn
	Z5l/JwIm2hNn6pMw+CZszna397dV5OmrK7OlwQDLzzVv4bTgA1mOceux+eF5hLfA5Au7z0aTvoa
	CaJq50SSrWJJe8mt6t4K5KnOdLKaiSTjubu6BT0I/0VaE4JaANhat5FXtdPftGjRaQ9aGzM7Kpd
	JGvUmSzS8zcjly+9alpQDqgzGJOBRqPP4may5D1mBLipjyuls2ZOXmaypbALBykBtIB0aX3ZlET
	kpzlLiSajY8CY3R0bBoKobNUanacRyY5+Ir12nNdynbCRg9Ss1zU3a4uao7AGVjZNoZTHsjSteV
	K0ymHMZU8SDVf9/YsRuDe5h/bbcYgUteWOzlxzje3ps0GBuU=
X-Received: by 2002:a17:903:3d07:b0:2d9:3be4:7e31 with SMTP id d9443c01a7336-2d93be47e51mr37298095ad.5.1788170374046;
        Mon, 31 Aug 2026 02:59:34 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759640becsm32270775ad.36.2026.08.31.02.59.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 02:59:33 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org,
	ali@iusegentoo.com,
	kiraank@gmail.com,
	kiran.k@intel.com,
	ravishankar.srivatsa@intel.com,
	amit.k.bag@intel.com,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Subject: [PATCH v3 0/3] Bluetooth: btintel: harden version TLV parsing
Date: Mon, 31 Aug 2026 15:44:20 +0545
Message-ID: <20260831095923.18830-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260814171503.42684-1-acharyalaxman8848@gmail.com>
References: <20260814171503.42684-1-acharyalaxman8848@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Malformed Intel version TLVs can make btintel_parse_version_tlv() read
beyond the received response. Validate the minimum value length for each
known fixed-size TLV and bound the firmware ID conversion by the TLV's
advertised length. Propagate parser failures to the setup path in a
separate patch.

The two bounds fixes are kept separate because they were introduced by
different commits and apply to different stable trees. The parser error
propagation is also separate because it changes setup behavior.

Changes in v3:
- remove non-standard Assisted-by trailers rejected by checkpatch
- add Ali's Reviewed-by tag to patch 3/3
- no code changes

Changes in v2:
- split the minimum-length validation and firmware ID bounds fix
- use the appropriate Fixes tag for each bounds fix
- keep parser error propagation as a separate behavioral change
- add Ali's Reviewed-by tag to the two bounds fixes

Laxman Acharya Padhya (3):
  Bluetooth: btintel: validate version TLV value lengths
  Bluetooth: btintel: bound firmware ID by TLV length
  Bluetooth: btintel: propagate version TLV parsing errors

 drivers/bluetooth/btintel.c | 44 +++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)


base-commit: bcb621272aa04a116a74ab5fcc9324231ffa3acb
-- 
2.51.2
