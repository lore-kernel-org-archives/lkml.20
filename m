Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC9045A286
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580494; cv=none; b=nzyT68a3Dqxkl4IH/8OisZkqzIlCmyxFTO3a3rYF5d38IGb+jvTZquZnRytCX3lJRoVEH0twyNQn5X6M7HDvy5h/xsUz+3Wb/4YUtFzRJGOtNvTQZtV3sPLUVsJzlYtmNcpCEo3NlmkLy2nvf6Fd09isW4TyUm4IbpW5CilWQBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580494; c=relaxed/simple;
	bh=DZEBm7AqqCnArM9eNi1XRjIHVWMaI8eGfrCgZqmx5vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m71J3MaANFsHpHo8yRnvGsy4GUMOU9ut5nbi3OZkgi408414n5dnaZ9PvT5x9WuesOgXNhDXBMOIwTb3FUhHTqBUHh3oybGYrHOV9DknL56xrOsqMEKyWFpHkbnnEQDcXdeaiCktLsrlLhiZlK/RuDA9RiUHeZfWaPe6cgxqUyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wh8/+rcv; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wh8/+rcv"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc7a4b79bc4so146956a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790580489; x=1791185289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bye6SXDJtZqYyoJ8pMJ9LL8Wd0RgcztWGshO/EITHjg=;
        b=Wh8/+rcv28soGebdBSKzhwOn68goxvLuv1hRTAzaC25X3bk+4LR3vyn6wNS5bB6Lw/
         SYZ/dtiW2vJr/9/5NzMwQrvtUuMWc7BJG5HgPefwbZiieOB7zVsjflE0zpu1t1w1JfbL
         f/1Zk6XfITsyZNYSqnpFyxRocH4ZYaDzA0woOUuyUtPX/li8QQgFTxh+QyZEsYUW06L2
         P9+TIqlSgIxoM8yGpla3NGZorhmjnU124OCf4AwIF3hrb73P8iFzRugadFwz2VTm2QJi
         OZcB51w33G942eiIkaN1CbEvGw1C0rr8AfkhkOv8rsIZktNffD8XY04Hw1HXrpjFJw2b
         lP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790580489; x=1791185289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bye6SXDJtZqYyoJ8pMJ9LL8Wd0RgcztWGshO/EITHjg=;
        b=GwqZUcF+OPA/rASZMR8Ppso/b3BE1qBrnFpJlM3AAEhjfoPazCNJrYndM0U8fCrw6J
         XxkkdWuKn9Sjqq8zYhPnFGn94sJk4hieHQWGVsqWp0NnhBjhENqK/hlLf9daUofFtwMp
         OL4O7GK02mBNM/FOqpih7dVtICdoHhTe2nxS8TDaspzEke/YLxa5P8k8NlNJiDXNA1sg
         /7IXBsEHAm/JCiJot91nQwimdHv/c0y+CSQb2lop6dFtDTKQPcZ83yZiBDlQd/NGHJ2i
         zJby5l0c5ERZiZcoUh4W1GBSXnmS7awicqBd2JqRv+o1QVp19VLC1TNLr7I9wLHDh8i7
         EIGA==
X-Forwarded-Encrypted: i=1; AKwUvBwQYr+p6d2obSx5r46w1tAzpdVmVZMXQQzdq+Oa6tjrVi282mu0uY4/Q0K9LyxT8fpOYPEUph4DTLW9Apw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVbRz4Ewv0TE4qK20PoMpDW3uPyfWNf38n+aKaRNXuj/g026v3
	i/cJCu7v5iBu9QRklKSOEJK75snU34FvXk7fr1jHXLI8N0SfQx0R8VPo
X-Gm-Gg: AYBFou1u5BBntUGa9Uhy4GJMOILoE6ZLxBaqzKBIaS3o8f7PP15KkXF/Ld8zn9LtW1i
	193c6fQBe6aD48iDHTdb2cTk6bZtpDuKp3i3or6IdeSTH66JMmTzeN6LA2NdYp4yDLPXZ3obfp7
	FcB6jHoN/iQl9l7P4UQraxHzJpSkQ29xcC6IuhpAJz9pri3bKmG3RYVHY+hWO85JkXDvW22BwP3
	58bVxnuyV+S7EHXzE5MFQjYXe5SfgDMBjhn2ugV7ekrt607m214oPzzdKZS8fj2lUnJAX/rrgSU
	JIa3NEwlLPNENGPzqYrvek++du9n0KrxCfuH6pkeXJvc+0jqQMcozXOi8kbvjfLb5s1gXdIwMpr
	9ZuuZUtHCsUhDxadi3zkJrb2jlYlrjokQPo97Frc3Xp/TASiEsl/E2Fx+DXIHD7WBtH5lbsYeU2
	KdChnRCKcePpUqgE/MFUYV2h/BsMalfjLBEkHkF3I5yqsOU1/lw7Zoh6S+C+gtsknLk8RIs47zq
	rFekw4y89E=
X-Received: by 2002:a17:90b:5247:b0:39e:6c68:fd8f with SMTP id 98e67ed59e1d1-3a098b628d9mr7264933a91.36.1790580488646;
        Mon, 28 Sep 2026 00:28:08 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm25102399a91.3.2026.09.28.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:28:08 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Zhenyan Wang <maximwang110@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christian Brauner <brauner@kernel.org>,
	ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] fs/ntfs3: keep PrintName not changed when creating symlink
Date: Mon, 28 Sep 2026 15:28:00 +0800
Message-ID: <20260928072801.13714-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927180359.3867508-3-maximwang110@gmail.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com> <20260927180359.3867508-3-maximwang110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 27, 2026 at 06:03:59PM +0000, Zhenyan Wang wrote:
> -	/* Translate Windows '\' into Linux '/'. */
> -	for (i = 0; i < err; i++) {
> -		if (buffer[i] == '\\')
> -			buffer[i] = '/';
> -	}

ntfs_readlink_hlp() reads PrintName, for both tags:

	case IO_REPARSE_TAG_MOUNT_POINT:
		... MountPointReparseBuffer.PrintNameOffset ...
	case IO_REPARSE_TAG_SYMLINK:
		... SymbolicLinkReparseBuffer.PrintNameOffset ...

On a volume written by Windows that PrintName is the display form, so
its separator is '\' - "C:\Users\foo".  Without this loop readlink()
hands that back verbatim and the whole string becomes one component.
The loop is after the switch, so junctions and mount points lose it too.

Keeping it, the first hunk alone already fixes the '/' case:

	symlink target   PrintName   readlink
	a/b              a/b         a/b
	a\b              a\b         a/b

The second row cannot be fixed this way.  A '\' in PrintName is either a
Windows separator or a literal character from Linux, and nothing in the
buffer tells them apart, so a round trip for the literal one needs a
different encoding, not a missing conversion.

Also, after the first hunk the is_absolute block still decorates through
rp_name while the copy is at sub_name; both point into the same buffer,
which is easy to get wrong later.
