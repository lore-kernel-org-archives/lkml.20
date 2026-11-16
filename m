Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811233;
	b=afgY2PKdM+60S0k9SlwIDcgtZuJhIFhoScJ1OU4MbajB8+BN/BHHD8txQVAbq630FNsP
	 vDFrHydO67JWUeAPgsgZtQq6MudldOXGV/aL1KZydYipqJHjxA3E5ESanO3o3TjiWFFIF
	 XIv2xQ8ui1hEVCIie31OM9mc8Qg5zZidC5xOofYR8FK555NZTYssi7Op0xKLZdEikkrNg
	 y8O8NyuPuXVNEQ4nc/vTiDejCgxMtzsrZD7mjDu5iLhr7e3FKlOFf1CZz9+VNs9Ya5E2M
	 krdAqFyN1piEUwOQyYnROrk+6yMaaG5LjdX50JMUsYPAJAGTw4Gjrax8xvrELhpzwfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811233;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8a/PKiLxaTEMPYbiH5CDurBLGvrzH4Qgf36+oo8YXkc=;
	b=vBuZidwuuWhj3KeQUzYE+Un2DM8T/FK7KWAGFEZ75N4c7R9fFp8gElcP7c/SZNFw7WFJ
	 rLOkAFL+FJSP6O5ZjD7o8bIR0iHrdBjkSoHuXNvLBxFrfynZkl+p2HGlz0emisO6TVH6G
	 7Zp5ezlmuO2MdAEqug6Y0ChL6m622qH8PKSZM1Q0s0ym2G+SuOpKx5G9tQqL8OVjy4m4O
	 XmlhTB1nbgRQpZA6uiP2Npko3y5umd/nJm6VCgWwz+fmC9PGEfC0ejDwqwcI48kV2GE8c
	 Ho8TXmOpAvzh1SDELU94izDHTcRTHzj6h9s/5sVfUZsDi7xqjkZjwVtGHlJq0ZkAc4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fwSP+rV5;
	arc=none smtp.remote-ip=162.62.57.210
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DCD606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DCD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fwSP+rV5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794811227; bh=8a/PKiLxaTEMPYbiH5CDurBLGvrzH4Qgf36+oo8YXkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fwSP+rV57UjJCaWb64mNn8sq30LdR6QJ5AHrCONIXWq1kVGwenM6iAk+hIIzRR9Hd
	 1vHTwpSrw5JBfF4pHW/hbUxc37Zl3KbYIMI6/Xr2Y5re9oSOqsGy1U0iHbRUW78E5Z
	 1hIq7MGv13aXiIC0odNHOQ/80KKXjcWZLRW2FbPw=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id A180B68E; Mon, 16 Nov 2026 14:40:24 +0800
X-QQ-mid: xmsmtpt1794811224tlxh7pbr1
Message-ID: <tencent_1684827B82B415CBAF7C7AD30E6EBCD8D406@qq.com>
X-QQ-XMAILINFO: Npv5yIQT4nxMwCEwPhhhObPEkl5jXr8PJi4i9hZ169SMULYk48h90wNra9WrTL
	 9dMfHzVFRwzXCCwDBE+HnbuasK8FOgB8jo9Q+pFrMIHZxwaIYhW2nKnCsHYw3zrdVx2N4ZoB3em4
	 caAOnehu4HDaCGnw53ENbKa6H24KiUCp5hpElBlS0+GWXkIw1BlXEo77vJ4KmPaB47oAysn9Rl8h
	 Gmduzwv/el5OpPs12qbmCLjeOu2ibWt+0/HM3gB0UBw6KrAbLfgq5RagIU+mPkr+ekYcCZMlosPU
	 Sd1yPiEOJ7tbxp4dYBPBS0n26ORn13leqJ8Vg15du3kPapEazretbhA3EZVlgrKubpmWxqwBA15j
	 NuYzpyjpsUSwjW4pPwIJEB/YXTYfAUDW4h44vZKpfbRqaX4MWhmAkuQbIzbm3SIUjA9gy2Sj/qr/
	 OvvdWK2j0J36T3yXT8x//cqmzvv6dUiR5boTsq6p30nKOwQ9wEThtgGg5dV6amylWnvoVeSz2VmR
	 JuKMet+U+YyfAuc7l995xqnOXr29ukJcbhi77aMmWMGZiNQvQZGn7fzU5il592PuQjkU9KejYPw/
	 nUf8GuuMlgtwef5gpRjGEg3MjIYTdrQhkEVkRt0ca9CwLuZxNnDFvyhBj6g3xdMHYQVzEdtvexr+
	 zn8ufPz2X7ugaGqLw7RigTL/7QgYcU9vdG3cZmxn4ANxBbkPYqRpcpO8MF7rYCmCKjMCpUSAsS+Y
	 WfI6c4yMn1f8D+FAPk0/PCa1nhXtuJcCwiknAyWfzYBoqPZyzkU47Zij6TmpzgasB5zY9mGknSn3
	 px3AA4qYRVEKwAlK+1wzw1v4aKHTDqjr3l2KvC0nByIVULG2bDsYg/VXsg6I2phXDZ6Lnxz5wQsQ
	 sCCshvG+vbS1rlLyn5OiQwxQHk3W+AU0lsc9CPFjpDC5Ua1iTNFp8HM633iollc0jzLeWQKxtxvL
	 4q2zOUwluIWzonYXev80I2945E+5RLIx7A4L1ev3sLFTBEw6eD2JkSpur6NC6aHpdq9YNHKKCKGv
	 /Rh3U/I8xO2EHG/wNtPhKUnow0pJL5uMjJESXE7Xd6iMAvfAKsI1RYWpscQRJJEU080oPi7w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Shuai Liu <847807867@qq.com>
To: thdwjdgkr123@gmail.com,
	richard@nod.at,
	dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com,
	Shuai Liu <847807867@qq.com>
Subject: Re: [PATCH] jffs2: keep alloc_sem held when a write retry cannot reserve space
Date: Mon, 16 Nov 2026 14:40:24 +0800
X-OQ-MSGID: <20261116064024.926991-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102173342.314251-1-thdwjdgkr123@gmail.com>
References: <20261102173342.314251-1-thdwjdgkr123@gmail.com>
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

I independently verified this fix with the syzbot C reproducer on top
of Linux 7.4-rc3 (master), using mtdram with 128 KiB total size /
4 KiB erase size, CONFIG_JFFS2_SUMMARY=y and CONFIG_PROVE_LOCKING=y,
closely matching the syzbot configuration. The patch applies cleanly
to this tree.

Baseline (before the patch):

  - The fail-nth scan in the reproducer triggers the lockdep warning
    at N=10:

      WARNING: bad unlock balance detected!
      repro/67 is trying to release lock (&c->alloc_sem) at:
        jffs2_do_create+0x229/0x250 fs/jffs2/write.c:474
      but there are no more locks to release!

  - The call chain matches the syzbot report: jffs2_sum_add_kvec()
    fails with -ENOMEM, jffs2_write_dnode() drops alloc_sem for the
    retry reservation which then fails with -ENOSPC, and
    jffs2_do_create() calls jffs2_complete_reservation() on a lock it
    no longer holds.

With the patch applied:

  - 2 runs x 2000 fail-nth rounds, zero lockdep reports.
  - The failure path is still reached: in one run the injected
    allocation failure landed in jffs2_sum_add_kvec() ("Write of 68
    bytes at 0x0001e00c failed. returned -12, retlen 0"), creat()
    still returns -ENOSPC as expected, and the second unlock is now
    balanced.

Tested-by: Shuai Liu <847807867@qq.com>

AI assistance disclosure: the two-state test environment (kernel
config, QEMU setup and log analysis) was prepared with the help of an
AI coding assistant, per Documentation/process/coding-assistants.rst.
The conclusions above are from actual test runs.

Best regards,
Shuai Liu

